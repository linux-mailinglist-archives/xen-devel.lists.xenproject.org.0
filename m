Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0181ED896
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 00:23:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgbmt-0004mm-Pm; Wed, 03 Jun 2020 22:23:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0WRj=7Q=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jgbms-0004lW-7l
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 22:23:06 +0000
X-Inumbo-ID: c502df1a-a5e8-11ea-81bc-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c502df1a-a5e8-11ea-81bc-bc764e2007e4;
 Wed, 03 Jun 2020 22:22:54 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E899D20897;
 Wed,  3 Jun 2020 22:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591222974;
 bh=lK4AfabqfBMg+UgGk9XZHrVioJuYeQJmxxbhRHjLG1Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HU0yb8Se8hTNLEEvdnECpahuasRiicyLghp6oTLQ6baEadzpC09vZdyPb/DNQntF5
 2cm5wkWTrm3qbvlueLnW1tYtdJd8pLuLNtcbZd/mDyiu2uPR+ZrQ7jvTXiQetm74Ec
 xqJAsL1OE7ZMCQrK2T3CUYQVNY6ZfhynSrMCDYa8=
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: [PATCH v2 11/11] xen/arm: call dma_to_phys on the dma_addr_t
 parameter of dma_cache_maint
Date: Wed,  3 Jun 2020 15:22:47 -0700
Message-Id: <20200603222247.11681-11-sstabellini@kernel.org>
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

dma_cache_maint is getting called passing a dma address which could be
different from a physical address.

Add a struct device* parameter to dma_cache_maint.

Translate the dma_addr_t parameter of dma_cache_maint by calling
dma_to_phys. Do it for the first page and all the following pages, in
case of multipage handling.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Tested-by: Corey Minyard <cminyard@mvista.com>
Tested-by: Roman Shaposhnik <roman@zededa.com>
---
Changes in v2:
- improve commit message
---
 arch/arm/xen/mm.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index bbad712a890d..1dc20f4bdc33 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -43,15 +43,18 @@ unsigned long xen_get_swiotlb_free_pages(unsigned int order)
 static bool hypercall_cflush = false;
 
 /* buffers in highmem or foreign pages cannot cross page boundaries */
-static void dma_cache_maint(dma_addr_t handle, size_t size, u32 op)
+static void dma_cache_maint(struct device *dev, dma_addr_t handle,
+			    size_t size, u32 op)
 {
 	struct gnttab_cache_flush cflush;
 
-	cflush.a.dev_bus_addr = handle & XEN_PAGE_MASK;
 	cflush.offset = xen_offset_in_page(handle);
 	cflush.op = op;
+	handle &= XEN_PAGE_MASK;
 
 	do {
+		cflush.a.dev_bus_addr = dma_to_phys(dev, handle);
+
 		if (size + cflush.offset > XEN_PAGE_SIZE)
 			cflush.length = XEN_PAGE_SIZE - cflush.offset;
 		else
@@ -60,7 +63,7 @@ static void dma_cache_maint(dma_addr_t handle, size_t size, u32 op)
 		HYPERVISOR_grant_table_op(GNTTABOP_cache_flush, &cflush, 1);
 
 		cflush.offset = 0;
-		cflush.a.dev_bus_addr += cflush.length;
+		handle += cflush.length;
 		size -= cflush.length;
 	} while (size);
 }
@@ -79,7 +82,7 @@ void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
 	if (pfn_valid(PFN_DOWN(dma_to_phys(dev, handle))))
 		arch_sync_dma_for_cpu(paddr, size, dir);
 	else if (dir != DMA_TO_DEVICE)
-		dma_cache_maint(handle, size, GNTTAB_CACHE_INVAL);
+		dma_cache_maint(dev, handle, size, GNTTAB_CACHE_INVAL);
 }
 
 void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
@@ -89,9 +92,9 @@ void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
 	if (pfn_valid(PFN_DOWN(dma_to_phys(dev, handle))))
 		arch_sync_dma_for_device(paddr, size, dir);
 	else if (dir == DMA_FROM_DEVICE)
-		dma_cache_maint(handle, size, GNTTAB_CACHE_INVAL);
+		dma_cache_maint(dev, handle, size, GNTTAB_CACHE_INVAL);
 	else
-		dma_cache_maint(handle, size, GNTTAB_CACHE_CLEAN);
+		dma_cache_maint(dev, handle, size, GNTTAB_CACHE_CLEAN);
 }
 
 bool xen_arch_need_swiotlb(struct device *dev,
-- 
2.17.1


