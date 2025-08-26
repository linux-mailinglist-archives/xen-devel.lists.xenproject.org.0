Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1A3B364E9
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 15:42:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094432.1449768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqtwa-0000pY-Ha; Tue, 26 Aug 2025 13:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094432.1449768; Tue, 26 Aug 2025 13:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqtwa-0000nu-DY; Tue, 26 Aug 2025 13:42:36 +0000
Received: by outflank-mailman (input) for mailman id 1094432;
 Tue, 26 Aug 2025 13:42:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/mc=3G=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uqtwZ-0007ex-Kk
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 13:42:35 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84fef405-8282-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 15:42:33 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-55f42523658so2596938e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 06:42:33 -0700 (PDT)
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
X-Inumbo-ID: 84fef405-8282-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756215753; x=1756820553; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DpRZBqV3MEtacuYchd+fMmo0ionwtwWV+8rg/luuZg=;
        b=njRcyE00D9FWd7Rbm3ujAvwEr8TnvoxOFWcLbBm4Xl1FK519UBhcV/oVHJDtvMGf12
         HVNEz1u2QqbzUht50k7SKN1sK2pIu7YqOl+OtxlPvGu+03WLnvhGrT/tWcG9onbZJCDR
         JGW2P45gLMrZpLzMC7y2lI0awD0d9OjtnZj3xwj1CtWkyZxBluA4VhRkx7joxVL7OUMC
         n+J+AaPA1mSVnNQy4gITaJyrX2V5FYb/aSExTceSDFVzNejTO0gO4N/PI1kprRSml0fr
         NPHF3oW6QgbccEO1kVy9tz9+bxNpuqNgW+aub3er1AjZauW4DcwT/0hEoxQDB1q22pun
         GTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215753; x=1756820553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DpRZBqV3MEtacuYchd+fMmo0ionwtwWV+8rg/luuZg=;
        b=NKuQVMoA+d3KhQTWaW22SUU5qp2VwedwoEnGOfggNpO2p0G8mgJBqCBqlvhvToMmD+
         xOTjFtGUyks3d1nYkI85HxI1UJLaoSszKysjHY9mEfmsgfWRaYoacJjk4gnbvMnJ5FP3
         v/MnjRb1cvJzQ6uknYgZpdgie95MhzDmjmvD0m3ilIU8d+ICf1loAS5vYQ1SuG2Bxy2Y
         e54huBFsvP01tZqkkfiB5xuLTXIenieyt3oERmER7vd2ml+kGMi1cJMCijUlj2e6AZY/
         /sjY+ur73a4g2D4VUcjGsXQpBAcpFgMk6blM31wBlpMpMp8Vg/4fqO6Q/YeJr29zOOEb
         Fmfw==
X-Gm-Message-State: AOJu0YzfkgtJtDTSHcb5V3GBDg0BbXGCRHdMo/TmJli5lrgua2bxy3He
	GCt0pNtWznnD5noVmKyPBVkvd+2zRs4sHc/0C9uDyoMWCMYParxBS+A2HuanuQ/ib5/26Pgp9+i
	XzhmPTX9P9ZzUF27xYkjrI0su9OUqDXM=
X-Gm-Gg: ASbGnctLs9JtsihsfIw3txyuEHcfwqdYBFMZTV0xBewJmFue7O5KpB4ALgevMReZdZb
	pn4SnYzgsc/HFjABdRd15hCKp11X6esG+t74beXYC9/x0JPbc3BMMVxaQGnZKiaIbj1DRsYuiKC
	3vJtyrU4hPAdXhQtZHjjQjfu1z+hQfsvE7IiuspIDaMYz/HRzmtXVCEMelA2Jet0UxOa/5WCVUK
	poByPfTMyqbLpur
