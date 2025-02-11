Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1310A311F7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 17:47:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885760.1295566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thtOl-0000xi-6y; Tue, 11 Feb 2025 16:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885760.1295566; Tue, 11 Feb 2025 16:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thtOl-0000vO-3S; Tue, 11 Feb 2025 16:46:11 +0000
Received: by outflank-mailman (input) for mailman id 885760;
 Tue, 11 Feb 2025 16:46:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thtOk-0000vI-3k
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 16:46:10 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aff65cd2-e897-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 17:46:06 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ab7d583d2afso270988266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 08:46:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7e386014dsm140594566b.55.2025.02.11.08.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 08:46:05 -0800 (PST)
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
X-Inumbo-ID: aff65cd2-e897-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739292366; x=1739897166; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nQqMVc2X5j8sNIM9I9794zq4V97/3g+qfsDw2OQQujE=;
        b=fbw32CF3EONOojtj35WVhup6rDr0WgIpe9jRvTPCA3tNMmcdz/stbV95vvXibFQjyN
         qf3+UKMM2glGPmCF/2RsSiOFtT87lzVp0PR6P2+RC/IxQ6qmJ8/sqqBNU+JMrqLXyjSD
         IT7DMQzU14OnXJv4TQ/z0DGUJlwqQaPrymECKK6HJ5u0RYypjyMG7VGocmXWdQZ2RHju
         gavycGKJNTZO87xdPblZ8MGe0On2tYpiHg9hLFpiPL+fOilqxlYSLUHP7yto8CTN2qQJ
         heN59ijmbkw+3KoK3juVnQRfFlhAzSJgnJhtmbgE0NoU70gaAUvsLOFRlJcLvfkM4SK2
         tYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739292366; x=1739897166;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQqMVc2X5j8sNIM9I9794zq4V97/3g+qfsDw2OQQujE=;
        b=G7R2cyRsCkPWTgt615uVCynR+JPYunYBV+ScgS4IGkEOYd/fbCwA7i604FRTIkTtuq
         4j9sSt71aZIPaeKeugQ2vNKWt9XMtE0Xq21v6Lq8e7Zaai8FzM8/Hbi6UfegmtAoGryn
         gBvsc91iunoeNt1joDjZ1Fm/Ermx+Lc14bjJWR/4r+g8ZtGhNGQJpz7Mk7tpvVz3fc5a
         xPdrcXN5IRX8uC6cAQebWFhnU8sM9J2TqJB4gBkWM/eUMohA8h1TXO3ExzzJXlTnYxF1
         z0ZdMeH5vnS4nxEVLBe0RwgITv7eRp2/bNUNUXFVcL1mSJBeDR0p5fouoArogsCePUHe
         OPBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSEQSNxl423rYgo2/EDcg6CCKDKhVYZ/KBnbyH8rjN+vA9SGMH0axVc8yVPu/2SaX4pepnEYE7cdA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7YTvjmaTqtKJ5kC+U1vB/kTcnbVTY1go9RTj4cTZTlD3avygX
	/kZ+FLiu0g/RxdmMvRhUccseBB4RLV66vXSDBVZOpJUAoEApQ+4P6za+FL2PEQ==
X-Gm-Gg: ASbGncuKhCt2Y9BhpMOFs36t8lmVJf7C+1WckWJdVjNuaEdXRO4cVa6WPYavaQ6VLSX
	O8UjcRl5UzGacKteXICs8c7/L5GaMlqAHrvldpBxcAt7LaJ8baDnZ85yZpYHUsH8wWfi0+bzYC4
	bmbByFiO5JTTIsFMPpUuNEET028QQdk9V8dYQD/fJ3jRM72iOwbz2Xvmdm2xlG4g4n6zjItMy0y
	dRHwDJA582sy50nWAVDQCtR+3bWjJSCbY07qkPJ6m5Cuvzmu+OP/LROPMWW5DaiEGDgScXFSvUE
	Tv5w+m3v8TDpmK7A5OeeZSIrbUH9RMenoj10QIHrSYbvl2xeP4Dh4TTRX/C+9km0I397gLVo1yS
	M
