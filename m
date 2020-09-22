Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9186273FF5
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 12:53:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKfuf-00021f-5E; Tue, 22 Sep 2020 10:52:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHJL=C7=amazon.com=prvs=5271185ff=sjpark@srs-us1.protection.inumbo.net>)
 id 1kKfud-00021a-Td
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 10:52:43 +0000
X-Inumbo-ID: c48b4a67-bb1f-4736-b368-abbfbf20cc3f
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c48b4a67-bb1f-4736-b368-abbfbf20cc3f;
 Tue, 22 Sep 2020 10:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600771963; x=1632307963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=0dU7YfFywii/Po1R39ApRo2sKwRx3dgwXOoeAeCRN34=;
 b=wBn1/vKi+LvApNsPZo5VhMDLIxBPJJcXxrodg5ZXgaBcy5SJqbML8st0
 Xsur+C2f18Ihr3hKUfRBke3QcNqtmIhRROZx3VlgZPGyhdrUAm1hKXRa+
 C26ObtKXoWwy+hH8Ed309N5XmyF3+dR/Z3aHoEV+CZmLb446jrf6x5XT6 w=;
X-IronPort-AV: E=Sophos;i="5.77,290,1596499200"; d="scan'208";a="56925064"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 22 Sep 2020 10:52:42 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id CA02DA1DAD; Tue, 22 Sep 2020 10:52:39 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.162.35) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 22 Sep 2020 10:52:34 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <konrad.wilk@oracle.com>, <roger.pau@citrix.com>, <jgross@suse.com>
CC: SeongJae Park <sjpark@amazon.de>, <axboe@kernel.dk>,
 <aliguori@amazon.com>, <amit@kernel.org>, <mheyne@amazon.de>,
 <pdurrant@amazon.co.uk>, <linux-block@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] xen-blkback: add a parameter for disabling of
 persistent grants
Date: Tue, 22 Sep 2020 12:52:07 +0200
Message-ID: <20200922105209.5284-2-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922105209.5284-1-sjpark@amazon.com>
References: <20200922105209.5284-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.162.35]
X-ClientProxiedBy: EX13D14UWB003.ant.amazon.com (10.43.161.162) To
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
 .../ABI/testing/sysfs-driver-xen-blkback      |  9 ++++++
 drivers/block/xen-blkback/xenbus.c            | 28 ++++++++++++++-----
 2 files changed, 30 insertions(+), 7 deletions(-)

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
index b9aa5d1ac10b..8a95ddd08b13 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -879,6 +879,12 @@ static void reclaim_memory(struct xenbus_device *dev)
 
 /* ** Connection ** */
 
+/* Enable the persistent grants feature. */
+static bool feature_persistent = true;
+module_param(feature_persistent, bool, 0644);
+MODULE_PARM_DESC(feature_persistent,
+		"Enables the persistent grants feature");
+
 /*
  * Write the physical details regarding the block device to the store, and
  * switch to Connected state.
@@ -906,11 +912,15 @@ static void connect(struct backend_info *be)
 
 	xen_blkbk_barrier(xbt, be, be->blkif->vbd.flush_support);
 
-	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u", 1);
-	if (err) {
-		xenbus_dev_fatal(dev, err, "writing %s/feature-persistent",
-				 dev->nodename);
-		goto abort;
+	if (feature_persistent) {
+		err = xenbus_printf(xbt, dev->nodename, "feature-persistent",
+				"%u", feature_persistent);
+		if (err) {
+			xenbus_dev_fatal(dev, err,
+					"writing %s/feature-persistent",
+					dev->nodename);
+			goto abort;
+		}
 	}
 
 	err = xenbus_printf(xbt, dev->nodename, "sectors", "%llu",
@@ -1093,8 +1103,12 @@ static int connect_ring(struct backend_info *be)
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


