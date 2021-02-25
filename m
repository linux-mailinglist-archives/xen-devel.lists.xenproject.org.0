Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE812324FDE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 13:32:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89701.169191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFFof-0003bk-2j; Thu, 25 Feb 2021 12:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89701.169191; Thu, 25 Feb 2021 12:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFFoe-0003bL-V7; Thu, 25 Feb 2021 12:32:24 +0000
Received: by outflank-mailman (input) for mailman id 89701;
 Thu, 25 Feb 2021 12:29:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jPrM=H3=amazon.com=prvs=68338ebd9=andyhsu@srs-us1.protection.inumbo.net>)
 id 1lFFmI-0002rY-74
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 12:29:58 +0000
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34af81ce-aec0-48a6-8dca-f80a9f307baf;
 Thu, 25 Feb 2021 12:29:57 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-821c648d.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 25 Feb 2021 12:29:51 +0000
Received: from EX13D12EUA002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1a-821c648d.us-east-1.amazon.com (Postfix) with ESMTPS
 id F3328A0645
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 12:29:49 +0000 (UTC)
Received: from dev-dsk-andyhsu-1c-d6833dcf.eu-west-1.amazon.com (10.43.160.27)
 by EX13D12EUA002.ant.amazon.com (10.43.165.103) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Thu, 25 Feb 2021 12:29:47 +0000
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
X-Inumbo-ID: 34af81ce-aec0-48a6-8dca-f80a9f307baf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1614256198; x=1645792198;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CGtR0i81LbIzNkrCKXybCDMaGmp77tg1tDfxh2m6iuE=;
  b=gQNdGANCp1LD5JcgDs1mZQu4JcyvohzBDVcicbJwIvC3iS8AlTjZuh9l
   c+WbGhzeoIOvLKfjr09FwOuuEf02ZyXw3u+nGz3WPRTCjBzZN/rH8mQPd
   l5HNBXFK6LULQAWHhwHvLaqduwIUb4TrFo07ayMPBF7Q5bCd++IOg7RLl
   I=;
X-IronPort-AV: E=Sophos;i="5.81,205,1610409600"; 
   d="scan'208";a="88075059"
From: ChiaHao Hsu <andyhsu@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <andyhsu@amazon.com>
Subject: [PATCH 1/2] xen-netback: add module parameter to disable ctrl-ring
Date: Thu, 25 Feb 2021 12:29:40 +0000
Message-ID: <20210225122940.9310-1-andyhsu@amazon.com>
X-Mailer: git-send-email 2.23.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.160.27]
X-ClientProxiedBy: EX13D50UWC001.ant.amazon.com (10.43.162.96) To
 EX13D12EUA002.ant.amazon.com (10.43.165.103)
Precedence: Bulk

In order to support live migration of guests between kernels
that do and do not support 'feature-ctrl-ring', we add a
module parameter that allows the feature to be disabled
at run time, instead of using hardcode value.
The default value is enable.

Signed-off-by: ChiaHao Hsu <andyhsu@amazon.com>
---
 drivers/net/xen-netback/common.h  |  2 ++
 drivers/net/xen-netback/netback.c |  6 ++++++
 drivers/net/xen-netback/xenbus.c  | 13 ++++++++-----
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/net/xen-netback/common.h b/drivers/net/xen-netback/common.h
index 4a16d6e33c09..bfb7a3054917 100644
--- a/drivers/net/xen-netback/common.h
+++ b/drivers/net/xen-netback/common.h
@@ -276,6 +276,7 @@ struct backend_info {
 	u8 have_hotplug_status_watch:1;
 
 	const char *hotplug_script;
+	bool ctrl_ring_enabled;
 };
 
 struct xenvif {
@@ -413,6 +414,7 @@ static inline pending_ring_idx_t nr_pending_reqs(struct xenvif_queue *queue)
 
 irqreturn_t xenvif_interrupt(int irq, void *dev_id);
 
+extern bool control_ring;
 extern bool separate_tx_rx_irq;
 extern bool provides_xdp_headroom;
 
diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index e5c73f819662..20d858f0456a 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -48,6 +48,12 @@
 
 #include <asm/xen/hypercall.h>
 
+/* Provide an option to disable control ring which is used to pass
+ * large quantities of data from frontend to backend.
+ */
+bool control_ring = true;
+module_param(control_ring, bool, 0644);
+
 /* Provide an option to disable split event channels at load time as
  * event channels are limited resource. Split event channels are
  * enabled by default.
diff --git a/drivers/net/xen-netback/xenbus.c b/drivers/net/xen-netback/xenbus.c
index a5439c130130..8a9169cff9c5 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -1123,11 +1123,14 @@ static int netback_probe(struct xenbus_device *dev,
 	if (err)
 		pr_debug("Error writing multi-queue-max-queues\n");
 
-	err = xenbus_printf(XBT_NIL, dev->nodename,
-			    "feature-ctrl-ring",
-			    "%u", true);
-	if (err)
-		pr_debug("Error writing feature-ctrl-ring\n");
+	be->ctrl_ring_enabled = READ_ONCE(control_ring);
+	if (be->ctrl_ring_enabled) {
+		err = xenbus_printf(XBT_NIL, dev->nodename,
+				    "feature-ctrl-ring",
+				    "%u", true);
+		if (err)
+			pr_debug("Error writing feature-ctrl-ring\n");
+	}
 
 	backend_switch_state(be, XenbusStateInitWait);
 
-- 
2.23.3


