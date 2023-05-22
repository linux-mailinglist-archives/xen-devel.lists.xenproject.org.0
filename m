Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2719570BEA4
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 14:46:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537916.837555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q14vR-0007zP-7p; Mon, 22 May 2023 12:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537916.837555; Mon, 22 May 2023 12:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q14vR-0007xk-4M; Mon, 22 May 2023 12:46:09 +0000
Received: by outflank-mailman (input) for mailman id 537916;
 Mon, 22 May 2023 12:46:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yzf4=BL=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q14vQ-0007xe-0L
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 12:46:08 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ebba97a-f89e-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 14:46:07 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50bcb229adaso10984563a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 May 2023 05:46:07 -0700 (PDT)
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
X-Inumbo-ID: 9ebba97a-f89e-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684759566; x=1687351566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrvcRyygRNuD3AdW/ijyBdVckx6G34+02tg4NrkxHb8=;
        b=TM+nuN0TCzUoWgApDuPHZLVc4uiGWdIwrP4czj+TQzbK2+ApP+gaF7ii3ibBZAq9fe
         Bc+bGfgRMRFN7I0aCS3v0x0A8Ri1uc9Ao8ktPuLVZxMnYMR6J/d1OaZBsAQ+3rwOZa0+
         XcEVDuB5f4kskcRh95QOvsc+clBwNAsv0E6rCpWmTI3+xIKmQheHLoPh7PKZ8wCZEjxn
         5uWXf6P80Kcuos++TW1D6NXLLtNMGQ9kMXsH8ces5SllQDeSOAZQxckqBMNo7EQeF65v
         LLs4HXaDbZM3OIjIacr2MSI7qxJEnOq7gCkzupHyXJjg4dH77EhSW8twxAL1O4imsKoU
         jUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684759566; x=1687351566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrvcRyygRNuD3AdW/ijyBdVckx6G34+02tg4NrkxHb8=;
        b=FjrQHOsNfSaSscxEs1/1ZpPJIyonUiSvplIVSNb4ojInbglIUAARCjtJprZwGdExXH
         yYKiWoBci9m9Y5htaPFrXKYbNsH6+6BcdkG9/L+6VrXKVCbjjd78nvwKv/eFbxYFLyvD
         mqLkiGUEYvu7QNpBfrW8oxvBPyUJEiGAN/0ttDOWpt+KgEM1Vm2+gbStJya9UC97IEtT
         O576ASvNC+hFmUca2GZntbcxfUWeSjyxzyVW4lGoVvQQcdZaR+0cgUCRBABYgEyz3u4h
         w8vURH3EO1vdx3VH4/U0zCnCVx9Ia5N6iE5bd463I2H/WdmudtenR4//908TLIvscCDO
         lR+w==
X-Gm-Message-State: AC+VfDxaizHgOACuhWZHEeX12KPx2e5u4+NaYkaijN6Go8gd42FdA03w
	hQernxPSyVTIULjqKhYaeX/CzIIQ40FCU6ZKH97tsSRm
X-Google-Smtp-Source: ACHHUZ5iYJ6IUei0qb0sS5Wg/wTmkIvJ+luxLlethB7uVGxXnQRMSQYKHGi4FbUMbxUEkwkVkncKPrf5ubwhaPCAQxA=
X-Received: by 2002:a50:ee8f:0:b0:506:8838:45cc with SMTP id
 f15-20020a50ee8f000000b00506883845ccmr8822179edr.6.1684759566299; Mon, 22 May
 2023 05:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230501193034.88575-1-jandryuk@gmail.com> <20230501193034.88575-11-jandryuk@gmail.com>
 <1166bdf1-4d54-30bb-bdf9-65dfaeb6b29e@suse.com>
In-Reply-To: <1166bdf1-4d54-30bb-bdf9-65dfaeb6b29e@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 22 May 2023 08:45:53 -0400
Message-ID: <CAKf6xpti23_fmwVWOafjUU+OPHPOA7EWOfkShGT9Qqr9=mR9zQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/14 RESEND] xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 8, 2023 at 7:27=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 01.05.2023 21:30, Jason Andryuk wrote:
> > @@ -531,6 +533,100 @@ int get_hwp_para(const struct cpufreq_policy *pol=
icy,
> >      return 0;
> >  }
> >
> > +int set_hwp_para(struct cpufreq_policy *policy,
> > +                 struct xen_set_hwp_para *set_hwp)
>
> const?

