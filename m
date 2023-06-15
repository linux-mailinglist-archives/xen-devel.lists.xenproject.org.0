Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5A0730CCA
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 03:43:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549368.857850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9c0x-00032O-Ug; Thu, 15 Jun 2023 01:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549368.857850; Thu, 15 Jun 2023 01:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9c0x-00030S-Ry; Thu, 15 Jun 2023 01:43:07 +0000
Received: by outflank-mailman (input) for mailman id 549368;
 Thu, 15 Jun 2023 01:43:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZfe=CD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q9c0w-00030M-LT
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 01:43:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f787f996-0b1d-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 03:43:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B08F9636F6;
 Thu, 15 Jun 2023 01:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46206C433C0;
 Thu, 15 Jun 2023 01:43:01 +0000 (UTC)
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
X-Inumbo-ID: f787f996-0b1d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686793382;
	bh=jbUW231jiz+3a2KtIfzGL7nehmUWPPQmCa+PNrOjwOA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p3y/ztcjrB+kEeHCy8TmLl/p60XvVciz1uosopPww1stMRsQR5j9y3UjhSaYX7wBu
	 vl91REGxwEAI8blrKss7mF5HRKMdw1EVwKZLm0zk93y48dgl2XJLTIrlA4xWqaISQ2
	 brmwG+UvD+Bh/tX4Uy5dJDL4p/wNidbruDfHIbSX2XFn2XPFPhKAoyigEa9j+h10jh
	 wR0dmi8xEk19TPg23TvkBqqWVO0i+QWO0/fBpEFOJNcqYpVqPia6jhgautouSeabMM
	 +YSo7bHcbIhWyPLrjEE4h+rKJRm2yxHZNINBDbzdmLOq2qqTH0rQcwWescEOVKb4BY
	 oqbii7KJPagbw==
Date: Wed, 14 Jun 2023 18:42:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/4] xen/arm: debug-pl011: Add support for 32-bit only
 MMIO
In-Reply-To: <20230607092727.19654-3-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2306141842310.897208@ubuntu-linux-20-04-desktop>
References: <20230607092727.19654-1-michal.orzel@amd.com> <20230607092727.19654-3-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Jun 2023, Michal Orzel wrote:
> There are implementations of PL011 that can only handle 32-bit accesses
> as oppose to the normal behavior where accesses are 8/16-bit wide. This
> is usually advertised by setting a dt property 'reg-io-width' to 4.
> 
> Introduce CONFIG_EARLY_UART_PL011_MMIO32 Kconfig option to be able to
> enable the use of 32-bit only accessors in PL011 early printk code.
> Define macros PL011_{STRH,STRB,LDRH} to distinguish accessors for normal
> case from 32-bit MMIO one and use them in arm32/arm64 pl011 early printk
> code.
> 
> Update documentation accordingly.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

With the caveat of the potential change to patch #1 that would affect
this patch too


