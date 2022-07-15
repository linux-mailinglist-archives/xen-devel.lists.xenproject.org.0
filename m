Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CB5576672
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 19:56:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368434.599720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCPXi-00077p-Tj; Fri, 15 Jul 2022 17:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368434.599720; Fri, 15 Jul 2022 17:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCPXi-00074j-Qb; Fri, 15 Jul 2022 17:55:58 +0000
Received: by outflank-mailman (input) for mailman id 368434;
 Fri, 15 Jul 2022 17:55:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tST6=XU=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oCPXi-0006sk-2C
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 17:55:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 600a1b96-0467-11ed-bd2d-47488cf2e6aa;
 Fri, 15 Jul 2022 19:55:56 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C364622BC;
 Fri, 15 Jul 2022 17:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73DBC341C6;
 Fri, 15 Jul 2022 17:55:53 +0000 (UTC)
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
X-Inumbo-ID: 600a1b96-0467-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657907754;
	bh=glq1x5HjisMX5ci0YsvyB4Ygu//43duXbX0NbnuWshE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hwiOW9YiIbTCMdE0Tf/wDkTu2UsIH14atZA/yHy8G06FnwGKtOvtYIp7JmSM860P4
	 m+G2KTFISLmBB0n/oEn8K3iH1lIn6aH1fWMLr7ww7PITjexJM6W7ZiuqU1DabSZBq6
	 ZkcjxYbTGCjxLiP6g/cFeKH/FkCdsABIN2KAKfZMBEOIvPbq2P2UCQEPLEtUiPMz9J
	 bLjFGcCRLmlNFaclKw6IP4+80g51MAYkepMQwlXy4XO8/e3VSueMCLT0xHfCpQw5WP
	 8V1Pa5gDFUAvwHJgrms8TjifJPJ4u8v1dljABKadLQRH9bMyMnHIve039sDnxUTegP
	 cIcw+eyH/Bk9A==
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
Subject: [PATCH 2/2] xen-blkfront: Apply 'feature_persistent' parameter when connect
Date: Fri, 15 Jul 2022 17:55:21 +0000
Message-Id: <20220715175521.126649-3-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715175521.126649-1-sj@kernel.org>
References: <20220715175521.126649-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previous commit made xen-blkback's 'feature_persistent' parameter to
make effect for not only newly created backends but also for every
reconnected backends.  This commit makes xen-blkfront's counterpart
parameter to works in same manner and update the document to avoid any
confusion due to inconsistent behavior of same-named parameters.

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


