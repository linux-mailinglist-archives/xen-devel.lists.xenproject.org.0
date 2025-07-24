Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5BEB10DF1
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 16:45:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056190.1424378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexBU-00082G-Ck; Thu, 24 Jul 2025 14:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056190.1424378; Thu, 24 Jul 2025 14:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexBU-0007zl-9b; Thu, 24 Jul 2025 14:44:36 +0000
Received: by outflank-mailman (input) for mailman id 1056190;
 Thu, 24 Jul 2025 14:44:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uexBS-0007zf-V6
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:44:35 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5ee2c15-689c-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 16:44:32 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so11127975e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 07:44:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705d42b0sm22432035e9.33.2025.07.24.07.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 07:44:31 -0700 (PDT)
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
X-Inumbo-ID: b5ee2c15-689c-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753368272; x=1753973072; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NOQnKcOPFmkPn93xRQYuVIAR32JzK/p298vcgJlyVWw=;
        b=S0oT4UEpCN2WugXSScgtWYCAI/J6zALasE5w5Y74uM0F2/didccoLFQQIbhiD6q2Ai
         1Wb8bPNC/VmeZo2eOpRIkj7pj24l4etjsDJPRZ4Tnt8Kecj8nHHJA8yknlSZNt6t9z1W
         H0jP+lxMiH11hwBJl0OvMK/b0P/M1HXH3SmEQnDpXZohoyhC8NaoBfTLqxxfpdCm5tcJ
         LafhCJ9kfJ3puWHfkKurnFXYCCcIrRX/jdL5dB34ToZ2GcObDMOYnGyKXaqwclc7LAUr
         wdorp+yTb866LxsqMYxpsrgH6tGdhlagO5jlJnMjHZq1qrgDkoFtlTOjR6+nBGVVv82f
         mU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753368272; x=1753973072;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOQnKcOPFmkPn93xRQYuVIAR32JzK/p298vcgJlyVWw=;
        b=dkuKDUPOdvCCbin+6j+Z06YExP3nhOxOLP9SrKQFmEAuoYSWtdWTIDsqP0IFMe7V01
         ZO3SctfcOTC35tuWfWILcjl1v+PauCZE83hJ61hKMxRraavcNiSzwwgi+ABnRAxtgKMF
         gSzZ8dRipvb+kRxYkyCJqVvM7l5tbRGlDdyPiUeC7RsIFKUDMEwek1iJXtAkAnzG3rJU
         1RqNJlm5CSxnzDho3x8k8WP4yXkfCg8YfOesbcmhqM/GFmrdFgPGHqcywWdxd2n7CMa0
         /IY+3FDpdDbrG3sTmGme7RIlki+1nNo9oKUyygE/Gb1epFRY47+iQNDE3JHyedsU90nD
         q6rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVg6+WVMcfUJErOnhSqQLsldoOqZGxQmrAYx4HJAYtIv4XXoWWAI7pbdiyDP11B/0Mm1zWU3Yhz3M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQ+HK5LfQ3SCFoxVZe/ZY+xMNH5jEsI4VHntGfklrlVHJPkIlE
	fj86VAf3lUrjjg7SFhldNHsvdX9Zu7F8wNrUJz+dozDdBvNfEZZeXbzAXTk2uunfsg==
X-Gm-Gg: ASbGncs2TA2lCa4Fgq/uJZ3s1ZrH4se2R0qphIhPjGJdB+uvrlmxT7YgkMAQmharM83
	e7MlHnJKC++ZPOP2IXZEL/iQvt6vG+Cop1BzP1rHp1aXHzUaUSgFu/zSw4j2zHRXaMGLTGNk4Rd
	Nvcs37nvq9cqESA1Or1SOqKBYKDfUFEuTTqSwCZS1frIO4F7VQGbTBH+FArt05VJ0Vo+zW8wSRa
	P2lqF1Lpfq62jrqb7+uLJ/Dq1L0ZYDXBXyYP4pq+vEBD6Qlh1DtFY4T1pdRWE6qfvpBhRI7d93C
	snqlC5skVVVDtNwM9Ri3niGtE10KOV0BQw9mHN0QXmmk8WfZ68TFIVaUzKA4epdadMkks1566QR
	FrqBZvafYr660scKHjRvPOWi4cp3HbVcbTDzJWBsE0jAocOcexop+/fmZT4L3x7Slqgnm+uvPC+
	ZWDpcBgzHfpxpq3KopCA==
