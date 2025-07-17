Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BADC1B08D9D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 14:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046824.1417202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucO97-0001KQ-EK; Thu, 17 Jul 2025 12:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046824.1417202; Thu, 17 Jul 2025 12:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucO97-0001HI-An; Thu, 17 Jul 2025 12:55:33 +0000
Received: by outflank-mailman (input) for mailman id 1046824;
 Thu, 17 Jul 2025 12:55:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucO96-0001HA-Dh
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 12:55:32 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cb6340e-630d-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 14:55:22 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a6e2d85705so491072f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 05:55:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9e06aa6sm16544612b3a.62.2025.07.17.05.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 05:55:20 -0700 (PDT)
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
X-Inumbo-ID: 4cb6340e-630d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752756921; x=1753361721; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lZj1ugm/rH8LlQgYO4waxF9EpBwzrvMjes7U4Y3V9Xs=;
        b=dwAqrW5C8IyrOEKciHglaf2B2ywbP91GbpODCopfiAWW5SOA6zlnF4sGzQij7wnZu5
         GJwUejsq3mkO6pVpcFcNA4JEaq6+WL+ENqLq8Ymz/CU95Vn/sH1PBbLkzRY3F6jj/3jt
         jGqG8JHKzSCR2ZCtJXCsQOF5SOZ5mXVq0sSge8P/vPhUoZCGM/FMufOWxz/SU+OCMXA5
         CHM0y7ql1Ux1//7JkTQjTC1Olu++5L/8gMv3KnuGU+/QruxurVb40UGmxju9HiAGGELH
         0hBSxRdOtJ9RKoE5/AxZ7IKXMh6x5vV3qdVW1kWGVHda/A+QuWfDy7cAS44jLAuXlBN+
         FN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756921; x=1753361721;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZj1ugm/rH8LlQgYO4waxF9EpBwzrvMjes7U4Y3V9Xs=;
        b=j61K0O6yv7sKSp+jrJ4gp9sBCf4bzCDkIM3mRh2XBzE/9VSNorKx1Csgja6arm8fRA
         lyH7HBADyx1V6/NNEgznlePobuCGRmXbYcJkS53d4GMZ6L8xX+a5MSHZnIx1Gn16/UgG
         JJgIXRSWfuGd0WfQSKqv/bZnz82oDcq8u9X4PP0S58kOX6FtCbA0yP2h145nlsCgzS4n
         Uq/w8AmGJoLx2isKnWg97raqlZfmTfLjDJJo9WIETdUvX5hdTQfdiDgY+dwzzGAFdyEV
         ZehI+cgeScInIcKBE09ovGCPPyd9iy1VLxM7Rxzy0TPX815boPEnj9QHfbYiaJERjAi6
         TKFg==
X-Forwarded-Encrypted: i=1; AJvYcCXKcREWWhQruRH8ruxwM2khejVNMaOEcO9mTdFjmHWan2xFsLZVQe+hiMQhNj1wyuzETeGTdTJh1rg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxphocQXdaHuZR9Y0+mt9uFtgSTLGdYoKuSW/L6+UM981tOf904
	fZqtsLqY5/8rJHuCZPBVhpsVm+A3WM/yCZ7yZyGCGUxr68KPwGIaBG38UQg2beNc/Q==
X-Gm-Gg: ASbGncvVa9na8kChu1daJT7QmT0B4ilefoOp+ODXGpUNmTuBKa4MkFn0mgkNac2lG5m
	pk2ylFvrF+09NlkeIbWPy/pMui4WvhjWZO0D63NgF5FCerngzJh9/YlJaaSVd1tlRLxPk9Cwumn
	2dlpnPJAY8Ptxxmi+UCY2fZ8+ql/j/FlkGmDO/gDJBhE2Ymq8IeBnTtDDDFbYx1OTheQJF77XPI
	96WVfHsy+BvTEe5L0JI/IRnX9F//wGDUjrYbmk47J27egbezpiN3s10yGw6cpKYR8A91XJHqTIC
	+DgfzIzHIEhSB975wCDDEY4zphd/DDdlsF6Qj1SPUzIKVQgoV0oFt/G5JdMzHnPryn5+Z0ho2xZ
	Rl7WQhtHGSulmzN3dN63qs2ISPb11TPU9xlDDnhUht/NY80h/lUQr7UiCnI5S/FMcQdML6iFOYJ
	DCiBJFZsU=
X-Google-Smtp-Source: AGHT+IHtrVpreAWVxKVF0hAUsiEDVwIRnShOjGn2MdOVkoYFYhiK/0uMogTHsh/WkCwdOfpDZAbVYA==
X-Received: by 2002:a05:6000:2c06:b0:3a4:ee40:6c85 with SMTP id ffacd0b85a97d-3b60ddc61d8mr5384865f8f.54.1752756921423;
        Thu, 17 Jul 2025 05:55:21 -0700 (PDT)
