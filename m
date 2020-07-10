Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4358721BFF0
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2020 00:35:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ju1bd-0006Fz-1P; Fri, 10 Jul 2020 22:34:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=idFW=AV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ju1bb-0005wJ-Dc
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 22:34:55 +0000
X-Inumbo-ID: 8709b2d8-c2fd-11ea-8496-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8709b2d8-c2fd-11ea-8496-bc764e2007e4;
 Fri, 10 Jul 2020 22:34:34 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2675920720;
 Fri, 10 Jul 2020 22:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594420473;
 bh=ucoDUHYkjSRPOm2qbV+240NTBrykvQHA5UqCzIUfAYE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WejIoLlLic1B7Dmj085WZh457ou/ls3auQwQETNjRv3STFqcYkb+c5Eos22MCsgQy
 j5Km6FnmA73P5v2e7pm1hFt3dq0NkCt5v3auBQMG9F3ycKHomSh8rx7b+F+jgUHNXX
 lEF1m7TGustCcFirrHcsPh7b/hHQkhV31TFi0JfY=
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: [PATCH v3 09/11] swiotlb-xen: introduce phys_to_dma/dma_to_phys
 translations
Date: Fri, 10 Jul 2020 15:34:25 -0700
Message-Id: <20200710223427.6897-9-sstabellini@kernel.org>
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

With some devices physical addresses are different than dma addresses.
To be able to deal with these cases, we need to call phys_to_dma on
physical addresses (including machine addresses in Xen terminology)
before returning them from xen_swiotlb_alloc_coherent and
xen_swiotlb_map_page.

We also need to convert dma addresses back to physical addresses using
dma_to_phys in xen_swiotlb_free_coherent and xen_swiotlb_unmap_page if
we want to do any operations on them.

Call dma_to_phys in is_xen_swiotlb_buffer.
Introduce xen_phys_to_dma and call phys_to_dma in its implementation.
Introduce xen_dma_to_phys and call dma_to_phys in its implementation.
Call xen_phys_to_dma/xen_dma_to_phys instead of
xen_phys_to_bus/xen_bus_to_phys through swiotlb-xen.c.

Everything is taken care of by these changes except for
xen_swiotlb_alloc_coherent and xen_swiotlb_free_coherent, which need a
few explicit phys_to_dma/dma_to_phys calls.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Tested-by: Corey Minyard <cminyard@mvista.com>
Tested-by: Roman Shaposhnik <roman@zededa.com>
---
Changes in v2:
- improve commit message

Changes in v3:
- add xen_phys_to_dma and xen_dma_to_phys in this patch
---
 drivers/xen/swiotlb-xen.c | 53 +++++++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 03d118b6c141..a6a95358a8cb 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -52,30 +52,39 @@ static unsigned long xen_io_tlb_nslabs;
  * Quick lookup value of the bus address of the IOTLB.
  */
 
-static inline dma_addr_t xen_phys_to_bus(struct device *dev, phys_addr_t paddr)
+static inline phys_addr_t xen_phys_to_bus(struct device *dev, phys_addr_t paddr)
 {
 	unsigned long bfn = pfn_to_bfn(XEN_PFN_DOWN(paddr));
-	dma_addr_t dma = (dma_addr_t)bfn << XEN_PAGE_SHIFT;
+	phys_addr_t baddr = (phys_addr_t)bfn << XEN_PAGE_SHIFT;
 
-	dma |= paddr & ~XEN_PAGE_MASK;
+	baddr |= paddr & ~XEN_PAGE_MASK;
+	return baddr;
+}
 
-	return dma;
+static inline dma_addr_t xen_phys_to_dma(struct device *dev, phys_addr_t paddr)
+{
+	return phys_to_dma(dev, xen_phys_to_bus(dev, paddr));
 }
 
-static inline phys_addr_t xen_bus_to_phys(struct device *dev, dma_addr_t baddr)
+static inline phys_addr_t xen_bus_to_phys(struct device *dev,
+					  phys_addr_t baddr)
 {
 	unsigned long xen_pfn = bfn_to_pfn(XEN_PFN_DOWN(baddr));
-	dma_addr_t dma = (dma_addr_t)xen_pfn << XEN_PAGE_SHIFT;
-	phys_addr_t paddr = dma;
-
-	paddr |= baddr & ~XEN_PAGE_MASK;
+	phys_addr_t paddr = (xen_pfn << XEN_PAGE_SHIFT) |
+			    (baddr & ~XEN_PAGE_MASK);
 
 	return paddr;
 }
 
