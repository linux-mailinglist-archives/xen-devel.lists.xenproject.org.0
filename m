Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8972B757F25
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 16:14:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565308.883348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLlSh-0001vw-32; Tue, 18 Jul 2023 14:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565308.883348; Tue, 18 Jul 2023 14:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLlSh-0001sB-0F; Tue, 18 Jul 2023 14:13:59 +0000
Received: by outflank-mailman (input) for mailman id 565308;
 Tue, 18 Jul 2023 14:13:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CPt9=DE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qLlSf-0001s5-Ur
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 14:13:58 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54ba327d-2575-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 16:13:55 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f9fdb0ef35so9665042e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jul 2023 07:13:55 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 t17-20020ac243b1000000b004faeedbb29dsm461074lfl.64.2023.07.18.07.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 07:13:54 -0700 (PDT)
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
X-Inumbo-ID: 54ba327d-2575-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689689635; x=1692281635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GrQtZY4wGpbZs2f3zzM1/MVBvwz1MdPu48AEb1m6RVU=;
        b=WBldF0E685DoQ5slsfK2KeYTdKm3d+N25vxLDFeTVZk6sgLEDTDGAKBlF39UlMvwFL
         sm6c+a5vl3sKks8/C28pZZA9UvJnr7Ot9WCnByGy4is67Z97L8hZYaVeU2Pupwc64zhQ
         /DE5iBsQWktsMEjok2z8MBKFvSXqA/ubYFA3ZIz1PxeXdtwfMT612sEhJ/li/BHyzNPe
         Mw2m82DEN6WjJB3QUIrsfKnFr/XORCAws+sFUw3Cx/IjlbyCtfKSYkdOG+DnedMoDQVj
         dQdcOaME0Hagnqd8cckUMgj7fAptB+l7mCvX9WTdME3/U2fhwIhWwQ++XSr4pUPb9iyg
         DewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689689635; x=1692281635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrQtZY4wGpbZs2f3zzM1/MVBvwz1MdPu48AEb1m6RVU=;
        b=cAnMbH2j7E+YXRIaA3tWDWxtlK1lWDFAhOO6QNMMWnhXzRO0PbdVPNNg5d0NsHxMIO
         KNOyGRc5KFpYL7R9MCvRkPbpZ6yG96xGw0+0C3G4O9LNaaCsFGyIe8hRfZ7hG7vC7yby
         wG8aDwyl2b2HEZbK0HirChUKCmoXTgoXUnCtvAIces8Xj2+/l3iUxvyeSYbV/d/1jAFy
         0Bm8v05yFx5YCKfHNAFc/iiEyiUHVJTj2A3oLNI3oMVLklqPmnx7iv4O02vxYq7NFTvn
         vZWgLR4/h8UejhqmRclX7DUC6uYR/jhusYCL2Lbwpi5aa3tEmRxsyG4s5ahqwqVlSV4/
         CABA==
X-Gm-Message-State: ABy/qLb7TnjlrbP1IlB72tEwUJtJ5gGogOIRY/57PmR4s7q8ovsINIR2
	up9KCSyuciE7YQFK3mhFt1Q9KtW9jyM=
X-Google-Smtp-Source: APBJJlGu8GTu7pnjw7rJwVnlf1DwnDY6SqaHZexRh1Wze4UbsvHc4wPnrXs1DtXYmXNbe1gOEx1zSQ==
X-Received: by 2002:a05:6512:1181:b0:4fb:89b3:3373 with SMTP id g1-20020a056512118100b004fb89b33373mr9139584lfr.43.1689689634729;
        Tue, 18 Jul 2023 07:13:54 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] ns16550: add support for polling mode when device tree is used
Date: Tue, 18 Jul 2023 17:13:50 +0300
Message-ID: <ce821c1c81ba69397047daae0b0e6d44893ec28d.1689689630.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V doesn't support interrupts for the time being, so it would be nice to
have polling mode.

The patch assumes that polling mode will be used if there is no interrupt
property or the interrupt is equal to some unused UART interrupt number ( look
at the definition of NO_IRQ_POLL in ns16550.c ).

Also, the patch updates other places where '0' ( use NO_IRQ_POLL instead of
'0' ) was used to set that polling mode should be used.
It is possible that interrupt '0' can be used for some architectures as an
legal UART interrupt number ( according to dts files in Linux kernel ).
For example:
https://github.com/torvalds/linux/blob/master/arch/powerpc/boot/dts/ebony.dts#L197

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/drivers/char/ns16550.c | 51 ++++++++++++++++++++++++++++----------
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 2aed6ec707..2547f53f5a 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -40,6 +40,8 @@
 #include <asm/fixmap.h>
 #endif
 
