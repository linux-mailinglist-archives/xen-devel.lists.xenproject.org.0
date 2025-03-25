Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EE0A6ED1F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 10:58:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926231.1329088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx12R-0005C0-Pk; Tue, 25 Mar 2025 09:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926231.1329088; Tue, 25 Mar 2025 09:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx12R-00059J-N0; Tue, 25 Mar 2025 09:57:39 +0000
Received: by outflank-mailman (input) for mailman id 926231;
 Tue, 25 Mar 2025 09:57:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tx12P-00059D-IK
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 09:57:37 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 940810a3-095f-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 10:57:36 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso35610525e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 02:57:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e66c7sm13386385f8f.79.2025.03.25.02.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 02:57:34 -0700 (PDT)
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
X-Inumbo-ID: 940810a3-095f-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742896655; x=1743501455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CNYcVLsr4z0I9spjQ9GStxwZKnpqNdAt4L56Mi/ZP4I=;
        b=EPKuKoHvzOTSLZUVHaAytVvm/OdSmX/eCbPA4Zf8WLy6HYgov+KO0TnsvW7Th3IgM0
         vr60lNIr2oqVmUDgx3fhichOqDx1dZcP+nQrx4pQaH2Xa8d1i+PKA70xEtSM91EEjUNj
         l0izMhSlsshjqG/PUTRq9+8tV0izxJdUDaby8jBkuvXm8UJ6riPVo9guSkVa+hiF2XJa
         UtwiB0Akage02eBl9Kh5r+/SmvJikyJXABdGdjgnJm3K2QcFXn4Ff1KBWGL8dbPSkpZA
         D60K671QsEkIaMyxOE3XoPJtPyJSALrcJbmH8XjRae3MpYERqBMn8xSyjDmVIRV9rJPp
         3CzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742896655; x=1743501455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNYcVLsr4z0I9spjQ9GStxwZKnpqNdAt4L56Mi/ZP4I=;
        b=NJIIh89yqUFUWINpbzkQ8ilmyL9QCYqQ6m8YveYPNeeeuTu11HuSVZbQUq1s98ISCY
         kzGoCAzusz9hqhJ8eC6ZQdnr7SQt6lYgcdrGJ+V3EYCSwgrXOfrCIxbZ1FUHnQt+3s0k
         s7wob3Jngq3V9vgNax0sqqAWPtHmnlV2l2z+lv4bgz6ttpnxRC7GJPKjjSTr7GrNGEBn
         I7UI3e+v0UHDmB66ggt/n4O80bM1N6ZGsAf7dk0S8tQbt8zPkxgwgPYWVh4EEzA19lGc
         9taEoSx8qihuB6lhPpnyWmaAKKMGcAFplna5hOeCCY0BfhoYwBjMK2tM3n8BgUyLouw7
         nNuA==
X-Forwarded-Encrypted: i=1; AJvYcCXsZtqGZAeOj5lqrUahdxaMbJhQIge940+L64wjCbH6NVV9HTCkP5PyVapoGrRn0niI5BMbqjJqkeo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwypMWtH29cJamb/PB631yandpdlmxFVi0jfR0EskEkaUjPMuy0
	ecMFkJsKhHTf3SnLMyQbMmCNZlBCr0zCeC+2zS18jmYEmEAsamic5S8gVElrHS4uEbNQYgsLlrI
	=
X-Gm-Gg: ASbGncux+ufVnY6+FDJtpC6tpKuxm9gef4QHFpae+J3/tHlOWwIXZ+6F6rshXNSXyEU
	Q0l7YXSmPA6+Itvst1GW/cq4ZxGLwRJzmSBnLb0ilERWyUzG7KPhqAKugv4r0tBr0NqSWV/DBQm
	AoA24Dtwo7WeL2cwVvSHAmF1+B57KwsiSn/3CT4XtLD29mX2sAsW3jEkVZW2vu+ORkcykWksh4J
	bI7GMir0EVgMXWbR59FDbBKSqdDViWQRn1Cr4U+SDN4sPCS/CkTHl2SA9qADYvltMwyb9IE2xan
	6FBwMR8f+Bbyl6stAVCNb+zH/TqQcraPWTAP/g2mLhbYnyLV10WdTI07H1nIvJKVdRARZjYqhqd
	ewZXpNc46gJuET68N6Bc8ox461utfsw==
X-Google-Smtp-Source: AGHT+IHXLIgUJJ0ohLuXQ7uckbqrs7PBfwYQO7QfhL9RfoxkdxP4QbNENTFugiwKTgvEYbQGyEpTHQ==
X-Received: by 2002:a5d:64e4:0:b0:38f:3b9b:6f91 with SMTP id ffacd0b85a97d-3997f8fa8f5mr14709326f8f.12.1742896655192;
        Tue, 25 Mar 2025 02:57:35 -0700 (PDT)
