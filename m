Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34A7737395
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 20:14:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552225.862180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfsN-0008MX-7z; Tue, 20 Jun 2023 18:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552225.862180; Tue, 20 Jun 2023 18:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfsN-0008K8-45; Tue, 20 Jun 2023 18:14:47 +0000
Received: by outflank-mailman (input) for mailman id 552225;
 Tue, 20 Jun 2023 18:14:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JeBQ=CI=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qBfsL-0008Jq-KG
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 18:14:45 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 550d51af-0f96-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 20:14:44 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f86d8a8fd4so4067510e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 11:14:44 -0700 (PDT)
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
X-Inumbo-ID: 550d51af-0f96-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687284884; x=1689876884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKgXF8KP+Km6qFUOMbaL+UkPhpTQv+o+AYH7OHKXVcw=;
        b=dCVIRmsqvCtOUjvqa3WkSzRI4zLxjSea8aKBtHtUai8umvuTiduKgpc2rCFnRgqhZg
         QBsJnWoLNHawVWj0JEbyI455lIBZvUXbCIPTztSsgTLhhkqH/ofCyYqATKEMT3RzRtjH
         2Xs52e1OD91RFztyWD3ijxGhWsXBtIoGRdRtib4xMi7w4RtjGcJcVn5Ium/OAxbS4MFK
         DyBSsAc6v8bMi4HdYkqA5JAARZd/W/pStf71VHv151lhVh5QQptFxUohCZ9cHCKIvUDD
         z4WH3AVm0aPY+O7BRSWgtkUrXTt46JRUVu9JNkUyKavbMbgwm0tNLV6s3fQMISrMaEDf
         xc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687284884; x=1689876884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKgXF8KP+Km6qFUOMbaL+UkPhpTQv+o+AYH7OHKXVcw=;
        b=eIFjGPODSlx6wbLNM5KM+9en/+Dx7971XDkgHtt8WSez79rsjnqQnDtW/cyZlb2Jtd
         nxMRWfiJ4cjZk1iceAAqi1uw3PVw+a1ojNubByCVs2+OGTZCq91T2Ag4JCWTNGO1hBEu
         l6CWIoewwLt3hGMAXoFxP6Sl4dIJRlEe/t4N8XezCjQlLt9CnBqXcpYtM8Y688kf9eu7
         JsEGxQ//TsdY7ATSs8mZWzMSOSJXJoNxxpHqd6FJUqSLFhTd63K6a3zk2EvstKf2KLqh
         ++U0WxguGhJCTiR3mbgxGkqfMiDf6+wmHuihQaV/kzFN0D6MHvZ5qkEyS/HxDuDIa3Ky
         AVtA==
X-Gm-Message-State: AC+VfDz3BdEHG20JPP9CKEFH0nU4SzBVQdpMqqCEdnzgGEPFxUNjHyaS
	Fbot6Cj5GKwOkOiXXp4LQWiX4Bu2cmueEn8CMAc=
X-Google-Smtp-Source: ACHHUZ7Z4Jm4iUruPPbaD4u2ZuUUmPE52UJuznk0yHi7jGjJq3ARacDUg2ff6AkXmtr7zeiK4vdVUCxRHJoLBRARQkY=
X-Received: by 2002:a05:6512:118d:b0:4f8:5e11:2cbc with SMTP id
 g13-20020a056512118d00b004f85e112cbcmr8181329lfr.36.1687284883126; Tue, 20
 Jun 2023 11:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230614180253.89958-1-jandryuk@gmail.com> <20230614180253.89958-7-jandryuk@gmail.com>
 <66771ebb-7d56-ca84-89bc-14f69fe62bd6@suse.com>
In-Reply-To: <66771ebb-7d56-ca84-89bc-14f69fe62bd6@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 20 Jun 2023 14:14:30 -0400
Message-ID: <CAKf6xptNyPwMghjgxYBiU-_DU08CLc0S7rLusL4F3JViC6z0VQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/15] cpufreq: Add Hardware P-State (HWP) driver
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 7:38=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 14.06.2023 20:02, Jason Andryuk wrote:
> > Falling back from cpufreq=3Dhwp to cpufreq=3Dxen is a more user-friendl=
y
> > choice than disabling cpufreq when HWP is not available.  Specifying
> > cpufreq=3Dhwp indicates the user wants cpufreq, so, if HWP isn't
> > available, it makes sense to give them the cpufreq that can be
> > supported.  i.e. I can't see a user only wanting cpufreq=3Dhwp or
> > cpufreq=3Dnone, but not cpufreq=3Dxen.
>
> I continue to disagree with this, and I'd like to ask for another
> maintainer's opinion. To me the described behavior is like getting
> pears when having asked for apples. I nevertheless agree that
> having said fallback as an option, but I'd see that done by giving
> meaning to something like "cpufreq=3Dhwp,xen" (without having checked
> whether that doesn't have meaning already, i.e. just to give you an
> idea).

