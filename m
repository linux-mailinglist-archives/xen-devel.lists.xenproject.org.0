Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8795BB5A7
	for <lists+xen-devel@lfdr.de>; Sat, 17 Sep 2022 04:52:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408209.651032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZNw1-0005nq-Bi; Sat, 17 Sep 2022 02:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408209.651032; Sat, 17 Sep 2022 02:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZNw0-0005fp-RF; Sat, 17 Sep 2022 02:52:00 +0000
Received: by outflank-mailman (input) for mailman id 408209;
 Sat, 17 Sep 2022 02:51:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=os+o=ZU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oZNvz-0002wS-3N
 for xen-devel@lists.xenproject.org; Sat, 17 Sep 2022 02:51:59 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b20af080-3633-11ed-9761-273f2230c3a0;
 Sat, 17 Sep 2022 04:51:58 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7F4B15C00AC;
 Fri, 16 Sep 2022 22:51:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 16 Sep 2022 22:51:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Sep 2022 22:51:56 -0400 (EDT)
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
X-Inumbo-ID: b20af080-3633-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1663383117; x=1663469517; bh=aUXbRcRCV6
	JyIMsNvZBMmFwwnT4bncaXUatuQgqKC8I=; b=hrwTSlAmBEurETa0SdKNsHFVhp
	YYdutLUlbvW7V6+e4i8fma2rBXItvH784MUMfvUXSY6JiXg9I+zha3ETpPFif6Q2
	YMLBepSWhPF27X73KmxU8c67OFhTDMq/WZNcnuhJMcms8L9KYdk/9TW1w75fv2hN
	L4doZd2y2+vyOj450rPeTsZBXC8RQvrR7CllwQQn/+oCODPkZWfmtnqRyFBGbRHy
	IrQzAPQwCHTP2yxyGX4crRtKTXLhijGvQuNqu8T6lHp5Pg5zfuXdc1U1MOBkMku1
	j91PbKZGX0Ir6Jt8Cx18WNRasAP6+a9rH/MZfj5SX7w7dcbspfaa7qGlMVrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663383117; x=
	1663469517; bh=aUXbRcRCV6JyIMsNvZBMmFwwnT4bncaXUatuQgqKC8I=; b=t
	QJQpEIgQXyRGELsZubrcM1kWswGGm2eh/w5hsJPnxArJ2PKKD9EVPFzQrQg57hut
	r3Xi7oxvFfN/Z273nUdrnqpi1afNwOpd9rojn9ZNMFrAqZjZ0hfTlXxdB46SBV5r
	4ouMWHBOvKA9XR6351UJZIW0u/UXQdfvi570sOqZp61A8XsQT7qCQtAK8PWvgMr9
	VVVG6J7H/NS6/mLwqqDqzsYEeE+s5CLywg+hUsynagfBrKIZCPGQomI5q2FWcZew
	sDnKgzpgAyk0+8UiX/pIAJNPoqhsPrqdQAJEPNNMlBwuFCdEoAc+4NMLhCpGBg6k
	JohlKsT1ntcJ38icPPR7w==
X-ME-Sender: <xms:TTYlY5-lYSct5melHfQEAzelbW-_KCbtbt49AqHXuPkEPdIhTtjwUg>
    <xme:TTYlY9t66lfbXxzP5xib74R0tJ9xcrFLLZ-ATbyuNyiynz-BbPU_SWAsaWpOdSQyW
    XC6rkID0_yFHA>
X-ME-Received: <xmr:TTYlY3BpezwkR4sKzxEfO3lKpE4DhD_jA4HJdOgbU-vVHXXM6K6x_3ApGJP2Euld-FJ3xsJdF-c8RNN56lPiJqD7l7Zge7tIIyV4-_3nNqZbb5_mRMWmBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvuddgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:TTYlY9fwaTkjQQMlm3525CjuZFHvu6mW97Hq9hLw4c3Hz0-YXQ8C4A>
    <xmx:TTYlY-N59FTpJ08axgFNMVFb_jvydl8TO7rJFEJI7VdBOUdcg9x2VA>
    <xmx:TTYlY_lzxIkmK3ajm_4-nj_0T1Lxk0mbsWnNN5v59jLxxbYpxFThrA>
    <xmx:TTYlY106lcGwXpSUmQOCbUFztxD745HEUGgFR40Po7yIEdK2-A2PKw>
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
Subject: [PATCH v7 10/11] drivers/char: suspend handling in XHCI console driver
Date: Sat, 17 Sep 2022 04:51:29 +0200
Message-Id: <927d01aa54cf6f5291e506179e3d15dc32ebad40.1663383053.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
References: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Similar to the EHCI driver - save/restore relevant BAR and command
register, re-configure DbC on resume and stop/start timer.
On resume trigger sending anything that was queued in the meantime.
Save full BAR value, instead of just the address part, to ease restoring
on resume.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
New in v7

Without this patch, the console is broken after S3, and in some cases
the suspend doesn't succeed at all (when xhci console is enabled).

