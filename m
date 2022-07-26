Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BB85809F0
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 05:23:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374943.607248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGBAf-00069f-DI; Tue, 26 Jul 2022 03:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374943.607248; Tue, 26 Jul 2022 03:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGBAf-00061K-37; Tue, 26 Jul 2022 03:23:45 +0000
Received: by outflank-mailman (input) for mailman id 374943;
 Tue, 26 Jul 2022 03:23:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zoO2=X7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oGBAc-0003P0-O2
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 03:23:42 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 589110a6-0c92-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 05:23:41 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B49FD5C0196;
 Mon, 25 Jul 2022 23:23:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 25 Jul 2022 23:23:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Jul 2022 23:23:39 -0400 (EDT)
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
X-Inumbo-ID: 589110a6-0c92-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1658805820; x=1658892220; bh=JtMaNlSkIU
	jNbemR38QZSlvj6PVIS1fPR5IHNRRgKE0=; b=e8/MkaZB3yB2Z08i7UAYEqex/T
	/Fhelk6WSsBSpD8S09l5kVyNZwv2yQF/AqSi3dX4RMOia41Fo5xzlw3oeJ4MHIR5
	+KW8fiPjdlM5nS/yyw4JmuJWGmowNBQPrigsDpjqwF5WyeJ87X33bahdRpfpzSdz
	zPxY0h/lqUqGwsB8MnWP0/yfkRwiy4YQX1coJe8wMNT1IvKo1SLliyxn0ZrB+vWt
	mMoQgvWFRYvmvfwUp7RyMhQpPXf1p+ykPoO8nIzxz/MdAMDKb0gixlBC6Fxg3PVG
	AV8abe7lALeRyJHPDUCUi9NThFaBpgz8LmLs/rh00asgiHJ7I4+W+hs6jWOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658805820; x=
	1658892220; bh=JtMaNlSkIUjNbemR38QZSlvj6PVIS1fPR5IHNRRgKE0=; b=n
	Zko7ir08z3laZ3+yVu1VvBprnlVVNFJf+G9hCQmML83ZZaqItoBOXQdgKra2AwJV
	nNbcrg3DFJsV6uj/GG5KvLt4zVuWwvP3I/nUwQZrl3HpkqvgwcysL7uMwdlN0Lh9
	4SFN8zJKw5mE9SshSxkomZlTiDfQ34cAMSUMRr/h3vZwemZWTosFtI06GwAIiolM
	qIipkW0hpcpPqr9/nwf/2INSuXWaEN6zAFHAjOo44BEKJki5pOPwYb2jZqDEISu5
	zyRrRITzrp8UmRChk/NzXEQjPN+UTnkB8/AdhgmjR9gbrJs503YhMREMwidBWOz1
	qXA4V7A7OUII+ppfyL5kA==
X-ME-Sender: <xms:PF7fYkO-2Ono-rPdQA9BUiy9d1o7ibJ9kzZQDjCfNzi49JtULEu6HQ>
    <xme:PF7fYq9Q8xMv8t61I7uHCtEvGXYzIzOLaf8T8OYj-C5TT_ZndPkgXwESd6gszdC_u
    SSU4M-9Em6Xgg>
X-ME-Received: <xmr:PF7fYrTsyjNMTx6dVP7sHeVteiS2pv_O-3D8YXV3V_DmWLMyl4Y3GrFxYT2Ozi_VStNLJW48nzJG4JTqy_RMOdQl1Py0M6DSG7OnfFeyBYcqOaiqocoIZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtledgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:PF7fYsvs4_Bu9zdqVX5_6LbpeNIq8q3QOZ9-k8Wx4YJMaD2yrei37Q>
    <xmx:PF7fYsf4MemOMxWNw8tMa9gBKD_PtVf_URSYJLfx6vjYpd4F_PRI_A>
    <xmx:PF7fYg1TJJoYG4rD6Ag_H3a9DMMr7CBce_15ZriYXx1Ch_pUTiZIoA>
    <xmx:PF7fYhG0BHrxObxI8G0imPv_97DnLXUoB2dTu4aIvutg-Zmce7e5Sg>
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
Subject: [PATCH v3 09/10] drivers/char: allow driving the rest of XHCI by a domain while Xen uses DbC
Date: Tue, 26 Jul 2022 05:23:14 +0200
Message-Id: <dcbe3f53bd6d88fbf2a20970d4fdfe93479a5f59.1658804819.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
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

Add an option to allow/deny other domains to use the USB controller. By
default, if XHCI console is enabled, Xen will take the whole controller
for itself, using `dbgp=xhci,share=hwdom` or `=any` allows other ports
to be used by either only dom0 or any dom0 that get this PCI device
assigned.