set_hwp can be const.  policy is passed to hwp_cpufreq_target() &
on_selected_cpus(), so it cannot readily be made const.

> > +{
> > +    unsigned int cpu =3D policy->cpu;
> > +    struct hwp_drv_data *data =3D per_cpu(hwp_drv_data, cpu);
> > +
> > +    if ( data =3D=3D NULL )
> > +        return -EINVAL;
> > +
> > +    /* Validate all parameters first */
> > +    if ( set_hwp->set_params & ~XEN_SYSCTL_HWP_SET_PARAM_MASK )
> > +        return -EINVAL;
> > +
> > +    if ( set_hwp->activity_window & ~XEN_SYSCTL_HWP_ACT_WINDOW_MASK )
> > +        return -EINVAL;
>
> Below you limit checks to when the respective control bit is set. I
> think you want the same here.

Not sure if you mean feature_hwp_activity_window or the bit in
set_params as control bit.  But, yes, they can both use some
additional checking.  IIRC, I wanted to always check
~XEN_SYSCTL_HWP_ACT_WINDOW_MASK, because bits should never be set
whether or not the activity window is supported by hardware.

> > +    if ( !feature_hwp_energy_perf &&
> > +         (set_hwp->set_params & XEN_SYSCTL_HWP_SET_ENERGY_PERF) &&
> > +         set_hwp->energy_perf > IA32_ENERGY_BIAS_MAX_POWERSAVE )
> > +        return -EINVAL;
> > +
> > +    if ( (set_hwp->set_params & XEN_SYSCTL_HWP_SET_DESIRED) &&
> > +         set_hwp->desired !=3D 0 &&
> > +         (set_hwp->desired < data->hw.lowest ||
> > +          set_hwp->desired > data->hw.highest) )
> > +        return -EINVAL;
> > +
> > +    /*
> > +     * minimum & maximum are not validated as hardware doesn't seem to=
 care
> > +     * and the SDM says CPUs will clip internally.
> > +     */
> > +
> > +    /* Apply presets */
> > +    switch ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_PRESET_MASK )
> > +    {
> > +    case XEN_SYSCTL_HWP_SET_PRESET_POWERSAVE:
> > +        data->minimum =3D data->hw.lowest;
> > +        data->maximum =3D data->hw.lowest;
> > +        data->activity_window =3D 0;
> > +        if ( feature_hwp_energy_perf )
> > +            data->energy_perf =3D HWP_ENERGY_PERF_MAX_POWERSAVE;
> > +        else
> > +            data->energy_perf =3D IA32_ENERGY_BIAS_MAX_POWERSAVE;
> > +        data->desired =3D 0;
> > +        break;
> > +
> > +    case XEN_SYSCTL_HWP_SET_PRESET_PERFORMANCE:
> > +        data->minimum =3D data->hw.highest;
> > +        data->maximum =3D data->hw.highest;
> > +        data->activity_window =3D 0;
> > +        data->energy_perf =3D HWP_ENERGY_PERF_MAX_PERFORMANCE;
> > +        data->desired =3D 0;
> > +        break;
> > +
> > +    case XEN_SYSCTL_HWP_SET_PRESET_BALANCE:
> > +        data->minimum =3D data->hw.lowest;
> > +        data->maximum =3D data->hw.highest;
> > +        data->activity_window =3D 0;
> > +        if ( feature_hwp_energy_perf )
> > +            data->energy_perf =3D HWP_ENERGY_PERF_BALANCE;
> > +        else
> > +            data->energy_perf =3D IA32_ENERGY_BIAS_BALANCE;
> > +        data->desired =3D 0;
> > +        break;
> > +
> > +    case XEN_SYSCTL_HWP_SET_PRESET_NONE:
> > +        break;
> > +
> > +    default:
> > +        return -EINVAL;
> > +    }
>
> So presets set all the values for which the individual item control bits
> are clear. That's not exactly what I would have expected, and it took me
> reading the code several times until I realized that you write life per-
> CPU data fields here, not fields of some intermediate variable. I think
> this could do with saying explicitly in the public header (if indeed the
> intended model).

