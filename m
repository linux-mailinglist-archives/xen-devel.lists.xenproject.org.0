Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 222A289AE1D
	for <lists+xen-devel@lfdr.de>; Sun,  7 Apr 2024 04:45:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701531.1095916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtIVX-0008Dr-RP; Sun, 07 Apr 2024 02:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701531.1095916; Sun, 07 Apr 2024 02:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtIVX-0008Bb-L4; Sun, 07 Apr 2024 02:43:47 +0000
Received: by outflank-mailman (input) for mailman id 701531;
 Sun, 07 Apr 2024 02:43:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=908l=LM=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1rtIVV-0008BV-6n
 for xen-devel@lists.xenproject.org; Sun, 07 Apr 2024 02:43:45 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20700.outbound.protection.outlook.com
 [2a01:111:f403:260d::700])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a503a10f-f488-11ee-afe6-a90da7624cb6;
 Sun, 07 Apr 2024 04:43:42 +0200 (CEST)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by VI1PR04MB7197.eurprd04.prod.outlook.com (2603:10a6:800:129::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Sun, 7 Apr
 2024 02:43:39 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7386.037; Sun, 7 Apr 2024
 02:43:39 +0000
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
X-Inumbo-ID: a503a10f-f488-11ee-afe6-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMj4WwWS4B40CIFjYegLtJq0lXVTvYyhC6wfKJLWFajDbtECNXiR62T+IQdW/Ea1Moji37jUJyJMRP5kULMvFf+agCxRAtPQ8K6B5Vf/KWwzFPbM2HACs9DNj1hAtvrFH7cXr8mLufRazx3bQc7tILHuujD7aA5rBZzFBXyLPih8aawYIzxq/BAgEP7AZ/zyipmLQiW1bHzASwOpUj/RTSAueDIL/vC15sl+UMBYvhYubw8i/RchkACB5GBWUMbf7QBYji8+LqopNo+MJczutTZPihUKsliFfrxmtdlbLlL+k2eHxWrA5R73dudFs2d2+Gh4sLvKfeM//KIRk5yi9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdU+OIeAM0D74nPdB4MwfzWsl1s91UovzbSQ0TToe+M=;
 b=PrFafbyJJrLJf/VULjFfC+JfyzFRsk5bnM7/FSo520Bmyo/JlzDKhxE/YcTtquLDirrvfUtMXHOt0QzPeBgQaJ0nanse1cNUFFdvo7/Q3Ez2WO8hiZLEK202P9q91KAFpkMfoaIUUIGnnUAdzBpfghvksjw/BxKOh/BP50CxPN+ESYWiaZie63PsWKejUvFK9mkF8vfPXCZY169ahJP4YiUqFzcJZOYf70xsKm5oxyI/FSHdkWOhPBxYKHs+dIks+b1janSdPuMnOw6jse95AtXOrgGzsNGuub1KquG4cUSZDPnHnQEiLldcF/Pujw9AZ/KF4B7AbDsIt6kSE2iCEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdU+OIeAM0D74nPdB4MwfzWsl1s91UovzbSQ0TToe+M=;
 b=p3TWUvWgaLivQgY9Nalnkc+k8iUQGmo1y4rpF539KWlBqj0qS4X5OWkDyBWVM9+H0M5ogxvmtAva2fMWiVgo2B9M4PCM99yZnqEi5xWynrAg6yUruu+oyG7BDVZl2r0XoZ3plUlvXLjGldMcGBdCYPym1LCZW4TI2U0+6O81pGI=
From: Peng Fan <peng.fan@nxp.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/2] xen/arm: Add i.MX UART driver
Thread-Topic: [PATCH 2/2] xen/arm: Add i.MX UART driver
Thread-Index: AQHahPYzLeSCkpjHAECKKkM2b3qxQLFcIEsw
Date: Sun, 7 Apr 2024 02:43:39 +0000
Message-ID:
 <DU0PR04MB94177A1E6DF1689353FD447C88012@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240402120557.1822253-1-olekstysh@gmail.com>
 <20240402120557.1822253-3-olekstysh@gmail.com>
