Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5697E6F7049
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 18:57:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529847.824722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pucGM-0002eL-47; Thu, 04 May 2023 16:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529847.824722; Thu, 04 May 2023 16:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pucGM-0002bw-1J; Thu, 04 May 2023 16:57:02 +0000
Received: by outflank-mailman (input) for mailman id 529847;
 Thu, 04 May 2023 16:57:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YwFE=AZ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pucGK-0002bq-8H
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 16:57:00 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae2025bc-ea9c-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 18:56:57 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-94a34a14a54so144450166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 May 2023 09:56:57 -0700 (PDT)
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
X-Inumbo-ID: ae2025bc-ea9c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683219417; x=1685811417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbgmAvCwU1vduplWgvwbxfALqETkKPg+Klz1tE1pM5Y=;
        b=jb69VfEKkUjaHQLR2M/xs9Y+NjCU0b+Fq7yHJOer79PouvQWymx5syldLv97uKRuJi
         jTBJTuUWPvXJsafPw7tmxOXS9v+fkcJBigl7u0iyewajt2FxdNuDU43jcAyypiOSn+3F
         FbuQtoKsWxZTcHaWRc8Wpkxt2ZU1UM1glzIq6RGU8KY8+EaSwKkLw4PX7zMjR5iG32w6
         kexzmp1SyulDQjB9ZU497cZljtZjzURytcMfGoizxe4bdx1xTdk5vqIvT5LTnYmO/NqJ
         2FuFNMmVpf9iT08qnN7iwGMVD3SosIWpQ2wWyk6Xn76vGvWyVc/5Zq83Rzvs4KUoGGeX
         KTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683219417; x=1685811417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbgmAvCwU1vduplWgvwbxfALqETkKPg+Klz1tE1pM5Y=;
        b=ApIom15PbmOaLxGey8yv9KKNVIx6vGYRtMldm2GgFe6lMY7tPJ0kAxG/PYT/URuD6B
         eV9AtccO0SXl6f5AP+7DAlZipEpa4S6RywPamojDqkLkBtXcV+ke1lz1jy7oS7YiMLxB
         LBRa6rT3hRSWVi+GwEBwPadRsbYLOSzB8rie3XkWWC0ZdawS03Zfi0BQL+58RC3gajB1
         DxfCjFZeLtXXv5JUz3OXlJw0CjfkDcqPJaUM0MN69i5SWBCGw33OLpV6pP5DWXANuWBt
         dz8oFQNst8SPaOBiquqU7YCEjiVIZ6xqeawH8Ub92vm30bwF9knG68hxdFOTFEMgbuX2
         Kp9Q==
X-Gm-Message-State: AC+VfDzu1fA+i+i7BK2Pqt3Y27D/Px18NPl+fXwKzoa3SZ9aFhZKh18M
	P81FwqRXSqSRkFYVpDE35cJiWVbBDPKVOLn8/zrqph0+e1w=
X-Google-Smtp-Source: ACHHUZ5zXJ2SAWr4/GWxWMzLDfvSB6dTtI5D7388SUaQuoRwULQP1Fm9g14+LAOGxxBqloPibNDOGbfJ42vuL+NO3FM=
X-Received: by 2002:a17:906:c156:b0:94e:2db:533e with SMTP id
 dp22-20020a170906c15600b0094e02db533emr8725935ejc.49.1683219416969; Thu, 04
 May 2023 09:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230501193034.88575-1-jandryuk@gmail.com> <20230501193034.88575-5-jandryuk@gmail.com>
 <43c519f7-577d-f657-a4b1-1a31bf7f093a@suse.com>
In-Reply-To: <43c519f7-577d-f657-a4b1-1a31bf7f093a@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 4 May 2023 12:56:44 -0400
Message-ID: <CAKf6xpuzk6vLjbNAHzEmVpq8sDAO8O-cRFVStQxNqyD5ERr+Yg@mail.gmail.com>
Subject: Re: [PATCH v3 04/14 RESEND] cpufreq: Add Hardware P-State (HWP) driver
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 4, 2023 at 9:11=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 01.05.2023 21:30, Jason Andryuk wrote:
> > For cpufreq=3Dxen:hwp, placing the option inside the governor wouldn't
> > work.  Users would have to select the hwp-internal governor to turn off
> > hwp support.
>
> I'm afraid I don't understand this, and you'll find a comment towards
> this further down. Even when ...
>
> >  hwp-internal isn't usable without hwp, and users wouldn't
> > be able to select a different governor.  That doesn't matter while hwp
> > defaults off, but it would if or when hwp defaults to enabled.
>
> ... it starts defaulting to enabled, selecting another governor can
> simply have the side effect of turning off hwp.

