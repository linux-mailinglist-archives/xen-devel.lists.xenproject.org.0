Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037E676A944
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 08:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573698.898645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQj0W-0006r1-03; Tue, 01 Aug 2023 06:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573698.898645; Tue, 01 Aug 2023 06:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQj0V-0006pD-Qs; Tue, 01 Aug 2023 06:37:23 +0000
Received: by outflank-mailman (input) for mailman id 573698;
 Tue, 01 Aug 2023 06:37:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jaq7=DS=huaweicloud.com=petrtesarik@srs-se1.protection.inumbo.net>)
 id 1qQiqz-00011l-B4
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 06:27:33 +0000
Received: from frasgout12.his.huawei.com (unknown [14.137.139.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d028bae-3034-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 08:27:30 +0200 (CEST)
Received: from mail02.huawei.com (unknown [172.18.147.227])
 by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4RFPvD5k2mz9ttD0
 for <xen-devel@lists.xenproject.org>; Tue,  1 Aug 2023 14:14:00 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.81.220.249])
 by APP1 (Coremail) with SMTP id LxC2BwCHOroapchkgAwYAA--.27948S9;
 Tue, 01 Aug 2023 07:26:50 +0100 (CET)
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
X-Inumbo-ID: 7d028bae-3034-11ee-8613-37d641c3527e
From: Petr Tesarik <petrtesarik@huaweicloud.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Christoph Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Petr Tesarik <petr.tesarik.ext@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	James Seo <james@equiv.tech>,
	James Clark <james.clark@arm.com>,
	Kees Cook <keescook@chromium.org>,
	xen-devel@lists.xenproject.org (moderated list:XEN HYPERVISOR ARM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	iommu@lists.linux.dev (open list:XEN SWIOTLB SUBSYSTEM),
	linux-mm@kvack.org (open list:SLAB ALLOCATOR)
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>,
	petr@tesarici.cz
Subject: [PATCH v7 7/9] swiotlb: determine potential physical address limit
Date: Tue,  1 Aug 2023 08:24:02 +0200
Message-Id: <ae33edc0be30182067d33a6e4fb20889b2db10b1.1690871004.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1690871004.git.petr.tesarik.ext@huawei.com>
References: <cover.1690871004.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:LxC2BwCHOroapchkgAwYAA--.27948S9
X-Coremail-Antispam: 1UD129KBjvJXoWxXw4fJr4xAF4rZr4UWr4kWFg_yoW5AF4DpF
	y8Jr4FgFsFqF17ArWxCw1IyFn5Ga10k3y29rW5urnxZr17Ww13WrsrKr45trySqF4IgF4f
	uFyxua4Y9F42v37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
	Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
	IIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
	Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
	xan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY
	0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
	0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF
	0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIx
	AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU8fHUDUUUU
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected

From: Petr Tesarik <petr.tesarik.ext@huawei.com>

The value returned by default_swiotlb_limit() should be constant, because
it is used to decide whether DMA can be used. To allow allocating memory
pools on the fly, use the maximum possible physical address rather than the
highest address used by the default pool.

For swiotlb_init_remap(), this is either an arch-specific limit used by
memblock_alloc_low(), or the highest directly mapped physical address if
the initialization flags include SWIOTLB_ANY. For swiotlb_init_late(), the
highest address is determined by the GFP flags.

Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
---
 include/linux/swiotlb.h |  2 ++
 kernel/dma/swiotlb.c    | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 66867d2188ba..9825fa14abe4 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -109,6 +109,7 @@ struct io_tlb_pool {
  * @force_bounce: %true if swiotlb bouncing is forced
  * @for_alloc:  %true if the pool is used for memory allocation
  * @can_grow:	%true if more pools can be allocated dynamically.
+ * @phys_limit:	Maximum allowed physical address.
  * @total_used:	The total number of slots in the pool that are currently used
  *		across all areas. Used only for calculating used_hiwater in
  *		debugfs.
@@ -123,6 +124,7 @@ struct io_tlb_mem {
 	bool for_alloc;
 #ifdef CONFIG_SWIOTLB_DYNAMIC
 	bool can_grow;
+	u64 phys_limit;
 #endif
 #ifdef CONFIG_DEBUG_FS
 	atomic_long_t total_used;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 30d0fcc3ccb9..0fa081defdbd 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -334,6 +334,10 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 #ifdef CONFIG_SWIOTLB_DYNAMIC
 	if (!remap)
 		io_tlb_default_mem.can_grow = true;
+	if (flags & SWIOTLB_ANY)
+		io_tlb_default_mem.phys_limit = virt_to_phys(high_memory - 1);
+	else
+		io_tlb_default_mem.phys_limit = ARCH_LOW_ADDRESS_LIMIT;
 #endif
 
 	if (!default_nareas)
@@ -409,6 +413,12 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 #ifdef CONFIG_SWIOTLB_DYNAMIC
 	if (!remap)
 		io_tlb_default_mem.can_grow = true;
+	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp_mask & __GFP_DMA))
+		io_tlb_default_mem.phys_limit = DMA_BIT_MASK(zone_dma_bits);
+	else if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp_mask & __GFP_DMA32))
+		io_tlb_default_mem.phys_limit = DMA_BIT_MASK(32);
+	else
+		io_tlb_default_mem.phys_limit = virt_to_phys(high_memory - 1);
 #endif
 
 	if (!default_nareas)
@@ -1397,7 +1407,11 @@ phys_addr_t default_swiotlb_base(void)
  */
 phys_addr_t default_swiotlb_limit(void)
 {
+#ifdef CONFIG_SWIOTLB_DYNAMIC
+	return io_tlb_default_mem.phys_limit;
+#else
 	return io_tlb_default_mem.defpool.end - 1;
+#endif
 }
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.25.1


