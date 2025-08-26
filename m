Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C858B364E7
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 15:42:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094425.1449758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqtwW-0000PR-AW; Tue, 26 Aug 2025 13:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094425.1449758; Tue, 26 Aug 2025 13:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqtwW-0000Mr-5b; Tue, 26 Aug 2025 13:42:32 +0000
Received: by outflank-mailman (input) for mailman id 1094425;
 Tue, 26 Aug 2025 13:42:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/mc=3G=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uqtwV-0007ex-KC
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 13:42:31 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82111ec2-8282-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 15:42:28 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-55f499c7f0cso1688399e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 06:42:28 -0700 (PDT)
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
X-Inumbo-ID: 82111ec2-8282-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756215748; x=1756820548; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ld1jMJbgNHdUiNtFyG1I2q/hxuL4N8Dfb380ntLscSU=;
        b=NPcRErFcINOx+U2EintvX/Uau2pph+03Y2HTiNlOkWH9qK4mjfTGdz7X7rockXDCxB
         G6igKJjfmWJhuCx7OjScC5rMoedxwhA5ZYXn66IZMR1Vh2Qy+iExkP/Ls/bvat4DSnc4
         CUaF4H5U/dBjuO5R9bvgUg5jRZoybsbyE7hoREj5/uCsOzb6kMnnW4C1u5PVJk0nqtpp
         kQ61LegRiIsljlb6Q+4DYd2ZyGzrALn9+M9llDkAxgmfxpGmFUo6Q07VtJ8AXg549OJ1
         GbyWYCIq0oP/khvx1/zSOHyUX4J4y25vIA08FgkFceNjgM3pEY+GOMTrmD+C3Bq2x6WJ
         wTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215748; x=1756820548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ld1jMJbgNHdUiNtFyG1I2q/hxuL4N8Dfb380ntLscSU=;
        b=iVJmom3YFJrZGwG4v9eV/ls1y3vnun2a06ovVDiyhjRk7AxzgJyVnMnyTCYQh+ti2e
         3Zi/kCyD36xL5qqTjo9/LK376wvkja8gBGVHHP5X/7dnWWA00uCUlgSNbUMgd3LXGxbN
         EHTzt7b55mS26DNWZwxLqcL6OtoNOiHP25JwBuUNV5OZ1Hgzrfu0hmz2t9Gfvz7qzW2P
         /LlPFIVBL/cdEaKaR8l0aH6JVgf2fV7ioONyCN9SaEDhwfJYEmgEB5t8cQAmSKR/NwFQ
         yw7kXJNnqrDog05gnUPhxBVnJUceUJnwNTe7zIZ20Z5bzBxd5J6lPabVQWJyyEh0N6M6
         uuqA==
X-Gm-Message-State: AOJu0YwIxMBqvuoOb2fSgrjYJPmnaQa+17MQSp4qqjRNIIXaj442y1ZZ
	f19NVG6sgSXaR6lJV4dN44Jnrz/EADhnx4p3W4N43X4jW98JO2kDuPXq9ntqN0nhOKOTviRE4/h
	E0MIYD0kwLPPO2iiO1tarSL8qTo3wihA=
X-Gm-Gg: ASbGnctnWPVNWz+0bffy0opIEQqZ6fmXzUZBfwMFHuN8DgSnWqozzzVLgO18halNRnq
	lpR2Wjii8GAKmPnhpPc4FKN75zzdXCqNoObCEuAWQTvQvi8hMcbrd38KEfcK7OOiqgchLJX7ZKa
	BCcc/FWtzvvXgbluYGnxLYZ59CcA4eGK5aClVXTY0C0MbXl/kFGI+mYjzrjZq7kZm9FOCTbj6VU
	ZJTSwde8uOL0Cvo
X-Google-Smtp-Source: AGHT+IG2Yv3Ok1i5kNBoAC3cT9z1SnURXyP56TEei4+KYUR2j8mFtzjDLN3c0Kgqt4X9TqhMvX9+86fTS9DsQZbZej0=
X-Received: by 2002:a05:6512:6301:b0:55f:503c:d316 with SMTP id
 2adb3069b0e04-55f503cd548mr248707e87.30.1756215747995; Tue, 26 Aug 2025
 06:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754943874.git.mykola_kvach@epam.com> <c995126a9a61aecff7cb9a7c6fd28f091a332443.1754943875.git.mykola_kvach@epam.com>
 <87ms7q97j9.fsf@epam.com>
