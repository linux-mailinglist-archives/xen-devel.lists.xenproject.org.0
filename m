Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8BC2B9299
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 13:33:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30680.60850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfj7r-00067q-VQ; Thu, 19 Nov 2020 12:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30680.60850; Thu, 19 Nov 2020 12:33:23 +0000
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
	id 1kfj7r-00067R-SE; Thu, 19 Nov 2020 12:33:23 +0000
Received: by outflank-mailman (input) for mailman id 30680;
 Thu, 19 Nov 2020 12:33:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfj7q-00067M-Kh
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 12:33:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13fd40f5-7cbf-4374-9f64-e4dbc870f694;
 Thu, 19 Nov 2020 12:33:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3A089AF10;
 Thu, 19 Nov 2020 12:33:20 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfj7q-00067M-Kh
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 12:33:22 +0000
X-Inumbo-ID: 13fd40f5-7cbf-4374-9f64-e4dbc870f694
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 13fd40f5-7cbf-4374-9f64-e4dbc870f694;
	Thu, 19 Nov 2020 12:33:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605789200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nzQyigJAAb0SQRoz/a8LAfsNCTmesqa2tR+BS4h2I1E=;
	b=tU7K8jg7R4NIfFhDEYHwmGFYhjc/uW1Q2nVSHFIcX3Wy+R+Ubtbj3tM2raVVpOClpOFYmk
	X0BQPKV0yB/g5Feef1BQ/3K22rhbqemcWfP+AJHkIJW05BfTm8ddLnyMx32BFa9dow1KE6
	Ndv4iyo+qqrZhpehvNun+rfV7dB07fI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3A089AF10;
	Thu, 19 Nov 2020 12:33:20 +0000 (UTC)
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a00f3c98-04c1-4380-dc62-22d001edae1d@suse.com>
Date: Thu, 19 Nov 2020 13:33:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <e115ce52-3c5c-6530-dd3a-bc7f268ef224@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.11.2020 11:59, Julien Grall wrote:
> On 19/11/2020 09:46, Jan Beulich wrote:
>> On 18.11.2020 20:10, Julien Grall wrote:
>>> On 06/11/2020 07:11, Jan Beulich wrote:
>>>> All of the array allocations in grant_table_init() can exceed a page's
>>>> worth of memory, which xmalloc()-based interfaces aren't really suitable
>>>> for after boot.
>>>
>>> I can see a few reasons why they are not suitable:
>>>     - xmalloc() will try to using an order and then throw memory. This is
>>> pretty inneficient.
>>
>> But addressing this inefficiency, while a nice side effect, is
>> not the goal here.
>>
>>>     - xmalloc() will allocate physically contiguous memory
>>
>> This aspect matters here only indirectly: What we care about
>> avoiding are runtime allocations of non-zero order. The assumption
>> of how I worded the description is that during boot non-zero-
>> order allocations can typically be fulfilled and hence aren't a
>> (general) problem.
> Well... In the case of the grant table, if you can't find a small order 
> of physically contiguous pages then you have bigger trouble on your 
> platform. You will either not have enough space for the allocating the 
> domain memory, or the performance will be awful because only 4K pages 
> are used.

Performance will be affected, yes, but I'm not sure I'd call this
"awful". 

> So while I agree that having xvmalloc() is a good move, I am not 
> convinced of your argument regarding the boot vs runtime.
> 
> I think a better argument is the allocation doesn't need to be 
> physically contiguous in memory. So better avoid it when we can.

Well... I've added a sentence.

>>> It would be good to clarify which one you refer because none of them are
>>> really a problem only after boot...
>>
>> Given the above, I'm not sure in which way you would see this be
>> clarified. Any suggestions welcome.
>>
>>> One thing to be aware thought is xv*() are going to be more inefficient
>>> because they involve touching the page-tables (at least until the work
>>> to map on-demand the direct map is not merged). In addition, on Arm,
>>> they will also use only 4K mappings (I have a TODO to fix that).
>>>
>>> So I think we will need to be careful when to use xmalloc() vs
>>> xvalloc(). It might be worth outlining that in the documentation of xv*().
>>
>> The rule is quite simple and the inefficiencies you mention
>> shouldn't matter imo: Post-boot there should not be any
>> implicit allocations of non-zero order. "Implicit" here meaning
>> to still permit e.g. direct alloc_domheap_pages() invocations,
>> making apparent at the call site that the aspect of memory
>> fragmentation was (hopefully) taken into consideration. I'm
>> actually inclined to suggest (down the road) to have _xmalloc()
>> no longer fall back to multi-page allocations post-boot, but
>> instead return NULL.
> 
> One advantage of xmalloc() is it is able to allocate a suitable xenheap 
> area. So it will not touch the page-tables and therefore useful for 
> short-life allocation as the overhead will be more limited compare to 
> xvalloc().

Yet it still shouldn't be used post-boot when the size may exceed
system page size, to avoid reporting -ENOMEM or alike when really
there's ample but fragmented memory available.