X-Google-Smtp-Source: AGHT+IFHqiDtvtNO5sG76jKzXLHpjUX0w/J8NsGAJW3zConm6DndHFLzeWdhAMT6qOlKK6MMb47oRA==
X-Received: by 2002:a05:600c:1e13:b0:456:1f09:6846 with SMTP id 5b1f17b1804b1-45868d256b3mr59747425e9.25.1753368271893;
        Thu, 24 Jul 2025 07:44:31 -0700 (PDT)
Message-ID: <796a9251-8b4f-4266-a31e-828d4da29f54@suse.com>
Date: Thu, 24 Jul 2025 16:44:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/19] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-20-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711035106.2540522-20-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 05:51, Penny Zheng wrote:
> Introduce helper set_amd_cppc_para() and get_amd_cppc_para() to
> SET/GET CPPC-related para for amd-cppc/amd-cppc-epp driver.
> 
> In get_cpufreq_cppc()/set_cpufreq_cppc(), we include
> "processor_pminfo[cpuid]->init & XEN_CPPC_INIT" condition check to deal with
> cpufreq driver in amd-cppc.
> 
> Also, a new field "policy" has also been added in "struct xen_get_cppc_para"
> to describe performance policy in active mode. It gets printed with other
> cppc paras. Move manifest constants "XEN_CPUFREQ_POLICY_xxx" to public header
> to let it be used in user space tools. Also add a new anchor
> "XEN_CPUFREQ_POLICY_xxx" for array overrun check.

If only they indeed had XEN_ prefixes.

> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - Give the variable des_perf an initializer of 0
> - Use the strncmp()s directly in the if()
> ---
> v3 -> v4
> - refactor comments
> - remove double blank lines
> - replace amd_cppc_in_use flag with XEN_PROCESSOR_PM_CPPC
> ---
> v4 -> v5:
> - add new field "policy" in "struct xen_cppc_para"
> - add new performamce policy XEN_CPUFREQ_POLICY_BALANCE
> - drop string comparisons with "processor_pminfo[cpuid]->init & XEN_CPPC_INIT"
> and "cpufreq.setpolicy == NULL"
> - Blank line ahead of the main "return" of a function
> - refactor comments, commit message and title
> ---
> v5 -> v6:
> - remove duplicated manifest constants, and just move it to public header
> - use "else if" to avoid confusion that it looks as if both paths could be taken
> - add check for legitimate perf values
> - use "unknown" instead of "none"
> - introduce "CPUFREQ_POLICY_END" for array overrun check in user space tools

Please don't; use ARRAY_SIZE() (and if necessary further checking) instead.
In fact I think ...

