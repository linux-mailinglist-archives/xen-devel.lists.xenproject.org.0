Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E6B78D6B5
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 16:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593038.925934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMbw-0007eQ-HI; Wed, 30 Aug 2023 14:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593038.925934; Wed, 30 Aug 2023 14:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMbw-0007cL-Ef; Wed, 30 Aug 2023 14:56:00 +0000
Received: by outflank-mailman (input) for mailman id 593038;
 Wed, 30 Aug 2023 14:55:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3+3c=EP=lwn.net=corbet@srs-se1.protection.inumbo.net>)
 id 1qbMbu-0007cD-E9
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 14:55:58 +0000
Received: from ms.lwn.net (ms.lwn.net [2600:3c01:e000:3a1::42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50ed2dd2-4745-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 16:55:55 +0200 (CEST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id D64B2723;
 Wed, 30 Aug 2023 14:55:51 +0000 (UTC)
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
X-Inumbo-ID: 50ed2dd2-4745-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D64B2723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1693407352; bh=fzJ2W9IhY60MhTdZXk/DpUQem9Gos7AXFeOTf6bpkgk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ayp4wECHVmkq6o66QyWfc6SlfuEuvpm+WukmOx5EBL0WA3Tjchi2jo5kGRHspHxVA
	 SwNE0PV6W74pP1HvvyJCHB/HJYXdsaX4+4ZI0su0BVn6R+VI7Tnk+SxakXQgQrDYih
	 Z7CQyMXFkE4YJDU+Om1rR00QEfdnYIWD9fjVr+blRBhgj0LoCL3jNuzNRZhYpqW+p0
	 cYKX3nqF1lwrwueOku+7j0jjgfhYSo1zZyLEoQmRZNJ3O1yACrBNRDLLvh6G3bfTMY
	 WpF89u4BJ/ycMvRDSiVGQ/AAIYX143xN8fzRqY2GeLgAn1LjYuzkrTUAEkN4Pm5lw+
	 ttcU/ACVSPYKw==
From: Jonathan Corbet <corbet@lwn.net>
To: Petr Tesarik <petrtesarik@huaweicloud.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Russell King <linux@armlinux.org.uk>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "maintainer:X86
 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Juergen Gross <jgross@suse.com>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Christoph Hellwig
 <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
 <robin.murphy@arm.com>, Christoph Lameter <cl@linux.com>, Pekka Enberg
 <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim
 <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Roman Gushchin
 <roman.gushchin@linux.dev>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, Petr
 Tesarik <petr.tesarik.ext@huawei.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>,
 James Seo <james@equiv.tech>, James Clark <james.clark@arm.com>, Kees Cook
 <keescook@chromium.org>, "moderated list:XEN HYPERVISOR ARM"
 <xen-devel@lists.xenproject.org>, "moderated list:ARM PORT"
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:MIPS"
 <linux-mips@vger.kernel.org>, "open list:XEN SWIOTLB SUBSYSTEM"
 <iommu@lists.linux.dev>, "open list:SLAB ALLOCATOR" <linux-mm@kvack.org>
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>, petr@tesarici.cz
Subject: Re: [PATCH v7 9/9] swiotlb: search the software IO TLB only if the
 device makes use of it
In-Reply-To: <87a5uz3ob8.fsf@meer.lwn.net>
References: <cover.1690871004.git.petr.tesarik.ext@huawei.com>
 <adea71bd1fa8660d4c3157a562431ad8127016d4.1690871004.git.petr.tesarik.ext@huawei.com>
 <87a5uz3ob8.fsf@meer.lwn.net>
Date: Wed, 30 Aug 2023 08:55:51 -0600
Message-ID: <87il8wr348.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain

So it seems this code got merged without this question ever being
answered.  Sorry if it's a dumb one, but I don't think this
functionality works as advertised...

Thanks,

jon

Jonathan Corbet <corbet@lwn.net> writes:

> Petr Tesarik <petrtesarik@huaweicloud.com> writes:
>
>> From: Petr Tesarik <petr.tesarik.ext@huawei.com>
>>
>> Skip searching the software IO TLB if a device has never used it, making
>> sure these devices are not affected by the introduction of multiple IO TLB
>> memory pools.
>>
>> Additional memory barrier is required to ensure that the new value of the
>> flag is visible to other CPUs after mapping a new bounce buffer. For
>> efficiency, the flag check should be inlined, and then the memory barrier
>> must be moved to is_swiotlb_buffer(). However, it can replace the existing
>> barrier in swiotlb_find_pool(), because all callers use is_swiotlb_buffer()
>> first to verify that the buffer address belongs to the software IO TLB.
>>
>> Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
>> ---
>
> Excuse me if this is a silly question, but I'm not able to figure it out
> on my own...
>
>>  include/linux/device.h  |  2 ++
>>  include/linux/swiotlb.h |  7 ++++++-
>>  kernel/dma/swiotlb.c    | 14 ++++++--------
>>  3 files changed, 14 insertions(+), 9 deletions(-)
>>
>> diff --git a/include/linux/device.h b/include/linux/device.h
>> index 5fd89c9d005c..6fc808d22bfd 100644
>> --- a/include/linux/device.h
>> +++ b/include/linux/device.h
>> @@ -628,6 +628,7 @@ struct device_physical_location {
>>   * @dma_io_tlb_mem: Software IO TLB allocator.  Not for driver use.
>>   * @dma_io_tlb_pools:	List of transient swiotlb memory pools.
>>   * @dma_io_tlb_lock:	Protects changes to the list of active pools.
>> + * @dma_uses_io_tlb: %true if device has used the software IO TLB.
>>   * @archdata:	For arch-specific additions.
>>   * @of_node:	Associated device tree node.
>>   * @fwnode:	Associated device node supplied by platform firmware.
>> @@ -737,6 +738,7 @@ struct device {
>>  #ifdef CONFIG_SWIOTLB_DYNAMIC
>>  	struct list_head dma_io_tlb_pools;
>>  	spinlock_t dma_io_tlb_lock;
>> +	bool dma_uses_io_tlb;
>
> You add this new member here, fine...
>
>>  #endif
>>  	/* arch specific additions */
>>  	struct dev_archdata	archdata;
>> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
>> index 8371c92a0271..b4536626f8ff 100644
>> --- a/include/linux/swiotlb.h
>> +++ b/include/linux/swiotlb.h
>> @@ -172,8 +172,13 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
>>  	if (!mem)
>>  		return false;
>>  
>> -	if (IS_ENABLED(CONFIG_SWIOTLB_DYNAMIC))
>> +	if (IS_ENABLED(CONFIG_SWIOTLB_DYNAMIC)) {
>> +		/* Pairs with smp_wmb() in swiotlb_find_slots() and
>> +		 * swiotlb_dyn_alloc(), which modify the RCU lists.
>> +		 */
>> +		smp_rmb();
>>  		return swiotlb_find_pool(dev, paddr);
>> +	}
>>  	return paddr >= mem->defpool.start && paddr < mem->defpool.end;
>>  }
>>  
>> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
>> index adf80dec42d7..d7eac84f975b 100644
>> --- a/kernel/dma/swiotlb.c
>> +++ b/kernel/dma/swiotlb.c
>> @@ -730,7 +730,7 @@ static void swiotlb_dyn_alloc(struct work_struct *work)
>>  
>>  	add_mem_pool(mem, pool);
>>  
>> -	/* Pairs with smp_rmb() in swiotlb_find_pool(). */
>> +	/* Pairs with smp_rmb() in is_swiotlb_buffer(). */
>>  	smp_wmb();
>>  }
>>  
>> @@ -764,11 +764,6 @@ struct io_tlb_pool *swiotlb_find_pool(struct device *dev, phys_addr_t paddr)
>>  	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>>  	struct io_tlb_pool *pool;
>>  
>> -	/* Pairs with smp_wmb() in swiotlb_find_slots() and
>> -	 * swiotlb_dyn_alloc(), which modify the RCU lists.
>> -	 */
>> -	smp_rmb();
>> -
>>  	rcu_read_lock();
>>  	list_for_each_entry_rcu(pool, &mem->pools, node) {
>>  		if (paddr >= pool->start && paddr < pool->end)
>> @@ -813,6 +808,7 @@ void swiotlb_dev_init(struct device *dev)
>>  #ifdef CONFIG_SWIOTLB_DYNAMIC
>>  	INIT_LIST_HEAD(&dev->dma_io_tlb_pools);
>>  	spin_lock_init(&dev->dma_io_tlb_lock);
>> +	dev->dma_uses_io_tlb = false;
>
> ...here you initialize it, fine...
>
>>  #endif
>>  }
>>  
>> @@ -1157,9 +1153,11 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
>>  	list_add_rcu(&pool->node, &dev->dma_io_tlb_pools);
>>  	spin_unlock_irqrestore(&dev->dma_io_tlb_lock, flags);
>>  
>> -	/* Pairs with smp_rmb() in swiotlb_find_pool(). */
>> -	smp_wmb();
>>  found:
>> +	dev->dma_uses_io_tlb = true;
>> +	/* Pairs with smp_rmb() in is_swiotlb_buffer() */
>> +	smp_wmb();
>> +
>
> ...and here you set it if swiotlb is used.
>
> But, as far as I can tell, you don't actually *use* this field anywhere.
> What am I missing?
>
> Thanks,
>
> jon

