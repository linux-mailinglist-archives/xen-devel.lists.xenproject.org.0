Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC61089BEF2
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 14:27:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701719.1096566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rto69-0002Rc-GZ; Mon, 08 Apr 2024 12:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701719.1096566; Mon, 08 Apr 2024 12:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rto69-0002Mq-AT; Mon, 08 Apr 2024 12:27:41 +0000
Received: by outflank-mailman (input) for mailman id 701719;
 Mon, 08 Apr 2024 04:12:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KUbC=LN=gmail.com=mhkelley58@srs-se1.protection.inumbo.net>)
 id 1rtgMp-0002in-35
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 04:12:23 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fd0caf0-f55e-11ee-a1ef-f123f15fe8a2;
 Mon, 08 Apr 2024 06:12:18 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1e3c9300c65so17304465ad.0
 for <xen-devel@lists.xenproject.org>; Sun, 07 Apr 2024 21:12:18 -0700 (PDT)
Received: from localhost.localdomain (c-73-254-87-52.hsd1.wa.comcast.net.
 [73.254.87.52]) by smtp.gmail.com with ESMTPSA id
 u17-20020a17090341d100b001e3f0cde2desm2474666ple.253.2024.04.07.21.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 21:12:16 -0700 (PDT)
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
X-Inumbo-ID: 2fd0caf0-f55e-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712549536; x=1713154336; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GMSQhLrDPilrzUC346KcRMtXyNYWEOyJ6WX8+UinkkA=;
        b=GZ56xJMvfN8tT1iY+uZs22PjUNRYgnmsIeFqvfN5NGdSyMZpqhPTLdVYMw7f958ZpV
         oQbvvRVszZELZAE4U7vUL1UNrH2AOwL2eI/bCKSyUUL/9RBiJEm8O9xPyNpsVAAlts6W
         sDYnBL6Gp8U6RkZj332Ncrw5XCDxB5Gx6h5Gzj8ovuq267/476gUZVYzq49gfqzVndZC
         b21Zsi4xeXstriGNrz0cvBDdHCD9Xi7FeA5UWb6YRHGOvP4fmHyv0tMla+efk77PUUO5
         Jp/J4Wh4k3zDirxx1UHh41hQWWncEg0d8ror7WwTDRi4fdzzsv9+dFlGz5WmD+k9piFt
         A20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712549537; x=1713154337;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMSQhLrDPilrzUC346KcRMtXyNYWEOyJ6WX8+UinkkA=;
        b=uHsQkgCLaIHCVL6ApBcJdppD0PygUf1t/nqfLnMN5gmI6H/b/SZrXDRAXTeAj2Zhk+
         PWR6RKR4dv2oGiV4+HkIyupUI97cI2HTY/RGTn+vlYxkzLAkl28XgOnignfrSaa/srW8
         TotHSavRwuoDyhcbbIErEOWzdcU5Wo+rZp0F5jEy3XoCknpUNTqoMLIhyBseneYvpkQS
         t3l6Vvw284BedJ+UaCcXa7LReJzIagvabX52ln8uYJzG5naLzUeUd/Pt8BnFzwoyKm7I
         mlfMewFDKcoWAwAc9w4irycz1FSW9b7DeVG3rERa81qVcNY6ds5E2o3GFLq2U8sWCQy9
         oobQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu5jyXhLPckEJVfy45o2YiL5xsRemM8aMTkTfHu8Z+khH2wur+8ZJZskiCthQPE8gSZ7mFbhOyg3yNnC/neWe2hYPES+a4CRF86VqipSI=
X-Gm-Message-State: AOJu0Yy3ivqa01RHjvchvtrSTZn4t+S+xO+DUj3h25Vxgcxur2/VBP4b
	QCi2Gm6DIjWvniRQKoBARTHgQL0r/MSFJq+BDPkiM7/r93sJKmXt
X-Google-Smtp-Source: AGHT+IGJ2H/R5OdFFo2sWuPhTY0GzQYPe7tpoRBe4DrZ/4S9V3guChofxwL81b6WIsmX5otyZzTeOw==
X-Received: by 2002:a17:903:1ce:b0:1e4:4a3f:9a88 with SMTP id e14-20020a17090301ce00b001e44a3f9a88mr488986plh.46.1712549536492;
        Sun, 07 Apr 2024 21:12:16 -0700 (PDT)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: robin.murphy@arm.com,
	joro@8bytes.org,
	will@kernel.org,
	jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	hch@lst.de,
	m.szyprowski@samsung.com,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: petr@tesarici.cz,
	roberto.sassu@huaweicloud.com
Subject: [PATCH 1/2] swiotlb: Remove alloc_size argument to swiotlb_tbl_map_single()
Date: Sun,  7 Apr 2024 21:11:41 -0700
Message-Id: <20240408041142.665563-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Kelley <mhklinux@outlook.com>

