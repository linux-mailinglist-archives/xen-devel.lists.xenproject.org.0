Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95250324FDD
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 13:32:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89703.169200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFFof-0003cO-CI; Thu, 25 Feb 2021 12:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89703.169200; Thu, 25 Feb 2021 12:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFFof-0003bm-86; Thu, 25 Feb 2021 12:32:25 +0000
Received: by outflank-mailman (input) for mailman id 89703;
 Thu, 25 Feb 2021 12:31:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPrM=H3=amazon.com=prvs=68338ebd9=andyhsu@srs-us1.protection.inumbo.net>)
 id 1lFFo3-0003ao-6R
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 12:31:47 +0000
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6621d550-1644-445c-bc62-28cfd563fc75;
 Thu, 25 Feb 2021 12:31:46 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 25 Feb 2021 12:31:38 +0000
Received: from EX13D12EUA002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id 502D31416CE
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 12:31:38 +0000 (UTC)
Received: from dev-dsk-andyhsu-1c-d6833dcf.eu-west-1.amazon.com
 (10.43.160.146) by EX13D12EUA002.ant.amazon.com (10.43.165.103) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Feb 2021 12:31:36 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6621d550-1644-445c-bc62-28cfd563fc75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1614256306; x=1645792306;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4JQ5FcEpuWrAdiBSf7ibanfdKfXRZdUYwPvQsSOrgh4=;
  b=biTZdJyW7pYY/Xkt64t9tLEENB9DN8hZ6pc1Me5i61mU7JP5wjb92bNY
   nDpvfmH4o/CxcP1Ah6RcOVkaHZmQTsgBCK7hHL+D6QrXU0lZqiHJ4f4IV
   uAalKZghrHGRKXe/IbkD1G4TxJkQIi54I8QNUZ49+UrV/QJpllpuVlSLq
   g=;
X-IronPort-AV: E=Sophos;i="5.81,205,1610409600"; 
   d="scan'208";a="92179167"
From: ChiaHao Hsu <andyhsu@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <andyhsu@amazon.com>
Subject: [PATCH 2/2] xen-netback: add module parameter to disable dynamic multicast control
Date: Thu, 25 Feb 2021 12:31:27 +0000
Message-ID: <20210225123127.9771-1-andyhsu@amazon.com>
X-Mailer: git-send-email 2.23.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.160.146]
X-ClientProxiedBy: EX13D21UWA002.ant.amazon.com (10.43.160.246) To
 EX13D12EUA002.ant.amazon.com (10.43.165.103)
Precedence: Bulk

In order to support live migration of guests between kernels
that do and do not support 'feature-dynamic-multicast-control',
we add a module parameter that allows the feature to be disabled
at run time, instead of using hardcode value.
The default value is enable.

Signed-off-by: ChiaHao Hsu <andyhsu@amazon.com>
---
 drivers/net/xen-netback/common.h  |  1 +
 drivers/net/xen-netback/netback.c |  7 +++++++
 drivers/net/xen-netback/xenbus.c  | 14 ++++++++------
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/net/xen-netback/common.h b/drivers/net/xen-netback/common.h
index bfb7a3054917..c166ebb5a81f 100644
--- a/drivers/net/xen-netback/common.h
+++ b/drivers/net/xen-netback/common.h
@@ -415,6 +415,7 @@ static inline pending_ring_idx_t nr_pending_reqs(struct xenvif_queue *queue)
 irqreturn_t xenvif_interrupt(int irq, void *dev_id);
 
 extern bool control_ring;
+extern bool dynamic_multicast_control;
 extern bool separate_tx_rx_irq;
 extern bool provides_xdp_headroom;
 
diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index 20d858f0456a..4c3d92238ae9 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -54,6 +54,13 @@
 bool control_ring = true;
 module_param(control_ring, bool, 0644);
 
+/* Provide an option to extend multicast control protocol. This allows
+ * request-multicast-control to be set by the frontend at any time,
+ * the backend will watch the value and re-sample on watch events.
+ */
+bool dynamic_multicast_control = true;
+module_param(dynamic_multicast_control, bool, 0644);
+
 /* Provide an option to disable split event channels at load time as
  * event channels are limited resource. Split event channels are
  * enabled by default.
diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
index 8a9169cff9c5..36c699f99da4 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -1092,12 +1092,14 @@ static int netback_probe(struct xenbus_device *dev,
 			goto abort_transaction;
 		}
 
-		err = xenbus_printf(xbt, dev->nodename,
-				    "feature-dynamic-multicast-control",
-				    "%d", 1);
-		if (err) {
-			message = "writing feature-dynamic-multicast-control";
-			goto abort_transaction;
+		if (dynamic_multicast_control) {
+			err = xenbus_printf(xbt, dev->nodename,
+					    "feature-dynamic-multicast-control",
+					    "%d", 1);
+			if (err) {
+				message = "writing feature-dynamic-multicast-control";
+				goto abort_transaction;
+			}
 		}
 
 		err = xenbus_transaction_end(xbt, 0);
-- 
2.23.3


