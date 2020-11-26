Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F0C2C59FA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 18:04:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38912.71699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiKgO-0005LW-Vk; Thu, 26 Nov 2020 17:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38912.71699; Thu, 26 Nov 2020 17:03:48 +0000
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
	id 1kiKgO-0005L9-RW; Thu, 26 Nov 2020 17:03:48 +0000
Received: by outflank-mailman (input) for mailman id 38912;
 Thu, 26 Nov 2020 17:03:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EevG=FA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kiKgN-0005Ko-TA
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 17:03:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93a60847-34b3-4299-a7bb-62aa68d6b0e4;
 Thu, 26 Nov 2020 17:03:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3EC3EAC65;
 Thu, 26 Nov 2020 17:03:45 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=EevG=FA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kiKgN-0005Ko-TA
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 17:03:48 +0000
X-Inumbo-ID: 93a60847-34b3-4299-a7bb-62aa68d6b0e4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 93a60847-34b3-4299-a7bb-62aa68d6b0e4;
	Thu, 26 Nov 2020 17:03:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606410225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m1ysc7Ibeo17wE8VMnjGvvKlHGmYQEQlgVtwhWD/yTA=;
	b=j6H1kfZ8ETGSTP2KFkhwMyMe9Kplj3X7moMODC3OnHDFN1+gfLFrdbCph1t6UP1eZx5PjX
	d71aZDHGgZ6s89LDt04gEyingUMD/IrdaOVl0WBOQqtS8EjSAuynRPLUGuFLMJevDhrvA3
	ujKKtRuefeEFisqrGAbA/Di/Y5c80t0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3EC3EAC65;
	Thu, 26 Nov 2020 17:03:45 +0000 (UTC)
Subject: Re: [PATCH v2 02/17] mm: introduce xvmalloc() et al and use for grant
 table allocations
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
 <23acd443-348c-5ef9-0fb5-880e06cc9a2d@suse.com>
 <0c40a6f6-af8c-1040-f249-36752df3a1f1@xen.org>
 <a752cdb9-4609-2a61-b657-c17cbe4febb8@suse.com>
 <alpine.DEB.2.21.2011251122200.7979@sstabellini-ThinkPad-T480s>
 <2aeba247-8b36-7b75-dc17-b901bf746f87@suse.com>
 <8e86bed4-b6fa-ed81-8ca8-41e727c56cb1@xen.org>
 <150fdd8b-f4c5-5ee8-f1e5-b3fafb4eb3ca@suse.com>
 <19142200-cddb-0d54-4c15-5eb7668481bc@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <82dfedbb-a5ab-45b6-8b38-7b00ba1335f3@suse.com>
