Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 071677B2F89
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 11:48:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610483.949909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmA6l-0006Eg-3B; Fri, 29 Sep 2023 09:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610483.949909; Fri, 29 Sep 2023 09:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmA6l-0006CB-09; Fri, 29 Sep 2023 09:48:27 +0000
Received: by outflank-mailman (input) for mailman id 610483;
 Fri, 29 Sep 2023 09:48:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fe2t=FN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qmA6j-0006C5-Dz
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 09:48:26 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54f32493-5ead-11ee-878c-cb3800f73035;
 Fri, 29 Sep 2023 11:48:24 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c007d6159aso219406381fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 Sep 2023 02:48:24 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y13-20020adff6cd000000b003180027d67asm21140783wrp.19.2023.09.29.02.48.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Sep 2023 02:48:23 -0700 (PDT)
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
X-Inumbo-ID: 54f32493-5ead-11ee-878c-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695980904; x=1696585704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sDfi4ZhGMRdi1EBHjC6h8kjIQ5crZiVXrqUq1j3IyAk=;
        b=dgR+bMHJBILIoUfVOYVcXvyGF4ysGcoh9eAnqvCpbxlm9vYoeKbi/lH70cABCdHa/5
         FBqBALt7ybrxSaMYuohXq8BHZhgsUNQxbAzmC/DOYa4arhkJqvbPgBaLyUd1+tz6LzM/
         Mr1zvITLtTkxrddnWhyxG6PstOAtmwuzKzxL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695980904; x=1696585704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sDfi4ZhGMRdi1EBHjC6h8kjIQ5crZiVXrqUq1j3IyAk=;
        b=QO0BB8zxjyC0J+9gI032qgtmkgpsfKq02SkBZ8vJvZ3d7DcSx3wv8+3WWFnBqNDA96
         ihMnRAlwk2RGuj2m6mbSb8jTWh9gPf/vbK62ieoXm+UaEzE3jvz08gO68zJCTJlTTR3U
         GXOnNgT91H4izcSat5gMwbAG4IAnvqBmC9VWzjOclglLMgGoCyclnxIGHQYDLgx7Fh+k
         z9oK8uA1xlMJjLgR6Fc9ccY70vDlZDnSh/CEfC0e4IcqxCMyDfzmnUzQt+GdSvkNE3ZV
         leULJpIgwZ3UMVytCdNay0zbYlJZasn+YolKmUNBoqNsXJxBB5zAh4FBI3mmpO/tW95e
         rmsA==
X-Gm-Message-State: AOJu0YxbX7ZXSBfosRab4B5yh+mQGFd7o/hroVAD2E9rlrjtpdKRgv9U
	ZbrP59M6/u1Hni44RQ8M5zDgUA==
X-Google-Smtp-Source: AGHT+IFHvHQP7PgueAdMYOB2Ekaf4zDgewjmIGFnf+PqMQM0CfasUPbKlFuemmPlH3uW3TV/n8FmHw==
X-Received: by 2002:a2e:2e09:0:b0:2c0:167e:dd8c with SMTP id u9-20020a2e2e09000000b002c0167edd8cmr2964319lju.10.1695980903604;
        Fri, 29 Sep 2023 02:48:23 -0700 (PDT)
Message-ID: <bfeb8d21-66ae-4bc4-99d7-33fd9ede266e@citrix.com>
Date: Fri, 29 Sep 2023 10:48:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/ppc: Implement a basic exception handler
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>
References: <cover.1695942864.git.sanastasio@raptorengineering.com>
 <edbe94f5ba1db05beb36fef6589b6a79a30c4a7c.1695942864.git.sanastasio@raptorengineering.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <edbe94f5ba1db05beb36fef6589b6a79a30c4a7c.1695942864.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/09/2023 12:19 am, Shawn Anastasio wrote:
