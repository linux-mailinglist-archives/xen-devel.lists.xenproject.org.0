Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E20B3C9F6
	for <lists+xen-devel@lfdr.de>; Sat, 30 Aug 2025 12:11:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102786.1455035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usIXC-00050v-Kl; Sat, 30 Aug 2025 10:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102786.1455035; Sat, 30 Aug 2025 10:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usIXC-0004z1-DZ; Sat, 30 Aug 2025 10:10:10 +0000
Received: by outflank-mailman (input) for mailman id 1102786;
 Sat, 30 Aug 2025 10:10:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IC44=3K=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1usIXA-0004yv-UT
 for xen-devel@lists.xenproject.org; Sat, 30 Aug 2025 10:10:09 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8112f494-8589-11f0-8adc-4578a1afcccb;
 Sat, 30 Aug 2025 12:10:07 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-55f48cb7db9so2719048e87.3
 for <xen-devel@lists.xenproject.org>; Sat, 30 Aug 2025 03:10:07 -0700 (PDT)
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
X-Inumbo-ID: 8112f494-8589-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756548607; x=1757153407; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdWvBlPzDTISq2OilfBzTXmKc6jerzQ2dZixXAtq0cI=;
        b=Yy13VEiD3CX3n1CVNlqfDAUPeUygsJuA+0yeDhEP8Hsx8c/3crSUZ5v7I43SK2FPpJ
         P7zMW5MU8mTQEsTJerUUrw8v0pQF9d8y1CDqNF+l+aiN/UA8GbycAPbt1gmAkFKqp5B6
         0zmKKRhDB100VqhWijpW8w6Ivyc1sNB27u7htSuFI3c1DSWDsjQCGE8q/874xybqJXgB
         axAXR2pgBNCBNSQBFr+VijMY2i/lMAR8M9S+AbgXy5Mv2NJr9EwwJxhnQMOYkt4uiIjK
         wNws4Cu1dgS0FEz+A6xo/hf4t6BtjGZXK56yRCGOZG/UzbcVzph0eGydsowyR1HY/0cJ
         2Crw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756548607; x=1757153407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdWvBlPzDTISq2OilfBzTXmKc6jerzQ2dZixXAtq0cI=;
        b=rBfrBtjMRGp5ozFqakgCDJEtjq5zgspaHSumKtxknand1eixK5aVzxKzng0Uv3uPY9
         hgd6wCGn5ghDNBQAzYCHcisyH58FxXVLtzIe7g3NnWYqUgQPeNu4iXmZC4iguacWkgbW
         xLqtODG1YS8sJtIX/sAEu6mEXodjzQyQDljXq/ziBV/oGPnuqNxh19eHf/MUSmlC5r9p
         OiSae+ygnEvYaIVlo4catKqiBC28oz6gZq2frudExZJsxq+rXlPslnPt90aO1NgI1E8O
         I6C5b0lpzbqAgSNukfzi377NlMcb2SGz+mL8IPVhRSXP5z1oOCCzyXq4HkiqrlJ/N3n6
         7TfA==
X-Gm-Message-State: AOJu0Ywr4l9kHrw1ec/Huz8VcMI0y5c9OKXMrb3rzQ3X8O0tBq6CvOxl
	8I8p1WBmnZ7iVB2HHlZg8VoDzpurUS790MBcf37h+Ulfz20ZkrfRFhLUARZopscaaTnk6tSJ8Q+
	6X34wQvvA4vcC/SJpIm7mvuKyE7Grq+yNMs54
X-Gm-Gg: ASbGnctpxtLiBBSj2v23PERYKrjeWSHzKHOBuVQaFcF572boexmD/e/UrTqmVw7hrC6
	Txl1PWgLM48Gan/J89YvPZckHVmiAx6Pqy9OqdTw0t2PXruIaHRROnoafpZgv2HkS415hUabdzM
	AIqZXoYQO5KyXv6r7ltSvS8yxxx8oERg0SVozeHt7T+cJpnMvQyiDypez3vUTUh5KFtndwF/dOw
	YdRTAiHkqP9f4F9
