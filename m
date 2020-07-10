Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B5B21BFDE
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2020 00:34:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ju1bN-00061J-E3; Fri, 10 Jul 2020 22:34:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=idFW=AV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ju1bM-0005wJ-Ct
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 22:34:40 +0000
X-Inumbo-ID: 85f912ee-c2fd-11ea-b7bb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85f912ee-c2fd-11ea-b7bb-bc764e2007e4;
 Fri, 10 Jul 2020 22:34:32 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D3BB2088E;
 Fri, 10 Jul 2020 22:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594420471;
 bh=Vs0xqtsJWIWR1q7n2x/kejMEtvYSj5EpVIj/uSYTM10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IEfN+YoOhvU0/hM8GDqS8n1h5AfhunMYm2GQc6siAJRM0SWOS7Hl7yZCXjRCpO/ev
 3VLAOXEdk+xBD0On1LhX+YN09vwO5Hjl5QpGMH4phflyXdv0socTbjszzkegJEe48O
 WsYaPP0p6K8SyBbfj59+AuYV6o64CD7Qi3gLt+Jc=
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: [PATCH v3 05/11] swiotlb-xen: add struct device * parameter to
 xen_dma_sync_for_cpu
Date: Fri, 10 Jul 2020 15:34:21 -0700
Message-Id: <20200710223427.6897-5-sstabellini@kernel.org>
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
 arch/arm/xen/mm.c         | 5 +++--
 drivers/xen/swiotlb-xen.c | 4 ++--
 include/xen/swiotlb-xen.h | 5 +++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index d40e9e5fc52b..1a00e8003c64 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -71,8 +71,9 @@ static void dma_cache_maint(dma_addr_t handle, size_t size, u32 op)
  * pfn_valid returns true the pages is local and we can use the native
  * dma-direct functions, otherwise we call the Xen specific version.
  */
-void xen_dma_sync_for_cpu(dma_addr_t handle, phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
+			  phys_addr_t paddr, size_t size,
+			  enum dma_data_direction dir)
 {
 	if (pfn_valid(PFN_DOWN(handle)))
 		arch_sync_dma_for_cpu(paddr, size, dir);
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index a8e447137faf..d04b7a15124f 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -428,7 +428,7 @@ static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
 	BUG_ON(dir == DMA_NONE);
 
 	if (!dev_is_dma_coherent(hwdev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		xen_dma_sync_for_cpu(dev_addr, paddr, size, dir);
+		xen_dma_sync_for_cpu(hwdev, dev_addr, paddr, size, dir);
 
 	/* NOTE: We use dev_addr here, not paddr! */
 	if (is_xen_swiotlb_buffer(dev_addr))
@@ -442,7 +442,7 @@ xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
 	phys_addr_t paddr = xen_bus_to_phys(dev, dma_addr);
 
 	if (!dev_is_dma_coherent(dev))
-		xen_dma_sync_for_cpu(dma_addr, paddr, size, dir);
+		xen_dma_sync_for_cpu(dev, dma_addr, paddr, size, dir);
 
 	if (is_xen_swiotlb_buffer(dma_addr))
 		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_CPU);
diff --git a/include/xen/swiotlb-xen.h b/include/xen/swiotlb-xen.h
index ffc0d3902b71..f62d1854780b 100644
--- a/include/xen/swiotlb-xen.h
+++ b/include/xen/swiotlb-xen.h
@@ -4,8 +4,9 @@
 
 #include <linux/swiotlb.h>
 
-void xen_dma_sync_for_cpu(dma_addr_t handle, phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir);
+void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
+			  phys_addr_t paddr, size_t size,
+			  enum dma_data_direction dir);
 void xen_dma_sync_for_device(dma_addr_t handle, phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir);
 
-- 
2.17.1


