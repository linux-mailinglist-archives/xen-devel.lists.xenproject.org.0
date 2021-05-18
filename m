Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ECF387803
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 13:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129113.242373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liyD3-0003eX-QK; Tue, 18 May 2021 11:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129113.242373; Tue, 18 May 2021 11:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liyD3-0003bs-N1; Tue, 18 May 2021 11:48:25 +0000
Received: by outflank-mailman (input) for mailman id 129113;
 Tue, 18 May 2021 11:48:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1liyD1-0003bm-Sa
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 11:48:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liyD1-0001ki-Mm; Tue, 18 May 2021 11:48:23 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liyD1-0007r1-Er; Tue, 18 May 2021 11:48:23 +0000
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
	bh=UDUv/qFwQc+LgMrvqS2F+F0f1ctPFePV3udtqjPTNQc=; b=igZalYhRfcDTV6d7iYThAq9IVo
	Oqs8dzwLKfuaWNpVWjjyrMLG1EG0Cntkpvt9wm6EvjW9ZzMOiIXMO1Xhn56ycqYhOtBYeqzEsE/Oo
	Eu4OmEDEv04IZ9L6QvVH9ersH3JG+sUdhOsa3BmE9f+lo+vzHbVS2a2JIniacUZ+L5Ec=;
Subject: Re: [PATCH] Xen: Design doc for 1:1 direct-map and static allocation
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210518050738.163156-1-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7ab73cb0-39d5-f8bf-660f-b3d77f3247bd@xen.org>
Date: Tue, 18 May 2021 12:48:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518050738.163156-1-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 18/05/2021 06:07, Penny Zheng wrote:
> Create one design doc for 1:1 direct-map and static allocation.
> It is the first draft and aims to describe why and how we allocate
> 1:1 direct-map(guest physical == physical) domains, and why and how
> we let domains on static allocation.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   docs/designs/static_alloc_and_direct_map.md | 239 ++++++++++++++++++++
>   1 file changed, 239 insertions(+)
>   create mode 100644 docs/designs/static_alloc_and_direct_map.md
> 
> diff --git a/docs/designs/static_alloc_and_direct_map.md b/docs/designs/static_alloc_and_direct_map.md
> new file mode 100644
> index 0000000000..fdda162188
> --- /dev/null
> +++ b/docs/designs/static_alloc_and_direct_map.md
> @@ -0,0 +1,239 @@
> +# Preface
> +
> +The document is an early draft for 1:1 direct-map memory map
> +(`guest physical == physical`) of domUs and Static Allocation.
> +Since the implementation of these two features shares a lot, we would like
> +to introduce both in one design.
> +
> +Right now, these two features are limited to ARM architecture.
> +
> +This design aims to describe why and how the guest would be created as 1:1
> +direct-map domain, and why and what the static allocation is.
> +
> +This document is partly based on Stefano Stabellini's patch serie v1:
> +[direct-map DomUs](
> +https://lists.xenproject.org/archives/html/xen-devel/2020-04/msg00707.html).

While for the reviewer this is a useful information to have, I am not 
sure a future reader needs to know all the history. So I would move this 
to the commit message.

> +
> +This is a first draft and some questions are still unanswered. When this is
> +the case, it will be included under chapter `DISCUSSION`.
> +
> +# Introduction on Static Allocation
> +
> +Static allocation refers to system or sub-system(domains) for which memory
> +areas are pre-defined by configuration using physical address ranges.
> +
> +## Background
> +
> +Cases where needs static allocation:
> +
> +  * Static allocation needed whenever a system has a pre-defined non-changing
> +behaviour. This is usually the case in safety world where system must behave
> +the same upon reboot, so memory resource for both XEN and domains should be
> +static and pre-defined.
> +
> +  * Static allocation needed whenever a guest wants to allocate memory
> +from refined memory ranges. For example, a system has one high-speed RAM
> +region, and would like to assign it to one specific domain.
> +
> +  * Static allocation needed whenever a system needs a guest restricted to some
> +known memory area due to hardware limitations reason. For example, some device
> +can only do DMA to a specific part of the memory.
> +
> +Limitations:
> +  * There is no consideration for PV devices at the moment.
> +
> +## Design on Static Allocation
> +
> +Static allocation refers to system or sub-system(domains) for which memory
> +areas are pre-defined by configuration using physical address ranges.
> +
> +These pre-defined memory, -- Static Momery, as parts of RAM reserved in the

s/Momery/Memory/

> +beginning, shall never go to heap allocator or boot allocator for any use.

I think you mean "buddy" rather than "heap". Looking at your code, you 
are treating static memory region as domheap pages.

> +
> +### Static Allocation for Domains
> +
> +### New Deivce Tree Node: `xen,static_mem`

S/Deivce/

> +
> +Here introduces new `xen,static_mem` node to define static memory nodes for
> +one specific domain.
> +
> +For domains on static allocation, users need to pre-define guest RAM regions in
> +configuration, through `xen,static_mem` node under approriate `domUx` node.
> +
> +Here is one example:
> +
> +
> +        domU1 {
> +            compatible = "xen,domain";
> +            #address-cells = <0x2>;
> +            #size-cells = <0x2>;
> +            cpus = <2>;
> +            xen,static-mem = <0x0 0xa0000000 0x0 0x20000000>;
> +            ...
> +        };
> +
> +RAM at 0xa0000000 of 512 MB are static memory reserved for domU1 as its RAM.
> +
> +### New Page Flag: `PGC_reserved`
> +
> +In order to differentiate and manage pages reserved as static memory with
> +those which are allocated from heap allocator for normal domains, we shall
> +introduce a new page flag `PGC_reserved` to tell.
> +
> +Grant pages `PGC_reserved` when initializing static memory.
> +
> +### New linked page list: `reserved_page_list` in  `struct domain`
> +
> +Right now, for normal domains, on assigning pages to domain, pages allocated
> +from heap allocator as guest RAM shall be inserted to one linked page
> +list `page_list` for later managing and storing.
> +
> +So in order to tell, pages allocated from static memory, shall be inserted
> +to a different linked page list `reserved_page_list`.

You already have the flag ``PGC_reserved`` to indicate whether the 
memory is reserved or not. So why do you also need to link list it?

> +
> +Later, when domain get destroyed and memory relinquished, only pages in
> +`page_list` go back to heap, and pages in `reserved_page_list` shall not.

While going through the series, I could not find any code implementing 
this. However, this is not enough to prevent a page to go to the heap 
allocator because a domain can release memory at runtime using 
hypercalls like XENMEM_remove_from_physmap.

One of the use case is when the guest decides to balloon out some 
memory. This will call free_domheap_pages().

Effectively, you are treating static memory as domheap pages. So I think 
it would be better if you hook in free_domheap_pages() to decide which 
allocator is used.

Now, if a guest can balloon out memory, it can also balloon in memory. 
There are two cases:
    1) The region used to be RAM region statically allocated
    2) The region used to be unallocated.