In-Reply-To: <20240402120557.1822253-3-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|VI1PR04MB7197:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 XR3dG7grTy8WVmeybDWsH+OXYx4cgF/sn4lEmW17hIoSAMXlAWC6TrxVtHlNfGprQGXeW//fvKnqUUOfYC/IIHcIjztb3vMtMd125VJrLWXY5IaEPnXiNsiJpiO8mV508SX4xpmAY1BptvM/s+eOmFBqpnMN6bvLmW5kh7+BphfLcdb7uSsP5zNtj77I+xUXzhQDkvlUVOBSmn5kCUfkd4UMt1yjPcT61rYF3GGXhuZ4m2N44y1NOleIV3nOtXULN6tZZRLYgQSLT/uZ4tTKKwNBvpPlNANimgOBkdqTG7CJjGBmGWz7C0HHf6e1HSJZIbVwO8n56cSCjRK0mHmAlAoDfHIU9Rjh8xJTGYk9st8VXqpZ5bpaiEOFXNYILj8j7xer8Y5aUPQgZSgcLtrHaed+uSvIFoXgsUHifkBsqwlUg7TQIxYKBulBEhj8yzHwJaqkJ1pgopWNoxcdPynmb1f0f5SSQQk7aXnOdr/s1jTuD6dH6T+DyaDmHx4SMuq1G1OYZJOF1eRESW9F0zcZObzXXmcuyZIs+gFfR2IFg7ZSsIacN6f7Sl/cgZnRR9ZnvQypdsqIXs1xUkUWcKFsLxSKmexqdujvG0MtIoftM3ZJ/c07uO0C7SYCZP14OQQH8HqCpYd1tzRzvN2vV28+gGAyagPKXJB6Z8T/luJl/rM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?scSjjgw/WMF/p1p/qEUuRQNSMOjgr+yQrjRiYhe92Am8WF8bLx4OmgH+ZHZV?=
 =?us-ascii?Q?Azj3QUmdJ8l83o4J2sGA1gfSmIGuNAKF9QMQEqrTPKYOdYXE3zayyng01jhi?=
 =?us-ascii?Q?4YSuaDD5plUMnP/iB7olw/Q31h4JzTgLXvaGAE8yDQmqfeGgfdARRSNs9CfW?=
 =?us-ascii?Q?/oVexslvFg6qeQBwYM2RGajwnX6j4yjbc+pd7Kh7zpqaDexp2K7oWdcB0EGP?=
 =?us-ascii?Q?8/+JQokd4gQOejjQhk3G0p6/XeaZNsq8PGme1l2q/GzsCfcULA5fqwvXP0cB?=
 =?us-ascii?Q?66mlm7nDRCzXuFTzLx6Hfw/n1aqaytC8O3+Dj21HSvn9xyD/b3Et/aTFAXtl?=
 =?us-ascii?Q?p8U1rRTcyPyftR1KVingarVnJ4mfM4PFB1hV3UA/RENkKgJdRQN45mMsYK//?=
 =?us-ascii?Q?mMVxUV8mxf3EvjI43gx0mNemSCCFa83VnHeYMArKsuyviGEp/UtehH3ex5kG?=
 =?us-ascii?Q?FwLkIUOVloXXVyvZCKvkWhKp7Pqw9dvaqvKqZ8L/pFHv/TkJwSt6/8dYiNG5?=
 =?us-ascii?Q?3LWSehBt7H6rJhVO6mJMcdbYkRHAHZ1cBfUi2K7cBZdlHtP2eAVSjtqW0DH0?=
 =?us-ascii?Q?rLODbXo0Wi2WRmDbxrmup/17wA/zS8Id2XokyMYULfNFareW8IJcCHH4g8I4?=
 =?us-ascii?Q?h3DVCa+Fe3YPq8vYC2fdsx2sBN7ORigM9DaNOQBGDt4yV6dRQwdwNITRXdux?=
 =?us-ascii?Q?oloquFsO/Fn0ZGSTtWU78apv/S7kRwBTvQFJ37sIxZczIL2U7aDtCYh1lGbA?=
 =?us-ascii?Q?tsfZSQrtjkWG/NyWmVF7MpyQN3mBcoVTOPix7GZloWL5HMGeX8jrY5gXaRLF?=
 =?us-ascii?Q?pJuMylLxkxxd+1gJsufQkweWl4dDh2zHlvpVO+zghENomDGNCtcJ9Xj7YSYD?=
 =?us-ascii?Q?eqQG1GfW8UzFzooGFPlebRd/kF90kfURdI2A6x1PwvB8u6/TDcX/YtTxaNMi?=
 =?us-ascii?Q?Rp/wQVynwcszpeiXcwS5N384JjfpT60ZvFCmNlQQobEphxUUbGWPvvn2hQ/O?=
 =?us-ascii?Q?MY31Nd+ZVnrBR3AOAVxtfAG1IwML83HF5JgWSunjGE3w0gKkrGzHCP3q1y0O?=
 =?us-ascii?Q?l60dpnajS1T7NQHIU6BxWoHRiAnqKjRSELNWGwQSTn9G9VXGOTk06e3DQytd?=
 =?us-ascii?Q?UqaEJnw/K4qP0hB6B5EsQ8hTJPjiUQU+gQtGWCvp77dZCHO2WrKrtpfpUQ97?=
 =?us-ascii?Q?LX/pwBPmZB7ZJ8ewNzwROKG5wNhNlS1S//RiEZjLg3bDJo5NbFUjE+VZPJL2?=
 =?us-ascii?Q?p1GoSFY8H9h+xn9mG++UnYEcBSM+/Yt9/+cjQxCYUxLHl8008eb92eQA+Dfy?=
 =?us-ascii?Q?xk05qWfSvy9hFzAzFgnkmLviwcd5+sskfHtqj6Qw4NEdPKKZSy9wDTEvq69s?=
 =?us-ascii?Q?g68zk387w6hnRXzUUWdsvJbwbS5CTW76NvhucwE0jdj05dhEI+rENlalNJWX?=
 =?us-ascii?Q?9nyUfJrUtDREV0GNfoX5yq6oxNRzH3gOCgQ2SxcNBt/e9IsolKvYxvmddtGN?=
 =?us-ascii?Q?0j2YgnGKhPBXr7hxVFox/CMLo4IGawcmoyOfDROrVYLPpv6LIU5g+BxNbN5F?=
 =?us-ascii?Q?R/lizISaBlaof5SjrY0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc60d8a-ffb9-459e-cbb1-08dc56ac87f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2024 02:43:39.4387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2R74OolJj4qO7k6uXkXmlwQG+QplhIUgTLYJvRobA6S0OSpLxUi+1HFHLW/B9fsYCAWFkJ56qP+ETAaLceCx4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7197

