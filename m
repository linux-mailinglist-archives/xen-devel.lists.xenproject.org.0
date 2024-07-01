Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F2991E614
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 18:58:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751844.1159924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOKLu-0007TM-11; Mon, 01 Jul 2024 16:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751844.1159924; Mon, 01 Jul 2024 16:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOKLt-0007Qn-TJ; Mon, 01 Jul 2024 16:58:05 +0000
Received: by outflank-mailman (input) for mailman id 751844;
 Mon, 01 Jul 2024 16:58:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A8Qz=OB=gmail.com=mhkelley58@srs-se1.protection.inumbo.net>)
 id 1sOKLs-0007Qh-Vq
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 16:58:05 +0000
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [2607:f8b0:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 137c6606-37cb-11ef-90a5-e314d9c70b13;
 Mon, 01 Jul 2024 18:58:02 +0200 (CEST)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-71884eda768so1701538a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 09:58:02 -0700 (PDT)
Received: from localhost.localdomain (c-67-161-114-176.hsd1.wa.comcast.net.
 [67.161.114.176]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1535cbdsm67264315ad.134.2024.07.01.09.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 09:58:00 -0700 (PDT)
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
X-Inumbo-ID: 137c6606-37cb-11ef-90a5-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719853081; x=1720457881; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9mex+pNJlMWaxi1/bUYSvLhS6pWvK+lqCIzgcWFWVK8=;
        b=cYkcCMGsqk2CAtWZdUAg8jhUAazuBziW9B6ERXt6bO1TjS5vei1Fv/v93wtfggJJ4n
         vvIo6RhrjN8lsjsmpGpoROq9l0G8Xw/k2/oqb7v2wezFC7vbFyJ8G4z7KsSruj3+sLew
         451vpCS/018RYhs+GPKboEKMky6q4ImQ+9AOFpgPozuoshYL0emjl8aGr9KKnX4Ll6uM
         54e/xuW4gV/PMCpyaoCD8JPrcEOHN2LkZEJux0CzUlTGUfCigMd4QTlHoGhRX9ztGhhc
         0sGPOLR5JNd3ZJAlKnDM2+AzCHiIGCpLTNVouxjmMU8wAzD3L+BsiqoSj7YBdyxwc825
         gawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719853081; x=1720457881;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mex+pNJlMWaxi1/bUYSvLhS6pWvK+lqCIzgcWFWVK8=;
        b=gOOo97GaykM6K+fNNsP/UgYa5WHdGGESh5Ma2PncsmdIBLLmig1EtqJyGbtvPe3FKe
         Z54ntDA97AmiEOCXNr+fBXLiU80zDHgcpnqaec6kxj8zVRu8d3BHszp72aQianC4wTAz
         pkRx+UoKt5nfmZjk/Ab45wk285T9aHE1ZY9RWdE+NZGYArqHvn+oHNSgnxoovBlsrLdL
         GLtIXOcGU8xki+lFLHNgA21kXd5xjR9jhw4384GNQ3JgjVHVU7Ih9Dy4pv96q6ni7AL9
         NbggtVOSnnCm0Xn1zxcIt3eo3KCRvh/JQRgcnJJnQjl6dmuUP5s222NYIpVqT9w7ykCE
         ODYw==
X-Forwarded-Encrypted: i=1; AJvYcCXyvOUjD1Ab/g8yIj6+M7Iz53GJiGjNLphPQi28n/EWEvulXNet3J/NXDV7/8N9PJqnxTBuuSYD2WfAgXgzroTi9IFqhklpdz3kpqxBMz0=
X-Gm-Message-State: AOJu0YyWe+IrCYtu5mxqTo/KlszghS+mGrUkPWlDTPQn3f+2PJuvdnWy
	7GoGmbPfcKmqIuxJOc1cOHt8tfeXawqUplOE3Iq3r+e9NKM0asN1
X-Google-Smtp-Source: AGHT+IG6unF3jKkTvyh72Ua499kz3xQuKyG6mZzZGyfnI3dJZYiNuxzn12IJCfiJmIAFi1o7d3x2iQ==
X-Received: by 2002:a05:6a21:99a5:b0:1bd:1aca:2b39 with SMTP id adf61e73a8af0-1bef60e3bcdmr5729800637.8.1719853080572;
        Mon, 01 Jul 2024 09:58:00 -0700 (PDT)
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
	petr@tesarici.cz,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/1] swiotlb: Reduce swiotlb pool lookups
Date: Mon,  1 Jul 2024 09:57:46 -0700
Message-Id: <20240701165746.1358-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Michael Kelley <mhklinux@outlook.com>

With CONFIG_SWIOTLB_DYNAMIC enabled, each round-trip map/unmap pair
in the swiotlb results in 6 calls to swiotlb_find_pool(). In multiple
places, the pool is found and used in one function, and then must
found again in the next function that is called because only the
tlb_addr is passed as an argument. These are the six call sites:

dma_direct_map_page:
1. swiotlb_map->swiotlb_tbl_map_single->swiotlb_bounce

dma_direct_unmap_page:
2. dma_direct_sync_single_for_cpu->is_swiotlb_buffer
3. dma_direct_sync_single_for_cpu->swiotlb_sync_single_for_cpu->
	swiotlb_bounce
4. is_swiotlb_buffer
5. swiotlb_tbl_unmap_single->swiotlb_del_transient
6. swiotlb_tbl_unmap_single->swiotlb_release_slots

Reduce the number of calls by finding the pool at a higher level, and
passing it as an argument instead of searching again. A key change is
for is_swiotlb_buffer() to return a pool pointer instead of a boolean,
and then pass this pool pointer to subsequent swiotlb functions.

Since is_swiotlb_buffer() no longer returns a boolean, rename some
functions to reflect the change:
* swiotlb_find_pool() becomes __swiotlb_find_pool()
* is_swiotlb_buffer() becomes swiotlb_find_pool()
* is_xen_swiotlb_buffer() becomes xen_swiotlb_find_pool()

With these changes, a round-trip map/unmap pair requires only 2 pool
lookups (listed using the new names):

dma_direct_unmap_page:
1. dma_direct_sync_single_for_cpu->swiotlb_find_pool
2. swiotlb_find_pool

These changes come from noticing the inefficiencies in a code review,
not from performance measurements. With CONFIG_SWIOTLB_DYNAMIC,
__swiotlb_find_pool() is not trivial, and it uses an RCU read lock,
so avoiding the redundant calls helps performance in a hot path.
When CONFIG_SWIOTLB_DYNAMIC is *not* set, the code size reduction
is minimal and the perf benefits are likely negligible, but no
harm is done.

No functional change is intended.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
Changes in v2 vs. RFC version[1]:
* In swiotlb_find_pool(), use __swiotlb_find_pool() instead of open
  coding when CONFIG_SWIOTLB_DYNAMIC is not set [Petr Tesařík]
* Rename functions as described in the commit message to reflect that
  is_swiotlb_buffer() no longer returns a boolean [Petr Tesařík,
  Christoph Hellwig]
* Updated commit message and patch Subject

[1] https://lore.kernel.org/linux-iommu/20240607031421.182589-1-mhklinux@outlook.com/

 drivers/iommu/dma-iommu.c   | 27 ++++++++++-----
 drivers/xen/swiotlb-xen.c   | 27 +++++++++------
 include/linux/scatterlist.h |  2 +-
 include/linux/swiotlb.h     | 68 ++++++++++++++++++++-----------------
 kernel/dma/direct.c         | 14 +++++---
 kernel/dma/direct.h         | 18 ++++++----
 kernel/dma/swiotlb.c        | 53 +++++++++++++++--------------
 7 files changed, 122 insertions(+), 87 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 43520e7275cc..0e2a9b043ca6 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1073,6 +1073,7 @@ static void iommu_dma_sync_single_for_cpu(struct device *dev,
 		dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
 {
 	phys_addr_t phys;
+	struct io_tlb_pool *pool;
 
 	if (dev_is_dma_coherent(dev) && !dev_use_swiotlb(dev, size, dir))
 		return;
@@ -1081,21 +1082,25 @@ static void iommu_dma_sync_single_for_cpu(struct device *dev,
 	if (!dev_is_dma_coherent(dev))
 		arch_sync_dma_for_cpu(phys, size, dir);
 
-	if (is_swiotlb_buffer(dev, phys))
-		swiotlb_sync_single_for_cpu(dev, phys, size, dir);
+	pool = swiotlb_find_pool(dev, phys);
+	if (pool)
+		swiotlb_sync_single_for_cpu(dev, phys, size, dir, pool);
 }
 
 static void iommu_dma_sync_single_for_device(struct device *dev,
 		dma_addr_t dma_handle, size_t size, enum dma_data_direction dir)
 {
 	phys_addr_t phys;
+	struct io_tlb_pool *pool;
 
 	if (dev_is_dma_coherent(dev) && !dev_use_swiotlb(dev, size, dir))
 		return;
 
 	phys = iommu_iova_to_phys(iommu_get_dma_domain(dev), dma_handle);
-	if (is_swiotlb_buffer(dev, phys))
-		swiotlb_sync_single_for_device(dev, phys, size, dir);
+
+	pool = swiotlb_find_pool(dev, phys);
+	if (pool)
+		swiotlb_sync_single_for_device(dev, phys, size, dir, pool);
 
 	if (!dev_is_dma_coherent(dev))
 		arch_sync_dma_for_device(phys, size, dir);
@@ -1189,8 +1194,12 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 		arch_sync_dma_for_device(phys, size, dir);
 
 	iova = __iommu_dma_map(dev, phys, size, prot, dma_mask);
-	if (iova == DMA_MAPPING_ERROR && is_swiotlb_buffer(dev, phys))
-		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
+	if (iova == DMA_MAPPING_ERROR) {
+		struct io_tlb_pool *pool = swiotlb_find_pool(dev, phys);
+
+		if (pool)
+			swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs, pool);
+	}
 	return iova;
 }
 
@@ -1199,6 +1208,7 @@ static void iommu_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	phys_addr_t phys;
+	struct io_tlb_pool *pool;
 
 	phys = iommu_iova_to_phys(domain, dma_handle);
 	if (WARN_ON(!phys))
@@ -1209,8 +1219,9 @@ static void iommu_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
 
 	__iommu_dma_unmap(dev, dma_handle, size);
 
-	if (unlikely(is_swiotlb_buffer(dev, phys)))
-		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
+	pool = swiotlb_find_pool(dev, phys);
+	if (unlikely(pool))
+		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs, pool);
 }
 
 /*
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 6579ae3f6dac..1696941634f1 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -88,7 +88,7 @@ static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
 	return 0;
 }
 
-static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
+static struct io_tlb_pool *xen_swiotlb_find_pool(struct device *dev, dma_addr_t dma_addr)
 {
 	unsigned long bfn = XEN_PFN_DOWN(dma_to_phys(dev, dma_addr));
 	unsigned long xen_pfn = bfn_to_local_pfn(bfn);
@@ -99,8 +99,8 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 	 * in our domain. Therefore _only_ check address within our domain.
 	 */
 	if (pfn_valid(PFN_DOWN(paddr)))