X-Google-Smtp-Source: AGHT+IGSpGUJRd2BLsfRwoRlBYlRoRUhAYnon+qN9TV2SSyF4WDaYcdA20d48ml1ciY/w8FMZpUg+w==
X-Received: by 2002:a17:907:8906:b0:ab3:61e2:8aaf with SMTP id a640c23a62f3a-ab7db5a5b80mr417419166b.25.1739292365580;
        Tue, 11 Feb 2025 08:46:05 -0800 (PST)
Message-ID: <0fe9e3b1-3d2c-4ddf-87c4-b0de2a586182@suse.com>
Date: Tue, 11 Feb 2025 17:46:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] xen/x86: introduce a new amd cppc driver for
 cpufreq scaling
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Ray.Huang@amd.com, Jason.Andryuk@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-6-Penny.Zheng@amd.com>
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
In-Reply-To: <20250206083255.1296363-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.02.2025 09:32, Penny Zheng wrote:
> --- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> @@ -13,7 +13,61 @@
>  
>  #include <xen/init.h>
>  #include <xen/param.h>
> +#include <xen/percpu.h>
> +#include <xen/xvmalloc.h>
>  #include <acpi/cpufreq/cpufreq.h>
> +#include <asm/amd.h>
> +
> +#define MSR_AMD_CPPC_CAP1               0xc00102b0
> +#define MSR_AMD_CPPC_ENABLE             0xc00102b1
> +#define AMD_CPPC_ENABLE                 BIT(0, ULL)
> +#define MSR_AMD_CPPC_REQ                0xc00102b3

Why not in msr-index.h?

