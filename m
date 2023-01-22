Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20909677370
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 00:30:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482573.748148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJjmh-0000hy-FS; Sun, 22 Jan 2023 23:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482573.748148; Sun, 22 Jan 2023 23:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJjmh-0000fH-CG; Sun, 22 Jan 2023 23:29:59 +0000
Received: by outflank-mailman (input) for mailman id 482573;
 Sun, 22 Jan 2023 23:29:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zCZZ=5T=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pJjmf-0000fB-PF
 for xen-devel@lists.xenproject.org; Sun, 22 Jan 2023 23:29:57 +0000
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [2607:f8b0:4864:20::e2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac7bff8e-9aac-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 00:29:54 +0100 (CET)
Received: by mail-vs1-xe2f.google.com with SMTP id k4so11216601vsc.4
 for <xen-devel@lists.xenproject.org>; Sun, 22 Jan 2023 15:29:54 -0800 (PST)
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
X-Inumbo-ID: ac7bff8e-9aac-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w71S0QehHW2gga3KiZY/S419PRoHYWYtAzCcS4dk4Ng=;
        b=iPZgw/ibRdDrSlqm7xZS5yAAiQva0jflQkQoQEjUGNmFd8c6NK+TfCaP06Z7AeKcum
         ipohKO/s9qN/spjfFLX4Y9PYIwM+5KAzjZiCYwYzPDJ9AgDGzUIkNMBJzn7lQo4M2hBP
         ItQi/RC37meNHha/f+sy4yxWMKIYL4WjhwnfFPGNUMphtEIzRddlIJI6pGfjeRktqD3L
         t7v+8ePybZVcUS6asMcKhNwyAmrUDXb1SV7WX7Njc2cyWo8lR+WW35ZFsKK6DN5g7W14
         ZeOFzSYdtWf1+szFRMeRc2UtVv7DA4FY9jd6GF7+hKgSCQZeHnw+5bRpWQAG5pcqRtUu
         cjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w71S0QehHW2gga3KiZY/S419PRoHYWYtAzCcS4dk4Ng=;
        b=QQiwpB5HNLykeg/kJ3VWGFpM9iISPCwO1EC8n2C5G8uVVeKiuto+1O2fzGTsz2FjfA
         8qVsIAOEErV3POCoVoLbQwlZwGJdmp9P/jCAyN99FLc2QYEGhM+Gts9sIuT414Dulxow
         UkbZ7awmyOPV5iSkdcDB3TiIL2sDIxL5KYnKAhkkc0bI8YbMGJJKn5RSj/a/35udxV6P
         ULOhfCq2xJ2rqhY7vCRGhNiiYRzcT2EKPfdq1L34A2xuMonPynu1xqhAv2N7Gw/iQ5ub
         tw86ZOt4eDZTx2SXEdlCRHvB8B8TxyQv/Ak+PwsLvRgbfhgK7BopXTlZU68pLxA59bv3
         P7PQ==
X-Gm-Message-State: AFqh2krWlak1GmSUc4nTR1s7IlIoKbINegvcJj2b48MMtEe0I4LIRDjC
	duk+ffDESPZsgmu4UaKQsEWfAJtFPf5AMTUHHCg=
X-Google-Smtp-Source: AMrXdXsGNCU+1QNIV7WpkVekobYYL4wvYwJX0p9Z/e/TM1OsK+vGiiiJ6DyCehDaR8/KufBrqHyCPiPA0naG2zIcdpQ=
X-Received: by 2002:a05:6102:f98:b0:3d3:c7d9:7b62 with SMTP id
 e24-20020a0561020f9800b003d3c7d97b62mr2709540vsv.72.1674430193347; Sun, 22
 Jan 2023 15:29:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674226563.git.oleksii.kurochko@gmail.com> <7a459ea843d5823ee2c50b0e44dded5bdb554ca6.1674226563.git.oleksii.kurochko@gmail.com>
In-Reply-To: <7a459ea843d5823ee2c50b0e44dded5bdb554ca6.1674226563.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jan 2023 09:29:27 +1000
Message-ID: <CAKmqyKP7CXjWu9DzdtjGn_qX3et8eUtaYmMEPLtxPL8EE=vVEQ@mail.gmail.com>
Subject: Re: [PATCH v1 07/14] xen/riscv: introduce exception handlers implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 21, 2023 at 1:00 AM Oleksii Kurochko
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
>  xen/arch/riscv/Makefile            |  2 +
>  xen/arch/riscv/entry.S             | 97 ++++++++++++++++++++++++++++++
>  xen/arch/riscv/include/asm/traps.h | 13 ++++
>  xen/arch/riscv/traps.c             | 13 ++++
>  4 files changed, 125 insertions(+)
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
> index 0000000000..f7d46f42bb
> --- /dev/null
> +++ b/xen/arch/riscv/entry.S
> @@ -0,0 +1,97 @@
> +#include <asm/asm.h>
> +#include <asm/processor.h>
> +#include <asm/riscv_encoding.h>
> +#include <asm/traps.h>
> +
> +        .global handle_exception
> +        .align 4
> +
> +handle_exception:
> +
> +    /* Exceptions from xen */
> +save_to_stack:
> +        /* Save context to stack */
> +        REG_S   sp, (RISCV_CPU_USER_REGS_OFFSET(sp) - RISCV_CPU_USER_REGS_SIZE) (sp)
> +        addi    sp, sp, -RISCV_CPU_USER_REGS_SIZE
> +        REG_S   t0, RISCV_CPU_USER_REGS_OFFSET(t0)(sp)
> +        j       save_context
> +
> +save_context:
> +        /* Save registers */
> +        REG_S   ra, RISCV_CPU_USER_REGS_OFFSET(ra)(sp)
> +        REG_S   gp, RISCV_CPU_USER_REGS_OFFSET(gp)(sp)
> +        REG_S   t1, RISCV_CPU_USER_REGS_OFFSET(t1)(sp)
> +        REG_S   t2, RISCV_CPU_USER_REGS_OFFSET(t2)(sp)
> +        REG_S   s0, RISCV_CPU_USER_REGS_OFFSET(s0)(sp)
> +        REG_S   s1, RISCV_CPU_USER_REGS_OFFSET(s1)(sp)
> +        REG_S   a0, RISCV_CPU_USER_REGS_OFFSET(a0)(sp)
> +        REG_S   a1, RISCV_CPU_USER_REGS_OFFSET(a1)(sp)
> +        REG_S   a2, RISCV_CPU_USER_REGS_OFFSET(a2)(sp)
> +        REG_S   a3, RISCV_CPU_USER_REGS_OFFSET(a3)(sp)
> +        REG_S   a4, RISCV_CPU_USER_REGS_OFFSET(a4)(sp)
> +        REG_S   a5, RISCV_CPU_USER_REGS_OFFSET(a5)(sp)
> +        REG_S   a6, RISCV_CPU_USER_REGS_OFFSET(a6)(sp)
> +        REG_S   a7, RISCV_CPU_USER_REGS_OFFSET(a7)(sp)
> +        REG_S   s2, RISCV_CPU_USER_REGS_OFFSET(s2)(sp)
> +        REG_S   s3, RISCV_CPU_USER_REGS_OFFSET(s3)(sp)
> +        REG_S   s4, RISCV_CPU_USER_REGS_OFFSET(s4)(sp)
> +        REG_S   s5, RISCV_CPU_USER_REGS_OFFSET(s5)(sp)
> +        REG_S   s6, RISCV_CPU_USER_REGS_OFFSET(s6)(sp)
> +        REG_S   s7, RISCV_CPU_USER_REGS_OFFSET(s7)(sp)
> +        REG_S   s8, RISCV_CPU_USER_REGS_OFFSET(s8)(sp)
> +        REG_S   s9, RISCV_CPU_USER_REGS_OFFSET(s9)(sp)
> +        REG_S   s10, RISCV_CPU_USER_REGS_OFFSET(s10)(sp)
> +        REG_S   s11, RISCV_CPU_USER_REGS_OFFSET(s11)(sp)
> +        REG_S   t3, RISCV_CPU_USER_REGS_OFFSET(t3)(sp)
> +        REG_S   t4, RISCV_CPU_USER_REGS_OFFSET(t4)(sp)
> +        REG_S   t5, RISCV_CPU_USER_REGS_OFFSET(t5)(sp)
> +        REG_S   t6, RISCV_CPU_USER_REGS_OFFSET(t6)(sp)
> +        csrr    t0, CSR_SEPC
> +        REG_S   t0, RISCV_CPU_USER_REGS_OFFSET(sepc)(sp)
> +        csrr    t0, CSR_SSTATUS
> +        REG_S   t0, RISCV_CPU_USER_REGS_OFFSET(sstatus)(sp)
> +
> +        mv      a0, sp
> +        jal     __handle_exception
> +
> +restore_registers:
> +        /* Restore stack_cpu_regs */
> +        REG_L   t0, RISCV_CPU_USER_REGS_OFFSET(sepc)(sp)
> +        csrw    CSR_SEPC, t0
> +        REG_L   t0, RISCV_CPU_USER_REGS_OFFSET(sstatus)(sp)
> +        csrw    CSR_SSTATUS, t0
> +
> +        REG_L   ra, RISCV_CPU_USER_REGS_OFFSET(ra)(sp)
> +        REG_L   gp, RISCV_CPU_USER_REGS_OFFSET(gp)(sp)
> +        REG_L   t0, RISCV_CPU_USER_REGS_OFFSET(t0)(sp)
> +        REG_L   t1, RISCV_CPU_USER_REGS_OFFSET(t1)(sp)
> +        REG_L   t2, RISCV_CPU_USER_REGS_OFFSET(t2)(sp)
> +        REG_L   s0, RISCV_CPU_USER_REGS_OFFSET(s0)(sp)
> +        REG_L   s1, RISCV_CPU_USER_REGS_OFFSET(s1)(sp)
> +        REG_L   a0, RISCV_CPU_USER_REGS_OFFSET(a0)(sp)
> +        REG_L   a1, RISCV_CPU_USER_REGS_OFFSET(a1)(sp)
> +        REG_L   a2, RISCV_CPU_USER_REGS_OFFSET(a2)(sp)
> +        REG_L   a3, RISCV_CPU_USER_REGS_OFFSET(a3)(sp)
> +        REG_L   a4, RISCV_CPU_USER_REGS_OFFSET(a4)(sp)
> +        REG_L   a5, RISCV_CPU_USER_REGS_OFFSET(a5)(sp)
> +        REG_L   a6, RISCV_CPU_USER_REGS_OFFSET(a6)(sp)
> +        REG_L   a7, RISCV_CPU_USER_REGS_OFFSET(a7)(sp)
> +        REG_L   s2, RISCV_CPU_USER_REGS_OFFSET(s2)(sp)
> +        REG_L   s3, RISCV_CPU_USER_REGS_OFFSET(s3)(sp)
> +        REG_L   s4, RISCV_CPU_USER_REGS_OFFSET(s4)(sp)
> +        REG_L   s5, RISCV_CPU_USER_REGS_OFFSET(s5)(sp)
> +        REG_L   s6, RISCV_CPU_USER_REGS_OFFSET(s6)(sp)
> +        REG_L   s7, RISCV_CPU_USER_REGS_OFFSET(s7)(sp)
> +        REG_L   s8, RISCV_CPU_USER_REGS_OFFSET(s8)(sp)
> +        REG_L   s9, RISCV_CPU_USER_REGS_OFFSET(s9)(sp)
> +        REG_L   s10, RISCV_CPU_USER_REGS_OFFSET(s10)(sp)
> +        REG_L   s11, RISCV_CPU_USER_REGS_OFFSET(s11)(sp)
> +        REG_L   t3, RISCV_CPU_USER_REGS_OFFSET(t3)(sp)
> +        REG_L   t4, RISCV_CPU_USER_REGS_OFFSET(t4)(sp)
> +        REG_L   t5, RISCV_CPU_USER_REGS_OFFSET(t5)(sp)
> +        REG_L   t6, RISCV_CPU_USER_REGS_OFFSET(t6)(sp)
> +
> +        /* Restore sp */
> +        REG_L   sp, RISCV_CPU_USER_REGS_OFFSET(sp)(sp)
> +
> +        sret
> diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
> new file mode 100644
> index 0000000000..816ab1178a
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
> +void __handle_exception(struct cpu_user_regs *cpu_regs);
> +void handle_exception(void);
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* __ASM_TRAPS_H__ */
> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> new file mode 100644
> index 0000000000..3201b851ef
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
> +void __handle_exception(struct cpu_user_regs *cpu_regs)
> +{
> +    wait_for_interrupt();
> +}
> --
> 2.39.0
>
>

