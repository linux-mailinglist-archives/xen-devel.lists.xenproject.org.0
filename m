Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA81B26205
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 12:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081241.1441392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umUyU-0005bu-M5; Thu, 14 Aug 2025 10:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081241.1441392; Thu, 14 Aug 2025 10:14:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umUyU-0005Yo-H4; Thu, 14 Aug 2025 10:14:22 +0000
Received: by outflank-mailman (input) for mailman id 1081241;
 Thu, 14 Aug 2025 10:14:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hncw=22=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1umUyT-0003F8-NL
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 10:14:21 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70a2561d-78f7-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 12:14:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B0AEE45FFC;
 Thu, 14 Aug 2025 10:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5592C4CEFC;
 Thu, 14 Aug 2025 10:14:17 +0000 (UTC)
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
X-Inumbo-ID: 70a2561d-78f7-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755166458;
	bh=we72YOP3RUYaEE6ejOmXbWl+ckHyZi8LIoo6/UPYld4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SmpX8PXuuxNsaz49Sv/BhvNODQ4TzMXqNubGzpKjR0dsA/JlegVIW7ZYpMP3neeXo
	 6ysow+joFGXbris2T1w1bPKLajBRqw5mhLds3i95hlC6XAjezXtulUZr+VABJIMJSB
	 yhFjt55CINSHs1xWT301t//Fwqm4P0mYOLiPWlay2oiADWpapVZRRShOUUaHscpQjR
	 5pWPQPUWCmWT7zKihbu48EPfLMT5IfO3LiRbfS9Hm//Sx73FEjHbqulbxA5564Lw33
	 eHtpUKmiASaPE+/oHNo1MnUXBlXVI6jC0cH/9L6mOtLxocU6cjNTRKKr/AIXiTa6VY
	 iPn1oycvVDCKw==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com,
	Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 08/16] kmsan: convert kmsan_handle_dma to use physical addresses
Date: Thu, 14 Aug 2025 13:13:26 +0300
Message-ID: <fb43d745ff8fd822622932f6eb813621b75b2499.1755153054.git.leon@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755153054.git.leon@kernel.org>
References: <cover.1755153054.git.leon@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

Convert the KMSAN DMA handling function from page-based to physical
address-based interface.

The refactoring renames kmsan_handle_dma() parameters from accepting
(struct page *page, size_t offset, size_t size) to (phys_addr_t phys,
size_t size). A PFN_VALID check is added to prevent KMSAN operations
on non-page memory, preventing from non struct page backed address,

As part of this change, support for highmem addresses is implemented
using kmap_local_page() to handle both lowmem and highmem regions
properly. All callers throughout the codebase are updated to use the
new phys_addr_t based interface.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/virtio/virtio_ring.c |  4 ++--
 include/linux/kmsan.h        | 12 +++++++-----
 kernel/dma/mapping.c         |  2 +-
 mm/kmsan/hooks.c             | 36 +++++++++++++++++++++++++++++-------
 tools/virtio/linux/kmsan.h   |  2 +-
 5 files changed, 40 insertions(+), 16 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index f5062061c408..c147145a6593 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -378,7 +378,7 @@ static int vring_map_one_sg(const struct vring_virtqueue *vq, struct scatterlist
 		 * is initialized by the hardware. Explicitly check/unpoison it
 		 * depending on the direction.
 		 */
-		kmsan_handle_dma(sg_page(sg), sg->offset, sg->length, direction);
+		kmsan_handle_dma(sg_phys(sg), sg->length, direction);
 		*addr = (dma_addr_t)sg_phys(sg);
 		return 0;
 	}
