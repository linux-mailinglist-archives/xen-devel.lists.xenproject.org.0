Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD6E73F988
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 12:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555969.868217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE5Ug-0002BU-Qe; Tue, 27 Jun 2023 10:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555969.868217; Tue, 27 Jun 2023 10:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE5Ug-0001xm-HJ; Tue, 27 Jun 2023 10:00:18 +0000
Received: by outflank-mailman (input) for mailman id 555969;
 Tue, 27 Jun 2023 09:57:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X8So=CP=huaweicloud.com=petrtesarik@srs-se1.protection.inumbo.net>)
 id 1qE5Rr-00008W-OU
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 09:57:23 +0000
Received: from frasgout11.his.huawei.com (unknown [14.137.139.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02515b5f-14d1-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 11:57:21 +0200 (CEST)
Received: from mail02.huawei.com (unknown [172.18.147.228])
 by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4Qr0Gb1LKNz9v7Hc
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 17:46:31 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.45.153.185])
 by APP1 (Coremail) with SMTP id LxC2BwBnwdzesZpknnvHAw--.39096S9;
 Tue, 27 Jun 2023 10:56:53 +0100 (CET)
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
X-Inumbo-ID: 02515b5f-14d1-11ee-8611-37d641c3527e
From: Petr Tesarik <petrtesarik@huaweicloud.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
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
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kees Cook <keescook@chromium.org>,
	Saravana Kannan <saravanak@google.com>,
	xen-devel@lists.xenproject.org (moderated list:XEN HYPERVISOR ARM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	iommu@lists.linux.dev (open list:XEN SWIOTLB SUBSYSTEM)
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	petr@tesarici.cz
Subject: [PATCH v3 7/7] swiotlb: search the software IO TLB only if a device makes use of it
Date: Tue, 27 Jun 2023 11:54:29 +0200
Message-Id: <34b9a218e9a152dd53eb0d4b0a819c6de987c8c1.1687859323.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687859323.git.petr.tesarik.ext@huawei.com>
References: <cover.1687859323.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:LxC2BwBnwdzesZpknnvHAw--.39096S9
X-Coremail-Antispam: 1UD129KBjvJXoWxZF15Ww18ZF1fWr1UtFW7XFb_yoWrXF1DpF
	9xAFZ8KayDXr97Cr97CF4UZ3Wagw4vkw43CryagrnYkr1DJwnYqFyDKrWYv3s5Ar47ZFW7
	Xryj939Ykw17Xr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUml14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
	Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
	IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
	Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
	xan2IY04v7MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_
	Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
	JbIYCTnIWIevJa73UjIFyTuYvjfU1WlkDUUUU
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
 include/linux/swiotlb.h |  6 +++++-
 kernel/dma/swiotlb.c    | 14 ++++++--------
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index a1ee4c5924b8..d4b35925a6d1 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -512,6 +512,7 @@ struct device_physical_location {
  * @dma_io_tlb_mem: Software IO TLB allocator.  Not for driver use.
  * @dma_io_tlb_pools:	List of transient swiotlb memory pools.
  * @dma_io_tlb_lock:	Protects changes to the list of active pools.
+ * @dma_uses_io_tlb: %true if device has used the software IO TLB.
  * @archdata:	For arch-specific additions.
  * @of_node:	Associated device tree node.
  * @fwnode:	Associated device node supplied by platform firmware.
@@ -619,6 +620,7 @@ struct device {
 	struct io_tlb_mem *dma_io_tlb_mem;
 	struct list_head dma_io_tlb_pools;
 	spinlock_t dma_io_tlb_lock;
+	bool dma_uses_io_tlb;
 #endif
 	/* arch specific additions */
 	struct dev_archdata	archdata;
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index ae402890ba41..eb30b5c624f1 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -148,7 +148,11 @@ struct io_tlb_pool *swiotlb_find_pool(struct device *dev, phys_addr_t paddr);
  */
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
-	return dev->dma_io_tlb_mem &&
+	/* Pairs with smp_wmb() in swiotlb_find_slots() and
+	 * swiotlb_dyn_alloc(), which modify the RCU lists.
+	 */
+	smp_rmb();
+	return dev->dma_uses_io_tlb &&
 		!!swiotlb_find_pool(dev, paddr);
 }
 
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 7661a6402e80..26ab9ed2921b 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -701,7 +701,7 @@ static void swiotlb_dyn_alloc(struct work_struct *work)
 
 	add_mem_pool(mem, pool);
 
-	/* Pairs with smp_rmb() in swiotlb_find_pool(). */
+	/* Pairs with smp_rmb() in is_swiotlb_buffer(). */
 	smp_wmb();
 }
 
@@ -729,6 +729,7 @@ void swiotlb_dev_init(struct device *dev)
 	dev->dma_io_tlb_mem = &io_tlb_default_mem;
 	INIT_LIST_HEAD(&dev->dma_io_tlb_pools);
 	spin_lock_init(&dev->dma_io_tlb_lock);
+	dev->dma_uses_io_tlb = false;
 }
 
 /**
@@ -746,11 +747,6 @@ struct io_tlb_pool *swiotlb_find_pool(struct device *dev, phys_addr_t paddr)
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
@@ -1125,9 +1121,11 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
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


