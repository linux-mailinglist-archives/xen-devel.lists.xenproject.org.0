Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5C1730CA6
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 03:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549361.857839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9bup-0001Wg-6D; Thu, 15 Jun 2023 01:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549361.857839; Thu, 15 Jun 2023 01:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9bup-0001Ub-2j; Thu, 15 Jun 2023 01:36:47 +0000
Received: by outflank-mailman (input) for mailman id 549361;
 Thu, 15 Jun 2023 01:36:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZfe=CD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1q9buo-0001UV-7O
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 01:36:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 140cbc44-0b1d-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 03:36:42 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC239616B4;
 Thu, 15 Jun 2023 01:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D9EC433C0;
 Thu, 15 Jun 2023 01:36:39 +0000 (UTC)
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
X-Inumbo-ID: 140cbc44-0b1d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686793000;
	bh=XZQwi+GeRT9RpqzfkPlkRlZcwMxms+dXPo+ibCeec+I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kIz37C/dTpxwJGQCZCc08dHpu9N5KWsBwxfNLk3cJU3lsga9BzTDQAaITk0UXVj+J
	 BXLgKW0r9hMCKasN8PPp/TmUKhDnzv12co3CXIAc0XYhSe4OCNYFHGTlBrA7RqMoVK
	 L84XBrbUNUWdi0Bgr6zLHVWLDxSL2hO/stgwARvEpUk/zpWaDzCaeSsfQywhy80DIw
	 O3/GwPVIjPO8kYnIuZPICW+YdemlgDuXkdji64+BvLtizpLuaa2WNgLTMd7FNoTHGb
	 Idu/V7rzvICuSPA6KBGi9vUuEAJ22RcLYWoGYanXWh414/gTIF7fEORFyU9ueWMqqh
	 ow0EyLzF7OKgQ==
Date: Wed, 14 Jun 2023 18:36:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/4] xen/arm: debug-pl011: Use correct accessors
In-Reply-To: <20230607092727.19654-2-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2306141836050.897208@ubuntu-linux-20-04-desktop>
References: <20230607092727.19654-1-michal.orzel@amd.com> <20230607092727.19654-2-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Jun 2023, Michal Orzel wrote:
> Although most PL011 UARTs can cope with 32-bit accesses, some of the old
> legacy ones might not. PL011 registers are 8/16-bit wide and this shall
> be perceived as the normal behavior.
> 
> Modify early printk pl011 code for arm32/arm64 to use the correct
> accessors depending on the register size (refer ARM DDI 0183G, Table 3.1).
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Next patch will override strX,ldrX with macros but I prefer to keep the
> history clean (+ possibiltity for a backport if needed).
> ---
>  xen/arch/arm/arm32/debug-pl011.inc | 12 ++++++------
>  xen/arch/arm/arm64/debug-pl011.inc |  6 +++---
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/debug-pl011.inc b/xen/arch/arm/arm32/debug-pl011.inc
> index c527f1d4424d..9fe0c2503831 100644
> --- a/xen/arch/arm/arm32/debug-pl011.inc
> +++ b/xen/arch/arm/arm32/debug-pl011.inc
> @@ -26,13 +26,13 @@
>   */
>  .macro early_uart_init rb, rc, rd
>          mov   \rc, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
> -        str   \rc, [\rb, #FBRD]     /* -> UARTFBRD (Baud divisor fraction) */
> +        strb  \rc, [\rb, #FBRD]     /* -> UARTFBRD (Baud divisor fraction) */
>          mov   \rc, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
> -        str   \rc, [\rb, #IBRD]     /* -> UARTIBRD (Baud divisor integer) */
> +        strh  \rc, [\rb, #IBRD]     /* -> UARTIBRD (Baud divisor integer) */
>          mov   \rc, #WLEN_8          /* 8n1 */
> -        str   \rc, [\rb, #LCR_H]     /* -> UARTLCR_H (Line control) */
> +        strb  \rc, [\rb, #LCR_H]     /* -> UARTLCR_H (Line control) */
>          ldr   \rc, =(RXE | TXE | UARTEN)      /* RXE | TXE | UARTEN */
> -        str   \rc, [\rb, #CR]     /* -> UARTCR (Control Register) */
> +        strh  \rc, [\rb, #CR]     /* -> UARTCR (Control Register) */
>  .endm
>  
>  /*
> @@ -42,7 +42,7 @@
>   */
>  .macro early_uart_ready rb, rc
>  1:
> -        ldr   \rc, [\rb, #FR]       /* <- UARTFR (Flag register) */
> +        ldrh  \rc, [\rb, #FR]       /* <- UARTFR (Flag register) */
>          tst   \rc, #BUSY             /* Check BUSY bit */
>          bne   1b                    /* Wait for the UART to be ready */
>  .endm
> @@ -53,7 +53,7 @@
>   * rt: register which contains the character to transmit
>   */
>  .macro early_uart_transmit rb, rt
> -        str   \rt, [\rb, #DR]            /* -> UARTDR (Data Register) */
> +        strb  \rt, [\rb, #DR]            /* -> UARTDR (Data Register) */

Isn't UARTDR potentially 12-bit? I am not sure if we should use strb or
strh here...

Everything else checks out.


>  .endm
>  
>  /*
> diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
> index 6d60e78c8ba3..df713eff4922 100644
> --- a/xen/arch/arm/arm64/debug-pl011.inc
> +++ b/xen/arch/arm/arm64/debug-pl011.inc
> @@ -25,13 +25,13 @@
>   */
>  .macro early_uart_init xb, c
>          mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
> -        strh  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
> +        strb  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
>          mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
>          strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
>          mov   x\c, #WLEN_8           /* 8n1 */
> -        str   w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
> +        strb  w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
>          ldr   x\c, =(RXE | TXE | UARTEN)
> -        str   w\c, [\xb, #CR]        /* -> UARTCR (Control Register) */
> +        strh  w\c, [\xb, #CR]        /* -> UARTCR (Control Register) */
>  .endm
>  
>  /*
> -- 
> 2.25.1
> 

