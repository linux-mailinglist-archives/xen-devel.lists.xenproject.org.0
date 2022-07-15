Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B30E576670
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 19:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368435.599731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCPXk-0007OV-7q; Fri, 15 Jul 2022 17:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368435.599731; Fri, 15 Jul 2022 17:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCPXk-0007Kk-3o; Fri, 15 Jul 2022 17:56:00 +0000
Received: by outflank-mailman (input) for mailman id 368435;
 Fri, 15 Jul 2022 17:55:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tST6=XU=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1oCPXi-0006p6-PI
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 17:55:58 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6110c7d3-0467-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 19:55:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F2FC5B82DC6;
 Fri, 15 Jul 2022 17:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD7AC341C0;
 Fri, 15 Jul 2022 17:55:52 +0000 (UTC)
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
X-Inumbo-ID: 6110c7d3-0467-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657907753;
	bh=diKv2YzAoxgEDY60qc5gR9piIzmslAMbkYmuxNqe/ZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fw1MINtcSM4pJAG0nsuh8IAM8Wr7uRi8M3aS0vjGeLT1EI/GVh6OJWZ+YVlJJwqqx
	 bM31L0AeRA4WLQ9md1tQ0nTXsFrGX8PRpdBlV+Mh/AbOiXhcSxgsfY0uLaQr3XlkIO
	 lm3ZnegDZ8aEwlUzyysoHyiFREQSZgaZAAJNQV3qoDJ76NGHY8DQcY07ZiqqweNjaY
	 G+7nZLFKyemUMbTY0JMT0GhNes72Ig0BZbgNeHry5ztF4VwzS912XIIAoMZ27jI2vJ
	 alwxG/kpfOJENpxe0eeEepmWBoXTsABm/JvzJ7CLVdQ+uyrz56qF7TI3qFXUVgNgn6
	 4Ru1qOB1bZO1A==
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
Subject: [PATCH 1/2] xen, blkback: fix persistent grants negotiation
Date: Fri, 15 Jul 2022 17:55:20 +0000
Message-Id: <20220715175521.126649-2-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715175521.126649-1-sj@kernel.org>
References: <20220715175521.126649-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maximilian Heyne <mheyne@amazon.de>

Given dom0 supports persistent grants but the guest does not.
Then, when attaching a block device during runtime of the guest, dom0
will enable persistent grants for this newly attached block device:

  $ xenstore-ls -f | grep 20674 | grep persistent
  /local/domain/0/backend/vbd/20674/768/feature-persistent = "0"
  /local/domain/0/backend/vbd/20674/51792/feature-persistent = "1"

Here disk 768 was attached during guest creation while 51792 was
attached at runtime. If the guest would have advertised the persistent
grant feature, there would be a xenstore entry like:

  /local/domain/20674/device/vbd/51792/feature-persistent = "1"

Persistent grants are also used when the guest tries to access the disk
which can be seen when enabling log stats:

  $ echo 1 > /sys/module/xen_blkback/parameters/log_stats
  $ dmesg
  xen-blkback: (20674.xvdf-0): oo   0  |  rd    0  |  wr    0  |  f    0 |  ds    0 | pg:    1/1056

The "pg: 1/1056" shows that one persistent grant is used.

Before commit aac8a70db24b ("xen-blkback: add a parameter for disabling
of persistent grants") vbd->feature_gnt_persistent was set in
connect_ring. After the commit it was intended to be initialized in
xen_vbd_create and then set according to the guest feature availability
in connect_ring. However, with a running guest, connect_ring might be
called before xen_vbd_create and vbd->feature_gnt_persistent will be
incorrectly initialized. xen_vbd_create will overwrite it with the value
of feature_persistent regardless whether the guest actually supports
persistent grants.

With this commit, vbd->feature_gnt_persistent is set only in
connect_ring and this is the only use of the module parameter
feature_persistent. This avoids races when the module parameter changes
during the block attachment process.

Note that vbd->feature_gnt_persistent doesn't need to be initialized in
xen_vbd_create. It's next use is in connect which can only be called
once connect_ring has initialized the rings. xen_update_blkif_status is
checking for this.

Please also note that this commit makes a behavioral change of the
parameter.  That is, the parameter made effect on only newly created
backends before this commit, but it makes the effect for every new
connection after this commit.  Therefore, this commit also updates the
document.

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
index 97de13b14175..874b846fb622 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -520,8 +520,6 @@ static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
 	if (bdev_max_secure_erase_sectors(bdev))
 		vbd->discard_secure = true;
 
-	vbd->feature_gnt_persistent = feature_persistent;
-
 	pr_debug("Successful creation of handle=%04x (dom=%u)\n",
 		handle, blkif->domid);
 	return 0;
@@ -1087,10 +1085,9 @@ static int connect_ring(struct backend_info *be)
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


