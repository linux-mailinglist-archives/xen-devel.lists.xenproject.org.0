Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5F8373E40
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 17:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123176.232359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leJER-0008Qo-Iz; Wed, 05 May 2021 15:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123176.232359; Wed, 05 May 2021 15:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leJER-0008Nw-F5; Wed, 05 May 2021 15:14:35 +0000
Received: by outflank-mailman (input) for mailman id 123176;
 Wed, 05 May 2021 15:14:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leJEQ-0008Nq-3g
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 15:14:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10a82fc6-a399-4bc1-a02e-b8c439005b35;
 Wed, 05 May 2021 15:14:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C639AF2F;
 Wed,  5 May 2021 15:14:32 +0000 (UTC)
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
X-Inumbo-ID: 10a82fc6-a399-4bc1-a02e-b8c439005b35
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620227672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XjWSEWRU6/nWzzgsdY8cavazHB5HOUBR89Ly9J9tORI=;
	b=ljVaXIsKu7K59qRvLyJuGqGtAzeBTl2mUCoJmHEeGbPrPNSVobsTbgu6DgMXna+LVd6LMH
	G93yO4mAjdzFlPuSKOpl17npgw1uPdLUBb5GTWF+uLVnv3n3X+H1suaurPv3IJmpzYv5hv
	F/9y/wPCbdbzV973g1PbtbGAMPyiQSw=
Subject: Re: [PATCH 4/5] x86/cpuid: Simplify recalculate_xstate()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
 <20210503153938.14109-5-andrew.cooper3@citrix.com>
 <17501fdd-b9f0-3493-7d0d-8c5333fafa45@suse.com>
 <3f9ae28f-2fb7-0f4f-511b-93ba74ec3aeb@citrix.com>
 <ced9f20a-d420-6639-b041-710f7ec59613@suse.com>
 <d918c2b6-7c31-6868-eb50-6a3db54fa4eb@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4fc9bfc9-bf68-b7fc-a898-2c795ced28b4@suse.com>
Date: Wed, 5 May 2021 17:14:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <d918c2b6-7c31-6868-eb50-6a3db54fa4eb@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.05.2021 16:53, Andrew Cooper wrote:
> On 05/05/2021 09:19, Jan Beulich wrote:
>> On 04.05.2021 15:58, Andrew Cooper wrote:
>>> On 04/05/2021 13:43, Jan Beulich wrote:
>>>> I'm also not happy at all to see you use a literal 3 here. We have
>>>> a struct for this, after all.
>>>>
>>>>>          p->xstate.xss_low   =  xstates & XSTATE_XSAVES_ONLY;
>>>>>          p->xstate.xss_high  = (xstates & XSTATE_XSAVES_ONLY) >> 32;
>>>>>      }
>>>>> -    else
>>>>> -        xstates &= ~XSTATE_XSAVES_ONLY;
>>>>>  
>>>>> -    for ( i = 2; i < min(63ul, ARRAY_SIZE(p->xstate.comp)); ++i )
>>>>> +    /* Subleafs 2+ */
>>>>> +    xstates &= ~XSTATE_FP_SSE;
>>>>> +    BUILD_BUG_ON(ARRAY_SIZE(p->xstate.comp) < 63);
>>>>> +    for_each_set_bit ( i, &xstates, 63 )
>>>>>      {
>>>>> -        uint64_t curr_xstate = 1ul << i;
>>>>> -
>>>>> -        if ( !(xstates & curr_xstate) )
>>>>> -            continue;
>>>>> -
>>>>> -        p->xstate.comp[i].size   = xstate_sizes[i];
>>>>> -        p->xstate.comp[i].offset = xstate_offsets[i];
>>>>> -        p->xstate.comp[i].xss    = curr_xstate & XSTATE_XSAVES_ONLY;
>>>>> -        p->xstate.comp[i].align  = curr_xstate & xstate_align;
>>>>> +        /*
>>>>> +         * Pass through size (eax) and offset (ebx) directly.  Visbility of
>>>>> +         * attributes in ecx limited by visible features in Da1.
>>>>> +         */
>>>>> +        p->xstate.raw[i].a = raw_cpuid_policy.xstate.raw[i].a;
>>>>> +        p->xstate.raw[i].b = raw_cpuid_policy.xstate.raw[i].b;
>>>>> +        p->xstate.raw[i].c = raw_cpuid_policy.xstate.raw[i].c & ecx_bits;
>>>> To me, going to raw[].{a,b,c,d} looks like a backwards move, to be
>>>> honest. Both this and the literal 3 above make it harder to locate
>>>> all the places that need changing if a new bit (like xfd) is to be
>>>> added. It would be better if grep-ing for an existing field name
>>>> (say "xss") would easily turn up all involved places.
>>> It's specifically to reduce the number of areas needing editing when a
>>> new state, and therefore the number of opportunities to screw things up.
>>>
>>> As said in the commit message, I'm not even convinced that the ecx_bits
>>> mask is necessary, as new attributes only come in with new behaviours of
>>> new state components.
>>>
>>> If we choose to skip the ecx masking, then this loop body becomes even
>>> more simple.  Just p->xstate.raw[i] = raw_cpuid_policy.xstate.raw[i].
>>>
>>> Even if Intel do break with tradition, and retrofit new attributes into
>>> existing subleafs, leaking them to guests won't cause anything to
>>> explode (the bits are still reserved after all), and we can fix anything
>>> necessary at that point.
>> I don't think this would necessarily go without breakage. What if,
>> assuming XFD support is in, an existing component got XFD sensitivity
>> added to it?
> 
> I think that is exceedingly unlikely to happen.
> 
>>  If, like you were suggesting elsewhere, and like I had
>> it initially, we used a build-time constant for XFD-affected
>> components, we'd break consuming guests. The per-component XFD bit
>> (just to again take as example) also isn't strictly speaking tied to
>> the general XFD feature flag (but to me it makes sense for us to
>> enforce respective consistency). Plus, in general, the moment a flag
>> is no longer reserved in the spec, it is not reserved anywhere
>> anymore: An aware (newer) guest running on unaware (older) Xen ought
>> to still function correctly.
> 
> They're still technically reserved, because of the masking of the XFD
> bit in the feature leaf.
> 
> However, pondered this for some time, we do need to retain the
> attributes masking, because e.g. AMX && !XSAVEC is a legal (if very
> unwise) combination to expose, and the align64 bits want to disappear
> from the TILE state attributes.
> 
> Also, in terms of implementation, the easiest way to do something
> plausible here is a dependency chain of XSAVE => XSAVEC (implies align64
> masking) => XSAVES (implies xss masking) => CET_*.
> 
> XFD would depend on XSAVE, and would imply masking the xfd attribute.

Okay, let's go with this then.

Jan

