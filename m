Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1258B3F4E6
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 07:58:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105648.1456511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utK0i-0002Ky-Uu; Tue, 02 Sep 2025 05:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105648.1456511; Tue, 02 Sep 2025 05:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utK0i-0002JW-Ow; Tue, 02 Sep 2025 05:56:52 +0000
Received: by outflank-mailman (input) for mailman id 1105648;
 Tue, 02 Sep 2025 05:56:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/no=3N=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utK0h-0002JQ-H9
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 05:56:51 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d75d31b-87c1-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 07:56:49 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-55f6b0049fbso3902728e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 22:56:48 -0700 (PDT)
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
X-Inumbo-ID: 9d75d31b-87c1-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756792608; x=1757397408; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBtYL/xnnKUkcWrtYrM1qKOpz0HGqjaiTcUTa+dApB4=;
        b=C68xT3vYHmAZLbz5ueVCUgObUYU0bueRLyhI5QXj7luym7ThMZOxfFGaRiE4zdSbk1
         Hlg6D+KZHgqDm0CV3P/L85NKO5Vpd0Eo1kZL4509lSIQkHe0EnuQ1G7ValtFdYOj69Sf
         +YIXhf3tA/K0A2W1wN7tvIAuOX7ib7kPwYEy3AAY9kX2wZLBEKPZPJT5UHoLfN/qcJ9L
         wYHG+O/gzFIoxB+aFDaoJCYWse8sYs1lLDv+CKw6fOfKKO/QkdeBiUwbhMdmXkrwm2es
         SvzQiP8pXwZbhkfK4C5NKsItzjyqWS5UJ/oVj1FEzbhr+FhA8wojBcA2+sBPeVG0a1jc
         EcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756792608; x=1757397408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBtYL/xnnKUkcWrtYrM1qKOpz0HGqjaiTcUTa+dApB4=;
        b=lBSbgeoeBj4DoQfARpgzLvXnHkH/oV/BUb8S5ebW0yyG089wdnHgTesNxzw2DxwYDf
         jjvU1ZWFLCkn3Esr6FQkTtHUvAZ8zUIWP+3Ehu6TLypdMjtWvF1XMxrZ3acSlgyXkReq
         6gy6lwDH2IhnbAUGJsBmcp0lTz8S+4+Bjo51TcaE+9yUI3u7qbC2W8oRKVW3PEYbAgeK
         7xkXL6MSCUOleurw3M0MQp7mjdEk8M9OurU4AoHdh3dPYl8em0qn8F7vqAG77jI1H9Pm
         z24/lwid8tDydKrNazm5pZ6i3aPHgPRg0ekC9ZEnoFjSMc3erYWqyyrqTaekeNjZj7U1
         V/uQ==
X-Gm-Message-State: AOJu0YznU6/UGJY/v5G9NjHlTQnf2wBCxwZ5JIqW/VnAvutHHmKfNrZC
	VjnvOB6p1u6FU0Xh36Lf7F40VXnAlRTfkSiBwL8qZYjc22vJkzyptfxFUnacka0Pdyk8cOC0jlg
	KXXi+BMWjCYU5y2t4XfigfQRtAUiPVYZ22jdc
X-Gm-Gg: ASbGncsqszRwb55qhjpLJBERJ4Q9Rnl00W7/HUsS5bqu/pRTtIdROYU6Qh2q/+Cmu9U
	ftSuza/xyLQ3sDE4sPjWXyoVbV01I5tSOCnKVHzy+Dfl+Gq187D7y7uE/UGG5J30FIC4fLy6N0A
	a+pxiZz8HrGU1SOyO2ozoEiq0ne0LNmcfsU14R91HqshYs9GXlecnF5AhzF2UrEIFqC/wjk/aiG
	4r9Ug==
X-Google-Smtp-Source: AGHT+IFXcha/5CjsSsuttar5UKQAn3KJjmfTCEAK4htexyH3ZbhMkBqZJ3iK7kJF9+jHb2ifAUwGJKcdw6UkXgAmP18=
X-Received: by 2002:a05:6512:689:b0:55b:574c:6bf9 with SMTP id
 2adb3069b0e04-55f708ec420mr3178840e87.29.1756792607763; Mon, 01 Sep 2025
 22:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756763487.git.mykola_kvach@epam.com> <547196292a007ec2bbedd52036e8f8a0cc69c4ea.1756763487.git.mykola_kvach@epam.com>
