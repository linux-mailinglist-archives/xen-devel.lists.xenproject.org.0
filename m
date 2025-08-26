Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF6BB3582E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 11:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094129.1449479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqpg2-0002ob-AF; Tue, 26 Aug 2025 09:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094129.1449479; Tue, 26 Aug 2025 09:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqpg2-0002mj-6n; Tue, 26 Aug 2025 09:09:14 +0000
Received: by outflank-mailman (input) for mailman id 1094129;
 Tue, 26 Aug 2025 09:09:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/mc=3G=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uqpfz-0002md-O5
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 09:09:12 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51560faf-825c-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 11:09:06 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-55f46ec2e00so1282133e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 02:09:06 -0700 (PDT)
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
X-Inumbo-ID: 51560faf-825c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756199346; x=1756804146; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77d/j8qwZSAUfieO6k/82x9C3BYxXzID/eeSrhr4zMw=;
        b=jbW96VIUE2W3BNM2QV0Y+VijaCv9I+yu/x5qsqaceGjrmXB4FGb0uBmPs4nqiAjSwI
         Sb0nCF0F8ocXoKSfWoaUYN+kBXjVO383CR3jMdUiYbCSusLXfy7igEu/GOz83tPVPk+f
         li2ZUUORDdLfbJA34CkhBGYHpMgd2wkKkmyPbFmk7eWESxurtSwErx7KGXR+zMg/scXQ
         gdLKpBixjL7PQMCQU1riDu3Kg1Yj5NOycRUS4mhn1ZZpmYA5ijSmLd9vcL5u+RHAKiib
         +S+p6/2/vypGEvPW4NB0EgJyOdd6LyRmmNoWfjla+yC+s8J1c6+jRM9CSuF92ynaHItN
         vnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756199346; x=1756804146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77d/j8qwZSAUfieO6k/82x9C3BYxXzID/eeSrhr4zMw=;
        b=Va1x//jPpXHz67HJypautuoNd7+qGzNFh8r8BXT+VOpCtYysC/0mBjlFhldH9ftNfS
         oaNWvMNbfi4mTJEgYpmJQUzecMFhOlvQeDh/GLo3S6cQitblbxrM8s8BGSy85UkbxpOB
         Ck5GWRGX9BU3brw96U2RdhijcBDlaS8wpZpbNFnuj2YH1GbakY24q4iO4aknoBT8nyo3
         PjsFblFbRhUbsC7XXjc4XhigscCyLZ/juWn7vRjObw2FVEov3t7dt9kiLJbk+6AeqS2A
         eqCAKcM3mvWzSDHJLV0ztJQeaYIleeB8ZVnlthTbaJFUEA7typ2Cw4ZAuf5jSbdxy5cx
         AUPg==
X-Gm-Message-State: AOJu0YzY2MSaz1NiwfM4JwUUTiWHEtoAaMOllSIjEXPjcmazBCF0wBri
	4PkcIrfx+3zURn0jlpUrJjwxJFxZiz9SfkEtnBMzb1/GUeYu4C5Q8j39PzbIZG9CnxL4ci0wIGf
	rJnwc1hJg8OPp6hjVDpBX0p6leVEHvN5tdA==
X-Gm-Gg: ASbGncuOIfut0ck0Eb/ceP+bEkdDR7//6SWUPTAQKzM4jGHhjfaaueI3A3Lc35+KVI6
	JYKJoAmlx8Phzpuc4QVuzjgjYMyIHQzF7a5igU6jFX8MHaUsq+QGVtAF5cvKtEmX+cWU6aTlI3v
	rsBaos/bdxRlWdItkEAd+fy9Wej89MZDjw3eIE58TYFUZ1OuCX76wQa7XUiVxzz5Pm1iH8geIaf
	ZgskIOtFhn6CNql
X-Google-Smtp-Source: AGHT+IGyhO5NK0TAkbwYY9qAralgg0vxrX/uORw/vqxdmmq7nMdytGutr8tDT3e9NYaGju7ClHK/RQW+hfSY+zqkA78=
X-Received: by 2002:a05:6512:1357:b0:55f:4f71:c5fa with SMTP id
 2adb3069b0e04-55f4f71c7ddmr262154e87.13.1756199345176; Tue, 26 Aug 2025
 02:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755506449.git.mykola_kvach@epam.com> <205b2b354ff1d34d0e9ec4777ca3c94492f6d9d1.1755506449.git.mykola_kvach@epam.com>
 <87jz2vaq9h.fsf@epam.com>
