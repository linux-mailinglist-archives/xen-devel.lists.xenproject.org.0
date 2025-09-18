Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EECE4B8677C
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 20:46:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126452.1468065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzJdt-0005jM-MJ; Thu, 18 Sep 2025 18:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126452.1468065; Thu, 18 Sep 2025 18:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzJdt-0005h4-HH; Thu, 18 Sep 2025 18:46:05 +0000
Received: by outflank-mailman (input) for mailman id 1126452;
 Thu, 18 Sep 2025 18:46:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TAPY=35=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1uzJds-0003Gi-0f
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 18:46:04 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9e56101-94bf-11f0-9d14-b5c5bf9af7f9;
 Thu, 18 Sep 2025 20:46:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4BFB160217;
 Thu, 18 Sep 2025 18:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF400C4CEE7;
 Thu, 18 Sep 2025 18:46:00 +0000 (UTC)
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
X-Inumbo-ID: b9e56101-94bf-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221162;
	bh=RuMQ11goh2JNImFK4PcuJ9yLKsyHcn6/phLR164pkzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q5B3soPWe59i7AumuQAtzGCpEErxVeTC7wi+Di8G6eOVT1MVZTt/JgzUnlVjGRPoW
	 ErCqMMeGsidHG1N+knFqgXjPEsOdPPiFQ0rIz4DZLI0HbYVEM3hq9hxORsFYl5H2fx
	 J60n2vb7xaJx4ibgjmaY8IKcwdgAFKEXlRg60rf39+CjCdf5WsqUpjL/TGOC7MGeDk
	 X/Ja5mBKKeU7UABgCctHcfJDW3VdXWr07H5WLSQu0NCMdcZtRlu/szIqbspA2f3jrE
	 yZJ63F0xUTPrPP7BvjqshrVIrvOkK4Vw3omPkJrYVm7ziJdzMMMM8Sk6cOqpJu0RSX
	 bLwC9O22I7FmA==
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
	xen-devel@lists.xenproject.org
Subject: [PATCH 5/9] sparc64: Use physical address DMA mapping
Date: Thu, 18 Sep 2025 21:45:05 +0300
Message-ID: <b4c89b7a8e72083d75bb9c0ded105c8d6a857c0c.1758219787.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758219786.git.leon@kernel.org>
References: <cover.1758219786.git.leon@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

Convert sparc architecture DMA code to use .map_phys callback.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/sparc/kernel/iommu.c     | 16 ++++++------
 arch/sparc/kernel/pci_sun4v.c | 16 ++++++------
 arch/sparc/mm/io-unit.c       | 13 +++++-----
 arch/sparc/mm/iommu.c         | 46 ++++++++++++++++++-----------------
 4 files changed, 48 insertions(+), 43 deletions(-)

diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
index da03636925283..72bd7519ac2ab 100644
--- a/arch/sparc/kernel/iommu.c
+++ b/arch/sparc/kernel/iommu.c
@@ -260,9 +260,8 @@ static void dma_4u_free_coherent(struct device *dev, size_t size,
 		free_pages((unsigned long)cpu, order);
 }
 