Currently swiotlb_tbl_map_single() takes alloc_align_mask and
alloc_size arguments to specify an swiotlb allocation that is
larger than mapping_size. This larger allocation is used solely
by iommu_dma_map_single() to handle untrusted devices that should
not have DMA visibility to memory pages that are partially used
for unrelated kernel data.

Having two arguments to specify the allocation is redundant. While
alloc_align_mask naturally specifies the alignment of the starting
address of the allocation, it can also implicitly specify the size
by rounding up the mapping_size to that alignment.

Additionally, the current approach has an edge case bug.
iommu_dma_map_page() already does the rounding up to compute the
alloc_size argument. But swiotlb_tbl_map_single() then calculates
the alignment offset based on the DMA min_align_mask, and adds
that offset to alloc_size. If the offset is non-zero, the addition
may result in a value that is larger than the max the swiotlb can
allocate. If the rounding up is done _after_ the alignment offset is
added to the mapping_size (and the original mapping_size conforms to
the value returned by swiotlb_max_mapping_size), then the max that the
swiotlb can allocate will not be exceeded.

In view of these issues, simplify the swiotlb_tbl_map_single() interface
by removing the alloc_size argument. Most call sites pass the same
value for mapping_size and alloc_size, and they pass alloc_align_mask
as zero. Just remove the redundant argument from these callers, as they
will see no functional change. For iommu_dma_map_page() also remove
the alloc_size argument, and have swiotlb_tbl_map_single() compute
the alloc_size by rounding up mapping_size after adding the offset
based on min_align_mask. This has the side effect of fixing the
edge case bug but with no other functional change.

Also add a sanity test on the alloc_align_mask. While IOMMU code
currently ensures the granule is not larger than PAGE_SIZE, if
that guarantee were to be removed in the future, the downstream
effect on the swiotlb might go unnoticed until strange allocation
failures occurred.

Tested on an ARM64 system with 16K page size and some kernel
test-only hackery to allow modifying the DMA min_align_mask and
the granule size that becomes the alloc_align_mask. Tested these
combinations with a variety of original memory addresses and
sizes, including those that reproduce the edge case bug:

* 4K granule and 0 min_align_mask
* 4K granule and 0xFFF min_align_mask (4K - 1)
* 16K granule and 0xFFF min_align_mask
* 64K granule and 0xFFF min_align_mask
* 64K granule and 0x3FFF min_align_mask (16K - 1)

With the changes, all combinations pass.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
I've haven't used any "Fixes:" tags. This patch really should be
backported only if all the other recent swiotlb fixes get backported,
and I'm unclear on whether that will happen.

I saw the brief discussion about removing the "dir" parameter from
swiotlb_tbl_map_single(). That removal could easily be done as part
of this patch, since it's already changing the swiotlb_tbl_map_single()
parameters. But I think the conclusion of the discussion was to leave
the "dir" parameter for symmetry with the swiotlb_sync_*() functions.
Please correct me if that's wrong, and I'll respin this patch to do
the removal.

 drivers/iommu/dma-iommu.c |  2 +-
 drivers/xen/swiotlb-xen.c |  2 +-
 include/linux/swiotlb.h   |  2 +-
 kernel/dma/swiotlb.c      | 56 +++++++++++++++++++++++++++++----------
 4 files changed, 45 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 07d087eecc17..c21ef1388499 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1165,7 +1165,7 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 		trace_swiotlb_bounced(dev, phys, size);
 
 		aligned_size = iova_align(iovad, size);
-		phys = swiotlb_tbl_map_single(dev, phys, size, aligned_size,
+		phys = swiotlb_tbl_map_single(dev, phys, size,
 					      iova_mask(iovad), dir, attrs);
 
 		if (phys == DMA_MAPPING_ERROR)
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 1c4ef5111651..6579ae3f6dac 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -216,7 +216,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 	 */
 	trace_swiotlb_bounced(dev, dev_addr, size);
 
-	map = swiotlb_tbl_map_single(dev, phys, size, size, 0, dir, attrs);
+	map = swiotlb_tbl_map_single(dev, phys, size, 0, dir, attrs);
 	if (map == (phys_addr_t)DMA_MAPPING_ERROR)
 		return DMA_MAPPING_ERROR;
 
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index ea23097e351f..14bc10c1bb23 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -43,7 +43,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 extern void __init swiotlb_update_mem_attributes(void);
 
 phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
-		size_t mapping_size, size_t alloc_size,
+		size_t mapping_size,
 		unsigned int alloc_aligned_mask, enum dma_data_direction dir,
 		unsigned long attrs);
 
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index a5e0dfc44d24..046da973a7e2 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -1340,15 +1340,40 @@ static unsigned long mem_used(struct io_tlb_mem *mem)
 
 #endif /* CONFIG_DEBUG_FS */
 