> Implement a basic exception handler that dumps the CPU state to the
> console, as well as the code required to set the correct exception
> vector table's base address in setup.c.
>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  xen/arch/ppc/include/asm/processor.h |  31 +++++++
>  xen/arch/ppc/ppc64/Makefile          |   2 +
>  xen/arch/ppc/ppc64/asm-offsets.c     |   1 +
>  xen/arch/ppc/ppc64/exceptions-asm.S  | 122 +++++++++++++++++++++++++++
>  xen/arch/ppc/ppc64/exceptions.c      | 102 ++++++++++++++++++++++
>  xen/arch/ppc/setup.c                 |  11 +++
>  6 files changed, 269 insertions(+)
>  create mode 100644 xen/arch/ppc/ppc64/exceptions-asm.S
>  create mode 100644 xen/arch/ppc/ppc64/exceptions.c
>
> diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/asm/processor.h
> index d3dd943c20..a01b62b8a4 100644
> --- a/xen/arch/ppc/include/asm/processor.h
> +++ b/xen/arch/ppc/include/asm/processor.h
> @@ -103,6 +103,37 @@
>  #define PVR_BE        0x0070
>  #define PVR_PA6T      0x0090
>  
> +/* Exception Definitions */
> +#define EXC_SYSTEM_RESET    0x0100 /* System Reset Interrupt */
> +#define EXC_MACHINE_CHECK   0x0200 /* Machine Check Interrupt */
> +#define EXC_DATA_STORAGE    0x0300 /* Data Storage Interrupt */
> +#define EXC_DATA_SEGMENT    0x0380 /* Data Segment Interrupt */
> +#define EXC_INSN_STORAGE    0x0400 /* Instruction Storage Interrupt */
> +#define EXC_INSN_SEGMENT    0x0480 /* Instruction Segment Interrupt */
> +#define EXC_EXTERNAL        0x0500 /* External Interrupt */
> +#define EXC_ALIGNMENT       0x0600 /* Alignment Interrupt */
> +#define EXC_PROGRAM         0x0700 /* Program Interrupt */
> +#define EXC_FPU_UNAVAIL     0x0800 /* Floating-Point Unavailable Interrupt */
> +#define EXC_DECREMENTER     0x0900 /* Decrementer Interrupt */
> +#define EXC_H_DECREMENTER   0x0980 /* Hypervisor Decrementer Interrupt */
> +#define EXC_PRIV_DOORBELL   0x0A00 /* Directed Privileged Doorbell Interrupt */
> +#define EXC_SYSTEM_CALL     0x0C00 /* System Call Interrupt */
> +#define EXC_TRACE           0x0D00 /* Trace Interrupt */
> +#define EXC_H_DATA_STORAGE  0x0E00 /* Hypervisor Data Storage Interrupt */
> +#define EXC_H_INSN_STORAGE  0x0E20 /* Hypervisor Instruction Storage Interrupt */
> +#define EXC_H_EMUL_ASST     0x0E40 /* Hypervisor Emulation Assistance Interrupt */
> +#define EXC_H_MAINTENANCE   0x0E60 /* Hypervisor Maintenance Interrupt */
> +#define EXC_H_DOORBELL      0x0E80 /* Directed Hypervisor Doorbell Interrupt */
> +#define EXC_H_VIRT          0x0EA0 /* Hypervisor Virtualization Interrupt */
> +#define EXC_PERF_MON        0x0F00 /* Performance Monitor Interrupt */
> +#define EXC_VECTOR_UNAVAIL  0x0F20 /* Vector Unavailable Interrupt */
> +#define EXC_VSX_UNAVAIL     0x0F40 /* VSX Unavailable Interrupt */
> +#define EXC_FACIL_UNAVAIL   0x0F60 /* Facility Unavailable Interrupt */
> +#define EXC_H_FACIL_UNAVAIL 0x0F80 /* Hypervisor Facility Unavailable Interrupt */
> +
> +/* Base address of interrupt vector table when LPCR[AIL]=3 */
> +#define AIL_VECTOR_BASE _AC(0xc000000000004000, UL)
> +
>  #ifndef __ASSEMBLY__
>  
>  #include <xen/types.h>
> diff --git a/xen/arch/ppc/ppc64/Makefile b/xen/arch/ppc/ppc64/Makefile
> index 5b88355bb2..914bb21c40 100644
> --- a/xen/arch/ppc/ppc64/Makefile
> +++ b/xen/arch/ppc/ppc64/Makefile
> @@ -1,2 +1,4 @@
> +obj-y += exceptions.o
> +obj-y += exceptions-asm.o
>  obj-y += head.o
>  obj-y += opal-calls.o
> diff --git a/xen/arch/ppc/ppc64/asm-offsets.c b/xen/arch/ppc/ppc64/asm-offsets.c
> index c15c1bf136..634d7260e3 100644
> --- a/xen/arch/ppc/ppc64/asm-offsets.c
> +++ b/xen/arch/ppc/ppc64/asm-offsets.c
> @@ -46,6 +46,7 @@ void __dummy__(void)
>      OFFSET(UREGS_dsisr, struct cpu_user_regs, dsisr);
>      OFFSET(UREGS_cr, struct cpu_user_regs, cr);
>      OFFSET(UREGS_fpscr, struct cpu_user_regs, fpscr);
> +    OFFSET(UREGS_entry_vector, struct cpu_user_regs, entry_vector);
>      DEFINE(UREGS_sizeof, sizeof(struct cpu_user_regs));
>  
>      OFFSET(OPAL_base, struct opal, base);
> diff --git a/xen/arch/ppc/ppc64/exceptions-asm.S b/xen/arch/ppc/ppc64/exceptions-asm.S
> new file mode 100644
> index 0000000000..877df97c9b
> --- /dev/null
> +++ b/xen/arch/ppc/ppc64/exceptions-asm.S
> @@ -0,0 +1,122 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <asm/asm-defns.h>
> +#include <asm/processor.h>
> +
> +    /* Helper to dump CPU state to struct cpu_user_regs pointed to by r1. */
> +ENTRY(exception_common)
> +    /* Save GPRs 1-31 */
> +    SAVE_GPRS(1, 31, %r1)
> +
> +    /* Save LR, CTR, CR */
> +    mflr    %r0
> +    std     %r0, UREGS_lr(%r1)
> +    mfctr   %r0
> +    std     %r0, UREGS_ctr(%r1)
> +    mfcr    %r0
> +    stw     %r0, UREGS_cr(%r1) /* 32-bit */
> +
> +    /* Save Exception Registers */
> +    mfsrr0  %r0
> +    std     %r0, UREGS_pc(%r1)
> +    mfsrr1  %r0
> +    std     %r0, UREGS_msr(%r1)
> +    mfdsisr %r0
> +    stw     %r0, UREGS_dsisr(%r1) /* 32-bit */
> +    mfdar   %r0
> +    std     %r0, UREGS_dar(%r1)
> +    li      %r0, -1 /* OS's SRR0/SRR1 have been clobbered */
> +    std     %r0, UREGS_srr0(%r1)
> +    std     %r0, UREGS_srr1(%r1)
> +
> +    /* Setup TOC and a stack frame then call C exception handler */
> +    mr      %r3, %r1
> +    bcl     20, 31, 1f
> +1:  mflr    %r12
> +    addis   %r2, %r12, .TOC.-1b@ha
> +    addi    %r2, %r2, .TOC.-1b@l
> +
> +    li      %r0, 0
> +    stdu    %r0, -STACK_FRAME_OVERHEAD(%r1)
> +    bl      exception_handler
> +
> +    .size exception_common, . - exception_common
> +    .type exception_common, %function
> +
> +    /* Same as exception_common, but for exceptions that set HSRR{0,1} */
> +ENTRY(h_exception_common)
> +    /* Save GPRs 1-31 */
> +    SAVE_GPRS(1, 31, %r1)
> +
> +    /* Save LR, CTR, CR */
> +    mflr    %r0
> +    std     %r0, UREGS_lr(%r1)
> +    mfctr   %r0
> +    std     %r0, UREGS_ctr(%r1)
> +    mfcr    %r0
> +    stw     %r0, UREGS_cr(%r1) /* 32-bit */
> +
> +    /* Save Exception Registers */
> +    mfhsrr0 %r0
> +    std     %r0, UREGS_pc(%r1)
> +    mfhsrr1 %r0
> +    std     %r0, UREGS_msr(%r1)
> +    mfsrr0  %r0
> +    std     %r0, UREGS_srr0(%r1)
> +    mfsrr1  %r0
> +    std     %r0, UREGS_srr1(%r1)
> +    mfdsisr %r0
> +    stw     %r0, UREGS_dsisr(%r1) /* 32-bit */
> +    mfdar   %r0
> +    std     %r0, UREGS_dar(%r1)
> +
> +    /* Setup TOC and a stack frame then call C exception handler */
> +    mr      %r3, %r1
> +    bcl     20, 31, 1f
> +1:  mflr    %r12
> +    addis   %r2, %r12, .TOC.-1b@ha
> +    addi    %r2, %r2, .TOC.-1b@l
> +
> +    li      %r0, 0
> +    stdu    %r0, -STACK_FRAME_OVERHEAD(%r1)
> +    bl      exception_handler
> +
> +    .size h_exception_common, . - h_exception_common
> +    .type h_exception_common, %function

