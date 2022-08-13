Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E51591834
	for <lists+xen-devel@lfdr.de>; Sat, 13 Aug 2022 03:40:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386029.621981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7k-0004Bg-FE; Sat, 13 Aug 2022 01:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386029.621981; Sat, 13 Aug 2022 01:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMg7j-00042r-L3; Sat, 13 Aug 2022 01:39:35 +0000
Received: by outflank-mailman (input) for mailman id 386029;
 Sat, 13 Aug 2022 01:39:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRGa=YR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oMg7g-0000pT-O0
 for xen-devel@lists.xenproject.org; Sat, 13 Aug 2022 01:39:32 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6b560ef-1aa8-11ed-bd2e-47488cf2e6aa;
 Sat, 13 Aug 2022 03:39:31 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B62045C00CF;
 Fri, 12 Aug 2022 21:39:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 12 Aug 2022 21:39:30 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 21:39:29 -0400 (EDT)
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
X-Inumbo-ID: c6b560ef-1aa8-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660354770; x=1660441170; bh=Ui1UJHKnmz
	yWrio/Plp3FGPJhGo4rgTlRs2+6DZ8wyQ=; b=jCQLdsYPlqiZbc/A/MZ9v1dbri
	uylwL+BoZU0BcCI3fU9XaIwILpE/fP2bzuNrfHdP91lL1j9g6YLXrWRXYdCo/5/F
	wrmlPL+QAD8rXMyzw2r/GVvgPGYMVPUghB49gS8zDV1z/TJWZIFIZ6wa/4Svc9qd
	0/IXXHbHGcYrBNzZ8mZrkO1AFCQYsTnKhBmbZNCmbyCZY97NN8UFRWDAKzpKAH8W
	WWU3R85VVgIfhhgZ66IfM+e5otgU/3YLC5NcuUEHwcPGxjr6Ubchb1/Cfw5SHXXO
	dsSF3VTMhRimAdtsprvM3Ry0WceSlkvwBiHb2QTw61zEC4qKWt+E0QWZaUsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660354770; x=
	1660441170; bh=Ui1UJHKnmzyWrio/Plp3FGPJhGo4rgTlRs2+6DZ8wyQ=; b=r
	YYruNXh+SUDhdNXvX86pY5UNEIEx81hM32JyTdcg8YDZyrdh9ktjgWVOW0oCrbqI
	GpEcN0oAsB3SMxRnjq9Men86DWK+N0YtdpIc7FijORziZW6PmTnJtSxp1UsRSXIS
	lKta2KqJZ/549pEYkV6QB9cNPEgtuYXKi3qQPFSVWdZfwoBg4JNDymRUJCVogiRd
	DDXgFkK4X8ZLzT9HsNuz3lWtins98wQlMbKqdjvMSjSmwZdjRZSJQGkPXQjUMQfw
	CUOmjUQGAhArtZJg5S0kEnSl00lLt0ELEuZ0EM8Ay5y3MoglOiANZLLmVawLhBrm
	y/AkG9qJfFD6UVxPHpHhg==
X-ME-Sender: <xms:0gD3Ys9CYGBgwCfbOne7kHlrhwCACMOZxTUL73kR55Lg-uVUlWty4A>
    <xme:0gD3YkuIzOVtuCbplUSSVfrMFfeR072Mm8gY1joJQ7OELxzH5zNQ-lfedZHzr1d6p
    FbT0B7WXgtyCg>
