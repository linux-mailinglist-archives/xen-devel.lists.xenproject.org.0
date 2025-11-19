Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B65C6E939
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 13:48:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165945.1492605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLhbJ-0000iY-OU; Wed, 19 Nov 2025 12:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165945.1492605; Wed, 19 Nov 2025 12:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLhbJ-0000gJ-Lm; Wed, 19 Nov 2025 12:47:57 +0000
Received: by outflank-mailman (input) for mailman id 1165945;
 Wed, 19 Nov 2025 12:47:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/QLq=53=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vLhbH-0000gD-Ed
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 12:47:55 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6059dbf-c545-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 13:47:52 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-59581e32163so6708924e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 04:47:52 -0800 (PST)
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
X-Inumbo-ID: f6059dbf-c545-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763556471; x=1764161271; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqEwcQxqlcnTBb5sqdGGZLT640pBdvh5MhYRVjxBaKE=;
        b=mNruoufI/rli4SvUTZhir9xREFh3StkX1rqQO5k9k4pwwoDbbiCgUIXtyvKepPzeTI
         7WHkqNvXbd2Ht/7YrR+ZvraI62xuwRlc0DTxIUYBpdZDBsNxgIsG0FjaqK66ufgKfdmA
         EYRCfGdXqcanJeF62Z7TWUCxnilGUqrwF8hmcDWUo4VsDcbxSOC3NrNy6nWIUii4gIQz
         weMcqz5b8cDyGvz8CMlPHAL/DBW/LeV5f4jKNGBSsiHtctuwiENwb7/RSW+FEE3JueDN
         qP0F54RtF/UUAv9e92i8hx3cdS/vuCv/cwt63ecKtvNeAZrpI8KFns/8qmBWnHsOgx73
         8Jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763556471; x=1764161271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dqEwcQxqlcnTBb5sqdGGZLT640pBdvh5MhYRVjxBaKE=;
        b=Fvh0zQnoJvE/sXO00w6TaE2qHyDGC00S79bTCFJ74kbF/84D+FM5SQuOu3A+hlQxEp
         1XPLA8W57QU/n2LXLGYY9w8ibKYRa8Ve2e4LBxngmo+k6GK95IP1fo03IzEzG/0HLrnT
         GMNrJ7Qhk2uULv0C0YE2nROVjHg1xtliyMP7wzADeWckXgARy06yaex4Bs/MU+UZf3Oc
         Jdsa3Cj5npR1KE57rxle2YXvrhcMlQs7Rl2htAd+xJ+CkP+5QDYrOH8KaaRneg0068DL
         mW1XFgdFEPt47S7O1lTlVnqdnZmSJbAuPkgNHAWVc+V+SI0s+er23wWuUrMD9MjovV1l
         vXoA==
X-Gm-Message-State: AOJu0Yy8MCHO5muOnUBcK0r44R73vOo7vJ6K+C3G1euRNrCm2gbqhsTd
	w8ZVS+IzR2wYCY3YjJFup20oGZCHb0QG+VzjDFUfC01RraoEBDMngmfmBfv61O2fADJIk91ynkM
	wRoAVr8I3P7CgHmppYitklTDObrgdAOU=
X-Gm-Gg: ASbGncsmpFDrmWfPYNam4cEgfPsyhSkuHm2jiOYav7QGkls8KdIYYe8lufS3QpoVWgx
	ra5o4LqhjuSOWTtscPp+JlrjwFs/8gAJNAUZDZibzMNoarzMpEa3rRC3YOWYGSEzRSi6Am8YAxv
	D9Lqp+H/w91LeDdnFuRteZwDZfr2EVBHZh/2HVTZCLsQR+fvwkLc1wgE6YmvidzpdD6qcSSFNf8
	XqKwf1zBIbfnibZ08GbMMUW1DUPgT6hFaLwy1MUzHyKfyWD/lGannN7XWrkWpjs2j56Cg==
X-Google-Smtp-Source: AGHT+IHKAm4VDs0JouIMH7EkQZ/wojqtABJWN+qx5mboo6wPypnUmh2AJYnKM6jq+w7/kQEonaJ6BRGoHOFY78neCRE=
X-Received: by 2002:a05:6512:33cc:b0:592:fc68:5b9d with SMTP id
 2adb3069b0e04-5958419e9ccmr6166314e87.10.1763556470888; Wed, 19 Nov 2025
 04:47:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763479083.git.xakep.amatop@gmail.com> <3786204d034ae4461aa0fde77771b8e14256314a.1763479083.git.xakep.amatop@gmail.com>
 <5a5b4bf6-4cd6-4b64-ba31-07a87b1fdbaa@amd.com>
