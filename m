Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6055BA730F
	for <lists+xen-devel@lfdr.de>; Sun, 28 Sep 2025 17:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132401.1470781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2svQ-00027O-FI; Sun, 28 Sep 2025 15:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132401.1470781; Sun, 28 Sep 2025 15:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2svQ-00026A-8w; Sun, 28 Sep 2025 15:02:56 +0000
Received: by outflank-mailman (input) for mailman id 1132401;
 Sun, 28 Sep 2025 15:02:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zTFj=4H=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1v2svO-0001Mg-47
 for xen-devel@lists.xenproject.org; Sun, 28 Sep 2025 15:02:54 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 341f5cd3-9c7c-11f0-9809-7dc792cee155;
 Sun, 28 Sep 2025 17:02:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C0DBC6219A;
 Sun, 28 Sep 2025 15:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9EB9C4CEF0;
 Sun, 28 Sep 2025 15:02:49 +0000 (UTC)
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
X-Inumbo-ID: 341f5cd3-9c7c-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759071770;
	bh=If22SjLGOh/is+v52/ZDiDRnMnCqTEHc+dpMRM0pA2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LAocKRbJbaa97FIPPcaZ9C2Al8lU+DHQdZiPjJKGYtG5Bpk11+lwm3Tqi7A4+qTaw
	 iQ70Bpw0TW3NRd41XhsfDsE99PRxJaEzj9U3/HQLJVS+/xQcYXRfViOEcnd+g8Lr8g
	 xOXUh40eUvXDb1DNt5t6GB30z/eXqiin6CTW6vSxQDDhRFw9GYswOSz6RGlwZRIAQC
	 2ctL1b0csjMfGi3YVKGtGCAn4+8dWOC/oik0SDvI7Gz9EvUZrIGJFbqcfsbEV7ZjeK
	 UKzgbUcboFDm5Iu7CjnXI7xmOHIS+z+B5/YSjpEbRi93B78wqFfgKWaSblWkn37+ti
	 lU2bP2uCwCkzw==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geoff Levand <geoff@infradead.org>,
	Helge Deller <deller@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	iommu@lists.linux.dev,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Jason Wang <jasowang@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	sparclinux@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	virtualization@lists.linux.dev,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v1 4/9] powerpc: Convert to physical address DMA mapping
Date: Sun, 28 Sep 2025 18:02:24 +0300
Message-ID: <f2b69a0ac2308cc8fd8635dceac951670d41cea2.1759071169.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1759071169.git.leon@kernel.org>
References: <cover.1759071169.git.leon@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

Adapt PowerPC DMA to use physical addresses in order to prepare code
to removal .map_page and .unmap_page.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/powerpc/include/asm/iommu.h         |  8 +++---
 arch/powerpc/kernel/dma-iommu.c          | 22 +++++++---------
 arch/powerpc/kernel/iommu.c              | 14 +++++-----
 arch/powerpc/platforms/ps3/system-bus.c  | 33 ++++++++++++++----------
 arch/powerpc/platforms/pseries/ibmebus.c | 15 ++++++-----
 arch/powerpc/platforms/pseries/vio.c     | 21 ++++++++-------
 6 files changed, 60 insertions(+), 53 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index b410021ad4c6..eafdd63cd6c4 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -274,12 +274,12 @@ extern void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
 				  unsigned long mask, gfp_t flag, int node);
 extern void iommu_free_coherent(struct iommu_table *tbl, size_t size,
 				void *vaddr, dma_addr_t dma_handle);
