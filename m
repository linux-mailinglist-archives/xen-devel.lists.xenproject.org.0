Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D54576A3B
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jul 2022 00:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368573.599928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCU9c-0005bO-OL; Fri, 15 Jul 2022 22:51:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368573.599928; Fri, 15 Jul 2022 22:51:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCU9c-0005Y6-LO; Fri, 15 Jul 2022 22:51:24 +0000
Received: by outflank-mailman (input) for mailman id 368573;
 Fri, 15 Jul 2022 22:51:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tST6=XU=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oCU9b-0005Xu-5q
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 22:51:23 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4a123c4-0490-11ed-924f-1f966e50362f;
 Sat, 16 Jul 2022 00:51:21 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B9BCFB82EF2;
 Fri, 15 Jul 2022 22:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7B9C341C6;
 Fri, 15 Jul 2022 22:51:17 +0000 (UTC)
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
X-Inumbo-ID: a4a123c4-0490-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657925478;
	bh=dlKaQtwg6yYz18rR7yrtedCSXkIPHob7qvry1GivQwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zfee0JPaAo7oMHjphPshW1SCisXCB26lmUDf4+N5Lfa3ZXWP/1h9AYnrlFDyOnNGa
	 8CZCtlA0YcgiyS66d8rMWfTaDRK7BIaeNQsTXBSIJBWZcdIXsm6wJMbEebhJ0AHuHQ
	 E7ljrx5Vc/3IEsYX/sJTdT+2WNJtr8q4TKoP2iBaDXH8ARh4/17mMXAxgC2RbBf/K2
	 d5QfzG48sV1dKnSkxRUMsXwBfgW5WnZrxs8QqGVmfjqa477pJcj5R1aKWjoD/dg20e
	 pGpPpMEEltiWk3QRupHXiLvkIvon2u4J27h7ydm+P58QnbX7Wq0/CPCdq771cV88PS
	 wvmYZSwRdGvyQ==
From: SeongJae Park <sj@kernel.org>
To: roger.pau@citrix.com
Cc: axboe@kernel.dk,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	olekstysh@gmail.com,
	andrii.chepurnyi82@gmail.com,
	mheyne@amazon.de,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	SeongJae Park <sj@kernel.org>
Subject: [PATCH v4 1/3] xen-blkback: fix persistent grants negotiation
Date: Fri, 15 Jul 2022 22:51:06 +0000
Message-Id: <20220715225108.193398-2-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715225108.193398-1-sj@kernel.org>
References: <20220715225108.193398-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Persistent grants feature can be used only when both backend and the
frontend supports the feature.  The feature was always supported by
'blkback', but commit aac8a70db24b ("xen-blkback: add a parameter for
disabling of persistent grants") has introduced a parameter for
disabling it runtime.

To avoid the parameter be updated while being used by 'blkback', the
commit caches the parameter into 'vbd->feature_gnt_persistent' in
'xen_vbd_create()', and then check if the guest also supports the
feature and finally updates the field in 'connect_ring()'.

However, 'connect_ring()' could be called before 'xen_vbd_create()', so
later execution of 'xen_vbd_create()' can wrongly overwrite 'true' to
'vbd->feature_gnt_persistent'.  As a result, 'blkback' could try to use
'persistent grants' feature even if the guest doesn't support the
feature.

This commit fixes the issue by moving the parameter value caching to
'xen_blkif_alloc()', which allocates the 'blkif'.  Because the struct
embeds 'vbd' object, which will be used by 'connect_ring()' later, this
should be called before 'connect_ring()' and therefore this should be
the right and safe place to do the caching.

Fixes: aac8a70db24b ("xen-blkback: add a parameter for disabling of persistent grants")
Cc: <stable@vger.kernel.org> # 5.10.x
Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 drivers/block/xen-blkback/xenbus.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index 97de13b14175..16c6785d260c 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -157,6 +157,11 @@ static int xen_blkif_alloc_rings(struct xen_blkif *blkif)
 	return 0;
 }
 
+/* Enable the persistent grants feature. */
+static bool feature_persistent = true;
+module_param(feature_persistent, bool, 0644);
+MODULE_PARM_DESC(feature_persistent, "Enables the persistent grants feature");
+
 static struct xen_blkif *xen_blkif_alloc(domid_t domid)
 {
 	struct xen_blkif *blkif;
@@ -181,6 +186,8 @@ static struct xen_blkif *xen_blkif_alloc(domid_t domid)
 	__module_get(THIS_MODULE);
 	INIT_WORK(&blkif->free_work, xen_blkif_deferred_free);
 
+	blkif->vbd.feature_gnt_persistent = feature_persistent;
+
 	return blkif;
 }
 
@@ -472,12 +479,6 @@ static void xen_vbd_free(struct xen_vbd *vbd)
 	vbd->bdev = NULL;
 }
 
-/* Enable the persistent grants feature. */
-static bool feature_persistent = true;
-module_param(feature_persistent, bool, 0644);
-MODULE_PARM_DESC(feature_persistent,
-		"Enables the persistent grants feature");
-
 static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
 			  unsigned major, unsigned minor, int readonly,
 			  int cdrom)
@@ -520,8 +521,6 @@ static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
 	if (bdev_max_secure_erase_sectors(bdev))
 		vbd->discard_secure = true;
 
-	vbd->feature_gnt_persistent = feature_persistent;
-
 	pr_debug("Successful creation of handle=%04x (dom=%u)\n",
 		handle, blkif->domid);
 	return 0;
-- 
2.25.1


