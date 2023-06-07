Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19EA726135
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 15:25:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544783.850780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6tAK-0005Yi-2r; Wed, 07 Jun 2023 13:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544783.850780; Wed, 07 Jun 2023 13:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6tAK-0005Wb-04; Wed, 07 Jun 2023 13:25:32 +0000
Received: by outflank-mailman (input) for mailman id 544783;
 Wed, 07 Jun 2023 13:25:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/6g=B3=bombadil.srs.infradead.org=BATV+e57f13fd7911cf5fc1b0+7227+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1q6tAI-0005WV-5f
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 13:25:31 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3d7d498-0536-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 15:25:29 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-8c8c-28f8-1274-e038.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:8c8c:28f8:1274:e038] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q6tAA-0065rT-1N; Wed, 07 Jun 2023 13:25:22 +0000
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
X-Inumbo-ID: c3d7d498-0536-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=/2ulYW69Fet+oQidjF0EozGV7t1Yw4gVukyr/Zwn4NI=; b=aSYlXJYrUG9pogF6BrsKOLkr3d
	kaC12Xqhh/9MC/zCfVYGWt1reUOEbN5jFS7Z6z8gF63YwkwJU+nHV93D3/ZB3QBMK98DWX0ELlcAF
	eVuSvlauRr+jkv+SxCd/xUgSTU2KDJW1h5L6jNrtevLdviK1sYUrviAijzbMtBiUBbckG90oL04vq
	0vNOCA3K9YR7XTrKoXA9aAeglmQ+eQ+RcDPs54/CURN45PbDALIrTixKVMIVMa3tnFTwq/7P3HfhH
	oCq8s8DR0CvnhqdrCG6JiqJ5S/s9H0GEWfpBa5bYsJB10w778Wd6pTQVK2nybgniQ+I7e/mljumiA
	I+1CS0tA==;
From: Christoph Hellwig <hch@lst.de>
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com
Cc: xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev
Subject: [PATCH, RFC] swiotlb-xen: fix dma to physical address translation for cache operations
Date: Wed,  7 Jun 2023 15:25:18 +0200
Message-Id: <20230607132518.15381-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

All other places in swiotlb-xen got from PFN to BFN and then call
phys_to_dma on the result or vice versa, but the reverse mapping used
for cache maintenance skips the BFN to PFN mapping.

[Note: only found by code inspection, please review very carefully!]

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/xen/swiotlb-xen.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 67aa74d201627d..e4620303138b4d 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -234,7 +234,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 
 done:
 	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dev_addr))))
+		if (pfn_valid(PFN_DOWN(phys)))
 			arch_sync_dma_for_device(phys, size, dir);
 		else
 			xen_dma_sync_for_device(dev, dev_addr, size, dir);
@@ -258,7 +258,7 @@ static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
 	BUG_ON(dir == DMA_NONE);
 
 	if (!dev_is_dma_coherent(hwdev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
-		if (pfn_valid(PFN_DOWN(dma_to_phys(hwdev, dev_addr))))
+		if (pfn_valid(PFN_DOWN(paddr)))
 			arch_sync_dma_for_cpu(paddr, size, dir);
 		else
 			xen_dma_sync_for_cpu(hwdev, dev_addr, size, dir);
@@ -276,7 +276,7 @@ xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
 	phys_addr_t paddr = xen_dma_to_phys(dev, dma_addr);
 
 	if (!dev_is_dma_coherent(dev)) {
-		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr))))
+		if (pfn_valid(PFN_DOWN(paddr)))
 			arch_sync_dma_for_cpu(paddr, size, dir);
 		else
 			xen_dma_sync_for_cpu(dev, dma_addr, size, dir);
@@ -296,7 +296,7 @@ xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
 		swiotlb_sync_single_for_device(dev, paddr, size, dir);
 
 	if (!dev_is_dma_coherent(dev)) {
-		if (pfn_valid(PFN_DOWN(dma_to_phys(dev, dma_addr))))
+		if (pfn_valid(PFN_DOWN(paddr)))
 			arch_sync_dma_for_device(paddr, size, dir);
 		else
 			xen_dma_sync_for_device(dev, dma_addr, size, dir);
-- 
2.39.2


