Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2392969C5
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 08:33:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10717.28608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVqdh-0001fp-DN; Fri, 23 Oct 2020 06:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10717.28608; Fri, 23 Oct 2020 06:33:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVqdh-0001fQ-9u; Fri, 23 Oct 2020 06:33:25 +0000
Received: by outflank-mailman (input) for mailman id 10717;
 Fri, 23 Oct 2020 06:33:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJbv=D6=casper.srs.infradead.org=batv+ae109258c1d10f479368+6270+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kVqdd-0001fL-Vk
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 06:33:23 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3645c3ea-2fe3-4bb8-afb6-0e351b6ed1ed;
 Fri, 23 Oct 2020 06:33:18 +0000 (UTC)
Received: from [2001:4bb8:18c:20bd:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVqdU-0005Dv-O2; Fri, 23 Oct 2020 06:33:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=yJbv=D6=casper.srs.infradead.org=batv+ae109258c1d10f479368+6270+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kVqdd-0001fL-Vk
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 06:33:23 +0000
X-Inumbo-ID: 3645c3ea-2fe3-4bb8-afb6-0e351b6ed1ed
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3645c3ea-2fe3-4bb8-afb6-0e351b6ed1ed;
	Fri, 23 Oct 2020 06:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=VgaUDy/MYBhcMGNLTA5dcYkNxjEeOYucsAXgukb+9OE=; b=F21OlX9RTzKj2RyK9S1jOONSVX
	fBGHNAfoEYPDghf73ahvw01VvwR8PBi1lgexR2AR9oXWJ8uVIwb97yh6lOectRl76KlmCZaRD7CZB
	Ne0xWy9GBkkZrB0i0jyH0wgEx7a71zWxL5vUy7EJQ0Y/eO9C5hS6Ecpx9DEFTJOx+t7KW8Cf+A9wz
	KjFNSkhJly6lhDd+duxQgCu1UbcPA+t2i5M9NdOsDKaAI4qr1LABguhWCwhXX8rdvsbJJE/VUbkbG
	mIkn/UOMzSrskutaE903B6fgNIIN4QFDY3iMmZhu6C/TArJvku+4c7lzLjoRYMzNsxXu8Tc01GkSV
	d+cOoHsQ==;
Received: from [2001:4bb8:18c:20bd:c70:4a89:bc61:3] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVqdU-0005Dv-O2; Fri, 23 Oct 2020 06:33:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: konrad.wilk@oracle.com
Cc: iommu@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-5.10] swiotlb: remove the tbl_dma_addr argument to swiotlb_tbl_map_single
Date: Fri, 23 Oct 2020 08:33:09 +0200
Message-Id: <20201023063309.3472987-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

The tbl_dma_addr argument is used to check the DMA boundary for the
allocations, and thus needs to be a dma_addr_t.  swiotlb-xen instead
passed a physical address, which could lead to incorrect results for
strange offsets.  Fix this by removing the parameter entirely and hard
code the DMA address for io_tlb_start instead.

Fixes: 91ffe4ad534a ("swiotlb-xen: introduce phys_to_dma/dma_to_phys translations")
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 drivers/iommu/intel/iommu.c |  5 ++---
 drivers/xen/swiotlb-xen.c   |  3 +--
 include/linux/swiotlb.h     | 10 +++-------
 kernel/dma/swiotlb.c        | 16 ++++++----------
 4 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 8651f6d4dfa032..6b560e6f193096 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -3815,9 +3815,8 @@ bounce_map_single(struct device *dev, phys_addr_t paddr, size_t size,
 	 * page aligned, we don't need to use a bounce page.
 	 */
 	if (!IS_ALIGNED(paddr | size, VTD_PAGE_SIZE)) {
-		tlb_addr = swiotlb_tbl_map_single(dev,
-				phys_to_dma_unencrypted(dev, io_tlb_start),
-				paddr, size, aligned_size, dir, attrs);
+		tlb_addr = swiotlb_tbl_map_single(dev, paddr, size,
+				aligned_size, dir, attrs);
 		if (tlb_addr == DMA_MAPPING_ERROR) {
 			goto swiotlb_error;
 		} else {
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 71ce1b7a23d1cc..2b385c1b4a99cb 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -395,8 +395,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 	 */
 	trace_swiotlb_bounced(dev, dev_addr, size, swiotlb_force);
 
-	map = swiotlb_tbl_map_single(dev, virt_to_phys(xen_io_tlb_start),
-				     phys, size, size, dir, attrs);
+	map = swiotlb_tbl_map_single(dev, phys, size, size, dir, attrs);
 	if (map == (phys_addr_t)DMA_MAPPING_ERROR)
 		return DMA_MAPPING_ERROR;
 
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 513913ff748626..3bb72266a75a1d 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -45,13 +45,9 @@ enum dma_sync_target {
 	SYNC_FOR_DEVICE = 1,
 };
 
-extern phys_addr_t swiotlb_tbl_map_single(struct device *hwdev,
-					  dma_addr_t tbl_dma_addr,
-					  phys_addr_t phys,
-					  size_t mapping_size,
-					  size_t alloc_size,
-					  enum dma_data_direction dir,
-					  unsigned long attrs);
+phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
+		size_t mapping_size, size_t alloc_size,
+		enum dma_data_direction dir, unsigned long attrs);
 
 extern void swiotlb_tbl_unmap_single(struct device *hwdev,
 				     phys_addr_t tlb_addr,
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index b4eea0abc3f002..92e2f54f24c01b 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -441,14 +441,11 @@ static void swiotlb_bounce(phys_addr_t orig_addr, phys_addr_t tlb_addr,
 	}
 }
 
-phys_addr_t swiotlb_tbl_map_single(struct device *hwdev,
-				   dma_addr_t tbl_dma_addr,
-				   phys_addr_t orig_addr,
-				   size_t mapping_size,
-				   size_t alloc_size,
-				   enum dma_data_direction dir,
-				   unsigned long attrs)
+phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
+		size_t mapping_size, size_t alloc_size,
+		enum dma_data_direction dir, unsigned long attrs)
 {
+	dma_addr_t tbl_dma_addr = phys_to_dma_unencrypted(hwdev, io_tlb_start);
 	unsigned long flags;
 	phys_addr_t tlb_addr;
 	unsigned int nslots, stride, index, wrap;
@@ -667,9 +664,8 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
 	trace_swiotlb_bounced(dev, phys_to_dma(dev, paddr), size,
 			      swiotlb_force);
 
-	swiotlb_addr = swiotlb_tbl_map_single(dev,
-			phys_to_dma_unencrypted(dev, io_tlb_start),
-			paddr, size, size, dir, attrs);
+	swiotlb_addr = swiotlb_tbl_map_single(dev, paddr, size, size, dir,
+			attrs);
 	if (swiotlb_addr == (phys_addr_t)DMA_MAPPING_ERROR)
 		return DMA_MAPPING_ERROR;
 
-- 
2.28.0


