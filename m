Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF1868FCAB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 02:38:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492106.761524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPvt0-0003Uw-Ks; Thu, 09 Feb 2023 01:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492106.761524; Thu, 09 Feb 2023 01:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPvt0-0003Rr-Ef; Thu, 09 Feb 2023 01:38:06 +0000
Received: by outflank-mailman (input) for mailman id 492106;
 Thu, 09 Feb 2023 01:38:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UnIs=6F=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pPvsz-0003RV-2l
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 01:38:05 +0000
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [2607:f8b0:4864:20::e2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63a71ec5-a81a-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 02:38:02 +0100 (CET)
Received: by mail-vs1-xe2d.google.com with SMTP id h19so557983vsv.13
 for <xen-devel@lists.xenproject.org>; Wed, 08 Feb 2023 17:38:01 -0800 (PST)
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
X-Inumbo-ID: 63a71ec5-a81a-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I9/AsQ+9YDYkdE8thYzzfDAwKmpmIOg22nzWOAJZgrM=;
        b=RyHqpU/SqBXhNGRXpDIrN3TR2jxXvSI42Wu52zbsd531RW5DNhxaIg2NQ324rWPYd7
         M7VFWbPiSK+a+MEQhf8USM/tG+6TbGhk+ifSBHWOyZ5etfcSVxOK2NDzLqblUu8OBUEK
         AUU4mebJYn1gfL4RSbMVuGaU84kmK9wIZ4fNJFpJiI4ZRPHFBm8xIda3DV6KdRFGzB6G
         qDyIJjVIXel9U8iX18wIGausBXQBabc8D/FmSp674MmYpWOdM4A24dPExNzHjKgoQgRx
         eMs9wSAvZ6mxszJ5Y7Jr0Hm2VMawROAvA3KwRa85dSKZNP0jc6YsHspWE4LrlCJ1Aqe5
         kKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I9/AsQ+9YDYkdE8thYzzfDAwKmpmIOg22nzWOAJZgrM=;
        b=m+uU4FxWJwi3Lmhhdhambl9jb9qNje4odqsvbEgf4uatEFyBzypYgO0KV/EpoDtg5l
         dT44PkNYfqUyIoDpFS9laZT/V6KjfsSiCdSTscG4uYLDLEoFc7iT1GvqkwPtKmLg10ZB
         Z+7yOeGivg/CCciD0wuLQSyy2EO1TA1DJXf4udsy4n0pZKbl/iv65y+XnfmXlrKGdR+w
         RlQsPL9Gv7AO0eWP2SCWFXHUG9nTVXwPTcmvjZiDThLCRvnY3v1sBMDLO/gCfJtUbtYu
         gzJ9McUSi3gEZV5MC9KESIbsut9FQv1CpM/JfxmCUnYef4YekNEoq0Rckuaacp5KPny4
         Z4KQ==
X-Gm-Message-State: AO0yUKWXPGrqTLU5V466NFwNp4mSpGIrDIs8GXwbcb1bjuc+tuhL44w7
	26VOhDB9uVN4m2MV3FSx23FVMyp9PPXQklQ9+R8=
X-Google-Smtp-Source: AK7set/EHva/vRwELT9Xgnjv40fRt+QLy8whfy2Y8IqrG5SNVzM0PhV+KHkoE06Fp5R/68R8sgBFxd2IPSQUSfeHbwY=
X-Received: by 2002:a67:a407:0:b0:3f0:89e1:7c80 with SMTP id
 n7-20020a67a407000000b003f089e17c80mr1967804vse.72.1675906680793; Wed, 08 Feb
 2023 17:38:00 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675773832.git.oleksii.kurochko@gmail.com> <15e29bb67e9dc0a24811c02c8ef6965523dac27e.1675773832.git.oleksii.kurochko@gmail.com>
In-Reply-To: <15e29bb67e9dc0a24811c02c8ef6965523dac27e.1675773832.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Feb 2023 11:37:34 +1000
Message-ID: <CAKmqyKML5g6TLmvatcSJzLLr1j-DCL19VY=KMKyYq=NJvTM1Ug@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] xen/riscv: introduce early_printk basic stuff
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 7, 2023 at 10:49 PM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
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
> Reviewed-by: Bobby Eshleman <bobby.eshleman@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V10:
>  - Miss to add the check in V9 so add it in V10
> ---
> Changes in V9:
>     - Bring "cmodel=medany" check back to be sure that C function is safe to be
>       called in early boot when MMU is off ( e.g. VA != PA )
> ---
> Changes in V8:
>     - Nothing was changed
> ---
> Changes in V7:
>     - Nothing was changed
> ---
> Changes in V6:
>     - Remove __riscv_cmodel_medany check from early_printk.c
> ---
> Changes in V5:
>     - Code style fixes
>     - Change an error message of #error in case of __riscv_cmodel_medany
>       isn't defined
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
>  xen/arch/riscv/Kconfig.debug              |  5 +++
>  xen/arch/riscv/Makefile                   |  1 +
>  xen/arch/riscv/early_printk.c             | 44 +++++++++++++++++++++++
>  xen/arch/riscv/include/asm/early_printk.h | 12 +++++++
>  xen/arch/riscv/setup.c                    |  4 +++
>  5 files changed, 66 insertions(+)
>  create mode 100644 xen/arch/riscv/early_printk.c
>  create mode 100644 xen/arch/riscv/include/asm/early_printk.h
>
> diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.debug
> index e69de29bb2..608c9ff832 100644
> --- a/xen/arch/riscv/Kconfig.debug
> +++ b/xen/arch/riscv/Kconfig.debug
> @@ -0,0 +1,5 @@
> +config EARLY_PRINTK
> +    bool "Enable early printk"
> +    default DEBUG
> +    help
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
> index 0000000000..dfe4ad77e2
> --- /dev/null
> +++ b/xen/arch/riscv/early_printk.c
> @@ -0,0 +1,44 @@
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
> + * When the MMU is off during early boot, any C function called has to
> + * use PC-relative rather than absolute address because the physical address
> + * may not match the virtual address.
> + *
> + * To guarantee PC-relative address cmodel=medany should be used
> + */
> +#ifndef __riscv_cmodel_medany
> +#error "early_*() can be called from head.S with MMU-off"
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
> index 13e24e2fe1..d09ffe1454 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -1,12 +1,16 @@
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
> +    early_printk("Hello from C env\n");
> +
>      for ( ;; )
>          asm volatile ("wfi");
>
> --
> 2.39.0
>
>

