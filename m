Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7C9670D32
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 00:23:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479982.744109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHvI0-0007RO-A3; Tue, 17 Jan 2023 23:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479982.744109; Tue, 17 Jan 2023 23:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHvI0-0007OS-7L; Tue, 17 Jan 2023 23:22:48 +0000
Received: by outflank-mailman (input) for mailman id 479982;
 Tue, 17 Jan 2023 23:22:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Jq1=5O=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1pHvHy-0007OM-G3
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 23:22:46 +0000
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [2607:f8b0:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8815da9-96bd-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 00:22:45 +0100 (CET)
Received: by mail-pg1-x52d.google.com with SMTP id b12so23212925pgj.6
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jan 2023 15:22:45 -0800 (PST)
Received: from localhost (ec2-13-57-97-131.us-west-1.compute.amazonaws.com.
 [13.57.97.131]) by smtp.gmail.com with ESMTPSA id
 k18-20020a628412000000b0058103f45d9esm17455477pfd.82.2023.01.17.15.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 15:22:43 -0800 (PST)
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
X-Inumbo-ID: d8815da9-96bd-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0F1zjsrbkwMDQy5hmxNGfzYpEbvTLx9WXzW2it+3pjs=;
        b=Sr54KRLICgOdMM+rOhICQUcuwHzZUh7FNn8UWbOTj7OWUZzeQWQ1K4H95qgNqS8Q53
         YbCagtaxUF3b+xjqhO97vwXkbQzhQfy99eZMNwcqN7onZYaIJSW2Ct8uFj2tdkkYO+f9
         encFoy9WPhph185Z2CQxTbGQtFqDXFt3ia0XP+jhS/2XwyhOvL/VO8AECWck4nx/yy6V
         wgCEP0QiNsTWr9Qon/tINBl6Otkf2SgiKWXWbpCf44KirflE/dhm6ufSjANcVNROT7Lm
         paVI48lc7PF3ukay+jE4dpiYNa7rvbB6gjtH5sLhbvjFLBM89mSXsuzOnDli86FhbBbB
         oTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0F1zjsrbkwMDQy5hmxNGfzYpEbvTLx9WXzW2it+3pjs=;
        b=SxBVovyTKGmypqiinqzYfnvzXdmFSaMAd6nGPYEiNjkaa7i3kFzX+QKSBdxvp0N+cn
         1kq746NrOhYGrd44nK4ohb0BSsHIe6qOFxy4TFrZuqNT32ricBBry8dXXnmp+A9Qu7Nz
         zqC6mOj1523obGvwOwVGz2Ts2kgD5yZBeX+S5rtG8bFhiQc7JGqHKlYKxdaXkDeQ9q4m
         hx9xSdeSbLuoNAbVsslIJlgom0D+9Hi62FOX1QRUr/9+di07yJhbwW7nBb+5auooGNK2
         7Ls6N7+xp4SwvdrKKBu8MFdELLsZSqOitkiX0nds94NPw7TB44pkAzaWbFWcUJHwltUl
         LHpw==
X-Gm-Message-State: AFqh2kruCT7jU6yFZiVKRIsplFDM/Y1J9W7bKrN193sLLDxI5S0dQW05
	pddGvClBPIxEQZX/PLga/M8=
X-Google-Smtp-Source: AMrXdXtAn0NZ2o859uxwF3urLwXZW8nShedS33qwc8oum+wUKOnH8a+smKZ8VKe4QrMdX2TEVYx6og==
X-Received: by 2002:a62:1851:0:b0:581:95a7:d2f4 with SMTP id 78-20020a621851000000b0058195a7d2f4mr25008998pfy.9.1673997763702;
        Tue, 17 Jan 2023 15:22:43 -0800 (PST)
Date: Tue, 17 Jan 2023 23:22:42 +0000
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Bobby Eshleman <bobby.eshleman@gmail.com>
Subject: Re: [PATCH v4 3/4] xen/riscv: introduce early_printk basic stuff
Message-ID: <Y8ctwgHuXfmSXhqT@bullseye>
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
 <915bd184c6648a1a3bf0ac6a79b5274972bb33dd.1673877778.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <915bd184c6648a1a3bf0ac6a79b5274972bb33dd.1673877778.git.oleksii.kurochko@gmail.com>

On Mon, Jan 16, 2023 at 04:39:31PM +0200, Oleksii Kurochko wrote:
> Because printk() relies on a serial driver (like the ns16550 driver)
> and drivers require working virtual memory (ioremap()) there is not
> print functionality early in Xen boot.
> 
> The patch introduces the basic stuff of early_printk functionality
> which will be enough to print 'hello from C environment".
> 
> Originally early_printk.{c,h} was introduced by Bobby Eshleman
> (https://github.com/glg-rv/xen/commit/a3c9916bbdff7ad6030055bbee7e53d1aab71384)
> but some functionality was changed:
> early_printk() function was changed in comparison with the original as
> common isn't being built now so there is no vscnprintf.
> 
> This commit adds early printk implementation built on the putc SBI call.
> 
> As sbi_console_putchar() is already being planned for deprecation
> it is used temporarily now and will be removed or reworked after
> real uart will be ready.
> 
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V4:
>     - Remove "depends on RISCV*" from Kconfig.debug as it is located in
>       arch specific folder so by default RISCV configs should be ebabled.
>     - Add "ifdef __riscv_cmodel_medany" to be sure that PC-relative addressing
>       is used as early_*() functions can be called from head.S with MMU-off and
>       before relocation (if it would be needed at all for RISC-V)
>     - fix code style
> ---
> Changes in V3:
>     - reorder headers in alphabetical order
>     - merge changes related to start_xen() function from "[PATCH v2 7/8]
>       xen/riscv: print hello message from C env" to this patch
>     - remove unneeded parentheses in definition of STACK_SIZE
> ---
> Changes in V2:
>     - introduce STACK_SIZE define.
>     - use consistent padding between instruction mnemonic and operand(s)
> ---
> ---
>  xen/arch/riscv/Kconfig.debug              |  6 +++
>  xen/arch/riscv/Makefile                   |  1 +
>  xen/arch/riscv/early_printk.c             | 45 +++++++++++++++++++++++
>  xen/arch/riscv/include/asm/early_printk.h | 12 ++++++
>  xen/arch/riscv/setup.c                    |  6 ++-
>  5 files changed, 69 insertions(+), 1 deletion(-)
>  create mode 100644 xen/arch/riscv/early_printk.c
>  create mode 100644 xen/arch/riscv/include/asm/early_printk.h
> 
> diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.debug
> index e69de29bb2..e139e44873 100644
> --- a/xen/arch/riscv/Kconfig.debug
> +++ b/xen/arch/riscv/Kconfig.debug
> @@ -0,0 +1,6 @@
> +config EARLY_PRINTK
> +    bool "Enable early printk"
> +    default DEBUG
> +    help
> +
> +      Enables early printk debug messages
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index fd916e1004..1a4f1a6015 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,3 +1,4 @@
> +obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>  obj-$(CONFIG_RISCV_64) += riscv64/
>  obj-y += sbi.o
>  obj-y += setup.o
> diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
> new file mode 100644
> index 0000000000..6bc29a1942
> --- /dev/null
> +++ b/xen/arch/riscv/early_printk.c
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * RISC-V early printk using SBI
> + *
> + * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
> + */
> +#include <asm/early_printk.h>
> +#include <asm/sbi.h>
> +
> +/*
> + * early_*() can be called from head.S with MMU-off.
> + *
> + * The following requiremets should be honoured for early_*() to
> + * work correctly:
> + *    It should use PC-relative addressing for accessing symbols.
> + *    To achieve that GCC cmodel=medany should be used.
> + */
> +#ifndef __riscv_cmodel_medany
> +#error "early_*() can be called from head.S before relocate so it should not use absolute addressing."
> +#endif
> +
> +/*
> + * TODO:
> + *   sbi_console_putchar is already planned for deprecation
> + *   so it should be reworked to use UART directly.
> +*/
> +void early_puts(const char *s, size_t nr)
> +{
> +    while ( nr-- > 0 )
> +    {
> +        if ( *s == '\n' )
> +            sbi_console_putchar('\r');
> +        sbi_console_putchar(*s);
> +        s++;
> +    }
> +}
> +
> +void early_printk(const char *str)
> +{
> +    while ( *str )
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
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index 13e24e2fe1..9c9412152a 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -1,13 +1,17 @@
>  #include <xen/compile.h>
>  #include <xen/init.h>
>  
> +#include <asm/early_printk.h>
> +
>  /* Xen stack for bringing up the first CPU. */
>  unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
>      __aligned(STACK_SIZE);
>  
>  void __init noreturn start_xen(void)
>  {
> -    for ( ;; )
> +    early_printk("Hello from C env\n");
> +
> +    for ( ; ; )
>          asm volatile ("wfi");
>  
>      unreachable();
> -- 
> 2.39.0
> 

Reviewed-by: Bobby Eshleman <bobby.eshleman@gmail.com>

