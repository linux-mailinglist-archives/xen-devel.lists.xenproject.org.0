Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 968031ED88B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 00:23:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgbmj-0004eu-H9; Wed, 03 Jun 2020 22:22:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0WRj=7Q=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jgbmi-0004e2-6b
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 22:22:56 +0000
X-Inumbo-ID: c4728ac8-a5e8-11ea-9dbe-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4728ac8-a5e8-11ea-9dbe-bc764e2007e4;
 Wed, 03 Jun 2020 22:22:53 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EAB97207F5;
 Wed,  3 Jun 2020 22:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591222973;
 bh=p13t7h6OgZd3c3rlyfugdVMmCRk9goZBfF3/sQLkgpI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AurZxJAJFOB7GSce2yJBE5z0Eu104WUXUTPvSKeFv/irIMHX/PuBIfT0tdjwggKaW
 7GCQsJ2VWCh327dm4Ybc2CJe54tOeeR6oSZ7Eo14y3kYiRMph040HSWsEV6/ddWT2r
 FSteCb/rY0YjJJSQg6BgK7qST3egSc9aGEbLg8l0=
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: [PATCH v2 09/11] swiotlb-xen: rename xen_phys_to_bus to
 xen_phys_to_dma and xen_bus_to_phys to xen_dma_to_phys
Date: Wed,  3 Jun 2020 15:22:45 -0700
Message-Id: <20200603222247.11681-9-sstabellini@kernel.org>
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

so that their names can better describe their behavior.

No functional changes.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 drivers/xen/swiotlb-xen.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 60ef07440905..41129c02d59a 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -57,7 +57,7 @@ static unsigned long xen_io_tlb_nslabs;
  * can be 32bit when dma_addr_t is 64bit leading to a loss in
  * information if the shift is done before casting to 64bit.
  */
-static inline dma_addr_t xen_phys_to_bus(struct device *dev, phys_addr_t paddr)
+static inline dma_addr_t xen_phys_to_dma(struct device *dev, phys_addr_t paddr)
 {
 	unsigned long bfn = pfn_to_bfn(XEN_PFN_DOWN(paddr));
 	dma_addr_t dma = (dma_addr_t)bfn << XEN_PAGE_SHIFT;
@@ -67,7 +67,7 @@ static inline dma_addr_t xen_phys_to_bus(struct device *dev, phys_addr_t paddr)
 	return phys_to_dma(dev, dma);
 }
 
-static inline phys_addr_t xen_bus_to_phys(struct device *dev,
+static inline phys_addr_t xen_dma_to_phys(struct device *dev,
 					  dma_addr_t dma_addr)
 {
 	phys_addr_t baddr = dma_to_phys(dev, dma_addr);
@@ -80,7 +80,7 @@ static inline phys_addr_t xen_bus_to_phys(struct device *dev,
 
 static inline dma_addr_t xen_virt_to_bus(struct device *dev, void *address)
 {
-	return xen_phys_to_bus(dev, virt_to_phys(address));
+	return xen_phys_to_dma(dev, virt_to_phys(address));
 }
 
 static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
@@ -309,7 +309,7 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 	 * Do not use virt_to_phys(ret) because on ARM it doesn't correspond
 	 * to *dma_handle. */
 	phys = dma_to_phys(hwdev, *dma_handle);
-	dev_addr = xen_phys_to_bus(hwdev, phys);
+	dev_addr = xen_phys_to_dma(hwdev, phys);
 	if (((dev_addr + size - 1 <= dma_mask)) &&
 	    !range_straddles_page_boundary(phys, size))
 		*dma_handle = dev_addr;
@@ -340,7 +340,7 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
 
 	/* do not use virt_to_phys because on ARM it doesn't return you the
 	 * physical address */
-	phys = xen_bus_to_phys(hwdev, dev_addr);
+	phys = xen_dma_to_phys(hwdev, dev_addr);
 
 	/* Convert the size to actually allocated. */
 	size = 1UL << (order + XEN_PAGE_SHIFT);
@@ -369,7 +369,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 				unsigned long attrs)
 {
 	phys_addr_t map, phys = page_to_phys(page) + offset;
-	dma_addr_t dev_addr = xen_phys_to_bus(dev, phys);
+	dma_addr_t dev_addr = xen_phys_to_dma(dev, phys);
 
 	BUG_ON(dir == DMA_NONE);
 	/*
@@ -394,7 +394,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 		return DMA_MAPPING_ERROR;
 
 	phys = map;
-	dev_addr = xen_phys_to_bus(dev, map);
+	dev_addr = xen_phys_to_dma(dev, map);
 
 	/*
 	 * Ensure that the address returned is DMA'ble
@@ -422,7 +422,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-	phys_addr_t paddr = xen_bus_to_phys(hwdev, dev_addr);
+	phys_addr_t paddr = xen_dma_to_phys(hwdev, dev_addr);
 
 	BUG_ON(dir == DMA_NONE);
 
@@ -438,7 +438,7 @@ static void
 xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
 		size_t size, enum dma_data_direction dir)
 {
-	phys_addr_t paddr = xen_bus_to_phys(dev, dma_addr);
+	phys_addr_t paddr = xen_dma_to_phys(dev, dma_addr);
 
 	if (!dev_is_dma_coherent(dev))
 		xen_dma_sync_for_cpu(dev, dma_addr, paddr, size, dir);
@@ -451,7 +451,7 @@ static void
 xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
 		size_t size, enum dma_data_direction dir)
 {
-	phys_addr_t paddr = xen_bus_to_phys(dev, dma_addr);
+	phys_addr_t paddr = xen_dma_to_phys(dev, dma_addr);
 
 	if (is_xen_swiotlb_buffer(dev, dma_addr))
 		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_DEVICE);
-- 
2.17.1