In-Reply-To: <547196292a007ec2bbedd52036e8f8a0cc69c4ea.1756763487.git.mykola_kvach@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 2 Sep 2025 08:56:36 +0300
X-Gm-Features: Ac12FXxofPWhi2r78HN1CsICKYUEsvS2VLmzkBIXyWqAyVs6ptTW6cFeyW6wtfg
Message-ID: <CAGeoDV9zDHZ3+h6HSqS1SSzswy4hChdQ+Wfp-z8qOZTY6ZLxJw@mail.gmail.com>
Subject: Re: [PATCH v6 11/13] xen/arm: Add support for system suspend
 triggered by hardware domain
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai <mykyta_poturai@epam.com>, 
	Mykola Kvach <mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

This is the first commit in the second part of the patch series that
cannot exist without part 1. All previous commits are independent and
do not depend on part 1.

On Tue, Sep 2, 2025 at 1:10=E2=80=AFAM Mykola Kvach <xakep.amatop@gmail.com=
> wrote:
>
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>
> Trigger Xen suspend when the hardware domain initiates suspend via
> SHUTDOWN_suspend. Redirect system suspend to CPU#0 to ensure the
> suspend logic runs on the boot CPU, as required.
>
> Introduce full suspend/resume infrastructure gated by CONFIG_SYSTEM_SUSPE=
ND,
> including logic to:
>  - disable and enable non-boot physical CPUs
>  - freeze and thaw domains
>  - suspend and resume the GIC, timer, iommu and console
>  - maintain system state before and after suspend
>
> On boot, init_ttbr is normally initialized during secondary CPU hotplug.
> On uniprocessor systems, this would leave init_ttbr uninitialized,
> causing resume to fail. To address this, the boot CPU now sets init_ttbr
> during suspend.
>
> Remove the restriction in the vPSCI interface preventing suspend from the
> hardware domain.
>
> Select HAS_SYSTEM_SUSPEND for ARM_64.
>
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v6:
> - Minor changes in comments.
> - The implementation now uses own tasklet instead of continue_hypercall_o=
n_cpu,
>   as the latter rewrites user registers and would tie system suspend stat=
us
>   to guest suspend status.
> - The order of calls when suspending devices has been updated.
>
> Changes in v5:
> - select HAS_SYSTEM_SUSPEND in ARM_64 instead of ARM
> - check llc_coloring_enabled instead of LLC_COLORING during the selection
>   of HAS_SYSTEM_SUSPEND config
> - call host_system_suspend from guest PSCI system suspend instead of
>   arch_domain_shutdown, reducing the complexity of the new code
> - update some comments
>
> Changes introduced in V4:
>   - drop code for saving and restoring VCPU context (for more information
>     refer part 1 of patch series)
>   - remove IOMMU suspend and resume calls until they will be implemented
>   - move system suspend logic to arch_domain_shutdown, invoked from
>     domain_shutdown
>   - apply minor fixes such as renaming functions, updating comments, and
>     modifying the commit message to reflect these changes
>   - add console_end_sync to resume path after system suspend
>
> Changes introduced in V3:
>   - merge changes from other commits into this patch (previously stashed)=
:
>     1) disable/enable non-boot physical CPUs and freeze/thaw domains duri=
ng
>        suspend/resume
>     2) suspend/resume the timer, GIC, console, IOMMU, and hardware domain
> ---
>  xen/arch/arm/Kconfig               |   1 +
>  xen/arch/arm/include/asm/mm.h      |   2 +
>  xen/arch/arm/include/asm/suspend.h |   2 +
>  xen/arch/arm/mmu/smpboot.c         |   2 +-
>  xen/arch/arm/suspend.c             | 150 +++++++++++++++++++++++++++++
>  xen/arch/arm/vpsci.c               |   9 +-
>  xen/common/domain.c                |   4 +
>  7 files changed, 168 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 5355534f3d..fdad53fd68 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -8,6 +8,7 @@ config ARM_64
>         depends on !ARM_32
>         select 64BIT
>         select HAS_FAST_MULTIPLY
> +       select HAS_SYSTEM_SUSPEND if UNSUPPORTED
>         select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
>
>  config ARM
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.=
h
> index 7a93dad2ed..61e211d087 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -365,6 +365,8 @@ static inline void page_set_xenheap_gfn(struct page_i=
nfo *p, gfn_t gfn)
>      } while ( (y =3D cmpxchg(&p->u.inuse.type_info, x, nx)) !=3D x );
>  }
>
> +void set_init_ttbr(lpae_t *root);
> +
>  #endif /*  __ARCH_ARM_MM__ */
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/as=
m/suspend.h
> index 29eed4ee7f..8d30b01b7c 100644
> --- a/xen/arch/arm/include/asm/suspend.h
> +++ b/xen/arch/arm/include/asm/suspend.h
> @@ -29,6 +29,8 @@ extern struct cpu_context cpu_context;
>  void hyp_resume(void);
>  int prepare_resume_ctx(struct cpu_context *ptr);
>
> +void host_system_suspend(void);
> +
>  #endif /* CONFIG_SYSTEM_SUSPEND */
>
>  #endif /* __ASM_ARM_SUSPEND_H__ */
> diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
> index 37e91d72b7..ff508ecf40 100644
> --- a/xen/arch/arm/mmu/smpboot.c
> +++ b/xen/arch/arm/mmu/smpboot.c
> @@ -72,7 +72,7 @@ static void clear_boot_pagetables(void)
>      clear_table(boot_third);
>  }
>
> -static void set_init_ttbr(lpae_t *root)
> +void set_init_ttbr(lpae_t *root)
>  {
>      /*
>       * init_ttbr is part of the identity mapping which is read-only. So
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index 5093f1bf3d..35b20581f1 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -1,9 +1,159 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>
> +#include <asm/psci.h>
>  #include <asm/suspend.h>
>
> +#include <xen/console.h>
> +#include <xen/cpu.h>
> +#include <xen/llc-coloring.h>
> +#include <xen/sched.h>
> +#include <xen/tasklet.h>
> +
> +/*
> + * TODO list:
> + *  - Decide which domain will trigger system suspend ctl or hw ?
> + *  - Test system suspend with LLC_COLORING enabled and verify functiona=
lity
> + *  - Implement IOMMU suspend/resume handlers and integrate them
> + *    into the suspend/resume path (SMMU)
> + *  - Enable "xl suspend" support on ARM architecture
> + *  - Properly disable Xen timer watchdog from relevant services (init.d=
 left)
> + *  - Add suspend/resume CI test for ARM (QEMU if feasible)
> + *  - Investigate feasibility and need for implementing system suspend o=
n ARM32
> + */
> +
>  struct cpu_context cpu_context;
>
> +/* Xen suspend. Note: data is not used (suspend is the suspend to RAM) *=
/
> +static void cf_check system_suspend(void *data)
> +{
> +    int status;
> +    unsigned long flags;
> +    /* TODO: drop check after verification that features can work togeth=
er */
> +    if ( llc_coloring_enabled )
> +    {
> +        dprintk(XENLOG_ERR,
> +                "System suspend is not supported with LLC_COLORING enabl=
ed\n");
> +        status =3D -ENOSYS;
> +        goto dom_resume;
> +    }
> +
> +    BUG_ON(system_state !=3D SYS_STATE_active);
> +
> +    system_state =3D SYS_STATE_suspend;
> +
> +    printk("Xen suspending...\n");
> +
> +    freeze_domains();
> +    scheduler_disable();
> +
> +    /*
> +     * Non-boot CPUs have to be disabled on suspend and enabled on resum=
e
> +     * (hotplug-based mechanism). Disabling non-boot CPUs will lead to P=
SCI
> +     * CPU_OFF to be called by each non-boot CPU. Depending on the under=
lying
> +     * platform capabilities, this may lead to the physical powering dow=
n of
> +     * CPUs.
> +     */
> +    status =3D disable_nonboot_cpus();
> +    if ( status )
> +    {
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_nonboot_cpus;
> +    }
> +
> +    time_suspend();
> +
> +    console_start_sync();
> +    status =3D console_suspend();
> +    if ( status )
> +    {
> +        dprintk(XENLOG_ERR, "Failed to suspend the console, err=3D%d\n",=
 status);
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_console;
> +    }
> +
> +    local_irq_save(flags);
> +    status =3D gic_suspend();
> +    if ( status )
> +    {
> +        system_state =3D SYS_STATE_resume;
> +        goto resume_irqs;
> +    }
> +
> +    set_init_ttbr(xen_pgtable);
> +
> +    /*
> +     * Enable identity mapping before entering suspend to simplify
> +     * the resume path
> +     */
> +    update_boot_mapping(true);
> +
> +    if ( prepare_resume_ctx(&cpu_context) )
> +    {
> +        status =3D call_psci_system_suspend();
> +        /*
> +         * If suspend is finalized properly by above system suspend PSCI=
 call,
> +         * the code below in this 'if' branch will never execute. Execut=
ion
> +         * will continue from hyp_resume which is the hypervisor's resum=
e point.
> +         * In hyp_resume CPU context will be restored and since link-reg=
ister is
> +         * restored as well, it will appear to return from prepare_resum=
e_ctx.
> +         * The difference in returning from prepare_resume_ctx on system=
 suspend
> +         * versus resume is in function's return value: on suspend, the =
return
> +         * value is a non-zero value, on resume it is zero. That is why =
the
> +         * control flow will not re-enter this 'if' branch on resume.
> +         */
> +        if ( status )
> +            dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=3D%=
d\n",
> +                    status);
> +    }
> +
> +    system_state =3D SYS_STATE_resume;
> +    update_boot_mapping(false);
> +
> +    gic_resume();
> +
> + resume_irqs:
> +    local_irq_restore(flags);
> +
> + resume_console:
> +    console_resume();
> +    console_end_sync();
> +
> +    time_resume();
> +
> + resume_nonboot_cpus:
> +    /*
> +     * The rcu_barrier() has to be added to ensure that the per cpu area=
 is
> +     * freed before a non-boot CPU tries to initialize it (_free_percpu_=
area()
> +     * has to be called before the init_percpu_area()). This scenario oc=
curs
> +     * when non-boot CPUs are hot-unplugged on suspend and hotplugged on=
 resume.
> +     */
> +    rcu_barrier();
> +    enable_nonboot_cpus();
> +    scheduler_enable();
> +    thaw_domains();
> +
> +    system_state =3D SYS_STATE_active;
> +
> +    printk("Resume (status %d)\n", status);
> +
> + dom_resume:
> +    /* The resume of hardware domain should always follow Xen's resume. =
*/
> +    domain_resume(hardware_domain);
> +}
> +
> +static DECLARE_TASKLET(system_suspend_tasklet, system_suspend, NULL);
> +
> +void host_system_suspend(void)
> +{
> +    /*
> +     * system_suspend should be called when hardware domain finalizes th=
e
> +     * suspend procedure from its boot core (VCPU#0). However, Dom0's vC=
PU#0
> +     * could be mapped to any pCPU. The suspend procedure has to be fina=
lized
> +     * by the pCPU#0 (non-boot pCPUs will be disabled during the suspend=
).
> +     */
> +    tasklet_schedule_on_cpu(&system_suspend_tasklet, 0);
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index 22c3a5f544..2f52aba48d 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -4,6 +4,7 @@
>  #include <xen/types.h>
>
>  #include <asm/current.h>
> +#include <asm/suspend.h>
>  #include <asm/vgic.h>
>  #include <asm/vpsci.h>
>  #include <asm/event.h>
> @@ -221,9 +222,10 @@ static int32_t do_psci_1_0_system_suspend(register_t=
 epoint, register_t cid)
>      if ( is_64bit_domain(d) && is_thumb )
>          return PSCI_INVALID_ADDRESS;
>
> -    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> +#ifndef CONFIG_SYSTEM_SUSPEND
>      if ( is_hardware_domain(d) )
>          return PSCI_NOT_SUPPORTED;
> +#endif
>
>      /* Ensure that all CPUs other than the calling one are offline */
>      domain_lock(d);
> @@ -249,6 +251,11 @@ static int32_t do_psci_1_0_system_suspend(register_t=
 epoint, register_t cid)
>              "SYSTEM_SUSPEND requested, epoint=3D0x%"PRIregister", cid=3D=
0x%"PRIregister"\n",
>              epoint, cid);
>
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    if ( is_hardware_domain(d) )
> +        host_system_suspend();
> +#endif
> +
>      return rc;
>  }
>
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 667017c5e1..5e224740d3 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1317,7 +1317,11 @@ int domain_shutdown(struct domain *d, u8 reason)
>          d->shutdown_code =3D reason;
>      reason =3D d->shutdown_code;
>
> +#if defined(CONFIG_SYSTEM_SUSPEND) && defined(CONFIG_ARM)
> +    if ( reason !=3D SHUTDOWN_suspend && is_hardware_domain(d) )
> +#else
>      if ( is_hardware_domain(d) )
> +#endif
>          hwdom_shutdown(reason);
>
>      if ( d->is_shutting_down )
> --
> 2.48.1
>

Best regards,
Mykola