-		return is_swiotlb_buffer(dev, paddr);
-	return 0;
+		return swiotlb_find_pool(dev, paddr);
+	return NULL;
 }
 
 #ifdef CONFIG_X86
@@ -228,7 +228,8 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 	 */
 	if (unlikely(!dma_capable(dev, dev_addr, size, true))) {
 		swiotlb_tbl_unmap_single(dev, map, size, dir,
-				attrs | DMA_ATTR_SKIP_CPU_SYNC);
+				attrs | DMA_ATTR_SKIP_CPU_SYNC,
+				__swiotlb_find_pool(dev, map));
 		return DMA_MAPPING_ERROR;
 	}
 
@@ -254,6 +255,7 @@ static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	phys_addr_t paddr = xen_dma_to_phys(hwdev, dev_addr);
+	struct io_tlb_pool *pool;
 
 	BUG_ON(dir == DMA_NONE);
 
@@ -265,8 +267,9 @@ static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
 	}
 
 	/* NOTE: We use dev_addr here, not paddr! */
-	if (is_xen_swiotlb_buffer(hwdev, dev_addr))
-		swiotlb_tbl_unmap_single(hwdev, paddr, size, dir, attrs);
+	pool = xen_swiotlb_find_pool(hwdev, dev_addr);
+	if (pool)
+		swiotlb_tbl_unmap_single(hwdev, paddr, size, dir, attrs, pool);
 }
 
 static void
