Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920CE1DC32C
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 01:46:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbYOr-0007xN-VS; Wed, 20 May 2020 23:45:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P2h4=7C=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jbYOq-0007x1-9y
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 23:45:24 +0000
X-Inumbo-ID: f88ee45b-9af3-11ea-aaaa-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f88ee45b-9af3-11ea-aaaa-12813bfff9fa;
 Wed, 20 May 2020 23:45:23 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 88F6120873;
 Wed, 20 May 2020 23:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590018322;
 bh=Vv+EdXpTbwnuZjYd1z0k52yCJtFShb1TwXsEeRgOU74=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sBVUvkEnVb5CTQSI2t90TDC/MfBITVXjrBOqmirzQIzAeJwdr1sVZyo9BaUXBQWb6
 LLUhyQ43M/LP6uZtRnjF0h93Ma1z5Q2Gci6bg0La5Pw99Q96J4Tt/c0jbgFC2I1Iiz
 ES8P300ufpQlz2z+r0K7tnfeD8kqZ32GjZyT1K4U=
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: [PATCH 02/10] swiotlb-xen: remove start_dma_addr
Date: Wed, 20 May 2020 16:45:12 -0700
Message-Id: <20200520234520.22563-2-sstabellini@kernel.org>
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

It is not strictly needed. Call virt_to_phys on xen_io_tlb_start
instead. It will be useful not to have a start_dma_addr around with the
next patches.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 drivers/xen/swiotlb-xen.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index a42129cba36e..b5e0492b07b9 100644
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
@@ -389,7 +386,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
 	 */
 	trace_swiotlb_bounced(dev, dev_addr, size, swiotlb_force);
 
-	map = swiotlb_tbl_map_single(dev, start_dma_addr, phys,
+	map = swiotlb_tbl_map_single(dev, virt_to_phys(xen_io_tlb_start), phys,
 				     size, size, dir, attrs);
 	if (map == (phys_addr_t)DMA_MAPPING_ERROR)
 		return DMA_MAPPING_ERROR;
-- 
2.17.1


