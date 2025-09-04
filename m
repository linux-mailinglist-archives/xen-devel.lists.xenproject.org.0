Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BECEFB43BA9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 14:34:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110010.1459353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu99w-0000dz-UU; Thu, 04 Sep 2025 12:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110010.1459353; Thu, 04 Sep 2025 12:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu99w-0000ba-RA; Thu, 04 Sep 2025 12:33:48 +0000
Received: by outflank-mailman (input) for mailman id 1110010;
 Thu, 04 Sep 2025 12:33:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uu99v-0000bU-8o
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 12:33:47 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65a1641e-898b-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 14:33:44 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so155752966b.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 05:33:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0413782b94sm1168239666b.35.2025.09.04.05.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 05:33:43 -0700 (PDT)
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
X-Inumbo-ID: 65a1641e-898b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756989224; x=1757594024; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GM/vGb8JyJ1bD/Cu90rKOQ2O/mHKMpaEJllntanhv64=;
        b=He32dxMboNM23cW6PpxScZIeswNeTZJoznDgcvH4+l4TztCFY/lLdNKZYZDQnwW4JA
         30+E43RkkGoEbBSc2N7d5cE0IRy5iCR+UGcISUlSxdwyL6JLwpuegHQexPUMbjrRWyA5
         RRVTYsR8j9JzgxSHG/4aIqXwi+ykwoQa7Mz0FvSFW+8gzZJJTer7ekCTOrmBKH5AXeeG
         18hfDfSgY/rvHW2Wpp7wFEzRmI/dzXad0GfeO0U9WYLFZasl+W5XwefInLyT0bf38/Hj
         ak2F+pNR5Euo6acK7A1ECo0pY2CcFpGnJ126zP/jjPoMXuQMlkLyMzzme5ybETp2D96/
         zA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756989224; x=1757594024;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GM/vGb8JyJ1bD/Cu90rKOQ2O/mHKMpaEJllntanhv64=;
        b=Id1a3mETBYM5U8MRSw2unfAERpuJCVQ05ImntGnggeWafoRF7esmcn4MnK1byyFxjL
         PGpTNr9RTef5ceeyJ/mL6+cGmn6x9FRy0nR6e16xHCXHTCanOV0dUmGow6opWx8b7hD2
         caucxw8Omxi8LPJV1Q/h6689O4CZsghjvmOsryInoAtk+6rjDBjpDPuoRa+euDD2lsSD
         3V8GtHeqMosBQ5ir3j0xVBQ4yMJBHamSJdJT79T1fEQNN5N+e0U46aUwo+VUUXeR9BFk
         /foeCE9Fu8WsCuA2U8/p5stkk4PQ2Bq0/3VumuhyFPQI+YlWzp2UW4uoES8sWPxiyYS2
         G4DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzdh2Q0wBvwF+WUyJjvYk6jxqCLaILXQS5YwNVzYTii0nMhxWsnd7Lur0x+u/uEjP5ElGnZo9QHEo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxes5qqMAFWQQvopdQY5Nq+5RU0V774I5PFKZfx4uMdtoWwD2dE
	kDKEG8sQ7pTnTtRUgi+CNlED3VX9MZAThUANvjAIvx21G6PytdOQ5TwHSEW0RowSDg==
X-Gm-Gg: ASbGncvval1BqN0wuGuQ9CjBZpEvqcwZ17owMGSP4+FtjSqo5anV8yBTbPhFu/PGcCd
	13ia2qUQ1uG6eEJRWtP6l7SiSPH6I5qymV8bQtLL97ppgJGjJNfMFhhlPI+nq7/5puRgOnR0WBW
	ZbORi74zr4gS5YImv9HYya5FBhXPTBq7xpvk8kerDjTirv0vcyQkaNkoZx+mFw+6o2LKB/Yp7KZ
	5MQWkzQx128LlwYylcHgj18+X/cvSFy77E0QFr1kAYZ/CXBXzyamvAtZ8RLLkPf3bfWNR27amHx
	G0aa1qZuVIbIb8immuWdzfQIRG5tMNd/hVpAAnl4zzoMrLNViD76D6dXK1lZM6BpyHk6IwvLjoi
	sDrm3Ji7/of1bgldo6IzmPiiD7TjGjq7Hb9D+5R3qVfOPKhZcGE/bi4DZUMdn0rAQB2F6MgcTVr
	CAeipOLMaBStfw43LX+g==
