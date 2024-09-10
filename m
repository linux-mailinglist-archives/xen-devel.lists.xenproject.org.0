Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D811497451C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 23:56:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796071.1205572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so8q6-0003Bz-K5; Tue, 10 Sep 2024 21:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796071.1205572; Tue, 10 Sep 2024 21:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so8q6-0003AK-HS; Tue, 10 Sep 2024 21:55:58 +0000
Received: by outflank-mailman (input) for mailman id 796071;
 Tue, 10 Sep 2024 21:55:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1so8q5-0003AE-K9
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 21:55:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1so8q5-0001lp-1D; Tue, 10 Sep 2024 21:55:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1so8q4-0005W0-NY; Tue, 10 Sep 2024 21:55:56 +0000
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
	bh=9U2Mfn5iku5HyX/Hacf4qtlSL4DE34MgnTgj9+UnKqs=; b=0EXHLTJXDyzfyqZfKyrscTGOEW
	BV1S6515AFtWxIxRMmQ6G2uh6uWzo1fSBXHqIUoWmaXrExKACgrlkO2S45aB//NIdCHdCsrT0UHvK
	+p/fkgyGT22vTYfTb/UQpc16RIOW+j/KsZ21v8Ronjkn1St+0YR3d2WlxvhgpGbys8F8=;
Message-ID: <bec9c46e-4b26-4b2a-a3e4-e27b8addd954@xen.org>
Date: Tue, 10 Sep 2024 22:55:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] xen/arm: Add NXP LINFlexD UART Driver
Content-Language: en-GB
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
 <20240910143411.178704-2-andrei.cherechesu@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240910143411.178704-2-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/09/2024 15:34, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> The LINFlexD UART is an UART controller available on NXP S32
> processors family targeting automotive (for example: S32G2, S32G3,
> S32R).
> 
> S32G3 Reference Manual:
> https://www.nxp.com/webapp/Download?colCode=RMS32G3.

It looks like you need to create an account. Is there any public version 
of the specification?

> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> Signed-off-by: Peter van der Perk <peter.vander.perk@nxp.com>
> ---
>   xen/arch/arm/include/asm/linflex-uart.h |  62 ++++
>   xen/drivers/char/Kconfig                |   8 +
>   xen/drivers/char/Makefile               |   1 +
>   xen/drivers/char/linflex-uart.c         | 365 ++++++++++++++++++++++++
>   4 files changed, 436 insertions(+)
>   create mode 100644 xen/arch/arm/include/asm/linflex-uart.h
>   create mode 100644 xen/drivers/char/linflex-uart.c
> 
> diff --git a/xen/arch/arm/include/asm/linflex-uart.h b/xen/arch/arm/include/asm/linflex-uart.h
> new file mode 100644
> index 0000000000..62dc54d155
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/linflex-uart.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

The identifier GPL-2.0 was deprecated (see LICENSES/GPL-2.0). The new 
tag should be GPL-2.0-only. The resulting license is the same.