The commit message mentioned the idea of using a preset and further
refinement.  The comments above "/* Apply presets */" and below "/*
Further customize presets if needed */" were an attempt to highlight
that.  But you are right that the public header should state this
clearly.

> > +    /* Further customize presets if needed */
> > +    if ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_MINIMUM )
> > +        data->minimum =3D set_hwp->minimum;
> > +
> > +    if ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_MAXIMUM )
> > +        data->maximum =3D set_hwp->maximum;
> > +
> > +    if ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_ENERGY_PERF )
> > +        data->energy_perf =3D set_hwp->energy_perf;
> > +
> > +    if ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_DESIRED )
> > +        data->desired =3D set_hwp->desired;
> > +
> > +    if ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_ACT_WINDOW )
> > +        data->activity_window =3D set_hwp->activity_window &
> > +                                XEN_SYSCTL_HWP_ACT_WINDOW_MASK;
> > +
> > +    hwp_cpufreq_target(policy, 0, 0);
> > +
> > +    return 0;
>
> I don't think you should assume here that hwp_cpufreq_target() will
> only ever return 0. Plus by returning its return value here you
> allow the compiler to tail-call optimize this code.

Thanks for catching that.  Yeah, I made hwp_cpufreq_target() return a
value per your earlier comment, so its value should be returned now.

> > --- a/xen/drivers/acpi/pmstat.c
> > +++ b/xen/drivers/acpi/pmstat.c
> > @@ -398,6 +398,20 @@ static int set_cpufreq_para(struct xen_sysctl_pm_o=
p *op)
> >      return ret;
> >  }
> >
> > +static int set_cpufreq_hwp(struct xen_sysctl_pm_op *op)
>
> const?

Yes

> > --- a/xen/include/public/sysctl.h
> > +++ b/xen/include/public/sysctl.h
> > @@ -317,6 +317,34 @@ struct xen_hwp_para {
> >      uint8_t energy_perf;
> >  };
> >
> > +/* set multiple values simultaneously when set_args bit is set */
>
> What "set_args bit" does this comment refer to?

That should be set_params. IIRC, set_args was the previous name.

> > +struct xen_set_hwp_para {
> > +#define XEN_SYSCTL_HWP_SET_DESIRED              (1U << 0)
> > +#define XEN_SYSCTL_HWP_SET_ENERGY_PERF          (1U << 1)
> > +#define XEN_SYSCTL_HWP_SET_ACT_WINDOW           (1U << 2)
> > +#define XEN_SYSCTL_HWP_SET_MINIMUM              (1U << 3)
> > +#define XEN_SYSCTL_HWP_SET_MAXIMUM              (1U << 4)
> > +#define XEN_SYSCTL_HWP_SET_PRESET_MASK          0xf000
> > +#define XEN_SYSCTL_HWP_SET_PRESET_NONE          0x0000
> > +#define XEN_SYSCTL_HWP_SET_PRESET_BALANCE       0x1000
> > +#define XEN_SYSCTL_HWP_SET_PRESET_POWERSAVE     0x2000
> > +#define XEN_SYSCTL_HWP_SET_PRESET_PERFORMANCE   0x3000
> > +#define XEN_SYSCTL_HWP_SET_PARAM_MASK ( \
> > +                                  XEN_SYSCTL_HWP_SET_PRESET_MASK | \
> > +                                  XEN_SYSCTL_HWP_SET_DESIRED     | \
> > +                                  XEN_SYSCTL_HWP_SET_ENERGY_PERF | \
> > +                                  XEN_SYSCTL_HWP_SET_ACT_WINDOW  | \
> > +                                  XEN_SYSCTL_HWP_SET_MINIMUM     | \
> > +                                  XEN_SYSCTL_HWP_SET_MAXIMUM     )
> > +    uint16_t set_params; /* bitflags for valid values */
> > +#define XEN_SYSCTL_HWP_ACT_WINDOW_MASK          0x03ff
> > +    uint16_t activity_window; /* See comment in struct xen_hwp_para */
> > +    uint8_t minimum;
> > +    uint8_t maximum;
> > +    uint8_t desired;
> > +    uint8_t energy_perf; /* 0-255 or 0-15 depending on HW support */
>
> Instead of (or in addition to) the "HW support" reference, could this
> gain a reference to the "get para" bit determining which range to use?

I've removed the fallback 0-15 support locally, so this will be removed.

Regards,
Jason