> --- a/tools/misc/xenpm.c
> +++ b/tools/misc/xenpm.c
> @@ -38,6 +38,13 @@
>  static xc_interface *xc_handle;
>  static unsigned int max_cpu_nr;
>  
> +static const char cpufreq_policy_str[][12] = {
> +    [CPUFREQ_POLICY_UNKNOWN] = "unknown",
> +    [CPUFREQ_POLICY_POWERSAVE] = "powersave",
> +    [CPUFREQ_POLICY_PERFORMANCE] = "performance",
> +    [CPUFREQ_POLICY_ONDEMAND] = "ondemand",
> +};
> +
>  /* help message */
>  void show_help(void)
>  {
> @@ -825,6 +832,10 @@ static void print_cppc_para(unsigned int cpuid,
>      printf("                     : desired [%"PRIu32"%s]\n",
>             cppc->desired,
>             cppc->desired ? "" : " hw autonomous");
> +
> +    if ( cppc->policy < CPUFREQ_POLICY_END )
> +        printf("  performance policy : %s\n",
> +               cpufreq_policy_str[cppc->policy]);

... you would want to print "unknown" in all other cases as well.

It's not clear to me though how the printing is avoided for passive mode.

> --- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> @@ -561,6 +561,186 @@ static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
>      return 0;
>  }
>  
> +int get_amd_cppc_para(const struct cpufreq_policy *policy,
> +                      struct xen_get_cppc_para *cppc_para)
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
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
> +    uint8_t max_perf, min_perf, des_perf = 0, epp;
> +    bool active_mode;
> +
> +    if ( data == NULL )
> +        return -ENOENT;
> +
> +    if ( cpufreq_is_governorless(cpu) )
> +        active_mode = true;

Without "else" the variable will be left uninitialized. I'm surprised
the compiler allowed you to get away with this. Why is the function
call not simply the variable's initializer?

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
> +    /*
> +     * Validate all parameters
> +     * Maximum performance may be set to any performance value in the range
> +     * [Nonlinear Lowest Performance, Highest Performance], inclusive.
> +     */
> +    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM &&

Nit: Missing parentheses again. Which is particularly odd since in the
immediately preceding if() they're there. More of this further down.

> +         (set_cppc->maximum > data->caps.highest_perf ||
> +          set_cppc->maximum < data->caps.lowest_nonlinear_perf) )
> +        return -EINVAL;
> +    /*
> +     * Minimum performance may be set to any performance value in the range
> +     * [Nonlinear Lowest Performance, Highest Performance], inclusive but must
> +     * be set to a value that is less than or equal to Maximum Performance.
> +     */
> +    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM &&
> +         (set_cppc->minimum < data->caps.lowest_nonlinear_perf ||
> +          (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM &&
> +           set_cppc->minimum > set_cppc->maximum) ||
> +          (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&

Hmm, I find this confusing to read, and was first thinking the ! was wrong
here. Imo such is better expressed with the conditional operator:


          set_cppc->minimum > (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM
                               ? set_cppc->maximum
                               : data->req.max_perf)

Which also makes it easier to spot that here you use data->req, when
in the minimum check you use data->caps. Why this difference?

> +           set_cppc->minimum > data->req.max_perf)) )
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
> +        if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM &&
> +              set_cppc->desired > set_cppc->maximum) ||
> +             (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM &&
> +              set_cppc->desired < set_cppc->minimum) ||
> +             (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
> +              set_cppc->desired > data->req.max_perf) ||
> +             (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM) &&
> +              set_cppc->desired < data->req.min_perf) )
> +            return -EINVAL;

All of the above applies here as well.

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
> +        if ( set_cppc->energy_perf > UINT_MAX )
> +            return -EINVAL;
> +    }
> +
> +    /* Activity window not supported in MSR */
> +    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW )
> +        return -EOPNOTSUPP;
> +
> +    /* Return if there is nothing to do. */
> +    if ( set_cppc->set_params == 0 )
> +        return 0;

Why did this move so far down (I think it was sitting earlier)? The
earlier 5 if()s are all needlessly carried out in this case (unless the
compiler can reason about moving this check ahead).

> +    epp = per_cpu(epp_init, cpu);
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
> +        min_perf = data->caps.lowest_nonlinear_perf;
> +        /*
> +         * Lower max_perf to nonlinear_lowest to achieve
> +         * ultmost power saviongs
> +         */
> +        max_perf = data->caps.lowest_nonlinear_perf;

Why not use the shorter "min_perf" here?

> +        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE:
> +        if ( !active_mode )
> +            return -EINVAL;
> +        policy->policy = CPUFREQ_POLICY_PERFORMANCE;
> +        /* Increase min_perf to highest to achieve ultmost performance */
> +        min_perf = data->caps.highest_perf;
> +        max_perf = data->caps.highest_perf;

And "max_perf" here? Furthermore if you moved ...

> +        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_ONDEMAND:
> +        if ( !active_mode )
> +            return -EINVAL;
> +        policy->policy = CPUFREQ_POLICY_ONDEMAND;
> +        min_perf = data->caps.lowest_nonlinear_perf;
> +        max_perf = data->caps.highest_perf;

... these two ahead of the switch(), you could further reduce the number
of assignments (overrides) done, including ...

