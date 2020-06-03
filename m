Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D861ED88E
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 00:23:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgbmp-0004il-5A; Wed, 03 Jun 2020 22:23:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0WRj=7Q=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jgbmn-0004he-78
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 22:23:01 +0000
X-Inumbo-ID: c4bafb82-a5e8-11ea-8993-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4bafb82-a5e8-11ea-8993-bc764e2007e4;
 Wed, 03 Jun 2020 22:22:54 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7467820734;
 Wed,  3 Jun 2020 22:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591222973;
 bh=Hrv3PVcXYaGZU+pmnuCIi7L6rjwMar9STJmksuaPXR4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RkQYce7A5IplQKy36VI3JG/7NujFadE1r+EI0c7RL3uFRJEv69DT3i7TAokkTisYb
 OkLyN10vvmp1i3ZZTO217L6kktfqJefvAssILhG2e3n3170XdT5olphDHA/tvEY80M
 ndiCNcRva4MAWM/5xUun6d1LH7Ih6/Zg1XaGuG24=
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com,
	boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: [PATCH v2 10/11] xen/arm: introduce phys/dma translations in
 xen_dma_sync_for_*
Date: Wed,  3 Jun 2020 15:22:46 -0700
Message-Id: <20200603222247.11681-10-sstabellini@kernel.org>
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

xen_dma_sync_for_cpu, xen_dma_sync_for_device, xen_arch_need_swiotlb are
getting called passing dma addresses. On some platforms dma addresses
could be different from physical addresses. Before doing any operations
on these addresses we need to convert them back to physical addresses
using dma_to_phys.

Add dma_to_phys calls to xen_dma_sync_for_cpu, xen_dma_sync_for_device,
and xen_arch_need_swiotlb.

dma_cache_maint is fixed by the next patch.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Tested-by: Corey Minyard <cminyard@mvista.com>
Tested-by: Roman Shaposhnik <roman@zededa.com>

---
Changes in v2:
- improve commit message
- don't use pfn_valid
---
 arch/arm/xen/mm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index f2414ea40a79..bbad712a890d 100644
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
@@ -98,7 +99,7 @@ bool xen_arch_need_swiotlb(struct device *dev,
 			   dma_addr_t dev_addr)
 {
 	unsigned int xen_pfn = XEN_PFN_DOWN(phys);
-	unsigned int bfn = XEN_PFN_DOWN(dev_addr);
+	unsigned int bfn = XEN_PFN_DOWN(dma_to_phys(dev, dev_addr));
 
 	/*
 	 * The swiotlb buffer should be used if
-- 
2.17.1


