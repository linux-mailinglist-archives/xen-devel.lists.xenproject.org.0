Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5603324B3B2
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 11:51:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8hDS-0000cJ-HF; Thu, 20 Aug 2020 09:50:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bq9Y=B6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k8hDR-0000cC-99
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 09:50:37 +0000
X-Inumbo-ID: f31058fc-dcf7-4047-9174-9db6afd2d3eb
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f31058fc-dcf7-4047-9174-9db6afd2d3eb;
 Thu, 20 Aug 2020 09:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=XG1O6kRQ+s0XZdqCURUS2cIOhsfZhuhMd4K9SyJv2zE=; b=PRYHQbc0wA8qW3xwRP/lUqH13l
 d2XZVz/fMueE0YwS7r4L6ziC3J/Ho/0qA3beoGCwiCYdgieMbRyrzUQKtIqyU+ExebOEHVKDlQOQ7
 Vdc8dlTCyGPQKYxYLq7lueUCJJ3YROAevxJ981RUOjSjmOs29XcYA/UI9Wpn+Ayk8dbY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k8hDO-0007oM-4J; Thu, 20 Aug 2020 09:50:34 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k8hDN-00058y-74; Thu, 20 Aug 2020 09:50:34 +0000
Subject: Re: [PATCH] xen/x86: irq: Avoid a TOCTOU race in
 pirq_spin_lock_irq_desc()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>
References: <bb25c46f-0670-889e-db0b-3031291db640@citrix.com>
 <5a11fa4e-1d57-ad12-ef43-08ed9c5c79dd@xen.org>
 <20200817124600.GC828@Air-de-Roger>
 <9375f5f2-7cbd-1344-ae03-51909dfd41e9@xen.org>
 <20200817140125.GD828@Air-de-Roger>
 <53eeaa9f-3a4f-525e-a07f-d36ef245925a@xen.org>
 <20200817150307.GF828@Air-de-Roger>
 <5e20ad2f-3d16-6cae-0aa3-ca028c176d99@xen.org>
 <20200817173328.GG828@Air-de-Roger>
 <8abfb42a-04b1-2919-5843-7a9004a84cd2@xen.org>
 <20200818083520.GH828@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <fb99696b-ed07-9cd0-7801-1c46663d39fc@xen.org>
Date: Thu, 20 Aug 2020 10:50:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200818083520.GH828@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Roger,

