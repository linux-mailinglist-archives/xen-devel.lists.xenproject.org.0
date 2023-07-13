Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02D4752819
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 18:12:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563320.880495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJyvW-0007cK-BI; Thu, 13 Jul 2023 16:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563320.880495; Thu, 13 Jul 2023 16:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJyvW-0007ZA-7d; Thu, 13 Jul 2023 16:12:22 +0000
Received: by outflank-mailman (input) for mailman id 563320;
 Thu, 13 Jul 2023 16:12:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eidt=C7=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qJyvU-0007Mt-Er
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 16:12:20 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a36813f-2198-11ee-8611-37d641c3527e;
 Thu, 13 Jul 2023 18:12:18 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51ff068c09cso1133845a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jul 2023 09:12:18 -0700 (PDT)
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
X-Inumbo-ID: 0a36813f-2198-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689264738; x=1691856738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tl+CXOA5MwBHYy19kkJS/DmYOxvrAr/t/y+6LdRo2mc=;
        b=YjXmlkMCZ/TpiM0JpS0id9JN2kBRdqA76yvYuHqEY+FfH1YwnKOfP1nv3XIw2Ypk2r
         ZKZIqeDSfvQSzWOY55K5kpZ1T8jHtbC6DDKeo5EJ280W6unEV4fEVO6KdRt1RPn28fs2
         e8a+yXKoYXV6FSNJk8AsHMHbPBzv5RKvbjG/+ZuYl+AY5jsgRaSFq6LprAmwlbokSdev
         Rxgrq00+ihiwAjnERyFmXbt65LYx3df05fumWcHbOlauY4t9StZ+aPNn9tgBwGpD5Y7E
         RBahIWw8/bRc7us7+a/6mmMcgQ81nnJ+A6F42JFP1c3nvl7FryloCBwwVUu/3yUoYAk3
         TGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689264738; x=1691856738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tl+CXOA5MwBHYy19kkJS/DmYOxvrAr/t/y+6LdRo2mc=;
        b=NGSIs61TCWSQKk43INrd4zVKvb1h+c8sHaqtY4rkUSuQe93ROG7bPDNLTThXqZK4Wa
         tdD91X8nZvfcnsCbgxLHacZTVdMVPEyATexdidywiqb1QwBOXAjCMT49xvFE1z9OmTWl
         dAZLeYzQnIwGDHaqMx5+MUP2b/a439/DeOhUpqIW/eA55AYp5TfoRtQ4x5lYFRV054mF
         1AT9++8kXJ2IiH2gv8MJp9A48Bk4zwF1Pfe4U8BHQOq+mxtzgLcNHp0S1EnHtbF+RuIE
         1KcjPgT8tfZIxlYAETv+ie86cXO/f8mG0ed5lL6kVZEkEKD1nNA4zlvnVDpjwo0Hvcds
         uCuA==
X-Gm-Message-State: ABy/qLaYBlW4RQu3kUmCXT3gHECjbIAPLdwczK7JQepjChBJ9yojY8jw
	mqG97VFrAmzOzCPWYn4rlfGDJ2lzJtCz7hXigjc=
X-Google-Smtp-Source: APBJJlHd7/LrjLbCTHc/nbjnQUA8OQtnrVuLCYrm0qPvgyrACn6PEy/UK0qKo+nIyAQLeJKQ4hN5VGHkE72LZl8hzO0=
X-Received: by 2002:aa7:c505:0:b0:51d:df5e:5674 with SMTP id
 o5-20020aa7c505000000b0051ddf5e5674mr2250366edq.1.1689264737785; Thu, 13 Jul
 2023 09:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230706185440.48333-1-jandryuk@gmail.com> <20230706185440.48333-13-jandryuk@gmail.com>
 <e398f2f3-3c12-5bbd-5bfb-d3fac7c1b23a@suse.com>
