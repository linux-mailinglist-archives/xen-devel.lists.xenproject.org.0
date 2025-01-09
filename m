Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D32A074D9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 12:38:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868249.1279780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqrp-0000Yw-Vf; Thu, 09 Jan 2025 11:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868249.1279780; Thu, 09 Jan 2025 11:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVqrp-0000W5-SO; Thu, 09 Jan 2025 11:38:25 +0000
Received: by outflank-mailman (input) for mailman id 868249;
 Thu, 09 Jan 2025 11:38:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVqro-0000Vv-3W
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 11:38:24 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ad74205-ce7e-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 12:38:22 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso6174865e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 03:38:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e3834fbsm1577263f8f.26.2025.01.09.03.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 03:38:21 -0800 (PST)
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
X-Inumbo-ID: 3ad74205-ce7e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736422701; x=1737027501; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M22tNQLe7KmvxYgkZRqrzBeivhD8EmAFyF2n2ljaqLM=;
        b=BAwg4oLmdtjAMCpd61z8o+8SdyOGpQCo1xR3DAZaiwLye4/KrObDc6lzJlNfnd4hNh
         uBv1S3Z2ccVx5PzaS8dzR8weDcupMiippO6sFW9hHJ5QE4SKNKzW1RY9RSDkeaP9umv2
         TmaGNLAYcGlUiwr1Xrib6WlJ8lducQMbcLg2zuo5BN2j87FBH5GHkbcWT1tVdvjUL3b8
         wq3cGGpNVlks44Eo1mtJACpJyQT1LeKvpOwIt9+bbx8KmgXWYtVSscO2nes3y7dN0hD4
         QtC1UaYQpmRBh77jMym7Zikih37NhCRrQUg3Eh5rZzPXemXGR7JE0xKfnzefGn8McY0/
         bc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736422701; x=1737027501;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M22tNQLe7KmvxYgkZRqrzBeivhD8EmAFyF2n2ljaqLM=;
        b=l2g6kfB0ZN7vuWMXDplp1bma70wRoggr5JyfVQye3tuC3aZcBklKmmtgrXWlhDn+pq
         bUF2bz9l3BwXXtxS+YiyeLC9TphrIoLA3M1vRL9PvngeuREKaVMEJ/IBr+nwZVOy755b
         9amNcWQkk+424pMx36HTI8mdizbzNZqTdwbgL13apDyqsPH/wRTzUGaNzY93coBHL3Pz
         +vMuLo3En1x0AcdaCMGZYfIcLV9e78RsvkaWPWGVlommMWdisYulm+xuKcKCL46Zf3Cj
         O/MEUjSfHfKNkwTOtVeXdXC5ID73C5jN4vYoNnBvSHhYvKezP02rgN0+kg1ddbu7NCIJ
         Nsgg==
X-Forwarded-Encrypted: i=1; AJvYcCWC0EKeQFSzyA7yDyzqK5z0pVWMg6GRkho418TQEY6++GAQZhoiI3rgnTEXlsW0fRVefVp2SeQJ/Cs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7xicRZwPtd5eX1fr9CjcxhIB4FwzwxxYgMFZTAqS/b+odXss9
	mp9guCnuNHQFoa0iE41Sq2yBOHXrtaeIyzxyWXopKMy94TLjhYgHyjr6EABySQ==
X-Gm-Gg: ASbGnctrsXpXj6gQZxERNYYRema2zRXbEgRSZzNgSIFLhOXH5Ea9z5D9fMpEEqZVlKr
	BVR0KisBDf/pAnYV7EcXurYOm+9xtaNbVHD0VInr0oR9h8tyktXxk/32XpjIa+zQAaLHsy4REcP
	8lB2slr2/fBw4n6FVnmZvU6yOCNeR2uM4p7ZiW/K5BY3UgXNcYvAPrI3GH99RnaX6b+o24NewtF
	uyZ8yuH0nDg530s6aqlTgiKYFtT4KpsmfAerfzuVT46g+ViICn6p22mZcOPBLAbGZj1+QYe6l5G
	KAB55LUm6TeJzXNw0sSLmGDN96e3NEi7nH6WyJPjLw==
X-Google-Smtp-Source: AGHT+IHmB6SgQ56pISQlqpp9G9scZSIz9zk5wiQAc4Sn78EIRu3XCEyvnZNqOpbe6m9q0U4wCIAO+Q==
X-Received: by 2002:a05:600c:500f:b0:436:51bb:7a52 with SMTP id 5b1f17b1804b1-436e2697170mr55955775e9.7.1736422701386;
        Thu, 09 Jan 2025 03:38:21 -0800 (PST)