+static inline phys_addr_t xen_dma_to_phys(struct device *dev,
+					  dma_addr_t dma_addr)
+{
+	return xen_bus_to_phys(dev, dma_to_phys(dev, dma_addr));
+}
+
 static inline dma_addr_t xen_virt_to_bus(struct device *dev, void *address)
 {
-	return xen_phys_to_bus(dev, virt_to_phys(address));
+	return xen_phys_to_dma(dev, virt_to_phys(address));
 }
 
 static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
@@ -94,7 +103,7 @@ static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
 
 static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 {
-	unsigned long bfn = XEN_PFN_DOWN(dma_addr);
+	unsigned long bfn = XEN_PFN_DOWN(dma_to_phys(dev, dma_addr));
 	unsigned long xen_pfn = bfn_to_local_pfn(bfn);
 	phys_addr_t paddr = (phys_addr_t)xen_pfn << XEN_PAGE_SHIFT;
 
@@ -299,12 +308,12 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 	if (hwdev && hwdev->coherent_dma_mask)
 		dma_mask = hwdev->coherent_dma_mask;
 
-	/* At this point dma_handle is the physical address, next we are
+	/* At this point dma_handle is the dma address, next we are
 	 * going to set it to the machine address.
 	 * Do not use virt_to_phys(ret) because on ARM it doesn't correspond
 	 * to *dma_handle. */
-	phys = *dma_handle;
-	dev_addr = xen_phys_to_bus(hwdev, phys);
+	phys = dma_to_phys(hwdev, *dma_handle);
+	dev_addr = xen_phys_to_dma(hwdev, phys);
 	if (((dev_addr + size - 1 <= dma_mask)) &&
 	    !range_straddles_page_boundary(phys, size))
 		*dma_handle = dev_addr;
@@ -314,6 +323,7 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 			xen_free_coherent_pages(hwdev, size, ret, (dma_addr_t)phys, attrs);
 			return NULL;
 		}
+		*dma_handle = phys_to_dma(hwdev, *dma_handle);
 		SetPageXenRemapped(virt_to_page(ret));
 	}
 	memset(ret, 0, size);
@@ -334,7 +344,7 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
 
 	/* do not use virt_to_phys because on ARM it doesn't return you the
 	 * physical address */
-	phys = xen_bus_to_phys(hwdev, dev_addr);
+	phys = xen_dma_to_phys(hwdev, dev_addr);
 
 	/* Convert the size to actually allocated. */
 	size = 1UL << (order + XEN_PAGE_SHIFT);
@@ -349,7 +359,8 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
 	    TestClearPageXenRemapped(page))
 		xen_destroy_contiguous_region(phys, order);
 
-	xen_free_coherent_pages(hwdev, size, vaddr, (dma_addr_t)phys, attrs);
+	xen_free_coherent_pages(hwdev, size, vaddr, phys_to_dma(hwdev, phys),
+				attrs);
 }
 
 /*
@@ -365,7 +376,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 				unsigned long attrs)
 {
 	phys_addr_t map, phys = page_to_phys(page) + offset;
-	dma_addr_t dev_addr = xen_phys_to_bus(dev, phys);
+	dma_addr_t dev_addr = xen_phys_to_dma(dev, phys);
 
 	BUG_ON(dir == DMA_NONE);
 	/*
@@ -390,7 +401,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 		return DMA_MAPPING_ERROR;
 
 	phys = map;
-	dev_addr = xen_phys_to_bus(dev, map);
+	dev_addr = xen_phys_to_dma(dev, map);
 
 	/*
 	 * Ensure that the address returned is DMA'ble
@@ -418,7 +429,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-	phys_addr_t paddr = xen_bus_to_phys(hwdev, dev_addr);
+	phys_addr_t paddr = xen_dma_to_phys(hwdev, dev_addr);
 
 	BUG_ON(dir == DMA_NONE);
 
@@ -434,7 +445,7 @@ static void
 xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
 		size_t size, enum dma_data_direction dir)
 {
-	phys_addr_t paddr = xen_bus_to_phys(dev, dma_addr);
+	phys_addr_t paddr = xen_dma_to_phys(dev, dma_addr);
 
 	if (!dev_is_dma_coherent(dev))
 		xen_dma_sync_for_cpu(dev, dma_addr, paddr, size, dir);
@@ -447,7 +458,7 @@ static void
 xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
 		size_t size, enum dma_data_direction dir)
 {
-	phys_addr_t paddr = xen_bus_to_phys(dev, dma_addr);
+	phys_addr_t paddr = xen_dma_to_phys(dev, dma_addr);
 
 	if (is_xen_swiotlb_buffer(dev, dma_addr))
 		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_DEVICE);
-- 
2.17.1


