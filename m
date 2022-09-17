Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B885BB5AE
	for <lists+xen-devel@lfdr.de>; Sat, 17 Sep 2022 04:52:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408206.651001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZNvx-0004wS-Ax; Sat, 17 Sep 2022 02:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408206.651001; Sat, 17 Sep 2022 02:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZNvx-0004ub-6W; Sat, 17 Sep 2022 02:51:57 +0000
Received: by outflank-mailman (input) for mailman id 408206;
 Sat, 17 Sep 2022 02:51:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=os+o=ZU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oZNvv-0002wS-6Z
 for xen-devel@lists.xenproject.org; Sat, 17 Sep 2022 02:51:55 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af96ef2a-3633-11ed-9761-273f2230c3a0;
 Sat, 17 Sep 2022 04:51:54 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 632395C00A9;
 Fri, 16 Sep 2022 22:51:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 16 Sep 2022 22:51:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Sep 2022 22:51:51 -0400 (EDT)
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
X-Inumbo-ID: af96ef2a-3633-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1663383113; x=1663469513; bh=NiyNOXiNwr
	iNwBPnQLIEDaYmk/WxMl7jUGwTLDkTZnY=; b=l5qqbsUMOsoYp45rOMwIcZ9cy8
	YKw4H30YbIlatKG9UWO3DbwmHg2bHbzSkvwkDXcvdDVUPvAgWXFf4JRHIe969fvn
	h5NnMSqybsxnqZGr+N9Csmvzrs+uccbDLT7nN9rMb1ZQtmhz5ewuFKvFHHrfvnUv
	4A6WYilJko5NEMruCVW3iYOJQjuQy4bloatHwQOMqAf6+zZh0aadIA1gNa350Ihf
	Vg4h49jekggAhsQpPqevFSyeYhFOuprA/fOy0B7mSxqiDoRQj4T7GFJkGEuOEF41
	RZEOZ0VCvoZAba167FixX0vKfV5ZaTsKq42fLsQlhg+H3X0JUsGLkSUnqZMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663383113; x=
	1663469513; bh=NiyNOXiNwriNwBPnQLIEDaYmk/WxMl7jUGwTLDkTZnY=; b=R
	M2S+tL24N5FRiCN4eJSJSHj5iCIwX1beSVXWUQRhcBKa4rpPXZYrJQCIxRwq1ACK
	s3DXdyVyRgVL/4O5QGmHNebQ769rW3a1rKvPauyAfKti0F9W3vxJvVF/xmMPebDR
	4W7VWc4UakwoU8THg+lKefLrYR4HCBSiXTKbMTLYbRTd54ptVMCQlx1fRZ0Z1cAO
	U1A3L6vqJAMaRZG6x5iLFAnM+cseUF1W4w1mzGMRasSxVKd2sub3tmfhDMl41ALu
	OBeBY1Yx3XTcYOB/9Ji/5qZOj1Qp+043y04MX0KKwQVSgK5mz1izaYLlSxHZ1swU
	ZrFmKS8ceWAgEcwVZz7KA==
X-ME-Sender: <xms:STYlY7QUhTSNDsgZNCvozGjekyWOGjOO5YYn5_EHGLak5pvzd0ZrjQ>
    <xme:STYlY8ykKWMQsF1vXFbkqR3JNGH4HAtqaVxVmSvjII4P5pzu-eAF-vg_2pNio-TQh
    3n7DeDqK-whbg>
X-ME-Received: <xmr:STYlYw3LOm5IQqx9FNoa4yPR6RnrIz14XjiIiGtShPupwJ8f89Zyu4raxYKpYMI5A2svZa7Hn8aZA_pbrHSFpCLdPZAzhQwtekHm6V51Rtb-A_8N6zmceQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:STYlY7COVXxrUiwy_f40eX36qlYO2gl9VZsA5rOWatXaIY6bPAKd0g>
    <xmx:STYlY0ilIzV4Ut2Aba3ZFZsGxF0p6dujkG6gSNgdW9qR59XQFdvqbQ>
    <xmx:STYlY_qr8vWEjmUOlY-55Y3DT7TDIDW1Ellfkaz--HCwHS1GE1d3LA>
    <xmx:STYlY-bAZgBAXCcqN5DqhZ84EP_0wvyc9iRIA49c2aILOS-OjxocVw>
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
Subject: [PATCH v7 07/11] drivers/char: allow driving the rest of XHCI by a domain while Xen uses DbC
Date: Sat, 17 Sep 2022 04:51:26 +0200
Message-Id: <41e4f161de6f22d92db81f4822c164a9ad256147.1663383053.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
References: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
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
index 92d668afa06c..bbb4652bbfcd 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -723,7 +723,7 @@ Available alternatives, with their meaning, are:
 
 ### dbgp
 > `= ehci[ <integer> | @pci<bus>:<slot>.<func> ]`
-> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ]`
+> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ][,share=<bool>|hwdom]`
 
 Specify the USB controller to use, either by instance number (when going
 over the PCI busses sequentially) or by PCI device (must be on segment 0).
@@ -731,6 +731,18 @@ over the PCI busses sequentially) or by PCI device (must be on segment 0).
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
index 5f47733c1801..5f92234a9594 100644
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
 
@@ -961,13 +969,56 @@ static bool __init dbc_open(struct dbc *dbc)
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
 
@@ -1136,10 +1187,38 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
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
@@ -1207,13 +1286,15 @@ static int __init xhci_parse_dbgp(const char *opt_dbgp)
 {
     struct dbc_uart *uart = &dbc_uart;
     struct dbc *dbc = &uart->dbc;
-    const char *e;
+    const char *e, *opt;
+    int val;
 
     if ( strncmp(opt_dbgp, "xhci", 4) )
         return 0;
 
     memset(dbc, 0, sizeof(*dbc));
 
+    e = &opt_dbgp[4];
     if ( isdigit(opt_dbgp[4]) )
     {
         dbc->xhc_num = simple_strtoul(opt_dbgp + 4, &e, 10);
@@ -1223,7 +1304,7 @@ static int __init xhci_parse_dbgp(const char *opt_dbgp)
         unsigned int bus, slot, func;
 
         e = parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
-        if ( !e || *e )
+        if ( !e || (*e && *e != ',') )
         {
             printk(XENLOG_ERR
                    "Invalid dbgp= PCI device spec: '%s'\n",
@@ -1233,6 +1314,38 @@ static int __init xhci_parse_dbgp(const char *opt_dbgp)
 
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