X-ME-Received: <xmr:0gD3YiDCDUEj7V1uFRdxXwbD1G-xY35YYeTTLWzPFoiSPZJDjXCd4eG1kirdilbPlLyQTFq9HtQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegjedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:0gD3YsfTpwk7kgGkP4Cg0_PeKCY6uftpQCMf1ptJ3YZ1fHyDE3oeVA>
    <xmx:0gD3YhO6ce5gdcY7Kyo3FLLsx3juZApKogaAEfoBgxTt0hjDph5eDA>
    <xmx:0gD3YmnoAzj1-tReEyvfSp6VX_xKznQtoGilmyWRYt1DvKLYFxPNjA>
    <xmx:0gD3Yk2qUAqvr4stJzOvbh__M4YyOy6Ca1FkagAJmnFVJwsyFCXUug>
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
Subject: [PATCH v4 11/11] drivers/char: allow driving the rest of XHCI by a domain while Xen uses DbC
Date: Sat, 13 Aug 2022 03:39:01 +0200
Message-Id: <403daba6911a3d40e4774b46ba555f6d76b3c249.1660354597.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
References: <cover.05bda81c2f5ff91948f96e397b6836bcede71ef8.1660354597.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

That's possible, because the capability was designed specifically to
allow separate driver handle it, in parallel to unmodified xhci driver
(separate set of registers, pretending the port is "disconnected" for
the main xhci driver etc). It works with Linux dom0, although requires
an awful hack - re-enabling bus mastering behind dom0's backs.
Linux driver does similar thing - see
drivers/usb/early/xhci-dbc.c:xdbc_handle_events().

When controller sharing is enabled in kconfig (option marked as
experimental), dom0 is allowed to use the controller even if Xen uses it
for debug console. Additionally, option `dbgp=xhci,share=` is available
to either prevent even dom0 from using it (`no` value), or allow any
domain using it (`any` value).

