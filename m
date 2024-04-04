Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4778981B4
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 08:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700695.1094234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsGzn-00037l-Et; Thu, 04 Apr 2024 06:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700695.1094234; Thu, 04 Apr 2024 06:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsGzn-00035G-B2; Thu, 04 Apr 2024 06:54:47 +0000
Received: by outflank-mailman (input) for mailman id 700695;
 Thu, 04 Apr 2024 06:54:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OVy+=LJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rsGzl-000356-8Q
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 06:54:45 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 357d64e6-f250-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 08:54:41 +0200 (CEST)
Received: from BN1PR12CA0021.namprd12.prod.outlook.com (2603:10b6:408:e1::26)
 by SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 06:54:37 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:e1:cafe::83) by BN1PR12CA0021.outlook.office365.com
 (2603:10b6:408:e1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Thu, 4 Apr 2024 06:54:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 06:54:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 01:54:36 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 01:54:35 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 4 Apr 2024 01:54:33 -0500
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
X-Inumbo-ID: 357d64e6-f250-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eo1KU1tGqmu+/SB9+C3Syub0Mi+W8ebP/cQ/K0Y9jRKEqKZMJghcSDhp0q+Y8D6NPGOAsiltuIPNRfqG4yW4XXcw33wD1VqaJnWIWyQKVqSKbqZgXk2CY7uVu3dD6BRkSe3gReazPqPUFFtPMBGvZkd8QjIK3bsoUzk1nS5CS+/10m4zcxfCNosmFf2DsiBlfs4At+9Q68xLRUcAz5i59g4R41T0qPgPZRe1inuritLcl3HFWlEoG5t/B7RV3jttfaFH/c+GE9mAL6ugmqTjblRkdjT1yr5oOGYuy6jXCLUfYQO9F87uRIyuHnj+o/bhLQUIIyyIx3bIuENZt1MSAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UbYH4+NTQxPVTF6EP9raZjdUvLv2cGV5kEpa7+skVc=;
 b=KarquyIB94RGiVAFVugXlSi3ohzG/6XXKdFgEt0/D9QzBTsi0sceispUskslnZkjJDiww01xnAgdDbDZNZRLn0TJHRfcwIVZBU7MaO2iX4EQhF/9J081ujZDVCr7lGkwYm7b5feAUlMso9I9ZGOO4r7KjY+h2643H3XP2cNV+IqQOhGJLuynSdxntrpOeb8OLMRx+xVLrGa6oC9Us56bDm1gidjaIylC4i3WWqZIVkt4EfmvSmetesJUTOdoAJSVBUxncbO8cr7+nb20YgpmiaaYyz85183fwPbHCJFkCvrI6baNHnshZIfUPEbFypiw3nNikiVHeqrxhgRcOkIr+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UbYH4+NTQxPVTF6EP9raZjdUvLv2cGV5kEpa7+skVc=;
 b=h9Jetum4uJM3hfTpjjYQElmb0ENRJd6Q09hIN3a8aU9LXXcmVBcjIDySl+sUvzXVZ7/snKnkwAmnvmsAFxZmL2Sh4CuUKD2vZHAG2oMobXVgxeWps1oadwmpOvm9tPqTrVNLkw8NaBZim+XtLqxVx1H8lwElckShlUr0V5yD7AY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <db85de43-dd68-4362-b5c9-62ab704c7055@amd.com>
Date: Thu, 4 Apr 2024 08:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 2/2] xen/arm: Add i.MX UART driver
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Peng Fan <peng.fan@nxp.com>
References: <20240402120557.1822253-1-olekstysh@gmail.com>
 <20240402120557.1822253-3-olekstysh@gmail.com>
