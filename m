Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2792AA373C5
	for <lists+xen-devel@lfdr.de>; Sun, 16 Feb 2025 11:22:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889526.1298618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjbm4-0006dC-JR; Sun, 16 Feb 2025 10:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889526.1298618; Sun, 16 Feb 2025 10:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjbm4-0006bf-Fr; Sun, 16 Feb 2025 10:21:20 +0000
Received: by outflank-mailman (input) for mailman id 889526;
 Sun, 16 Feb 2025 10:21:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xtIa=VH=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tjbm3-0006bM-06
 for xen-devel@lists.xenproject.org; Sun, 16 Feb 2025 10:21:19 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1396aff-ec4f-11ef-9aa5-95dc52dad729;
 Sun, 16 Feb 2025 11:21:16 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-30613802a59so35338561fa.0
 for <xen-devel@lists.xenproject.org>; Sun, 16 Feb 2025 02:21:16 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30922dc69bdsm8474771fa.12.2025.02.16.02.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 02:21:13 -0800 (PST)
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
X-Inumbo-ID: c1396aff-ec4f-11ef-9aa5-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739701275; x=1740306075; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRW+p+c1YcSIlXoSB1dF2c2j1jxJB+KACYjBUjxzy7Y=;
        b=A/y7zR0IotluPHf8DolUYwzieV1iC2XQWlEcU+JgcsNnP2rlBtVCwqvfwsUbddDh4v
         cAJ/7wpBOlx4GfJktXiD+vOBdW+FlM+Yb1o7cdCaGKuyvaGuCsMka0InUdPeCj85avGu
         ds/drvs5ww58iUvZztS+lvU5FmgFiU+z/Hp663YzbzvqdpHqxoPr223TxvlJPi/EoDGA
         pO+lOOngj8klangEGC4KxFZ1MJe1q20jGxon5XzZUCxhZLm85McKFzQzO4rXwCZ9kVmq
         zroH+Hz+7panQT3q68o5slO449/nktS8s7CF6cUoBRGqLBmQwLFGEd8C+RaKMy4rZkpZ
         gmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739701275; x=1740306075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRW+p+c1YcSIlXoSB1dF2c2j1jxJB+KACYjBUjxzy7Y=;
        b=PuBmJfFUUDORslya2BnTN3LJwYxbDT+Jp+fzBT9KUY6Ygc3+/yuua+curWBp/R8mtz
         pi6u9pWnUUIXNm7/6FrPlqRGFjJlvLrdpQ4mFYqpUlqeAfJj9MtUMzZ1qV7LPtUA2ewh
         fA2qemXW/WzixVDDRWE3dTyOj66dmiEqVeE2wQ9YgkWskoutgHkI0lcAaG2mQvPXCGB1
         rGgvb1NqPUz/E+33XSL8w7AH2IBW5xUL8H9AYpnRZaplSTq/OWfb/ZQo7Tx8uAEd9az+
         Uoajmv21TAp70mUOR1BPdwySaZbWh1XlUHx8ZfKzvdn1gGMWqAwy9rRcoAlTiJC9TsIl
         +n6g==
X-Gm-Message-State: AOJu0YwRCCg4LhkljfjhyuIT+Vg0jfVYL88l32hgmY0pOQ5S9nJI/jGq
	RadgCGjg5ZKp1BNm0Y7suaA0OY7V+00ehzn3ti9Xfxlp9aYDPO2tOWU/Vw==
X-Gm-Gg: ASbGncuKEMngF2bsYdwJgiLeaLIa/zFRe7tOD6NDVv00wXVdYXXvoJZqhWaUhT+gORL
	QOkcnU0B2mE/evn2SrQhtZHTME3UHPOhVMunpMd7OL1bJzV6RmrhjDb5MpciaQj3pwBOUCGRDgw
	iRIVBGeQNYwbHdJse61AGUVKcSdSkMk+SpGGkNwdQ8+EfZL5QmvqEd3LWbTd+GCwrwnlNxMDotk
	kt0OmQusdgiPHc02DNviOJctrC3WBdw+FduvEISIpSGsjb411deQ+t29HpOedlywgLUjM4uTXvy
	7nUN+O1DdnViQ7FmO3GGd9t3
X-Google-Smtp-Source: AGHT+IEoQxVIvohRuMFtlgu3WL4MsClFFIFozhEROt/gSH4MWlSd3Rl7pAH8lvLnjD6ib7cENqlUQA==
X-Received: by 2002:a2e:9dca:0:b0:308:e5e8:9d4c with SMTP id 38308e7fff4ca-30927ad57camr16045381fa.28.1739701274897;
        Sun, 16 Feb 2025 02:21:14 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andr2000@gmail.com,
	sstabellini@kernel.org,
	Artem_Mygaiev@epam.com,
	jbeulich@suse.com,
	Luca.Fancellu@arm.com,
	roger.pau@citrix.com,
	marmarek@invisiblethingslab.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech
Subject: [PATCH 1/2] code style: Format ns16550 driver
Date: Sun, 16 Feb 2025 12:21:07 +0200
Message-Id: <20250216102108.2665222-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250216102108.2665222-1-andr2000@gmail.com>
References: <20250216102108.2665222-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use .clang-format to format ns16550 driver.

Signed-off-by: Oleksandr Andrushchenko <andr2000@gmail.com>
---
 xen/drivers/char/ns16550.c | 761 ++++++++++++++++++-------------------
 1 file changed, 378 insertions(+), 383 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index eaeb0e09d01e..0f605c98b036 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -14,7 +14,7 @@
  * abstracted.
  */
 #if defined(CONFIG_HAS_PCI) && defined(CONFIG_X86)
-# define NS16550_PCI
+#define NS16550_PCI
 #endif
 
 #include <xen/console.h>
