Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE3B2B94BE
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 15:40:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30843.61005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfl7A-000473-9E; Thu, 19 Nov 2020 14:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30843.61005; Thu, 19 Nov 2020 14:40:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfl7A-00046e-5M; Thu, 19 Nov 2020 14:40:48 +0000
Received: by outflank-mailman (input) for mailman id 30843;
 Thu, 19 Nov 2020 14:40:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfl78-00046Y-BT
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 14:40:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f78f7004-1739-47cb-b4e9-304ecff67a63;
 Thu, 19 Nov 2020 14:40:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 414AEAD43;
 Thu, 19 Nov 2020 14:40:44 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfl78-00046Y-BT
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 14:40:46 +0000
X-Inumbo-ID: f78f7004-1739-47cb-b4e9-304ecff67a63
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f78f7004-1739-47cb-b4e9-304ecff67a63;
	Thu, 19 Nov 2020 14:40:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605796844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5wCFkZkYyw8UWgsnC4P4SkLdgyG7MS61qvUUBMbGgyE=;
	b=RkKQfEFQ2LGARt7ucSGiURmdwplovRHSPZgINatfjadFmPllacru+6H8oJ6fDXbh/BvuiM
	RNIW08iKOIAymzJPWOlmrCgy2oPFJ5SFnFwjhle8UNIP0UshmsbFj+/24y2+MAWpQHuKQx
	tBab3TEwKue+ueou60ySKBVbDOOSsAk=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 414AEAD43;
	Thu, 19 Nov 2020 14:40:44 +0000 (UTC)
Subject: Re: [PATCH 1/3] mm: introduce xvmalloc() et al and use for grant
 table allocations
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e0364274-f123-82bd-ec85-bea519a34049@suse.com>
 <d98aabe4-6c1b-0970-2e42-eb991e9075a2@suse.com>
 <e7b72c54-e8e4-428d-9264-484fc0061ba4@xen.org>
 <9adc7ec2-c014-d9ae-a8b5-5b942640386c@suse.com>
 <e115ce52-3c5c-6530-dd3a-bc7f268ef224@xen.org>
 <a00f3c98-04c1-4380-dc62-22d001edae1d@suse.com>
 <18d80e2c-fd54-e5be-89e0-5fedf16cc9cd@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7c13a5af-8158-9d00-bc0a-808dcb8fa02c@suse.com>
Date: Thu, 19 Nov 2020 15:40:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <18d80e2c-fd54-e5be-89e0-5fedf16cc9cd@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.11.2020 14:19, Julien Grall wrote:
> On 19/11/2020 12:33, Jan Beulich wrote:
>> It's certainly against the "Xen malloc/free-style interface" comment
>> at the top of the header.
> 
> ... if you consider it as a mistaken, then why did you introduce 
> xvalloc() rather than modifying the implementation of xmalloc()?

(a) it didn't occur to me as an option and (b) even if it did, I wouldn't
have wanted to go audit all use sites.

>> It was my understanding so far that with the removal of the direct-
>> map this property would go away anyway.
> 
> Direct-map is going to disappear on x86, but there are no plan for that 
> on Arm so far.
> 
> I am not saying I don't want to remove it, I just want to point out that 
> decision should not be made solely based on what x86 is doing (see more 
> below).

I didn't mean to imply anything like this. I was merely tryin to point
out that there may be a point in time, not too far in the future,
when any such assumption may turn out broken. You said there are a
number of such uses; I don't think I'm aware of any. Is what you're
aware of all in Arm code?

>>>> Where the inefficiencies you mention would imo matter is in
>>>> (future) decisions whether to use vmalloc() et al vs xvmalloc()
>>>> et al: If the size _may_ be no more than a page, the latter may
>>>> want preferring.
>>> I am not sure to understand this... why would we want to keep vmalloc()
>>> extern when xvalloc() will be calling it for allocation over a PAGE_SIZE?
>>
>> Why force callers knowing they'll allocate more than a page to go
>> through the extra layer? If that was the plan, then we wouldn't
>> need a set of new functions, but could instead tweak vmalloc() etc.
> 
> Two reasons:
>    1) There are too many ways to allocate memory in Xen. This adds 
> extra-confusion to use.

Maybe; I wouldn't have thought so.

>    2) The impact of the extra check is going to be insignificant compare 
> to the cost of the function. Feel free to prove me otherwise with numbers.

My point wasn't primarily (if at all) about performance, but about
call layering in general.

