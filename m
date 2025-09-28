Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E7BA7316
	for <lists+xen-devel@lfdr.de>; Sun, 28 Sep 2025 17:03:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132422.1470822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2svg-0003iC-MD; Sun, 28 Sep 2025 15:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132422.1470822; Sun, 28 Sep 2025 15:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v2svg-0003eS-Gw; Sun, 28 Sep 2025 15:03:12 +0000
Received: by outflank-mailman (input) for mailman id 1132422;
 Sun, 28 Sep 2025 15:03:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zTFj=4H=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1v2sve-0001Mg-PL
 for xen-devel@lists.xenproject.org; Sun, 28 Sep 2025 15:03:10 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d9570c5-9c7c-11f0-9809-7dc792cee155;
 Sun, 28 Sep 2025 17:03:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DDA3D45F80;
 Sun, 28 Sep 2025 15:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E28C4CEF0;
 Sun, 28 Sep 2025 15:03:06 +0000 (UTC)
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
X-Inumbo-ID: 3d9570c5-9c7c-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759071786;
	bh=4MEtXfdS28rAh2K80VhDxfAqakr0Nc2oB0/xCEv8vjk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MLl/BjLpSDt9SBh2norJcU2F46F/r6g6h87RuQBYkoAGcZPnCd215FCQzpvgxERCA
	 JoAcWDlpaaGMBeilORD02wS46EGf5rRgJdiyxnTdl/dSUOOThvXNKsn2RYd2BOpQtn
	 z6ab9Oz6SBGmGCyKrwpxkOF/E4FINpdFsv5bLV9vRy30LirIChJsKF36dmPdg/bAIF
	 IwPNo8c23EdJkconmObCTIOoESZ2J20hDLi0fpZt7g0Y3Geyi0wHUvkyVUleo7ZhH3
	 UGMgKulTpskho2dGEbm7PUSwJmGYxd5S4PBVSl8pNrZ4ST3LrqqCETAWzyt5QLfi+Q
	 4J6w++XMD0tWg==
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
Subject: [PATCH v1 8/9] xen: swiotlb: Convert mapping routine to rely on physical address
Date: Sun, 28 Sep 2025 18:02:28 +0300
Message-ID: <573fbadd743851838a91a8dbc84b4506cea2192c.1759071169.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1759071169.git.leon@kernel.org>
References: <cover.1759071169.git.leon@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

Switch to .map_phys callback instead of .map_page.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/xen/grant-dma-ops.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 29257d2639db..7f76e516fe24 100644
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
 
+	if (attrs & DMA_ATTR_MMIO)
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


