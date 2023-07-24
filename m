Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE77760009
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 21:51:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569232.889570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO1ZR-0008Gu-5l; Mon, 24 Jul 2023 19:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569232.889570; Mon, 24 Jul 2023 19:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO1ZR-0008ES-27; Mon, 24 Jul 2023 19:50:17 +0000
Received: by outflank-mailman (input) for mailman id 569232;
 Mon, 24 Jul 2023 19:50:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymW7=DK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qO1ZP-0008EM-Go
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 19:50:15 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4de2f44f-2a5b-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 21:50:13 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fb863edcb6so7151030e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 12:50:13 -0700 (PDT)
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
X-Inumbo-ID: 4de2f44f-2a5b-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690228213; x=1690833013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Om4Ojxr126IDdlj6zdRkR8pSwS+LP03jHkiJwEpCx/s=;
        b=m8iUL22DTywd0S9tqCFVe8Xjqy3JPavpPH2em0rnnNNNqlUE4hMbZ4KIUcbnsBchEj
         DY/voo/S9px/zwjZHB4fM7F433NAOQOiCchXmpf+yMyfxh9IhKhmb6MXOGZnis6O0cnj
         BRI2Gof6BtSrNY2ldrzhCOcc3ptaiiPCyWNHDlOSX2RxaCx5W5bj2hutARUtizjo0a6G
         EcTMFeUxS0FummnhwefHMfOOS721VUXAbBm2OXWEIlNkMnCFcvQAi31xptpyYa6WQC9r
         E+BF+azm4WF6zKOlynsdQke4q0lsVKVwKRo286exme8MQYPwtW60NiRKk7Oe+c27Tyh+
         bVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690228213; x=1690833013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Om4Ojxr126IDdlj6zdRkR8pSwS+LP03jHkiJwEpCx/s=;
        b=X+EQVjkyKRCHdz2pD1LuDL0z7qfjlYYCc3q2NMaH16PcEzPQKGhV06Yj5ABjR7CjgQ
         H+W+g1zEoIG2aH3AKYfaXwED1+F8+ftrZQZxUQ4UqjTZC+a8fB1qsPOXgPj0id8u40Ak
         Slfjj/MEErb1bLlfLkYxK0hsGSyF8ydmeWF8BTxqlX1sn0xsSqfNMXYwrv/B5Sr1B69a
         CcIBnM0L6rM+xF12e6UQUqOxhxz2hUHMfClpigVY5wK891/iWPQVzp4gAywdZGZkTBVV
         LzhIFQpf4bRrhCykSxen6jNm5BCv++UQxzXLbcsNbHnKWeGsV1GgJ74oO50z4rstPFmr
         nLww==
X-Gm-Message-State: ABy/qLZASJLlBe86GK7SZsNHeODrYEUqxH2qcs4uom+hVoriQK8qJh73
	VmnG/Z4A+5NJpoUkE1NwWU7aEsVZPR8tu6E4iZw=
X-Google-Smtp-Source: APBJJlHDBm6FgjYq4tytAG0K99zsRfwcBX6SSiz4i+Bn+kKiJYHgDg+Wf8MxfTP2inw/eRBHjm3k17SX/IW9kebxSGs=
X-Received: by 2002:a19:ca5a:0:b0:4fd:d862:72a6 with SMTP id
 h26-20020a19ca5a000000b004fdd86272a6mr5417924lfj.53.1690228212284; Mon, 24
 Jul 2023 12:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230724125857.11133-1-jandryuk@gmail.com> <20230724125857.11133-7-jandryuk@gmail.com>
 <7636d3d2-c78d-711a-ed90-aedd1b464c6c@suse.com>
