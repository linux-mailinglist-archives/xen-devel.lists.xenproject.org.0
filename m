Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55074974524
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 23:59:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796077.1205582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so8su-0003qX-0v; Tue, 10 Sep 2024 21:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796077.1205582; Tue, 10 Sep 2024 21:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so8st-0003oo-UZ; Tue, 10 Sep 2024 21:58:51 +0000
Received: by outflank-mailman (input) for mailman id 796077;
 Tue, 10 Sep 2024 21:58:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1so8st-0003oi-2e
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 21:58:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1so8ss-0001q4-JE; Tue, 10 Sep 2024 21:58:50 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1so8ss-0005ot-EP; Tue, 10 Sep 2024 21:58:50 +0000
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
	bh=tGWPDrqdO3DZHfHH9IK6qaMYmpHrr61VTh9eS0pFpDw=; b=SoiY/iQlpEReEgagEBR5VuZfkf
	DREmuP0Tzt8pOi7EDILFXxcjJKGuM5by8r2rrogbqfWJq/jVjJS2itm/w8B8qedxJpF4pFqtfP5D+
	tbiuAW0vxgHY2LVpckycfX0f9U0pAa9t/jUEAmPUWs7LKvB3cn8Jpup0P5uRLbNrYld4=;
Message-ID: <e1644410-4875-4243-8ba4-3d26c116b96b@xen.org>
Date: Tue, 10 Sep 2024 22:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] xen/arm: Add NXP LINFlexD UART early printk
 support
Content-Language: en-GB
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
 <20240910143411.178704-3-andrei.cherechesu@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240910143411.178704-3-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/09/2024 15:34, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> This adds support for early printk debug via the NXP LINFlexD
> UART controller.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> Signed-off-by: Peter van der Perk <peter.vander.perk@nxp.com>
> ---
>   xen/arch/arm/Kconfig.debug           | 14 +++++++
>   xen/arch/arm/arm64/debug-linflex.inc | 58 ++++++++++++++++++++++++++++
>   2 files changed, 72 insertions(+)
>   create mode 100644 xen/arch/arm/arm64/debug-linflex.inc
> 
> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
> index eec860e88e..a309f67f90 100644
> --- a/xen/arch/arm/Kconfig.debug
> +++ b/xen/arch/arm/Kconfig.debug
> @@ -68,6 +68,16 @@ choice
>   			provide the parameters for the i.MX LPUART rather than
>   			selecting one of the platform specific options below if
>   			you know the parameters for the port.
> +	config EARLY_UART_CHOICE_LINFLEX
> +		select EARLY_UART_LINFLEX
> +		depends on ARM_64
> +		bool "Early printk via NXP LINFlexD UART"
> +		help
> +			Say Y here if you wish the early printk to direct their
> +			output to an NXP LINFlexD UART. You can use this option to
> +			provide the parameters for the NXP LINFlexD UART rather than
> +			selecting one of the platform specific options below if
> +			you know the parameters for the port.
>   	config EARLY_UART_CHOICE_MESON
>   		select EARLY_UART_MESON
>   		depends on ARM_64
> @@ -199,6 +209,9 @@ config EARLY_UART_EXYNOS4210
>   config EARLY_UART_IMX_LPUART
>   	select EARLY_PRINTK
>   	bool
> +config EARLY_UART_LINFLEX
> +	select EARLY_PRINTK
> +	bool
>   config EARLY_UART_MESON
>   	select EARLY_PRINTK
>   	bool
> @@ -304,6 +317,7 @@ config EARLY_PRINTK_INC
>   	default "debug-cadence.inc" if EARLY_UART_CADENCE
>   	default "debug-exynos4210.inc" if EARLY_UART_EXYNOS4210
>   	default "debug-imx-lpuart.inc" if EARLY_UART_IMX_LPUART
> +	default "debug-linflex.inc" if EARLY_UART_LINFLEX
>   	default "debug-meson.inc" if EARLY_UART_MESON
>   	default "debug-mvebu.inc" if EARLY_UART_MVEBU
>   	default "debug-pl011.inc" if EARLY_UART_PL011
> diff --git a/xen/arch/arm/arm64/debug-linflex.inc b/xen/arch/arm/arm64/debug-linflex.inc
> new file mode 100644
> index 0000000000..6ed704e104
> --- /dev/null
> +++ b/xen/arch/arm/arm64/debug-linflex.inc
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

GPL-2.0 is deprecated and replaced by GPL-2.0-only.

> +/*
> + * xen/arch/arm/arm64/debug-linflex.inc
> + *
> + * NXP LINFlexD UART specific debug code
> + *
> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
> + * Copyright 2018, 2021, 2023-2024 NXP
> + */
> +
> +#include <asm/asm_defns.h>
> +#include <asm/linflex-uart.h>
> +
> +/*
> + * wait LINFlexD UART to be ready to transmit
> + * xb: register which contains the UART base address
> + * c: scratch register number
> + */
> +.macro early_uart_ready xb, c
> +    ldr   w\c, [\xb, #UARTCR]       /* <= Control Register */
> +    and   w\c, w\c, #UARTCR_TFBM    /* Check Buffer/FIFO (0/1) Mode */
> +    cbz   w\c, 2f                   /* Buffer Mode => return */
> +1:
> +    ldrb  w\c, [\xb, #UARTSR]       /* <= Status Register */
> +    tst   w\c, #UARTSR_DTFTFF       /* FIFO Mode => Check DTF bit */
> +    b.ne  1b
> +2:
> +.endm
> +
> +/*
> + * LINFlexD UART transmit character
> + * xb: register which contains the UART base address
> + * wt: register which contains the character to transmit
> + */
> +.macro early_uart_transmit xb, wt
> +    strb  \wt, [\xb, #BDRL]
> +
> +    ldr   \wt, [\xb, #UARTCR]       /* <= Control Register */
> +    and   \wt, \wt, #UARTCR_TFBM    /* Check Buffer/FIFO (0/1) Mode */
> +    cbnz  \wt, 2f                   /* FIFO Mode => goto exit */
> +
> +3:  /* Buffer Mode */
> +    ldrb  \wt, [\xb, #UARTSR]       /* <= Status Register */
> +    and   \wt, \wt, #UARTSR_DTFTFF  /* Check Transmission Completed */
> +    cbz   \wt, 3b
> +
> +    ldr   \wt, [\xb, #UARTSR]       /* <= Status Register */
> +    orr   \wt, \wt, #UARTSR_DTFTFF  /* Clear DTF bit */
> +    str   \wt, [\xb, #UARTSR]
> +2:
> +.endm
> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */
> \ No newline at end of file

The file should end with a newline.

I haven't looked at the specifics of the UART. But the code integration 
in Xen LGTM. So with the two comments addressed:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


