Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 270C51DC325
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 01:46:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbYP1-00080n-4d; Wed, 20 May 2020 23:45:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P2h4=7C=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jbYOz-00080C-IB
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 23:45:33 +0000
X-Inumbo-ID: f9473532-9af3-11ea-aaaa-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9473532-9af3-11ea-aaaa-12813bfff9fa;
 Wed, 20 May 2020 23:45:24 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 58CB720899;
 Wed, 20 May 2020 23:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590018323;
 bh=KOZVKoHc4nwdfLj2dJHT6a8axx8miTwmLiOrwBfDB1k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zrzyv7dwGOoZVOjzN/lI6uRiajVHs9Vwy9l2vAnumI9ByScLvTFwCz0GbKgQGL6mH
 nHTux0QWT9tRMSYP25Dz44CDAsqapcfHK1zzX6Jz+gOjOGZU9NJy7LnunoCzzI+fz8
 hdxrCpqYM0hQY5MHAQFgGUEtfwix69+Jsu+d9KVs=
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: [PATCH 04/10] swiotlb-xen: add struct device* parameter to
 xen_bus_to_phys
Date: Wed, 20 May 2020 16:45:14 -0700
Message-Id: <20200520234520.22563-4-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2005201628330.27502@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2005201628330.27502@sstabellini-ThinkPad-T480s>
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 linux-kernel@vger.kernel.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

The parameter is unused in this patch.
No functional changes.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 drivers/xen/swiotlb-xen.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 958ee5517e0b..9b4306a56feb 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -67,7 +67,7 @@ static inline dma_addr_t xen_phys_to_bus(struct device *dev, phys_addr_t paddr)
 	return dma;
 }
 
-static inline phys_addr_t xen_bus_to_phys(dma_addr_t baddr)
+static inline phys_addr_t xen_bus_to_phys(struct device *dev, dma_addr_t baddr)
 {
 	unsigned long xen_pfn = bfn_to_pfn(XEN_PFN_DOWN(baddr));
 	dma_addr_t dma = (dma_addr_t)xen_pfn << XEN_PAGE_SHIFT;
@@ -339,7 +339,7 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
 
 	/* do not use virt_to_phys because on ARM it doesn't return you the
 	 * physical address */
-	phys = xen_bus_to_phys(dev_addr);
+	phys = xen_bus_to_phys(hwdev, dev_addr);
 
 	/* Convert the size to actually allocated. */
 	size = 1UL << (order + XEN_PAGE_SHIFT);
@@ -420,7 +420,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-	phys_addr_t paddr = xen_bus_to_phys(dev_addr);
+	phys_addr_t paddr = xen_bus_to_phys(hwdev, dev_addr);
 
 	BUG_ON(dir == DMA_NONE);
 
@@ -436,7 +436,7 @@ static void
 xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
 		size_t size, enum dma_data_direction dir)
 {
-	phys_addr_t paddr = xen_bus_to_phys(dma_addr);
+	phys_addr_t paddr = xen_bus_to_phys(dev, dma_addr);
 
 	if (!dev_is_dma_coherent(dev))
 		xen_dma_sync_for_cpu(dma_addr, paddr, size, dir);
@@ -449,7 +449,7 @@ static void
 xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
 		size_t size, enum dma_data_direction dir)
 {
-	phys_addr_t paddr = xen_bus_to_phys(dma_addr);
+	phys_addr_t paddr = xen_bus_to_phys(dev, dma_addr);
 
 	if (is_xen_swiotlb_buffer(dma_addr))
 		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_DEVICE);
-- 
2.17.1