These two are almost identical, and differ only by the handling of
srr{0,1} as far as I can tell.

Is that just because the handler is fatal, or are they likely to stay
this similar longterm?

One thing you could do, which would remove the duplicated logic
constructing cpu_regs would be

exception_common_ssr
    mfsrr0  %r0
    std     %r0, UREGS_srr0(%r1)
    mfsrr1  %r0
    std     %r0, UREGS_srr1(%r1)
    b exception_common

exception_common_clobber_ssr
    li      %r0, -1 /* OS's SRR0/SRR1 have been clobbered */
    std     %r0, UREGS_srr0(%r1)
    std     %r0, UREGS_srr1(%r1)
    b exception_common

but this only works if the internal differences aren't going to get larger.

> +
> +/*
> + * Declare an ISR for the provided exception that jumps to `continue`
> + */
> +#define DEFINE_ISR(name, exc, continue)                                        \
> +    . = (AIL_VECTOR_BASE - EXCEPTION_VECTORS_START) + (exc);                   \
> +    ENTRY(name)                                                                \
> +    /* TODO: switch stack */                                                   \
> +    /* Reserve space for struct cpu_user_regs */                               \
> +    subi    %r1, %r1, UREGS_sizeof;                                            \
> +    /* Save r0 immediately so we can use it as scratch space */                \
> +    SAVE_GPR(0, %r1);                                                          \
> +    /* Save exception vector number */                                         \
> +    li      %r0, (exc);                                                        \
> +    std     %r0, UREGS_entry_vector(%r1);                                      \
> +    /* Branch to common code */                                                \
> +    b       (continue);                                                        \
> +    .size name, . - name;                                                      \
> +    .type name, %function;