I didn't think of that - makes sense.

> > Write to disable the interrupt - the linux pstate driver does this.  We
> > don't use the interrupts, so we can just turn them off.  We aren't read=
y
> > to handle them, so we don't want any.  Unclear if this is necessary.
> > SDM says it's default disabled.
>
> Definitely better to be on the safe side.
>
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -499,7 +499,7 @@ If set, force use of the performance counters for o=
profile, rather than detectin
> >  available support.
> >
> >  ### cpufreq
> > -> `=3D none | {{ <boolean> | xen } [:[powersave|performance|ondemand|u=
serspace][,<maxfreq>][,[<minfreq>][,[verbose]]]]} | dom0-kernel`
> > +> `=3D none | {{ <boolean> | xen } [:[powersave|performance|ondemand|u=
serspace][,<hdc>][,[<hwp>]][,[<maxfreq>]][,[<minfreq>]][,[verbose]]]} | dom=
0-kernel`
>
> Considering you use a special internal governor, the 4 governor alternati=
ves are
> meaningless for hwp. Hence at the command line level recognizing "hwp" as=
 if it
> was another governor name would seem better to me. This would then also g=
et rid
> of one of the two special "no-" prefix parsing cases (which I'm not overl=
y
> happy about).
>
> Even if not done that way I'm puzzled by the way you spell out the intera=
ction
> of "hwp" and "hdc": As you say in the description, "hdc" is meaningful on=
ly when
> "hwp" was specified, so even if not merged with the governors group "hwp"=
 should
> come first, and "hdc" ought to be rejected if "hwp" wasn't first specifie=
d. (The
> way you've spelled it out it actually looks to be kind of the other way a=
round.)

I placed them in alphabetical order, but, yes, it doesn't make sense.

> Strictly speaking "maxfreq" and "minfreq" also should be objected to when=
 "hwp"
> was specified.
>
> Overall I'm getting the impression that beyond your "verbose" related adj=
ustment
> more is needed, if you're meaning to get things closer to how we parse th=
e
> option (splitting across multiple lines to help see what I mean):
>
> `=3D none
>  | {{ <boolean> | xen } [:{powersave|performance|ondemand|userspace}
>                           [{,hwp[,hdc]|[,maxfreq=3D<maxfreq>[,minfreq=3D<=
minfreq>]}]
>                           [,verbose]]}
>  | dom0-kernel`
>
> (We're still parsing in a more relaxed way, e.g. minfreq may come ahead o=
f
> maxfreq, but better be more tight in the doc than too relaxed.)
>
> Furthermore while max/min freq don't apply directly, there are still two =
MSRs
> controlling bounds at the package and logical processor levels.

Well, we only program the logical processor level MSRs because we
don't have a good idea of the packages to know when we can skip
writing an MSR.

How about this:
`=3D none
 | {{ <boolean> | xen } {
[:{powersave|performance|ondemand|userspace}[,maxfreq=3D<maxfreq>[,minfreq=
=3D<minfreq>]]
                        | [:hwp[,hdc]] }
                          [,verbose]]}
 | dom0-kernel`

i.e:
xen:hwp,hdc

> > --- /dev/null
> > +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> > @@ -0,0 +1,506 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * hwp.c cpufreq driver to run Intel Hardware P-States (HWP)
> > + *
> > + * Copyright (C) 2021 Jason Andryuk <jandryuk@gmail.com>
> > + */
> > +
> > +#include <xen/cpumask.h>
> > +#include <xen/init.h>
> > +#include <xen/param.h>
> > +#include <xen/xmalloc.h>
> > +#include <asm/io.h>
> > +#include <asm/msr.h>
> > +#include <acpi/cpufreq/cpufreq.h>
> > +
> > +static bool feature_hwp;
> > +static bool feature_hwp_notification;
> > +static bool feature_hwp_activity_window;
> > +static bool feature_hwp_energy_perf;
> > +static bool feature_hwp_pkg_level_ctl;
> > +static bool feature_hwp_peci;
> > +
> > +static bool feature_hdc;
>
> Most (all?) of these want to be __ro_after_init, I expect.

