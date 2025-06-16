Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47124ADB601
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 18:00:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017457.1394446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRCFd-0007mi-DL; Mon, 16 Jun 2025 16:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017457.1394446; Mon, 16 Jun 2025 16:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRCFd-0007if-A7; Mon, 16 Jun 2025 16:00:01 +0000
Received: by outflank-mailman (input) for mailman id 1017457;
 Mon, 16 Jun 2025 15:59:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRCFb-0007iZ-JD
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 15:59:59 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edda78db-4aca-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 17:59:48 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so2775014f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 08:59:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1b59ed4sm8823740a91.39.2025.06.16.08.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 08:59:55 -0700 (PDT)
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
X-Inumbo-ID: edda78db-4aca-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750089596; x=1750694396; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yL2JYLXKQZOHEL1A8htYWxPDv755EESrk+pltR12oX8=;
        b=UX6nVkmyz08HobnuLHFEgzsezdG/UP1JV773dVtSqG3Qk95QhDduvHBnFvpwSF5/BI
         7OJLRWxZBulo9VdUyBwrtrh5zv3dOGG/lxbywJB6zfIzYWYk+x7hHrXzZ557H76O9pGy
         Di2yROwr9DeeDUHrT+Suc13tZMQcZluVIXL7UaCiIsIlgctGQoRl7f9HAJawvwFhV9xd
         3RxZTzhVKzSGamDlX9G5rk82Kb/BYDVcYLgia3s+ruTiP9BYEJeV+9A6fZjDrHhPZiBL
         WuDIJ/1ImUJ2jVWeR7YYDPapXFjFsCc6oIBz1rk1THA3O9EK3KuWCo2xVaPrcy0ibBYC
         JFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750089596; x=1750694396;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yL2JYLXKQZOHEL1A8htYWxPDv755EESrk+pltR12oX8=;
        b=jwzxLlRsxL7dGRJaoWvL+jxkke1azlBuWwOGdHTytW4Gmq89QQMHv1KpQyxl6lI+Zs
         A1T72VNRiAOTt2FD1fL/ujcZCntfutcuNlJyRlT9gThQypRtypLPqIK/ExlxAkUHrnJh
         QpGC9zgv6+MwrFS5YQQm9gkg5Fb3QsE9vdFAR7YXN3mzYOxie1CwdemDBBu8W4p9P8r8
         Ds4WWzt7T1pBEHm/7/03tas1peQkGUJp7tfQoTtIG5wDOHn7QasjSjmoLHXHInVdGfTX
         6WtxYkDgtQccj4XrxjzNHB42uEPo25GxnO4fCt40YyzCOJGIlj8Ev3ij31My/MAp+oyD
         4E7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVffhqLU8JxBpAoQ/qxLMVGUlwN5aDBpYB9mEW5LfkQHkP5Ircvqp5aTUFMVCi9MSZuTufU2KP1EY4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+l/1Ou96Sr80uvfCEzHBi+gi55oFfoGBSIW+DFL5KrUiHhYqS
	C9gW06m53FxYHc+pybEKJD2ggejs71pyZJdKf4bWIn0k5FmioIiXFEK9RvKo390Z6w==
X-Gm-Gg: ASbGnctk56MwBHX6nmoGwrTxr2XsuIkGUQuDuT+t/ItMvp3ZZz0JG1Mssmh1xCDESL3
	XFlUJHy4dl5nGLzbsv3vFdTYdtDEjp9MfJ/jZFNEV4Fr5qM9NfD5tLOJkG0Klsmjw5KVNla91Bn
	Wtm9Bv3GZWFMnZ+qEp9oZqDT+qdiAK2KyfFXMhN3/O0iwLyiX7kQCu0xD2ZBV0OIDVZflzyL0kw
	BZZd7+xRAvytHcxCWWQJqhnu7OfWhTcIama8S0yQkcJSOvL/AZRAUWfqJx8JW68PCpcOVddRI9v
	4i3eJUUgqrXudoomOB7SBdtTg9wcH30R6JXE4QSuxWM4YJhqRk9EylT+Ca2AU3AfentthTxZFBB
	ro4jbyjn6fXswlFhlZuefrLZql8F4u0W/F/jLlzya/65Zuyu0JksCnKWS7Q==
X-Google-Smtp-Source: AGHT+IEP1UvTxZQNe7Dej0O6YFWgrJJV/EwBMPT2+yMDYd7L18+92RCil+8MRjeLz9HWdIRWsIFn0w==
X-Received: by 2002:a05:6000:288a:b0:3a5:3a3b:6a3a with SMTP id ffacd0b85a97d-3a572e5856amr8289514f8f.54.1750089596456;
        Mon, 16 Jun 2025 08:59:56 -0700 (PDT)
Message-ID: <964dcd5e-6a7d-41f2-94b4-c07672ffdc89@suse.com>
Date: Mon, 16 Jun 2025 17:59:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/18] xen/cpufreq: introduce a new amd cppc driver for
 cpufreq scaling
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-11-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-11-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
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

Nit: Much like in the file name, would you mind using AMD-CPPC in favor of
AMD_CPPC here, too?

> @@ -50,10 +99,323 @@ int __init amd_cppc_cmdline_parse(const char *s, const char *e)
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
> +    if ( cppc_data->cpc.lowest_mhz && cppc_data->cpc.nominal_mhz )
> +    {
> +        mul = data->caps.nominal_perf - data->caps.lowest_perf;
> +        div = cppc_data->cpc.nominal_mhz - cppc_data->cpc.lowest_mhz;

What guarantees both of these values to be non-zero?

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
> +            return -EINVAL;

What's wrong about the function arguments in this case? (Same question again
on further uses of EINVAL below.)

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
> +    /*
> +     * Setting with "lowest_nonlinear_perf" to ensure governoring
> +     * performance in P-state range.
> +     */
> +    amd_cppc_write_request(policy->cpu, data->caps.lowest_nonlinear_perf,
> +                           des_perf, data->caps.highest_perf);

I fear I don't understand the comment, and hence it remains unclear to me
why lowest_nonlinear_perf is being used here.

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
> +    /*
> +     * The enable bit is sticky, as we need to enable it at the very first
> +     * begining, before CPPC capability values sanity check.
> +     * If error path takes effective, not only amd-cppc cpufreq core fails

Nit: "takes effect" or "is taken".

> +     * to initialize, but also we could not fall back to legacy P-states
> +     * driver, irrespective of the command line specifying a fallback option.
> +     */
> +    if ( data->err )
> +    {
> +        amd_cppc_err(cpu, "Could not initialize cpufreq cores in CPPC mode\n");

Why "cores" (plural)?

Jan

