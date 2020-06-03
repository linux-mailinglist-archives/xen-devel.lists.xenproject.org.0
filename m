Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E5F1ED897
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 00:23:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgbmy-0004rm-AD; Wed, 03 Jun 2020 22:23:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0WRj=7Q=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jgbmx-0004qu-5u
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 22:23:11 +0000
X-Inumbo-ID: c3d72efc-a5e8-11ea-adbf-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3d72efc-a5e8-11ea-adbf-12813bfff9fa;
 Wed, 03 Jun 2020 22:22:52 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA27C20872;
 Wed,  3 Jun 2020 22:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591222972;
 bh=rOC8u/GP/YnBySLRTiNQTpMbuYdIjD0O7PCIgWG9wIE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hu2DRe+TkdcV+6abc7EOrpvaGRQAjn0UTkKID03ucjKZlicTCoUJ/0mOTE7Q0GdBn
 cpB8oj/ZrHJub+xseWoI3lPp1ARiFe+gh3jDJOUsq0PDZjjtAHyl1p6+aALT5p2pFL
 xgwEM8EVciiWcURbrwdY+NsDEdR1wLDmTAe8nRNc=
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: [PATCH v2 07/11] swiotlb-xen: add struct device* parameter to
 is_xen_swiotlb_buffer
Date: Wed,  3 Jun 2020 15:22:43 -0700
Message-Id: <20200603222247.11681-7-sstabellini@kernel.org>
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
 drivers/xen/swiotlb-xen.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 9b846c143c90..0a6cb67f0fc4 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -97,7 +97,7 @@ static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
 	return 0;
 }
 
-static int is_xen_swiotlb_buffer(dma_addr_t dma_addr)
+static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 {
 	unsigned long bfn = XEN_PFN_DOWN(dma_addr);
 	unsigned long xen_pfn = bfn_to_local_pfn(bfn);
@@ -428,7 +428,7 @@ static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
 		xen_dma_sync_for_cpu(hwdev, dev_addr, paddr, size, dir);
 
 	/* NOTE: We use dev_addr here, not paddr! */
-	if (is_xen_swiotlb_buffer(dev_addr))
+	if (is_xen_swiotlb_buffer(hwdev, dev_addr))
 		swiotlb_tbl_unmap_single(hwdev, paddr, size, size, dir, attrs);
 }
 
@@ -441,7 +441,7 @@ xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
 	if (!dev_is_dma_coherent(dev))
 		xen_dma_sync_for_cpu(dev, dma_addr, paddr, size, dir);
 
-	if (is_xen_swiotlb_buffer(dma_addr))
+	if (is_xen_swiotlb_buffer(dev, dma_addr))
 		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_CPU);
 }
 
@@ -451,7 +451,7 @@ xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
 {
 	phys_addr_t paddr = xen_bus_to_phys(dev, dma_addr);
 
-	if (is_xen_swiotlb_buffer(dma_addr))
+	if (is_xen_swiotlb_buffer(dev, dma_addr))
 		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_DEVICE);
 
 	if (!dev_is_dma_coherent(dev))
-- 
2.17.1