I think you are correct.  (This pre-dates __ro_after_init and I didn't
update it.)

> > +__initdata bool opt_cpufreq_hwp =3D false;
> > +__initdata bool opt_cpufreq_hdc =3D true;
>
> Nit (style): Please put annotations after the type.
>
> > +#define HWP_ENERGY_PERF_BALANCE         0x80
> > +#define IA32_ENERGY_BIAS_BALANCE        0x7
> > +#define IA32_ENERGY_BIAS_MAX_POWERSAVE  0xf
> > +#define IA32_ENERGY_BIAS_MASK           0xf
> > +
> > +union hwp_request
> > +{
> > +    struct
> > +    {
> > +        uint64_t min_perf:8;
> > +        uint64_t max_perf:8;
> > +        uint64_t desired:8;
> > +        uint64_t energy_perf:8;
> > +        uint64_t activity_window:10;
> > +        uint64_t package_control:1;
> > +        uint64_t reserved:16;
> > +        uint64_t activity_window_valid:1;
> > +        uint64_t energy_perf_valid:1;
> > +        uint64_t desired_valid:1;
> > +        uint64_t max_perf_valid:1;
> > +        uint64_t min_perf_valid:1;
>
> The boolean fields here would probably better be of type "bool". I also
> don't see the need for using uint64_t for any of the other fields -
> unsigned int will be quite fine, I think. Only ...

This is the hardware MSR format, so it seemed natural to use uint64_t
and the bit fields.  To me, uint64_t foo:$bits; better shows that we
are dividing up a single hardware register using bit fields.
Honestly, I'm unfamiliar with the finer points of laying out bitfields
with bool.  And the 10 bits of activity window throws off aligning to
standard types.

This seems to have the correct layout:
struct
{
        unsigned char min_perf;
        unsigned char max_perf;
        unsigned char desired;
        unsigned char energy_perf;
        unsigned int activity_window:10;
        bool package_control:1;
        unsigned int reserved:16;
        bool activity_window_valid:1;
        bool energy_perf_valid:1;
        bool desired_valid:1;
        bool max_perf_valid:1;
        bool min_perf_valid:1;
} ;

Or would you prefer the first 8 bit ones to be unsigned int
min_perf:8?  The bools seem to need :1, which doesn't seem to be
gaining us much, IMO.  I'd strongly prefer just keeping it as I have
it, but I will change it however you like.

> > +    };
> > +    uint64_t raw;
>
> ... this wants to keep this type. (Same again below then.)

For "below", do you want:

        struct
        {
            unsigned char highest;
            unsigned char guaranteed;
            unsigned char most_efficient;
            unsigned char lowest;
            unsigned int reserved;
        } hw;
?

> > +bool __init hwp_available(void)
> > +{
> > +    unsigned int eax, ecx, unused;
> > +    bool use_hwp;
> > +
> > +    if ( boot_cpu_data.cpuid_level < CPUID_PM_LEAF )
> > +    {
> > +        hwp_verbose("cpuid_level (%#x) lacks HWP support\n",
> > +                    boot_cpu_data.cpuid_level);
> > +        return false;
> > +    }
> > +
> > +    if ( boot_cpu_data.cpuid_level < 0x16 )
> > +    {
> > +        hwp_info("HWP disabled: cpuid_level %#x < 0x16 lacks CPU freq =
info\n",
> > +                 boot_cpu_data.cpuid_level);
> > +        return false;
> > +    }
> > +
> > +    cpuid(CPUID_PM_LEAF, &eax, &unused, &ecx, &unused);
> > +
> > +    if ( !(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE) &&
> > +         !(ecx & CPUID6_ECX_IA32_ENERGY_PERF_BIAS) )
> > +    {
> > +        hwp_verbose("HWP disabled: No energy/performance preference av=
ailable");
> > +        return false;
> > +    }
> > +
> > +    feature_hwp                 =3D eax & CPUID6_EAX_HWP;
> > +    feature_hwp_notification    =3D eax & CPUID6_EAX_HWP_NOTIFICATION;
> > +    feature_hwp_activity_window =3D eax & CPUID6_EAX_HWP_ACTIVITY_WIND=
OW;
> > +    feature_hwp_energy_perf     =3D
> > +        eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE;
> > +    feature_hwp_pkg_level_ctl   =3D eax & CPUID6_EAX_HWP_PACKAGE_LEVEL=
_REQUEST;
> > +    feature_hwp_peci            =3D eax & CPUID6_EAX_HWP_PECI;
> > +
> > +    hwp_verbose("HWP: %d notify: %d act-window: %d energy-perf: %d pkg=
-level: %d peci: %d\n",
> > +                feature_hwp, feature_hwp_notification,
> > +                feature_hwp_activity_window, feature_hwp_energy_perf,
> > +                feature_hwp_pkg_level_ctl, feature_hwp_peci);
> > +
> > +    if ( !feature_hwp )
> > +        return false;
> > +
> > +    feature_hdc =3D eax & CPUID6_EAX_HDC;
> > +
> > +    hwp_verbose("HWP: Hardware Duty Cycling (HDC) %ssupported%s\n",
> > +                feature_hdc ? "" : "not ",
> > +                feature_hdc ? opt_cpufreq_hdc ? ", enabled" : ", disab=
led"
> > +                            : "");
> > +
> > +    feature_hdc =3D feature_hdc && opt_cpufreq_hdc;
> > +
> > +    hwp_verbose("HWP: HW_FEEDBACK %ssupported\n",
> > +                (eax & CPUID6_EAX_HW_FEEDBACK) ? "" : "not ");
>
> You report this, but you don't really use it?

Correct.  I needed to know what capabilities my processors have.

feature_hwp_pkg_level_ctl and feature_hwp_peci can also be dropped
since they aren't used beyond printing their values.  I'd still lean
toward keeping their printing under verbose since otherwise there
isn't a convenient way to know if they are available without
recompiling.

> > +    use_hwp =3D feature_hwp && opt_cpufreq_hwp;
>
> There's a lot of output you may produce until you make it here, which is
> largely meaningless when opt_cpufreq_hwp =3D=3D false. Is there a reason =
you
> don't check that flag first thing in the function?

opt_cpufreq_hwp can be checked earlier for an early exit, yes.  The
code came about during development to print all the HWP capabilities
even if it wasn't enabled.  But eliminating it now makes sense.

> > +static void hdc_set_pkg_hdc_ctl(bool val)
> > +{
> > +    uint64_t msr;
> > +
> > +    if ( rdmsr_safe(MSR_IA32_PKG_HDC_CTL, msr) )
> > +    {
> > +        hwp_err("error rdmsr_safe(MSR_IA32_PKG_HDC_CTL)\n");
> > +
> > +        return;
> > +    }
> > +
> > +    if ( val )
> > +        msr |=3D IA32_PKG_HDC_CTL_HDC_PKG_ENABLE;
> > +    else
> > +        msr &=3D ~IA32_PKG_HDC_CTL_HDC_PKG_ENABLE;
> > +
> > +    if ( wrmsr_safe(MSR_IA32_PKG_HDC_CTL, msr) )
> > +        hwp_err("error wrmsr_safe(MSR_IA32_PKG_HDC_CTL): %016lx\n", ms=
r);
> > +}
> > +
> > +static void hdc_set_pm_ctl1(bool val)
> > +{
> > +    uint64_t msr;
> > +
> > +    if ( rdmsr_safe(MSR_IA32_PM_CTL1, msr) )
> > +    {
> > +        hwp_err("error rdmsr_safe(MSR_IA32_PM_CTL1)\n");
> > +
> > +        return;
> > +    }
> > +
> > +    if ( val )
> > +        msr |=3D IA32_PM_CTL1_HDC_ALLOW_BLOCK;
> > +    else
> > +        msr &=3D ~IA32_PM_CTL1_HDC_ALLOW_BLOCK;
> > +
> > +    if ( wrmsr_safe(MSR_IA32_PM_CTL1, msr) )
> > +        hwp_err("error wrmsr_safe(MSR_IA32_PM_CTL1): %016lx\n", msr);
> > +}
>
> For both functions: Elsewhere you also log the affected CPU in hwp_err().
> Without this I'm not convinced the logging here is very useful. In fact I
> wonder whether hwp_err() shouldn't take care of this and/or the "error"
> part of the string literal. A HWP: prefix might also not be bad ...

Sounds good.  I'll investigate.

> > +static void hwp_get_cpu_speeds(struct cpufreq_policy *policy)
> > +{
> > +    uint32_t base_khz, max_khz, bus_khz, edx;
> > +
> > +    cpuid(0x16, &base_khz, &max_khz, &bus_khz, &edx);
> > +
> > +    /* aperf/mperf scales base. */
> > +    policy->cpuinfo.perf_freq =3D base_khz * 1000;
> > +    policy->cpuinfo.min_freq =3D base_khz * 1000;
> > +    policy->cpuinfo.max_freq =3D max_khz * 1000;
> > +    policy->min =3D base_khz * 1000;
> > +    policy->max =3D max_khz * 1000;
> > +    policy->cur =3D 0;
>
> What is the comment intended to be telling me here?

When I was surprised to discover that I needed to pass in the base
frequency for proper aperf/mperf scaling, it seemed relevant at the
time as it's the opposite of ACPI cpufreq.  It can be dropped now.

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
> > +    if ( rdmsr_safe(MSR_IA32_PM_ENABLE, val) )
> > +    {
> > +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_PM_ENABLE)\n", polic=
y->cpu);
> > +        data->curr_req.raw =3D -1;
> > +        return;
> > +    }
> > +
> > +    /* Ensure we don't generate interrupts */
> > +    if ( feature_hwp_notification )
> > +        wrmsr_safe(MSR_IA32_HWP_INTERRUPT, 0);
> > +
> > +    hwp_verbose("CPU%u: MSR_IA32_PM_ENABLE: %016lx\n", policy->cpu, va=
l);
> > +    if ( !(val & IA32_PM_ENABLE_HWP_ENABLE) )
> > +    {
> > +        val |=3D IA32_PM_ENABLE_HWP_ENABLE;
> > +        if ( wrmsr_safe(MSR_IA32_PM_ENABLE, val) )
> > +        {
> > +            hwp_err("CPU%u: error wrmsr_safe(MSR_IA32_PM_ENABLE, %lx)\=
n",
> > +                    policy->cpu, val);
> > +            data->curr_req.raw =3D -1;
> > +            return;
> > +        }
> > +    }
> > +
> > +    if ( rdmsr_safe(MSR_IA32_HWP_CAPABILITIES, data->hwp_caps) )
> > +    {
> > +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_HWP_CAPABILITIES)\n"=
,
> > +                policy->cpu);
> > +        data->curr_req.raw =3D -1;
> > +        return;
> > +    }
> > +
> > +    if ( rdmsr_safe(MSR_IA32_HWP_REQUEST, data->curr_req.raw) )
> > +    {
> > +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_HWP_REQUEST)\n", pol=
icy->cpu);
> > +        data->curr_req.raw =3D -1;
> > +        return;
> > +    }
> > +
> > +    if ( !feature_hwp_energy_perf ) {
>
> Nit: Brace placement.
>
> > +        if ( rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS, val) )
> > +        {
> > +            hwp_err("error rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS)\n");
> > +            data->curr_req.raw =3D -1;
> > +
> > +            return;
> > +        }
> > +
> > +        data->energy_perf =3D val & IA32_ENERGY_BIAS_MASK;
> > +    }
>
> In order to not need to undo the "enable" you've already done, maybe that
> should move down here?

