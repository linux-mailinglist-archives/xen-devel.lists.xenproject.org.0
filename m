Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CCE3929A3
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 10:34:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132897.247835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmBSj-0003Aw-3e; Thu, 27 May 2021 08:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132897.247835; Thu, 27 May 2021 08:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmBSi-00038n-Vv; Thu, 27 May 2021 08:33:52 +0000
Received: by outflank-mailman (input) for mailman id 132897;
 Thu, 27 May 2021 08:33:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmBSi-00038E-CB
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 08:33:52 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5df67993-02ee-4b59-94b9-220ab23e3b6b;
 Thu, 27 May 2021 08:33:51 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 09D381FD2E;
 Thu, 27 May 2021 08:33:50 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id C7A7611A98;
 Thu, 27 May 2021 08:33:49 +0000 (UTC)
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
X-Inumbo-ID: 5df67993-02ee-4b59-94b9-220ab23e3b6b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622104430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nxo1MCJM/R6X+NZdOmKMBJAoaKiDZ3/+fKvIWgwMmxE=;
	b=JMwPK1eq6aY8Felxof3sRFrpR94JhPoewdNEZA/ss1ukV9q3i/sadewVb4SN4LJ3k+powO
	UnjjEA8HXn1LTTZ7B0ASi0aeBWh8HGrLFsKh081AL+qaZodgYCjft/bE/fRxX9fViqGp4e
	7mxodFXk6CcDaLG7+miUJpTglM9BEmY=
Subject: Re: [PATCH 09/13] xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-10-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fe5d6d76-83a8-aabd-0148-949726a45ad0@suse.com>
Date: Thu, 27 May 2021 10:33:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210503192810.36084-10-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 21:28, Jason Andryuk wrote:
> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> @@ -547,6 +547,120 @@ int get_hwp_para(struct cpufreq_policy *policy, struct xen_hwp_para *hwp_para)
>      return 0;
>  }
>  
> +int set_hwp_para(struct cpufreq_policy *policy,
> +                 struct xen_set_hwp_para *set_hwp)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct hwp_drv_data *data = hwp_drv_data[cpu];
> +
> +    if ( data == NULL )
> +        return -EINVAL;
> +
> +    /* Validate all parameters first */
> +    if ( set_hwp->set_params & ~XEN_SYSCTL_HWP_SET_PARAM_MASK )
> +    {
> +        hwp_err("Invalid bits in hwp set_params %u\n",
> +                set_hwp->set_params);
> +
> +        return -EINVAL;
> +    }
> +
> +    if ( set_hwp->activity_window & ~XEN_SYSCTL_HWP_ACT_WINDOW_MASK )
> +    {
> +        hwp_err("Invalid bits in activity window %u\n",
> +                set_hwp->activity_window);
> +
> +        return -EINVAL;
> +    }
> +
> +    if ( !feature_hwp_energy_perf &&
> +         set_hwp->set_params & XEN_SYSCTL_HWP_SET_ENERGY_PERF &&

Please add parentheses around the operands of & here and ...

> +         set_hwp->energy_perf > 0xf )
> +    {
> +        hwp_err("energy_perf %u out of range for IA32_ENERGY_PERF_BIAS\n",
> +                set_hwp->energy_perf);
> +
> +        return -EINVAL;
> +    }
> +
> +    if ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_DESIRED &&

... here.

> +         set_hwp->desired != 0 &&
> +         ( set_hwp->desired < data->hw_lowest ||
> +           set_hwp->desired > data->hw_highest ) )

Excess blanks inside the inner pair of parentheses.

> +    {
> +        hwp_err("hwp desired %u is out of range (%u ... %u)\n",
> +                set_hwp->desired, data->hw_lowest, data->hw_highest);
> +
> +        return -EINVAL;
> +    }

None of these -EINVAL should be accompanied by a hwp_err, imo.

> +    /*
> +     * minimum & maximum are not validated as hardware doesn't seem to care
> +     * and the SDM says CPUs will clip internally.
> +     */
> +
> +    /* Apply presets */
> +    switch ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_PRESET_MASK )
> +    {
> +    case XEN_SYSCTL_HWP_SET_PRESET_POWERSAVE:
> +        data->minimum = data->hw_lowest;
> +        data->maximum = data->hw_lowest;
> +        data->activity_window = 0;
> +        if ( feature_hwp_energy_perf )
> +            data->energy_perf = 0xff;
> +        else
> +            data->energy_perf = 0xf;

There may want to be constants #define-d for these, and ...

> +        data->desired = 0;
> +        break;
> +    case XEN_SYSCTL_HWP_SET_PRESET_PERFORMANCE:
> +        data->minimum = data->hw_highest;
> +        data->maximum = data->hw_highest;
> +        data->activity_window = 0;
> +        data->energy_perf = 0;
> +        data->desired = 0;
> +        break;
> +    case XEN_SYSCTL_HWP_SET_PRESET_BALANCE:
> +        data->minimum = data->hw_lowest;
> +        data->maximum = data->hw_highest;
> +        data->activity_window = 0;
> +        data->energy_perf = 0x80;
> +        if ( feature_hwp_energy_perf )
> +            data->energy_perf = 0x80;
> +        else
> +            data->energy_perf = 0x7;

... since these aren't the sole instances of these kind of magic
numbers there surely want to be #define-s for these (such that
the connection between the two [or more?] instances becomes
visible). Actually, the same applies to the 0xf further up, which
has a second use yet a few more lines up.

