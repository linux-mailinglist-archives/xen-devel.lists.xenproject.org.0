Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5F32B9087
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 12:00:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30610.60755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfhf5-0003UZ-Q4; Thu, 19 Nov 2020 10:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30610.60755; Thu, 19 Nov 2020 10:59:35 +0000
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
	id 1kfhf5-0003UA-Ms; Thu, 19 Nov 2020 10:59:35 +0000
Received: by outflank-mailman (input) for mailman id 30610;
 Thu, 19 Nov 2020 10:59:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfhf3-0003U2-Ht
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 10:59:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfhf2-00012H-4F; Thu, 19 Nov 2020 10:59:32 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfhf1-0005eh-O1; Thu, 19 Nov 2020 10:59:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfhf3-0003U2-Ht
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 10:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=63HXOrw55m7fSuT5mv2XlypB1wFoU1pivjgY0UAQ+KU=; b=P0vvHCgCCfYXAoNQaaTy+k5nRF
	5s3aLqyo13i9Sx15gHo8amKpd8dr1tY9r2OwzLHVuWGNXl0d7HuO4DJrA668bGdZ31hglaJjiQ/R7
	94ys5+EkVBtoGMkflbIh9vwcIopyx7RGk/5KsLfb3WsQYVfXasE95WN4UE2IZ77aPXsg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfhf2-00012H-4F; Thu, 19 Nov 2020 10:59:32 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfhf1-0005eh-O1; Thu, 19 Nov 2020 10:59:31 +0000
Subject: Re: [PATCH 1/3] mm: introduce xvmalloc() et al and use for grant
 table allocations
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e0364274-f123-82bd-ec85-bea519a34049@suse.com>
 <d98aabe4-6c1b-0970-2e42-eb991e9075a2@suse.com>
 <e7b72c54-e8e4-428d-9264-484fc0061ba4@xen.org>
 <9adc7ec2-c014-d9ae-a8b5-5b942640386c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e115ce52-3c5c-6530-dd3a-bc7f268ef224@xen.org>
Date: Thu, 19 Nov 2020 10:59:29 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <9adc7ec2-c014-d9ae-a8b5-5b942640386c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 19/11/2020 09:46, Jan Beulich wrote:
> On 18.11.2020 20:10, Julien Grall wrote:
>> On 06/11/2020 07:11, Jan Beulich wrote:
>>> All of the array allocations in grant_table_init() can exceed a page's
>>> worth of memory, which xmalloc()-based interfaces aren't really suitable
>>> for after boot.
>>
>> I can see a few reasons why they are not suitable:
>>     - xmalloc() will try to using an order and then throw memory. This is
>> pretty inneficient.
> 
> But addressing this inefficiency, while a nice side effect, is
> not the goal here.
> 
>>     - xmalloc() will allocate physically contiguous memory
> 
> This aspect matters here only indirectly: What we care about
> avoiding are runtime allocations of non-zero order. The assumption
> of how I worded the description is that during boot non-zero-
> order allocations can typically be fulfilled and hence aren't a
> (general) problem.
Well... In the case of the grant table, if you can't find a small order 
of physically contiguous pages then you have bigger trouble on your 
platform. You will either not have enough space for the allocating the 
domain memory, or the performance will be awful because only 4K pages 
are used.

So while I agree that having xvmalloc() is a good move, I am not 
convinced of your argument regarding the boot vs runtime.

I think a better argument is the allocation doesn't need to be 
physically contiguous in memory. So better avoid it when we can.

> 
>> It would be good to clarify which one you refer because none of them are
>> really a problem only after boot...
> 
> Given the above, I'm not sure in which way you would see this be
> clarified. Any suggestions welcome.
> 
>> One thing to be aware thought is xv*() are going to be more inefficient
>> because they involve touching the page-tables (at least until the work
>> to map on-demand the direct map is not merged). In addition, on Arm,
>> they will also use only 4K mappings (I have a TODO to fix that).
>>
>> So I think we will need to be careful when to use xmalloc() vs
>> xvalloc(). It might be worth outlining that in the documentation of xv*().
> 
> The rule is quite simple and the inefficiencies you mention
> shouldn't matter imo: Post-boot there should not be any
> implicit allocations of non-zero order. "Implicit" here meaning
> to still permit e.g. direct alloc_domheap_pages() invocations,
> making apparent at the call site that the aspect of memory
> fragmentation was (hopefully) taken into consideration. I'm
> actually inclined to suggest (down the road) to have _xmalloc()
> no longer fall back to multi-page allocations post-boot, but
> instead return NULL.

One advantage of xmalloc() is it is able to allocate a suitable xenheap 
area. So it will not touch the page-tables and therefore useful for 
short-life allocation as the overhead will be more limited compare to 
xvalloc().

