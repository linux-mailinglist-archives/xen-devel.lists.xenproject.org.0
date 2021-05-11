Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B288537AD40
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 19:42:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125861.236927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWOC-0003rd-SZ; Tue, 11 May 2021 17:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125861.236927; Tue, 11 May 2021 17:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgWOC-0003p0-Mn; Tue, 11 May 2021 17:41:48 +0000
Received: by outflank-mailman (input) for mailman id 125861;
 Tue, 11 May 2021 17:41:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI6L=KG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgWOB-0003oo-E3
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 17:41:47 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8891cb61-4688-4f84-a586-c228ec11c22d;
 Tue, 11 May 2021 17:41:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F355F611C9;
 Tue, 11 May 2021 17:41:44 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 8891cb61-4688-4f84-a586-c228ec11c22d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620754905;
	bh=p5pl8VglhLEAnmwX/+IRaXV2EP7T6wfDyOXKKS7PxLw=;
	h=From:To:Cc:Subject:Date:From;
	b=mhCoF0FWPfPN/PDmOQMAitbT9aqlzHlYF/CtyR12btuCdKbmhihNy25BWkvz8BxGC
	 6KF9qc8MTe7+Lj+KmpO4FiedIpwSdO+7cGDubiXTrRNiBvkHNAjoXH+c+OZWYxHgMx
	 zQ6Sa3KprdTvbEZ9cnC1Kd7x5J/UsZAesiExc1I3mMl8N38992qENw+lLIerKXlsc8
	 WUpCBHf4OSTqThh+Iqd1iOapZrAOZatdglTIFNNjebFhOa21pjHlInh6WqQVbYMcT+
	 ZKUvjiDXcBrFeMTAMietHC2IqN4pYaxwxClDfIGjMxlZBYJ231GhwkxrL1qt3b/UDL
	 qmDo1+MQvlh8w==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	hch@lst.de,
	linux-kernel@vger.kernel.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] xen/arm64: do not set SWIOTLB_NO_FORCE when swiotlb is required
Date: Tue, 11 May 2021 10:41:41 -0700
Message-Id: <20210511174142.12742-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Although SWIOTLB_NO_FORCE is meant to allow later calls to swiotlb_init,
today dma_direct_map_page returns error if SWIOTLB_NO_FORCE.

For now, without a larger overhaul of SWIOTLB_NO_FORCE, the best we can
do is to avoid setting SWIOTLB_NO_FORCE in mem_init when we know that it
is going to be required later (e.g. Xen requires it).

To make xen_swiotlb_detect available to !CONFIG_XEN builds, move it to a
static inline function.

CC: boris.ostrovsky@oracle.com
CC: jgross@suse.com
CC: catalin.marinas@arm.com
CC: will@kernel.org
CC: linux-arm-kernel@lists.infradead.org
Fixes: 2726bf3ff252 ("swiotlb: Make SWIOTLB_NO_FORCE perform no allocation")
Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 arch/arm/xen/mm.c             | 12 ------------
 arch/arm64/mm/init.c          |  3 ++-
 include/xen/arm/swiotlb-xen.h | 15 ++++++++++++++-
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index f8f07469d259..223b1151fd7d 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -135,18 +135,6 @@ void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
 	return;
 }
 
-int xen_swiotlb_detect(void)
-{
-	if (!xen_domain())
-		return 0;
-	if (xen_feature(XENFEAT_direct_mapped))
-		return 1;
-	/* legacy case */
-	if (!xen_feature(XENFEAT_not_direct_mapped) && xen_initial_domain())
-		return 1;
-	return 0;
-}
-
 static int __init xen_mm_init(void)
 {
 	struct gnttab_cache_flush cflush;
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 16a2b2b1c54d..e55409caaee3 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -43,6 +43,7 @@
 #include <linux/sizes.h>
 #include <asm/tlb.h>
 #include <asm/alternative.h>
+#include <asm/xen/swiotlb-xen.h>
 
 /*
  * We need to be able to catch inadvertent references to memstart_addr
@@ -482,7 +483,7 @@ void __init mem_init(void)
 	if (swiotlb_force == SWIOTLB_FORCE ||
 	    max_pfn > PFN_DOWN(arm64_dma_phys_limit))
 		swiotlb_init(1);
-	else
+	else if (!xen_swiotlb_detect())
 		swiotlb_force = SWIOTLB_NO_FORCE;
 
 	set_max_mapnr(max_pfn - PHYS_PFN_OFFSET);
diff --git a/include/xen/arm/swiotlb-xen.h b/include/xen/arm/swiotlb-xen.h
index 2994fe6031a0..33336ab58afc 100644
--- a/include/xen/arm/swiotlb-xen.h
+++ b/include/xen/arm/swiotlb-xen.h
@@ -2,6 +2,19 @@
 #ifndef _ASM_ARM_SWIOTLB_XEN_H
 #define _ASM_ARM_SWIOTLB_XEN_H
 
-extern int xen_swiotlb_detect(void);
+#include <xen/features.h>
+#include <xen/xen.h>
+
+static inline int xen_swiotlb_detect(void)
+{
+	if (!xen_domain())
+		return 0;
+	if (xen_feature(XENFEAT_direct_mapped))
+		return 1;
+	/* legacy case */
+	if (!xen_feature(XENFEAT_not_direct_mapped) && xen_initial_domain())
+		return 1;
+	return 0;
+}
 
 #endif /* _ASM_ARM_SWIOTLB_XEN_H */
-- 
2.17.1


