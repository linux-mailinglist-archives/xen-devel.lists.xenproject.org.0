Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275C5B3582C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 11:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094130.1449490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqpgA-00035B-LE; Tue, 26 Aug 2025 09:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094130.1449490; Tue, 26 Aug 2025 09:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqpgA-000326-ID; Tue, 26 Aug 2025 09:09:22 +0000
Received: by outflank-mailman (input) for mailman id 1094130;
 Tue, 26 Aug 2025 09:09:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/mc=3G=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uqpg9-0002md-D7
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 09:09:21 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59548658-825c-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 11:09:19 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-55f42523658so2328701e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 02:09:19 -0700 (PDT)
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
X-Inumbo-ID: 59548658-825c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756199359; x=1756804159; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0HeJLquRFgM0Mxko9TRhZNYUUWqSoHfnuf/sjNaKqA=;
        b=Xj6KQEvqRqsDmfpLpiX4+cfFd8qSGgWcgyKPUxfK1Hg0eUkrJvbmm4V03gdjA3r4yO
         ULvy7zm7Juuuzeo92yWD/JGDYoWhBTejctJGs0YuPIuGtlN7/SD5ctZInNb5ipJh+3zf
         CVb5l3KYl1yh8f2rRFeeZUWNFemoVbAchg0NAQ9pOAMICRea6LkhTqeEDZ5HICcTpMbz
         Zktqpmm9CS8M8GCsu+5SwdJ+C/fugZms+5qKT14Vox0R/2jo8dGrp9SRofjB2mQxbRQU
         iq1iCi+qaBLxgXweN8tiiz9c3WwC42Mq0SBSMbzaWrQ3EPtqHg/q61Q1DUTQmTcJE3RP
         GiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756199359; x=1756804159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0HeJLquRFgM0Mxko9TRhZNYUUWqSoHfnuf/sjNaKqA=;
        b=e1UMsTCcYQIKA+KRdDrDUEgAdNhcLq3wiiJUZQaQV/Mrcr946VvtW/OCeGu8Ig60jF
         WKdEhd0lGoaGj2zRQzwDM93Cpz4v6sR+SrBiPPW5dfgGEyCLI74xEiQt9n63obWKF6BH
         FMqUqruJ7saeXwq5lXduPrh71Chzf0xlL7AIVWiEaOUxaX5AIYepBF2AsSnUOVzSFteq
         fVEXn1LqTOk1wMLhgZCDrqnAGX3y1DOumOV639yG7Ricg0eib3Cvu6qojWHUvP/QEBrv
         2mUt+piRka8pKNc6cG7QgwbnsnKOszyFt+cUh8v2faOLBGl4Oc5EvYgFe8YccFjSZ94E
         xwjg==
X-Gm-Message-State: AOJu0YzJpREbPDJjtrVRcIeeRo1Qvqc+Oeo9AqTY888sysbxX2qxHOLh
	/t4BxMtBbrgJ4hx2/VgabFsXH43H2fL+Suwc8IPKAgfShLLhZUhxUIaHmpbPR275rYdZpu8QCfq
	QMhuD8Ae/7ahdIWb8/ZpB+N8DbU2+YOU=
X-Gm-Gg: ASbGncuxjK8EoVe2pJxco0ycw5V0oL//0JU3B14YEqtLSsywjdsrneoHrmUsG6hOVD+
	HImk6x3/ZbDNp9d/aj/1nKUW4b0ePureTEhTNN6riRDYEl/MxZ79BgT2tI+nkWgWeK6Isi9EtOm
	iiqQmpVRQjaHkyOwa27vxh1eUrfo7DoJ7YR8WPpUQrjr416s8yjaOrY7eHr5SQlD0ZzcaiI06ih
	XMJYg==
X-Google-Smtp-Source: AGHT+IERlmDEBxhWXPU5Uufpx74bisANKaedC4VXIJinhSnSOYRlWDewyHo4dkcd9vmm2vlvKsAldTZv2fq4f32JVQI=
X-Received: by 2002:a05:6512:2392:b0:55f:4244:ac05 with SMTP id
 2adb3069b0e04-55f4244ae82mr3094634e87.32.1756199358854; Tue, 26 Aug 2025
 02:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755506449.git.mykola_kvach@epam.com> <205b2b354ff1d34d0e9ec4777ca3c94492f6d9d1.1755506449.git.mykola_kvach@epam.com>
 <9ab99307-9594-4cbc-9c7a-b1221575d41c@xen.org>
In-Reply-To: <9ab99307-9594-4cbc-9c7a-b1221575d41c@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 26 Aug 2025 12:09:07 +0300
X-Gm-Features: Ac12FXwF8EDuYdH_ALI8PX-Tual_eol_eE4RkisYanTKTBF1gQWG_5S643Zl7RQ
Message-ID: <CAGeoDV-MC65TZ74BLVDzfggQoeKXTKB-eVaadUoDB9iuP7TW3Q@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Sun, Aug 24, 2025 at 12:26=E2=80=AFAM Julien Grall <julien@xen.org> wrot=
e:
>
> Hi Mykola,
>
> On 18/08/2025 09:49, Mykola Kvach wrote:
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
> >    hardware domain, PSCI_NOT_SUPPORTED is returned to avoid halting the
> >    system in hwdom_shutdown() called from domain_shutdown
> > - Ensures all secondary VCPUs of the calling domain are offline before
> >    allowing suspend due to PSCI spec
> >
> > GIC and virtual timer context must be saved when the domain suspends.
>
> Can you expand a bit more on this? Is this a requirement from the Arm
> Arm? If so, please specify the specification so we can easily check.
>
> > This is done by moving the respective code in ctxt_switch_from
> > before the return that happens if the domain suspended.
>
>  From the commit message, it is unclear why we want to skip the save part=
.