-static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
-				  unsigned long offset, size_t sz,
-				  enum dma_data_direction direction,
+static dma_addr_t dma_4u_map_phys(struct device *dev, phys_addr_t phys,
+				  size_t sz, enum dma_data_direction direction,
 				  unsigned long attrs)
 {
 	struct iommu *iommu;
@@ -273,13 +272,16 @@ static dma_addr_t dma_4u_map_page(struct device *dev, struct page *page,
 	u32 bus_addr, ret;
 	unsigned long iopte_protection;
 
+	if (attrs & DMA_ATTR_MMIO)
+		goto bad;
+
 	iommu = dev->archdata.iommu;
 	strbuf = dev->archdata.stc;
 
 	if (unlikely(direction == DMA_NONE))
 		goto bad_no_ctx;
 
-	oaddr = (unsigned long)(page_address(page) + offset);
+	oaddr = (unsigned long)(phys_to_virt(phys));
 	npages = IO_PAGE_ALIGN(oaddr + sz) - (oaddr & IO_PAGE_MASK);
 	npages >>= IO_PAGE_SHIFT;
 
@@ -383,7 +385,7 @@ static void strbuf_flush(struct strbuf *strbuf, struct iommu *iommu,
 		       vaddr, ctx, npages);
 }
 
-static void dma_4u_unmap_page(struct device *dev, dma_addr_t bus_addr,
+static void dma_4u_unmap_phys(struct device *dev, dma_addr_t bus_addr,
 			      size_t sz, enum dma_data_direction direction,
 			      unsigned long attrs)
 {
@@ -753,8 +755,8 @@ static int dma_4u_supported(struct device *dev, u64 device_mask)
 static const struct dma_map_ops sun4u_dma_ops = {
 	.alloc			= dma_4u_alloc_coherent,
 	.free			= dma_4u_free_coherent,
-	.map_page		= dma_4u_map_page,
-	.unmap_page		= dma_4u_unmap_page,
+	.map_phys		= dma_4u_map_phys,
+	.unmap_phys		= dma_4u_unmap_phys,
 	.map_sg			= dma_4u_map_sg,
 	.unmap_sg		= dma_4u_unmap_sg,
 	.sync_single_for_cpu	= dma_4u_sync_single_for_cpu,
diff --git a/arch/sparc/kernel/pci_sun4v.c b/arch/sparc/kernel/pci_sun4v.c
index b720b21ccfbd8..d9d2464a948c9 100644
--- a/arch/sparc/kernel/pci_sun4v.c
+++ b/arch/sparc/kernel/pci_sun4v.c
@@ -352,9 +352,8 @@ static void dma_4v_free_coherent(struct device *dev, size_t size, void *cpu,
 		free_pages((unsigned long)cpu, order);
 }
 
-static dma_addr_t dma_4v_map_page(struct device *dev, struct page *page,
-				  unsigned long offset, size_t sz,
-				  enum dma_data_direction direction,
+static dma_addr_t dma_4v_map_phys(struct device *dev, phys_addr_t phys,
+				  size_t sz, enum dma_data_direction direction,
 				  unsigned long attrs)
 {
 	struct iommu *iommu;
@@ -367,13 +366,16 @@ static dma_addr_t dma_4v_map_page(struct device *dev, struct page *page,
 	dma_addr_t bus_addr, ret;
 	long entry;
 
+	if (attrs & DMA_ATTR_MMIO)
+		goto bad;
+
 	iommu = dev->archdata.iommu;
 	atu = iommu->atu;
 
 	if (unlikely(direction == DMA_NONE))
 		goto bad;
 
-	oaddr = (unsigned long)(page_address(page) + offset);
+	oaddr = (unsigned long)(phys_to_virt(phys));
 	npages = IO_PAGE_ALIGN(oaddr + sz) - (oaddr & IO_PAGE_MASK);
 	npages >>= IO_PAGE_SHIFT;
 
@@ -426,7 +428,7 @@ static dma_addr_t dma_4v_map_page(struct device *dev, struct page *page,
 	return DMA_MAPPING_ERROR;
 }
 
-static void dma_4v_unmap_page(struct device *dev, dma_addr_t bus_addr,
+static void dma_4v_unmap_phys(struct device *dev, dma_addr_t bus_addr,
 			      size_t sz, enum dma_data_direction direction,
 			      unsigned long attrs)
 {
@@ -686,8 +688,8 @@ static int dma_4v_supported(struct device *dev, u64 device_mask)
 static const struct dma_map_ops sun4v_dma_ops = {
 	.alloc				= dma_4v_alloc_coherent,
 	.free				= dma_4v_free_coherent,
-	.map_page			= dma_4v_map_page,
-	.unmap_page			= dma_4v_unmap_page,
+	.map_phys			= dma_4v_map_phys,
+	.unmap_phys			= dma_4v_unmap_phys,
 	.map_sg				= dma_4v_map_sg,
 	.unmap_sg			= dma_4v_unmap_sg,
 	.dma_supported			= dma_4v_supported,
diff --git a/arch/sparc/mm/io-unit.c b/arch/sparc/mm/io-unit.c
index d8376f61b4d08..fab303cc33700 100644
--- a/arch/sparc/mm/io-unit.c
+++ b/arch/sparc/mm/io-unit.c
@@ -142,11 +142,10 @@ nexti:	scan = find_next_zero_bit(iounit->bmap, limit, scan);
 	return vaddr;
 }
 
-static dma_addr_t iounit_map_page(struct device *dev, struct page *page,
-		unsigned long offset, size_t len, enum dma_data_direction dir,
-		unsigned long attrs)
+static dma_addr_t iounit_map_phys(struct device *dev, phys_addr_t phys,
+		size_t len, enum dma_data_direction dir, unsigned long attrs)
 {
-	void *vaddr = page_address(page) + offset;
+	void *vaddr = phys_to_virt(phys);
 	struct iounit_struct *iounit = dev->archdata.iommu;
 	unsigned long ret, flags;
 	
@@ -178,7 +177,7 @@ static int iounit_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 	return nents;
 }
 
-static void iounit_unmap_page(struct device *dev, dma_addr_t vaddr, size_t len,
+static void iounit_unmap_phys(struct device *dev, dma_addr_t vaddr, size_t len,
 		enum dma_data_direction dir, unsigned long attrs)
 {
 	struct iounit_struct *iounit = dev->archdata.iommu;
@@ -279,8 +278,8 @@ static const struct dma_map_ops iounit_dma_ops = {
 	.alloc			= iounit_alloc,
 	.free			= iounit_free,
 #endif
-	.map_page		= iounit_map_page,
-	.unmap_page		= iounit_unmap_page,
+	.map_phys		= iounit_map_phys,
+	.unmap_phys		= iounit_unmap_phys,
 	.map_sg			= iounit_map_sg,
 	.unmap_sg		= iounit_unmap_sg,
 };
diff --git a/arch/sparc/mm/iommu.c b/arch/sparc/mm/iommu.c
index 5a5080db800f5..dfcd981fa7efc 100644
--- a/arch/sparc/mm/iommu.c
+++ b/arch/sparc/mm/iommu.c
@@ -181,18 +181,20 @@ static void iommu_flush_iotlb(iopte_t *iopte, unsigned int niopte)
 	}
 }
 
-static dma_addr_t __sbus_iommu_map_page(struct device *dev, struct page *page,
-		unsigned long offset, size_t len, bool per_page_flush)
+static dma_addr_t __sbus_iommu_map_phys(struct device *dev, phys_addr_t paddr,
+		size_t len, bool per_page_flush, unsigned long attrs)
 {
 	struct iommu_struct *iommu = dev->archdata.iommu;
-	phys_addr_t paddr = page_to_phys(page) + offset;
-	unsigned long off = paddr & ~PAGE_MASK;
+	unsigned long off = offset_in_page(paddr);
 	unsigned long npages = (off + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
 	unsigned long pfn = __phys_to_pfn(paddr);
 	unsigned int busa, busa0;
 	iopte_t *iopte, *iopte0;
 	int ioptex, i;
 
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
+
 	/* XXX So what is maxphys for us and how do drivers know it? */
 	if (!len || len > 256 * 1024)
 		return DMA_MAPPING_ERROR;
@@ -202,10 +204,10 @@ static dma_addr_t __sbus_iommu_map_page(struct device *dev, struct page *page,
 	 * XXX Is this a good assumption?
 	 * XXX What if someone else unmaps it here and races us?
 	 */
-	if (per_page_flush && !PageHighMem(page)) {
+	if (per_page_flush && !PhysHighMem(paddr)) {
 		unsigned long vaddr, p;
 
-		vaddr = (unsigned long)page_address(page) + offset;
+		vaddr = (unsigned long)phys_to_virt(paddr);
 		for (p = vaddr & PAGE_MASK; p < vaddr + len; p += PAGE_SIZE)
 			flush_page_for_dma(p);
 	}
@@ -231,19 +233,19 @@ static dma_addr_t __sbus_iommu_map_page(struct device *dev, struct page *page,
 	return busa0 + off;
 }
 
-static dma_addr_t sbus_iommu_map_page_gflush(struct device *dev,
-		struct page *page, unsigned long offset, size_t len,
-		enum dma_data_direction dir, unsigned long attrs)
+static dma_addr_t sbus_iommu_map_phys_gflush(struct device *dev,
+		phys_addr_t phys, size_t len, enum dma_data_direction dir,
+		unsigned long attrs)
 {
 	flush_page_for_dma(0);
-	return __sbus_iommu_map_page(dev, page, offset, len, false);
+	return __sbus_iommu_map_phys(dev, phys, len, false, attrs);
 }
 
-static dma_addr_t sbus_iommu_map_page_pflush(struct device *dev,
-		struct page *page, unsigned long offset, size_t len,
-		enum dma_data_direction dir, unsigned long attrs)
+static dma_addr_t sbus_iommu_map_phys_pflush(struct device *dev,
+		phys_addr_t phys, size_t len, enum dma_data_direction dir,
+		unsigned long attrs)
 {
-	return __sbus_iommu_map_page(dev, page, offset, len, true);
+	return __sbus_iommu_map_phys(dev, phys, len, true, attrs);
 }
 
 static int __sbus_iommu_map_sg(struct device *dev, struct scatterlist *sgl,
@@ -254,8 +256,8 @@ static int __sbus_iommu_map_sg(struct device *dev, struct scatterlist *sgl,
 	int j;
 
 	for_each_sg(sgl, sg, nents, j) {
-		sg->dma_address =__sbus_iommu_map_page(dev, sg_page(sg),
-				sg->offset, sg->length, per_page_flush);
+		sg->dma_address = __sbus_iommu_map_phys(dev, sg_phys(sg),
+				sg->length, per_page_flush, attrs);
 		if (sg->dma_address == DMA_MAPPING_ERROR)
 			return -EIO;
 		sg->dma_length = sg->length;
@@ -277,7 +279,7 @@ static int sbus_iommu_map_sg_pflush(struct device *dev, struct scatterlist *sgl,
 	return __sbus_iommu_map_sg(dev, sgl, nents, dir, attrs, true);
 }
 
-static void sbus_iommu_unmap_page(struct device *dev, dma_addr_t dma_addr,
+static void sbus_iommu_unmap_phys(struct device *dev, dma_addr_t dma_addr,
 		size_t len, enum dma_data_direction dir, unsigned long attrs)
 {
 	struct iommu_struct *iommu = dev->archdata.iommu;
@@ -303,7 +305,7 @@ static void sbus_iommu_unmap_sg(struct device *dev, struct scatterlist *sgl,
 	int i;
 
 	for_each_sg(sgl, sg, nents, i) {
-		sbus_iommu_unmap_page(dev, sg->dma_address, sg->length, dir,
+		sbus_iommu_unmap_phys(dev, sg->dma_address, sg->length, dir,
 				attrs);
 		sg->dma_address = 0x21212121;
 	}
@@ -426,8 +428,8 @@ static const struct dma_map_ops sbus_iommu_dma_gflush_ops = {
 	.alloc			= sbus_iommu_alloc,
 	.free			= sbus_iommu_free,
 #endif
-	.map_page		= sbus_iommu_map_page_gflush,
-	.unmap_page		= sbus_iommu_unmap_page,
+	.map_phys		= sbus_iommu_map_phys_gflush,
+	.unmap_phys		= sbus_iommu_unmap_phys,
 	.map_sg			= sbus_iommu_map_sg_gflush,
 	.unmap_sg		= sbus_iommu_unmap_sg,
 };
@@ -437,8 +439,8 @@ static const struct dma_map_ops sbus_iommu_dma_pflush_ops = {
 	.alloc			= sbus_iommu_alloc,
 	.free			= sbus_iommu_free,
 #endif
-	.map_page		= sbus_iommu_map_page_pflush,
-	.unmap_page		= sbus_iommu_unmap_page,
+	.map_phys		= sbus_iommu_map_phys_pflush,
+	.unmap_phys		= sbus_iommu_unmap_phys,
 	.map_sg			= sbus_iommu_map_sg_pflush,
 	.unmap_sg		= sbus_iommu_unmap_sg,
 };
-- 
2.51.0


