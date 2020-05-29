Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3A91E7EBB
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 15:30:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jef5B-0000Qm-AM; Fri, 29 May 2020 13:29:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jef59-0000Qh-Iv
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 13:29:55 +0000
X-Inumbo-ID: 7b52d686-a1b0-11ea-a8b6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b52d686-a1b0-11ea-a8b6-12813bfff9fa;
 Fri, 29 May 2020 13:29:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B62E2AD6B;
 Fri, 29 May 2020 13:29:53 +0000 (UTC)
Subject: Re: [PATCH v10 1/9] x86emul: address x86_insn_is_mem_{access, write}()
 omissions
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
 <f41a4f27-bbe2-6450-38c1-6c4e23f2b07b@suse.com>
 <8e976b4b-60f2-bf94-843d-0fe0ba57087c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5e46ec9b-2ae0-3d28-01c8-794356532456@suse.com>
Date: Fri, 29 May 2020 15:29:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8e976b4b-60f2-bf94-843d-0fe0ba57087c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 29.05.2020 14:18, Andrew Cooper wrote:
> On 25/05/2020 15:26, Jan Beulich wrote:
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -11474,25 +11474,87 @@ x86_insn_operand_ea(const struct x86_emu
>>      return state->ea.mem.off;
>>  }
>>  
>> +/*
>> + * This function means to return 'true' for all supported insns with explicit
>> + * accesses to memory.  This means also insns which don't have an explicit
>> + * memory operand (like POP), but it does not mean e.g. segment selector
>> + * loads, where the descriptor table access is considered an implicit one.
>> + */
>>  bool
>>  x86_insn_is_mem_access(const struct x86_emulate_state *state,
>>                         const struct x86_emulate_ctxt *ctxt)
>>  {
>> +    if ( mode_64bit() && state->not_64bit )
>> +        return false;
> 
> Is this path actually used?

Yes, it is. It's only x86_emulate() which has

    generate_exception_if(state->not_64bit && mode_64bit(), EXC_UD);

right now.

> state->not_64bit ought to fail instruction
> decode, at which point we wouldn't have a valid state to be used here.

x86_decode() currently doesn't have much raising of #UD at all, I
think. If it wasn't like this, the not_64bit field wouldn't be
needed - it's used only to communicate from decode to execute.
We're not entirely consistent with this though, seeing in
x86_decode_onebyte(), a few lines below the block of case labels
setting that field,

    case 0x9a: /* call (far, absolute) */
    case 0xea: /* jmp (far, absolute) */
        generate_exception_if(mode_64bit(), EXC_UD);

We could certainly drop the field and raise #UD during decode
already, but don't you think we then should do so for all
encodings that ultimately lead to #UD, e.g. also for AVX insns
without AVX available to the guest? This would make
x86_decode() quite a bit larger, as it would then also need to
have a giant switch() (or something else that's suitable to
cover all cases).

> Everything else looks ok, so Acked-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Thanks.

Jan

