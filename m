Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A77074F56D0
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 09:24:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299661.510719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc01Y-0002Jt-4n; Wed, 06 Apr 2022 07:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299661.510719; Wed, 06 Apr 2022 07:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc01Y-0002Gi-0V; Wed, 06 Apr 2022 07:24:16 +0000
Received: by outflank-mailman (input) for mailman id 299661;
 Wed, 06 Apr 2022 07:24:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUIs=UQ=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nc01W-0002Ga-NN
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 07:24:14 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 8bfef870-b57a-11ec-8fbc-03012f2f19d4;
 Wed, 06 Apr 2022 09:24:08 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61C1623A;
 Wed,  6 Apr 2022 00:24:11 -0700 (PDT)
Received: from [10.57.6.245] (unknown [10.57.6.245])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FB553F73B;
 Wed,  6 Apr 2022 00:24:08 -0700 (PDT)
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
X-Inumbo-ID: 8bfef870-b57a-11ec-8fbc-03012f2f19d4
Message-ID: <fd4b0cc7-3cb9-3f56-5db7-31d41b24611c@arm.com>
Date: Wed, 6 Apr 2022 09:24:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 1/2] xen/arm: Add i.MX lpuart driver
Content-Language: en-US
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, sstabellini@kernel.org,
 julien@xen.org, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, xen-devel@lists.xenproject.org, van.freenix@gmail.com,
 Peng Fan <peng.fan@nxp.com>
References: <20220402054223.10304-1-peng.fan@oss.nxp.com>
 <20220402054223.10304-2-peng.fan@oss.nxp.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220402054223.10304-2-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Peng,

On 02.04.2022 07:42, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX LPUART Documentation:
> https://www.nxp.com/webapp/Download?colCode=IMX8QMIEC
> Chatper 13.6 Low Power Universal Asynchronous Receiver/
> Transmitter (LPUART)
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  xen/drivers/char/Kconfig      |   8 +
>  xen/drivers/char/Makefile     |   1 +
>  xen/drivers/char/imx-lpuart.c | 275 ++++++++++++++++++++++++++++++++++
>  xen/include/xen/imx-lpuart.h  |  64 ++++++++
>  4 files changed, 348 insertions(+)
>  create mode 100644 xen/drivers/char/imx-lpuart.c
>  create mode 100644 xen/include/xen/imx-lpuart.h
> 
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index 2ff5b288e2..0efdb2128f 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -13,6 +13,14 @@ config HAS_CADENCE_UART
>  	  This selects the Xilinx Zynq Cadence UART. If you have a Xilinx Zynq
>  	  based board, say Y.
>  
> +config HAS_IMX_LPUART
> +	bool "i.MX LPUART driver"
> +	default y
> +	depends on ARM_64
> +	help
> +	  This selects the i.MX LPUART. If you have a i.MX8QM based board,
> +	  say Y.
Why did you move "say Y" to the next line?