> +        data->desired = 0;
> +        break;
> +    case XEN_SYSCTL_HWP_SET_PRESET_NONE:
> +        break;
> +    default:
> +        printk("HWP: Invalid preset value: %u\n",
> +               set_hwp->set_params & XEN_SYSCTL_HWP_SET_PRESET_MASK);
> +
> +        return -EINVAL;
> +    }

For the entire switch() - please have blank lines between (non-fall-
through, which here is all of them) case blocks.

> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -318,6 +318,24 @@ static int set_cpufreq_gov(struct xen_sysctl_pm_op *op)
>      return __cpufreq_set_policy(old_policy, &new_policy);
>  }
>  
> +static int set_cpufreq_hwp(struct xen_sysctl_pm_op *op)
> +{
> +    struct cpufreq_policy *policy;
> +
> +    if ( !cpufreq_governor_internal )
> +        return -EINVAL;
> +
> +    policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
> +
> +    if ( !policy || !policy->governor )
> +        return -EINVAL;
> +
> +    if ( strncasecmp(policy->governor->name, "hwp-internal", CPUFREQ_NAME_LEN) )

I think this recurring string literal also wants to at least gain
a #define.

> @@ -465,6 +483,12 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
>          break;
>      }
>  
> +    case SET_CPUFREQ_HWP:
> +    {
> +        ret = set_cpufreq_hwp(op);
> +        break;
> +    }
> +
>      case SET_CPUFREQ_PARA:
>      {
>          ret = set_cpufreq_para(op);

I think you want to insert somewhere below this one and, despite all
the odd precedents, omit the stray braces.

> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -248,5 +248,7 @@ void cpufreq_dbs_timer_resume(void);
>  
>  /********************** hwp hypercall helper *************************/
>  int get_hwp_para(struct cpufreq_policy *policy, struct xen_hwp_para *hwp_para);
> +int set_hwp_para(struct cpufreq_policy *policy,
> +                 struct xen_set_hwp_para *set_hwp);

This renders the comment stale - the patch introducing it probably
can use plural right away.

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -318,6 +318,36 @@ struct xen_hwp_para {
>      uint8_t energy_perf;
>  };
>  
> +/* set multiple values simultaneously when set_args bit is set */
> +struct xen_set_hwp_para {
> +    uint16_t set_params; /* bitflags for valid values */
> +#define XEN_SYSCTL_HWP_SET_DESIRED              (1U << 0)
> +#define XEN_SYSCTL_HWP_SET_ENERGY_PERF          (1U << 1)
> +#define XEN_SYSCTL_HWP_SET_ACT_WINDOW           (1U << 2)
> +#define XEN_SYSCTL_HWP_SET_MINIMUM              (1U << 3)
> +#define XEN_SYSCTL_HWP_SET_MAXIMUM              (1U << 4)
> +#define XEN_SYSCTL_HWP_SET_PRESET_MASK          (0xf000)
> +#define XEN_SYSCTL_HWP_SET_PRESET_NONE          (0x0000)
> +#define XEN_SYSCTL_HWP_SET_PRESET_BALANCE       (0x1000)
> +#define XEN_SYSCTL_HWP_SET_PRESET_POWERSAVE     (0x2000)
> +#define XEN_SYSCTL_HWP_SET_PRESET_PERFORMANCE   (0x3000)

Personally I'd prefer unnecessary parentheses (like around single
tokens) to be omitted.

> +#define XEN_SYSCTL_HWP_SET_PARAM_MASK ((uint16_t)( \

What's the reason for this cast? Wherever possible #define-d
constants should be suitable for use in preprocessor conditionals.

> +                                  XEN_SYSCTL_HWP_SET_PRESET_MASK | \
> +                                  XEN_SYSCTL_HWP_SET_DESIRED     | \
> +                                  XEN_SYSCTL_HWP_SET_ENERGY_PERF | \
> +                                  XEN_SYSCTL_HWP_SET_ACT_WINDOW  | \
> +                                  XEN_SYSCTL_HWP_SET_MINIMUM     | \
> +                                  XEN_SYSCTL_HWP_SET_MAXIMUM     ))
> +
> +    uint16_t activity_window; /* 7bit mantissa and 3bit exponent */

Since the other respective comment is to be extended, perhaps here
you can simply refer to that one?

> +#define XEN_SYSCTL_HWP_ACT_WINDOW_MASK          (0x03ff)
> +    uint8_t minimum;
> +    uint8_t maximum;
> +    uint8_t desired;
> +    uint8_t energy_perf; /* 0-255 or 0-15 depending on HW support */
> +};
> +
> +

No double blank lines please.

Jan

