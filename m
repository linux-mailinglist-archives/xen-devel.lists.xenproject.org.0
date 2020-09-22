Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93990273FF3
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 12:53:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKfuk-00022f-DC; Tue, 22 Sep 2020 10:52:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHJL=C7=amazon.com=prvs=5271185ff=sjpark@srs-us1.protection.inumbo.net>)
 id 1kKfuj-00022T-8s
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 10:52:49 +0000
X-Inumbo-ID: 9308aae2-8792-4aaa-9c7f-8da729ed5cb2
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9308aae2-8792-4aaa-9c7f-8da729ed5cb2;
 Tue, 22 Sep 2020 10:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1600771969; x=1632307969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=bgixASFZMrz4uNYz/S35PVAa/iOnwmK2jo635pLG9Ls=;
 b=eVxUdfoFJdps0rEuxLbaWwXotgXSK4n77TtsqLjrj30/4AQBWH5J7oFe
 IVAywM/NWsgQTcE8xtvXRvPlXb9oNh1qVeH9acw0IplgT7Ru1Jr6ZwLwe
 Y+WlNF0cOeIehP6ECmZGbdeVzQXG1faigpXSuQMUvDGrSS4/mV8/px5FI c=;
X-IronPort-AV: E=Sophos;i="5.77,290,1596499200"; d="scan'208";a="55490521"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 22 Sep 2020 10:52:48 +0000
Received: from EX13D31EUA004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2879EA1D05; Tue, 22 Sep 2020 10:52:45 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.162.35) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 22 Sep 2020 10:52:40 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <konrad.wilk@oracle.com>, <roger.pau@citrix.com>, <jgross@suse.com>
CC: SeongJae Park <sjpark@amazon.de>, <axboe@kernel.dk>,
 <aliguori@amazon.com>, <amit@kernel.org>, <mheyne@amazon.de>,
 <pdurrant@amazon.co.uk>, <linux-block@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] xen-blkfront: add a parameter for disabling of
 persistent grants
Date: Tue, 22 Sep 2020 12:52:08 +0200
Message-ID: <20200922105209.5284-3-sjpark@amazon.com>
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
required to be disabled.  It can be disabled from blkback side using a
module parameter, 'feature_persistent'.  But, it is impossible from
blkfront side.  For the reason, this commit adds a blkfront module
parameter for disabling of the feature.

[1] https://wiki.xen.org/wiki/Xen_4.3_Block_Protocol_Scalability

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 .../ABI/testing/sysfs-driver-xen-blkfront     |  9 ++++++
 drivers/block/xen-blkfront.c                  | 28 +++++++++++++------
 2 files changed, 29 insertions(+), 8 deletions(-)

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
index 91de2e0755ae..49c324f377de 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -149,6 +149,13 @@ static unsigned int xen_blkif_max_ring_order;
 module_param_named(max_ring_page_order, xen_blkif_max_ring_order, int, 0444);
 MODULE_PARM_DESC(max_ring_page_order, "Maximum order of pages to be used for the shared ring");
 
+/* Enable the persistent grants feature. */
+static bool feature_persistent = true;
+module_param(feature_persistent, bool, 0644);
+MODULE_PARM_DESC(feature_persistent,
+		"Enables the persistent grants feature");
+
+
 #define BLK_RING_SIZE(info)	\
 	__CONST_RING_SIZE(blkif, XEN_PAGE_SIZE * (info)->nr_ring_pages)
 
@@ -1866,11 +1873,13 @@ static int talk_to_blkback(struct xenbus_device *dev,
 		message = "writing protocol";
 		goto abort_transaction;
 	}
-	err = xenbus_printf(xbt, dev->nodename,
-			    "feature-persistent", "%u", 1);
-	if (err)
-		dev_warn(&dev->dev,
-			 "writing persistent grants feature to xenbus");
+	if (feature_persistent) {
+		err = xenbus_printf(xbt, dev->nodename,
+				    "feature-persistent", "%u", 1);
+		if (err)
+			dev_warn(&dev->dev,
+				 "writing persistent grants feature to xenbus");
+	}
 
 	err = xenbus_transaction_end(xbt, 0);
 	if (err) {
@@ -2316,9 +2325,12 @@ static void blkfront_gather_backend_features(struct blkfront_info *info)
 	if (xenbus_read_unsigned(info->xbdev->otherend, "feature-discard", 0))
 		blkfront_setup_discard(info);
 
-	info->feature_persistent =
-		!!xenbus_read_unsigned(info->xbdev->otherend,
-				       "feature-persistent", 0);
+	if (feature_persistent)
+		info->feature_persistent =
+			!!xenbus_read_unsigned(info->xbdev->otherend,
+					       "feature-persistent", 0);
+	else
+		info->feature_persistent = 0;
 
 	indirect_segments = xenbus_read_unsigned(info->xbdev->otherend,
 					"feature-max-indirect-segments", 0);
-- 
2.17.1