HWP needs to be enabled before the Capabilities and Request MSRs can
be read.  Reading them shouldn't fail, but it seems safer to use
rdmsr_safe in case something goes wrong.

I think I will rip out ENERGY_PERF_BIAS.  The Linux driver doesn't
support it.  I thought it might be necessary, but my test machines
don't need it.  The Qubes report with SkyLake wasn't using
ENERGY_PERF_BIAS, and SkyLake introduced HWP.  So the set of machines
needing it is probably small and older, so it probably isn't worth
supporting.

> With all the sanity checking you do here, maybe
> you should also check that the write of the enable bit actually took
> effect?

I can add that.

> > +/* val 0 - highest performance, 15 - maximum energy savings */
> > +static void hwp_energy_perf_bias(const struct hwp_drv_data *data)
> > +{
> > +    uint64_t msr;
> > +    uint8_t val =3D data->energy_perf;
> > +
> > +    ASSERT(val <=3D IA32_ENERGY_BIAS_MAX_POWERSAVE);
> > +
> > +    if ( rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS, msr) )
> > +    {
> > +        hwp_err("error rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS)\n");
> > +
> > +        return;
> > +    }
> > +
> > +    msr &=3D ~IA32_ENERGY_BIAS_MASK;
> > +    msr |=3D val;
> > +
> > +    if ( wrmsr_safe(MSR_IA32_ENERGY_PERF_BIAS, msr) )
> > +        hwp_err("error wrmsr_safe(MSR_IA32_ENERGY_PERF_BIAS): %016lx\n=
", msr);
> > +}
> > +
> > +static void cf_check hwp_write_request(void *info)
> > +{
> > +    struct cpufreq_policy *policy =3D info;
> > +    struct hwp_drv_data *data =3D this_cpu(hwp_drv_data);
> > +    union hwp_request hwp_req =3D data->curr_req;
> > +
> > +    BUILD_BUG_ON(sizeof(union hwp_request) !=3D sizeof(uint64_t));
> > +    if ( wrmsr_safe(MSR_IA32_HWP_REQUEST, hwp_req.raw) )
> > +    {
> > +        hwp_err("CPU%u: error wrmsr_safe(MSR_IA32_HWP_REQUEST, %lx)\n"=
,
> > +                policy->cpu, hwp_req.raw);
> > +        rdmsr_safe(MSR_IA32_HWP_REQUEST, data->curr_req.raw);
> > +    }
> > +
> > +    if ( !feature_hwp_energy_perf )
> > +        hwp_energy_perf_bias(data);
> > +
> > +}
> > +
> > +static int cf_check hwp_cpufreq_target(struct cpufreq_policy *policy,
> > +                                       unsigned int target_freq,
> > +                                       unsigned int relation)
> > +{
> > +    unsigned int cpu =3D policy->cpu;
> > +    struct hwp_drv_data *data =3D per_cpu(hwp_drv_data, cpu);
> > +    /* Zero everything to ensure reserved bits are zero... */
> > +    union hwp_request hwp_req =3D { .raw =3D 0 };
> > +
> > +    /* .. and update from there */
> > +    hwp_req.min_perf =3D data->minimum;
> > +    hwp_req.max_perf =3D data->maximum;
> > +    hwp_req.desired =3D data->desired;
> > +    if ( feature_hwp_energy_perf )
> > +        hwp_req.energy_perf =3D data->energy_perf;
> > +    if ( feature_hwp_activity_window )
> > +        hwp_req.activity_window =3D data->activity_window;
> > +
> > +    if ( hwp_req.raw =3D=3D data->curr_req.raw )
> > +        return 0;
> > +
> > +    data->curr_req =3D hwp_req;
> > +
> > +    hwp_verbose("CPU%u: wrmsr HWP_REQUEST %016lx\n", cpu, hwp_req.raw)=
;
> > +    on_selected_cpus(cpumask_of(cpu), hwp_write_request, policy, 1);
> > +
> > +    return 0;
> > +}
>
> If I'm not mistaken these 3 functions can only be reached from the user
> space tool (via set_cpufreq_para()). On that path I don't think there
> should be any hwp_err(); definitely not in non-verbose mode. Instead it
> would be good if a sensible error code could be reported back. (Same
> then for hwp_cpufreq_update() and its helper.)