In-Reply-To: <87jz2vaq9h.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 26 Aug 2025 12:08:53 +0300
X-Gm-Features: Ac12FXy-i_luJsq_sYy-eFEdMwMAT43NitlRR4k9pmtnFbxzmbueDNImLz6mHr0
Message-ID: <CAGeoDV-XTA0kOrKveLR+W6=V=xZ0CFpPaxBH=6+6=4Fz421aJw@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <Mykola_Kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volodymyr,


On Sat, Aug 23, 2025 at 2:30=E2=80=AFAM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
>
> Hi Mykola,
>
> Mykola Kvach <xakep.amatop@gmail.com> writes:
>
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > This patch adds support for the PSCI SYSTEM_SUSPEND function in the vPS=
CI
> > (virtual PSCI) interface, allowing guests to request suspend via the PS=
CI
> > v1.0 SYSTEM_SUSPEND call (both 32-bit and 64-bit variants).
> >
> > The implementation:
> > - Adds SYSTEM_SUSPEND function IDs to PSCI definitions
> > - Implements trapping and handling of SYSTEM_SUSPEND in vPSCI
> > - Allows only non-hardware domains to invoke SYSTEM_SUSPEND; for the
> >   hardware domain, PSCI_NOT_SUPPORTED is returned to avoid halting the
> >   system in hwdom_shutdown() called from domain_shutdown
> > - Ensures all secondary VCPUs of the calling domain are offline before
> >   allowing suspend due to PSCI spec
> >
> > GIC and virtual timer context must be saved when the domain suspends.
> > This is done by moving the respective code in ctxt_switch_from
> > before the return that happens if the domain suspended.
> >
> > domain_resume_nopause() is introduced to allow resuming a domain from
> > SYSTEM_SUSPEND without pausing it first. This avoids problematic
> > domain_pause() calls when resuming from suspend on Arm, particularly
> > in error paths. The function is only used on Arm; other architectures
> > continue to use the original domain_resume().
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
> > ---
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
> >  xen/arch/arm/domain.c                 |  17 +++--
> >  xen/arch/arm/include/asm/perfc_defn.h |   1 +
> >  xen/arch/arm/include/asm/psci.h       |   2 +
> >  xen/arch/arm/include/asm/vpsci.h      |   2 +-
> >  xen/arch/arm/vpsci.c                  | 101 ++++++++++++++++++++++----
> >  xen/common/domain.c                   |  31 ++++++--
> >  xen/include/xen/sched.h               |   6 ++
> >  7 files changed, 131 insertions(+), 29 deletions(-)
> >
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > index 310c578909..9e9649c4e2 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -90,6 +90,16 @@ static void ctxt_switch_from(struct vcpu *p)
> >      if ( is_idle_vcpu(p) )
> >          return;
> >
> > +    /* Arch timer */
> > +    p->arch.cntkctl =3D READ_SYSREG(CNTKCTL_EL1);
> > +    virt_timer_save(p);
> > +
> > +    /* VGIC */
> > +    gic_save_state(p);
> > +
>
> I'd like to see comment here on why we don't need to do rest of the
> ctx save code. I saw that this is described in the commit message, but
> comment there will be very helpful for future contributors.

Honestly, regarding the vCPU context, the only thing we need to
prevent from being saved (overwritten) in this call is the SCTLR_EL1
register. This was already handled in one of the previous patches,
but the change was not accepted during review.