I'll add extra information to the commit message.

>
> [...]
>
> > ---
> >   xen/arch/arm/domain.c                 |  17 +++--
> >   xen/arch/arm/include/asm/perfc_defn.h |   1 +
> >   xen/arch/arm/include/asm/psci.h       |   2 +
> >   xen/arch/arm/include/asm/vpsci.h      |   2 +-
> >   xen/arch/arm/vpsci.c                  | 101 ++++++++++++++++++++++---=
-
> >   xen/common/domain.c                   |  31 ++++++--
> >   xen/include/xen/sched.h               |   6 ++
> >   7 files changed, 131 insertions(+), 29 deletions(-)
> >
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > index 310c578909..9e9649c4e2 100644
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -90,6 +90,16 @@ static void ctxt_switch_from(struct vcpu *p)
> >       if ( is_idle_vcpu(p) )
> >           return;
> >
>
> It would be good to have a comment explaining what (and why) we need to
> save only partially the state while the VCPU is suspended.

Actually, nothing bad happens if we save everything except SCTLR_EL1,
which is modified in PSCI SYSTEM_SUSPEND. The only downside might be
losing some CPU cycles.

If we talk just about GIC and the Arch timer state, the relevant guidance
can be found in the Power State Coordination Interface
(DEN0022F.b, 6.8 Preserving the execution context).

Even if the guest saves the context it has access to and restores it on
resume, we only need to save the transient state. Looks like we can
do nothing with the arch timer here. And gic save function can be called
from PSCI SYSTEM_SUSPEND.

>
> > +    /* Arch timer */
> > +    p->arch.cntkctl =3D READ_SYSREG(CNTKCTL_EL1);
> > +    virt_timer_save(p);
> > +
> > +    /* VGIC */
> > +    gic_save_state(p);
> > +
> > +    if ( test_bit(_VPF_suspended, &p->pause_flags) )
> > +        return;
>
> Can you explain why we don't need an isb()?
>
> > +
> >       p2m_save_state(p);
> At least part of p2m_save_state() can't be skipped because it is
> applying a workaround on platform where AT mistakenly speculate.

Thank you for pointing that out, we need it here.

>
> [...]
>
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
>
> I think you should use gdprintk() which will print the domain for you as
> well as appropriately ratelimit the message.
>
> That said, I would consider using gprintk() so the message can also be
> printed in a debug build.

Got it, I will use gprintk() instead as suggested. Thank you for the
recommendation.

>
> > +            "Dom %u: SYSTEM_SUSPEND requested, epoint=3D%#lx, cid=3D%#=
lx\n",
>
> For both of them you technically want to use PRIregister rather than lx.

Got it, I will use PRIregister instead as suggested. Thank you for the
recommendation.

>
> Lastly, we prefer to use %pd when printing a domain. The argument is
> 'd'. But this should not be necessary if you use gprintk().

Ok.

>
>
> > +            d->domain_id, epoint, cid);
> > +
> > +    return rc;
> > +}
> > +
> >   static int32_t do_psci_1_0_features(uint32_t psci_func_id)
> >   {
> >       /* /!\ Ordered by function ID and not name */
> > @@ -214,6 +267,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_f=
unc_id)
> >       case PSCI_0_2_FN32_SYSTEM_OFF:
> >       case PSCI_0_2_FN32_SYSTEM_RESET:
> >       case PSCI_1_0_FN32_PSCI_FEATURES:
> > +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> > +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> >       case ARM_SMCCC_VERSION_FID:
> >           return 0;
> >       default:
> > @@ -344,6 +399,24 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs,=
 uint32_t fid)
> >           return true;
> >       }
> >
> > +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> > +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> > +    {
> > +        register_t epoint =3D PSCI_ARG(regs, 1);
> > +        register_t cid =3D PSCI_ARG(regs, 2);
> > +
> > +        if ( is_64bit_domain(current->domain) &&
>
> Shouldn't this be removed so the check also apply for 32-bit domain on
> 64-bit system?

AFAIK, this question was already addressed in a previous version of
this patch series:
https://patchew.org/Xen/cover.1751020456.git.mykola._5Fkvach@epam.com/07227=
0e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola._5Fkvach@epam.com=
/#7070f416-119c-49f8-acd0-82c6e31f0fc6@xen.org

>
> > +             fid =3D=3D PSCI_1_0_FN32_SYSTEM_SUSPEND )
>  > +        {> +            epoint &=3D GENMASK(31, 0);
> > +            cid &=3D GENMASK(31, 0);
> > +        }
> > +
> > +        perfc_incr(vpsci_system_suspend);
> > +        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid))=
;
> > +        return true;
> > +    }
> > +
> >       default:
> >           return false;
> >       }
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 5241a1629e..624c3e2c27 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1343,16 +1343,13 @@ int domain_shutdown(struct domain *d, u8 reason=
)
> >       return 0;
> >   }
> >
> > -void domain_resume(struct domain *d)
> > +#ifndef CONFIG_ARM
> > +static
> > +#endif
>
> I am not sure who suggests this but personally, I dislike using
> CONFIG_<ARCH> in common code. I also think this is worse for hiding the
> "static" keyword.
>
> For the latter, I think it would be better to provide a separate helper
> that can be #ifdef.

Will do. I will provide a separate helper as suggested.


>
> [...]
>
> Cheers,
>
> --
> Julien Grall
>

Best regards,
Mykola