> +/*
> + * xen/arch/arm/include/asm/linflex-uart.h
> + *
> + * Common constant definition between early printk and the UART driver
> + * for NXP LINFlexD UART.
> + *
> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
> + * Copyright 2018, 2021, 2024 NXP
> + */
> +
> +#ifndef __ASM_ARM_LINFLEX_UART_H
> +#define __ASM_ARM_LINFLEX_UART_H
> +
> +/* 32-bit register offsets */
> +#define LINCR1          (0x0)
> +#define LINIER          (0x4)
> +#define LINSR           (0x8)
> +#define UARTCR          (0x10)
> +#define UARTSR          (0x14)
> +#define LINFBRR         (0x24)
> +#define LINIBRR         (0x28)
> +#define BDRL            (0x38)
> +#define BDRM            (0x3C)
> +#define UARTPTO         (0x50)
> +
> +#define LINCR1_INIT     BIT(0, U)
> +#define LINCR1_MME      BIT(4, U)
> +#define LINCR1_BF       BIT(7, U)
> +
> +#define LINSR_LINS      GENMASK(15, 12)
> +#define LINSR_LINS_INIT BIT(12, U)
> +
> +#define LINIER_DRIE     BIT(2, U)
> +#define LINIER_DTIE     BIT(1, U)
> +
> +#define UARTCR_UART     BIT(0, U)
> +#define UARTCR_WL0      BIT(1, U)
> +#define UARTCR_PC0      BIT(3, U)
> +#define UARTCR_TXEN     BIT(4, U)
> +#define UARTCR_RXEN     BIT(5, U)
> +#define UARTCR_PC1      BIT(6, U)
> +#define UARTCR_TFBM     BIT(8, U)
> +#define UARTCR_RFBM     BIT(9, U)
> +#define UARTCR_RDFLRFC  GENMASK(12, 10)
> +#define UARTCR_TDFLTFC  GENMASK(15, 13)
> +#define UARTCR_ROSE     BIT(23, U)
> +#define UARTCR_OSR      GENMASK(27, 24)
> +
> +#define UARTSR_DTFTFF   BIT(1, U)
> +#define UARTSR_DRFRFE   BIT(2, U)
> +
> +#endif /* __ASM_ARM_LINFLEX_UART_H */
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
> index 3f836ab301..e175d07c02 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -13,6 +13,14 @@ config HAS_CADENCE_UART
>   	  This selects the Xilinx Zynq Cadence UART. If you have a Xilinx Zynq
>   	  based board, say Y.
>   
> +config HAS_LINFLEX
> +	bool "NXP LINFlexD UART driver"
> +	default y
> +	depends on ARM_64
> +	help
> +	  This selects the NXP LINFlexD UART. If you have an NXP S32G or S32R
> +	  based board, say Y.
> +
>   config HAS_IMX_LPUART
>   	bool "i.MX LPUART driver"
>   	default y
> diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
> index e7e374775d..d3b987da1d 100644
> --- a/xen/drivers/char/Makefile
> +++ b/xen/drivers/char/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_HAS_SCIF) += scif-uart.o
>   obj-$(CONFIG_HAS_EHCI) += ehci-dbgp.o
>   obj-$(CONFIG_XHCI) += xhci-dbc.o
>   obj-$(CONFIG_HAS_IMX_LPUART) += imx-lpuart.o
> +obj-$(CONFIG_HAS_LINFLEX) += linflex-uart.o
>   obj-$(CONFIG_ARM) += arm-uart.o
>   obj-y += serial.o
>   obj-$(CONFIG_XEN_GUEST) += xen_pv_console.o
> diff --git a/xen/drivers/char/linflex-uart.c b/xen/drivers/char/linflex-uart.c
> new file mode 100644
> index 0000000000..4ca8f732ae
> --- /dev/null
> +++ b/xen/drivers/char/linflex-uart.c
> @@ -0,0 +1,365 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Ditto.

> +/*
> + * xen/drivers/char/linflex-uart.c
> + *
> + * Driver for NXP LINFlexD UART.
> + *
> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
> + * Copyright 2018, 2021-2022, 2024 NXP
> + */
> +
> +#include <xen/config.h>
> +#include <xen/console.h>
> +#include <xen/errno.h>
> +#include <xen/serial.h>

In Xen, we tend to order the include alphabetically within the same 
directory. So this wants to be after xen/mm.h.

> +#include <xen/init.h>
> +#include <xen/irq.h>
> +#include <xen/mm.h>
> +#include <asm/device.h>
> +#include <asm/io.h>
> +#include <asm/linflex-uart.h>
> +
> +#define LINFLEX_CLK_FREQ        (125000000)
> +#define LINFLEX_BAUDRATE        (115200)
> +#define LINFLEX_LDIV_MULTIPLIER (16)
> +
> +static struct linflex_uart {
> +    uint32_t baud, clock_hz;
> +    uint32_t irq;
> +    char __iomem *regs;
> +    struct irqaction irqaction;
> +    struct vuart_info vuart;
> +} linflex_com;
> +
> +static uint32_t linflex_uart_readl(struct linflex_uart *uart, uint32_t off)
> +{
> +    return readl(uart->regs + off);
> +}
> +
> +static void linflex_uart_writel(struct linflex_uart *uart, uint32_t off,
> +                                uint32_t val)
> +{
> +    writel(val, uart->regs + off);
> +}
> +
> +static void linflex_uart_writeb(struct linflex_uart *uart, uint32_t off,
> +                                uint8_t val)
> +{
> +    writeb(val, uart->regs + off);
> +}
> +
> +static uint32_t linflex_uart_get_osr(uint32_t uartcr)
> +{
> +    return (uartcr & UARTCR_OSR) >> 24;

Please provide a define for 24. This would also make easier to correlate 
with UARTCR_OSR.

> +}
> +
> +static uint32_t linflex_uart_tx_fifo_mode(struct linflex_uart *uart)

