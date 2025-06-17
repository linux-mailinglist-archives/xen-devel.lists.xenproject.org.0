Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25871ADC884
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 12:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018090.1395008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRTi9-0007Z5-PX; Tue, 17 Jun 2025 10:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018090.1395008; Tue, 17 Jun 2025 10:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRTi9-0007Xh-Ld; Tue, 17 Jun 2025 10:38:37 +0000
Received: by outflank-mailman (input) for mailman id 1018090;
 Tue, 17 Jun 2025 10:38:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRTi8-0007Xb-De
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 10:38:36 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37e3dd26-4b67-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 12:38:34 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a35c894313so6254285f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 03:38:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365d8a1ac4sm76418965ad.74.2025.06.17.03.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 03:38:33 -0700 (PDT)
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
X-Inumbo-ID: 37e3dd26-4b67-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750156713; x=1750761513; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i2BolxaOx19/UhTG2jY2iLKgkGHeDnex5eKgAFybgdc=;
        b=XP6kIBKxHpZ+4a4cxyjfD8d/ql2bUGBGDmW5URR11KvT+jU1I07HP9SaxkUa7yQ8CD
         nNyZgdVTbB7hSr94Ob2qen2q/JK9vmrwxpcU/Iwa4PyRNI14miAyL+E0XDukqjO1rz8N
         nNHnIZb610MKgnBd+N+3ZNNIgc5KyByDpqr+JPRcI/HB1xuDqzp6oGbVe7m4NNbiONyP
         M0SeQJQw2ioC0Uiyuawh3rEbdM3D67oKhE4hHgQz809JCFBxGCcRz0Xc3zRrjErWpRbQ
         g3/qfhqEOU6AX97Pc375rxQKA5WqSbX31bKYSckglAy9v7dqJ6M8KCWSlRszdkP2xaJQ
         7YWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750156713; x=1750761513;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2BolxaOx19/UhTG2jY2iLKgkGHeDnex5eKgAFybgdc=;
        b=S1UZlQyRBIJ+P+CGruPKh4YJzkCNBvJdFV+8Uch6+Z//xxciKKoIgBnywSa2GwxvW+
         ljVswaT7uwNvFrg4TduE7dvdmf/RD5Sp5n3+xKlwaUgx5sX95i5v+927NbcH2g5yn7Jf
         hz6Gu8nH57Z65bCuBPlqmBchpjoxNAOApeGpK931aWkyhDzkv2drx2TygQV6PNaRtH1N
         GpqipGXppG3YpTb5DA6NBjZlGMU5AfhBLV4HqDGBDqr8IVpX0AqPta80PmucmLIYLf36
         7Rk9Gr6r/8ZsXZjCrhJBgaJs7wHixxfHwm60EazQIfOvdOfEj91k6UhAE1nal+sQ/UTK
         p2yQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6TtMSt+RvHUxVJnOuWrjOMG4b0dVVHJMvpGWA01q40kt2bwF8KU0+t9BRwcZG3YD6rK4ufE69vLA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGGyznHIafbyqeWm/Zlrq0xNKg86qpWP+6fy6d/QwpMC4j2Jq/
	h4oKAzl/pqTLqZtEleNEOWSRprIp+MgM89rGUhnejHjdqwk6EihTZJSQpYaHqU58MA==
X-Gm-Gg: ASbGnctMKHGuKdJlONC4nPDR9Fy2nTr2FRBbfbv0sXQV0dFVgyCQYSjS6G0cg/IkFX/
	MB8PwOspwEYHPflGNBT0iTn0L0prw5DncSENt/xKJB04d0YrJPjf9an3D+Bpwp8W/UIm+4bJuDr
	WuXX3+kcX7he91Pb89hrQ2XgeMlRCg2zAY/ClAPcXRSuPKOOGjL963kOTONz5hBZOyswTX+K5Tc
	EPaI12//h9RKdlRaW9gCWWmLZV9hMbRisO4iVhTFi0RmE/FpzQZB3HFUG6bGf1BEkxN4gcp9X5c
	1muoZopFy/hwYKNafggjMmIxQ29Hym3Ifl8S8VhlnVb3N1E3ou4Mj5oQi6+o4xMl3CFRoBoDYmS
	P9GWdClgPmFX5LM3feaSATQkaB70NiR7XfaUsvjisCSjNeiM=
X-Google-Smtp-Source: AGHT+IEqSOJprLmdLkEgsRZqFspvNpiGEiVRmG0buSiS4/iIMqsaPP3lHl3cWYXl/sxsP1KwI1Ql+A==
X-Received: by 2002:a5d:5f96:0:b0:3a5:2fb2:35ac with SMTP id ffacd0b85a97d-3a5723a182cmr10355893f8f.24.1750156713498;
        Tue, 17 Jun 2025 03:38:33 -0700 (PDT)