@@ -274,6 +277,7 @@ xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
 		size_t size, enum dma_data_direction dir)
 {
 	phys_addr_t paddr = xen_dma_to_phys(dev, dma_addr);
+	struct io_tlb_pool *pool;
 
 	if (!dev_is_dma_coherent(dev)) {
 		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr))))
@@ -282,8 +286,9 @@ xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
 			xen_dma_sync_for_cpu(dev, dma_addr, size, dir);
 	}
 
-	if (is_xen_swiotlb_buffer(dev, dma_addr))
-		swiotlb_sync_single_for_cpu(dev, paddr, size, dir);
+	pool = xen_swiotlb_find_pool(dev, dma_addr);
+	if (pool)
+		swiotlb_sync_single_for_cpu(dev, paddr, size, dir, pool);
 }
 
 static void
@@ -291,9 +296,11 @@ xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
 		size_t size, enum dma_data_direction dir)
 {
 	phys_addr_t paddr = xen_dma_to_phys(dev, dma_addr);
+	struct io_tlb_pool *pool;
 
-	if (is_xen_swiotlb_buffer(dev, dma_addr))
-		swiotlb_sync_single_for_device(dev, paddr, size, dir);
+	pool = xen_swiotlb_find_pool(dev, dma_addr);
+	if (pool)
+		swiotlb_sync_single_for_device(dev, paddr, size, dir, pool);
 
 	if (!dev_is_dma_coherent(dev)) {
 		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr))))
diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 77df3d7b18a6..e61d164622db 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -332,7 +332,7 @@ static inline void sg_dma_unmark_bus_address(struct scatterlist *sg)
  * Description:
  *   Returns true if the scatterlist was marked for SWIOTLB bouncing. Not all
  *   elements may have been bounced, so the caller would have to check
- *   individual SG entries with is_swiotlb_buffer().
+ *   individual SG entries with swiotlb_find_pool().
  */
 static inline bool sg_dma_is_swiotlb(struct scatterlist *sg)
 {
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 14bc10c1bb23..486882fe3752 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -42,24 +42,6 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 	int (*remap)(void *tlb, unsigned long nslabs));
 extern void __init swiotlb_update_mem_attributes(void);
 
-phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
-		size_t mapping_size,
-		unsigned int alloc_aligned_mask, enum dma_data_direction dir,
-		unsigned long attrs);
-
-extern void swiotlb_tbl_unmap_single(struct device *hwdev,
-				     phys_addr_t tlb_addr,
-				     size_t mapping_size,
-				     enum dma_data_direction dir,
-				     unsigned long attrs);
-
-void swiotlb_sync_single_for_device(struct device *dev, phys_addr_t tlb_addr,
-		size_t size, enum dma_data_direction dir);
-void swiotlb_sync_single_for_cpu(struct device *dev, phys_addr_t tlb_addr,
-		size_t size, enum dma_data_direction dir);
-dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
-		size_t size, enum dma_data_direction dir, unsigned long attrs);
-
 #ifdef CONFIG_SWIOTLB
 
 /**
@@ -145,11 +127,11 @@ struct io_tlb_mem {
 
 #ifdef CONFIG_SWIOTLB_DYNAMIC
 
-struct io_tlb_pool *swiotlb_find_pool(struct device *dev, phys_addr_t paddr);
+struct io_tlb_pool *__swiotlb_find_pool(struct device *dev, phys_addr_t paddr);
 
 #else
 
-static inline struct io_tlb_pool *swiotlb_find_pool(struct device *dev,
+static inline struct io_tlb_pool *__swiotlb_find_pool(struct device *dev,
 						    phys_addr_t paddr)
 {
 	return &dev->dma_io_tlb_mem->defpool;
@@ -158,22 +140,23 @@ static inline struct io_tlb_pool *swiotlb_find_pool(struct device *dev,
 #endif
 
 /**
- * is_swiotlb_buffer() - check if a physical address belongs to a swiotlb
+ * swiotlb_find_pool() - find the swiotlb pool to which a physical address belongs
  * @dev:        Device which has mapped the buffer.
  * @paddr:      Physical address within the DMA buffer.
  *
- * Check if @paddr points into a bounce buffer.
+ * Find the swiotlb pool that @paddr points into.
  *
  * Return:
- * * %true if @paddr points into a bounce buffer
- * * %false otherwise
+ * * pool address if @paddr points into a bounce buffer
+ * * NULL if @paddr does not point into a bounce buffer. As such, this function
+ *   can be used to determine if @paddr denotes a swiotlb bounce buffer.
  */