X-Google-Smtp-Source: AGHT+IFs4uAGNe/q9GPEWF31kEW3QtOaDCabcLhYye28KkzzcpVCRRPpx/1+DTD6PVHxT3vTiDVsBdgxCAHasKs+gmQ=
X-Received: by 2002:a05:6512:3988:b0:55b:8afb:e644 with SMTP id
 2adb3069b0e04-55f708ec8d0mr542531e87.31.1756548606189; Sat, 30 Aug 2025
 03:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756392094.git.mykola_kvach@epam.com> <bb53d9911b00879c7b25f5258d0e3e48005671f9.1756392094.git.mykola_kvach@epam.com>
 <87ecsvz9sx.fsf@epam.com>
In-Reply-To: <87ecsvz9sx.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Sat, 30 Aug 2025 13:09:54 +0300
X-Gm-Features: Ac12FXzwUHekJGNG03bmvJ6CSB6f4yKfhOE5oLhitGyBrM4qW7jc-R80oYpX3aI
Message-ID: <CAGeoDV_87Q--e8po+_NCw7-uR1ZL3x9f1-TpWwGDAfJp0M-Aew@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <Mykola_Kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volodymyr,

On Thu, Aug 28, 2025 at 7:32=E2=80=AFPM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
>
> Hi Mykola,
>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface=
,
> > allowing guests to request suspend via the PSCI v1.0 SYSTEM_SUSPEND cal=
l
> > (both 32-bit and 64-bit variants).
> >
> > Implementation details:
> > - Add SYSTEM_SUSPEND function IDs to PSCI definitions
> > - Trap and handle SYSTEM_SUSPEND in vPSCI
> > - Allow only non-hardware domains to invoke SYSTEM_SUSPEND; return
> >   PSCI_NOT_SUPPORTED for the hardware domain to avoid halting the syste=
m
> >   in hwdom_shutdown() via domain_shutdown
> > - Require all secondary VCPUs of the calling domain to be offline befor=
e
> >   suspend, as mandated by the PSCI specification
> >
> > The arch_domain_resume() function is an architecture-specific hook that=
 is
> > invoked during domain resume to perform any necessary setup or restorat=
ion
> > steps required by the platform.
> >
> > The new vpsci_vcpu_up_prepare() helper is called on the resume path to =
set up
> > the vCPU context (such as entry point, some system regs and context ID)=
 before
> > resuming a suspended guest. This keeps ARM/vPSCI-specific logic out of =
common
> > code and avoids intrusive changes to the generic resume flow.
> >
> > Usage:
> >
> > For Linux-based guests, suspend can be initiated with:
> >     echo mem > /sys/power/state
> > or via:
> >     systemctl suspend
> >
> > Resuming the guest is performed from control domain using:
> >       xl resume <domain>
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> But check a small comment below
>
> > ---
> > Changes in V11:
> > - introduce arch_domain_resume() and vpsci_vcpu_up_prepare(), which are=
 now
