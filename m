Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3BA246889
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 16:40:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7gIo-0007fP-Am; Mon, 17 Aug 2020 14:39:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GDTU=B3=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k7gIm-0007fK-Fx
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 14:39:56 +0000
X-Inumbo-ID: bdaed4a1-5394-4c66-a0e1-aacfd9540468
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bdaed4a1-5394-4c66-a0e1-aacfd9540468;
 Mon, 17 Aug 2020 14:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=wriyhnKXNEG6zVc2REy21AXoeSpQQ46OugJPkosi6Vs=; b=rVKlMAxLdzUEi/ToD9zeYik0dL
 zjkMv743zQ4sN9HADpbEAWyOAzG60ZpWjzAqgAY+Sk5a8InRYpZdzTHCv9LIPDCHbwfHHnEdlKUJS
 Wrl7nrdGw0rexsBnwCI7XOYLIMs5ISh78ESexAtLJ4F1Lq/YKoi8vjuUWx6g0zlaUXew=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7gIk-0002Hv-Gn; Mon, 17 Aug 2020 14:39:54 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7gIk-0005WE-A9; Mon, 17 Aug 2020 14:39:54 +0000
Subject: Re: [PATCH] xen/x86: irq: Avoid a TOCTOU race in
 pirq_spin_lock_irq_desc()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>
References: <20200722165300.22655-1-julien@xen.org>
 <c9863243-0b5e-521f-80b8-bc5673f895a6@suse.com>
 <5bd56ef4-8bf5-3308-b7db-71e41ac45918@xen.org>
 <bb25c46f-0670-889e-db0b-3031291db640@citrix.com>
 <5a11fa4e-1d57-ad12-ef43-08ed9c5c79dd@xen.org>
 <20200817124600.GC828@Air-de-Roger>
 <9375f5f2-7cbd-1344-ae03-51909dfd41e9@xen.org>
 <20200817140125.GD828@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <53eeaa9f-3a4f-525e-a07f-d36ef245925a@xen.org>
Date: Mon, 17 Aug 2020 15:39:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200817140125.GD828@Air-de-Roger>
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



On 17/08/2020 15:01, Roger Pau Monné wrote:
> On Mon, Aug 17, 2020 at 02:14:01PM +0100, Julien Grall wrote:
>> Hi,
>>
>> On 17/08/2020 13:46, Roger Pau Monné wrote:
>>> On Fri, Aug 14, 2020 at 08:25:28PM +0100, Julien Grall wrote:
>>>> Hi Andrew,
>>>>
>>>> Sorry for the late answer.
>>>>
>>>> On 23/07/2020 14:59, Andrew Cooper wrote:
>>>>> On 23/07/2020 14:22, Julien Grall wrote:
>>>>>> Hi Jan,
>>>>>>
>>>>>> On 23/07/2020 12:23, Jan Beulich wrote:
>>>>>>> On 22.07.2020 18:53, Julien Grall wrote:
>>>>>>>> --- a/xen/arch/x86/irq.c
>>>>>>>> +++ b/xen/arch/x86/irq.c
>>>>>>>> @@ -1187,7 +1187,7 @@ struct irq_desc *pirq_spin_lock_irq_desc(
>>>>>>>>            for ( ; ; )
>>>>>>>>          {
>>>>>>>> -        int irq = pirq->arch.irq;
>>>>>>>> +        int irq = read_atomic(&pirq->arch.irq);
>>>>>>>
>>>>>>> There we go - I'd be fine this way, but I'm pretty sure Andrew
>>>>>>> would want this to be ACCESS_ONCE(). So I guess now is the time
>>>>>>> to settle which one to prefer in new code (or which criteria
>>>>>>> there are to prefer one over the other).
>>>>>>
>>>>>> I would prefer if we have a single way to force the compiler to do a
>>>>>> single access (read/write).
>>>>>
>>>>> Unlikely to happen, I'd expect.
>>>>>
>>>>> But I would really like to get rid of (or at least rename)
>>>>> read_atomic()/write_atomic() specifically because they've got nothing to
>>>>> do with atomic_t's and the set of functionality who's namespace they share.
>>>>
>>>> Would you be happy if I rename both to READ_ONCE() and WRITE_ONCE()? I would
>>>> also suggest to move them implementation in a new header asm/lib.h.
>>>
>>> Maybe {READ/WRITE}_SINGLE (to note those should be implemented using a
>>> single instruction)?
>>
>> The asm volatile statement contains only one instruction, but this doesn't
>> mean the helper will generate a single instruction.
> 
> Well, the access should be done using a single instruction, which is
> what we care about when using this helpers.
> 
>> You may have other instructions to get the registers ready for the access.
>>
>>>
>>> ACCESS_ONCE (which also has the _ONCE suffix) IIRC could be
>>> implemented using several instructions, and hence doesn't seem right
>>> that they all have the _ONCE suffix.
>>
>> The goal here is the same, we want to access the variable *only* once.
> 
> Right, but this is not guaranteed by the current implementation of
> ACCESS_ONCE AFAICT, as the compiler *might* split the access into two
> (or more) instructions, and hence won't be an atomic access anymore?
 From my understanding, at least on GCC/Clang, ACCESS_ONCE() should be 
atomic if you are using aligned address and the size smaller than a 
register size.

> 
>> May I ask why we would want to expose the difference to the user?
> 
> I'm not saying we should, but naming them using the _ONCE suffix seems
> misleading IMO, as they have different guarantees than what
> ACCESS_ONCE currently provides.

Lets leave aside how ACCESS_ONCE() is implemented for a moment.

If ACCESS_ONCE() doesn't guarantee atomicy, then it means you may read a 
mix of the old and new value. This would most likely break quite a few 
of the users because the result wouldn't be coherent.

Do you have place in mind where the non-atomicity would be useful?

Cheers,

-- 
Julien Grall

