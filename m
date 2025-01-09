Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B155AA073D5
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 11:56:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868082.1279620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqCB-00027R-On; Thu, 09 Jan 2025 10:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868082.1279620; Thu, 09 Jan 2025 10:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqCB-000255-Lf; Thu, 09 Jan 2025 10:55:23 +0000
Received: by outflank-mailman (input) for mailman id 868082;
 Thu, 09 Jan 2025 10:55:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVqC9-00024z-Qc
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 10:55:21 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37c31aea-ce78-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 11:55:20 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso5929275e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 02:55:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e3853b6sm1472700f8f.44.2025.01.09.02.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 02:55:19 -0800 (PST)
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
X-Inumbo-ID: 37c31aea-ce78-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736420119; x=1737024919; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C3L6vmC0lgo1xiXBX6ft5qjBXwbLSm+1yFhupCvA/r4=;
        b=MTYkkWcebfLArRLNaSO4yd/NBmCqwxo2i7BVxWSjHITsi38igqol3UbyY4FcnGhWNp
         qZJGb/cfORottVOv6ZpBW12MBCi6hxdeA2KHf7cM9YhCCdR+u0bT5NsCi+Bo+uART8KE
         MPLb3bTVouqzvzyLlgJj9RZ7K3amkvCwKeWTLXZO084hZCInYJKrH6ugIDUwjXU7AGle
         JzwmmPAwxdD+rxyrqCzekZpqd/vC5CIB4pdmRAhJzq337rfjW15Fi+QApXchXtl3/pva
         2P3awbYTkRkueoVwOadYg4jWTwrUOVWqpMn4BhS/1S9L+3JKRXq0nevducDEJgPpYgep
         B8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736420119; x=1737024919;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3L6vmC0lgo1xiXBX6ft5qjBXwbLSm+1yFhupCvA/r4=;
        b=oE+sWt9hXTlXZUsUvthQgKOijdrftwUgRxHhr8JElTuizg1xGzQjyi3MQWmDrSeWP5
         A9EH0yWuUd0BR3LxwoP1YsOmgXyXL+f/hAIr0Gx/PCfIxeE9K7+1yb1mYcb4v4YsYddW
         xu23GfZJ5S+0uFazlqKJN1G/7ll7BawrXbbOfMglG05iTzwM+m/Pw69qv2k2u2eGdL82
         BW3K95oBOINxKiYAlqVeFrYxPwj/vnliVGy49IstwE0skQVfZMhrpwLp/lP9dJtJ6g7b
         9QPpy9s1T/YYSiVxj5wc2ft/98+YiAHW4V5cqmPCdG4VqrIFn7MtvfEQwNuf09pKTsTc
         j8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuWMa8Dik2G94E97SFRRyG1dVY+waBmhWHs/gWhuWQBTnxoecWtRwyCCVMyturybricDaHvLd5Xkc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxFQpw1qFXACENY4Y4i6+w1HuwKy982sOh/N7PI8FjqC11gIav
	sMvISvSgmPVIR3ayxlBtG02qugVYkou3zGMjsLyKKonO28QY9PUzVZ0J5wg5AA==
X-Gm-Gg: ASbGncvUkwUxwX+ehwEka1kG5z0Nt4VSurP2XsG9tG7/yLnQMMJ3Z8cLaoUvkDAyhl2
	UqLm0bL77Hx7xHBPTqjf8hWV6weuIljwsfRwlqSlHuZchTlNQjkcvhJPVyN8PMIQYrnU8RDG1YS
	G0h53BQJeL0R4UgdvB8wHAZny3EV+tNzmtODcV//spTadNfmGYES7G+6Fn0F92UZAYoIfNdqBj9
	3lcMSpH/o8bmHCw0eyU68UPQ689SKMzf8366zdGZkk+cF72r6bwtF/8PKhtixnR3eF9uiQk9Mbo
	UGKvx0TjjC0Tqus/F/r7syEfVP8z4mkZjw4wiD08Sw==
