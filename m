Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E800AB346A3
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 18:03:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093578.1449043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZeu-0002PO-TG; Mon, 25 Aug 2025 16:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093578.1449043; Mon, 25 Aug 2025 16:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZeu-0002Mv-QF; Mon, 25 Aug 2025 16:03:00 +0000
Received: by outflank-mailman (input) for mailman id 1093578;
 Mon, 25 Aug 2025 16:02:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqZet-0002KK-1o
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 16:02:59 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2d0cbad-81cc-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 18:02:49 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb78f5df4so778265866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 09:02:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe4937a15asm578066366b.115.2025.08.25.09.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 09:02:48 -0700 (PDT)
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
X-Inumbo-ID: f2d0cbad-81cc-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756137769; x=1756742569; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YwHb0lXvUKYGStJtavJtg8Z/mJpRZxzNQ++Tr5ajLnA=;
        b=PdFoUZE5v1P8Nfc3Jkj4NtCiAFOQQvP+TWPcxNqX73swUQtAm2xXVgHpXxWdmIit3I
         HBxMruYtnAkPPGJSlFmjfjjUJTZhzVQTQAVKdLwwTppMGUo/fPxj9E/DsuhfAtc7yjYR
         0+fI8hggFAUqaP6J3gA3mBIjHrI3QKj+rUiq/2jLeL1JTYV5kTGy7Z8E7sMcgeTqJ4TQ
         6s++Cd+pPn1uxhlYJBlDL55Z4FR2h9xvf+xEd7a/F/ZMrFAD+MPxdDN4u3Pp2YiAgK/6
         6gGQXdqUbKnxr+dFRknlQIrvoD3nqm3fhQf/PShow55HrQlBvFQSo/qkDD1ujEzbRcfM
         X8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756137769; x=1756742569;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwHb0lXvUKYGStJtavJtg8Z/mJpRZxzNQ++Tr5ajLnA=;
        b=GceXUA1sZH4zwBujnxzTDvvBjpiQ+dpKPhtiiipb0X6A/AU9HYtp/P62bMuVvpK+d0
         6hnncI5gHIEdVIgM3DdnDGzdl+S4bgOwth+Hz52bueIBF7/mK8xSzGO+kRXfzONYXjxo
         qSSVOjNBvjJxMvl1XiPr4iXruBmzryNU4Jx31lW5qfnQiT2DCILvo7B00FJJtvCmVrGv
         3q66G0ClanilyKljlneDDGpM3fP92NX6rd0rZqsmZVQPYaJH74z+2M3d2FghWV4bV2dJ
         bGcU29wIVy2wTDVaruyYFCcytQeGm+qir6hfNWzJDAfNKSzgxiKVv1gfME9o7HxHIjvq
         a8bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBt393tYaqFJ4KSSpZN9l4LHWRKwgbTGvIxTw60DrkYbDZpPgqerq2D1tPmtjL81/xCDBi4vKJ/uI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4m85Rk9tHLJutfyIASlI4CbGEbJipYfp0FphY6iYlPsybrwFW
	5UwmNFWhpv9w27PjrAqZMURyNjJMLL5RuV54QtcJr63xNLqsAZoKGilKx08srdf5+w==
X-Gm-Gg: ASbGncvhK6YVWfsNfqGTIyl00rL4n0qWQajp40bDA5035jgStZ+WhWYunmnS8IpumwB
	heckoyUZbd3BkqzUV36KtiVkr3itZMwYFPC9ewD1k9h5hh0883j3jxNvo42f43bDHqhkCAo8UAD
	GA3hga0Hlq4R0aKTE+WglaVfGVHL+V6pvnMUEAT3RpumLgYurd8oe0alfSxDcoUJPpXpQwJq+8M
	rCyL5qccH/Oqe0hnVmAID7fyhQXt4lglHV17L3AQeOGBTN4lIBEmAMhv0pkMgf69Fj5X5m5J72V
	+h7081B9uKhoGTdXzzjas9K8ZD5G28HQ6RP/GITKwjonw7KUc8OC/xI/rk7kCjJL8/K3JaWzQhh
	LkEr9XR0gW7ylUQoSF0M0jPuY0i3nb2joG9iNNNxkOl80rHs++CywZ247cMeFASjZ7E8mLxQ5KB
	Mi4J7SBYcIDDV7wusyVw==
X-Google-Smtp-Source: AGHT+IF/YvAE2sne/+Fd2LlTyPXEZ3pGRKF/L0bg+Lo2/swdJzntflhsYEljyqbuAm0TBwh5nsuaiQ==
X-Received: by 2002:a17:907:3e1c:b0:ae0:d4b1:b5f0 with SMTP id a640c23a62f3a-afe29548f25mr1053281966b.35.1756137768872;
        Mon, 25 Aug 2025 09:02:48 -0700 (PDT)
Message-ID: <f27c17e6-8c88-42f3-b0e2-874aa02597c5@suse.com>
Date: Mon, 25 Aug 2025 18:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/13] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-14-Penny.Zheng@amd.com>
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
In-Reply-To: <20250822105218.3601273-14-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2025 12:52, Penny Zheng wrote:
> --- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> @@ -557,6 +557,187 @@ static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
>      return 0;
>  }
>  
> +#ifdef CONFIG_PM_OP
> +int get_amd_cppc_para(const struct cpufreq_policy *policy,
> +                      struct xen_get_cppc_para *cppc_para)

