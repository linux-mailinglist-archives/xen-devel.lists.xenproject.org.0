Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A293AC3522
	for <lists+xen-devel@lfdr.de>; Sun, 25 May 2025 16:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997153.1378132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJCD3-0005z2-1F; Sun, 25 May 2025 14:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997153.1378132; Sun, 25 May 2025 14:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJCD2-0005wf-UF; Sun, 25 May 2025 14:20:16 +0000
Received: by outflank-mailman (input) for mailman id 997153;
 Sun, 25 May 2025 14:20:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gIk=YJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uJCD0-0005ip-Oc
 for xen-devel@lists.xenproject.org; Sun, 25 May 2025 14:20:14 +0000
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f64952b-3973-11f0-a2fb-13f23c93f187;
 Sun, 25 May 2025 16:20:14 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 9600A25400D1;
 Sun, 25 May 2025 10:20:12 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Sun, 25 May 2025 10:20:13 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 May 2025 10:20:10 -0400 (EDT)
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
X-Inumbo-ID: 5f64952b-3973-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1748182812; x=1748269212; bh=8CMSnPMAp3
	syd0lBA/8zYatGO1sF4jnrTcxo0LaBsrA=; b=b4lucCwqi3SvL0HUvsVIP8vjlH
	+EYrfwvSMGJXO9DviZVhTXkh01oJ4CFToSRW0pGVXk6CMvGZUjEf9J8v01EuKbib
	DRi4E41mQ95IAV9Bh2D7Lo2D9kClBnbPmRK0qAGDZ59URFFQVcB6qfvFp8CVQEud
	mVYYO0uCJpPPzaQR1W7TrkAEUjANU2NZ6KHGG/l/BQF+GOg+PkFxtDlDqtoUtbgp
	5J3jMWYrYrkxrtuCjSqqG5hRRhhPvzHfruM/wUHZi7n08+Wf8+XM6pSrMqSVO4BE
	wp9Nlb1cOmG2kaVj51xyrwMB1glCrpsY067wPMGBw9PbFzXS9Qp/NR5neRSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748182812; x=
	1748269212; bh=8CMSnPMAp3syd0lBA/8zYatGO1sF4jnrTcxo0LaBsrA=; b=C
	po66eGfPKySe+NvrvRO3Nv/TA4Dtu/A3MGL9EGl73luPSliCSU/CiRkveEJLBIqB
	3O6B4y/VRDLxK4yvoZYD+PMlYoqyUHn6DQk//TnD6DCnWv8ZvoXIb9H9LdCIIaMj
	gJcrhPbQG874uuDc+CWi6LUmrd9SPEpuFuwogwL2KJVqqXfXVEslyUzr4uHwUacO
	r95B7rvVcE+pjhlD0v6rufnUrQXwUfzezPyK4vb11Oa7aHxJhRqdlLmjfxiDAPF0
	te3zmUbU5nRV2dr9L/JQCLfvkD7TbMT+pU+tL9x6V5Mg5IJf5uhFEguOKDA85ptE
	n5sFmuR9cE+3t/4xViYkg==
X-ME-Sender: <xms:HCczaC5CTtLdmhQ9IJBCjIEJb9rY5uAyEojveVUvPq98UVC-wXD2ng>
    <xme:HCczaL6dJQkhqvEg2vc6x9PRxOMdw7w3NfwTbLV2-Yu2rNLgCE6g1Qqzjag7WfDYu
    th-UJexXHwm_A>
X-ME-Received: <xmr:HCczaBc2RdefAb0M9R5t50dqK-ghltGt85NCSBOxuo55aW-GRBECEwEwClCfrpiJncNaKTE9elw4LMZU-P7cCjap3XIbX3k694YkVthZQaTc9GtYGiN6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddugeekfeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffo
    jghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofi
    hskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhn
    ghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeuudehgfdvfeehhedujeehfe
    duveeugefhkefhheelgeevudetueeiudfggfffnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvth
    hhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtg
    htrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhn
    ghhslhgrsgdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghith
    hrihigrdgtohhmpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghs
    rdhtvggthhdprhgtphhtthhopehmihgthhgrlhdrohhriigvlhesrghmugdrtghomhdprh
    gtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepjhhulhhi
    vghnseigvghnrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrd
    gtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:HCczaPIdKOs79roOkTwfjhHtXf2H5DG3pIDTJEBQT_GbGGlWSJzScw>
    <xmx:HCczaGLwV94jQkViYIVLxW4hF50otVI-OIXG5oMbt0q-DxUVF_cg3Q>
    <xmx:HCczaAwCqMQkM2oEiVPt78MWdppa-ZKEkw7jeDGkqTEVvFz9jsdpBg>
    <xmx:HCczaKI4DWvzy5g7zc_zPfovkYFQgsroWv2Ax0G5xlaoW-EX2lLu-A>
    <xmx:HCczaOF-GSvVXxaNQ8xJ0IZ0MxCS5lecOUBGBAp4m4gP3TsssxZ7odNJ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 2/5] drivers/char: Handle Xen relocation in the XHCI console driver
