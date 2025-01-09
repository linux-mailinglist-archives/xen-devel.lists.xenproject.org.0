Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 731CAA07511
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 12:50:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868275.1279810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVr2Y-0003fD-9K; Thu, 09 Jan 2025 11:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868275.1279810; Thu, 09 Jan 2025 11:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVr2Y-0003cl-5y; Thu, 09 Jan 2025 11:49:30 +0000
Received: by outflank-mailman (input) for mailman id 868275;
 Thu, 09 Jan 2025 11:49:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVr2W-0003cd-4N
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 11:49:28 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6973af8-ce7f-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 12:49:26 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso6365355e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 03:49:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b83a1sm1617796f8f.75.2025.01.09.03.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 03:49:25 -0800 (PST)
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
X-Inumbo-ID: c6973af8-ce7f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736423365; x=1737028165; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BqTijWzRaoMl6tj6ci7unJZZa7zJZ5zmJ32h6eYii7M=;
        b=NIssC0cTJC2zcQfzJB26jdtGSSptrQHcLxs+7Tg3CwpmwH84WVn7DmKCiYNrstTwvh
         WtqMVDNAqWanEtGD/AI4YUbnHu4kmQMU2pPqpRlQ/vNBl8F1ri01ohvDk7Zdrelyh88s
         C3tlZMX3OGe15SMJvwkUpZlZzlrtpRL9wZ8NSlol0VGElvpYZxtLKWKeiX98eFnKYcpA
         JfExSUNZ57Vf06UE72VJ9QRrdLd+uQ3ZO3GDQYsQU5SZR9hi9G6CkS2N+n7lu/5kmibt
         0MEliDwkrwiklFpYBqyjhK5ev6PaPQuM9N1j4ZA40UuEAKS+N7OKFgOqJbCKkU+YzVy5
         8Nlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736423365; x=1737028165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqTijWzRaoMl6tj6ci7unJZZa7zJZ5zmJ32h6eYii7M=;
        b=DCEy/OOdcKYF2hrWfgI0EVkb/PzQx+avDSPXAB8Tqqidjm7/+ttKc4DkN5eIeSWXWY
         3xh5gqLxh1i2tu3QKnNjdiUUPS2eTnOOCwd7gf3BCej6yFyllznQu/4P6NF9eXCvKoGq
         MRavO3lBASVxVlMTyayTiKrc3VheTItrlFLfkIErmhAGvTuGuh8Xmf5WKxNqSMsviERp
         52Q2iuA1EP5XxhUKqoiAdvojmFm24tnTmjTA/dxg5til94KJSINgpIadGwj03YghDafD
         gpjRKq4KSoP9b/ZrDiED6lhjUHH/m0XkbPgK4STsuBFLygwBwDggvwrXByn0hM1beZj3
         btTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWiTNLtv64JDJCBNfMLNg1hEPzKEHjE5EW5g/Jda7gd35nWcAoZeV4r5hsCrXIY5+9rat4k1eJ6wo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUVeUeKO+NYRs/RPOlqVd16Ix83HkTQpn/jOjljBVzhw1cjttH
	KvZ/dIBjLB8bGPNRTVaMqrYBQwutccM05yOKRzMPESdPqb4OVvbXU3MZ8buIwQ==
X-Gm-Gg: ASbGncuxU/37Cd+yckdYVSuDhGCC7hs0KpgR+dVlbd4x8ieO9bg65d+v8KxrmimNItz
	hU+K1OsHK47IGBEb0O4zJoG9NoARLYteBpMo/h7fRmLCcO6WFqfAPly3G/pmAEdbm3YrbCjCrca
	WxXBwlFlD1dN1Miclx9j3r4v6LCz3JixTMOYAWuyRpfE99l1DKq2MQZBPn/M11Pl3HEBjUKF+ZJ
	sNf60ZPzHVlc8RGZWJvjJqN9l9766XdZCcBJd0lNI6rjDfh01ma4gnjSYjbots2DVciEqDlUCNd
	8xW0fKVv9R5zM5PLJTiljcYnt4BCBdCOZJDuVc+Bpg==
X-Google-Smtp-Source: AGHT+IEiypxfvEM3ZJrIkD+ueEFB3nXJ0wpatHPDvgxCa1bPdM34RaPV4malYUTA65QbetPKj4Jpbg==
X-Received: by 2002:a05:600c:1c1a:b0:434:f2f4:4c07 with SMTP id 5b1f17b1804b1-436e26bd126mr62689665e9.15.1736423365421;
        Thu, 09 Jan 2025 03:49:25 -0800 (PST)
