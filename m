Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE2521BFE3
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2020 00:34:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ju1bX-0006AA-Ll; Fri, 10 Jul 2020 22:34:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=idFW=AV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ju1bW-0005wJ-DU
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 22:34:50 +0000
X-Inumbo-ID: 86c42e3e-c2fd-11ea-bca7-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86c42e3e-c2fd-11ea-bca7-bc764e2007e4;
 Fri, 10 Jul 2020 22:34:33 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE6EE2084C;
 Fri, 10 Jul 2020 22:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594420473;
 bh=jLgIlw0XpAVuOCkBCu96F/m3f+tfTNFZAXAR4R0KYhQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vsgLFsqHx83ZxrVE357/rAy2BkLYAlHXH3STs/PYChzyTa06t95Oll0lDdW/RvhzA
 3w15KyVrAiCPA2w60Luc8SqDOVyQyqkDSy2CJJiPwbNNxRy1ZFtBmpSrg/JPH5N0pg
 53S4KsSkr+3N1JIHxPP80eE+akQ+CPF2WRZY7gSM=
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: [PATCH v3 08/11] swiotlb-xen: remove XEN_PFN_PHYS
Date: Fri, 10 Jul 2020 15:34:24 -0700
Message-Id: <20200710223427.6897-8-sstabellini@kernel.org>
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

XEN_PFN_PHYS is only used in one place in swiotlb-xen making things more
complex than need to be.

Remove the definition of XEN_PFN_PHYS and open code the cast in the one
place where it is needed.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 drivers/xen/swiotlb-xen.c | 7 +------
 include/xen/page.h        | 1 -
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index e2c35f45f91e..03d118b6c141 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -52,11 +52,6 @@ static unsigned long xen_io_tlb_nslabs;
  * Quick lookup value of the bus address of the IOTLB.
  */
 
-/*
- * Both of these functions should avoid XEN_PFN_PHYS because phys_addr_t
- * can be 32bit when dma_addr_t is 64bit leading to a loss in
- * information if the shift is done before casting to 64bit.
- */
 static inline dma_addr_t xen_phys_to_bus(struct device *dev, phys_addr_t paddr)
 {
 	unsigned long bfn = pfn_to_bfn(XEN_PFN_DOWN(paddr));
@@ -101,7 +96,7 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 {
 	unsigned long bfn = XEN_PFN_DOWN(dma_addr);
 	unsigned long xen_pfn = bfn_to_local_pfn(bfn);
-	phys_addr_t paddr = XEN_PFN_PHYS(xen_pfn);
+	phys_addr_t paddr = (phys_addr_t)xen_pfn << XEN_PAGE_SHIFT;
 
 	/* If the address is outside our domain, it CAN
 	 * have the same virtual address as another address
diff --git a/include/xen/page.h b/include/xen/page.h
index df6d6b6ec66e..285677b42943 100644
--- a/include/xen/page.h
+++ b/include/xen/page.h
@@ -24,7 +24,6 @@
 
 #define XEN_PFN_DOWN(x)	((x) >> XEN_PAGE_SHIFT)
 #define XEN_PFN_UP(x)	(((x) + XEN_PAGE_SIZE-1) >> XEN_PAGE_SHIFT)
-#define XEN_PFN_PHYS(x)	((phys_addr_t)(x) << XEN_PAGE_SHIFT)
 
 #include <asm/xen/page.h>
 
-- 
2.17.1