Date: Sun, 25 May 2025 16:15:43 +0200
Message-ID: <e26081c1c84e207e4995a3a15274a8ab28786637.1748182535.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
References: <cover.defc562b917978814c8359bbd04f1dadba33fb77.1748182535.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The XHCI uses DMA for a bunch of configuration structures and also for
transfer rings. Since those buffers live in .bss it's sensitive for Xen
relocation. Use the newly added hooks to handle this case:

In pre-relocation hook wait for all the data already sent to be handled
and pause sending any more.

In the post-relocation hook detect if relocation happened (check if
physical address of one of the structures matches what was programmed
into hardware) and if so - re-initialize all structures carying
physical addresses and program XHCI with new addresses. And then resume
console - this needs to happen in no-relocation case too, to undo
pausing done in pre-relocation.

Move the iommu_add_extra_reserved_device_memory() call post relocation,
as it needs physical addresses. It needs to happen before setting up
IOMMU (specifically before the acpi_iommu_init() call) but that's the
only ordering constraint - moving it is simpler than doing it initially
with pre-relocation addresses and then un-doing during relocation. This
is also the place where calling post-relocation hook unconditionally
(even if relocation didn't actually happened) is helpful - otherwise the
iommu_add_extra_reserved_device_memory() call would need to be done
conditionally in two places.

Finally, move dbc_dma_bufs declaration near top of the file, as it's
used earlier now.

Unfortunately, changes to several registers require flipping DCE (Debug
Capability Enable) to 0 and then back to 1 which results in the device
disconnect for a short time. Linux's xhci_dbc driver appears to do some
synchronization (or buffering?) so if one re-connects to the /dev/USB0
fast enough (for example by running minicom/picocom/etc in a loop), no
messages are lost. But technically there is no guarantee of that...

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
I tried to avoid flipping DCE, but it seems to be a limitation actually
enforced by the hardware. The XHCI spec says "just" this about a bunch
of registers:

    Software shall initialize this register before setting the Debug
    Capability Enable bit in the Debug Capability Control Register to ‘1’.

As for the implicit console flush in pre-relocation hook, technically it
could be avoided in the no-relocation case, but that would complicate
code structure (see note about reserved device memory). For the
relocation case, avoiding it might be possible, if the driver could
access old pages somehow (as without the flush the device might have
modified them in the meantime), but again - IMO it's not worth it.
Alternative would be flipping DCE also in the no-relocation case, which
is IMO worse than just the flush.
---
 xen/drivers/char/xhci-dbc.c | 89 +++++++++++++++++++++++++++-----------
 1 file changed, 64 insertions(+), 25 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index c45e4b6825cc..c4bb371ff78f 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -264,6 +264,24 @@ struct dbc {
     uint16_t pci_cr;
 };
 
+/* Those are accessed via DMA. */
+struct dbc_dma_bufs {
+    struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
+    struct xhci_trb out_trb[DBC_TRB_RING_CAP];
+    struct xhci_trb in_trb[DBC_TRB_RING_CAP];
+    uint8_t out_wrk_buf[DBC_WORK_RING_CAP];
+    uint8_t in_wrk_buf[DBC_WORK_RING_CAP];
+    struct xhci_erst_segment erst __aligned(16);
+    struct xhci_dbc_ctx ctx __aligned(16);
+    struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
+    /*
+     * Don't place anything else on this page - it will be
+     * DMA-reachable by the USB controller.
+     */
+};
+static struct dbc_dma_bufs __section(".bss.page_aligned") __aligned(PAGE_SIZE)
+    dbc_dma_bufs;
+
 static void *dbc_sys_map_xhc(uint64_t phys, size_t size)
 {
     size_t i;
@@ -1189,6 +1207,50 @@ static void __init cf_check dbc_uart_init_preirq(struct serial_port *port)
     uart->lock = &port->tx_lock;
 }
 
+static void __init cf_check dbc_uart_init_pre_relocate(struct serial_port *port)
+{
+    struct dbc_uart *uart = port->uart;
+    struct dbc *dbc = &uart->dbc;
+
+    /* Wait for all the data already sent to be handled. */
+    while ( xhci_trb_ring_size(&dbc->dbc_oring) )
+        dbc_pop_events(dbc);
+    /* Do not send any more data until after relocation. */
+    dbc->suspended = true;
+}
+
+static void __init cf_check dbc_uart_init_post_relocate(struct serial_port *port)
+{
+    struct dbc_uart *uart = port->uart;
+    struct dbc *dbc = &uart->dbc;
+
+    if ( readq(&dbc->dbc_reg->erstba) != virt_to_maddr(dbc->dbc_erst) )
+    {
+        /*
+         * Do not use dbc_init_work_ring() to not discard queued data, just
+         * update the DMA address.
+         */
+        dbc->dbc_owork.dma = virt_to_maddr(dbc->dbc_owork.buf);
+        dbc->dbc_iwork.dma = virt_to_maddr(dbc->dbc_iwork.buf);
+
+        if ( !dbc_init_dbc(dbc) )
+        {
+            dbc_error("relocate failed\n");
+            return;
+        }
+
+        dbc_enable_dbc(dbc);
+    }
+
+    dbc->suspended = false;
+
+    iommu_add_extra_reserved_device_memory(
+            PFN_DOWN(virt_to_maddr(&dbc_dma_bufs)),
+            PFN_UP(sizeof(dbc_dma_bufs)),
+            uart->dbc.sbdf,
+            "XHCI console");
+}
+
 static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
 {
     struct dbc_uart *uart = port->uart;
@@ -1310,6 +1372,8 @@ static void cf_check dbc_uart_resume(struct serial_port *port)
 static struct uart_driver dbc_uart_driver = {
     .init_preirq = dbc_uart_init_preirq,
     .init_postirq = dbc_uart_init_postirq,
+    .init_pre_relocate = dbc_uart_init_pre_relocate,
+    .init_post_relocate = dbc_uart_init_post_relocate,
     .tx_ready = dbc_uart_tx_ready,
     .putc = dbc_uart_putc,
     .getc = dbc_uart_getc,
@@ -1318,24 +1382,6 @@ static struct uart_driver dbc_uart_driver = {
     .resume = dbc_uart_resume,
 };
 
-/* Those are accessed via DMA. */
-struct dbc_dma_bufs {
-    struct xhci_trb evt_trb[DBC_TRB_RING_CAP];
-    struct xhci_trb out_trb[DBC_TRB_RING_CAP];
-    struct xhci_trb in_trb[DBC_TRB_RING_CAP];
-    uint8_t out_wrk_buf[DBC_WORK_RING_CAP];
-    uint8_t in_wrk_buf[DBC_WORK_RING_CAP];
-    struct xhci_erst_segment erst __aligned(16);
-    struct xhci_dbc_ctx ctx __aligned(16);
-    struct xhci_string_descriptor str_buf[DBC_STRINGS_COUNT];
-    /*
-     * Don't place anything else on this page - it will be
-     * DMA-reachable by the USB controller.
-     */
-};
-static struct dbc_dma_bufs __section(".bss.page_aligned") __aligned(PAGE_SIZE)
-    dbc_dma_bufs;
-
 static int __init cf_check xhci_parse_dbgp(const char *opt_dbgp)
 {
     struct dbc_uart *uart = &dbc_uart;
@@ -1425,14 +1471,7 @@ void __init xhci_dbc_uart_init(void)
     dbc->dbc_str = dbc_dma_bufs.str_buf;
 
     if ( dbc_open(dbc) )
-    {
-        iommu_add_extra_reserved_device_memory(
-                PFN_DOWN(virt_to_maddr(&dbc_dma_bufs)),
-                PFN_UP(sizeof(dbc_dma_bufs)),
-                uart->dbc.sbdf,
-                "XHCI console");
         serial_register_uart(SERHND_XHCI, &dbc_uart_driver, &dbc_uart);
-    }
 }
 
 #ifdef DBC_DEBUG
-- 
git-series 0.9.1