> > called on the resume path to avoid extra modifications to common code.
> > The vCPU context is now updated during domain resume.
> >
> > Changes in V10:
> > - small changes to the commit message reflect updates introduced in thi=
s
> >   version of the patch.
> > - Comments are improved, clarified, and expanded, especially regarding =
PSCI
> >   requirements and context handling.
> > - An ARM-specific helper (domain_resume_nopause_helper)
> > - gprintk() and PRIregister are used for logging in vPSCI code.
> > - An isb() is added before p2m_save_state
> > - The is_64bit_domain check is dropped when masking the upper part of e=
ntry
> >   point and cid for SMC32 SYSTEM_SUSPEND PSCI calls
> >
> > Changes in V9:
> > - no functional changes
> > - cosmetic chnages after review
> > - enhance commit message and add extra comment to the code after review
> >
> > Changes in V8:
> > - GIC and virtual timer context must be saved when the domain suspends
> > - rework locking
> > - minor changes after code review
> >
> > Changes in V7:
> > - add proper locking
> > - minor changes after code review
> >
> > Changes in V6:
> > - skip execution of ctxt_switch_from for vcpu that is in paused domain
> > - add implementation of domain_resume without domain_pause
> > - add helper function to determine if vcpu is suspended or not
> > - ignore upper 32 bits of argument values when the domain is 64-bit
> >   and calls the SMC32 SYSTEM_SUSPEND function
> > - cosmetic changes after review
> >
> > Changes in V5:
> > - don't use standby mode, restore execution in a provided by guest poin=
t
> > - move checking that all CPUs, except current one, are offline to after
> >   pausing the vCPUs
> > - provide ret status from arch_domain_shutdown and handle it in
> >   domain_shutdown
> > - adjust VPSCI_NR_FUNCS to reflect the number of newly added PSCI funct=
ions
> >
> > Changes in V4:
> > Dropped all changes related to watchdog, domain is marked as shutting
> > down in domain_shutdown and watchdog timeout handler won't trigger
> > because of it.
> >
> > Previous versions included code to manage Xen watchdog timers during su=
spend,
> > but this was removed. When a guest OS starts the Xen watchdog (either v=
ia the
> > kernel driver or xenwatchdogd), it is responsible for managing that sta=
te
> > across suspend/resume. On Linux, the Xen kernel driver properly stops t=
he
> > watchdog during suspend. However, when xenwatchdogd is used instead, su=
spend
> > handling is incomplete, potentially leading to watchdog-triggered reset=
s on
> > resume. Xen leaves watchdog handling to the guest OS and its services.
> >
> > Dropped all changes related to VCPU context, because instead domain_shu=
tdown
> > is used, so we don't need any extra changes for suspending domain.
> >
> > Changes in V3:
> > Dropped all domain flags and related code (which touched common functio=
ns like
> > vcpu_unblock), keeping only the necessary changes for Xen suspend/resum=
e, i.e.
> > suspend/resume is now fully supported only for the hardware domain.
> > Proper support for domU suspend/resume will be added in a future patch.
> > This patch does not yet include VCPU context reset or domain context
> > restoration in VCPU.
> > ---
> >  xen/arch/arm/domain.c                 |  22 +++++
> >  xen/arch/arm/include/asm/domain.h     |   6 ++
> >  xen/arch/arm/include/asm/perfc_defn.h |   1 +
> >  xen/arch/arm/include/asm/psci.h       |   2 +
> >  xen/arch/arm/include/asm/vpsci.h      |   5 +-
> >  xen/arch/arm/vpsci.c                  | 114 +++++++++++++++++++++-----
> >  xen/arch/ppc/stubs.c                  |   5 ++
> >  xen/arch/riscv/stubs.c                |   5 ++
> >  xen/arch/x86/domain.c                 |   5 ++
> >  xen/common/domain.c                   |   9 ++
> >  xen/include/xen/domain.h              |   2 +
> >  11 files changed, 156 insertions(+), 20 deletions(-)
> >
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > index 863ae18157..6fd73eedde 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -12,6 +12,8 @@
> >  #include <xen/softirq.h>
> >  #include <xen/wait.h>
> >
> > +#include <public/sched.h>
> > +
> >  #include <asm/arm64/sve.h>
> >  #include <asm/cpuerrata.h>
> >  #include <asm/cpufeature.h>
> > @@ -27,6 +29,7 @@
> >  #include <asm/tee/tee.h>
> >  #include <asm/vfp.h>
> >  #include <asm/vgic.h>
> > +#include <asm/vpsci.h>
> >  #include <asm/vtimer.h>
> >
> >  #include "vpci.h"
> > @@ -880,6 +883,25 @@ void arch_domain_creation_finished(struct domain *=
d)
> >      p2m_domain_creation_finished(d);
> >  }
> >
> > +int arch_domain_resume(struct domain *d)
> > +{
> > +    int rc;
> > +    typeof(d->arch.resume_ctx) *ctx =3D &d->arch.resume_ctx;
> > +
> > +    if ( !d->is_shutting_down || d->shutdown_code !=3D SHUTDOWN_suspen=
d )
> > +    {
> > +        dprintk(XENLOG_WARNING,
> > +                "%pd: Invalid domain state for resume: is_shutting_dow=
n=3D%d, shutdown_code=3D%d\n",
> > +                d, d->is_shutting_down, d->shutdown_code);
> > +        return -EINVAL;
> > +    }
>
> This check probably can go into common domain_resume() function, as
> there is nothing arch-specific in here. Probably this can be done during
> commit, to save us from v12? If commiters are okay with this.

It is more complicated than I expected, because this function is also used
for the "soft-reset" action (see domain_soft_reset). Currently, it may only
be called in the x86 case, but as I understand it, almost for any event an
action can be rewritten:
https://xenbits.xen.org/docs/unstable/man/xl.cfg.5.html#Event-Actions.

It also appears that domain_resume() is used to clean up state after
domain_shutdown(). So, if I simply add a condition to check for a specific
shutdown_code, it could break the "soft-reset" functionality.

This needs a deeper investigation. I propose to leave this check inside
arch_domain_resume() for now.

>
> > +
> > +    rc =3D vpsci_vcpu_up_prepare(ctx->wake_cpu , ctx->ep, ctx->cid);
> > +    memset(ctx, 0, sizeof(*ctx));
> > +
> > +    return rc;
> > +}
> > +
> >  static int is_guest_pv32_psr(uint32_t psr)
> >  {
> >      switch (psr & PSR_MODE_MASK)
> > diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/a=
sm/domain.h
> > index a3487ca713..68185fc4d6 100644
> > --- a/xen/arch/arm/include/asm/domain.h
> > +++ b/xen/arch/arm/include/asm/domain.h
> > @@ -121,6 +121,12 @@ struct arch_domain
> >      void *tee;
> >  #endif
> >
> > +    struct resume_info {
> > +        register_t ep;
> > +        register_t cid;
> > +        struct vcpu *wake_cpu;
> > +    } resume_ctx;
> > +
> >  }  __cacheline_aligned;
> >
> >  struct arch_vcpu
> > diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/inclu=
de/asm/perfc_defn.h
> > index effd25b69e..8dfcac7e3b 100644
> > --- a/xen/arch/arm/include/asm/perfc_defn.h
> > +++ b/xen/arch/arm/include/asm/perfc_defn.h
> > @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system=
_reset")
> >  PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
> >  PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
> >  PERFCOUNTER(vpsci_features,            "vpsci: features")
> > +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
> >
> >  PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
> >
> > diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm=
/psci.h
> > index 4780972621..48a93e6b79 100644
> > --- a/xen/arch/arm/include/asm/psci.h
> > +++ b/xen/arch/arm/include/asm/psci.h
> > @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
> >  #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
> >  #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
> >  #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
> > +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
> >
> >  #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
> >  #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
> >  #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
> > +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
> >
> >  /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
> >  #define PSCI_0_2_AFFINITY_LEVEL_ON      0
> > diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/as=
m/vpsci.h
> > index 0cca5e6830..d790ab3715 100644
> > --- a/xen/arch/arm/include/asm/vpsci.h
> > +++ b/xen/arch/arm/include/asm/vpsci.h
> > @@ -23,12 +23,15 @@
> >  #include <asm/psci.h>
> >
> >  /* Number of function implemented by virtual PSCI (only 0.2 or later) =
*/
> > -#define VPSCI_NR_FUNCS  12
> > +#define VPSCI_NR_FUNCS  14
> >
> >  /* Functions handle PSCI calls from the guests */
> >  bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
> >  bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid);
> >
> > +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> > +                          register_t context_id);
> > +
> >  #endif /* __ASM_VPSCI_H__ */
> >
> >  /*
> > diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> > index 7ba9ccd94b..50cf5fd96c 100644
> > --- a/xen/arch/arm/vpsci.c
> > +++ b/xen/arch/arm/vpsci.c
> > @@ -10,30 +10,16 @@
> >
> >  #include <public/sched.h>
> >
> > -static int do_common_cpu_on(register_t target_cpu, register_t entry_po=
int,
> > -                            register_t context_id)
> > +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> > +                   register_t context_id)
> >  {
> > -    struct vcpu *v;
> > -    struct domain *d =3D current->domain;
> > -    struct vcpu_guest_context *ctxt;
> >      int rc;
> > +    struct domain *d =3D current->domain;
> >      bool is_thumb =3D entry_point & 1;
> > -    register_t vcpuid;
> > -
> > -    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> > -
> > -    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> > -        return PSCI_INVALID_PARAMETERS;
> > -
> > -    /* THUMB set is not allowed with 64-bit domain */
> > -    if ( is_64bit_domain(d) && is_thumb )
> > -        return PSCI_INVALID_ADDRESS;
> > -
> > -    if ( !test_bit(_VPF_down, &v->pause_flags) )
> > -        return PSCI_ALREADY_ON;
> > +    struct vcpu_guest_context *ctxt;
> >
> >      if ( (ctxt =3D alloc_vcpu_guest_context()) =3D=3D NULL )
> > -        return PSCI_DENIED;
> > +        return -ENOMEM;
> >
> >      vgic_clear_pending_irqs(v);
> >
> > @@ -76,8 +62,37 @@ static int do_common_cpu_on(register_t target_cpu, r=
egister_t entry_point,
> >      free_vcpu_guest_context(ctxt);
> >
> >      if ( rc < 0 )
> > +        return rc;
> > +
> > +    return 0;
> > +}
> > +
> > +static int do_common_cpu_on(register_t target_cpu, register_t entry_po=
int,
> > +                            register_t context_id)
> > +{
> > +    struct vcpu *v;
> > +    struct domain *d =3D current->domain;
> > +    int rc;
> > +    bool is_thumb =3D entry_point & 1;
> > +    register_t vcpuid;
> > +
> > +    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> > +
> > +    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> > +        return PSCI_INVALID_PARAMETERS;
> > +
> > +    /* THUMB set is not allowed with 64-bit domain */
> > +    if ( is_64bit_domain(d) && is_thumb )
> > +        return PSCI_INVALID_ADDRESS;
> > +
> > +    if ( !test_bit(_VPF_down, &v->pause_flags) )
> > +        return PSCI_ALREADY_ON;
> > +
> > +    rc =3D vpsci_vcpu_up_prepare(v, entry_point, context_id);
> > +    if ( rc )
> >          return PSCI_DENIED;
> >
> > +    vgic_clear_pending_irqs(v);
> >      vcpu_wake(v);
> >
> >      return PSCI_SUCCESS;
> > @@ -197,6 +212,48 @@ static void do_psci_0_2_system_reset(void)
> >      domain_shutdown(d,SHUTDOWN_reboot);
> >  }
> >
> > +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_=
t cid)
> > +{
> > +    int32_t rc;
> > +    struct vcpu *v;
> > +    struct domain *d =3D current->domain;
> > +    bool is_thumb =3D epoint & 1;
> > +
> > +    /* THUMB set is not allowed with 64-bit domain */
> > +    if ( is_64bit_domain(d) && is_thumb )
> > +        return PSCI_INVALID_ADDRESS;
> > +
> > +    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> > +    if ( is_hardware_domain(d) )
> > +        return PSCI_NOT_SUPPORTED;
> > +
> > +    /* Ensure that all CPUs other than the calling one are offline */
> > +    domain_lock(d);
> > +    for_each_vcpu ( d, v )
> > +    {
> > +        if ( v !=3D current && is_vcpu_online(v) )
> > +        {
> > +            domain_unlock(d);
> > +            return PSCI_DENIED;
> > +        }
> > +    }
> > +    domain_unlock(d);
> > +
> > +    rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> > +    if ( rc )
> > +        return PSCI_DENIED;
> > +
> > +    d->arch.resume_ctx.ep =3D epoint;
> > +    d->arch.resume_ctx.cid =3D cid;
> > +    d->arch.resume_ctx.wake_cpu =3D current;
> > +
> > +    gprintk(XENLOG_DEBUG,
> > +            "SYSTEM_SUSPEND requested, epoint=3D0x%"PRIregister", cid=
=3D0x%"PRIregister,
> > +            epoint, cid);
> > +
> > +    return rc;
> > +}
> > +
> >  static int32_t do_psci_1_0_features(uint32_t psci_func_id)
> >  {
> >      /* /!\ Ordered by function ID and not name */
> > @@ -214,6 +271,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_f=
unc_id)
> >      case PSCI_0_2_FN32_SYSTEM_OFF:
> >      case PSCI_0_2_FN32_SYSTEM_RESET:
> >      case PSCI_1_0_FN32_PSCI_FEATURES:
> > +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> > +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> >      case ARM_SMCCC_VERSION_FID:
> >          return 0;
> >      default:
> > @@ -344,6 +403,23 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs,=
 uint32_t fid)