I know you disagree with the approach.  I implemented what would be
useful to me and Marek.  It felt counterproductive to implement a hard
failure mode that is unsuitable for my use case.  Also there was the
possibility you wouldn't mind when you saw how it was implemented.

Yeah, asking for an apple and getting a pear can be the wrong thing if
your recipe calls for apples.  But getting *some* fruit can be better
than no fruit if you are hungry.

As implemented here, with HWP default disabled,
no command line -> default cpufreq=3Dxen
cpufreq=3Dxen -> only cpufreq=3Dxen
cpufreq=3Dhwp -> try hwp and fallback to cpufreq=3Dxen

If/when HWP is default enabled:
no command line -> try hwp and fallback to cpufreq=3Dxen
cpufreq=3Dhwp -> try hwp and fallback to cpufreq=3Dxen
cpufreq=3Dxen -> cpufreq=3Dxen

Unless some other idea comes to me, I guess I'll look at implementing
"cpufreq=3Dhwp,xen".

> > We can't use parse_boolean() since it requires a single name=3Dval stri=
ng
> > and cpufreq_handle_common_option is provided two strings.  Use
> > parse_bool() and manual handle no-hwp.
> >
> > Write to disable the interrupt - the linux pstate driver does this.  We
> > don't use the interrupts, so we can just turn them off.  We aren't read=
y
> > to handle them, so we don't want any.  Unclear if this is necessary.
> > SDM says it's default disabled.
>
> Part of this may want to move to the description?

Sure.

> > --- /dev/null
> > +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> > @@ -0,0 +1,537 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
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
>
> What do you need this one for?

It seems to be unneeded.

> > +#include <asm/msr.h>
> > +#include <acpi/cpufreq/cpufreq.h>
> > +
> > +static bool __ro_after_init feature_hwp;
> > +static bool __ro_after_init feature_hwp_notification;
> > +static bool __ro_after_init feature_hwp_activity_window;
> > +
> > +static bool __ro_after_init feature_hdc;
> > +
> > +bool __initdata opt_cpufreq_hwp;
> > +static bool __ro_after_init opt_cpufreq_hdc =3D true;
> > +
> > +union hwp_request
> > +{
> > +    struct
> > +    {
> > +        unsigned int min_perf:8;
> > +        unsigned int max_perf:8;
> > +        unsigned int desired:8;
> > +        unsigned int energy_perf:8;
> > +        unsigned int activity_window:10;
> > +        bool package_control:1;
> > +        unsigned int reserved:16;
>
> Better leave this and ...
>
> > +        bool activity_window_valid:1;
> > +        bool energy_perf_valid:1;
> > +        bool desired_valid:1;
> > +        bool max_perf_valid:1;
> > +        bool min_perf_valid:1;
> > +    };
> > +    uint64_t raw;
> > +};
> > +
> > +struct hwp_drv_data
> > +{
> > +    union
> > +    {
> > +        uint64_t hwp_caps;
> > +        struct
> > +        {
> > +            unsigned int highest:8;
> > +            unsigned int guaranteed:8;
> > +            unsigned int most_efficient:8;
> > +            unsigned int lowest:8;
> > +            unsigned int reserved:32;
>
> ... this without a name? Hardware interfaces like this one are, in my
> understanding, one of the main applications of unnamed bitfields.

Thanks - I didn't know you could have unnamed bitfields.

> > +        } hw;
> > +    };
> > +    union hwp_request curr_req;
> > +    int ret;
> > +    uint16_t activity_window;
> > +    uint8_t minimum;
> > +    uint8_t maximum;
> > +    uint8_t desired;
> > +    uint8_t energy_perf;
> > +};
> > +DEFINE_PER_CPU_READ_MOSTLY(struct hwp_drv_data *, hwp_drv_data);
>
> static?

Sure

