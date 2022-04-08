Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA61B4F9377
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 13:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301395.514355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmQG-0000J3-Ri; Fri, 08 Apr 2022 11:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301395.514355; Fri, 08 Apr 2022 11:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmQG-0000GN-Oc; Fri, 08 Apr 2022 11:05:00 +0000
Received: by outflank-mailman (input) for mailman id 301395;
 Fri, 08 Apr 2022 11:04:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=co1q=US=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1ncmQF-0000GH-CI
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 11:04:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b9e44d5c-b72b-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 13:04:58 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6F1A11FB;
 Fri,  8 Apr 2022 04:04:56 -0700 (PDT)
Received: from [10.57.7.146] (unknown [10.57.7.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 118223F73B;
 Fri,  8 Apr 2022 04:04:53 -0700 (PDT)
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
X-Inumbo-ID: b9e44d5c-b72b-11ec-a405-831a346695d4
Message-ID: <6a806c9d-2723-1db0-49c4-25a98ac06ff5@arm.com>
Date: Fri, 8 Apr 2022 13:04:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 1/2] xen/arm: Add i.MX lpuart driver
Content-Language: en-US
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, sstabellini@kernel.org,
 julien@xen.org, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, xen-devel@lists.xenproject.org, van.freenix@gmail.com,
 Peng Fan <peng.fan@nxp.com>, Henry Wang <Henry.Wang@arm.com>
References: <20220407024418.9827-1-peng.fan@oss.nxp.com>
 <20220407024418.9827-2-peng.fan@oss.nxp.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220407024418.9827-2-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Peng,

On 07.04.2022 04:44, Peng Fan (OSS) wrote:
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
> index 0000000000..111640edb4
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
> +#define UARTSTAT_TDRE     BIT(23)
> +#define UARTSTAT_TC       BIT(22)
> +#define UARTSTAT_RDRF     BIT(21)
> +#define UARTSTAT_OR       BIT(19)
> +
> +#define UARTBAUD_OSR_SHIFT (24)
> +#define UARTBAUD_OSR_MASK (0x1f)
> +#define UARTBAUD_SBR_MASK (0x1fff)
> +#define UARTBAUD_BOTHEDGE (0x00020000)
> +#define UARTBAUD_TDMAE    (0x00800000)
> +#define UARTBAUD_RDMAE    (0x00200000)
Could you please align the values at least within the section?

Cheers,
Michal

