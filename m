Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CC17526EE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 17:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563269.880425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJyEe-0006iQ-W0; Thu, 13 Jul 2023 15:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563269.880425; Thu, 13 Jul 2023 15:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJyEe-0006g8-SH; Thu, 13 Jul 2023 15:28:04 +0000
Received: by outflank-mailman (input) for mailman id 563269;
 Thu, 13 Jul 2023 15:28:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9mYz=C7=huaweicloud.com=petrtesarik@srs-se1.protection.inumbo.net>)
 id 1qJyCd-0003b5-2v
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 15:25:59 +0000
Received: from frasgout12.his.huawei.com (unknown [14.137.139.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ffcb9d9-2191-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 17:25:56 +0200 (CEST)
Received: from mail02.huawei.com (unknown [172.18.147.227])
 by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4R1ylx1ZZgz9xFqy
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jul 2023 23:13:01 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.81.218.161])
 by APP1 (Coremail) with SMTP id LxC2BwA3k94BF7BkxG6BBA--.7207S8;
 Thu, 13 Jul 2023 16:25:29 +0100 (CET)
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
X-Inumbo-ID: 8ffcb9d9-2191-11ee-8611-37d641c3527e
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
	iommu@lists.linux.dev (open list:XEN SWIOTLB SUBSYSTEM)
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	petr@tesarici.cz
Subject: [PATCH v4 6/8] swiotlb: determine potential physical address limit
Date: Thu, 13 Jul 2023 17:23:17 +0200
Message-Id: <ad39dc47041faa42f0307737a210cbd944e68c52.1689261692.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1689261692.git.petr.tesarik.ext@huawei.com>
References: <cover.1689261692.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:LxC2BwA3k94BF7BkxG6BBA--.7207S8
X-Coremail-Antispam: 1UD129KBjvJXoWxXw4fJr4fZFy7GF1UZrWDurg_yoW5Cry3pF
	y8A3WrKFsFqFnrCryxC3W7AFnaga18Cr47urW3ur15Zry3Ww1fKwsrKr45tr1FqF409F4I
	vFyFvayYvFsIvw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_
	GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
	x0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
	JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
	ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280
	aVCY1x0267AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VUjgAw3UUUUU==
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
 kernel/dma/swiotlb.c    | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index b642e7739604..ff8f5150f4de 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -105,6 +105,7 @@ struct io_tlb_pool {
  * struct io_tlb_mem - Software IO TLB allocator
  * @pool:	IO TLB memory pool descriptor.
  * @nslabs:	Total number of IO TLB slabs in all pools.
+ * @phys_limit:	Maximum allowed physical address.
  * @debugfs:	The dentry to debugfs.
  * @force_bounce: %true if swiotlb bouncing is forced
  * @for_alloc:  %true if the pool is used for memory allocation
@@ -118,6 +119,7 @@ struct io_tlb_pool {
 struct io_tlb_mem {
 	struct io_tlb_pool *pool;
 	unsigned long nslabs;
+	u64 phys_limit;
 	struct dentry *debugfs;
 	bool force_bounce;
 	bool for_alloc;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 6ec5a81acc2a..d6a05727efc5 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -334,6 +334,10 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 	io_tlb_default_mem.force_bounce =
 		swiotlb_force_bounce || (flags & SWIOTLB_FORCE);
 	io_tlb_default_mem.can_grow = !remap;
+	if (flags & SWIOTLB_ANY)
+		io_tlb_default_mem.phys_limit = virt_to_phys(high_memory - 1);
+	else
+		io_tlb_default_mem.phys_limit = ARCH_LOW_ADDRESS_LIMIT;
 
 	if (!default_nareas)
 		swiotlb_adjust_nareas(num_possible_cpus());
@@ -402,6 +406,12 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 
 	io_tlb_default_mem.force_bounce = swiotlb_force_bounce;
 	io_tlb_default_mem.can_grow = !remap;
+	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp_mask & __GFP_DMA))
+		io_tlb_default_mem.phys_limit = DMA_BIT_MASK(zone_dma_bits);
+	else if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp_mask & __GFP_DMA32))
+		io_tlb_default_mem.phys_limit = DMA_BIT_MASK(32);
+	else
+		io_tlb_default_mem.phys_limit = virt_to_phys(high_memory - 1);
 
 	if (!default_nareas)
 		swiotlb_adjust_nareas(num_possible_cpus());
@@ -1338,7 +1348,7 @@ phys_addr_t default_swiotlb_start(void)
  */
 phys_addr_t default_swiotlb_limit(void)
 {
-	return io_tlb_default_pool.end - 1;
+	return io_tlb_default_mem.phys_limit;
 }
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.25.1