X-Google-Smtp-Source: AGHT+IH3eX49/Qf/LRBpHMRrk50LvDyoI5iIeSbIRmITMdrUvVCtte4Etiv3iKqCZmA21y5qozTKW0C1ZHB+95Jdxs8=
X-Received: by 2002:a05:6512:2908:b0:553:3422:c39d with SMTP id
 2adb3069b0e04-55f0d3a567bmr3645299e87.37.1756215753064; Tue, 26 Aug 2025
 06:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754943874.git.mykola_kvach@epam.com> <c5d6e20ff49fd9367c46e63b96e8a9aa687ffbd3.1754943875.git.mykola_kvach@epam.com>
 <875xee978i.fsf@epam.com>
In-Reply-To: <875xee978i.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 26 Aug 2025 16:42:21 +0300
X-Gm-Features: Ac12FXwmJebtPby8fSBe5B24t7vny15Vrv_eQmAhx6RJhP8GMzBTBcnQ1-Xa2_I
Message-ID: <CAGeoDV9xq0ZR4gJ=opnHU3CDEASDvAX1Kha_VSoNi7P2sM-Lvg@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] xen/arm: Implement PSCI SYSTEM_SUSPEND call
 (host interface)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Mirela Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, 
	Mykyta Poturai <Mykyta_Poturai@epam.com>, Mykola Kvach <Mykola_Kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volodymyr,

On Sat, Aug 23, 2025 at 4:06=E2=80=AFAM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
>
> Hi Mykola,
>
> Sequence of next 3 patches (and previous one) really puzzles me. Can you
> first implement hyp_resume() function, then add PSCI_SYSTEM_SUSPEND call
> and only then implement system_suspend() function? Why do this backwards?

This order comes from the first version of the patch series.
I'll reorder the commits in the next version.

