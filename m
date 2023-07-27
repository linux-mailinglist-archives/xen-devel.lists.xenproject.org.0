Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDC8765912
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 18:46:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571239.894615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP47T-0005MB-Ko; Thu, 27 Jul 2023 16:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571239.894615; Thu, 27 Jul 2023 16:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP47T-0005KJ-Hd; Thu, 27 Jul 2023 16:45:43 +0000
Received: by outflank-mailman (input) for mailman id 571239;
 Thu, 27 Jul 2023 16:45:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SoSB=DN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qP47S-0004vW-3L
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 16:45:42 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05d5d26b-2c9d-11ee-b24a-6b7b168915f2;
 Thu, 27 Jul 2023 18:45:41 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b97f34239cso17259611fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 09:45:41 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 q24-20020a2e8758000000b002b69febf515sm429800ljj.125.2023.07.27.09.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 09:45:39 -0700 (PDT)
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
X-Inumbo-ID: 05d5d26b-2c9d-11ee-b24a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690476341; x=1691081141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MkIz6ax8NL2d1PW8QNC5JcfmZ1hJCFw2AFK9nrAP+Q=;
        b=aOCMnskHowYe+xQXN+QFOKtpBKHrhdp0F4PAJ3Gn0p5HFtF/lWtmx4xJLCp9yBST1/
         Sm/sumjgp6b+0lctZ9eC0uBiIT/GmxEYo+6rDJjLJYLVrRYPjDdkbf+MzlIEmfTrB5il
         IkhuASodKTmYN0wY2qtJXndm6ZcxzkdFGRTDZsjb2b1chl54QE4vNPVrY4tliReCsV/O
         y4VV3XWnoSsyH8e4gFJ+ENf/96ZlSfajm5lhzJ69xHbVWvzuyvOmFwPZBQ/6/mvqAuIF
         rjLZERpIXROyJAR/qSNXJ+qzqIQMCaB229y6fdg0mMei4IlUoqETI0pKArszJM4f1Z7c
         cDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690476341; x=1691081141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MkIz6ax8NL2d1PW8QNC5JcfmZ1hJCFw2AFK9nrAP+Q=;
        b=N5ug7hSVmuGm6Sa44Ig6gAM8Im3wsGzYjXtZXX9FjMTaaOXZwzs2uH9PrHtuBysaSb
         kQfraC4i5x9q2ptHe1leY1Hc/KPmYP11+TsAvZeMAokfPjMrXLTnumqFN4xqGT1ycfEV
         l+XuCfwWZIwB5Ima+P0xx6oKIv/bh/soouvhNq90IhIJd++IzftYGtHyvsTBVlfx740l
         K7MsKOChR8wc5lb+Gz6UU1t7Cce8jVKfk6d8i1VicsnZoTx6h5q1fYaaBXgwn9G5LclS
         iScoQN8dIDf0dNwsp5Df2xJlbOHhEOYEPavbVkYUi2ecEm5oc+YU7OcpiS9K+UnumLsN
         meKw==
X-Gm-Message-State: ABy/qLa1TtcK44VSPfuK8P3EOyidmzDA/vm1xoSsASuztTc6IDZNA8/o
	LBHYFAHUphADxE0ulwCTWfL5yHwSBPo=
X-Google-Smtp-Source: APBJJlHd+2XuTzLRTrR2TWXzINDheyjAbqKpbMRTaztzV6z9rDFfYDzJpW7suvL6/C+YEjjCuBjumw==
X-Received: by 2002:a2e:9b54:0:b0:2b6:e196:68c4 with SMTP id o20-20020a2e9b54000000b002b6e19668c4mr2207348ljj.39.1690476340394;
        Thu, 27 Jul 2023 09:45:40 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 1/1] ns16550: add support for polling mode when device tree is used
Date: Thu, 27 Jul 2023 19:45:37 +0300
Message-ID: <6e8f243284b53a9c56e7faf5e0e5ee5e20de9958.1690475512.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1690475512.git.oleksii.kurochko@gmail.com>
References: <cover.1690475512.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V doesn't support interrupts for the time being, so it would be nice to
have polling mode.

To force poll mode it was added parsing of new 'poll' property under "com<N>="

