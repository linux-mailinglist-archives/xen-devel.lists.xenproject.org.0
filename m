Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EB7663635
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 01:29:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474175.735174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF2Vh-0006pT-Vv; Tue, 10 Jan 2023 00:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474175.735174; Tue, 10 Jan 2023 00:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF2Vh-0006ma-SF; Tue, 10 Jan 2023 00:29:01 +0000
Received: by outflank-mailman (input) for mailman id 474175;
 Tue, 10 Jan 2023 00:29:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Esb2=5H=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pF2Vg-0006mU-N4
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 00:29:00 +0000
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [2607:f8b0:4864:20::a36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c577b713-907d-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 01:28:58 +0100 (CET)
Received: by mail-vk1-xa36.google.com with SMTP id w72so4849940vkw.7
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 16:28:58 -0800 (PST)
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
X-Inumbo-ID: c577b713-907d-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SGOLN4L23AISJAYP2mb4TczTko7Qm/ptrKoRepXprRE=;
        b=AFBsG7uWOPQh5GjM8gNJxVCD0aL0hoKK7sbEQNiV7AMIVKrIb+GH2YSHRUE3Ko7rI1
         BcwtSwJN25Alg3nNY79MxqKw+afcTxSoGdRNPti3JSg4vQCnd6V7NDLX83RPpAtuc3fb
         Bv4Y6RnczOdeQeRrlKuIt8/k5uL2AMD5To8pniZRKY1X8NiXXrLw1up/231qX1YiZKp3
         pZLK6UKnXti9gjAfqtKo/AdkXmT7+I+Uhz9yIoId1s5lXB/HXbcUpYOwBb5dV6MTKDgN
         BLu1lSIOiKcD4EoGDinM4fxGSC3pu7jDCmq2sfHPH6ZuuNoYywYvwhonFEaHHQDQVpl+
         mRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGOLN4L23AISJAYP2mb4TczTko7Qm/ptrKoRepXprRE=;
        b=LgQwlYyJCaVvbsADAKT8mUglij9JMEHWeNI7/14D3ykbYCseOaR1UUImTbDTasnx3u
         lCjgGYJw4P5fWC/zOLYKavMgxijSK+Cb4ZwZ/IOrH5csd9mEQSQ8Rc1uq5GOKDCFTLWF
         EfY2Dtyb/3T5lXIE2NQEr9lRz0YLC2T812EyMAIudfMoiv7IoxLIUpw+quxaqB0omRQN
         wN7iHcShqdnMDOagDMV9ykI1IDHvp/xjWHdZXL90My16fsbkS8h4NsgR66Y2gJOBk2L5
         GH+QswqCe7Ps7kKsMPPZafoC+on/r2Gih1jYidDqeiws9JOyzlovNtlseaM1QhkqYNqF
         rBfQ==
X-Gm-Message-State: AFqh2kquc5xfDXcAOFJJbWCOfhh+v6exbAArtnpijEa3MIoKfTvF0FIB
	tMbbAc+0E18XL5nM+ctFRbskXVLeRdEDxydra5Q=
X-Google-Smtp-Source: AMrXdXvJTtjn/avlGGgsNUpAucdZpkVW+3PjRmuldxgTr47AVrU/8YnXmDCRnhJy3ttHhZDle2IAxOnSVBWIbE4+qXI=
X-Received: by 2002:a1f:c703:0:b0:3d5:6ccb:8748 with SMTP id
 x3-20020a1fc703000000b003d56ccb8748mr6418658vkf.26.1673310537196; Mon, 09 Jan
 2023 16:28:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673278109.git.oleksii.kurochko@gmail.com> <527727b2c9e26e6ef7714fe9a3fbe580caf1ae13.1673278109.git.oleksii.kurochko@gmail.com>
In-Reply-To: <527727b2c9e26e6ef7714fe9a3fbe580caf1ae13.1673278109.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 Jan 2023 10:28:31 +1000
Message-ID: <CAKmqyKNyRfAhyP-3uZwEf3OZEv5be4KNdGvNjUiQGu8w-vf_8g@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] xen/riscv: introduce early_printk basic stuff
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 10, 2023 at 1:47 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
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

There was a discussion to add a new SBI putchar replacement. It
doesn't seem to be completed yet, but there might be an SBI
replacement for this in the future as well.

Alistair

>
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>     - add license to early_printk.c
>     - add signed-off-by Bobby
>     - add RISCV_32 to Kconfig.debug to EARLY_PRINTK config
>     - update commit message
>     - order the files alphabetically in Makefile
> ---
>  xen/arch/riscv/Kconfig.debug              |  7 +++++
>  xen/arch/riscv/Makefile                   |  1 +
>  xen/arch/riscv/early_printk.c             | 33 +++++++++++++++++++++++
>  xen/arch/riscv/include/asm/early_printk.h | 12 +++++++++
>  4 files changed, 53 insertions(+)
>  create mode 100644 xen/arch/riscv/early_printk.c
>  create mode 100644 xen/arch/riscv/include/asm/early_printk.h
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
>  obj-$(CONFIG_RISCV_64) += riscv64/
>  obj-y += sbi.o
>  obj-y += setup.o
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
> --
> 2.38.1
>
>