Date: Thu, 26 Nov 2020 18:03:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <19142200-cddb-0d54-4c15-5eb7668481bc@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.11.2020 16:53, Julien Grall wrote:
> On 26/11/2020 15:18, Jan Beulich wrote:
>> On 26.11.2020 14:22, Julien Grall wrote:
>>> On 26/11/2020 11:34, Jan Beulich wrote:
>>>> On 25.11.2020 20:48, Stefano Stabellini wrote:
>>>>> On Wed, 25 Nov 2020, Jan Beulich wrote:
>>>>>> On 25.11.2020 13:15, Julien Grall wrote:
>>>>>>> On 23/11/2020 14:23, Jan Beulich wrote:
>>>>>>>> I'm unconvinced of the mentioning of "physically contiguous" in the
>>>>>>>> comment at the top of the new header: I don't think xmalloc() provides
>>>>>>>> such a guarantee. Any use assuming so would look (latently) broken to
>>>>>>>> me.
>>>>>>>
>>>>>>> I haven't had the chance to reply to the first version about this. So I
>>>>>>> will reply here to avoid confusion.
>>>>>>>
>>>>>>> I can at least spot one user in Arm that would use xmalloc() that way
>>>>>>> (see the allocation of itt_addr in arch/arm/gic-v3-its.c).
>>>>>>
>>>>>> And I surely wouldn't have spotted this, even if I had tried
>>>>>> to find "offenders", i.e. as said before not wanting to alter
>>>>>> the behavior of existing code (beyond the explicit changes
>>>>>> done here) was ...
>>>>>>
>>>>>>> AFAIK, the memory is for the sole purpose of the ITS and should not be
>>>>>>> accessed by Xen. So I think we can replace by a new version of
>>>>>>> alloc_domheap_pages().
>>>>>>>
>>>>>>> However, I still question the usefulness of introducing yet another way
>>>>>>> to allocate memory (we already have alloc_xenheap_pages(), xmalloc(),
>>>>>>> alloc_domheap_pages(), vmap()) if you think users cannot rely on
>>>>>>> xmalloc() to allocate memory physically contiguous.
>>>>>>
>>>>>> ... the reason to introduce a separate new interface. Plus of
>>>>>> course this parallels what Linux has.
>>>>>>
>>>>>>> It definitely makes more difficult to figure out when to use xmalloc()
>>>>>>> vs xvalloc().
>>>>>>
>>>>>> I don't see the difficulty:
>>>>>> - if you need physically contiguous memory, use alloc_xen*_pages(),
>>>>>> - if you know the allocation size is always no more than a page,
>>>>>>     use xmalloc(),
>>>
>>> If that's then intention, then may I ask why xmalloc() is able to
>>> support multiple pages allocation?
>>
>> Because support for this pre-dates even the introduction of vmalloc()?
> 
> Right, so the code should disappear if we want people to avoid making 
> that assumption with xmalloc().

You mean once all users of xmalloc() needing more than a page have
disappeared? We can't drop that code any earlier.

>>> Your assumption is Xen will always be built with the same page size
>>> across all the architecture. While Xen only works with 4KB pages today,
>>> Arm can support 16KB and 64KB. I have long term plan to add support for it.
>>>
>>> So I don't think you can use the page size as a way to distinguish which
>>> one to use.
>>
>> The let's abstract this one level further
>>
>> - if you know the allocation size is always no more than the smallest
>>    possible page size, use xmalloc()
> 
> So basically, xmalloc() is becoming pointless when xvmalloc() can do the 
> same for you (as it would call xmalloc()).

At the expense of one extra call layer. I still think directly
calling xmalloc() for small blocks of memory is a sensible
thing to do. So no, I don't view it as becoming pointless.

>>>>> What if you need memory physically contiguous but not necessarily an
>>>>> order of pages, such as for instance 5200 bytes?
>>>>
>>>> This case is, I think, rare enough (in particular in Xen) that the
>>>> waste of space can be tolerated imo.
>>>
>>> This is quite departure from:
>>>
>>> commit b829a0ff5794ee5b0f96a0c872f6a4ed7b1007c7
>>> Author: Jan Beulich <jbeulich@suse.com>
>>> Date:   Thu Oct 13 10:03:43 2011 +0200
>>>
>>>       xmalloc: return unused full pages on multi-page allocations
>>>
>>>       Certain (boot time) allocations are relatively large (particularly when
>>>       building with high NR_CPUS), but can also happen to be pretty far away
>>>       from a power-of-two size. Utilize the page allocator's (other than
>>>       Linux'es) capability of allowing to return space from higher-order
>>>       allocations in smaller pieces to return the unused parts immediately.
>>>
>>>       Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>       Acked-by: Keir Fraser <keir@xen.org>
>>>
>>> I am curious to know what changed...
>>
>> Nothing. But even if something had, citing a 9 year old commit is
>> not likely to point out any actual contradiction.
> 
> You can't say it is tolerable but in the past suggested that it was not 
> (otherwise why would you hand back memory?).
> 
> Therefore I would like to understand why in the past this was not 
> tolerable but now it is... What changed?

Oh, so it looks like I misunderstood, taking together this and ...

