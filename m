Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CAC779324
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 17:31:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582587.912421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUU5z-0000oX-I4; Fri, 11 Aug 2023 15:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582587.912421; Fri, 11 Aug 2023 15:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUU5z-0000lo-FJ; Fri, 11 Aug 2023 15:30:35 +0000
Received: by outflank-mailman (input) for mailman id 582587;
 Fri, 11 Aug 2023 15:30:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zNma=D4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qUU5y-0000lg-NL
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 15:30:34 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01b0cecc-385c-11ee-8613-37d641c3527e;
 Fri, 11 Aug 2023 17:30:31 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b703a0453fso32312851fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Aug 2023 08:30:31 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s10-20020a2e2c0a000000b002b70a64d4desm912846ljs.46.2023.08.11.08.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 08:30:29 -0700 (PDT)
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
X-Inumbo-ID: 01b0cecc-385c-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691767830; x=1692372630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fI2ZVaMDrZpSyLwoDOVGG7fcDBhoygERsDrcPH8BubI=;
        b=stoH+GNigL6REBlzbEEp65g+2vfqIAY6MED6LGambanWDO2LbEb/w6YRO9ev6OqD29
         HVfK12F/V3CT5+V23rUzveUdM6gFCBrraz1bhyiEYQpBvvCoP937YS4NkGMuc7Js/USz
         yhSgxprlWaqF7hh9wf/kSzfit2uLman7Grxj36LmBitiKwwifsU4pv0oVnP/cSyh/rsu
         Ypz7ZcHc2jeVyvJVRC3pVV6sPJIPWbtkDSZIYHVxNylrhoaYue0tRnDhB7pkv/blNdfT
         4uogYOFlSVrU5CUwZezSrYcGICWWLRZOMhjoT+jL9gy+thO228tQoqtmGQTroiulTiHF
         ryLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691767830; x=1692372630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fI2ZVaMDrZpSyLwoDOVGG7fcDBhoygERsDrcPH8BubI=;
        b=Qtntrpwuh6WDy8QlXYYY/zx6OPEMMt1y2hJgSCbuPT2N5liOVQlFa6c1FtU/evv3qQ
         L7v+3zUQW9ClEkBkkHL25iM88U9j5TM2GM7nszvQzbJua8anfoB5DR9+EzQ74rHD6ZN5
         MFl3JlPNuaTWVEu7thAUBiPK1x4PPm671ll3yp5YTLNM7FJ6iJOEVrxbd4lEB0HWFIAu
         J2LiRmbAQJlZ0/1qjeNWRK90WurAYM0yc0OaYslWoHGXVSfuykR2vaULEvwbVl/2+cAg
         nAcfJ1plEdDf4JHkqRBkLTACaU01STnZ1llUljrQkWKK3xqK0qJz51ImOtfUv10Ld6AU
         s3Dg==
X-Gm-Message-State: AOJu0YxtpZcFISJbNz+DlLjTxBR6AaQw9gyN75mM5pmZrYz4tbVqaRGc
	G1PTgr9xX/bbOZHHFL0rhIcZEvbY45k=
X-Google-Smtp-Source: AGHT+IESiU2Ql+sIRa/B2v/frnFoa91tdeDLibsC9cgtfMLrIjQgxt8/GqomXHDzQ9c424c2XCHrwQ==
X-Received: by 2002:a2e:7412:0:b0:2b6:c2e4:a57a with SMTP id p18-20020a2e7412000000b002b6c2e4a57amr1811158ljc.38.1691767830163;
        Fri, 11 Aug 2023 08:30:30 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] ns16550: add support for polling mode when device tree is used
Date: Fri, 11 Aug 2023 18:30:27 +0300
Message-ID: <88bd54876c745ef45eb740274fd36d747c7db471.1691767729.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V doesn't support interrupts for the time being, so it would be nice to
have polling mode.

To force poll mode it was added parsing of new 'poll' property under "com1="

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
Changes in V5:
 - Update xen-command-line.pandoc.
 - move poll check to ns16550_uart_dt_init as in case of device tree
   initialization it is needed only to check if 'poll' is present in com1.
 - Don't init uart->irq in case when platform_get_irq() return negative value.
---
Changes in V4:
 - fix code style for ns16550_irq().
 - partially revert changes in pci_uart_config().
 - add check of "poll" property under "com<N>=" instead of "console=".
 - remove seting of polling mode in parsing of msi in parse_positional().
 - update comment above opt_com1 about Configuration string of serial port.
---
 docs/misc/xen-command-line.pandoc |  7 +++-
 xen/drivers/char/ns16550.c        | 67 ++++++++++++++++++++-----------
 2 files changed, 49 insertions(+), 25 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 4060ebdc5d..67e355dab8 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -331,9 +331,12 @@ Interrupts.  Specifying zero disables CMCI handling.
 Flag to indicate whether to probe for a CMOS Real Time Clock irrespective of
 ACPI indicating none to be there.
 
+### com1 (device tree based initialization)
+> `= [poll]`
+
 ### com1 (x86)
 ### com2 (x86)
-> `= <baud>[/<base-baud>][,[DPS][,[<io-base>|pci|amt][,[<irq>|msi][,[<port-bdf>][,[<bridge-bdf>]]]]]]`
+> `= <baud>[/<base-baud>][,[DPS][,[<io-base>|pci|amt][,[<irq>|msi|poll][,[<port-bdf>][,[<bridge-bdf>]]]]]]`
 
 Both option `com1` and `com2` follow the same format.
 
@@ -353,7 +356,7 @@ Both option `com1` and `com2` follow the same format.
   * `S` is an integer 1 or 2 for the number of stop bits.
 * `<io-base>` is an integer which specifies the IO base port for UART
   registers.
-* `<irq>` is the IRQ number to use, or `0` to use the UART in poll
+* `<irq>` is the IRQ number to use, or `poll` to use the UART in poll
   mode only, or `msi` to set up a Message Signaled Interrupt.
 * `<port-bdf>` is the PCI location of the UART, in
   `<bus>:<device>.<function>` notation.
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 2aed6ec707..d8cfbbfae4 100644
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
@@ -1333,9 +1353,13 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
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
@@ -1374,19 +1398,6 @@ static void enable_exar_enhanced_bits(const struct ns16550 *uart)
 
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
@@ -1555,6 +1566,9 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
         }
         else
 #endif
+        if ( strncmp(conf, "poll", 4) == 0 )
+            uart->intr_works = polling;
+        else
             uart->irq = simple_strtol(conf, &conf, 10);
     }
 
@@ -1760,6 +1774,9 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
 
     ns16550_init_common(uart);
 
+    if ( strstr(opt_com1, "poll") )
+        uart->intr_works = polling;
+
     uart->baud      = BAUD_AUTO;
     uart->data_bits = 8;
     uart->parity    = UART_PARITY_NONE;
@@ -1791,9 +1808,13 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
     }
 
     res = platform_get_irq(dev, 0);
-    if ( ! res )
-        return -EINVAL;
-    uart->irq = res;
+    if ( res < 0 )
+    {
+        printk("there is no interrupt property, polling will be used\n");
+        uart->intr_works = polling;
+    }
+    else
+        uart->irq = res;
 
     uart->dw_usr_bsy = dt_device_is_compatible(dev, "snps,dw-apb-uart");
 
-- 
2.41.0