Very similar (if not the same) functions might be used for coordinated
reset handling. I tried to include it in this patch too, but it's a bit
more involved, mostly due to share=yes case (PHYSDEVOP_dbgp_op can be
called by the hardware domain only).
---
 xen/drivers/char/xhci-dbc.c | 55 +++++++++++++++++++++++++++++++++-----
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 5f92234a9594..81a4fd5b12c3 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -251,7 +251,7 @@ struct dbc {
     struct xhci_string_descriptor *dbc_str;
 
     pci_sbdf_t sbdf;
-    uint64_t xhc_mmio_phys;
+    uint64_t bar_val;
     uint64_t xhc_dbc_offset;
     void __iomem *xhc_mmio;
 
@@ -259,6 +259,9 @@ struct dbc {
     bool open;
     enum xhci_share share;
     unsigned int xhc_num; /* look for n-th xhc */
+    /* state saved across suspend */
+    bool suspended;
+    uint16_t pci_cr;
 };
 
 static void *dbc_sys_map_xhc(uint64_t phys, size_t size)
@@ -358,8 +361,9 @@ static bool __init dbc_init_xhc(struct dbc *dbc)
 
     pci_conf_write16(dbc->sbdf, PCI_COMMAND, cmd);
 
-    dbc->xhc_mmio_phys = (bar0 & PCI_BASE_ADDRESS_MEM_MASK) | (bar1 << 32);
-    dbc->xhc_mmio = dbc_sys_map_xhc(dbc->xhc_mmio_phys, xhc_mmio_size);
+    dbc->bar_val = bar0 | (bar1 << 32);
+    dbc->xhc_mmio = dbc_sys_map_xhc(dbc->bar_val & PCI_BASE_ADDRESS_MEM_MASK,
+                                    xhc_mmio_size);
 
     if ( dbc->xhc_mmio == NULL )
         return false;
@@ -979,6 +983,9 @@ static bool dbc_ensure_running(struct dbc *dbc)
     uint32_t ctrl;
     uint16_t cmd;
 
+    if ( dbc->suspended )
+        return false;
+
     if ( dbc->share != XHCI_SHARE_NONE )
     {
         /*
@@ -1213,9 +1220,11 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
      * page, so keep it simple.
      */
     if ( rangeset_add_range(mmio_ro_ranges,
-                PFN_DOWN(uart->dbc.xhc_mmio_phys + uart->dbc.xhc_dbc_offset),
-                PFN_UP(uart->dbc.xhc_mmio_phys + uart->dbc.xhc_dbc_offset +
-                       sizeof(*uart->dbc.dbc_reg)) - 1) )
+                PFN_DOWN((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
+                         uart->dbc.xhc_dbc_offset),
+                PFN_UP((uart->dbc.bar_val & PCI_BASE_ADDRESS_MEM_MASK) +
+                       uart->dbc.xhc_dbc_offset +
+                sizeof(*uart->dbc.dbc_reg)) - 1) )
         printk(XENLOG_INFO
                "Error while adding MMIO range of device to mmio_ro_ranges\n");
 #endif
@@ -1255,6 +1264,38 @@ static void cf_check dbc_uart_flush(struct serial_port *port)
         set_timer(&uart->timer, goal);
 }
 
+static void cf_check dbc_uart_suspend(struct serial_port *port)
+{
+    struct dbc_uart *uart = port->uart;
+    struct dbc *dbc = &uart->dbc;
+
+    dbc_pop_events(dbc);
+    stop_timer(&uart->timer);
+    dbc->pci_cr = pci_conf_read16(dbc->sbdf, PCI_COMMAND);
+    dbc->suspended = true;
+}
+
+static void cf_check dbc_uart_resume(struct serial_port *port)
+{
+    struct dbc_uart *uart = port->uart;
+    struct dbc *dbc = &uart->dbc;
+
+    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_0, dbc->bar_val & 0xFFFFFFFF);
+    pci_conf_write32(dbc->sbdf, PCI_BASE_ADDRESS_1, dbc->bar_val >> 32);
+    pci_conf_write16(dbc->sbdf, PCI_COMMAND, dbc->pci_cr);
+
+    if ( !dbc_init_dbc(dbc) )
+    {
+        dbc_error("resume failed\n");
+        return;
+    }
+
+    dbc_enable_dbc(dbc);
+    dbc->suspended = false;
+    dbc_flush(dbc, &dbc->dbc_oring, &dbc->dbc_owork);
+    set_timer(&uart->timer, NOW() + MICROSECS(DBC_POLL_INTERVAL));
+}
+
 static struct uart_driver dbc_uart_driver = {
     .init_preirq = dbc_uart_init_preirq,
     .init_postirq = dbc_uart_init_postirq,
@@ -1262,6 +1303,8 @@ static struct uart_driver dbc_uart_driver = {
     .putc = dbc_uart_putc,
     .getc = dbc_uart_getc,
     .flush = dbc_uart_flush,
+    .suspend = dbc_uart_suspend,
+    .resume = dbc_uart_resume,
 };
 
 /* Those are accessed via DMA. */
-- 
git-series 0.9.1

