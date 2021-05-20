Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EAF38A0B3
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 11:19:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130808.244819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljepu-0005gt-3F; Thu, 20 May 2021 09:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130808.244819; Thu, 20 May 2021 09:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljepu-0005dr-04; Thu, 20 May 2021 09:19:22 +0000
Received: by outflank-mailman (input) for mailman id 130808;
 Thu, 20 May 2021 09:19:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ljeps-0005db-IC
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 09:19:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljeps-0004wh-AD; Thu, 20 May 2021 09:19:20 +0000
Received: from [54.239.6.190] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljeps-00025V-42; Thu, 20 May 2021 09:19:20 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=firLHKP4Voz3HrLDZC1dRE0JFIHHVE23ghAiJeGPvpk=; b=NL8SBtDqghWMVB6WoY/NdOEDVn
	nYTi/pw+/+5M5IsQa6WaxMwsZ/Tk+/03o7PnmgujZk6GBA+MseukGQAfFIRzZIUttwTJNlioIH2CJ
	Z675fhbVhpvQRWRLk7CEp05FToWld3jUuKO0rii8bsVIJBI4TANvViAKFEwL2Q+KLjAw=;
Subject: Re: [PATCH] Xen: Design doc for 1:1 direct-map and static allocation
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>
References: <20210518050738.163156-1-penny.zheng@arm.com>
 <7ab73cb0-39d5-f8bf-660f-b3d77f3247bd@xen.org>
 <VE1PR08MB52152E43D11EB446000F4563F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f0b798f4-8fa6-9906-9971-36fd5205ae74@xen.org>
Date: Thu, 20 May 2021 10:19:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB52152E43D11EB446000F4563F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 20/05/2021 06:36, Penny Zheng wrote:
> Hi Julien

Hi Penny,

>>> +
>>> +Later, when domain get destroyed and memory relinquished, only pages
>>> +in `page_list` go back to heap, and pages in `reserved_page_list` shall not.
>>
>> While going through the series, I could not find any code implementing this.
>> However, this is not enough to prevent a page to go to the heap allocator
>> because a domain can release memory at runtime using hypercalls like
>> XENMEM_remove_from_physmap.
>>
>> One of the use case is when the guest decides to balloon out some memory.
>> This will call free_domheap_pages().
>>
>> Effectively, you are treating static memory as domheap pages. So I think it
>> would be better if you hook in free_domheap_pages() to decide which
>> allocator is used.
>>
>> Now, if a guest can balloon out memory, it can also balloon in memory.
>> There are two cases:
>>      1) The region used to be RAM region statically allocated
>>      2) The region used to be unallocated.
>>
>> I think for 1), we need to be able to re-use the page previously. For 2), it is
>> not clear to me whether a guest with memory statically allocated should be
>> allowed to allocate "dynamic" pages.
>>
> 
> Yeah, I share the same with you of hooking in free_domheap_pages(). I'm thinking
> that if pages of PGC_reserved, we may create a new func free_staticmem_pages to
> free them.
> 
> For issues on ballooning out or in, it is not supported here.

It is fine that the implementation doesn't yet implement it. However, I 
think the design document should take into account ballooning. This is 
because even if...

> Domain on Static Allocation and 1:1 direct-map are all based on dom0-less right
> now, so no PV, grant table, event channel, etc, considered.

... there is no PV support & co, a guest is still able to issue 
hypercalls (they are not hidden). Therefore your guest will be able to 
disturb your static allocation.

