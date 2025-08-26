Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52686B365D3
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 15:51:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094453.1449778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqu4R-0003Ay-8R; Tue, 26 Aug 2025 13:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094453.1449778; Tue, 26 Aug 2025 13:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqu4R-00038f-51; Tue, 26 Aug 2025 13:50:43 +0000
Received: by outflank-mailman (input) for mailman id 1094453;
 Tue, 26 Aug 2025 13:50:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/mc=3G=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uqtwd-0007ex-Ro
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 13:42:39 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87814bc8-8282-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 15:42:38 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-333f901b229so47540481fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 06:42:38 -0700 (PDT)
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
X-Inumbo-ID: 87814bc8-8282-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756215757; x=1756820557; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3mTZzxPEC6M2r+tcymIjxamvl7XaPs1g5xTLEY4cuQ=;
        b=mHSTxOFvupMB0RzvzQ5rh8clN+r8B/2jf+LrnwFooS5Kn2Pzo8y0pDyr6iYckGV/If
         LGr4s5hhxbfJ82XCL2IuzDkw57F7EXrj5Ln3pwrTpl78na8V5Q9/OyGE+nnzewX6BsmK
         gt8al4IjStfOuJaw8+p+acGg1fQSxpPL+c81SIvLitOiRdW2KZorxgVGcw2r6gmIjKD4
         JtAiAVQZEY6XxxETeIrkhez/bO/9hFSxzZnHahjX/Kr1/u/iKR/3tNnzSX1yQL3TxMDx
         H2Ci43k0yIdPr7+qjOp1nbETowR2d2r3X8JUvu+7TdsI9McTetDZ6Dvau53NYIvi4ICB
         y4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215757; x=1756820557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3mTZzxPEC6M2r+tcymIjxamvl7XaPs1g5xTLEY4cuQ=;
        b=na9mEf6NFiRpn8p3VBreOHKiof8boV9NuMA3XqoZfk39NLJjmzubVJ2qVfBO7FdPE/
         /qsqHxEpHfkLg8s1t5v8uDrbVlE95zXClu0rIoTYaTcWc3MLCNsTnicuXvv7eboRN4Bi
         LL7pKxNhxzVOyZhZOPlPbIlOyDZsRV7qbDz6TXbpocKae0twukwCmQ2WAp85dyoEWpjm
         PxpK2Y9Wmr+XRqvvHF8Fj9M2Aca9eBGA8mxF2UCl4CRpAlIzwKqg5I5fYPTG9GNHrNzF
         SSOw3FK9jTEWTj6zPiyENqUDdUM+ssenXqqxT+QDi4tOGo1pVuyj52KXRV9oJ8Cqnfdg
         mz2w==
X-Gm-Message-State: AOJu0YzE8KxZ1/oq5eQIaDVwWMZt0dxiwDNAulc/lToE/Yn+W0kFYZQ6
	odbhCAK55q4lC6klVM8o+YV6fJ+TDGZFEgGG+XcS3I02Em2hn/rKRH+WcoilyDe9mWt8WJqL6Et
	KtD0Ktcpn2cB7fBksC4fR80GvCko8BtN3WA==
X-Gm-Gg: ASbGnct3RaTEYRarmtcuRL7NMNSQjJ7rrzKpwPZt9RwKxLGOOka95jqZiPcvR/7sPyK
	R746Kzao7Q0iV0KlYAEKqiqFCrt2u9Va4wXvAQr5kAZRHJ2iDl3BMexR0OKlGElTXhE127BzEZk
	WURDqeJbrdaGJCprCQfUvfo+Nf9SdBWGdzlz+2GtVNCnqDKX2KD61cvS/n+5zqVXViyOn5A+aIl
	Xmz8HMxurTyGdr5
