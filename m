Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D1062AF2A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 00:11:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444077.698886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov54v-0000T2-R3; Tue, 15 Nov 2022 23:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444077.698886; Tue, 15 Nov 2022 23:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov54v-0000QK-NP; Tue, 15 Nov 2022 23:10:53 +0000
Received: by outflank-mailman (input) for mailman id 444077;
 Tue, 15 Nov 2022 23:10:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ov54u-0000QE-7M
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 23:10:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ov54t-0001Vl-PP; Tue, 15 Nov 2022 23:10:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ov54t-0005tx-JO; Tue, 15 Nov 2022 23:10:51 +0000
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
	bh=RuylqQiY+3kLe1H6S2G+Pmc4iWsnRlddUb5n4Sh++hY=; b=3LYLj6HIrvk0Do3YCbWX3f3Guh
	k94T5AKTQLgd/JD86UydaHOmdvF+mtQYixED+YKca3sVHFVF170unesKbJjCNfO+tfKAoKCadfqd6
	0sVU29L30o63B53J2C8hEaBu1xEL2uFrx4KhLcc65DIEb9S3blrUz0TFzTbIBzXUrI+g=;
Message-ID: <fd7bd57d-b7a2-8be6-cead-2903a6115f40@xen.org>
Date: Tue, 15 Nov 2022 23:10:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] xen/arm: debug-pl011.inc: Use macros instead of hardcoded
 values
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221024100536.12874-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221024100536.12874-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 24/10/2022 11:05, Michal Orzel wrote:
> Make use of the macros defined in asm/pl011-uart.h instead of hardcoding
> the values. Also, take the opportunity to fix the file extension in a
> top-level comment.
> 
> No functional change intended.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

With one comment below:

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
>   xen/arch/arm/arm64/debug-pl011.inc | 20 +++++++++++---------
>   1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
> index 1928a2e3ffbb..d82f2f1de197 100644
> --- a/xen/arch/arm/arm64/debug-pl011.inc
> +++ b/xen/arch/arm/arm64/debug-pl011.inc
> @@ -1,5 +1,5 @@
>   /*
> - * xen/arch/arm/arm64/debug-pl011.S
> + * xen/arch/arm/arm64/debug-pl011.inc
>    *
>    * PL011 specific debug code
>    *
> @@ -16,6 +16,8 @@
>    * GNU General Public License for more details.
>    */
>   
> + #include <asm/pl011-uart.h>
> +
>   /*
>    * PL011 UART initialization
>    * xb: register which containts the UART base address
> @@ -23,13 +25,13 @@
>    */
>   .macro early_uart_init xb, c
>           mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
> -        strh  w\c, [\xb, #0x28]      /* -> UARTFBRD (Baud divisor fraction) */
> +        strh  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
>           mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
> -        strh  w\c, [\xb, #0x24]      /* -> UARTIBRD (Baud divisor integer) */
> +        strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
>           mov   x\c, #0x60             /* 8n1 */

Can we introduce macro/define for 0x60?

> -        str   w\c, [\xb, #0x2C]      /* -> UARTLCR_H (Line control) */
> -        ldr   x\c, =0x00000301       /* RXE | TXE | UARTEN */
> -        str   w\c, [\xb, #0x30]      /* -> UARTCR (Control Register) */
> +        str   w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
> +        ldr   x\c, =(RXE | TXE | UARTEN)
> +        str   w\c, [\xb, #CR]        /* -> UARTCR (Control Register) */
>   .endm

Cheers,

-- 
Julien Grall