In any case, to avoid Linux messing with the DbC, mark this MMIO area as
read-only. This might cause issues for Linux's driver (if it tries to
write something on the same page - like anoter xcap), but makes Xen's
use safe. In practice, as of Linux 5.18, it seems to work without
issues.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v4:
- minor fix for cmdline parsing
- make sharing opt-in build time, with option marked as EXPERIMENTAL
- change cmdline syntax to share=<bool>|hwdom
- make share=hwdom default (if enabled build-time)
Changes in v3:
- adjust for xhci-dbc rename
- adjust for dbc_ensure_running() split
- wrap long lines
- add runtime option for sharing USB controller
---
 docs/misc/xen-command-line.pandoc |  15 ++-
 xen/drivers/char/Kconfig          |  11 +++-
 xen/drivers/char/xhci-dbc.c       | 133 +++++++++++++++++++++++++++++--
 3 files changed, 150 insertions(+), 9 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 64441a2679b8..c618f93a8fd5 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -724,7 +724,7 @@ Available alternatives, with their meaning, are:
 
 ### dbgp
 > `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
-> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ]`
+> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ][,share=<bool>|hwdom]`
 
 Specify the USB controller to use, either by instance number (when going
 over the PCI busses sequentially) or by PCI device (must be on segment 0).
@@ -732,6 +732,19 @@ over the PCI busses sequentially) or by PCI device (must be on segment 0).
 Use `ehci` for EHCI debug port, use `xhci` for XHCI debug capability.
 XHCI driver will wait indefinitely for the debug host to connect - make
 sure the cable is connected.
+The `share` option for xhci controls who else can use the controller:
+* `no`: use the controller exclusively for console, even hardware domain
+  (dom0) cannot use it
+* `hwdom`: hardware domain may use the controller too, ports not used for debug
+  console will be available for normal devices; this is the default
+* `yes`: the controller can be assigned to any domain; it is not safe to assign
+  the controller to untrusted domain
+
+Choosing `share=hwdom` (the default) or `share=no` allows a domain to reset the
+controller, which may cause small portion of the console output to be lost.
+The `share` option is available only if CONFIG_XHCI_SHARE is enabled.
+
+The `share=yes` configuration is not security supported.
 
 ### debug_stack_lines
 > `= <integer>`
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index 7b5ff0c414ec..a04c28fbff78 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -104,3 +104,14 @@ config XHCI
 	  Enabling this option makes Xen use extra ~230KiB memory, even if XHCI UART
 	  is not selected.
 	  If you have an x86 based system with USB3, say Y.
+
+config XHCI_SHARE
+	bool "Allow sharing XHCI when DbC UART is active (EXPERIMENTAL)"
+	depends on XHCI && UNSUPPORTED
+	help
+	  This enables sharing XHCI with another domain (hardware domain, or another
+	  domU) while Xen uses XHCI DbC as a console. When this option is
+	  enabled, domain can perform controller reset, which may cause small portion
+	  of console output to be lost.
+
+	  Sharing XHCI with non-dom0 is not security supported.
diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index a94a48a48989..0ac418280d19 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -23,6 +23,7 @@
 #include <xen/iommu.h>
 #include <xen/mm.h>
 #include <xen/param.h>
+#include <xen/rangeset.h>
 #include <xen/serial.h>
 #include <xen/timer.h>
 #include <xen/types.h>
@@ -232,6 +233,14 @@ struct dbc_work_ring {
     uint64_t dma;
 };
 
+enum xhci_share {
+    XHCI_SHARE_NONE = 0,
+#ifdef CONFIG_XHCI_SHARE
+    XHCI_SHARE_HWDOM,
+    XHCI_SHARE_ANY
+#endif
+};
+
 struct dbc {
     struct dbc_reg __iomem *dbc_reg;
     struct xhci_dbc_ctx *dbc_ctx;
@@ -249,6 +258,7 @@ struct dbc {
     void __iomem *xhc_mmio;
 
     bool open;
+    enum xhci_share share;
     unsigned int xhc_num; /* look for n-th xhc */
 };
 
@@ -951,13 +961,56 @@ static bool __init dbc_open(struct dbc *dbc)
 }
 
 /*
- * Ensure DbC is still running, handle events, and possibly re-enable if cable
- * was re-plugged. Returns true if DbC is operational.
+ * Ensure DbC is still running, handle events, and possibly
+ * re-enable/re-configure if cable was re-plugged or controller was reset.
+ * Returns true if DbC is operational.
  */
 static bool dbc_ensure_running(struct dbc *dbc)
 {
     struct dbc_reg *reg = dbc->dbc_reg;
     uint32_t ctrl;
+    uint16_t cmd;
+
+    if ( dbc->share != XHCI_SHARE_NONE )
+    {
+        /*
+         * Re-enable memory decoding and later bus mastering, if dom0 (or
+         * other) disabled it in the meantime.
+         */
+        cmd = pci_conf_read16(dbc->sbdf, PCI_COMMAND);
+        if ( !(cmd & PCI_COMMAND_MEMORY) )
+        {
+            cmd |= PCI_COMMAND_MEMORY;
+            pci_conf_write16(dbc->sbdf, PCI_COMMAND, cmd);
+        }
+
+        /*
+         * FIXME: Make Linux coordinate XHCI reset, so the DbC driver can
+         * prepare for it properly, instead of only detecting it after the
+         * fact. See EHCI driver for similar handling.
+         */
+        if ( dbc->open && !(readl(&reg->ctrl) & (1U << DBC_CTRL_DCE)) )
+        {
+            if ( !dbc_init_dbc(dbc) )
+                return false;
+
+            dbc_init_work_ring(dbc, &dbc->dbc_owork);
+            dbc_enable_dbc(dbc);
+        }
+        else
+        {
+            /*
+             * dbc_init_dbc() takes care about it, so check only if it wasn't
+             * called.
+             */
+            cmd = pci_conf_read16(dbc->sbdf, PCI_COMMAND);
+            if ( !(cmd & PCI_COMMAND_MASTER) )
+            {
+                cmd |= PCI_COMMAND_MASTER;
+                pci_conf_write16(dbc->sbdf, PCI_COMMAND, cmd);
+            }
+        }
+    }
 
     dbc_pop_events(dbc);
 
@@ -1128,10 +1181,34 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
     init_timer(&uart->timer, dbc_uart_poll, port, 0);
     set_timer(&uart->timer, NOW() + MILLISECS(1));
 
-    if ( pci_ro_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
-        printk(XENLOG_WARNING
-               "Failed to mark read-only %pp used for XHCI console\n",
-               &uart->dbc.sbdf);
+    switch ( uart->dbc.share )
+    {
+    case XHCI_SHARE_NONE:
+        if ( pci_ro_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
+            printk(XENLOG_WARNING
+                   "Failed to mark read-only %pp used for XHCI console\n",
+                   &uart->dbc.sbdf);
+        break;
+#ifdef CONFIG_XHCI_SHARE
+    case XHCI_SHARE_HWDOM:
+        if ( pci_hide_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
+            printk(XENLOG_WARNING
+                   "Failed to hide %pp used for XHCI console\n",
+                   &uart->dbc.sbdf);
+        break;
+    case XHCI_SHARE_ANY:
+        /* Do not hide. */
+        break;
+#endif
+    }
+#ifdef CONFIG_X86
+    if ( rangeset_add_range(mmio_ro_ranges,
+                PFN_DOWN(uart->dbc.xhc_mmio_phys + uart->dbc.xhc_dbc_offset),
+                PFN_UP(uart->dbc.xhc_mmio_phys + uart->dbc.xhc_dbc_offset +
+                       sizeof(*uart->dbc.dbc_reg)) - 1) )
+        printk(XENLOG_INFO
+               "Error while adding MMIO range of device to mmio_ro_ranges\n");
+#endif
 }
 
 static int cf_check dbc_uart_tx_ready(struct serial_port *port)
@@ -1202,13 +1279,18 @@ void __init xhci_dbc_uart_init(void)
 {
     struct dbc_uart *uart = &dbc_uart;
     struct dbc *dbc = &uart->dbc;
-    const char *e;
+    const char *e, *opt;
 
     if ( strncmp(opt_dbgp, "xhci", 4) )
         return;
 
     memset(dbc, 0, sizeof(*dbc));
 
+#ifdef CONFIG_XHCI_SHARE
+    dbc->share = XHCI_SHARE_HWDOM;
+#endif
+
+    e = &opt_dbgp[4];
     if ( isdigit(opt_dbgp[4]) )
     {
         dbc->xhc_num = simple_strtoul(opt_dbgp + 4, &e, 10);
@@ -1218,7 +1300,7 @@ void __init xhci_dbc_uart_init(void)
         unsigned int bus, slot, func;
 
         e = parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
-        if ( !e || *e )
+        if ( !e || (*e && *e != ',') )
         {
             printk(XENLOG_ERR
                    "Invalid dbgp= PCI device spec: '%s'\n",
@@ -1228,6 +1310,41 @@ void __init xhci_dbc_uart_init(void)
 
         dbc->sbdf = PCI_SBDF(0, bus, slot, func);
     }
+    opt = e;
+
+#ifdef CONFIG_XHCI_SHARE
+    /* other options */
+    while ( *opt == ',' )
+    {
+        opt++;
+        e = strchr(opt, ',');
+        if ( !e )
+            e = strchr(opt, '\0');
+
+        if ( !strncmp(opt, "share=", 6) )
+        {
+            int val = parse_bool(opt + 6, e);
+            if ( val == -1 && !cmdline_strcmp(opt + 6, "hwdom") )
+                dbc->share = XHCI_SHARE_HWDOM;
+            else if ( val == 0 )
+                dbc->share = XHCI_SHARE_NONE;
+            else if ( val == 1 )
+                dbc->share = XHCI_SHARE_ANY;
+            else
+                break;
+        }
+        else
+            break;
+
+        opt = e;
+    }
+#endif
+
+    if ( *opt )
+    {
+        printk(XENLOG_ERR "Invalid dbgp= parameters: '%s'\n", opt);
+        return;
+    }
 
     dbc->dbc_ctx = &dbc_dma_bufs.ctx;
     dbc->dbc_erst = &dbc_dma_bufs.erst;
-- 
git-series 0.9.1