>>> Anyway, what you wrote is very server focused. On Arm, we have plan to
>>> run Xen on smaller hardware where wasting memory mean less usable RAM
>>> for guests.
>>>
>>> The problem with using an order is the bigger the order is the more
>>> change you will waste space...
>>>
>>> Allocating more than a page is fairly common on Arm, so we really want
>>> to reduce the amount of memory wasted.
>>
>> The amount of space wasted is the same - the tail of the trailing
>> page. I'm afraid I don't see what your point is.
> 
> There would obviously be no difference if one wants to allocate more 
> than one page but less than 2 pages....
> 
> But that was not my point. My point is when you allocate with an order 
> greater or equal to 2, then you will start wasting memory when not using 
> xmalloc().
> 
> For instance, if you want to allocate 20kB then you will need to 
> allocate 32kB and lose 12kB. To make it sound bigger, you could replace 
> kB by mB.

... this. You're asking why the order based alloc_*heap_pages()
induced waste is acceptable? It's not. But that's not the point
here. vmalloc() doesn't incur such a waste, and as was said
earlier perhaps we should gain a count-based page allocator
interface (which could simply be the code from xmalloc() broken
out). But all of this is mostly unrelated to the change here,
not the least because call sites caring to avoid the waste can
easily return what they don't need. It is again a property of
the current xmalloc() implementation, but not a guarantee, that
such returning happens.

>>> However, you seem to be the one objecting on the behavior of xmalloc().
>>
>> I don't think I'm objecting to any existing behavior. What I did
>> is state my view on (non-)guarantees by xmalloc(). And I've
>> already said - maybe I'm wrong and, like Linux'es kmalloc(),
>> there is a guarantee of it producing contiguous memory, and I
>> merely didn't find where that's said.
> 
> I can find quite a few places in Linux that use kmalloc() with size that 
> are bigger than a page size.
> 
> That's enough for me to think that while this may not have been the 
> original intention, people are using it like that (same in Xen). So we 
> can't dismiss it.

Once there are such uses, replacing them takes (often a lot of)
time. So unless it's clear they're intentionally kmalloc() despite
the big size, I'd generally suspect people simply didn't know or
care to use vmalloc(). If it also quite common for allocation
sizes to cross the boundary of page size without the person doing
the "offending" change actually noticing.

>>> I can't speak for Stefano, but I don't object on following Linux.
>>> Instead I am objecting on the growing number of way to allocate memory
>>> in Xen and that differ depending on the system_state.
>>
>> But as per above the addition only brings us on par with Linux.
>> There, kvmalloc_node() is simply a wrapper (with different logic
>> when to try what) around kmalloc_node() and __vmalloc_node(). No
>> different (in the basic idea) from what I'm doing here.
> 
> There are at least two more in Xen so far:
> 
>   - alloc_domheap_pages()
>   - alloc_xenheap_pages()

Which have an equivalent in Linux, too.

> I still maintain that the way you suggest to use each of them is not 
> clear. In particular, that xmalloc() doesn't guarantee physcally 
> contiguous allocation for allocation larger than a page size.
> 
> In summary, I would be happy with the introduction of xvmalloc() as long 
> as we guarantee that xmalloc() is allocating physically contiguous memory.

So the main reason why I think xmalloc() and kmalloc() can be
considered different in this regard is that we have basically no
device drivers in Xen, and hence there's pretty limited need for
physically contiguous memory (outside of cases going straight to
the page allocator anyway).

Yet once again - that's my view on it, and the original intentions
may have been different.

All I want is code that allows me to avoid, at call sites, to
have to explicitly decide whether I want xmalloc() or vmalloc().
The grant table code changed here is one good example. The uses
of the new functions in subsequent patches are further ones. I
do specifically _not_ care to replace any existing functionality.
I only want these library-like helpers. Optimization and code
folding could come later.

> Users that doesn't care about this guarantee would have to be switched 
> to use xvmalloc() (This doesn't need to be done here).

And that's what I dislike: I don't see any "have to" here. I view
"have to" as applicable only to runtime allocations which may end
up being non-order-0 once they hit the underlying page allocator.
Don't forget that vmalloc(), besides the memory to be allocated,
also consumes VA space. xmalloc() doesn't as long we have a
directmap. Hence at least during boot there may be good reasons
why someone prefers to use xmalloc() even for larger bodies of
memory.

Jan

