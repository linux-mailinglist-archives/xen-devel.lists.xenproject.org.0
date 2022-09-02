Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19EA5AB147
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 15:18:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397609.638312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6Ya-0002L6-6m; Fri, 02 Sep 2022 13:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397609.638312; Fri, 02 Sep 2022 13:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6YZ-0002F9-VK; Fri, 02 Sep 2022 13:17:59 +0000
Received: by outflank-mailman (input) for mailman id 397609;
 Fri, 02 Sep 2022 13:17:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uHR5=ZF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oU6YX-0008Qk-QA
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 13:17:58 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a86032ab-2ac1-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 15:17:56 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C60EE5C0140;
 Fri,  2 Sep 2022 09:17:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 02 Sep 2022 09:17:55 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Sep 2022 09:17:54 -0400 (EDT)
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
X-Inumbo-ID: a86032ab-2ac1-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1662124675; x=1662211075; bh=jEhXVU2OZd
	QLanPulAJL30CKYwD6QKQqOYN+3xqQRKc=; b=IU8zwdteYyi12cGIOXh2CeiX0X
	g9lRddDnSOWr1Amm1hiCOSaSfWGtEkhnkX8hktbFo1VkK0PtBMv2Rm1T/2/VMUe/
	ptuTuAotnaSz8+mkTp6vhlNGBGXnRH/TGlzGTi99p0mQv90Y1j6+dcaA7YMFrOzg
	CI3RCNqgrTRMh+AFQlJYhzbYr5J9lD2cwBrSD8v0FEIh8zz2o0QpW4cuoJpRMPF8
	gd6o6P8HfEhLukWzY2Plx/SM+9aEflDyiR7Lwtk+wudb2czxfIMKPVBSyPMAfPa/
	vXdFbEL7jidha3jN7dyu1HD5XQJId2HALs9S2VzaqAoh2hfcQwjSSOT28rRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1662124675; x=
	1662211075; bh=jEhXVU2OZdQLanPulAJL30CKYwD6QKQqOYN+3xqQRKc=; b=n
	L0iHH4AVbglCweb9SqEJTZeh98XLFA2gd2RoOTxQIID8w3mlIK+V/cnrkEcTGF/G
	lO53p8AYDsadsVob6kH5Mpb3XMsca7ojOg1CZErwcVpSVtMSJz0ePFpLKqHHEysY
	4pDqCm8sD5/TKS0/X+Z2lGntUgdDdzdNesq0dROkNgkH9icwp8Pf1KYV9tp0ABwI
	RcA7pgbCcVhelYp+HczHp8OX8Jbho/gcTDzW1r9Xa1usGSZ9/eOLkCFminF3NqEX
	YgvNMomPrDSiiByEhFHo52NE6TxijARoJHNnYKCEkT4hnNPmA7ePTGH+nZhWm38y
	GdkqjjSDXG+BUboKtUxrw==
X-ME-Sender: <xms:gwISY-_sSRoJwVOwRTQPrvzewNnqTnoxa35qL7ikJZcn8qcfpsI6aA>
    <xme:gwISY-u3opLgc2EnncTfjRgZilR4w7zEEHZw8TcqeJCScnLq4EeptdWhg73MJ0Wtx
    N4FGpkioSR4qw>