Message-ID: <4fe44e49-f55d-4d2a-ac02-538038e9128c@suse.com>
Date: Tue, 25 Mar 2025 10:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/15] xen/x86: introduce a new amd cppc driver for
 cpufreq scaling
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-10-Penny.Zheng@amd.com>
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
In-Reply-To: <20250306083949.1503385-10-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.03.2025 09:39, Penny Zheng wrote:
> v2 -> v3:
> - Move all MSR-definations to msr-index.h and follow the required style
> - Refactor opening figure braces for struct/union
> - Sort overlong lines throughout the series
> - Make offset/res int covering underflow scenario
> - Error out when amd_max_freq_mhz isn't set

Given the issue with the patch filling amd_max_freq_mhz I wonder how you
successfully tested this patch here.

> - Introduce amd_get_freq(name) macro to decrease redundancy

Hmm, that's not quite what I was hoping for. I'll comment there in more
detail.

> --- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> @@ -14,7 +14,50 @@
>  #include <xen/domain.h>
>  #include <xen/init.h>
>  #include <xen/param.h>
> +#include <xen/percpu.h>
> +#include <xen/xvmalloc.h>
>  #include <acpi/cpufreq/cpufreq.h>
> +#include <asm/amd.h>
> +#include <asm/msr-index.h>
> +
> +#define amd_cppc_err(cpu, fmt, args...)                     \
> +    printk(XENLOG_ERR "AMD_CPPC: CPU%u error: " fmt, cpu, ## args)
> +#define amd_cppc_warn(fmt, args...)                         \
> +    printk(XENLOG_WARNING "AMD_CPPC: CPU%u warning: " fmt, cpu, ## args)
> +#define amd_cppc_verbose(fmt, args...)                      \
> +({                                                          \
> +    if ( cpufreq_verbose )                                  \
> +        printk(XENLOG_DEBUG "AMD_CPPC: " fmt, ## args);     \
> +})

Why would warning and error come with a CPU number at all times, but not
the verbose construct?

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
> +static DEFINE_PER_CPU_READ_MOSTLY(struct amd_cppc_drv_data *, amd_cppc_drv_data);

Nit: Line length. I wonder what "Sort overlong lines throughout the series"
is meant to say in the revision log.

> @@ -51,10 +94,337 @@ int __init amd_cppc_cmdline_parse(const char *s, const char *e)
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
> +    if ( freq == (cppc_data->nominal_mhz * 1000) )
> +    {
> +        *perf = data->caps.nominal_perf;
> +        return 0;
> +    }
> +
> +    if ( freq == (cppc_data->lowest_mhz * 1000) )
> +    {
> +        *perf = data->caps.lowest_perf;
> +        return 0;
> +    }
> +
> +    if ( cppc_data->lowest_mhz && cppc_data->nominal_mhz )
> +    {
> +        mul = data->caps.nominal_perf - data->caps.lowest_perf;
> +        div = cppc_data->nominal_mhz - cppc_data->lowest_mhz;
> +        /*
> +         * We don't need to convert to KHz for computing offset and can

Nit: kHz (i.e. unlike MHz)

> +         * directly use nominal_mhz and lowest_mhz as the division
> +         * will remove the frequency unit.
> +         */
> +        div = div ?: 1;

Imo the cppc_data->lowest_mhz >= cppc_data->nominal_mhz case better
wouldn't make it here, but use the fallback path below. Or special-
case cppc_data->lowest_mhz == cppc_data->nominal_mhz: mul would
(hopefully) be zero (i.e. there would be the expectation that
data->caps.nominal_perf == data->caps.lowest_perf, yet no guarantee
without checking), and hence ...

> +        offset = data->caps.nominal_perf -
> +                 (mul * cppc_data->nominal_mhz) / div;

... offset = data->caps.nominal_perf regardless of "div" (as long
as that's not zero). I.e. the "equal" case may still be fine to take
this path.

Or is there a check somewhere that lowest_mhz <= nominal_mhz and
lowest_perf <= nominal_perf, which I'm simply overlooking?

> +    }
> +    else
> +    {
> +        /* Read Processor Max Speed(mhz) as anchor point */
> +        mul = data->caps.highest_perf;
> +        div = this_cpu(amd_max_freq_mhz);
> +        if ( !div )
> +            return -EINVAL;
> +    }
> +
> +    res = offset + (mul * freq) / (div * 1000);
> +    if ( res > UINT8_MAX )

I can't quite convince myself that res can't end up negative here, in
which case ...

> +    {
> +        printk_once(XENLOG_WARNING
> +                    "Perf value exceeds maximum value 255: %d\n", res);
> +        *perf = 0xff;
> +        return 0;
> +    }
> +    *perf = (uint8_t)res;

... a bogus value would be stored here.

> +    return 0;
> +}
> +
> +#define amd_get_freq(name)                                                  \

The macro parameter is used just ...

> +    static int amd_get_##name##_freq(const struct amd_cppc_drv_data *data,  \

... here, ...

> +                                     unsigned int *freq)                    \
> +    {                                                                       \
> +        const struct xen_processor_cppc *cppc_data = data->cppc_data;       \
> +        uint64_t mul, div, res;                                             \
> +                                                                            \
> +        if ( cppc_data->name##_mhz )                                        \
> +        {                                                                   \
> +            /* Switch to khz */                                             \
> +            *freq = cppc_data->name##_mhz * 1000;                           \

... twice here forthe MHz value, and ...

> +            return 0;                                                       \
> +        }                                                                   \
> +                                                                            \
> +        /* Read Processor Max Speed(mhz) as anchor point */                 \
> +        mul = this_cpu(amd_max_freq_mhz);                                   \
> +        if ( !mul )                                                         \
> +            return -EINVAL;                                                 \
> +        div = data->caps.highest_perf;                                      \
> +        res = (mul * data->caps.name##_perf * 1000) / div;                  \

... here for the respective perf indicator. Why does it take ...

> +        if ( res > UINT_MAX )                                               \
> +        {                                                                   \
> +            printk(XENLOG_ERR                                               \
> +                   "Frequeny exceeds maximum value UINT_MAX: %lu\n", res);  \
> +            return -EINVAL;                                                 \
> +        }                                                                   \
> +        *freq = (unsigned int)res;                                          \
> +                                                                            \
> +        return 0;                                                           \
> +    }                                                                       \
> +
> +amd_get_freq(lowest);
> +amd_get_freq(nominal);

... two almost identical functions, when one (with two extra input parameters)
would suffice?

In amd_cppc_khz_to_perf() you have a check to avoid division by zero. Why
not the same safeguarding here?

> +static int amd_get_max_freq(const struct amd_cppc_drv_data *data,
> +                            unsigned int *max_freq)
> +{
> +    unsigned int nom_freq, boost_ratio;
> +    int res;
> +
> +    res = amd_get_nominal_freq(data, &nom_freq);
> +    if ( res )
> +        return res;
> +
> +    boost_ratio = (unsigned int)(data->caps.highest_perf /
> +                                 data->caps.nominal_perf);

Similarly here - I can't spot what would prevent division by zero.

> +    *max_freq = nom_freq * boost_ratio;

Nor is it clear to me why (with bogus MSR contents) boost_ratio couldn't
end up being zero, and hence we'd report back ...

> +    return 0;

... success with a frequency of 0.

> +}
> +
> +static int cf_check amd_cppc_cpufreq_verify(struct cpufreq_policy *policy)
> +{
> +    cpufreq_verify_within_limits(policy, policy->cpuinfo.min_freq,
> +                                 policy->cpuinfo.max_freq);
> +
> +    return 0;
> +}
> +
> +static void amd_cppc_write_request_msrs(void *info)
> +{
> +    struct amd_cppc_drv_data *data = info;
> +
> +    if ( wrmsr_safe(MSR_AMD_CPPC_REQ, data->req.raw) )
> +    {
> +        data->err = -EINVAL;
> +        return;
> +    }
> +}
> +
> +static int cf_check amd_cppc_write_request(unsigned int cpu, uint8_t min_perf,
> +                                           uint8_t des_perf, uint8_t max_perf)

The cf_check looks to be misplaced here, and rather wants to go to
amd_cppc_write_request_msrs() because of ...

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
> +    data->err = 0;
> +    on_selected_cpus(cpumask_of(cpu), amd_cppc_write_request_msrs, data, 1);

... this use of a function pointer here.

> +    return data->err;
> +}
> +
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

Checking other *_cpufreq_target() functions, none would silently ignore
a zero input. (HWP's ignores the input altogether though; Cc-ing Jason
for possible clarification: I would have expected this driver here and
the HWP one to be similar in this regard.)

> +    res = amd_cppc_khz_to_perf(data, target_freq, &des_perf);
> +    if ( res )
> +        return res;
> +
> +    return amd_cppc_write_request(policy->cpu, data->caps.lowest_nonlinear_perf,
> +                                  des_perf, data->caps.highest_perf);

As before: the use of the "non-linear" value here wants to come with a
(perhaps brief) comment.

> +}
> +
> +static void cf_check amd_cppc_init_msrs(void *info)
> +{
> +    struct cpufreq_policy *policy = info;
> +    struct amd_cppc_drv_data *data = this_cpu(amd_cppc_drv_data);
> +    uint64_t val;
> +    unsigned int min_freq, nominal_freq, max_freq;
> +
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
> +            amd_cppc_err(policy->cpu,
> +                         "wrmsr_safe(MSR_AMD_CPPC_ENABLE, %lx)\n", val);
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

I don't think the _perf suffixes are overly relevant in the log message.

> +                     data->caps.highest_perf, data->caps.lowest_perf,
> +                     data->caps.nominal_perf, data->caps.lowest_nonlinear_perf);
> +        goto err;
> +    }
> +
> +    data->err = amd_get_lowest_freq(data, &min_freq);
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
> +    if ( min_freq > max_freq || nominal_freq > max_freq ||
> +         nominal_freq < min_freq )
> +    {
> +        amd_cppc_err(policy->cpu,
> +                     "min_freq(%u), or max_freq(%u), or nominal_freq(%u) value is incorrect\n",

Along the lines of the above, while it wants making clear here it's frequencies,
I question the use of identifier names to express that. E.g.
"min (%u), or max (%u), or nominal (%u) freq value is incorrect\n"?

> +                     min_freq, max_freq, nominal_freq);
> +        goto err;
> +    }
> +
> +    policy->min = min_freq;
> +    policy->max = max_freq;
> +
> +    policy->cpuinfo.min_freq = min_freq;
> +    policy->cpuinfo.max_freq = max_freq;
> +    policy->cpuinfo.perf_freq = nominal_freq;
> +    /*
> +     * Set after policy->cpuinfo.perf_freq, as we are taking
> +     * APERF/MPERF average frequency as current frequency.
> +     */
> +    policy->cur = cpufreq_driver_getavg(policy->cpu, GOV_GETAVG);
> +
> +    return;
> +
> + err:
> +    data->err = -EINVAL;

Is we make it here after having set the enable bit, we're hosed (afaict).
We can't fall back to another driver, and we also can't get this driver to
work. I think I did ask before that this be explained in a comment here.
(The only thing the user can do is, aiui, to change the command line option
and reboot.)

Oh, I see you have such a comment at the use site of this function. Please
have a brief comment here then, to refer there.

> +}
> +
> +/*
> + * The new AMD CPPC driver is different than legacy ACPI hardware P-State,

Please omit "new" - that'll be stale rather sooner than later.

> + * which has a finer grain frequency range between the highest and lowest
> + * frequency. And boost frequency is actually the frequency which is mapped on
> + * highest performance ratio. The legacy P0 frequency is actually mapped on
> + * nominal performance ratio.
> + */
> +static void amd_cppc_boost_init(struct cpufreq_policy *policy,
> +                                const struct amd_cppc_drv_data *data)
> +{
> +    if ( data->caps.highest_perf <= data->caps.nominal_perf )
> +        return;
> +
> +    policy->turbo = CPUFREQ_TURBO_ENABLED;
> +}
> +
> +static int cf_check amd_cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
> +{
> +    XVFREE(per_cpu(amd_cppc_drv_data, policy->cpu));
> +
> +    return 0;
> +}
> +
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
> +
> +    on_selected_cpus(cpumask_of(cpu), amd_cppc_init_msrs, policy, 1);
> +
> +    /*
> +     * If error path takes effective, not only amd-cppc cpufreq driver fails
> +     * to initialize, but also we could not fall back to legacy P-states
> +     * driver nevertheless we specifies fall back option in cmdline.
> +     */

Nit: I'm not a native speaker, but I don't think "nevertheless" can be used here.
Maybe "... but we also cannot fall back to the legacy driver, irrespective of
the command line specifying a fallback option"?

Plus I think it would help to also explain why here, i.e. that the enable bit is
sticky.

> +    if ( data->err )
> +    {
> +        amd_cppc_err(cpu, "Could not initialize AMD CPPC MSR properly\n");
> +        amd_cppc_cpufreq_cpu_exit(policy);
> +        return -ENODEV;

Why do you not use data->err here?

> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -238,6 +238,11 @@
>  
>  #define MSR_AMD_CSTATE_CFG                  0xc0010296U
>  
> +#define MSR_AMD_CPPC_CAP1                   0xc00102b0
> +#define MSR_AMD_CPPC_ENABLE                 0xc00102b1
> +#define  AMD_CPPC_ENABLE                    (_AC(1, ULL) <<  0)
> +#define MSR_AMD_CPPC_REQ                    0xc00102b3

As you can see from the pre-existing #define in context, there are U suffixes
missing here.

Jan