This will be much nicer as an ASM macro rather than a preprocessor macro.

.macro ISR name, exc, handler
    ...
.endm

Everything inside can stay the same, but no need for ; or \, and a few
newlines go a long way for readability.


> +
> +    .section .text.exceptions, "ax", %progbits
> +
> +DEFINE_ISR(exc_sysreset, EXC_SYSTEM_RESET, exception_common)
> +DEFINE_ISR(exc_mcheck, EXC_MACHINE_CHECK, exception_common)
> +DEFINE_ISR(exc_dstore, EXC_DATA_STORAGE, exception_common)
> +DEFINE_ISR(exc_dsegment, EXC_DATA_SEGMENT, exception_common)
> +DEFINE_ISR(exc_istore, EXC_INSN_STORAGE, exception_common)
> +DEFINE_ISR(exc_isegment, EXC_INSN_SEGMENT, exception_common)
> +DEFINE_ISR(exc_extern, EXC_EXTERNAL, exception_common)
> +DEFINE_ISR(exc_align, EXC_ALIGNMENT, exception_common)
> +DEFINE_ISR(exc_program, EXC_PROGRAM, exception_common)
> +DEFINE_ISR(exc_fpu, EXC_FPU_UNAVAIL, exception_common)
> +DEFINE_ISR(exc_dec, EXC_DECREMENTER, exception_common)
> +DEFINE_ISR(exc_h_dec, EXC_H_DECREMENTER, h_exception_common)
> +/* EXC_PRIV_DOORBELL ... EXC_TRACE */
> +DEFINE_ISR(exc_h_dstore, EXC_H_DATA_STORAGE, h_exception_common)
> +DEFINE_ISR(exc_h_istore, EXC_H_INSN_STORAGE, h_exception_common)

It also makes this less cluttered, and I'd recommend tabulating it too.

~Andrew