Hi Oleksandr,

> Subject: [PATCH 2/2] xen/arm: Add i.MX UART driver
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> The i.MX UART Documentation:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.
> nxp.com%2Fwebapp%2FDownload%3FcolCode%3DIMX8MMRM&data=3D05%7
> C02%7Cpeng.fan%40nxp.com%7C6ada06c4133849667f3608dc530d5471%7
> C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6384765639197564
> 70%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz
> IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DRmXgAMb7
> wFZ7epZgYgHJo4LH35rzQhD05yTXSkttXbc%3D&reserved=3D0
> Chapter 16.2 Universal Asynchronous Receiver/Transmitter (UART)
>=20
> Tested on i.MX 8M Mini only, but I guess, it should be suitable for other
> i.MX8M* SoCs (those UART device tree nodes contain "fsl,imx6q-uart"
> compatible string).

Good to see people are interested in XEN on 8M.
I had an implementation back in 2015, you could take a look.

#include <xen/config.h>
#include <xen/console.h>
#include <xen/serial.h>
#include <xen/init.h>
#include <xen/irq.h>
#include <xen/device_tree.h>
#include <asm/device.h>
#include <xen/errno.h>
#include <xen/mm.h>
#include <xen/vmap.h>
#include <asm/imx-uart.h>
#include <asm/io.h>

#define imx_read(uart, off)       readl((uart)->regs + off)
#define imx_write(uart, off, val) writel((val), (uart)->regs + off)

#define CONFIG_IMX8_ZEBU
static struct imx_uart {
    unsigned int baud, clock_hz, data_bits, parity, stop_bits, fifo_size;
    unsigned int irq;
    char __iomem *regs;
    struct irqaction irqaction;
    struct vuart_info vuart;
} imx_com =3D {0};

