Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEDCAA4F6B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 17:02:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973656.1361727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA8wV-0003WJ-0n; Wed, 30 Apr 2025 15:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973656.1361727; Wed, 30 Apr 2025 15:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA8wU-0003UF-UN; Wed, 30 Apr 2025 15:01:46 +0000
Received: by outflank-mailman (input) for mailman id 973656;
 Wed, 30 Apr 2025 15:01:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BSD2=XQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uA8wT-0003U4-8I
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 15:01:45 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 062efddd-25d4-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 17:01:41 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5e5e22e6ed2so11921725a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 08:01:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e4f8814sm951503066b.69.2025.04.30.08.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 08:01:38 -0700 (PDT)
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
X-Inumbo-ID: 062efddd-25d4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746025301; x=1746630101; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PtCad3HGP91hFCtMuVfO0UGJp2muK1CxZ/JyVbl3QwE=;
        b=Qrf+Kgefeb4kZ/sxJzGrMGICMy2yj2aNCAdcyMVq2/UxhldNSQHStBtqc42BnQhgOG
         yPuwE36SVbQcUGJuqAa7Ps+IsU5iJMNqYb8XCNMss9zM+bBESqxnmXA7Z/gD7LTjsCNQ
         W1Q1f5zD2Mg5UNSGzCa7xiPu7QMyKy0n7MA9o7EnVw7hvcgVCu9uzn/7XNhBy3Fk5YEn
         VmgJ9/U7EuKHdA7y16vKhb33Uze5Wb8szZrva0CYNJUR71U5Id4OBTx+CbPFU6dNX2fd
         noLQqpVNa6WEDx/QOiV6OJHu4RwVfzH9Gz68xytf6x+Zs9neRbyE8Xhc/pjIVD/dunZl
         w8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025301; x=1746630101;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtCad3HGP91hFCtMuVfO0UGJp2muK1CxZ/JyVbl3QwE=;
        b=Mtl2pYIm39/HgaVCja02rooK5iEUQ7P9gWmzl8hawJfe+c+tGXocaG/emFJEeX/wHn
         K5iRbVN+XkWE7Us6d7EJYSRlCl2eitlPkHJztmySQWkFTKhzlJLTO9AycoJ5q6EDqEnJ
         skT0qt/1FvLCyiZsUOmlXxYz5LFQzB9h3gXExRPdewt8CSpx/7eX9kQfSFnQxI7bxvBM
         QhPWbJFxX/Xdwu+McemmVw3gr79WuV32rEcUNKVH8c+PEWFQYgIL05T459BpWuvBGmOn
         88gR56RrVRZwNY4U8+Z3JgIlP20wgLQDfta0zGFSy2KCItSglFxtDBLibQEtEMHKMto5
         ZK6A==
X-Forwarded-Encrypted: i=1; AJvYcCUXrGDZi3UgTSq7V4nWgzi/H7pjF6CUsbvwtBFNZPj62w4Jrz4nevwr+MHMTnQysjLUJqzADgLaHLI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZGMps8D8h+b9OZCx6XKe2KI+bQWxBOJw2rz6KnbyqxcRj+u5Q
	es3rElynyEbcvBH+z9DjOGsWTJ+XxcTvfN1XCHRD8K1B6EPm53y0mehrUX1lKw==
X-Gm-Gg: ASbGncuyW/1WpkzWrZdBbcrPzldHPbARU2ys84dJPyZHXoACOMEof5tSumTDXZip2om
	7xjzSg4EPjyTJBE/dhS6bfmDxsLs3WKUUTxXag04bUq7m3pKvf0ldiojxFa5Pw0qcpce3V/Juxm
	YH+ox3Kf7pGoSn+I0FD7e0bJGr9+uxF0tmvq+ha9H6tpA0S0I2k6jpSdX3a/mq6tp/lfudjcbig
	8gsjJc3290HDkptympH9bqVmCd4tqSwGzyAp6MtZmeezhhcSmW8ln6sup0khWlZrWTLf/TWNUu/
	3jlx6WJn1fsXTBA0zgF/rMUGDfFdHK5NrxgHNdjDva3PF61XYVKNIW+zw90TZK0tkTCDkiz32Y5
	0WPLX9vI8nHVFhq+pfiHOYmdsfg==
