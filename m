Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7003A3E9344
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 16:09:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166082.303330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDouR-00008L-Vh; Wed, 11 Aug 2021 14:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166082.303330; Wed, 11 Aug 2021 14:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDouR-0008Vx-Rn; Wed, 11 Aug 2021 14:08:43 +0000
Received: by outflank-mailman (input) for mailman id 166082;
 Wed, 11 Aug 2021 14:08:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rQPX=NC=amazon.de=prvs=8505c50af=mheyne@srs-us1.protection.inumbo.net>)
 id 1mDouP-0008Al-Sb
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 14:08:41 +0000
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e92e635-faad-11eb-a08b-12813bfff9fa;
 Wed, 11 Aug 2021 14:08:36 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-33001.sea14.amazon.com with ESMTP; 11 Aug 2021 14:08:28 +0000
Received: from EX13D08EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 22B19A17BF; Wed, 11 Aug 2021 14:08:26 +0000 (UTC)
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D08EUC002.ant.amazon.com (10.43.164.124) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Wed, 11 Aug 2021 14:08:24 +0000
Received: from dev-dsk-mheyne-1b-c1524648.eu-west-1.amazon.com (10.15.60.66)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.23 via Frontend Transport; Wed, 11 Aug 2021 14:08:24 +0000
Received: by dev-dsk-mheyne-1b-c1524648.eu-west-1.amazon.com (Postfix,
 from userid 5466572)
 id BA8E84100D; Wed, 11 Aug 2021 14:08:23 +0000 (UTC)
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
X-Inumbo-ID: 9e92e635-faad-11eb-a08b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1628690917; x=1660226917;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oQ5UAM3qsYA8wj/5XJoEDLZTpGAg5BjoV/crxslI2Z0=;
  b=nfLj+J1IXzos6fwPUbJyJL7i2yAIpoIt3d3+jUz+f9wWKBdUVlrdabyZ
   m4D2uPkjLjF/cbUOwT4t5LQHRsf80iC3nPkO05krA5tET4+9YG2ULSYMX
   Z41ip/9oa75yyieqPyn214oRRhNYPMnBoCffkrvn4sET1PGCzvk1g6gxg
   o=;
X-IronPort-AV: E=Sophos;i="5.84,313,1620691200"; 
   d="scan'208";a="141197449"
From: Maximilian Heyne <mheyne@amazon.de>
To: 
CC: Amit Shah <aams@amazon.de>, Maximilian Heyne <mheyne@amazon.de>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Jan Beulich <jbeulich@suse.com>,
	Malcolm Crossley <malcolm.crossley@citrix.com>, David Vrabel
	<david.vrabel@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	<xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] xen/events: Fix race in set_evtchn_to_irq