Content-Language: en-US
In-Reply-To: <20240402120557.1822253-3-olekstysh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|SA1PR12MB8599:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec896c0-8559-4428-d684-08dc547417aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IqR/ssRhKhHSJMShWkDVdy81XcQo2MQ9xXSb/OzgTpGn9uHKjgpXW1IEDVDflqL5UXMU8ZQmLksiaob49o0QPQ1usB+7o61I+tcArGwMmlh/3E0m7uua+GZN63BcRGoCE8/MTPoXMFrpGNd5ck/9gvR+E6m8VPFxPDAS5EN/AfGppybsdcytDbl0nHDYLcAuIGXHITnCqCplMKL7Qh5Vdpx581Tvhm3v/pTIG/cz7+sjhya4etoCc4UD0qcZ1BIUwSfGyemgmCwapXPRlGuBe+BhniTyb1wXTrqUge4h1UdETNwtJ7moF1bcVzVRjNMVaiOs0XoyS58yPkZlsNwajokkKNgkqNjgrvGl1L2GwZAbEAdHvg1lPP+OrwIsQt0qYnE4Xrlsf2LXZuaInAmNAahaz+BwenhfJMzYkgvxO9YNOQpWoui/P1NjisSN6AO/UK6PpmPqo9mNCmo65EYagcgOPq99DP8D/fzZEFCenRcZGlzwKZ/V0RgMpDUGrlxgvlkP/P/9wVs67Y04kS3eC310mIAU4edGhn4ggtTBzR65z+BuxrUb40eD3Kzp0exj10xxjwBZdWJpHZLFP09f5vmSAM9pzQLl+tr/JYe58d680N6HNNT1UbxuSJUaLXvWaHtVS3PcqTaUAf2fQO8Vh5t2oBqnF1ExOfxTjrWzNkQgkQ1zjNsc35Ho54/u0jLXcwAazsGpgO/N+axuaAElkA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 06:54:36.7748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec896c0-8559-4428-d684-08dc547417aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8599

Hi Oleksandr,

On 02/04/2024 14:05, Oleksandr Tyshchenko wrote:
> 
> 
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The i.MX UART Documentation:
> https://www.nxp.com/webapp/Download?colCode=IMX8MMRM
> Chapter 16.2 Universal Asynchronous Receiver/Transmitter (UART)
> 
> Tested on i.MX 8M Mini only, but I guess, it should be
imperative mood

> suitable for other i.MX8M* SoCs (those UART device tree nodes
> contain "fsl,imx6q-uart" compatible string).
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> I used the "earlycon=ec_imx6q,0x30890000" cmd arg and
> selected CONFIG_SERIAL_IMX_EARLYCON in Linux for enabling vUART.
> ---
> ---
>  MAINTAINERS                 |   1 +
>  xen/drivers/char/Kconfig    |   7 +
>  xen/drivers/char/Makefile   |   1 +
>  xen/drivers/char/imx-uart.c | 299 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 308 insertions(+)
>  create mode 100644 xen/drivers/char/imx-uart.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1bd22fd75f..bd4084fd20 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -249,6 +249,7 @@ F:  xen/drivers/char/arm-uart.c
>  F:     xen/drivers/char/cadence-uart.c
>  F:     xen/drivers/char/exynos4210-uart.c
>  F:     xen/drivers/char/imx-lpuart.c
> +F:     xen/drivers/char/imx-uart.c
>  F:     xen/drivers/char/meson-uart.c
>  F:     xen/drivers/char/mvebu-uart.c
>  F:     xen/drivers/char/omap-uart.c
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index e18ec3788c..f51a1f596a 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -20,6 +20,13 @@ config HAS_IMX_LPUART
>         help
>           This selects the i.MX LPUART. If you have i.MX8QM based board, say Y.
> 
> +config HAS_IMX_UART
> +       bool "i.MX UART driver"
> +       default y
> +       depends on ARM_64
> +       help
> +         This selects the i.MX UART. If you have i.MX8M* based board, say Y.
> +
>  config HAS_MVEBU
>         bool "Marvell MVEBU UART driver"
>         default y
> diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
> index e7e374775d..147530a1ed 100644
> --- a/xen/drivers/char/Makefile
> +++ b/xen/drivers/char/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_HAS_SCIF) += scif-uart.o
>  obj-$(CONFIG_HAS_EHCI) += ehci-dbgp.o
>  obj-$(CONFIG_XHCI) += xhci-dbc.o
>  obj-$(CONFIG_HAS_IMX_LPUART) += imx-lpuart.o
> +obj-$(CONFIG_HAS_IMX_UART) += imx-uart.o
>  obj-$(CONFIG_ARM) += arm-uart.o
>  obj-y += serial.o
>  obj-$(CONFIG_XEN_GUEST) += xen_pv_console.o
> diff --git a/xen/drivers/char/imx-uart.c b/xen/drivers/char/imx-uart.c
> new file mode 100644
> index 0000000000..13bb189063
> --- /dev/null
> +++ b/xen/drivers/char/imx-uart.c
> @@ -0,0 +1,299 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
Can it be GPL-2.0-only? Some companies are worried about v3.

