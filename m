Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB4359C2AE
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 17:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391475.629387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9L9-0005Qe-CU; Mon, 22 Aug 2022 15:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391475.629387; Mon, 22 Aug 2022 15:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9L9-0005Nv-7A; Mon, 22 Aug 2022 15:27:47 +0000
Received: by outflank-mailman (input) for mailman id 391475;
 Mon, 22 Aug 2022 15:27:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YSJC=Y2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oQ9L7-0003iu-9b
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 15:27:45 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7526ffd-222e-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 17:27:44 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 05709320099F;
 Mon, 22 Aug 2022 11:27:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 22 Aug 2022 11:27:42 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Aug 2022 11:27:40 -0400 (EDT)
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
X-Inumbo-ID: f7526ffd-222e-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1661182061; x=1661268461; bh=Ds5W69sMUj
	ID7EvzJTjybVIdCA4RPqmY+2ZVAuvq13Y=; b=YFm1zyQCx1oUm0WFUxW6XGY+Sq
	/26HGIXHuZaHoVm0qYHt/Tnp7OZ5Em14VOT/o3UMqEvU4R3fQvZ5rv5SC8Sk2OCC
	2OE1c8rFGxfgnsIudD0ab3NdWZqlWZGnCOk+yG9qSJPFkEecEgV0F2E/neJW8dq7
	lmhT4ODtmmgsk4bldU76A/T1BO1R0QslDeJ6S/ExPRCyLjma0SnEXN11CYPIkK56
	t6XwhmfecUjvi+HIHrchEUTXBW9tOdFUIhSnTSDJdsv6/bIlhzS6ZUrj+YRFw+YM
	mFFy7NQZESIB+9aVbTQ5ETc1huTYExDL/z9yPBA0fPelZJN6yzmB5erI8OAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661182061; x=
	1661268461; bh=Ds5W69sMUjID7EvzJTjybVIdCA4RPqmY+2ZVAuvq13Y=; b=D
	6K94sSxn8Q3AHXmhBXc2twEj3B6CRSePQR8KS7phGZ9qXhg7tT+JdIcuoSqTkIqO
	JTCBwilzHrP5Ee4rzLEt5QUVT0xuOQlYyeZ8weqF87oOVKFOxvnuK38tKcMNa0tC
	DPsJeF5wCD570fib71/VIjLIHgPz4/q2wI88lhMSnOGqa8O4Zy+wMruGyY6UIMaj
	u08PpTw7oRJim5dpK0XS8UcB40L4lQH2i58l6B6RcHKmJAEvaDqPyBAvMDawdpQY
	0YJqriVTl7SJyl3SOL4RKwM3xJ0PlEEIXD+MasYY3ATmpndmD1Pa1LYaeDksUDQp
	9RlKUvGaws+jeneazm7qg==
X-ME-Sender: <xms:baADY2Daos2cKHtnIZOwKwj-Ufk3a3UYADX4OosMbzKoNhIojx4JNQ>
    <xme:baADYwhX_7ZrenPG70iKNOdSJmGP3YrRzLYkAhzLZLwKXOsrcW39dIyGxLb8hiCJ1
    rBTuEHiNh2BWA>
X-ME-Received: <xmr:baADY5mWqXXNkQMfKxYv6KtHu3Eq9AOiWQhiFBWtUhY4EhWwgLEStXgOfoqMyo1WRGIZzPWWfmqknjaJ2o5AQ4Gl9sc5oXmELDg1rzaZszM_-36g1HEyEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeijedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:baADY0wBcj74uQrgAtnoG4TAlJnYcuzP5ph6Ju0NGcKzohpNhlb_CQ>
    <xmx:baADY7SZCFrArnjkrueMYVyNJgPxV9uGKIsKATadir-FDqmjXa6_zQ>
    <xmx:baADY_bFl1oEANoXM4DwK2EAEELUueQ-Msb3r6XWPRZoV95kxQwrFQ>
    <xmx:baADY8JwF3cJ6dad5vxMe7aG-TgAptGjLVvsEBZCvcakLX2M4ZAwoQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 7/9] drivers/char: add RX support to the XHCI driver
