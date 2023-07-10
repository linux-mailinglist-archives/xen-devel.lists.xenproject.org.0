Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF83A74D9D5
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 17:24:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561257.877688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIsj6-0000dm-Db; Mon, 10 Jul 2023 15:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561257.877688; Mon, 10 Jul 2023 15:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIsj6-0000bL-AT; Mon, 10 Jul 2023 15:23:00 +0000
Received: by outflank-mailman (input) for mailman id 561257;
 Mon, 10 Jul 2023 15:22:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppwN=C4=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qIsj5-0000bF-6T
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 15:22:59 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a47f1e9d-1f35-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 17:22:55 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fafe87c6fbso7159990e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jul 2023 08:22:55 -0700 (PDT)
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
X-Inumbo-ID: a47f1e9d-1f35-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689002574; x=1691594574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yu4f3oYsFCpzKIzOIndWgEiO2yGPNwpVmsrVjHpIEWQ=;
        b=T0cmE2+lD7R4oWkjFSczmQHMi7cUWTdr8T7Jn59II55r0ruEWNmflpCgtL8esybEPl
         qiF3Iw7dnoX33Ads5Y+hNVnXiFmnPvbfQHzjSJqpm6sKT7GxdT32bQggX5HSa12LkNxY
         ykWolqTjiGcAEpuFjpxKmAW4LWDVPSvWOGp8TEVVAgL0/gxIsTPoQ8SYJoQv2y/TrC2W
         Wpmw77tWhph3ROcsEX/rr++c0THxXyo/JIRpqhoHpWv8R2+wUTi2W4SCNwZxQTcFpEbc
         P1UPlnB6X+ZftHMY7SNBdy7ngxzEdoFedc4/yVbIf86RlbNKOrLoRjWgxoDY/dCGGbbY
         z8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689002574; x=1691594574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yu4f3oYsFCpzKIzOIndWgEiO2yGPNwpVmsrVjHpIEWQ=;
        b=WrLUDrNJ22eZiT/B2y25XPP9QoNwrMBT6FRYb+xRr59ZtlIHJ3JIxIu76tssPRLAlZ
         1H33+usQTL4dxEYjpWAFEs52+rgcTjNN+cVu+eLvrvscjKAA9JqfTQZp/bVhK6WixbUt
         9j1/uqdU+KS2+kAE/gd6Qc0pmsw6F1OL1ldIDb1UNz6OqaGP+rymB76KHnpaYO3dw3Aa
         /RqPM8NPhib71ReSEPSSFgJmVpW9neHrKIBMaGMigcxqaGQQ5pRzjQSvtltlbXfvm+tE
         dUKa+CmBQGKLTZ/SiHWoWZenuCvCCAEahjSUrQETqiM5DD0URxDxDHYqloM5aZdMnl0b
         m/mQ==
X-Gm-Message-State: ABy/qLbftJzUQM94M41AiEecKaBV8rmnsHXMgEzl8JYgM63vN/5yYiXR
	o4gsy973jvjRbBmTEaeMZPkAlELc8oWaqjgQZ00=
X-Google-Smtp-Source: APBJJlHdR5/ez3Rx8xhwx6sklaPbkz7SlJ27Xvj0MvKHZYhpF3B9zgX0EB28wn6jUSSpQxn+ZKZdOASU6EFGw4tGAYQ=
X-Received: by 2002:a05:6512:10cf:b0:4f3:d682:7b1c with SMTP id
 k15-20020a05651210cf00b004f3d6827b1cmr11897289lfg.45.1689002573838; Mon, 10
 Jul 2023 08:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230706185440.48333-1-jandryuk@gmail.com> <20230706185440.48333-7-jandryuk@gmail.com>
 <eeeb032f-a21b-5eb2-e3d5-63357a04a500@suse.com>
In-Reply-To: <eeeb032f-a21b-5eb2-e3d5-63357a04a500@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 10 Jul 2023 11:22:41 -0400
Message-ID: <CAKf6xptn0OL0qz+DW9qrwU=sFSKSp-O3S7z6vFbZp9RstFanbw@mail.gmail.com>
Subject: Re: [PATCH v5 06/15] cpufreq: Add Hardware P-State (HWP) driver
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2023 at 9:13=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 06.07.2023 20:54, Jason Andryuk wrote:
> > @@ -510,6 +510,22 @@ choice of `dom0-kernel` is deprecated and not supp=
orted by all Dom0 kernels.
> >  * `<maxfreq>` and `<minfreq>` are integers which represent max and min=
 processor frequencies
