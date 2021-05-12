Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779D037D428
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 22:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126371.237909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgvJP-00056L-2q; Wed, 12 May 2021 20:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126371.237909; Wed, 12 May 2021 20:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgvJO-00054N-Vt; Wed, 12 May 2021 20:18:30 +0000
Received: by outflank-mailman (input) for mailman id 126371;
 Wed, 12 May 2021 20:18:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=codm=KH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgvJM-00053i-VT
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 20:18:29 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd05b009-a7cc-4e1e-bda1-ffbca09f8373;
 Wed, 12 May 2021 20:18:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 734D361408;
 Wed, 12 May 2021 20:18:27 +0000 (UTC)
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
X-Inumbo-ID: dd05b009-a7cc-4e1e-bda1-ffbca09f8373
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620850707;
	bh=5GSHqd6UoXwElcgEbYeM8UQG4GJkKSSlVE4wPB43XOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vHHpKNOcSv3F8S4EPFQSzTJKfGTM1mlZ8082xqqy+v1IZ8uxlYgnmk6Fw+JHyWk8P
	 lEpvWBAv3fhk7v3LMfPuWzhRFkhPnyuPcey9qCWJOHG6kQ4KAF97xxCO/Vvan8EsLM
	 G8W3vBQSLbZYMTckWaS7Nct+WIRm+WSuwvfYKcE6jW8okm51FrL764aLnv2fwVKbTX
	 fFgm+kluXKRIjYpViGlO+USpxdzUm5zYLq4ZQJQ26qvLAOfIt3DAh0knAAas8Um5n8
	 tEpW9w3pkYeq6RkfKD0FPsNfFx5Yd7JEr9Cgzmd9SoQien1ww1lkTepk1KEtpz0xot
	 YKaOZF832bj9Q==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	hch@lst.de,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2 1/3] xen/arm: move xen_swiotlb_detect to arm/swiotlb-xen.h
Date: Wed, 12 May 2021 13:18:21 -0700
Message-Id: <20210512201823.1963-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2105121313060.5018@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2105121313060.5018@sstabellini-ThinkPad-T480s>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Move xen_swiotlb_detect to a static inline function to make it available
to !CONFIG_XEN builds.

CC: boris.ostrovsky@oracle.com
CC: jgross@suse.com
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

---
Changes in v2:
- patch split
---
 arch/arm/xen/mm.c             | 12 ------------
 include/xen/arm/swiotlb-xen.h | 15 ++++++++++++++-
 2 files changed, 14 insertions(+), 13 deletions(-)

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