If there is no interrupt property in UART node, then polling will be used.
According to 4.2.2 National Semiconductor 16450/16550 Compatible UART
Requirements from The Devicetree Specification v0.4
( https://www.devicetree.org/specifications/ ) the interrupt property is
optional.

Also, it is possible that interrupt '0' can be used for some architectures as
an legal UART interrupt number ( according to dts files in Linux kernel ), so
the check of the return value of platform_get_irq() was updated in case of when
device tree is used for UART initialization.
For example:
https://github.com/torvalds/linux/blob/master/arch/powerpc/boot/dts/ebony.dts#L197

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - fix code style for ns16550_irq().
 - partially revert changes in pci_uart_config().
 - add check of "poll" property under "com<N>=" instead of "console=".
 - remove seting of polling mode in parsing of msi in parse_positional().
 - update comment above opt_com1 about Configuration string of serial port.
---
 xen/drivers/char/ns16550.c | 64 +++++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 22 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 2aed6ec707..83170fd6b8 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -58,7 +58,11 @@ static struct ns16550 {
     struct timer timer;
     struct timer resume_timer;
     unsigned int timeout_ms;
-    bool_t intr_works;
+    enum {
+        intr_off,
+        intr_on,
+        polling,
+    } intr_works;
     bool_t dw_usr_bsy;
 #ifdef NS16550_PCI
     /* PCI card parameters. */
@@ -112,6 +116,19 @@ struct ns16550_config_param {
 static void enable_exar_enhanced_bits(const struct ns16550 *uart);
 #endif
 
+/*
+ * Configure serial port with a string:
+ *   <baud>[/<base_baud>][,DPS[,<io-base>[,<irq>|msi|poll[,<port-bdf>[,<bridge-bdf>]]]]].
+ * The tail of the string can be omitted if platform defaults are sufficient.
+ * If the baud rate is pre-configured, perhaps by a bootloader, then 'auto'
+ * can be specified in place of a numeric baud rate. Polled mode is specified
+ * by poll property.
+ */
+static char __initdata opt_com1[128] = "";
+static char __initdata opt_com2[128] = "";
+string_param("com1", opt_com1);
+string_param("com2", opt_com2);
+
 static void cf_check ns16550_delayed_resume(void *data);
 
 static u8 ns_read_reg(const struct ns16550 *uart, unsigned int reg)
@@ -181,7 +198,7 @@ static void cf_check ns16550_interrupt(
     struct serial_port *port = dev_id;
     struct ns16550 *uart = port->uart;
 
-    uart->intr_works = 1;
+    uart->intr_works = intr_on;
 
     while ( !(ns_read_reg(uart, UART_IIR) & UART_IIR_NOINT) )
     {
@@ -212,7 +229,7 @@ static void cf_check __ns16550_poll(struct cpu_user_regs *regs)
     struct serial_port *port = this_cpu(poll_port);
     struct ns16550 *uart = port->uart;
 
-    if ( uart->intr_works )
+    if ( uart->intr_works == intr_on )
         return; /* Interrupts work - no more polling */
 
     while ( ns_read_reg(uart, UART_LSR) & UART_LSR_DR )
@@ -305,7 +322,8 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
     unsigned char lcr;
     unsigned int  divisor;
 
-    uart->intr_works = 0;
+    if ( uart->intr_works != polling )
+        uart->intr_works = intr_off;
 
     pci_serial_early_init(uart);
 
@@ -394,7 +412,7 @@ static void __init cf_check ns16550_init_irq(struct serial_port *port)
 
 static void ns16550_setup_postirq(struct ns16550 *uart)
 {
-    if ( uart->irq > 0 )
+    if ( uart->intr_works != polling )
     {
         /* Master interrupt enable; also keep DTR/RTS asserted. */
         ns_write_reg(uart,
@@ -473,6 +491,7 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
                 if ( rc )
                 {
                     uart->irq = 0;
+                    uart->intr_works = polling;
                     if ( msi_desc )
                         msi_free_irq(msi_desc);
                     else
@@ -488,7 +507,7 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
     }
 #endif
 
-    if ( uart->irq > 0 )
+    if ( uart->intr_works != polling )
     {
         uart->irqaction.handler = ns16550_interrupt;
         uart->irqaction.name    = "ns16550";
@@ -595,7 +614,8 @@ static void __init cf_check ns16550_endboot(struct serial_port *port)
 static int __init cf_check ns16550_irq(struct serial_port *port)
 {
     struct ns16550 *uart = port->uart;
-    return ((uart->irq > 0) ? uart->irq : -1);
+
+    return ((uart->intr_works != polling) ? uart->irq : -1);
 }
 
 static void cf_check ns16550_start_tx(struct serial_port *port)
@@ -654,6 +674,9 @@ static void ns16550_init_common(struct ns16550 *uart)
 
     /* Default lsr_mask = UART_LSR_THRE */
     uart->lsr_mask  = UART_LSR_THRE;
+
+    if ( strstr(opt_com1, "poll") || strstr(opt_com2, "poll") )
+        uart->intr_works = polling;
 }
 
 #ifdef CONFIG_X86
@@ -1333,9 +1356,13 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
                     uart->irq = 0;
 #endif
                 if ( !uart->irq )
+                {
+                    uart->intr_works = polling;
+
                     printk(XENLOG_INFO
                            "ns16550: %pp: no legacy IRQ, using poll mode\n",
                            &PCI_SBDF(0, b, d, f));
+                }
 
                 return 0;
             }
@@ -1374,19 +1401,6 @@ static void enable_exar_enhanced_bits(const struct ns16550 *uart)
 
 #endif /* CONFIG_HAS_PCI */
 
-/*
- * Configure serial port with a string:
- *   <baud>[/<base_baud>][,DPS[,<io-base>[,<irq>[,<port-bdf>[,<bridge-bdf>]]]]].
- * The tail of the string can be omitted if platform defaults are sufficient.
- * If the baud rate is pre-configured, perhaps by a bootloader, then 'auto'
- * can be specified in place of a numeric baud rate. Polled mode is specified
- * by requesting irq 0.
- */
-static char __initdata opt_com1[128] = "";
-static char __initdata opt_com2[128] = "";
-string_param("com1", opt_com1);
-string_param("com2", opt_com2);
-
 enum serial_param_type {
     baud,
     clock_hz,
@@ -1555,6 +1569,9 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
         }
         else
 #endif
+        if ( strncmp(conf, "poll", 4) == 0 )
+            uart->intr_works = polling;
+        else
             uart->irq = simple_strtol(conf, &conf, 10);
     }
 
@@ -1791,8 +1808,11 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
     }
 
     res = platform_get_irq(dev, 0);
-    if ( ! res )
-        return -EINVAL;
+    if ( res < 0 )
+    {
+        printk("there is no interrupt property, polling will be used\n");
+        uart->intr_works = polling;
+    }
     uart->irq = res;
 
     uart->dw_usr_bsy = dt_device_is_compatible(dev, "snps,dw-apb-uart");
-- 
2.41.0