+#define NO_IRQ_POLL 0
+
 static struct ns16550 {
     int baud, clock_hz, data_bits, parity, stop_bits, fifo_size, irq;
     u64 io_base;   /* I/O port or memory-mapped I/O address. */
@@ -58,7 +60,11 @@ static struct ns16550 {
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
@@ -181,7 +187,7 @@ static void cf_check ns16550_interrupt(
     struct serial_port *port = dev_id;
     struct ns16550 *uart = port->uart;
 
-    uart->intr_works = 1;
+    uart->intr_works = intr_on;
 
     while ( !(ns_read_reg(uart, UART_IIR) & UART_IIR_NOINT) )
     {
@@ -212,7 +218,7 @@ static void cf_check __ns16550_poll(struct cpu_user_regs *regs)
     struct serial_port *port = this_cpu(poll_port);
     struct ns16550 *uart = port->uart;
 
-    if ( uart->intr_works )
+    if ( uart->intr_works == intr_on )
         return; /* Interrupts work - no more polling */
 
     while ( ns_read_reg(uart, UART_LSR) & UART_LSR_DR )
@@ -305,7 +311,8 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
     unsigned char lcr;
     unsigned int  divisor;
 
-    uart->intr_works = 0;
+    if ( uart->intr_works != polling )
+        uart->intr_works = intr_off;
 
     pci_serial_early_init(uart);
 
@@ -394,7 +401,7 @@ static void __init cf_check ns16550_init_irq(struct serial_port *port)
 
 static void ns16550_setup_postirq(struct ns16550 *uart)
 {
-    if ( uart->irq > 0 )
+    if ( uart->intr_works != polling )
     {
         /* Master interrupt enable; also keep DTR/RTS asserted. */
         ns_write_reg(uart,
@@ -472,7 +479,8 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
 
                 if ( rc )
                 {
-                    uart->irq = 0;
+                    uart->irq = NO_IRQ_POLL;
+                    uart->intr_works = polling;
                     if ( msi_desc )
                         msi_free_irq(msi_desc);
                     else
@@ -488,7 +496,7 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
     }
 #endif
 
-    if ( uart->irq > 0 )
+    if ( uart->intr_works != polling )
     {
         uart->irqaction.handler = ns16550_interrupt;
         uart->irqaction.name    = "ns16550";
@@ -595,7 +603,9 @@ static void __init cf_check ns16550_endboot(struct serial_port *port)
 static int __init cf_check ns16550_irq(struct serial_port *port)
 {
     struct ns16550 *uart = port->uart;
-    return ((uart->irq > 0) ? uart->irq : -1);
+
+    return (((uart->intr_works != polling) && (uart->irq >= 0)) ?
+            uart->irq : -1);
 }
 
 static void cf_check ns16550_start_tx(struct serial_port *port)
@@ -1330,9 +1340,12 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
                  * as special only for X86.
                  */
                 if ( uart->irq == 0xff )
-                    uart->irq = 0;
+                {
+                    uart->irq = NO_IRQ_POLL;
+                    uart->intr_works = polling;
+                }
 #endif
-                if ( !uart->irq )
+                if ( uart->intr_works == polling )
                     printk(XENLOG_INFO
                            "ns16550: %pp: no legacy IRQ, using poll mode\n",
                            &PCI_SBDF(0, b, d, f));
@@ -1551,7 +1564,8 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
         {
             conf += 3;
             uart->msi = true;
-            uart->irq = 0;
+            uart->irq = NO_IRQ_POLL;
+            uart->intr_works = polling;
         }
         else
 #endif
@@ -1791,8 +1805,19 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
     }
 
     res = platform_get_irq(dev, 0);
-    if ( ! res )
-        return -EINVAL;
+    if ( (res < 0 ) || (res == NO_IRQ_POLL) )
+    {
+        printk("ns1650: polling will be used\n");
+
+        /*
+         * If the node doesn't have any interrupt or an interrupt number is
+         * equal to reserved NO_IRQ_POLL, then it means the driver
+         * will want to using polling.
+         */
+        res = NO_IRQ_POLL;
+
+        uart->intr_works = polling;
+    }
     uart->irq = res;
 
     uart->dw_usr_bsy = dt_device_is_compatible(dev, "snps,dw-apb-uart");
-- 
2.41.0


