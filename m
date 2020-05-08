Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BD71CA53B
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 09:32:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWxUW-0001F4-1B; Fri, 08 May 2020 07:32:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWxUU-0001Ez-D1
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 07:32:14 +0000
X-Inumbo-ID: 071e06cf-90fe-11ea-9fcd-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 071e06cf-90fe-11ea-9fcd-12813bfff9fa;
 Fri, 08 May 2020 07:32:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D2996AB5C;
 Fri,  8 May 2020 07:32:13 +0000 (UTC)
Subject: Re: [PATCH v8 03/12] x86emul: support ENQCMD insns
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <099d03d0-2846-2a3d-93ec-2d10dab12655@suse.com>
 <4fdaeefb-9593-789d-9f73-510e89d6df43@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c9b92b1-9caf-741b-eaaa-18c652e6b504@suse.com>
Date: Fri, 8 May 2020 09:32:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <4fdaeefb-9593-789d-9f73-510e89d6df43@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.05.2020 20:59, Andrew Cooper wrote:
> On 05/05/2020 09:13, Jan Beulich wrote:
>> Note that the ISA extensions document revision 038 doesn't specify
>> exception behavior for ModRM.mod == 0b11; assuming #UD here.
> 
> Stale.

In which way (beyond the question of whether to use
goto unrecognized_insn in the code instead)? The doc doesn't
mention ModRM.mod specifics in any way.

>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -11480,11 +11513,36 @@ int x86_emul_blk(
>>  {
>>      switch ( state->blk )
>>      {
>> +        bool zf;
>> +
>>          /*
>>           * Throughout this switch(), memory clobbers are used to compensate
>>           * that other operands may not properly express the (full) memory
>>           * ranges covered.
>>           */
>> +    case blk_enqcmd:
>> +        ASSERT(bytes == 64);
>> +        if ( ((unsigned long)ptr & 0x3f) )
>> +        {
>> +            ASSERT_UNREACHABLE();
>> +            return X86EMUL_UNHANDLEABLE;
>> +        }
>> +        *eflags &= ~EFLAGS_MASK;
>> +#ifdef HAVE_AS_ENQCMD
>> +        asm ( "enqcmds (%[src]), %[dst]" ASM_FLAG_OUT(, "; setz %0")
> 
> %[zf]

Oops, indeed.

>> +              : [zf] ASM_FLAG_OUT("=@ccz", "=qm") (zf)
>> +              : [src] "r" (data), [dst] "r" (ptr) : "memory" );
> 
> Can't src get away with being "m" (*data)?  There is no need to force it
> into a single register, even if it is overwhelmingly likely to end up
> with %rsi scheduled here.

Well, *data can't be used, as data is of void* type. It would
need to have a suitable cast on it, but since that's not
going to avoid the memory clobber I didn't think it was worth
it (also together with the comment ahead of the switch()).

>> --- a/xen/include/asm-x86/msr-index.h
>> +++ b/xen/include/asm-x86/msr-index.h
>> @@ -420,6 +420,10 @@
>>  #define MSR_IA32_TSC_DEADLINE		0x000006E0
>>  #define MSR_IA32_ENERGY_PERF_BIAS	0x000001b0
>>  
>> +#define MSR_IA32_PASID			0x00000d93
>> +#define  PASID_PASID_MASK		0x000fffff
>> +#define  PASID_VALID			0x80000000
>> +
> 
> Above the legacy line please as this is using the newer style,

Ah, yes, I should have remembered to re-base this over your
change there.

> and drop
> _IA32.  Intel's ideal of architectural-ness isn't interesting or worth
> the added code volume.

We'd been there before, and you know I disagree. I think it
is wrong for me to make the change, but I will do so just
to retain your ack.

> PASSID_PASSID_MASK isn't great, but I can't suggest anything better, and
> MSR_PASSID_MAS doesn't work either.
> 
> Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