Message-ID: <1899ebd0-c64a-4bb8-bf3d-0bf90f2b6299@suse.com>
Date: Thu, 17 Jul 2025 14:55:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/19] xen/cpufreq: implement amd-cppc driver for CPPC
 in passive mode
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-13-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711035106.2540522-13-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 05:50, Penny Zheng wrote:
> --- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> @@ -14,7 +14,95 @@
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
> +    printk(XENLOG_ERR "AMD-CPPC: CPU%u error: " fmt, cpu, ## args)
> +#define amd_cppc_warn(cpu, fmt, args...)                            \
> +    printk(XENLOG_WARNING "AMD-CPPC: CPU%u warning: " fmt, cpu, ## args)
> +#define amd_cppc_verbose(cpu, fmt, args...)                         \
> +({                                                                  \
> +    if ( cpufreq_verbose )                                          \
> +        printk(XENLOG_DEBUG "AMD-CPPC: CPU%u " fmt, cpu, ## args);  \
> +})
> +
> +/*
> + * Field highest_perf, nominal_perf, lowest_nonlinear_perf, and lowest_perf
> + * contain the values read from CPPC capability MSR. They represent the limits
> + * of managed performance range as well as the dynamic capability, which may
> + * change during processor operation
> + * Field highest_perf represents highest performance, which is the absolute
> + * maximum performance an individual processor may reach, assuming ideal
> + * conditions. This performance level may not be sustainable for long
> + * durations and may only be achievable if other platform components
> + * are in a specific state; for example, it may require other processors be
> + * in an idle state. This would be equivalent to the highest frequencies
> + * supported by the processor.
> + * Field nominal_perf represents maximum sustained performance level of the
> + * processor, assuming ideal operating conditions. All cores/processors are
> + * expected to be able to sustain their nominal performance state\

Nit: Stray trailing backslash.

> + * simultaneously.
> + * Field lowest_nonlinear_perf represents Lowest Nonlinear Performance, which
> + * is the lowest performance level at which nonlinear power savings are
> + * achieved. Above this threshold, lower performance levels should be
> + * generally more energy efficient than higher performance levels. So in
> + * traditional terms, this represents the P-state range of performance levels.
> + * Field lowest_perf represents the absolute lowest performance level of the
> + * platform. Selecting it may cause an efficiency penalty but should reduce
> + * the instantaneous power consumption of the processor. So in traditional
> + * terms, this represents the T-state range of performance levels.
> + *
> + * Field max_perf, min_perf, des_perf store the values for CPPC request MSR.
> + * Software passes performance goals through these fields.
> + * Field max_perf conveys the maximum performance level at which the platform
> + * may run. And it may be set to any performance value in the range
> + * [lowest_perf, highest_perf], inclusive.
> + * Field min_perf conveys the minimum performance level at which the platform
> + * may run. And it may be set to any performance value in the range
> + * [lowest_perf, highest_perf], inclusive but must be less than or equal to
> + * max_perf.
> + * Field des_perf conveys performance level Xen governor is requesting. And it
> + * may be set to any performance value in the range [min_perf, max_perf],
> + * inclusive.
> + */
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
> +static DEFINE_PER_CPU_READ_MOSTLY(unsigned int, pxfreq_mhz);
>  
>  static bool __init amd_cppc_handle_option(const char *s, const char *end)
>  {
> @@ -50,10 +138,327 @@ int __init amd_cppc_cmdline_parse(const char *s, const char *e)
>      return 0;
>  }
>  
> +/*
> + * If CPPC lowest_freq and nominal_freq registers are exposed then we can
> + * use them to convert perf to freq and vice versa. The conversion is
> + * extrapolated as an linear function passing by the 2 points:
> + *  - (Low perf, Low freq)
> + *  - (Nominal perf, Nominal freq)
> + * Parameter freq is always in kHz.
> + */
> +static int amd_cppc_khz_to_perf(const struct amd_cppc_drv_data *data,
> +                                unsigned int freq, uint8_t *perf)
> +{
> +    const struct xen_processor_cppc *cppc_data = data->cppc_data;
> +    unsigned int mul, div;
> +    int offset = 0, res;
> +
> +    if ( cppc_data->cpc.lowest_mhz && cppc_data->cpc.nominal_mhz &&
> +         data->caps.nominal_perf != data->caps.lowest_perf &&
> +         cppc_data->cpc.nominal_mhz != cppc_data->cpc.lowest_mhz )

While I understand that required relations are being checked elsewhere, if
you used > in place of != here, that would not only serve a doc aspect, but
also allow to drop one part:

    if ( cppc_data->cpc.lowest_mhz &&
         data->caps.nominal_perf > data->caps.lowest_perf &&
         cppc_data->cpc.nominal_mhz > cppc_data->cpc.lowest_mhz )

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
> +        div = this_cpu(pxfreq_mhz);
> +        if ( !div )
> +            return -EOPNOTSUPP;
> +    }
> +
> +    res = offset + (mul * freq) / (div * 1000);
> +    if ( res > UINT8_MAX )

Why UINT8_MAX here but ...

> +    {
> +        printk_once(XENLOG_WARNING
> +                    "Perf value exceeds maximum value 255: %d\n", res);
> +        *perf = 0xff;

... 0xff here?

> +        return 0;
> +    }
> +    if ( res < 0 )
> +    {
> +        printk_once(XENLOG_WARNING
> +                    "Perf value smaller than minimum value 0: %d\n", res);
> +        *perf = 0;
> +        return 0;
> +    }
> +    *perf = res;

Considering that amd_cppc_init_msrs() rejects perf values of 0 as invalid,
is 0 actually valid as an output here?

> +/*
> + * _CPC may define nominal frequecy and lowest frequency, if not, use
> + * Processor Max Speed as anchor point to calculate.
> + * Output freq stores cpc frequency in kHz
> + */
> +static int amd_get_cpc_freq(const struct amd_cppc_drv_data *data,
> +                            uint32_t cpc_mhz, uint8_t perf, unsigned int *freq)

Once again no need for uint32_t when unsigned int will do.

Jan