In-Reply-To: <7636d3d2-c78d-711a-ed90-aedd1b464c6c@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 24 Jul 2023 15:49:58 -0400
Message-ID: <CAKf6xpt1LzKMv7E-G3sTpUWrEApy+BX8z7dG69oS1upHcpytMg@mail.gmail.com>
Subject: Re: [PATCH v6 06/15] cpufreq: Add Hardware P-State (HWP) driver
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 12:15=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 24.07.2023 14:58, Jason Andryuk wrote:
> > --- /dev/null
> > +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> > @@ -0,0 +1,521 @@
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
> > +#include <asm/msr.h>
> > +#include <acpi/cpufreq/cpufreq.h>
> > +
> > +static bool __ro_after_init feature_hwp_notification;
> > +static bool __ro_after_init feature_hwp_activity_window;
> > +
> > +static bool __ro_after_init feature_hdc;
> > +
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
> > +        unsigned int :16;
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
> > +            unsigned int :32;
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
> > +static DEFINE_PER_CPU_READ_MOSTLY(struct hwp_drv_data *, hwp_drv_data)=
;
> > +
> > +#define hwp_err(cpu, fmt, ...) \
> > +    printk(XENLOG_ERR "HWP: CPU%u error: " fmt, cpu, ##__VA_ARGS__)
> > +#define hwp_info(fmt, ...)    printk(XENLOG_INFO "HWP: " fmt, ##__VA_A=
RGS__)
>
> I'm not convinced ", ##__VA_ARGS__" is a good construct to use. I notice
> we have a few instances (mainly in code inherited from elsewhere), but I
> think it ought to either be plain C99 style (without the ##) or purely
> the gcc extension form (not using __VA_ARGS__).

Using plain __VA_ARGS__ doesn't work for the cases without arguments:
arch/x86/acpi/cpufreq/hwp.c:78:53: error: expected expression before =E2=80=
=98)=E2=80=99 token
   78 |         printk(XENLOG_DEBUG "HWP: " fmt, __VA_ARGS__);  \
      |                                                     ^
