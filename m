Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3191D1250
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 14:08:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYqAy-0005uR-Fq; Wed, 13 May 2020 12:07:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dqM3=63=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYqAx-0005uM-4S
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 12:07:51 +0000
X-Inumbo-ID: 5d5c6700-9512-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d5c6700-9512-11ea-b07b-bc764e2007e4;
 Wed, 13 May 2020 12:07:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B3C55AF41;
 Wed, 13 May 2020 12:07:51 +0000 (UTC)
Subject: Re: [PATCH v8 07/12] x86emul: support FNSTENV and FNSAVE
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <9a2afbb1-af92-2c7d-9fde-d8d8e4563a2a@suse.com>
 <0e222090-c989-45b5-65be-efb09e7b9bb9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4df19637-1a39-491d-83cf-a599c764ab1d@suse.com>
Date: Wed, 13 May 2020 14:07:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <0e222090-c989-45b5-65be-efb09e7b9bb9@citrix.com>
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

On 08.05.2020 19:58, Andrew Cooper wrote:
> On 05/05/2020 09:15, Jan Beulich wrote:
>> To avoid introducing another boolean into emulator state, the
>> rex_prefix field gets (ab)used to convey the real/VM86 vs protected mode
>> info (affecting structure layout, albeit not size) to x86_emul_blk().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> TBD: The full 16-bit padding fields in the 32-bit structures get filled
>>      with all ones by modern CPUs (i.e. other than the comment says for
> 
> You really mean "unlike" here, rather than "other".  They do not have
> the same meaning in this context.
> 
> (I think you're also missing a "what", which I'm guessing is just an
> oversight.)

Well, it's really s/other than/unlike what/ then afaics.

>>      FIP and FDP). We may want to mirror this as well (for the real mode
>>      variant), even if those fields' contents are unspecified.
> 
> This is surprising behaviour, but I expect it dates back to external x87
> processors and default MMIO behaviour.
> 
> If it is entirely consistent, it match be nice to match.  OTOH, the
> manuals are very clear that it is reserved, which I think gives us the
> liberty to use the easier implementation.

I've checked in on an AMD system meanwhile, and it's the same
there. The mentioned comment really refers to observations back
on a 386/387 pair. I think really old CPUs didn't write the
full 16-bit padding fields at all, and the 386/387 then started
writing full 32 bits of FIP and FDP alongside their "high 16
bits" secondary fields. I further assume that this "don't
write parts of the struct at all" behavior was considered
unsafe, or unhelpful when trying to write things out in bigger
chunks (ideally in full cachelines).

I'll leave this as is for now; we can still consider to store
all ones there later on.

>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -897,6 +900,50 @@ struct x86_emulate_state {
>>  #define PTR_POISON NULL /* 32-bit builds are for user-space, so NULL is OK. */
>>  #endif
>>  
>> +#ifndef X86EMUL_NO_FPU
>> +struct x87_env16 {
>> +    uint16_t fcw;
>> +    uint16_t fsw;
>> +    uint16_t ftw;
>> +    union {
>> +        struct {
>> +            uint16_t fip_lo;
>> +            uint16_t fop:11, :1, fip_hi:4;
>> +            uint16_t fdp_lo;
>> +            uint16_t :12, fdp_hi:4;
>> +        } real;
>> +        struct {
>> +            uint16_t fip;
>> +            uint16_t fcs;
>> +            uint16_t fdp;
>> +            uint16_t fds;
>> +        } prot;
>> +    } mode;
>> +};
>> +
>> +struct x87_env32 {
>> +    uint32_t fcw:16, :16;
>> +    uint32_t fsw:16, :16;
>> +    uint32_t ftw:16, :16;
> 
> uint16_t fcw, :16;
> uint16_t fsw, :16;
> uint16_t ftw, :16;
> 
> which reduces the number of 16 bit bitfields.

I'm unconvinced of this being helpful in any way. My goal here
was really to consistently use all uint16_t in the 16-bit
struct, and all uint32_t in the 32-bit one, not the least
after ...

>> +    union {
>> +        struct {
>> +            /* some CPUs/FPUs also store the full FIP here */
>> +            uint32_t fip_lo:16, :16;
>> +            uint32_t fop:11, :1, fip_hi:16, :4;
>> +            /* some CPUs/FPUs also store the full FDP here */
>> +            uint32_t fdp_lo:16, :16;
>> +            uint32_t :12, fdp_hi:16, :4;
> 
> Annoyingly, two of these lines can't use uint16_t.  I'm torn as to
> whether to suggest converting the other two which can.

... observing this. (Really I had it the other way around
initially. I'd be okay to switch back if there was a half
way compelling argument - reducing the number of 16-bit
bitfields doesn't sound like one to me, though, unless
there are implications from this that I don't see.)

>> @@ -11571,6 +11646,93 @@ int x86_emul_blk(
>>              *eflags |= X86_EFLAGS_ZF;
>>          break;
>>  
>> +#ifndef X86EMUL_NO_FPU
>> +
>> +    case blk_fst:
>> +        ASSERT(!data);
>> +
>> +        if ( bytes > sizeof(fpstate.env) )
>> +            asm ( "fnsave %0" : "=m" (fpstate) );
>> +        else
>> +            asm ( "fnstenv %0" : "=m" (fpstate.env) );
> 
> We have 4 possible sizes to deal with here - the 16 and 32bit formats of
> prot vs real/vm86 modes, and it is not clear (code wise) why
> sizeof(fpstate.env) is a suitable boundary.

See the definitons of struct x87_env16 and struct x87_env32:
They're intentionally in part using a union, to make more
obvious that in fact there's just two different sizes to deal
with.

> Given that these are legacy instructions and not a hotpath in the
> slightest, it is possibly faster (by removing the branch) and definitely
> more obvious to use fnsave unconditionally, and derive all of the
> smaller layouts that way.

I can accept the "not a hotpath" argument, but I'm against
using insns other than the intended one for no good reason.

> Critically however, it prevents us from needing a CVE/XSA if ... [bottom
> comment]

This is a legitimate concern, but imo not to be addressed by
using FNSAVE uniformly: There being fields which have
undefined contents even with FNSTENV (and which hence in
principle could not get written at all), I'm instead going
to memset() the entire structure upfront. I'll use 0 for
now, but using ~0 might be an option to fill the padding
fields (see above); the downside then would be that we'd
also fill the less-than-16-bit padding fields this way,
where hardware stores 0 (and where we are at risk of breaking
consumers which don't mask as necessary).

Jan