AFAICT, UARTCR_TFBM is one-bit. So should this return a bool?

> +{
> +    return linflex_uart_readl(uart, UARTCR) & UARTCR_TFBM;
> +}
> +
> +static uint32_t linflex_uart_rx_fifo_mode(struct linflex_uart *uart)

Same here.

> +{
> +    return linflex_uart_readl(uart, UARTCR) & UARTCR_RFBM;
> +}
> +
> +static uint32_t linflex_uart_ldiv_multiplier(struct linflex_uart *uart)
> +{
> +    uint32_t uartcr, mul = LINFLEX_LDIV_MULTIPLIER;
> +
> +    uartcr = linflex_uart_readl(uart, UARTCR);
> +    if ( uartcr & UARTCR_ROSE )
> +        mul = linflex_uart_get_osr(uartcr);
> +
> +    return mul;
> +}
> +
> +static void linflex_uart_flush(struct serial_port *port)
> +{
> +	struct linflex_uart *uart = port->uart;

Above, youa re using tab hard but above you use soft tab. Is the code 
intended to follow Xen coding style? If so, you want to use soft tab.

> +
> +	if ( linflex_uart_tx_fifo_mode(uart) )
> +		while ( linflex_uart_readl(uart, UARTCR) & UARTCR_TDFLTFC );
> +            cpu_relax();

The indentation is really confusing here. It leads to think that 
cpu_relax() should be part of while() but you are using ';'. I guess you 
really intended to have cpu_relax() within the while loop?

> +
> +	if ( linflex_uart_rx_fifo_mode(uart) )
> +		while ( linflex_uart_readl(uart, UARTCR) & UARTCR_RDFLRFC );
> +            cpu_relax();

Same here.

> +}
> +
> +static void __init linflex_uart_init_preirq(struct serial_port *port)
> +{
> +    struct linflex_uart *uart = port->uart;
> +    uint32_t ibr, fbr, divisr, dividr, ctrl;
> +
> +    /* Disable RX/TX before init mode */
> +    ctrl = linflex_uart_readl(uart, UARTCR);
> +    ctrl &= ~(UARTCR_RXEN | UARTCR_TXEN);
> +    linflex_uart_writel(uart, UARTCR, ctrl);
> +
> +    /*
> +    * Smoothen the transition from early_printk by waiting
> +    * for all pending characters to transmit
> +    */

The indentation for comment in Xen is:

/*
  * Foor
  * Bar
  */

> +    linflex_uart_flush(port);
> +
> +    /* Init mode */
> +    ctrl = LINCR1_INIT;
> +    linflex_uart_writel(uart, LINCR1, ctrl);
> +
> +    /* Waiting for init mode entry */
> +    while ( (linflex_uart_readl(uart, LINSR) & LINSR_LINS) != LINSR_LINS_INIT )
> +        cpu_relax();
> +
> +    /* Set Master Mode */
> +    ctrl |= LINCR1_MME;
> +    linflex_uart_writel(uart, LINCR1, ctrl);
> +
> +    /* Provide data bits, parity, stop bit, etc */
> +    divisr = uart->clock_hz;
> +    dividr = (uint32_t)(uart->baud * linflex_uart_ldiv_multiplier(uart));
> +
> +    ibr = (uint32_t)(divisr / dividr);
> +    fbr = (uint32_t)((divisr % dividr) * 16 / dividr) & 0xF;

On the 3 lines above, why do you need to cast to 32-bit? Is this because 
the result is 64-bit? If so, why do you need to ignore the top bits?

> 
> +    linflex_uart_writel(uart, LINIBRR, ibr);
> +    linflex_uart_writel(uart, LINFBRR, fbr);
> +
> +    /* Set preset timeout register value */
> +    linflex_uart_writel(uart, UARTPTO, 0xF);
> +
> +    /* Setting UARTCR[UART] bit is required for writing other bits in UARTCR */
> +    linflex_uart_writel(uart, UARTCR, UARTCR_UART);
> +
> +    /* 8 bit data, no parity, UART mode, Buffer mode */
> +    linflex_uart_writel(uart, UARTCR, UARTCR_PC1 | UARTCR_PC0 | UARTCR_WL0 |
> +                        UARTCR_UART);
> +
> +    /* end init mode */
> +    ctrl = linflex_uart_readl(uart, LINCR1);
> +    ctrl &= ~LINCR1_INIT;
> +    linflex_uart_writel(uart, LINCR1, ctrl);
> +
> +    /* Enable RX/TX after exiting init mode */
> +    ctrl = linflex_uart_readl(uart, UARTCR);
> +    ctrl |= UARTCR_RXEN | UARTCR_TXEN;
> +    linflex_uart_writel(uart, UARTCR, ctrl);
> +}
> +
> +static void linflex_uart_interrupt(int irq, void *data)
> +{
> +    struct serial_port *port = data;
> +    struct linflex_uart *uart = port->uart;
> +    uint32_t sts;
> +
> +    sts = linflex_uart_readl(uart, UARTSR);
> +
> +    if ( sts & UARTSR_DRFRFE )
> +        serial_rx_interrupt(port);
> +
> +    if ( sts & UARTSR_DTFTFF )
> +        serial_tx_interrupt(port);
> +}
> +
> +static void __init linflex_uart_init_postirq(struct serial_port *port)
> +{
> +    struct linflex_uart *uart = port->uart;
> +    uint32_t temp;
> +
> +    uart->irqaction.handler = linflex_uart_interrupt;
> +    uart->irqaction.name = "linflex_uart";
> +    uart->irqaction.dev_id = port;
> +
> +    if ( setup_irq(uart->irq, 0, &uart->irqaction) != 0 )
> +    {
> +        dprintk(XENLOG_ERR, "Failed to allocate linflex_uart IRQ %d\n",
> +                uart->irq);

NIT: This should only be called once during boot. So I would consider to 
use printk() so it can be printed in production.

> +        return;
> +    }
> +
> +    /* Enable interrupts */
> +    temp = linflex_uart_readl(uart, LINIER);
> +    temp |= (LINIER_DRIE | LINIER_DTIE);
> +    linflex_uart_writel(uart, LINIER, temp);
> +    dprintk(XENLOG_DEBUG, "IRQ %d enabled\n", uart->irq);

Same here.

> +}
> +
> +static int linflex_uart_tx_ready(struct serial_port *port)
> +{
> +    struct linflex_uart *uart = port->uart;
> +
> +    if ( linflex_uart_tx_fifo_mode(uart) )
> +        return (linflex_uart_readl(uart, UARTSR) & UARTSR_DTFTFF) == 0 ? 1 : 0;
> +
> +    /*
> +    * Buffer Mode => TX is waited to be ready after sending a char,
> +    * so we can assume it is always ready before.
> +    */

Coding style. See above how it should be done for multi-line comments.

> +    return 1;
> +}
> +
> +static void linflex_uart_putc(struct serial_port *port, char c)
> +{
> +    struct linflex_uart *uart = port->uart;
> +    uint32_t uartsr;
> +
> +    if ( c == '\n' )
> +        linflex_uart_putc(port, '\r');
> +
> +    linflex_uart_writeb(uart, BDRL, c);
> +
> +    /* Buffer Mode */
> +    if ( !linflex_uart_tx_fifo_mode(uart) )
> +    {
> +        while ( (linflex_uart_readl(uart, UARTSR) & UARTSR_DTFTFF) == 0 )
> +                cpu_relax();
> +
> +        uartsr = linflex_uart_readl(uart, UARTSR) | (UARTSR_DTFTFF);
> +        linflex_uart_writel(uart, UARTSR, uartsr);
> +    }
> +}
> +
> +static int linflex_uart_getc(struct serial_port *port, char *pc)
> +{
> +    struct linflex_uart *uart = port->uart;
> +    uint32_t ch, uartsr, rx_fifo_mode;
> +
> +    rx_fifo_mode = linflex_uart_rx_fifo_mode(uart);
> +
> +    if ( rx_fifo_mode )
> +        while ( linflex_uart_readl(uart, UARTSR) & UARTSR_DRFRFE )
> +            cpu_relax();
> +    else
> +        while ( !(linflex_uart_readl(uart, UARTSR) & UARTSR_DRFRFE) )
> +            cpu_relax();
> +
> +    ch = linflex_uart_readl(uart, BDRM);
> +    *pc = ch & 0xff;
> +
> +    if ( !rx_fifo_mode ) {
> +        uartsr = linflex_uart_readl(uart, UARTSR) | UARTSR_DRFRFE;
> +        linflex_uart_writel(uart, UARTSR, uartsr);
> +    }
> +
> +    return 1;
> +}
> +
> +static int __init linflex_uart_irq(struct serial_port *port)
> +{
> +    struct linflex_uart *uart = port->uart;
> +
> +    return ((uart->irq > 0) ? uart->irq : -1);
> +}
> +
> +static const struct vuart_info *linflex_uart_vuart_info(
> +                struct serial_port *port)
> +{
> +    struct linflex_uart *uart = port->uart;

NIT: You are not modifying uart. So this coul be const.

> +
> +    return &uart->vuart;
> +}
> +
> +static void linflex_uart_start_tx(struct serial_port *port)
> +{
> +    struct linflex_uart *uart = port->uart;
> +    uint32_t temp;
> +
> +    temp = linflex_uart_readl(uart, LINIER);
> +    linflex_uart_writel(uart, LINIER, temp | LINIER_DTIE);
> +}
> +
> +static void linflex_uart_stop_tx(struct serial_port *port)
> +{
> +    struct linflex_uart *uart = port->uart;
> +    uint32_t temp;
> +
> +    temp = linflex_uart_readl(uart, LINIER);
> +    temp &= ~(LINIER_DTIE);
> +    linflex_uart_writel(uart, LINIER, temp);
> +}
> +
> +static struct uart_driver __read_mostly linflex_uart_driver = {
> +    .init_preirq = linflex_uart_init_preirq,
> +    .init_postirq = linflex_uart_init_postirq,
> +    .tx_ready = linflex_uart_tx_ready,
> +    .putc = linflex_uart_putc,
> +    .flush = linflex_uart_flush,
> +    .getc = linflex_uart_getc,
> +    .irq = linflex_uart_irq,
> +    .start_tx = linflex_uart_start_tx,
> +    .stop_tx = linflex_uart_stop_tx,
> +    .vuart_info = linflex_uart_vuart_info,
> +};
> +
> +static int __init linflex_uart_init(struct dt_device_node *dev, const void *data)
> +{
> +    const char *config = data;
> +    struct linflex_uart *uart;
> +    paddr_t addr, size;
> +    int res;
> +
> +    if ( strcmp(config, "") )
> +        printk("WARNING: UART configuration is not supported\n");
> +
> +    uart = &linflex_com;
> +
> +    res = dt_device_get_paddr(dev, 0, &addr, &size);
> +    if ( res )
> +    {
> +        printk("linflex-uart: Unable to retrieve the base address of the UART\n");
> +        return res;
> +    }
> +
> +    res = platform_get_irq(dev, 0);
> +    if ( res < 0 )
> +    {
> +        printk("linflex-uart: Unable to retrieve the IRQ\n");
> +        return -EINVAL;
> +    }
> +    uart->irq = res;
> +
> +    uart->regs = ioremap_nocache(addr, size);
> +    if ( !uart->regs )
> +    {
> +        printk("linflex-uart: Unable to map the UART memory\n");
> +        return -ENOMEM;
> +    }
> +
> +    uart->clock_hz = LINFLEX_CLK_FREQ;
> +    uart->baud = LINFLEX_BAUDRATE;
> +
> +    uart->vuart.base_addr = addr;
> +    uart->vuart.size = size;
> +    uart->vuart.data_off = BDRL;
> +    uart->vuart.status_off = UARTSR;
> +    uart->vuart.status = UARTSR_DTFTFF;
> +
> +    /* Register with generic serial driver */
> +    serial_register_uart(SERHND_DTUART, &linflex_uart_driver, uart);
> +
> +    dt_device_set_used_by(dev, DOMID_XEN);
> +
> +    return 0;
> +}
> +
> +static const struct dt_device_match linflex_uart_dt_compat[] __initconst =
> +{
> +    DT_MATCH_COMPATIBLE("nxp,s32g2-linflexuart"),
> +    DT_MATCH_COMPATIBLE("nxp,s32g3-linflexuart"),
> +    DT_MATCH_COMPATIBLE("fsl,s32v234-linflexuart"),
> +    { /* sentinel */ },
> +};
> +
> +DT_DEVICE_START(linflex_uart, "NXP LINFlexD UART", DEVICE_SERIAL)
> +    .dt_match = linflex_uart_dt_compat,
> +    .init = linflex_uart_init,
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

Cheers,

-- 
Julien Grall