X-Google-Smtp-Source: AGHT+IHz2zHasnEoZ+leDVBXjWDoiGOwKIR8JXLtJl9v/RqfvNwmxOiWHa99RoHfShXzrXcTE4ZjIw==
X-Received: by 2002:a05:6000:186b:b0:385:ef97:78c with SMTP id ffacd0b85a97d-38a872d2ae8mr4625431f8f.6.1736420119324;
        Thu, 09 Jan 2025 02:55:19 -0800 (PST)
Message-ID: <f7f03617-e438-48c1-b5b0-1ca975cbc7e6@suse.com>
Date: Thu, 9 Jan 2025 11:55:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/11] xen/x86: introduce a new amd pstate driver for
 cpufreq scaling
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: stefano.stabellini@amd.com, Ray.Huang@amd.com, Xenia.Ragiadakou@amd.com,
 Jason.Andryuk@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-6-Penny.Zheng@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20241203081111.463400-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2024 09:11, Penny Zheng wrote:
> --- a/xen/arch/x86/acpi/cpufreq/amd-pstate.c
> +++ b/xen/arch/x86/acpi/cpufreq/amd-pstate.c
> @@ -15,6 +15,53 @@
>  #include <xen/init.h>
>  #include <xen/param.h>
>  #include <acpi/cpufreq/cpufreq.h>
> +#include <asm/msr.h>
> +
> +#define amd_pstate_err(cpu, fmt, args...) \
> +    printk(XENLOG_ERR "AMD_PSTATE: CPU%u error: " fmt, cpu, ## args)
> +#define amd_pstate_verbose(fmt, args...)                         \
> +({                                                               \
> +    if ( cpufreq_verbose )                                       \
> +        printk(XENLOG_DEBUG "AMD_PSTATE: " fmt, ## args);        \
> +})
> +#define amd_pstate_warn(fmt, args...) \
> +    printk(XENLOG_WARNING "AMD_PSTATE: CPU%u warning: " fmt, cpu, ## args)
> +
> +struct amd_pstate_drv_data
> +{
> +    struct xen_processor_cppc *cppc_data;
> +    union
> +    {
> +        uint64_t amd_caps;
> +        struct
> +        {
> +            unsigned int lowest_perf:8;
> +            unsigned int lowest_nonlinear_perf:8;
> +            unsigned int nominal_perf:8;
> +            unsigned int highest_perf:8;
> +            unsigned int :32;
> +        } hw;

Please can this be


    union {
        uint64_t raw;
        struct {
            unsigned int lowest_perf:8;
            unsigned int lowest_nonlinear_perf:8;
            unsigned int nominal_perf:8;
            unsigned int highest_perf:8;
            unsigned int :32;
        };
    } caps;

such that at use sites (e.g. amd_pstate_write_request()) it is possible to
actually spot that the same thing is being accessed through the two parts
of the union?

> +    };
> +    union
> +    {
> +        uint64_t amd_req;
> +        struct
> +        {
> +            unsigned int max_perf:8;
> +            unsigned int min_perf:8;
> +            unsigned int des_perf:8;
> +            unsigned int epp:8;
> +            unsigned int :32;
> +        } req;
> +    };

Along the same lines here then.

> +    int err;
> +
> +    uint32_t max_freq;
> +    uint32_t min_freq;
> +    uint32_t nominal_freq;
> +};
> +
> +static DEFINE_PER_CPU_READ_MOSTLY(struct amd_pstate_drv_data *, amd_pstate_drv_data);
>  
>  uint16_t __read_mostly dmi_max_speed_mhz;
>  
> @@ -52,9 +99,298 @@ int __init amd_pstate_cmdline_parse(const char *s, const char *e)
>      return 0;
>  }
>  
> +/*
> + * If CPPC lowest_freq and nominal_freq registers are exposed then we can
> + * use them to convert perf to freq and vice versa. The conversion is
> + * extrapolated as an affine function passing by the 2 points:
> + *  - (Low perf, Low freq)
> + *  - (Nominal perf, Nominal freq)
> + */
> +static unsigned int amd_pstate_khz_to_perf(struct amd_pstate_drv_data *data, unsigned int freq)

Const?

> +{
> +    struct xen_processor_cppc* cppc_data = data->cppc_data;

Nit: Misplaced *. Const?

> +    uint64_t mul, div, offset = 0;
> +
> +    if ( freq == (cppc_data->nominal_freq * 1000) )
> +        return data->hw.nominal_perf;
> +
> +    if ( freq == (cppc_data->lowest_freq * 1000) )
> +        return data->hw.lowest_perf;
> +
> +    if ( (cppc_data->lowest_freq) && (cppc_data->nominal_freq) )
> +    {
> +        mul = data->hw.nominal_perf - data->hw.lowest_perf;
> +        div = cppc_data->nominal_freq - cppc_data->lowest_freq;
> +        /*
> +         * We don't need to convert to kHz for computing offset and can
> +         * directly use nominal_freq and lowest_freq as the division
> +         * will remove the frequency unit.
> +         */
> +        div = div ?: 1;
> +        offset = data->hw.nominal_perf - (mul * cppc_data->nominal_freq) / div;
> +    }
> +    else
> +    {
> +        /* Read Processor Max Speed(mhz) from DMI table as anchor point */
> +        mul = data->hw.highest_perf;
> +        div = dmi_max_speed_mhz;

What if dmi_max_speed_mhz is still 0?

> +    }
> +
> +    return (unsigned int)(offset + (mul * freq ) / (div * 1000));

Nit: Excess blank before a closing parenthesis.

> +}
> +
> +static unsigned int amd_get_min_freq(struct amd_pstate_drv_data *data)
> +{
> +    struct xen_processor_cppc *cppc_data = data->cppc_data;
> +    uint64_t mul, div;
> +
> +    if ( cppc_data->lowest_freq )
> +        /* Switch to khz */
> +        return cppc_data->lowest_freq * 1000;
> +    else

Please avoid "else" when the earlier if() ends in an unconditional control
flow statement.

> +    {
> +        /* Read Processor Max Speed(mhz) from DMI table as anchor point */
> +        mul = dmi_max_speed_mhz;
> +        div = data->hw.highest_perf;
> +
> +        return (unsigned int)(mul / div) * data->hw.lowest_perf * 1000;

No risk of the cast chopping off set bits?

> +static unsigned int amd_get_nominal_freq(struct amd_pstate_drv_data *data)
> +{
> +    struct xen_processor_cppc *cppc_data = data->cppc_data;
> +    uint64_t mul, div;
> +
> +    if ( cppc_data->nominal_freq )
> +        /* Switch to khz */
> +        return cppc_data->nominal_freq * 1000;
> +    else
> +    {
> +        /* Read Processor Max Speed(mhz) from DMI table as anchor point */
> +        mul = dmi_max_speed_mhz;
> +        div = data->hw.highest_perf;
> +
> +        return (unsigned int)(mul / div) * data->hw.nominal_perf * 1000;
> +    }
> +}
> +
> +static unsigned int amd_get_max_freq(struct amd_pstate_drv_data *data)
> +{
> +    uint64_t max_perf, max_freq, nominal_freq, nominal_perf;
> +    uint64_t boost_ratio;
> +
> +    nominal_freq = amd_get_nominal_freq(data);
> +    nominal_perf = data->hw.nominal_perf;
> +    max_perf = data->hw.highest_perf;
> +
> +    boost_ratio = (uint64_t)(max_perf / nominal_perf);

What's the point of the cast here?

> +    max_freq = nominal_freq * boost_ratio;
> +
> +    return max_freq;
> +}
> +
> +static int cf_check amd_pstate_cpufreq_verify(struct cpufreq_policy *policy)
> +{
> +    struct amd_pstate_drv_data *data = per_cpu(amd_pstate_drv_data, policy->cpu);

Const? (I won't further repeat this. Please make pointers pointer-to-
const wherever possible. We aim at having fully const-correct code.)

> +    cpufreq_verify_within_limits(policy, data->min_freq, data->max_freq);
> +
> +    return 0;
> +}
> +
> +static void amd_pstate_write_request_msrs(void *info)
> +{
> +    struct amd_pstate_drv_data *data =(struct amd_pstate_drv_data *)info;

Nit: Blank after = and no need for a cast.

> +    if ( wrmsr_safe(MSR_AMD_CPPC_REQ, data->amd_req) )
> +    {
> +        amd_pstate_verbose("Failed to wrmsr_safe(MSR_AMD_CPPC_REQ, %lx)\n",
> +                           data->amd_req);

If the was to ever trigger, it would likely get very noisy in the log.

> +        data->err = -EINVAL;
> +        return;
> +    }
> +    data->err = 0;
> +}
> +
> +static int cf_check amd_pstate_write_request(int cpu, uint8_t min_perf,
> +                                             uint8_t des_perf, uint8_t max_perf)
> +{
> +    struct amd_pstate_drv_data *data = per_cpu(amd_pstate_drv_data, cpu);
> +    uint64_t prev = data->amd_req;
> +
> +    data->req.min_perf = min_perf;
> +    data->req.max_perf = max_perf;
> +    data->req.des_perf = des_perf;
> +
> +    if ( prev == data->amd_req )
> +        return 0;
> +
> +    on_selected_cpus(cpumask_of(cpu), amd_pstate_write_request_msrs, data, 1);
> +
> +    return data->err;
> +}
> +
> +static int cf_check amd_pstate_cpufreq_target(struct cpufreq_policy *policy,
> +                                              unsigned int target_freq,
> +                                              unsigned int relation)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct amd_pstate_drv_data *data = per_cpu(amd_pstate_drv_data, cpu);
> +    uint64_t max_perf, min_perf, des_perf;
> +
> +    if ( unlikely(!target_freq) )
> +    {
> +        amd_pstate_warn("Not setting target frequency to zero\n");

Potentially overly noisy again.

> +        return 0;
> +    }
> +    max_perf = data->hw.highest_perf;
> +    min_perf = data->hw.lowest_nonlinear_perf;
> +    des_perf = amd_pstate_khz_to_perf(data, target_freq);
> +
> +    return amd_pstate_write_request(policy->cpu, min_perf, des_perf, max_perf);

The use of intermadiate variables doesn't look very helpful here. Even more
so that in the course of the call 64-bit quantaties will be truncated to
8-bit ones.

> +}
> +
> +static void cf_check amd_pstate_init_msrs(void *info)
> +{
> +    struct cpufreq_policy *policy = info;
> +    struct amd_pstate_drv_data *data = this_cpu(amd_pstate_drv_data);
> +    uint64_t val;
> +    unsigned int min_freq, nominal_freq, max_freq;
> +
> +    /* Package level MSR */
> +    if ( rdmsr_safe(MSR_AMD_CPPC_ENABLE, val) )

Before trying this, wouldn't you better exclude certain very old families?
Even looking at a random Fam17 PPR I can't spot documentation of this MSR
(nor the other two), despite you merely saying Zen elsewhere (without any
version number).

> +    {
> +        amd_pstate_err(policy->cpu, "rdmsr_safe(MSR_AMD_CPPC_ENABLE)\n");
> +        data->err = -EINVAL;
> +        return;
> +    }
> +
> +    if ( !(val & AMD_CPPC_ENABLE) )
> +    {
> +        val |= AMD_CPPC_ENABLE;
> +        if ( wrmsr_safe(MSR_AMD_CPPC_ENABLE, val) )
> +        {
> +            amd_pstate_err(policy->cpu, "wrmsr_safe(MSR_AMD_CPPC_ENABLE, %lx)\n", val);
> +            data->err = -EINVAL;
> +            return;
> +        }
> +    }

Do you really need to enable befor reading ...

> +    if ( rdmsr_safe(MSR_AMD_CPPC_CAP1, data->amd_caps) )

... capabilities and ...

> +    {
> +        amd_pstate_err(policy->cpu, "rdmsr_safe(MSR_AMD_CPPC_CAP1)\n");
> +        goto error;
> +    }
> +
> +    if ( data->hw.highest_perf == 0 || data->hw.lowest_perf == 0 ||
> +         data->hw.nominal_perf == 0 || data->hw.lowest_nonlinear_perf == 0 )
> +    {
> +        amd_pstate_err(policy->cpu, "Platform malfunction, read CPPC highest_perf: %u, lowest_perf: %u, nominal_perf: %u, lowest_nonlinear_perf: %u zero value\n",
> +                       data->hw.highest_perf, data->hw.lowest_perf,
> +                       data->hw.nominal_perf, data->hw.lowest_nonlinear_perf);
> +        goto error;
> +    }
> +
> +    min_freq = amd_get_min_freq(data);
> +    nominal_freq = amd_get_nominal_freq(data);
> +    max_freq = amd_get_max_freq(data);
> +    if ( min_freq > max_freq )
> +    {
> +        amd_pstate_err(policy->cpu, "min_freq(%u) or max_freq(%u) value is incorrect\n",
> +                       min_freq, max_freq);
> +        goto error;
> +    }

... checking them? Error handling would be easier if you enabled only afterwards.

> +    policy->min = min_freq;
> +    policy->max = max_freq;
> +
> +    policy->cpuinfo.min_freq = min_freq;
> +    policy->cpuinfo.max_freq = max_freq;
> +    policy->cpuinfo.perf_freq = nominal_freq;
> +    policy->cur = nominal_freq;
> +
> +    /* Initial processor data capability frequencies */
> +    data->min_freq = min_freq;
> +    data->nominal_freq = nominal_freq;
> +    data->max_freq = max_freq;
> +
> +    data->err = 0;
> +    return;
> +
> + error:
> +    data->err = -EINVAL;
> +    val &= ~AMD_CPPC_ENABLE;
> +    if ( wrmsr_safe(MSR_AMD_CPPC_ENABLE, val) )
> +        amd_pstate_err(policy->cpu, "wrmsr_safe(MSR_AMD_CPPC_ENABLE, %lx)\n", val);
> +}
> +
> +/*
> + * The new AMD P-States driver is different than legacy ACPI hardware P-State,
> + * which has a finer grain frequency range between the highest and lowest
> + * frequency. And boost frequency is actually the frequency which is mapped on
> + * highest performance ratio. The legacy P0 frequency is actually mapped on
> + * nominal performance ratio.
> + */
> +static void amd_pstate_boost_init(struct cpufreq_policy *policy, struct amd_pstate_drv_data *data)
> +{
> +    uint32_t highest_perf, nominal_perf;

Why uint32_t when the fields read are both 8-bit only?

> +    highest_perf = data->hw.highest_perf;
> +    nominal_perf = data->hw.nominal_perf;
> +
> +    if ( highest_perf <= nominal_perf )
> +        return;
> +
> +    policy->turbo = CPUFREQ_TURBO_ENABLED;
> +}

And why the helper variables in the first place?

> +static int cf_check amd_pstate_cpufreq_cpu_init(struct cpufreq_policy *policy)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct amd_pstate_drv_data *data;
> +
> +    data = xzalloc(struct amd_pstate_drv_data);
> +    if ( !data )
> +        return -ENOMEM;
> +
> +    data->cppc_data = &processor_pminfo[cpu]->cppc_data;
> +
> +    policy->governor = cpufreq_opt_governor ? : CPUFREQ_DEFAULT_GOVERNOR;
> +
> +    per_cpu(amd_pstate_drv_data, cpu) = data;
> +
> +    on_selected_cpus(cpumask_of(cpu), amd_pstate_init_msrs, policy, 1);
> +
> +    if ( data->err )
> +    {
> +        amd_pstate_err(cpu, "Could not initialize AMD CPPC MSR properly\n");
> +        per_cpu(amd_pstate_drv_data, cpu) = NULL;
> +        xfree(data);

Please use XFREE() (really XVFREE() after respective conversion) in such cases.

> +        return -ENODEV;

You're no undoing the policy->governor adjustment - maybe best to delay that
until after all errors were handled?

> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -455,6 +455,11 @@
>  #define MSR_AMD_PPIN_CTL                0xc00102f0U
>  #define MSR_AMD_PPIN                    0xc00102f1U
>  
> +#define MSR_AMD_CPPC_CAP1               0xc00102b0
> +#define MSR_AMD_CPPC_ENABLE             0xc00102b1
> +#define MSR_AMD_CPPC_REQ                0xc00102b3
> +#define AMD_CPPC_ENABLE                 BIT(0, ULL)

Bits of individual MSRs want to follow their MSR #define directly, with
suitably different indentation. Please further pay attention to this
comment in the file (as well as the bigger one at the top):

/*
 * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
 */

Jan

