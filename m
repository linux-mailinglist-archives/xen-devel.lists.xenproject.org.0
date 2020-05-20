Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7B81DC327
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 01:46:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbYP3-000827-Dh; Wed, 20 May 2020 23:45:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P2h4=7C=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jbYP1-00080z-9T
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 23:45:35 +0000
X-Inumbo-ID: fa845f88-9af3-11ea-b07b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa845f88-9af3-11ea-b07b-bc764e2007e4;
 Wed, 20 May 2020 23:45:26 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6EE5920B80;
 Wed, 20 May 2020 23:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590018325;
 bh=zOggHTvrAHnGnYxgbdj7YkRZVsHE+BJZQ+7OWADQwYE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JVwAtmtAzOWjanAHNYSDwz0EACLtThGIDZ+uUg3zRvGSkZ75zhEpQJU3GzzON3sTQ
 a4K7Q8VcswpaFBNTBAKJzXJgfqEM28xLxpmJbB7BCuTDWgYrzJXzFN48YVh7WrmbLS
 h39JcTbntVeLgiFMkXpexgwcaiT0drFuU4zHbALQ=
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: [PATCH 09/10] xen/arm: introduce phys/dma translations in
 xen_dma_sync_for_*
Date: Wed, 20 May 2020 16:45:19 -0700
Message-Id: <20200520234520.22563-9-sstabellini@kernel.org>
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

Add phys_to_dma/dma_to_phys calls to
xen_dma_sync_for_cpu, xen_dma_sync_for_device, and
xen_arch_need_swiotlb.

In xen_arch_need_swiotlb, take the opportunity to switch to the simpler
pfn_valid check we use everywhere else.

dma_cache_maint is fixed by the next patch.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 arch/arm/xen/mm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index f2414ea40a79..7639251bcc79 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <linux/cpu.h>
+#include <linux/dma-direct.h>
 #include <linux/dma-noncoherent.h>
 #include <linux/gfp.h>
 #include <linux/highmem.h>
@@ -75,7 +76,7 @@ void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
 			  phys_addr_t paddr, size_t size,
 			  enum dma_data_direction dir)
 {
-	if (pfn_valid(PFN_DOWN(handle)))
+	if (pfn_valid(PFN_DOWN(dma_to_phys(dev, handle))))
 		arch_sync_dma_for_cpu(paddr, size, dir);
 	else if (dir != DMA_TO_DEVICE)
 		dma_cache_maint(handle, size, GNTTAB_CACHE_INVAL);
@@ -85,7 +86,7 @@ void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
 			     phys_addr_t paddr, size_t size,
 			     enum dma_data_direction dir)
 {
-	if (pfn_valid(PFN_DOWN(handle)))
+	if (pfn_valid(PFN_DOWN(dma_to_phys(dev, handle))))
 		arch_sync_dma_for_device(paddr, size, dir);
 	else if (dir == DMA_FROM_DEVICE)
 		dma_cache_maint(handle, size, GNTTAB_CACHE_INVAL);
@@ -97,8 +98,7 @@ bool xen_arch_need_swiotlb(struct device *dev,
 			   phys_addr_t phys,
 			   dma_addr_t dev_addr)
 {
-	unsigned int xen_pfn = XEN_PFN_DOWN(phys);
-	unsigned int bfn = XEN_PFN_DOWN(dev_addr);
+	unsigned int bfn = XEN_PFN_DOWN(dma_to_phys(dev, dev_addr));
 
 	/*
 	 * The swiotlb buffer should be used if
@@ -115,7 +115,7 @@ bool xen_arch_need_swiotlb(struct device *dev,
 	 * require a bounce buffer because the device doesn't support coherent
 	 * memory and we are not able to flush the cache.
 	 */
-	return (!hypercall_cflush && (xen_pfn != bfn) &&
+	return (!hypercall_cflush && !pfn_valid(bfn) &&
 		!dev_is_dma_coherent(dev));
 }
 
-- 
2.17.1


