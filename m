Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B99AF110B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 12:02:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030843.1404512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWuHf-0007Mj-UL; Wed, 02 Jul 2025 10:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030843.1404512; Wed, 02 Jul 2025 10:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWuHf-0007K8-QF; Wed, 02 Jul 2025 10:01:43 +0000
Received: by outflank-mailman (input) for mailman id 1030843;
 Wed, 02 Jul 2025 10:01:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lrfD=ZP=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uWuHe-0007K2-RG
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 10:01:42 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d74f5de-572b-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 12:01:41 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-55515213c3cso3874079e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 03:01:41 -0700 (PDT)
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
X-Inumbo-ID: 8d74f5de-572b-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751450501; x=1752055301; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSSkOBN3kozGZUzaJFkpclBUFh4xGjh4V8ulYJKuDTU=;
        b=Uq8VGcTIb73csgBxBaWtdMAljQ0ssZN77mR+pYz/2fKCZUWfBJM0gX71MjLz8qglWS
         3nKdw4/9RCwZhtXK7PTcMNYuu1OXS9tATbYqebgaB1XewbTiZcsXOgVi1ClbzfQ2KTXu
         N9uGJJRZnyHNxla75jvS61uYtaSZsxadlCE3WdJt7OT0cJbBs8xvXSFjqeloW9Xg4KqI
         lnsN7YUeEk8u809xQZyxjuMhXj3G0xHdY3byDGuQusu26nCXtc9HyTl+opKyYEqFn/mw
         c2lODLCOsM7UgaqSi+M543E3FNvuP5K+POXXrGt3j3nRc1ib2F/nvk6s6yXVB0v4MgxR
         ukbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751450501; x=1752055301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSSkOBN3kozGZUzaJFkpclBUFh4xGjh4V8ulYJKuDTU=;
        b=GKgFwnn12NeOAxsy8UY1ICjlp+CaiPO00iFTZr8DYvwlkmHU5OxQY1xk6Iem17zqbR
         cP38XHikxaOojw1qV/1VhTFx9eZn5vLUHf/MFmQGPT8V6zc1wRsyzo0El00QZm+Npmwc
         EPo/dnkkwWno8083n1P8YqrBh4N+x2FJw15jbEUA/SqnnlLnx6stuu4hsTby/xs6NXeD
         b0bAS7G7rurdoKb1pNkxREOK/yug8MQZOna3bapve49LyHHkSvGexotNdYf7UqiVaL4/
         f2ouOkojRaFtImji72NvNfIbqpsp+C+HS2FhRuZaw9IcDUXxnhz0frmkSa99vuDiunOB
         +NlA==
X-Gm-Message-State: AOJu0YxLeJnnf8hxh+fLHpyZZDvAlPdQoq6w2w54ApvFkTjnL7zLXdFF
	oKYIGcIuULVtnV+WLovwOenbQu9chM4HrP4Ujv23WFckO+2gZtT4wxhui/EE59SgvHWtBXznCH4
	MDg73YKRSRFbtr5JSsHTurH/fBFDb16U=
X-Gm-Gg: ASbGncs1GfIhTE4BAq3UoHdxPXDKYKU+P0tINGMlUGtUXzQO1lx51lF3iU0su9BvnPO
	837CIq9OsvngyZCqwAHOA+PF+42eI2nRt2lGVlfT4qhVlKA+uKNyeVTImR5JhH1e1H8ZBnC5M1u
	lzlFuEBVM5CdUiMqHWwDwpXZbmqdAbrurWyLY8Vfa76A==
X-Google-Smtp-Source: AGHT+IE1UDObHKqDK4ZR0UHPj4iPI1wcyVftzSUDUzKdJJW9nWFZFNa/vtrOnJNHl0JF8LNwj+MY8u7kbfYvTauC/0Y=
X-Received: by 2002:a05:6512:15a9:b0:553:3422:c39d with SMTP id
 2adb3069b0e04-556283224edmr744106e87.37.1751450500685; Wed, 02 Jul 2025
 03:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751020456.git.mykola_kvach@epam.com> <072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola_kvach@epam.com>
 <066c6e93-a478-4c8f-b161-d109bd0e6bb4@xen.org>
