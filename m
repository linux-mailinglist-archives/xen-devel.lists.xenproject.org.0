Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C32A4D20B5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 19:53:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287437.487440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRewr-0005gy-M4; Tue, 08 Mar 2022 18:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287437.487440; Tue, 08 Mar 2022 18:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRewr-0005eR-IL; Tue, 08 Mar 2022 18:52:41 +0000
Received: by outflank-mailman (input) for mailman id 287437;
 Tue, 08 Mar 2022 18:52:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nRewq-0005eL-QD
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 18:52:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRewl-0007f8-91; Tue, 08 Mar 2022 18:52:35 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[10.95.172.145]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRewk-0007fi-U6; Tue, 08 Mar 2022 18:52:35 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=E0BI8zreMuP/aQlRlI9Vo+Os7Z+KOA6bRJflHy5Xmq0=; b=3mLEXPGLkmwHOQ0QJboNgmI2my
	7Or6r2lrJcOl44s2Ns42p+DguHXoZXgtFJvwwsAw+yUYY2noKZJyq/bSSsaN5nsoegLvo34miI51H
	J7Bn2ug/awGeIfAcNzM9Ycf2dxO5ATEN0XCvNPV4xxKMIKFZ3Y6+b8B2TPRztjBLqOU0=;
Message-ID: <5fc8a6a2-450a-d9c3-b241-e1a950ac2933@xen.org>
Date: Tue, 8 Mar 2022 18:52:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 1/3] xen/arm: Add i.MX lpuart driver
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, xen-devel@lists.xenproject.org, van.freenix@gmail.com,
 Peng Fan <peng.fan@nxp.com>
References: <20220228010711.11566-1-peng.fan@oss.nxp.com>
 <20220228010711.11566-2-peng.fan@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220228010711.11566-2-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Peng,

On 28/02/2022 01:07, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   xen/drivers/char/Kconfig      |   8 +
>   xen/drivers/char/Makefile     |   1 +
>   xen/drivers/char/imx-lpuart.c | 303 ++++++++++++++++++++++++++++++++++
>   xen/include/xen/imx-lpuart.h  |  64 +++++++
>   4 files changed, 376 insertions(+)
>   create mode 100644 xen/drivers/char/imx-lpuart.c
>   create mode 100644 xen/include/xen/imx-lpuart.h
> 
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index 2ff5b288e2..0efdb2128f 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -13,6 +13,14 @@ config HAS_CADENCE_UART
>   	  This selects the Xilinx Zynq Cadence UART. If you have a Xilinx Zynq
>   	  based board, say Y.
>   
> +config HAS_IMX_LPUART
> +	bool "i.MX LPUART driver"
> +	default y
> +	depends on ARM_64
> +	help
> +	  This selects the i.MX LPUART. If you have a i.MX8QM based board,
> +	  say Y.
> +
>   config HAS_MVEBU
>   	bool "Marvell MVEBU UART driver"
>   	default y
> diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
> index 7c646d771c..14e67cf072 100644
> --- a/xen/drivers/char/Makefile
> +++ b/xen/drivers/char/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_HAS_MVEBU) += mvebu-uart.o
>   obj-$(CONFIG_HAS_OMAP) += omap-uart.o
>   obj-$(CONFIG_HAS_SCIF) += scif-uart.o
>   obj-$(CONFIG_HAS_EHCI) += ehci-dbgp.o
> +obj-$(CONFIG_HAS_IMX_LPUART) += imx-lpuart.o
>   obj-$(CONFIG_ARM) += arm-uart.o
>   obj-y += serial.o
>   obj-$(CONFIG_XEN_GUEST) += xen_pv_console.o
> diff --git a/xen/drivers/char/imx-lpuart.c b/xen/drivers/char/imx-lpuart.c
> new file mode 100644
> index 0000000000..2a30e3f21a
> --- /dev/null
> +++ b/xen/drivers/char/imx-lpuart.c
> @@ -0,0 +1,303 @@
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
> +#include <xen/console.h>

This should not be necessary.h