In-Reply-To: <87ms7q97j9.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 26 Aug 2025 16:42:16 +0300
X-Gm-Features: Ac12FXxIjbKCylLsbPbqtKV8i5xu3gx5va7eEr6NlbquJyeVrZ86z523QzWXKbY
Message-ID: <CAGeoDV99fHOYzw8whgrkgVMJmO1fmAdo9fmyFLFihYx8S4wX+g@mail.gmail.com>
Subject: Re: [PATCH v5 07/12] xen/arm: Add support for system suspend
 triggered by hardware domain
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Mirela Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>, 
	Mykola Kvach <Mykola_Kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volodymyr,

On Sat, Aug 23, 2025 at 4:00=E2=80=AFAM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Hi Mykola,
>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > Trigger Xen suspend when the hardware domain initiates suspend via
> > SHUTDOWN_suspend. Redirect system suspend to CPU#0 to ensure the
> > suspend logic runs on the boot CPU, as required.
> >
> > Introduce full suspend/resume infrastructure gated by CONFIG_SYSTEM_SUS=
PEND,
> > including logic to:
> >  - disable and enable non-boot physical CPUs
> >  - freeze and thaw domains
> >  - suspend and resume the GIC, timer and console
> >  - maintain system state before and after suspend
> >
> > Remove the restriction in the PSCI interface preventing suspend from th=
e
> > hardware domain.
> >
> > Select HAS_SYSTEM_SUSPEND for ARM_64.
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v5:
> > - select HAS_SYSTEM_SUSPEND in ARM_64 instead of ARM
> > - check llc_coloring_enabled instead of LLC_COLORING during the selecti=
on
> >   of HAS_SYSTEM_SUSPEND config
> > - call host_system_suspend from guest PSCI system suspend instead of
> >   arch_domain_shutdown, reducing the complexity of the new code
> > - update some comments
> >
> > Changes introduced in V4:
> >   - drop code for saving and restoring VCPU context (for more informati=
on
> >     refer part 1 of patch series)
> >   - remove IOMMU suspend and resume calls until they will be implemente=
d
> >   - move system suspend logic to arch_domain_shutdown, invoked from
> >     domain_shutdown
> >   - apply minor fixes such as renaming functions, updating comments, an=
d
> >     modifying the commit message to reflect these changes
> >   - add console_end_sync to resume path after system suspend
> >
> > Changes introduced in V3:
> >   - merge changes from other commits into this patch (previously stashe=
d):
> >     1) disable/enable non-boot physical CPUs and freeze/thaw domains du=
ring
> >        suspend/resume
> >     2) suspend/resume the timer, GIC, console, IOMMU, and hardware doma=
in
> > ---
> >  xen/arch/arm/Kconfig               |   1 +
> >  xen/arch/arm/Makefile              |   1 +
> >  xen/arch/arm/include/asm/suspend.h |  22 +++++
> >  xen/arch/arm/suspend.c             | 151 +++++++++++++++++++++++++++++
> >  xen/arch/arm/vpsci.c               |  12 ++-
> >  xen/common/domain.c                |   4 +
> >  6 files changed, 190 insertions(+), 1 deletion(-)
> >  create mode 100644 xen/arch/arm/include/asm/suspend.h
> >  create mode 100644 xen/arch/arm/suspend.c
> >
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index a0c8160474..ccdbaa5bc3 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -8,6 +8,7 @@ config ARM_64
> >       depends on !ARM_32
> >       select 64BIT
> >       select HAS_FAST_MULTIPLY
> > +     select HAS_SYSTEM_SUSPEND if UNSUPPORTED
> >       select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
> >
> >  config ARM
> > diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> > index f833cdf207..3f6247adee 100644
> > --- a/xen/arch/arm/Makefile
> > +++ b/xen/arch/arm/Makefile
> > @@ -51,6 +51,7 @@ obj-y +=3D setup.o
> >  obj-y +=3D shutdown.o
> >  obj-y +=3D smp.o
> >  obj-y +=3D smpboot.o
> > +obj-$(CONFIG_SYSTEM_SUSPEND) +=3D suspend.o
> >  obj-$(CONFIG_SYSCTL) +=3D sysctl.o
> >  obj-y +=3D time.o
> >  obj-y +=3D traps.o
> > diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/=
asm/suspend.h
> > new file mode 100644
> > index 0000000000..78d0e2383b
> > --- /dev/null
> > +++ b/xen/arch/arm/include/asm/suspend.h
> > @@ -0,0 +1,22 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef __ASM_ARM_SUSPEND_H__
> > +#define __ASM_ARM_SUSPEND_H__
> > +
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +
> > +int host_system_suspend(void);
> > +
> > +#endif /* CONFIG_SYSTEM_SUSPEND */
> > +
> > +#endif /* __ASM_ARM_SUSPEND_H__ */
> > +
> > + /*
> > +  * Local variables:
> > +  * mode: C
> > +  * c-file-style: "BSD"
> > +  * c-basic-offset: 4
> > +  * tab-width: 4
> > +  * indent-tabs-mode: nil
> > +  * End:
> > +  */
> > diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> > new file mode 100644
> > index 0000000000..abf4b928ce
> > --- /dev/null
> > +++ b/xen/arch/arm/suspend.c
> > @@ -0,0 +1,151 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#include <xen/console.h>
> > +#include <xen/cpu.h>
> > +#include <xen/llc-coloring.h>
> > +#include <xen/sched.h>
> > +
> > +/*
> > + * TODO list:
> > + *  - Test system suspend with LLC_COLORING enabled and verify functio=
nality
> > + *  - Implement IOMMU suspend/resume handlers and integrate them
> > + *    into the suspend/resume path (IPMMU and SMMU)
> > + *  - Enable "xl suspend" support on ARM architecture
> > + *  - Properly disable Xen timer watchdog from relevant services
> > + *  - Add suspend/resume CI test for ARM (QEMU if feasible)
> > + *  - Investigate feasibility and need for implementing system suspend=
 on ARM32
> > + */
> > +
> > +/* Xen suspend. Note: data is not used (suspend is the suspend to RAM)=
 */
