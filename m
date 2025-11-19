Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD3EC6E557
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 12:51:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165900.1492558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLgig-0000jA-1n; Wed, 19 Nov 2025 11:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165900.1492558; Wed, 19 Nov 2025 11:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLgif-0000gD-VG; Wed, 19 Nov 2025 11:51:29 +0000
Received: by outflank-mailman (input) for mailman id 1165900;
 Wed, 19 Nov 2025 11:51:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/QLq=53=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vLgid-0000eq-TG
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 11:51:28 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ec68057-c53e-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 12:51:17 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5957c929a5eso7595261e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 03:51:17 -0800 (PST)
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
X-Inumbo-ID: 0ec68057-c53e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763553077; x=1764157877; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkrJNiWeT2SicSU+1WDE/L+6w8QfJkwCj+eQ+f4jHzE=;
        b=MQ+nmEd2gvZ51YxEfuPIPWFgvc7myVpbK4kK4zZ8Xh/82VOZOy5sV39KGU+l4M/XOS
         AqXsn0324a2AVFsEAN+3Tbg5Z1hyN1vSFE5ZVLyPSc63Z/MEmnuAlt+GJc/9k3BYPZHA
         nYZA5ebF76bNgtsHKA3qp3Z+fSa9Gm9RTF9oISWdpHV10bgvnPKUj2pjHSgShbleOril
         MfrTsfCHAOlxbFBlXhaLpLanQjZzLKQoI4qC26EN1lEoTUjcbT1xgephafNuhBQX2wGE
         uox15osDwx/EJe2VIgB7z2cFs7XXL0loBHxJ80r9YZJ8JJqP5r9zWanjP3yJ0gMOdh8q
         xrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553077; x=1764157877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pkrJNiWeT2SicSU+1WDE/L+6w8QfJkwCj+eQ+f4jHzE=;
        b=JLYUtMQr8t9JCPHekJPQi9ByWv9ZCw1ujr/DaCUCHoY23COdCzG8fZLD0w5MlI+Uwo
         AwkXCbQzktAtFa1gJDIAZKtUo+sSU57Zfx9yk2T0qoSr75eECHrksgMydUnHyGe4qWgo
         G2PdR687wyDwlIf8/W2LBh/Bh3Wr8dLZKgVhJi1I2gmBtASnJBRNPFvt21btmGVpkUEf
         Trei5g6ULUCrQJeN4WVuQfq5IkE0CFY7x99J+9nt2vDilR8+S3kFh2qPA3TPbKF9bdQa
         F3UmUqJtin2rbVoLpx2p3AnSEx/jMJ+gsxRTyRAHqHI+Zl4Zh9StXTE7+sfmCJCMsU9e
         3mWA==
X-Gm-Message-State: AOJu0Yy/e5a6zLzYwzW1bar/HbJArHaEujPrezlYkDVhjMzSVxDhcIou
	M5b80iFPGYjm9l/djz6JoiQPnRxuA5QAyNOswV7zVhHj6jPFw6ncO7f8iWID9FU7JplvbNlJbcN
	5mamYicD0eIqyuV3aN8nboGhZ0qtGf6Q=
X-Gm-Gg: ASbGncsem6jHzjbIH3egDgN+hCMehxdziMFoDJLLAx8wjdeyoa+qw2OgSceIhznNqDc
	l0HPKt/a8H4/voIBcHj4aK+Suke20nEx8WJSf4iL12wdx1zI0s0DV1rKPFyYTrnBvWk9LNjx9/a
	UjM7SMvmyy54xSho3S0WJSBagEOpPLwOjypLBat+vMLcnCPGwb3AIu2a3JxWUixq3PhjQMCiPei
	Eh0E/LCCgCNaXpNN510SM0e2UINVFZ1rLexn5qag8ngt5QC6QAEviHuHjiOvrGzCHNHrQ==
