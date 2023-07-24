Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5B075F9DD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 16:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568995.889276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNwX3-0001Pb-Nb; Mon, 24 Jul 2023 14:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568995.889276; Mon, 24 Jul 2023 14:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNwX3-0001N4-Jw; Mon, 24 Jul 2023 14:27:29 +0000
Received: by outflank-mailman (input) for mailman id 568995;
 Mon, 24 Jul 2023 14:27:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6P8=DK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qNwX2-0001My-9R
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 14:27:28 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 352689c8-2a2e-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 16:27:24 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fb7373dd35so6872810e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 07:27:24 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 er14-20020a05651248ce00b004fdb27909cesm2238855lfb.5.2023.07.24.07.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 07:27:22 -0700 (PDT)
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
X-Inumbo-ID: 352689c8-2a2e-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690208844; x=1690813644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q1pbQAm5Bhfv4qZPL0AfqaY18XN1qs/woa+tmGH403k=;
        b=GoQiEqjF0SmLWmIsgxxm/vIxFnbNgZ8ii2V62ha214WcDTXeAP1ll9Srfm4aG7BJms
         OtBW+TiJSSKc/+B2gnbqtpjST3dfUq2hqhlQstiOlVT1SiLR9+WbN55Hzdgm7dmHy9Kj
         nfSwX2vL3Is9o9veLpxFV7MgseQygTgs/JO6ds6oJG3lzewzoZwesNDFdUdUjZyWwoxB
         QTipnU4JOssMVfk71TlIiAlo4YpXpTvR023s+zVugfCBrk4v2wd8bFQLcR6g3CaPnT4W
         wZ+LdvIdw6qenwufBplPtGBvbIm0KDhBfIPASXfALZl++05DogOxD/2bo20NHe204z4d
         lFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690208844; x=1690813644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1pbQAm5Bhfv4qZPL0AfqaY18XN1qs/woa+tmGH403k=;
        b=KdWDrOrgvr+szM0iyUCtONKc2FUvYUYYCXGIj9GZ191sQeHddC4yOSSjTqrk0nOITE
         LGFd2r/W0P0WyH178AVSNDTCmPZMly+gzYtQB01nUVj6EOoM3oar8PIp6Qi7WpI2CyO9
         5Uwo+AacOPHScr/I3Fpb8TcaSONGMo/lAt5OjAq0J+fzIlgNg1CZoVoHdCsjc/cix59X
         Wuh8dNj67hcTmv2lwjYxIq5kS0VocEYQ6kfDdEfe4+QYb6wly4RFnWzhTo/bcsVu/J9F
         IQMQeGBnypIlDd0zKTfZCNH6OOcMMGSQLAvT6YdWmnTmFNI5iBI7zmYh6F66+1wNvak2
         KCug==
X-Gm-Message-State: ABy/qLZoNkPrAMXA7OXsNbT0Vz3iM/D60FgC0WaPWpiG4jCg1DEZWUKJ
	3V+6QwoRJ1qFxpLCnqv+NOEFfQZePH0=
X-Google-Smtp-Source: APBJJlEJXrjV48nVMGFDzOAX/eTdjirm2w57RDngn0Zz/VLj+f0iLcnVCd/SlpCT8FFwqhKhSfRNCw==
X-Received: by 2002:ac2:4d07:0:b0:4fb:a088:cfca with SMTP id r7-20020ac24d07000000b004fba088cfcamr3347618lfi.6.1690208843344;
        Mon, 24 Jul 2023 07:27:23 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3] ns16550: add support for polling mode when device tree is used
Date: Mon, 24 Jul 2023 17:27:20 +0300
Message-ID: <d929b43814e6e1a247b954c4be40a35d61b6a45a.1690208840.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

RISC-V doesn't support interrupts for the time being, so it would be nice to
have polling mode.

