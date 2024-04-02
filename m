Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B00895271
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 14:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700112.1092742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrcuO-0005yP-TU; Tue, 02 Apr 2024 12:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700112.1092742; Tue, 02 Apr 2024 12:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrcuO-0005v7-Op; Tue, 02 Apr 2024 12:06:32 +0000
Received: by outflank-mailman (input) for mailman id 700112;
 Tue, 02 Apr 2024 12:06:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dzup=LH=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1rrcuN-0005SQ-TF
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 12:06:31 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7066c174-f0e9-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 14:06:30 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a466e53f8c0so665394966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 05:06:30 -0700 (PDT)
Received: from EPUAKYIW03DD.. ([91.123.150.27])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a170906774a00b00a4e472a8e54sm4303773ejn.48.2024.04.02.05.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 05:06:28 -0700 (PDT)
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
X-Inumbo-ID: 7066c174-f0e9-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712059589; x=1712664389; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUGgsrjKPl/22WR8VSn54cLHJfWkay8frEJz8oEQvJ0=;
        b=hBFiUnfkWMNU21vk9PQpTqD4w9/3sw/q98H+5k6j3bT14vfX/kQpcliNTUi62mZMyC
         G+e+KSPLfsCqOSU+X31IDNeBTwcVbPDOl2x6z5HroAsg0W/tfJjbkyCi9BHPKsV3glJx
         tyPvPJpdp7G5+nhJ9QlV+AlRmni77aYBanSr9W5Q5OkIcCscKUzchV0VeIdd1YkznlCx
         z3XAXrRKLFCDMjSn1EbynVKjfb9IvTWUJzdWvC/qX72grFZICN6CO74qDu3AjxUynA3O
         eSQOIureh+REihf62Al2XnR2WYyYYE+A7ShNguTjMD96ljiQCtl1zF7Wy+WLik9rELMw
         yS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712059589; x=1712664389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUGgsrjKPl/22WR8VSn54cLHJfWkay8frEJz8oEQvJ0=;
        b=JuCaGXLlV21WnPBDLW+9KZdUiBYNQ6Y1efl8sOPnhHb65O/RTfX9s0N1/K8K8whDlG
         +7K9NK0WXN6kl5vKrmTD2bdoimiUfVIIENZ5vEv5yloYPI10wUxF8zvfAThwiSZLT5P9
         dfjbO64KJZEf2QmOXEBmvZEiWGXwNOy+iLf/rNrh1H1Sk5aAht4bV9SUDvKTtso5OXRV
         FyPfislSQ3KdBtOx7vsaEDwp04sY+szVnlqHC6Yyy+0SgcGeLLnACnkhE/TknfbJu400
         9giGgNZY8J+8sBbtCLgRf7y+BVrSw6d3LcT/at++vF4zjA6Vpsn6zqsCIy30gE8Ca6bu
         KXbw==
X-Gm-Message-State: AOJu0YyMzl40/OfmDNJXaZ3PflpWX977fHE6C3o+c5Swbimgjoh8z/c2
	Yb+BwsP+dCqRNSG27Sqey19vNbciieJ1+uN3LYZOU6oGw5czBuGwiUDWiLJJ
X-Google-Smtp-Source: AGHT+IEe151L0J+G7gezYuP2Ey74bXQU7Msp/+iN5C48PhOX/MgTtpNc19hVo4PzgFkP5hhgLTqruw==
X-Received: by 2002:a17:906:38c3:b0:a46:36ee:cfac with SMTP id r3-20020a17090638c300b00a4636eecfacmr8327286ejd.77.1712059588641;
        Tue, 02 Apr 2024 05:06:28 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/2] xen/arm: Add i.MX UART driver
Date: Tue,  2 Apr 2024 15:05:57 +0300
Message-Id: <20240402120557.1822253-3-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240402120557.1822253-1-olekstysh@gmail.com>
References: <20240402120557.1822253-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The i.MX UART Documentation:
https://www.nxp.com/webapp/Download?colCode=IMX8MMRM
Chapter 16.2 Universal Asynchronous Receiver/Transmitter (UART)