In-Reply-To: <066c6e93-a478-4c8f-b161-d109bd0e6bb4@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 2 Jul 2025 13:01:29 +0300
X-Gm-Features: Ac12FXzwS1AZsMkWan3gfTF6nphmdS-hRPbdibxbAVXHbeHdiiIkHz-qP-jCz9A
Message-ID: <CAGeoDV-Zze2LtAdofS5EENkANH46SGU3+kqHkTB-k33MBmBXLQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Sat, Jun 28, 2025 at 9:17=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Mykola,
>
> On 27/06/2025 11:51, Mykola Kvach wrote:
> > diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/inclu=
de/asm/perfc_defn.h
> > index effd25b69e..8dfcac7e3b 100644
> > --- a/xen/arch/arm/include/asm/perfc_defn.h
> > +++ b/xen/arch/arm/include/asm/perfc_defn.h
> > @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system=
_reset")
> >   PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
> >   PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
> >   PERFCOUNTER(vpsci_features,            "vpsci: features")
> > +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
> >
> >   PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
> >
> > diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm=
/psci.h
> > index 4780972621..48a93e6b79 100644
> > --- a/xen/arch/arm/include/asm/psci.h
> > +++ b/xen/arch/arm/include/asm/psci.h
> > @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
> >   #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
> >   #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
> >   #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
> > +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
> >
> >   #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
> >   #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
> >   #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
> > +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
> >
> >   /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
> >   #define PSCI_0_2_AFFINITY_LEVEL_ON      0
> > diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/as=
m/vpsci.h
> > index 0cca5e6830..69d40f9d7f 100644
> > --- a/xen/arch/arm/include/asm/vpsci.h
> > +++ b/xen/arch/arm/include/asm/vpsci.h
> > @@ -23,7 +23,7 @@
> >   #include <asm/psci.h>
> >
> >   /* Number of function implemented by virtual PSCI (only 0.2 or later)=
 */
