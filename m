Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 227DC273B5A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 09:02:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKcJc-0005Hb-Nu; Tue, 22 Sep 2020 07:02:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHJL=C7=amazon.com=prvs=5271185ff=sjpark@srs-us1.protection.inumbo.net>)
 id 1kKcJc-0005HW-4W
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 07:02:16 +0000
X-Inumbo-ID: 5b0c8e98-28cf-4e91-bda4-0a9f807a54c1
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b0c8e98-28cf-4e91-bda4-0a9f807a54c1;
 Tue, 22 Sep 2020 07:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600758136; x=1632294136;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=BO349OSC4lsV1EmHanwtHybcd2v8aj+SOer8QAK+bYY=;
 b=LHgQEQbdbG6JkTGizBbYQXIB2o+I5VTBhFn8d62hrmu4KkNxUpAKFJVt
 j9vO4MjvB0Mn/7UZFJokyNi/7FOhk3KAN7d+YomvLW+0vSyJ9wvndB5Nd
 aSIts4KWdw6h5N2lT3DlZmoYSYKOMb8LMfRKiqUggGyHqwUKG75IucR9B c=;
X-IronPort-AV: E=Sophos;i="5.77,289,1596499200"; d="scan'208";a="70008820"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 22 Sep 2020 07:01:54 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id D006AA44C3; Tue, 22 Sep 2020 07:01:51 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.160.185) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 22 Sep 2020 07:01:46 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <konrad.wilk@oracle.com>, <roger.pau@citrix.com>
CC: SeongJae Park <sjpark@amazon.de>, <axboe@kernel.dk>,
 <aliguori@amazon.com>, <amit@kernel.org>, <mheyne@amazon.de>,
 <linux-block@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] xen-blkback: add a parameter for disabling of persistent
 grants
Date: Tue, 22 Sep 2020 09:01:25 +0200
Message-ID: <20200922070125.27251-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.160.185]
X-ClientProxiedBy: EX13D11UWB001.ant.amazon.com (10.43.161.53) To
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
systems, however, it could incur data copy overhead[1] and thus it is
required to be disabled.  But, there is no option to disable it.  For
the reason, this commit adds a module parameter for disabling of the
feature.

[1] https://wiki.xen.org/wiki/Xen_4.3_Block_Protocol_Scalability

Signed-off-by: Anthony Liguori <aliguori@amazon.com>
Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 .../ABI/testing/sysfs-driver-xen-blkback        |  8 ++++++++
 drivers/block/xen-blkback/xenbus.c              | 17 ++++++++++++++---
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkback b/Documentation/ABI/testing/sysfs-driver-xen-blkback
index ecb7942ff146..0c42285c75ee 100644
--- a/Documentation/ABI/testing/sysfs-driver-xen-blkback
+++ b/Documentation/ABI/testing/sysfs-driver-xen-blkback
@@ -35,3 +35,11 @@ Description:
                 controls the duration in milliseconds that blkback will not
                 cache any page not backed by a grant mapping.
                 The default is 10ms.
+
+What:           /sys/module/xen_blkback/parameters/feature_persistent
+Date:           September 2020
+KernelVersion:  5.10
+Contact:        SeongJae Park <sjpark@amazon.de>
+Description:
+                Whether to enable the persistent grants feature or not.
+                The default is 1 (enable).
diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index b9aa5d1ac10b..9c03d70469f4 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -879,6 +879,12 @@ static void reclaim_memory(struct xenbus_device *dev)
 
 /* ** Connection ** */
 
+/* Enable the persistent grants feature. */
+static unsigned int feature_persistent = 1;
+module_param_named(feature_persistent, feature_persistent, int, 0644);
+MODULE_PARM_DESC(feature_persistent,
+		"Enables the persistent grants feature");
+
 /*
  * Write the physical details regarding the block device to the store, and
  * switch to Connected state.
@@ -906,7 +912,8 @@ static void connect(struct backend_info *be)
 
 	xen_blkbk_barrier(xbt, be, be->blkif->vbd.flush_support);
 
-	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u", 1);
+	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u",
+			feature_persistent ? 1 : 0);
 	if (err) {
 		xenbus_dev_fatal(dev, err, "writing %s/feature-persistent",
 				 dev->nodename);
@@ -1093,8 +1100,12 @@ static int connect_ring(struct backend_info *be)
 		xenbus_dev_fatal(dev, err, "unknown fe protocol %s", protocol);
 		return -ENOSYS;
 	}
-	pers_grants = xenbus_read_unsigned(dev->otherend, "feature-persistent",
-					   0);
+	if (feature_persistent)
+		pers_grants = xenbus_read_unsigned(dev->otherend,
+				"feature-persistent", 0);
+	else
+		pers_grants = 0;
+
 	blkif->vbd.feature_gnt_persistent = pers_grants;
 	blkif->vbd.overflow_max_grants = 0;
 
-- 
2.17.1