In any case, to avoid Linux messing with the DbC, mark this MMIO area as
read-only.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v3:
- adjust for xhci-dbc rename
- adjust for dbc_ensure_running() split
- wrap long lines
- add runtime option for sharing USB controller
---
 docs/misc/xen-command-line.pandoc |  12 ++-
 xen/drivers/char/xhci-dbc.c       | 115 ++++++++++++++++++++++++++++---
 2 files changed, 118 insertions(+), 9 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index e53efdb324b3..cc1e1989b17e 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -724,7 +724,7 @@ Available alternatives, with their meaning, are:
 
 ### dbgp
 > `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
-> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ]`
+> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ][,share=none|hwdom|any]`
 
 Specify the USB controller to use, either by instance number (when going
 over the PCI busses sequentially) or by PCI device (must be on segment 0).
@@ -732,6 +732,16 @@ over the PCI busses sequentially) or by PCI device (must be on segment 0).
 Use `ehci` for EHCI debug port, use `xhci` for XHCI debug capability (output
 only). XHCI driver will wait indefinitely for the debug host to connect - make
 sure the cable is connected.
+The `share` option for xhci controls who else can use the controller:
+* `none`: use the controller exclusively for console, even hardware domain
+  (dom0) cannot use it; this is the default
+* `hwdom`: hardware domain may use the controller too, ports not used for debug
+  console will be available for normal devices
+* `any`: the controller can be assigned to any domain; it is not safe to assign
+  the controller to untrusted domain
+
+Choosing `share=hwdom` or `share=any` allows a domain to reset the controller,
+which may cause small portion of the console output to be lost.
 
 ### debug_stack_lines
 > `= <integer>`
diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 546231a75894..805b447f2300 100644
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
@@ -228,6 +229,12 @@ struct dbc_work_ring {
     uint64_t dma;
 };
 
+enum xhci_share {
+    XHCI_SHARE_NONE = 0,
+    XHCI_SHARE_HWDOM,
+    XHCI_SHARE_ANY
+};
+
 struct dbc {
     struct dbc_reg __iomem *dbc_reg;
     struct xhci_dbc_ctx *dbc_ctx;
@@ -244,6 +251,7 @@ struct dbc {
     void __iomem *xhc_mmio;
 
     bool open;
+    enum xhci_share share;
     unsigned int xhc_num; /* look for n-th xhc */
 };
 
@@ -871,8 +879,9 @@ static bool __init dbc_open(struct dbc *dbc)
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
@@ -880,6 +889,42 @@ static bool dbc_ensure_running(struct dbc *dbc)
     uint32_t ctrl;
     uint32_t cmd;
 
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
+
     dbc_pop_events(dbc);
 
     ctrl = readl(&reg->ctrl);
@@ -1005,10 +1050,32 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
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
+    case XHCI_SHARE_HWDOM:
+        if ( pci_hide_device(0, uart->dbc.sbdf.bus, uart->dbc.sbdf.devfn) )
+            printk(XENLOG_WARNING
+                   "Failed to hide %pp used for XHCI console\n",
+                   &uart->dbc.sbdf);
+        break;
+    case XHCI_SHARE_ANY:
+        /* Do not hide. */
+        break;
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
@@ -1069,13 +1136,14 @@ void __init xhci_dbc_uart_init(void)
 {
     struct dbc_uart *uart = &dbc_uart;
     struct dbc *dbc = &uart->dbc;
-    const char *e;
+    const char *e, *opt;
 
     if ( strncmp(opt_dbgp, "xhci", 4) )
         return;
 
     memset(dbc, 0, sizeof(*dbc));
 
+    e = &opt_dbgp[4];
     if ( isdigit(opt_dbgp[4]) )
     {
         dbc->xhc_num = simple_strtoul(opt_dbgp + 4, &e, 10);
@@ -1085,7 +1153,7 @@ void __init xhci_dbc_uart_init(void)
         unsigned int bus, slot, func;
 
         e = parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
-        if ( !e || *e )
+        if ( !e || (*e && *e != ',') )
         {
             printk(XENLOG_ERR
                    "Invalid dbgp= PCI device spec: '%s'\n",
@@ -1094,6 +1162,37 @@ void __init xhci_dbc_uart_init(void)
         }
         dbc->sbdf = PCI_SBDF(0, bus, slot, func);
     }
+    opt = e;
+
+    /* other options */
+    while ( opt && *opt == ',' )
+    {
+        opt++;
+        e = strchr(opt, ',');
+        if ( !e )
+            e = strchr(opt, '\0');
+
+        if ( !strncmp(opt, "share=", 6) )
+        {
+            if ( !cmdline_strcmp(opt + 6, "none") )
+                dbc->share = XHCI_SHARE_NONE;
+            else if ( !cmdline_strcmp(opt + 6, "hwdom") )
+                dbc->share = XHCI_SHARE_HWDOM;
+            else if ( !cmdline_strcmp(opt + 6, "any") )
+                dbc->share = XHCI_SHARE_ANY;
+            else
+                break;
+        }
+        else
+            break;
+
+        opt = e;
+    }
+    if ( !opt || *opt )
+    {
+        printk(XENLOG_ERR "Invalid dbgp= parameters: '%s'\n", opt_dbgp);
+        return;
+    }
 
     dbc->dbc_ctx = &dbc_dma_bufs.ctx;
     dbc->dbc_erst = &dbc_dma_bufs.erst;
-- 
git-series 0.9.1

