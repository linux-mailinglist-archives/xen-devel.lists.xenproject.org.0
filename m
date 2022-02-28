Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA3B4C659F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 10:25:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280255.478126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOcGz-0003qg-KZ; Mon, 28 Feb 2022 09:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280255.478126; Mon, 28 Feb 2022 09:24:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOcGz-0003o7-HP; Mon, 28 Feb 2022 09:24:53 +0000
Received: by outflank-mailman (input) for mailman id 280255;
 Mon, 28 Feb 2022 09:24:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nOcGy-0003o1-OY
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 09:24:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOcGt-0001WT-Uc; Mon, 28 Feb 2022 09:24:47 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.13.237]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOcGt-0000ow-NY; Mon, 28 Feb 2022 09:24:47 +0000
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
	bh=J9TazujMzOd3uEITzkilChYyt8P6hhqqD1QqS3i3a2M=; b=vtrINLSuUEd2RARdFBGPLYSB55
	Ba/i7CfTx+lh8yYS6dQFHiyKcjIXoOSxzSVapWyQZlsf7s/elkIJvB+fuZ1YHK32WgYnGckfrJCpL
	nfIwrH9HTP+PhYevIuXuRWvtovNRBlaXeafPTflBd1H5jCX2YL2od8TzXQUf6FUu0tqQ=;
Message-ID: <ba77dc96-d421-b775-d5fd-99dc3ea2dfad@xen.org>
Date: Mon, 28 Feb 2022 09:24:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 2/3] xen/arm: Add i.MX lpuart early printk support
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, xen-devel@lists.xenproject.org, van.freenix@gmail.com,
 Peng Fan <peng.fan@nxp.com>
References: <20220228010711.11566-1-peng.fan@oss.nxp.com>
 <20220228010711.11566-3-peng.fan@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220228010711.11566-3-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Peng,

On 28/02/2022 01:07, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   xen/arch/arm/Kconfig.debug              | 18 ++++++++++
>   xen/arch/arm/arm64/debug-imx-lpuart.inc | 48 +++++++++++++++++++++++++
>   2 files changed, 66 insertions(+)
>   create mode 100644 xen/arch/arm/arm64/debug-imx-lpuart.inc
> 
> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
> index 35ccd13273..9ecb446b3a 100644
> --- a/xen/arch/arm/Kconfig.debug
> +++ b/xen/arch/arm/Kconfig.debug
> @@ -55,6 +55,20 @@ choice
>   			selecting one of the platform specific options below if
>   			you know the parameters for the port.
>   
> +			This option is preferred over the platform specific
> +			options; the platform specific options are deprecated
> +			and will soon be removed.
> +	config EARLY_UART_CHOICE_IMX_LPUART
> +		select EARLY_UART_IMX_LPUART
> +		depends on ARM_64
> +		bool "Early printk via i.MX LPUART"
> +		help
> +			Say Y here if you wish the early printk to direct their
> +			output to a i.MX LPUART. You can use this option to
> +			provide the parameters for the i.MX LPUART rather than
> +			selecting one of the platform specific options below if
> +			you know the parameters for the port.

Plaform specific early printk are deprecated. So I would rather prefer 
we are not introducing new one. Can you adjust the description to remove 
any mention of platform specific options?

> +
>   			This option is preferred over the platform specific
>   			options; the platform specific options are deprecated
>   			and will soon be removed.
> @@ -186,6 +200,9 @@ config EARLY_UART_CADENCE
>   config EARLY_UART_EXYNOS4210
>   	select EARLY_PRINTK
>   	bool
> +config EARLY_UART_IMX_LPUART
> +	select EARLY_PRINTK
> +	bool
>   config EARLY_UART_MESON
>   	select EARLY_PRINTK
>   	bool
> @@ -283,6 +300,7 @@ config EARLY_PRINTK_INC
>   	default "debug-8250.inc" if EARLY_UART_8250
>   	default "debug-cadence.inc" if EARLY_UART_CADENCE
>   	default "debug-exynos4210.inc" if EARLY_UART_EXYNOS4210
> +	default "debug-imx-lpuart.inc" if EARLY_UART_IMX_LPUART
>   	default "debug-meson.inc" if EARLY_UART_MESON
>   	default "debug-mvebu.inc" if EARLY_UART_MVEBU
>   	default "debug-pl011.inc" if EARLY_UART_PL011
> diff --git a/xen/arch/arm/arm64/debug-imx-lpuart.inc b/xen/arch/arm/arm64/debug-imx-lpuart.inc
> new file mode 100644
> index 0000000000..7510210d46
> --- /dev/null
> +++ b/xen/arch/arm/arm64/debug-imx-lpuart.inc
> @@ -0,0 +1,48 @@
> +/*
> + * xen/arch/arm/arm64/debug-imx8qm.inc
> + *
> + * i.MX8QM specific debug code
> + *
> + * Peng Fan <peng.fan@nxp.com>
> + * Copyright (C) 2016 Freescale Inc.
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
> +#include <xen/imx-lpuart.h>
> +
> +.macro early_uart_init wb wc wd
> +/* Already initialized in bootloader */
> +.endm

NIT: I would add a newline to separate with this macro from next one.

> +/* i.MX8QM wait LPUART to be ready to transmit
> + * rb: register which contains the UART base address
> + * rc: scratch register
> + */

The coding style for multi-lines comment is:

/*
  * Foo
  * Bar
  */

> +.macro early_uart_ready xb, c
> +1:
> +        ldr   w\c, [\xb, #UARTSTAT]   /* <- Flag register */
> +        tst   w\c, #UARTSTAT_TDRE     /* Check FIFO EMPTY bit */
> +        beq   1b                      /* Wait for the UART to be ready */
> +.endm
> +
> +/* i.MX8QM LPUART transmit character
> + * rb: register which contains the UART base address
> + * rt: register which contains the character to transmit */

Coding style:

/*
  * Foo
  * Bar
  */

> +.macro early_uart_transmit xb, wt
> +        str   \wt, [\xb, #UARTDATA]  /* -> Data Register */
> +.endm
> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */

Cheers,

-- 
Julien Grall