-extern dma_addr_t iommu_map_page(struct device *dev, struct iommu_table *tbl,
-				 struct page *page, unsigned long offset,
-				 size_t size, unsigned long mask,
+extern dma_addr_t iommu_map_phys(struct device *dev, struct iommu_table *tbl,
+				 phys_addr_t phys, size_t size,
+				 unsigned long mask,
 				 enum dma_data_direction direction,
 				 unsigned long attrs);
-extern void iommu_unmap_page(struct iommu_table *tbl, dma_addr_t dma_handle,
+extern void iommu_unmap_phys(struct iommu_table *tbl, dma_addr_t dma_handle,
 			     size_t size, enum dma_data_direction direction,
 			     unsigned long attrs);
 
diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index 0359ab72cd3b..aa3689d61917 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -93,28 +93,26 @@ static void dma_iommu_free_coherent(struct device *dev, size_t size,
 
 /* Creates TCEs for a user provided buffer.  The user buffer must be
  * contiguous real kernel storage (not vmalloc).  The address passed here
- * comprises a page address and offset into that page. The dma_addr_t
- * returned will point to the same byte within the page as was passed in.
+ * is a physical address to that page. The dma_addr_t returned will point
+ * to the same byte within the page as was passed in.
  */
-static dma_addr_t dma_iommu_map_page(struct device *dev, struct page *page,
-				     unsigned long offset, size_t size,
+static dma_addr_t dma_iommu_map_phys(struct device *dev, phys_addr_t phys,
+				     size_t size,
 				     enum dma_data_direction direction,
 				     unsigned long attrs)
 {
-	return iommu_map_page(dev, get_iommu_table_base(dev), page, offset,
-			      size, dma_get_mask(dev), direction, attrs);
+	return iommu_map_phys(dev, get_iommu_table_base(dev), phys, size,
+			      dma_get_mask(dev), direction, attrs);
 }
 
-
-static void dma_iommu_unmap_page(struct device *dev, dma_addr_t dma_handle,
+static void dma_iommu_unmap_phys(struct device *dev, dma_addr_t dma_handle,
 				 size_t size, enum dma_data_direction direction,
 				 unsigned long attrs)
 {
-	iommu_unmap_page(get_iommu_table_base(dev), dma_handle, size, direction,
+	iommu_unmap_phys(get_iommu_table_base(dev), dma_handle, size, direction,
 			 attrs);
 }
 
-
 static int dma_iommu_map_sg(struct device *dev, struct scatterlist *sglist,
 			    int nelems, enum dma_data_direction direction,
 			    unsigned long attrs)
@@ -211,8 +209,8 @@ const struct dma_map_ops dma_iommu_ops = {
 	.map_sg			= dma_iommu_map_sg,
 	.unmap_sg		= dma_iommu_unmap_sg,
 	.dma_supported		= dma_iommu_dma_supported,
-	.map_page		= dma_iommu_map_page,
-	.unmap_page		= dma_iommu_unmap_page,
+	.map_phys		= dma_iommu_map_phys,
+	.unmap_phys		= dma_iommu_unmap_phys,
 	.get_required_mask	= dma_iommu_get_required_mask,
 	.mmap			= dma_common_mmap,
 	.get_sgtable		= dma_common_get_sgtable,
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 244eb4857e7f..6b5f4b72ce97 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -848,12 +848,12 @@ EXPORT_SYMBOL_GPL(iommu_tce_table_put);
 
 /* Creates TCEs for a user provided buffer.  The user buffer must be
  * contiguous real kernel storage (not vmalloc).  The address passed here
- * comprises a page address and offset into that page. The dma_addr_t
- * returned will point to the same byte within the page as was passed in.
+ * is physical address into that page. The dma_addr_t returned will point
+ * to the same byte within the page as was passed in.
  */
-dma_addr_t iommu_map_page(struct device *dev, struct iommu_table *tbl,
-			  struct page *page, unsigned long offset, size_t size,
-			  unsigned long mask, enum dma_data_direction direction,
+dma_addr_t iommu_map_phys(struct device *dev, struct iommu_table *tbl,
+			  phys_addr_t phys, size_t size, unsigned long mask,
+			  enum dma_data_direction direction,
 			  unsigned long attrs)
 {
 	dma_addr_t dma_handle = DMA_MAPPING_ERROR;
@@ -863,7 +863,7 @@ dma_addr_t iommu_map_page(struct device *dev, struct iommu_table *tbl,
 
 	BUG_ON(direction == DMA_NONE);
 
-	vaddr = page_address(page) + offset;
+	vaddr = phys_to_virt(phys);
 	uaddr = (unsigned long)vaddr;
 
 	if (tbl) {
@@ -890,7 +890,7 @@ dma_addr_t iommu_map_page(struct device *dev, struct iommu_table *tbl,
 	return dma_handle;
 }
 
-void iommu_unmap_page(struct iommu_table *tbl, dma_addr_t dma_handle,
+void iommu_unmap_phys(struct iommu_table *tbl, dma_addr_t dma_handle,
 		      size_t size, enum dma_data_direction direction,
 		      unsigned long attrs)
 {
diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
index afbaabf182d0..a223ba777148 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -551,18 +551,20 @@ static void ps3_free_coherent(struct device *_dev, size_t size, void *vaddr,
 
 /* Creates TCEs for a user provided buffer.  The user buffer must be
  * contiguous real kernel storage (not vmalloc).  The address passed here
- * comprises a page address and offset into that page. The dma_addr_t
- * returned will point to the same byte within the page as was passed in.
+ * is physical address to that hat page. The dma_addr_t returned will point
+ * to the same byte within the page as was passed in.
  */
 
-static dma_addr_t ps3_sb_map_page(struct device *_dev, struct page *page,
-	unsigned long offset, size_t size, enum dma_data_direction direction,
-	unsigned long attrs)
+static dma_addr_t ps3_sb_map_phys(struct device *_dev, phys_addr_t phys,
+	size_t size, enum dma_data_direction direction, unsigned long attrs)
 {
 	struct ps3_system_bus_device *dev = ps3_dev_to_system_bus_dev(_dev);
 	int result;
 	dma_addr_t bus_addr;
-	void *ptr = page_address(page) + offset;
+	void *ptr = phys_to_virt(phys);
+
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
 
 	result = ps3_dma_map(dev->d_region, (unsigned long)ptr, size,
 			     &bus_addr,
@@ -577,8 +579,8 @@ static dma_addr_t ps3_sb_map_page(struct device *_dev, struct page *page,
 	return bus_addr;
 }
 
-static dma_addr_t ps3_ioc0_map_page(struct device *_dev, struct page *page,
-				    unsigned long offset, size_t size,
+static dma_addr_t ps3_ioc0_map_phys(struct device *_dev, phys_addr_t phys,
+				    size_t size,
 				    enum dma_data_direction direction,
 				    unsigned long attrs)
 {
@@ -586,7 +588,10 @@ static dma_addr_t ps3_ioc0_map_page(struct device *_dev, struct page *page,
 	int result;
 	dma_addr_t bus_addr;
 	u64 iopte_flag;
-	void *ptr = page_address(page) + offset;
+	void *ptr = phys_to_virt(phys);
+
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
 
 	iopte_flag = CBE_IOPTE_M;
 	switch (direction) {
@@ -613,7 +618,7 @@ static dma_addr_t ps3_ioc0_map_page(struct device *_dev, struct page *page,
 	return bus_addr;
 }
 
-static void ps3_unmap_page(struct device *_dev, dma_addr_t dma_addr,
+static void ps3_unmap_phys(struct device *_dev, dma_addr_t dma_addr,
 	size_t size, enum dma_data_direction direction, unsigned long attrs)
 {
 	struct ps3_system_bus_device *dev = ps3_dev_to_system_bus_dev(_dev);
@@ -690,8 +695,8 @@ static const struct dma_map_ops ps3_sb_dma_ops = {
 	.map_sg = ps3_sb_map_sg,
 	.unmap_sg = ps3_sb_unmap_sg,
 	.dma_supported = ps3_dma_supported,
-	.map_page = ps3_sb_map_page,
-	.unmap_page = ps3_unmap_page,
+	.map_phys = ps3_sb_map_phys,
+	.unmap_phys = ps3_unmap_phys,
 	.mmap = dma_common_mmap,
 	.get_sgtable = dma_common_get_sgtable,
 	.alloc_pages_op = dma_common_alloc_pages,
@@ -704,8 +709,8 @@ static const struct dma_map_ops ps3_ioc0_dma_ops = {
 	.map_sg = ps3_ioc0_map_sg,
 	.unmap_sg = ps3_ioc0_unmap_sg,
 	.dma_supported = ps3_dma_supported,
-	.map_page = ps3_ioc0_map_page,
-	.unmap_page = ps3_unmap_page,
+	.map_phys = ps3_ioc0_map_phys,
+	.unmap_phys = ps3_unmap_phys,
 	.mmap = dma_common_mmap,
 	.get_sgtable = dma_common_get_sgtable,
 	.alloc_pages_op = dma_common_alloc_pages,
diff --git a/arch/powerpc/platforms/pseries/ibmebus.c b/arch/powerpc/platforms/pseries/ibmebus.c
index 3436b0af795e..cad2deb7e70d 100644
--- a/arch/powerpc/platforms/pseries/ibmebus.c
+++ b/arch/powerpc/platforms/pseries/ibmebus.c
@@ -86,17 +86,18 @@ static void ibmebus_free_coherent(struct device *dev,
 	kfree(vaddr);
 }
 
-static dma_addr_t ibmebus_map_page(struct device *dev,
-				   struct page *page,
-				   unsigned long offset,
+static dma_addr_t ibmebus_map_phys(struct device *dev, phys_addr_t phys,
 				   size_t size,
 				   enum dma_data_direction direction,
 				   unsigned long attrs)
 {
-	return (dma_addr_t)(page_address(page) + offset);
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
+
+	return (dma_addr_t)(phys_to_virt(phys));
 }
 
-static void ibmebus_unmap_page(struct device *dev,
+static void ibmebus_unmap_phys(struct device *dev,
 			       dma_addr_t dma_addr,
 			       size_t size,
 			       enum dma_data_direction direction,
@@ -146,8 +147,8 @@ static const struct dma_map_ops ibmebus_dma_ops = {
 	.unmap_sg           = ibmebus_unmap_sg,
 	.dma_supported      = ibmebus_dma_supported,
 	.get_required_mask  = ibmebus_dma_get_required_mask,
-	.map_page           = ibmebus_map_page,
-	.unmap_page         = ibmebus_unmap_page,
+	.map_phys           = ibmebus_map_phys,
+	.unmap_phys         = ibmebus_unmap_phys,
 };
 
 static int ibmebus_match_path(struct device *dev, const void *data)
diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index ac1d2d2c9a88..838e29d47378 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -512,18 +512,21 @@ static void vio_dma_iommu_free_coherent(struct device *dev, size_t size,
 	vio_cmo_dealloc(viodev, roundup(size, PAGE_SIZE));
 }
 
-static dma_addr_t vio_dma_iommu_map_page(struct device *dev, struct page *page,
-                                         unsigned long offset, size_t size,
-                                         enum dma_data_direction direction,
-                                         unsigned long attrs)
+static dma_addr_t vio_dma_iommu_map_phys(struct device *dev, phys_addr_t phys,
+					 size_t size,
+					 enum dma_data_direction direction,
+					 unsigned long attrs)
 {
 	struct vio_dev *viodev = to_vio_dev(dev);
 	struct iommu_table *tbl = get_iommu_table_base(dev);
 	dma_addr_t ret = DMA_MAPPING_ERROR;
 
+	if (attrs & DMA_ATTR_MMIO)
+		return ret;
+
 	if (vio_cmo_alloc(viodev, roundup(size, IOMMU_PAGE_SIZE(tbl))))
 		goto out_fail;
-	ret = iommu_map_page(dev, tbl, page, offset, size, dma_get_mask(dev),
+	ret = iommu_map_phys(dev, tbl, phys, size, dma_get_mask(dev),
 			direction, attrs);
 	if (unlikely(ret == DMA_MAPPING_ERROR))
 		goto out_deallocate;
@@ -536,7 +539,7 @@ static dma_addr_t vio_dma_iommu_map_page(struct device *dev, struct page *page,
 	return DMA_MAPPING_ERROR;
 }
 
-static void vio_dma_iommu_unmap_page(struct device *dev, dma_addr_t dma_handle,
+static void vio_dma_iommu_unmap_phys(struct device *dev, dma_addr_t dma_handle,
 				     size_t size,
 				     enum dma_data_direction direction,
 				     unsigned long attrs)
@@ -544,7 +547,7 @@ static void vio_dma_iommu_unmap_page(struct device *dev, dma_addr_t dma_handle,
 	struct vio_dev *viodev = to_vio_dev(dev);
 	struct iommu_table *tbl = get_iommu_table_base(dev);
 
-	iommu_unmap_page(tbl, dma_handle, size, direction, attrs);
+	iommu_unmap_phys(tbl, dma_handle, size, direction, attrs);
 	vio_cmo_dealloc(viodev, roundup(size, IOMMU_PAGE_SIZE(tbl)));
 }
 
@@ -605,8 +608,8 @@ static const struct dma_map_ops vio_dma_mapping_ops = {
 	.free              = vio_dma_iommu_free_coherent,
 	.map_sg            = vio_dma_iommu_map_sg,
 	.unmap_sg          = vio_dma_iommu_unmap_sg,
-	.map_page          = vio_dma_iommu_map_page,
-	.unmap_page        = vio_dma_iommu_unmap_page,
+	.map_phys          = vio_dma_iommu_map_phys,
+	.unmap_phys        = vio_dma_iommu_unmap_phys,
 	.dma_supported     = dma_iommu_dma_supported,
 	.get_required_mask = dma_iommu_get_required_mask,
 	.mmap		   = dma_common_mmap,
-- 
2.51.0


