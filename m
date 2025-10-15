Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E15BDDB17
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 11:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143447.1477183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8xc6-00071B-6j; Wed, 15 Oct 2025 09:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143447.1477183; Wed, 15 Oct 2025 09:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8xc6-0006zE-37; Wed, 15 Oct 2025 09:16:06 +0000
Received: by outflank-mailman (input) for mailman id 1143447;
 Wed, 15 Oct 2025 09:16:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aLBx=4Y=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1v8xZy-0002lL-3Z
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 09:13:54 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4428821d-a9a7-11f0-980a-7dc792cee155;
 Wed, 15 Oct 2025 11:13:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 61E8763BEB;
 Wed, 15 Oct 2025 09:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68352C116B1;
 Wed, 15 Oct 2025 09:13:50 +0000 (UTC)
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
X-Inumbo-ID: 4428821d-a9a7-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760519631;
	bh=mdWMUlQx33yhQCgB9g+eGxCMPJQasErUwNks3U6bpsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rEwULnAPmCOdwy2UrV0khdEVG+QC189t+pWVTdsvqzsG8ClpvXbpHIclLUeiChJit
	 Asjzi2wPxyCyNS+yOeqOuZbyh1kzi+RASrkeH6L9WKgqJ4Nep3XyQdWIfGef5UXtLl
	 4fNLbyDWUuVqDpN4V/R/QJ801iNpMtBJyEWeF8cCn3lbsNgTFYpOnqdjul2qpJ86io
	 H6krcrHfE21Xptwb5fJAnvBqNCMlN327+oD4pwEgkzc1w47bMq0cyHHDbS9H+MSG3D
	 R2WhQOt9JKWoeo1Q4OK3KDX5S1JjA3cA5tf/m6FzVx9EfGIR1d1Mk/IWVTz8mEMZz4
	 6XQHEQ8GGkWUw==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v5 13/14] xen: swiotlb: Convert mapping routine to rely on physical address
Date: Wed, 15 Oct 2025 12:12:59 +0300
Message-ID: <20251015-remove-map-page-v5-13-3bbfe3a25cdf@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

Switch to .map_phys callback instead of .map_page.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/xen/grant-dma-ops.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 29257d2639db..14077d23f2a1 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -163,18 +163,22 @@ static void xen_grant_dma_free_pages(struct device *dev, size_t size,
 	xen_grant_dma_free(dev, size, page_to_virt(vaddr), dma_handle, 0);
 }
 
-static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
-					 unsigned long offset, size_t size,
+static dma_addr_t xen_grant_dma_map_phys(struct device *dev, phys_addr_t phys,
+					 size_t size,
 					 enum dma_data_direction dir,
 					 unsigned long attrs)
 {
 	struct xen_grant_dma_data *data;
+	unsigned long offset = offset_in_page(phys);
 	unsigned long dma_offset = xen_offset_in_page(offset),
 			pfn_offset = XEN_PFN_DOWN(offset);
 	unsigned int i, n_pages = XEN_PFN_UP(dma_offset + size);
 	grant_ref_t grant;
 	dma_addr_t dma_handle;
 
+	if (unlikely(attrs & DMA_ATTR_MMIO))
+		return DMA_MAPPING_ERROR;
+
 	if (WARN_ON(dir == DMA_NONE))
 		return DMA_MAPPING_ERROR;
 
@@ -190,7 +194,7 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
 
 	for (i = 0; i < n_pages; i++) {
 		gnttab_grant_foreign_access_ref(grant + i, data->backend_domid,
-				pfn_to_gfn(page_to_xen_pfn(page) + i + pfn_offset),
+				pfn_to_gfn(page_to_xen_pfn(phys_to_page(phys)) + i + pfn_offset),
 				dir == DMA_TO_DEVICE);
 	}
 
@@ -199,7 +203,7 @@ static dma_addr_t xen_grant_dma_map_page(struct device *dev, struct page *page,
 	return dma_handle;
 }
 
-static void xen_grant_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
+static void xen_grant_dma_unmap_phys(struct device *dev, dma_addr_t dma_handle,
 				     size_t size, enum dma_data_direction dir,
 				     unsigned long attrs)
 {
@@ -242,7 +246,7 @@ static void xen_grant_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
 		return;
 
 	for_each_sg(sg, s, nents, i)
-		xen_grant_dma_unmap_page(dev, s->dma_address, sg_dma_len(s), dir,
+		xen_grant_dma_unmap_phys(dev, s->dma_address, sg_dma_len(s), dir,
 				attrs);
 }
 
@@ -257,7 +261,7 @@ static int xen_grant_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		return -EINVAL;
 
 	for_each_sg(sg, s, nents, i) {
-		s->dma_address = xen_grant_dma_map_page(dev, sg_page(s), s->offset,
+		s->dma_address = xen_grant_dma_map_phys(dev, sg_phys(s),
 				s->length, dir, attrs);
 		if (s->dma_address == DMA_MAPPING_ERROR)
 			goto out;
@@ -286,8 +290,8 @@ static const struct dma_map_ops xen_grant_dma_ops = {
 	.free_pages = xen_grant_dma_free_pages,
 	.mmap = dma_common_mmap,
 	.get_sgtable = dma_common_get_sgtable,
-	.map_page = xen_grant_dma_map_page,
-	.unmap_page = xen_grant_dma_unmap_page,
+	.map_phys = xen_grant_dma_map_phys,
+	.unmap_phys = xen_grant_dma_unmap_phys,
 	.map_sg = xen_grant_dma_map_sg,
 	.unmap_sg = xen_grant_dma_unmap_sg,
 	.dma_supported = xen_grant_dma_supported,

-- 
2.51.0


