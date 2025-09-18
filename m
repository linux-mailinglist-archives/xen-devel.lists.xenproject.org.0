Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37794B8676A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 20:46:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126449.1468055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzJdq-0005Q0-Cg; Thu, 18 Sep 2025 18:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126449.1468055; Thu, 18 Sep 2025 18:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzJdq-0005LS-8P; Thu, 18 Sep 2025 18:46:02 +0000
Received: by outflank-mailman (input) for mailman id 1126449;
 Thu, 18 Sep 2025 18:46:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TAPY=35=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1uzJdp-0003Vt-Ae
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 18:46:01 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6e99914-94bf-11f0-9809-7dc792cee155;
 Thu, 18 Sep 2025 20:45:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 63592435E5;
 Thu, 18 Sep 2025 18:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B01C4CEE7;
 Thu, 18 Sep 2025 18:45:56 +0000 (UTC)
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
X-Inumbo-ID: b6e99914-94bf-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221157;
	bh=1mDXfVNbsYLo4a+duzDpY85ZUnJWos79Vyrao8w+xkA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uJjcqkjioeaPHR3oTtovXk7XnK/pd4Dpvt6tqBF2mLVNs5Q4naZBBRjxEELRfi2+Y
	 D4kIQlN6hJhac0eiwI3sASKq7B/5bGRMKu7BFRE0t7mA5u6NXWj4T2DNxp00i+Dz8P
	 CDKvCCa9nHcj0qbtseSusPltdxhIdxKZ4Yl5D4KaZQNkpzvLKwIkvugBIZkuUi+n41
	 sRDjxFx3/OcIdrXVx9M+pcPfgc0XKte5yCfdgAtR79e5ju1JRnVXErNA0tRs33R8Nz
	 1UIUOZkvr968XteLjAHpFkZyPWqxmq1DajIw+0WZAlLFornxw8ZulfpFSWmmyNnZ69
	 l7OvidjZ6KebQ==
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
Subject: [PATCH 7/9] vdpa: Convert to physical address DMA mapping
Date: Thu, 18 Sep 2025 21:45:07 +0300
Message-ID: <517785de56c12927a782b6bc51cc84e06493958d.1758219787.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758219786.git.leon@kernel.org>
References: <cover.1758219786.git.leon@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

Use physical address directly in DMA mapping flow.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/vdpa/vdpa_user/iova_domain.c | 11 +++++------
 drivers/vdpa/vdpa_user/iova_domain.h |  8 ++++----
 drivers/vdpa/vdpa_user/vduse_dev.c   | 18 ++++++++++--------
 3 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/vdpa/vdpa_user/iova_domain.c b/drivers/vdpa/vdpa_user/iova_domain.c
index 58116f89d8dae..c0ecf01003cd3 100644
--- a/drivers/vdpa/vdpa_user/iova_domain.c
+++ b/drivers/vdpa/vdpa_user/iova_domain.c
@@ -396,17 +396,16 @@ void vduse_domain_sync_single_for_cpu(struct vduse_iova_domain *domain,
 	read_unlock(&domain->bounce_lock);
 }
 