X-Google-Smtp-Source: AGHT+IFT2WYfsLVIC0xCVTZj8m6NPDx964UCiSLM1hcile9pgXPvpdbhZXNXDCEdboqMNbv4jLpn0A==
X-Received: by 2002:a17:907:7b8e:b0:ac1:ea29:4e63 with SMTP id a640c23a62f3a-acedc627312mr359204466b.26.1746025298593;
        Wed, 30 Apr 2025 08:01:38 -0700 (PDT)
Message-ID: <239e1256-a47d-44e1-a335-2199b880f5d7@suse.com>
Date: Wed, 30 Apr 2025 17:01:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/15] xen/xenpm: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-16-Penny.Zheng@amd.com>
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
In-Reply-To: <20250414074056.3696888-16-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 09:40, Penny Zheng wrote:
> Introduce helper set_amd_cppc_para and get_amd_cppc_para to
> SET/GET CPPC-related para for amd-cppc/amd-cppc-epp driver.
> 
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
>  xen/arch/x86/acpi/cpufreq/amd-cppc.c | 121 +++++++++++++++++++++++++++
>  xen/drivers/acpi/pmstat.c            |  22 ++++-
>  xen/include/acpi/cpufreq/cpufreq.h   |   4 +
>  3 files changed, 143 insertions(+), 4 deletions(-)

Along the lines of the remark on an earlier patch: Where's the "xenpm"
change here, that the subject prefix kind of makes one expect? Doesn't
that want to be "cpufreq:" instead?

> --- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> @@ -540,6 +540,127 @@ static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
>      return 0;
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

What's the purpose of the field when you store literal 0 into it?

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

Where is what the latter half of the comment says?

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
> +    /*
> +     * Apply presets:
> +     * XEN_SYSCTL_CPPC_SET_DESIRED reflects whether desired perf is set, which
> +     * is also the flag to distiguish between passive mode and active mode.
> +     * When it is set, CPPC in passive mode, only
> +     * XEN_SYSCTL_CPPC_SET_PRESET_NONE could be chosen, where min_perf =
> +     * lowest_nonlinear_perf to ensures performance in P-state range.
> +     * when it is not set, CPPC in active mode, three different profile
> +     * XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE/PERFORMANCE/BALANCE are provided,
> +     * where min_perf = lowest_perf having T-state range of performance.
> +     */

I fear I'm struggling to parse some of this, making it difficult to suggest
possible adjustments (as I can't derive what is meant to be said). Plus where's
the term T-state coming from all of the sudden?

> +    switch ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_PRESET_MASK )
> +    {
> +    case XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE:
> +        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
> +            return -EINVAL;
> +        min_perf = data->caps.lowest_perf;
> +        /* Lower max frequency to nominal */
> +        max_perf = data->caps.nominal_perf;

This combination is still not really in line with ...

> +        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE:
> +        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
> +            return -EINVAL;
> +        /* Increase idle frequency to highest */
> +        min_perf = data->caps.highest_perf;
> +        max_perf = data->caps.highest_perf;

... this. If "performance" means "always highest", why would "powersave" not
mean "always lowest"?

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

As before: What's the significance of using the non-linear value here? I
asked to add comments for anything that's potentially unexpected to the
reader, but here there's still none.

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
> +
> +    amd_cppc_write_request(cpu, min_perf, des_perf, max_perf, epp);
> +    return 0;
> +}

Nit (as before): Blank line please ahead of the main "return" of a function.

> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -257,7 +257,18 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>           !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
>                    CPUFREQ_NAME_LEN) )
>          ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
> -    else
> +    else if ( !strncmp(op->u.get_para.scaling_driver,
> +                       XEN_AMD_CPPC_DRIVER_NAME,
> +                       CPUFREQ_NAME_LEN) ||
> +              !strncmp(op->u.get_para.scaling_driver,
> +                       XEN_AMD_CPPC_EPP_DRIVER_NAME,
> +                       CPUFREQ_NAME_LEN) )

How about using e.g. strstr(..., XEN_AMD_CPPC_DRIVER_NAME) here? (It's odd
anyway that we need to resort to string comparisons here.)

> +        ret = get_amd_cppc_para(policy->cpu, &op->u.get_para.u.cppc_para);
> +
> +    if ( strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
> +                 CPUFREQ_NAME_LEN) &&
> +         strncmp(op->u.get_para.scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME,
> +                 CPUFREQ_NAME_LEN) )
>      {
>          if ( !(scaling_available_governors =
>                 xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )

Isn't it the non-EPP driver which is governor-independent?

Jan