X-Google-Smtp-Source: AGHT+IFNT5FdckSNdP0Kov8JO3J8KcIqxZ9S7CqKr+p8rYkw78gMUvHQXsSrxo7Fw6OGk7RKrUg3Zo2ndrDNnbXcwew=
X-Received: by 2002:a05:651c:410f:b0:32a:6eea:5c35 with SMTP id
 38308e7fff4ca-33650ea5991mr24506411fa.15.1756215757182; Tue, 26 Aug 2025
 06:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754943874.git.mykola_kvach@epam.com> <5441d6712a4ca0e61fd066606b9a96414123aaad.1754943875.git.mykola_kvach@epam.com>
 <87zfbq6iy5.fsf@epam.com>
In-Reply-To: <87zfbq6iy5.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 26 Aug 2025 16:42:26 +0300
X-Gm-Features: Ac12FXxAQr2EJ7XehoQi9FOuDJtUc5RnERU_qJIukh3-QJhBi5Pc2dGQ-7_3NAk
Message-ID: <CAGeoDV9tA0Op2kiqgq=89SRW_Q_fVRRsS+oAzZJWhaJAxXspbA@mail.gmail.com>
Subject: Re: [PATCH v5 10/12] xen/arm: Save/restore context on suspend/resume
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Mirela Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, 
	Mykyta Poturai <Mykyta_Poturai@epam.com>, Mykola Kvach <Mykola_Kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volodymyr,

On Sat, Aug 23, 2025 at 8:34=E2=80=AFPM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
>
> Hi Mykola,
>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > The context of CPU general purpose and system control registers
> > has to be saved on suspend and restored on resume. This is
> > implemented in hyp_suspend and before the return from hyp_resume
> > function. The hyp_suspend is invoked just before the PSCI system
> > suspend call is issued to the ATF. The hyp_suspend has to return a
> > non-zero value so that the calling 'if' statement evaluates to true,
> > causing the system suspend to be invoked. Upon the resume, context
> > saved on suspend will be restored, including the link register.
> > Therefore, after restoring the context the control flow will
> > return to the address pointed by the saved link register, which
> > is the place from which the hyp_suspend was called. To ensure
> > that the calling 'if' statement doesn't again evaluate to true
> > and initiate system suspend, hyp_resume has to return a zero value
> > after restoring the context.
> >
> > Note that the order of saving register context into cpu_context
> > structure has to match the order of restoring.
> >
> > Support for ARM32 is not implemented. Instead, compilation fails with a
> > build-time error if suspend is enabled for ARM32.
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v4:
> > - produce build-time error for ARM32 when CONFIG_SYSTEM_SUSPEND is enab=
led
> > - use register_t instead of uint64_t in cpu_context structure
> > ---
> >  xen/arch/arm/arm64/head.S          | 91 +++++++++++++++++++++++++++++-
> >  xen/arch/arm/include/asm/suspend.h | 20 +++++++
> >  xen/arch/arm/suspend.c             | 23 +++++++-
> >  3 files changed, 130 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> > index 596e960152..ad8b48de3a 100644
> > --- a/xen/arch/arm/arm64/head.S
> > +++ b/xen/arch/arm/arm64/head.S
> > @@ -562,6 +562,52 @@ END(efi_xen_start)
> >  #endif /* CONFIG_ARM_EFI */
> >
> >  #ifdef CONFIG_SYSTEM_SUSPEND
> > +/*
> > + * int hyp_suspend(struct cpu_context *ptr)
> > + *
> > + * x0 - pointer to the storage where callee's context will be saved
> > + *
> > + * CPU context saved here will be restored on resume in hyp_resume fun=
ction.
> > + * hyp_suspend shall return a non-zero value. Upon restoring context
> > + * hyp_resume shall return value zero instead. From C code that invoke=
s
> > + * hyp_suspend, the return value is interpreted to determine whether t=
he context
> > + * is saved (hyp_suspend) or restored (hyp_resume).
> > + */
> > +FUNC(hyp_suspend)
>
> I don't think that hyp_suspend is the correct name, as this function in
> fact suspend_nothing. Maybe "prepare_resume_ctx" will be better?