@@ -43,12 +43,12 @@
 
 static struct ns16550 {
     int baud, clock_hz, data_bits, parity, stop_bits, fifo_size, irq;
-    u64 io_base;   /* I/O port or memory-mapped I/O address. */
+    u64 io_base; /* I/O port or memory-mapped I/O address. */
     u64 io_size;
     int reg_shift; /* Bits to shift register offset by */
     int reg_width; /* Size of access to use, the registers
                     * themselves are still bytes */
-    char __iomem *remapped_io_base;  /* Remapped virtual address of MMIO. */
+    char __iomem *remapped_io_base; /* Remapped virtual address of MMIO. */
     /* UART with IRQ line: interrupt-driven I/O. */
     struct irqaction irqaction;
     u8 lsr_mask;
@@ -63,8 +63,8 @@ static struct ns16550 {
     bool dw_usr_bsy;
 #ifdef NS16550_PCI
     /* PCI card parameters. */
-    bool pb_bdf_enable;     /* if =1, pb-bdf effective, port behind bridge */
-    bool ps_bdf_enable;     /* if =1, ps_bdf effective, port on pci card */
+    bool pb_bdf_enable; /* if =1, pb-bdf effective, port behind bridge */
+    bool ps_bdf_enable; /* if =1, ps_bdf effective, port on pci card */
     unsigned int pb_bdf[3]; /* pci bridge BDF */
     unsigned int ps_bdf[3]; /* pci serial port BDF */
     u32 bar;
@@ -80,6 +80,7 @@ static struct ns16550 {
 struct ns16550_config {
     u16 vendor_id;
     u16 dev_id;
+
     enum {
         param_default, /* Must not be referenced by any table entry. */
         param_trumanage,
@@ -227,7 +228,7 @@ static void cf_check __ns16550_poll(const struct cpu_user_regs *regs)
         serial_rx_interrupt(port);
     }
 
-    if ( ( ns_read_reg(uart, UART_LSR) & uart->lsr_mask ) == uart->lsr_mask )
+    if ( (ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask )
         serial_tx_interrupt(port);
 
 out:
@@ -248,8 +249,9 @@ static int cf_check ns16550_tx_ready(struct serial_port *port)
     if ( ns16550_ioport_invalid(uart) )
         return -EIO;
 
-    return ( (ns_read_reg(uart, UART_LSR) &
-              uart->lsr_mask ) == uart->lsr_mask ) ? uart->fifo_size : 0;
+    return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
+               ? uart->fifo_size
+               : 0;
 }
 
 static void cf_check ns16550_putc(struct serial_port *port, char c)
@@ -263,7 +265,7 @@ static int cf_check ns16550_getc(struct serial_port *port, char *pc)
     struct ns16550 *uart = port->uart;
 
     if ( ns16550_ioport_invalid(uart) ||
-        !(ns_read_reg(uart, UART_LSR) & UART_LSR_DR) )
+         !(ns_read_reg(uart, UART_LSR) & UART_LSR_DR) )
         return 0;
 
     *pc = ns_read_reg(uart, UART_RBR);
@@ -275,9 +277,10 @@ static void pci_serial_early_init(struct ns16550 *uart)
 #ifdef NS16550_PCI
     if ( uart->bar && uart->io_base >= 0x10000 )
     {
-        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                                  uart->ps_bdf[2]),
-                         PCI_COMMAND, PCI_COMMAND_MEMORY);
+        pci_conf_write16(
+            PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1], uart->ps_bdf[2]),
+            PCI_COMMAND,
+            PCI_COMMAND_MEMORY);
         return;
     }
 
@@ -285,26 +288,26 @@ static void pci_serial_early_init(struct ns16550 *uart)
         return;
 
     if ( uart->pb_bdf_enable )