In-Reply-To: <e398f2f3-3c12-5bbd-5bfb-d3fac7c1b23a@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 13 Jul 2023 12:12:05 -0400
Message-ID: <CAKf6xpsUD8NusOBzW-p1YwH6daok5TXkHrDD_JQcSL3n3St7Hg@mail.gmail.com>
Subject: Re: [PATCH v5 12/15] xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 9:02=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 06.07.2023 20:54, Jason Andryuk wrote:
> > @@ -531,6 +535,103 @@ int get_hwp_para(unsigned int cpu,
> >      return 0;
> >  }
> >
> > +int set_hwp_para(struct cpufreq_policy *policy,
> > +                 struct xen_set_cppc_para *set_cppc)
> > +{
> > +    unsigned int cpu =3D policy->cpu;
> > +    struct hwp_drv_data *data =3D per_cpu(hwp_drv_data, cpu);
> > +    bool cleared_act_window =3D false;
> > +
> > +    if ( data =3D=3D NULL )
> > +        return -EINVAL;
>
> I don't think EINVAL is appropriate here. EOPNOTSUPP might be, or ENOENT,
> or EIO, or perhaps a few others.

Yes.  ENOENT seems good here since a NULL data is comparable to not existin=
g.

> > +    /* Validate all parameters - Disallow reserved bits. */
> > +    if ( set_cppc->minimum > 255 ||
> > +         set_cppc->maximum > 255 ||
> > +         set_cppc->desired > 255 ||
> > +         set_cppc->energy_perf > 255 ||
> > +         set_cppc->set_params & ~XEN_SYSCTL_CPPC_SET_PARAM_MASK ||
> > +         set_cppc->activity_window & ~XEN_SYSCTL_CPPC_ACT_WINDOW_MASK =
)
>
> Nit: Parentheses again please around the operands of &.

Sure

> > +        return -EINVAL;
> > +
> > +    /* Only allow values if params bit is set. */
> > +    if ( (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED) &&
> > +          set_cppc->desired) ||
> > +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM) &&
> > +          set_cppc->minimum) ||
> > +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
> > +          set_cppc->maximum) ||
> > +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ENERGY_PERF) &&
> > +          set_cppc->energy_perf) ||
> > +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW) &&
> > +          set_cppc->activity_window) )
> > +        return -EINVAL;
> > +
> > +    /* Clear out activity window if lacking HW supported. */
> > +    if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW) &&
> > +         !feature_hwp_activity_window ) {
> > +        set_cppc->set_params &=3D ~XEN_SYSCTL_CPPC_SET_ACT_WINDOW;
> > +        cleared_act_window =3D true;
> > +    }
> > +
> > +    /* Return if there is nothing to do. */
> > +    if ( set_cppc->set_params =3D=3D 0 )
> > +        return cleared_act_window ? 0 : -EINVAL;
>
> Is it really necessary to return an error when there's nothing to do?
> We have various hypercalls which can degenerate to no-ops under
> certain conditions, and which simply return success then.

With all the earlier parameter checking, I think it would be fine to
return success here for a no-op.

> > --- a/xen/drivers/acpi/pmstat.c
> > +++ b/xen/drivers/acpi/pmstat.c
> > @@ -400,6 +400,19 @@ static int set_cpufreq_para(struct xen_sysctl_pm_o=
p *op)
> >      return ret;
> >  }
> >
> > +static int set_cpufreq_cppc(struct xen_sysctl_pm_op *op)
> > +{
> > +    struct cpufreq_policy *policy =3D per_cpu(cpufreq_cpu_policy, op->=
cpuid);
> > +
> > +    if ( !policy || !policy->governor )
> > +        return -EINVAL;
> > +
> > +    if ( !hwp_active() )
> > +        return -EINVAL;
>
> In both cases I again wonder in how far EINVAL is really appropriate.

-EOPNOTSUPP seems good for the !hwp_active() case.  Maybe ENOENT for
the policy one.

> > --- a/xen/include/public/sysctl.h
> > +++ b/xen/include/public/sysctl.h
> > @@ -351,6 +351,68 @@ struct xen_cppc_para {
> >      uint32_t activity_window;
> >  };
> >
> > +/*
> > + * Set CPPC values.
> > + *
> > + * Configure the parameters for CPPC.  Set bits in set_params control =
which
> > + * values are applied.  If a bit is not set in set_params, the field m=
ust be
> > + * zero.
> > + *
> > + * For HWP specifically, values must be limited to 0-255 or within
> > + * XEN_SYSCTL_CPPC_ACT_WINDOW_MASK for activity window.  Set bits outs=
ide the
> > + * range will be returned as -EINVAL.
> > + *
> > + * Activity Window may not be supported by the hardware.  In that case=
, the
> > + * returned set_params will clear XEN_SYSCTL_CPPC_SET_ACT_WINDOW to in=
dicate
> > + * that it was not applied - though the rest of the values will be app=
lied.
> > + *
> > + * There are a set of presets along with individual fields.  Presets a=
re
> > + * applied first, and then individual fields.  This allows customizing
> > + * a preset without having to specify every value.
> > + *
> > + * The preset options values are as follows:
> > + *
> > + * preset      | minimum | maxium  | energy_perf
> > + * ------------+---------+---------+----------------
> > + * powersave   | lowest  | lowest  | powersave (255)
> > + * ------------+---------+---------+----------------
> > + * balance     | lowest  | highest | balance (128)
> > + * ------------+---------+---------+----------------
> > + * performance | highest | highest | performance (0)
> > + *
> > + * desired and activity_window are set to 0, hardware selected.
> > + */
> > +struct xen_set_cppc_para {
> > +#define XEN_SYSCTL_CPPC_SET_MINIMUM              (1U << 0)
> > +#define XEN_SYSCTL_CPPC_SET_MAXIMUM              (1U << 1)
> > +#define XEN_SYSCTL_CPPC_SET_DESIRED              (1U << 2)
> > +#define XEN_SYSCTL_CPPC_SET_ENERGY_PERF          (1U << 3)
> > +#define XEN_SYSCTL_CPPC_SET_ACT_WINDOW           (1U << 4)
> > +#define XEN_SYSCTL_CPPC_SET_PRESET_MASK          0xf0000000
> > +#define XEN_SYSCTL_CPPC_SET_PRESET_NONE          0x00000000
> > +#define XEN_SYSCTL_CPPC_SET_PRESET_BALANCE       0x10000000
> > +#define XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE     0x20000000
> > +#define XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE   0x30000000
>
> As corrections for the respective Misra rule are in the process of
> being merged, please add U suffixes here (at the very least on the
> _MASK).

Sure.

Thanks,
Jason