X-Google-Smtp-Source: AGHT+IEgEuNqRxytqwviOQDruDtjWll61k2i2gBmawctUxjN894sV8RwULT/g7znCWHkmh6An5M6jg==
X-Received: by 2002:a17:907:3d16:b0:afe:8bee:fdb9 with SMTP id a640c23a62f3a-b01d8c99b67mr1847941766b.28.1756989224164;
        Thu, 04 Sep 2025 05:33:44 -0700 (PDT)
Message-ID: <5a5d949c-70b3-4255-a12d-7dbf988d15b4@suse.com>
Date: Thu, 4 Sep 2025 14:33:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
 <20250904063518.2097629-8-Penny.Zheng@amd.com>
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
In-Reply-To: <20250904063518.2097629-8-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.09.2025 08:35, Penny Zheng wrote:
> Introduce helper set_amd_cppc_para() and get_amd_cppc_para() to
> SET/GET CPPC-related para for amd-cppc/amd-cppc-epp driver.
> 
> In get_cpufreq_cppc()/set_cpufreq_cppc(), we include
> "processor_pminfo[cpuid]->init & XEN_CPPC_INIT" condition check to deal with
> cpufreq driver in amd-cppc.
> We borrow governor field to indicate policy info for CPPC active mode,
> so we need to move the copying of the governor name out of the
> !cpufreq_is_governorless() guard.

Well, as said in my v8 comment - it's not so much the "what" that needs covering,
but the "why is it correct / safe to do so". See my respective reply to patch 5,
and also to Jason's response on the v8 thread. Perhaps with the union there
removed this doesn't need calling out explicitly anymore.

> ---
> v8 -> v9
> - add description of "moving the copying of the governor name"
> - Adapt to changes of "Embed struct amd_cppc_drv_data{} into struct
> cpufreq_policy{}"

Except that again problems extend to here as well.

