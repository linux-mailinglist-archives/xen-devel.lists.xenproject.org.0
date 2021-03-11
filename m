Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 228A4338102
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 00:00:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96754.183395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKUHr-00015P-3Z; Thu, 11 Mar 2021 23:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96754.183395; Thu, 11 Mar 2021 23:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKUHr-000150-0U; Thu, 11 Mar 2021 23:00:11 +0000
Received: by outflank-mailman (input) for mailman id 96754;
 Thu, 11 Mar 2021 23:00:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Q4q=IJ=amazon.com=prvs=6978c4989=andyhsu@srs-us1.protection.inumbo.net>)
 id 1lKUHp-00014v-Tb
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 23:00:09 +0000
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a79dd51f-88e1-4309-b5ae-93e36f2cb113;
 Thu, 11 Mar 2021 23:00:09 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-c300ac87.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 11 Mar 2021 23:00:00 +0000
Received: from EX13D12EUA002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-c300ac87.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1C690A22E0; Thu, 11 Mar 2021 22:59:59 +0000 (UTC)
Received: from dev-dsk-andyhsu-1c-d6833dcf.eu-west-1.amazon.com (10.43.160.27)
 by EX13D12EUA002.ant.amazon.com (10.43.165.103) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Thu, 11 Mar 2021 22:59:55 +0000
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
X-Inumbo-ID: a79dd51f-88e1-4309-b5ae-93e36f2cb113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1615503609; x=1647039609;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f4kw6VKDxqZ6aK5je+CShKYL/i9tWOOhWCfFur47MZU=;
  b=UGUGIPn3RL2Wn973dCqB/OjjJ4bfP7W5bmGnhUToh/mPXPZsqFGU1baG
   ISbwkSoVNRVbIguZmtKNU+POg04oHzvFwG4JyTFi4ucA8DozH+JT/z9Dy
   gMO7yeBowP+S/4yghbpOc52VEcXv9SgLCELVdk6e+tet+L/7U6ZCnQR71
   g=;
IronPort-HdrOrdr: A9a23:hblugKnnQPn8kG+AHnwCCxgN7sfpDfKS3DAbvn1ZSRFFG/Gwve
 rGppsm/DXzjyscX2xlpMuJP7OOTWiZ2Zl+54QQOrnKZniChEKDKoZ+4Yz+hwDxAiGWzJ846Y
 5Me7VzYeeQMXFUlsD/iTPUL/8F4P2qtJ+lnv3fyXAFd3AJV4hF4x1iAgiWVm1aLTMnObMBD5
 aX6sdKoDCtEE5nF/iTPXUOU+jdq9CjrvuPCnQ7LiQ64wqDhy7A0tDHOiWfty1zbxp/hZ0m8W
 TDjjXj4LSiv/yR2nbnpgnuxqUTvNPgz9dZbfb86fQ9G3HLkQanZINoRr2EsnQUmYiUmTEXrO
 U=
X-IronPort-AV: E=Sophos;i="5.81,241,1610409600"; 
   d="scan'208";a="92295156"
From: ChiaHao Hsu <andyhsu@amazon.com>
To: <netdev@vger.kernel.org>
CC: <wei.liu@kernel.org>, <paul@xen.org>, <davem@davemloft.net>,
	<kuba@kernel.org>, <andyhsu@amazon.com>, <xen-devel@lists.xenproject.org>
Subject: [net-next 1/2] xen-netback: add module parameter to disable ctrl-ring
Date: Thu, 11 Mar 2021 22:59:44 +0000
Message-ID: <20210311225944.24198-1-andyhsu@amazon.com>
X-Mailer: git-send-email 2.23.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.43.160.27]
X-ClientProxiedBy: EX13D42UWB003.ant.amazon.com (10.43.161.45) To
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
 drivers/net/xen-netback/xenbus.c  | 23 ++++++++++++++---------
 3 files changed, 22 insertions(+), 9 deletions(-)

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
index 39a01c2a3058..a119ae673862 100644
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
index a5439c130130..9801b8d10239 100644
--- a/drivers/net/xen-netback/xenbus.c
+++ b/drivers/net/xen-netback/xenbus.c
@@ -755,10 +755,12 @@ static void connect(struct backend_info *be)
 	xen_register_watchers(dev, be->vif);
 	read_xenbus_vif_flags(be);
 
-	err = connect_ctrl_ring(be);
-	if (err) {
-		xenbus_dev_fatal(dev, err, "connecting control ring");
-		return;
+	if (be->ctrl_ring_enabled) {
+		err = connect_ctrl_ring(be);
+		if (err) {
+			xenbus_dev_fatal(dev, err, "connecting control ring");
+			return;
+		}
 	}
 
 	/* Use the number of queues requested by the frontend */
@@ -1123,11 +1125,14 @@ static int netback_probe(struct xenbus_device *dev,
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