> +        /*
> +         * Take medium value to show no preference over
> +         * performance or powersave
> +         */
> +        epp = CPPC_ENERGY_PERF_BALANCE;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_NONE:
> +        policy->policy = CPUFREQ_POLICY_UNKNOWN;
> +        min_perf = data->caps.lowest_nonlinear_perf;
> +        max_perf = data->caps.highest_perf;

... the dropping of these two lines.

> --- a/xen/drivers/acpi/pm-op.c
> +++ b/xen/drivers/acpi/pm-op.c
> @@ -84,6 +84,8 @@ static int get_cpufreq_cppc(unsigned int cpu,
>  
>      if ( hwp_active() )
>          ret = get_hwp_para(cpu, cppc_para);
> +    else if ( processor_pminfo[cpu]->init & XEN_CPPC_INIT )
> +        ret = get_amd_cppc_para(per_cpu(cpufreq_cpu_policy, cpu), cppc_para);
>  
>      return ret;
>  }
> @@ -325,10 +327,12 @@ static int set_cpufreq_cppc(struct xen_sysctl_pm_op *op)
>      if ( !policy || !policy->governor )
>          return -ENOENT;
>  
> -    if ( !hwp_active() )
> -        return -EOPNOTSUPP;
> +    if ( hwp_active() )
> +        return set_hwp_para(policy, &op->u.set_cppc);
> +    else if ( processor_pminfo[op->cpuid]->init & XEN_CPPC_INIT )

As before, please can you avoid the use of "else" in such cases. Strictly
speaking that's "dead code" in Misra's nomeclature.

> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -133,21 +133,6 @@ extern int cpufreq_register_governor(struct cpufreq_governor *governor);
>  extern struct cpufreq_governor *__find_governor(const char *governor);
>  #define CPUFREQ_DEFAULT_GOVERNOR &cpufreq_gov_dbs
>  
> -/*
> - * Performance Policy
> - * If cpufreq_driver->target() exists, the ->governor decides what frequency
> - * within the limits is used. If cpufreq_driver->setpolicy() exists, these
> - * following policies are available:
> - * CPUFREQ_POLICY_PERFORMANCE represents maximum performance
> - * CPUFREQ_POLICY_POWERSAVE represents least power consumption
> - * CPUFREQ_POLICY_ONDEMAND represents no preference over performance or
> - * powersave
> - */
> -#define CPUFREQ_POLICY_UNKNOWN      0
> -#define CPUFREQ_POLICY_POWERSAVE    1
> -#define CPUFREQ_POLICY_PERFORMANCE  2
> -#define CPUFREQ_POLICY_ONDEMAND     3
> -
>  unsigned int cpufreq_policy_from_governor(const struct cpufreq_governor *gov);
>  
>  /* pass a target to the cpufreq driver */
> @@ -294,6 +279,10 @@ int acpi_cpufreq_register(void);
>  
>  int amd_cppc_cmdline_parse(const char *s, const char *e);
>  int amd_cppc_register_driver(void);
> +int get_amd_cppc_para(const struct cpufreq_policy *policy,
> +                      struct xen_get_cppc_para *cppc_para);
> +int set_amd_cppc_para(struct cpufreq_policy *policy,
> +                      const struct xen_set_cppc_para *set_cppc);
>  
>  bool cpufreq_in_cppc_passive_mode(unsigned int cpuid);
>  bool cpufreq_is_governorless(unsigned int cpuid);
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -336,8 +336,25 @@ struct xen_ondemand {
>      uint32_t up_threshold;
>  };
>  
> +/*
> + * Performance Policy
> + * If cpufreq_driver->target() exists, the ->governor decides what frequency
> + * within the limits is used. If cpufreq_driver->setpolicy() exists, these
> + * following policies are available:
> + * CPUFREQ_POLICY_PERFORMANCE represents maximum performance
> + * CPUFREQ_POLICY_POWERSAVE represents least power consumption
> + * CPUFREQ_POLICY_ONDEMAND represents no preference over performance or
> + * powersave
> + */

I appreciate that you want to retain the comment, but implementation details
of the hypervisor imo don't belong in public headers. That internal part may
want to move to e.g. the respective (internal) struct field.

Jan

