Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4005E68FC63
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 02:07:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492100.761514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPvOy-00087U-6Y; Thu, 09 Feb 2023 01:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492100.761514; Thu, 09 Feb 2023 01:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPvOy-00084q-3d; Thu, 09 Feb 2023 01:07:04 +0000
Received: by outflank-mailman (input) for mailman id 492100;
 Thu, 09 Feb 2023 01:07:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UnIs=6F=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pPvOw-00084k-7U
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 01:07:02 +0000
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [2607:f8b0:4864:20::a30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e7bd30d-a816-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 02:07:01 +0100 (CET)
Received: by mail-vk1-xa30.google.com with SMTP id bs10so184338vkb.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Feb 2023 17:07:01 -0800 (PST)
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
X-Inumbo-ID: 0e7bd30d-a816-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Tp+8218BSg+jf4CQ/XhyyAu9DfvR01Ukl0OrJXyrxY=;
        b=W8qVelgd6h34jJdqWbNgYjaXzN2xsLAbY9nsWJU8HFgc44kiMthyzEYpORSaKg0Rru
         2z8g3Mvix4Y59tWH9cUHsrEi382kB0i/ibpLro/TTRdFgLneHmqlHpTL+N9q8DMz1Q+I
         GaUb2oCxyZxi32GD4qcUE++hPs/U2ly20aZJ/JJovQ/Err2+6RsfiGy3Zlm9hPyxgL9G
         t/WQ/PPmY3hZ0uaQD09jAgMP5WaUActfMLgIAwZIiTq8ufe0ii1sZwGHPxLGGAaV8Rk+
         AmUvAjt/qEcvUJqv7bPqPwlcGOcFC7zboA6lHvWOPCJ1p20Zt2Go7EnNypYmJU+L4nKh
         TApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Tp+8218BSg+jf4CQ/XhyyAu9DfvR01Ukl0OrJXyrxY=;
        b=ZUTWM5+buNlIPoZYX3Ij7idFn1IXoazUaxpPJLt6gh4Bkb61CAOqJxmkIdBX/qxGDy
         xqm80usU2Hqw1VDlbgch16XgcwiuSbS5FtevhcNLXr5wmf0NizfDNq/T4WSF2lgkjQ3U
         4yDBVk3xaMxmwHWS/CEl6YwyN5vfI63V/6d5ZTAOCmfdJuR5VDXa2wAJH5VojY3ElrpS
         ixOcrmfbuHaBnl9W4NFS8OoVTB3iNuaMkiulANvK+IzwPfeNwdV6EOgfcEzIYQBpVHm3
         qXh0jcEY84nL5VJK19KnVRKWCzKXjYNDwdEB85z+Xpd27Ba7aQbdBwet5pZW6MhiVNMI
         ZFUg==
X-Gm-Message-State: AO0yUKVVIJ36Ue2jrJKWt19vDOUk3Gi1jPPHgiTVUtethtaf9Nl1IKtV
	D67Rdt9/1atPKMDjzyv6w92VdQpSYJfOPrcvcP0=
X-Google-Smtp-Source: AK7set/bNd3LTv6oXtoU8ajtJjd6p2+rtyeo2M0oESELGK15Ss6EmYMe7gRtBtFm9GADo1xvKhrb5NYJiefGcaPo2L0=
X-Received: by 2002:a1f:2414:0:b0:3ea:3dee:4545 with SMTP id
 k20-20020a1f2414000000b003ea3dee4545mr2031416vkk.26.1675904819893; Wed, 08
 Feb 2023 17:06:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675780434.git.oleksii.kurochko@gmail.com> <5aa05592497ba9c4d207185d81981442d43ba676.1675780434.git.oleksii.kurochko@gmail.com>
In-Reply-To: <5aa05592497ba9c4d207185d81981442d43ba676.1675780434.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Feb 2023 11:06:34 +1000
Message-ID: <CAKmqyKN3Y7Z856EE4C6J8RBS2JTafV09fwK=yfFFoTM=m1jwXw@mail.gmail.com>
Subject: Re: [PATCH v3 07/14] xen/riscv: introduce exception context
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, Bobby Eshleman <bobby.eshleman@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 8, 2023 at 12:47 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> The patch introduces a set of registers which should be saved to and
> restored from a stack after an exception occurs and a set of defines
> which will be used during exception context saving/restoring.
>
> Originally <asm/processor.h> header was introduced in the patch series
> from Bobby so partially it was
> re-used and the following changes were done:
>   - Move all RISCV_CPU_USER_REGS_* to asm/asm-offsets.c
>   - Remove RISCV_CPU_USER_REGS_OFFSET & RISCV_CPU_USER_REGS_SIZE as
>     there is no sense in them after RISCV_CPU_USER_REGS_* were moved to
>     asm/asm-offsets.c
>   - Remove RISCV_PCPUINFO_* as they aren't needed for current status of
>     the RISC-V port
>   - register_t renamed to unsigned long
>   - rename wait_for_interrupt to wfi
>
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes in V3:
>   - update code style for die() function
> ---
> Changes in V2:
>   - All the changes were added to the commit message.
>   - temporarily was added function die() to stop exectution it will be
>     removed after panic() will be available.
> ---
>  xen/arch/riscv/include/asm/processor.h | 83 ++++++++++++++++++++++++++
>  xen/arch/riscv/riscv64/asm-offsets.c   | 53 ++++++++++++++++
>  2 files changed, 136 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/processor.h
>
> diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
> new file mode 100644
> index 0000000000..a71448e02e
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/processor.h
> @@ -0,0 +1,83 @@
> +/* SPDX-License-Identifier: MIT */
> +/******************************************************************************
> + *
> + * Copyright 2019 (C) Alistair Francis <alistair.francis@wdc.com>
> + * Copyright 2021 (C) Bobby Eshleman <bobby.eshleman@gmail.com>
> + * Copyright 2023 (C) Vates
> + *
> + */
> +
> +#ifndef _ASM_RISCV_PROCESSOR_H
> +#define _ASM_RISCV_PROCESSOR_H
> +
> +#ifndef __ASSEMBLY__
> +
> +/* On stack VCPU state */
> +struct cpu_user_regs
> +{
> +    unsigned long zero;
> +    unsigned long ra;
> +    unsigned long sp;
> +    unsigned long gp;
> +    unsigned long tp;
> +    unsigned long t0;
> +    unsigned long t1;
> +    unsigned long t2;
> +    unsigned long s0;
> +    unsigned long s1;
> +    unsigned long a0;
> +    unsigned long a1;
> +    unsigned long a2;
> +    unsigned long a3;
> +    unsigned long a4;
> +    unsigned long a5;
> +    unsigned long a6;
> +    unsigned long a7;
> +    unsigned long s2;
> +    unsigned long s3;
> +    unsigned long s4;
> +    unsigned long s5;
> +    unsigned long s6;
> +    unsigned long s7;
> +    unsigned long s8;
> +    unsigned long s9;
> +    unsigned long s10;
> +    unsigned long s11;
> +    unsigned long t3;
> +    unsigned long t4;
> +    unsigned long t5;
> +    unsigned long t6;
> +    unsigned long sepc;
> +    unsigned long sstatus;
> +    /* pointer to previous stack_cpu_regs */
> +    unsigned long pregs;
> +};
> +
> +static inline void wfi(void)
> +{
> +    __asm__ __volatile__ ("wfi");
> +}
> +
> +/*
> + * panic() isn't available at the moment so an infinite loop will be
> + * used temporarily.
> + * TODO: change it to panic()
> + */
> +static inline void die(void)
> +{
> +    for ( ;; )
> +        wfi();
> +}
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* _ASM_RISCV_PROCESSOR_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/riscv/riscv64/asm-offsets.c b/xen/arch/riscv/riscv64/asm-offsets.c
> index e69de29bb2..d632b75c2a 100644
> --- a/xen/arch/riscv/riscv64/asm-offsets.c
> +++ b/xen/arch/riscv/riscv64/asm-offsets.c
> @@ -0,0 +1,53 @@
> +#define COMPILE_OFFSETS
> +
> +#include <asm/processor.h>
> +#include <xen/types.h>
> +
> +#define DEFINE(_sym, _val)                                                 \
> +    asm volatile ("\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\"" \
> +                  : : "i" (_val) )
> +#define BLANK()                                                            \
> +    asm volatile ( "\n.ascii\"==><==\"" : : )
> +#define OFFSET(_sym, _str, _mem)                                           \
> +    DEFINE(_sym, offsetof(_str, _mem));
> +
> +void asm_offsets(void)
> +{
> +    BLANK();
> +    DEFINE(CPU_USER_REGS_SIZE, sizeof(struct cpu_user_regs));
> +    OFFSET(CPU_USER_REGS_ZERO, struct cpu_user_regs, zero);
> +    OFFSET(CPU_USER_REGS_RA, struct cpu_user_regs, ra);
> +    OFFSET(CPU_USER_REGS_SP, struct cpu_user_regs, sp);
> +    OFFSET(CPU_USER_REGS_GP, struct cpu_user_regs, gp);
> +    OFFSET(CPU_USER_REGS_TP, struct cpu_user_regs, tp);
> +    OFFSET(CPU_USER_REGS_T0, struct cpu_user_regs, t0);
> +    OFFSET(CPU_USER_REGS_T1, struct cpu_user_regs, t1);
> +    OFFSET(CPU_USER_REGS_T2, struct cpu_user_regs, t2);
> +    OFFSET(CPU_USER_REGS_S0, struct cpu_user_regs, s0);
> +    OFFSET(CPU_USER_REGS_S1, struct cpu_user_regs, s1);
> +    OFFSET(CPU_USER_REGS_A0, struct cpu_user_regs, a0);
> +    OFFSET(CPU_USER_REGS_A1, struct cpu_user_regs, a1);
> +    OFFSET(CPU_USER_REGS_A2, struct cpu_user_regs, a2);
> +    OFFSET(CPU_USER_REGS_A3, struct cpu_user_regs, a3);
> +    OFFSET(CPU_USER_REGS_A4, struct cpu_user_regs, a4);
> +    OFFSET(CPU_USER_REGS_A5, struct cpu_user_regs, a5);
> +    OFFSET(CPU_USER_REGS_A6, struct cpu_user_regs, a6);
> +    OFFSET(CPU_USER_REGS_A7, struct cpu_user_regs, a7);
> +    OFFSET(CPU_USER_REGS_S2, struct cpu_user_regs, s2);
> +    OFFSET(CPU_USER_REGS_S3, struct cpu_user_regs, s3);
> +    OFFSET(CPU_USER_REGS_S4, struct cpu_user_regs, s4);
> +    OFFSET(CPU_USER_REGS_S5, struct cpu_user_regs, s5);
> +    OFFSET(CPU_USER_REGS_S6, struct cpu_user_regs, s6);
> +    OFFSET(CPU_USER_REGS_S7, struct cpu_user_regs, s7);
> +    OFFSET(CPU_USER_REGS_S8, struct cpu_user_regs, s8);
> +    OFFSET(CPU_USER_REGS_S9, struct cpu_user_regs, s9);
> +    OFFSET(CPU_USER_REGS_S10, struct cpu_user_regs, s10);
> +    OFFSET(CPU_USER_REGS_S11, struct cpu_user_regs, s11);
> +    OFFSET(CPU_USER_REGS_T3, struct cpu_user_regs, t3);
> +    OFFSET(CPU_USER_REGS_T4, struct cpu_user_regs, t4);
> +    OFFSET(CPU_USER_REGS_T5, struct cpu_user_regs, t5);
> +    OFFSET(CPU_USER_REGS_T6, struct cpu_user_regs, t6);
> +    OFFSET(CPU_USER_REGS_SEPC, struct cpu_user_regs, sepc);
> +    OFFSET(CPU_USER_REGS_SSTATUS, struct cpu_user_regs, sstatus);
> +    OFFSET(CPU_USER_REGS_PREGS, struct cpu_user_regs, pregs);
> +}
> --
> 2.39.0
>
>

