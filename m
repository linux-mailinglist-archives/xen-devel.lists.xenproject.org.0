Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E94691658
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 02:47:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493036.762845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQIUs-0000GI-Rg; Fri, 10 Feb 2023 01:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493036.762845; Fri, 10 Feb 2023 01:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQIUs-0000Du-Oi; Fri, 10 Feb 2023 01:46:42 +0000
Received: by outflank-mailman (input) for mailman id 493036;
 Fri, 10 Feb 2023 01:46:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uYSr=6G=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pQIUr-0000Do-EX
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 01:46:41 +0000
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [2607:f8b0:4864:20::931])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2397c41-a8e4-11ed-93b5-47a8fe42b414;
 Fri, 10 Feb 2023 02:46:39 +0100 (CET)
Received: by mail-ua1-x931.google.com with SMTP id b11so715857uae.4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 17:46:38 -0800 (PST)
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
X-Inumbo-ID: c2397c41-a8e4-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3bZyRdx/tBTOfbHOAIRS378NmZr2nfsGuMCm41Sv5BI=;
        b=MVkkD1Zsrzamw4LcETsWm9FVOP9uuLOArbbbu7NRt1CwD0RAtjh1WpGRh6O/yMkmJ8
         skcOkRdaKHJRvM0M08EIewFi0ezUaB8z9JkNwTFaqAiaNFuBlRcvAbF0QYr+MC0m1NQL
         UVhEO47lv+AiS3efWxNGFkWd+Bf78Xg6Ye0pvDLpvRGDlheCReQzEQOANd+R79OZyG1b
         8hK6fK21aVkwEuqXL6HTh/n9yyE/wPKDU8jzKk+ssxISKoqGOo8kgtAqSWXY4c3K96fY
         p0388soavvfAZ0PEwxM33hB0mRHtgwVbxqO6Sce6swreDy5OPoyULInWMqEwFkLWMRND
         9P4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3bZyRdx/tBTOfbHOAIRS378NmZr2nfsGuMCm41Sv5BI=;
        b=gleK8AKp0o267JlImQPG4fEhqwBpbnR6BVfOFSClnKOY5HQp0Xn72cm6++H8wGMu1S
         +1Hpc6MUw0ML96rs22bDCtjLpIWKNaG1o+hopeex3/beusVMHr6DHqB4x9BMGt7dS+o/
         DhrI/uAiX1/M9jBOGKxQq8UcEJW2Ll6SA7zQJIxUvwuyEQ9A0S0pRZD5Xs8Sm5d/TE2F
         kJf/Z9OhGERGw0HJLFOzRKaY0xY37pMaomCVAXYuWyAmq/Q56prhDbvnf5Zcc/DUT687
         VMv62YIxyNBZHHnqReSdFMlCQJT1Os5+HZ8WG/ni5jcfyzeqCkB5i+IZzAiLk8ycQxUP
         IYxw==
X-Gm-Message-State: AO0yUKXUVgqmamk3NuoMQoHRThR0X79OdGMmZTRfKvI4LVr0IGHQUCHr
	CoTaTOGklfmspdGZ0kqnanMQXGh6eS+T3c79Q1M=
X-Google-Smtp-Source: AK7set85KH7pDDzlzhcJ3ZCDfwaSAOhStZj+BYybrRQG22yB+8hChhJj15YdM4JkNE6QXX6IqN1e1VDNmWepu5K4WXY=
X-Received: by 2002:ab0:3b90:0:b0:683:c74a:af60 with SMTP id
 p16-20020ab03b90000000b00683c74aaf60mr2744470uaw.74.1675993597834; Thu, 09
 Feb 2023 17:46:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675779308.git.oleksii.kurochko@gmail.com> <c614e69342eea7a5ce27f7a0e550ab3147afa592.1675779308.git.oleksii.kurochko@gmail.com>
