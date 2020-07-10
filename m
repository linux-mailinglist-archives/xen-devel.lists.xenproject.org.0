Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EB221BFE8
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2020 00:35:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ju1bF-0005wr-FP; Fri, 10 Jul 2020 22:34:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=idFW=AV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ju1bE-0005wR-8W
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 22:34:32 +0000
X-Inumbo-ID: 8451828d-c2fd-11ea-903c-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8451828d-c2fd-11ea-903c-12813bfff9fa;
 Fri, 10 Jul 2020 22:34:31 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75FCA207BB;
 Fri, 10 Jul 2020 22:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594420470;
 bh=HgiPdFTfQq90v0qFVQCJWX2B++kBNShoCcFtOr7ILuk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=phL1a1HmIcF5IqHsARIBc9mSooTg4t/lbu/szXY/+4PhXlbLh/EXV1Y82x/OI9S9m
 PfJ0zM3h9v6KPmNL9qpxrZIycqVE+0H2/vQDY6n6j7N2e+o1NfgbR3z1M9k+3NlkQ+
 bhq96IoKnNBDNwDZZLRkhAXx4YUDXm9SKmyqiY3E=
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: [PATCH v3 03/11] swiotlb-xen: add struct device * parameter to
 xen_phys_to_bus
Date: Fri, 10 Jul 2020 15:34:19 -0700
Message-Id: <20200710223427.6897-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2007101521290.4124@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2007101521290.4124@sstabellini-ThinkPad-T480s>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: hch@infradead.org, xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 linux-kernel@vger.kernel.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

No functional changes. The parameter is unused in this patch but will be
used by next patches.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Tested-by: Corey Minyard <cminyard@mvista.com>
Tested-by: Roman Shaposhnik <roman@zededa.com>
---
Changes in v3:
- add whitespace in title
- improve commit message
---
 drivers/xen/swiotlb-xen.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 89a775948a02..dbe710a59bf2 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -57,7 +57,7 @@ static unsigned long xen_io_tlb_nslabs;
  * can be 32bit when dma_addr_t is 64bit leading to a loss in
  * information if the shift is done before casting to 64bit.
  */
-static inline dma_addr_t xen_phys_to_bus(phys_addr_t paddr)
+static inline dma_addr_t xen_phys_to_bus(struct device *dev, phys_addr_t paddr)
 {
 	unsigned long bfn = pfn_to_bfn(XEN_PFN_DOWN(paddr));
 	dma_addr_t dma = (dma_addr_t)bfn << XEN_PAGE_SHIFT;
@@ -78,9 +78,9 @@ static inline phys_addr_t xen_bus_to_phys(dma_addr_t baddr)
 	return paddr;
 }
 
-static inline dma_addr_t xen_virt_to_bus(void *address)
+static inline dma_addr_t xen_virt_to_bus(struct device *dev, void *address)
 {
-	return xen_phys_to_bus(virt_to_phys(address));
+	return xen_phys_to_bus(dev, virt_to_phys(address));
 }
 
 static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
@@ -309,7 +309,7 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 	 * Do not use virt_to_phys(ret) because on ARM it doesn't correspond
 	 * to *dma_handle. */
 	phys = *dma_handle;
-	dev_addr = xen_phys_to_bus(phys);
+	dev_addr = xen_phys_to_bus(hwdev, phys);
 	if (((dev_addr + size - 1 <= dma_mask)) &&
 	    !range_straddles_page_boundary(phys, size))
 		*dma_handle = dev_addr;
@@ -370,7 +370,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 				unsigned long attrs)
 {
 	phys_addr_t map, phys = page_to_phys(page) + offset;
-	dma_addr_t dev_addr = xen_phys_to_bus(phys);
+	dma_addr_t dev_addr = xen_phys_to_bus(dev, phys);
 
 	BUG_ON(dir == DMA_NONE);
 	/*
@@ -395,7 +395,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 		return DMA_MAPPING_ERROR;
 
 	phys = map;
-	dev_addr = xen_phys_to_bus(map);
+	dev_addr = xen_phys_to_bus(dev, map);
 
 	/*
 	 * Ensure that the address returned is DMA'ble
@@ -539,7 +539,7 @@ xen_swiotlb_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
 static int
 xen_swiotlb_dma_supported(struct device *hwdev, u64 mask)
 {
-	return xen_virt_to_bus(xen_io_tlb_end - 1) <= mask;
+	return xen_virt_to_bus(hwdev, xen_io_tlb_end - 1) <= mask;
 }
 
 const struct dma_map_ops xen_swiotlb_dma_ops = {
-- 
2.17.1