> +
>  config HAS_MVEBU
>  	bool "Marvell MVEBU UART driver"
>  	default y
> diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
> index 7c646d771c..14e67cf072 100644
> --- a/xen/drivers/char/Makefile
> +++ b/xen/drivers/char/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_HAS_MVEBU) += mvebu-uart.o
>  obj-$(CONFIG_HAS_OMAP) += omap-uart.o
>  obj-$(CONFIG_HAS_SCIF) += scif-uart.o
>  obj-$(CONFIG_HAS_EHCI) += ehci-dbgp.o
> +obj-$(CONFIG_HAS_IMX_LPUART) += imx-lpuart.o
>  obj-$(CONFIG_ARM) += arm-uart.o
>  obj-y += serial.o
>  obj-$(CONFIG_XEN_GUEST) += xen_pv_console.o
> diff --git a/xen/drivers/char/imx-lpuart.c b/xen/drivers/char/imx-lpuart.c
> new file mode 100644
> index 0000000000..49330fd2f8
> --- /dev/null
> +++ b/xen/drivers/char/imx-lpuart.c
> @@ -0,0 +1,275 @@
> +/*
> + * xen/drivers/char/imx-lpuart.c
> + *
> + * Driver for i.MX LPUART.
> + *
> + * Peng Fan <peng.fan@nxp.com>
> + * Copyright 2022 NXP
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <xen/errno.h>
> +#include <xen/imx-lpuart.h>
> +#include <xen/init.h>
> +#include <xen/irq.h>
> +#include <xen/mm.h>
> +#include <xen/serial.h>
> +#include <asm/device.h>
> +#include <asm/io.h>
> +
> +#define imx_lpuart_read(uart, off)       readl((uart)->regs + off)
> +#define imx_lpuart_write(uart, off, val) writel((val), (uart)->regs + off)
> +
> +static struct imx_lpuart {
> +    uint32_t baud, clock_hz, data_bits, parity, stop_bits, fifo_size;
> +    uint32_t irq;
> +    char __iomem *regs;
> +    struct irqaction irqaction;
> +    struct vuart_info vuart;
> +} imx8_com;
> +
> +static void imx_lpuart_interrupt(int irq, void *data,
> +                                 struct cpu_user_regs *regs)
> +{
> +    struct serial_port *port = data;
> +    struct imx_lpuart *uart = port->uart;
> +    uint32_t sts, rxcnt;
> +
> +    sts = imx_lpuart_read(uart, UARTSTAT);
> +    rxcnt = imx_lpuart_read(uart, UARTWATER) >> UARTWATER_RXCNT_OFF;
> +
> +    if ( (sts & UARTSTAT_RDRF) || (rxcnt > 0) )
> +	    serial_rx_interrupt(port, regs);
> +
> +    if ( sts & UARTSTAT_TDRE )
> +	    serial_tx_interrupt(port, regs);
> +
> +    imx_lpuart_write(uart, UARTSTAT, sts);
> +}
> +
> +static void __init imx_lpuart_init_preirq(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart = port->uart;
> +    uint32_t ctrl, old_ctrl, bd;
> +
> +    ctrl = old_ctrl = imx_lpuart_read(uart, UARTCTRL);
Please remove ctrl assignment here as you are overriding it in the next line.

> +    ctrl = (old_ctrl & ~UARTCTRL_M) | UARTCTRL_TE | UARTCTRL_RE;
> +    bd = imx_lpuart_read(uart, UARTBAUD);
> +
> +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TC) )
> +	    cpu_relax();
> +
> +    /* Disable transmit and receive */
> +    imx_lpuart_write(uart, UARTCTRL, old_ctrl & ~(UARTCTRL_TE | UARTCTRL_RE));
> +
> +    /* Reuse firmware baudrate settings, only disable DMA here */
> +    bd &= ~(UARTBAUD_TDMAE | UARTBAUD_RDMAE);
> +
> +    imx_lpuart_write(uart, UARTMODIR, 0);
> +    imx_lpuart_write(uart, UARTBAUD, bd);
> +    imx_lpuart_write(uart, UARTCTRL, ctrl);
> +}
> +
> +static void __init imx_lpuart_init_postirq(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart = port->uart;
> +    uint32_t temp;
> +
> +    uart->irqaction.handler = imx_lpuart_interrupt;
> +    uart->irqaction.name = "imx_lpuart";
> +    uart->irqaction.dev_id = port;
> +
> +    if ( setup_irq(uart->irq, 0, &uart->irqaction) != 0 )
> +    {
> +        dprintk(XENLOG_ERR, "Failed to allocate imx_lpuart IRQ %d\n",
> +                uart->irq);
> +        return;
> +    }
> +
> +    /* Enable interrupts */
> +    temp = imx_lpuart_read(uart, UARTCTRL);
> +    temp |= (UARTCTRL_RIE | UARTCTRL_TIE);
> +    temp |= UARTCTRL_ILIE;
> +    imx_lpuart_write(uart, UARTCTRL, temp);
> +}
> +
> +static void imx_lpuart_suspend(struct serial_port *port)
> +{
> +    BUG();
> +}
> +
> +static void imx_lpuart_resume(struct serial_port *port)
> +{
> +    BUG();
> +}
> +
> +static int imx_lpuart_tx_ready(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart = port->uart;
> +
> +    return imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TC;
> +}
> +
> +static void imx_lpuart_putc(struct serial_port *port, char c)
> +{
> +    struct imx_lpuart *uart = port->uart;
> +
> +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TDRE) )
> +        cpu_relax();
> +
> +    imx_lpuart_write(uart, UARTDATA, c);
> +}
> +
> +static int imx_lpuart_getc(struct serial_port *port, char *pc)
> +{
> +    struct imx_lpuart *uart = port->uart;
> +    int ch;
> +
> +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_RDRF) )
> +	    return 0;
> +
> +    ch = imx_lpuart_read(uart, UARTDATA);
> +    *pc = ch & 0xff;
> +
> +    if ( imx_lpuart_read(uart, UARTSTAT) &  UARTSTAT_OR )
> +        imx_lpuart_write(uart, UARTSTAT, UARTSTAT_OR);
> +
> +    return 1;
> +}
> +
> +static int __init imx_lpuart_irq(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart = port->uart;
> +
> +    return ((uart->irq > 0) ? uart->irq : -1);
> +}
> +
> +static const struct vuart_info *imx_lpuart_vuart_info(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart = port->uart;
> +
> +    return &uart->vuart;
> +}
> +
> +static void imx_lpuart_start_tx(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart = port->uart;
> +    uint32_t temp;
> +
> +    temp = imx_lpuart_read(uart, UARTSTAT);
> +    /* Wait until empty */
> +    while ( !(temp & UARTSTAT_TDRE) )
> +	    cpu_relax();
> +
> +    temp = imx_lpuart_read(uart, UARTCTRL);
> +    imx_lpuart_write(uart, UARTCTRL, (temp | UARTCTRL_TIE));
> +}
> +
> +static void imx_lpuart_stop_tx(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart = port->uart;
> +    uint32_t temp;
> +
> +    temp = imx_lpuart_read(uart, UARTCTRL);
> +    temp &= ~(UARTCTRL_TIE | UARTCTRL_TCIE);
> +    imx_lpuart_write(uart, UARTCTRL, temp);
> +}
> +
> +static struct uart_driver __read_mostly imx_lpuart_driver = {
> +    .init_preirq = imx_lpuart_init_preirq,
> +    .init_postirq = imx_lpuart_init_postirq,
> +    .endboot = NULL,
> +    .suspend = imx_lpuart_suspend,
> +    .resume = imx_lpuart_resume,
> +    .tx_ready = imx_lpuart_tx_ready,
> +    .putc = imx_lpuart_putc,
> +    .getc = imx_lpuart_getc,
> +    .irq = imx_lpuart_irq,
> +    .start_tx = imx_lpuart_start_tx,
> +    .stop_tx = imx_lpuart_stop_tx,
> +    .vuart_info = imx_lpuart_vuart_info,
> +};
> +
> +static int __init imx_lpuart_init(struct dt_device_node *dev,
> +                                  const void *data)
> +{
> +    const char *config = data;
> +    struct imx_lpuart *uart;
> +    int res;
> +    u64 addr, size;
> +
> +    if ( strcmp(config, "") )
> +        printk("WARNING: UART configuration is not supported\n");
> +
> +    uart = &imx8_com;
> +
> +    uart->baud = 115200;
> +    uart->data_bits = 8;
> +    uart->parity = 0;
> +    uart->stop_bits = 1;
> +
> +    res = dt_device_get_address(dev, 0, &addr, &size);
> +    if ( res )
> +    {
> +        printk("imx8-lpuart: Unable to retrieve the base"
> +               " address of the UART\n");
> +        return res;
> +    }
> +
> +    res = platform_get_irq(dev, 0);
> +    if ( res < 0 )
> +    {
> +        printk("imx8-lpuart: Unable to retrieve the IRQ\n");
> +        return -EINVAL;
> +    }
> +    uart->irq = res;
> +
> +    uart->regs = ioremap_nocache(addr, size);
> +    if ( !uart->regs )
> +    {
> +        printk("imx8-lpuart: Unable to map the UART memory\n");
> +        return -ENOMEM;
> +    }
> +
> +    uart->vuart.base_addr = addr;
> +    uart->vuart.size = size;
> +    uart->vuart.data_off = UARTDATA;
> +    /* tmp from uboot */
> +    uart->vuart.status_off = UARTSTAT;
> +    uart->vuart.status = UARTSTAT_TDRE;
> +
> +    /* Register with generic serial driver */
> +    serial_register_uart(SERHND_DTUART, &imx_lpuart_driver, uart);
> +
> +    dt_device_set_used_by(dev, DOMID_XEN);
> +
> +    return 0;
> +}
> +
> +static const struct dt_device_match imx_lpuart_dt_compat[] __initconst =
> +{
> +    DT_MATCH_COMPATIBLE("fsl,imx8qm-lpuart"),
> +    {},
To be coherent with the rest of Xen code, please use { /* sentinel */ }

> +};
> +
> +DT_DEVICE_START(imx_lpuart, "i.MX LPUART", DEVICE_SERIAL)
> +    .dt_match = imx_lpuart_dt_compat,
> +    .init = imx_lpuart_init,
> +DT_DEVICE_END
Please add a newline here.

> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/imx-lpuart.h b/xen/include/xen/imx-lpuart.h
> new file mode 100644
> index 0000000000..945ab1c4fa
> --- /dev/null
> +++ b/xen/include/xen/imx-lpuart.h
> @@ -0,0 +1,64 @@
> +/*
> + * xen/include/asm-arm/imx-lpuart.h
Wrong path as you put this header in xen/include/xen.

> + *
> + * Common constant definition between early printk and the LPUART driver
> + *
> + * Peng Fan <peng.fan@nxp.com>
> + * Copyright 2022 NXP
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __ASM_ARM_IMX_LPUART_H
Wrong macro as you are not in arm/include/asm.

> +#define __ASM_ARM_IMX_LPUART_H
> +
> +/* 32-bit register definition */
> +#define UARTBAUD          (0x10)
> +#define UARTSTAT          (0x14)
> +#define UARTCTRL          (0x18)
> +#define UARTDATA          (0x1C)
> +#define UARTMATCH         (0x20)
> +#define UARTMODIR         (0x24)
> +#define UARTFIFO          (0x28)
> +#define UARTWATER         (0x2c)
> +
> +#define UARTSTAT_TDRE     (1 << 23)
> +#define UARTSTAT_TC       (1 << 22)
> +#define UARTSTAT_RDRF     (1 << 21)
> +#define UARTSTAT_OR       (1 << 19)
> +
> +#define UARTBAUD_OSR_SHIFT (24)
> +#define UARTBAUD_OSR_MASK (0x1f)
> +#define UARTBAUD_SBR_MASK (0x1fff)
> +#define UARTBAUD_BOTHEDGE (0x00020000)
> +#define UARTBAUD_TDMAE    (0x00800000)
> +#define UARTBAUD_RDMAE    (0x00200000)
> +
> +#define UARTCTRL_TIE      (1 << 23)
> +#define UARTCTRL_TCIE     (1 << 22)
> +#define UARTCTRL_RIE      (1 << 21)
> +#define UARTCTRL_ILIE     (1 << 20)
> +#define UARTCTRL_TE       (1 << 19)
> +#define UARTCTRL_RE       (1 << 18)
> +#define UARTCTRL_M        (1 << 4)
> +
> +#define UARTWATER_RXCNT_OFF     24
> +
> +#endif /* __ASM_ARM_IMX_LPUART_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

I think you should put this header in xen/arch/arm/include/asm/ as it is arm related header.

Cheers,
Michal

