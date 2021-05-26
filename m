Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4056391AFB
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 17:00:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132560.247210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llv0w-0001wj-7w; Wed, 26 May 2021 15:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132560.247210; Wed, 26 May 2021 15:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llv0w-0001sV-4P; Wed, 26 May 2021 15:00:06 +0000
Received: by outflank-mailman (input) for mailman id 132560;
 Wed, 26 May 2021 15:00:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1llv0u-0001YW-7B
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 15:00:04 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8495a6e8-5733-493d-841d-52bf67dd7ffb;
 Wed, 26 May 2021 15:00:02 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by smtp-out1.suse.de (Postfix) with ESMTP id 4A16B218B1;
 Wed, 26 May 2021 15:00:01 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 0A07F11A98;
 Wed, 26 May 2021 15:00:01 +0000 (UTC)
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
X-Inumbo-ID: 8495a6e8-5733-493d-841d-52bf67dd7ffb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622041201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uu12p+w5DaHnHdpZ5rnZx79/9gKgy3RKsXqKxmhmL8g=;
	b=RQeXFfgVGCBR/NBobEKza8y+2SmanEmqWhx3wQ9mRazdt5R2qLFR9QLTc7Srq3BG60gULS
	Gb9R7hz2XiiRXWkopy++LND0/C1BoUbAUG5x3iaOZ0uEz5JE3E4Xl05wlqev2xaGFEMzAr
	lCtciTdryBzBC7sU9Jn2Vb357fDpu64=
Subject: Re: [PATCH 04/13] cpufreq: Add Hardware P-State (HWP) driver
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-5-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1747789a-ab6c-cdae-ed35-a6b81ac580a9@suse.com>
Date: Wed, 26 May 2021 16:59:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210503192810.36084-5-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 21:28, Jason Andryuk wrote:
> If HWP Energy_Performance_Preference isn't supported, the code falls
> back to IA32_ENERGY_PERF_BIAS.  Right now, we don't check
> CPUID.06H:ECX.SETBH[bit 3] before using that MSR.

May I ask what problem there is doing so?

>  The SDM reads like
> it'll be available, and I assume it was available by the time Skylake
> introduced HWP.

The SDM documents the MSR's presence back to at least Nehalem, but ties
it to the CPUID bit even there.

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1355,6 +1355,15 @@ Specify whether guests are to be given access to physical port 80
>  (often used for debugging purposes), to override the DMI based
>  detection of systems known to misbehave upon accesses to that port.
>  
> +### hwp (x86)
> +> `= <boolean>`
> +
> +> Default: `true`
> +
> +Specifies whether Xen uses Hardware-Controlled Performance States (HWP)
> +on supported Intel hardware.  HWP is a Skylake+ feature which provides
> +better CPU power management.

Is there a particular reason giving this a top-level option rather
than a sub-option of cpufreq=?

> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> @@ -641,9 +641,12 @@ static int __init cpufreq_driver_init(void)
>      int ret = 0;
>  
>      if ((cpufreq_controller == FREQCTL_xen) &&
> -        (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL))
> -        ret = cpufreq_register_driver(&acpi_cpufreq_driver);
> -    else if ((cpufreq_controller == FREQCTL_xen) &&
> +        (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL)) {
> +        if (hwp_available())
> +            ret = hwp_register_driver();
> +        else
> +            ret = cpufreq_register_driver(&acpi_cpufreq_driver);
> +    } else if ((cpufreq_controller == FREQCTL_xen) &&

I'd prefer if you did this with slightly less code churn, e.g.
(considering that the vendor check isn't really necessary afaict)

    if ((cpufreq_controller == FREQCTL_xen) && hwp_available())
        ret = hwp_register_driver();
    else if ((cpufreq_controller == FREQCTL_xen) &&
             (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL))
        ret = cpufreq_register_driver(&acpi_cpufreq_driver);
    ...

> --- /dev/null
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> @@ -0,0 +1,533 @@
> +/*
> + * hwp.c cpufreq driver to run Intel Hardware P-States (HWP)
> + *
> + * Copyright (C) 2021 Jason Andryuk <jandryuk@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or (at
> + * your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/cpumask.h>
> +#include <xen/init.h>
> +#include <xen/param.h>
> +#include <xen/xmalloc.h>
> +#include <asm/msr.h>
> +#include <asm/io.h>

Nit: Please swap these two for being properly sorted (alphabetically).

> +#include <acpi/cpufreq/cpufreq.h>
> +
> +static bool feature_hwp;
> +static bool feature_hwp_notification;
> +static bool feature_hwp_activity_window;
> +static bool feature_hwp_energy_perf;
> +static bool feature_hwp_pkg_level_ctl;
> +static bool feature_hwp_peci;
> +
> +static bool feature_hdc;
> +static bool feature_fast_msr;
> +
> +bool opt_hwp = true;

Please add __read_mostly or even __initdata as applicable.

> +struct hwp_drv_data
> +{
> +    union
> +    {
> +        uint64_t hwp_caps;
> +        struct
> +        {
> +            uint64_t hw_highest:8;
> +            uint64_t hw_guaranteed:8;
> +            uint64_t hw_most_efficient:8;
> +            uint64_t hw_lowest:8;
> +            uint64_t hw_reserved:32;

I'd like to suggest to convert the hw_ prefixes here into ...

> +        };

... naming of the field ("hw") here.

> +    };
> +    union hwp_request curr_req;
> +    uint16_t activity_window;
> +    uint8_t minimum;
> +    uint8_t maximum;
> +    uint8_t desired;
> +    uint8_t energy_perf;
> +};
> +struct hwp_drv_data *hwp_drv_data[NR_CPUS];

New NR_CPUS-dimensioned arrays need explicit justification. From
what I get I can't see why this couldn't be per-CPU data instead.

Also - static?

> +#define hwp_err(...)     printk(XENLOG_ERR __VA_ARGS__)
> +#define hwp_info(...)    printk(XENLOG_INFO __VA_ARGS__)
> +#define hwp_verbose(...)                   \
> +({                                         \
> +    if ( cpufreq_verbose )                 \
> +    {                                      \
> +        printk(XENLOG_DEBUG __VA_ARGS__);  \
> +    }                                      \
> +})
> +#define hwp_verbose_cont(...)              \
> +({                                         \
> +    if ( cpufreq_verbose )                 \
> +    {                                      \
> +        printk(             __VA_ARGS__);  \
> +    }                                      \
> +})

Please omit this as not properly working (we don't have Linux'es
printk continuation logic) and as not actually used anywhere. For
hwp_verbose() please omit unnecessary braces.

> +static int hwp_governor(struct cpufreq_policy *policy,
> +                        unsigned int event)
> +{
> +    int ret;
> +
> +    if ( policy == NULL )
> +        return -EINVAL;
> +
> +    switch (event)

Style: Missing blanks.

> +    {
> +    case CPUFREQ_GOV_START:
> +        ret = 0;
> +        break;
> +    case CPUFREQ_GOV_STOP:
> +        ret = -EINVAL;
> +        break;

Any particular need for this, when you have ...

> +    case CPUFREQ_GOV_LIMITS:
> +        ret = 0;
> +        break;
> +    default:
> +        ret = -EINVAL;

... this (albeit with a missing "break")? Similarly, any particular
reason not to fold the other two?

> +bool hwp_available(void)

The only caller of this function is __init, so the function here should
be, too.

> +{
> +    uint32_t eax;

This could well be unsigned int afaict - see ./CODING_STYLE.

> +    uint64_t val;
> +    bool use_hwp;
> +
> +    if ( boot_cpu_data.cpuid_level < CPUID_PM_LEAF )
> +    {
> +        hwp_verbose("cpuid_level (%u) lacks HWP support\n", boot_cpu_data.cpuid_level);
> +
> +        return false;
> +    }
> +
> +    eax = cpuid_eax(CPUID_PM_LEAF);
> +    feature_hwp                 = !!(eax & CPUID6_EAX_HWP);
> +    feature_hwp_notification    = !!(eax & CPUID6_EAX_HWP_Notification);
> +    feature_hwp_activity_window = !!(eax & CPUID6_EAX_HWP_Activity_Window);
> +    feature_hwp_energy_perf     =
> +        !!(eax & CPUID6_EAX_HWP_Energy_Performance_Preference);
> +    feature_hwp_pkg_level_ctl   =
> +        !!(eax & CPUID6_EAX_HWP_Package_Level_Request);
> +    feature_hwp_peci            = !!(eax & CPUID6_EAX_HWP_PECI);

Please avoid !! unless it's really needed (i.e. when the conversion to
bool isn't implicit anyway). Also elsewhere.

> +    hwp_verbose("HWP: %d notify: %d act_window: %d energy_perf: %d pkg_level: %d peci: %d\n",
> +                feature_hwp, feature_hwp_notification,
> +                feature_hwp_activity_window, feature_hwp_energy_perf,
> +                feature_hwp_pkg_level_ctl, feature_hwp_peci);
> +
> +    if ( !feature_hwp )
> +    {
> +        hwp_verbose("Hardware does not support HWP\n");

This is redundant with the hwp_verbose immediately ahead.

> +        return false;
> +    }
> +
> +    if ( boot_cpu_data.cpuid_level < 0x16 )
> +    {
> +        hwp_info("HWP disabled: cpuid_level %x < 0x16 lacks CPU freq info\n",
> +                 boot_cpu_data.cpuid_level);
> +
> +        return false;

While we commonly insist on blank lines ahead ofthe main return
statement of a function, we don't normally have such extra blank
lines in cases like this one.

> +    }

Perhaps worth folding with the earlier CPUID level check?

> +    hwp_verbose("HWP: FAST_IA32_HWP_REQUEST %ssupported\n",
> +                eax & CPUID6_EAX_FAST_HWP_MSR ? "" : "not ");
> +    if ( eax & CPUID6_EAX_FAST_HWP_MSR )
> +    {
> +        if ( rdmsr_safe(MSR_FAST_UNCORE_MSRS_CAPABILITY, val) )
> +            hwp_err("error rdmsr_safe(MSR_FAST_UNCORE_MSRS_CAPABILITY)\n");
> +
> +        hwp_verbose("HWP: MSR_FAST_UNCORE_MSRS_CAPABILITY: %016lx\n", val);

Missing "else" above here?

> +        if (val & FAST_IA32_HWP_REQUEST )

Style: Missing blank.

> +static void hdc_set_pkg_hdc_ctl(bool val)
> +{
> +    uint64_t msr;
> +
> +    if ( rdmsr_safe(MSR_IA32_PKG_HDC_CTL, msr) )
> +    {
> +        hwp_err("error rdmsr_safe(MSR_IA32_PKG_HDC_CTL)\n");

I'm not convinced of the need of having such log messages after
failed rdmsr/wrmsr, but I'm definitely against them getting logged
unconditionally. In verbose mode, maybe.

> +        return;
> +    }
> +
> +    msr = val ? IA32_PKG_HDC_CTL_HDC_PKG_Enable : 0;

If you don't use the prior value, why did you read it? But I
think you really mean to set/clear just bot 0.

> +static void hdc_set_pm_ctl1(bool val)
> +{
> +    uint64_t msr;
> +
> +    if ( rdmsr_safe(MSR_IA32_PM_CTL1, msr) )
> +    {
> +        hwp_err("error rdmsr_safe(MSR_IA32_PM_CTL1)\n");
> +
> +        return;
> +    }
> +
> +    msr = val ? IA32_PM_CTL1_HDC_Allow_Block : 0;

Same here then, and ...

> +static void hwp_fast_uncore_msrs_ctl(bool val)
> +{
> +    uint64_t msr;
> +
> +    if ( rdmsr_safe(MSR_FAST_UNCORE_MSRS_CTL, msr) )
> +        hwp_err("error rdmsr_safe(MSR_FAST_UNCORE_MSRS_CTL)\n");
> +
> +    msr = val;

... here (where you imply bit 0 instead of using a proper
constant).

Also for all three functions I'm not convinced their names are
in good sync with their parameters being boolean.

> +static void hwp_read_capabilities(void *info)
> +{
> +    struct cpufreq_policy *policy = info;
> +    struct hwp_drv_data *data = hwp_drv_data[policy->cpu];
> +
> +    if ( rdmsr_safe(MSR_IA32_HWP_CAPABILITIES, data->hwp_caps) )
> +    {
> +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_HWP_CAPABILITIES)\n",
> +                policy->cpu);
> +
> +        return;
> +    }
> +
> +    if ( rdmsr_safe(MSR_IA32_HWP_REQUEST, data->curr_req.raw) )
> +    {
> +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_HWP_REQUEST)\n", policy->cpu);
> +
> +        return;
> +    }
> +}

This function doesn't indicate failure to its caller(s), so am I
to understand that failure to read either ofthe MSRs is actually
benign to the driver?

> +static void hwp_init_msrs(void *info)
> +{
> +    struct cpufreq_policy *policy = info;
> +    uint64_t val;
> +
> +    /* Package level MSR, but we don't have a good idea of packages here, so
> +     * just do it everytime. */

Style: Comment format (also elsewhere).

> +    if ( rdmsr_safe(MSR_IA32_PM_ENABLE, val) )
> +    {
> +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_PM_ENABLE)\n", policy->cpu);
> +
> +        return;
> +    }
> +
> +    hwp_verbose("CPU%u: MSR_IA32_PM_ENABLE: %016lx\n", policy->cpu, val);
> +    if ( val != IA32_PM_ENABLE_HWP_ENABLE )
> +    {
> +        val = IA32_PM_ENABLE_HWP_ENABLE;

You should neither depend on reserved bits being zero, nor discard any
non-zero value here, I think.

> +        if ( wrmsr_safe(MSR_IA32_PM_ENABLE, val) )
> +            hwp_err("CPU%u: error wrmsr_safe(MSR_IA32_PM_ENABLE, %lx)\n",
> +                    policy->cpu, val);
> +    }
> +
> +    hwp_read_capabilities(info);

Please pass properly typed arguments (and have properly typed parameters)
wherever possible - here: policy. The exception are callback functions
and alike, where the function type may have to match a sufficiently
generic one.

> +static int hwp_cpufreq_verify(struct cpufreq_policy *policy)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct hwp_drv_data *data = hwp_drv_data[cpu];
> +
> +    if ( !feature_hwp_energy_perf && data->energy_perf )
> +    {
> +        if ( data->energy_perf > 15 )
> +        {
> +            hwp_err("energy_perf %d exceeds IA32_ENERGY_PERF_BIAS range 0-15\n",
> +                    data->energy_perf);
> +
> +            return -EINVAL;
> +        }
> +    }
> +
> +    if ( !feature_hwp_activity_window && data->activity_window )
> +    {
> +        hwp_err("HWP activity window not supported.\n");

As in the majority of log messages you have, please omit full stops.

> +static void hwp_energy_perf_bias(void *info)
> +{
> +    uint64_t msr;
> +    struct hwp_drv_data *data = info;
> +    uint8_t val = data->energy_perf;
> +
> +    ASSERT(val <= 15);
> +
> +    if ( rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS, msr) )
> +    {
> +        hwp_err("error rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS)\n");
> +
> +        return;
> +    }
> +
> +    msr &= ~(0xf);

Unnessary parentheses.

> +static void hwp_write_request(void *info)
> +{
> +    struct cpufreq_policy *policy = info;
> +    struct hwp_drv_data *data = hwp_drv_data[policy->cpu];
> +    union hwp_request hwp_req = data->curr_req;
> +
> +    BUILD_BUG_ON(sizeof(union hwp_request) != sizeof(uint64_t));

ITYM

    BUILD_BUG_ON(sizeof(hwp_req) != sizeof(hwp_req.raw));

here?

> +    if ( wrmsr_safe(MSR_IA32_HWP_REQUEST, hwp_req.raw) )
> +    {
> +        hwp_err("CPU%u: error wrmsr_safe(MSR_IA32_HWP_REQUEST, %lx)\n",
> +                policy->cpu, hwp_req.raw);
> +        rdmsr_safe(MSR_IA32_HWP_REQUEST, data->curr_req.raw);

What if this one fails, too? data->curr_req.raw then pretty certainly
ends up stale.

> +static int hwp_cpufreq_target(struct cpufreq_policy *policy,
> +                              unsigned int target_freq, unsigned int relation)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct hwp_drv_data *data = hwp_drv_data[cpu];
> +    union hwp_request hwp_req;
> +
> +    /* Zero everything to ensure reserved bits are zero... */
> +    hwp_req.raw = 0;> +    /* .. and update from there */
> +    hwp_req.min_perf = data->minimum;
> +    hwp_req.max_perf = data->maximum;
> +    hwp_req.desired = data->desired;

We typically prefer to use initializers to achieve the same effect.
Since the bitfields part is in an unnamed struct, old gcc would
prohibit use of an initializer for all of the assignments, but at
least "raw" can be set in the initializer.

> +    if ( feature_hwp_energy_perf )
> +        hwp_req.energy_perf = data->energy_perf;
> +    if ( feature_hwp_activity_window )
> +        hwp_req.activity_window = data->activity_window;
> +
> +    if ( hwp_req.raw == data->curr_req.raw )
> +        return 0;
> +
> +    data->curr_req.raw = hwp_req.raw;

I think you can omit .raw on both sides.

> +    hwp_verbose("CPU%u: wrmsr HWP_REQUEST %016lx\n", cpu, hwp_req.raw);
> +    on_selected_cpus(cpumask_of(cpu), hwp_write_request, policy, 1);
> +
> +    if ( !feature_hwp_energy_perf && data->energy_perf )
> +    {
> +        on_selected_cpus(cpumask_of(cpu), hwp_energy_perf_bias,
> +                         data, 1);
> +    }

Like elsewhere, please omit unnecessary braces.

> +static int hwp_cpufreq_cpu_init(struct cpufreq_policy *policy)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct hwp_drv_data *data;
> +
> +    if ( cpufreq_opt_governor )
> +    {
> +        printk(XENLOG_WARNING
> +               "HWP: governor \"%s\" is incompatible with hwp. Using default \"%s\"\n",
> +               cpufreq_opt_governor->name, hwp_cpufreq_governor.name);
> +    }

Same here (and perhaps elsewhere) again.

> +    policy->governor = &hwp_cpufreq_governor;
> +
> +    data = xzalloc(typeof(*data));

Commonly we specify the type explicitly in such cases, rather than using
typeof(). I will admit though that I'm not entirely certain which one's
better. But consistency across the code base is perhaps preferable for
the time being.

> +    if ( !data )
> +        return -ENOMEM;

Is it correct to have set the governor before this error check?

> +    hwp_drv_data[cpu] = data;
> +
> +    on_selected_cpus(cpumask_of(cpu), hwp_init_msrs, policy, 1);
> +
> +    data->minimum = data->hw_lowest;
> +    data->maximum = data->hw_highest;
> +    data->desired = 0; /* default to HW autonomous */
> +    if ( feature_hwp_energy_perf )
> +        data->energy_perf = 0x80;
> +    else
> +        data->energy_perf = 7;

Where's this 7 coming from? (You do mention the 0x80 at least in the
description.)

> +static int hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy)
> +{
> +    unsigned int cpu = policy->cpu;
> +
> +    xfree(hwp_drv_data[cpu]);
> +    hwp_drv_data[cpu] = NULL;

Please don't open-code XFREE().

> +int hwp_register_driver(void)

__init

> +{
> +    int ret;
> +
> +    ret = cpufreq_register_driver(&hwp_cpufreq_driver);
> +
> +    return ret;

Preferably the body would consist of just a singe return statement.

> --- a/xen/include/asm-x86/msr-index.h
> +++ b/xen/include/asm-x86/msr-index.h
> @@ -101,6 +101,12 @@
>  #define MSR_RTIT_ADDR_A(n)                 (0x00000580 + (n) * 2)
>  #define MSR_RTIT_ADDR_B(n)                 (0x00000581 + (n) * 2)
>  
> +#define MSR_FAST_UNCORE_MSRS_CTL            0x00000657
> +#define  FAST_IA32_HWP_REQUEST_MSR_ENABLE   (_AC(1, ULL) <<  0)
> +
> +#define MSR_FAST_UNCORE_MSRS_CAPABILITY     0x0000065f
> +#define  FAST_IA32_HWP_REQUEST              (_AC(1, ULL) <<  0)
> +
>  #define MSR_U_CET                           0x000006a0
>  #define MSR_S_CET                           0x000006a2
>  #define  CET_SHSTK_EN                       (_AC(1, ULL) <<  0)
> @@ -112,10 +118,20 @@
>  #define MSR_PL3_SSP                         0x000006a7
>  #define MSR_INTERRUPT_SSP_TABLE             0x000006a8
>  
> +#define MSR_IA32_PM_ENABLE                  0x00000770
> +#define  IA32_PM_ENABLE_HWP_ENABLE          (_AC(1, ULL) <<  0)

Please have a blank line after here.

> +#define MSR_IA32_HWP_CAPABILITIES           0x00000771
> +#define MSR_IA32_HWP_REQUEST                0x00000774
> +
>  #define MSR_PASID                           0x00000d93
>  #define  PASID_PASID_MASK                   0x000fffff
>  #define  PASID_VALID                        (_AC(1, ULL) << 31)
>  
> +#define MSR_IA32_PKG_HDC_CTL                0x00000db0
> +#define  IA32_PKG_HDC_CTL_HDC_PKG_Enable    (_AC(1, ULL) <<  0)

I don't think "HDC" twice is helpful?

Also please use all upper case names (actually also for the
CPUID constants higher up).

Jan