>>>>>> --- a/xen/common/vmap.c
>>>>>> +++ b/xen/common/vmap.c
>>>>>> @@ -7,6 +7,7 @@
>>>>>>     #include <xen/spinlock.h>
>>>>>>     #include <xen/types.h>
>>>>>>     #include <xen/vmap.h>
>>>>>> +#include <xen/xvmalloc.h>
>>>>>>     #include <asm/page.h>
>>>>>>     
>>>>>>     static DEFINE_SPINLOCK(vm_lock);
>>>>>> @@ -299,11 +300,29 @@ void *vzalloc(size_t size)
>>>>>>         return p;
>>>>>>     }
>>>>>>     
>>>>>> -void vfree(void *va)
>>>>>> +static void _vfree(const void *va, unsigned int pages, enum vmap_region type)
>>>>>
>>>>> I don't think "unsigned int" is sufficient to cover big size. AFAICT,
>>>>> this is not in a new problem in this code and seems to be a latent issue
>>>>> so far.
>>>>>
>>>>> However, I feel that it is wrong to introduce a new set of allocation
>>>>> helpers that contained a flaw fixed in xm*alloc() recently (see  commit
>>>>> cf38b4926e2b "xmalloc: guard against integer overflow").
>>>>
>>>> For _xmalloc() we're talking about bytes (and the guarding you
>>>> refer to is actually orthogonal to the limiting done by the
>>>> page allocator, as follows from the description of that change).
>>>> Here we're talking about pages. I hope it will be decades until we
>>>> have to consider allocating 16Tb all in one chunk (and we'd need
>>>> to have large enough vmap virtual address space set aside first).
>>>
>>> I think you misunderstood my point here. I am not suggesting that a
>>> normal user would ask to allocate 16TB but that a caller may pass by
>>> mistake an unsanitized value to xv*() functions.
>>>
>>> IIRC, the overflow check in xm*() were added after we discovered that
>>> some callers where passing unsanitized values.
>>>
>>> I would expect xv*() functions to be more used in the future, so I think
>>> it would be unwise to not guard against overflow.
>>>
>>> I would be happy with just checking that nr always fit in a 32-bit value.
>>
>> The two callers of the function obtain the value from vm_size(),
>> which returns unsigned int.
> 
> I can't see a use of vm_size() in vmalloc_type(). I can only see a 
> implicit downcast.

My "the function" was still referring to your initial comment, which
was about _vfree()'s parameter type.

>>>> Also note that
>>>> - the entire vmap.c right now uses unsigned int for page counts,
>>>>     so it would be outright inconsistent to use unsigned long here,
>>>
>>> I didn't suggest this would be the only place (note that "new problem").
>>> This was the best place I could find to mention an existing problem that
>>> is widened with the introduction of xv*() helpers.
>>
>> Oh, so you're talking of a separate and entirely unrelated patch
>> making sure the existing vmalloc() won't suffer such a problem.
>> Yes, vmalloc_type() could be fixed to this effect. But do you
>> realize we'd have a security issue much earlier if any guest
>> action could lead to such a gigantic vmalloc(), as the time to
>> both allocate and then map 4 billion pages is going to be way
>> longer than what we may tolerate without preempting?
> 
> Yes I missed that point. But I am not sure where you are trying to infer...
> 
> If it wasn't clear enough, I didn't suggest to fix in this patch.

Okay, this hadn't become clear to me at all. It was my understanding
that you're requesting changes to be made in this patch.

> I am 
> only pointed out that we hardened _xmalloc() and this looks like going 
> backwards.

I'm not seeing any step backwards. If there's an issue with vmalloc()
that we think needs addressing, let's address it. The patch here only
layers around existing xmalloc() / vmalloc(); I haven't managed to
spot any overflow or truncation issue in it, and I don't think I've
seen you point out any. Quite the contrary, I think I could relax
the checking in _xv{m,z}alloc_array() (but I guess I won't for now).

>> And no, there's no overflowing calculation anywhere afaics which
>> would resemble the ones in xmalloc() you refer to.
> 
> "overflow" was probably the wrong word. It would be more a downcast when 
> computing the number of pages.
> 
> __vmap() is taking an "unsigned int", yet the number of pages is 
> computed using size_t.

Yes, that's what I assume you referred to further up as implicit
downcast. And that's also the one place I spotted when trying to
understand your earlier comments.

>>> But, I am really surprised this is a concern to you when all the
>>> functions in this code will modify the pages tables. You dismissed this
>>> overhead in the same e-mail...
>>
>> Entirely different considerations: The goal of limiting variable
>> (and parameter) types to 32 bits where possible is a generic one.
> 
> At the cost of introducing multiple implicit downcast that one day or 
> another is going to bite us.
> 
>> Which is, if for nothing else, to avoid introducing bad precedent.
> 
> I am ok with 32-bit internal value, but please at least check the 
> downcasting is going to be harmless.

So here things get confusing again: Further up you've just said 
"I didn't suggest to fix in this patch". Here it sounds again as
if you were expecting this to be fixed here and now. So I guess
you may have meant to ask that I add a prereq patch addressing
this?

Jan

