Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 118F5576A3A
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jul 2022 00:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368576.599951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCU9e-00062o-NA; Fri, 15 Jul 2022 22:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368576.599951; Fri, 15 Jul 2022 22:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCU9e-0005v5-Is; Fri, 15 Jul 2022 22:51:26 +0000
Received: by outflank-mailman (input) for mailman id 368576;
 Fri, 15 Jul 2022 22:51:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tST6=XU=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oCU9c-0005Xu-Up
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 22:51:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5004039-0490-11ed-924f-1f966e50362f;
 Sat, 16 Jul 2022 00:51:21 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4435B61DA6;
 Fri, 15 Jul 2022 22:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07D5C341CA;
 Fri, 15 Jul 2022 22:51:18 +0000 (UTC)
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
X-Inumbo-ID: a5004039-0490-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657925479;
	bh=mrIb/ElueXH2WPoRY6/+AIbMzXNHxy0Ea9Il6Cse/O8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tZxT+pQbuYr4srnjPLlT74GcfOoy9RBpxXwayjAkFgyh5LrNUY2q22OQHx045z57h
	 JdL3SjIYgm+lnKlOTPxlxhxTXrDItgz5B7Iq0KW9mCCuECOsfsPxQLvCGEY2TAaylX
	 2k3Ob5C7883feGULACavffuwP/y6NAcpUwh1zqITBCaRejmAzNJdScnUecrJbb03C1
	 56w9YccBqDpPCC3y+dRiauLqFDY13lTcAFOM9J+bJQugs6+dxc7q/fhpTvxXAmKs6/
	 UFobBSH5woSg6vsIMZc1Ne6tlWWStPO2MzvrYtDH9IlB94a1Y1CeYMd2QJpBnzdiOD
	 V5dPouOxOxBTA==
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
Subject: [PATCH v4 2/3] xen-blkback: Apply 'feature_persistent' parameter when connect
Date: Fri, 15 Jul 2022 22:51:07 +0000
Message-Id: <20220715225108.193398-3-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715225108.193398-1-sj@kernel.org>
References: <20220715225108.193398-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maximilian Heyne <mheyne@amazon.de>

In some use cases[1], the backend is created while the frontend doesn't
support the persistent grants feature, but later the frontend can be
changed to support the feature and reconnect.  In the past, 'blkback'
enabled the persistent grants feature since it unconditionally checked
if frontend supports the persistent grants feature for every connect
('connect_ring()') and decided whether it should use persistent grans or
not.

However, commit aac8a70db24b ("xen-blkback: add a parameter for
disabling of persistent grants") has mistakenly changed the behavior.
It made the frontend feature support check to not be repeated once it
shown the 'feature_persistent' as 'false', or the frontend doesn't
support persistent grants.

This commit changes the behavior of the parameter to make effect for
every connect, so that the previous workflow can work again as expected.

[1] https://lore.kernel.org/xen-devel/CAJwUmVB6H3iTs-C+U=v-pwJB7-_ZRHPxHzKRJZ22xEPW7z8a=g@mail.gmail.com/

Reported-by: Andrii Chepurnyi <andrii.chepurnyi82@gmail.com>
Fixes: aac8a70db24b ("xen-blkback: add a parameter for disabling of persistent grants")
Cc: <stable@vger.kernel.org> # 5.10.x
Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/ABI/testing/sysfs-driver-xen-blkback | 2 +-
 drivers/block/xen-blkback/xenbus.c                 | 9 +++------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkback b/Documentation/ABI/testing/sysfs-driver-xen-blkback
index 7faf719af165..fac0f429a869 100644
--- a/Documentation/ABI/testing/sysfs-driver-xen-blkback
+++ b/Documentation/ABI/testing/sysfs-driver-xen-blkback
@@ -42,5 +42,5 @@ KernelVersion:  5.10
 Contact:        Maximilian Heyne <mheyne@amazon.de>
 Description:
                 Whether to enable the persistent grants feature or not.  Note
-                that this option only takes effect on newly created backends.
+                that this option only takes effect on newly connected backends.
                 The default is Y (enable).
diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index 16c6785d260c..ee7ad2fb432d 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -186,8 +186,6 @@ static struct xen_blkif *xen_blkif_alloc(domid_t domid)
 	__module_get(THIS_MODULE);
 	INIT_WORK(&blkif->free_work, xen_blkif_deferred_free);
 
-	blkif->vbd.feature_gnt_persistent = feature_persistent;
-
 	return blkif;
 }
 
@@ -1086,10 +1084,9 @@ static int connect_ring(struct backend_info *be)
 		xenbus_dev_fatal(dev, err, "unknown fe protocol %s", protocol);
 		return -ENOSYS;
 	}
-	if (blkif->vbd.feature_gnt_persistent)
-		blkif->vbd.feature_gnt_persistent =
-			xenbus_read_unsigned(dev->otherend,
-					"feature-persistent", 0);
+
+	blkif->vbd.feature_gnt_persistent = feature_persistent &&
+		xenbus_read_unsigned(dev->otherend, "feature-persistent", 0);
 
 	blkif->vbd.overflow_max_grants = 0;
 
-- 
2.25.1