-dma_addr_t vduse_domain_map_page(struct vduse_iova_domain *domain,
-				 struct page *page, unsigned long offset,
-				 size_t size, enum dma_data_direction dir,
+dma_addr_t vduse_domain_map_phys(struct vduse_iova_domain *domain,
+				 phys_addr_t pa, size_t size,
+				 enum dma_data_direction dir,
 				 unsigned long attrs)
 {
 	struct iova_domain *iovad = &domain->stream_iovad;
 	unsigned long limit = domain->bounce_size - 1;
-	phys_addr_t pa = page_to_phys(page) + offset;
 	dma_addr_t iova = vduse_domain_alloc_iova(iovad, size, limit);
 
-	if (!iova)
+	if (!iova || (attrs & DMA_ATTR_MMIO))
 		return DMA_MAPPING_ERROR;
 
 	if (vduse_domain_init_bounce_map(domain))
@@ -430,7 +429,7 @@ dma_addr_t vduse_domain_map_page(struct vduse_iova_domain *domain,
 	return DMA_MAPPING_ERROR;
 }
 
-void vduse_domain_unmap_page(struct vduse_iova_domain *domain,
+void vduse_domain_unmap_phys(struct vduse_iova_domain *domain,
 			     dma_addr_t dma_addr, size_t size,
 			     enum dma_data_direction dir, unsigned long attrs)
 {
diff --git a/drivers/vdpa/vdpa_user/iova_domain.h b/drivers/vdpa/vdpa_user/iova_domain.h
index 7f3f0928ec781..7c4546fd856ab 100644
--- a/drivers/vdpa/vdpa_user/iova_domain.h
+++ b/drivers/vdpa/vdpa_user/iova_domain.h
@@ -53,12 +53,12 @@ void vduse_domain_sync_single_for_cpu(struct vduse_iova_domain *domain,
 				      dma_addr_t dma_addr, size_t size,
 				      enum dma_data_direction dir);
 
-dma_addr_t vduse_domain_map_page(struct vduse_iova_domain *domain,
-				 struct page *page, unsigned long offset,
-				 size_t size, enum dma_data_direction dir,
+dma_addr_t vduse_domain_map_phys(struct vduse_iova_domain *domain,
+				 phys_addr_t phys, size_t size,
+				 enum dma_data_direction dir,
 				 unsigned long attrs);
 
-void vduse_domain_unmap_page(struct vduse_iova_domain *domain,
+void vduse_domain_unmap_phys(struct vduse_iova_domain *domain,
 			     dma_addr_t dma_addr, size_t size,
 			     enum dma_data_direction dir, unsigned long attrs);
 
diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
index 04620bb77203d..75aa3c9f83fb5 100644
--- a/drivers/vdpa/vdpa_user/vduse_dev.c
+++ b/drivers/vdpa/vdpa_user/vduse_dev.c
@@ -834,25 +834,27 @@ static void vduse_dev_sync_single_for_cpu(struct device *dev,
 	vduse_domain_sync_single_for_cpu(domain, dma_addr, size, dir);
 }
 
-static dma_addr_t vduse_dev_map_page(struct device *dev, struct page *page,
-				     unsigned long offset, size_t size,
-				     enum dma_data_direction dir,
+static dma_addr_t vduse_dev_map_phys(struct device *dev, phys_addr_t phys,
+				     size_t size, enum dma_data_direction dir,
 				     unsigned long attrs)
 {
 	struct vduse_dev *vdev = dev_to_vduse(dev);
 	struct vduse_iova_domain *domain = vdev->domain;
 
-	return vduse_domain_map_page(domain, page, offset, size, dir, attrs);
+	if (attrs & DMA_ATTR_MMIO)
+		return DMA_MAPPING_ERROR;
+
+	return vduse_domain_map_phys(domain, phys, size, dir, attrs);
 }
 
-static void vduse_dev_unmap_page(struct device *dev, dma_addr_t dma_addr,
+static void vduse_dev_unmap_phys(struct device *dev, dma_addr_t dma_addr,
 				size_t size, enum dma_data_direction dir,
 				unsigned long attrs)
 {
 	struct vduse_dev *vdev = dev_to_vduse(dev);
 	struct vduse_iova_domain *domain = vdev->domain;
 
-	return vduse_domain_unmap_page(domain, dma_addr, size, dir, attrs);
+	return vduse_domain_unmap_phys(domain, dma_addr, size, dir, attrs);
 }
 
 static void *vduse_dev_alloc_coherent(struct device *dev, size_t size,
@@ -896,8 +898,8 @@ static size_t vduse_dev_max_mapping_size(struct device *dev)
 static const struct dma_map_ops vduse_dev_dma_ops = {
 	.sync_single_for_device = vduse_dev_sync_single_for_device,
 	.sync_single_for_cpu = vduse_dev_sync_single_for_cpu,
-	.map_page = vduse_dev_map_page,
-	.unmap_page = vduse_dev_unmap_page,
+	.map_phys = vduse_dev_map_phys,
+	.unmap_phys = vduse_dev_unmap_phys,
 	.alloc = vduse_dev_alloc_coherent,
 	.free = vduse_dev_free_coherent,
 	.max_mapping_size = vduse_dev_max_mapping_size,
-- 
2.51.0