Tested on i.MX 8M Mini only, but I guess, it should be
suitable for other i.MX8M* SoCs (those UART device tree nodes
contain "fsl,imx6q-uart" compatible string).

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
I used the "earlycon=ec_imx6q,0x30890000" cmd arg and
selected CONFIG_SERIAL_IMX_EARLYCON in Linux for enabling vUART.
---
---
 MAINTAINERS                 |   1 +
 xen/drivers/char/Kconfig    |   7 +
 xen/drivers/char/Makefile   |   1 +
 xen/drivers/char/imx-uart.c | 299 ++++++++++++++++++++++++++++++++++++
 4 files changed, 308 insertions(+)
 create mode 100644 xen/drivers/char/imx-uart.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1bd22fd75f..bd4084fd20 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -249,6 +249,7 @@ F:	xen/drivers/char/arm-uart.c
 F:	xen/drivers/char/cadence-uart.c
 F:	xen/drivers/char/exynos4210-uart.c
 F:	xen/drivers/char/imx-lpuart.c
+F:	xen/drivers/char/imx-uart.c
 F:	xen/drivers/char/meson-uart.c
 F:	xen/drivers/char/mvebu-uart.c
 F:	xen/drivers/char/omap-uart.c
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index e18ec3788c..f51a1f596a 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -20,6 +20,13 @@ config HAS_IMX_LPUART
 	help
 	  This selects the i.MX LPUART. If you have i.MX8QM based board, say Y.
 
+config HAS_IMX_UART
+	bool "i.MX UART driver"
+	default y
+	depends on ARM_64
+	help
+	  This selects the i.MX UART. If you have i.MX8M* based board, say Y.
+
 config HAS_MVEBU
 	bool "Marvell MVEBU UART driver"
 	default y
diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
index e7e374775d..147530a1ed 100644
--- a/xen/drivers/char/Makefile
+++ b/xen/drivers/char/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_HAS_SCIF) += scif-uart.o
 obj-$(CONFIG_HAS_EHCI) += ehci-dbgp.o
 obj-$(CONFIG_XHCI) += xhci-dbc.o
 obj-$(CONFIG_HAS_IMX_LPUART) += imx-lpuart.o
+obj-$(CONFIG_HAS_IMX_UART) += imx-uart.o
 obj-$(CONFIG_ARM) += arm-uart.o
 obj-y += serial.o
 obj-$(CONFIG_XEN_GUEST) += xen_pv_console.o
