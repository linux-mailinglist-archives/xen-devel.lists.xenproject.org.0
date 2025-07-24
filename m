Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37473B1025D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 09:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055387.1423816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqlL-0005jg-Q0; Thu, 24 Jul 2025 07:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055387.1423816; Thu, 24 Jul 2025 07:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueqlL-0005gw-MO; Thu, 24 Jul 2025 07:53:11 +0000
Received: by outflank-mailman (input) for mailman id 1055387;
 Thu, 24 Jul 2025 07:53:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t79f=2F=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ueqlJ-0005gq-SL
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 07:53:09 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d305521-6863-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 09:53:08 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-32b8134ef6aso6693541fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 00:53:08 -0700 (PDT)
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
X-Inumbo-ID: 3d305521-6863-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753343588; x=1753948388; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjJ/BBLaNbgtE/VnYMafFs3yIkYjuLzyovCGGTCqb5A=;
        b=N92VeoJbWtpuGjfJvg4pF/HeH2QyNv/TliEQ78zTTUrEHi7fo+wZyMLbXz+f80sTbE
         votoGeHn6rwmxb8hwm6wMrXqh6lLc9n9s7tmFGhpWQU+UQvlU+nltufOX3NgkqvBJMt0
         TyljtkU9lsRBwFwtiG3/sjr9W2uldsA5z5ylkTGyjm9PotYTW+B6ZwM4v4hxfNVzCdmz
         Aq5338tMnmO1lakkobSoMUnz/uoY4FsXM3ls2oCK1Zs2KM+jTP47j0enJHhOOH9YRTQr
         FeGG+2mOElfojTbkIvcSBEQJuHQ3pPZN0buYXv9IOJG+KmmSSOHf0d4kzl64o5IPSi5+
         D5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753343588; x=1753948388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjJ/BBLaNbgtE/VnYMafFs3yIkYjuLzyovCGGTCqb5A=;
        b=VWFvUDNpyfmewH66rf9dVDnNHgXiiUU16uC7lRWIcpc2nncyppGbG3BOfxfFZekwsZ
         ZXjGQcwWhjl40YGi2wtuetUF5IuzefkSzynguyKW979AaogGiQI0XPPX9Fob71Ho28my
         LGwkMz/iYPzUN4ofuW2kescr+4pjel2h1I4ZUFpe1AUcb7Qyw4Ya9q06Xd5Wo1+u58dW
         Z5DEn+v1SY73sqqvdX8OQSuVMP62J5GjvCktDuzB1Ns7bBK5KccTA5edST1RLD+mifuW
         kwCAGyO6tROy6uanWg+5kGJpsd1/Ojq70KhOeJFtCW7hcIawcto1RSdfh8sWPvj480Lb
         ogZA==
X-Forwarded-Encrypted: i=1; AJvYcCVMlDS0TeAGtHVFCMIgmod7gcqvtkvQMUetJmJueNy5CmA4U3Q8VTAx+1n8RMlfJIGDdvkCRn1Op7U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgeNgYIKb2M1jSR1Xh1iIJuYGyaYHe+6AHAetjhQBcBTWBW03k
	/46+d8ODXMOKoXRgXrSNQX0HMeo4Eqh0HpWDyX4Qcnb4QZzS/rlc4iHEPb4tqUMAAWQUyl5VRml
	BmrCYfjWV5dAJvN4kUuHuI8sqwg3Dyv4=
X-Gm-Gg: ASbGncsYkUCIG09CMoOhdG9z7ResYY9+cq+sMi5cyQ1kk/fM3fJsHUZ757paRz4774h
	6EFLUd1zd1PMsRymHmDr1xqqNiTmcv2P4cjPQnMMzJWGRohdvE2HvwldvfT+Htrq2s95C166uT3
	G6T/2jwtvacBJO6zTa3CAMOtBeM6+tV3zCAyJ5GXuUZkyCVed4qn23oHt9ohv+lWCLt4PUC3MBg
	NeL5g==
X-Google-Smtp-Source: AGHT+IGTiovLr5kpHE6XgRtUve7hSxOfqX1D3jDcYxV4uMy3wQ6FU4QiAkYV3LewEUg0dSN+3ktkTso9n6CiUwJD0rc=
X-Received: by 2002:a05:651c:622:b0:32a:69c7:7b0b with SMTP id
 38308e7fff4ca-330dfca70f8mr12022891fa.12.1753343587663; Thu, 24 Jul 2025
 00:53:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751020456.git.mykola_kvach@epam.com> <072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola_kvach@epam.com>
 <066c6e93-a478-4c8f-b161-d109bd0e6bb4@xen.org> <9669f64d-06a0-4c56-b7d3-8b0abe7a1d4b@suse.com>
In-Reply-To: <9669f64d-06a0-4c56-b7d3-8b0abe7a1d4b@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 24 Jul 2025 10:52:55 +0300
X-Gm-Features: Ac12FXyUDA-iE4zUGcXgXt1yCKRaMoKDkUIuEaHiWZFMBjeVzI-m3MJj5-F6Fdc
Message-ID: <CAGeoDV-_rfhVNWqvAymV=HxurjaLLqukQuNTfvVdVeFTZgc-cw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
	Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi J=C3=BCrgen,