@@ -3157,7 +3157,7 @@ dma_addr_t virtqueue_dma_map_single_attrs(struct virtqueue *_vq, void *ptr,
 	struct vring_virtqueue *vq = to_vvq(_vq);
 
 	if (!vq->use_dma_api) {
-		kmsan_handle_dma(virt_to_page(ptr), offset_in_page(ptr), size, dir);
+		kmsan_handle_dma(virt_to_phys(ptr), size, dir);
 		return (dma_addr_t)virt_to_phys(ptr);
 	}
 
diff --git a/include/linux/kmsan.h b/include/linux/kmsan.h
index 2b1432cc16d5..6f27b9824ef7 100644
--- a/include/linux/kmsan.h
+++ b/include/linux/kmsan.h
@@ -182,8 +182,7 @@ void kmsan_iounmap_page_range(unsigned long start, unsigned long end);
 
 /**
  * kmsan_handle_dma() - Handle a DMA data transfer.
- * @page:   first page of the buffer.
- * @offset: offset of the buffer within the first page.
+ * @phys:   physical address of the buffer.
  * @size:   buffer size.
  * @dir:    one of possible dma_data_direction values.
  *
@@ -191,8 +190,11 @@ void kmsan_iounmap_page_range(unsigned long start, unsigned long end);
  * * checks the buffer, if it is copied to device;
  * * initializes the buffer, if it is copied from device;
  * * does both, if this is a DMA_BIDIRECTIONAL transfer.
+ *
+ * The function handles page lookup internally and supports both lowmem
+ * and highmem addresses.
  */
-void kmsan_handle_dma(struct page *page, size_t offset, size_t size,
+void kmsan_handle_dma(phys_addr_t phys, size_t size,
 		      enum dma_data_direction dir);
 
 /**
@@ -372,8 +374,8 @@ static inline void kmsan_iounmap_page_range(unsigned long start,
 {
 }
 
-static inline void kmsan_handle_dma(struct page *page, size_t offset,
-				    size_t size, enum dma_data_direction dir)
+static inline void kmsan_handle_dma(phys_addr_t phys, size_t size,
+				    enum dma_data_direction dir)
 {
 }
 
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 80481a873340..709405d46b2b 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -172,7 +172,7 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
 		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
 	else
 		addr = ops->map_page(dev, page, offset, size, dir, attrs);
-	kmsan_handle_dma(page, offset, size, dir);
+	kmsan_handle_dma(phys, size, dir);
 	trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
 	debug_dma_map_phys(dev, phys, size, dir, addr, attrs);
 
diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
index 97de3d6194f0..eab7912a3bf0 100644
--- a/mm/kmsan/hooks.c
+++ b/mm/kmsan/hooks.c
@@ -336,25 +336,48 @@ static void kmsan_handle_dma_page(const void *addr, size_t size,
 }
 
 /* Helper function to handle DMA data transfers. */
-void kmsan_handle_dma(struct page *page, size_t offset, size_t size,
+void kmsan_handle_dma(phys_addr_t phys, size_t size,
 		      enum dma_data_direction dir)
 {
 	u64 page_offset, to_go, addr;
+	struct page *page;
+	void *kaddr;
 
-	if (PageHighMem(page))
+	if (!pfn_valid(PHYS_PFN(phys)))
 		return;
-	addr = (u64)page_address(page) + offset;
+
+	page = phys_to_page(phys);
+	page_offset = offset_in_page(phys);
+
 	/*
 	 * The kernel may occasionally give us adjacent DMA pages not belonging
 	 * to the same allocation. Process them separately to avoid triggering
 	 * internal KMSAN checks.
 	 */
 	while (size > 0) {
-		page_offset = offset_in_page(addr);
 		to_go = min(PAGE_SIZE - page_offset, (u64)size);
+
+		if (PageHighMem(page))
+			/* Handle highmem pages using kmap */
+			kaddr = kmap_local_page(page);
+		else
+			/* Lowmem pages can be accessed directly */
+			kaddr = page_address(page);
+
+		addr = (u64)kaddr + page_offset;
 		kmsan_handle_dma_page((void *)addr, to_go, dir);
-		addr += to_go;
+
+		if (PageHighMem(page))
+			kunmap_local(page);
+
+		phys += to_go;
 		size -= to_go;
+
+		/* Move to next page if needed */
+		if (size > 0) {
+			page = phys_to_page(phys);
+			page_offset = offset_in_page(phys);
+		}
 	}
 }
 EXPORT_SYMBOL_GPL(kmsan_handle_dma);
@@ -366,8 +389,7 @@ void kmsan_handle_dma_sg(struct scatterlist *sg, int nents,
 	int i;
 
 	for_each_sg(sg, item, nents, i)
-		kmsan_handle_dma(sg_page(item), item->offset, item->length,
-				 dir);
+		kmsan_handle_dma(sg_phys(item), item->length, dir);
 }
 
 /* Functions from kmsan-checks.h follow. */
diff --git a/tools/virtio/linux/kmsan.h b/tools/virtio/linux/kmsan.h
index 272b5aa285d5..6cd2e3efd03d 100644
--- a/tools/virtio/linux/kmsan.h
+++ b/tools/virtio/linux/kmsan.h
@@ -4,7 +4,7 @@
 
 #include <linux/gfp.h>
 
-inline void kmsan_handle_dma(struct page *page, size_t offset, size_t size,
+inline void kmsan_handle_dma(phys_addr_t phys, size_t size,
 			     enum dma_data_direction dir)
 {
 }
-- 
2.50.1