As for other registers, saving them is not strictly required
according to the PSCI specification. It states that at startup we
must set the AIF or DAIF bits for AArch32 or AArch64, respectively
(DEN0022F.b 1.3, "6.4.3.3 Exceptions"). SCTLR.{I, C, M} must be set
to {0, 0, 0} (DEN0022F.b 1.3, "6.4.3.4 MMU, cache and branch
predictor enable").

Finally, the context ID and the entry point must also be saved in
the guest registers, but in this function they are not modified.

I'll add a comment as you proposed, to make this clearer for future
contributors.

>
> > +    if ( test_bit(_VPF_suspended, &p->pause_flags) )
> > +        return;
> > +
> >      p2m_save_state(p);
> >
> >      /* CP 15 */
> > @@ -106,10 +116,6 @@ static void ctxt_switch_from(struct vcpu *p)
> >      p->arch.tpidrro_el0 =3D READ_SYSREG(TPIDRRO_EL0);
> >      p->arch.tpidr_el1 =3D READ_SYSREG(TPIDR_EL1);
> >
> > -    /* Arch timer */
> > -    p->arch.cntkctl =3D READ_SYSREG(CNTKCTL_EL1);
> > -    virt_timer_save(p);
> > -
> >      if ( is_32bit_domain(p->domain) && cpu_has_thumbee )
> >      {
> >          p->arch.teecr =3D READ_SYSREG(TEECR32_EL1);
> > @@ -158,9 +164,6 @@ static void ctxt_switch_from(struct vcpu *p)
> >
> >      /* XXX MPU */
> >
> > -    /* VGIC */
> > -    gic_save_state(p);
> > -
> >      isb();
> >  }
> >
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
> > index 0cca5e6830..69d40f9d7f 100644
> > --- a/xen/arch/arm/include/asm/vpsci.h
> > +++ b/xen/arch/arm/include/asm/vpsci.h
> > @@ -23,7 +23,7 @@
> >  #include <asm/psci.h>
> >
> >  /* Number of function implemented by virtual PSCI (only 0.2 or later) =
*/
> > -#define VPSCI_NR_FUNCS  12
> > +#define VPSCI_NR_FUNCS  14
> >
> >  /* Functions handle PSCI calls from the guests */
> >  bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
> > diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> > index 7ba9ccd94b..67d369a8a2 100644
> > --- a/xen/arch/arm/vpsci.c
> > +++ b/xen/arch/arm/vpsci.c
> > @@ -10,28 +10,18 @@
> >
> >  #include <public/sched.h>
> >
> > -static int do_common_cpu_on(register_t target_cpu, register_t entry_po=
int,
> > -                            register_t context_id)
> > +static int do_setup_vcpu_ctx(struct vcpu *v, register_t entry_point,
> > +                      register_t context_id)
> >  {
> > -    struct vcpu *v;
> >      struct domain *d =3D current->domain;
> >      struct vcpu_guest_context *ctxt;
> >      int rc;
> >      bool is_thumb =3D entry_point & 1;
> > -    register_t vcpuid;
> > -
> > -    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> > -
> > -    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> > -        return PSCI_INVALID_PARAMETERS;
> >
> >      /* THUMB set is not allowed with 64-bit domain */
> >      if ( is_64bit_domain(d) && is_thumb )
> >          return PSCI_INVALID_ADDRESS;
> >
> > -    if ( !test_bit(_VPF_down, &v->pause_flags) )
> > -        return PSCI_ALREADY_ON;
> > -
> >      if ( (ctxt =3D alloc_vcpu_guest_context()) =3D=3D NULL )
> >          return PSCI_DENIED;
> >
> > @@ -78,11 +68,32 @@ static int do_common_cpu_on(register_t target_cpu, =
register_t entry_point,
> >      if ( rc < 0 )
> >          return PSCI_DENIED;
> >
> > -    vcpu_wake(v);
> > -
> >      return PSCI_SUCCESS;
> >  }
> >
> > +static int do_common_cpu_on(register_t target_cpu, register_t entry_po=
int,
> > +                            register_t context_id)
> > +{
> > +    int rc;
> > +    struct vcpu *v;
> > +    struct domain *d =3D current->domain;
> > +    register_t vcpuid;
> > +
> > +    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> > +
> > +    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> > +        return PSCI_INVALID_PARAMETERS;
> > +
> > +    if ( !test_bit(_VPF_down, &v->pause_flags) )
> > +        return PSCI_ALREADY_ON;
> > +
> > +    rc =3D do_setup_vcpu_ctx(v, entry_point, context_id);
> > +    if ( rc =3D=3D PSCI_SUCCESS )
> > +        vcpu_wake(v);
> > +
> > +    return rc;
> > +}
> > +
> >  static int32_t do_psci_cpu_on(uint32_t vcpuid, register_t entry_point)
> >  {
> >      int32_t ret;
> > @@ -197,6 +208,48 @@ static void do_psci_0_2_system_reset(void)
> >      domain_shutdown(d,SHUTDOWN_reboot);
> >  }
> >
> > +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_=
t cid)
> > +{
> > +    int32_t rc;
> > +    struct vcpu *v;
> > +    struct domain *d =3D current->domain;
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
> > +    rc =3D do_setup_vcpu_ctx(current, epoint, cid);
> > +    if ( rc !=3D PSCI_SUCCESS )
> > +    {
> > +        domain_resume_nopause(d);
> > +        return rc;
> > +    }
> > +
> > +    set_bit(_VPF_suspended, &current->pause_flags);
> > +
> > +    dprintk(XENLOG_DEBUG,
> > +            "Dom %u: SYSTEM_SUSPEND requested, epoint=3D%#lx, cid=3D%#=
lx\n",
> > +            d->domain_id, epoint, cid);
> > +
> > +    return rc;
> > +}
> > +
> >  static int32_t do_psci_1_0_features(uint32_t psci_func_id)
> >  {
> >      /* /!\ Ordered by function ID and not name */
> > @@ -214,6 +267,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_f=
unc_id)
> >      case PSCI_0_2_FN32_SYSTEM_OFF:
> >      case PSCI_0_2_FN32_SYSTEM_RESET:
> >      case PSCI_1_0_FN32_PSCI_FEATURES:
> > +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> > +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> >      case ARM_SMCCC_VERSION_FID:
> >          return 0;
> >      default:
> > @@ -344,6 +399,24 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs,=
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
> > +        if ( is_64bit_domain(current->domain) &&
> > +             fid =3D=3D PSCI_1_0_FN32_SYSTEM_SUSPEND )
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
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 5241a1629e..624c3e2c27 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1343,16 +1343,13 @@ int domain_shutdown(struct domain *d, u8 reason=
)
> >      return 0;
> >  }
> >
> > -void domain_resume(struct domain *d)
> > +#ifndef CONFIG_ARM
> > +static
> > +#endif
> > +void domain_resume_nopause(struct domain *d)
>
> It took me some time to understand that this function makes assumption
> that domain is already paused. As it behaves like *_unlocked()
> functions, maybe it is better to call it something like domain_resume_pau=
sed() ?

