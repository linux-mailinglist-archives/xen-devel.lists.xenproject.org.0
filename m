Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6067C4C65B4
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 10:31:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280271.478149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOcNE-0005yT-NJ; Mon, 28 Feb 2022 09:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280271.478149; Mon, 28 Feb 2022 09:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOcNE-0005wB-Iw; Mon, 28 Feb 2022 09:31:20 +0000
Received: by outflank-mailman (input) for mailman id 280271;
 Mon, 28 Feb 2022 09:31:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nOcNC-0005w5-Cf
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 09:31:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOcN7-0001fm-1J; Mon, 28 Feb 2022 09:31:13 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.13.237]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOcN6-0001FR-Qd; Mon, 28 Feb 2022 09:31:12 +0000
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
	bh=GJxpW+wfT2tUsI60DYqhNvRAnqEPYv+Af2H65Lz/+CQ=; b=qwe83a5g+Uc7VPY8jN+5WoUn6Z
	l+hRfsWPmemGC1nX7Dq0m6h6hMbnLu0HIS3SENl9eGSTAknJY0nm+HYjuH5l8m93MKrsYRd+ZO1iy
	UOKmtAK/MKy//Xnf7xjjHqSsn6Ya7vWcZIE/csZ8s4DzbO815vm8pOv0OH0O97TwMKTA=;
Message-ID: <e55f32f9-4d24-77a9-026b-201536c73708@xen.org>
Date: Mon, 28 Feb 2022 09:31:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 3/3] xen/arm: Add i.MX8QM platform support
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, xen-devel@lists.xenproject.org, van.freenix@gmail.com,
 Peng Fan <peng.fan@nxp.com>
References: <20220228010711.11566-1-peng.fan@oss.nxp.com>
 <20220228010711.11566-4-peng.fan@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220228010711.11566-4-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Peng,

On 28/02/2022 01:07, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   xen/arch/arm/Kconfig.debug      |  3 +++
>   xen/arch/arm/platforms/Makefile |  1 +
>   xen/arch/arm/platforms/imx8qm.c | 44 +++++++++++++++++++++++++++++++++
>   3 files changed, 48 insertions(+)
>   create mode 100644 xen/arch/arm/platforms/imx8qm.c
> 
> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
> index 9ecb446b3a..43ccd8fe62 100644
> --- a/xen/arch/arm/Kconfig.debug
> +++ b/xen/arch/arm/Kconfig.debug
> @@ -143,6 +143,9 @@ choice
>   	config EARLY_PRINTK_HIKEY960
>   		bool "Early printk with pl011 with Hikey 960"
>   		select EARLY_UART_PL011
> +	config EARLY_PRINTK_IMX8QM
> +		bool "Early printk with i.MX LPUART with i.MX8QM"
> +		select EARLY_UART_IMX_LPUART

The goal of platform specific early printk is to select to UART address 
(see EARLY_UART_BASE_ADDRESS).

However, we have deprecated them. So we should avoid adding new ones.

>   	config EARLY_PRINTK_JUNO
>   		bool "Early printk with pl011 on Juno platform"
>   		select EARLY_UART_PL011
> diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makefile
> index 8632f4115f..bec6e55d1f 100644
> --- a/xen/arch/arm/platforms/Makefile
> +++ b/xen/arch/arm/platforms/Makefile
> @@ -9,5 +9,6 @@ obj-$(CONFIG_ALL_PLAT)   += sunxi.o
>   obj-$(CONFIG_ALL64_PLAT) += thunderx.o
>   obj-$(CONFIG_ALL64_PLAT) += xgene-storm.o
>   obj-$(CONFIG_ALL64_PLAT) += brcm-raspberry-pi.o
> +obj-$(CONFIG_ALL64_PLAT) += imx8qm.o
>   obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp.o
>   obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp-eemi.o
> diff --git a/xen/arch/arm/platforms/imx8qm.c b/xen/arch/arm/platforms/imx8qm.c
> new file mode 100644
> index 0000000000..289c18e5f9
> --- /dev/null
> +++ b/xen/arch/arm/platforms/imx8qm.c
> @@ -0,0 +1,44 @@
> +/*
> + * xen/arch/arm/platforms/imx8qm.c
> + *
> + * i.MX 8QM setup
> + *
> + * Copyright 2022 NXP
> + *
> + * Peng Fan <peng.fan@nxp.com>
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
> +#include <xen/delay.h>
> +#include <xen/mm.h>
> +#include <xen/vmap.h>
> +#include <asm/io.h>
> +#include <asm/platform.h>
> +
> +static const char * const imx8qm_dt_compat[] __initconst =
> +{
> +    "fsl,imx8qm",
> +    NULL
> +};
> +
> +PLATFORM_START(imx8qm, "i.MX 8")
> +    .compatible = imx8qm_dt_compat,
> +PLATFORM_END

We are only adding new platform definition when quirks are necessary. Do 
you need specific quirks for the i.MX8QM?

A somewhat related question, is this series enough to boot Xen upstream 
on the board?

Cheers,

-- 
Julien Grall

