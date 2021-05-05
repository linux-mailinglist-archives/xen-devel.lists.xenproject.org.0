Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D15E373628
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 10:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122902.231862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCkU-0008Dz-JO; Wed, 05 May 2021 08:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122902.231862; Wed, 05 May 2021 08:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCkU-0008Bh-Fs; Wed, 05 May 2021 08:19:14 +0000
Received: by outflank-mailman (input) for mailman id 122902;
 Wed, 05 May 2021 08:19:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leCkT-0008Bb-3p
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 08:19:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc45eb16-6f87-478f-b28c-7768e7abaef9;
 Wed, 05 May 2021 08:19:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E936AAFA9;
 Wed,  5 May 2021 08:19:10 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: dc45eb16-6f87-478f-b28c-7768e7abaef9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620202751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3NhpGCqElrIZ5OQSV0L+ErMtcN//fys/3ntaxI6Rq+8=;
	b=X0z5zNNL2+o8AVuhWu+2gykT0yuGlXwsKzhKcK4RSYfIYZ6BIcgomP0DaB/xUBzS4x6ly5
	kbAYYb75A7HsSAKKV52b8P/fjCSzkWSeKh9mLliBpkpjxZ7pFZRQuUQk2upmknWBVCpGvj
	NOSUvSZtGzotJNmASoZx7PdtzuVB1iw=
Subject: Re: [PATCH 4/5] x86/cpuid: Simplify recalculate_xstate()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
 <20210503153938.14109-5-andrew.cooper3@citrix.com>
 <17501fdd-b9f0-3493-7d0d-8c5333fafa45@suse.com>
 <3f9ae28f-2fb7-0f4f-511b-93ba74ec3aeb@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ced9f20a-d420-6639-b041-710f7ec59613@suse.com>