I'll investigate this.  I guess I'll have to stash a result in struct
hwp_drv_data.

> > --- a/xen/arch/x86/include/asm/cpufeature.h
> > +++ b/xen/arch/x86/include/asm/cpufeature.h
> > @@ -46,8 +46,17 @@ extern struct cpuinfo_x86 boot_cpu_data;
> >  #define cpu_has(c, bit)              test_bit(bit, (c)->x86_capability=
)
> >  #define boot_cpu_has(bit)    test_bit(bit, boot_cpu_data.x86_capabilit=
y)
> >
> > -#define CPUID_PM_LEAF                    6
> > -#define CPUID6_ECX_APERFMPERF_CAPABILITY 0x1
> > +#define CPUID_PM_LEAF                                6
> > +#define CPUID6_EAX_HWP                               (_AC(1, U) <<  7)
> > +#define CPUID6_EAX_HWP_NOTIFICATION                  (_AC(1, U) <<  8)
> > +#define CPUID6_EAX_HWP_ACTIVITY_WINDOW               (_AC(1, U) <<  9)
> > +#define CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE (_AC(1, U) << 10)
> > +#define CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST         (_AC(1, U) << 11)
> > +#define CPUID6_EAX_HDC                               (_AC(1, U) << 13)
> > +#define CPUID6_EAX_HWP_PECI                          (_AC(1, U) << 16)
> > +#define CPUID6_EAX_HW_FEEDBACK                       (_AC(1, U) << 19)
>
> Perhaps better without open-coding BIT()?