Date: Mon, 22 Aug 2022 17:27:07 +0200
Message-Id: <7520ee704004e5464ab13bacb38baea4e986992e.1661181584.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add another work ring buffer for received data, and point IN TRB at it.
Ensure there is always at least one pending IN TRB, so the controller
has a way to send incoming data to the driver.
Note that both "success" and "short packet" completion codes are okay -
in fact it will be "short packet" most of the time, as the TRB length is
about maximum size, not required size.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
- adjust return types
- add some const
New patch in v3
---
 docs/misc/xen-command-line.pandoc |   4 +-
 xen/drivers/char/xhci-dbc.c       | 129 +++++++++++++++++++++++++++++++-
 2 files changed, 131 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index e31300ea3408..a5883ef49a88 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -736,8 +736,8 @@ over the PCI busses sequentially) or by PCI device (must be on segment 0).
 Specify the USB controller to use, either by instance number (when going
 over the PCI busses sequentially) or by PCI device (must be on segment 0).
 
-Output only console. XHCI driver will wait indefinitely for the debug host to
-connect - make sure the cable is connected.
+XHCI driver will wait indefinitely for the debug host to connect - make sure
+the cable is connected.
 
 ### debug_stack_lines
 > `= <integer>`
diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 32e9efeb0f77..afcd3312e2aa 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -111,6 +111,7 @@ enum {
 enum {
     XHCI_TRB_CC_SUCCESS = 1,
     XHCI_TRB_CC_TRB_ERR = 5,
+    XHCI_TRB_CC_SHORT_PACKET = 13,
 };
 
 /* DbC endpoint types */
@@ -239,6 +240,7 @@ struct dbc {
     struct xhci_trb_ring dbc_oring;
     struct xhci_trb_ring dbc_iring;
     struct dbc_work_ring dbc_owork;
+    struct dbc_work_ring dbc_iwork;
     struct xhci_string_descriptor *dbc_str;
 
     pci_sbdf_t sbdf;
@@ -443,6 +445,16 @@ static void xhci_trb_norm_set_ioc(struct xhci_trb *trb)
     trb->ctrl |= 0x20;
 }
 
+static uint64_t xhci_trb_norm_buf(const struct xhci_trb *trb)
+{
+    return trb->params;
+}
+
+static uint32_t xhci_trb_norm_len(const struct xhci_trb *trb)
+{
+    return trb->status & 0x1FFFF;
+}
+
 /**
  * Fields for Transfer Event TRBs (see section 6.4.2.1). Note that event
  * TRBs are read-only from software
@@ -452,6 +464,17 @@ static uint64_t xhci_trb_tfre_ptr(const struct xhci_trb *trb)
     return trb->params;
 }
 
+static uint32_t xhci_trb_tfre_cc(const struct xhci_trb *trb)
+{
+    return trb->status >> 24;
+}
+
+/* Amount of data _not_ transferred */
+static uint32_t xhci_trb_tfre_len(const struct xhci_trb *trb)
+{
+    return trb->status & 0x1FFFF;
+}
+
 /* Fields for link TRBs (section 6.4.4.1) */
 static void xhci_trb_link_set_rsp(struct xhci_trb *trb, uint64_t rsp)
 {
@@ -493,6 +516,14 @@ static bool xhci_trb_ring_full(const struct xhci_trb_ring *ring)
     return ((ring->enq + 1) & (DBC_TRB_RING_CAP - 1)) == ring->deq;
 }
 
+static unsigned int xhci_trb_ring_size(const struct xhci_trb_ring *ring)
+{
+    if ( ring->enq >= ring->deq )
+        return ring->enq - ring->deq;
+
+    return DBC_TRB_RING_CAP - ring->deq + ring->enq;
+}
+
 static bool dbc_work_ring_full(const struct dbc_work_ring *ring)
 {
     return ((ring->enq + 1) & (DBC_WORK_RING_CAP - 1)) == ring->deq;
@@ -506,6 +537,14 @@ static unsigned int dbc_work_ring_size(const struct dbc_work_ring *ring)
     return DBC_WORK_RING_CAP - ring->deq + ring->enq;
 }
 
+static unsigned int dbc_work_ring_space_to_end(const struct dbc_work_ring *ring)
+{
+    if ( ring->enq >= ring->deq )
+        return DBC_WORK_RING_CAP - ring->enq;
+
+    return ring->deq - ring->enq;
+}
+
 static void dbc_push_trb(struct dbc *dbc, struct xhci_trb_ring *ring,
                          uint64_t dma, uint64_t len)
 {
@@ -566,6 +605,31 @@ static unsigned int dbc_push_work(struct dbc *dbc, struct dbc_work_ring *ring,
     return i;
 }
 
+static void dbc_rx_trb(struct dbc *dbc, struct xhci_trb *trb,
+                       uint64_t not_transferred)
+{
+    struct dbc_work_ring *ring = &dbc->dbc_iwork;
+    unsigned int rx_len;
+    unsigned int end, start = ring->enq;
+
+    if ( xhci_trb_type(trb) != XHCI_TRB_NORM )
+        /* Can be Link TRB for example. */
+        return;
+
+    ASSERT(xhci_trb_norm_buf(trb) == ring->dma + ring->enq);
+    ASSERT(xhci_trb_norm_len(trb) >= not_transferred);
+    rx_len = xhci_trb_norm_len(trb) - not_transferred;
+
+    /* It can hit the ring end, but should not wrap around. */
+    ASSERT(ring->enq + rx_len <= DBC_WORK_RING_CAP);
+    ring->enq = (ring->enq + rx_len) & (DBC_WORK_RING_CAP - 1);
+
+    end = ring->enq;
+
+    if ( end > start )
+        cache_flush(&ring->buf[start], end - start);
+}
+
 /*
  * Note that if IN transfer support is added, then this
  * will need to be changed; it assumes an OUT transfer ring only
@@ -575,6 +639,7 @@ static void dbc_pop_events(struct dbc *dbc)
     struct dbc_reg *reg = dbc->dbc_reg;
     struct xhci_trb_ring *er = &dbc->dbc_ering;
     struct xhci_trb_ring *tr = &dbc->dbc_oring;
+    struct xhci_trb_ring *ir = &dbc->dbc_iring;
     struct xhci_trb *event = &er->trb[er->deq];
     uint64_t erdp = readq(&reg->erdp);
     uint32_t portsc;
@@ -600,6 +665,14 @@ static void dbc_pop_events(struct dbc *dbc)
                 trb_idx = (event_ptr - tr->dma) >> XHCI_TRB_SHIFT;
                 tr->deq = (trb_idx + 1) & (DBC_TRB_RING_CAP - 1);
             }
+            else if ( event_ptr - ir->dma < DBC_TRB_RING_BYTES )
+            {
+                trb_idx = (event_ptr - ir->dma) >> XHCI_TRB_SHIFT;
+                if ( xhci_trb_tfre_cc(event) == XHCI_TRB_CC_SUCCESS ||
+                     xhci_trb_tfre_cc(event) == XHCI_TRB_CC_SHORT_PACKET )
+                    dbc_rx_trb(dbc, &ir->trb[trb_idx], xhci_trb_tfre_len(event));
+                ir->deq = (trb_idx + 1) & (DBC_TRB_RING_CAP - 1);
+            }
             else
                 dbc_alert("event: TRB 0x%lx not found in any ring\n",
                           event_ptr);
@@ -870,6 +943,7 @@ static bool __init dbc_open(struct dbc *dbc)
         return false;
 
     dbc_init_work_ring(dbc, &dbc->dbc_owork);
+    dbc_init_work_ring(dbc, &dbc->dbc_iwork);
     dbc_enable_dbc(dbc);
     dbc->open = true;
 
@@ -946,6 +1020,33 @@ static void dbc_flush(struct dbc *dbc, struct xhci_trb_ring *trb,
 }
 
 /**
+ * Ensure DbC has a pending transfer TRB to receive data into.
+ *
+ * @param dbc the dbc to flush
+ * @param trb the ring for the TRBs to transfer
+ * @param wrk the work ring to receive data into
+ */
+static void dbc_enqueue_in(struct dbc *dbc, struct xhci_trb_ring *trb,
+                           struct dbc_work_ring *wrk)
+{
+    struct dbc_reg *reg = dbc->dbc_reg;
+    uint32_t db = (readl(&reg->db) & 0xFFFF00FF) | (trb->db << 8);
+
+    /* Check if there is already queued TRB */
+    if ( xhci_trb_ring_size(trb) >= 1 )
+        return;
+
+    if ( dbc_work_ring_full(wrk) )
+        return;
+
+    dbc_push_trb(dbc, trb, wrk->dma + wrk->enq,
+                 dbc_work_ring_space_to_end(wrk));
+
+    wmb();
+    writel(db, &reg->db);
+}
+
+/**
  * Queue a single character to the DbC. A transfer TRB will be created
  * if the character is a newline and the DbC will be notified that data is
  * available for writing to the debug host.
@@ -968,6 +1069,19 @@ static int64_t dbc_putc(struct dbc *dbc, char c)
     return 1;
 }
 
+static int dbc_getc(struct dbc *dbc, char *c)
+{
+    struct dbc_work_ring *wrk = &dbc->dbc_iwork;
+
+    if ( dbc_work_ring_size(wrk) == 0 )
+        return 0;
+
+    *c = wrk->buf[wrk->deq];
+    wrk->deq = (wrk->deq + 1) & (DBC_WORK_RING_CAP - 1);
+
+    return 1;
+}
+
 struct dbc_uart {
     struct dbc dbc;
     struct timer timer;
@@ -986,10 +1100,16 @@ static void cf_check dbc_uart_poll(void *data)
     if ( spin_trylock_irqsave(&port->tx_lock, flags) )
     {
         if ( dbc_ensure_running(dbc) )
+        {
             dbc_flush(dbc, &dbc->dbc_oring, &dbc->dbc_owork);
+            dbc_enqueue_in(dbc, &dbc->dbc_iring, &dbc->dbc_iwork);
+        }
         spin_unlock_irqrestore(&port->tx_lock, flags);
     }
 
+    while ( dbc_work_ring_size(&dbc->dbc_iwork) )
+        serial_rx_interrupt(port, guest_cpu_user_regs());
+
     serial_tx_interrupt(port, guest_cpu_user_regs());
     set_timer(&uart->timer, NOW() + MICROSECS(DBC_POLL_INTERVAL));
 }
@@ -1028,6 +1148,12 @@ static void cf_check dbc_uart_putc(struct serial_port *port, char c)
     dbc_putc(&uart->dbc, c);
 }
 
+static int cf_check dbc_uart_getc(struct serial_port *port, char *c)
+{
+    struct dbc_uart *uart = port->uart;
+    return dbc_getc(&uart->dbc, c);
+}
+
 static void cf_check dbc_uart_flush(struct serial_port *port)
 {
     s_time_t goal;
@@ -1047,6 +1173,7 @@ static struct uart_driver dbc_uart_driver = {
     .init_postirq = dbc_uart_init_postirq,
     .tx_ready = dbc_uart_tx_ready,
     .putc = dbc_uart_putc,
+    .getc = dbc_uart_getc,
     .flush = dbc_uart_flush,
 };
 
@@ -1056,6 +1183,7 @@ struct dbc_dma_bufs {
     struct xhci_trb out_trb[DBC_TRB_RING_CAP];
     struct xhci_trb in_trb[DBC_TRB_RING_CAP];
     uint8_t out_wrk_buf[DBC_WORK_RING_CAP];
+    uint8_t in_wrk_buf[DBC_WORK_RING_CAP];
     struct xhci_erst_segment erst __aligned(16);
     struct xhci_dbc_ctx ctx __aligned(16);
     struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
@@ -1108,6 +1236,7 @@ void __init xhci_dbc_uart_init(void)
     dbc->dbc_oring.trb = dbc_dma_bufs.out_trb;
     dbc->dbc_iring.trb = dbc_dma_bufs.in_trb;
     dbc->dbc_owork.buf = dbc_dma_bufs.out_wrk_buf;
+    dbc->dbc_iwork.buf = dbc_dma_bufs.in_wrk_buf;
     dbc->dbc_str = dbc_dma_bufs.str_buf;
 
     if ( dbc_open(dbc) )
-- 
git-series 0.9.1

