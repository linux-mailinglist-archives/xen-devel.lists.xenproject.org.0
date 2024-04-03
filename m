Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE3D896BC8
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:13:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700388.1093437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxbD-0005lv-M1; Wed, 03 Apr 2024 10:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700388.1093437; Wed, 03 Apr 2024 10:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxbD-0005jG-JG; Wed, 03 Apr 2024 10:12:07 +0000
Received: by outflank-mailman (input) for mailman id 700388;
 Wed, 03 Apr 2024 10:12:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eUqh=LI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rrxbC-0005jA-In
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:12:06 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ee8403e-f1a2-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 12:12:04 +0200 (CEST)
Received: from CH2PR05CA0002.namprd05.prod.outlook.com (2603:10b6:610::15) by
 DS0PR12MB7560.namprd12.prod.outlook.com (2603:10b6:8:133::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Wed, 3 Apr 2024 10:12:02 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:610:0:cafe::4f) by CH2PR05CA0002.outlook.office365.com
 (2603:10b6:610::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25 via Frontend
 Transport; Wed, 3 Apr 2024 10:12:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 3 Apr 2024 10:12:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 05:12:00 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 3 Apr 2024 05:11:58 -0500
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
X-Inumbo-ID: 9ee8403e-f1a2-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebIAevk94pHslbS4NYiogZTousZ3EZLyZH+gq5QNtMHfvgXyTmFOUb0POSP1jJGWH0Vv1RCeb79XQO4uMlNGgRgvlzmkpsbY/79DEJjVP7lPhwI+bvjFihuSxGH5POV8OB+IEvm7LXnMiOzAFNecrjfjRaphNSiEv4xmZOp6fLm9wBrs5o+e6+J+GNfnQi1qdwjpzmmJHmmBexKlLLTOC/8fHQcZqvGiu82BnbGwiPtnGV7VGwcrTXUJG2e+fdSAZs4OfiRrWYDkgAVEIxQLKQoM4PC300s7jjwW06+jShDfWz0rheXU9L29Y5hSp+FjH1PWa52YIGCT+zK3IeqF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVZ8rFge6bNbG4lQdbguvKaDyYYtOn2T9lyT+8vv8dI=;
 b=Lmfwt/0S+uiB558jz3zd41bfV+BQbPaFnPSAYWnPTfTYwcdQ0lxL8P45agUSx0CWU+ubuwgL59thhZynWn8jOzTgaLpIrioTaXg59+X4hji+d68h0/56o7a905bETCpDMBzM2fV2rF0bdQ4K2I78gylIkZ92plEMB4epP2Vre2YP0/vzHs55HAyq/NEacEjvBQH+VzFgJbSM7qgvh8agISjSoUtWFHvUvfzsoSFEz6RwZ0xM5GX9euEjW/dcM+jgppzMvJvqzqapGJx2JnWhNe/I3/UNf1USCs0Eusn20n207KbUS3Qr51QSAK0gqpvo13WAqwGWX7AhCTL7CSElYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVZ8rFge6bNbG4lQdbguvKaDyYYtOn2T9lyT+8vv8dI=;
 b=AoV+Zy+NSX7rwol0MzOe31DJjMvcQOQMVQk5tX8PJFvd6EBATQ7sBkvBPzpSPV8NzG7ZPeewkUx/4KRlEx15SwtAI8IhwObgcJUx1llEDJYic/matH2RS4EnwErtqueUyTmDJQcsuDMDXKr2WvFrCBsKz6QaIUfBj6Pu6LqjOB8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5151abab-93a9-4b3f-8d69-c45e3cfc663c@amd.com>
Date: Wed, 3 Apr 2024 12:11:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm: Add i.MX UART early printk support
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Peng Fan <peng.fan@nxp.com>
References: <20240402120557.1822253-1-olekstysh@gmail.com>
 <20240402120557.1822253-2-olekstysh@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240402120557.1822253-2-olekstysh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|DS0PR12MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: 91834826-8089-4094-0749-08dc53c6813a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ptiEoUyeHqFcwk3qgMvvsxzNm261w3Yrwo8uTpUx5nGLBNjrwoI6F6+Nbcl9Lfm4G8erBbjgFrgrOcujsrtj0cjRl2Nh5UEehNPCy6HoHiHPI+3rfTLGF6HjX1kK3+ycjrxUOC0RxgtQ00rh+EW6SNqyBZbsgTfmYTGRbhG5gt/xUbZWqp9jCC7CKz3O/NbsnkclgKuhzbFMnfOiWk7pIVj7rnJROwEoTy1TjuIcPWLhkfc2Dz/TlYWi6ITEP0KMJ6Ko8KeYrtGZCdiT9chvkLZxKOxPuQeN/mie4ASFhLplDS6mmHLcrU90akUxa5U7pgIbQDYvd/xUKqYkZ9I7h7NWPkVcdRMNzlpAQ9ciR6dhSDcWOZEvbNxX5SjJgjipIxp+4brv2qtKdTyThyzLNOqyc+8SYkwSSkVSF/pIxKrBcXDQR1dGMouO2b8YrHYsXA4GO5h+bESDaE6AQ9nqFELp6+QcpjvodJEREdMlpJ5ohdoBDX7Nig1FIDgBxLiK/Bl/CJbtOD7wAAvjnpjGX6mCBEp3p4l2H9+AzsRT0bJ9VNs0e2vEpw6gulwzZVa/bGXtdWO3J9N7VG8bvG1zCFIYSQnhMnyTvAM/O91UZtxI5dJF8oIh58OftS5uKE8mOUymHQ9oVa8CWr2VMmIplmxBH0hgPShHFrZQvLEUvLTWKOj0/VYC+mathBBakbeylJ4/AwrPyA1YWRiFeOwbMh160Jo8BlWuUQmojqG/+rYzHU2pZQha82H4rMr2mRum
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 10:12:01.4117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91834826-8089-4094-0749-08dc53c6813a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7560

Hi Oleksandr,

On 02/04/2024 14:05, Oleksandr Tyshchenko wrote:
> 
> 
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Tested on i.MX 8M Mini only, but I guess, it should be
> suitable for other i.MX8M* SoCs (those UART device tree nodes
> contain "fsl,imx6q-uart" compatible string).
Please use imperative mood in commit msg. I would mention also that you are adding
macros that will be used by the runtime driver.

> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> I selected the following configs for enabling early printk:
> 
>  CONFIG_EARLY_UART_CHOICE_IMX_UART=y
>  CONFIG_EARLY_UART_IMX_UART=y
>  CONFIG_EARLY_PRINTK=y
>  CONFIG_EARLY_UART_BASE_ADDRESS=0x30890000
>  CONFIG_EARLY_PRINTK_INC="debug-imx-uart.inc"
> ---
> ---
>  xen/arch/arm/Kconfig.debug            | 14 +++++
>  xen/arch/arm/arm64/debug-imx-uart.inc | 38 ++++++++++++++
>  xen/arch/arm/include/asm/imx-uart.h   | 76 +++++++++++++++++++++++++++
>  3 files changed, 128 insertions(+)
>  create mode 100644 xen/arch/arm/arm64/debug-imx-uart.inc
>  create mode 100644 xen/arch/arm/include/asm/imx-uart.h
> 
> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
> index eec860e88e..a15d08f214 100644
> --- a/xen/arch/arm/Kconfig.debug
> +++ b/xen/arch/arm/Kconfig.debug
> @@ -68,6 +68,16 @@ choice
>                         provide the parameters for the i.MX LPUART rather than
>                         selecting one of the platform specific options below if
>                         you know the parameters for the port.
> +       config EARLY_UART_CHOICE_IMX_UART
> +               select EARLY_UART_IMX_UART
> +               depends on ARM_64
> +               bool "Early printk via i.MX UART"
> +               help
> +                       Say Y here if you wish the early printk to direct their
Do not take example from surrounding code. help text should be indented by 2 tabs and 2 spaces here.

> +                       output to a i.MX UART. You can use this option to
> +                       provide the parameters for the i.MX UART rather than
> +                       selecting one of the platform specific options below if
> +                       you know the parameters for the port.
>         config EARLY_UART_CHOICE_MESON
>                 select EARLY_UART_MESON
>                 depends on ARM_64
> @@ -199,6 +209,9 @@ config EARLY_UART_EXYNOS4210
>  config EARLY_UART_IMX_LPUART
>         select EARLY_PRINTK
>         bool
> +config EARLY_UART_IMX_UART
> +       select EARLY_PRINTK
> +       bool
>  config EARLY_UART_MESON
>         select EARLY_PRINTK
>         bool
> @@ -304,6 +317,7 @@ config EARLY_PRINTK_INC
>         default "debug-cadence.inc" if EARLY_UART_CADENCE
>         default "debug-exynos4210.inc" if EARLY_UART_EXYNOS4210
>         default "debug-imx-lpuart.inc" if EARLY_UART_IMX_LPUART
> +       default "debug-imx-uart.inc" if EARLY_UART_IMX_UART
>         default "debug-meson.inc" if EARLY_UART_MESON
>         default "debug-mvebu.inc" if EARLY_UART_MVEBU
>         default "debug-pl011.inc" if EARLY_UART_PL011
> diff --git a/xen/arch/arm/arm64/debug-imx-uart.inc b/xen/arch/arm/arm64/debug-imx-uart.inc
> new file mode 100644
> index 0000000000..27a68b1ed5
> --- /dev/null
> +++ b/xen/arch/arm/arm64/debug-imx-uart.inc
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * xen/arch/arm/arm64/debug-imx-uart.inc
> + *
> + * i.MX8M* specific debug code
> + *
> + * Copyright (C) 2024 EPAM Systems Inc.
> + */
> +
> +#include <asm/imx-uart.h>
> +
> +/*
> + * Wait UART to be ready to transmit
> + * rb: register which contains the UART base address
> + * rc: scratch register
> + */
> +.macro early_uart_ready xb, c
> +1:
> +        ldr   w\c, [\xb, #IMX21_UTS] /* <- Test register */
> +        tst   w\c, #UTS_TXFULL       /* Check TxFIFO FULL bit */
> +        bne   1b                     /* Wait for the UART to be ready */
> +.endm
> +
> +/*
> + * UART transmit character
> + * rb: register which contains the UART base address
> + * rt: register which contains the character to transmit
> + */
> +.macro early_uart_transmit xb, wt
> +        str   \wt, [\xb, #URTX0] /* -> Transmitter Register */
> +.endm
> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/imx-uart.h b/xen/arch/arm/include/asm/imx-uart.h
> new file mode 100644
> index 0000000000..413a81dd44
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/imx-uart.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * xen/arch/arm/include/asm/imx-uart.h
> + *
> + * Common constant definition between early printk and the UART driver
> + *
> + * Copyright (C) 2024 EPAM Systems Inc.
> + */
> +
> +#ifndef __ASM_ARM_IMX_UART_H__
> +#define __ASM_ARM_IMX_UART_H__
> +
> +/* 32-bit register definition */
> +#define URXD0        (0x00) /* Receiver Register */
There is no need to surround these values

> +#define URTX0        (0x40) /* Transmitter Register */
> +#define UCR1         (0x80) /* Control Register 1 */
> +#define UCR2         (0x84) /* Control Register 2 */
> +#define UCR3         (0x88) /* Control Register 3 */

> +#define UCR4         (0x8c) /* Control Register 4 */
> +#define UFCR         (0x90) /* FIFO Control Register */
> +#define USR1         (0x94) /* Status Register 1 */
> +#define USR2         (0x98) /* Status Register 2 */
> +#define IMX21_UTS    (0xb4) /* Test Register */
> +
> +#define URXD_ERR        BIT(14, UL) /* Error detect */
> +#define URXD_RX_DATA    GENMASK(7, 0) /* Received data mask */
> +
> +#define UCR1_TRDYEN      BIT(13, UL) /* Transmitter ready interrupt enable */
> +#define UCR1_RRDYEN      BIT(9, UL) /* Receiver ready interrupt enable */
NIT: please align comments within a block

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

