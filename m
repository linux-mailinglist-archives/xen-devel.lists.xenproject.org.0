Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B40676A90E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 08:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573682.898625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQirV-0004hh-Pw; Tue, 01 Aug 2023 06:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573682.898625; Tue, 01 Aug 2023 06:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQirV-0004fB-Mg; Tue, 01 Aug 2023 06:28:05 +0000
Received: by outflank-mailman (input) for mailman id 573682;
 Tue, 01 Aug 2023 06:28:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jaq7=DS=huaweicloud.com=petrtesarik@srs-se1.protection.inumbo.net>)
 id 1qQirU-0004Ye-Sp
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 06:28:04 +0000
Received: from frasgout12.his.huawei.com (unknown [14.137.139.154])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9213a86c-3034-11ee-b258-6b7b168915f2;
 Tue, 01 Aug 2023 08:28:04 +0200 (CEST)
Received: from mail02.huawei.com (unknown [172.18.147.228])
 by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4RFPvw0y0nz9xGWm
 for <xen-devel@lists.xenproject.org>; Tue,  1 Aug 2023 14:14:36 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.81.220.249])
 by APP1 (Coremail) with SMTP id LxC2BwCHOroapchkgAwYAA--.27948S11;
 Tue, 01 Aug 2023 07:27:25 +0100 (CET)
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
X-Inumbo-ID: 9213a86c-3034-11ee-b258-6b7b168915f2
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
Subject: [PATCH v7 9/9] swiotlb: search the software IO TLB only if the device makes use of it
Date: Tue,  1 Aug 2023 08:24:04 +0200
Message-Id: <adea71bd1fa8660d4c3157a562431ad8127016d4.1690871004.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1690871004.git.petr.tesarik.ext@huawei.com>
References: <cover.1690871004.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:LxC2BwCHOroapchkgAwYAA--.27948S11
X-Coremail-Antispam: 1UD129KBjvJXoWxZF15Ww18ZF1fWr1UtFW7XFb_yoWrXFy3pF
	98AFZ8KayqqryxCryxCF18uF1agw4vk3yfurWagrnYkr1DJwnYqF1DKrWav3s5Ar4xZF43
	tryj9wsYkr17Xr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQv14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j6r
	xdM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0
	owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij
	64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWlIxAIcV
	CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Cr1j6rxdYxBIdaVFxhVjvjDU0xZFpf9x0JU2XdbUUUUU=
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected

From: Petr Tesarik <petr.tesarik.ext@huawei.com>

Skip searching the software IO TLB if a device has never used it, making
sure these devices are not affected by the introduction of multiple IO TLB
memory pools.

Additional memory barrier is required to ensure that the new value of the
flag is visible to other CPUs after mapping a new bounce buffer. For
efficiency, the flag check should be inlined, and then the memory barrier
must be moved to is_swiotlb_buffer(). However, it can replace the existing
barrier in swiotlb_find_pool(), because all callers use is_swiotlb_buffer()
first to verify that the buffer address belongs to the software IO TLB.

Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
---
 include/linux/device.h  |  2 ++
 include/linux/swiotlb.h |  7 ++++++-
 kernel/dma/swiotlb.c    | 14 ++++++--------
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 5fd89c9d005c..6fc808d22bfd 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -628,6 +628,7 @@ struct device_physical_location {
  * @dma_io_tlb_mem: Software IO TLB allocator.  Not for driver use.
  * @dma_io_tlb_pools:	List of transient swiotlb memory pools.
  * @dma_io_tlb_lock:	Protects changes to the list of active pools.
+ * @dma_uses_io_tlb: %true if device has used the software IO TLB.
  * @archdata:	For arch-specific additions.
  * @of_node:	Associated device tree node.
  * @fwnode:	Associated device node supplied by platform firmware.
@@ -737,6 +738,7 @@ struct device {
 #ifdef CONFIG_SWIOTLB_DYNAMIC
 	struct list_head dma_io_tlb_pools;
 	spinlock_t dma_io_tlb_lock;
+	bool dma_uses_io_tlb;
 #endif
 	/* arch specific additions */
 	struct dev_archdata	archdata;
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 8371c92a0271..b4536626f8ff 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -172,8 +172,13 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 	if (!mem)
 		return false;
 
-	if (IS_ENABLED(CONFIG_SWIOTLB_DYNAMIC))
+	if (IS_ENABLED(CONFIG_SWIOTLB_DYNAMIC)) {
+		/* Pairs with smp_wmb() in swiotlb_find_slots() and
+		 * swiotlb_dyn_alloc(), which modify the RCU lists.
+		 */
+		smp_rmb();
 		return swiotlb_find_pool(dev, paddr);
+	}
 	return paddr >= mem->defpool.start && paddr < mem->defpool.end;
 }
 
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index adf80dec42d7..d7eac84f975b 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -730,7 +730,7 @@ static void swiotlb_dyn_alloc(struct work_struct *work)
 
 	add_mem_pool(mem, pool);
 
-	/* Pairs with smp_rmb() in swiotlb_find_pool(). */
+	/* Pairs with smp_rmb() in is_swiotlb_buffer(). */
 	smp_wmb();
 }
 
@@ -764,11 +764,6 @@ struct io_tlb_pool *swiotlb_find_pool(struct device *dev, phys_addr_t paddr)
 	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	struct io_tlb_pool *pool;
 
-	/* Pairs with smp_wmb() in swiotlb_find_slots() and
-	 * swiotlb_dyn_alloc(), which modify the RCU lists.
-	 */
-	smp_rmb();
-
 	rcu_read_lock();
 	list_for_each_entry_rcu(pool, &mem->pools, node) {
 		if (paddr >= pool->start && paddr < pool->end)
@@ -813,6 +808,7 @@ void swiotlb_dev_init(struct device *dev)
 #ifdef CONFIG_SWIOTLB_DYNAMIC
 	INIT_LIST_HEAD(&dev->dma_io_tlb_pools);
 	spin_lock_init(&dev->dma_io_tlb_lock);
+	dev->dma_uses_io_tlb = false;
 #endif
 }
 
@@ -1157,9 +1153,11 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
 	list_add_rcu(&pool->node, &dev->dma_io_tlb_pools);
 	spin_unlock_irqrestore(&dev->dma_io_tlb_lock, flags);
 
-	/* Pairs with smp_rmb() in swiotlb_find_pool(). */
-	smp_wmb();
 found:
+	dev->dma_uses_io_tlb = true;
+	/* Pairs with smp_rmb() in is_swiotlb_buffer() */
+	smp_wmb();
+
 	*retpool = pool;
 	return index;
 }
-- 
2.25.1