arch/x86/acpi/cpufreq/hwp.c:201:9: note: in expansion of macro =E2=80=98hwp=
_verbose=E2=80=99
  201 |         hwp_verbose("disabled: No energy/performance
preference available");
      |         ^~~~~~~~~~~

I can use "__VA_OPT__(,) __VA_ARGS__" though.

> > +#define hwp_verbose(fmt, ...)                             \
> > +({                                                        \
> > +    if ( cpufreq_verbose )                                \
> > +        printk(XENLOG_DEBUG "HWP: " fmt, ##__VA_ARGS__);  \
>
> (One more here then.)
>
> > +static bool hwp_handle_option(const char *s, const char *end)
>
> __init?

Yes, thanks.

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
> Earlier on I asked what about cases where the CPUID output yields
> some zero values (as I know can happen). Iirc you said this doesn't
> affect functionality, but wouldn't it make sense to have a comment
> to this effect here (proving the cases were thought through).

Sure.

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
>
> Nit: The comment could do with adding at least a comma or semicolon.

Will change to "Check for turbo support."  APERF/MPERF was removed
from intel_feature_detect() in commit 4dd16c44152f ("x86/cpufreq:
Rework APERF/MPERF handling").

> > +    if ( feature_hdc &&
> > +         (!hdc_set_pkg_hdc_ctl(policy->cpu, opt_cpufreq_hdc) ||
> > +          !hdc_set_pm_ctl1(policy->cpu, opt_cpufreq_hdc)) )
> > +    {
> > +            hwp_err(policy->cpu, "Disabling HDC support\n");
> > +            feature_hdc =3D false;
>
> Nit: Too deep indentation.

Yes, thanks.

> > +static int cf_check hwp_cpufreq_cpu_init(struct cpufreq_policy *policy=
)
> > +{
> > +    static union hwp_request initial_req;
> > +    unsigned int cpu =3D policy->cpu;
> > +    struct hwp_drv_data *data;
> > +    bool first_run =3D false;
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
> > +
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
> > +    if ( initial_req.raw =3D=3D 0 )
> > +    {
> > +        hwp_verbose("CPU%u: HWP_CAPABILITIES: %016lx\n", cpu, data->hw=
p_caps);
> > +        initial_req =3D data->curr_req;
> > +        first_run =3D true;
> > +    }
>
> What part of data->curr_req is guaranteed to be non-0 (for the condition
> around ...
>
> > +    if ( first_run || data->curr_req.raw !=3D initial_req.raw )
> > +        hwp_verbose("CPU%u: rdmsr HWP_REQUEST %016lx\n", cpu,
> > +                    data->curr_req.raw);
>
> ... this logging to be effective)?

Hmmm.  I think you are correct that there is no guarantee that
data->curr_req will be non-zero.  i.e. a BIOS could zero the whole
register.  In practice, I see 0x8000ff01 - energy_perf =3D 0x80, maximum
=3D 0xff and minimum =3D 0x01.

Would you prefer that I make first_run a static variable to track if
initial_req has been populated?

> > +static void cf_check hwp_set_misc_turbo(void *info)
> > +{
> > +    const struct cpufreq_policy *policy =3D info;
> > +    struct hwp_drv_data *data =3D per_cpu(hwp_drv_data, policy->cpu);
> > +    uint64_t msr;
> > +
> > +    data->ret =3D 0;
> > +
> > +    if ( rdmsr_safe(MSR_IA32_MISC_ENABLE, msr) )
> > +    {
> > +        hwp_verbose("CPU%u: error rdmsr_safe(MSR_IA32_MISC_ENABLE)\n",
> > +                    policy->cpu);
> > +        data->ret =3D -EINVAL;
> > +
> > +        return;
> > +    }
> > +
> > +    if ( policy->turbo =3D=3D CPUFREQ_TURBO_ENABLED )
> > +        msr &=3D ~MSR_IA32_MISC_ENABLE_TURBO_DISENGAGE;
> > +    else
> > +        msr |=3D MSR_IA32_MISC_ENABLE_TURBO_DISENGAGE;
> > +
> > +    if ( wrmsr_safe(MSR_IA32_MISC_ENABLE, msr) )
> > +    {
> > +        hwp_verbose("CPU%u: error wrmsr_safe(MSR_IA32_MISC_ENABLE): %0=
16lx\n",
> > +                    policy->cpu, msr);
> > +        data->ret =3D -EINVAL;
> > +    }
> > +}
>
> Neither of the two -EINVAL really indicate an invalid argument that was
> passed. Maybe EACCES (or less desirably EFAULT)?

Ok, I'll use EACCES.

> > @@ -89,15 +96,45 @@ static int __init cf_check setup_cpufreq_option(con=
st char *str)
> >          return 0;
> >      }
> >
> > -    if ( choice > 0 || !cmdline_strcmp(str, "xen") )
> > +    do
> >      {
> > -        xen_processor_pmbits |=3D XEN_PROCESSOR_PM_PX;
> > -        cpufreq_controller =3D FREQCTL_xen;
> > -        if ( *arg && *(arg + 1) )
> > -            return cpufreq_cmdline_parse(arg + 1);
> > -    }
> > +        const char *end =3D strchr(str, ';');
> > +
> > +        if ( end =3D=3D NULL )
> > +            end =3D strchr(str, '\0');
> > +
> > +        arg =3D strpbrk(str, ",:");
> > +        if ( !arg || arg > end )
> > +            arg =3D strchr(str, '\0');
> > +
> > +        if ( cpufreq_xen_cnt =3D=3D ARRAY_SIZE(cpufreq_xen_opts) )
> > +            return -E2BIG;
> > +
> > +        if ( choice > 0 || !cmdline_strcmp(str, "xen") )
> > +        {
> > +            xen_processor_pmbits |=3D XEN_PROCESSOR_PM_PX;
> > +            cpufreq_controller =3D FREQCTL_xen;
> > +            cpufreq_xen_opts[cpufreq_xen_cnt++] =3D CPUFREQ_xen;
> > +            ret =3D 0;
> > +            if ( arg[0] && arg[1] )
> > +                ret =3D cpufreq_cmdline_parse(arg + 1, end);
> > +        }
> > +        else if ( choice < 0 && !cmdline_strcmp(str, "hwp") )
> > +        {
> > +            xen_processor_pmbits |=3D XEN_PROCESSOR_PM_PX;
> > +            cpufreq_controller =3D FREQCTL_xen;
> > +            cpufreq_xen_opts[cpufreq_xen_cnt++] =3D CPUFREQ_hwp;
> > +            ret =3D 0;
> > +            if ( arg[0] && arg[1] )
> > +                ret =3D hwp_cmdline_parse(arg + 1, end);
> > +        }
> > +        else
> > +            ret =3D -EINVAL;
> > +
> > +        str =3D end ? ++end : end;
> > +    } while ( choice < 0 && ret =3D=3D 0 && *str );
>
> According to the earlier of the two lines, str may be NULL and hence
> cannot be dereferenced without first checking to be non-NULL. Earlier
> in the loop though you ensure end cannot be NULL. In that case,
> however, you point end at the nul character, so the increment above
> would point end at the next following one. So my guess is that you
> meant
>
>         str =3D *end ? ++end : end;

Yes, you are correct.  Thanks for catching it.

Thanks,
Jason

