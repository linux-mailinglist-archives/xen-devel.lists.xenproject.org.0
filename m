Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B9A1DC32E
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 01:46:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbYOt-0007xb-6b; Wed, 20 May 2020 23:45:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P2h4=7C=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jbYOr-0007xF-BZ
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 23:45:25 +0000
X-Inumbo-ID: f9c78d2c-9af3-11ea-ae69-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9c78d2c-9af3-11ea-ae69-bc764e2007e4;
 Wed, 20 May 2020 23:45:25 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30682208B3;
 Wed, 20 May 2020 23:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590018324;
 bh=L20gKWj8zlek7VJV9PmfeUsnev8ccHkezeGqO5r/j0c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pnTOgRAhyAKhhIqmhcyTNxvwKS7YZkziiXSq2B8Bf3L2jwD/2wcYZFCXYaLBTB/H3
 a5SP8AwC6k1h40imuvELO7bRpU77mncT/fN5LRmTcW8ndOxsBdcFDJtcHDYQ+ee4yM
 Rw5m1CKwyl4TbFieBldPA5YNa+ZIT6x9HG5pDjsw=
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: [PATCH 06/10] swiotlb-xen: add struct device* parameter to
 xen_dma_sync_for_device
Date: Wed, 20 May 2020 16:45:16 -0700
Message-Id: <20200520234520.22563-6-sstabellini@kernel.org>
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
 arch/arm/xen/mm.c         | 5 +++--
 drivers/xen/swiotlb-xen.c | 4 ++--
 include/xen/swiotlb-xen.h | 5 +++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 1a00e8003c64..f2414ea40a79 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -81,8 +81,9 @@ void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
 		dma_cache_maint(handle, size, GNTTAB_CACHE_INVAL);
 }
 
-void xen_dma_sync_for_device(dma_addr_t handle, phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
+			     phys_addr_t paddr, size_t size,
+			     enum dma_data_direction dir)
 {
 	if (pfn_valid(PFN_DOWN(handle)))
 		arch_sync_dma_for_device(paddr, size, dir);
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index f9aa932973dd..ef58f05ae445 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -405,7 +405,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 
 done:
 	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		xen_dma_sync_for_device(dev_addr, phys, size, dir);
+		xen_dma_sync_for_device(dev, dev_addr, phys, size, dir);
 	return dev_addr;
 }
 
@@ -455,7 +455,7 @@ xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
 		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_DEVICE);
 
 	if (!dev_is_dma_coherent(dev))
-		xen_dma_sync_for_device(dma_addr, paddr, size, dir);
+		xen_dma_sync_for_device(dev, dma_addr, paddr, size, dir);
 }
 
 /*
diff --git a/include/xen/swiotlb-xen.h b/include/xen/swiotlb-xen.h
index f62d1854780b..6d235fe2b92d 100644
--- a/include/xen/swiotlb-xen.h
+++ b/include/xen/swiotlb-xen.h
@@ -7,8 +7,9 @@
 void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
 			  phys_addr_t paddr, size_t size,
 			  enum dma_data_direction dir);
-void xen_dma_sync_for_device(dma_addr_t handle, phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir);
+void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
+			     phys_addr_t paddr, size_t size,
+			     enum dma_data_direction dir);
 
 extern int xen_swiotlb_init(int verbose, bool early);
 extern const struct dma_map_ops xen_swiotlb_dma_ops;
-- 
2.17.1


