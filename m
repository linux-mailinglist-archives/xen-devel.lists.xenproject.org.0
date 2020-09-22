Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E85D527440A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:19:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKj8b-0003SK-5j; Tue, 22 Sep 2020 14:19:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHJL=C7=amazon.com=prvs=5271185ff=sjpark@srs-us1.protection.inumbo.net>)
 id 1kKj8Z-0003Ru-DJ
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:19:19 +0000
X-Inumbo-ID: 5077f38a-f0db-4e7f-b600-e79c408143a1
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5077f38a-f0db-4e7f-b600-e79c408143a1;
 Tue, 22 Sep 2020 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600784358; x=1632320358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=+nJu4gS/7OcwzlWUYMHlKyPCjt1XPzaZGoaWTe/XeyE=;
 b=ClnVEWlQ3xQc5N2NTGk1rqLySR8uk0piGcyn/LBCX6nqzZNGwmaqt0JS
 VdQhNAX0itD52Zx6c7sZiTMtJRUJ1Ylc/dXwEWS0IXvMaAVvLFGo6xu5F
 5fRoQzeKGrHNJxn7Shv7ZSn4gK7Xg36D0Z6yfz7f+c1r4EA0hkAXP69gw k=;
X-IronPort-AV: E=Sophos;i="5.77,291,1596499200"; d="scan'208";a="70117531"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 22 Sep 2020 14:16:20 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4EDC11A0608; Tue, 22 Sep 2020 14:16:19 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.160.137) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 22 Sep 2020 14:16:12 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <konrad.wilk@oracle.com>, <roger.pau@citrix.com>, <jgross@suse.com>
CC: SeongJae Park <sjpark@amazon.de>, <axboe@kernel.dk>,
 <aliguori@amazon.com>, <amit@kernel.org>, <mheyne@amazon.de>,
 <pdurrant@amazon.co.uk>, <linux-block@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/3] xen-blkback: add a parameter for disabling of
 persistent grants
Date: Tue, 22 Sep 2020 16:15:47 +0200
Message-ID: <20200922141549.26154-2-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922141549.26154-1-sjpark@amazon.com>
References: <20200922141549.26154-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.160.137]
X-ClientProxiedBy: EX13D12UWC001.ant.amazon.com (10.43.162.78) To
 EX13D31EUA004.ant.amazon.com (10.43.165.161)
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: SeongJae Park <sjpark@amazon.de>

Persistent grants feature provides high scalability.  On some small
systems, however, it could incur data copy overheads[1] and thus it is
required to be disabled.  But, there is no option to disable it.  For
the reason, this commit adds a module parameter for disabling of the
feature.

[1] https://wiki.xen.org/wiki/Xen_4.3_Block_Protocol_Scalability

Signed-off-by: Anthony Liguori <aliguori@amazon.com>
Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 .../ABI/testing/sysfs-driver-xen-blkback      |  9 ++++++++
 drivers/block/xen-blkback/xenbus.c            | 22 ++++++++++++++-----
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkback b/Documentation/ABI/testing/sysfs-driver-xen-blkback
index ecb7942ff146..ac2947b98950 100644
--- a/Documentation/ABI/testing/sysfs-driver-xen-blkback
+++ b/Documentation/ABI/testing/sysfs-driver-xen-blkback
@@ -35,3 +35,12 @@ Description:
                 controls the duration in milliseconds that blkback will not
                 cache any page not backed by a grant mapping.
                 The default is 10ms.
+
+What:           /sys/module/xen_blkback/parameters/feature_persistent
+Date:           September 2020
+KernelVersion:  5.10
+Contact:        SeongJae Park <sjpark@amazon.de>
+Description:
+                Whether to enable the persistent grants feature or not.  Note
+                that this option only takes effect on newly created backends.
+                The default is Y (enable).
diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index b9aa5d1ac10b..f4c8827fa0ad 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -474,6 +474,12 @@ static void xen_vbd_free(struct xen_vbd *vbd)
 	vbd->bdev = NULL;
 }
 
+/* Enable the persistent grants feature. */
+static bool feature_persistent = true;
+module_param(feature_persistent, bool, 0644);
+MODULE_PARM_DESC(feature_persistent,
+		"Enables the persistent grants feature");
+
 static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
 			  unsigned major, unsigned minor, int readonly,
 			  int cdrom)
@@ -519,6 +525,8 @@ static int xen_vbd_create(struct xen_blkif *blkif, blkif_vdev_t handle,
 	if (q && blk_queue_secure_erase(q))
 		vbd->discard_secure = true;
 
+	vbd->feature_gnt_persistent = feature_persistent ? 1 : 0;
+
 	pr_debug("Successful creation of handle=%04x (dom=%u)\n",
 		handle, blkif->domid);
 	return 0;
@@ -906,7 +914,8 @@ static void connect(struct backend_info *be)
 
 	xen_blkbk_barrier(xbt, be, be->blkif->vbd.flush_support);
 
-	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u", 1);
+	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u",
+			be->blkif->vbd.feature_gnt_persistent);
 	if (err) {
 		xenbus_dev_fatal(dev, err, "writing %s/feature-persistent",
 				 dev->nodename);
@@ -1067,7 +1076,6 @@ static int connect_ring(struct backend_info *be)
 {
 	struct xenbus_device *dev = be->dev;
 	struct xen_blkif *blkif = be->blkif;
-	unsigned int pers_grants;
 	char protocol[64] = "";
 	int err, i;
 	char *xspath;
@@ -1093,9 +1101,11 @@ static int connect_ring(struct backend_info *be)
 		xenbus_dev_fatal(dev, err, "unknown fe protocol %s", protocol);
 		return -ENOSYS;
 	}
-	pers_grants = xenbus_read_unsigned(dev->otherend, "feature-persistent",
-					   0);
-	blkif->vbd.feature_gnt_persistent = pers_grants;
+	if (blkif->vbd.feature_gnt_persistent)
+		blkif->vbd.feature_gnt_persistent =
+			xenbus_read_unsigned(dev->otherend,
+					"feature-persistent", 0);
+
 	blkif->vbd.overflow_max_grants = 0;
 
 	/*
@@ -1118,7 +1128,7 @@ static int connect_ring(struct backend_info *be)
 
 	pr_info("%s: using %d queues, protocol %d (%s) %s\n", dev->nodename,
 		 blkif->nr_rings, blkif->blk_protocol, protocol,
-		 pers_grants ? "persistent grants" : "");
+		 blkif->vbd.feature_gnt_persistent ? "persistent grants" : "");
 
 	ring_page_order = xenbus_read_unsigned(dev->otherend,
 					       "ring-page-order", 0);
-- 
2.17.1