Not a problem to rename it.

>
> > +        /* Store callee-saved registers */
> > +        stp     x19, x20, [x0], #16
>
> If you have struct cpu_context defined, then you probably should use
> define provided by <asm-offsets.h> to access struct fields. Otherwise,
> it will be really easy to get desync between struct definition and this
> asm code.
>
> > +        stp     x21, x22, [x0], #16
> > +        stp     x23, x24, [x0], #16
> > +        stp     x25, x26, [x0], #16
> > +        stp     x27, x28, [x0], #16
> > +        stp     x29, lr, [x0], #16
> > +
> > +        /* Store stack-pointer */
> > +        mov     x2, sp
> > +        str     x2, [x0], #8
> > +
> > +        /* Store system control registers */
> > +        mrs     x2, VBAR_EL2
> > +        str     x2, [x0], #8
> > +        mrs     x2, VTCR_EL2
> > +        str     x2, [x0], #8
> > +        mrs     x2, VTTBR_EL2
> > +        str     x2, [x0], #8
> > +        mrs     x2, TPIDR_EL2
> > +        str     x2, [x0], #8
> > +        mrs     x2, MDCR_EL2
> > +        str     x2, [x0], #8
> > +        mrs     x2, HSTR_EL2
> > +        str     x2, [x0], #8
> > +        mrs     x2, CPTR_EL2
> > +        str     x2, [x0], #8
> > +        mrs     x2, HCR_EL2
> > +        str     x2, [x0], #8
> > +
> > +        /* hyp_suspend must return a non-zero value */
> > +        mov     x0, #1
> > +        ret
> > +END(hyp_suspend)
> >
> >  FUNC(hyp_resume)
> >          /* Initialize the UART if earlyprintk has been enabled. */
> > @@ -580,7 +626,50 @@ FUNC(hyp_resume)
> >          b     enable_secondary_cpu_mm
> >
> >  mmu_resumed:
> > -        b .
> > +        /*
> > +         * Now we can access the cpu_context, so restore the context h=
ere
> > +         * TODO: can we reuse __context_switch and saved_context struc=
t here ?
> > +         */
>
> This is a great idea and I like it very much, but sadly saved_context
> struct has no fields for system _EL2 registers.
>
> > +        ldr     x0, =3Dcpu_context
> > +
> > +        /* Restore callee-saved registers */
> > +        ldp     x19, x20, [x0], #16
> > +        ldp     x21, x22, [x0], #16
> > +        ldp     x23, x24, [x0], #16
> > +        ldp     x25, x26, [x0], #16
> > +        ldp     x27, x28, [x0], #16
> > +        ldp     x29, lr, [x0], #16
> > +
> > +        /* Restore stack pointer */
> > +        ldr     x2, [x0], #8
> > +        mov     sp, x2
> > +
> > +        /* Restore system control registers */
> > +        ldr     x2, [x0], #8
> > +        msr     VBAR_EL2, x2
> > +        ldr     x2, [x0], #8
> > +        msr     VTCR_EL2, x2
> > +        ldr     x2, [x0], #8
> > +        msr     VTTBR_EL2, x2
> > +        ldr     x2, [x0], #8
> > +        msr     TPIDR_EL2, x2
> > +        ldr     x2, [x0], #8
> > +        msr     MDCR_EL2, x2
> > +        ldr     x2, [x0], #8
> > +        msr     HSTR_EL2, x2
> > +        ldr     x2, [x0], #8
> > +        msr     CPTR_EL2, x2
> > +        ldr     x2, [x0], #8
> > +        msr     HCR_EL2, x2
> > +        isb
> > +
> > +        /* Since context is restored return from this function will ap=
pear as
> > +         * return from hyp_suspend. To distinguish a return from hyp_s=
uspend
> > +         * which is called upon finalizing the suspend, as opposed to =
return
> > +         * from this function which executes on resume, we need to ret=
urn zero
> > +         * value here. */
> > +        mov x0, #0
> > +        ret
> >  END(hyp_resume)
> >
> >  #endif /* CONFIG_SYSTEM_SUSPEND */
> > diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/=
asm/suspend.h
> > index 55041a5d06..ae71ccb87b 100644
> > --- a/xen/arch/arm/include/asm/suspend.h
> > +++ b/xen/arch/arm/include/asm/suspend.h
> > @@ -5,9 +5,29 @@
> >
> >  #ifdef CONFIG_SYSTEM_SUSPEND
> >
> > +#ifdef CONFIG_ARM_64
> > +struct cpu_context {
> > +    register_t callee_regs[12];
> > +    register_t sp;
> > +    register_t vbar_el2;
> > +    register_t vtcr_el2;
> > +    register_t vttbr_el2;
> > +    register_t tpidr_el2;
> > +    register_t mdcr_el2;
> > +    register_t hstr_el2;
> > +    register_t cptr_el2;
> > +    register_t hcr_el2;
> > +} __aligned(16);
> > +#else
> > +#error "Define cpu_context structure for arm32"
> > +#endif
> > +
> > +extern struct cpu_context cpu_context;
> > +
> >  int host_system_suspend(void);
> >
> >  void hyp_resume(void);
> > +int hyp_suspend(struct cpu_context *ptr);
> >
> >  #endif /* CONFIG_SYSTEM_SUSPEND */
> >
> > diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> > index 08b6acaede..b5398e5ca6 100644
> > --- a/xen/arch/arm/suspend.c
> > +++ b/xen/arch/arm/suspend.c
> > @@ -1,6 +1,7 @@
> >  /* SPDX-License-Identifier: GPL-2.0-only */
> >
> >  #include <asm/psci.h>
> > +#include <asm/suspend.h>
> >  #include <xen/console.h>
> >  #include <xen/cpu.h>
> >  #include <xen/llc-coloring.h>
> > @@ -17,6 +18,8 @@
> >   *  - Investigate feasibility and need for implementing system suspend=
 on ARM32
