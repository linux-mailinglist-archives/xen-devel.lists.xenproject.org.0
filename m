Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2454659F4B7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 10:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392267.630493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQlNj-0006nM-1M; Wed, 24 Aug 2022 08:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392267.630493; Wed, 24 Aug 2022 08:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQlNi-0006lJ-TM; Wed, 24 Aug 2022 08:04:58 +0000
Received: by outflank-mailman (input) for mailman id 392267;
 Wed, 24 Aug 2022 08:04:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z3XY=Y4=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oQlNg-0006lD-U4
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 08:04:56 +0000
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [2607:f8b0:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ffa39dd-2383-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 10:04:55 +0200 (CEST)
Received: by mail-pg1-x533.google.com with SMTP id s206so14377866pgs.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Aug 2022 01:04:55 -0700 (PDT)
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
X-Inumbo-ID: 6ffa39dd-2383-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=CX7FcZmvoWqSFDSPgydIr1INXVpgZ/q9i60+ftlKLME=;
        b=gIrl2BMbamHbg8vUqbvd6MBWvidwjU5xVX0sHXnCiz5JVSw1iebHW+Y+pMUfG2AyvX
         6sKpr88ktvBQVuIsfCymbMjyRUgley1Zgwo2pkDuQLnCCyYcwVcQE8poxtbKPR2MIr0m
         GDJdwsEvFTp975+II1msSoorL0Z3VHFrmJ3wRLyZCAysZqD/13GXRkZqTD1l44iNJ5dz
         eznjf6WU2KtsiqpywfMxvmM1wNqrbC2OH3++gr/YOdz5XQguxxkJhcYIPNC1bhYQMJCm
         v6Iau4F5ZFprBC+RLlT9lsOUISmdJER7ct48ylfbi09ZOO99lvGv35GniB/JvlNasSTW
         Id3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=CX7FcZmvoWqSFDSPgydIr1INXVpgZ/q9i60+ftlKLME=;
        b=U4XaWS7+8zLNVCxtBdxGratcwyI+lVviAlOhU4zFwebRUwGzma9Y0rt/8JD7T+6e48
         +9IWz58NwOtvUKOJf1ZHzvprBrykuqLoLHDNo6pJug3EKpPF41peid3klLApc5pDdSHR
         FQwN9BDp1mI7zVJ7RJ4w8NQhz+WJ0BUQ3i8tdyVn9UXpDc+fCjxwgA+tKOHzOt+HUY4Q
         2INY1WtT6w5/skuRUze3VNdgfiYsnbVjJ/wqDZ8PLpP3+Z2F8kyKkuwEKkQtTUj8NbBx
         0K5OKLPwXxZ6PIgQnof+uTXmNfkiXgHA4Lt7kA9uGQUCp9RvCryNeUzwI6AOmIztTMic
         1CAw==
X-Gm-Message-State: ACgBeo3QznY3Xz+vqteALavuIw+qtt474Twhtl5Ihmy6A/MuFO3VSppv
	J8hTpXx64zrnhTGrVG/SjPyJ7YY1MfbCbwyCcAtzpQ==
X-Google-Smtp-Source: AA6agR70a6KVvePGe7dA+iB1xFnyXhPvMbUWUP9E+oXzT0jGjYtSY/wKKy/VpB4kU2MsqKyXBk2gMJ4UcopX2KlLfEo=
X-Received: by 2002:a63:224a:0:b0:41e:1d36:5063 with SMTP id
 t10-20020a63224a000000b0041e1d365063mr22926010pgm.568.1661328293670; Wed, 24
 Aug 2022 01:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220818105601.1896082-1-jens.wiklander@linaro.org>
 <20220818105601.1896082-2-jens.wiklander@linaro.org> <EC23C48B-C9ED-4BD0-BD6D-4967A2509B2B@arm.com>
In-Reply-To: <EC23C48B-C9ED-4BD0-BD6D-4967A2509B2B@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 24 Aug 2022 10:04:42 +0200
Message-ID: <CAHUa44EF+aXgQcgAcBPwJSWAoSeejyAe_JJFXsKR2WbQCRVdPQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] xen/arm: smccc: add support for SMCCCv1.2 extended
 input/output registers
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 18, 2022 at 3:45 PM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 18 Aug 2022, at 11:55, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >
> > SMCCC v1.2 [1] AArch64 allows x0-x17 to be used as both parameter
> > registers and result registers for the SMC and HVC instructions.
> >
> > Arm Firmware Framework for Armv8-A specification makes use of x0-x7 as
> > parameter and result registers.
> >
> > Let us add new interface to support this extended set of input/output
> > registers.
> >
> > This is based on 3fdc0cb59d97 ("arm64: smccc: Add support for SMCCCv1.2
> > extended input/output registers") by Sudeep Holla from the Linux kernel
> >
> > The SMCCC version reported to the VM is bumped to 1.2 in order to support
> > handling FF-A messages.
>
> With this patch, you add something so that you could call SMCCCv1.2 but in practice you are not using it anywhere.
> I do not think this patch should bump the version we present to guests.
>
> >
> > [1] https://developer.arm.com/documentation/den0028/c/?lang=en
> >
> > Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> > xen/arch/arm/arm64/asm-offsets.c |  9 +++++++
> > xen/arch/arm/arm64/smc.S         | 43 ++++++++++++++++++++++++++++++++
> > xen/arch/arm/include/asm/smccc.h | 40 +++++++++++++++++++++++++++++
> > xen/arch/arm/vsmc.c              |  2 +-
> > 4 files changed, 93 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-offsets.c
> > index 280ddb55bfd4..1721e1ed26e1 100644
> > --- a/xen/arch/arm/arm64/asm-offsets.c
> > +++ b/xen/arch/arm/arm64/asm-offsets.c
> > @@ -56,6 +56,15 @@ void __dummy__(void)
> >    BLANK();
> >    OFFSET(SMCCC_RES_a0, struct arm_smccc_res, a0);
> >    OFFSET(SMCCC_RES_a2, struct arm_smccc_res, a2);
> > +   OFFSET(ARM_SMCCC_1_2_REGS_X0_OFFS, struct arm_smccc_1_2_regs, a0);
> > +   OFFSET(ARM_SMCCC_1_2_REGS_X2_OFFS, struct arm_smccc_1_2_regs, a2);
> > +   OFFSET(ARM_SMCCC_1_2_REGS_X4_OFFS, struct arm_smccc_1_2_regs, a4);
> > +   OFFSET(ARM_SMCCC_1_2_REGS_X6_OFFS, struct arm_smccc_1_2_regs, a6);
> > +   OFFSET(ARM_SMCCC_1_2_REGS_X8_OFFS, struct arm_smccc_1_2_regs, a8);
> > +   OFFSET(ARM_SMCCC_1_2_REGS_X10_OFFS, struct arm_smccc_1_2_regs, a10);
> > +   OFFSET(ARM_SMCCC_1_2_REGS_X12_OFFS, struct arm_smccc_1_2_regs, a12);
> > +   OFFSET(ARM_SMCCC_1_2_REGS_X14_OFFS, struct arm_smccc_1_2_regs, a14);
> > +   OFFSET(ARM_SMCCC_1_2_REGS_X16_OFFS, struct arm_smccc_1_2_regs, a16);
> > }
> >
> > /*
> > diff --git a/xen/arch/arm/arm64/smc.S b/xen/arch/arm/arm64/smc.S
> > index 91bae62dd4d2..c546192e7f2d 100644
> > --- a/xen/arch/arm/arm64/smc.S
> > +++ b/xen/arch/arm/arm64/smc.S
> > @@ -27,3 +27,46 @@ ENTRY(__arm_smccc_1_0_smc)
> >         stp     x2, x3, [x4, #SMCCC_RES_a2]
> > 1:
> >         ret
> > +
> > +
>
> Please only add one line only here

OK, I'll fix.

Thanks,
Jens

>
> > +/*
> > + * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
> > + *                        struct arm_smccc_1_2_regs *res)
> > + */
> > +ENTRY(arm_smccc_1_2_smc)
> > +    /* Save `res` and free a GPR that won't be clobbered */
>
> The comment here should be fixed, you are clobbering x19 hence you need to save it.
>
> > +    stp     x1, x19, [sp, #-16]!
> > +
> > +    /* Ensure `args` won't be clobbered while loading regs in next step */
> > +    mov      x19, x0
>
> You do not need to save args (and no code is restoring it).
>
> > +
> > +    /* Load the registers x0 - x17 from the struct arm_smccc_1_2_regs */
> > +    ldp      x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
> > +    ldp      x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
> > +    ldp      x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
> > +    ldp      x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
> > +    ldp      x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
> > +    ldp      x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
> > +    ldp      x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
> > +    ldp      x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
> > +    ldp      x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
> > +
> > +    smc #0
> > +
> > +    /* Load the `res` from the stack */
> > +    ldr      x19, [sp]
> > +
> > +    /* Store the registers x0 - x17 into the result structure */
> > +    stp      x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
> > +    stp      x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
> > +    stp      x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
> > +    stp      x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
> > +    stp      x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
> > +    stp      x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
> > +    stp      x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
> > +    stp      x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
> > +    stp      x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
> > +
> > +    /* Restore original x19 */
> > +    ldp     xzr, x19, [sp], #16
>
> You should use ldr and just load x19 value here.
>
> > +    ret
> > diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
> > index b3dbeecc90ad..b5e3f67eb34e 100644
> > --- a/xen/arch/arm/include/asm/smccc.h
> > +++ b/xen/arch/arm/include/asm/smccc.h
> > @@ -33,6 +33,7 @@
> >
> > #define ARM_SMCCC_VERSION_1_0   SMCCC_VERSION(1, 0)
> > #define ARM_SMCCC_VERSION_1_1   SMCCC_VERSION(1, 1)
> > +#define ARM_SMCCC_VERSION_1_2   SMCCC_VERSION(1, 2)
> >
> > /*
> >  * This file provides common defines for ARM SMC Calling Convention as
> > @@ -265,6 +266,45 @@ void __arm_smccc_1_0_smc(register_t a0, register_t a1, register_t a2,
> >         else                                                    \
> >             arm_smccc_1_0_smc(__VA_ARGS__);                     \
> >     } while ( 0 )
> > +
> > +/**
> > + * struct arm_smccc_1_2_regs - Arguments for or Results from SMC call
> > + * @a0-a17 argument values from registers 0 to 17
> > + */
> > +struct arm_smccc_1_2_regs {
> > +    unsigned long a0;
> > +    unsigned long a1;
> > +    unsigned long a2;
> > +    unsigned long a3;
> > +    unsigned long a4;
> > +    unsigned long a5;
> > +    unsigned long a6;
> > +    unsigned long a7;
> > +    unsigned long a8;
> > +    unsigned long a9;
> > +    unsigned long a10;
> > +    unsigned long a11;
> > +    unsigned long a12;
> > +    unsigned long a13;
> > +    unsigned long a14;
> > +    unsigned long a15;
> > +    unsigned long a16;
> > +    unsigned long a17;
> > +};
> > +
> > +/**
> > + * arm_smccc_1_2_smc() - make SMC calls
> > + * @args: arguments passed via struct arm_smccc_1_2_regs
> > + * @res: result values via struct arm_smccc_1_2_regs
> > + *
> > + * This function is used to make SMC calls following SMC Calling Convention
> > + * v1.2 or above. The content of the supplied param are copied from the
> > + * structure to registers prior to the SMC instruction. The return values
> > + * are updated with the content from registers on return from the SMC
> > + * instruction.
> > + */
> > +void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
> > +                       struct arm_smccc_1_2_regs *res);
> > #endif /* CONFIG_ARM_64 */
> >
> > #endif /* __ASSEMBLY__ */
> > diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> > index 676740ef1520..6f90c08a6304 100644
> > --- a/xen/arch/arm/vsmc.c
> > +++ b/xen/arch/arm/vsmc.c
> > @@ -93,7 +93,7 @@ static bool handle_arch(struct cpu_user_regs *regs)
> >     switch ( fid )
> >     {
> >     case ARM_SMCCC_VERSION_FID:
> > -        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_1);
> > +        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_2);
>
> As said for the commit message, I do not see what changes are making Xen providing 1.2 interface at this stage.
>
> Regards
> Bertrand
>
> >         return true;
> >
> >     case ARM_SMCCC_ARCH_FEATURES_FID:
> > --
> > 2.31.1
> >
>

