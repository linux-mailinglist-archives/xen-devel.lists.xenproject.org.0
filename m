Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D24576A3C
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jul 2022 00:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368575.599945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCU9e-0005ug-DL; Fri, 15 Jul 2022 22:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368575.599945; Fri, 15 Jul 2022 22:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCU9e-0005qD-91; Fri, 15 Jul 2022 22:51:26 +0000
Received: by outflank-mailman (input) for mailman id 368575;
 Fri, 15 Jul 2022 22:51:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tST6=XU=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oCU9c-0005Y5-M1
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 22:51:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a582a4aa-0490-11ed-bd2d-47488cf2e6aa;
 Sat, 16 Jul 2022 00:51:22 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64EFF61DA5;
 Fri, 15 Jul 2022 22:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E108DC341CD;
 Fri, 15 Jul 2022 22:51:19 +0000 (UTC)
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
X-Inumbo-ID: a582a4aa-0490-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657925480;
	bh=AV0+69P96lBk4BCX+QsSeC3xZH+PgsfB0jKHeIQR8Hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZtrJxm7JK/F+zYUSYRD53qvkq6ZbXXR238NJUdHAlXahrigxJLDmadWU7VzKU3Cbh
	 66/l/yAsn9WaxtwwUp1gkXZ+C3vr54YHZ9t7fqthSwAnP3AKWQ2MZfSoKs20PzBL6n
	 X+JhJlLr/PWSFFszpvSaWjUYn4ssPaNz01rxUOA6s7N1iZ761rfNJ94TCss3Wn4B8W
	 IElj94yUPXzzIIbpTiwS+N5B9OZYf5h2yjMlpp32bhhM2Ne22oWRw3wnF6Jz2EpSM5
	 VF0rxuU5zk6Mj8B+bsINHe+hjkGe4hGFItpaotx60zGrLSg01iL+AhTM3tT5d5phH1
	 aMVXGwwkO3YOQ==
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
Subject: [PATCH v4 3/3] xen-blkfront: Apply 'feature_persistent' parameter when connect
Date: Fri, 15 Jul 2022 22:51:08 +0000
Message-Id: <20220715225108.193398-4-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715225108.193398-1-sj@kernel.org>
References: <20220715225108.193398-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Similar behavioral change has made on 'blkfront' by commit 74a852479c68
("xen-blkfront: add a parameter for disabling of persistent grants").
This commit changes the behavior of the parameter to make effect for
every connect, so that the previous behavior of 'blkfront' can be
restored.

[1] https://lore.kernel.org/xen-devel/CAJwUmVB6H3iTs-C+U=v-pwJB7-_ZRHPxHzKRJZ22xEPW7z8a=g@mail.gmail.com/

Fixes: 74a852479c68 ("xen-blkfront: add a parameter for disabling of persistent grants")
Cc: <stable@vger.kernel.org> # 5.10.x
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/ABI/testing/sysfs-driver-xen-blkfront | 2 +-
 drivers/block/xen-blkfront.c                        | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkfront b/Documentation/ABI/testing/sysfs-driver-xen-blkfront
index 7f646c58832e..4d36c5a10546 100644
--- a/Documentation/ABI/testing/sysfs-driver-xen-blkfront
+++ b/Documentation/ABI/testing/sysfs-driver-xen-blkfront
@@ -15,5 +15,5 @@ KernelVersion:  5.10
 Contact:        Maximilian Heyne <mheyne@amazon.de>
 Description:
                 Whether to enable the persistent grants feature or not.  Note
-                that this option only takes effect on newly created frontends.
+                that this option only takes effect on newly connected frontends.
                 The default is Y (enable).
diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 3646c0cae672..4e763701b372 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -1988,8 +1988,6 @@ static int blkfront_probe(struct xenbus_device *dev,
 	info->vdevice = vdevice;
 	info->connected = BLKIF_STATE_DISCONNECTED;
 
-	info->feature_persistent = feature_persistent;
-
 	/* Front end dir is a number, which is used as the id. */
 	info->handle = simple_strtoul(strrchr(dev->nodename, '/')+1, NULL, 0);
 	dev_set_drvdata(&dev->dev, info);
@@ -2283,7 +2281,7 @@ static void blkfront_gather_backend_features(struct blkfront_info *info)
 	if (xenbus_read_unsigned(info->xbdev->otherend, "feature-discard", 0))
 		blkfront_setup_discard(info);
 
-	if (info->feature_persistent)
+	if (feature_persistent)
 		info->feature_persistent =
 			!!xenbus_read_unsigned(info->xbdev->otherend,
 					       "feature-persistent", 0);
-- 
2.25.1