static void imx_uart_interrupt(int irq, void *data, struct cpu_user_regs *r=
egs)
{
    struct serial_port *port =3D data;
    struct imx_uart *uart =3D port->uart;
    unsigned int sts, sts2;

    sts =3D imx_read(uart, USR1);

    if ((sts & USR1_RRDY) || (sts & USR1_AGTIM)) {
        if (sts & USR1_AGTIM)
            imx_write(uart, USR1, USR1_AGTIM);
	serial_rx_interrupt(port, regs);
    }

    if ((sts & USR1_TRDY) && (imx_read(uart, UCR1) & UCR1_TXMPTYEN)) {
        serial_tx_interrupt(port, regs);
    }

    if (sts & USR1_AWAKE) {
        imx_write(uart, USR1, USR1_AWAKE);
    }

    if (sts & USR1_AIRINT) {
	    imx_write(uart, USR1, USR1_AIRINT);
    }

    sts2 =3D imx_read(uart, USR2);
    if (sts2 & USR2_ORE) {
        dprintk(XENLOG_ERR, "uart: rxfifo overrun\n");
	imx_write(uart, USR2, sts2 | USR2_ORE);
    }
}

static void __init imx_uart_init_preirq(struct serial_port *port)
{
    struct imx_uart *uart =3D port->uart;
    int val;

    dprintk(XENLOG_ERR, "10\n");
    imx_write(uart, USR1, USR1_RTSD);

    dprintk(XENLOG_ERR, "12\n");
    val =3D imx_read(uart, UCR1);
    val |=3D UCR1_RRDYEN | UCR1_RTSDEN | UCR1_UARTEN;
    imx_write(uart, UCR1, val);

    dprintk(XENLOG_ERR, "13\n");
    val =3D imx_read(uart, UCR2);
    val |=3D UCR2_RXEN | UCR2_TXEN | UCR2_IRTS;
    imx_write(uart, UCR2, val);

//#ifdef CONFIG_IMX8_ZEBU
#if 0
    imx_write(uart, UFCR, (2U << 10) | (5U << 7) || (0U << 6) | (1U << 0));
#else
#define TXTL 2 /* reset default */
#define RXTL 1 /* For console port */
#define RXTL_UART 16 /* For uart */
    val =3D imx_read(uart, UFCR) & (UFCR_RFDIV | UFCR_DCEDTE);
    val |=3D TXTL << UFCR_TXTL_SHF | RXTL;
    imx_write(uart, UFCR, val);
#endif
    dprintk(XENLOG_ERR, "14\n");
    dprintk(XENLOG_ERR, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DUFCR =
USR1 %x %x\n", imx_read(uart, UFCR), imx_read(uart, USR1));
}

static void __init imx_uart_init_postirq(struct serial_port *port)
{
    struct imx_uart *uart =3D port->uart;

    dprintk(XENLOG_ERR, "20\n");
    uart->irqaction.handler =3D imx_uart_interrupt;
    uart->irqaction.name =3D "imx_uart";
    uart->irqaction.dev_id =3D port;

    if ( setup_irq(uart->irq, 0, &uart->irqaction) !=3D 0 )
    {
        dprintk(XENLOG_ERR, "Failed to allocated imx_uart IRQ %d\n",
                uart->irq);
        return;
    }

#ifdef CONFIG_IMX8_ZEBU
    // Send autobaud character
    imx_write(uart, UTXD, 0x55);
    imx_write(uart, UTXD, 0x55);
    imx_write(uart, UTXD, 0x0A);
#endif
    /* Enable interrupts */
    dprintk(XENLOG_ERR, "%s\n", __func__);
    imx_write(uart, UCR1, UCR1_TXMPTYEN | UCR1_RRDYEN | UCR1_UARTEN);
    //imx_write(uart, UCR1, UCR1_TXMPTYEN | UCR1_UARTEN);
}

static void imx_uart_suspend(struct serial_port *port)
{
    BUG();
}

static void imx_uart_resume(struct serial_port *port)
{
    BUG();
}

static int imx_uart_tx_ready(struct serial_port *port)
{
    struct imx_uart *uart =3D port->uart;

    return (imx_read(uart, USR2) & USR2_TXDC) ?  1 : 0;
}

static void imx_uart_putc(struct serial_port *port, char c)
{
    struct imx_uart *uart =3D port->uart;

    imx_write(uart, UTXD, (uint32_t)(unsigned char)c);
}

static int imx_uart_getc(struct serial_port *port, char *pc)
{
    struct imx_uart *uart =3D port->uart;

    if (!(imx_read(uart, USR2) & USR2_RDR))
	return 0;

    *pc =3D imx_read(uart, URXD) & 0xff;

    return 1;
}

static int __init imx_uart_irq(struct serial_port *port)
{
    struct imx_uart *uart =3D port->uart;

    return ((uart->irq > 0) ? uart->irq : -1);
}

static const struct vuart_info *imx_vuart_info(struct serial_port *port)
{
    struct imx_uart *uart =3D port->uart;

    return &uart->vuart;
}

static void imx_start_tx(struct serial_port *port)
{
    struct imx_uart *uart =3D port->uart;
    unsigned long temp;

    /* Clear any pending ORE flag before enabling interrupt */
    temp =3D imx_read(uart, USR2);
    imx_write(uart, USR2, temp | USR2_ORE);

    temp =3D imx_read(uart, UCR4);
    temp |=3D UCR4_OREN;
    imx_write(uart, UCR4, temp);

    temp =3D imx_read(uart, UCR1);
    imx_write(uart, UCR1, temp | UCR1_TXMPTYEN);

    return;
}

static void imx_stop_tx(struct serial_port *port)
{
    struct imx_uart *uart =3D port->uart;
    unsigned long temp;

    temp =3D imx_read(uart, UCR1);
    imx_write(uart, UCR1, temp & ~UCR1_TXMPTYEN);

    return;
}

static struct uart_driver __read_mostly imx_uart_driver =3D {
    .init_preirq =3D imx_uart_init_preirq,
    .init_postirq =3D imx_uart_init_postirq,
    .endboot =3D NULL,
    .suspend =3D imx_uart_suspend,
    .resume =3D imx_uart_resume,
    .tx_ready =3D imx_uart_tx_ready,
    .putc =3D imx_uart_putc,
    .getc =3D imx_uart_getc,
    .irq =3D imx_uart_irq,
    .start_tx =3D imx_start_tx,
    .stop_tx =3D imx_stop_tx,
    .vuart_info =3D imx_vuart_info,
};

static int __init imx_uart_init(struct dt_device_node *dev,
				const void *data)
{
    const char *config =3D data;
    struct imx_uart *uart;
    u32 clkspec;
    int res;
    u64 addr, size;

    dprintk(XENLOG_ERR, "xx %x\n", EARLY_UART_BASE_ADDRESS);
    if ( strcmp(config, "") )
        printk("WARNING: UART configuration is not supported\n");

    uart =3D &imx_com;

#ifdef CONFIG_IMX8_ZEBU
    clkspec =3D 24000000;
#else
    res =3D dt_property_read_u32(dev, "clock-frequency", &clkspec);
    if ( !res )
    {
        printk("imx-uart: Unable to retrieve the clock frequency\n");
        return -EINVAL;
    }
#endif

#define PARITY_NONE  (0)
    uart->clock_hz =3D clkspec;
    uart->baud =3D 115200;
    uart->data_bits =3D 8;
    uart->parity =3D PARITY_NONE;
    uart->stop_bits =3D 1;

    res =3D dt_device_get_address(dev, 0, &addr, &size);
    if ( res )
    {
        printk("imx-uart: Unable to retrieve the base"
               " address of the UART\n");
        return res;
    }

    res =3D platform_get_irq(dev, 0);
    if ( res < 0 )
    {
        printk("imx-uart: Unable to retrieve the IRQ\n");
        return -EINVAL;
    }
    uart->irq =3D res;

    uart->regs =3D ioremap_nocache(addr, size);
    if ( !uart->regs )
    {
        printk("imx-uart: Unable to map the UART memory\n");
        return -ENOMEM;
    }


    uart->vuart.base_addr =3D addr;
    uart->vuart.size =3D size;
    uart->vuart.data_off =3D UTXD;
    /* tmp from uboot */
    uart->vuart.status_off =3D UTS;
    uart->vuart.status =3D UTS_TXEMPTY;

    dprintk(XENLOG_ERR, "11\n");
    /* Register with generic serial driver */
    serial_register_uart(SERHND_DTUART, &imx_uart_driver, uart);

    dt_device_set_used_by(dev, DOMID_XEN);

    return 0;
}

static const struct dt_device_match imx_uart_dt_compat[] __initconst =3D
{
    DT_MATCH_COMPATIBLE("fsl,imx21-uart"),
    {},
};

DT_DEVICE_START(imx_uart, "IMX UART", DEVICE_SERIAL)
    .dt_match =3D imx_uart_dt_compat,
    .init =3D imx_uart_init,
DT_DEVICE_END

Regards,
Peng.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> I used the "earlycon=3Dec_imx6q,0x30890000" cmd arg and selected
> CONFIG_SERIAL_IMX_EARLYCON in Linux for enabling vUART.
> ---
> ---
>  MAINTAINERS                 |   1 +
>  xen/drivers/char/Kconfig    |   7 +
>  xen/drivers/char/Makefile   |   1 +
>  xen/drivers/char/imx-uart.c | 299 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 308 insertions(+)
>  create mode 100644 xen/drivers/char/imx-uart.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1bd22fd75f..bd4084fd20 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -249,6 +249,7 @@ F:	xen/drivers/char/arm-uart.c
>  F:	xen/drivers/char/cadence-uart.c
>  F:	xen/drivers/char/exynos4210-uart.c
>  F:	xen/drivers/char/imx-lpuart.c
> +F:	xen/drivers/char/imx-uart.c
>  F:	xen/drivers/char/meson-uart.c
>  F:	xen/drivers/char/mvebu-uart.c
>  F:	xen/drivers/char/omap-uart.c
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig index
> e18ec3788c..f51a1f596a 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -20,6 +20,13 @@ config HAS_IMX_LPUART
>  	help
>  	  This selects the i.MX LPUART. If you have i.MX8QM based board,
> say Y.
>=20
> +config HAS_IMX_UART
> +	bool "i.MX UART driver"
> +	default y
> +	depends on ARM_64
> +	help
> +	  This selects the i.MX UART. If you have i.MX8M* based board, say Y.
> +
>  config HAS_MVEBU
>  	bool "Marvell MVEBU UART driver"
>  	default y
> diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile index
> e7e374775d..147530a1ed 100644
> --- a/xen/drivers/char/Makefile
> +++ b/xen/drivers/char/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_HAS_SCIF) +=3D scif-uart.o
>  obj-$(CONFIG_HAS_EHCI) +=3D ehci-dbgp.o
>  obj-$(CONFIG_XHCI) +=3D xhci-dbc.o
>  obj-$(CONFIG_HAS_IMX_LPUART) +=3D imx-lpuart.o
> +obj-$(CONFIG_HAS_IMX_UART) +=3D imx-uart.o
>  obj-$(CONFIG_ARM) +=3D arm-uart.o
>  obj-y +=3D serial.o
>  obj-$(CONFIG_XEN_GUEST) +=3D xen_pv_console.o diff --git
> a/xen/drivers/char/imx-uart.c b/xen/drivers/char/imx-uart.c new file mode
> 100644 index 0000000000..13bb189063
> --- /dev/null
> +++ b/xen/drivers/char/imx-uart.c
> @@ -0,0 +1,299 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
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
> +#define imx_uart_write(uart, off, val)    writel((val), (uart)->regs + (=
off))
> +
> +static struct imx_uart {
> +    uint32_t baud, clock_hz, data_bits, parity, stop_bits, fifo_size;
> +    uint32_t irq;
> +    char __iomem *regs;
> +    struct irqaction irqaction;
> +    struct vuart_info vuart;
> +} imx_com;
> +
> +static void imx_uart_interrupt(int irq, void *data) {
> +    struct serial_port *port =3D data;
> +    struct imx_uart *uart =3D port->uart;
> +    uint32_t usr1, usr2;
> +
> +    usr1 =3D imx_uart_read(uart, USR1);
> +    usr2 =3D imx_uart_read(uart, USR2);
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
> +static void imx_uart_clear_rx_errors(struct serial_port *port) {
> +    struct imx_uart *uart =3D port->uart;
> +    uint32_t usr1, usr2;
> +
> +    usr1 =3D imx_uart_read(uart, USR1);
> +    usr2 =3D imx_uart_read(uart, USR2);
> +
> +    if ( usr2 & USR2_BRCD )
> +        imx_uart_write(uart, USR2, USR2_BRCD);
> +    else if ( usr1 & USR1_FRAMERR )
> +        imx_uart_write(uart, USR1, USR1_FRAMERR);
> +    else if ( usr1 & USR1_PARITYERR )
> +        imx_uart_write(uart, USR1, USR1_PARITYERR);
> +
> +    if ( usr2 & USR2_ORE )
> +        imx_uart_write(uart, USR2, USR2_ORE); }
> +
> +static void __init imx_uart_init_preirq(struct serial_port *port) {
> +    struct imx_uart *uart =3D port->uart;
> +    uint32_t reg;
> +
> +    /*
> +     * Wait for the transmission to complete. This is needed for a smoot=
h
> +     * transition when we come from early printk.
> +     */
> +    while ( !(imx_uart_read(uart, USR2) & USR2_TXDC) )
> +        cpu_relax();
> +
> +    /* Set receiver/transmitter trigger level */
> +    reg =3D imx_uart_read(uart, UFCR);
> +    reg &=3D (UFCR_RFDIV | UFCR_DCEDTE);
> +    reg |=3D TXTL_DEFAULT << UFCR_TXTL_SHF | RXTL_DEFAULT;
> +    imx_uart_write(uart, UFCR, reg);
> +
> +    /* Enable UART and disable interrupts/DMA */
> +    reg =3D imx_uart_read(uart, UCR1);
> +    reg |=3D UCR1_UARTEN;
> +    reg &=3D ~(UCR1_TRDYEN | UCR1_TXMPTYEN | UCR1_RTSDEN |
> UCR1_RRDYEN |
> +             UCR1_RXDMAEN | UCR1_TXDMAEN | UCR1_ATDMAEN);
> +    imx_uart_write(uart, UCR1, reg);
> +
> +    /* Enable receiver/transmitter and disable Aging Timer */
> +    reg =3D imx_uart_read(uart, UCR2);
> +    reg |=3D UCR2_RXEN | UCR2_TXEN;
> +    reg &=3D ~UCR2_ATEN;
> +    imx_uart_write(uart, UCR2, reg);
> +
> +    /* Disable interrupts */
> +    reg =3D imx_uart_read(uart, UCR4);
> +    reg &=3D ~(UCR4_TCEN | UCR4_DREN);
> +    imx_uart_write(uart, UCR4, reg);
> +}
> +
> +static void __init imx_uart_init_postirq(struct serial_port *port) {
> +    struct imx_uart *uart =3D port->uart;
> +
> +    uart->irqaction.handler =3D imx_uart_interrupt;
> +    uart->irqaction.name =3D "imx_uart";
> +    uart->irqaction.dev_id =3D port;
> +
> +    if ( setup_irq(uart->irq, 0, &uart->irqaction) !=3D 0 )
> +    {
> +        dprintk(XENLOG_ERR, "Failed to allocate imx_uart IRQ %d\n", uart=
->irq);
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
> +static void imx_uart_suspend(struct serial_port *port) {
> +    BUG();
> +}
> +
> +static void imx_uart_resume(struct serial_port *port) {
> +    BUG();
> +}
> +
> +static int imx_uart_tx_ready(struct serial_port *port) {
> +    struct imx_uart *uart =3D port->uart;
> +    uint32_t reg;
> +
> +    reg =3D imx_uart_read(uart, IMX21_UTS);
> +    if ( reg & UTS_TXEMPTY )
> +        return TX_FIFO_SIZE;
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
> +static void imx_uart_putc(struct serial_port *port, char c) {
> +    struct imx_uart *uart =3D port->uart;
> +
> +    while ( imx_uart_read(uart, IMX21_UTS) & UTS_TXFULL )
> +        cpu_relax();
> +
> +    imx_uart_write(uart, URTX0, c);
> +}
> +
> +static int imx_uart_getc(struct serial_port *port, char *pc) {
> +    struct imx_uart *uart =3D port->uart;
> +    uint32_t data;
> +
> +    if ( !(imx_uart_read(uart, USR2) & USR2_RDR) )
> +        return 0;
> +
> +    data =3D imx_uart_read(uart, URXD0);
> +    *pc =3D data & URXD_RX_DATA;
> +
> +    if ( unlikely(data & URXD_ERR) )
> +        imx_uart_clear_rx_errors(port);
> +
> +    return 1;
> +}
> +
> +static int __init imx_uart_irq(struct serial_port *port) {
> +    struct imx_uart *uart =3D port->uart;
> +
> +    return ((uart->irq > 0) ? uart->irq : -1); }
> +
> +static const struct vuart_info *imx_uart_vuart_info(struct serial_port
> +*port) {
> +    struct imx_uart *uart =3D port->uart;
> +
> +    return &uart->vuart;
> +}
> +
> +static void imx_uart_start_tx(struct serial_port *port) {
> +    struct imx_uart *uart =3D port->uart;
> +
> +    imx_uart_write(uart, UCR1, imx_uart_read(uart, UCR1) |
> +UCR1_TRDYEN); }
> +
> +static void imx_uart_stop_tx(struct serial_port *port) {
> +    struct imx_uart *uart =3D port->uart;
> +
> +    imx_uart_write(uart, UCR1, imx_uart_read(uart, UCR1) &
> +~UCR1_TRDYEN); }
> +
> +static struct uart_driver __read_mostly imx_uart_driver =3D {
> +    .init_preirq =3D imx_uart_init_preirq,
> +    .init_postirq =3D imx_uart_init_postirq,
> +    .endboot =3D NULL,
> +    .suspend =3D imx_uart_suspend,
> +    .resume =3D imx_uart_resume,
> +    .tx_ready =3D imx_uart_tx_ready,
> +    .putc =3D imx_uart_putc,
> +    .getc =3D imx_uart_getc,
> +    .irq =3D imx_uart_irq,
> +    .start_tx =3D imx_uart_start_tx,
> +    .stop_tx =3D imx_uart_stop_tx,
> +    .vuart_info =3D imx_uart_vuart_info,
> +};
> +
> +static int __init imx_uart_init(struct dt_device_node *dev, const void
> +*data) {
> +    const char *config =3D data;
> +    struct imx_uart *uart;
> +    int res;
> +    paddr_t addr, size;
> +
> +    if ( strcmp(config, "") )
> +        printk("WARNING: UART configuration is not supported\n");
> +
> +    uart =3D &imx_com;
> +
> +    uart->baud =3D 115200;
> +    uart->data_bits =3D 8;
> +    uart->parity =3D 0;
> +    uart->stop_bits =3D 1;
> +
> +    res =3D dt_device_get_paddr(dev, 0, &addr, &size);
> +    if ( res )
> +    {
> +        printk("imx-uart: Unable to retrieve the base address of the UAR=
T\n");
> +        return res;
> +    }
> +
> +    res =3D platform_get_irq(dev, 0);
> +    if ( res < 0 )
> +    {
> +        printk("imx-uart: Unable to retrieve the IRQ\n");
> +        return -EINVAL;
> +    }
> +    uart->irq =3D res;
> +
> +    uart->regs =3D ioremap_nocache(addr, size);
> +    if ( !uart->regs )
> +    {
> +        printk("imx-uart: Unable to map the UART memory\n");
> +        return -ENOMEM;
> +    }
> +
> +    uart->vuart.base_addr =3D addr;
> +    uart->vuart.size =3D size;
> +    uart->vuart.data_off =3D URTX0;
> +    uart->vuart.status_off =3D IMX21_UTS;
> +    uart->vuart.status =3D UTS_TXEMPTY;
> +
> +    /* Register with generic serial driver */
> +    serial_register_uart(SERHND_DTUART, &imx_uart_driver, uart);
> +
> +    dt_device_set_used_by(dev, DOMID_XEN);
> +
> +    return 0;
> +}
> +
> +static const struct dt_device_match imx_uart_dt_compat[] __initconst =3D
> +{
> +    DT_MATCH_COMPATIBLE("fsl,imx6q-uart"),
> +    { /* sentinel */ },
> +};
> +
> +DT_DEVICE_START(imx_uart, "i.MX UART", DEVICE_SERIAL)
> +    .dt_match =3D imx_uart_dt_compat,
> +    .init =3D imx_uart_init,
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