> +#include <xen/serial.h>
> +#include <xen/imx-lpuart.h>
> +#include <xen/init.h>
> +#include <xen/irq.h>
> +#include <xen/errno.h>
> +#include <xen/mm.h>

Please order the <xen/*> alphabetically.h

> +#include <asm/device.h>
> +#include <asm/io.h>
> +
> +#define imx_lpuart_read(uart, off)       readl((uart)->regs + off)
> +#define imx_lpuart_write(uart, off, val) writel((val), (uart)->regs + off)
> +
> +static struct imx_lpuart {
> +    unsigned int baud, clock_hz, data_bits, parity, stop_bits, fifo_size;
> +    unsigned int irq;
> +    char __iomem *regs;
> +    struct irqaction irqaction;
> +    struct vuart_info vuart;
> +} imx8_com = {0};

This will be initialized to 0 by default. So I would drop {0}.

> +
> +static void imx_lpuart_interrupt(int irq, void *data,
> +                                  struct cpu_user_regs *regs)

Coding style: 'struct' should be aligned with 'int'.

> +{
> +    struct serial_port *port = data;
> +    struct imx_lpuart *uart = port->uart;
> +    unsigned int sts, rxcnt;
> +
> +    sts = imx_lpuart_read(uart, UARTSTAT);
> +    rxcnt = imx_lpuart_read(uart, UARTWATER) >> UARTWATER_RXCNT_OFF;
> +
> +    if ((sts & UARTSTAT_RDRF) || (rxcnt > 0)) {

Coding style:

if ( ... )
{

But for single line block, we tend to avoid {}.

> +	    serial_rx_interrupt(port, regs);
> +    }
> +
> +    if ((sts & UARTSTAT_TDRE) &&
> +        !(imx_lpuart_read(uart, UARTBAUD) & UARTBAUD_TDMAE))

Looking at imx_lpuart_init_preirq(), you will always clear 
UARTBAUD_TDMAE. So it is necessary to check the value for every interrupt?

> +	    serial_tx_interrupt(port, regs);
> +
> +    imx_lpuart_write(uart, UARTSTAT, sts);
> +}
> +
> +static void __init imx_lpuart_init_preirq(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart = port->uart;
> +    u32 sbr, osr;
> +    u32 ctrl, old_ctrl, bd;
> +    u32 baud;

In Xen we are phasing out the use of u* in favor of uint*_t. Can you 
convert your code to use uint*_t?

> +
> +    ctrl = old_ctrl = imx_lpuart_read(uart, UARTCTRL);
> +    ctrl = (old_ctrl & ~UARTCTRL_M) | UARTCTRL_TE | UARTCTRL_RE;
> +    bd = imx_lpuart_read(uart, UARTBAUD);
> +    baud = uart->baud;
> +
> +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TC))

Coding style: missing space before the last ).

> +	    barrier();

I think this wants to be cpu_relax(). At the moment, it is implemented 
as a barrier() but this may change in the future.

> +
> +    /* Disable trasmit and receive */

Typo: s/trasmit/transmit/

> +    imx_lpuart_write(uart, UARTCTRL, old_ctrl & ~(UARTCTRL_TE | UARTCTRL_RE));
> +
> +    osr = (bd >> UARTBAUD_OSR_SHIFT) & UARTBAUD_OSR_MASK;
> +    sbr = uart->clock_hz / (baud * (osr + 1));

For earlyprintk() patch you rely on the baud rate set by the firmware. 
Looking at the code below, you will also hardocode the baud rate. So 
couldn't we simply reply on the firmware to set the baud correctly?

> +
> +    bd &= ~ UARTBAUD_SBR_MASK;
> +    bd |= sbr & UARTBAUD_SBR_MASK;
> +    bd |= UARTBAUD_BOTHEDGE;

In the Linux driver, the bit will only be set when osr is between 3 and 
8. Shouldn't we do the same?

> +    bd &= ~(UARTBAUD_TDMAE | UARTBAUD_RDMAE);

Can you document why we clear the flag?

