Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2A721BFE5
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2020 00:34:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ju1bL-0005zf-0z; Fri, 10 Jul 2020 22:34:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=idFW=AV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ju1bI-0005wR-S6
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 22:34:36 +0000
X-Inumbo-ID: 8683f058-c2fd-11ea-903c-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8683f058-c2fd-11ea-903c-12813bfff9fa;
 Fri, 10 Jul 2020 22:34:33 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3DB1E207FB;
 Fri, 10 Jul 2020 22:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594420472;
 bh=/MGI6bbpyfeW2PBoCKZ5Cz+tMk9tLtI9QoqYjLImzVc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LgBdVYBgc9RgqvwP366WyyPlA8UgtCJ/fDBUVewj431Q3fqI3qEUCdwjfhqNZSC4q
 wQSN9eut6WxOj7lthfXxS+fEOCBgtpMtDbQokobURzuL/PwrI51K5viOHPCx9hRVP5
 735P3IzlseBdexGGPHvpyrwV7szvunail7KEBR60=
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: [PATCH v3 07/11] swiotlb-xen: add struct device * parameter to
 is_xen_swiotlb_buffer
Date: Fri, 10 Jul 2020 15:34:23 -0700
Message-Id: <20200710223427.6897-7-sstabellini@kernel.org>
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
 drivers/xen/swiotlb-xen.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 8a3a7bcc5ec0..e2c35f45f91e 100644
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
@@ -431,7 +431,7 @@ static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
 		xen_dma_sync_for_cpu(hwdev, dev_addr, paddr, size, dir);
 
 	/* NOTE: We use dev_addr here, not paddr! */
-	if (is_xen_swiotlb_buffer(dev_addr))
+	if (is_xen_swiotlb_buffer(hwdev, dev_addr))
 		swiotlb_tbl_unmap_single(hwdev, paddr, size, size, dir, attrs);
 }
 
@@ -444,7 +444,7 @@ xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
 	if (!dev_is_dma_coherent(dev))
 		xen_dma_sync_for_cpu(dev, dma_addr, paddr, size, dir);
 
-	if (is_xen_swiotlb_buffer(dma_addr))
+	if (is_xen_swiotlb_buffer(dev, dma_addr))
 		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_CPU);
 }
 
@@ -454,7 +454,7 @@ xen_swiotlb_sync_single_for_device(struct device *dev, dma_addr_t dma_addr,
 {
 	phys_addr_t paddr = xen_bus_to_phys(dev, dma_addr);
 
-	if (is_xen_swiotlb_buffer(dma_addr))
+	if (is_xen_swiotlb_buffer(dev, dma_addr))
 		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_DEVICE);
 
 	if (!dev_is_dma_coherent(dev))
-- 
2.17.1