-        pci_conf_write16(PCI_SBDF(0, uart->pb_bdf[0], uart->pb_bdf[1],
-                                  uart->pb_bdf[2]),
-                         PCI_IO_BASE,
-                         (uart->io_base & 0xF000) |
-                         ((uart->io_base & 0xF000) >> 8));
-
-    pci_conf_write32(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                              uart->ps_bdf[2]),
-                     PCI_BASE_ADDRESS_0,
-                     uart->io_base | PCI_BASE_ADDRESS_SPACE_IO);
-    pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                              uart->ps_bdf[2]),
-                     PCI_COMMAND, PCI_COMMAND_IO);
+        pci_conf_write16(
+            PCI_SBDF(0, uart->pb_bdf[0], uart->pb_bdf[1], uart->pb_bdf[2]),
+            PCI_IO_BASE,
+            (uart->io_base & 0xF000) | ((uart->io_base & 0xF000) >> 8));
+
+    pci_conf_write32(
+        PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1], uart->ps_bdf[2]),
+        PCI_BASE_ADDRESS_0,
+        uart->io_base | PCI_BASE_ADDRESS_SPACE_IO);
+    pci_conf_write16(
+        PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1], uart->ps_bdf[2]),
+        PCI_COMMAND,
+        PCI_COMMAND_IO);
 #endif
 }
 
 static void ns16550_setup_preirq(struct ns16550 *uart)
 {
     unsigned char lcr;
-    unsigned int  divisor;
+    unsigned int divisor;
 
     uart->intr_works = 0;
 
@@ -335,14 +338,14 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
     else
     {
         /* Baud rate already set: read it out from the divisor latch. */
-        divisor  = ns_read_reg(uart, UART_DLL);
+        divisor = ns_read_reg(uart, UART_DLL);
         divisor |= ns_read_reg(uart, UART_DLM) << 8;
         if ( divisor )
             uart->baud = uart->clock_hz / (divisor << 4);
         else
-            printk(XENLOG_ERR
-                   "Automatic baud rate determination was requested,"
-                   " but a baud rate was not set up\n");
+            printk(
+                XENLOG_ERR
+                "Automatic baud rate determination was requested," " but a baud rate was not set up\n");
     }
     ns_write_reg(uart, UART_LCR, lcr);
 
@@ -350,8 +353,10 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
     ns_write_reg(uart, UART_MCR, UART_MCR_DTR | UART_MCR_RTS);
 
     /* Enable and clear the FIFOs. Set a large trigger threshold. */
-    ns_write_reg(uart, UART_FCR,
-                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
+    ns_write_reg(uart,
+                 UART_FCR,
+                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
+                     UART_FCR_TRG14);
 }
 
 static void __init cf_check ns16550_init_preirq(struct serial_port *port)
@@ -399,7 +404,8 @@ static void ns16550_setup_postirq(struct ns16550 *uart)
     {
         /* Master interrupt enable; also keep DTR/RTS asserted. */
         ns_write_reg(uart,
-                     UART_MCR, UART_MCR_OUT2 | UART_MCR_DTR | UART_MCR_RTS);
+                     UART_MCR,
+                     UART_MCR_OUT2 | UART_MCR_DTR | UART_MCR_RTS);
 
         /* Enable receive interrupts. */
         ns_write_reg(uart, UART_IER, UART_IER_ERDAI);
@@ -424,31 +430,37 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
 
     /* Calculate time to fill RX FIFO and/or empty TX FIFO for polling. */
     bits = uart->data_bits + uart->stop_bits + !!uart->parity;
-    uart->timeout_ms = max_t(
-        unsigned int, 1, (bits * uart->fifo_size * 1000) / uart->baud);
+    uart->timeout_ms =
+        max_t(unsigned int, 1, (bits * uart->fifo_size * 1000) / uart->baud);
 
 #ifdef NS16550_PCI
     if ( uart->bar || uart->ps_bdf_enable )
     {
         if ( uart->param && uart->param->mmio &&
-             rangeset_add_range(mmio_ro_ranges, PFN_DOWN(uart->io_base),
+             rangeset_add_range(mmio_ro_ranges,
+                                PFN_DOWN(uart->io_base),
                                 PFN_UP(uart->io_base + uart->io_size) - 1) )
-            printk(XENLOG_INFO "Error while adding MMIO range of device to mmio_ro_ranges\n");
+            printk(
+                XENLOG_INFO
+                "Error while adding MMIO range of device to mmio_ro_ranges\n");
 
-        if ( pci_ro_device(0, uart->ps_bdf[0],
+        if ( pci_ro_device(0,
+                           uart->ps_bdf[0],
                            PCI_DEVFN(uart->ps_bdf[1], uart->ps_bdf[2])) )
-            printk(XENLOG_INFO "Could not mark config space of %02x:%02x.%u read-only.\n",
-                   uart->ps_bdf[0], uart->ps_bdf[1],
+            printk(XENLOG_INFO
+                   "Could not mark config space of %02x:%02x.%u read-only.\n",
+                   uart->ps_bdf[0],
+                   uart->ps_bdf[1],
                    uart->ps_bdf[2]);
 
         if ( uart->msi )
         {
-            struct msi_info msi = {
-                .sbdf = PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                                 uart->ps_bdf[2]),
-                .irq = uart->irq,
-                .entry_nr = 1
-            };
+            struct msi_info msi = { .sbdf = PCI_SBDF(0,
+                                                     uart->ps_bdf[0],
+                                                     uart->ps_bdf[1],
+                                                     uart->ps_bdf[2]),
+                                    .irq = uart->irq,
+                                    .entry_nr = 1 };
 
             rc = uart->irq;
 
@@ -489,7 +501,10 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
             if ( rc )
                 printk(XENLOG_WARNING
                        "MSI setup failed (%d) for %02x:%02x.%o\n",
-                       rc, uart->ps_bdf[0], uart->ps_bdf[1], uart->ps_bdf[2]);
+                       rc,
+                       uart->ps_bdf[0],
+                       uart->ps_bdf[1],
+                       uart->ps_bdf[2]);
         }
     }
 #endif
@@ -497,8 +512,8 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
     if ( uart->irq > 0 )
     {
         uart->irqaction.handler = ns16550_interrupt;
-        uart->irqaction.name    = "ns16550";
-        uart->irqaction.dev_id  = port;
+        uart->irqaction.name = "ns16550";
+        uart->irqaction.dev_id = port;
         if ( (rc = setup_irq(uart->irq, 0, &uart->irqaction)) != 0 )
             printk("ERROR: Failed to allocate ns16550 IRQ %d\n", uart->irq);
     }
@@ -514,8 +529,9 @@ static void cf_check ns16550_suspend(struct serial_port *port)
 
 #ifdef NS16550_PCI
     if ( uart->bar )
-       uart->cr = pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                                  uart->ps_bdf[2]), PCI_COMMAND);
+        uart->cr = pci_conf_read16(
+            PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1], uart->ps_bdf[2]),
+            PCI_COMMAND);
 #endif
 }
 
@@ -526,19 +542,22 @@ static void _ns16550_resume(struct serial_port *port)
 
     if ( uart->bar )
     {
-       pci_conf_write32(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                                 uart->ps_bdf[2]),
-                        PCI_BASE_ADDRESS_0 + uart->bar_idx*4, uart->bar);
+        pci_conf_write32(
+            PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1], uart->ps_bdf[2]),
+            PCI_BASE_ADDRESS_0 + uart->bar_idx * 4,
+            uart->bar);
 
         /* If 64 bit BAR, write higher 32 bits to BAR+4 */
         if ( uart->bar & PCI_BASE_ADDRESS_MEM_TYPE_64 )