> +#define amd_cppc_err(cpu, fmt, args...)                     \
> +    printk(XENLOG_ERR "AMD_CPPC: CPU%u error: " fmt, cpu, ## args)
> +#define amd_cppc_verbose(fmt, args...)                      \
> +({                                                          \
> +    if ( cpufreq_verbose )                                  \
> +        printk(XENLOG_DEBUG "AMD_CPPC: " fmt, ## args);     \
> +})
> +#define amd_cppc_warn(fmt, args...)                         \
> +    printk(XENLOG_WARNING "AMD_CPPC: CPU%u warning: " fmt, cpu, ## args)

Perhaps move warn up between err and verbose?

> +struct amd_cppc_drv_data
> +{
> +    struct xen_processor_cppc *cppc_data;

Pointer-to-const?

> +    union
> +    {
> +        uint64_t raw;
> +        struct
> +        {

While generally we want opening figure braces on their own lines, for
struct/union this isn't the case. See e.g. include/xen/lib/x86/cpu-policy.h.

> +            unsigned int lowest_perf:8;
> +            unsigned int lowest_nonlinear_perf:8;
> +            unsigned int nominal_perf:8;
> +            unsigned int highest_perf:8;
> +            unsigned int :32;
> +        };
> +    } caps;
> +    union
> +    {
> +        uint64_t raw;
> +        struct
> +        {
> +            unsigned int max_perf:8;
> +            unsigned int min_perf:8;
> +            unsigned int des_perf:8;
> +            unsigned int epp:8;
> +            unsigned int :32;
> +        };
> +    } req;
> +    int err;

There wants to be a blank line between the union and this one.

> +    uint32_t max_freq;
> +    uint32_t min_freq;
> +    uint32_t nominal_freq;

Are fixed-width types really needed here (see ./CODING_STYLE)?

> @@ -50,9 +104,343 @@ int __init amd_cppc_cmdline_parse(const char *s, const char *e)
>      return 0;
>  }
>  
> +/*
> + * If CPPC lowest_freq and nominal_freq registers are exposed then we can
> + * use them to convert perf to freq and vice versa. The conversion is
> + * extrapolated as an affine function passing by the 2 points:

Having studied maths, "affine function" isn't a term I know. There are affine
transformations, but don't you simply mean "linear function" here? If so, is
it said anywhere in the spec that perf values grow linearly with freq ones?

> + *  - (Low perf, Low freq)
> + *  - (Nominal perf, Nominal freq)
> + */
> +static int amd_cppc_khz_to_perf(const struct amd_cppc_drv_data *data, unsigned int freq, uint8_t *perf)

Overlong line again. Please sort throughout the series.

> +{
> +    const struct xen_processor_cppc *cppc_data = data->cppc_data;
> +    uint64_t mul, div, offset = 0, res;
> +
> +    if ( freq == (cppc_data->nominal_freq * 1000) )

There's no comment anywhere what the units of the values are. Therefore the
multiplication by 1000 here leaves me wondering why consistent units aren't
used in the first place. (From the name of the function I might guess that
"freq" is in kHz, and then perhaps ->{min,max,nominal}_freq are in MHz.
Then for the foreseeable future we're hopefully safe here wrt overflow.)

> +    {
> +        *perf = data->caps.nominal_perf;
> +        return 0;
> +    }
> +
> +    if ( freq == (cppc_data->lowest_freq * 1000) )
> +    {
> +        *perf = data->caps.lowest_perf;
> +        return 0;
> +    }
> +
> +    if ( (cppc_data->lowest_freq) && (cppc_data->nominal_freq) )

Why the inner parentheses?

> +    {
> +        mul = data->caps.nominal_perf - data->caps.lowest_perf;
> +        div = cppc_data->nominal_freq - cppc_data->lowest_freq;
> +        /*
> +         * We don't need to convert to kHz for computing offset and can
> +         * directly use nominal_freq and lowest_freq as the division
> +         * will remove the frequency unit.
> +         */
> +        div = div ?: 1;
> +        offset = data->caps.nominal_perf - (mul * cppc_data->nominal_freq) / div;

I fear I can't convince myself that the subtraction can't ever underflow.
With

O = offset
Pn = data->caps.nominal_perf
Pl = data->caps.lowest_perf
Fn = cppc_data->nominal_freq
Fl = cppc_data->lowest_freq

the above becomes

O = Pn - ((Pn - Pl) * Fn) / (Fn - Fl)

and your assumption is O >= 0 (and for inputs: Fn >= Fl and Pn >= Pl). That
for me transforms to

(Pn - Pl) * Fn <= Pn * (Fn - Fl)

and further

-(Pl * Fn) <= -(Pn * Fl)

or

Pn * Fl <= Pl * Fn

and I don't see why this would always hold. Yet if there can be underflow,
I wonder whether the calculation is actually correct. Or, ...

> +    }
> +    else
> +    {
> +        /* Read Processor Max Speed(mhz) as anchor point */
> +        mul = data->caps.highest_perf;
> +        div = this_cpu(max_freq_mhz);
> +        if ( !div )
> +            return -EINVAL;
> +    }
> +
> +    res = offset + (mul * freq) / (div * 1000);

... considering that a negative offset here isn't really an issue, as long
as the rhs of the addition is large enough, is offset perhaps meant to be
a signed quantity (and considering it's in principle an [abstract] perf
value, it doesn't even need to be a 64-bit one, i.e. perhaps one of the
cases where plain int is appropriate to use)?

> +    if ( res > UINT8_MAX )
> +    {
> +        printk(XENLOG_ERR "Perf value exceeds maximum value 255: %lu\n", res);

If this was to ever trigger, it would then likely trigger often. Imo such
log messages want to be printk_once(), if they're needed at all.

> +        return -EINVAL;

Can't we instead clip to 0xff?

> +static int amd_get_min_freq(const struct amd_cppc_drv_data *data, unsigned int *min_freq)
> +{
> +    const struct xen_processor_cppc *cppc_data = data->cppc_data;
> +    uint64_t mul, div, res;
> +
> +    if ( cppc_data->lowest_freq )
> +    {
> +        /* Switch to khz */
> +        *min_freq = cppc_data->lowest_freq * 1000;
> +        return 0;
> +    }
> +
> +    /* Read Processor Max Speed(mhz) as anchor point */
> +    mul = this_cpu(max_freq_mhz);
> +    div = data->caps.highest_perf;
> +    res = (mul * data->caps.lowest_perf * 1000) / div;
> +    if ( res > UINT_MAX )
> +    {
> +        printk(XENLOG_ERR "Min freq exceeds maximum value UINT_MAX: %lu\n", res);
> +        return -EINVAL;
> +    }
> +
> +    *min_freq = (unsigned int)res;

I.e. 0 when max_freq_mhz isn't set. Does returning back 0 make sense?

> +    return 0;

Nit: Blank line please before the main return statement of a function.

> +}
> +
> +static int amd_get_nominal_freq(const struct amd_cppc_drv_data *data, unsigned int *nom_freq)
> +{
> +    const struct xen_processor_cppc *cppc_data = data->cppc_data;
> +    uint64_t mul, div, res;
> +
> +    if ( cppc_data->nominal_freq )
> +    {
> +        /* Switch to khz */
> +        *nom_freq = cppc_data->nominal_freq * 1000;
> +        return 0;
> +    }
> +
> +    /* Read Processor Max Speed(mhz) as anchor point */
> +    mul = this_cpu(max_freq_mhz);
> +    div = data->caps.highest_perf;
> +    res = (mul * data->caps.nominal_perf * 1000) / div;
> +    if ( res > UINT_MAX )
> +    {
> +        printk(XENLOG_ERR "Nominal freq exceeds maximum value UINT_MAX: %lu\n", res);
> +        return -EINVAL;
> +    }
> +
> +    *nom_freq = (unsigned int)res;
> +    return 0;
> +}

This is an almost identical copy of the earlier function. I wonder if the
redundancy wouldn't better be reduced.

> +static void amd_cppc_write_request_msrs(void *info)
> +{
> +    struct amd_cppc_drv_data *data = info;
> +
> +    if ( wrmsr_safe(MSR_AMD_CPPC_REQ, data->req.raw) )
> +    {
> +        data->err = -EINVAL;
> +        return;
> +    }
> +    data->err = 0;

Cache bouncing wise I think it would be better if the clearing was done ...

> +}
> +
> +static int cf_check amd_cppc_write_request(int cpu, uint8_t min_perf,
> +                                           uint8_t des_perf, uint8_t max_perf)
> +{
> +    struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
> +    uint64_t prev = data->req.raw;
> +
> +    data->req.min_perf = min_perf;
> +    data->req.max_perf = max_perf;
> +    data->req.des_perf = des_perf;
> +
> +    if ( prev == data->req.raw )
> +        return 0;
> +
> +    on_selected_cpus(cpumask_of(cpu), amd_cppc_write_request_msrs, data, 1);
> +
> +    return data->err;
> +}

... in this function. Then the field would be written to (and the cacheline
change ownership) only in the error case.

As to the function's parameters - why's there a plain int?

> +static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
> +                                            unsigned int target_freq,
> +                                            unsigned int relation)
> +{
> +    unsigned int cpu = policy->cpu;
> +    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
> +    uint8_t des_perf;
> +    int res;
> +
> +    if ( unlikely(!target_freq) )
> +        return 0;
> +
> +    res = amd_cppc_khz_to_perf(data, target_freq, &des_perf);
> +    if ( res )
> +        return res;
> +
> +    return amd_cppc_write_request(policy->cpu, data->caps.lowest_nonlinear_perf,
> +                                  des_perf, data->caps.highest_perf);

Up to here caps.lowest_perf was used. Why caps.lowest_nonlinear_perf here?

Also why do you not use the local variable "cpu" that you have made yourself?

> +static void cf_check amd_cppc_init_msrs(void *info)
> +{
> +    struct cpufreq_policy *policy = info;
> +    struct amd_cppc_drv_data *data = this_cpu(amd_cppc_drv_data);
> +    uint64_t val;
> +    unsigned int min_freq, nominal_freq, max_freq;
> +    const struct cpuinfo_x86 *c = cpu_data + policy->cpu;
> +
> +    /* Feature CPPC is firstly introduiced on Zen2 */

Nit: introduced

> +    if ( c->x86 < 0x17 )
> +    {
> +        amd_cppc_err(policy->cpu, "Unsupported cpu family: %x\n", c->x86);
> +        data->err = -EOPNOTSUPP;
> +        return;
> +    }

This could be checked ahead of issuing the IPI to invoke this function.
It probably would also be nice if this log message appeared only once;
maybe it does, and I merely don't see why.

> +    /* Package level MSR */
> +    if ( rdmsr_safe(MSR_AMD_CPPC_ENABLE, val) )
> +    {
> +        amd_cppc_err(policy->cpu, "rdmsr_safe(MSR_AMD_CPPC_ENABLE)\n");
> +        goto err;
> +    }
> +
> +    /*
> +     * Only when Enable bit is on, the hardware will calculate the processor’s
> +     * performance capabilities and initialize the performance level fields in
> +     * the CPPC capability registers.
> +     */
> +    if ( !(val & AMD_CPPC_ENABLE) )
> +    {
> +        val |= AMD_CPPC_ENABLE;
> +        if ( wrmsr_safe(MSR_AMD_CPPC_ENABLE, val) )
> +        {
> +            amd_cppc_err(policy->cpu, "wrmsr_safe(MSR_AMD_CPPC_ENABLE, %lx)\n", val);
> +            goto err;
> +        }
> +    }
> +
> +    if ( rdmsr_safe(MSR_AMD_CPPC_CAP1, data->caps.raw) )
> +    {
> +        amd_cppc_err(policy->cpu, "rdmsr_safe(MSR_AMD_CPPC_CAP1)\n");
> +        goto err;
> +    }
> +
> +    if ( data->caps.highest_perf == 0 || data->caps.lowest_perf == 0 ||
> +         data->caps.nominal_perf == 0 || data->caps.lowest_nonlinear_perf == 0 )
> +    {
> +        amd_cppc_err(policy->cpu,
> +                     "Platform malfunction, read CPPC highest_perf: %u, lowest_perf: %u, nominal_perf: %u, lowest_nonlinear_perf: %u zero value\n",
> +                     data->caps.highest_perf, data->caps.lowest_perf,
> +                     data->caps.nominal_perf, data->caps.lowest_nonlinear_perf);
> +        goto err;
> +    }
> +
> +    data->err = amd_get_min_freq(data, &min_freq);
> +    if ( data->err )
> +        return;
> +
> +    data->err = amd_get_nominal_freq(data, &nominal_freq);
> +    if ( data->err )
> +        return;
> +
> +    data->err = amd_get_max_freq(data, &max_freq);
> +    if ( data->err )
> +        return;
> +
> +    if ( min_freq > max_freq )
> +    {
> +        amd_cppc_err(policy->cpu, "min_freq(%u) or max_freq(%u) value is incorrect\n",
> +                     min_freq, max_freq);
> +        goto err;
> +    }

And nominal freq not being between the two is okay?

> +    policy->min = min_freq;
> +    policy->max = max_freq;
> +
> +    policy->cpuinfo.min_freq = min_freq;
> +    policy->cpuinfo.max_freq = max_freq;
> +    policy->cpuinfo.perf_freq = nominal_freq;
> +    policy->cur = nominal_freq;

How do you know this is correct? Or does it simply not matter at this point?

> +    /* Initial processor data capability frequencies */
> +    data->min_freq = min_freq;
> +    data->nominal_freq = nominal_freq;
> +    data->max_freq = max_freq;

Is this data duplication actually needed? Can't data, if necessary, simply
have a back pointer to the policy for the CPU?

Actually, aren't two of the three values already accessible through the
cppc_data pointer hanging off of data? Which in turn makes me wonder why
you go through the effort of calculating those values.

> + err:
> +    data->err = -EINVAL;
> +}

At this point you may have set the enable bit already, which you can't undo.
What effect will this have on the system when the error path is taken here?
Especially if we then try to fall back to another driver?

> +static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct amd_cppc_drv_data *data;
> +
> +    data = xvzalloc(struct amd_cppc_drv_data);
> +    if ( !data )
> +        return -ENOMEM;
> +
> +    data->cppc_data = &processor_pminfo[cpu]->cppc_data;
> +
> +    per_cpu(amd_cppc_drv_data, cpu) = data;
> +
> +    on_selected_cpus(cpumask_of(cpu), amd_cppc_init_msrs, policy, 1);
> +
> +    if ( data->err )
> +    {
> +        amd_cppc_err(cpu, "Could not initialize AMD CPPC MSR properly\n");
> +        per_cpu(amd_cppc_drv_data, cpu) = NULL;
> +        XVFREE(data);

May be slightly tidier to invoke amd_cppc_cpufreq_cpu_exit() here.

> +        return -ENODEV;
> +    }
> +
> +    policy->governor = cpufreq_opt_governor ? : CPUFREQ_DEFAULT_GOVERNOR;
> +
> +    amd_cppc_boost_init(policy, data);
> +
> +    amd_cppc_verbose("CPU %u initialized with amd-cppc passive mode\n", policy->cpu);
> +    return 0;
> +}
> +
> +static int cf_check amd_cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
> +{
> +    struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, policy->cpu);
> +
> +    per_cpu(amd_cppc_drv_data, policy->cpu) = NULL;
> +    XVFREE(data);

This makes little sense, as "data" is about to go out of scope. Why not
simply

    XVFREE(per_cpu(amd_cppc_drv_data, policy->cpu));

(which effectively you're open-coding)?

Jan