> >          return true;
> >      }
> >
> > +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> > +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> > +    {
> > +        register_t epoint =3D PSCI_ARG(regs, 1);
> > +        register_t cid =3D PSCI_ARG(regs, 2);
> > +
> > +        if ( fid =3D=3D PSCI_1_0_FN32_SYSTEM_SUSPEND )
> > +        {
> > +            epoint &=3D GENMASK(31, 0);
> > +            cid &=3D GENMASK(31, 0);
> > +        }
> > +
> > +        perfc_incr(vpsci_system_suspend);
> > +        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid))=
;
> > +        return true;
> > +    }
> > +
> >      default:
> >          return false;
> >      }
> > diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
> > index bdaf474c5c..0db0627b5c 100644
> > --- a/xen/arch/ppc/stubs.c
> > +++ b/xen/arch/ppc/stubs.c
> > @@ -224,6 +224,11 @@ void arch_domain_creation_finished(struct domain *=
d)
> >      BUG_ON("unimplemented");
> >  }
> >
> > +int arch_domain_resume(struct domain *d)
> > +{
> > +    return 0;
> > +}
> > +
> >  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
> >  {
> >      BUG_ON("unimplemented");
> > diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> > index 1a8c86cd8d..52532ae14d 100644
> > --- a/xen/arch/riscv/stubs.c
> > +++ b/xen/arch/riscv/stubs.c
> > @@ -198,6 +198,11 @@ void arch_domain_creation_finished(struct domain *=
d)
> >      BUG_ON("unimplemented");
> >  }
> >
> > +int arch_domain_resume(struct domain *d)
> > +{
> > +    return 0;
> > +}
> > +
> >  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
> >  {
> >      BUG_ON("unimplemented");
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index 19fd86ce88..94a06bc697 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -1138,6 +1138,11 @@ void arch_domain_creation_finished(struct domain=
 *d)
> >          hvm_domain_creation_finished(d);
> >  }
> >
> > +int arch_domain_resume(struct domain *d)
> > +{
> > +    return 0;
> > +}
> > +
> >  #ifdef CONFIG_COMPAT
> >  #define xen_vcpu_guest_context vcpu_guest_context
> >  #define fpu_ctxt fpu_ctxt.x
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 104e917f07..d73a88ced5 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1352,6 +1352,7 @@ int domain_shutdown(struct domain *d, u8 reason)
> >  void domain_resume(struct domain *d)
> >  {
> >      struct vcpu *v;
> > +    int rc;
> >
> >      /*
> >       * Some code paths assume that shutdown status does not get reset =
under
> > @@ -1359,6 +1360,14 @@ void domain_resume(struct domain *d)
> >       */
> >      domain_pause(d);
> >
> > +    rc =3D arch_domain_resume(d);
> > +    if ( rc )
> > +    {
> > +        domain_unpause(d);
> > +        printk("%pd: Failed to resume domain (ret %d)\n", d, rc);
> > +        return;
> > +    }
> > +
> >      spin_lock(&d->shutdown_lock);
> >
> >      d->is_shutting_down =3D d->is_shut_down =3D 0;
> > diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> > index e10baf2615..5f77ffadf1 100644
> > --- a/xen/include/xen/domain.h
> > +++ b/xen/include/xen/domain.h
> > @@ -109,6 +109,8 @@ int arch_domain_soft_reset(struct domain *d);
> >
> >  void arch_domain_creation_finished(struct domain *d);
> >
> > +int arch_domain_resume(struct domain *d);
> > +
> >  void arch_p2m_set_access_required(struct domain *d, bool access_requir=
ed);
> >
> >  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c);
>
> --
> WBR, Volodymyr

Best regards,
Mykola