diff --git a/xen/drivers/char/imx-uart.c b/xen/drivers/char/imx-uart.c
new file mode 100644
index 0000000000..13bb189063
--- /dev/null
+++ b/xen/drivers/char/imx-uart.c
@@ -0,0 +1,299 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * xen/drivers/char/imx-uart.c
+ *
+ * Driver for i.MX UART.
+ *
+ * Based on Linux's drivers/tty/serial/imx.c
+ *
+ * Copyright (C) 2024 EPAM Systems Inc.
+ */
+
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/irq.h>
+#include <xen/mm.h>
+#include <xen/serial.h>
+#include <asm/device.h>
+#include <asm/imx-uart.h>
+#include <asm/io.h>
+
+#define imx_uart_read(uart, off)          readl((uart)->regs + (off))
+#define imx_uart_write(uart, off, val)    writel((val), (uart)->regs + (off))
+
+static struct imx_uart {
+    uint32_t baud, clock_hz, data_bits, parity, stop_bits, fifo_size;
+    uint32_t irq;
+    char __iomem *regs;
+    struct irqaction irqaction;
+    struct vuart_info vuart;
+} imx_com;
+
+static void imx_uart_interrupt(int irq, void *data)
+{
+    struct serial_port *port = data;
+    struct imx_uart *uart = port->uart;
+    uint32_t usr1, usr2;
+
+    usr1 = imx_uart_read(uart, USR1);
+    usr2 = imx_uart_read(uart, USR2);
+
+    if ( usr1 & (USR1_RRDY | USR1_AGTIM) )
+    {
+        imx_uart_write(uart, USR1, USR1_AGTIM);
+        serial_rx_interrupt(port);
+    }
+
+    if ( (usr1 & USR1_TRDY) || (usr2 & USR2_TXDC) )
+        serial_tx_interrupt(port);
+}
+
+static void imx_uart_clear_rx_errors(struct serial_port *port)
+{
+    struct imx_uart *uart = port->uart;
+    uint32_t usr1, usr2;
+
+    usr1 = imx_uart_read(uart, USR1);
+    usr2 = imx_uart_read(uart, USR2);
+
+    if ( usr2 & USR2_BRCD )
+        imx_uart_write(uart, USR2, USR2_BRCD);
+    else if ( usr1 & USR1_FRAMERR )
+        imx_uart_write(uart, USR1, USR1_FRAMERR);
+    else if ( usr1 & USR1_PARITYERR )
+        imx_uart_write(uart, USR1, USR1_PARITYERR);
+
+    if ( usr2 & USR2_ORE )
+        imx_uart_write(uart, USR2, USR2_ORE);
+}
+
+static void __init imx_uart_init_preirq(struct serial_port *port)
+{
+    struct imx_uart *uart = port->uart;
+    uint32_t reg;
+
+    /*
+     * Wait for the transmission to complete. This is needed for a smooth
+     * transition when we come from early printk.
+     */
+    while ( !(imx_uart_read(uart, USR2) & USR2_TXDC) )
+        cpu_relax();
+
+    /* Set receiver/transmitter trigger level */
+    reg = imx_uart_read(uart, UFCR);
+    reg &= (UFCR_RFDIV | UFCR_DCEDTE);
+    reg |= TXTL_DEFAULT << UFCR_TXTL_SHF | RXTL_DEFAULT;
+    imx_uart_write(uart, UFCR, reg);
+
+    /* Enable UART and disable interrupts/DMA */
+    reg = imx_uart_read(uart, UCR1);
+    reg |= UCR1_UARTEN;
+    reg &= ~(UCR1_TRDYEN | UCR1_TXMPTYEN | UCR1_RTSDEN | UCR1_RRDYEN |
+             UCR1_RXDMAEN | UCR1_TXDMAEN | UCR1_ATDMAEN);
+    imx_uart_write(uart, UCR1, reg);
+
+    /* Enable receiver/transmitter and disable Aging Timer */
+    reg = imx_uart_read(uart, UCR2);
+    reg |= UCR2_RXEN | UCR2_TXEN;
+    reg &= ~UCR2_ATEN;
+    imx_uart_write(uart, UCR2, reg);
+
+    /* Disable interrupts */
+    reg = imx_uart_read(uart, UCR4);
+    reg &= ~(UCR4_TCEN | UCR4_DREN);
+    imx_uart_write(uart, UCR4, reg);
+}
+
+static void __init imx_uart_init_postirq(struct serial_port *port)
+{
+    struct imx_uart *uart = port->uart;
+
+    uart->irqaction.handler = imx_uart_interrupt;
+    uart->irqaction.name = "imx_uart";
+    uart->irqaction.dev_id = port;
+
+    if ( setup_irq(uart->irq, 0, &uart->irqaction) != 0 )
+    {
+        dprintk(XENLOG_ERR, "Failed to allocate imx_uart IRQ %d\n", uart->irq);
+        return;
+    }
+
+    /* Clear possible receiver errors */
+    imx_uart_clear_rx_errors(port);
+
+    /* Enable interrupts */
+    imx_uart_write(uart, UCR1, imx_uart_read(uart, UCR1) |
+                   UCR1_RRDYEN | UCR1_TRDYEN);
+    imx_uart_write(uart, UCR2, imx_uart_read(uart, UCR2) | UCR2_ATEN);
+}
+
+static void imx_uart_suspend(struct serial_port *port)
+{
+    BUG();
+}
+
+static void imx_uart_resume(struct serial_port *port)
+{
+    BUG();
+}
+
+static int imx_uart_tx_ready(struct serial_port *port)
+{
+    struct imx_uart *uart = port->uart;
+    uint32_t reg;
+
+    reg = imx_uart_read(uart, IMX21_UTS);
+    if ( reg & UTS_TXEMPTY )
+        return TX_FIFO_SIZE;
+    if ( reg & UTS_TXFULL )
+        return 0;
+
+    /*
+     * If the FIFO is neither full nor empty then there is a space for
+     * one char at least.
+     */
+    return 1;
+}
+
+static void imx_uart_putc(struct serial_port *port, char c)
+{
+    struct imx_uart *uart = port->uart;
+
+    while ( imx_uart_read(uart, IMX21_UTS) & UTS_TXFULL )
+        cpu_relax();
+
+    imx_uart_write(uart, URTX0, c);
+}
+
+static int imx_uart_getc(struct serial_port *port, char *pc)
+{
+    struct imx_uart *uart = port->uart;
+    uint32_t data;
+
+    if ( !(imx_uart_read(uart, USR2) & USR2_RDR) )
+        return 0;
+
+    data = imx_uart_read(uart, URXD0);
+    *pc = data & URXD_RX_DATA;
+
+    if ( unlikely(data & URXD_ERR) )
+        imx_uart_clear_rx_errors(port);
+
+    return 1;
+}
+
+static int __init imx_uart_irq(struct serial_port *port)
+{
+    struct imx_uart *uart = port->uart;
+
+    return ((uart->irq > 0) ? uart->irq : -1);
+}
+
+static const struct vuart_info *imx_uart_vuart_info(struct serial_port *port)
+{
+    struct imx_uart *uart = port->uart;
+
+    return &uart->vuart;
+}
+
+static void imx_uart_start_tx(struct serial_port *port)
+{
+    struct imx_uart *uart = port->uart;
+
+    imx_uart_write(uart, UCR1, imx_uart_read(uart, UCR1) | UCR1_TRDYEN);
+}
+
+static void imx_uart_stop_tx(struct serial_port *port)
+{
+    struct imx_uart *uart = port->uart;
+
+    imx_uart_write(uart, UCR1, imx_uart_read(uart, UCR1) & ~UCR1_TRDYEN);
+}
+
+static struct uart_driver __read_mostly imx_uart_driver = {
+    .init_preirq = imx_uart_init_preirq,
+    .init_postirq = imx_uart_init_postirq,
+    .endboot = NULL,
+    .suspend = imx_uart_suspend,
+    .resume = imx_uart_resume,
+    .tx_ready = imx_uart_tx_ready,
+    .putc = imx_uart_putc,
+    .getc = imx_uart_getc,
+    .irq = imx_uart_irq,
+    .start_tx = imx_uart_start_tx,
+    .stop_tx = imx_uart_stop_tx,
+    .vuart_info = imx_uart_vuart_info,
+};
+
+static int __init imx_uart_init(struct dt_device_node *dev, const void *data)
+{
+    const char *config = data;
+    struct imx_uart *uart;
+    int res;
+    paddr_t addr, size;
+
+    if ( strcmp(config, "") )
+        printk("WARNING: UART configuration is not supported\n");
+
+    uart = &imx_com;
+
+    uart->baud = 115200;
+    uart->data_bits = 8;
+    uart->parity = 0;
+    uart->stop_bits = 1;
+
+    res = dt_device_get_paddr(dev, 0, &addr, &size);
+    if ( res )
+    {
+        printk("imx-uart: Unable to retrieve the base address of the UART\n");
+        return res;
+    }
+
+    res = platform_get_irq(dev, 0);
+    if ( res < 0 )
+    {
+        printk("imx-uart: Unable to retrieve the IRQ\n");
+        return -EINVAL;
+    }
+    uart->irq = res;
+
+    uart->regs = ioremap_nocache(addr, size);
+    if ( !uart->regs )
+    {
+        printk("imx-uart: Unable to map the UART memory\n");
+        return -ENOMEM;
+    }
+
+    uart->vuart.base_addr = addr;
+    uart->vuart.size = size;
+    uart->vuart.data_off = URTX0;
+    uart->vuart.status_off = IMX21_UTS;
+    uart->vuart.status = UTS_TXEMPTY;
+
+    /* Register with generic serial driver */
+    serial_register_uart(SERHND_DTUART, &imx_uart_driver, uart);
+
+    dt_device_set_used_by(dev, DOMID_XEN);
+
+    return 0;
+}
+
+static const struct dt_device_match imx_uart_dt_compat[] __initconst =
+{
+    DT_MATCH_COMPATIBLE("fsl,imx6q-uart"),
+    { /* sentinel */ },
+};
+
+DT_DEVICE_START(imx_uart, "i.MX UART", DEVICE_SERIAL)
+    .dt_match = imx_uart_dt_compat,
+    .init = imx_uart_init,
+DT_DEVICE_END
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.34.1