-static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
+static inline struct io_tlb_pool *swiotlb_find_pool(struct device *dev, phys_addr_t paddr)
 {
 	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 
 	if (!mem)
-		return false;
+		return NULL;
 
 #ifdef CONFIG_SWIOTLB_DYNAMIC
 	/*
@@ -182,16 +165,18 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 	 * If a SWIOTLB address is checked on another CPU, then it was
 	 * presumably loaded by the device driver from an unspecified private
 	 * data structure. Make sure that this load is ordered before reading
-	 * dev->dma_uses_io_tlb here and mem->pools in swiotlb_find_pool().
+	 * dev->dma_uses_io_tlb here and mem->pools in __swiotlb_find_pool().
 	 *
 	 * This barrier pairs with smp_mb() in swiotlb_find_slots().
 	 */
 	smp_rmb();
-	return READ_ONCE(dev->dma_uses_io_tlb) &&
-		swiotlb_find_pool(dev, paddr);
+	if (!READ_ONCE(dev->dma_uses_io_tlb))
+		return NULL;
 #else
-	return paddr >= mem->defpool.start && paddr < mem->defpool.end;
+	if (paddr < mem->defpool.start || paddr >= mem->defpool.end)
+		return NULL;
 #endif
+	return __swiotlb_find_pool(dev, paddr);
 }
 
 static inline bool is_swiotlb_force_bounce(struct device *dev)
@@ -201,6 +186,25 @@ static inline bool is_swiotlb_force_bounce(struct device *dev)
 	return mem && mem->force_bounce;
 }
 
+phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
+		size_t mapping_size,
+		unsigned int alloc_aligned_mask, enum dma_data_direction dir,
+		unsigned long attrs);
+
+extern void swiotlb_tbl_unmap_single(struct device *hwdev,
+				     phys_addr_t tlb_addr,
+				     size_t mapping_size,
+				     enum dma_data_direction dir,
+				     unsigned long attrs,
+				     struct io_tlb_pool *pool);
+
+void swiotlb_sync_single_for_device(struct device *dev, phys_addr_t tlb_addr,
+		size_t size, enum dma_data_direction dir, struct io_tlb_pool *pool);
+void swiotlb_sync_single_for_cpu(struct device *dev, phys_addr_t tlb_addr,
+		size_t size, enum dma_data_direction dir, struct io_tlb_pool *pool);
+dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
+		size_t size, enum dma_data_direction dir, unsigned long attrs);
+
 void swiotlb_init(bool addressing_limited, unsigned int flags);
 void __init swiotlb_exit(void);
 void swiotlb_dev_init(struct device *dev);