-            pci_conf_write32(PCI_SBDF(0, uart->ps_bdf[0],  uart->ps_bdf[1],
-                                      uart->ps_bdf[2]),
-                        PCI_BASE_ADDRESS_0 + (uart->bar_idx+1)*4, uart->bar64);
-
-       pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
-                                 uart->ps_bdf[2]),
-                        PCI_COMMAND, uart->cr);
+            pci_conf_write32(
+                PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1], uart->ps_bdf[2]),
+                PCI_BASE_ADDRESS_0 + (uart->bar_idx + 1) * 4,
+                uart->bar64);
+
+        pci_conf_write16(
+            PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1], uart->ps_bdf[2]),
+            PCI_COMMAND,
+            uart->cr);
     }
 #endif
 
@@ -547,6 +566,7 @@ static void _ns16550_resume(struct serial_port *port)
 }
 
 static int delayed_resume_tries;
+
 static void cf_check ns16550_delayed_resume(void *data)
 {
     struct serial_port *port = data;
@@ -634,32 +654,32 @@ static const struct vuart_info *ns16550_vuart_info(struct serial_port *port)
 #endif
 
 static struct uart_driver __read_mostly ns16550_driver = {
-    .init_preirq  = ns16550_init_preirq,
-    .init_irq     = ns16550_init_irq,
+    .init_preirq = ns16550_init_preirq,
+    .init_irq = ns16550_init_irq,
     .init_postirq = ns16550_init_postirq,
-    .endboot      = ns16550_endboot,
-    .suspend      = ns16550_suspend,
-    .resume       = ns16550_resume,
-    .tx_ready     = ns16550_tx_ready,
-    .putc         = ns16550_putc,
-    .getc         = ns16550_getc,
-    .irq          = ns16550_irq,
-    .start_tx     = ns16550_start_tx,
-    .stop_tx      = ns16550_stop_tx,
+    .endboot = ns16550_endboot,
+    .suspend = ns16550_suspend,
+    .resume = ns16550_resume,
+    .tx_ready = ns16550_tx_ready,
+    .putc = ns16550_putc,
+    .getc = ns16550_getc,
+    .irq = ns16550_irq,
+    .start_tx = ns16550_start_tx,
+    .stop_tx = ns16550_stop_tx,
 #ifdef CONFIG_ARM
-    .vuart_info   = ns16550_vuart_info,
+    .vuart_info = ns16550_vuart_info,
 #endif
 };
 
 static void ns16550_init_common(struct ns16550 *uart)
 {
-    uart->clock_hz  = UART_CLOCK_HZ;
+    uart->clock_hz = UART_CLOCK_HZ;
 
     /* Default is no transmit FIFO. */
     uart->fifo_size = 1;
 
     /* Default lsr_mask = UART_LSR_THRE */
-    uart->lsr_mask  = UART_LSR_THRE;
+    uart->lsr_mask = UART_LSR_THRE;
 }
 
 #ifdef CONFIG_X86
@@ -670,13 +690,13 @@ static int __init parse_parity_char(int c)
     {
     case 'n':
         return UART_PARITY_NONE;
-    case 'o': 
+    case 'o':
         return UART_PARITY_ODD;
-    case 'e': 
+    case 'e':
         return UART_PARITY_EVEN;
-    case 'm': 
+    case 'm':
         return UART_PARITY_MARK;
-    case 's': 
+    case 's':
         return UART_PARITY_SPACE;
     }
     return 0;
@@ -711,7 +731,7 @@ static int __init check_existence(struct ns16550 *uart)
      * 16C754B) allow only to modify them if an EFR bit is set.
      */
     scratch2 = ns_read_reg(uart, UART_IER) & 0x0f;
-    ns_write_reg(uart,UART_IER, 0x0F);
+    ns_write_reg(uart, UART_IER, 0x0F);
     scratch3 = ns_read_reg(uart, UART_IER) & 0x0f;
     ns_write_reg(uart, UART_IER, scratch);
     if ( (scratch2 != 0) || (scratch3 != 0x0F) )
@@ -849,336 +869,293 @@ static const struct ns16550_config_param __initconst uart_param[] = {
     },
 };
 
-static const struct ns16550_config __initconst uart_config[] =
-{
+static const struct ns16550_config __initconst uart_config[] = {
     /* Broadcom TruManage device */
     {
-        .vendor_id = PCI_VENDOR_ID_BROADCOM,
-        .dev_id = 0x160a,
-        .param = param_trumanage,
-    },
+     .vendor_id = PCI_VENDOR_ID_BROADCOM,
+     .dev_id = 0x160a,
+     .param = param_trumanage,
+     },
     /* OXPCIe952 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc11b,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc11b,
+     .param = param_oxford,
+     },
     /* OXPCIe952 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc11f,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc11f,
+     .param = param_oxford,
+     },
     /* OXPCIe952 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc138,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc138,
+     .param = param_oxford,
+     },
     /* OXPCIe952 2 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc158,
-        .param = param_oxford_2port,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc158,
+     .param = param_oxford_2port,
+     },
     /* OXPCIe952 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc13d,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc13d,
+     .param = param_oxford,
+     },
     /* OXPCIe952 2 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc15d,
-        .param = param_oxford_2port,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc15d,
+     .param = param_oxford_2port,
+     },
     /* OXPCIe952 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc40b,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc40b,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc40f,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc40f,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc41b,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc41b,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc41f,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc41f,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc42b,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc42b,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc42f,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc42f,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc43b,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc43b,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc43f,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc43f,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc44b,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc44b,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc44f,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc44f,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc45b,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc45b,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc45f,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc45f,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc46b,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc46b,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc46f,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc46f,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc47b,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc47b,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc47f,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc47f,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc48b,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc48b,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc48f,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc48f,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc49b,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc49b,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc49f,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc49f,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc4ab,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc4ab,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc4af,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc4af,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc4bb,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc4bb,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc4bf,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc4bf,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc4cb,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc4cb,
+     .param = param_oxford,
+     },
     /* OXPCIe200 1 Native UART  */
     {
-        .vendor_id = PCI_VENDOR_ID_OXSEMI,
-        .dev_id = 0xc4cf,
-        .param = param_oxford,
-    },
+     .vendor_id = PCI_VENDOR_ID_OXSEMI,
+     .dev_id = 0xc4cf,
+     .param = param_oxford,
+     },
     /* Pericom PI7C9X7951 Uno UART */