Date: Wed, 11 Aug 2021 14:08:03 +0000
Message-ID: <20210811140806.75710-1-mheyne@amazon.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is a TOCTOU issue in set_evtchn_to_irq. Rows in the evtchn_to_irq
mapping are lazily allocated in this function. The check whether the row
is already present and the row initialization is not synchronized. Two
threads can at the same time allocate a new row for evtchn_to_irq and
add the irq mapping to the their newly allocated row. One thread will
overwrite what the other has set for evtchn_to_irq[row] and therefore
the irq mapping is lost. This will trigger a BUG_ON later in
bind_evtchn_to_cpu:

  INFO: pci 0000:1a:15.4: [1d0f:8061] type 00 class 0x010802
  INFO: nvme 0000:1a:12.1: enabling device (0000 -> 0002)
  INFO: nvme nvme77: 1/0/0 default/read/poll queues
  CRIT: kernel BUG at drivers/xen/events/events_base.c:427!
  WARN: invalid opcode: 0000 [#1] SMP NOPTI
  WARN: Workqueue: nvme-reset-wq nvme_reset_work [nvme]
  WARN: RIP: e030:bind_evtchn_to_cpu+0xc2/0xd0
  WARN: Call Trace:
  WARN:  set_affinity_irq+0x121/0x150
  WARN:  irq_do_set_affinity+0x37/0xe0
  WARN:  irq_setup_affinity+0xf6/0x170
  WARN:  irq_startup+0x64/0xe0
  WARN:  __setup_irq+0x69e/0x740
  WARN:  ? request_threaded_irq+0xad/0x160
  WARN:  request_threaded_irq+0xf5/0x160
  WARN:  ? nvme_timeout+0x2f0/0x2f0 [nvme]
  WARN:  pci_request_irq+0xa9/0xf0
  WARN:  ? pci_alloc_irq_vectors_affinity+0xbb/0x130
  WARN:  queue_request_irq+0x4c/0x70 [nvme]
  WARN:  nvme_reset_work+0x82d/0x1550 [nvme]
  WARN:  ? check_preempt_wakeup+0x14f/0x230
  WARN:  ? check_preempt_curr+0x29/0x80
  WARN:  ? nvme_irq_check+0x30/0x30 [nvme]
  WARN:  process_one_work+0x18e/0x3c0
  WARN:  worker_thread+0x30/0x3a0
  WARN:  ? process_one_work+0x3c0/0x3c0
  WARN:  kthread+0x113/0x130
  WARN:  ? kthread_park+0x90/0x90
  WARN:  ret_from_fork+0x3a/0x50

This patch sets evtchn_to_irq rows via a cmpxchg operation so that they
will be set only once. Clearing the row was moved up before writing the
row to evtchn_to_irq in order to not create a race once the row is
visible for other threads. Accesses to the rows are now guarded by
READ_ONCE and WRITE_ONCE just as for the columns in the data structure.

Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
Fixes: d0b075ffeede ("xen/events: Refactor evtchn_to_irq array to be dynamically allocated")
---
 drivers/xen/events/events_base.c | 35 ++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index d7e361fb0548..7582a7f52313 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -198,22 +198,24 @@ static void disable_dynirq(struct irq_data *data);
 
 static DEFINE_PER_CPU(unsigned int, irq_epoch);
 
-static void clear_evtchn_to_irq_row(unsigned row)
+static void clear_evtchn_to_irq_row(int *evtchn_row)
 {
 	unsigned col;
 
 	for (col = 0; col < EVTCHN_PER_ROW; col++)
-		WRITE_ONCE(evtchn_to_irq[row][col], -1);
+		WRITE_ONCE(evtchn_row[col], -1);
 }
 
 static void clear_evtchn_to_irq_all(void)
 {
 	unsigned row;
+	int *evtchn_row;
 
 	for (row = 0; row < EVTCHN_ROW(xen_evtchn_max_channels()); row++) {
-		if (evtchn_to_irq[row] == NULL)
+		evtchn_row = READ_ONCE(evtchn_to_irq[row]);
+		if (evtchn_row == NULL)
 			continue;
-		clear_evtchn_to_irq_row(row);
+		clear_evtchn_to_irq_row(evtchn_row);
 	}
 }
 
@@ -221,36 +223,47 @@ static int set_evtchn_to_irq(evtchn_port_t evtchn, unsigned int irq)
 {
 	unsigned row;
 	unsigned col;
+	int *evtchn_row;
 
 	if (evtchn >= xen_evtchn_max_channels())
 		return -EINVAL;
 
 	row = EVTCHN_ROW(evtchn);
 	col = EVTCHN_COL(evtchn);
+	evtchn_row = READ_ONCE(evtchn_to_irq[row]);
 
-	if (evtchn_to_irq[row] == NULL) {
+	if (evtchn_row == NULL) {
 		/* Unallocated irq entries return -1 anyway */
 		if (irq == -1)
 			return 0;
 
-		evtchn_to_irq[row] = (int *)get_zeroed_page(GFP_KERNEL);
-		if (evtchn_to_irq[row] == NULL)
+		evtchn_row = (int *) get_zeroed_page(GFP_KERNEL);
+		if (evtchn_row == NULL)
 			return -ENOMEM;
 
-		clear_evtchn_to_irq_row(row);
+		clear_evtchn_to_irq_row(evtchn_row);
+
+		if (cmpxchg(&evtchn_to_irq[row], NULL, evtchn_row) != NULL) {
+			free_page((unsigned long) evtchn_row);
+			evtchn_row = READ_ONCE(evtchn_to_irq[row]);
+		}
 	}
 
-	WRITE_ONCE(evtchn_to_irq[row][col], irq);
+	WRITE_ONCE(evtchn_row[col], irq);
 	return 0;
 }
 
 int get_evtchn_to_irq(evtchn_port_t evtchn)
 {
+	int *evtchn_row;
+
 	if (evtchn >= xen_evtchn_max_channels())
 		return -1;
-	if (evtchn_to_irq[EVTCHN_ROW(evtchn)] == NULL)
+
+	evtchn_row = READ_ONCE(evtchn_to_irq[EVTCHN_ROW(evtchn)]);
+	if (evtchn_row == NULL)
 		return -1;
-	return READ_ONCE(evtchn_to_irq[EVTCHN_ROW(evtchn)][EVTCHN_COL(evtchn)]);
+	return READ_ONCE(evtchn_row[EVTCHN_COL(evtchn)]);
 }
 
 /* Get info for IRQ */
-- 
2.32.0




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




