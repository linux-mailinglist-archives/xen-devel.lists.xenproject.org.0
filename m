Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 884831DC32A
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 01:46:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbYOq-0007x6-NM; Wed, 20 May 2020 23:45:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P2h4=7C=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jbYOp-0007ww-Hg
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 23:45:23 +0000
X-Inumbo-ID: f88ee45a-9af3-11ea-aaaa-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f88ee45a-9af3-11ea-aaaa-12813bfff9fa;
 Wed, 20 May 2020 23:45:23 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1812920748;
 Wed, 20 May 2020 23:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590018322;
 bh=2rJi6KfJ7cKpdb3KgYosM8AG09eJiSBLH85aYQo6tfE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z/XEnES7H/3TARKOmkB1qbDupxUWdE2Iq1shY3iRXvUvUqgWMI9JC8cDHfeS8Yl+u
 +HcspWBrKeLpETCuygnY/0/UPeXGziAinuXs3JHNLhNZdDIMXyospJd0iz+iNx4WVf
 DXuaL5c43gHfkKb/gZV0rdGZ8hqWUrfcfPK0H0bI=
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: [PATCH 01/10] swiotlb-xen: use vmalloc_to_page on vmalloc virt
 addresses
Date: Wed, 20 May 2020 16:45:11 -0700
Message-Id: <20200520234520.22563-1-sstabellini@kernel.org>
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

From: Boris Ostrovsky <boris.ostrovsky@oracle.com>

Don't just assume that virt_to_page works on all virtual addresses.
Instead add a is_vmalloc_addr check and use vmalloc_to_page on vmalloc
virt addresses.

Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 drivers/xen/swiotlb-xen.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index b6d27762c6f8..a42129cba36e 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -335,6 +335,7 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
 	int order = get_order(size);
 	phys_addr_t phys;
 	u64 dma_mask = DMA_BIT_MASK(32);
+	struct page *pg;
 
 	if (hwdev && hwdev->coherent_dma_mask)
 		dma_mask = hwdev->coherent_dma_mask;
@@ -346,9 +347,11 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
 	/* Convert the size to actually allocated. */
 	size = 1UL << (order + XEN_PAGE_SHIFT);
 
+	pg = is_vmalloc_addr(vaddr) ? vmalloc_to_page(vaddr) :
+				      virt_to_page(vaddr);
 	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
 		     range_straddles_page_boundary(phys, size)) &&
-	    TestClearPageXenRemapped(virt_to_page(vaddr)))
+	    TestClearPageXenRemapped(pg))
 		xen_destroy_contiguous_region(phys, order);
 
 	xen_free_coherent_pages(hwdev, size, vaddr, (dma_addr_t)phys, attrs);
-- 
2.17.1


