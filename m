Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB093872CC
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 09:04:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128869.241887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litlw-0000pw-3j; Tue, 18 May 2021 07:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128869.241887; Tue, 18 May 2021 07:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1litlv-0000o4-VT; Tue, 18 May 2021 07:04:07 +0000
Received: by outflank-mailman (input) for mailman id 128869;
 Tue, 18 May 2021 07:04:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1litlu-0000nC-Bf
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 07:04:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 854eedd6-6e71-4544-b6b1-298f24d9f509;
 Tue, 18 May 2021 07:04:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E6E3B0B7;
 Tue, 18 May 2021 07:04:04 +0000 (UTC)
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
X-Inumbo-ID: 854eedd6-6e71-4544-b6b1-298f24d9f509
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621321444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Eu+F6rHuFh5vngwMexR1YiB/bks/cxL5wk3e4UM5iw=;
	b=mOl9PR8cW22dB/qZUM8NAVsF7alJl7Cq+XCE9HlC2tfq6vWSqJWOGu4LM6ERln3Xyn1wE3
	yCAa2MAYkBFmjkHQqKSh4QxPKQtItBQZd2KPa+3ceeUnrlPoT37V9sSscNkqHxJ4NPKh9R
	QwD2+i3pJqbXDIw6c4RHr27Gk3hCmSs=
Subject: Re: [PATCH] Xen: Design doc for 1:1 direct-map and static allocation
To: Penny Zheng <penny.zheng@arm.com>
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org
References: <20210518050738.163156-1-penny.zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <afce8ae7-8079-c73c-3eab-bc67a37fdf8e@suse.com>
Date: Tue, 18 May 2021 09:04:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518050738.163156-1-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.05.2021 07:07, Penny Zheng wrote:
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

This isn't a reason for fully static partitioning. Such devices also exist
in the x86 world, without there having been a need to statically partition
systems. All you want to guarantee is that for I/O purposes a domain has
_some_ memory in the accessible range.

> +Limitations:
> +  * There is no consideration for PV devices at the moment.

How would PV devices be affected? Drivers better would use grant
transfers, but that's about it afaics.

> +## Design on Static Allocation
> +
> +Static allocation refers to system or sub-system(domains) for which memory
> +areas are pre-defined by configuration using physical address ranges.
> +
> +These pre-defined memory, -- Static Momery, as parts of RAM reserved in the
> +beginning, shall never go to heap allocator or boot allocator for any use.
> +
> +### Static Allocation for Domains
> +
> +### New Deivce Tree Node: `xen,static_mem`
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

This contradicts you saying higher up "shall never go to heap allocator
or boot allocator for any use" - no such flag ought to be needed of the
allocators never get to see these pages. And even if such a flag was
needed, I can't see how it would be sufficient to express the page ->
domain relationship.

> +Grant pages `PGC_reserved` when initializing static memory.

I'm afraid I don't understand this sentence at all.

> +### New linked page list: `reserved_page_list` in  `struct domain`
> +
> +Right now, for normal domains, on assigning pages to domain, pages allocated
> +from heap allocator as guest RAM shall be inserted to one linked page
> +list `page_list` for later managing and storing.
> +
> +So in order to tell, pages allocated from static memory, shall be inserted
> +to a different linked page list `reserved_page_list`.
> +
> +Later, when domain get destroyed and memory relinquished, only pages in
> +`page_list` go back to heap, and pages in `reserved_page_list` shall not.

If such a domain can be destroyed (and re-created), how would the
association between memory and intended owner be retained / propagated?
Where else would the pages from reserved_page_list go (they need to go
somewhere, as the struct domain instance will go away)?

> +### Memory Allocation for Domains on Static Allocation
> +
> +RAM regions pre-defined as static memory for one specifc domain shall be parsed
> +and reserved from the beginning. And they shall never go to any memory
> +allocator for any use.
> +
> +Later when allocating static memory for this specific domain, after acquiring
> +those reserved regions, users need to a do set of verification before
> +assigning.
> +For each page there, it at least includes the following steps:
> +1. Check if it is in free state and has zero reference count.
> +2. Check if the page is reserved(`PGC_reserved`).

If this memory is reserved for a specific domain, why is such verification
necessary?

> +Then, assigning these pages to this specific domain, and all pages go to one
> +new linked page list `reserved_page_list`.
> +
> +At last, set up guest P2M mapping. By default, it shall be mapped to the fixed
> +guest RAM address `GUEST_RAM0_BASE`, `GUEST_RAM1_BASE`, just like normal
> +domains. But later in 1:1 direct-map design, if `direct-map` is set, the guest
> +physical address will equal to physical address.

I think you're missing "host" ahead of the 2nd "physical address"?

> +### Static Allocation for Xen itself
> +
> +### New Deivce Tree Node: `xen,reserved_heap`
> +
> +Static memory for Xen heap refers to parts of RAM reserved in the beginning
> +for Xen heap only. The memory is pre-defined through XEN configuration
> +using physical address ranges.
> +
> +The reserved memory for Xen heap is an optional feature and can be enabled
> +by adding a device tree property in the `chosen` node. Currently, this feature
> +is only supported on AArch64.

The earlier "Cases where needs static allocation" doesn't really seem to
cover any case where this would be needed for Xen itself. Without a need,
I don't see the point of having the feature.

> +## Background
> +
> +Cases where domU needs 1:1 direct-map memory map:
> +
> +  * IOMMU not present in the system.
> +  * IOMMU disabled if it doesn't cover a specific device and all the guests
> +are trusted. Thinking a mixed scenario, where a few devices with IOMMU and
> +a few without, then guest DMA security still could not be totally guaranteed.
> +So users may want to disable the IOMMU, to at least gain some performance
> +improvement from IOMMU disabled.
> +  * IOMMU disabled as a workaround when it doesn't have enough bandwidth.
> +To be specific, in a few extreme situation, when multiple devices do DMA
> +concurrently, these requests may exceed IOMMU's transmission capacity.
> +  * IOMMU disabled when it adds too much latency on DMA. For example,
> +TLB may be missing in some IOMMU hardware, which may bring latency in DMA
> +progress, so users may want to disable it in some realtime scenario.
> +
> +*WARNING:
> +Users should be aware that it is not always secure to assign a device without
> +IOMMU/SMMU protection.
> +When the device is not protected by the IOMMU/SMMU, the administrator should
> +make sure that:
> + 1. The device is assigned to a trusted guest.
> + 2. Users have additional security mechanism on the platform.
> +
> +Limitations:
> +  * There is no consideration for PV devices at the moment.

Again I'm struggling to see how PV devices might be impacted.

Jan

