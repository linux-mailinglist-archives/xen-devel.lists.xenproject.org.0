Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 154A9A70781
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 17:59:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926755.1329589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx7cX-0005Mu-8e; Tue, 25 Mar 2025 16:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926755.1329589; Tue, 25 Mar 2025 16:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx7cX-0005LS-5l; Tue, 25 Mar 2025 16:59:21 +0000
Received: by outflank-mailman (input) for mailman id 926755;
 Tue, 25 Mar 2025 16:59:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tx7cV-0005LM-UA
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 16:59:19 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dad4c6d-099a-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 17:59:18 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso40692005e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 09:59:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f43ecbsm204785705e9.10.2025.03.25.09.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 09:59:17 -0700 (PDT)
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
X-Inumbo-ID: 7dad4c6d-099a-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742921958; x=1743526758; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FVkMY9t4X8uuqmCFVO+znnnCLkEsUIYHJwu1DhgFM88=;
        b=VF3B4cYaWzQBrJRYm/Yc9sPBrMM9o3Q0nMzEHGX3xj2aPpvOrhJqHhc8ZNGXs10YnJ
         T21GoqJxfQphFLBG5ciDafYQ4V0qT5rSylXEXo1XMqZlCshILyjsiBJ8AS9im38JWcy4
         GzGN7/qY6pny98uz7XACRGcHsQwNIcPHyjqhEshJhiXx28nSoTE+oY+MV/p4euQ2+mDQ
         +DXPEfy1QdU0qokCWwp579GZMsMhEPGFKewE/MPsjl01xVnuinKI92QAT/LyWGAZxgzB
         IT88wMz9gyzWiSkf0T7HPYekuynzFGx0hm8FvUnO5uEOYBscG20KXZlp8o8qUKxpP53h
         4VkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742921958; x=1743526758;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVkMY9t4X8uuqmCFVO+znnnCLkEsUIYHJwu1DhgFM88=;
        b=JWuJGvihVvmRDO8unShqTMy8czxw798pMmfuWttqD+ZIILQSRb5KeOZ4sUDfGd0VQ9
         BDL1iciUTdwDEXFixHF0MTuTrA3WpBucHt9WCnFpvGxlXvlAyWT+3OIEaGVrpTdyyfkR
         2xPCr0tv5UeT4W4nk6W1Rux11UVUfFyespvNf2WcSa3p7kBHBYOEKg5eierYOQQaFc6k
         ToFvyNqJeH9rHppOBXEqiRWk3mZajsBCOqoury+k+KVHNypvgmpe7CVi5MUD6lYPnGkj
         CqzL2J6hSvARzAGewwUDgddVphe3wKQ56DqrZjWI8tFRi4d2Ja/QrGTMYQcfEDP3pf6n
         xQQw==
X-Forwarded-Encrypted: i=1; AJvYcCU3aWYQZBxPxop9nNFySCNDL9qAws93o3UkWzmWQc4zYCQBGGfP0+kIe8V8z2pwqzGoag544ldElSE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxN2yYnbeQNdb0+92X1vgdAy1brKTvUC+AO2hq1U8wiavjtjCV2
	CPUmcy5DOWAePNv404fkC8EQX6Ts+a7+N6Mp4yMf7y4+B9VCruTqG15O4EVEHw==
X-Gm-Gg: ASbGncthgE1RXgEbhvNLV2tAIQLJHxXcaPsd8R6QrxFUYgt/xNxFKJ8ILwA4E5JzXXB
	H0X5/xPX680Qkp+lblXBjJMzvdFya9jjxVbn3rDY0CxiaVouoBWhVKaHJ5zjj/8xsa0So7wjg4D
	IzNtnHW81oAoIcX2PQFWXMCGE9EpBhhHqRLJV7Eu73fTM75Orhm6dkQVkYVLna952JF/9GGKrh9
	3gp42jTnwaS09Z1Fjmz7iOtYy6v4+gofyHmvpicFdZLD5f2fbU372O0LwA1CiQrACsVX9Qb65Zy
	zoaTMnAB9OdO1rBJxOrmLkAMGdxZo9DeoUNvHYqXC4TtSlVwBZzaRqqsAnbiepkVytMCkAOaisH
	LAzAW/NT/D03U+9LVKsZMfS2oSaTKZA==
X-Google-Smtp-Source: AGHT+IGv3XGNVMFgbVufmMsbuvCFGnsvcm5rXevQfCtNHQOt9uvyD590aXLiDNDjqdwPfnypgzaL6w==
X-Received: by 2002:a05:600c:1ca4:b0:43d:b3:fb1 with SMTP id 5b1f17b1804b1-43d50a3c12amr125783195e9.27.1742921958042;
        Tue, 25 Mar 2025 09:59:18 -0700 (PDT)
