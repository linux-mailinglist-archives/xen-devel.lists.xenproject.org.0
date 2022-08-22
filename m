Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D5A59C2B7
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 17:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391479.629398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9LC-0005uM-Rm; Mon, 22 Aug 2022 15:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391479.629398; Mon, 22 Aug 2022 15:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ9LC-0005qa-Kk; Mon, 22 Aug 2022 15:27:50 +0000
Received: by outflank-mailman (input) for mailman id 391479;
 Mon, 22 Aug 2022 15:27:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YSJC=Y2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oQ9LA-0003iu-Cv
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 15:27:48 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f920e2d7-222e-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 17:27:47 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 06E403200971;
 Mon, 22 Aug 2022 11:27:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 22 Aug 2022 11:27:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Aug 2022 11:27:43 -0400 (EDT)
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
X-Inumbo-ID: f920e2d7-222e-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1661182064; x=1661268464; bh=JeIh207uzZ
	pb1aNaI9jycqnoSZkqV0i0vjOTN7pf/5Q=; b=LtyZhkiSLkkhUCK7hJdj4Gkhiu
	xvs7MC4xxv4k5DiHtU3T1Q7/Vrow0sOWR3nEKU1mhGl1E/xW0w7UGCu20IL4xexo
	tOijEaN2fXONZz6zy/jBUkqpv9AOPvdUSomfaCkDcIzHFIgPKKLqMQlStqsrOkPd
	gcSuIiSbj0JQDfhpQ3hQbYG5mm0DmznXrMelVChrG8twpwiaSVWCYEAKI2Eputbl
	eIKdAF28Z6jevAzJ0Bqv0sn5QI2CvNEZ8NP7W2Pa9CmVKiUDHBu/ZWpr7DW4SwZH
	A1owg5aiNvoVN97jnkV8d30pmk1TE18mAj4qkdCNTN6gG4pcBh3hVs7KIAzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661182064; x=
	1661268464; bh=JeIh207uzZpb1aNaI9jycqnoSZkqV0i0vjOTN7pf/5Q=; b=P
	z5E4lH9m5nj+7llt36Lvn9fKjA6UT0s6XdcEwm10U24kB1pobDSV7D24j8oiY+Mw
	t+UP3vM4qISaFtrL9eP1wj1v0i+Rn2vVlESgOkupHF7sXp5jn6MyT5pddDT3u2mi
	llHUEtoGhuqA4+2j+EQz0+mwms7scdCJXLnY91VrnCJnyXQvGXzEMQgfMEAL3+oM
	WMQc3noLtpJTYHRmCHz932+DRoMRm2LRk0kPD9fh2GgiwezDvBzGr02nEm4b8Z69
	ty2x0x9hSTwhz0rCB0ViZ1jNOeGM8cf0fA8TTsDn57MiN/pO5o+i8HVBvs7bahqq
	6WtonL3Jf9DKxqMJ2bw7g==
X-ME-Sender: <xms:cKADY7Tu_4sDbY9vpK5nQIazLPdOqHVOTfszaqLYra4WyM3FLZlzNQ>
    <xme:cKADY8x2VPoLqSvoHrdIiNnTefoeggjpV---rDWFEXx2vnV7y9GAwNrlZMonGSaDh
    o8eQ4jzwjweGQ>
X-ME-Received: <xmr:cKADYw01ItxjoX15mVgVLKzbvDy7dMVNJ978PK4V4v23K-VHG5JaNv3nfO6TC1q6ru6AtyvmAk4dFk00cAnjUiv5W7oHT1nrFMLntL5YRqRgi1HWiUW9Ng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeijedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:cKADY7CwGenqxrlrnNo2blb-QKpuI0IKwA_d04PIsMxNyzCsBctn8g>
    <xmx:cKADY0gfMhP5wneiWiYgeV9SowIL0gM8ILpk5T7F2DIWHkV8bCJEHg>
    <xmx:cKADY_qduPtNQfnRS02sdnzIYxXOTLTHl6dAt6G1Mx3nwVso-82iqw>
    <xmx:cKADY-ZCkZ32P3dbsQGjbfqlG4pixPsO7pXiLalQY27NYGzx3BKbXA>
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
Subject: [PATCH v5 8/9] drivers/char: allow driving the rest of XHCI by a domain while Xen uses DbC
Date: Mon, 22 Aug 2022 17:27:08 +0200
Message-Id: <1e2e4177eecc1da762d519926fa206971a9997a0.1661181584.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
References: <cover.4afa0fece5b70e838e4f1c7c7f25d0fa3d157073.1661181584.git-series.marmarek@invisiblethingslab.com>
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
index a5883ef49a88..5aa184a4a06c 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -731,13 +731,25 @@ Specify the USB controller to use, either by instance number (when going
 over the PCI busses sequentially) or by PCI device (must be on segment 0).
 
 ### dbc
-> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ]`
+> `= xhci[ <integer> | @pci<bus>:<slot>.<func> ][,share=<bool>|hwdom]`
 
 Specify the USB controller to use, either by instance number (when going
 over the PCI busses sequentially) or by PCI device (must be on segment 0).
 
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
index afcd3312e2aa..e838e285fb75 100644
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
@@ -249,6 +256,7 @@ struct dbc {
     void __iomem *xhc_mmio;
 
     bool open;
+    enum xhci_share share;
     unsigned int xhc_num; /* look for n-th xhc */
 };
 
@@ -951,13 +959,56 @@ static bool __init dbc_open(struct dbc *dbc)
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
 
@@ -1128,10 +1179,38 @@ static void __init cf_check dbc_uart_init_postirq(struct serial_port *port)
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
@@ -1203,13 +1282,15 @@ void __init xhci_dbc_uart_init(void)
 {
     struct dbc_uart *uart = &dbc_uart;
     struct dbc *dbc = &uart->dbc;
-    const char *e;
+    const char *e, *opt;
+    int val;
 
     if ( strncmp(opt_dbc, "xhci", 4) )
         return;
 
     memset(dbc, 0, sizeof(*dbc));
 
+    e = &opt_dbc[4];
     if ( isdigit(opt_dbc[4]) )
     {
         dbc->xhc_num = simple_strtoul(opt_dbc + 4, &e, 10);
@@ -1219,7 +1300,7 @@ void __init xhci_dbc_uart_init(void)
         unsigned int bus, slot, func;
 
         e = parse_pci(opt_dbc + 8, NULL, &bus, &slot, &func);
-        if ( !e || *e )
+        if ( !e || (*e && *e != ',') )
         {
             printk(XENLOG_ERR
                    "Invalid dbc= PCI device spec: '%s'\n",
@@ -1229,6 +1310,38 @@ void __init xhci_dbc_uart_init(void)
 
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
+        printk(XENLOG_ERR "Invalid dbc= parameters: '%s'\n", opt);
+        return;
+    }
 
     dbc->dbc_ctx = &dbc_dma_bufs.ctx;
     dbc->dbc_erst = &dbc_dma_bufs.erst;
-- 
git-series 0.9.1