Ok.

> I also find it a little odd that e.g. bit 17 is left out here despite you
> declaring the 5 "valid" bits in union hwp_request (which are qualified by
> this CPUID bit afaict).

Well, I thought I wasn't supposed to introduce unused defines, so I
didn't add one for 17.  For union hwp_request, the "valid" bits are
part of the register structure, so it makes sense to include them
instead of an incomplete definition.  IIRC, at some point I set the
"valid" bits when I wasn't supposed to, and they caused the wrmsr
calls to fail.  That might have been because my test machines don't
have package-level HWP.

(I was confused when the CPUID section stated "Bit 17: Flexible HWP is
supported if set.", but there are no further references to "Flexible
HWP" in the SDM.)

> > +#define CPUID6_ECX_APERFMPERF_CAPABILITY             0x1
> > +#define CPUID6_ECX_IA32_ENERGY_PERF_BIAS             0x8
>
> Why not the same form here?

I was re-indenting APERFMPERF, and added ENERGY_PERF_BIAS in a
consistent style.  I will update with BIT().

> > --- a/xen/arch/x86/include/asm/msr-index.h
> > +++ b/xen/arch/x86/include/asm/msr-index.h
> > @@ -151,6 +151,13 @@
> >
> >  #define MSR_PKRS                            0x000006e1
> >
> > +#define MSR_IA32_PM_ENABLE                  0x00000770
> > +#define  IA32_PM_ENABLE_HWP_ENABLE          (_AC(1, ULL) <<  0)
> > +
> > +#define MSR_IA32_HWP_CAPABILITIES           0x00000771
> > +#define MSR_IA32_HWP_INTERRUPT              0x00000773
> > +#define MSR_IA32_HWP_REQUEST                0x00000774
>
> I think for new MSRs being added here in particular Andrew would like to
> see the IA32 infixes omitted. (I'd extend this then to
> CPUID6_ECX_IA32_ENERGY_PERF_BIAS as well.)

Ok.

> > @@ -165,6 +172,11 @@
> >  #define  PASID_PASID_MASK                   0x000fffff
> >  #define  PASID_VALID                        (_AC(1, ULL) << 31)
> >
> > +#define MSR_IA32_PKG_HDC_CTL                0x00000db0
> > +#define  IA32_PKG_HDC_CTL_HDC_PKG_ENABLE    (_AC(1, ULL) <<  0)
>
> The name has two redundant infixes, which looks odd, but then I can't
> suggest any better without going too much out of sync with the SDM.

Yes, it's not a good name, but I was trying to keep close to the SDM.
FAOD, these should drop IA32_ to become:
MSR_PKG_HDC_CTL
PKG_HDC_CTL_HDC_PKG_ENABLE
?

> > --- a/xen/drivers/cpufreq/cpufreq.c
> > +++ b/xen/drivers/cpufreq/cpufreq.c
> > @@ -565,6 +565,38 @@ static void cpufreq_cmdline_common_para(struct cpu=
freq_policy *new_policy)
> >
> >  static int __init cpufreq_handle_common_option(const char *name, const=
 char *val)
> >  {
> > +    if (!strcmp(name, "hdc")) {
> > +        if (val) {
> > +            int ret =3D parse_bool(val, NULL);
> > +            if (ret !=3D -1) {
> > +                opt_cpufreq_hdc =3D ret;
> > +                return 1;
> > +            }
> > +        } else {
> > +            opt_cpufreq_hdc =3D true;
> > +            return 1;
> > +        }
> > +    } else if (!strcmp(name, "no-hdc")) {
> > +        opt_cpufreq_hdc =3D false;
> > +        return 1;
> > +    }
>
> I think recognizing a "no-" prefix would want to be separated out, and be
> restricted to val being NULL. It would result in val being pointed at the
> string "no" (or "off" or anything else parse_bool() recognizes as negativ=
e
> indicator).
>
> Yet if, as suggested above, "hwp" became a "fake" governor also when
> parsing the command line, "hdc" could actually be handled in its
> handle_option() hook.

Makes sense.

Thank you for taking the time to review this.

Regards,
Jason