There is also the problem that alloc_{dom, xen}heap_pages() works using 
order. xmalloc() is handy because it will give back the unnecessary pages.

Maybe we should consider a version of alloc_*heap_pages() that will take 
the number of pages rather than order.

> 
> If you think it is really needed, I can add something like "These
> should be used in preference to xmalloc() et al whenever the size
> is not known to be constrained to at most a single page" to the
> comment at the top of the new header file.

There are quite a few users of xmalloc() with large allocations. Yet, 
they would not be suitable for xvalloc() because they require physically 
contiguous memory. So I think you would want to mention that in the 
sentence.

> Where the inefficiencies you mention would imo matter is in
> (future) decisions whether to use vmalloc() et al vs xvmalloc()
> et al: If the size _may_ be no more than a page, the latter may
> want preferring.
I am not sure to understand this... why would we want to keep vmalloc() 
extern when xvalloc() will be calling it for allocation over a PAGE_SIZE?

> 
>>> --- a/xen/common/vmap.c
>>> +++ b/xen/common/vmap.c
>>> @@ -7,6 +7,7 @@
>>>    #include <xen/spinlock.h>
>>>    #include <xen/types.h>
>>>    #include <xen/vmap.h>
>>> +#include <xen/xvmalloc.h>
>>>    #include <asm/page.h>
>>>    
>>>    static DEFINE_SPINLOCK(vm_lock);
>>> @@ -299,11 +300,29 @@ void *vzalloc(size_t size)
>>>        return p;
>>>    }
>>>    
>>> -void vfree(void *va)
>>> +static void _vfree(const void *va, unsigned int pages, enum vmap_region type)
>>
>> I don't think "unsigned int" is sufficient to cover big size. AFAICT,
>> this is not in a new problem in this code and seems to be a latent issue
>> so far.
>>
>> However, I feel that it is wrong to introduce a new set of allocation
>> helpers that contained a flaw fixed in xm*alloc() recently (see  commit
>> cf38b4926e2b "xmalloc: guard against integer overflow").
> 
> For _xmalloc() we're talking about bytes (and the guarding you
> refer to is actually orthogonal to the limiting done by the
> page allocator, as follows from the description of that change).
> Here we're talking about pages. I hope it will be decades until we
> have to consider allocating 16Tb all in one chunk (and we'd need
> to have large enough vmap virtual address space set aside first).

I think you misunderstood my point here. I am not suggesting that a 
normal user would ask to allocate 16TB but that a caller may pass by 
mistake an unsanitized value to xv*() functions.

IIRC, the overflow check in xm*() were added after we discovered that 
some callers where passing unsanitized values.

I would expect xv*() functions to be more used in the future, so I think 
it would be unwise to not guard against overflow.

I would be happy with just checking that nr always fit in a 32-bit value.

> Also note that
> - the entire vmap.c right now uses unsigned int for page counts,
>    so it would be outright inconsistent to use unsigned long here,

I didn't suggest this would be the only place (note that "new problem"). 
This was the best place I could find to mention an existing problem that 
is widened with the introduction of xv*() helpers.

> - at least on x86 passing around 64-bit function arguments is
>    slightly less efficient than 32-bit ones, and hence I'd prefer
>    to keep it like this.

Don't you have 64-bit registers on x86-64?

But, I am really surprised this is a concern to you when all the 
functions in this code will modify the pages tables. You dismissed this 
overhead in the same e-mail...

> 
>>> --- /dev/null
>>> +++ b/xen/include/xen/xvmalloc.h
>>> @@ -0,0 +1,70 @@
>>> +
>>> +#ifndef __XVMALLOC_H__
>>> +#define __XVMALLOC_H__
>>> +
>>> +#include <xen/cache.h>
>>> +#include <xen/types.h>
>>> +
>>> +/*
>>> + * Xen malloc/free-style interface.
>>
>> It would be useful to emphase that they should only be used if the
>> caller does *not* need physically contiguous memory.
> 
> Actually first of all I shouldn't have copied to comment without
> editing. I've now made it
> 
> /*
>   * Xen malloc/free-style interface preferable for allocations possibly
>   * exceeding a page's worth of memory, as long as there's no need to have
>   * physically contiguous memory allocated.
>   */
> 
> albeit I'm not sure the "physically discontiguous" really needs
> pointing out, considering the 'v' in the function names.

Verbosity never hurt. I would not say the same with figuring out what 
'v' means.

I am not ashame to say that when began to work on Linux/Xen, I had some 
trouble to figure out the difference between kmalloc() and vmalloc().

Cheers,

-- 
Julien Grall