> >    respectively.
> >  * `verbose` option can be included as a string or also as `verbose=3D<=
integer>`
> > +  for `xen`.  It is a boolean for `hwp`.
> > +* `hwp` selects Hardware-Controlled Performance States (HWP) on suppor=
ted Intel
> > +  hardware.  HWP is a Skylake+ feature which provides better CPU power
> > +  management.  The default is disabled.  If `hwp` is selected, but har=
dware
> > +  support is not available, Xen will fallback to cpufreq=3Dxen.
> > +* `<hdc>` is a boolean to enable Hardware Duty Cycling (HDC).  HDC ena=
bles the
> > +  processor to autonomously force physical package components into idl=
e state.
> > +  The default is enabled, but the option only applies when `hwp` is en=
abled.
> > +
> > +There is also support for `;`-separated fallback options:
> > +`cpufreq=3Dhwp,verbose;xen`.  This first tries `hwp` and falls back to=
 `xen`
> > +if unavailable.
>
> In the given example, does "verbose" also apply to the fallback case? If =
so,
> perhaps better "cpufreq=3Dhwp;xen,verbose", to eliminate that ambiguity?

Yes, "verbose" is applied to both.  I can make the change.  I
mentioned it in the commit message, but I'll mention it here as well.

> > --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> > +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> > @@ -642,7 +642,24 @@ static int __init cf_check cpufreq_driver_init(voi=
d)
> >          switch ( boot_cpu_data.x86_vendor )
> >          {
> >          case X86_VENDOR_INTEL:
> > -            ret =3D cpufreq_register_driver(&acpi_cpufreq_driver);
> > +            unsigned int i;
>
> At the moment we still don't mix declarations and statements, i.e. all
> declarations have to be at the top of a block/scope. What iirc we do use
> in a couple of places (and what hence you may want to do here as well) is
> ...
>
> > +            ret =3D -ENOENT;
> > +
> > +            for ( i =3D 0; i < cpufreq_xen_cnt; i++ )
>
> ... declare the induction variable inside the loop header.

Sounds good, thanks.

> > +            {
> > +                switch ( cpufreq_xen_opts[i] )
> > +                {
> > +                case CPUFREQ_xen:
> > +                    ret =3D cpufreq_register_driver(&acpi_cpufreq_driv=
er);
> > +                    break;
> > +                case CPUFREQ_hwp:
> > +                    ret =3D hwp_register_driver();
> > +                    break;
> > +                }
> > +
> > +                if ( ret =3D=3D 0 )
> > +                    break;
> > +            }
> >              break;
>
> In this model any kind of failure results in the fallback to be tried
> (and the fallback's error to be returned to the caller rather than
> the primary one). This may or may not be what we actually want;
> personally I would have expected
>
>                 if ( ret !=3D -ENODEV )
>                     break;
>
> or some such instead.

I guess this comes back to our fruit preferences. :)

I can switch it around like that, and make hwp_register_driver()
return -ENODEV for hwp_available() returning false.

