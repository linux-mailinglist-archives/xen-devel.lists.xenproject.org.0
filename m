Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5558C5809F8
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 05:27:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375006.607261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGBDc-00019F-LL; Tue, 26 Jul 2022 03:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375006.607261; Tue, 26 Jul 2022 03:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGBDc-00016N-ID; Tue, 26 Jul 2022 03:26:48 +0000
Received: by outflank-mailman (input) for mailman id 375006;
 Tue, 26 Jul 2022 03:26:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zoO2=X7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oGBAf-0003P0-9s
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 03:23:45 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 597f4bba-0c92-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 05:23:43 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4E87C5C00C4;
 Mon, 25 Jul 2022 23:23:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 25 Jul 2022 23:23:42 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Jul 2022 23:23:40 -0400 (EDT)
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
X-Inumbo-ID: 597f4bba-0c92-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1658805822; x=1658892222; bh=3vE9DGYbhI
	DJep8SC3VFi3wWujuEwVBs1IYyq266dMs=; b=DNewsGpK5rLAbc6QqSmb64oajs
	YI/gPl81TyM+Psc/HlywUIII+Gj81IIHTqM9T3ejn2RGPHbb2VN8sx95AplC7ddL
	cjftQ2BuINq2hLvRJCOj/3lUArkN2yq3Zfdmh4klEAeLqqt1AdOB1ROJK+ok8p1I
	Omtp5P7XLFeqEM42a0hOkr6VGb1JeUthYjhirhfFecfcF6WTfi38jej7+lAU6XUF
	RU8liaDYrS5JlHmLXGqvt+8rNCOM4bB9qSNMxVKMsyW7obD4wNrwSAkX8ZyB4EYk
	hANv91UMpBMtK+Lp1PfSoOYK+DJ8M1XU5FB+IUn0f9r5kaGB/ooS7phv/1mQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658805822; x=
	1658892222; bh=3vE9DGYbhIDJep8SC3VFi3wWujuEwVBs1IYyq266dMs=; b=r
	uADkbeaSQDVLdT/4gy1rcV4vqbqcISvVmaOnhBuyt4cnJW6WPViTYxeEf+WsOOg/
	ZzeK/5NUiXT0Yh6mxoUS+t35Kyqc8KdL8dWMTM70BoSICdhmqj4yXbWIs6dajAwT
	8hzDcSt5WmG6Tcz+iiDDxnYB3HJMIVVsIWYjQJmBkz9LNIxisWs2Zc/1vlyKUMjm
	SV9Ow6nNbvk4FJ2hUi652OIeBVMzcT/fsf9bYMbXDskbMs9XZwpxcc8xgzSjOSsi
	I9EXlmtPV3cqNUoPDLqPqLNeQ+7Chf0SU3pqGNjLmmWxmEVBk7+slzjq/y+hrVOB
	D2aAah+1+10JcjtS0WgpA==
X-ME-Sender: <xms:Pl7fYk9J69AxrucNEpblgbbVtd7A3ByZ6IGl9h1b01VhB0-AhAJx5A>
    <xme:Pl7fYstM1bZNisyBYyMhbRU7DlJm2gfnaIjnVzeQ135vY41J2DeEwjTNfY3hd80Dg
    m7LxSerBp0KGg>
X-ME-Received: <xmr:Pl7fYqBsVEiG-6qKjGcBWUYS3jwvwUugNhtdlsiG-5IldWtrQXWaWzgut1zoMqnlNgcpmdHJpTdRrzrFtx4sMHOSeFaUzcGs0rZaA9_fPyYKYIXkH_0fAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtledgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Pl7fYkds7c17ob6kXEdLwoJfzZtsA8Uq-GcajHagU62LFnigW0Sgvg>
    <xmx:Pl7fYpOoFp0JdaJaXFsIpOXWxm5ue3Lk_FM_Ojf8sV77Jex0hKJ0RA>
    <xmx:Pl7fYul0hKBfJIlvv6PigJ3pFq0OWVwjuq1e7nNu_hokfYzXPgcNew>
    <xmx:Pl7fYs3aioOiS8sLSK4wFfBXNEKBZAoEw4u3Zz6m93ct0sQZKNAUZg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 10/10] driver/char: add RX support to the XHCI driver