@@ -219,9 +223,9 @@ static inline void swiotlb_dev_init(struct device *dev)
 {
 }
 
-static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
+static inline struct io_tlb_pool *swiotlb_find_pool(struct device *dev, phys_addr_t paddr)
 {
-	return false;
+	return NULL;
 }
 static inline bool is_swiotlb_force_bounce(struct device *dev)
 {
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 4d543b1e9d57..edb126179390 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -399,14 +399,16 @@ void dma_direct_sync_sg_for_device(struct device *dev,
 		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
 {
 	struct scatterlist *sg;
+	struct io_tlb_pool *pool;
 	int i;
 
 	for_each_sg(sgl, sg, nents, i) {
 		phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
 
-		if (unlikely(is_swiotlb_buffer(dev, paddr)))
+		pool = swiotlb_find_pool(dev, paddr);
+		if (unlikely(pool))
 			swiotlb_sync_single_for_device(dev, paddr, sg->length,
-						       dir);
+						       dir, pool);
 
 		if (!dev_is_dma_coherent(dev))
 			arch_sync_dma_for_device(paddr, sg->length,
@@ -422,6 +424,7 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
 {
 	struct scatterlist *sg;
+	struct io_tlb_pool *pool;
 	int i;
 
 	for_each_sg(sgl, sg, nents, i) {
@@ -430,9 +433,10 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 		if (!dev_is_dma_coherent(dev))
 			arch_sync_dma_for_cpu(paddr, sg->length, dir);
 
-		if (unlikely(is_swiotlb_buffer(dev, paddr)))
+		pool = swiotlb_find_pool(dev, paddr);
+		if (unlikely(pool))
 			swiotlb_sync_single_for_cpu(dev, paddr, sg->length,
-						    dir);
+						    dir, pool);
 
 		if (dir == DMA_FROM_DEVICE)
 			arch_dma_mark_clean(paddr, sg->length);
@@ -640,7 +644,7 @@ size_t dma_direct_max_mapping_size(struct device *dev)
 bool dma_direct_need_sync(struct device *dev, dma_addr_t dma_addr)
 {
 	return !dev_is_dma_coherent(dev) ||
-	       is_swiotlb_buffer(dev, dma_to_phys(dev, dma_addr));
+	       swiotlb_find_pool(dev, dma_to_phys(dev, dma_addr));
 }
 
 /**
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index 18d346118fe8..6067120d7a42 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -57,9 +57,11 @@ static inline void dma_direct_sync_single_for_device(struct device *dev,
 		dma_addr_t addr, size_t size, enum dma_data_direction dir)
 {
 	phys_addr_t paddr = dma_to_phys(dev, addr);
+	struct io_tlb_pool *pool;
 
-	if (unlikely(is_swiotlb_buffer(dev, paddr)))
-		swiotlb_sync_single_for_device(dev, paddr, size, dir);
+	pool = swiotlb_find_pool(dev, paddr);
+	if (unlikely(pool))
+		swiotlb_sync_single_for_device(dev, paddr, size, dir, pool);
 
 	if (!dev_is_dma_coherent(dev))
 		arch_sync_dma_for_device(paddr, size, dir);
@@ -69,14 +71,16 @@ static inline void dma_direct_sync_single_for_cpu(struct device *dev,
 		dma_addr_t addr, size_t size, enum dma_data_direction dir)
 {
 	phys_addr_t paddr = dma_to_phys(dev, addr);
+	struct io_tlb_pool *pool;
 
 	if (!dev_is_dma_coherent(dev)) {
 		arch_sync_dma_for_cpu(paddr, size, dir);
 		arch_sync_dma_for_cpu_all();
 	}
 
-	if (unlikely(is_swiotlb_buffer(dev, paddr)))
-		swiotlb_sync_single_for_cpu(dev, paddr, size, dir);
+	pool = swiotlb_find_pool(dev, paddr);
+	if (unlikely(pool))
+		swiotlb_sync_single_for_cpu(dev, paddr, size, dir, pool);
 
 	if (dir == DMA_FROM_DEVICE)
 		arch_dma_mark_clean(paddr, size);
@@ -117,12 +121,14 @@ static inline void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	phys_addr_t phys = dma_to_phys(dev, addr);
+	struct io_tlb_pool *pool;
 
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
 
-	if (unlikely(is_swiotlb_buffer(dev, phys)))
+	pool = swiotlb_find_pool(dev, phys);
+	if (unlikely(pool))
 		swiotlb_tbl_unmap_single(dev, phys, size, dir,
-					 attrs | DMA_ATTR_SKIP_CPU_SYNC);
+					 attrs | DMA_ATTR_SKIP_CPU_SYNC, pool);
 }
 #endif /* _KERNEL_DMA_DIRECT_H */
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index fe1ccb53596f..9e58ceca3d0b 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -763,16 +763,18 @@ static void swiotlb_dyn_free(struct rcu_head *rcu)
 }
 
 /**
- * swiotlb_find_pool() - find the IO TLB pool for a physical address
+ * __swiotlb_find_pool() - find the IO TLB pool for a physical address
  * @dev:        Device which has mapped the DMA buffer.
  * @paddr:      Physical address within the DMA buffer.
  *
  * Find the IO TLB memory pool descriptor which contains the given physical
- * address, if any.
+ * address, if any. This function is for use only when the dev is known to
+ * be using swiotlb. Use swiotlb_find_pool() for the more general case
+ * when this condition is not met.
  *
  * Return: Memory pool which contains @paddr, or %NULL if none.
  */
-struct io_tlb_pool *swiotlb_find_pool(struct device *dev, phys_addr_t paddr)
+struct io_tlb_pool *__swiotlb_find_pool(struct device *dev, phys_addr_t paddr)
 {
 	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
 	struct io_tlb_pool *pool;
@@ -855,9 +857,8 @@ static unsigned int swiotlb_align_offset(struct device *dev,
  * Bounce: copy the swiotlb buffer from or back to the original dma location
  */
 static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size,
-			   enum dma_data_direction dir)
+			   enum dma_data_direction dir, struct io_tlb_pool *mem)
 {
-	struct io_tlb_pool *mem = swiotlb_find_pool(dev, tlb_addr);
 	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
 	phys_addr_t orig_addr = mem->slots[index].orig_addr;
 	size_t alloc_size = mem->slots[index].alloc_size;
@@ -1243,7 +1244,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
 	 * that was made by swiotlb_dyn_alloc() on a third CPU (cf. multicopy
 	 * atomicity).
 	 *
-	 * See also the comment in is_swiotlb_buffer().
+	 * See also the comment in swiotlb_find_pool().
 	 */
 	smp_mb();
 
@@ -1435,13 +1436,13 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
 	 * hardware behavior.  Use of swiotlb is supposed to be transparent,
 	 * i.e. swiotlb must not corrupt memory by clobbering unwritten bytes.
 	 */
-	swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_TO_DEVICE);
+	swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_TO_DEVICE, pool);
 	return tlb_addr;
 }
 
-static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
+static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr,
+				  struct io_tlb_pool *mem)
 {
-	struct io_tlb_pool *mem = swiotlb_find_pool(dev, tlb_addr);
 	unsigned long flags;
 	unsigned int offset = swiotlb_align_offset(dev, 0, tlb_addr);
 	int index, nslots, aindex;
@@ -1505,11 +1506,9 @@ static void swiotlb_release_slots(struct device *dev, phys_addr_t tlb_addr)
  *
  * Return: %true if @tlb_addr belonged to a transient pool that was released.
  */
-static bool swiotlb_del_transient(struct device *dev, phys_addr_t tlb_addr)
+static bool swiotlb_del_transient(struct device *dev, phys_addr_t tlb_addr,
+				  struct io_tlb_pool *pool)
 {
-	struct io_tlb_pool *pool;
-
-	pool = swiotlb_find_pool(dev, tlb_addr);
 	if (!pool->transient)
 		return false;
 
@@ -1522,7 +1521,8 @@ static bool swiotlb_del_transient(struct device *dev, phys_addr_t tlb_addr)
 #else  /* !CONFIG_SWIOTLB_DYNAMIC */
 
 static inline bool swiotlb_del_transient(struct device *dev,
-					 phys_addr_t tlb_addr)
+					 phys_addr_t tlb_addr,
+					 struct io_tlb_pool *pool)
 {
 	return false;
 }
@@ -1534,34 +1534,34 @@ static inline bool swiotlb_del_transient(struct device *dev,
  */
 void swiotlb_tbl_unmap_single(struct device *dev, phys_addr_t tlb_addr,
 			      size_t mapping_size, enum dma_data_direction dir,
-			      unsigned long attrs)
+			      unsigned long attrs, struct io_tlb_pool *pool)
 {
 	/*
 	 * First, sync the memory before unmapping the entry
 	 */
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    (dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL))
-		swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_FROM_DEVICE);
+		swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_FROM_DEVICE, pool);
 
