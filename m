Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 687B02C552A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 14:22:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38535.71271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiHEB-000687-6V; Thu, 26 Nov 2020 13:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38535.71271; Thu, 26 Nov 2020 13:22:27 +0000
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
	id 1kiHEB-00067i-3C; Thu, 26 Nov 2020 13:22:27 +0000
Received: by outflank-mailman (input) for mailman id 38535;
 Thu, 26 Nov 2020 13:22:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kiHE9-00067d-Qc
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 13:22:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kiHE8-00027f-Dm; Thu, 26 Nov 2020 13:22:24 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kiHE8-0003W5-1d; Thu, 26 Nov 2020 13:22:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kiHE9-00067d-Qc
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 13:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=la40kzql3fS0yvQUE0Hq44V+3H0ISNU/TGuhIMnUIXA=; b=fp/Wq9AJLXPJJ93S8e+8YRSWp9
	GUZhJS0XnuBo7WDRtlf4dkM0B0il0SQse5jKOsrpUhBG51J8Hc+CHQmRw+m05+PBsge+CRIyNqhcV
	1SLuqGqsQkpnTIZj/5wtXddYcmuJEpsZem8KkTLgpRSgbp317wXyrKE/21WzxL74HmTY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kiHE8-00027f-Dm; Thu, 26 Nov 2020 13:22:24 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kiHE8-0003W5-1d; Thu, 26 Nov 2020 13:22:24 +0000
Subject: Re: [PATCH v2 02/17] mm: introduce xvmalloc() et al and use for grant
 table allocations
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
 <23acd443-348c-5ef9-0fb5-880e06cc9a2d@suse.com>
 <0c40a6f6-af8c-1040-f249-36752df3a1f1@xen.org>
 <a752cdb9-4609-2a61-b657-c17cbe4febb8@suse.com>
 <alpine.DEB.2.21.2011251122200.7979@sstabellini-ThinkPad-T480s>
 <2aeba247-8b36-7b75-dc17-b901bf746f87@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8e86bed4-b6fa-ed81-8ca8-41e727c56cb1@xen.org>
Date: Thu, 26 Nov 2020 13:22:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <2aeba247-8b36-7b75-dc17-b901bf746f87@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/11/2020 11:34, Jan Beulich wrote:
> On 25.11.2020 20:48, Stefano Stabellini wrote:
>> On Wed, 25 Nov 2020, Jan Beulich wrote:
>>> On 25.11.2020 13:15, Julien Grall wrote:
>>>> On 23/11/2020 14:23, Jan Beulich wrote:
>>>>> All of the array allocations in grant_table_init() can exceed a page's
>>>>> worth of memory, which xmalloc()-based interfaces aren't really suitable
>>>>> for after boot. We also don't need any of these allocations to be
>>>>> physically contiguous.. Introduce interfaces dynamically switching
>>>>> between xmalloc() et al and vmalloc() et al, based on requested size,
>>>>> and use them instead.
>>>>>
>>>>> All the wrappers in the new header get cloned mostly verbatim from
>>>>> xmalloc.h, with the sole adjustment to switch unsigned long to size_t
>>>>> for sizes and to unsigned int for alignments.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> v2: Actually edit a copy-and-pasted comment in xvmalloc.h which was
>>>>>       meant to be edited from the beginning.
>>>>> ---
>>>>> I'm unconvinced of the mentioning of "physically contiguous" in the
>>>>> comment at the top of the new header: I don't think xmalloc() provides
>>>>> such a guarantee. Any use assuming so would look (latently) broken to
>>>>> me.
>>>>
>>>> I haven't had the chance to reply to the first version about this. So I
>>>> will reply here to avoid confusion.
>>>>
>>>> I can at least spot one user in Arm that would use xmalloc() that way
>>>> (see the allocation of itt_addr in arch/arm/gic-v3-its.c).
>>>
>>> And I surely wouldn't have spotted this, even if I had tried
>>> to find "offenders", i.e. as said before not wanting to alter
>>> the behavior of existing code (beyond the explicit changes
>>> done here) was ...
>>>
>>>> AFAIK, the memory is for the sole purpose of the ITS and should not be
>>>> accessed by Xen. So I think we can replace by a new version of
>>>> alloc_domheap_pages().
>>>>
>>>> However, I still question the usefulness of introducing yet another way
>>>> to allocate memory (we already have alloc_xenheap_pages(), xmalloc(),
>>>> alloc_domheap_pages(), vmap()) if you think users cannot rely on
>>>> xmalloc() to allocate memory physically contiguous.
>>>
>>> ... the reason to introduce a separate new interface. Plus of
>>> course this parallels what Linux has.
>>>
>>>> It definitely makes more difficult to figure out when to use xmalloc()
>>>> vs xvalloc().
>>>
>>> I don't see the difficulty:
>>> - if you need physically contiguous memory, use alloc_xen*_pages(),
>>> - if you know the allocation size is always no more than a page,
>>>    use xmalloc(),

