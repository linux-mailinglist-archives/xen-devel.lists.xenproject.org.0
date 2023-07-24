Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A6E75F5CF
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 14:15:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568841.888906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNuTB-0001HH-5Q; Mon, 24 Jul 2023 12:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568841.888906; Mon, 24 Jul 2023 12:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNuTB-0001Ep-1a; Mon, 24 Jul 2023 12:15:21 +0000
Received: by outflank-mailman (input) for mailman id 568841;
 Mon, 24 Jul 2023 12:15:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0CZD=DK=huaweicloud.com=petrtesarik@srs-se1.protection.inumbo.net>)
 id 1qNuT9-0000u4-KT
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:15:19 +0000
Received: from frasgout13.his.huawei.com (unknown [14.137.139.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c142bbb3-2a1b-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 14:15:19 +0200 (CEST)
Received: from mail02.huawei.com (unknown [172.18.147.228])
 by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4R8f2n1xB0z9yh9p
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 20:04:01 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.81.222.124])
 by APP2 (Coremail) with SMTP id GxC2BwA3_lTGar5ky0byBA--.27936S9;
 Mon, 24 Jul 2023 13:14:51 +0100 (CET)
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
X-Inumbo-ID: c142bbb3-2a1b-11ee-b23a-6b7b168915f2
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
	Jonathan Corbet <corbet@lwn.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Seo <james@equiv.tech>,
	James Clark <james.clark@arm.com>,
	Kees Cook <keescook@chromium.org>,
	xen-devel@lists.xenproject.org (moderated list:XEN HYPERVISOR ARM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	iommu@lists.linux.dev (open list:XEN SWIOTLB SUBSYSTEM)
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>,
	petr@tesarici.cz
Subject: [PATCH v5 7/9] swiotlb: determine potential physical address limit
Date: Mon, 24 Jul 2023 14:12:43 +0200
Message-Id: <0d4d789bf4d7caddb88c5690a82c66f146532a3e.1690200598.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1690200598.git.petr.tesarik.ext@huawei.com>
References: <cover.1690200598.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:GxC2BwA3_lTGar5ky0byBA--.27936S9
X-Coremail-Antispam: 1UD129KBjvJXoWxXw4fJr1kZrW7Cry5Cw4xtFb_yoW5AF4DpF
	y8Jr4FgFsFqF12yrWxCw1IyFn5Ga18CrW29rW5urnxZr17Ww13Wrs7Kr45trySqF4IgF4S
	9Fyxua4Y9FsFv37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUml14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
	Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
	IIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
	Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
	xan2IY04v7MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_
	Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
	JbIYCTnIWIevJa73UjIFyTuYvjfUnzVbDUUUU
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
index ad5bdf66ed7a..d5ce51657fac 100644
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
index 8672810f7c56..7e8edf011bba 100644
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
@@ -1390,7 +1400,11 @@ phys_addr_t default_swiotlb_base(void)
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