X-ME-Received: <xmr:gwISY0DJie4xeH7PxFhh1zUS3wHCRrMtLyXHVHQAISwQRGcXGYVrYGlmsT_VwEBCXalU1kWbCwRL7G60HK9mCXeh9GBakuwmEDybRdFtDPwOyNpgmF7H2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeltddgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:gwISY2ecXafWKrodnZmWPz35yJDhRKsEX_zXc9p4KgnCu7ddwoVtIg>
    <xmx:gwISYzPmlxpIZcZpH8vEfZEEw23-cFeRE5sVxSwCtDTL8pgUkz_qgg>
    <xmx:gwISYwlyab2QqGsYfR3NC5GwMJ1i-x95GDiJVWtYvgkqNOTLEXHXpA>
    <xmx:gwISY-0QHtBvcnsj9MbNDe5CKEGuSk0ARuSy2K7w_Gz5GpCu8hWLqw>
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
Subject: [PATCH v6 08/10] drivers/char: allow driving the rest of XHCI by a domain while Xen uses DbC
Date: Fri,  2 Sep 2022 15:17:29 +0200
Message-Id: <5fc0395d7c67c534994f055b43cf9c2ad6ea6c67.1662124370.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
References: <cover.00134d06d2e52e209e9f7778513a27cf0b2a3bd3.1662124370.git-series.marmarek@invisiblethingslab.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
- drop CONFIG_XHCI_SHARE
- make XHCI_SHARE_HWDOM = 0
- use parse_boolean
- add comment about mmio_ro_ranges
- fix doc
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
 docs/misc/xen-command-line.pandoc |  14 ++-
 xen/drivers/char/xhci-dbc.c       | 129 +++++++++++++++++++++++++++++--
 2 files changed, 134 insertions(+), 9 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index fb4d80c590f3..1c755563c40d 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -726,7 +726,7 @@ Available alternatives, with their meaning, are:
 
 ### dbgp
 > `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
-> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ]`
+> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ][,share=<bool>|hwdom]`
 
 Specify the USB controller to use, either by instance number (when going
 over the PCI busses sequentially) or by PCI device (must be on segment 0).
@@ -734,6 +734,18 @@ over the PCI busses sequentially) or by PCI device (must be on segment 0).
 Use `ehci` for EHCI debug port, use `xhci` for XHCI debug capability.
 XHCI driver will wait indefinitely for the debug host to connect - make sure
 the cable is connected.
+The `share` option for xhci controls who else can use the controller:
+* `no`: use the controller exclusively for console, even hardware domain
+  (dom0) cannot use it
+* `hwdom`: hardware domain may use the controller too, ports not used for debug
+  console will be available for normal devices; this is the default
+* `yes`: the controller can be assigned to any domain; it is not safe to assign
+  the controller to untrusted domain
+
+Choosing `share=hwdom` (the default) or `share=yes` allows a domain to reset the
+controller, which may cause small portion of the console output to be lost.
+
+The `share=yes` configuration is not security supported.
 
 ### debug_stack_lines
 > `= <integer>`
diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index 557c5fc785ce..9f7e1dd60a78 100644
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
@@ -232,6 +233,12 @@ struct dbc_work_ring {
     uint64_t dma;
 };
 
+enum xhci_share {
+    XHCI_SHARE_HWDOM = 0,
+    XHCI_SHARE_NONE,
+    XHCI_SHARE_ANY
+};
+
 struct dbc {
     struct dbc_reg __iomem *dbc_reg;
     struct xhci_dbc_ctx *dbc_ctx;
@@ -250,6 +257,7 @@ struct dbc {
 
     bool enable; /* whether dbgp=xhci was set at all */
     bool open;
+    enum xhci_share share;
     unsigned int xhc_num; /* look for n-th xhc */
 };
 
@@ -952,13 +960,56 @@ static bool __init dbc_open(struct dbc *dbc)
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
 
@@ -1129,10 +1180,38 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
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
+    /*
+     * This marks the whole page as R/O, which may include other registers
+     * unrelated to DbC. Xen needs only DbC area protected, but it seems
+     * Linux's XHCI driver (as of 5.18) works without writting to the whole
+     * page, so keep it simple.
+     */
+    if ( rangeset_add_range(mmio_ro_ranges,
+                PFN_DOWN(uart->dbc.xhc_mmio_phys + uart->dbc.xhc_dbc_offset),
+                PFN_UP(uart->dbc.xhc_mmio_phys + uart->dbc.xhc_dbc_offset +
+                       sizeof(*uart->dbc.dbc_reg)) - 1) )
+        printk(XENLOG_INFO
+               "Error while adding MMIO range of device to mmio_ro_ranges\n");
+#endif
 }
 
 static int cf_check dbc_uart_tx_ready(struct serial_port *port)
@@ -1200,11 +1279,13 @@ static int __init xhci_parse_dbgp(const char *opt_dbgp)
 {
     struct dbc_uart *uart = &dbc_uart;
     struct dbc *dbc = &uart->dbc;
-    const char *e;
+    const char *e, *opt;
+    int val;
 
     if ( strncmp(opt_dbgp, "xhci", 4) )
         return 0;
 
+    e = &opt_dbgp[4];
     if ( isdigit(opt_dbgp[4]) )
     {
         dbc->xhc_num = simple_strtoul(opt_dbgp + 4, &e, 10);
@@ -1214,7 +1295,7 @@ static int __init xhci_parse_dbgp(const char *opt_dbgp)
         unsigned int bus, slot, func;
 
         e = parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
-        if ( !e || *e )
+        if ( !e || (*e && *e != ',') )
         {
             printk(XENLOG_ERR
                    "Invalid dbgp= PCI device spec: '%s'\n",
@@ -1224,6 +1305,38 @@ static int __init xhci_parse_dbgp(const char *opt_dbgp)
 
         dbc->sbdf = PCI_SBDF(0, bus, slot, func);
     }
+    opt = e;
+
+    /* other options */
+    while ( *opt == ',' )
+    {
+        opt++;
+        e = strchr(opt, ',');
+        if ( !e )
+            e = strchr(opt, '\0');
+
+        if ( (val = parse_boolean("share", opt, e)) != -1 )
+        {
+            if ( val == -2 && !cmdline_strcmp(opt + 6, "hwdom") )
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
+
+    if ( *opt )
+    {
+        printk(XENLOG_ERR "Invalid dbgp= parameters: '%s'\n", opt);
+        return -EINVAL;
+    }
 
     dbc->enable = true;
 
-- 
git-series 0.9.1

