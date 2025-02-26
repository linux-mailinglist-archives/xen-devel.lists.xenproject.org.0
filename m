Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54477A466C4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 17:38:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897037.1305768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnKQW-0007mq-Ky; Wed, 26 Feb 2025 16:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897037.1305768; Wed, 26 Feb 2025 16:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnKQW-0007ji-HG; Wed, 26 Feb 2025 16:38:28 +0000
Received: by outflank-mailman (input) for mailman id 897037;
 Wed, 26 Feb 2025 16:38:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnKQU-0007jc-MO
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 16:38:26 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19839154-f460-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 17:38:25 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so4002377f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 08:38:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba52b925sm27341405e9.7.2025.02.26.08.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 08:38:24 -0800 (PST)
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
X-Inumbo-ID: 19839154-f460-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740587905; x=1741192705; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D9dVm6xQByd76ygKStTgXWQCeG08CTBFkRjU/glm9WI=;
        b=erOooPylgXEAfGGX0VHW6CVnFrw2CR2fRkY7s3uo5tA9PMRxPs/2x6D5FnyxK2cSKY
         Ckos5VfQixZ5d6AzKK2SUKNzt0c0Ezd3UUxx9BXIUJD4Vq5RhFPrcPXwB6t7aGeJslDH
         EBRRvggrZPhJtgyUhhmAS5UW8x0JaIvPVsiYw4F0K9m3IOUm9jzZc5rMFb1cGw6/Iv49
         CCYEeesnEr4EQKnkrEATX9Bjo1ShsO385bLw8pa2ARpV/CbnBDFVSDnpLQr4rAOtwAEN
         dI1jH/I5H0dz99rlmTZBYYNs8vhXmVNEGyOApH4LdAZ3vBacBskn0HCpqZQhc9KQWjH7
         YKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740587905; x=1741192705;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9dVm6xQByd76ygKStTgXWQCeG08CTBFkRjU/glm9WI=;
        b=qDdS2Q2tYbMF4I6+gijdE9HJwvWY+KXhmygxT5UMK+dw/8ofb+pk9hoWPZdR/tMV85
         8LD5kdMJLYxx/hH/ogd1UtLrr2iJc6MxKABFsZfZCsiSmgP0Dn8U7/4D9JionqMC+voV
         /xRQ76ixhQb8Rukc4DEhd5/o8W9ONiWvp3qfm1rfLK761QINUn7MTtxl85ZliU86LOBz
         WH1l6MDG5gO8YuAf0EUD90GDPwj+/u75JQ229O9JdKNOwZAswjUZXF6t5rgZC0q5EX9b
         DaDzOGqLp4r8bRz4sGt6HDIHO9HVLsKw8GZ3wZ+O4h2COSPfpl6D8OhcpekHCjXHgfeR
         5AUA==
X-Forwarded-Encrypted: i=1; AJvYcCWFaV96vib+R8Q/owHxlm7pCaWSl4SK5vPUDvxqh/MXLqePgxZmo75PCRnD57C/nWvmj8E+LknJ3YE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKMrWlv/BBoSpM6q1NZ8jFwcq9Z1t+Ug1Z11YWtr9C7yRPeiPb
	S4M+MryUH+0fRbgyap5UbztZHkUykoSaJfskyRU3j5VUd2DZYF9zNyu3ErMPwg==
X-Gm-Gg: ASbGncvEkgFANWXbmqjsFUo/4eh7Vzu7YpZ0c2K9QkRmVsCx18kDIJJN3BAxVKZ3WhV
	40KRCWS3sfXN2V/Y6uewmzO5FaqJEaQWyVqIPLNisGg1diF7+jRUKC2ICWHXIZIT39r1UnhnYdM
	6aNRkAwc3JDPq0kmG7l5/5Ixm/fgBb/LNyQ4HKdjHPDpZgZOWv65IV4JvxSmH57KLaNAnBlRPu6
	jeDM7BdLuEGLtch/apV3MzXHCp7iixPmySAuRwvtZjFTJap7SqIGQQjnm1b60yK0cUWmVVvGdM+
	/tqQTbn8tZ1rblSRTXhUXCRemvTDy05ho+nLjC87krgDfrhKj0N52AIE+hJNrbZW+j9UreHjhmc
	DDMIJoCUC3u4=
X-Google-Smtp-Source: AGHT+IG1wwJAwrMM9YnK21eYK1oidgCpOcMoQJAjHif2Pc5PCYZQ9ZyLCgcy4CKjHfXIbsw6Kl7SRg==
X-Received: by 2002:a5d:6d09:0:b0:38f:48ee:ddb1 with SMTP id ffacd0b85a97d-390cc605103mr7625886f8f.18.1740587904960;
        Wed, 26 Feb 2025 08:38:24 -0800 (PST)
Message-ID: <1f22aea3-cce8-4d41-bf10-deed01b0f390@suse.com>
Date: Wed, 26 Feb 2025 17:38:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Ray.Huang@amd.com, Jason.Andryuk@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-12-Penny.Zheng@amd.com>
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
In-Reply-To: <20250206083255.1296363-12-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2025 09:32, Penny Zheng wrote:
> @@ -533,6 +534,114 @@ static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
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
> +    uint8_t max_perf, min_perf, des_perf = 0;
> +    int epp = -1;
> +
> +    if ( data == NULL )
> +        return -ENOENT;
> +
> +    /* Validate all parameters - Disallow reserved bits. */
> +    if ( set_cppc->minimum > 255 || set_cppc->maximum > 255 ||
> +         set_cppc->desired > 255 || set_cppc->energy_perf > 255 )
> +        return -EINVAL;

In an earlier patch I just looked at you use UINT8_MAX for bounds checking.
I'm not overly fussed which of the two its is, but I'd like to ask for it
to be consistent throughout the driver. Unless of course there's a reason
for the difference.

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

"not supported" as in "support may appear later"? The -EOPNOTSUPP may be
more appropriate. Else the comment may want re-wording.

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
> +        min_perf = data->caps.lowest_perf;
> +        max_perf = data->caps.highest_perf;

These match ...

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

... these, which doesn't seem quite right. It feels like I had asked about this
on v1 already. If that's really intended, please add a clarifying comment to
the POWERSAVE block.

> +        epp = CPPC_ENERGY_PERF_BALANCE;
> +        break;
> +
> +    case XEN_SYSCTL_CPPC_SET_PRESET_NONE:
> +        min_perf = data->caps.lowest_nonlinear_perf;
> +        max_perf = data->caps.highest_perf;
> +        break;

Similarly I think the use of lowest_nonlinear_perf deserves a comment here.

> @@ -551,11 +660,17 @@ static const struct cpufreq_driver  __initconst_cf_clobber amd_cppc_epp_driver =
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
>      if ( !cpu_has_cppc )
>          return -ENODEV;
>  
> +    amd_cppc_in_use = true;

Isn't this permature? I.e. wouldn't you better do so only ...

>      if ( !opt_cpufreq_active )
>          return cpufreq_register_driver(&amd_cppc_cpufreq_driver);
>      else

... after successful driver registration?

Jan