Message-ID: <66beb3b1-5d67-4d1f-beb0-3429f387c2fb@suse.com>
Date: Thu, 9 Jan 2025 12:49:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/11] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-pstate driver
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: stefano.stabellini@amd.com, Ray.Huang@amd.com, Xenia.Ragiadakou@amd.com,
 Jason.Andryuk@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241203083535.463533-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20241203083535.463533-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2024 09:35, Penny Zheng wrote:
> @@ -489,6 +491,117 @@ static int cf_check amd_pstate_epp_set_policy(struct cpufreq_policy *policy)
>      return amd_pstate_epp_update_limit(policy);
>  }
>  
> +int get_amd_cppc_para(unsigned int cpu,
> +                      struct xen_cppc_para *cppc_para)
> +{
> +    struct amd_pstate_drv_data *data = per_cpu(amd_pstate_drv_data, cpu);
> +
> +    if ( data == NULL )
> +        return -ENODATA;
> +
> +    cppc_para->features         = 0;
> +    cppc_para->lowest           = data->hw.lowest_perf;
> +    cppc_para->lowest_nonlinear = data->hw.lowest_nonlinear_perf;
> +    cppc_para->nominal          = data->hw.nominal_perf;
> +    cppc_para->highest          = data->hw.highest_perf;
> +    cppc_para->minimum          = data->req.min_perf;
> +    cppc_para->maximum          = data->req.max_perf;
> +    cppc_para->desired          = data->req.des_perf;
> +    cppc_para->energy_perf      = data->req.epp;
> +
> +    return 0;
> +}
> +
> +int set_amd_cppc_para(struct cpufreq_policy *policy,
> +                      struct xen_set_cppc_para *set_cppc)
> +{
> +    unsigned int cpu = policy->cpu;
> +    struct amd_pstate_drv_data *data = per_cpu(amd_pstate_drv_data, cpu);
> +    uint8_t max_perf, min_perf, des_perf;
> +    int epp = -1;
> +
> +    if ( data == NULL )
> +        return -ENOENT;
> +
> +    /* Validate all parameters - Disallow reserved bits. */
> +    if ( set_cppc->minimum > 255 || set_cppc->maximum > 255 ||
> +         set_cppc->desired > 255 || set_cppc->energy_perf > 255 )
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
> +    /* Activity window not supported */
> +    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW )
> +        return -EINVAL;
> +
> +    /* Return if there is nothing to do. */
> +    if ( set_cppc->set_params == 0 )
> +        return 0;
> +
> +    /* Apply presets */
> +    switch ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_PRESET_MASK )
> +    {
> +    case XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE:
> +        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
> +            return -EINVAL;
> +        min_perf = data->hw.lowest_perf;
> +        max_perf = data->hw.highest_perf;

These are the same as ...

> +        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
> +        des_perf = 0;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE:
> +        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
> +            return -EINVAL;
> +        min_perf = data->hw.highest_perf;
> +        max_perf = data->hw.highest_perf;
> +        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
> +        des_perf = 0;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_BALANCE:
> +        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
> +            return -EINVAL;
> +        min_perf = data->hw.lowest_perf;
> +        max_perf = data->hw.highest_perf;

... these, despite the presets being quite different - why?

> +        epp = CPPC_ENERGY_PERF_BALANCE;
> +        des_perf = 0;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_NONE:
> +        min_perf = data->hw.lowest_nonlinear_perf;
> +        max_perf = data->hw.highest_perf;
> +        break;

Rather than setting des_perf to 0 everywhere except here (thus leaving it
potentially uninitialized), better give the variable an initializer of 0?

> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -198,6 +198,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>      char     *scaling_available_governors;
>      struct list_head *pos;
>      uint32_t cpu, i, j = 0;
> +    bool hw_auto = false;
>  
>      pmpt = processor_pminfo[op->cpuid];
>      policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
> @@ -258,7 +259,19 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>           !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
>                    CPUFREQ_NAME_LEN) )
>          ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
> -    else
> +    else if ( !strncmp(op->u.get_para.scaling_driver, XEN_AMD_PSTATE_DRIVER_NAME,
> +                       CPUFREQ_NAME_LEN) ||
> +              !strncmp(op->u.get_para.scaling_driver, XEN_AMD_PSTATE_EPP_DRIVER_NAME,
> +                       CPUFREQ_NAME_LEN) )
> +        ret = get_amd_cppc_para(policy->cpu, &op->u.get_para.u.cppc_para);

Like if is here, ...

> +    if ( !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
> +                 CPUFREQ_NAME_LEN) ||
> +         !strncmp(op->u.get_para.scaling_driver, XEN_AMD_PSTATE_EPP_DRIVER_NAME,
> +                 CPUFREQ_NAME_LEN) )
> +        hw_auto = true;
> +
> +    if ( !hw_auto )

... why not use the strncmp()s directly in the if()?

Jan