> >   */
> >
> > +struct cpu_context cpu_context;
> > +
> >  /* Xen suspend. Note: data is not used (suspend is the suspend to RAM)=
 */
> >  static long system_suspend(void *data)
> >  {
> > @@ -73,9 +76,23 @@ static long system_suspend(void *data)
> >       */
> >      update_boot_mapping(true);
> >
> > -    status =3D call_psci_system_suspend();
> > -    if ( status )
> > -        dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=3D%d\=
n", status);
> > +    if ( hyp_suspend(&cpu_context) )
> > +    {
> > +        status =3D call_psci_system_suspend();
> > +        /*
> > +         * If suspend is finalized properly by above system suspend PS=
CI call,
> > +         * the code below in this 'if' branch will never execute. Exec=
ution
> > +         * will continue from hyp_resume which is the hypervisor's res=
ume point.
> > +         * In hyp_resume CPU context will be restored and since link-r=
egister is
> > +         * restored as well, it will appear to return from hyp_suspend=
. The
> > +         * difference in returning from hyp_suspend on system suspend =
versus
> > +         * resume is in function's return value: on suspend, the retur=
n value is
> > +         * a non-zero value, on resume it is zero. That is why the con=
trol flow
> > +         * will not re-enter this 'if' branch on resume.
> > +         */
>
> Looks like this comment is misplaced. It should be before "if (
> hyp_suspend() )", right?

Actually, the comment is correctly placed here and does not need to be move=
d.

>
> > +        if ( status )
> > +            dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=
=3D%d\n", status);
> > +    }
> >
> >      system_state =3D SYS_STATE_resume;
> >      update_boot_mapping(false);
>
> --
> WBR, Volodymyr

Best regards,
Mykola

