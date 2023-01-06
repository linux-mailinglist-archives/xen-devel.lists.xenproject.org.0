Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2729A66018D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 14:52:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472626.732915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDn8D-0005D2-UT; Fri, 06 Jan 2023 13:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472626.732915; Fri, 06 Jan 2023 13:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDn8D-0005A6-Rr; Fri, 06 Jan 2023 13:51:37 +0000
Received: by outflank-mailman (input) for mailman id 472626;
 Fri, 06 Jan 2023 13:51:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pDn8C-0005A0-6A
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 13:51:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDn8B-0008PF-Kh; Fri, 06 Jan 2023 13:51:35 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.4.240]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDn8B-0001aw-EQ; Fri, 06 Jan 2023 13:51:35 +0000
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
	bh=eO/UT7LLAV0/9FLExjojEvWVJufAtRmMpUZsDz++tBE=; b=dnOcL8rB7uXZp08K21CcfYvv5i
	VcfkGVeN2HlaJZEHzWc2qkPKJvkmheLakkq58reBQiULQSwlY68tbT5gfdN91XrWkPUWXQ1C+WeAk
	hFNF5D9IibUBZVhAPTqKaauuXKCjD94Z0/gsCxjYx3rMPp4UiLc6LVQnwl76JXKsDdn0=;
Message-ID: <e7e66208-5a4f-f37a-6368-29489e93aad9@xen.org>
Date: Fri, 6 Jan 2023 13:51:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v1 6/8] xen/riscv: introduce early_printk basic stuff
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
 <3f30a60729b45ee01adc2d4c0eec5a89bb083abd.1673009740.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3f30a60729b45ee01adc2d4c0eec5a89bb083abd.1673009740.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/01/2023 13:14, Oleksii Kurochko wrote:
> The patch introduces a basic stuff of early_printk functionality
> which will be enough to print 'hello from C environment"
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   xen/arch/riscv/Kconfig.debug              |  7 ++++++
>   xen/arch/riscv/Makefile                   |  1 +
>   xen/arch/riscv/early_printk.c             | 27 +++++++++++++++++++++++
>   xen/arch/riscv/include/asm/early_printk.h | 12 ++++++++++
>   4 files changed, 47 insertions(+)
>   create mode 100644 xen/arch/riscv/early_printk.c
>   create mode 100644 xen/arch/riscv/include/asm/early_printk.h
> 
> diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.debug
> index e69de29bb2..940630fd62 100644
> --- a/xen/arch/riscv/Kconfig.debug
> +++ b/xen/arch/riscv/Kconfig.debug
> @@ -0,0 +1,7 @@
> +config EARLY_PRINTK
> +    bool "Enable early printk config"
> +    default DEBUG
> +    depends on RISCV_64

OOI, why can't this be used for RISCV_32?

> +    help
> +
> +      Enables early printk debug messages
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 60db415654..e8630fe68d 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,6 +1,7 @@
>   obj-$(CONFIG_RISCV_64) += riscv64/
>   obj-y += setup.o
>   obj-y += sbi.o
> +obj-$(CONFIG_EARLY_PRINTK) += early_printk.o

Please order the files alphabetically.

>   
>   $(TARGET): $(TARGET)-syms
>   	$(OBJCOPY) -O binary -S $< $@
> diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
> new file mode 100644
> index 0000000000..f357f3220b
> --- /dev/null
> +++ b/xen/arch/riscv/early_printk.c
> @@ -0,0 +1,27 @@

Please add an SPDX license (the default for Xen is GPLv2).

> +/*
> + * RISC-V early printk using SBI
> + *
> + * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>

So the copyright here is from Bobby. But I don't see any mention in the 
commit message. Where is this coming from?

> + */
> +#include <asm/sbi.h>
> +#include <asm/early_printk.h>

Please order the files alphabetically.

> +
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

-- 
Julien Grall

