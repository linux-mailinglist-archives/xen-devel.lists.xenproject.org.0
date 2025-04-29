Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162EBAA0ECA
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 16:30:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972719.1361032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9lxc-0000LO-FX; Tue, 29 Apr 2025 14:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972719.1361032; Tue, 29 Apr 2025 14:29:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9lxc-0000J9-Be; Tue, 29 Apr 2025 14:29:24 +0000
Received: by outflank-mailman (input) for mailman id 972719;
 Tue, 29 Apr 2025 14:29:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9lxZ-0000J3-WD
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 14:29:22 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5611eaec-2506-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 16:29:19 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5e5dce099f4so7986974a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 07:29:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f703545234sm7442165a12.56.2025.04.29.07.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 07:29:17 -0700 (PDT)
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
X-Inumbo-ID: 5611eaec-2506-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745936959; x=1746541759; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HQPUizxCMVjSZ4abLaeJiBG5OpeAbCnuqKDvdml9ALc=;
        b=F5FPgW8J5ehp8Ty1K6QzDGGEmFA2+Q8x9LjKgBjyJcFzeUhIS4+INxZd2o02nFEuS7
         RwMUG1rKZPDF0smhRJRKrle/Kxo1Up+WP062KOpH8Ctz9XFwUdmh+d/RdJgcFVZOyuy/
         k68xldpdPnKGqQk+2lWxNJjlFfB83g6vzYwwMssXRZwyb1/KEzooHNchIZqomn+yZ1Ut
         PxMcDBk09zYHRdMwqjbteqPXN/brtp+S038+rFtmnAjJ5L2zDwz/NYRTlY6SrgKVnL+4
         uBg/Bs7iXxDfRdUNl3llM3fEN3O9VjfGFTyKTjXelu6OUcGO/jyzOSdwITpaBBK76vs+
         YHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745936959; x=1746541759;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQPUizxCMVjSZ4abLaeJiBG5OpeAbCnuqKDvdml9ALc=;
        b=WtfE+GuJqYVAZqVN8maIy0ArSq54wqN2fJFkKxGxJZsdE9W/rcHlO/MeuncnK4hMzZ
         mZh88L5nuEUetId2VKaiIBA/3iBqes6FlqGjdRnzD76VrxydgFtL8dF/SyIGMuXDeOr9
         eCg+reY3ZJDIcu2jMwsOZNrMMXMlpHyhG6pjBO8F89hiOqAPDjXWZ+u8mkzkRg94XfOb
         XbNSTOigsLQbWs9x2Rc6GAxhNAHcJB5+wm89QNFJcUGwITaWeJZEUvIY0ufRrb1FXQya
         nQBDnUj/KnOn6D88oWeD/PF192Gd8k9xPmGWqHsq+v7CZ9iG27F9A6h00Os2iD1oVz/C
         KrUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2g4IanQBmrnGHgGpXiVB5oGGAV8ZBzaLId7p+cr5If5+6eA882Mysjf7MsVEIwm8IqXguuS4QGMo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuOg3f7y5pGz+QyEagPgAEvM1e9EzHSISJocpXpHtIU375N5Fw
	hQlefJJWHt0z1wUVd2OtpC1tHji2D8siZJyK/KI1FlMv9W7Yxl/+yFKFPJ3O5A==
X-Gm-Gg: ASbGncso0UntGg0MW3WCAAKEojrXmuMNP4XfU7wej0RAK7VORFISvqJzCCnfb0hCFUF
	5B3ZQy1SOD9uQ/oNrnWD8hon9/3r/ZIEg7VlQByQ0U8lco+SGpyypnFbDaBbM2BbC5Xhwm0i5r1
	BhLFzCN1swWEwApCF2nJasxHWwIp2WJyXwF7anOUFvye28MNK+cBwzCfSKw9Otl88MhX6PJvG+z
	OIT6RgE30Heqy9N2TbMXxTBhsQKsGrrcbE1yAfIcnxmPUUdwonrsUpJKNYfZGOWf/o/2XyBQEm0
	0e35be44ruvWTjGeZp+Jyej7yOlVh4kr+4pazgm1FyhHHNTnMo7Bwuc0raQn3aPQ58rmUcXLRxm
	fs15yrOL7+F78GwjjI1hlsr2j9g==