Date: Tue, 26 Jul 2022 05:23:15 +0200
Message-Id: <e273efdbf75cbc37b5c35798da7fde34877ac3b8.1658804819.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
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
---
New patch in v3
---
 docs/misc/xen-command-line.pandoc |   4 +-
 xen/drivers/char/xhci-dbc.c       | 121 +++++++++++++++++++++++++++++++-
 2 files changed, 123 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index cc1e1989b17e..07174badac8f 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -729,8 +729,8 @@ Available alternatives, with their meaning, are:
 Specify the USB controller to use, either by instance number (when going
 over the PCI busses sequentially) or by PCI device (must be on segment 0).
 
-Use `ehci` for EHCI debug port, use `xhci` for XHCI debug capability (output
-only). XHCI driver will wait indefinitely for the debug host to connect - make
+Use `ehci` for EHCI debug port, use `xhci` for XHCI debug capability.
+XHCI driver will wait indefinitely for the debug host to connect - make
 sure the cable is connected.
 The `share` option for xhci controls who else can use the controller:
 * `none`: use the controller exclusively for console, even hardware domain
diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 805b447f2300..ccf4f9bbe2b7 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -109,6 +109,7 @@ enum {
 enum {
     XHCI_TRB_CC_SUCCESS = 1,
     XHCI_TRB_CC_TRB_ERR = 5,
+    XHCI_TRB_CC_SHORT_PACKET = 13,
 };
 
 /* DbC endpoint types */
@@ -243,6 +244,7 @@ struct dbc {
     struct xhci_trb_ring dbc_oring;
     struct xhci_trb_ring dbc_iring;
     struct dbc_work_ring dbc_owork;
+    struct dbc_work_ring dbc_iwork;
     struct xhci_string_descriptor *dbc_str;
 
     pci_sbdf_t sbdf;
@@ -440,6 +442,16 @@ static void xhci_trb_norm_set_ioc(struct xhci_trb *trb)
     trb->ctrl |= 0x20;
 }
 
+static uint64_t xhci_trb_norm_buf(struct xhci_trb *trb)
+{
+    return trb->params;
+}
+
+static uint32_t xhci_trb_norm_len(struct xhci_trb *trb)
+{
+    return trb->status & 0x1FFFF;
+}
+
 /**
  * Fields for Transfer Event TRBs (see section 6.4.2.1). Note that event
  * TRBs are read-only from software
@@ -454,6 +466,12 @@ static uint32_t xhci_trb_tfre_cc(const struct xhci_trb *trb)
     return trb->status >> 24;
 }
 
+/* Amount of data _not_ transferred */
+static uint32_t xhci_trb_tfre_len(const struct xhci_trb *trb)
+{
+    return trb->status & 0x1FFFF;
+}
+
 /* Fields for link TRBs (section 6.4.4.1) */
 static void xhci_trb_link_set_rsp(struct xhci_trb *trb, uint64_t rsp)
 {
@@ -495,6 +513,14 @@ static int xhci_trb_ring_full(const struct xhci_trb_ring *ring)
     return ((ring->enq + 1) & (DBC_TRB_RING_CAP - 1)) == ring->deq;
 }
 
+static int xhci_trb_ring_size(const struct xhci_trb_ring *ring)
+{
+    if ( ring->enq >= ring->deq )
+        return ring->enq - ring->deq;
+
+    return DBC_TRB_RING_CAP - ring->deq + ring->enq;
+}
+
 static int dbc_work_ring_full(const struct dbc_work_ring *ring)
 {
     return ((ring->enq + 1) & (DBC_WORK_RING_CAP - 1)) == ring->deq;
@@ -508,6 +534,14 @@ static uint64_t dbc_work_ring_size(const struct dbc_work_ring *ring)
     return DBC_WORK_RING_CAP - ring->deq + ring->enq;
 }
 
+static uint64_t dbc_work_ring_space_to_end(const struct dbc_work_ring *ring)
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
@@ -568,6 +602,31 @@ static int64_t dbc_push_work(struct dbc *dbc, struct dbc_work_ring *ring,
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
@@ -577,6 +636,7 @@ static void dbc_pop_events(struct dbc *dbc)
     struct dbc_reg *reg = dbc->dbc_reg;
     struct xhci_trb_ring *er = &dbc->dbc_ering;
     struct xhci_trb_ring *tr = &dbc->dbc_oring;
+    struct xhci_trb_ring *ir = &dbc->dbc_iring;
     struct xhci_trb *event = &er->trb[er->deq];
     uint64_t erdp = readq(&reg->erdp);
     uint32_t portsc;
@@ -602,6 +662,14 @@ static void dbc_pop_events(struct dbc *dbc)
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
@@ -872,6 +940,7 @@ static bool __init dbc_open(struct dbc *dbc)
         return false;
 
     dbc_init_work_ring(dbc, &dbc->dbc_owork);
+    dbc_init_work_ring(dbc, &dbc->dbc_iwork);
     dbc_enable_dbc(dbc);
     dbc->open = true;
 
@@ -985,6 +1054,33 @@ static void dbc_flush(struct dbc *dbc, struct xhci_trb_ring *trb,
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
@@ -1007,6 +1103,19 @@ static int64_t dbc_putc(struct dbc *dbc, char c)
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
@@ -1032,6 +1141,9 @@ static void cf_check dbc_uart_poll(void *data)
         spin_unlock_irqrestore(&port->tx_lock, flags);
     }
 
+    while ( dbc_work_ring_size(&dbc->dbc_iwork) )
+        serial_rx_interrupt(port, guest_cpu_user_regs());
+
     serial_tx_interrupt(port, guest_cpu_user_regs());
     set_timer(&uart->timer, NOW() + MICROSECS(DBC_POLL_INTERVAL));
 }
@@ -1092,6 +1204,12 @@ static void cf_check dbc_uart_putc(struct serial_port *port, char c)
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
@@ -1111,6 +1229,7 @@ static struct uart_driver dbc_uart_driver = {
     .init_postirq = dbc_uart_init_postirq,
     .tx_ready = dbc_uart_tx_ready,
     .putc = dbc_uart_putc,
+    .getc = dbc_uart_getc,
     .flush = dbc_uart_flush,
 };
 
@@ -1119,6 +1238,7 @@ struct dbc_dma_bufs {
     struct xhci_trb out_trb[DBC_TRB_RING_CAP];
     struct xhci_trb in_trb[DBC_TRB_RING_CAP];
     uint8_t out_wrk_buf[DBC_WORK_RING_CAP] __aligned(DBC_PAGE_SIZE);
+    uint8_t in_wrk_buf[DBC_WORK_RING_CAP] __aligned(DBC_PAGE_SIZE);
     struct xhci_erst_segment erst __aligned(16);
     struct xhci_dbc_ctx ctx __aligned(16);
     struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
@@ -1200,6 +1320,7 @@ void __init xhci_dbc_uart_init(void)
     dbc->dbc_oring.trb = dbc_dma_bufs.out_trb;
     dbc->dbc_iring.trb = dbc_dma_bufs.in_trb;
     dbc->dbc_owork.buf = dbc_dma_bufs.out_wrk_buf;
+    dbc->dbc_iwork.buf = dbc_dma_bufs.in_wrk_buf;
     dbc->dbc_str = dbc_dma_bufs.str_buf;
 
     if ( dbc_open(dbc) )
-- 
git-series 0.9.1