Message-ID: <a1bf3003-d0e3-4769-948d-872bc17b5f91@suse.com>
Date: Tue, 17 Jun 2025 12:38:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/18] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-19-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-19-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> --- a/tools/misc/xenpm.c
> +++ b/tools/misc/xenpm.c
> @@ -38,6 +38,13 @@
>  static xc_interface *xc_handle;
>  static unsigned int max_cpu_nr;
>  
> +static const char cpufreq_policy_str[][12] = {
> +    [XEN_CPUFREQ_POLICY_UNKNOWN] = "none",

Why not "unknown"?

> +    [XEN_CPUFREQ_POLICY_POWERSAVE] = "powersave",
> +    [XEN_CPUFREQ_POLICY_PERFORMANCE] = "performance",
> +    [XEN_CPUFREQ_POLICY_BALANCE] = "balance",
> +};
> +
>  /* help message */
>  void show_help(void)
>  {
> @@ -984,6 +991,9 @@ static void print_cppc_para(unsigned int cpuid,
>      printf("                     : desired [%"PRIu32"%s]\n",
>             cppc->desired,
>             cppc->desired ? "" : " hw autonomous");
> +
> +    printf("  performance policy : %s\n",
> +           cpufreq_policy_str[cppc->policy]);

What if for whatever reason the value you get is 4? Please avoid array overruns
also in user space tools.

> --- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> @@ -506,6 +506,135 @@ static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
>      return 0;
>  }
>  
> +int get_amd_cppc_para(const struct cpufreq_policy *policy,
> +                      struct xen_cppc_para *cppc_para)
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
> +
> +    if ( data == NULL )
> +        return -ENOENT;
> +
> +    /* Validate all parameters */
> +    if ( set_cppc->minimum > UINT8_MAX || set_cppc->maximum > UINT8_MAX ||
> +         set_cppc->desired > UINT8_MAX || set_cppc->energy_perf > UINT8_MAX )
> +        return -EINVAL;
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

If the respective flag is set, is the field being zero legitimate? In patch
10 you reject finding zero perf values.

> +    /* Activity window not supported in MSR */
> +    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW )
> +        return -EOPNOTSUPP;
> +
> +    /* Return if there is nothing to do. */
> +    if ( set_cppc->set_params == 0 )
> +        return 0;
> +
> +    epp = per_cpu(epp_init, cpu);
> +    /*
> +     * Apply presets:
> +     * XEN_SYSCTL_CPPC_SET_DESIRED reflects whether desired perf is set, which
> +     * is also the flag to distinguish between passive mode and active mode.
> +     * When it is set, CPPC in passive mode, only
> +     * XEN_SYSCTL_CPPC_SET_PRESET_NONE could be chosen.
> +     * when it is not set, CPPC in active mode, three different profile
> +     * XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE/PERFORMANCE/BALANCE are provided,
> +     */
> +    switch ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_PRESET_MASK )
> +    {
> +    case XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE:
> +        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
> +            return -EINVAL;
> +        policy->policy = CPUFREQ_POLICY_POWERSAVE;
> +        min_perf = data->caps.lowest_perf;
> +        /* Lower max frequency to lowest */
> +        max_perf = data->caps.lowest_perf;
> +        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE:
> +        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
> +            return -EINVAL;
> +        /* Increase idle frequency to highest */
> +        policy->policy = CPUFREQ_POLICY_PERFORMANCE;
> +        min_perf = data->caps.highest_perf;
> +        max_perf = data->caps.highest_perf;
> +        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_BALANCE:
> +        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
> +            return -EINVAL;
> +        policy->policy = CPUFREQ_POLICY_BALANCE;
> +        min_perf = data->caps.lowest_perf;
> +        max_perf = data->caps.highest_perf;
> +        epp = CPPC_ENERGY_PERF_BALANCE;
> +        break;

Isn't this more line "ondemand"? To me, "balance" would mean tying perf to at
least close around the middle of lowest and highest.

> +    case XEN_SYSCTL_CPPC_SET_PRESET_NONE:
> +        /*
> +         * In paasive mode, Xen governor is responsible for perfomance tuning.

Nit: passive

> +         * we shall set lowest_perf with "lowest_nonlinear_perf" to ensure
> +         * governoring performance in P-states range.
> +         */
> +        min_perf = data->caps.lowest_nonlinear_perf;
> +        max_perf = data->caps.highest_perf;

As in the earlier patch - I fear I don't understand the comment, and hence why
to use lowest-nonlinear here remains unclear to me.

> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -334,6 +334,10 @@ static int get_cpufreq_cppc(struct xen_sysctl_pm_op *op)
>      if ( hwp_active() )
>          ret = get_hwp_para(op->cpuid, &op->u.cppc_para);
>  
> +    if ( processor_pminfo[op->cpuid]->init & XEN_CPPC_INIT )
> +        ret = get_amd_cppc_para(per_cpu(cpufreq_cpu_policy, op->cpuid),
> +                                &op->u.cppc_para);

This is a case where I think you would better use "else if". Otherwise it
looks as if both paths could be taken (and "ret" as well as op->u.cppc_para
be overwritten BY this second call).

> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -134,14 +134,16 @@ extern int cpufreq_register_governor(struct cpufreq_governor *governor);
>  extern struct cpufreq_governor *__find_governor(const char *governor);
>  #define CPUFREQ_DEFAULT_GOVERNOR &cpufreq_gov_dbs
>  
> -#define CPUFREQ_POLICY_UNKNOWN      0
> +#define CPUFREQ_POLICY_UNKNOWN      XEN_CPUFREQ_POLICY_UNKNOWN
>  /*
>   * If cpufreq_driver->target() exists, the ->governor decides what frequency
>   * within the limits is used. If cpufreq_driver->setpolicy() exists, these
>   * two generic policies are available:
>   */
> -#define CPUFREQ_POLICY_POWERSAVE    1
> -#define CPUFREQ_POLICY_PERFORMANCE  2
> +#define CPUFREQ_POLICY_POWERSAVE    XEN_CPUFREQ_POLICY_POWERSAVE
> +#define CPUFREQ_POLICY_PERFORMANCE  XEN_CPUFREQ_POLICY_PERFORMANCE
> +/* Achieved only via xenpm XEN_SYSCTL_CPPC_SET_PRESET_BALANCE preset */
> +#define CPUFREQ_POLICY_BALANCE      XEN_CPUFREQ_POLICY_BALANCE

We don't need both sets of manifest constants, do we?

Jan