> > +static bool hwp_handle_option(const char *s, const char *end)
> > +{
> > +    int ret;
> > +
> > +    if ( strncmp(s, "verbose", 7) =3D=3D 0 )
> > +    {
> > +        s +=3D 7;
> > +        if ( *s =3D=3D '=3D' )
> > +        {
> > +            s++;
> > +            cpufreq_verbose =3D !!simple_strtoul(s, NULL, 0);
> > +
> > +            return true;
> > +        }
> > +
> > +        if ( end =3D=3D NULL ||
> > +             (end =3D=3D s && (*end =3D=3D '\0' || *end =3D=3D ',')) )
> > +        {
> > +            cpufreq_verbose =3D true;
> > +
> > +            return true;
> > +        }
> > +
> > +        return false;
> > +    }
>
> Would be nice if the handling of "verbose" didn't need duplicating here.
> However, if that's unavoidable, did you consider handling this as a
> proper boolean instead of the custom way cpufreq_handle_common_option()
> also uses?

It seemed more complicated to try to re-use the "verbose" handling
from cpufreq_handle_common_option(), especially since minfreq and
maxfreq are also in there.

I didn't use proper boolean parsing to remain consistent with
cpufreq_handle_common_option() and the command line option
documentation.  I'm fine with switching it to a proper boolean if
that's what you want.

> > +bool __init hwp_available(void)
> > +{
> > +    unsigned int eax;
> > +
> > +    if ( !opt_cpufreq_hwp )
> > +        return false;
> > +
> > +    if ( boot_cpu_data.cpuid_level < CPUID_PM_LEAF )
> > +    {
> > +        hwp_verbose("cpuid_level (%#x) lacks HWP support\n",
> > +                    boot_cpu_data.cpuid_level);
> > +
> > +        return false;
> > +    }
> > +
> > +    if ( boot_cpu_data.cpuid_level < 0x16 )
> > +    {
> > +        hwp_info("HWP disabled: cpuid_level %#x < 0x16 lacks CPU freq =
info\n",
> > +                 boot_cpu_data.cpuid_level);
> > +
> > +        return false;
> > +    }
> > +
> > +    eax =3D cpuid_eax(CPUID_PM_LEAF);
> > +
> > +    hwp_verbose("%d notify: %d act-window: %d energy-perf: %d pkg-leve=
l: %d peci: %d\n",
> > +                !!(eax & CPUID6_EAX_HWP),
> > +                !!(eax & CPUID6_EAX_HWP_NOTIFICATION),
> > +                !!(eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW),
> > +                !!(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE)=
,
> > +                !!(eax & CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST),
> > +                !!(eax & CPUID6_EAX_HWP_PECI));
> > +
> > +    if ( !(eax & CPUID6_EAX_HWP) )
> > +        return false;
> > +
> > +    if ( !(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE) )
> > +    {
> > +        hwp_verbose("disabled: No energy/performance preference availa=
ble");
> > +
> > +        return false;
> > +    }
> > +
> > +    feature_hwp                 =3D eax & CPUID6_EAX_HWP;
> > +    feature_hwp_notification    =3D eax & CPUID6_EAX_HWP_NOTIFICATION;
> > +    feature_hwp_activity_window =3D eax & CPUID6_EAX_HWP_ACTIVITY_WIND=
OW;
> > +    feature_hdc =3D eax & CPUID6_EAX_HDC;
>
> Would you mind matching this line with the earlier three, padding-wise?

Sure.

> > +    hwp_verbose("Hardware Duty Cycling (HDC) %ssupported%s\n",
> > +                feature_hdc ? "" : "not ",
> > +                feature_hdc ? opt_cpufreq_hdc ? ", enabled" : ", disab=
led"
> > +                            : "");
> > +
> > +    hwp_verbose("HW_FEEDBACK %ssupported\n",
> > +                (eax & CPUID6_EAX_HW_FEEDBACK) ? "" : "not ");
> > +
> > +    cpufreq_governor_internal =3D feature_hwp;
>
> What use is feature_hwp? Already its setting is a little odd (you could
> use true there as much as you could here and for the return value below,
> because of the earlier CPUID6_EAX_HWP check), and then I haven't been
> able to find any further use of the variable.

Yes, feature_hwp is no longer useful and can be removed.  It actually
gets removed in the next patch, but this can be simplified.

> > +    if ( feature_hwp )
> > +        hwp_info("Using HWP for cpufreq\n");
> > +
> > +    return feature_hwp;
> > +}
> > +
> > +static int hdc_set_pkg_hdc_ctl(unsigned int cpu, bool val)
> > +{
> > +    uint64_t msr;
> > +
> > +    if ( rdmsr_safe(MSR_PKG_HDC_CTL, msr) )
> > +    {
> > +        hwp_err("rdmsr_safe(MSR_PKG_HDC_CTL)\n", cpu);
> > +
> > +        return -1;
>
> Nit: While blank lines often help, and we even demand them ahead of a
> function's main return statement, here and ...
>
> > +    }
> > +
> > +    if ( val )
> > +        msr |=3D PKG_HDC_CTL_HDC_PKG_ENABLE;
> > +    else
> > +        msr &=3D ~PKG_HDC_CTL_HDC_PKG_ENABLE;
> > +
> > +    if ( wrmsr_safe(MSR_PKG_HDC_CTL, msr) )
> > +    {
> > +        hwp_err("wrmsr_safe(MSR_PKG_HDC_CTL): %016lx\n", cpu, msr);
> > +
> > +        return -1;
>
> ... here (and then again below) I think they do more harm than good.

Ok, I'll remove them.

> > +static void hwp_get_cpu_speeds(struct cpufreq_policy *policy)
> > +{
> > +    uint32_t base_khz, max_khz, bus_khz, edx;
> > +
> > +    cpuid(0x16, &base_khz, &max_khz, &bus_khz, &edx);
> > +
> > +    policy->cpuinfo.perf_freq =3D base_khz * 1000;
> > +    policy->cpuinfo.min_freq =3D base_khz * 1000;
> > +    policy->cpuinfo.max_freq =3D max_khz * 1000;
> > +    policy->min =3D base_khz * 1000;
> > +    policy->max =3D max_khz * 1000;
>
> What are the consequences (for the driver) when any of the values read
> is zero? While I haven't checked in combination with HWP, I know that
> CPUs may populate only some of the fields.

Interesting - I didn't know CPUs may populate only some of the fields.

These values are not used by the hwp driver itself.  They are
populated mainly to provide back to userspace.  The one exception is
perf_freq - that is used by get_measured_perf() to calculate
aperf/mperf.  If base_khz and therefore perf_freq were 0, then
get_measured_perf() would just return 0 for aperf/mperf.

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
> > +        hwp_err("rdmsr_safe(MSR_PM_ENABLE)\n", policy->cpu);
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
> > +            hwp_err("wrmsr_safe(MSR_PM_ENABLE, %lx)\n", policy->cpu, v=
al);
> > +            data->curr_req.raw =3D -1;
> > +            return;
> > +        }
> > +    }
> > +
> > +    if ( rdmsr_safe(MSR_HWP_CAPABILITIES, data->hwp_caps) )
> > +    {
> > +        hwp_err("rdmsr_safe(MSR_HWP_CAPABILITIES)\n", policy->cpu);
> > +        goto error;
> > +    }
> > +
> > +    if ( rdmsr_safe(MSR_HWP_REQUEST, data->curr_req.raw) )
> > +    {
> > +        hwp_err("rdmsr_safe(MSR_HWP_REQUEST)\n", policy->cpu);
>
> Having seen a number of hwp_err() by now, I think these are confusing:
> The format string as seen at call sites doesn't match the number of
> arguments. I see two possible solutions to this: Either you demand
> that calling functions maintain a "cpu" local variable, and you simply
> use that from the macro without passing it as argument. Or you flip
> parameters / arguments:
>
>         hwp_err(policy->cpu, "rdmsr_safe(MSR_HWP_REQUEST)\n");

I think your flipped parameter idea is good and will use that.

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
> > +        if ( hdc_set_pkg_hdc_ctl(policy->cpu, opt_cpufreq_hdc) )
> > +            goto error;
> > +        if ( hdc_set_pm_ctl1(policy->cpu, opt_cpufreq_hdc) )
> > +            goto error;
>
> If either of these fails the very first time through (presumably for the
> BSP), wouldn't a better course of action be to clear feature_hdc?

So if HWP is working, but the HDC part fails, just clear feature_hdc
but keep using HWP?  I don't know how likely that is to happen, but
that seems reasonable.

> > +    }
> > +
> > +    hwp_get_cpu_speeds(policy);
> > +
> > +    return;
> > +
> > + error:
> > +    data->curr_req.raw =3D -1;
> > +    val &=3D ~PM_ENABLE_HWP_ENABLE;
> > +    if ( wrmsr_safe(MSR_PM_ENABLE, val) )
> > +        hwp_err("wrmsr_safe(MSR_PM_ENABLE, %lx)\n", policy->cpu, val);
> > +
> > +    return;
> > +}
>
> I think in general we avoid "return" with no value at the end of function=
s.

Ok, I'll remove it.

> > +static void cf_check hwp_write_request(void *info)
> > +{
> > +    const struct cpufreq_policy *policy =3D info;
> > +    struct hwp_drv_data *data =3D this_cpu(hwp_drv_data);
> > +    union hwp_request hwp_req =3D data->curr_req;
> > +
> > +    data->ret =3D 0;
> > +
> > +    BUILD_BUG_ON(sizeof(union hwp_request) !=3D sizeof(uint64_t));
>
> Why uint64_t? Generally we try to avoid using types in sizeof() and
> alike, and instead refer to applicable variables. I.e. here:
>
>     BUILD_BUG_ON(sizeof(hwp_req) !=3D sizeof(hwp_req.raw));

I used uint64_t because I thought that more clearly stated that the
union is supposed to be 64bits in size - the size of the MSR.  I'll
change as you show above.

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
> > +    hwp_req.energy_perf =3D data->energy_perf;
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
>
> Is this at risk of being too verbose when the verbose option as given?

For my client use case, it seems fine since there aren't too many
CPUs.  But I think you are correct that for a server use case it would
be too much.  Hmmm.  Do you think I should drop it or make it
ratelimited?

> > +    return data->ret;
> > +}
> > +
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
> > +    if ( cpufreq_opt_governor && strcmp(cpufreq_opt_governor->name,
> > +                                        cpufreq_gov_hwp.name) )
>
> Nit: I think this would better be
>
>     if ( cpufreq_opt_governor &&
>          strcmp(cpufreq_opt_governor->name, cpufreq_gov_hwp.name) )

Sounds good.  Actually, with the top level cpufreq=3Dhwp,
cpufreq_opt_governor shouldn't be set anymore.  I left it since it
would point out something being unexpected.  policy->governor is set
unilaterally, so maybe this check and message should just be dropped.
Thoughts?

> > +        printk(XENLOG_WARNING
> > +               "HWP: governor \"%s\" is incompatible with hwp. Using d=
efault \"%s\"\n",
> > +               cpufreq_opt_governor->name, cpufreq_gov_hwp.name);
> > +    policy->governor =3D &cpufreq_gov_hwp;
> > +
> > +    per_cpu(hwp_drv_data, cpu) =3D data;
> > +
> > +    on_selected_cpus(cpumask_of(cpu), hwp_init_msrs, policy, 1);
> > +
> > +    if ( data->curr_req.raw =3D=3D -1 )
> > +    {
> > +        hwp_err("Could not initialize HWP properly\n", cpu);
> > +        XFREE(per_cpu(hwp_drv_data, cpu));
>
> Is this completely safe even in the CPU online/hotplug case? It would
> seem better to me to go this way:
>
>         per_cpu(hwp_drv_data, cpu) =3D NULL;
>         xfree(data);

I'll do this because...

> Or even defer publishing "data" ...
>
> > +        return -ENODEV;
> > +    }
> > +
> > +    data->minimum =3D data->curr_req.min_perf;
> > +    data->maximum =3D data->curr_req.max_perf;
> > +    data->desired =3D data->curr_req.desired;
> > +    data->energy_perf =3D data->curr_req.energy_perf;
> > +    data->activity_window =3D data->curr_req.activity_window;
>
> ... until after it was fully populated. (But I seem to vaguely recall
> that you need to use the field somewhere in the init process.)

... hwp_init_msrs() uses the per-cpu entry to save data->curr_req, so
it can't be totally deferred.

> > +    hwp_verbose("CPU%u: HWP_CAPABILITIES: %016lx\n", cpu, data->hwp_ca=
ps);
>
> Isn't this expected (or even required) to be the same on all CPUs? If
> so, no need to log every time.

I'll print only for CPU 0.

> > +static int cf_check hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy=
)
> > +{
> > +    XFREE(per_cpu(hwp_drv_data, policy->cpu));
>
> Same remark as above, primarily because this is also used on an error
> path.
>
> > +/*
> > + * The SDM reads like turbo should be disabled with MSR_IA32_PERF_CTL =
and
> > + * PERF_CTL_TURBO_DISENGAGE, but that does not seem to actually work, =
at least
> > + * with my HWP testing.  MSR_MISC_ENABLE and MISC_ENABLE_TURBO_DISENGA=
GE
> > + * is what Linux uses and seems to work.
> > + */
>
> "my testing" imo wants replacing here by saying what hardware was tested
> (not who did the testing).

Good idea.

> > +static int cf_check hwp_cpufreq_update(int cpuid, struct cpufreq_polic=
y *policy)
> > +{
> > +    struct hwp_drv_data *data =3D per_cpu(hwp_drv_data, cpuid);
> > +    on_selected_cpus(cpumask_of(cpuid), hwp_set_misc_turbo, policy, 1)=
;
>
> Nit: Blank line please between declaration(s) and statement(s). Or
> alternatively drop the local variable ltogether, as it's used ...
>
> > +    return data->ret;
>
> ... just once here.

I'll drop the local variable.

> > +}
> > +
> > +static const struct cpufreq_driver __initconstrel hwp_cpufreq_driver =
=3D
>
> Seeing __initconstrel here, just as a remark (not a request for you
> to do anything): I think we want to finish conversion to altcall, such
> that these can all become __initconst_cf_clobber.
>
> > --- a/xen/drivers/cpufreq/cpufreq.c
> > +++ b/xen/drivers/cpufreq/cpufreq.c
> > @@ -97,6 +97,15 @@ static int __init cf_check setup_cpufreq_option(cons=
t char *str)
> >              return cpufreq_cmdline_parse(arg + 1);
> >      }
> >
> > +    if ( choice < 0 && !cmdline_strcmp(str, "hwp") )
> > +    {
> > +        xen_processor_pmbits |=3D XEN_PROCESSOR_PM_PX;
> > +        cpufreq_controller =3D FREQCTL_xen;
> > +        opt_cpufreq_hwp =3D true;
> > +        if ( *arg && *(arg + 1) )
>
> A pretty unusual way of writing arg[1].

I just copied code above and out of context.  I'll change it to arg[1].

> > --- a/xen/include/acpi/cpufreq/cpufreq.h
> > +++ b/xen/include/acpi/cpufreq/cpufreq.h
> > @@ -246,4 +246,7 @@ void cpufreq_dbs_timer_resume(void);
> >
> >  void intel_feature_detect(struct cpufreq_policy *policy);
> >
> > +extern bool __initdata opt_cpufreq_hwp;
>
> No __initdata or alike on declarations please. Section placement
> attributes (among others) only belong on the definition.

Ok.

> > --- a/xen/include/acpi/cpufreq/processor_perf.h
> > +++ b/xen/include/acpi/cpufreq/processor_perf.h
> > @@ -7,6 +7,9 @@
> >
> >  #define XEN_PX_INIT 0x80000000
> >
> > +bool hwp_available(void);
> > +int hwp_register_driver(void);
> > +
> >  int powernow_cpufreq_init(void);
> >  unsigned int powernow_register_driver(void);
> >  unsigned int get_measured_perf(unsigned int cpu, unsigned int flag);
>
> The existing split between what lives in which header is pretty
> arbitrary from all I can tell. Is there a particular reason you can't
> keep together the four declarations you add?

No reason.  I'll move them all to cpufreq.h.  I was going to move them
to processor_perf.h, but later get/set_hwp_para() definitions need
struct cpufreq_policy.  cpufreq.h includes processor_perf.h before it
defines struct cpufreq_policy, so it's easier to just move the
declarations to cpufreq.h.

> > --- a/xen/include/public/sysctl.h
> > +++ b/xen/include/public/sysctl.h
> > @@ -296,6 +296,7 @@ struct xen_ondemand {
> >      uint32_t up_threshold;
> >  };
> >
> > +#define XEN_HWP_DRIVER "hwp"
>
> I think this wants some addition to the identifier which makes it expecte=
d
> that the expansion is a string literal. Perhaps XEN_HWP_DRIVER_NAME?

XEN_HWP_DRIVER_NAME sounds good.

> >  /*
>
> Nit: There also wants to be a blank line between #define and comment.

Ok.

Thanks, Jan.

Regards,
Jason

