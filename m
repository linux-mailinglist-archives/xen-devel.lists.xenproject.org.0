Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B19275147
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 08:19:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKy7f-000726-N3; Wed, 23 Sep 2020 06:19:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0zQO=DA=amazon.com=prvs=5281df109=sjpark@srs-us1.protection.inumbo.net>)
 id 1kKy7d-00071x-TM
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 06:19:21 +0000
X-Inumbo-ID: a950ac56-86f9-44d1-aeed-4278f9ddbe3e
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a950ac56-86f9-44d1-aeed-4278f9ddbe3e;
 Wed, 23 Sep 2020 06:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600841961; x=1632377961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ugucz/rQejY9CCWX5M6IeRpnuv55lkqiEc2mhoGSlgc=;
 b=e7xQHRzb8qeoEGRvnMLAKTYbiMFcOUP0MTO7G7AiroG3FwvjUztWEgc7
 OStvZKCM5Yq01rXS38UeOdimeG08+GLyj+70H1stzZisqEsTPCiCqPa+0
 qRKppJCpkfHiHd1RtkrBQ2P8VfnPqIgEMj8VeSO9Mh2gsdmJlgrDuVc/O Y=;
X-IronPort-AV: E=Sophos;i="5.77,293,1596499200"; d="scan'208";a="57152357"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 23 Sep 2020 06:19:20 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4117DA062F; Wed, 23 Sep 2020 06:19:19 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.162.85) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 23 Sep 2020 06:19:12 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <konrad.wilk@oracle.com>, <roger.pau@citrix.com>, <jgross@suse.com>
CC: SeongJae Park <sjpark@amazon.de>, <axboe@kernel.dk>,
 <aliguori@amazon.com>, <amit@kernel.org>, <mheyne@amazon.de>,
 <pdurrant@amazon.co.uk>, <linux-block@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/3] xen-blkfront: add a parameter for disabling of
 persistent grants
Date: Wed, 23 Sep 2020 08:18:40 +0200
Message-ID: <20200923061841.20531-3-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200923061841.20531-1-sjpark@amazon.com>
References: <20200923061841.20531-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.43.162.85]
X-ClientProxiedBy: EX13D10UWB001.ant.amazon.com (10.43.161.111) To
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
required to be disabled.  It can be disabled from blkback side using a
module parameter, 'feature_persistent'.  But, it is impossible from
blkfront side.  For the reason, this commit adds a blkfront module
parameter for disabling of the feature.

[1] https://wiki.xen.org/wiki/Xen_4.3_Block_Protocol_Scalability

Signed-off-by: SeongJae Park <sjpark@amazon.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .../ABI/testing/sysfs-driver-xen-blkfront     |  9 +++++++++
 drivers/block/xen-blkfront.c                  | 20 ++++++++++++++-----
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkfront b/Documentation/ABI/testing/sysfs-driver-xen-blkfront
index c0a6cb7eb314..9c31334cb2e6 100644
--- a/Documentation/ABI/testing/sysfs-driver-xen-blkfront
+++ b/Documentation/ABI/testing/sysfs-driver-xen-blkfront
@@ -8,3 +8,12 @@ Description:
                 is 32 - higher value means more potential throughput but more
                 memory usage. The backend picks the minimum of the frontend
                 and its default backend value.
+
+What:           /sys/module/xen_blkfront/parameters/feature_persistent
+Date:           September 2020
+KernelVersion:  5.10
+Contact:        SeongJae Park <sjpark@amazon.de>
+Description:
+                Whether to enable the persistent grants feature or not.  Note
+                that this option only takes effect on newly created frontends.
+                The default is Y (enable).
diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 91de2e0755ae..48629d3433b4 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -1866,8 +1866,8 @@ static int talk_to_blkback(struct xenbus_device *dev,
 		message = "writing protocol";
 		goto abort_transaction;
 	}
-	err = xenbus_printf(xbt, dev->nodename,
-			    "feature-persistent", "%u", 1);
+	err = xenbus_printf(xbt, dev->nodename, "feature-persistent", "%u",
+			info->feature_persistent);
 	if (err)
 		dev_warn(&dev->dev,
 			 "writing persistent grants feature to xenbus");
@@ -1941,6 +1941,13 @@ static int negotiate_mq(struct blkfront_info *info)
 	}
 	return 0;
 }
+
+/* Enable the persistent grants feature. */
+static bool feature_persistent = true;
+module_param(feature_persistent, bool, 0644);
+MODULE_PARM_DESC(feature_persistent,
+		"Enables the persistent grants feature");
+
 /**
  * Entry point to this code when a new device is created.  Allocate the basic
  * structures and the ring buffer for communication with the backend, and
@@ -2007,6 +2014,8 @@ static int blkfront_probe(struct xenbus_device *dev,
 	info->vdevice = vdevice;
 	info->connected = BLKIF_STATE_DISCONNECTED;
 
+	info->feature_persistent = feature_persistent;
+
 	/* Front end dir is a number, which is used as the id. */
 	info->handle = simple_strtoul(strrchr(dev->nodename, '/')+1, NULL, 0);
 	dev_set_drvdata(&dev->dev, info);
@@ -2316,9 +2325,10 @@ static void blkfront_gather_backend_features(struct blkfront_info *info)
 	if (xenbus_read_unsigned(info->xbdev->otherend, "feature-discard", 0))
 		blkfront_setup_discard(info);
 
-	info->feature_persistent =
-		!!xenbus_read_unsigned(info->xbdev->otherend,
-				       "feature-persistent", 0);
+	if (info->feature_persistent)
+		info->feature_persistent =
+			!!xenbus_read_unsigned(info->xbdev->otherend,
+					       "feature-persistent", 0);
 
 	indirect_segments = xenbus_read_unsigned(info->xbdev->otherend,
 					"feature-max-indirect-segments", 0);
-- 
2.17.1