> There is also the problem that alloc_{dom, xen}heap_pages() works using 
> order. xmalloc() is handy because it will give back the unnecessary pages.
> 
> Maybe we should consider a version of alloc_*heap_pages() that will take 
> the number of pages rather than order.

Possibly, I've indeed been wondering more than once whether we should.

>> If you think it is really needed, I can add something like "These
>> should be used in preference to xmalloc() et al whenever the size
>> is not known to be constrained to at most a single page" to the
>> comment at the top of the new header file.
> 
> There are quite a few users of xmalloc() with large allocations. Yet, 
> they would not be suitable for xvalloc() because they require physically 
> contiguous memory.

Isn't this a mistake? I.e. am I unaware of some comment saying that
xmalloc() actually guarantees to return physically contiguous memory?
It's certainly against the "Xen malloc/free-style interface" comment
at the top of the header.

It was my understanding so far that with the removal of the direct-
map this property would go away anyway.

> So I think you would want to mention that in the 
> sentence.

Well, as you've seen further down the comment already mentions that
aspect.

>> Where the inefficiencies you mention would imo matter is in
>> (future) decisions whether to use vmalloc() et al vs xvmalloc()
>> et al: If the size _may_ be no more than a page, the latter may
>> want preferring.
> I am not sure to understand this... why would we want to keep vmalloc() 
> extern when xvalloc() will be calling it for allocation over a PAGE_SIZE?

Why force callers knowing they'll allocate more than a page to go
through the extra layer? If that was the plan, then we wouldn't
need a set of new functions, but could instead tweak vmalloc() etc.

>>>> --- a/xen/common/vmap.c
>>>> +++ b/xen/common/vmap.c
>>>> @@ -7,6 +7,7 @@
>>>>    #include <xen/spinlock.h>
>>>>    #include <xen/types.h>
>>>>    #include <xen/vmap.h>
>>>> +#include <xen/xvmalloc.h>
>>>>    #include <asm/page.h>
>>>>    
>>>>    static DEFINE_SPINLOCK(vm_lock);
>>>> @@ -299,11 +300,29 @@ void *vzalloc(size_t size)
>>>>        return p;
>>>>    }
>>>>    
>>>> -void vfree(void *va)
>>>> +static void _vfree(const void *va, unsigned int pages, enum vmap_region type)
>>>
>>> I don't think "unsigned int" is sufficient to cover big size. AFAICT,
>>> this is not in a new problem in this code and seems to be a latent issue
>>> so far.
>>>
>>> However, I feel that it is wrong to introduce a new set of allocation
>>> helpers that contained a flaw fixed in xm*alloc() recently (see  commit
>>> cf38b4926e2b "xmalloc: guard against integer overflow").
>>
>> For _xmalloc() we're talking about bytes (and the guarding you
>> refer to is actually orthogonal to the limiting done by the
>> page allocator, as follows from the description of that change).
>> Here we're talking about pages. I hope it will be decades until we
>> have to consider allocating 16Tb all in one chunk (and we'd need
>> to have large enough vmap virtual address space set aside first).
> 
> I think you misunderstood my point here. I am not suggesting that a 
> normal user would ask to allocate 16TB but that a caller may pass by 
> mistake an unsanitized value to xv*() functions.
> 
> IIRC, the overflow check in xm*() were added after we discovered that 
> some callers where passing unsanitized values.
> 
> I would expect xv*() functions to be more used in the future, so I think 
> it would be unwise to not guard against overflow.
> 
> I would be happy with just checking that nr always fit in a 32-bit value.

The two callers of the function obtain the value from vm_size(),
which returns unsigned int.

>> Also note that
>> - the entire vmap.c right now uses unsigned int for page counts,
>>    so it would be outright inconsistent to use unsigned long here,
> 
> I didn't suggest this would be the only place (note that "new problem"). 
> This was the best place I could find to mention an existing problem that 
> is widened with the introduction of xv*() helpers.

Oh, so you're talking of a separate and entirely unrelated patch
making sure the existing vmalloc() won't suffer such a problem.
Yes, vmalloc_type() could be fixed to this effect. But do you
realize we'd have a security issue much earlier if any guest
action could lead to such a gigantic vmalloc(), as the time to
both allocate and then map 4 billion pages is going to be way
longer than what we may tolerate without preempting?

And no, there's no overflowing calculation anywhere afaics which
would resemble the ones in xmalloc() you refer to.

>> - at least on x86 passing around 64-bit function arguments is
>>    slightly less efficient than 32-bit ones, and hence I'd prefer
>>    to keep it like this.
> 
> Don't you have 64-bit registers on x86-64?

Yes, yet to operate on them most insns need an extra prefix
byte.

> But, I am really surprised this is a concern to you when all the 
> functions in this code will modify the pages tables. You dismissed this 
> overhead in the same e-mail...

Entirely different considerations: The goal of limiting variable
(and parameter) types to 32 bits where possible is a generic one.
Which is, if for nothing else, to avoid introducing bad precedent.

Jan

