Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 826FB76534C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 14:09:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571068.894022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOzo5-0002TF-JO; Thu, 27 Jul 2023 12:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571068.894022; Thu, 27 Jul 2023 12:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOzo5-0002RM-Ex; Thu, 27 Jul 2023 12:09:25 +0000
Received: by outflank-mailman (input) for mailman id 571068;
 Thu, 27 Jul 2023 12:09:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C0z/=DN=huaweicloud.com=petrtesarik@srs-se1.protection.inumbo.net>)
 id 1qOzo3-00023t-H0
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 12:09:23 +0000
Received: from frasgout11.his.huawei.com (unknown [14.137.139.23])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c3c8b49-2c76-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 14:09:23 +0200 (CEST)
Received: from mail02.huawei.com (unknown [172.18.147.228])
 by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4RBTmR36Jsz9v7gF
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 19:57:59 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.81.209.69])
 by APP2 (Coremail) with SMTP id GxC2BwBnGkGaXcJkfMYUBQ--.33878S11;
 Thu, 27 Jul 2023 13:08:45 +0100 (CET)
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
X-Inumbo-ID: 6c3c8b49-2c76-11ee-b247-6b7b168915f2
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
Subject: [PATCH v6 9/9] swiotlb: search the software IO TLB only if the device makes use of it
Date: Thu, 27 Jul 2023 14:05:37 +0200
Message-Id: <992c172baff5deac9aa3bbc76d999785d12fe995.1690459412.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1690459412.git.petr.tesarik.ext@huawei.com>
References: <cover.1690459412.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:GxC2BwBnGkGaXcJkfMYUBQ--.33878S11
X-Coremail-Antispam: 1UD129KBjvJXoWxZF15Ww18ZF1fWr1UtFW7XFb_yoWrXFy3pF
	98AFZ8KayqqryxGryxCF18uF1agw4vk3yfurWagrnYkr1DJwnaqF1DKrWav3s5Ar47ZF43
	tryj9wsYkr17Zr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_
	GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
	x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
	JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
	ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280
	aVCY1x0267AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VUUMKZtUUUUU==
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
index 1560a3e484b9..1fe64573d828 100644
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


