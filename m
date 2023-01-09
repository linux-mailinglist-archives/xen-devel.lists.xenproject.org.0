Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0ED662AD1
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 17:07:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473822.734622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEug0-0002Jc-1S; Mon, 09 Jan 2023 16:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473822.734622; Mon, 09 Jan 2023 16:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEufz-0002Hj-V5; Mon, 09 Jan 2023 16:07:07 +0000
Received: by outflank-mailman (input) for mailman id 473822;
 Mon, 09 Jan 2023 16:07:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pEufz-0002Hd-Cm
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 16:07:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEufy-0002B3-RV; Mon, 09 Jan 2023 16:07:06 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.1.158]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEufy-0000ri-L0; Mon, 09 Jan 2023 16:07:06 +0000
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
	bh=h+ucAGSqSnprEn74b8uqbOL5dKAdNpX+IN8afJ1FO9c=; b=rQYsFLllnDmUOWkyS6M08PcLTT
	KiUlNT4fZvPc99ntVY93Siwn7yVKf4BaiLHhEUn5YxYM90N95lDOL8oRlNgPIbjq0hy9Qpqj3NEpM
	6nDXSs+Oq4CBxj/Mmzo0d8Wb2YvhPLTzaBzUCG8dh4uBpVJOlsyTZ8nbvptyJ2QObKA4=;
Message-ID: <215518b9-7ced-26bb-b64d-5cbae11342bd@xen.org>
Date: Mon, 9 Jan 2023 16:07:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/8] xen/riscv: introduce early_printk basic stuff
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bobby Eshleman <bobby.eshleman@gmail.com>
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
 <527727b2c9e26e6ef7714fe9a3fbe580caf1ae13.1673278109.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <527727b2c9e26e6ef7714fe9a3fbe580caf1ae13.1673278109.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/01/2023 15:46, Oleksii Kurochko wrote:
> The patch introduces a basic stuff of early_printk functionality
> which will be enough to print 'hello from C environment".
> early_printk() function was changed in comparison with original as
> common isn't being built now so there is no vscnprintf.
> 
> Because printk() relies on a serial driver (like the ns16550 driver)
> and drivers require working virtual memory (ioremap()) there is not
> print functionality early in Xen boot.
> 
> This commit adds early printk implementation built on the putc SBI call.
> 
> As sbi_console_putchar() is being already planned for deprecation
> it is used temporary now and will be removed or reworked after
> real uart will be ready.
> 
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>

 From the previous discussion, I was under the impression you agreed 
that the code was mainly written by Bobby. And indeed you put him as the 
first signed-off.

So you want to also add a From tag right at the top of the patch so when 
we commit it, the author tag will be Bobby.

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>      - add license to early_printk.c
>      - add signed-off-by Bobby
>      - add RISCV_32 to Kconfig.debug to EARLY_PRINTK config
>      - update commit message
>      - order the files alphabetically in Makefile
> ---
>   xen/arch/riscv/Kconfig.debug              |  7 +++++
>   xen/arch/riscv/Makefile                   |  1 +
>   xen/arch/riscv/early_printk.c             | 33 +++++++++++++++++++++++
>   xen/arch/riscv/include/asm/early_printk.h | 12 +++++++++
>   4 files changed, 53 insertions(+)
>   create mode 100644 xen/arch/riscv/early_printk.c
>   create mode 100644 xen/arch/riscv/include/asm/early_printk.h
> 
> diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.debug
> index e69de29bb2..6ba0bd1e5a 100644
> --- a/xen/arch/riscv/Kconfig.debug
> +++ b/xen/arch/riscv/Kconfig.debug
> @@ -0,0 +1,7 @@
> +config EARLY_PRINTK
> +    bool "Enable early printk config"
> +    default DEBUG
> +    depends on RISCV_64 || RISCV_32
> +    help
> +
> +      Enables early printk debug messages
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index fd916e1004..1a4f1a6015 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,3 +1,4 @@
> +obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>   obj-$(CONFIG_RISCV_64) += riscv64/
>   obj-y += sbi.o
>   obj-y += setup.o
> diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
> new file mode 100644
> index 0000000000..88da5169ed
> --- /dev/null
> +++ b/xen/arch/riscv/early_printk.c
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * RISC-V early printk using SBI
> + *
> + * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
> + */
> +#include <asm/sbi.h>
> +#include <asm/early_printk.h>
> +
> +/*
> + * TODO:
> + *   sbi_console_putchar is already planned for deprication

s/deprication/deprecation/

> + *   so it should be reworked to use UART directly.
> +*/
> +void early_puts(const char *s, size_t nr)
> +{
> +    while ( nr-- > 0 )
> +    {
> +        if (*s == '\n')
> +            sbi_console_putchar('\r');
> +        sbi_console_putchar(*s);
> +        s++;
> +    }
> +}
> +
> +void early_printk(const char *str)
> +{
> +    while (*str)
> +    {
> +        early_puts(str, 1);
> +        str++;
> +    }
> +}
> diff --git a/xen/arch/riscv/include/asm/early_printk.h b/xen/arch/riscv/include/asm/early_printk.h
> new file mode 100644
> index 0000000000..05106e160d
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/early_printk.h
> @@ -0,0 +1,12 @@
> +#ifndef __EARLY_PRINTK_H__
> +#define __EARLY_PRINTK_H__
> +
> +#include <xen/early_printk.h>
> +
> +#ifdef CONFIG_EARLY_PRINTK
> +void early_printk(const char *str);
> +#else
> +static inline void early_printk(const char *s) {};
> +#endif
> +
> +#endif /* __EARLY_PRINTK_H__ */

Cheers,

-- 
Julien Grall