> +
> +    imx_lpuart_write(uart, UARTMODIR, 0);
> +    imx_lpuart_write(uart, UARTBAUD, bd);
> +    imx_lpuart_write(uart, UARTCTRL, ctrl);
> +}
> +
> +static void __init imx_lpuart_init_postirq(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart = port->uart;
> +    unsigned int temp;
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
> +    /* Enable interrupte */

Typo: s/interrupte/interrupts/

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
> +    return (imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TC) ? 1 : 0;

This can be simply:

return imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TC;

> +}
> +
> +static void imx_lpuart_putc(struct serial_port *port, char c)
> +{
> +    struct imx_lpuart *uart = port->uart;
> +
> +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_TDRE))
> +        barrier();

Same remark about the barrier.

> +
> +    imx_lpuart_write(uart, UARTDATA, c);
> +}
> +
> +static int imx_lpuart_getc(struct serial_port *port, char *pc)
> +{
> +    struct imx_lpuart *uart = port->uart;
> +    int ch;
> +
> +    while ( !(imx_lpuart_read(uart, UARTSTAT) & UARTSTAT_RDRF))
> +        barrier();

Same remark about the barrier.

However, rather than waiting, shouldn't we check the watermark instead 
and return 0 if there are no character to read?

> +
> +    ch = imx_lpuart_read(uart, UARTDATA);
> +    *pc = ch & 0xff;
> +
> +    if (imx_lpuart_read(uart, UARTSTAT) &  UARTSTAT_OR)
> +        imx_lpuart_write(uart, UARTSTAT, UARTSTAT_OR);
> +
> +    return 1;
> +}
> +
> +static int __init imx_lpuart_irq(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart = port->uart;
> +
> +    return ((uart->irq >0) ? uart->irq : -1);

Coding style: Missing space after >.

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
> +    unsigned int temp;
> +
> +    temp = imx_lpuart_read(uart, UARTSTAT);
> +    /* Wait until empty */
> +    while (!(temp & UARTSTAT_TDRE))

Coding style: while ( ... )

> +	    barrier();

Same remark about the barrier.

> +
> +    temp = imx_lpuart_read(uart, UARTCTRL);
> +    imx_lpuart_write(uart, UARTCTRL, (temp | UARTCTRL_TIE));
> +
> +    return;

There is no need for an explicit return here.

> +}
> +
> +static void imx_lpuart_stop_tx(struct serial_port *port)
> +{
> +    struct imx_lpuart *uart = port->uart;
> +    unsigned int temp;
> +
> +    temp = imx_lpuart_read(uart, UARTCTRL);
> +    temp &= ~(UARTCTRL_TIE | UARTCTRL_TCIE);
> +    imx_lpuart_write(uart, UARTCTRL, temp);
> +
> +    return;

There is no need for an explicit return here.

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
> +                                     const void *data)
> +{
> +    const char *config = data;
> +    struct imx_lpuart *uart;
> +    u32 clkspec;
> +    int res;
> +    u64 addr, size;
> +
> +    if ( strcmp(config, "") )
> +        printk("WARNING: UART configuration is not supported\n");
> +
> +    uart = &imx8_com;
> +
> +    res = dt_property_read_u32(dev, "clock-frequency", &clkspec);
> +    if ( !res )
> +    {
> +	res = dt_property_read_u32(dev, "assigned-clock-rates", &clkspec);
> +	if ( !res )
> +	{
> +		printk("imx-uart: Unable to retrieve the clock frequency\n");
> +		return -EINVAL;
> +	}
> +    }
> +
> +    uart->clock_hz = clkspec;
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
> +};
> +
> +DT_DEVICE_START(imx_lpuart, "i.MX LPUART", DEVICE_SERIAL)
> +    .dt_match = imx_lpuart_dt_compat,
> +    .init = imx_lpuart_init,
> +DT_DEVICE_END
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

NIT: For single bit, I find easier to reason when using shift. I.e:

1U << X

or

BIT(X).

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

Cheers,

-- 
Julien Grall

