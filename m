Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00473664EBE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 23:26:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474995.736475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFN4c-0000As-FM; Tue, 10 Jan 2023 22:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474995.736475; Tue, 10 Jan 2023 22:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFN4c-00008k-C1; Tue, 10 Jan 2023 22:26:26 +0000
Received: by outflank-mailman (input) for mailman id 474995;
 Tue, 10 Jan 2023 22:26:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Esb2=5H=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pFN4b-00008e-5E
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 22:26:25 +0000
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [2607:f8b0:4864:20::e31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf660be4-9135-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 23:26:22 +0100 (CET)
Received: by mail-vs1-xe31.google.com with SMTP id t10so3275214vsr.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 14:26:22 -0800 (PST)
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
X-Inumbo-ID: cf660be4-9135-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IZhsa1BRRn0LWm2+qyDZA4kp5ryKIQ0bdpgv4P9ZnTE=;
        b=EbqBD4NEjXR7PbLaQ/7HfFBIicc1rO3MgjB5n1JfOsHIpY4+gURtFwcS/efzu6VnK8
         iWpEGAjKqM5TgHLahDGE8XAMe/E/WUbLyYPvzw9mq8XLHAwGbZo/rxWnSpEnC+bz3yxZ
         WQP4btPlXNpgQYLp1TD+syyCVtEgb66e71mdV4gn5e0GFqrU9aSDYFReL1DbCyIy65Ey
         tOe9Gk10VcffKCB/NaMwK+QdN0V7dCw9c4AOU2cItfhhI4E0PD/OIHx1Z8nOtp4rD3Ax
         Nqdlx10zGcKrJHtSzDMsQlwKgVotoB57ycFGCb5lQPsZ2g8vOiZ8KdKTDLM/XXTG/Yw1
         K8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZhsa1BRRn0LWm2+qyDZA4kp5ryKIQ0bdpgv4P9ZnTE=;
        b=PritcKdxWGpjaNjzIqAALEvVW+cFsnaoASfolJ83ahOe9W0swtZC977L/mhK9tWwTj
         jtw61OKxA9MCbWp9H0AX3oSym3idDkuSOquzqJKNJY1nlysIxHb022xp7aWWJxeG2akt
         fok0nBLOKEZ6G/80mPOzFxLkiC2Cmw2YOT7pZ6hvzpBhH19dX5RoAAyT87n/moZf7A/9
         F9W1Sz+QFg0bTOmfiSUAZNCLo0S+tT9lVCVPHfoFAYU2/vGYF3yajjazgqbiEiqf7Dt0
         v764Iml8J+pqeAU9FzgXxWg63AnPb8VSjUmqIwHl3PjZwFMScerLHXT1CpdZsZeVzrLB
         Hnnw==
X-Gm-Message-State: AFqh2kpxBEBnWto3hRMCF+5dIPWi8grh04ZxOAbjE1onNXAGpYx2MTpr
	aJ9EjgYG4hBsjHBV/nol+GeBoIQHzgFX21dAwaw=
X-Google-Smtp-Source: AMrXdXuWycCwf1rXJCknXxR3cUfEDUJV/lBBOmFmcQSlQ7u1K27uah59lY7T3vkBmtS4/+SMfJNopgy5YwuwOMBL0uc=
X-Received: by 2002:a67:6582:0:b0:3d0:d7ce:b383 with SMTP id
 z124-20020a676582000000b003d0d7ceb383mr119944vsb.72.1673389581218; Tue, 10
 Jan 2023 14:26:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673362493.git.oleksii.kurochko@gmail.com> <7d89e3811e6ea4f307862d6552ad7c7e58176518.1673362493.git.oleksii.kurochko@gmail.com>
In-Reply-To: <7d89e3811e6ea4f307862d6552ad7c7e58176518.1673362493.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Jan 2023 08:25:55 +1000
Message-ID: <CAKmqyKOe7Si2k6+ewZn3O6pb3TM7DQxxQZnedSL2Z3AZm2ox_w@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] xen/riscv: introduce stack stuff
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 11, 2023 at 1:18 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> The patch introduces and sets up a stack in order to go to C environment
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
>  xen/arch/riscv/Makefile             |  1 +
>  xen/arch/riscv/include/asm/config.h |  2 ++
>  xen/arch/riscv/riscv64/head.S       |  6 +++++-
>  xen/arch/riscv/setup.c              | 14 ++++++++++++++
>  4 files changed, 22 insertions(+), 1 deletion(-)
>  create mode 100644 xen/arch/riscv/setup.c
>
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 248f2cbb3e..5a67a3f493 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,4 +1,5 @@
>  obj-$(CONFIG_RISCV_64) += riscv64/
> +obj-y += setup.o
>
>  $(TARGET): $(TARGET)-syms
>         $(OBJCOPY) -O binary -S $< $@
> diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
> index 0370f865f3..763a922a04 100644
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -43,6 +43,8 @@
>
>  #define SMP_CACHE_BYTES (1 << 6)
>
> +#define STACK_SIZE PAGE_SIZE
> +
>  #endif /* __RISCV_CONFIG_H__ */
>  /*
>   * Local variables:
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index 990edb70a0..d444dd8aad 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -1,4 +1,8 @@
>          .section .text.header, "ax", %progbits
>
>  ENTRY(start)
> -        j  start
> +        la      sp, cpu0_boot_stack
> +        li      t0, STACK_SIZE
> +        add     sp, sp, t0
> +
> +        tail    start_xen
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> new file mode 100644
> index 0000000000..13e24e2fe1
> --- /dev/null
> +++ b/xen/arch/riscv/setup.c
> @@ -0,0 +1,14 @@
> +#include <xen/compile.h>
> +#include <xen/init.h>
> +
> +/* Xen stack for bringing up the first CPU. */
> +unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
> +    __aligned(STACK_SIZE);
> +
> +void __init noreturn start_xen(void)
> +{
> +    for ( ;; )
> +        asm volatile ("wfi");
> +
> +    unreachable();
> +}
> --
> 2.38.1
>
>