On Mon, Jul 21, 2025 at 11:08=E2=80=AFAM J=C3=BCrgen Gro=C3=9F <jgross@suse=
.com> wrote:
>
> On 28.06.25 20:17, Julien Grall wrote:
> > Hi Mykola,
> >
> > On 27/06/2025 11:51, Mykola Kvach wrote:
> >> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/incl=
ude/asm/
> >> perfc_defn.h
> >> index effd25b69e..8dfcac7e3b 100644
> >> --- a/xen/arch/arm/include/asm/perfc_defn.h
> >> +++ b/xen/arch/arm/include/asm/perfc_defn.h
> >> @@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: syste=
m_reset")
> >>   PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
> >>   PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
> >>   PERFCOUNTER(vpsci_features,            "vpsci: features")
> >> +PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
> >>   PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
> >> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/as=
m/psci.h
> >> index 4780972621..48a93e6b79 100644
> >> --- a/xen/arch/arm/include/asm/psci.h
> >> +++ b/xen/arch/arm/include/asm/psci.h
> >> @@ -47,10 +47,12 @@ void call_psci_system_reset(void);
> >>   #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
> >>   #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
> >>   #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
> >> +#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
> >>   #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
> >>   #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
> >>   #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
> >> +#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
> >>   /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
> >>   #define PSCI_0_2_AFFINITY_LEVEL_ON      0
> >> diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/a=
sm/vpsci.h
> >> index 0cca5e6830..69d40f9d7f 100644
> >> --- a/xen/arch/arm/include/asm/vpsci.h
> >> +++ b/xen/arch/arm/include/asm/vpsci.h
> >> @@ -23,7 +23,7 @@
> >>   #include <asm/psci.h>
> >>   /* Number of function implemented by virtual PSCI (only 0.2 or later=
) */
> >> -#define VPSCI_NR_FUNCS  12
> >> +#define VPSCI_NR_FUNCS  14
> >>   /* Functions handle PSCI calls from the guests */
> >>   bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
> >> diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
> >> index 67296dabb5..f9c09a49e2 100644
> >> --- a/xen/arch/arm/mmu/p2m.c
> >> +++ b/xen/arch/arm/mmu/p2m.c
> >> @@ -6,6 +6,8 @@
> >>   #include <xen/sched.h>
> >>   #include <xen/softirq.h>
> >> +#include <public/sched.h>
> >> +
> >>   #include <asm/alternative.h>
> >>   #include <asm/event.h>
> >>   #include <asm/flushtlb.h>
> >> @@ -198,7 +200,9 @@ void dump_p2m_lookup(struct domain *d, paddr_t add=
r)
> >>    */
> >>   void p2m_save_state(struct vcpu *p)
> >>   {
> >> -    p->arch.sctlr =3D READ_SYSREG(SCTLR_EL1);
> >> +    if ( !(p->domain->is_shutting_down &&
> >> +           p->domain->shutdown_code =3D=3D SHUTDOWN_suspend) )
> >
> > This is definitely not obvious why you need to change p2m_save_state().=
 AFAIU,
> > you are doing this because when suspending the system, you will overwri=
te p-
> >  >arch.sctlr. However, this is super fragile. For instance, you still s=
eem to
> > overwrite TTBR{0,1} and TTBCR.
> >
> > TTBR{0,1} are technically unknown at boot. So it is fine to ignore them=
.  But
> > for TTBCR, I am not 100% whether this is supposed to be unknown.
> >
> > Anyway, adding more "if (...)" is not the right solution because in the=
 future
> > we may decide to reset more registers.
> >
> > It would be better if we stash the value sand then update the registers=
. Another
> > possibility would be to entirely skip the save path for CPUs that are t=
urned off
> > (after all this is a bit useless work...).
> >
> >> +static int do_common_cpu_on(register_t target_cpu, register_t entry_p=
oint,
> >> +                            register_t context_id)
> >> +{
> >> +    int rc;
> >> +    struct vcpu *v;
> >> +    struct domain *d =3D current->domain;
> >> +    register_t vcpuid;
> >> +
> >> +    vcpuid =3D vaffinity_to_vcpuid(target_cpu);
> >> +
> >> +    if ( (v =3D domain_vcpu(d, vcpuid)) =3D=3D NULL )
> >> +        return PSCI_INVALID_PARAMETERS;
> >> +
> >> +    if ( !test_bit(_VPF_down, &v->pause_flags) )
> >> +        return PSCI_ALREADY_ON;
> >> +
> >> +    rc =3D do_setup_vcpu_ctx(v, entry_point, context_id);
> >> +    if ( rc =3D=3D PSCI_SUCCESS )
> >> +        vcpu_wake(v);
> >> +
> >> +    return rc;
> >> +}
> >> +
> >>   static int32_t do_psci_cpu_on(uint32_t vcpuid, register_t entry_poin=
t)
> >>   {
> >>       int32_t ret;
> >> @@ -197,6 +208,52 @@ static void do_psci_0_2_system_reset(void)
> >>       domain_shutdown(d,SHUTDOWN_reboot);
> >>   }
> >> +static void do_resume_on_error(struct domain *d)
> >
> > This looks like an open-coding version of domain_resume() without the
> > domain_{,un}pause(). What worries me is there is a comment on top of
> > domain_pause() explaining why it is called. I understand, we can't call
> > domain_pause() here (it doesn't work on the current domain). However, i=
t feels
> > to me there is an explanation necessary why this is fine to diverge.
> >
> > I am not a scheduler expert, so I am CCing Juergen in the hope he could=
 provide
> > some inputs.
>
> I don't think the reason for domain_[un]pause() is directly scheduling
> related.
>
> It seems to be x86 specific for shadow page table handling.
>
> In any case I'd suggest to split domain_resume() into 2 functions, one
> of them (e.g. domain_resume_nopause()) replacing do_resume_on_error()
> and domain_resume() just pausing the domain, calling the new function,
> and then unpausing the domain again.

Got it =E2=80=94 thank you for the review!

>
> Another option might be to move the suspend action into a tasklet, enabli=
ng
> to call domain_resume() directly if needed. I didn't check whether other
> constraints even allow this idea, though.
>
>
> Juergen

Best regards,
Mykola