-    {
-        .vendor_id = PCI_VENDOR_ID_PERICOM,
-        .dev_id = 0x7951,
-        .param = param_pericom_1port
-    },
+    { .vendor_id = PCI_VENDOR_ID_PERICOM,
+     .dev_id = 0x7951,
+     .param = param_pericom_1port },
     /* Pericom PI7C9X7952 Duo UART */
-    {
-        .vendor_id = PCI_VENDOR_ID_PERICOM,
-        .dev_id = 0x7952,
-        .param = param_pericom_2port
-    },
+    { .vendor_id = PCI_VENDOR_ID_PERICOM,
+     .dev_id = 0x7952,
+     .param = param_pericom_2port },
     /* Pericom PI7C9X7954 Quad UART */
-    {
-        .vendor_id = PCI_VENDOR_ID_PERICOM,
-        .dev_id = 0x7954,
-        .param = param_pericom_4port
-    },
+    { .vendor_id = PCI_VENDOR_ID_PERICOM,
+     .dev_id = 0x7954,
+     .param = param_pericom_4port },
     /* Pericom PI7C9X7958 Octal UART */
-    {
-        .vendor_id = PCI_VENDOR_ID_PERICOM,
-        .dev_id = 0x7958,
-        .param = param_pericom_8port
-    },
+    { .vendor_id = PCI_VENDOR_ID_PERICOM,
+     .dev_id = 0x7958,
+     .param = param_pericom_8port },
     /* Exar Corp. XR17V352 Dual PCIe UART */
-    {
-        .vendor_id = PCI_VENDOR_ID_EXAR,
-        .dev_id = 0x0352,
-        .param = param_exar_xr17v352
-    },
+    { .vendor_id = PCI_VENDOR_ID_EXAR,
+     .dev_id = 0x0352,
+     .param = param_exar_xr17v352 },
     /* Exar Corp. XR17V354 Quad PCIe UART */
-    {
-        .vendor_id = PCI_VENDOR_ID_EXAR,
-        .dev_id = 0x0354,
-        .param = param_exar_xr17v354
-    },
+    { .vendor_id = PCI_VENDOR_ID_EXAR,
+     .dev_id = 0x0354,
+     .param = param_exar_xr17v354 },
     /* Exar Corp. XR17V358 Octal PCIe UART */
-    {
-        .vendor_id = PCI_VENDOR_ID_EXAR,
-        .dev_id = 0x0358,
-        .param = param_exar_xr17v358
-    },
+    { .vendor_id = PCI_VENDOR_ID_EXAR,
+     .dev_id = 0x0358,
+     .param = param_exar_xr17v358 },
     /* Intel Corp. TGL-LP LPSS PCI UART #0 */
-    {
-        .vendor_id = PCI_VENDOR_ID_INTEL,
-        .dev_id = 0xa0a8,
-        .param = param_intel_lpss
-    },
+    { .vendor_id = PCI_VENDOR_ID_INTEL,
+     .dev_id = 0xa0a8,
+     .param = param_intel_lpss },
     /* Intel Corp. TGL-LP LPSS PCI UART #1 */
-    {
-        .vendor_id = PCI_VENDOR_ID_INTEL,
-        .dev_id = 0xa0a9,
-        .param = param_intel_lpss
-    },
+    { .vendor_id = PCI_VENDOR_ID_INTEL,
+     .dev_id = 0xa0a9,
+     .param = param_intel_lpss },
     /* Intel Corp. TGL-LP LPSS PCI UART #2 */
-    {
-        .vendor_id = PCI_VENDOR_ID_INTEL,
-        .dev_id = 0xa0c7,
-        .param = param_intel_lpss
-    },
+    { .vendor_id = PCI_VENDOR_ID_INTEL,
+     .dev_id = 0xa0c7,
+     .param = param_intel_lpss },
     /* Intel Corp. TGL-H LPSS PCI UART #0 */
-    {
-        .vendor_id = PCI_VENDOR_ID_INTEL,
-        .dev_id = 0x43a8,
-        .param = param_intel_lpss
-    },
+    { .vendor_id = PCI_VENDOR_ID_INTEL,
+     .dev_id = 0x43a8,
+     .param = param_intel_lpss },
     /* Intel Corp. TGL-H LPSS PCI UART #1 */
-    {
-        .vendor_id = PCI_VENDOR_ID_INTEL,
-        .dev_id = 0x43a9,
-        .param = param_intel_lpss
-    },
+    { .vendor_id = PCI_VENDOR_ID_INTEL,
+     .dev_id = 0x43a9,
+     .param = param_intel_lpss },
     /* Intel Corp. TGL-H LPSS PCI UART #2 */
-    {
-        .vendor_id = PCI_VENDOR_ID_INTEL,
-        .dev_id = 0x43a7,
-        .param = param_intel_lpss
-    },
+    { .vendor_id = PCI_VENDOR_ID_INTEL,
+     .dev_id = 0x43a7,
+     .param = param_intel_lpss },
     /* Intel Corp. ADL-P LPSS PCI UART #0 */