> > +static long system_suspend(void *data)
> > +{
> > +    int status;
> > +    unsigned long flags;
> > +
> > +    BUG_ON(system_state !=3D SYS_STATE_active);
> > +
> > +    system_state =3D SYS_STATE_suspend;
> > +    freeze_domains();
> > +    scheduler_disable();
> > +
> > +    /*
> > +     * Non-boot CPUs have to be disabled on suspend and enabled on res=
ume
> > +     * (hotplug-based mechanism). Disabling non-boot CPUs will lead to=
 PSCI
> > +     * CPU_OFF to be called by each non-boot CPU. Depending on the und=
erlying
> > +     * platform capabilities, this may lead to the physical powering d=
own of
> > +     * CPUs. Tested on Xilinx Zynq Ultrascale+ MPSoC (including power =
down of
> > +     * each non-boot CPU).
>
> I don't think that the last part of the comment is relevant in upstream.

I=E2=80=99ll drop that part, as it=E2=80=99s not relevant for upstream.

>
> > +     */
> > +    status =3D disable_nonboot_cpus();
> > +    if ( status )
> > +    {
> > +        system_state =3D SYS_STATE_resume;
> > +        goto resume_nonboot_cpus;
> > +    }
> > +
> > +    time_suspend();
> > +
> > +    local_irq_save(flags);
> > +    status =3D gic_suspend();
> > +    if ( status )
> > +    {
> > +        system_state =3D SYS_STATE_resume;
> > +        goto resume_irqs;
> > +    }
> > +
> > +    printk("Xen suspending...\n");
> > +
> > +    console_start_sync();
> > +    status =3D console_suspend();
> > +    if ( status )
> > +    {
> > +        dprintk(XENLOG_ERR, "Failed to suspend the console, err=3D%d\n=
", status);
> > +        system_state =3D SYS_STATE_resume;
> > +        goto resume_console;
> > +    }
> > +
> > +    /*
> > +     * Enable identity mapping before entering suspend to simplify
> > +     * the resume path
> > +     */
> > +    update_boot_mapping(true);
> > +
>
> This puzzles me. I expected actually PSCI suspend call here.
>
> > +    system_state =3D SYS_STATE_resume;
> > +    update_boot_mapping(false);
> > +
> > + resume_console:
> > +    console_resume();
> > +    console_end_sync();
> > +
> > +    gic_resume();
> > +
> > + resume_irqs:
> > +    local_irq_restore(flags);
> > +    time_resume();
> > +
> > + resume_nonboot_cpus:
> > +    /*
> > +     * The rcu_barrier() has to be added to ensure that the per cpu ar=
ea is
> > +     * freed before a non-boot CPU tries to initialize it (_free_percp=
u_area()
> > +     * has to be called before the init_percpu_area()). This scenario =
occurs
> > +     * when non-boot CPUs are hot-unplugged on suspend and hotplugged =
on resume.
> > +     */
> > +    rcu_barrier();
> > +    enable_nonboot_cpus();
> > +    scheduler_enable();
> > +    thaw_domains();
> > +
> > +    system_state =3D SYS_STATE_active;
> > +
> > +    /* The resume of hardware domain should always follow Xen's resume=
. */
> > +    domain_resume(hardware_domain);
> > +
> > +    printk("Resume (status %d)\n", status);
> > +    return status;
> > +}
> > +
> > +int host_system_suspend(void)
> > +{
> > +    int status;
> > +
> > +    /* TODO: drop check after verification that features can work toge=
ther */
> > +    if ( llc_coloring_enabled )
> > +    {
> > +        dprintk(XENLOG_ERR,
> > +                "System suspend is not supported with LLC_COLORING ena=
bled\n");
> > +        return -ENOSYS;
> > +    }
> > +
> > +    /*
> > +     * system_suspend should be called when Dom0 finalizes the suspend
> > +     * procedure from its boot core (VCPU#0). However, Dom0's VCPU#0 c=
ould
> > +     * be mapped to any PCPU (this function could be executed by any P=
CPU).
> > +     * The suspend procedure has to be finalized by the PCPU#0 (non-bo=
ot
> > +     * PCPUs will be disabled during the suspend).
> > +     */
> > +    status =3D continue_hypercall_on_cpu(0, system_suspend, NULL);
> > +
> > +    /*
> > +     * If an error happened, there is nothing that needs to be done he=
re
> > +     * because the system_suspend always returns in fully functional s=
tate
> > +     * no matter what the outcome of suspend procedure is. If the syst=
em
> > +     * suspended successfully the function will return 0 after the res=
ume.
> > +     * Otherwise, if an error is returned it means Xen did not suspend=
ed,
> > +     * but it is still in the same state as if the system_suspend was =
never
> > +     * called. We dump a debug message in case of an error for debuggi=
ng/
> > +     * logging purpose.
> > +     */
> > +    if ( status )
> > +        dprintk(XENLOG_ERR, "Failed to suspend, errno=3D%d\n", status)=
;
> > +
> > +    return status;
> > +}
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> > index 67d369a8a2..757e719ea7 100644
> > --- a/xen/arch/arm/vpsci.c
> > +++ b/xen/arch/arm/vpsci.c
> > @@ -4,6 +4,7 @@
> >  #include <xen/types.h>
> >
> >  #include <asm/current.h>
> > +#include <asm/suspend.h>
> >  #include <asm/vgic.h>
> >  #include <asm/vpsci.h>
> >  #include <asm/event.h>
> > @@ -214,9 +215,10 @@ static int32_t do_psci_1_0_system_suspend(register=
_t epoint, register_t cid)
> >      struct vcpu *v;
> >      struct domain *d =3D current->domain;
> >
> > -    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> > +#ifndef CONFIG_SYSTEM_SUSPEND
> >      if ( is_hardware_domain(d) )
> >          return PSCI_NOT_SUPPORTED;
> > +#endif
> >
> >      /* Ensure that all CPUs other than the calling one are offline */
> >      domain_lock(d);
> > @@ -234,6 +236,14 @@ static int32_t do_psci_1_0_system_suspend(register=
_t epoint, register_t cid)
> >      if ( rc )
> >          return PSCI_DENIED;
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    if ( is_hardware_domain(d) && host_system_suspend() )
> > +    {
> > +        domain_resume_nopause(d);
> > +        return PSCI_DENIED;
> > +    }
> > +#endif
> > +
> >      rc =3D do_setup_vcpu_ctx(current, epoint, cid);
> >      if ( rc !=3D PSCI_SUCCESS )
> >      {
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index c3609b0cb0..414a691242 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1311,7 +1311,11 @@ int domain_shutdown(struct domain *d, u8 reason)
> >          d->shutdown_code =3D reason;
> >      reason =3D d->shutdown_code;
> >
> > +#if defined(CONFIG_SYSTEM_SUSPEND) && defined(CONFIG_ARM)
> > +    if ( reason !=3D SHUTDOWN_suspend && is_hardware_domain(d) )
> > +#else
> >      if ( is_hardware_domain(d) )
> > +#endif
> >          hwdom_shutdown(reason);
> >
> >      if ( d->is_shutting_down )
>
> --
> WBR, Volodymyr

Best regards,
Mykola