Thank you for your suggestion.

The "nopause" in the function name is intended to highlight the
difference from the previous implementation, where domain_resume()
would explicitly pause the domain before resuming it.

Pausing the domain is not required here. This function is executed on the
last running virtual CPU of the domain, so there is no need to wait for
other vCPUs to finish execution in order to perform a safe operation.
Since we are already inside the HVC trap handler, it is not possible for
other code to run or for race conditions to occur in shutdown states.
The state of other vCPUs cannot change at this point.

For other parts of the code that do not execute in the context of the
current domain, a domain pause is performed before such operations to
ensure that all virtual CPUs are blocked and not running. This guarantees
that operations which require all vCPUs to be paused/unpaused are
performed safely.

>
> >  {
> >      struct vcpu *v;
> >
> > -    /*
> > -     * Some code paths assume that shutdown status does not get reset =
under
> > -     * their feet (e.g., some assertions make this assumption).
> > -     */
> > -    domain_pause(d);
> > -
> >      spin_lock(&d->shutdown_lock);
> >
> >      d->is_shutting_down =3D d->is_shut_down =3D 0;
> > @@ -1360,13 +1357,33 @@ void domain_resume(struct domain *d)
> >
> >      for_each_vcpu ( d, v )
> >      {
> > +        /*
> > +         * No need to conditionally clear _VPF_suspended here:
> > +         * - This bit is only set on Arm64, and only after a successfu=
l suspend.
> > +         * - domain_resume_nopause() may also be called from paths oth=
er than
> > +         *   the suspend/resume flow, such as "soft-reset" actions (e.=
g.,
> > +         *   on_poweroff), as part of the Xenstore control/shutdown pr=
otocol.
> > +         *   These require guest acknowledgement to complete the opera=
tion.
> > +         * So clearing the bit unconditionally is safe.
> > +         */
> > +        clear_bit(_VPF_suspended, &v->pause_flags);
> > +
> >          if ( v->paused_for_shutdown )
> >              vcpu_unpause(v);
> >          v->paused_for_shutdown =3D 0;
> >      }
> >
> >      spin_unlock(&d->shutdown_lock);
> > +}
> >
> > +void domain_resume(struct domain *d)
> > +{
> > +    /*
> > +     * Some code paths assume that shutdown status does not get reset =
under
> > +     * their feet (e.g., some assertions make this assumption).
> > +     */
> > +    domain_pause(d);
> > +    domain_resume_nopause(d);
> >      domain_unpause(d);
> >  }
> >
> > diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> > index fd5c9f9333..c1848d8ea6 100644
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -814,6 +814,9 @@ void domain_destroy(struct domain *d);
> >  int domain_kill(struct domain *d);
> >  int domain_shutdown(struct domain *d, u8 reason);
> >  void domain_resume(struct domain *d);
> > +#ifdef CONFIG_ARM
> > +void domain_resume_nopause(struct domain *d);
> > +#endif
>
> Probably I need comment from other reviewers here. Do we really need to
> make this ARM-specific? I understand that right now it will be used only

It is done to avoid violation of MISRA C Rule 8.7:
Functions and objects should not be defined with external linkage if
they are referenced in only one translation unit

> by ARM, but still... Also, I am not big fan of that
>
> > +#ifndef CONFIG_ARM
> > +static
> > +#endif
>
> in the function definition.

This is done to avoid violation of MISRA C Rule 8.8:
The static storage class specifier shall be used in all declarations of
objects and functions that have internal linkage

>
>
> --
> WBR, Volodymyr

Best regards,
Mykola