> 
> Right now, it only supports device got passthrough into the guest.
> 
>>> +### Memory Allocation for Domains on Static Allocation
>>> +
>>> +RAM regions pre-defined as static memory for one specifc domain shall
>>> +be parsed and reserved from the beginning. And they shall never go to
>>> +any memory allocator for any use.
>>
>> Technically, you are introducing a new allocator. So do you mean they should
>> not be given to neither the buddy allocator nor the bot allocator?
>>
> 
> Yes. These pre-defined RAM regions will not be given to any current
> memory allocator. If be given there, there is no guarantee that it will
> not be allocated for other use.
> 
> And right now, in my current design, these pre-defined RAM regions are either for
> one specific domain as guest RAM or as XEN heap.
>    
>>> +
>>> +Later when allocating static memory for this specific domain, after
>>> +acquiring those reserved regions, users need to a do set of
>>> +verification before assigning.
>>> +For each page there, it at least includes the following steps:
>>> +1. Check if it is in free state and has zero reference count.
>>> +2. Check if the page is reserved(`PGC_reserved`).
>>> +
>>> +Then, assigning these pages to this specific domain, and all pages go
>>> +to one new linked page list `reserved_page_list`.
>>> +
>>> +At last, set up guest P2M mapping. By default, it shall be mapped to
>>> +the fixed guest RAM address `GUEST_RAM0_BASE`, `GUEST_RAM1_BASE`,
>>> +just like normal domains. But later in 1:1 direct-map design, if
>>> +`direct-map` is set, the guest physical address will equal to physical
>> address.
>>> +
>>> +### Static Allocation for Xen itself
>>> +
>>> +### New Deivce Tree Node: `xen,reserved_heap`
>>
>> s/Deivce/Device/
>>
> 
> Thx.
> 
>>> +
>>> +Static memory for Xen heap refers to parts of RAM reserved in the
>>> +beginning for Xen heap only. The memory is pre-defined through XEN
>>> +configuration using physical address ranges.
>>> +
>>> +The reserved memory for Xen heap is an optional feature and can be
>>> +enabled by adding a device tree property in the `chosen` node.
>>> +Currently, this feature is only supported on AArch64.
>>> +
>>> +Here is one example:
>>> +
>>> +
>>> +        chosen {
>>> +            xen,reserved-heap = <0x0 0x30000000 0x0 0x40000000>;
>>> +            ...
>>> +        };
>>> +
>>> +RAM at 0x30000000 of 1G size will be reserved as heap memory. Later,
>>> +heap allocator will allocate memory only from this specific region.
>>
>> This section is quite confusing. I think we need to clearly differentiate heap vs
>> allocator.
>>
>> In Xen we have two heaps:
>>      1) Xen heap: It is always mapped in Xen virtual address space. This is
>> mainly used for xen internal allocation.
>>      2) Domain heap: It may not always be mapped in Xen virtual address space.
>> This is mainly used for domain memory and mapped on-demand.
>>
>> For Arm64 (and x86), two heaps are allocated from the same region. But on
>> Arm32, they are different.
>>
>> We also have two allocator:
>>      1) Boot allocator: This is used during boot only. There is no concept of
>> heap at this time.
>>      2) Buddy allocator: This is the current runtime allocator. This can either
>> allocator from either heap.
>>
>> AFAICT, this design is introducing a 3rd allocator that will return domain heap
>> pages.
>>
>> Now, back to this section, are you saying you will separate the two heaps and
>> force the buddy allocator to allocate xen heap pages from a specific region?
>>
>> [...]
> 
> I will try to explain clearly here.
> The intention behind this reserved heap is that for supporting total static system, we
> not only want to pre-define memory resource for guests, but also for xen runtime
> allocation. Any runtime behavior are more predictable.
> 
> Right now, on AArch64, all RAM, except reserved memory, will be given to buddy
> allocator as heap,  like you said, guest RAM for normal domain will be allocated
> from there, xmalloc eventually is get memory from there, etc. So we want to refine
> the heap here, not iterating through bootinfo.mem to set up XEN heap, but like
> iterating bootinfo. reserved_heap to set up XEN heap.

So effectively, you want to move to a split heap like on Arm32. Is that 
correct?

But let's take a step back from the actual code (this is implementation 
details). If the Device-Tree describes all the regions statically 
allocated to domains, why can't the memory used by Xen heap be the left 
over?

> 
> True, on ARM32, xen heap and domain heap are separately mapped, which is more
> complicated here. That's why I only talking about implementing these features on
> AArch64 as first step.

Cheers,

-- 
Julien Grall