X-Google-Smtp-Source: AGHT+IHdnamdK5DAwHnutntLMVl77uLDo8NYALMNPdJo8jV9wbkaz6OtZFb1kf0sbGjFpoIrWb5q7RTbJStYq4DF+qM=
X-Received: by 2002:a05:6512:4017:b0:594:26d7:c443 with SMTP id
 2adb3069b0e04-595842620d0mr7039382e87.39.1763553076593; Wed, 19 Nov 2025
 03:51:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763479083.git.xakep.amatop@gmail.com> <3786204d034ae4461aa0fde77771b8e14256314a.1763479083.git.xakep.amatop@gmail.com>
 <5a5b4bf6-4cd6-4b64-ba31-07a87b1fdbaa@amd.com> <CAGeoDV_4Bpp50wkd+wtq6zVHg4KZqnOcndG7rfqMndo=HW1sYQ@mail.gmail.com>
 <cd7657d8-47bd-4484-91b3-4fb79985537c@amd.com> <CAGeoDV9C7OVQWRyYZ+rV8Dn79PSkGd2veP18t46t+pMCt3LMnQ@mail.gmail.com>
 <47acc1e0-4d09-49dc-959d-f93c6a1b3b61@amd.com>
In-Reply-To: <47acc1e0-4d09-49dc-959d-f93c6a1b3b61@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 19 Nov 2025 13:51:04 +0200
X-Gm-Features: AWmQ_bmSlAFDLEtUWuzcPbm6HEnXGGrwMVukzLBYkh8GJ57jpJnTaa84SX_4Bbs
Message-ID: <CAGeoDV9LzicJ-n3cU2MWKjK1y6xZp525EDZDOAuYhB0z+bXQ_A@mail.gmail.com>
Subject: Re: [PATCH v14 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 1:43=E2=80=AFPM Orzel, Michal <michal.orzel@amd.com=
> wrote:
>
>
>
> On 19/11/2025 12:32, Mykola Kvach wrote:
> > On Wed, Nov 19, 2025 at 1:07=E2=80=AFPM Orzel, Michal <michal.orzel@amd=
.com> wrote:
> >>
> >>
> >>
> >> On 19/11/2025 12:00, Mykola Kvach wrote:
> >>> Hi Michal,
> >>>
> >>> Thanks for your review.
> >>>
> >>> On Wed, Nov 19, 2025 at 10:48=E2=80=AFAM Orzel, Michal <michal.orzel@=
amd.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 18/11/2025 16:37, Mykola Kvach wrote:
> >>>>> From: Mykola Kvach <mykola_kvach@epam.com>
> >>>>>
> >>>>> Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI inter=
face,
> >>>>> allowing guests to request suspend via the PSCI v1.0+ SYSTEM_SUSPEN=
D call
> >>>>> (both 32-bit and 64-bit variants).
> >>>>>
> >>>>> Implementation details:
> >>>>> - Add SYSTEM_SUSPEND function IDs to PSCI definitions
> >>>>> - Trap and handle SYSTEM_SUSPEND in vPSCI
> >>>>> - Allow only non-hardware domains to invoke SYSTEM_SUSPEND; return
> >>>>>   PSCI_NOT_SUPPORTED for the hardware domain to avoid halting the s=
ystem
> >>>>>   in hwdom_shutdown() via domain_shutdown
> >>>>> - Require all secondary VCPUs of the calling domain to be offline b=
efore
> >>>>>   suspend, as mandated by the PSCI specification
> >>>>>
> >>>>> The arch_domain_resume() function is an architecture-specific hook =
that is
> >>>>> invoked during domain resume to perform any necessary setup or rest=
oration
> >>>>> steps required by the platform.
> >>>>>
> >>>>> The new vpsci_vcpu_up_prepare() helper is called on the resume path=
 to set up
> >>>>> the vCPU context (such as entry point, some system regs and context=
 ID) before
> >>>>> resuming a suspended guest. This keeps ARM/vPSCI-specific logic out=
 of common
> >>>>> code and avoids intrusive changes to the generic resume flow.
> >>>>>
> >>>>> Usage:
> >>>>>
> >>>>> For Linux-based guests, suspend can be initiated with:
> >>>>>     echo mem > /sys/power/state
> >>>>> or via:
> >>>>>     systemctl suspend
> >>>>>
> >>>>> Resuming the guest is performed from control domain using:
> >>>>>       xl resume <domain>
> >>>>>
> >>>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >>>>> ---
> >>>>> Changes in V14:
> >>>>> - move arch_domain_resume to a separate header
> >>>>> - avoid usage of typeof for context struct
> >>>>> - moved error printing from domain_resume to arch_domain_resume
> >>>>>   in order to simplify common parts of code
> >>>>> - minor changes after review
> >>>>> ---
> >>>>>  xen/arch/arm/domain.c                 |  41 +++++++++
> >>>>>  xen/arch/arm/include/asm/domain.h     |   2 +
> >>>>>  xen/arch/arm/include/asm/perfc_defn.h |   1 +
> >>>>>  xen/arch/arm/include/asm/psci.h       |   2 +
> >>>>>  xen/arch/arm/include/asm/suspend.h    |  24 ++++++
> >>>>>  xen/arch/arm/include/asm/vpsci.h      |   5 +-
> >>>>>  xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-=
----
> >>>>>  xen/common/domain.c                   |   5 ++
> >>>>>  xen/include/xen/suspend.h             |  15 ++++
> >>>>>  9 files changed, 189 insertions(+), 22 deletions(-)
> >>>>>  create mode 100644 xen/arch/arm/include/asm/suspend.h
> >>>>>  create mode 100644 xen/include/xen/suspend.h
> >>>>>
> >>>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> >>>>> index e36719bce4..3c0170480b 100644
> >>>>> --- a/xen/arch/arm/domain.c
> >>>>> +++ b/xen/arch/arm/domain.c
> >>>>> @@ -12,6 +12,8 @@
> >>>>>  #include <xen/softirq.h>
> >>>>>  #include <xen/wait.h>
> >>>>>
> >>>>> +#include <public/sched.h>
> >>>>> +
> >>>>>  #include <asm/arm64/sve.h>
> >>>>>  #include <asm/cpuerrata.h>
> >>>>>  #include <asm/cpufeature.h>
> >>>>> @@ -24,10 +26,12 @@
> >>>>>  #include <asm/platform.h>
> >>>>>  #include <asm/procinfo.h>
> >>>>>  #include <asm/regs.h>
> >>>>> +#include <asm/suspend.h>
> >>>>>  #include <asm/firmware/sci.h>
> >>>>>  #include <asm/tee/tee.h>
> >>>>>  #include <asm/vfp.h>
> >>>>>  #include <asm/vgic.h>
> >>>>> +#include <asm/vpsci.h>
> >>>>>  #include <asm/vtimer.h>
> >>>>>
> >>>>>  #include "vpci.h"
> >>>>> @@ -885,6 +889,43 @@ void arch_domain_creation_finished(struct doma=
in *d)
> >>>>>      p2m_domain_creation_finished(d);
> >>>>>  }
> >>>>>
> >>>>> +int arch_domain_resume(struct domain *d)
> >>>>> +{
> >>>>> +    int rc;
> >>>>> +    struct resume_info *ctx =3D &d->arch.resume_ctx;
> >>>>> +
> >>>>> +    if ( !d->is_shutting_down || d->shutdown_code !=3D SHUTDOWN_su=
spend )
> >>>>> +    {
> >>>>> +        dprintk(XENLOG_WARNING,
> >>>>> +                "%pd: Invalid domain state for resume: is_shutting=
_down=3D%d, shutdown_code=3D%d\n",
> >>>> These are bool and uint, so %u should be used.
> >>>
> >>> ack
> >>>
> >>>>
> >>>>> +                d, d->is_shutting_down, d->shutdown_code);
> >>>>> +        return -EINVAL;
> >>>>> +    }
> >>>>> +
> >>>>> +    /*
> >>>>> +     * It is still possible to call domain_shutdown() with a suspe=
nd reason
> >>>>> +     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_re=
mote_shutdown.
> >>>>> +     * In these cases, the resume context will be empty.
> >>>>> +     * This is not expected to cause any issues, so we just warn a=
bout the
> >>>>> +     * situation and return without error, allowing the existing l=
ogic to
> >>>>> +     * proceed as expected.
> >>>>> +     */
> >>>>> +    if ( !ctx->wake_cpu )
> >>>>> +    {
> >>>>> +        dprintk(XENLOG_INFO, "%pd: Wake CPU pointer context was no=
t provided\n",
> >>>>> +                d);
> >>>>> +        return 0;
> >>>>> +    }
> >>>>> +
> >>>>> +    rc =3D vpsci_vcpu_up_prepare(ctx->wake_cpu , ctx->ep, ctx->cid=
);
> >>>>> +    if ( rc )
> >>>>> +        printk("%pd: Failed to resume domain (ret %d)\n", d, rc);
> >>>>> +
> >>>>> +    memset(ctx, 0, sizeof(*ctx));
> >>>>> +
> >>>>> +    return rc;
> >>>>> +}
> >>>>> +
> >>>>>  static int is_guest_pv32_psr(uint32_t psr)
> >>>>>  {
> >>>>>      switch (psr & PSR_MODE_MASK)
> >>>>> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/inclu=
de/asm/domain.h
> >>>>> index af3e168374..e637cb4de0 100644
> >>>>> --- a/xen/arch/arm/include/asm/domain.h
> >>>>> +++ b/xen/arch/arm/include/asm/domain.h
> >>>>> @@ -5,6 +5,7 @@
> >>>>>  #include <xen/timer.h>
> >>>>>  #include <asm/page.h>
> >>>>>  #include <asm/p2m.h>
> >>>>> +#include <asm/suspend.h>
> >>>>>  #include <asm/vfp.h>
> >>>>>  #include <asm/mmio.h>
> >>>>>  #include <asm/gic.h>
> >>>>> @@ -126,6 +127,7 @@ struct arch_domain
> >>>>>      void *sci_data;
> >>>>>  #endif
> >>>>>
> >>>>> +    struct resume_info resume_ctx;
> >>>>>  }  __cacheline_aligned;
> >>>>>
> >>>>>  struct arch_vcpu
> >>>>> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/i=
nclude/asm/perfc_defn.h
> >>>>> index effd25b69e..8dfcac7e3b 100644
> >>>>> --- a/xen/arch/arm/include/asm/perfc_defn.h
> >>>>> +++ b/xen/arch/arm/include/asm/perfc_defn.h
> >>>>> @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: sy=
stem_reset")
> >>>>>  PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
> >>>>>  PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
> >>>>>  PERFCOUNTER(vpsci_features,            "vpsci: features")
> >>>>> +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
> >>>>>
> >>>>>  PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
> >>>>>
> >>>>> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include=
/asm/psci.h
> >>>>> index 4780972621..48a93e6b79 100644
> >>>>> --- a/xen/arch/arm/include/asm/psci.h
> >>>>> +++ b/xen/arch/arm/include/asm/psci.h
> >>>>> @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
> >>>>>  #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
> >>>>>  #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
> >>>>>  #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
> >>>>> +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
> >>>>>
> >>>>>  #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
> >>>>>  #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
> >>>>>  #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
> >>>>> +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
> >>>>>
> >>>>>  /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
> >>>>>  #define PSCI_0_2_AFFINITY_LEVEL_ON      0
> >>>>> diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/incl=
ude/asm/suspend.h
> >>>>> new file mode 100644
> >>>>> index 0000000000..b991a94d5a
> >>>>> --- /dev/null
> >>>>> +++ b/xen/arch/arm/include/asm/suspend.h
> >>>>> @@ -0,0 +1,24 @@
> >>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>>>> +
> >>>>> +#ifndef __ARM_SUSPEND_H__
> >>>> There should be no double underscores in guards (see examples in COD=
ING_STYLE)
> >>>
> >>> I had initially followed the style used by some of the existing heade=
rs
> >>> in this directory, which still use guards with double underscores.
> >>>
> >>> I'll remove underscores in the next series.
> >>>
> >>>>> +#define __ARM_SUSPEND_H__
> >>>>> +
> >>>>> +struct resume_info {
> >>>>> +    register_t ep;
> >>>>> +    register_t cid;
> >>>>> +    struct vcpu *wake_cpu;
> >>>>> +};
> >>>>> +
> >>>>> +int arch_domain_resume(struct domain *d);
> >>>> If possible, headers should be standalone, meaning you should includ=
e necessary
> >>>> headers or forward declare what's missing.
> >>>
> >>> Thanks for the comment.
> >>>
> >>> My initial intention was to avoid adding new dependencies from asm
> >>> headers to higher-level Xen headers, so I did not include e.g.
> >>> <xen/sched.h> directly here. In this header we only need pointers to
> >>> struct domain and struct vcpu, we never dereference them, so forward
> >>> declarations would be sufficient to make it standalone.
> >>>
> >>> I also noticed that some existing asm headers in this directory do
> >>> include higher-level Xen headers, so both patterns exist in the tree.
> >>>
> >>> If you prefer, I can either:
> >>>   - add forward declarations
> >>>
> >>>       struct domain;
> >>>       struct vcpu;
> >>>
> >>>     at the top of this header and keep the full includes in the .c
> >>>     files that actually dereference these types, or
> >>>
> >>>   - include the appropriate Xen header(s) directly in this header.
> >>>
> >>> Personally I slightly prefer the forward-declaration approach to keep
> >>> this header lightweight and avoid tightening the layering, but I am
> >>> happy to follow your preference.
> >> My preference is also to forward declare these structs.
> >>
> >>>
> >>>>
> >>>>> +
> >>>>> +#endif /* __ARM_SUSPEND_H__ */
> >>>>> +
> >>>>> + /*
> >>>>> +  * Local variables:
> >>>>> +  * mode: C
> >>>>> +  * c-file-style: "BSD"
> >>>>> +  * c-basic-offset: 4
> >>>>> +  * tab-width: 4
> >>>>> +  * indent-tabs-mode: nil
> >>>>> +  * End:
> >>>>> +  */
> >>>>> diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/includ=
e/asm/vpsci.h
> >>>>> index 0cca5e6830..d790ab3715 100644
> >>>>> --- a/xen/arch/arm/include/asm/vpsci.h
> >>>>> +++ b/xen/arch/arm/include/asm/vpsci.h
> >>>>> @@ -23,12 +23,15 @@
> >>>>>  #include <asm/psci.h>
> >>>>>
> >>>>>  /* Number of function implemented by virtual PSCI (only 0.2 or lat=
er) */
> >>>>> -#define VPSCI_NR_FUNCS  12
> >>>>> +#define VPSCI_NR_FUNCS  14
> >>>>>
> >>>>>  /* Functions handle PSCI calls from the guests */
> >>>>>  bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
> >>>>>  bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid);
> >>>>>
> >>>>> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> >>>>> +                          register_t context_id);
> >>>>> +
> >>>>>  #endif /* __ASM_VPSCI_H__ */
> >>>>>
> >>>>>  /*
> >>>>> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> >>>>> index 7ba9ccd94b..22c3a5f544 100644
> >>>>> --- a/xen/arch/arm/vpsci.c
> >>>>> +++ b/xen/arch/arm/vpsci.c
> >>>>> @@ -10,32 +10,16 @@
> >>>>>
> >>>>>  #include <public/sched.h>
> >>>>>
> >>>>> -static int do_common_cpu_on(register_t target_cpu, register_t entr=
y_point,
> >>>>> -                            register_t context_id)
> >>>>> +int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
> >>>>> +                   register_t context_id)
> >>>> NIT: incorrect parameter alignment
> >>>
> >>> ack
> >>>
> >>>>
> >>>>>  {
> >>>>> -    struct vcpu *v;
> >>>>> -    struct domain *d =3D current->domain;
> >>>>> -    struct vcpu_guest_context *ctxt;
> >>>>>      int rc;
> >>>>> +    struct domain *d =3D v->domain;
> >>>>>      bool is_thumb =3D entry_point & 1;
> >>>>> -    register_t vcpuid;
> >>>>> -
> >>>>> -    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> >>>>> -
> >>>>> -    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> >>>>> -        return PSCI_INVALID_PARAMETERS;
> >>>>> -
> >>>>> -    /* THUMB set is not allowed with 64-bit domain */
> >>>>> -    if ( is_64bit_domain(d) && is_thumb )
> >>>>> -        return PSCI_INVALID_ADDRESS;
> >>>>> -
> >>>>> -    if ( !test_bit(_VPF_down, &v->pause_flags) )
> >>>>> -        return PSCI_ALREADY_ON;
> >>>>> +    struct vcpu_guest_context *ctxt;
> >>>>>
> >>>>>      if ( (ctxt =3D alloc_vcpu_guest_context()) =3D=3D NULL )
> >>>>> -        return PSCI_DENIED;
> >>>>> -
> >>>>> -    vgic_clear_pending_irqs(v);
> >>>>> +        return -ENOMEM;
> >>>>>
> >>>>>      memset(ctxt, 0, sizeof(*ctxt));
> >>>>>      ctxt->user_regs.pc64 =3D (u64) entry_point;
> >>>>> @@ -76,8 +60,37 @@ static int do_common_cpu_on(register_t target_cp=
u, register_t entry_point,
> >>>>>      free_vcpu_guest_context(ctxt);
> >>>>>
> >>>>>      if ( rc < 0 )
> >>>>> +        return rc;
> >>>>> +
> >>>>> +    return 0;
> >>>>> +}
> >>>>> +
> >>>>> +static int do_common_cpu_on(register_t target_cpu, register_t entr=
y_point,
> >>>>> +                            register_t context_id)
> >>>>> +{
> >>>>> +    struct vcpu *v;
> >>>>> +    struct domain *d =3D current->domain;
> >>>>> +    int rc;
> >>>>> +    bool is_thumb =3D entry_point & 1;
> >>>>> +    register_t vcpuid;
> >>>>> +
> >>>>> +    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> >>>>> +
> >>>>> +    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> >>>>> +        return PSCI_INVALID_PARAMETERS;
> >>>>> +
> >>>>> +    /* THUMB set is not allowed with 64-bit domain */
> >>>>> +    if ( is_64bit_domain(d) && is_thumb )
> >>>>> +        return PSCI_INVALID_ADDRESS;
> >>>>> +
> >>>>> +    if ( !test_bit(_VPF_down, &v->pause_flags) )
> >>>>> +        return PSCI_ALREADY_ON;
> >>>>> +
> >>>>> +    rc =3D vpsci_vcpu_up_prepare(v, entry_point, context_id);
> >>>>> +    if ( rc )
> >>>>>          return PSCI_DENIED;
> >>>>>
> >>>>> +    vgic_clear_pending_irqs(v);
> >>>>>      vcpu_wake(v);
> >>>>>
> >>>>>      return PSCI_SUCCESS;
> >>>>> @@ -197,6 +210,48 @@ static void do_psci_0_2_system_reset(void)
> >>>>>      domain_shutdown(d,SHUTDOWN_reboot);
> >>>>>  }
> >>>>>
> >>>>> +static int32_t do_psci_1_0_system_suspend(register_t epoint, regis=
ter_t cid)
> >>>>> +{
> >>>>> +    int32_t rc;
> >>>>> +    struct vcpu *v;
> >>>>> +    struct domain *d =3D current->domain;
> >>>>> +    bool is_thumb =3D epoint & 1;
> >>>>> +
> >>>>> +    /* THUMB set is not allowed with 64-bit domain */
> >>>>> +    if ( is_64bit_domain(d) && is_thumb )
> >>>>> +        return PSCI_INVALID_ADDRESS;
> >>>>> +
> >>>>> +    /* SYSTEM_SUSPEND is not supported for the hardware domain yet=
 */
> >>>>> +    if ( is_hardware_domain(d) )
> >>>>> +        return PSCI_NOT_SUPPORTED;
> >>>>> +
> >>>>> +    /* Ensure that all CPUs other than the calling one are offline=
 */
> >>>>> +    domain_lock(d);
> >>>>> +    for_each_vcpu ( d, v )
> >>>>> +    {
> >>>>> +        if ( v !=3D current && is_vcpu_online(v) )
> >>>>> +        {
> >>>>> +            domain_unlock(d);
> >>>>> +            return PSCI_DENIED;
> >>>>> +        }
> >>>>> +    }
> >>>>> +    domain_unlock(d);
> >>>>> +
> >>>>> +    rc =3D domain_shutdown(d, SHUTDOWN_suspend);
> >>>>> +    if ( rc )
> >>>>> +        return PSCI_DENIED;
> >>>>> +
> >>>>> +    d->arch.resume_ctx.ep =3D epoint;
> >>>>> +    d->arch.resume_ctx.cid =3D cid;
> >>>>> +    d->arch.resume_ctx.wake_cpu =3D current;
> >>>>> +
> >>>>> +    gprintk(XENLOG_DEBUG,
> >>>>> +            "SYSTEM_SUSPEND requested, epoint=3D0x%"PRIregister", =
cid=3D0x%"PRIregister"\n",
> >>>> NIT: %# is preffered over 0x%.
> >>>
> >>> ack
> >>>
> >>>>
> >>>>> +            epoint, cid);
> >>>>> +
> >>>>> +    return rc;
> >>>>> +}
> >>>>> +
> >>>>>  static int32_t do_psci_1_0_features(uint32_t psci_func_id)
> >>>>>  {
> >>>>>      /* /!\ Ordered by function ID and not name */
> >>>>> @@ -214,6 +269,8 @@ static int32_t do_psci_1_0_features(uint32_t ps=
ci_func_id)
> >>>>>      case PSCI_0_2_FN32_SYSTEM_OFF:
> >>>>>      case PSCI_0_2_FN32_SYSTEM_RESET:
> >>>>>      case PSCI_1_0_FN32_PSCI_FEATURES:
> >>>>> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> >>>>> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> >>>>>      case ARM_SMCCC_VERSION_FID:
> >>>>>          return 0;
> >>>>>      default:
> >>>>> @@ -344,6 +401,23 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *r=
egs, uint32_t fid)
> >>>>>          return true;
> >>>>>      }
> >>>>>
> >>>>> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> >>>>> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> >>>>> +    {
> >>>>> +        register_t epoint =3D PSCI_ARG(regs, 1);
> >>>>> +        register_t cid =3D PSCI_ARG(regs, 2);
> >>>>> +
> >>>>> +        if ( fid =3D=3D PSCI_1_0_FN32_SYSTEM_SUSPEND )
> >>>>> +        {
> >>>>> +            epoint &=3D GENMASK(31, 0);
> >>>>> +            cid &=3D GENMASK(31, 0);
> >>>>> +        }
> >>>>> +
> >>>>> +        perfc_incr(vpsci_system_suspend);
> >>>>> +        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, c=
id));
> >>>>> +        return true;
> >>>>> +    }
> >>>>> +
> >>>>>      default:
> >>>>>          return false;
> >>>>>      }
> >>>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
> >>>>> index 775c339285..6410d32970 100644
> >>>>> --- a/xen/common/domain.c
> >>>>> +++ b/xen/common/domain.c
> >>>>> @@ -26,6 +26,7 @@
> >>>>>  #include <xen/hypercall.h>
> >>>>>  #include <xen/delay.h>
> >>>>>  #include <xen/shutdown.h>
> >>>>> +#include <xen/suspend.h>
> >>>>>  #include <xen/percpu.h>
> >>>>>  #include <xen/multicall.h>
> >>>>>  #include <xen/rcupdate.h>
> >>>>> @@ -1363,6 +1364,9 @@ void domain_resume(struct domain *d)
> >>>>>
> >>>>>      spin_lock(&d->shutdown_lock);
> >>>>>
> >>>>> +    if ( arch_domain_resume(d) )
> >>>>> +        goto fail;
> >>>>> +
> >>>>>      d->is_shutting_down =3D d->is_shut_down =3D 0;
> >>>>>      d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
> >>>>>
> >>>>> @@ -1373,6 +1377,7 @@ void domain_resume(struct domain *d)
> >>>>>          v->paused_for_shutdown =3D 0;
> >>>>>      }
> >>>>>
> >>>>> + fail:
> >>>>>      spin_unlock(&d->shutdown_lock);
> >>>>>
> >>>>>      domain_unpause(d);
> >>>>> diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
> >>>>> new file mode 100644
> >>>>> index 0000000000..53f75fd6ad
> >>>>> --- /dev/null
> >>>>> +++ b/xen/include/xen/suspend.h
> >>>>> @@ -0,0 +1,15 @@
> >>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>>>> +#ifndef __XEN_SUSPEND_H__
> >>>> There should be no double underscores in guards
> >>>
> >>> I initially followed the style used by the existing headers in this
> >>> directory, which still have include guards with double underscores.
> >>>
> >>> You are right that this does not match CODING_STYLE examples.
> >>> I will update this header to use a proper guard name.
> >>>
> >>>>
> >>>>> +#define __XEN_SUSPEND_H__
> >>>>> +
> >>>>> +#if __has_include(<asm/suspend.h>)
> >>>>> +#include <asm/suspend.h>
> >>>>> +#else
> >>>>> +static inline int arch_domain_resume(struct domain *d)
> >>>>> +{
> >>>>> +    return 0;
> >>>>> +}
> >>>>> +#endif
> >>>>> +
> >>>> Stray whiteline?
> >>>
> >>> will drop
> >>>
> >>>>
> >>>>> +
> >>>>> +#endif /* __XEN_SUSPEND_H__ */
> >>>> Missing emacs block?
> >>>
> >>> It is permitted but isn't necessary as far as know,
> >>> but if it needed here per your opinion I'll add it
> >>> just let me know
> >> On Arm we usually require them and that's the overall preference I wou=
ld say.
> >>
> >>>
> >>>>
> >>>> Did you run MISRA scan on this patch?
> >>>
> >>> Yes, I ran it with:
> >>>
> >>>   ./xen/scripts/xen-analysis.py \
> >>>       --run-cppcheck --cppcheck-misra --cppcheck-html -- \
> >>>       XEN_TARGET_ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu-
> >>>
> >>> The analysis did not report any new MISRA violations in the code
> >>> touched by this patch.
> >> That's only cppcheck scan which is rather poor in finding violations. =
ECLAIR
> >> scan is done through Gitlab CI and this one is what we rely on for tak=
ing the
> >> series in.
> >
> > Thanks for the clarification.
> >
> > Is it possible to run the ECLAIR MISRA scan locally, or is it only
> > available via the project Gitlab CI instance? If there is a way to run
> > it on a developer machine, I would be happy to set it up and check this
> > series with the same configuration.
> It's not possible to run it locally. But you can use your (if you don't h=
ave,
> ask on Matrix) Xen fork under https://gitlab.com/xen-project/people to pu=
sh a
> branch and trigger the CI (ECLAIR scan needs to be manually executed from=
 the
> pipeline page).

Got it, thanks.

~Mykola

>
> ~Michal
>