amd_cppc_get_para() and ...

> +{
> +    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data,
> +                                                   policy->cpu);
> +
> +    if ( data == NULL )
> +        return -ENODATA;
> +
> +    cppc_para->policy           = policy->policy;
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
> +int set_amd_cppc_para(struct cpufreq_policy *policy,
> +                      const struct xen_set_cppc_para *set_cppc)

... amd_cppc_set_para() would imo be more consistent names, considering how
other functions are named.

> +{
> +    unsigned int cpu = policy->cpu;
> +    struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
> +    uint8_t max_perf, min_perf, des_perf, epp;
> +    bool active_mode = cpufreq_is_governorless(cpu);
> +
> +    if ( data == NULL )
> +        return -ENOENT;
> +
> +    /* Return if there is nothing to do. */
> +    if ( set_cppc->set_params == 0 )
> +        return 0;

That is ...

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

... all the errors checked here are to be ignored when no flag is set at
all?

> +    /*
> +     * Validate all parameters
> +     * Maximum performance may be set to any performance value in the range
> +     * [Nonlinear Lowest Performance, Highest Performance], inclusive but must
> +     * be set to a value that is larger than or equal to minimum Performance.
> +     */
> +    if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
> +         (set_cppc->maximum > data->caps.highest_perf ||
> +          set_cppc->maximum <
> +                        (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM
> +                         ? set_cppc->minimum
> +                         : data->req.min_perf)) )

Too deep indentation (more of this throughout the function), and seeing ...

> +        return -EINVAL;
> +    /*
> +     * Minimum performance may be set to any performance value in the range
> +     * [Nonlinear Lowest Performance, Highest Performance], inclusive but must
> +     * be set to a value that is less than or equal to Maximum Performance.
> +     */
> +    if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM) &&
> +         (set_cppc->minimum < data->caps.lowest_nonlinear_perf ||
> +          (set_cppc->minimum >

... this, one more pair of parentheses may also help there. (Recall:
symmetry where possible.)

> +                        (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM
> +                         ? set_cppc->maximum
> +                         : data->req.max_perf))) )
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
> +                        (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM
> +                         ? set_cppc->maximum
> +                         : data->req.max_perf)) ||
> +             (set_cppc->desired <
> +                        (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM
> +                         ? set_cppc->minimum
> +                         : data->req.min_perf)) )
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
> +    epp = per_cpu(epp_init, cpu);
> +    min_perf = data->caps.lowest_nonlinear_perf;
> +    max_perf = data->caps.highest_perf;
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
> +        /*
> +         * Lower max_perf to nonlinear_lowest to achieve
> +         * ultmost power saviongs
> +         */
> +        max_perf = min_perf;
> +        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE:
> +        if ( !active_mode )
> +            return -EINVAL;
> +        policy->policy = CPUFREQ_POLICY_PERFORMANCE;
> +        /* Increase min_perf to highest to achieve ultmost performance */
> +        min_perf = max_perf;
> +        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_ONDEMAND:
> +        if ( !active_mode )
> +            return -EINVAL;
> +        policy->policy = CPUFREQ_POLICY_ONDEMAND;
> +        /*
> +         * Take medium value to show no preference over
> +         * performance or powersave
> +         */
> +        epp = CPPC_ENERGY_PERF_BALANCE;
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

Much of this looks very similar to what patch 09 introduces in
amd_cppc_epp_set_policy(). Is it not possible to reduce the redundancy?

> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -81,7 +81,18 @@ struct cpufreq_policy {
>      int8_t              turbo;  /* tristate flag: 0 for unsupported
>                                   * -1 for disable, 1 for enabled
>                                   * See CPUFREQ_TURBO_* below for defines */
> -    unsigned int        policy; /* CPUFREQ_POLICY_* */
> +    unsigned int        policy; /* Performance Policy
> +                                 * If cpufreq_driver->target() exists,
> +                                 * the ->governor decides what frequency
> +                                 * within the limits is used.
> +                                 * If cpufreq_driver->setpolicy() exists, these
> +                                 * following policies are available:
> +                                 * CPUFREQ_POLICY_PERFORMANCE represents
> +                                 * maximum performance
> +                                 * CPUFREQ_POLICY_POWERSAVE represents least
> +                                 * power consumption
> +                                 * CPUFREQ_POLICY_ONDEMAND represents no
> +                                 * preference over performance or powersave */

Besides not being a well-formed comment, this is close to unreadable in this
shape. This much text wants putting ahead of the field.

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -336,8 +336,14 @@ struct xen_ondemand {
>      uint32_t up_threshold;
>  };
>  
> +#define CPUFREQ_POLICY_UNKNOWN      0
> +#define CPUFREQ_POLICY_POWERSAVE    1
> +#define CPUFREQ_POLICY_PERFORMANCE  2
> +#define CPUFREQ_POLICY_ONDEMAND     3

Without XEN_ prefixes they shouldn't appear in a public header. But do
we need ...

>  struct xen_get_cppc_para {
>      /* OUT */
> +    uint32_t policy; /* CPUFREQ_POLICY_xxx */

... the new field at all? Can't you synthesize the kind-of-governor into
struct xen_get_cpufreq_para's respective field? You invoke both sub-ops
from xenpm now anyway ...

Jan