In-Reply-To: <c614e69342eea7a5ce27f7a0e550ab3147afa592.1675779308.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Feb 2023 11:46:03 +1000
Message-ID: <CAKmqyKP44=9Var_NiNi9RJuckFuR6ePR-r9wM__WQLv-=AeLaQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] xen/riscv: introduce exception handlers implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 8, 2023 at 12:47 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> The patch introduces an implementation of basic exception handlers:
> - to save/restore context
> - to handle an exception itself. The handler calls wait_for_interrupt
>   now, nothing more.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V3:
>   - Nothing changed
> ---
> Changes in V2:
>   - Refactor entry.S to start using of defines introduced in asm_offsets.C
>   - Rename {__,}handle_exception to handle_trap() and do_trap() to be more
>     consistent with RISC-V spec.
>   - Wrap handle_trap() to ENTRY().
> ---
>  xen/arch/riscv/Makefile            |  2 +
>  xen/arch/riscv/entry.S             | 94 ++++++++++++++++++++++++++++++
>  xen/arch/riscv/include/asm/traps.h | 13 +++++
>  xen/arch/riscv/traps.c             | 13 +++++
>  4 files changed, 122 insertions(+)
>  create mode 100644 xen/arch/riscv/entry.S
>  create mode 100644 xen/arch/riscv/include/asm/traps.h
>  create mode 100644 xen/arch/riscv/traps.c
>
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 1a4f1a6015..443f6bf15f 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,7 +1,9 @@
>  obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
> +obj-y += entry.o
>  obj-$(CONFIG_RISCV_64) += riscv64/
>  obj-y += sbi.o
>  obj-y += setup.o
> +obj-y += traps.o
>
>  $(TARGET): $(TARGET)-syms
>         $(OBJCOPY) -O binary -S $< $@
> diff --git a/xen/arch/riscv/entry.S b/xen/arch/riscv/entry.S
> new file mode 100644
> index 0000000000..0be543f8e0
> --- /dev/null
> +++ b/xen/arch/riscv/entry.S
> @@ -0,0 +1,94 @@
> +#include <asm/asm.h>
> +#include <asm/asm-offsets.h>
> +#include <asm/processor.h>
> +#include <asm/riscv_encoding.h>
> +#include <asm/traps.h>
> +
> +/* WIP: only works while interrupting Xen context */
> +ENTRY(handle_trap)
> +
> +    /* Exceptions from xen */
> +save_to_stack:
> +        /* Save context to stack */
> +        REG_S   sp, (CPU_USER_REGS_SP - CPU_USER_REGS_SIZE) (sp)
> +        addi    sp, sp, -CPU_USER_REGS_SIZE
> +        REG_S   t0, CPU_USER_REGS_T0(sp)
> +
> +        /* Save registers */
> +        REG_S   ra, CPU_USER_REGS_RA(sp)
> +        REG_S   gp, CPU_USER_REGS_GP(sp)
> +        REG_S   t1, CPU_USER_REGS_T1(sp)
> +        REG_S   t2, CPU_USER_REGS_T2(sp)
> +        REG_S   s0, CPU_USER_REGS_S0(sp)
> +        REG_S   s1, CPU_USER_REGS_S1(sp)
> +        REG_S   a0, CPU_USER_REGS_A0(sp)
> +        REG_S   a1, CPU_USER_REGS_A1(sp)
> +        REG_S   a2, CPU_USER_REGS_A2(sp)
> +        REG_S   a3, CPU_USER_REGS_A3(sp)
> +        REG_S   a4, CPU_USER_REGS_A4(sp)
> +        REG_S   a5, CPU_USER_REGS_A5(sp)
> +        REG_S   a6, CPU_USER_REGS_A6(sp)
> +        REG_S   a7, CPU_USER_REGS_A7(sp)
> +        REG_S   s2, CPU_USER_REGS_S2(sp)
> +        REG_S   s3, CPU_USER_REGS_S3(sp)
> +        REG_S   s4, CPU_USER_REGS_S4(sp)
> +        REG_S   s5, CPU_USER_REGS_S5(sp)
> +        REG_S   s6, CPU_USER_REGS_S6(sp)
> +        REG_S   s7, CPU_USER_REGS_S7(sp)
> +        REG_S   s8, CPU_USER_REGS_S8(sp)
> +        REG_S   s9, CPU_USER_REGS_S9(sp)
> +        REG_S   s10,CPU_USER_REGS_S10(sp)
> +        REG_S   s11,CPU_USER_REGS_S11(sp)
> +        REG_S   t3, CPU_USER_REGS_T3(sp)
> +        REG_S   t4, CPU_USER_REGS_T4(sp)
> +        REG_S   t5, CPU_USER_REGS_T5(sp)
> +        REG_S   t6, CPU_USER_REGS_T6(sp)
> +        csrr    t0, CSR_SEPC
> +        REG_S   t0, CPU_USER_REGS_SEPC(sp)
> +        csrr    t0, CSR_SSTATUS
> +        REG_S   t0, CPU_USER_REGS_SSTATUS(sp)
> +
> +        mv      a0, sp
> +        jal     do_trap
> +
> +restore_registers:
> +        /* Restore stack_cpu_regs */
> +        REG_L   t0, CPU_USER_REGS_SEPC(sp)
> +        csrw    CSR_SEPC, t0
> +        REG_L   t0, CPU_USER_REGS_SSTATUS(sp)
> +        csrw    CSR_SSTATUS, t0
> +
> +        REG_L   ra, CPU_USER_REGS_RA(sp)
> +        REG_L   gp, CPU_USER_REGS_GP(sp)
> +        REG_L   t0, CPU_USER_REGS_T0(sp)
> +        REG_L   t1, CPU_USER_REGS_T1(sp)
> +        REG_L   t2, CPU_USER_REGS_T2(sp)
> +        REG_L   s0, CPU_USER_REGS_S0(sp)
> +        REG_L   s1, CPU_USER_REGS_S1(sp)
> +        REG_L   a0, CPU_USER_REGS_A0(sp)
> +        REG_L   a1, CPU_USER_REGS_A1(sp)
> +        REG_L   a2, CPU_USER_REGS_A2(sp)
> +        REG_L   a3, CPU_USER_REGS_A3(sp)
> +        REG_L   a4, CPU_USER_REGS_A4(sp)
> +        REG_L   a5, CPU_USER_REGS_A5(sp)
> +        REG_L   a6, CPU_USER_REGS_A6(sp)
> +        REG_L   a7, CPU_USER_REGS_A7(sp)
> +        REG_L   s2, CPU_USER_REGS_S2(sp)
> +        REG_L   s3, CPU_USER_REGS_S3(sp)
> +        REG_L   s4, CPU_USER_REGS_S4(sp)
> +        REG_L   s5, CPU_USER_REGS_S5(sp)
> +        REG_L   s6, CPU_USER_REGS_S6(sp)
> +        REG_L   s7, CPU_USER_REGS_S7(sp)
> +        REG_L   s8, CPU_USER_REGS_S8(sp)
> +        REG_L   s9, CPU_USER_REGS_S9(sp)
> +        REG_L   s10, CPU_USER_REGS_S10(sp)
> +        REG_L   s11, CPU_USER_REGS_S11(sp)
> +        REG_L   t3, CPU_USER_REGS_T3(sp)
> +        REG_L   t4, CPU_USER_REGS_T4(sp)
> +        REG_L   t5, CPU_USER_REGS_T5(sp)
> +        REG_L   t6, CPU_USER_REGS_T6(sp)
> +
> +        /* Restore sp */
> +        REG_L   sp, CPU_USER_REGS_SP(sp)
> +
> +        sret
> diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
> new file mode 100644
> index 0000000000..f3fb6b25d1
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/traps.h
> @@ -0,0 +1,13 @@
> +#ifndef __ASM_TRAPS_H__
> +#define __ASM_TRAPS_H__
> +
> +#include <asm/processor.h>
> +
> +#ifndef __ASSEMBLY__
> +
> +void do_trap(struct cpu_user_regs *cpu_regs);
> +void handle_trap(void);
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* __ASM_TRAPS_H__ */
> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> new file mode 100644
> index 0000000000..ccd3593f5a
> --- /dev/null
> +++ b/xen/arch/riscv/traps.c
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2023 Vates
> + *
> + * RISC-V Trap handlers
> + */
> +#include <asm/processor.h>
> +#include <asm/traps.h>
> +
> +void do_trap(struct cpu_user_regs *cpu_regs)
> +{
> +    die();
> +}
> --
> 2.39.0
>
>

