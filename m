Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F037479A2
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 23:37:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558717.873054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGngk-0001lQ-2c; Tue, 04 Jul 2023 21:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558717.873054; Tue, 04 Jul 2023 21:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGngj-0001jP-VM; Tue, 04 Jul 2023 21:35:57 +0000
Received: by outflank-mailman (input) for mailman id 558717;
 Tue, 04 Jul 2023 21:35:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGngi-0001jJ-1o
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 21:35:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGngh-0003Zh-IF; Tue, 04 Jul 2023 21:35:55 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGngh-0007Ig-Cg; Tue, 04 Jul 2023 21:35:55 +0000
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
	bh=uDt5mMiKSDYb/kJLlR+rwlP8WxXyzPqg54+rqEDvvBA=; b=XAY1P/9RwMlfoGFUrBF5s6SJLO
	xUa1jWXS71VJzU4/adaWymINXia3hNYx018Witd4YFcX3OXyErOEcnl1/FBa7f2TfyakAim8ksXJm
	c1odxtYlGMJXDmS5iqBfTp6Q7RCHffNiB1hTqMKdA2ZdDH9RiSXhM59gLWgvrnzljMjI=;
Message-ID: <2752bf5a-ae87-8cf9-fe4e-d7c2d7a1a6e5@xen.org>
Date: Tue, 4 Jul 2023 22:35:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 07/52] xen/arm64: prepare for moving MMU related code
 from head.S
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-8-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230626033443.2943270-8-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 26/06/2023 04:33, Penny Zheng wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> We want to reuse head.S for MPU systems, but there are some
> code are implemented for MMU systems only. We will move such
> code to another MMU specific file. But before that we will
> do some indentations fix in this patch to make them be easier
> for reviewing:
> 1. Fix the indentations of code comments.
> 2. Fix the indentations for .text.header section.
> 3. Rename puts() to asm_puts() for global export
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v1 -> v2:
> 1. New patch.
> ---
> v3:
> 1. fix commit message
> 2. Rename puts() to asm_puts() for global export
> ---
>   xen/arch/arm/arm64/head.S | 42 +++++++++++++++++++--------------------
>   1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 4dfbe0bc6f..66347eedcc 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -94,7 +94,7 @@
>   #define PRINT(_s)          \
>           mov   x3, lr ;     \
>           adr   x0, 98f ;    \

This was recently changed to adr_l in staging. So you will need to 
rebase this patch.

> -        bl    puts    ;    \
> +        bl    asm_puts ;   \
>           mov   lr, x3 ;     \
>           RODATA_STR(98, _s)
>   
> @@ -136,22 +136,22 @@
>           add \xb, \xb, x20
>   .endm
>   
> -        .section .text.header, "ax", %progbits
> -        /*.aarch64*/
> +.section .text.header, "ax", %progbits
> +/*.aarch64*/
>   
> -        /*
> -         * Kernel startup entry point.
> -         * ---------------------------
> -         *
> -         * The requirements are:
> -         *   MMU = off, D-cache = off, I-cache = on or off,
> -         *   x0 = physical address to the FDT blob.
> -         *
> -         * This must be the very first address in the loaded image.
> -         * It should be linked at XEN_VIRT_START, and loaded at any
> -         * 4K-aligned address.  All of text+data+bss must fit in 2MB,
> -         * or the initial pagetable code below will need adjustment.
> -         */
> +/*
> + * Kernel startup entry point.
> + * ---------------------------
> + *
> + * The requirements are:
> + *   MMU = off, D-cache = off, I-cache = on or off,
> + *   x0 = physical address to the FDT blob.
> + *
> + * This must be the very first address in the loaded image.
> + * It should be linked at XEN_VIRT_START, and loaded at any
> + * 4K-aligned address.  All of text+data+bss must fit in 2MB,
> + * or the initial pagetable code below will need adjustment.
> + */
>   
>   GLOBAL(start)
>           /*
> @@ -520,7 +520,7 @@ ENDPROC(cpu_init)
>    * Macro to create a mapping entry in \tbl to \phys. Only mapping in 3rd
>    * level table (i.e page granularity) is supported.
>    *
> - * ptbl:     table symbol where the entry will be created
> + * ptbl:    table symbol where the entry will be created
>    * virt:    virtual address
>    * phys:    physical address (should be page aligned)
>    * tmp1:    scratch register
> @@ -928,15 +928,15 @@ ENDPROC(init_uart)
>    * x0: Nul-terminated string to print.
>    * x23: Early UART base address
>    * Clobbers x0-x1 */
> -puts:
> +ENTRY(asm_puts)

Can you mention in the comment that this function is only supposed to be 
called from assembly?

While you are at it, can you update the comment coding style to:

/*
  * Foo
  * Bar
  */

>           early_uart_ready x23, 1
>           ldrb  w1, [x0], #1           /* Load next char */
>           cbz   w1, 1f                 /* Exit on nul */
>           early_uart_transmit x23, w1
> -        b     puts
> +        b     asm_puts
>   1:
>           ret
> -ENDPROC(puts)
> +ENDPROC(asm_puts)
>   
>   /*
>    * Print a 64-bit number in hex.
> @@ -966,7 +966,7 @@ hex:    .ascii "0123456789abcdef"
>   
>   ENTRY(early_puts)
>   init_uart:
> -puts:
> +asm_puts:

I find odd that you add ENTRY() to the asm_puts() above but not here. 
However... I can't find any use of asm_puts() outside #ifdef 
CONFIG_EARLY_PRINTK. So maybe it can be dropped?


>   putn:   ret
>   
>   #endif /* !CONFIG_EARLY_PRINTK */

Cheers,

-- 
Julien Grall