> --- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> @@ -561,6 +561,169 @@ static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
>      return 0;
>  }
>  
> +#ifdef CONFIG_PM_OP
> +int amd_cppc_get_para(const struct cpufreq_policy *policy,
> +                      struct xen_get_cppc_para *cppc_para)
> +{
> +    const struct amd_cppc_drv_data *data = policy->u.amd_cppc;
> +
> +    if ( data == NULL )
> +        return -ENODATA;
> +
> +    cppc_para->lowest           = data->caps.lowest_perf;
> +    cppc_para->lowest_nonlinear = data->caps.lowest_nonlinear_perf;
> +    cppc_para->nominal          = data->caps.nominal_perf;
> +    cppc_para->highest          = data->caps.highest_perf;
> +    cppc_para->minimum          = data->req.min_perf;
> +    cppc_para->maximum          = data->req.max_perf;
> +    cppc_para->desired          = data->req.des_perf;
> +    cppc_para->energy_perf      = data->req.epp;
> +
> +    return 0;
> +}
> +
> +int amd_cppc_set_para(struct cpufreq_policy *policy,
> +                      const struct xen_set_cppc_para *set_cppc)
> +{
> +    struct amd_cppc_drv_data *data = policy->u.amd_cppc;
> +    uint8_t max_perf, min_perf, des_perf, epp;
> +    bool active_mode = cpufreq_is_governorless(policy->cpu);
> +
> +    if ( data == NULL )
> +        return -ENOENT;
> +
> +    /* Only allow values if params bit is set. */
> +    if ( (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED) &&
> +          set_cppc->desired) ||
> +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM) &&
> +          set_cppc->minimum) ||
> +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
> +          set_cppc->maximum) ||
> +         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ENERGY_PERF) &&
> +          set_cppc->energy_perf) )
> +        return -EINVAL;
> +
> +    /* Return if there is nothing to do. */
> +    if ( set_cppc->set_params == 0 )
> +        return 0;
> +
> +    /*
> +     * Validate all parameters
> +     * Maximum performance may be set to any performance value in the range
> +     * [Nonlinear Lowest Performance, Highest Performance], inclusive but must
> +     * be set to a value that is larger than or equal to minimum Performance.
> +     */
> +    if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
> +         (set_cppc->maximum > data->caps.highest_perf ||
> +          (set_cppc->maximum <
> +           (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM
> +            ? set_cppc->minimum
> +            : data->req.min_perf))) )
> +        return -EINVAL;
> +    /*
> +     * Minimum performance may be set to any performance value in the range
> +     * [Nonlinear Lowest Performance, Highest Performance], inclusive but must
> +     * be set to a value that is less than or equal to Maximum Performance.
> +     */
> +    if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM) &&
> +         (set_cppc->minimum < data->caps.lowest_nonlinear_perf ||
> +          (set_cppc->minimum >
> +           (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM
> +            ? set_cppc->maximum
> +            : data->req.max_perf))) )
> +        return -EINVAL;
> +    /*
> +     * Desired performance may be set to any performance value in the range
> +     * [Minimum Performance, Maximum Performance], inclusive.
> +     */
> +    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
> +    {
> +        if ( active_mode )
> +            return -EOPNOTSUPP;
> +
> +        if ( (set_cppc->desired >
> +              (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM
> +               ? set_cppc->maximum
> +               : data->req.max_perf)) ||
> +             (set_cppc->desired <
> +              (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM
> +               ? set_cppc->minimum
> +               : data->req.min_perf)) )
> +            return -EINVAL;
> +    }
> +    /*
> +     * Energy Performance Preference may be set with a range of values
> +     * from 0 to 0xFF
> +     */
> +    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ENERGY_PERF )
> +    {
> +        if ( !active_mode )
> +            return -EOPNOTSUPP;
> +
> +        if ( set_cppc->energy_perf > UINT8_MAX )
> +            return -EINVAL;
> +    }
> +
> +    /* Activity window not supported in MSR */
> +    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW )
> +        return -EOPNOTSUPP;
> +
> +    des_perf = data->req.des_perf;
> +    /*
> +     * Apply presets:
> +     * XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE/PERFORMANCE/ONDEMAND are
> +     * only available when CPPC in active mode
> +     */
> +    switch ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_PRESET_MASK )
> +    {
> +    case XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE:
> +        if ( !active_mode )
> +            return -EINVAL;
> +        policy->policy = CPUFREQ_POLICY_POWERSAVE;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE:
> +        if ( !active_mode )
> +            return -EINVAL;
> +        policy->policy = CPUFREQ_POLICY_PERFORMANCE;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_ONDEMAND:
> +        if ( !active_mode )
> +            return -EINVAL;
> +        policy->policy = CPUFREQ_POLICY_ONDEMAND;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_NONE:
> +        if ( active_mode )
> +            policy->policy = CPUFREQ_POLICY_UNKNOWN;
> +        break;
> +
> +    default:
> +        return -EINVAL;
> +    }
> +    amd_cppc_prepare_policy(policy, &max_perf, &min_perf, &epp);
> +
> +    /* Further customize presets if needed */
> +    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM )
> +        min_perf = set_cppc->minimum;
> +
> +    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM )
> +        max_perf = set_cppc->maximum;
> +
> +    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ENERGY_PERF )
> +        epp = set_cppc->energy_perf;
> +
> +    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
> +        des_perf = set_cppc->desired;
> +
> +    amd_cppc_write_request(policy->cpu, data,

Like elsewhere, policy->cpu may not be online.

> --- a/xen/drivers/acpi/pm-op.c
> +++ b/xen/drivers/acpi/pm-op.c
> @@ -84,6 +84,8 @@ static int get_cpufreq_cppc(unsigned int cpu,
>  
>      if ( hwp_active() )
>          ret = get_hwp_para(cpu, cppc_para);
> +    else if ( processor_pminfo[cpu]->init & XEN_CPPC_INIT )
> +        ret = amd_cppc_get_para(per_cpu(cpufreq_cpu_policy, cpu), cppc_para);
>  
>      return ret;
>  }
> @@ -154,6 +156,17 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>      else
>          strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
>  
> +    /*
> +     * In CPPC active mode, we are borrowing governor field to indicate
> +     * policy info.
> +     */
> +    if ( policy->governor->name[0] )
> +        strlcpy(op->u.get_para.u.s.scaling_governor,
> +                policy->governor->name, CPUFREQ_NAME_LEN);
> +    else
> +        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
> +                CPUFREQ_NAME_LEN);
> +
>      if ( !cpufreq_is_governorless(op->cpuid) )
>      {
>          if ( !(scaling_available_governors =
> @@ -178,13 +191,6 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>          op->u.get_para.u.s.scaling_max_freq = policy->max;
>          op->u.get_para.u.s.scaling_min_freq = policy->min;
>  
> -        if ( policy->governor->name[0] )
> -            strlcpy(op->u.get_para.u.s.scaling_governor,
> -                    policy->governor->name, CPUFREQ_NAME_LEN);
> -        else
> -            strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
> -                    CPUFREQ_NAME_LEN);

Just to re-iterate here: Pulling this out is okay because the union has
no other member anymore, and hence other date cannot be badly impacted.

Jan

