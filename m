Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AB850304A
	for <lists+xen-devel@lfdr.de>; Sat, 16 Apr 2022 00:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305944.521082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfUP8-0006TF-J4; Fri, 15 Apr 2022 22:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305944.521082; Fri, 15 Apr 2022 22:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfUP8-0006RH-FU; Fri, 15 Apr 2022 22:27:02 +0000
Received: by outflank-mailman (input) for mailman id 305944;
 Fri, 15 Apr 2022 22:27:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nfUP6-0006RB-UD
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 22:27:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29863fb3-bd0b-11ec-8fbe-03012f2f19d4;
 Sat, 16 Apr 2022 00:26:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9480862116;
 Fri, 15 Apr 2022 22:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9E6C385A4;
 Fri, 15 Apr 2022 22:26:56 +0000 (UTC)
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
X-Inumbo-ID: 29863fb3-bd0b-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650061617;
	bh=PN9Wghh2u+WBV+lc4rxfbwHQy8ORwnCgwhxfFuTi1wo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ofhs9m+fl2KPBq9TGw1n5JPnc9k04T5CMRnpplI1k/bNYFFdkN3l/MgFRJN35Ylv+
	 3AtAhZiVhfXnIiDrC7eKvsJbE+IWA0ikFrrUQsc9iFHDj/UtLHPx2mJ4jEuJpr6rg8
	 Ux3GjEmFDbjRTUQDWbkgyE4+URCkVmIWuHQm4oHTzWwPAraDGUI0MNrnV6o4jmOX90
	 0K3mix+T6V9aelzBvJVDxRc/3Q8LCR/mW2hcApxSDmUUKy+Hc0yaOUIUrd/fuiqW18
	 lISMzMJjv52Pbghnsks/TJO4OOqSUKfKaEUtyUbiPwcx7WxSBvlSqldjtuuixtZ9PH
	 k9tkKu/DbfHag==
Date: Fri, 15 Apr 2022 15:26:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
cc: sstabellini@kernel.org, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, 
    xen-devel@lists.xenproject.org, van.freenix@gmail.com, 
    michal.orzel@arm.com, Peng Fan <peng.fan@nxp.com>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH V5 1/2] xen/arm: Add i.MX lpuart driver
In-Reply-To: <20220414074452.14419-2-peng.fan@oss.nxp.com>
Message-ID: <alpine.DEB.2.22.394.2204151525120.915916@ubuntu-linux-20-04-desktop>
References: <20220414074452.14419-1-peng.fan@oss.nxp.com> <20220414074452.14419-2-peng.fan@oss.nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Apr 2022, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX LPUART Documentation:
> https://www.nxp.com/webapp/Download?colCode=IMX8QMIEC
> Chatper 13.6 Low Power Universal Asynchronous Receiver/
> Transmitter (LPUART)
> 
> Tested-by: Henry Wang <Henry.Wang@arm.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  xen/arch/arm/include/asm/imx-lpuart.h |  64 ++++++
>  xen/drivers/char/Kconfig              |   7 +
>  xen/drivers/char/Makefile             |   1 +
>  xen/drivers/char/imx-lpuart.c         | 276 ++++++++++++++++++++++++++
>  4 files changed, 348 insertions(+)
>  create mode 100644 xen/arch/arm/include/asm/imx-lpuart.h
>  create mode 100644 xen/drivers/char/imx-lpuart.c
> 
> diff --git a/xen/arch/arm/include/asm/imx-lpuart.h b/xen/arch/arm/include/asm/imx-lpuart.h
> new file mode 100644
> index 0000000000..fe859045dc
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/imx-lpuart.h
> @@ -0,0 +1,64 @@
> +/*
> + * xen/arch/arm/include/asm/imx-lpuart.h
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
> +#ifndef __ASM_ARM_IMX_LPUART_H__
> +#define __ASM_ARM_IMX_LPUART_H__
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
> +#define UARTSTAT_TDRE     BIT(23, UL)
> +#define UARTSTAT_TC       BIT(22, UL)
> +#define UARTSTAT_RDRF     BIT(21, UL)
> +#define UARTSTAT_OR       BIT(19, UL)
> +
> +#define UARTBAUD_OSR_SHIFT    (24)
> +#define UARTBAUD_OSR_MASK     (0x1f)
> +#define UARTBAUD_SBR_MASK     (0x1fff)
> +#define UARTBAUD_BOTHEDGE     (0x00020000)
> +#define UARTBAUD_TDMAE        (0x00800000)
> +#define UARTBAUD_RDMAE        (0x00200000)
> +
> +#define UARTCTRL_TIE      BIT(23, UL)
> +#define UARTCTRL_TCIE     BIT(22, UL)
> +#define UARTCTRL_RIE      BIT(21, UL)
> +#define UARTCTRL_ILIE     BIT(20, UL)
> +#define UARTCTRL_TE       BIT(19, UL)
> +#define UARTCTRL_RE       BIT(18, UL)
> +#define UARTCTRL_M        BIT(4, UL)
> +
> +#define UARTWATER_RXCNT_OFF     24
> +
> +#endif /* __ASM_ARM_IMX_LPUART_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index 2ff5b288e2..e5f7b1d8eb 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -13,6 +13,13 @@ config HAS_CADENCE_UART
>  	  This selects the Xilinx Zynq Cadence UART. If you have a Xilinx Zynq
>  	  based board, say Y.
>  
> +config HAS_IMX_LPUART
> +	bool "i.MX LPUART driver"
> +	default y
> +	depends on ARM_64
> +	help
> +	  This selects the i.MX LPUART. If you have i.MX8QM based board, say Y.
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
> index 0000000000..df44f91e5d
> --- /dev/null
> +++ b/xen/drivers/char/imx-lpuart.c
> @@ -0,0 +1,276 @@
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
> +#include <xen/init.h>
> +#include <xen/irq.h>
> +#include <xen/mm.h>
> +#include <xen/serial.h>
> +#include <asm/device.h>
> +#include <asm/imx-lpuart.h>
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
> +    old_ctrl = imx_lpuart_read(uart, UARTCTRL);
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

It looks like this is looping over a stale variable?


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
> +    { /* sentinel */ },
> +};
> +
> +DT_DEVICE_START(imx_lpuart, "i.MX LPUART", DEVICE_SERIAL)
> +    .dt_match = imx_lpuart_dt_compat,
> +    .init = imx_lpuart_init,
> +DT_DEVICE_END
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> -- 
> 2.35.1
> 

