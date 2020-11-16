Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 667442B43A2
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 13:26:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27883.56486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kedZy-0001fa-SH; Mon, 16 Nov 2020 12:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27883.56486; Mon, 16 Nov 2020 12:25:54 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kedZy-0001ew-OL; Mon, 16 Nov 2020 12:25:54 +0000
Received: by outflank-mailman (input) for mailman id 27883;
 Mon, 16 Nov 2020 12:25:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+iU=EW=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kedZx-0001eS-8T
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 12:25:53 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 58ed8055-d374-449b-baad-1c717da4b7ff;
 Mon, 16 Nov 2020 12:25:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2079101E;
 Mon, 16 Nov 2020 04:25:51 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F5063F70D;
 Mon, 16 Nov 2020 04:25:50 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3+iU=EW=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kedZx-0001eS-8T
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 12:25:53 +0000
X-Inumbo-ID: 58ed8055-d374-449b-baad-1c717da4b7ff
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 58ed8055-d374-449b-baad-1c717da4b7ff;
	Mon, 16 Nov 2020 12:25:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2079101E;
	Mon, 16 Nov 2020 04:25:51 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown [10.58.246.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F5063F70D;
	Mon, 16 Nov 2020 04:25:50 -0800 (PST)
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM with HAS_PCI enabled.
Date: Mon, 16 Nov 2020 12:25:16 +0000
Message-Id: <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605527997.git.rahul.singh@arm.com>
References: <cover.1605527997.git.rahul.singh@arm.com>
In-Reply-To: <cover.1605527997.git.rahul.singh@arm.com>
References: <cover.1605527997.git.rahul.singh@arm.com>

NS16550 driver has PCI support that is under HAS_PCI flag. When HAS_PCI
is enabled for ARM, compilation error is observed for ARM architecture
because ARM platforms do not have full PCI support available.

Introducing new kconfig option CONFIG_HAS_NS16550_PCI to support
ns16550 PCI for X86.

For X86 platforms it is enabled by default. For ARM platforms it is
disabled by default, once we have proper support for NS16550 PCI for
ARM we can enable it.

No functional change.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---

Changes in v3:
- remove help text from the Kconfig file because of prompt-less option.

---
 xen/drivers/char/Kconfig   |  4 ++++
 xen/drivers/char/ns16550.c | 32 ++++++++++++++++----------------
 2 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index b572305657..abb59fdb0f 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -4,6 +4,10 @@ config HAS_NS16550
 	help
 	  This selects the 16550-series UART support. For most systems, say Y.
 
+config HAS_NS16550_PCI
+	def_bool y
+	depends on X86 && HAS_NS16550 && HAS_PCI
+
 config HAS_CADENCE_UART
 	bool "Xilinx Cadence UART driver"
 	default y
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index d8b52eb813..bd1c2af956 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -16,7 +16,7 @@
 #include <xen/timer.h>
 #include <xen/serial.h>
 #include <xen/iocap.h>
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_NS16550_PCI
 #include <xen/pci.h>
 #include <xen/pci_regs.h>
 #include <xen/pci_ids.h>
@@ -54,7 +54,7 @@ enum serial_param_type {
     reg_shift,
     reg_width,
     stop_bits,
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_NS16550_PCI
     bridge_bdf,
     device,
     port_bdf,
@@ -83,7 +83,7 @@ static struct ns16550 {
     unsigned int timeout_ms;
     bool_t intr_works;
     bool_t dw_usr_bsy;
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_NS16550_PCI
     /* PCI card parameters. */
     bool_t pb_bdf_enable;   /* if =1, pb-bdf effective, port behind bridge */
     bool_t ps_bdf_enable;   /* if =1, ps_bdf effective, port on pci card */
@@ -117,14 +117,14 @@ static const struct serial_param_var __initconst sp_vars[] = {
     {"reg-shift", reg_shift},
     {"reg-width", reg_width},
     {"stop-bits", stop_bits},
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_NS16550_PCI
     {"bridge", bridge_bdf},
     {"dev", device},
     {"port", port_bdf},
 #endif
 };
 
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_NS16550_PCI
 struct ns16550_config {
     u16 vendor_id;
     u16 dev_id;
@@ -620,7 +620,7 @@ static int ns16550_getc(struct serial_port *port, char *pc)
 
 static void pci_serial_early_init(struct ns16550 *uart)
 {
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_NS16550_PCI
     if ( !uart->ps_bdf_enable || uart->io_base >= 0x10000 )
         return;
 
@@ -719,7 +719,7 @@ static void __init ns16550_init_preirq(struct serial_port *port)
 
 static void __init ns16550_init_irq(struct serial_port *port)
 {
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_NS16550_PCI
     struct ns16550 *uart = port->uart;
 
     if ( uart->msi )
@@ -761,7 +761,7 @@ static void __init ns16550_init_postirq(struct serial_port *port)
     uart->timeout_ms = max_t(
         unsigned int, 1, (bits * uart->fifo_size * 1000) / uart->baud);
 
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_NS16550_PCI
     if ( uart->bar || uart->ps_bdf_enable )
     {
         if ( uart->param && uart->param->mmio &&
@@ -841,7 +841,7 @@ static void ns16550_suspend(struct serial_port *port)
 
     stop_timer(&uart->timer);
 
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_NS16550_PCI
     if ( uart->bar )
        uart->cr = pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
                                   uart->ps_bdf[2]), PCI_COMMAND);
@@ -850,7 +850,7 @@ static void ns16550_suspend(struct serial_port *port)
 
 static void _ns16550_resume(struct serial_port *port)
 {
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_NS16550_PCI
     struct ns16550 *uart = port->uart;
 
     if ( uart->bar )
@@ -1013,7 +1013,7 @@ static int __init check_existence(struct ns16550 *uart)
     return 1; /* Everything is MMIO */
 #endif
 
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_NS16550_PCI
     pci_serial_early_init(uart);
 #endif
 
@@ -1044,7 +1044,7 @@ static int __init check_existence(struct ns16550 *uart)
     return (status == 0x90);
 }
 
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_NS16550_PCI
 static int __init
 pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
 {
@@ -1305,7 +1305,7 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
 
     if ( *conf == ',' && *++conf != ',' )
     {
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_NS16550_PCI
         if ( strncmp(conf, "pci", 3) == 0 )
         {
             if ( pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com) )
@@ -1327,7 +1327,7 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
 
     if ( *conf == ',' && *++conf != ',' )
     {
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_NS16550_PCI
         if ( strncmp(conf, "msi", 3) == 0 )
         {
             conf += 3;
@@ -1339,7 +1339,7 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
             uart->irq = simple_strtol(conf, &conf, 10);
     }
 
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_NS16550_PCI
     if ( *conf == ',' && *++conf != ',' )
     {
         conf = parse_pci(conf, NULL, &uart->ps_bdf[0],
@@ -1419,7 +1419,7 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
             uart->reg_width = simple_strtoul(param_value, NULL, 0);
             break;
 
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_NS16550_PCI
         case bridge_bdf:
             if ( !parse_pci(param_value, NULL, &uart->ps_bdf[0],
                             &uart->ps_bdf[1], &uart->ps_bdf[2]) )
-- 
2.17.1