-    {
-        .vendor_id = PCI_VENDOR_ID_INTEL,
-        .dev_id = 0x51a8,
-        .param = param_intel_lpss
-    },
+    { .vendor_id = PCI_VENDOR_ID_INTEL,
+     .dev_id = 0x51a8,
+     .param = param_intel_lpss },
     /* Intel Corp. ADL-P LPSS PCI UART #1 */
-    {
-        .vendor_id = PCI_VENDOR_ID_INTEL,
-        .dev_id = 0x51a9,
-        .param = param_intel_lpss
-    },
+    { .vendor_id = PCI_VENDOR_ID_INTEL,
+     .dev_id = 0x51a9,
+     .param = param_intel_lpss },
     /* Intel Corp. ADL-P LPSS PCI UART #2 */
-    {
-        .vendor_id = PCI_VENDOR_ID_INTEL,
-        .dev_id = 0x51c7,
-        .param = param_intel_lpss
-    },
+    { .vendor_id = PCI_VENDOR_ID_INTEL,
+     .dev_id = 0x51c7,
+     .param = param_intel_lpss },
     /* Intel Corp. ADL-P LPSS PCI UART #3 */
-    {
-        .vendor_id = PCI_VENDOR_ID_INTEL,
-        .dev_id = 0x51da,
-        .param = param_intel_lpss
-    },
+    { .vendor_id = PCI_VENDOR_ID_INTEL,
+     .dev_id = 0x51da,
+     .param = param_intel_lpss },
     /* Intel Corp. ADL-S LPSS PCI UART #0 */
-    {
-        .vendor_id = PCI_VENDOR_ID_INTEL,
-        .dev_id = 0x7aa8,
-        .param = param_intel_lpss
-    },
+    { .vendor_id = PCI_VENDOR_ID_INTEL,
+     .dev_id = 0x7aa8,
+     .param = param_intel_lpss },
     /* Intel Corp. ADL-S LPSS PCI UART #1 */
-    {
-        .vendor_id = PCI_VENDOR_ID_INTEL,
-        .dev_id = 0x7aa9,
-        .param = param_intel_lpss
-    },
+    { .vendor_id = PCI_VENDOR_ID_INTEL,
+     .dev_id = 0x7aa9,
+     .param = param_intel_lpss },
     /* Intel Corp. ADL-S LPSS PCI UART #2 */
-    {
-        .vendor_id = PCI_VENDOR_ID_INTEL,
-        .dev_id = 0x7afe,
-        .param = param_intel_lpss
-    },
+    { .vendor_id = PCI_VENDOR_ID_INTEL,
+     .dev_id = 0x7afe,
+     .param = param_intel_lpss },
     /* Intel Corp. ADL-S LPSS PCI UART #3 */
-    {
-        .vendor_id = PCI_VENDOR_ID_INTEL,
-        .dev_id = 0x7adc,
-        .param = param_intel_lpss
-    },
+    { .vendor_id = PCI_VENDOR_ID_INTEL,
+     .dev_id = 0x7adc,
+     .param = param_intel_lpss },
 };
 
-static int __init
-pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
+static int __init pci_uart_config(struct ns16550 *uart, bool skip_amt,
+                                  unsigned int idx)
 {
     u64 orig_base = uart->io_base;
     unsigned int b, d, f, nextf, i;
@@ -1197,7 +1174,9 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
 
                 nextf = (f || (pci_conf_read16(PCI_SBDF(0, b, d, f),
                                                PCI_HEADER_TYPE) &
-                               0x80)) ? f + 1 : 8;
+                               0x80))
+                            ? f + 1
+                            : 8;
 
                 switch ( pci_conf_read16(PCI_SBDF(0, b, d, f),
                                          PCI_CLASS_DEVICE) )
@@ -1250,24 +1229,30 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
                 if ( param->mmio && !(bar & PCI_BASE_ADDRESS_SPACE_IO) )
                 {
                     pci_conf_write32(PCI_SBDF(0, b, d, f),
-                                     PCI_BASE_ADDRESS_0 + bar_idx*4, ~0u);
+                                     PCI_BASE_ADDRESS_0 + bar_idx * 4,
+                                     ~0u);
                     len = pci_conf_read32(PCI_SBDF(0, b, d, f),
                                           PCI_BASE_ADDRESS_0 + bar_idx * 4);
                     pci_conf_write32(PCI_SBDF(0, b, d, f),
-                                     PCI_BASE_ADDRESS_0 + bar_idx*4, bar);
+                                     PCI_BASE_ADDRESS_0 + bar_idx * 4,
+                                     bar);
 
                     /* Handle 64 bit BAR if found */
                     if ( bar & PCI_BASE_ADDRESS_MEM_TYPE_64 )
                     {
                         bar_64 = pci_conf_read32(PCI_SBDF(0, b, d, f),
-                                      PCI_BASE_ADDRESS_0 + (bar_idx + 1) * 4);
+                                                 PCI_BASE_ADDRESS_0 +
+                                                     (bar_idx + 1) * 4);
                         pci_conf_write32(PCI_SBDF(0, b, d, f),
-                                    PCI_BASE_ADDRESS_0 + (bar_idx+1)*4, ~0u);
+                                         PCI_BASE_ADDRESS_0 + (bar_idx + 1) * 4,
+                                         ~0u);
                         len_64 = pci_conf_read32(PCI_SBDF(0, b, d, f),
-                                    PCI_BASE_ADDRESS_0 + (bar_idx + 1) * 4);
+                                                 PCI_BASE_ADDRESS_0 +
+                                                     (bar_idx + 1) * 4);
                         pci_conf_write32(PCI_SBDF(0, b, d, f),
-                                    PCI_BASE_ADDRESS_0 + (bar_idx+1)*4, bar_64);
-                        size  = ((u64)~0 << 32) | PCI_BASE_ADDRESS_MEM_MASK;
+                                         PCI_BASE_ADDRESS_0 + (bar_idx + 1) * 4,
+                                         bar_64);
+                        size = ((u64)~0 << 32) | PCI_BASE_ADDRESS_MEM_MASK;
                         size &= ((u64)len_64 << 32) | len;
                     }
                     else