> > +static bool hwp_handle_option(const char *s, const char *end)
> > +{
> > +    int ret;
> > +
> > +    ret =3D parse_boolean("verbose", s, end);
> > +    if ( ret >=3D 0 ) {
>
> Nit: Style (brace placement).
>
> > +        cpufreq_verbose =3D ret;
> > +        return true;
> > +    }
> > +
> > +    ret =3D parse_boolean("hdc", s, end);
> > +    if ( ret >=3D 0 ) {
>
> Same here.

Thanks.  Sorry about those.

> > +        opt_cpufreq_hdc =3D ret;
> > +        return true;
> > +    }
> > +
> > +    return false;
> > +}
> > +
> > +int __init hwp_cmdline_parse(const char *s, const char *e)
> > +{
> > +    do
> > +    {
> > +        const char *end =3D strpbrk(s, ",;");
> > +
> > +        if ( s && !hwp_handle_option(s, end) )
>
> This check of s not being NULL comes too late, as strpbrk() would have
> de-referenced it already. Considering ...
>
> > +        {
> > +            printk(XENLOG_WARNING "cpufreq/hwp: option '%s' not recogn=
ized\n",
> > +                   s);
> > +
> > +            return -1;
> > +        }
> > +
> > +        s =3D end ? ++end : end;
> > +    } while ( s && s < e );
>
> ... this it probably wants to move even ahead of the loop.

I'll switch from do/while to just while and then the NULL check will
be covered.  In practice, this function is never called with s =3D=3D
NULL.

> > +static int hdc_set_pkg_hdc_ctl(unsigned int cpu, bool val)
> > +{
> > +    uint64_t msr;
> > +
> > +    if ( rdmsr_safe(MSR_PKG_HDC_CTL, msr) )
> > +    {
> > +        hwp_err(cpu, "rdmsr_safe(MSR_PKG_HDC_CTL)\n");
> > +        return -1;
> > +    }
> > +
> > +    if ( val )
> > +        msr |=3D PKG_HDC_CTL_HDC_PKG_ENABLE;
> > +    else
> > +        msr &=3D ~PKG_HDC_CTL_HDC_PKG_ENABLE;
> > +
> > +    if ( wrmsr_safe(MSR_PKG_HDC_CTL, msr) )
> > +    {
> > +        hwp_err(cpu, "wrmsr_safe(MSR_PKG_HDC_CTL): %016lx\n", msr);
> > +        return -1;
> > +    }
> > +
> > +    return 0;
> > +}
>
> Please can you use either boolean return values or proper 0 / -errno
> ones? (Same again then in the subsequent function.)

Sure, I'll use booleans.

> > +static void cf_check hwp_init_msrs(void *info)
> > +{
> > +    struct cpufreq_policy *policy =3D info;
> > +    struct hwp_drv_data *data =3D this_cpu(hwp_drv_data);
> > +    uint64_t val;
> > +
> > +    /*
> > +     * Package level MSR, but we don't have a good idea of packages he=
re, so
> > +     * just do it everytime.
> > +     */
> > +    if ( rdmsr_safe(MSR_PM_ENABLE, val) )
> > +    {
> > +        hwp_err(policy->cpu, "rdmsr_safe(MSR_PM_ENABLE)\n");
> > +        data->curr_req.raw =3D -1;
> > +        return;
> > +    }
> > +
> > +    /* Ensure we don't generate interrupts */
> > +    if ( feature_hwp_notification )
> > +        wrmsr_safe(MSR_HWP_INTERRUPT, 0);
> > +
> > +    hwp_verbose("CPU%u: MSR_PM_ENABLE: %016lx\n", policy->cpu, val);
> > +    if ( !(val & PM_ENABLE_HWP_ENABLE) )
> > +    {
> > +        val |=3D PM_ENABLE_HWP_ENABLE;
> > +        if ( wrmsr_safe(MSR_PM_ENABLE, val) )
> > +        {
> > +            hwp_err(policy->cpu, "wrmsr_safe(MSR_PM_ENABLE, %lx)\n", v=
al);
> > +            data->curr_req.raw =3D -1;
> > +            return;
> > +        }
> > +    }
> > +
> > +    if ( rdmsr_safe(MSR_HWP_CAPABILITIES, data->hwp_caps) )
> > +    {
> > +        hwp_err(policy->cpu, "rdmsr_safe(MSR_HWP_CAPABILITIES)\n");
> > +        goto error;
> > +    }
> > +
> > +    if ( rdmsr_safe(MSR_HWP_REQUEST, data->curr_req.raw) )
> > +    {
> > +        hwp_err(policy->cpu, "rdmsr_safe(MSR_HWP_REQUEST)\n");
> > +        goto error;
> > +    }
> > +
> > +    /*
> > +     * Check for APERF/MPERF support in hardware
> > +     * also check for boost/turbo support
> > +     */
> > +    intel_feature_detect(policy);
> > +
> > +    if ( feature_hdc )
> > +    {
> > +        if ( hdc_set_pkg_hdc_ctl(policy->cpu, opt_cpufreq_hdc) ||
> > +             hdc_set_pm_ctl1(policy->cpu, opt_cpufreq_hdc) ) {
>
> Please can these two if()s be joined and the well-placed brace be
> retained?

Sure.

> > +            hwp_err(policy->cpu, "Disabling HDC support\n");
> > +            feature_hdc =3D false;
> > +            goto error;
>
> Why? Can't you continue just with HDC turned off?

Yes, that is what I intended to implement after your earlier review,
but I failed to actually delete the goto.

> > +static void cf_check hwp_write_request(void *info)
> > +{
> > +    const struct cpufreq_policy *policy =3D info;
> > +    struct hwp_drv_data *data =3D this_cpu(hwp_drv_data);
> > +    union hwp_request hwp_req =3D data->curr_req;
> > +
> > +    data->ret =3D 0;
> > +
> > +    BUILD_BUG_ON(sizeof(union hwp_request) !=3D sizeof(hwp_req.raw));
>
> You changed only the right side to not be sizeof(<type>).

Updated.  I was just focused on removing the uint64_t from your earlier com=
ment.

> > +static int cf_check hwp_cpufreq_cpu_init(struct cpufreq_policy *policy=
)
> > +{
> > +    unsigned int cpu =3D policy->cpu;
> > +    struct hwp_drv_data *data;
> > +
> > +    data =3D xzalloc(struct hwp_drv_data);
> > +    if ( !data )
> > +        return -ENOMEM;
> > +
> > +    policy->governor =3D &cpufreq_gov_hwp;
> > +
> > +    per_cpu(hwp_drv_data, cpu) =3D data;
> > +
> > +    on_selected_cpus(cpumask_of(cpu), hwp_init_msrs, policy, 1);
>
> Could I talk you into moving the helper function immediately ahead of
> this (sole) one using it, much like you have it for hwp_cpufreq_target()
> and hwp_write_request()?

Yes. sounds good.  I'll move hdc_set_pkg_hdc_ctl(), hdc_set_pm_ctl1(),
hwp_get_cpu_speeds() as well since they are all called by
hwp_init_msrs().

> > +    if ( data->curr_req.raw =3D=3D -1 )
> > +    {
> > +        hwp_err(cpu, "Could not initialize HWP properly\n");
> > +        per_cpu(hwp_drv_data, cpu) =3D NULL;
> > +        xfree(data);
> > +        return -ENODEV;
> > +    }
> > +
> > +    data->minimum =3D data->curr_req.min_perf;
> > +    data->maximum =3D data->curr_req.max_perf;
> > +    data->desired =3D data->curr_req.desired;
> > +    data->energy_perf =3D data->curr_req.energy_perf;
> > +    data->activity_window =3D data->curr_req.activity_window;
> > +
> > +    if ( cpu =3D=3D 0 )
> > +        hwp_verbose("CPU%u: HWP_CAPABILITIES: %016lx\n", cpu, data->hw=
p_caps);
>
> While I'm fine with this (perhaps apart from you using "cpu =3D=3D 0",
> which is an idiom we're trying to get rid of), ...

Oh, I didn't know that.  What is the preferred way to identify the
BSP?  This doesn't necessarily run on the BSP, so "cpu"/"policy->cpu"
is all we have to make a determination.

> > +    hwp_verbose("CPU%u: rdmsr HWP_REQUEST %016lx\n", cpu, data->curr_r=
eq.raw);
>
> ... this once-per-CPU message still looks to verbose to me. Perhaps
> for both:
> - print for the BSP,
> - print when AP value differs from BSP (albeit I don't know how
> [un]likely that is)?

On my test systems, the values have all been identical.  But your
differing values idea seems good.

> > +static int cf_check hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy=
)
> > +{
> > +    struct hwp_drv_data *data =3D per_cpu(hwp_drv_data, policy->cpu);
> > +    per_cpu(hwp_drv_data, policy->cpu) =3D NULL;
> > +    xfree(data);
>
> Nit: Style (blank line between declaration(s) and statement(s) please.
> (Also at least once again below.)
>
> > --- a/xen/drivers/cpufreq/cpufreq.c
> > +++ b/xen/drivers/cpufreq/cpufreq.c
> > @@ -63,12 +63,18 @@ LIST_HEAD_READ_MOSTLY(cpufreq_governor_list);
> >  /* set xen as default cpufreq */
> >  enum cpufreq_controller cpufreq_controller =3D FREQCTL_xen;
> >
> > -static int __init cpufreq_cmdline_parse(const char *s);
> > +enum cpufreq_xen_opt cpufreq_xen_opts[2] =3D { CPUFREQ_xen, };
> > +unsigned int cpufreq_xen_cnt =3D 1;
>
> Looks like both can be __initdata?

Yes, thanks.

> As to the array initializer: For one Misra won't like the 2nd slot not
> initialized. Plus the implicit 0 there is nothing else than CPUFREQ_xen,
> which also ends up a little fragile. Perhaps 0 wants to stand for
> CPUFREQ_none (or whatever name you deem appropriate)?

:) I had a CPUFREQ_none originally, but dropped it as there was no
need for one with cpufreq_xen_cnt controlling the iteration.  I'll add
it back.  (gcc 12 at least complains that the switch in
cpufreq_driver_init() needs to handle CPUFREQ_none, so I'll just have
it return 0 in that case.)

Thanks for the review.

Regards,
Jason

