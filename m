Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7446E1ED88A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 00:23:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgbmj-0004eZ-6f; Wed, 03 Jun 2020 22:22:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0WRj=7Q=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jgbmi-0004e1-6H
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 22:22:56 +0000
X-Inumbo-ID: c2534aac-a5e8-11ea-adbf-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2534aac-a5e8-11ea-adbf-12813bfff9fa;
 Wed, 03 Jun 2020 22:22:50 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62443207D0;
 Wed,  3 Jun 2020 22:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591222969;
 bh=z/W3HOqwZFpxh5RTvZrhBEC0DsqYoSYR2jgxAVw6hXQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A8Gw2iZrApw37MILwEXd0XFn8MbQQTyVONoBAo2odDCqo4bx9EMQ0+3ZRahBnmF3c
 0SbM5LE5YCEo4zkcQTFe/l6VXtj6IYfiLHSIpwoMiuBD/hlmH+w7eZtnJoVwe8uH1F
 EBekaEg39hytF9DxdM0Q7iKp0OHg9bfrinazSkS8=
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: [PATCH v2 02/11] swiotlb-xen: remove start_dma_addr
Date: Wed,  3 Jun 2020 15:22:38 -0700
Message-Id: <20200603222247.11681-2-sstabellini@kernel.org>
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

It is not strictly needed. Call virt_to_phys on xen_io_tlb_start
instead. It will be useful not to have a start_dma_addr around with the
next patches.

Note that virt_to_phys is not the same as xen_virt_to_bus but actually
it is used to compared again __pa(xen_io_tlb_start) as passed to
swiotlb_init_with_tbl, so virt_to_phys is actually what we want.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Tested-by: Corey Minyard <cminyard@mvista.com>
Tested-by: Roman Shaposhnik <roman@zededa.com>
---
Changes in v2:
- update commit message

---
---
 drivers/xen/swiotlb-xen.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index a42129cba36e..ed09f8ac34c5 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -52,8 +52,6 @@ static unsigned long xen_io_tlb_nslabs;
  * Quick lookup value of the bus address of the IOTLB.
  */
 
-static u64 start_dma_addr;
-
 /*
  * Both of these functions should avoid XEN_PFN_PHYS because phys_addr_t
  * can be 32bit when dma_addr_t is 64bit leading to a loss in
@@ -241,7 +239,6 @@ int __ref xen_swiotlb_init(int verbose, bool early)
 		m_ret = XEN_SWIOTLB_EFIXUP;
 		goto error;
 	}
-	start_dma_addr = xen_virt_to_bus(xen_io_tlb_start);
 	if (early) {
 		if (swiotlb_init_with_tbl(xen_io_tlb_start, xen_io_tlb_nslabs,
 			 verbose))
@@ -389,8 +386,8 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 	 */
 	trace_swiotlb_bounced(dev, dev_addr, size, swiotlb_force);
 
-	map = swiotlb_tbl_map_single(dev, start_dma_addr, phys,
-				     size, size, dir, attrs);
+	map = swiotlb_tbl_map_single(dev, virt_to_phys(xen_io_tlb_start),
+				     phys, size, size, dir, attrs);
 	if (map == (phys_addr_t)DMA_MAPPING_ERROR)
 		return DMA_MAPPING_ERROR;
 
-- 
2.17.1