>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > Invoke PSCI SYSTEM_SUSPEND to finalize Xen's suspend sequence on ARM64 =
platforms.
> > Pass the resume entry point (hyp_resume) as the first argument to EL3. =
The resume
> > handler is currently a stub and will be implemented later in assembly. =
Ignore the
> > context ID argument, as is done in Linux.
> >
> > Only enable this path when CONFIG_SYSTEM_SUSPEND is set and
> > PSCI version is >=3D 1.0.
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v4:
> >   - select the appropriate PSCI SYSTEM_SUSPEND function ID based on pla=
tform
> >   - update comments and commit message to reflect recent changes
> >
> > Changes in v3:
> >   - return PSCI_NOT_SUPPORTED instead of a hardcoded 1 on ARM32
> >   - check PSCI version before invoking SYSTEM_SUSPEND in call_psci_syst=
em_suspend
> > ---
> >  xen/arch/arm/arm64/head.S          |  8 ++++++++
> >  xen/arch/arm/include/asm/psci.h    |  1 +
> >  xen/arch/arm/include/asm/suspend.h |  2 ++
> >  xen/arch/arm/psci.c                | 23 ++++++++++++++++++++++-
> >  xen/arch/arm/suspend.c             |  5 +++++
> >  5 files changed, 38 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> > index 72c7b24498..3522c497c5 100644
> > --- a/xen/arch/arm/arm64/head.S
> > +++ b/xen/arch/arm/arm64/head.S
> > @@ -561,6 +561,14 @@ END(efi_xen_start)
> >
> >  #endif /* CONFIG_ARM_EFI */
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +FUNC(hyp_resume)
> > +        b .
> > +END(hyp_resume)
> > +
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> > +
> >  /*
> >   * Local variables:
> >   * mode: ASM
> > diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm=
/psci.h
> > index 48a93e6b79..bb3c73496e 100644
> > --- a/xen/arch/arm/include/asm/psci.h
> > +++ b/xen/arch/arm/include/asm/psci.h
> > @@ -23,6 +23,7 @@ int call_psci_cpu_on(int cpu);
> >  void call_psci_cpu_off(void);
> >  void call_psci_system_off(void);
> >  void call_psci_system_reset(void);
> > +int call_psci_system_suspend(void);
> >
> >  /* Range of allocated PSCI function numbers */
> >  #define      PSCI_FNUM_MIN_VALUE                 _AC(0,U)
> > diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/=
asm/suspend.h
> > index 78d0e2383b..55041a5d06 100644
> > --- a/xen/arch/arm/include/asm/suspend.h
> > +++ b/xen/arch/arm/include/asm/suspend.h
> > @@ -7,6 +7,8 @@
> >
> >  int host_system_suspend(void);
> >
> > +void hyp_resume(void);
> > +
> >  #endif /* CONFIG_SYSTEM_SUSPEND */
> >
> >  #endif /* __ASM_ARM_SUSPEND_H__ */
> > diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> > index b6860a7760..c9d126b195 100644
> > --- a/xen/arch/arm/psci.c
> > +++ b/xen/arch/arm/psci.c
> > @@ -17,17 +17,20 @@
> >  #include <asm/cpufeature.h>
> >  #include <asm/psci.h>
> >  #include <asm/acpi.h>
> > +#include <asm/suspend.h>
> >
> >  /*
> >   * While a 64-bit OS can make calls with SMC32 calling conventions, fo=
r
> >   * some calls it is necessary to use SMC64 to pass or return 64-bit va=
lues.
> > - * For such calls PSCI_0_2_FN_NATIVE(x) will choose the appropriate
> > + * For such calls PSCI_*_FN_NATIVE(x) will choose the appropriate
> >   * (native-width) function ID.
> >   */
> >  #ifdef CONFIG_ARM_64
> >  #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN64_##name
> > +#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN64_##name
> >  #else
> >  #define PSCI_0_2_FN_NATIVE(name)    PSCI_0_2_FN32_##name
> > +#define PSCI_1_0_FN_NATIVE(name)    PSCI_1_0_FN32_##name
> >  #endif
> >
> >  uint32_t psci_ver;
> > @@ -60,6 +63,24 @@ void call_psci_cpu_off(void)
> >      }
> >  }
> >
> > +int call_psci_system_suspend(void)
> > +{
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    struct arm_smccc_res res;
> > +
> > +    if ( psci_ver < PSCI_VERSION(1, 0) )
> > +        return PSCI_NOT_SUPPORTED;
> > +
> > +    /* 2nd argument (context ID) is not used */
> > +    arm_smccc_smc(PSCI_1_0_FN_NATIVE(SYSTEM_SUSPEND), __pa(hyp_resume)=
, &res);
> > +    return PSCI_RET(res);
> > +#else
> > +    dprintk(XENLOG_WARNING,
> > +            "SYSTEM_SUSPEND not supported (CONFIG_SYSTEM_SUSPEND disab=
led)\n");
> > +    return PSCI_NOT_SUPPORTED;
> > +#endif
> > +}
> > +
> >  void call_psci_system_off(void)
> >  {
> >      if ( psci_ver > PSCI_VERSION(0, 1) )
> > diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> > index abf4b928ce..11e86b7f51 100644
> > --- a/xen/arch/arm/suspend.c
> > +++ b/xen/arch/arm/suspend.c
> > @@ -1,5 +1,6 @@
> >  /* SPDX-License-Identifier: GPL-2.0-only */
> >
> > +#include <asm/psci.h>
> >  #include <xen/console.h>
> >  #include <xen/cpu.h>
> >  #include <xen/llc-coloring.h>
> > @@ -70,6 +71,10 @@ static long system_suspend(void *data)
> >       */
> >      update_boot_mapping(true);
> >
> > +    status =3D call_psci_system_suspend();
> > +    if ( status )
> > +        dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=3D%d\=
n", status);
>
> So this is where missing call to PSCI_SYSTEM_SUSPEND is...
>
> > +
> >      system_state =3D SYS_STATE_resume;
> >      update_boot_mapping(false);
>
> --
> WBR, Volodymyr

Best regards,
Mykola

