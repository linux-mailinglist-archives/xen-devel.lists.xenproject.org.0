Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E6776533E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 14:07:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571057.893982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOzmQ-00007B-F6; Thu, 27 Jul 2023 12:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571057.893982; Thu, 27 Jul 2023 12:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOzmQ-0008Vt-Bk; Thu, 27 Jul 2023 12:07:42 +0000
Received: by outflank-mailman (input) for mailman id 571057;
 Thu, 27 Jul 2023 12:07:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C0z/=DN=huaweicloud.com=petrtesarik@srs-se1.protection.inumbo.net>)
 id 1qOzmO-0007nh-AK
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 12:07:40 +0000
Received: from frasgout11.his.huawei.com (unknown [14.137.139.23])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cdb9d17-2c76-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 14:07:37 +0200 (CEST)
Received: from mail02.huawei.com (unknown [172.18.147.229])
 by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4RBTkP0885z9v7gP
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 19:56:13 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.81.209.69])
 by APP2 (Coremail) with SMTP id GxC2BwBnGkGaXcJkfMYUBQ--.33878S5;
 Thu, 27 Jul 2023 13:06:59 +0100 (CET)
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
X-Inumbo-ID: 2cdb9d17-2c76-11ee-b247-6b7b168915f2
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
Subject: [PATCH v6 3/9] swiotlb: add documentation and rename swiotlb_do_find_slots()
Date: Thu, 27 Jul 2023 14:05:31 +0200
Message-Id: <2398ad9c61fd686d99d4d7077d8755e19e54b6eb.1690459412.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1690459412.git.petr.tesarik.ext@huawei.com>
References: <cover.1690459412.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:GxC2BwBnGkGaXcJkfMYUBQ--.33878S5
X-Coremail-Antispam: 1UD129KBjvJXoW3GrWfGF4UuFy8tF1xZF1kKrg_yoW7ur4rpF
	4rt3Z8tFs8Jr1xC39Fkw48uF1S9w4kK347uFWavryF9rnrJr9agFyktrW5XFyrJFW8uF4U
	Ja4avr48Gr43Xr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxkF7I0En4kS14v26r1q6r43MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0E
	wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcV
	CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIE
	c7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU8YFADUUUU
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected

From: Petr Tesarik <petr.tesarik.ext@huawei.com>

Add some kernel-doc comments and move the existing documentation of struct
io_tlb_slot to its correct location. The latter was forgotten in commit
942a8186eb445 ("swiotlb: move struct io_tlb_slot to swiotlb.c").

Use the opportunity to give swiotlb_do_find_slots() a more descriptive name
and make it clear how it differs from swiotlb_find_slots().

Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
---
 include/linux/swiotlb.h | 15 +++++++---
 kernel/dma/swiotlb.c    | 61 +++++++++++++++++++++++++++++++++++++----
 2 files changed, 66 insertions(+), 10 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 2d453b3e7771..31625ae507ea 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -76,10 +76,6 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
  * @nslabs:	The number of IO TLB blocks (in groups of 64) between @start and
  *		@end. For default swiotlb, this is command line adjustable via
  *		setup_io_tlb_npages.
- * @list:	The free list describing the number of free entries available
- *		from each index.
- * @orig_addr:	The original address corresponding to a mapped entry.
- * @alloc_size:	Size of the allocated buffer.
  * @debugfs:	The dentry to debugfs.
  * @late_alloc:	%true if allocated using the page allocator
  * @force_bounce: %true if swiotlb bouncing is forced
@@ -111,6 +107,17 @@ struct io_tlb_mem {
 #endif
 };
 