Date: Wed, 5 May 2021 10:19:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3f9ae28f-2fb7-0f4f-511b-93ba74ec3aeb@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.05.2021 15:58, Andrew Cooper wrote:
> On 04/05/2021 13:43, Jan Beulich wrote:
>> On 03.05.2021 17:39, Andrew Cooper wrote:
>>> Make use of the new xstate_uncompressed_size() helper rather than maintaining
>>> the running calculation while accumulating feature components.
>>>
>>> The rest of the CPUID data can come direct from the raw cpuid policy.  All
>>> per-component data forms an ABI through the behaviour of the X{SAVE,RSTOR}*
>>> instructions, and are constant.
>>>
>>> Use for_each_set_bit() rather than opencoding a slightly awkward version of
>>> it.  Mask the attributes in ecx down based on the visible features.  This
>>> isn't actually necessary for any components or attributes defined at the time
>>> of writing (up to AMX), but is added out of an abundance of caution.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>>
>>> Using min() in for_each_set_bit() leads to awful code generation, as it
>>> prohibits the optimiations for spotting that the bitmap is <= BITS_PER_LONG.
>>> As p->xstate is long enough already, use a BUILD_BUG_ON() instead.
>>> ---
>>>  xen/arch/x86/cpuid.c | 52 +++++++++++++++++-----------------------------------
>>>  1 file changed, 17 insertions(+), 35 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
>>> index 752bf244ea..c7f8388e5d 100644
>>> --- a/xen/arch/x86/cpuid.c
>>> +++ b/xen/arch/x86/cpuid.c
>>> @@ -154,8 +154,7 @@ static void sanitise_featureset(uint32_t *fs)
>>>  static void recalculate_xstate(struct cpuid_policy *p)
>>>  {
>>>      uint64_t xstates = XSTATE_FP_SSE;
>>> -    uint32_t xstate_size = XSTATE_AREA_MIN_SIZE;
>>> -    unsigned int i, Da1 = p->xstate.Da1;
>>> +    unsigned int i, ecx_bits = 0, Da1 = p->xstate.Da1;
>>>  
>>>      /*
>>>       * The Da1 leaf is the only piece of information preserved in the common
>>> @@ -167,61 +166,44 @@ static void recalculate_xstate(struct cpuid_policy *p)
>>>          return;
>>>  
>>>      if ( p->basic.avx )
>>> -    {
>>>          xstates |= X86_XCR0_YMM;
>>> -        xstate_size = max(xstate_size,
>>> -                          xstate_offsets[X86_XCR0_YMM_POS] +
>>> -                          xstate_sizes[X86_XCR0_YMM_POS]);
>>> -    }
>>>  
>>>      if ( p->feat.mpx )
>>> -    {
>>>          xstates |= X86_XCR0_BNDREGS | X86_XCR0_BNDCSR;
>>> -        xstate_size = max(xstate_size,
>>> -                          xstate_offsets[X86_XCR0_BNDCSR_POS] +
>>> -                          xstate_sizes[X86_XCR0_BNDCSR_POS]);
>>> -    }
>>>  
>>>      if ( p->feat.avx512f )
>>> -    {
>>>          xstates |= X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM;
>>> -        xstate_size = max(xstate_size,
>>> -                          xstate_offsets[X86_XCR0_HI_ZMM_POS] +
>>> -                          xstate_sizes[X86_XCR0_HI_ZMM_POS]);
>>> -    }
>>>  
>>>      if ( p->feat.pku )
>>> -    {
>>>          xstates |= X86_XCR0_PKRU;
>>> -        xstate_size = max(xstate_size,
>>> -                          xstate_offsets[X86_XCR0_PKRU_POS] +
>>> -                          xstate_sizes[X86_XCR0_PKRU_POS]);
>>> -    }
>>>  
>>> -    p->xstate.max_size  =  xstate_size;
>>> +    /* Subleaf 0 */
>>> +    p->xstate.max_size =
>>> +        xstate_uncompressed_size(xstates & ~XSTATE_XSAVES_ONLY);
>>>      p->xstate.xcr0_low  =  xstates & ~XSTATE_XSAVES_ONLY;
>>>      p->xstate.xcr0_high = (xstates & ~XSTATE_XSAVES_ONLY) >> 32;
>>>  
>>> +    /* Subleaf 1 */
>>>      p->xstate.Da1 = Da1;
>>>      if ( p->xstate.xsaves )
>>>      {
>>> +        ecx_bits |= 3; /* Align64, XSS */
>> Align64 is also needed for p->xstate.xsavec afaict. I'm not really
>> convinced to tie one to the other either. I would rather think this
>> is a per-state-component attribute independent of other features.
>> Those state components could in turn have a dependency (like XSS
>> ones on XSAVES).
> 
> There is no such thing as a system with xsavec != xsaves (although there
> does appear to be one line of AMD CPU with xsaves and not xgetbv1).

If we believed there was such a dependency, gen-cpuid.py should imo
already express it. The latest when we make ourselves depend on such
(which I remain not fully convinced of), such a dependency would
need adding, such that it becomes impossible to turn off xsaves
without also turning off xsavec. (Of course, a way to express this
symbolically doesn't currently exist, and is only being added as a
"side effect" of "x86: XFD enabling".)

> Through some (likely unintentional) coupling of data in CPUID, the
> compressed dynamic size (CPUID.0xd[1].ebx) is required for xsavec, and
> is strictly defined as XCR0|XSS, which forces xsaves into the mix.
> 
> In fact, an error with the spec is that userspace can calculate the
> kernel's choice of MSR_XSS using CPUID data alone - there is not
> currently an ambiguous combination of sizes of supervisor state
> components.  This fact also makes XSAVEC suboptimal even for userspace
> to use, because it is forced to allocate larger-than-necessary buffers.

But space-wise it's still better that way than using the uncompressed
format.

> In principle, we could ignore the coupling and support xsavec without
> xsaves, but given that XSAVES is strictly more useful than XSAVEC, I'm
> not sure it is worth trying to support.

I think we should, but I'm not going to object to the alternative as
long as dependencies are properly (put) in place.

>> I'm also not happy at all to see you use a literal 3 here. We have
>> a struct for this, after all.
>>
>>>          p->xstate.xss_low   =  xstates & XSTATE_XSAVES_ONLY;
>>>          p->xstate.xss_high  = (xstates & XSTATE_XSAVES_ONLY) >> 32;
>>>      }
>>> -    else
>>> -        xstates &= ~XSTATE_XSAVES_ONLY;
>>>  
>>> -    for ( i = 2; i < min(63ul, ARRAY_SIZE(p->xstate.comp)); ++i )
>>> +    /* Subleafs 2+ */
>>> +    xstates &= ~XSTATE_FP_SSE;
>>> +    BUILD_BUG_ON(ARRAY_SIZE(p->xstate.comp) < 63);
>>> +    for_each_set_bit ( i, &xstates, 63 )
>>>      {
>>> -        uint64_t curr_xstate = 1ul << i;
>>> -
>>> -        if ( !(xstates & curr_xstate) )
>>> -            continue;
>>> -
>>> -        p->xstate.comp[i].size   = xstate_sizes[i];
>>> -        p->xstate.comp[i].offset = xstate_offsets[i];
>>> -        p->xstate.comp[i].xss    = curr_xstate & XSTATE_XSAVES_ONLY;
>>> -        p->xstate.comp[i].align  = curr_xstate & xstate_align;
>>> +        /*
>>> +         * Pass through size (eax) and offset (ebx) directly.  Visbility of
>>> +         * attributes in ecx limited by visible features in Da1.
>>> +         */
>>> +        p->xstate.raw[i].a = raw_cpuid_policy.xstate.raw[i].a;
>>> +        p->xstate.raw[i].b = raw_cpuid_policy.xstate.raw[i].b;
>>> +        p->xstate.raw[i].c = raw_cpuid_policy.xstate.raw[i].c & ecx_bits;
>> To me, going to raw[].{a,b,c,d} looks like a backwards move, to be
>> honest. Both this and the literal 3 above make it harder to locate
>> all the places that need changing if a new bit (like xfd) is to be
>> added. It would be better if grep-ing for an existing field name
>> (say "xss") would easily turn up all involved places.
> 
> It's specifically to reduce the number of areas needing editing when a
> new state, and therefore the number of opportunities to screw things up.
> 
> As said in the commit message, I'm not even convinced that the ecx_bits
> mask is necessary, as new attributes only come in with new behaviours of
> new state components.
> 
> If we choose to skip the ecx masking, then this loop body becomes even
> more simple.  Just p->xstate.raw[i] = raw_cpuid_policy.xstate.raw[i].
> 
> Even if Intel do break with tradition, and retrofit new attributes into
> existing subleafs, leaking them to guests won't cause anything to
> explode (the bits are still reserved after all), and we can fix anything
> necessary at that point.

I don't think this would necessarily go without breakage. What if,
assuming XFD support is in, an existing component got XFD sensitivity
added to it? If, like you were suggesting elsewhere, and like I had
it initially, we used a build-time constant for XFD-affected
components, we'd break consuming guests. The per-component XFD bit
(just to again take as example) also isn't strictly speaking tied to
the general XFD feature flag (but to me it makes sense for us to
enforce respective consistency). Plus, in general, the moment a flag
is no longer reserved in the spec, it is not reserved anywhere
anymore: An aware (newer) guest running on unaware (older) Xen ought
to still function correctly.

Jan