@@ -1280,11 +1265,13 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
                 else if ( !param->mmio && (bar & PCI_BASE_ADDRESS_SPACE_IO) )
                 {
                     pci_conf_write32(PCI_SBDF(0, b, d, f),
-                                     PCI_BASE_ADDRESS_0 + bar_idx*4, ~0u);
+                                     PCI_BASE_ADDRESS_0 + bar_idx * 4,
+                                     ~0u);
                     len = pci_conf_read32(PCI_SBDF(0, b, d, f),
                                           PCI_BASE_ADDRESS_0);
                     pci_conf_write32(PCI_SBDF(0, b, d, f),
-                                     PCI_BASE_ADDRESS_0 + bar_idx*4, bar);
+                                     PCI_BASE_ADDRESS_0 + bar_idx * 4,
+                                     bar);
                     size = len & PCI_BASE_ADDRESS_IO_MASK;
 
                     uart->io_base = bar & ~PCI_BASE_ADDRESS_SPACE_IO;
@@ -1301,8 +1288,8 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
                  * 8 bytes times (1 << reg_shift).
                  */
                 if ( size < param->first_offset +
-                            port_idx * param->uart_offset +
-                            (8 << param->reg_shift) )
+                                port_idx * param->uart_offset +
+                                (8 << param->reg_shift) )
                     continue;
 
                 uart->param = param;
@@ -1323,12 +1310,12 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
                 uart->bar_idx = bar_idx;
                 uart->bar = bar;
                 uart->bar64 = bar_64;
-                uart->io_size = max(8U << param->reg_shift,
-                                    param->uart_offset);
+                uart->io_size = max(8U << param->reg_shift, param->uart_offset);
                 uart->irq = pci_conf_read8(PCI_SBDF(0, b, d, f),
-                                           PCI_INTERRUPT_PIN) ?
-                            pci_conf_read8(PCI_SBDF(0, b, d, f),
-                                           PCI_INTERRUPT_LINE) : 0;
+                                           PCI_INTERRUPT_PIN)
+                                ? pci_conf_read8(PCI_SBDF(0, b, d, f),
+                                                 PCI_INTERRUPT_LINE)
+                                : 0;
 
 #ifdef CONFIG_X86
                 /*
@@ -1422,19 +1409,19 @@ struct serial_param_var {
  * com_console_options for serial port com1 and com2.
  */
 static const struct serial_param_var __initconst sp_vars[] = {
-    {"baud", baud_rate},
-    {"clock-hz", clock_hz},
-    {"data-bits", data_bits},
-    {"io-base", io_base},
-    {"irq", irq},
-    {"parity", parity},
-    {"reg-shift", reg_shift},
-    {"reg-width", reg_width},
-    {"stop-bits", stop_bits},
+    { "baud",      baud_rate  },
+    { "clock-hz",  clock_hz   },
+    { "data-bits", data_bits  },
+    { "io-base",   io_base    },
+    { "irq",       irq        },
+    { "parity",    parity     },
+    { "reg-shift", reg_shift  },
+    { "reg-width", reg_width  },
+    { "stop-bits", stop_bits  },
 #ifdef CONFIG_HAS_PCI
-    {"bridge", bridge_bdf},
-    {"dev", device},
-    {"port", port_bdf},
+    { "bridge",    bridge_bdf },
+    { "dev",       device     },
+    { "port",      port_bdf   },
 #endif
 };
 
@@ -1476,7 +1463,6 @@ static enum __init serial_param_type get_token(char *token, char **value)
         return false;                        \
     } while ( 0 )
 
-
 static bool __init parse_positional(struct ns16550 *uart, char **str)
 {
     int baud;
@@ -1533,7 +1519,7 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
 #ifdef CONFIG_HAS_PCI
         if ( strncmp(conf, "pci", 3) == 0 )
         {
-            if ( pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com) )
+            if ( pci_uart_config(uart, 1 /* skip AMT */, uart - ns16550_com) )
                 return true;
             conf += 3;
         }
@@ -1567,8 +1553,11 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
 #ifdef CONFIG_HAS_PCI
     if ( *conf == ',' && *++conf != ',' )
     {
-        conf = parse_pci(conf, NULL, &uart->ps_bdf[0],
-                         &uart->ps_bdf[1], &uart->ps_bdf[2]);
+        conf = parse_pci(conf,
+                         NULL,
+                         &uart->ps_bdf[0],
+                         &uart->ps_bdf[1],
+                         &uart->ps_bdf[2]);
         if ( !conf )
             PARSE_ERR_RET("Bad port PCI coordinates");
         uart->ps_bdf_enable = true;
@@ -1576,8 +1565,11 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
 
     if ( *conf == ',' && *++conf != ',' )
     {
-        if ( !parse_pci(conf, NULL, &uart->pb_bdf[0],
-                        &uart->pb_bdf[1], &uart->pb_bdf[2]) )
+        if ( !parse_pci(conf,
+                        NULL,
+                        &uart->pb_bdf[0],
+                        &uart->pb_bdf[1],
+                        &uart->pb_bdf[2]) )
             PARSE_ERR_RET("Bad bridge PCI coordinates");
         uart->pb_bdf_enable = true;
     }
@@ -1648,7 +1640,7 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
         case device:
             if ( strncmp(param_value, "pci", 3) == 0 )
             {
-                pci_uart_config(uart, 1/* skip AMT */, uart - ns16550_com);
+                pci_uart_config(uart, 1 /* skip AMT */, uart - ns16550_com);
                 dev_set = true;
             }
             else if ( strncmp(param_value, "amt", 3) == 0 )
@@ -1659,15 +1651,21 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
             break;
 
         case port_bdf:
-            if ( !parse_pci(param_value, NULL, &uart->ps_bdf[0],
-                            &uart->ps_bdf[1], &uart->ps_bdf[2]) )
+            if ( !parse_pci(param_value,
+                            NULL,
+                            &uart->ps_bdf[0],
+                            &uart->ps_bdf[1],
+                            &uart->ps_bdf[2]) )
                 PARSE_ERR_RET("Bad port PCI coordinates\n");
             uart->ps_bdf_enable = true;
             break;
 
         case bridge_bdf:
-            if ( !parse_pci(param_value, NULL, &uart->pb_bdf[0],
-                            &uart->pb_bdf[1], &uart->pb_bdf[2]) )
+            if ( !parse_pci(param_value,
+                            NULL,
+                            &uart->pb_bdf[0],
+                            &uart->pb_bdf[1],
+                            &uart->pb_bdf[2]) )
                 PARSE_ERR_RET("Bad bridge PCI coordinates\n");
             uart->pb_bdf_enable = true;
             break;
@@ -1681,8 +1679,8 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
     return true;
 }
 