> +/*
> + * xen/drivers/char/imx-uart.c
> + *
> + * Driver for i.MX UART.
> + *
> + * Based on Linux's drivers/tty/serial/imx.c
> + *
> + * Copyright (C) 2024 EPAM Systems Inc.
> + */
> +
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/irq.h>
> +#include <xen/mm.h>
> +#include <xen/serial.h>
> +#include <asm/device.h>
> +#include <asm/imx-uart.h>
> +#include <asm/io.h>
> +
> +#define imx_uart_read(uart, off)          readl((uart)->regs + (off))
> +#define imx_uart_write(uart, off, val)    writel((val), (uart)->regs + (off))
> +
> +static struct imx_uart {
> +    uint32_t baud, clock_hz, data_bits, parity, stop_bits, fifo_size;
What's the use of these variables? AFAICT they are set but never used.

> +    uint32_t irq;
unsigned int

> +    char __iomem *regs;
> +    struct irqaction irqaction;
> +    struct vuart_info vuart;
> +} imx_com;
> +
> +static void imx_uart_interrupt(int irq, void *data)
> +{
> +    struct serial_port *port = data;
> +    struct imx_uart *uart = port->uart;
> +    uint32_t usr1, usr2;
> +
> +    usr1 = imx_uart_read(uart, USR1);
> +    usr2 = imx_uart_read(uart, USR2);
> +
> +    if ( usr1 & (USR1_RRDY | USR1_AGTIM) )
> +    {
> +        imx_uart_write(uart, USR1, USR1_AGTIM);
> +        serial_rx_interrupt(port);
> +    }
> +
> +    if ( (usr1 & USR1_TRDY) || (usr2 & USR2_TXDC) )
> +        serial_tx_interrupt(port);
> +}
> +
> +static void imx_uart_clear_rx_errors(struct serial_port *port)
> +{
> +    struct imx_uart *uart = port->uart;
> +    uint32_t usr1, usr2;
> +
> +    usr1 = imx_uart_read(uart, USR1);
> +    usr2 = imx_uart_read(uart, USR2);
> +
> +    if ( usr2 & USR2_BRCD )
> +        imx_uart_write(uart, USR2, USR2_BRCD);
> +    else if ( usr1 & USR1_FRAMERR )
> +        imx_uart_write(uart, USR1, USR1_FRAMERR);
> +    else if ( usr1 & USR1_PARITYERR )
> +        imx_uart_write(uart, USR1, USR1_PARITYERR);
> +
> +    if ( usr2 & USR2_ORE )
> +        imx_uart_write(uart, USR2, USR2_ORE);
> +}
> +
> +static void __init imx_uart_init_preirq(struct serial_port *port)
> +{
> +    struct imx_uart *uart = port->uart;
> +    uint32_t reg;
> +
> +    /*
> +     * Wait for the transmission to complete. This is needed for a smooth
> +     * transition when we come from early printk.
> +     */
> +    while ( !(imx_uart_read(uart, USR2) & USR2_TXDC) )
> +        cpu_relax();
> +
> +    /* Set receiver/transmitter trigger level */
> +    reg = imx_uart_read(uart, UFCR);
> +    reg &= (UFCR_RFDIV | UFCR_DCEDTE);
> +    reg |= TXTL_DEFAULT << UFCR_TXTL_SHF | RXTL_DEFAULT;
please surround TXTL_DEFAULT << UFCR_TXTL_SHF with parentheses

> +    imx_uart_write(uart, UFCR, reg);
> +
> +    /* Enable UART and disable interrupts/DMA */
> +    reg = imx_uart_read(uart, UCR1);
> +    reg |= UCR1_UARTEN;
> +    reg &= ~(UCR1_TRDYEN | UCR1_TXMPTYEN | UCR1_RTSDEN | UCR1_RRDYEN |
> +             UCR1_RXDMAEN | UCR1_TXDMAEN | UCR1_ATDMAEN);
> +    imx_uart_write(uart, UCR1, reg);
> +
> +    /* Enable receiver/transmitter and disable Aging Timer */
> +    reg = imx_uart_read(uart, UCR2);
> +    reg |= UCR2_RXEN | UCR2_TXEN;
> +    reg &= ~UCR2_ATEN;
> +    imx_uart_write(uart, UCR2, reg);
> +
> +    /* Disable interrupts */
> +    reg = imx_uart_read(uart, UCR4);
> +    reg &= ~(UCR4_TCEN | UCR4_DREN);
> +    imx_uart_write(uart, UCR4, reg);
> +}
> +
> +static void __init imx_uart_init_postirq(struct serial_port *port)
> +{
> +    struct imx_uart *uart = port->uart;
> +
> +    uart->irqaction.handler = imx_uart_interrupt;
> +    uart->irqaction.name = "imx_uart";
> +    uart->irqaction.dev_id = port;
> +
> +    if ( setup_irq(uart->irq, 0, &uart->irqaction) != 0 )
> +    {
> +        dprintk(XENLOG_ERR, "Failed to allocate imx_uart IRQ %d\n", uart->irq);
Wrong format specifier for unsigned, use %u
Also, why dprintk?

> +        return;
> +    }
> +
> +    /* Clear possible receiver errors */
> +    imx_uart_clear_rx_errors(port);
> +
> +    /* Enable interrupts */
> +    imx_uart_write(uart, UCR1, imx_uart_read(uart, UCR1) |
> +                   UCR1_RRDYEN | UCR1_TRDYEN);
> +    imx_uart_write(uart, UCR2, imx_uart_read(uart, UCR2) | UCR2_ATEN);
> +}
> +
> +static void imx_uart_suspend(struct serial_port *port)
> +{
> +    BUG();
> +}
no need for this function