-	if (swiotlb_del_transient(dev, tlb_addr))
+	if (swiotlb_del_transient(dev, tlb_addr, pool))
 		return;
-	swiotlb_release_slots(dev, tlb_addr);
+	swiotlb_release_slots(dev, tlb_addr, pool);
 }
 
 void swiotlb_sync_single_for_device(struct device *dev, phys_addr_t tlb_addr,
-		size_t size, enum dma_data_direction dir)
+		size_t size, enum dma_data_direction dir, struct io_tlb_pool *pool)
 {
 	if (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL)
-		swiotlb_bounce(dev, tlb_addr, size, DMA_TO_DEVICE);
+		swiotlb_bounce(dev, tlb_addr, size, DMA_TO_DEVICE, pool);
 	else
 		BUG_ON(dir != DMA_FROM_DEVICE);
 }
 
 void swiotlb_sync_single_for_cpu(struct device *dev, phys_addr_t tlb_addr,
-		size_t size, enum dma_data_direction dir)
+		size_t size, enum dma_data_direction dir, struct io_tlb_pool *pool)
 {
 	if (dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL)
-		swiotlb_bounce(dev, tlb_addr, size, DMA_FROM_DEVICE);
+		swiotlb_bounce(dev, tlb_addr, size, DMA_FROM_DEVICE, pool);
 	else
 		BUG_ON(dir != DMA_TO_DEVICE);
 }
@@ -1586,7 +1586,8 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
 	dma_addr = phys_to_dma_unencrypted(dev, swiotlb_addr);
 	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
 		swiotlb_tbl_unmap_single(dev, swiotlb_addr, size, dir,
-			attrs | DMA_ATTR_SKIP_CPU_SYNC);
+			attrs | DMA_ATTR_SKIP_CPU_SYNC,
+			__swiotlb_find_pool(dev, swiotlb_addr));
 		dev_WARN_ONCE(dev, 1,
 			"swiotlb addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
 			&dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
@@ -1774,11 +1775,13 @@ struct page *swiotlb_alloc(struct device *dev, size_t size)
 bool swiotlb_free(struct device *dev, struct page *page, size_t size)
 {
 	phys_addr_t tlb_addr = page_to_phys(page);
+	struct io_tlb_pool *pool;
 
-	if (!is_swiotlb_buffer(dev, tlb_addr))
+	pool = swiotlb_find_pool(dev, tlb_addr);
+	if (!pool)
 		return false;
 
-	swiotlb_release_slots(dev, tlb_addr);
+	swiotlb_release_slots(dev, tlb_addr, pool);
 
 	return true;
 }
-- 
2.25.1