+/**
+ * is_swiotlb_buffer() - check if a physical address belongs to a swiotlb
+ * @dev:        Device which has mapped the buffer.
+ * @paddr:      Physical address within the DMA buffer.
+ *
+ * Check if @paddr points into a bounce buffer.
+ *
+ * Return:
+ * * %true if @paddr points into a bounce buffer
+ * * %false otherwise
+ */
 static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 {
 	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 0b173303e088..ef5d5e41a17f 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -62,6 +62,13 @@
 
 #define INVALID_PHYS_ADDR (~(phys_addr_t)0)
 
+/**
+ * struct io_tlb_slot - IO TLB slot descriptor
+ * @orig_addr:	The original address corresponding to a mapped entry.
+ * @alloc_size:	Size of the allocated buffer.
+ * @list:	The free list describing the number of free entries available
+ *		from each index.
+ */
 struct io_tlb_slot {
 	phys_addr_t orig_addr;
 	size_t alloc_size;
@@ -635,11 +642,22 @@ static void dec_used(struct io_tlb_mem *mem, unsigned int nslots)
 }
 #endif /* CONFIG_DEBUG_FS */
 
-/*
- * Find a suitable number of IO TLB entries size that will fit this request and
- * allocate a buffer from that IO TLB pool.
+/**
+ * swiotlb_area_find_slots() - search for slots in one IO TLB memory area
+ * @dev:	Device which maps the buffer.
+ * @area_index:	Index of the IO TLB memory area to be searched.
+ * @orig_addr:	Original (non-bounced) IO buffer address.
+ * @alloc_size: Total requested size of the bounce buffer,
+ *		including initial alignment padding.
+ * @alloc_align_mask:	Required alignment of the allocated buffer.
+ *
+ * Find a suitable sequence of IO TLB entries for the request and allocate
+ * a buffer from the given IO TLB memory area.
+ * This function takes care of locking.
+ *
+ * Return: Index of the first allocated slot, or -1 on error.
  */
-static int swiotlb_do_find_slots(struct device *dev, int area_index,
+static int swiotlb_area_find_slots(struct device *dev, int area_index,
 		phys_addr_t orig_addr, size_t alloc_size,
 		unsigned int alloc_align_mask)
 {
@@ -734,6 +752,19 @@ static int swiotlb_do_find_slots(struct device *dev, int area_index,
 	return slot_index;
 }
 
+/**
+ * swiotlb_find_slots() - search for slots in the whole swiotlb
+ * @dev:	Device which maps the buffer.
+ * @orig_addr:	Original (non-bounced) IO buffer address.
+ * @alloc_size: Total requested size of the bounce buffer,
+ *		including initial alignment padding.
+ * @alloc_align_mask:	Required alignment of the allocated buffer.
+ *
+ * Search through the whole software IO TLB to find a sequence of slots that
+ * match the allocation constraints.
+ *
+ * Return: Index of the first allocated slot, or -1 on error.
+ */
 static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
 		size_t alloc_size, unsigned int alloc_align_mask)
 {
@@ -742,8 +773,8 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
 	int i = start, index;
 
 	do {
-		index = swiotlb_do_find_slots(dev, i, orig_addr, alloc_size,
-					      alloc_align_mask);
+		index = swiotlb_area_find_slots(dev, i, orig_addr, alloc_size,
+						alloc_align_mask);
 		if (index >= 0)
 			return index;
 		if (++i >= mem->nareas)
@@ -755,6 +786,15 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
 
 #ifdef CONFIG_DEBUG_FS
 
+/**
+ * mem_used() - get number of used slots in an allocator
+ * @mem:	Software IO TLB allocator.
+ *
+ * The result is accurate in this version of the function, because an atomic
+ * counter is available if CONFIG_DEBUG_FS is set.
+ *
+ * Return: Number of used slots.
+ */
 static unsigned long mem_used(struct io_tlb_mem *mem)
 {
 	return atomic_long_read(&mem->total_used);
@@ -762,6 +802,15 @@ static unsigned long mem_used(struct io_tlb_mem *mem)
 
 #else /* !CONFIG_DEBUG_FS */
 
+/**
+ * mem_used() - get number of used slots in an allocator
+ * @mem:	Software IO TLB allocator.
+ *
+ * The result is not accurate, because there is no locking of individual
+ * areas.
+ *
+ * Return: Approximate number of used slots.
+ */
 static unsigned long mem_used(struct io_tlb_mem *mem)
 {
 	int i;
-- 
2.25.1