-static void __init ns16550_parse_port_config(
-    struct ns16550 *uart, const char *conf)
+static void __init ns16550_parse_port_config(struct ns16550 *uart,
+                                             const char *conf)
 {
     char com_console_options[128];
     char *str;
@@ -1706,7 +1704,7 @@ static void __init ns16550_parse_port_config(
     if ( !parse_namevalue_pairs(str, uart) )
         return;
 
- config_parsed:
+config_parsed:
     /* Sanity checks. */
     if ( (uart->baud != BAUD_AUTO) &&
          ((uart->baud < 1200) || (uart->baud > 115200)) )
@@ -1737,15 +1735,15 @@ void __init ns16550_init(int index, struct ns16550_defaults *defaults)
 
     ns16550_init_common(uart);
 
-    uart->baud      = (defaults->baud ? :
-                       console_has((index == 0) ? "com1" : "com2")
-                       ? BAUD_AUTO : 0);
+    uart->baud = (defaults->baud
+                      ?: console_has((index == 0) ? "com1" : "com2") ? BAUD_AUTO
+                                                                     : 0);
     uart->data_bits = defaults->data_bits;
-    uart->parity    = parse_parity_char(defaults->parity);
+    uart->parity = parse_parity_char(defaults->parity);
     uart->stop_bits = defaults->stop_bits;
-    uart->irq       = defaults->irq;
-    uart->io_base   = defaults->io_base;
-    uart->io_size   = 8;
+    uart->irq = defaults->irq;
+    uart->io_base = defaults->io_base;
+    uart->io_size = 8;
     uart->reg_width = 1;
     uart->reg_shift = 0;
 
@@ -1766,9 +1764,9 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
 
     ns16550_init_common(uart);
 
-    uart->baud      = BAUD_AUTO;
+    uart->baud = BAUD_AUTO;
     uart->data_bits = 8;
-    uart->parity    = UART_PARITY_NONE;
+    uart->parity = UART_PARITY_NONE;
     uart->stop_bits = 1;
 
     res = dt_device_get_address(dev, 0, &uart->io_base, &uart->io_size);
@@ -1797,7 +1795,7 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
     }
 
     res = platform_get_irq(dev, 0);
-    if ( ! res )
+    if ( !res )
         return -EINVAL;
     uart->irq = res;
 
@@ -1806,9 +1804,9 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
 #ifdef CONFIG_ARM
     uart->vuart.base_addr = uart->io_base;
     uart->vuart.size = uart->io_size;
-    uart->vuart.data_off = UART_THR <<uart->reg_shift;
-    uart->vuart.status_off = UART_LSR<<uart->reg_shift;
-    uart->vuart.status = UART_LSR_THRE|UART_LSR_TEMT;
+    uart->vuart.data_off = UART_THR << uart->reg_shift;
+    uart->vuart.status_off = UART_LSR << uart->reg_shift;
+    uart->vuart.status = UART_LSR_THRE | UART_LSR_TEMT;
 #endif
 
     /* Register with generic serial driver. */
@@ -1819,8 +1817,7 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
     return 0;
 }
 
-static const struct dt_device_match ns16550_dt_match[] __initconst =
-{
+static const struct dt_device_match ns16550_dt_match[] __initconst = {
     DT_MATCH_COMPATIBLE("ns16550"),
     DT_MATCH_COMPATIBLE("ns16550a"),
     DT_MATCH_COMPATIBLE("snps,dw-apb-uart"),
@@ -1829,8 +1826,7 @@ static const struct dt_device_match ns16550_dt_match[] __initconst =
 };
 
 DT_DEVICE_START(ns16550, "NS16550 UART", DEVICE_SERIAL)
-        .dt_match = ns16550_dt_match,
-        .init = ns16550_uart_dt_init,
+    .dt_match = ns16550_dt_match, .init = ns16550_uart_dt_init,
 DT_DEVICE_END
 
 #endif /* HAS_DEVICE_TREE */
@@ -1907,8 +1903,7 @@ static int __init ns16550_acpi_uart_init(const void *data)
 }
 
 ACPI_DEVICE_START(ans16550, "NS16550 UART", DEVICE_SERIAL)
-    .class_type = ACPI_DBG2_16550_COMPATIBLE,
-    .init = ns16550_acpi_uart_init,
+    .class_type = ACPI_DBG2_16550_COMPATIBLE, .init = ns16550_acpi_uart_init,
 ACPI_DEVICE_END
 
 #endif /* CONFIG_ACPI && CONFIG_ARM */
-- 
2.25.1


