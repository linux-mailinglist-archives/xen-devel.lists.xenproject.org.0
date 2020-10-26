Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D8229938E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 18:18:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12475.32490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX68c-00033Y-W4; Mon, 26 Oct 2020 17:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12475.32490; Mon, 26 Oct 2020 17:18:30 +0000
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
	id 1kX68c-000334-Qu; Mon, 26 Oct 2020 17:18:30 +0000
Received: by outflank-mailman (input) for mailman id 12475;
 Mon, 26 Oct 2020 17:18:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Yhc=EB=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kX68a-00032c-Qx
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:18:28 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6fd7745e-367b-44aa-beec-076783c922f6;
 Mon, 26 Oct 2020 17:18:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33967139F;
 Mon, 26 Oct 2020 10:18:27 -0700 (PDT)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 011B33F719;
 Mon, 26 Oct 2020 10:18:25 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0Yhc=EB=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kX68a-00032c-Qx
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:18:28 +0000
X-Inumbo-ID: 6fd7745e-367b-44aa-beec-076783c922f6
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 6fd7745e-367b-44aa-beec-076783c922f6;
	Mon, 26 Oct 2020 17:18:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33967139F;
	Mon, 26 Oct 2020 10:18:27 -0700 (PDT)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown [10.58.246.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 011B33F719;
	Mon, 26 Oct 2020 10:18:25 -0700 (PDT)
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
Subject: [PATCH v1 1/4] xen/ns16550: solve compilation error on ARM with CONFIG_HAS_PCI enabled.
Date: Mon, 26 Oct 2020 17:17:51 +0000
Message-Id: <d1df24d48508c0c01c0b1130ed22f2b4585d04db.1603731279.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603731279.git.rahul.singh@arm.com>
References: <cover.1603731279.git.rahul.singh@arm.com>
In-Reply-To: <cover.1603731279.git.rahul.singh@arm.com>
References: <cover.1603731279.git.rahul.singh@arm.com>

ARM platforms does not support ns16550 PCI support. When CONFIG_HAS_PCI
is enabled for ARM a compilation error is observed.

Fixed compilation error after introducing new kconfig option
CONFIG_HAS_NS16550_PCI for x86 platforms to support ns16550 PCI.

No functional change.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/char/Kconfig   |  7 +++++++
 xen/drivers/char/ns16550.c | 32 ++++++++++++++++----------------
 2 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index b572305657..8887e86afe 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -4,6 +4,13 @@ config HAS_NS16550
 	help
 	  This selects the 16550-series UART support. For most systems, say Y.
 
+config HAS_NS16550_PCI
+	bool "NS16550 UART PCI support" if X86
+	default y
+	depends on X86 && HAS_NS16550 && HAS_PCI
+	help
+	  This selects the 16550-series UART PCI support. For most systems, say Y.
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