> ---
> I might want to align the indentation of operands but doing so in this patch
> is rather no go as it would limit the visibility of the scope of this patch.
> Something to do in the future.
> ---
>  docs/misc/arm/early-printk.txt        |  3 +++
>  xen/arch/arm/Kconfig.debug            |  7 +++++++
>  xen/arch/arm/arm32/debug-pl011.inc    | 12 ++++++------
>  xen/arch/arm/arm64/debug-pl011.inc    | 12 ++++++------
>  xen/arch/arm/include/asm/pl011-uart.h | 19 +++++++++++++++++++
>  5 files changed, 41 insertions(+), 12 deletions(-)
> 
> diff --git a/docs/misc/arm/early-printk.txt b/docs/misc/arm/early-printk.txt
> index aa22826075a4..bc2d65aa2ea3 100644
> --- a/docs/misc/arm/early-printk.txt
> +++ b/docs/misc/arm/early-printk.txt
> @@ -26,6 +26,9 @@ Other options depends on the driver selected:
>        If CONFIG_EARLY_UART_PL011_BAUD_RATE  is set to 0 then the code will
>        not try to initialize the UART, so that bootloader or firmware
>        settings can be used for maximum compatibility.
> +
> +    - CONFIG_EARLY_UART_PL011_MMIO32 is, optionally, used to enable 32-bit
> +      only accesses to registers.
>    - scif
>      - CONFIG_EARLY_UART_SCIF_VERSION_* is, optionally, the interface version
>        of the UART. Default to version NONE.
> diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
> index 842d768280c4..eec860e88e0b 100644
> --- a/xen/arch/arm/Kconfig.debug
> +++ b/xen/arch/arm/Kconfig.debug
> @@ -253,6 +253,13 @@ config EARLY_UART_PL011_BAUD_RATE
>  	default 115200 if EARLY_PRINTK_FASTMODEL
>  	default 0
>  
> +config EARLY_UART_PL011_MMIO32
> +	bool "32-bit only MMIO for PL011 early printk"
> +	depends on EARLY_UART_PL011
> +	help
> +	  If specified, all accesses to PL011 registers made from early printk code
> +	  will be done using 32-bit only accessors.
> +
>  config EARLY_UART_INIT
>  	depends on EARLY_UART_PL011 && EARLY_UART_PL011_BAUD_RATE != 0
>  	def_bool y
> diff --git a/xen/arch/arm/arm32/debug-pl011.inc b/xen/arch/arm/arm32/debug-pl011.inc
> index 9fe0c2503831..5833da2a235c 100644
> --- a/xen/arch/arm/arm32/debug-pl011.inc
> +++ b/xen/arch/arm/arm32/debug-pl011.inc
> @@ -26,13 +26,13 @@
>   */
>  .macro early_uart_init rb, rc, rd
>          mov   \rc, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
> -        strb  \rc, [\rb, #FBRD]     /* -> UARTFBRD (Baud divisor fraction) */
> +        PL011_STRB  \rc, [\rb, #FBRD]  /* -> UARTFBRD (Baud divisor fraction) */
>          mov   \rc, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
> -        strh  \rc, [\rb, #IBRD]     /* -> UARTIBRD (Baud divisor integer) */
> +        PL011_STRH  \rc, [\rb, #IBRD]  /* -> UARTIBRD (Baud divisor integer) */
>          mov   \rc, #WLEN_8          /* 8n1 */
> -        strb  \rc, [\rb, #LCR_H]     /* -> UARTLCR_H (Line control) */
> +        PL011_STRB  \rc, [\rb, #LCR_H] /* -> UARTLCR_H (Line control) */
>          ldr   \rc, =(RXE | TXE | UARTEN)      /* RXE | TXE | UARTEN */
> -        strh  \rc, [\rb, #CR]     /* -> UARTCR (Control Register) */
> +        PL011_STRH  \rc, [\rb, #CR]    /* -> UARTCR (Control Register) */
>  .endm
>  
>  /*
> @@ -42,7 +42,7 @@
>   */
>  .macro early_uart_ready rb, rc
>  1:
> -        ldrh  \rc, [\rb, #FR]       /* <- UARTFR (Flag register) */
> +        PL011_LDRH  \rc, [\rb, #FR] /* <- UARTFR (Flag register) */
>          tst   \rc, #BUSY             /* Check BUSY bit */
>          bne   1b                    /* Wait for the UART to be ready */
>  .endm
> @@ -53,7 +53,7 @@
>   * rt: register which contains the character to transmit
>   */
>  .macro early_uart_transmit rb, rt
> -        strb  \rt, [\rb, #DR]            /* -> UARTDR (Data Register) */
> +        PL011_STRB  \rt, [\rb, #DR]      /* -> UARTDR (Data Register) */
>  .endm
>  
>  /*
> diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
> index df713eff4922..430594610b2c 100644
> --- a/xen/arch/arm/arm64/debug-pl011.inc
> +++ b/xen/arch/arm/arm64/debug-pl011.inc
> @@ -25,13 +25,13 @@
>   */
>  .macro early_uart_init xb, c
>          mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
> -        strb  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
> +        PL011_STRB  w\c, [\xb, #FBRD]  /* -> UARTFBRD (Baud divisor fraction) */
>          mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
> -        strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
> +        PL011_STRH  w\c, [\xb, #IBRD]  /* -> UARTIBRD (Baud divisor integer) */
>          mov   x\c, #WLEN_8           /* 8n1 */
> -        strb  w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
> +        PL011_STRB  w\c, [\xb, #LCR_H] /* -> UARTLCR_H (Line control) */
>          ldr   x\c, =(RXE | TXE | UARTEN)
> -        strh  w\c, [\xb, #CR]        /* -> UARTCR (Control Register) */
> +        PL011_STRH  w\c, [\xb, #CR]    /* -> UARTCR (Control Register) */
>  .endm
>  
>  /*
> @@ -41,7 +41,7 @@
>   */
>  .macro early_uart_ready xb, c
>  1:
> -        ldrh  w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
> +        PL011_LDRH  w\c, [\xb, #FR]  /* <- UARTFR (Flag register) */
>          tst   w\c, #BUSY             /* Check BUSY bit */
>          b.ne  1b                     /* Wait for the UART to be ready */
>  .endm
> @@ -52,7 +52,7 @@
>   * wt: register which contains the character to transmit
>   */
>  .macro early_uart_transmit xb, wt
> -        strb  \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
> +        PL011_STRB  \wt, [\xb, #DR]  /* -> UARTDR (Data Register) */
>  .endm
>  
>  /*
> diff --git a/xen/arch/arm/include/asm/pl011-uart.h b/xen/arch/arm/include/asm/pl011-uart.h
> index 5bb563ec0814..27c9bfa444cb 100644
> --- a/xen/arch/arm/include/asm/pl011-uart.h
> +++ b/xen/arch/arm/include/asm/pl011-uart.h
> @@ -21,6 +21,25 @@
>  #ifndef __ASM_ARM_PL011_H
>  #define __ASM_ARM_PL011_H
>  
> +#ifdef __ASSEMBLY__
> +
> +/*
> + * PL011 registers are 8/16-bit wide. However, there are implementations that
> + * can only handle 32-bit accesses. The following macros used in early printk
> + * are defined to distinguish accessors for normal case from 32-bit MMIO one.
> + */
> +#ifdef CONFIG_EARLY_UART_PL011_MMIO32
> +#define PL011_STRH str
> +#define PL011_STRB str
> +#define PL011_LDRH ldr
> +#else
> +#define PL011_STRH strh
> +#define PL011_STRB strb
> +#define PL011_LDRH ldrh
> +#endif
> +
> +#endif /* __ASSEMBLY__ */
> +
>  /* PL011 register addresses */
>  #define DR     (0x00)
>  #define RSR    (0x04)
> -- 
> 2.25.1
> 