> > -#define VPSCI_NR_FUNCS  12
> > +#define VPSCI_NR_FUNCS  14
> >
> >   /* Functions handle PSCI calls from the guests */
> >   bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
> > diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> > index 67296dabb5..f9c09a49e2 100644
> > --- a/xen/arch/arm/mmu/p2m.c
> > +++ b/xen/arch/arm/mmu/p2m.c
> > @@ -6,6 +6,8 @@
> >   #include <xen/sched.h>
> >   #include <xen/softirq.h>
> >
> > +#include <public/sched.h>
> > +
> >   #include <asm/alternative.h>
> >   #include <asm/event.h>
> >   #include <asm/flushtlb.h>
> > @@ -198,7 +200,9 @@ void dump_p2m_lookup(struct domain *d, paddr_t addr=
)
> >    */
> >   void p2m_save_state(struct vcpu *p)
> >   {
> > -    p->arch.sctlr =3D READ_SYSREG(SCTLR_EL1);
> > +    if ( !(p->domain->is_shutting_down &&
> > +           p->domain->shutdown_code =3D=3D SHUTDOWN_suspend) )
>
> This is definitely not obvious why you need to change p2m_save_state().
> AFAIU, you are doing this because when suspending the system, you will
> overwrite p->arch.sctlr. However, this is super fragile. For instance,
> you still seem to overwrite TTBR{0,1} and TTBCR.
>
> TTBR{0,1} are technically unknown at boot. So it is fine to ignore them.
>   But for TTBCR, I am not 100% whether this is supposed to be unknown.

Yes, you are right. According to the PSCI specification, this is fine --
see section "6.4.3 Initial core configuration".

The MMU must be disabled on startup, so it looks like
we don't need to worry about restoring TTBR{0,1}, or TTBCR, see
"6.4.3.4 MMU, cache and branch predictor enables"

>
> Anyway, adding more "if (...)" is not the right solution because in the
> future we may decide to reset more registers.

Agree

>
> It would be better if we stash the value sand then update the registers.
> Another possibility would be to entirely skip the save path for CPUs
> that are turned off (after all this is a bit useless work...).

Do you mean we should avoid calling ctxt_switch_from for a suspended
domain?

>
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
> >   static int32_t do_psci_cpu_on(uint32_t vcpuid, register_t entry_point=
)
> >   {
> >       int32_t ret;
> > @@ -197,6 +208,52 @@ static void do_psci_0_2_system_reset(void)
> >       domain_shutdown(d,SHUTDOWN_reboot);
> >   }
> >
> > +static void do_resume_on_error(struct domain *d)
>
> This looks like an open-coding version of domain_resume() without the
> domain_{,un}pause(). What worries me is there is a comment on top of
> domain_pause() explaining why it is called. I understand, we can't call
> domain_pause() here (it doesn't work on the current domain). However, it
> feels to me there is an explanation necessary why this is fine to diverge=
.
>
> I am not a scheduler expert, so I am CCing Juergen in the hope he could
> provide some inputs.
>
> > +{
> > +    struct vcpu *v;
> > +
> > +    spin_lock(&d->shutdown_lock);
> > +
> > +    d->is_shutting_down =3D d->is_shut_down =3D 0;
> > +    d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
> > +
> > +    for_each_vcpu ( d, v )
> > +    {
> > +        if ( v->paused_for_shutdown )
> > +            vcpu_unpause(v);
> > +        v->paused_for_shutdown =3D 0;
> > +    }
> > +
> > +    spin_unlock(&d->shutdown_lock);
> > +}
> > +
> > +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_=
t cid)
> > +{
> > +    int ret;
> > +    struct vcpu *v;
> > +    struct domain *d =3D current->domain;
> > +
> > +    /* Drop this check once SYSTEM_SUSPEND is supported in hardware do=
main */
> > +    if ( is_hardware_domain(d) )
> > +        return PSCI_NOT_SUPPORTED;
> > +
> > +    domain_shutdown(d, SHUTDOWN_suspend);
>
> It would be good to add a comment explaining why you need to call
> domain_shutdown() first. Otherwise, one could wonder whether we can get
> rid of the complexity when a vCPU is still online.

It's done first here because domain_shutdown() handles pausing of the
vCPUs internally, and this allows us to securely check whether the vCPUs
are online or not without interference from the guest.

But you're probably right =E2=80=94 a better solution might be to perform p=
roper
checking of which vCPUs are still online before calling it.

>
> > +
> > +    /* Ensure that all CPUs other than the calling one are offline */
> > +    for_each_vcpu ( d, v )
>
> NIT: Even if this is a single "statement" below, I think adding the
> brace would make the code clearer.

Ok

>
> > +        if ( v !=3D current && is_vcpu_online(v) )
> > +        {
> > +            do_resume_on_error(d);
> > +            return PSCI_DENIED;
> > +        }
> > +
> > +    ret =3D do_setup_vcpu_ctx(current, epoint, cid);
> > +    if ( ret !=3D PSCI_SUCCESS )
> > +        do_resume_on_error(d);
> > +
> > +    return ret;
> > +}
> > +
> >   static int32_t do_psci_1_0_features(uint32_t psci_func_id)
> >   {
> >       /* /!\ Ordered by function ID and not name */
> > @@ -214,6 +271,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_f=
unc_id)
> >       case PSCI_0_2_FN32_SYSTEM_OFF:
> >       case PSCI_0_2_FN32_SYSTEM_RESET:
> >       case PSCI_1_0_FN32_PSCI_FEATURES:
> > +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> > +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> >       case ARM_SMCCC_VERSION_FID:
> >           return 0;
> >       default:
> > @@ -344,6 +403,17 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs,=
 uint32_t fid)
> >           return true;
> >       }
> >
> > +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> > +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> > +    {
> > +        register_t epoint =3D PSCI_ARG(regs,1);
> > +        register_t cid =3D PSCI_ARG(regs,2);
>
> Coding style: For the two lines above, there is a missing space after ","=
.

Sure, will fix =E2=80=94 thanks for pointing that out.

>
> Also, if a 64-bit domain is calling the 32-bit version, then we also
> need to ignore the top 32-bits. AFAICT CPU_ON also have the same issue.
> I am not going to ask fixing CPU_ON (it would be good though), but I
> will at least ask we don't spread the mistake further.

Maybe it would be better to return an error in this case?
Should I also add checks for the case where the guest OS is 32-bit but
tries to call the 64-bit version of SYSTEM_SUSPEND?


Best regards,
Mykola

>
> Cheers,
>
> --
> Julien Grall
>