The patch adds new option to console='...,polling' which forces driver to use
polling mode.

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
 xen/drivers/char/console.c |  2 ++
 xen/drivers/char/ns16550.c | 38 ++++++++++++++++++++++++++++----------
 2 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 0e410fa086..07e9610d77 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -993,6 +993,8 @@ void __init console_init_preirq(void)
 #endif
         else if ( !strncmp(p, "none", 4) )
             continue;
+        else if ( !strncmp(p, "polling", 7 )
+            continue;
         else if ( (sh = serial_parse_handle(p)) >= 0 )
         {
             sercon_handle = sh;
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 2aed6ec707..a6eb3b3997 100644
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
@@ -181,7 +185,7 @@ static void cf_check ns16550_interrupt(
     struct serial_port *port = dev_id;
     struct ns16550 *uart = port->uart;
 
-    uart->intr_works = 1;
+    uart->intr_works = intr_on;
 
     while ( !(ns_read_reg(uart, UART_IIR) & UART_IIR_NOINT) )
     {
@@ -212,7 +216,7 @@ static void cf_check __ns16550_poll(struct cpu_user_regs *regs)
     struct serial_port *port = this_cpu(poll_port);
     struct ns16550 *uart = port->uart;
 
-    if ( uart->intr_works )
+    if ( uart->intr_works == intr_on )
         return; /* Interrupts work - no more polling */
 
     while ( ns_read_reg(uart, UART_LSR) & UART_LSR_DR )
@@ -305,7 +309,8 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
     unsigned char lcr;
     unsigned int  divisor;
 
-    uart->intr_works = 0;
+    if ( uart->intr_works != polling )
+        uart->intr_works = intr_off;
 
     pci_serial_early_init(uart);
 
@@ -394,7 +399,7 @@ static void __init cf_check ns16550_init_irq(struct serial_port *port)
 
 static void ns16550_setup_postirq(struct ns16550 *uart)
 {
-    if ( uart->irq > 0 )
+    if ( uart->intr_works != polling )
     {
         /* Master interrupt enable; also keep DTR/RTS asserted. */
         ns_write_reg(uart,
@@ -473,6 +478,7 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
                 if ( rc )
                 {
                     uart->irq = 0;
+                    uart->intr_works = polling;
                     if ( msi_desc )
                         msi_free_irq(msi_desc);
                     else
@@ -488,7 +494,7 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
     }
 #endif
 
-    if ( uart->irq > 0 )
+    if ( uart->intr_works != polling )
     {
         uart->irqaction.handler = ns16550_interrupt;
         uart->irqaction.name    = "ns16550";
@@ -595,7 +601,9 @@ static void __init cf_check ns16550_endboot(struct serial_port *port)
 static int __init cf_check ns16550_irq(struct serial_port *port)
 {
     struct ns16550 *uart = port->uart;
-    return ((uart->irq > 0) ? uart->irq : -1);
+
+    return ( uart->intr_works != polling ) ?
+            uart->irq : -1;
 }
 
 static void cf_check ns16550_start_tx(struct serial_port *port)
@@ -654,6 +662,9 @@ static void ns16550_init_common(struct ns16550 *uart)
 
     /* Default lsr_mask = UART_LSR_THRE */
     uart->lsr_mask  = UART_LSR_THRE;
+
+    if ( console_has("polling") )
+        uart->intr_works = polling;
 }
 
 #ifdef CONFIG_X86
@@ -1330,9 +1341,12 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
                  * as special only for X86.
                  */
                 if ( uart->irq == 0xff )
+                {
                     uart->irq = 0;
+                    uart->intr_works = polling;
+                }
 #endif
-                if ( !uart->irq )
+                if ( !uart->irq || (uart->intr_works == polling) )
                     printk(XENLOG_INFO
                            "ns16550: %pp: no legacy IRQ, using poll mode\n",
                            &PCI_SBDF(0, b, d, f));
@@ -1552,6 +1566,7 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
             conf += 3;
             uart->msi = true;
             uart->irq = 0;
+            uart->intr_works = polling;
         }
         else
 #endif
@@ -1791,8 +1806,11 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
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


