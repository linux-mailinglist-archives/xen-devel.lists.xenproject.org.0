Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3A419D2E6
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 11:00:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKIBt-00028q-Sk; Fri, 03 Apr 2020 09:00:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6vR8=5T=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jKIBs-00028i-Ki
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 09:00:40 +0000
X-Inumbo-ID: 967f960e-7589-11ea-bcd3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 967f960e-7589-11ea-bcd3-12813bfff9fa;
 Fri, 03 Apr 2020 09:00:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8972EAEB1;
 Fri,  3 Apr 2020 09:00:37 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] xen/blkfront: fix memory allocation flags in
 blkfront_setup_indirect()
Date: Fri,  3 Apr 2020 11:00:34 +0200
Message-Id: <20200403090034.8753-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Jens Axboe <axboe@kernel.dk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, stable@vger.kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Commit 1d5c76e664333 ("xen-blkfront: switch kcalloc to kvcalloc for
large array allocation") didn't fix the issue it was meant to, as the
flags for allocating the memory are GFP_NOIO, which will lead the
memory allocation falling back to kmalloc().

So instead of GFP_NOIO use GFP_KERNEL and do all the memory allocation
in blkfront_setup_indirect() in a memalloc_noio_{save,restore} section.

Fixes: 1d5c76e664333 ("xen-blkfront: switch kcalloc to kvcalloc for large array allocation")
Cc: stable@vger.kernel.org
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/block/xen-blkfront.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 915cf5b6388c..3b889ea950c2 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -47,6 +47,7 @@
 #include <linux/bitmap.h>
 #include <linux/list.h>
 #include <linux/workqueue.h>
+#include <linux/sched/mm.h>
 
 #include <xen/xen.h>
 #include <xen/xenbus.h>
@@ -2189,10 +2190,12 @@ static void blkfront_setup_discard(struct blkfront_info *info)
 
 static int blkfront_setup_indirect(struct blkfront_ring_info *rinfo)
 {
-	unsigned int psegs, grants;
+	unsigned int psegs, grants, memflags;
 	int err, i;
 	struct blkfront_info *info = rinfo->dev_info;
 
+	memflags = memalloc_noio_save();
+
 	if (info->max_indirect_segments == 0) {
 		if (!HAS_EXTRA_REQ)
 			grants = BLKIF_MAX_SEGMENTS_PER_REQUEST;
@@ -2224,7 +2227,7 @@ static int blkfront_setup_indirect(struct blkfront_ring_info *rinfo)
 
 		BUG_ON(!list_empty(&rinfo->indirect_pages));
 		for (i = 0; i < num; i++) {
-			struct page *indirect_page = alloc_page(GFP_NOIO);
+			struct page *indirect_page = alloc_page(GFP_KERNEL);
 			if (!indirect_page)
 				goto out_of_memory;
 			list_add(&indirect_page->lru, &rinfo->indirect_pages);
@@ -2235,15 +2238,15 @@ static int blkfront_setup_indirect(struct blkfront_ring_info *rinfo)
 		rinfo->shadow[i].grants_used =
 			kvcalloc(grants,
 				 sizeof(rinfo->shadow[i].grants_used[0]),
-				 GFP_NOIO);
+				 GFP_KERNEL);
 		rinfo->shadow[i].sg = kvcalloc(psegs,
 					       sizeof(rinfo->shadow[i].sg[0]),
-					       GFP_NOIO);
+					       GFP_KERNEL);
 		if (info->max_indirect_segments)
 			rinfo->shadow[i].indirect_grants =
 				kvcalloc(INDIRECT_GREFS(grants),
 					 sizeof(rinfo->shadow[i].indirect_grants[0]),
-					 GFP_NOIO);
+					 GFP_KERNEL);
 		if ((rinfo->shadow[i].grants_used == NULL) ||
 			(rinfo->shadow[i].sg == NULL) ||
 		     (info->max_indirect_segments &&
@@ -2252,6 +2255,7 @@ static int blkfront_setup_indirect(struct blkfront_ring_info *rinfo)
 		sg_init_table(rinfo->shadow[i].sg, psegs);
 	}
 
+	memalloc_noio_restore(memflags);
 
 	return 0;
 
@@ -2271,6 +2275,9 @@ static int blkfront_setup_indirect(struct blkfront_ring_info *rinfo)
 			__free_page(indirect_page);
 		}
 	}
+
+	memalloc_noio_restore(memflags);
+
 	return -ENOMEM;
 }
 
-- 
2.16.4