On 18/08/2020 09:35, Roger Pau Monné wrote:
> On Mon, Aug 17, 2020 at 06:56:24PM +0100, Julien Grall wrote:
>>
>>
>> On 17/08/2020 18:33, Roger Pau Monné wrote:
>>> On Mon, Aug 17, 2020 at 04:53:51PM +0100, Julien Grall wrote:
>>>>
>>>>
>>>> On 17/08/2020 16:03, Roger Pau Monné wrote:
>>>>> On Mon, Aug 17, 2020 at 03:39:52PM +0100, Julien Grall wrote:
>>>>>>
>>>>>>
>>>>>> On 17/08/2020 15:01, Roger Pau Monné wrote:
>>>>>>> On Mon, Aug 17, 2020 at 02:14:01PM +0100, Julien Grall wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 17/08/2020 13:46, Roger Pau Monné wrote:
>>>>>>>>> On Fri, Aug 14, 2020 at 08:25:28PM +0100, Julien Grall wrote:
>>>>>>>>>> Hi Andrew,
>>>>>>>>>>
>>>>>>>>>> Sorry for the late answer.
>>>>>>>>>>
>>>>>>>>>> On 23/07/2020 14:59, Andrew Cooper wrote:
>>>>>>>>>>> On 23/07/2020 14:22, Julien Grall wrote:
>>>>>>>>>>>> Hi Jan,
>>>>>>>>>>>>
>>>>>>>>>>>> On 23/07/2020 12:23, Jan Beulich wrote:
>>>>>>>>>>>>> On 22.07.2020 18:53, Julien Grall wrote:
>>>>>>>>>>>>>> --- a/xen/arch/x86/irq.c
>>>>>>>>>>>>>> +++ b/xen/arch/x86/irq.c
>>>>>>>>>>>>>> @@ -1187,7 +1187,7 @@ struct irq_desc *pirq_spin_lock_irq_desc(
>>>>>>>>>>>>>>               for ( ; ; )
>>>>>>>>>>>>>>             {
>>>>>>>>>>>>>> -        int irq = pirq->arch.irq;
>>>>>>>>>>>>>> +        int irq = read_atomic(&pirq->arch.irq);
>>>>>>>>>>>>>
>>>>>>>>>>>>> There we go - I'd be fine this way, but I'm pretty sure Andrew
>>>>>>>>>>>>> would want this to be ACCESS_ONCE(). So I guess now is the time
>>>>>>>>>>>>> to settle which one to prefer in new code (or which criteria
>>>>>>>>>>>>> there are to prefer one over the other).
>>>>>>>>>>>>
>>>>>>>>>>>> I would prefer if we have a single way to force the compiler to do a
>>>>>>>>>>>> single access (read/write).
>>>>>>>>>>>
>>>>>>>>>>> Unlikely to happen, I'd expect.
>>>>>>>>>>>
>>>>>>>>>>> But I would really like to get rid of (or at least rename)
>>>>>>>>>>> read_atomic()/write_atomic() specifically because they've got nothing to
>>>>>>>>>>> do with atomic_t's and the set of functionality who's namespace they share.
>>>>>>>>>>
>>>>>>>>>> Would you be happy if I rename both to READ_ONCE() and WRITE_ONCE()? I would
>>>>>>>>>> also suggest to move them implementation in a new header asm/lib.h.
>>>>>>>>>
>>>>>>>>> Maybe {READ/WRITE}_SINGLE (to note those should be implemented using a
>>>>>>>>> single instruction)?
>>>>>>>>
>>>>>>>> The asm volatile statement contains only one instruction, but this doesn't
>>>>>>>> mean the helper will generate a single instruction.
>>>>>>>
>>>>>>> Well, the access should be done using a single instruction, which is
>>>>>>> what we care about when using this helpers.
>>>>>>>
>>>>>>>> You may have other instructions to get the registers ready for the access.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> ACCESS_ONCE (which also has the _ONCE suffix) IIRC could be
>>>>>>>>> implemented using several instructions, and hence doesn't seem right
>>>>>>>>> that they all have the _ONCE suffix.
>>>>>>>>
>>>>>>>> The goal here is the same, we want to access the variable *only* once.
>>>>>>>
>>>>>>> Right, but this is not guaranteed by the current implementation of
>>>>>>> ACCESS_ONCE AFAICT, as the compiler *might* split the access into two
>>>>>>> (or more) instructions, and hence won't be an atomic access anymore?
>>>>>>    From my understanding, at least on GCC/Clang, ACCESS_ONCE() should be atomic
>>>>>> if you are using aligned address and the size smaller than a register size.
>>>>>
>>>>> Yes, any sane compiler shouldn't split such access, but this is not
>>>>> guaranteed by the current code in ACCESS_ONCE.
>>>> To be sure, your concern here is not about GCC/Clang but other compilers. Am
>>>> I correct?
>>>
>>> Or about the existing ones switching behavior, which is again quite
>>> unlikely I would like to assume.
>>
>> The main goal of the macro is to mark place which require the variable to be
>> accessed once. So, in the unlikely event this may happen, it would be easy
>> to modify the implementation.
>>
>>>
>>>> We already have a collection of compiler specific macros in compiler.h. So
>>>> how about we classify this macro as a compiler specific one? (See more
>>>> below).
>>>>
>>>>>
>>>>>>>
>>>>>>>> May I ask why we would want to expose the difference to the user?
>>>>>>>
>>>>>>> I'm not saying we should, but naming them using the _ONCE suffix seems
>>>>>>> misleading IMO, as they have different guarantees than what
>>>>>>> ACCESS_ONCE currently provides.
>>>>>>
>>>>>> Lets leave aside how ACCESS_ONCE() is implemented for a moment.
>>>>>>
>>>>>> If ACCESS_ONCE() doesn't guarantee atomicy, then it means you may read a mix
>>>>>> of the old and new value. This would most likely break quite a few of the
>>>>>> users because the result wouldn't be coherent.
>>>>>>
>>>>>> Do you have place in mind where the non-atomicity would be useful?
>>>>>
>>>>> Not that I'm aware, I think they could all be safely switched to use
>>>>> the atomic variants
>>>> There is concern that read_atomic(), write_atomic() prevent the compiler to
>>>> do certain optimization. Andrew gave the example of:
>>>>
>>>> ACCESS_ONCE(...) |= ...
>>>
>>> I'm not sure how will that behave when used with a compile known
>>> value that's smaller than the size of the destination. Could the
>>> compiler optimize this as a partial read/write if only the lower byte
>>> is modified for example?
>>
>> Here what Andrew wrote in a previous answer:
>>
>> "Which a sufficiently clever compiler could convert to a single `or $val,
>> ptr` instruction on x86, while read_atomic()/write_atomic() would force it
>> to be `mov ptr, %reg; or $val, %reg; mov %reg, ptr`."
>>
>> On Arm, a RwM operation will still not be atomic as it would require 3
>> instructions.
> 
> I don't think we should rely on this behavior of ACCESS_ONCE (OR being
> translated into a single instruction), as it seems to even be more
> fragile than relying on ACCESS_ONCE performing reads and writes
> accesses as single instructions.

Agree.

> 
> Once question I through about given the example is how are we going to
> name an atomic OR operation if we ever require one? OR_ONCE?

Good question.

I looked again a staging and couldn't find any ACCESS_ONCE(...) |=. So I 
would suggest to do nothing until there is such instance.

> 
>>>
>>>>
>>>>>
>>>>> In fact I wouldn't be surprised if users of ACCESS_ONCE break if the
>>>>> access was split into multiple instructions.
>>>>>
>>>>> My comment was to notice that just renaming the atomic read/write
>>>>> helpers to use the _ONCE prefix is IMO weird as they offer different
>>>>> properties than ACCESS_ONCE, and hence might confuse users.Just
>>>>> looking at READ_ONCE users could assume all _ONCE helpers would
>>>>> guarantee atomicity, which is not the case.
>>>>
>>>> Our implementation of ACCESS_ONCE() is very similar to what Linux used to
>>>> have. There READ_ONCE()/WRITE_ONCE() are also using the same principles.
>>>>
>>>>   From my understanding, you can safely assume the access will be atomic if
>>>> the following conditions are met:
>>>> 	- The address is correctly size
>>>> 	- The size is smaller than the word machine size
>>>
>>> I guess we could go that route, and properly document what each helper
>>> is supposed to do, and that {READ/WRITE}_ONCE guarantee atomicity
>>> while ACCESS_ONCE requires special condition for us to guarantee the
>>> operation will be atomic.
>>>
>>>> I would agree this may not be correct on all the existing compilers. But
>>>> this macro could easily be re-implemented if we add support for a compiler
>>>> with different guarantee.
>>>>
>>>> Therefore, I fail to see why we can't use the same guarantee in Xen.
>>>
>>> I'm fine if what's expected from each helper is documented, it just
>>> seems IMO more confusing that using more differentiated naming for the
>>> helpers, because the fact that ACCESS_ONCE is atomic is a compiler
>>> defined behavior, but not something that could be guaranteed from the
>>> code itself.
>>
>> I am happy to try to document the behavior of each helpers. Are you happy if
>> I attempt to do the renaming in a follow-up patch?
> 
> Sure, TBH this has diverged so much that should have had it's own
> thread.

I will start a more generic thread to see if we can adopt Linux memory 
barriers document. This would make our life easier when discussing 
memory issues in Xen (I expect a lot more to come).

> 
> The patch itself looks fine to me, regardless of whether READ_ONCE or
> read_atomic is used.

Thanks!

Cheers,

-- 
Julien Grall

