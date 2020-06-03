Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 629301ED886
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 00:22:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgbme-0004b7-GS; Wed, 03 Jun 2020 22:22:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0WRj=7Q=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jgbmd-0004ad-7B
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 22:22:51 +0000
X-Inumbo-ID: c2a0bb66-a5e8-11ea-81bc-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2a0bb66-a5e8-11ea-81bc-bc764e2007e4;
 Wed, 03 Jun 2020 22:22:50 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD192207ED;
 Wed,  3 Jun 2020 22:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591222970;
 bh=8roukE2cTqX3x3U/iL+TWs1iGe9wtzQx9xz7olDA5jo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qfq6j7xRVNuYFJciHIBfv0Hg3QKcp+rEpTkPApdVaF/0j83toOfu9Qb2RDayzq07g
 eWKPjP2zWTV/ifm1xQvO+4YmzvyVJYmqgiUwWnpxQitIuHoRSHJxXT/YY2jtK9kkWD
 9g33HwxMV7DGdAnc5ryX5OYBot/+trzQbyHC4d8E=
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: [PATCH v2 03/11] swiotlb-xen: add struct device* parameter to
 xen_phys_to_bus
Date: Wed,  3 Jun 2020 15:22:39 -0700
Message-Id: <20200603222247.11681-3-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2006031506590.6774@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2006031506590.6774@sstabellini-ThinkPad-T480s>
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
Cc: sstabellini@kernel.org, roman@zededa.com, linux-kernel@vger.kernel.org,
 tamas@tklengyel.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

The parameter is unused in this patch.
No functional changes.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Tested-by: Corey Minyard <cminyard@mvista.com>
Tested-by: Roman Shaposhnik <roman@zededa.com>
---
 drivers/xen/swiotlb-xen.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index ed09f8ac34c5..1c44dbc69b70 100644
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
@@ -367,7 +367,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 				unsigned long attrs)
 {
 	phys_addr_t map, phys = page_to_phys(page) + offset;
-	dma_addr_t dev_addr = xen_phys_to_bus(phys);
+	dma_addr_t dev_addr = xen_phys_to_bus(dev, phys);
 
 	BUG_ON(dir == DMA_NONE);
 	/*
@@ -392,7 +392,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 		return DMA_MAPPING_ERROR;
 
 	phys = map;
-	dev_addr = xen_phys_to_bus(map);
+	dev_addr = xen_phys_to_bus(dev, map);
 
 	/*
 	 * Ensure that the address returned is DMA'ble
@@ -536,7 +536,7 @@ xen_swiotlb_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
 static int
 xen_swiotlb_dma_supported(struct device *hwdev, u64 mask)
 {
-	return xen_virt_to_bus(xen_io_tlb_end - 1) <= mask;
+	return xen_virt_to_bus(hwdev, xen_io_tlb_end - 1) <= mask;
 }
 
 const struct dma_map_ops xen_swiotlb_dma_ops = {
-- 
2.17.1