I think for 1), we need to be able to re-use the page previously. For 
2), it is not clear to me whether a guest with memory statically 
allocated should be allowed to allocate "dynamic" pages.

> +### Memory Allocation for Domains on Static Allocation
> +
> +RAM regions pre-defined as static memory for one specifc domain shall be parsed
> +and reserved from the beginning. And they shall never go to any memory
> +allocator for any use.

Technically, you are introducing a new allocator. So do you mean they 
should not be given to neither the buddy allocator nor the bot allocator?

> +
> +Later when allocating static memory for this specific domain, after acquiring
> +those reserved regions, users need to a do set of verification before
> +assigning.
> +For each page there, it at least includes the following steps:
> +1. Check if it is in free state and has zero reference count.
> +2. Check if the page is reserved(`PGC_reserved`).
> +
> +Then, assigning these pages to this specific domain, and all pages go to one
> +new linked page list `reserved_page_list`.
> +
> +At last, set up guest P2M mapping. By default, it shall be mapped to the fixed
> +guest RAM address `GUEST_RAM0_BASE`, `GUEST_RAM1_BASE`, just like normal
> +domains. But later in 1:1 direct-map design, if `direct-map` is set, the guest
> +physical address will equal to physical address.
> +
> +### Static Allocation for Xen itself
> +
> +### New Deivce Tree Node: `xen,reserved_heap`

s/Deivce/Device/

> +
> +Static memory for Xen heap refers to parts of RAM reserved in the beginning
> +for Xen heap only. The memory is pre-defined through XEN configuration
> +using physical address ranges.
> +
> +The reserved memory for Xen heap is an optional feature and can be enabled
> +by adding a device tree property in the `chosen` node. Currently, this feature
> +is only supported on AArch64.
> +
> +Here is one example:
> +
> +
> +        chosen {
> +            xen,reserved-heap = <0x0 0x30000000 0x0 0x40000000>;
> +            ...
> +        };
> +
> +RAM at 0x30000000 of 1G size will be reserved as heap memory. Later, heap
> +allocator will allocate memory only from this specific region.

This section is quite confusing. I think we need to clearly 
differentiate heap vs allocator.

In Xen we have two heaps:
    1) Xen heap: It is always mapped in Xen virtual address space. This 
is mainly used for xen internal allocation.
    2) Domain heap: It may not always be mapped in Xen virtual address 
space. This is mainly used for domain memory and mapped on-demand.

For Arm64 (and x86), two heaps are allocated from the same region. But 
on Arm32, they are different.

We also have two allocator:
    1) Boot allocator: This is used during boot only. There is no 
concept of heap at this time.
    2) Buddy allocator: This is the current runtime allocator. This can 
either allocator from either heap.

AFAICT, this design is introducing a 3rd allocator that will return 
domain heap pages.

Now, back to this section, are you saying you will separate the two 
heaps and force the buddy allocator to allocate xen heap pages from a 
specific region?

[...]

> +### Memory Allocation for 1:1 direct-map Domain
> +
> +Implementing memory allocation for 1:1 direct-map domain includes two parts:
> +Static Allocation for Domain and 1:1 direct-map.
> +
> +The first part has been elaborated before in chapter `Memory Allocation for
> +Domains on Static Allocation`. Then, to ensure 1:1 direct-map, when setting up
> +guest P2M mapping, it needs to make sure that guest physical address equal to
> +physical address(`gfn == mfn`).
> +
> +*DISCUSSION:
> +
> +  * Here only supports booting up one domain on static allocation or on 1:1
> +direct-map through device tree, is `xl` also needed?

I think they can be separated for now.

Cheers,

-- 
Julien Grall