If that's then intention, then may I ask why xmalloc() is able to 
support multiple pages allocation?

Your assumption is Xen will always be built with the same page size 
across all the architecture. While Xen only works with 4KB pages today, 
Arm can support 16KB and 64KB. I have long term plan to add support for it.

So I don't think you can use the page size as a way to distinguish which 
one to use.

>>
>> What if you need memory physically contiguous but not necessarily an
>> order of pages, such as for instance 5200 bytes?
> 
> This case is, I think, rare enough (in particular in Xen) that the
> waste of space can be tolerated imo.

This is quite departure from:

commit b829a0ff5794ee5b0f96a0c872f6a4ed7b1007c7
Author: Jan Beulich <jbeulich@suse.com>
Date:   Thu Oct 13 10:03:43 2011 +0200

     xmalloc: return unused full pages on multi-page allocations

     Certain (boot time) allocations are relatively large (particularly when
     building with high NR_CPUS), but can also happen to be pretty far away
     from a power-of-two size. Utilize the page allocator's (other than
     Linux'es) capability of allowing to return space from higher-order
     allocations in smaller pieces to return the unused parts immediately.

     Signed-off-by: Jan Beulich <jbeulich@suse.com>
     Acked-by: Keir Fraser <keir@xen.org>

I am curious to know what changed...

Anyway, what you wrote is very server focused. On Arm, we have plan to 
run Xen on smaller hardware where wasting memory mean less usable RAM 
for guests.

The problem with using an order is the bigger the order is the more 
change you will waste space...

Allocating more than a page is fairly common on Arm, so we really want 
to reduce the amount of memory wasted.

> 
>> If xmalloc can't do physically contiguous allocations, we need something
>> else that does physically contiguous allocations not only at page
>> granularity, right?
> 
> Well, we first need to settle on what guarantees xmalloc() is meant
> to provide. It may be just me assuming it doesn't provide the same
> ones which Linux'es kmalloc() makes. I'm first and foremost
> judging by the comment near the top of xmalloc.h, which compares
> with malloc() / free(), not kmalloc() / kfree().
> 
>> The other issue is semantics. If xmalloc is unable to allocate more than
>> a page of contiguous memory, then it is identical to vmalloc from the
>> caller's point of view: both xmalloc and vmalloc return a virtual
>> address for an allocation that might not be physically contiguous.
> 
> Almost. vmalloc() puts guard pages around the allocation and
> guarantees page alignment.
> 
>> Maybe we should get rid of xmalloc entirely and improve the
>> implementation of vmalloc so that it falls back to xmalloc for
>> sub-page allocations. Which in fact is almost the same thing that you
>> did.
> 
> This would break callers assuming page alignment (and - shouldn't
> be an issue in practice - granularity). If anything, as Julien
> did suggest, we could modify xmalloc() accordingly, but then of
> course making sure we also honor alignment requests beyond page
> size.
> 
> Neither of these is the goal here, hence this "intermediate"
> implementation, which is only almost "redundant".
> 
>>> - if you know the allocation size is always more than a page, use
>>>    vmalloc(),
>>> - otherwise use xvmalloc(). Exceptions may of course apply, i.e.
>>> this is just a rule of thumb.
>>>
>>>> I would like to hear an opinion from the other maintainers.
>>>
>>> Let's hope at least one will voice theirs.
>>
>> If we take a step back, I think we only really need two memory
>> allocators:
>>
>> 1) one that allocates physically contiguous memory
>> 2) one that allocates non-physically contiguous memory
>>
>> That's it, right?
>>
>> In addition to that, I understand it could be convient to have a little
>> wrapper that automatically chooses between 1) and 2) depending on
>> circumstances.
>>
>> But if the circumstance is just size < PAGE_SIZE then I don't think we
>> need any convenience wrappers: we should just be able to call 2), which
>> is vmalloc, once we improve the vmalloc implementation.
>>
>> Or do you see any reasons to keep the current vmalloc implementation as
>> is for sub-page allocations?
> 
> See my "Almost. ..." above.
> 
> As an aside, I also find it quite puzzling that in one of the rare
> cases where I propose to clone an interface from Linux without much
> deviation from their model, I get objections. It typically was the
> other way around in the past ...

If we were really following Linux, then we would have two interfaces:
    - xmalloc() which is the same as kmalloc()
    - xvalloc() which is the same a kvalloc()

However, you seem to be the one objecting on the behavior of xmalloc().

I can't speak for Stefano, but I don't object on following Linux. 
Instead I am objecting on the growing number of way to allocate memory 
in Xen and that differ depending on the system_state.

Cheers,

-- 
Julien Grall