Message-ID: <3f688a4a-c95b-4852-bc0d-089336a5e6ef@suse.com>
Date: Thu, 9 Jan 2025 12:38:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/11] xen/x86: implement EPP support for the AMD
 processors
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: stefano.stabellini@amd.com, Ray.Huang@amd.com, Xenia.Ragiadakou@amd.com,
 Jason.Andryuk@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-10-Penny.Zheng@amd.com>
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
In-Reply-To: <20241203081111.463400-10-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2024 09:11, Penny Zheng wrote:
> @@ -223,14 +227,29 @@ static void amd_pstate_write_request_msrs(void *info)
>  }
>  
>  static int cf_check amd_pstate_write_request(int cpu, uint8_t min_perf,
> -                                             uint8_t des_perf, uint8_t max_perf)
> +                                             uint8_t des_perf, uint8_t max_perf,
> +                                             int epp)
>  {
>      struct amd_pstate_drv_data *data = per_cpu(amd_pstate_drv_data, cpu);
> -    uint64_t prev = data->amd_req;
> +    uint64_t prev = data->amd_req, val;
>  
>      data->req.min_perf = min_perf;
>      data->req.max_perf = max_perf;
> -    data->req.des_perf = des_perf;
> +    if ( !epp_mode )
> +        data->req.des_perf = des_perf;
> +    else
> +    {
> +        data->req.des_perf = 0;
> +        /* Get pre-defined BIOS value */
> +        if ( epp < 0 )
> +        {
> +            if ( rdmsr_safe(MSR_AMD_CPPC_REQ, val) )
> +                return -EINVAL;
> +            data->req.epp = (val >> 24) & 0xFF;

This reading may better live in the sole caller where it's relevant. Plus
it might be yet better if this was read just once, assuming "pre-defined
BIOS value" is what it says (and hence doesn't change during the runtime
of the system).

> @@ -257,7 +276,7 @@ static int cf_check amd_pstate_cpufreq_target(struct cpufreq_policy *policy,
>      min_perf = data->hw.lowest_nonlinear_perf;
>      des_perf = amd_pstate_khz_to_perf(data, target_freq);
>  
> -    return amd_pstate_write_request(policy->cpu, min_perf, des_perf, max_perf);
> +    return amd_pstate_write_request(policy->cpu, min_perf, des_perf, max_perf, -1);
>  }
>  
>  static void cf_check amd_pstate_init_msrs(void *info)
> @@ -354,7 +373,7 @@ static void amd_pstate_boost_init(struct cpufreq_policy *policy, struct amd_psta
>      policy->turbo = CPUFREQ_TURBO_ENABLED;
>  }
>  
> -static int cf_check amd_pstate_cpufreq_cpu_init(struct cpufreq_policy *policy)
> +static int amd_pstate_cpufreq_init_perf(struct cpufreq_policy *policy)
>  {
>      unsigned int cpu = policy->cpu;
>      struct amd_pstate_drv_data *data;
> @@ -379,10 +398,23 @@ static int cf_check amd_pstate_cpufreq_cpu_init(struct cpufreq_policy *policy)
>          return -ENODEV;
>      }
>  
> -    amd_pstate_boost_init(policy, data);
>      return 0;
>  }
>  
> +static int cf_check amd_pstate_cpufreq_cpu_init(struct cpufreq_policy *policy)
> +{
> +    int ret = 0;

Pointless initializer.

> +    struct amd_pstate_drv_data *data;
> +
> +    ret = amd_pstate_cpufreq_init_perf(policy);
> +    if ( ret )
> +        return ret;
> +
> +    data = per_cpu(amd_pstate_drv_data, policy->cpu);
> +    amd_pstate_boost_init(policy, data);
> +    return ret;
> +}
> +
>  static int cf_check amd_pstate_cpufreq_cpu_exit(struct cpufreq_policy *policy)
>  {
>      struct amd_pstate_drv_data *data = per_cpu(amd_pstate_drv_data, policy->cpu);
> @@ -393,6 +425,70 @@ static int cf_check amd_pstate_cpufreq_cpu_exit(struct cpufreq_policy *policy)
>      return 0;
>  }
>  
> +static void amd_perf_ctl_reset(void *data)
> +{
> +    wrmsr_safe(MSR_K8_PSTATE_CTRL, 0);
> +}
> +
> +static int cf_check amd_pstate_epp_cpu_init(struct cpufreq_policy *policy)
> +{
> +    int ret = 0;
> +    struct amd_pstate_drv_data *data;
> +
> +    /*
> +     * Resetting P-State Control register will put the CPU in P0 frequency,
> +     * which is ideal for initialization process.
> +     */
> +    on_selected_cpus(cpumask_of(policy->cpu), amd_perf_ctl_reset, NULL, 1);

How do you/we know what's ideal for initialization? I can think of cases
where it might be better to still conserve power.

> +static int cf_check amd_pstate_epp_update_limit(struct cpufreq_policy *policy)
> +{
> +    struct amd_pstate_drv_data *data = per_cpu(amd_pstate_drv_data, policy->cpu);
> +    uint8_t max_perf, min_perf, des_perf;
> +    int epp = -1;
> +
> +    /* Initial min/max values for CPPC Performance Controls Register */
> +    max_perf = data->hw.highest_perf;
> +    min_perf = data->hw.lowest_perf;
> +
> +    if ( data->policy == CPUFREQ_POLICY_PERFORMANCE )
> +        min_perf = max_perf;

Why can't this be done ...

> +    /* CPPC EPP feature require to set zero to the desire perf bit */
> +    des_perf = 0;
> +
> +    if ( data->policy == CPUFREQ_POLICY_PERFORMANCE )
> +        /* Force the epp value to be zero for performance policy */
> +        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;

... here as well? And why is there nothing respective for ...

> +    else if ( data->policy == CPUFREQ_POLICY_POWERSAVE )
> +        /* Force the epp value to be 0xff for powersave policy */
> +        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;

... this case (e.g. setting max_perf from min_perf)?

> @@ -402,6 +498,15 @@ static const struct cpufreq_driver __initconstrel amd_pstate_cpufreq_driver =
>      .exit   = amd_pstate_cpufreq_cpu_exit,
>  };
>  
> +static const struct cpufreq_driver __initconstrel amd_pstate_epp_driver =

Again: __initconst_cf_clobber.

> @@ -409,4 +514,9 @@ int __init amd_pstate_register_driver(void)
>  
>      if ( !opt_cpufreq_active )
>          return cpufreq_register_driver(&amd_pstate_cpufreq_driver);
> +    else
> +    {
> +        epp_mode = true;

Why a 2nd global variable? Can't you go from opt_cpufreq_active?

> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> @@ -21,10 +21,6 @@ static bool __ro_after_init feature_hdc;
>  
>  static bool __ro_after_init opt_cpufreq_hdc = true;
>  
> -#define HWP_ENERGY_PERF_MAX_PERFORMANCE 0
> -#define HWP_ENERGY_PERF_BALANCE         0x80
> -#define HWP_ENERGY_PERF_MAX_POWERSAVE   0xff
> -
>  union hwp_request
>  {
>      struct
> @@ -597,7 +593,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
>          data->minimum = data->hw.lowest;
>          data->maximum = data->hw.lowest;
>          data->activity_window = 0;
> -        data->energy_perf = HWP_ENERGY_PERF_MAX_POWERSAVE;
> +        data->energy_perf = CPPC_ENERGY_PERF_MAX_POWERSAVE;
>          data->desired = 0;
>          break;
>  
> @@ -605,7 +601,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
>          data->minimum = data->hw.highest;
>          data->maximum = data->hw.highest;
>          data->activity_window = 0;
> -        data->energy_perf = HWP_ENERGY_PERF_MAX_PERFORMANCE;
> +        data->energy_perf = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
>          data->desired = 0;
>          break;
>  
> @@ -613,7 +609,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
>          data->minimum = data->hw.lowest;
>          data->maximum = data->hw.highest;
>          data->activity_window = 0;
> -        data->energy_perf = HWP_ENERGY_PERF_BALANCE;
> +        data->energy_perf = CPPC_ENERGY_PERF_BALANCE;
>          data->desired = 0;
>          break;
>  
> diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
> index cad27f6811..d2a74d8315 100644
> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -83,6 +83,7 @@ struct cpufreq_policy {
>      int8_t              turbo;  /* tristate flag: 0 for unsupported
>                                   * -1 for disable, 1 for enabled
>                                   * See CPUFREQ_TURBO_* below for defines */
> +    unsigned int        policy;
>  };
>  DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);
>  
> @@ -264,6 +265,10 @@ void cpufreq_dbs_timer_resume(void);
>  
>  void intel_feature_detect(struct cpufreq_policy *policy);
>  
> +#define CPPC_ENERGY_PERF_MAX_PERFORMANCE 0
> +#define CPPC_ENERGY_PERF_BALANCE         0x80
> +#define CPPC_ENERGY_PERF_MAX_POWERSAVE   0xff

I guess this renaming / movement might better be a separate patch. The more
that the description here doesn't even mention, let alone justify, it.

> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -425,7 +425,7 @@ struct xen_set_cppc_para {
>  
>  #define XEN_HWP_DRIVER_NAME "hwp"
>  #define XEN_AMD_PSTATE_DRIVER_NAME "amd-pstate"
> -
> +#define XEN_AMD_PSTATE_EPP_DRIVER_NAME "amd-pstate-epp"
>  /*

Please don't lose blank lines like this.

Jan