X-Google-Smtp-Source: AGHT+IERJ/VWgHDK6ezbJpk4gnuoV4wzVVibfZZxWKLKvs6KkaHQelnUCgFK+/OQGMoV2Zy3tX3Tww==
X-Received: by 2002:a05:6402:2745:b0:5e7:f707:d7c4 with SMTP id 4fb4d7f45d1cf-5f83889e257mr3215661a12.31.1745936958737;
        Tue, 29 Apr 2025 07:29:18 -0700 (PDT)
Message-ID: <448d6036-09ad-4505-800d-47606e8a3274@suse.com>
Date: Tue, 29 Apr 2025 16:29:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/15] xen/x86: introduce a new amd cppc driver for
 cpufreq scaling
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-10-Penny.Zheng@amd.com>
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
In-Reply-To: <20250414074056.3696888-10-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.04.2025 09:40, Penny Zheng wrote:
> --- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> @@ -14,7 +14,56 @@
>  #include <xen/domain.h>
>  #include <xen/init.h>
>  #include <xen/param.h>
> +#include <xen/percpu.h>
> +#include <xen/xvmalloc.h>
>  #include <acpi/cpufreq/cpufreq.h>
> +#include <asm/amd.h>
> +#include <asm/msr-index.h>
> +
> +#define amd_cppc_err(cpu, fmt, args...)                             \
> +    printk(XENLOG_ERR "AMD_CPPC: CPU%u error: " fmt, cpu, ## args)
> +#define amd_cppc_warn(cpu, fmt, args...)                            \
> +    printk(XENLOG_WARNING "AMD_CPPC: CPU%u warning: " fmt, cpu, ## args)
> +#define amd_cppc_verbose(cpu, fmt, args...)                         \
> +({                                                                  \
> +    if ( cpufreq_verbose )                                          \
> +        printk(XENLOG_DEBUG "AMD_CPPC: CPU%u " fmt, cpu, ## args);  \
> +})
> +
> +struct amd_cppc_drv_data
> +{
> +    const struct xen_processor_cppc *cppc_data;
> +    union {
> +        uint64_t raw;
> +        struct {
> +            unsigned int lowest_perf:8;
> +            unsigned int lowest_nonlinear_perf:8;
> +            unsigned int nominal_perf:8;
> +            unsigned int highest_perf:8;
> +            unsigned int :32;
> +        };
> +    } caps;
> +    union {
> +        uint64_t raw;
> +        struct {
> +            unsigned int max_perf:8;
> +            unsigned int min_perf:8;
> +            unsigned int des_perf:8;
> +            unsigned int epp:8;
> +            unsigned int :32;
> +        };
> +    } req;
> +
> +    int err;
> +};
> +
> +static DEFINE_PER_CPU_READ_MOSTLY(struct amd_cppc_drv_data *,
> +                                  amd_cppc_drv_data);
> +/*
> + * Core max frequency read from PstateDef as anchor point
> + * for freq-to-perf transition
> + */
> +static DEFINE_PER_CPU_READ_MOSTLY(uint64_t, amd_max_pxfreq_mhz);

Throughout here (and maybe also further down) - is the amd_ prefix really
needed everywhere? Even the cppc part of the identifiers seems excessive
in at least some of the cases.

For this last one, also once again see the type related comment on patch 07.

> @@ -51,10 +100,354 @@ int __init amd_cppc_cmdline_parse(const char *s, const char *e)
>      return 0;
>  }
>  
> +/*
> + * If CPPC lowest_freq and nominal_freq registers are exposed then we can
> + * use them to convert perf to freq and vice versa. The conversion is
> + * extrapolated as an linear function passing by the 2 points:
> + *  - (Low perf, Low freq)
> + *  - (Nominal perf, Nominal freq)
> + */
> +static int amd_cppc_khz_to_perf(const struct amd_cppc_drv_data *data,
> +                                unsigned int freq, uint8_t *perf)
> +{
> +    const struct xen_processor_cppc *cppc_data = data->cppc_data;
> +    uint64_t mul, div;
> +    int offset = 0, res;
> +
> +    if ( freq == (cppc_data->cpc.nominal_mhz * 1000) )

I'm pretty sure I commented on this before: The expression here _suggests_
that "freq" is in kHz, but that's not being made explicit anywhere.

> +    {
> +        *perf = data->caps.nominal_perf;
> +        return 0;
> +    }
> +
> +    if ( freq == (cppc_data->cpc.lowest_mhz * 1000) )
> +    {
> +        *perf = data->caps.lowest_perf;
> +        return 0;
> +    }

How likely is it that these two early return paths are taken, when the
incoming "freq" is 25 or 5 MHz granular? IOW - is it relevant to shortcut
these two cases?

> +    if ( cppc_data->cpc.lowest_mhz && cppc_data->cpc.nominal_mhz &&
> +         cppc_data->cpc.lowest_mhz < cppc_data->cpc.nominal_mhz )

Along the lines of a comment on an earlier patch, the middle part of the
condition here is redundant with the 3rd one. Also, don't you check this
relation already during init? IOW isn't it the 3rd part which can be
dropped?

> +    {
> +        mul = data->caps.nominal_perf - data->caps.lowest_perf;
> +        div = cppc_data->cpc.nominal_mhz - cppc_data->cpc.lowest_mhz;
> +
> +        /*
> +         * We don't need to convert to kHz for computing offset and can
> +         * directly use nominal_mhz and lowest_mhz as the division
> +         * will remove the frequency unit.
> +         */
> +        offset = data->caps.nominal_perf -
> +                 (mul * cppc_data->cpc.nominal_mhz) / div;
> +    }
> +    else
> +    {
> +        /* Read Processor Max Speed(MHz) as anchor point */
> +        mul = data->caps.highest_perf;
> +        div = this_cpu(amd_max_pxfreq_mhz);
> +        if ( !div || div == INVAL_FREQ_MHZ )

Seeing this - do we need INVAL_FREQ_MHZ at all? Isn't 0 good enough an indicator
of "data not available"?

> +            return -EINVAL;
> +    }
> +
> +    res = offset + (mul * freq) / (div * 1000);
> +    if ( res > UINT8_MAX )
> +    {
> +        printk_once(XENLOG_WARNING
> +                    "Perf value exceeds maximum value 255: %d\n", res);
> +        *perf = 0xff;
> +        return 0;
> +    } else if ( res < 0 )

Nit: Style. And no real need for "else" here anyway (or alternatively for the
"return 0", with an "else" added below).

> +    {
> +        printk_once(XENLOG_WARNING
> +                    "Perf value smaller than minimum value 0: %d\n", res);
> +        *perf = 0;
> +        return 0;
> +    }
> +    *perf = (uint8_t)res;

We don't normally spell out such conversions (i.e. please drop the cast).

> +    return 0;
> +}
> +
> +static int amd_get_lowest_or_nominal_freq(const struct amd_cppc_drv_data *data,

Nothing in the function looks to limit it to "nominal" or "lowest", so them
being in the identifier feels misleading.

> +                                          uint32_t cpc_mhz, uint8_t perf,
> +                                          unsigned int *freq)
> +{
> +    uint64_t mul, div, res;
> +
> +    if ( !freq )
> +        return -EINVAL;

Is this needed? It's an internal function.

> +    if ( cpc_mhz )
> +    {
> +        /* Switch to khz */
> +        *freq = cpc_mhz * 1000;
> +        return 0;
> +    }
> +
> +    /* Read Processor Max Speed(MHz) as anchor point */
> +    mul = this_cpu(amd_max_pxfreq_mhz);
> +    if ( mul == INVAL_FREQ_MHZ || !mul )
> +    {
> +        printk(XENLOG_ERR
> +               "Failed to read valid processor max frequency as anchor point: %lu\n",
> +               mul);
> +        return -EINVAL;
> +    }
> +    div = data->caps.highest_perf;
> +    res = (mul * perf * 1000) / div;

While there is a comment further up, clarifying function-wide that the result is
to be in kHz would perhaps be better.

> +    if ( res > UINT_MAX || !res )
> +    {
> +        printk(XENLOG_ERR
> +               "Frequeny exceeds maximum value UINT_MAX or being zero value: %lu\n",

Just "out of range"?

> +               res);
> +        return -EINVAL;

And then -ERANGE here?

> +    }
> +    *freq = (unsigned int)res;

See above.

> +static int amd_get_max_freq(const struct amd_cppc_drv_data *data,
> +                            unsigned int *max_freq)
> +{
> +    unsigned int nom_freq = 0, boost_ratio;
> +    int res;
> +
> +    res = amd_get_lowest_or_nominal_freq(data,
> +                                         data->cppc_data->cpc.nominal_mhz,
> +                                         data->caps.nominal_perf,
> +                                         &nom_freq);
> +    if ( res )
> +        return res;
> +
> +    boost_ratio = (unsigned int)(data->caps.highest_perf /
> +                                 data->caps.nominal_perf);

I may have seen logic ensuring nominal_perf isn't 0, so that part may be
fine. What guarantees this division to yield a positive value, though?
If it yields zero (say 0xff / 0x80), ...

> +    *max_freq = nom_freq * boost_ratio;

... zero will be reported back here. I think you want to scale the
calculations here to avoid such.

> +static void cf_check amd_cppc_init_msrs(void *info)
> +{
> +    struct cpufreq_policy *policy = info;
> +    struct amd_cppc_drv_data *data = this_cpu(amd_cppc_drv_data);
> +    uint64_t val;
> +    unsigned int min_freq = 0, nominal_freq = 0, max_freq;
> +
> +    /* Package level MSR */
> +    rdmsrl(MSR_AMD_CPPC_ENABLE, val);
> +    /*
> +     * Only when Enable bit is on, the hardware will calculate the processor’s
> +     * performance capabilities and initialize the performance level fields in
> +     * the CPPC capability registers.
> +     */
> +    if ( !(val & AMD_CPPC_ENABLE) )
> +    {
> +        val |= AMD_CPPC_ENABLE;
> +        wrmsrl(MSR_AMD_CPPC_ENABLE, val);
> +    }
> +
> +    rdmsrl(MSR_AMD_CPPC_CAP1, data->caps.raw);
> +
> +    if ( data->caps.highest_perf == 0 || data->caps.lowest_perf == 0 ||
> +         data->caps.nominal_perf == 0 || data->caps.lowest_nonlinear_perf == 0 ||
> +         data->caps.lowest_perf > data->caps.lowest_nonlinear_perf ||

Same question as asked elsewhere - where is this relation specified?

> +         data->caps.lowest_nonlinear_perf > data->caps.nominal_perf ||
> +         data->caps.nominal_perf > data->caps.highest_perf )
> +    {
> +        amd_cppc_err(policy->cpu,
> +                     "Platform malfunction, read CPPC capability highest(%u), lowest(%u), nominal(%u), lowest_nonlinear(%u) zero value\n",

The message wants shortening if at all possible, and it wants to not be
misleading (saying "zero" when the issue may be something else).

> +                     data->caps.highest_perf, data->caps.lowest_perf,
> +                     data->caps.nominal_perf, data->caps.lowest_nonlinear_perf);
> +        goto err;
> +    }
> +
> +    amd_process_freq(cpu_data + policy->cpu,

&cpu_data[policy->cpu] is generally preferred in such cases.

> +static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct amd_cppc_drv_data *data;
> +    const struct cpuinfo_x86 *c = cpu_data + cpu;
> +
> +    data = xvzalloc(struct amd_cppc_drv_data);
> +    if ( !data )
> +        return -ENOMEM;
> +
> +    data->cppc_data = &processor_pminfo[cpu]->cppc_data;
> +
> +    per_cpu(amd_cppc_drv_data, cpu) = data;
> +
> +    /* Feature CPPC is firstly introduced on Zen2 */
> +    if ( c->x86 < 0x17 )
> +    {
> +        printk_once("Unsupported cpu family: %x\n", c->x86);
> +        return -EOPNOTSUPP;
> +    }

With the cpu_has_cppc check in amd_cppc_register_driver(), is this check
really needed?

Jan