+/**
+ * swiotlb_tbl_map_single() - bounce buffer map a single contiguous physical area
+ * @dev:		Device which maps the buffer.
+ * @orig_addr:		Original (non-bounced) physical IO buffer address
+ * @mapping_size:	Requested size of the actual bounce buffer, excluding
+ *			any pre- or post-padding for alignment
+ * @alloc_align_mask:	Required start and end alignment of the allocated buffer
+ * @dir:		DMA direction
+ * @attrs:		Optional DMA attributes for the map operation
+ *
+ * Find and allocate a suitable sequence of IO TLB slots for the request.
+ * The allocated space starts at an alignment specified by alloc_align_mask,
+ * and the size of the allocated space is rounded up so that the total amount
+ * of allocated space is a multiple of (alloc_align_mask + 1). If
+ * alloc_align_mask is zero, the allocated space may be at any alignment and
+ * the size is not rounded up.
+ *
+ * The returned address is within the allocated space and matches the bits
+ * of orig_addr that are specified in the DMA min_align_mask for the device. As
+ * such, this returned address may be offset from the beginning of the allocated
+ * space. The bounce buffer space starting at the returned address for
+ * mapping_size bytes is initialized to the contents of the original IO buffer
+ * area. Any pre-padding (due to an offset) and any post-padding (due to
+ * rounding-up the size) is not initialized.
+ */
 phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
-		size_t mapping_size, size_t alloc_size,
-		unsigned int alloc_align_mask, enum dma_data_direction dir,
-		unsigned long attrs)
+		size_t mapping_size, unsigned int alloc_align_mask,
+		enum dma_data_direction dir, unsigned long attrs)
 {
 	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	unsigned int offset;
 	struct io_tlb_pool *pool;
 	unsigned int i;
+	size_t size;
 	int index;
 	phys_addr_t tlb_addr;
 	unsigned short pad_slots;
@@ -1362,20 +1387,24 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	if (cc_platform_has(CC_ATTR_MEM_ENCRYPT))
 		pr_warn_once("Memory encryption is active and system is using DMA bounce buffers\n");
 
-	if (mapping_size > alloc_size) {
-		dev_warn_once(dev, "Invalid sizes (mapping: %zd bytes, alloc: %zd bytes)",
-			      mapping_size, alloc_size);
-		return (phys_addr_t)DMA_MAPPING_ERROR;
-	}
+	/*
+	 * The default swiotlb memory pool is allocated with PAGE_SIZE
+	 * alignment. If a mapping is requested with larger alignment,
+	 * the mapping may be unable to use the initial slot(s) in all
+	 * sets of IO_TLB_SEGSIZE slots. In such case, a mapping request
+	 * of or near the maximum mapping size would always fail.
+	 */
+	dev_WARN_ONCE(dev, alloc_align_mask > ~PAGE_MASK,
+		"Alloc alignment may prevent fulfilling requests with max mapping_size\n");
 
 	offset = swiotlb_align_offset(dev, alloc_align_mask, orig_addr);
-	index = swiotlb_find_slots(dev, orig_addr,
-				   alloc_size + offset, alloc_align_mask, &pool);
+	size = ALIGN(mapping_size + offset, alloc_align_mask + 1);
+	index = swiotlb_find_slots(dev, orig_addr, size, alloc_align_mask, &pool);
 	if (index == -1) {
 		if (!(attrs & DMA_ATTR_NO_WARN))
 			dev_warn_ratelimited(dev,
 	"swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
-				 alloc_size, mem->nslabs, mem_used(mem));
+				 size, mem->nslabs, mem_used(mem));
 		return (phys_addr_t)DMA_MAPPING_ERROR;
 	}
 
@@ -1388,7 +1417,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	offset &= (IO_TLB_SIZE - 1);
 	index += pad_slots;
 	pool->slots[index].pad_slots = pad_slots;
-	for (i = 0; i < nr_slots(alloc_size + offset); i++)
+	for (i = 0; i < (nr_slots(size) - pad_slots); i++)
 		pool->slots[index + i].orig_addr = slot_addr(orig_addr, i);
 	tlb_addr = slot_addr(pool->start, index) + offset;
 	/*
@@ -1543,8 +1572,7 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
 
 	trace_swiotlb_bounced(dev, phys_to_dma(dev, paddr), size);
 
-	swiotlb_addr = swiotlb_tbl_map_single(dev, paddr, size, size, 0, dir,
-			attrs);
+	swiotlb_addr = swiotlb_tbl_map_single(dev, paddr, size, 0, dir, attrs);
 	if (swiotlb_addr == (phys_addr_t)DMA_MAPPING_ERROR)
 		return DMA_MAPPING_ERROR;
 
-- 
2.25.1


