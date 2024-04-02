Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B728894FFE
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 12:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700093.1092701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrbKp-0008W7-5p; Tue, 02 Apr 2024 10:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700093.1092701; Tue, 02 Apr 2024 10:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrbKp-0008Ua-1Q; Tue, 02 Apr 2024 10:25:43 +0000
Received: by outflank-mailman (input) for mailman id 700093;
 Tue, 02 Apr 2024 10:25:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m3oM=LH=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rrbKn-0008UU-BD
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 10:25:41 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 591c3edd-f0db-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 12:25:39 +0200 (CEST)
Received: from CY5P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:b::38) by
 DM4PR12MB5842.namprd12.prod.outlook.com (2603:10b6:8:65::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Tue, 2 Apr 2024 10:25:33 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:930:b:cafe::54) by CY5P221CA0026.outlook.office365.com
 (2603:10b6:930:b::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Tue, 2 Apr 2024 10:25:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 2 Apr 2024 10:25:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 2 Apr
 2024 05:25:32 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 2 Apr
 2024 05:25:32 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 2 Apr 2024 05:25:30 -0500
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
X-Inumbo-ID: 591c3edd-f0db-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKtF1zs2m0TTxFsGLjK8Ui/EAfQvN1atcLM3NEaBqE+ZEGyKsnBBUL3sySOZfXN/UyOAuWipsZxf7bP6GwuUSp+S6fBCxJjph5aupgsuhauQYOwYiebudY4+th9qgM+ddy05onOSk52MhzjpZ276CgYy4HXrWEAOHuuYn0AS9zYopyN7VDgJ2HV1ONdWYRGOwPzTjAgYbaIgqBr2fa2Bf9HaQAmiznJH63TJ1ynsBJlSBogahdFfcfLWNPVO5c48ulYIWGYlA5iG31WiPD5+1r3LCU0g3DTzlyqBnc/lVk+4RbJ32dzEZUXPQIvQRUMnkn6+NJ6U01ys9AqFbaVrPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qfRl2wLrFFrgoO4ck4cnlxHZxoTcVdDDvsokym7kzc=;
 b=nxQMM1bbtTog7O2M0Bn5eoHsW9lQnBapK1fNI/1sw5o+GkqBAGgitNRbDPFNryQ3I8gBfDqaXv/ghItZYp6easXX6X7t0MdGzEMweW4L9hudhPj0T8u8PB+X2eKjAnBRXxJ7PZ5zHj/Blx+F56yaLfhqQtMQnXa/sZmMs4MtPs5RArd+eliPkS4zdGuYxh6avSIDQ+TxWSogWDbpT09ES4Eivx3OdCbIFY2RRqgrT65x6M9Ud0iDX6uLvrTghXWfr4+/CSiDagOkIbypLAjldb47YeyRdth1dNRNUs/3j20n4b//cp6LmlQDqX2RA0bQzr7iZztLcqRevaVJ3Q2aXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qfRl2wLrFFrgoO4ck4cnlxHZxoTcVdDDvsokym7kzc=;
 b=Z7Jztf0zGji5pqVurDVW/k9RG85jEwcqO7Z3eE2UFGPo5/fPPpUPiuD+5vs7UaGOqrO+lBw36iPUvYRbRqfxRz9v0r6svYoCqHMHxYuxkKCZ5FT/vxdqYnxDwdoov/tuO4qKpZGxbsfMXmzNMEz3qV2StjKG01m6BVDMJtO1YWs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <91ceb418-f055-45ba-82c4-f37e812d5242@amd.com>
Date: Tue, 2 Apr 2024 12:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drivers: serial: add Qualcomm GENI-based serial
 driver
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20240329000822.3363568-1-volodymyr_babchuk@epam.com>
 <20240329000822.3363568-3-volodymyr_babchuk@epam.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240329000822.3363568-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|DM4PR12MB5842:EE_
X-MS-Office365-Filtering-Correlation-Id: 38123470-56c0-4b70-deb1-08dc52ff3aa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N9b1jIsMe/8gZBv1wL/EuYbOX0wBm6/Oz8bcey0W1uaPSascaq10p4vV9FIPiFIvVqGLxQ2gy0CoZQzGN8l5isxQsTbAvItJC0Mr4Nk6Be12AZkSm9pOKqbKkh5m115rcrpsbE9G162q+Vs5NspSnTm7/aOUX3EqUGyG+ioIuGr63o5RMH6Jr1poqU283HCS/VRn0PUEXWgVMTbeKdbW6suZ5uvQs9lO198Sg5CoWmQGTuTUB+OH3p6xxmh8jy/dH85OrFzK8q6cIdM9bQn1CGcLH7aeDP2WLj2kJt4IsdIefQopjG/ECt4sW/nHzkITDJIw0xnbcmrVlz2MB4ywsFnpINJDJlgl3vY61QviS70LoAgZcDbvCHN3KfEkq3OcBGFN2nVUUDIzjdQa6ykkP+JfugwqX2hkL5Kbu+bqiGn1A02qW3sw99CiF9OkmlEIu3aS/EVmyEet6sYsNhKsM0of3fWVQM1MAKhdSoEio3sFcwCRCrvq5n/2qMsPNtQS/ycL9l6EQAbJP7mgrS+R7e7bQULw0FMPt8S3v1xQsRI+USlryHBXiS89T3A56SFN72fHUvACQzRJ4/99+n1KslV+FzLE25xomemocQnRlEcL46H9klVK5+YyIbryVQoleGVpSEVk+vqrpE4rHnlPE1SRIV4XoHQzJG/JrBRwtBAussgYbjGbFm2G0UadTLBjsy5hnUzq/xd4F3A3ASTO8X3rcIzAs/51X1vPMVAY27NR+qC73giCbrtkQ8WYZdOp
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 10:25:33.2433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38123470-56c0-4b70-deb1-08dc52ff3aa0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5842

Hello,

On 29/03/2024 01:08, Volodymyr Babchuk wrote:
> 
> 
> Generic Interface (GENI) is a newer interface for low speed interfaces
> like UART, I2C or SPI. This patch adds the simple driver for the UART
> instance of GENI. Code is based on similar drivers in U-Boot and Linux
> kernel.
Do you have a link to a manual?

> 
> This driver implements only simple synchronous mode, because although
> GENI supports FIFO mode, it needs to know number of
> characters **before** starting TX transaction. This is a stark
> contrast when compared to other UART peripherals, which allow adding
> characters to a FIFO while TX operation is running.
> 
> The patch adds both normal UART driver and earlyprintk version.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>  xen/arch/arm/Kconfig.debug           |  19 +-
>  xen/arch/arm/arm64/debug-qcom.inc    |  76 +++++++
Shouldn't all the files (+ other places) have geni in their names? Could qcom refer to other type of serial device?


>  xen/arch/arm/include/asm/qcom-uart.h |  48 +++++
>  xen/drivers/char/Kconfig             |   8 +
>  xen/drivers/char/Makefile            |   1 +
>  xen/drivers/char/qcom-uart.c         | 288 +++++++++++++++++++++++++++
>  6 files changed, 439 insertions(+), 1 deletion(-)
>  create mode 100644 xen/arch/arm/arm64/debug-qcom.inc
>  create mode 100644 xen/arch/arm/include/asm/qcom-uart.h
>  create mode 100644 xen/drivers/char/qcom-uart.c
> 
> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
> index eec860e88e..f6ab0bb30e 100644
> --- a/xen/arch/arm/Kconfig.debug
> +++ b/xen/arch/arm/Kconfig.debug
> @@ -119,6 +119,19 @@ choice
>                         selecting one of the platform specific options below if
>                         you know the parameters for the port.
> 
> +                       This option is preferred over the platform specific
> +                       options; the platform specific options are deprecated
> +                       and will soon be removed.
> +       config EARLY_UART_CHOICE_QCOM
The list is sorted alphabetically. Please adhere to that.

> +               select EARLY_UART_QCOM
> +               bool "Early printk via Qualcomm debug UART"
Shouldn't you add depends on ARM_64? Isn't this device Arm64 specific like in Linux?

> +               help
> +                       Say Y here if you wish the early printk to direct their
help text here should be indented by 2 tabs and 2 spaces (do not take example from surrounding code)

> +                       output to a Qualcomm debug UART. You can use this option to
> +                       provide the parameters for the debug UART rather than
> +                       selecting one of the platform specific options below if
> +                       you know the parameters for the port.
> +
>                         This option is preferred over the platform specific
>                         options; the platform specific options are deprecated
>                         and will soon be removed.
> @@ -211,6 +224,9 @@ config EARLY_UART_PL011
>  config EARLY_UART_SCIF
>         select EARLY_PRINTK
>         bool
> +config EARLY_UART_QCOM
> +       select EARLY_PRINTK
> +       bool
The list is sorted alphabetically. Please adhere to that.

> 
>  config EARLY_PRINTK
>         bool
> @@ -261,7 +277,7 @@ config EARLY_UART_PL011_MMIO32
>           will be done using 32-bit only accessors.
> 
>  config EARLY_UART_INIT
> -       depends on EARLY_UART_PL011 && EARLY_UART_PL011_BAUD_RATE != 0
> +       depends on (EARLY_UART_PL011 && EARLY_UART_PL011_BAUD_RATE != 0) || EARLY_UART_QCOM
>         def_bool y
> 
>  config EARLY_UART_8250_REG_SHIFT
> @@ -308,3 +324,4 @@ config EARLY_PRINTK_INC
>         default "debug-mvebu.inc" if EARLY_UART_MVEBU
>         default "debug-pl011.inc" if EARLY_UART_PL011
>         default "debug-scif.inc" if EARLY_UART_SCIF
> +       default "debug-qcom.inc" if EARLY_UART_QCOM
> diff --git a/xen/arch/arm/arm64/debug-qcom.inc b/xen/arch/arm/arm64/debug-qcom.inc
> new file mode 100644
> index 0000000000..130d08d6e9
> --- /dev/null
> +++ b/xen/arch/arm/arm64/debug-qcom.inc
> @@ -0,0 +1,76 @@
> +/*
> + * xen/arch/arm/arm64/debug-qcom.inc
> + *
> + * Qualcomm debug UART specific debug code
> + *
> + * Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> + * Copyright (C) 2024, EPAM Systems.
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
No need for the license text. You should use SPDX identifier instead at the top of the file:
/* SPDX-License-Identifier: GPL-2.0-or-later */

> + */
> +
> +#include <asm/qcom-uart.h>
> +
> +.macro early_uart_init xb c
Separate macro parameters with comma (here and elsewhere) and please add a comment on top clarifying the use
Also, do we really need to initialize uart every time? What if firmware does that?

> +        mov   w\c, #M_GENI_CMD_ABORT
> +        str   w\c, [\xb, #SE_GENI_M_CMD_CTRL_REG]
> +1:
> +        ldr   w\c, [\xb, #SE_GENI_M_IRQ_STATUS]   /* Load IRQ status */
> +        tst   w\c, #M_CMD_ABORT_EN         /* Check TX_FIFI_WATERMARK_EN bit */
The comment does not correspond to the code. Shouldn't this be the same as in early_uart_ready?

> +        beq   1b                          /* Wait for the UART to be ready */
> +        mov   w\c, #M_CMD_ABORT_EN
> +        orr   w\c, w\c, #M_CMD_DONE_EN
> +        str   w\c, [\xb, #SE_GENI_M_IRQ_CLEAR]
> +
> +        mov   w\c, #1
> +        str   w\c, [\xb, #SE_UART_TX_TRANS_LEN]         /* write len */
> +
> +        mov   w\c, #(UART_START_TX << M_OPCODE_SHFT)    /* Prepare cmd  */
> +        str   w\c, [\xb, #SE_GENI_M_CMD0]               /* write cmd */
> +.endm
> +/*
> + * wait for UART to be ready to transmit
> + * xb: register which contains the UART base address
> + * c: scratch register
> + */
> +.macro early_uart_ready xb c
> +1:
> +        ldr   w\c, [\xb, #SE_GENI_M_IRQ_STATUS] /* Load IRQ status */
> +        tst   w\c, #M_TX_FIFO_WATERMARK_EN  /* Check TX_FIFI_WATERMARK_EN bit */
> +        beq    1b                           /* Wait for the UART to be ready */
> +.endm
> +
> +/*
> + * UART transmit character
> + * xb: register which contains the UART base address
> + * wt: register which contains the character to transmit
> + */
> +.macro early_uart_transmit xb wt
> +        str   \wt, [\xb, #SE_GENI_TX_FIFOn]             /* Put char to FIFO */
> +        mov   \wt, #M_TX_FIFO_WATERMARK_EN              /* Prepare to FIFO */
> +        str   \wt, [\xb, #SE_GENI_M_IRQ_CLEAR]          /* Kick FIFO */
> +95:
> +        ldr   \wt, [\xb, #SE_GENI_M_IRQ_STATUS]         /* Load IRQ status */
> +        tst   \wt, #M_CMD_DONE_EN           /* Check TX_FIFO_WATERMARK_EN bit */
> +        beq   95b                           /* Wait for the UART to be ready */
> +        mov   \wt, #M_CMD_DONE_EN
> +        str   \wt, [\xb, #SE_GENI_M_IRQ_CLEAR]
> +
> +        mov   \wt, #(UART_START_TX << M_OPCODE_SHFT)    /* Prepare next cmd */
> +        str   \wt, [\xb, #SE_GENI_M_CMD0]               /* write cmd */
> +.endm
> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/qcom-uart.h b/xen/arch/arm/include/asm/qcom-uart.h
> new file mode 100644
> index 0000000000..dc9579374c
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/qcom-uart.h
> @@ -0,0 +1,48 @@
> +/*
> + * xen/include/asm-arm/qcom-uart.h
What's the use of this pseudo path? I would drop it or provide a correct path.

> + *
> + * Common constant definition between early printk and the UART driver
> + * for the Qualcomm debug UART
> + *
> + * Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> + * Copyright (C) 2024, EPAM Systems.
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
No need for the license text. You should use SPDX identifier instead at the top of the file:
/* SPDX-License-Identifier: GPL-2.0-or-later */

> + */
> +
> +#ifndef __ASM_ARM_QCOM_UART_H
> +#define __ASM_ARM_QCOM_UART_H
> +
> +#define SE_UART_TX_TRANS_LEN            0x270
> +#define SE_GENI_M_CMD0                  0x600
> +#define   UART_START_TX                 0x1
> +#define   M_OPCODE_SHFT                 27
> +
> +#define SE_GENI_M_CMD_CTRL_REG          0x604
> +#define   M_GENI_CMD_ABORT              BIT(1, U)
> +#define SE_GENI_M_IRQ_STATUS            0x610
> +#define   M_CMD_DONE_EN                 BIT(0, U)
> +#define   M_CMD_ABORT_EN                BIT(5, U)
> +#define   M_TX_FIFO_WATERMARK_EN        BIT(30, U)
> +#define SE_GENI_M_IRQ_CLEAR             0x618
> +#define SE_GENI_TX_FIFOn                0x700
> +#define SE_GENI_TX_WATERMARK_REG        0x80c
AFAICT, in this header you listed only regs used both by assembly and c code.
However, SE_GENI_TX_WATERMARK_REG is not used in assembly.
Also, my personal opinion is that it would make more sense to list here all the regs.

> +
> +#endif /* __ASM_ARM_QCOM_UART_H */
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
> index e18ec3788c..52c3934d06 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -68,6 +68,14 @@ config HAS_SCIF
>           This selects the SuperH SCI(F) UART. If you have a SuperH based board,
>           or Renesas R-Car Gen 2/3 based board say Y.
> 
> +config HAS_QCOM_UART
> +       bool "Qualcomm GENI UART driver"
> +       default y
> +       depends on ARM
Isn't is Arm64 specific device?

> +       help
> +         This selects the Qualcomm GENI-based UART driver. If you
> +         have a Qualcomm-based board board say Y here.
> +
>  config HAS_EHCI
>         bool
>         depends on X86
> diff --git a/xen/drivers/char/Makefile b/xen/drivers/char/Makefile
> index e7e374775d..698ad0578c 100644
> --- a/xen/drivers/char/Makefile
> +++ b/xen/drivers/char/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_HAS_MESON) += meson-uart.o
>  obj-$(CONFIG_HAS_MVEBU) += mvebu-uart.o
>  obj-$(CONFIG_HAS_OMAP) += omap-uart.o
>  obj-$(CONFIG_HAS_SCIF) += scif-uart.o
> +obj-$(CONFIG_HAS_QCOM_UART) += qcom-uart.o
Q comes before S

>  obj-$(CONFIG_HAS_EHCI) += ehci-dbgp.o
>  obj-$(CONFIG_XHCI) += xhci-dbc.o
>  obj-$(CONFIG_HAS_IMX_LPUART) += imx-lpuart.o
> diff --git a/xen/drivers/char/qcom-uart.c b/xen/drivers/char/qcom-uart.c
> new file mode 100644
> index 0000000000..2614051ca0
> --- /dev/null
> +++ b/xen/drivers/char/qcom-uart.c
> @@ -0,0 +1,288 @@
> +/*
> + * xen/drivers/char/qcom-uart.c
> + *
> + * Driver for Qualcomm GENI-based UART interface
> + *
> + * Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> + *
> + * Copyright (C) EPAM Systems 2024
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
No need for the license text. You should use SPDX identifier instead at the top of the file:
/* SPDX-License-Identifier: GPL-2.0-or-later */

> + */
> +
> +#include <xen/console.h>
> +#include <xen/const.h>
> +#include <xen/errno.h>
> +#include <xen/serial.h>
> +#include <xen/init.h>
> +#include <xen/irq.h>
> +#include <xen/mm.h>
> +#include <xen/delay.h>
> +#include <asm/device.h>
> +#include <asm/qcom-uart.h>
> +#include <asm/io.h>
> +
> +#define GENI_FORCE_DEFAULT_REG          0x20
> +#define   FORCE_DEFAULT                 BIT(0, U)
> +#define   DEF_TX_WM                     2
> +#define SE_GENI_TX_PACKING_CFG0         0x260
> +#define SE_GENI_TX_PACKING_CFG1         0x264
> +#define SE_GENI_RX_PACKING_CFG0         0x284
> +#define SE_GENI_RX_PACKING_CFG1         0x288
> +#define SE_GENI_M_IRQ_EN                0x614
> +#define   M_SEC_IRQ_EN                  BIT(31, U)
> +#define   M_RX_FIFO_WATERMARK_EN        BIT(26, U)
> +#define   M_RX_FIFO_LAST_EN             BIT(27, U)
> +#define SE_GENI_S_CMD0                  0x630
> +#define   UART_START_READ               0x1
> +#define   S_OPCODE_SHFT                 27
> +#define SE_GENI_S_CMD_CTRL_REG          0x634
> +#define   S_GENI_CMD_ABORT              BIT(1, U)
> +#define SE_GENI_S_IRQ_STATUS            0x640
> +#define SE_GENI_S_IRQ_EN                0x644
> +#define   S_RX_FIFO_LAST_EN             BIT(27, U)
> +#define   S_RX_FIFO_WATERMARK_EN        BIT(26, U)
> +#define   S_CMD_ABORT_EN                BIT(5, U)
> +#define   S_CMD_DONE_EN                 BIT(0, U)
> +#define SE_GENI_S_IRQ_CLEAR             0x648
> +#define SE_GENI_RX_FIFOn                0x780
> +#define SE_GENI_TX_FIFO_STATUS          0x800
> +#define   TX_FIFO_WC                    GENMASK(27, 0)
> +#define SE_GENI_RX_FIFO_STATUS          0x804
> +#define   RX_LAST                       BIT(31, U)
> +#define   RX_LAST_BYTE_VALID_MSK        GENMASK(30, 28)
> +#define   RX_LAST_BYTE_VALID_SHFT       28
> +#define   RX_FIFO_WC_MSK                GENMASK(24, 0)
> +#define SE_GENI_TX_WATERMARK_REG        0x80c
> +
> +static struct qcom_uart {
> +    unsigned int irq;
> +    char __iomem *regs;
> +    struct irqaction irqaction;
> +} qcom_com = {0};
> +
> +static bool qcom_uart_poll_bit(void *addr, uint32_t mask, bool set)
> +{
> +    unsigned long timeout_us = 20000;
Why UL and not U?

> +    uint32_t reg;
> +
> +    while ( timeout_us ) {
Brace should be placed on its own line

> +        reg = readl(addr);
> +        if ( (bool)(reg & mask) == set )
> +            return true;
> +        udelay(10);
> +        timeout_us -= 10;
> +    }
> +
> +    return false;
> +}
> +
> +static void __init qcom_uart_init_preirq(struct serial_port *port)
> +{
> +    struct qcom_uart *uart = port->uart;
> +
> +    /* Stop anything in TX that earlyprintk configured and clear all errors */
> +    writel(M_GENI_CMD_ABORT, uart->regs + SE_GENI_M_CMD_CTRL_REG);
It would be easier to creare wrappers that would improve readability:
#define qcom_write(uart, off, val) writel((val), (uart)->regs + (off))
#define qcom_read(uart, off) readl((uart)->regs + (off))

> +    qcom_uart_poll_bit(uart->regs + SE_GENI_M_IRQ_STATUS, M_CMD_ABORT_EN,
> +                       true);
> +    writel(M_CMD_ABORT_EN, uart->regs + SE_GENI_M_IRQ_CLEAR);
> +
> +    /*
> +     * Configure FIFO length: 1 byte per FIFO entry. This is terribly
> +     * ineffective, as it is possible to cram 4 bytes per FIFO word,
> +     * like Linux does. But using one byte per FIFO entry makes this
> +     * driver much simpler.
> +     */
> +    writel(0xf, uart->regs + SE_GENI_TX_PACKING_CFG0);
> +    writel(0x0, uart->regs + SE_GENI_TX_PACKING_CFG1);
> +    writel(0xf, uart->regs + SE_GENI_RX_PACKING_CFG0);
> +    writel(0x0, uart->regs + SE_GENI_RX_PACKING_CFG1);
> +
> +    /* Reset RX state machine */
> +    writel(S_GENI_CMD_ABORT, uart->regs + SE_GENI_S_CMD_CTRL_REG);
> +    qcom_uart_poll_bit(uart->regs + SE_GENI_S_CMD_CTRL_REG,
> +                       S_GENI_CMD_ABORT, false);
> +    writel(S_CMD_DONE_EN | S_CMD_ABORT_EN, uart->regs + SE_GENI_S_IRQ_CLEAR);
> +    writel(FORCE_DEFAULT, uart->regs + GENI_FORCE_DEFAULT_REG);
> +}
> +
> +static void qcom_uart_interrupt(int irq, void *data, struct cpu_user_regs *regs)
serial_rx_interrupt has been modified not to take regs as parameter. Your patch breaks the build here.
You need to remove regs from here and ...

> +{
> +    struct serial_port *port = data;
> +    struct qcom_uart *uart = port->uart;
> +    uint32_t m_irq_status, s_irq_status;
> +
> +    m_irq_status = readl(uart->regs + SE_GENI_M_IRQ_STATUS);
> +    s_irq_status = readl(uart->regs + SE_GENI_S_IRQ_STATUS);
> +    writel(m_irq_status, uart->regs + SE_GENI_M_IRQ_CLEAR);
> +    writel(s_irq_status, uart->regs + SE_GENI_S_IRQ_CLEAR);
> +
> +    if ( s_irq_status & (S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN) )
> +        serial_rx_interrupt(port, regs);
here.

> +}
> +
> +static void __init qcom_uart_init_postirq(struct serial_port *port)
> +{
> +    struct qcom_uart *uart = port->uart;
> +    int rc;
> +    uint32_t val;
> +
> +    uart->irqaction.handler = qcom_uart_interrupt;
> +    uart->irqaction.name    = "qcom_uart";
> +    uart->irqaction.dev_id  = port;
> +
> +    if ( (rc = setup_irq(uart->irq, 0, &uart->irqaction)) != 0 )
Value assigned to rc does not seem to be used at all

> +        dprintk(XENLOG_ERR, "Failed to allocated qcom_uart IRQ %d\n",
> +                uart->irq);
> +
> +    /* Enable TX/RX and Error Interrupts  */
> +    writel(S_GENI_CMD_ABORT, uart->regs + SE_GENI_S_CMD_CTRL_REG);
> +    qcom_uart_poll_bit(uart->regs + SE_GENI_S_CMD_CTRL_REG,
> +                       S_GENI_CMD_ABORT, false);
> +    writel(S_CMD_DONE_EN | S_CMD_ABORT_EN, uart->regs + SE_GENI_S_IRQ_CLEAR);
> +    writel(FORCE_DEFAULT, uart->regs + GENI_FORCE_DEFAULT_REG);
> +
> +    val = readl(uart->regs + SE_GENI_S_IRQ_EN);
> +    val = S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN;
> +    writel(val, uart->regs + SE_GENI_S_IRQ_EN);
> +
> +    val = readl(uart->regs + SE_GENI_M_IRQ_EN);
> +    val = M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN;
> +    writel(val, uart->regs + SE_GENI_M_IRQ_EN);
> +
> +    /* Send RX command */
> +    writel(UART_START_READ << S_OPCODE_SHFT, uart->regs + SE_GENI_S_CMD0);
> +    qcom_uart_poll_bit(uart->regs + SE_GENI_M_IRQ_STATUS, M_SEC_IRQ_EN,
> +                       true);
> +}
> +
> +static void qcom_uart_putc(struct serial_port *port, char c)
> +{
> +    struct qcom_uart *uart = port->uart;
> +    uint32_t irq_clear = M_CMD_DONE_EN;
> +    uint32_t m_cmd;
> +    bool done;
> +
> +    /* Setup TX */
> +    writel(1, uart->regs + SE_UART_TX_TRANS_LEN);
> +
> +    writel(DEF_TX_WM, uart->regs + SE_GENI_TX_WATERMARK_REG);
> +
> +    m_cmd = UART_START_TX << M_OPCODE_SHFT;
> +    writel(m_cmd, uart->regs + SE_GENI_M_CMD0);
> +
> +    qcom_uart_poll_bit(uart->regs + SE_GENI_M_IRQ_STATUS,
> +                       M_TX_FIFO_WATERMARK_EN, true);
> +
> +    writel(c, uart->regs + SE_GENI_TX_FIFOn);
> +    writel(M_TX_FIFO_WATERMARK_EN, uart->regs + SE_GENI_M_IRQ_CLEAR);
> +
> +    /* Check for TX done */
> +    done = qcom_uart_poll_bit(uart->regs + SE_GENI_M_IRQ_STATUS, M_CMD_DONE_EN,
> +                              true);
> +    if ( !done )
> +    {
> +        writel(M_GENI_CMD_ABORT, uart->regs + SE_GENI_M_CMD_CTRL_REG);
> +        irq_clear |= M_CMD_ABORT_EN;
> +        qcom_uart_poll_bit(uart->regs + SE_GENI_M_IRQ_STATUS, M_CMD_ABORT_EN,
> +                           true);
> +
> +    }
> +    writel(irq_clear, uart->regs + SE_GENI_M_IRQ_CLEAR);
> +}
> +
> +static int qcom_uart_getc(struct serial_port *port, char *pc)
> +{
> +    struct qcom_uart *uart = port->uart;
> +
> +    if ( !readl(uart->regs + SE_GENI_RX_FIFO_STATUS) )
> +        return 0;
> +
> +    *pc = readl(uart->regs + SE_GENI_RX_FIFOn) & 0xFF;
> +
> +    writel(UART_START_READ << S_OPCODE_SHFT, uart->regs + SE_GENI_S_CMD0);
> +    qcom_uart_poll_bit(uart->regs + SE_GENI_M_IRQ_STATUS, M_SEC_IRQ_EN,
> +                       true);
> +
> +    return 1;
> +
> +}
> +
> +static struct uart_driver __read_mostly qcom_uart_driver = {
> +    .init_preirq  = qcom_uart_init_preirq,
> +    .init_postirq = qcom_uart_init_postirq,
> +    .putc         = qcom_uart_putc,
> +    .getc         = qcom_uart_getc,
> +};
> +
> +static const struct dt_device_match qcom_uart_dt_match[] __initconst =
> +{
> +    { .compatible = "qcom,geni-debug-uart"},
> +    { /* sentinel */ },
> +};
Can you move it right before DT_DEVICE_START?.

> +
> +static int __init qcom_uart_init(struct dt_device_node *dev,
> +                                 const void *data)
> +{
> +    const char *config = data;
> +    struct qcom_uart *uart;
> +    int res;
> +    paddr_t addr, size;
> +
> +    if ( strcmp(config, "") )
> +        printk("WARNING: UART configuration is not supported\n");
> +
> +    uart = &qcom_com;
> +
> +    res = dt_device_get_paddr(dev, 0, &addr, &size);
> +    if ( res )
> +    {
> +        printk("qcom-uart: Unable to retrieve the base"
> +               " address of the UART\n");
> +        return res;
> +    }
> +
> +    res = platform_get_irq(dev, 0);
> +    if ( res < 0 )
> +    {
> +        printk("qcom-uart: Unable to retrieve the IRQ\n");
> +        return res;
> +    }
> +    uart->irq = res;
> +
> +    uart->regs = ioremap_nocache(addr, size);
> +    if ( !uart->regs )
> +    {
> +        printk("qcom-uart: Unable to map the UART memory\n");
> +        return -ENOMEM;
> +    }
> +
> +    /* Register with generic serial driver */
> +    serial_register_uart(SERHND_DTUART, &qcom_uart_driver, uart);
> +
> +    dt_device_set_used_by(dev, DOMID_XEN);
> +
> +    return 0;
> +}
> +
> +DT_DEVICE_START(qcom_uart, "QCOM UART", DEVICE_SERIAL)
> +    .dt_match = qcom_uart_dt_match,
> +    .init = qcom_uart_init,
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
> 2.43.0

What about vUART? You don't seem to set vuart information that is used by vuart.c and vpl011.c

~Michal