> +
> +static void imx_uart_resume(struct serial_port *port)
> +{
> +    BUG();
> +}
no need for this function

> +
> +static int imx_uart_tx_ready(struct serial_port *port)
> +{
> +    struct imx_uart *uart = port->uart;
can be const

> +    uint32_t reg;
> +
> +    reg = imx_uart_read(uart, IMX21_UTS);
> +    if ( reg & UTS_TXEMPTY )
> +        return TX_FIFO_SIZE;
empty line here please

> +    if ( reg & UTS_TXFULL )
> +        return 0;
> +
> +    /*
> +     * If the FIFO is neither full nor empty then there is a space for
> +     * one char at least.
> +     */
> +    return 1;
> +}
> +
> +static void imx_uart_putc(struct serial_port *port, char c)
> +{
> +    struct imx_uart *uart = port->uart;
can be const

> +
> +    while ( imx_uart_read(uart, IMX21_UTS) & UTS_TXFULL )
> +        cpu_relax();
Looking at pl011, cdns, putc contains only a write to data register. This is because
->putc always follows ->tx_ready which contains the check for how many chars can be written.
Therefore, AFAICT this should be dropped.

> +
> +    imx_uart_write(uart, URTX0, c);
> +}
> +
> +static int imx_uart_getc(struct serial_port *port, char *pc)
> +{
> +    struct imx_uart *uart = port->uart;
can be const

> +    uint32_t data;
> +
> +    if ( !(imx_uart_read(uart, USR2) & USR2_RDR) )
> +        return 0;
> +
> +    data = imx_uart_read(uart, URXD0);
> +    *pc = data & URXD_RX_DATA;
> +
> +    if ( unlikely(data & URXD_ERR) )
> +        imx_uart_clear_rx_errors(port);
> +
> +    return 1;
> +}
> +
> +static int __init imx_uart_irq(struct serial_port *port)
> +{
> +    struct imx_uart *uart = port->uart;
can be const

> +
> +    return ((uart->irq > 0) ? uart->irq : -1);
> +}
> +
> +static const struct vuart_info *imx_uart_vuart_info(struct serial_port *port)
> +{
> +    struct imx_uart *uart = port->uart;
can be const

> +
> +    return &uart->vuart;
> +}
> +
> +static void imx_uart_start_tx(struct serial_port *port)
> +{
> +    struct imx_uart *uart = port->uart;
> +
> +    imx_uart_write(uart, UCR1, imx_uart_read(uart, UCR1) | UCR1_TRDYEN);
> +}
> +
> +static void imx_uart_stop_tx(struct serial_port *port)
> +{
> +    struct imx_uart *uart = port->uart;
> +
> +    imx_uart_write(uart, UCR1, imx_uart_read(uart, UCR1) & ~UCR1_TRDYEN);
> +}
> +
> +static struct uart_driver __read_mostly imx_uart_driver = {
> +    .init_preirq = imx_uart_init_preirq,
> +    .init_postirq = imx_uart_init_postirq,
> +    .endboot = NULL,
> +    .suspend = imx_uart_suspend,
> +    .resume = imx_uart_resume,
no need to assign a value for these 3 members

> +    .tx_ready = imx_uart_tx_ready,
> +    .putc = imx_uart_putc,
> +    .getc = imx_uart_getc,
> +    .irq = imx_uart_irq,
> +    .start_tx = imx_uart_start_tx,
> +    .stop_tx = imx_uart_stop_tx,
> +    .vuart_info = imx_uart_vuart_info,
> +};
> +
> +static int __init imx_uart_init(struct dt_device_node *dev, const void *data)
> +{
> +    const char *config = data;
> +    struct imx_uart *uart;
> +    int res;
> +    paddr_t addr, size;
> +
> +    if ( strcmp(config, "") )
> +        printk("WARNING: UART configuration is not supported\n");
> +
> +    uart = &imx_com;
> +
> +    uart->baud = 115200;
> +    uart->data_bits = 8;
> +    uart->parity = 0;
> +    uart->stop_bits = 1;
They are set but never used

> +
> +    res = dt_device_get_paddr(dev, 0, &addr, &size);
> +    if ( res )
> +    {
> +        printk("imx-uart: Unable to retrieve the base address of the UART\n");
> +        return res;
> +    }
> +
> +    res = platform_get_irq(dev, 0);
> +    if ( res < 0 )
> +    {
> +        printk("imx-uart: Unable to retrieve the IRQ\n");
> +        return -EINVAL;
> +    }
> +    uart->irq = res;
> +
> +    uart->regs = ioremap_nocache(addr, size);
> +    if ( !uart->regs )
> +    {
> +        printk("imx-uart: Unable to map the UART memory\n");
> +        return -ENOMEM;
> +    }
> +
> +    uart->vuart.base_addr = addr;
> +    uart->vuart.size = size;
> +    uart->vuart.data_off = URTX0;
> +    uart->vuart.status_off = IMX21_UTS;
> +    uart->vuart.status = UTS_TXEMPTY;
> +
> +    /* Register with generic serial driver */
> +    serial_register_uart(SERHND_DTUART, &imx_uart_driver, uart);
> +
> +    dt_device_set_used_by(dev, DOMID_XEN);
> +
> +    return 0;
> +}
> +
> +static const struct dt_device_match imx_uart_dt_compat[] __initconst =
> +{
> +    DT_MATCH_COMPATIBLE("fsl,imx6q-uart"),
> +    { /* sentinel */ },
> +};
> +
> +DT_DEVICE_START(imx_uart, "i.MX UART", DEVICE_SERIAL)
> +    .dt_match = imx_uart_dt_compat,
> +    .init = imx_uart_init,
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
> 2.34.1
> 

~Michal