Message-ID: <85d2bde5-b078-4c04-87e6-263b3e218cf9@suse.com>
Date: Tue, 25 Mar 2025 17:59:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/15] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-16-Penny.Zheng@amd.com>
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
In-Reply-To: <20250306083949.1503385-16-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 09:39, Penny Zheng wrote:
> Introduce helper set_amd_cppc_para and get_amd_cppc_para to
> SET/GET CPPC-related para for amd-cppc/amd-cppc-epp driver.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - Give the variable des_perf an initializer of 0
> - Use the strncmp()s directly in the if()
> ---
>  xen/arch/x86/acpi/cpufreq/amd-cppc.c | 124 +++++++++++++++++++++++++++
>  xen/drivers/acpi/pmstat.c            |  20 ++++-
>  xen/include/acpi/cpufreq/cpufreq.h   |   5 ++
>  3 files changed, 145 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> index 606bb648b3..28c13b09c8 100644
> --- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> @@ -32,6 +32,7 @@
>  
>  static bool __ro_after_init opt_active_mode;
>  static DEFINE_PER_CPU_READ_MOSTLY(uint8_t, epp_init);
> +static bool __ro_after_init amd_cppc_in_use;
>  
>  struct amd_cppc_drv_data
>  {
> @@ -513,6 +514,123 @@ static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
>      return amd_cppc_epp_update_limit(policy);
>  }
>  
> +int get_amd_cppc_para(unsigned int cpu,
> +                      struct xen_cppc_para *cppc_para)
> +{
> +    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
> +
> +    if ( data == NULL )
> +        return -ENODATA;
> +
> +    cppc_para->features         = 0;
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
> +int set_amd_cppc_para(const struct cpufreq_policy *policy,
> +                      const struct xen_set_cppc_para *set_cppc)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
> +    uint8_t max_perf, min_perf, des_perf = 0, epp;
> +
> +    if ( data == NULL )
> +        return -ENOENT;
> +
> +    /* Validate all parameters - Disallow reserved bits. */
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
> +
> +    /* Activity window not supported in MSR */
> +    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW )
> +        return -EOPNOTSUPP;
> +
> +    /* Return if there is nothing to do. */
> +    if ( set_cppc->set_params == 0 )
> +        return 0;
> +
> +    epp = per_cpu(epp_init, cpu);
> +    /* Apply presets */
> +    /*
> +     * XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE/PERFORMANCE/BALANCE are
> +     * for amd-cppc in active mode, min_perf could be set with lowest_perf
> +     * representing the T-state range of performance levels, while
> +     * XEN_SYSCTL_CPPC_SET_PRESET_NONE is for amd-cppc in passive mode, it
> +     * depends on governor to do performance scaling, setting with
> +     * lowest_nonlinear_perf to ensures performance in P-state range.
> +     */

Nit: There are again two consecutive comments here.

The active / passive mode distinction mentioned in the comment isn't
reflected anywhere in the code. It's the XEN_SYSCTL_CPPC_SET_DESIRED
which distinguishes them, yet that flag isn't mentioned in the comment.

> +    switch ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_PRESET_MASK )
> +    {
> +    case XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE:
> +        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
> +            return -EINVAL;
> +        min_perf = data->caps.lowest_perf;
> +        max_perf = data->caps.highest_perf;

These are still not not both ".lowest_perf", and I still don't understand
- due to the lack of a comment - why that is.

> +        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE:
> +        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
> +            return -EINVAL;
> +        min_perf = data->caps.highest_perf;
> +        max_perf = data->caps.highest_perf;
> +        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_BALANCE:
> +        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
> +            return -EINVAL;
> +        min_perf = data->caps.lowest_perf;
> +        max_perf = data->caps.highest_perf;
> +        epp = CPPC_ENERGY_PERF_BALANCE;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_NONE:
> +        min_perf = data->caps.lowest_nonlinear_perf;
> +        max_perf = data->caps.highest_perf;
> +        break;
> +
> +    default:
> +        return -EINVAL;
> +    }
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

Considering these I even less understand what the comment further up is
about.

> +    return amd_cppc_write_request(cpu, min_perf, des_perf, max_perf, epp);
> +}
> +
> +

Nit (not for the first time, I think): No double blank lines please.

> @@ -533,6 +651,11 @@ amd_cppc_epp_driver =
>      .exit       = amd_cppc_cpufreq_cpu_exit,
>  };
>  
> +bool amd_cppc_active(void)
> +{
> +    return amd_cppc_in_use;
> +}
> +
>  int __init amd_cppc_register_driver(void)
>  {
>      int ret;
> @@ -552,6 +675,7 @@ int __init amd_cppc_register_driver(void)
>  
>      /* Remove possible fallback option */
>      xen_processor_pmbits &= ~XEN_PROCESSOR_PM_PX;
> +    amd_cppc_in_use = true;

Is this separate flag really needed? Can't you go from xen_processor_pmbits?

> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -261,7 +261,16 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>           !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
>                    CPUFREQ_NAME_LEN) )
>          ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
> -    else
> +    else if ( !strncmp(op->u.get_para.scaling_driver, XEN_AMD_CPPC_DRIVER_NAME,
> +                       CPUFREQ_NAME_LEN) ||
> +              !strncmp(op->u.get_para.scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME,

Overlong line again.

Jan