In-Reply-To: <5a5b4bf6-4cd6-4b64-ba31-07a87b1fdbaa@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 19 Nov 2025 14:47:39 +0200
X-Gm-Features: AWmQ_bluPbvO3pAoTjmJleMeN-bRk5mxkcH4x-7Ym5LU70mFXLQJnbMwqcEumWE
Message-ID: <CAGeoDV8vM_=XrCHUghyWHgiRBFMNQCALJSf_hrC9p5KHY6R8oA@mail.gmail.com>
Subject: Re: [PATCH v14 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 10:48=E2=80=AFAM Orzel, Michal <michal.orzel@amd.co=
m> wrote:
>
>
>
> On 18/11/2025 16:37, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface=
,
> > allowing guests to request suspend via the PSCI v1.0+ SYSTEM_SUSPEND ca=
ll
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
> > ---
> > Changes in V14:
> > - move arch_domain_resume to a separate header
> > - avoid usage of typeof for context struct
> > - moved error printing from domain_resume to arch_domain_resume
> >   in order to simplify common parts of code
> > - minor changes after review
> > ---
> >  xen/arch/arm/domain.c                 |  41 +++++++++
> >  xen/arch/arm/include/asm/domain.h     |   2 +
> >  xen/arch/arm/include/asm/perfc_defn.h |   1 +
> >  xen/arch/arm/include/asm/psci.h       |   2 +
> >  xen/arch/arm/include/asm/suspend.h    |  24 ++++++
> >  xen/arch/arm/include/asm/vpsci.h      |   5 +-
> >  xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
> >  xen/common/domain.c                   |   5 ++
> >  xen/include/xen/suspend.h             |  15 ++++
> >  9 files changed, 189 insertions(+), 22 deletions(-)
> >  create mode 100644 xen/arch/arm/include/asm/suspend.h
> >  create mode 100644 xen/include/xen/suspend.h
> >
> > diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> > index e36719bce4..3c0170480b 100644
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
> > @@ -24,10 +26,12 @@
> >  #include <asm/platform.h>
> >  #include <asm/procinfo.h>
> >  #include <asm/regs.h>
> > +#include <asm/suspend.h>
> >  #include <asm/firmware/sci.h>
> >  #include <asm/tee/tee.h>
> >  #include <asm/vfp.h>
> >  #include <asm/vgic.h>
> > +#include <asm/vpsci.h>
> >  #include <asm/vtimer.h>
> >
> >  #include "vpci.h"
> > @@ -885,6 +889,43 @@ void arch_domain_creation_finished(struct domain *=
d)
> >      p2m_domain_creation_finished(d);
> >  }
> >
> > +int arch_domain_resume(struct domain *d)
> > +{
> > +    int rc;
> > +    struct resume_info *ctx =3D &d->arch.resume_ctx;
> > +
> > +    if ( !d->is_shutting_down || d->shutdown_code !=3D SHUTDOWN_suspen=
d )
> > +    {
> > +        dprintk(XENLOG_WARNING,
> > +                "%pd: Invalid domain state for resume: is_shutting_dow=
n=3D%d, shutdown_code=3D%d\n",
> These are bool and uint, so %u should be used.
>
> > +                d, d->is_shutting_down, d->shutdown_code);
> > +        return -EINVAL;
> > +    }
> > +
> > +    /*
> > +     * It is still possible to call domain_shutdown() with a suspend r=
eason
> > +     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_remote=
_shutdown.
> > +     * In these cases, the resume context will be empty.
> > +     * This is not expected to cause any issues, so we just warn about=
 the
> > +     * situation and return without error, allowing the existing logic=
 to
> > +     * proceed as expected.
> > +     */
> > +    if ( !ctx->wake_cpu )
> > +    {
> > +        dprintk(XENLOG_INFO, "%pd: Wake CPU pointer context was not pr=
ovided\n",
> > +                d);
> > +        return 0;
> > +    }
> > +
> > +    rc =3D vpsci_vcpu_up_prepare(ctx->wake_cpu , ctx->ep, ctx->cid);
> > +    if ( rc )
> > +        printk("%pd: Failed to resume domain (ret %d)\n", d, rc);
> > +
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
> > index af3e168374..e637cb4de0 100644
> > --- a/xen/arch/arm/include/asm/domain.h
> > +++ b/xen/arch/arm/include/asm/domain.h
> > @@ -5,6 +5,7 @@
> >  #include <xen/timer.h>
> >  #include <asm/page.h>
> >  #include <asm/p2m.h>
> > +#include <asm/suspend.h>
> >  #include <asm/vfp.h>
> >  #include <asm/mmio.h>
> >  #include <asm/gic.h>
> > @@ -126,6 +127,7 @@ struct arch_domain
> >      void *sci_data;
> >  #endif
> >
> > +    struct resume_info resume_ctx;
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
> > diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/=
asm/suspend.h
> > new file mode 100644
> > index 0000000000..b991a94d5a
> > --- /dev/null
> > +++ b/xen/arch/arm/include/asm/suspend.h
> > @@ -0,0 +1,24 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef __ARM_SUSPEND_H__
> There should be no double underscores in guards (see examples in CODING_S=
TYLE)
> > +#define __ARM_SUSPEND_H__
> > +
> > +struct resume_info {
> > +    register_t ep;
> > +    register_t cid;
> > +    struct vcpu *wake_cpu;
> > +};
> > +
> > +int arch_domain_resume(struct domain *d);
> If possible, headers should be standalone, meaning you should include nec=
essary
> headers or forward declare what's missing.
>
> > +
> > +#endif /* __ARM_SUSPEND_H__ */
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
> > index 7ba9ccd94b..22c3a5f544 100644
> > --- a/xen/arch/arm/vpsci.c
> > +++ b/xen/arch/arm/vpsci.c
> > @@ -10,32 +10,16 @@
> >
> >  #include <public/sched.h>
> >
> > -static int do_common_cpu_on(register_t target_cpu, register_t entry_po=
int,
> > -                            register_t context_id)
> > +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> > +                   register_t context_id)
> NIT: incorrect parameter alignment
>
> >  {
> > -    struct vcpu *v;
> > -    struct domain *d =3D current->domain;
> > -    struct vcpu_guest_context *ctxt;
> >      int rc;
> > +    struct domain *d =3D v->domain;
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
> > -
> > -    vgic_clear_pending_irqs(v);
> > +        return -ENOMEM;
> >
> >      memset(ctxt, 0, sizeof(*ctxt));
> >      ctxt->user_regs.pc64 =3D (u64) entry_point;
> > @@ -76,8 +60,37 @@ static int do_common_cpu_on(register_t target_cpu, r=
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
> > @@ -197,6 +210,48 @@ static void do_psci_0_2_system_reset(void)
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
=3D0x%"PRIregister"\n",
> NIT: %# is preffered over 0x%.
>
> > +            epoint, cid);
> > +
> > +    return rc;
> > +}
> > +
> >  static int32_t do_psci_1_0_features(uint32_t psci_func_id)
> >  {
> >      /* /!\ Ordered by function ID and not name */
> > @@ -214,6 +269,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_f=
unc_id)
> >      case PSCI_0_2_FN32_SYSTEM_OFF:
> >      case PSCI_0_2_FN32_SYSTEM_RESET:
> >      case PSCI_1_0_FN32_PSCI_FEATURES:
> > +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> > +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> >      case ARM_SMCCC_VERSION_FID:
> >          return 0;
> >      default:
> > @@ -344,6 +401,23 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs,=
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
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 775c339285..6410d32970 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -26,6 +26,7 @@
> >  #include <xen/hypercall.h>
> >  #include <xen/delay.h>
> >  #include <xen/shutdown.h>
> > +#include <xen/suspend.h>
> >  #include <xen/percpu.h>
> >  #include <xen/multicall.h>
> >  #include <xen/rcupdate.h>
> > @@ -1363,6 +1364,9 @@ void domain_resume(struct domain *d)
> >
> >      spin_lock(&d->shutdown_lock);
> >
> > +    if ( arch_domain_resume(d) )
> > +        goto fail;
> > +
> >      d->is_shutting_down =3D d->is_shut_down =3D 0;
> >      d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
> >
> > @@ -1373,6 +1377,7 @@ void domain_resume(struct domain *d)
> >          v->paused_for_shutdown =3D 0;
> >      }
> >
> > + fail:
> >      spin_unlock(&d->shutdown_lock);
> >
> >      domain_unpause(d);
> > diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
> > new file mode 100644
> > index 0000000000..53f75fd6ad
> > --- /dev/null
> > +++ b/xen/include/xen/suspend.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __XEN_SUSPEND_H__
> There should be no double underscores in guards
>
> > +#define __XEN_SUSPEND_H__
> > +
> > +#if __has_include(<asm/suspend.h>)
> > +#include <asm/suspend.h>
> > +#else
> > +static inline int arch_domain_resume(struct domain *d)
> > +{
> > +    return 0;
> > +}
> > +#endif
> > +
> Stray whiteline?
>
> > +
> > +#endif /* __XEN_SUSPEND_H__ */
> Missing emacs block?
>
> Did you run MISRA scan on this patch?

The ECLAIR MISRA scan was run via GitLab CI for this branch by my
colleague:

https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/2167389661

As far as I can see, there are no new MISRA violations reported for the
code touched by this patch.


~Mykola

>
> ~Michal
>
>

