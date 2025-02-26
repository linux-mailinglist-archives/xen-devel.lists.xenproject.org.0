Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCFCA4667D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 17:24:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897010.1305746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnKBt-0004fg-2M; Wed, 26 Feb 2025 16:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897010.1305746; Wed, 26 Feb 2025 16:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnKBs-0004eE-Vj; Wed, 26 Feb 2025 16:23:20 +0000
Received: by outflank-mailman (input) for mailman id 897010;
 Wed, 26 Feb 2025 16:23:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnKBr-0004e6-MX
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 16:23:19 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcd2f984-f45d-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 17:23:18 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-439a4dec9d5so346415e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 08:23:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390dd708d50sm1863313f8f.91.2025.02.26.08.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 08:23:17 -0800 (PST)
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
X-Inumbo-ID: fcd2f984-f45d-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740586998; x=1741191798; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VIuZ4SitZuIpb5d7R7R/p+BJda862j5SXnshSbuLOyc=;
        b=B+XobuPXkRv+qocl8FYnnu/B8geAmZ19Tg7mVPxLNfvk4aMP7QCMHvoxjFcQPNpjQK
         bwdSmm7zHWMkc0COIxAjVD1qscmDdyftmzEq8cQJfBvbcDtxI2DqpXlOlfqFs7x2xbJC
         zfelDpUPxAyd+oqJTvlC8nCta1ZUALtnHL3ouJT0ilkpmZ+EbT0bg7eL47Hr3zUyOB3I
         QqF5ZHQy1a+QeW/L2ZoDaJS+X3a6eplPgqkGCsAWO+TDtYFehrB03K5n/S1ETP8SOTw9
         tSiK7noxCcrZSgpajJSnza39nOYRnOmHLby1IqFS05K+/k5LZtMR2YGPLZP9fRrfdqu+
         eVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740586998; x=1741191798;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIuZ4SitZuIpb5d7R7R/p+BJda862j5SXnshSbuLOyc=;
        b=MpWt7Wp844N31dcc5bw679wh3d8sIshNu8tn3+IFD+awzeVBc4sPg5dJP5CuuOgszx
         z/0wBTs2zVT6i2XI8K3PtuvOq+NC128fqpynwsYrZ9w4eHPN8ndRoUm5nyJNDiNXCME5
         LkvFcgwnSeKK3i+zPw+uheLt/f2gLIpCRiHe5EI0qbFaz7xLMYvdXmSWVxauGkt1A0r+
         +Ja7T88/e09+Y1wvc3wNJbHYiAm9W+U1S/U62uvMvTjVJNDCSSD0Oep1ZT3nfLqOmEZm
         Z8f8f/m+/IFINMpXdoWadCkrQSfyyMVefAqyQZdu8Z9+piG2kzpnCiIgcwGLyfW3XKXj
         vZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx0ufUD/XOFIrNDti5R5OWrfeytz6YJlqnTEC+FYcm78MvuEal5R5zGnbImhJ8CVYsSXlM/ugGsFw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbY7HdKwyYCo9reSrXSgzB10LbIrVRrCdGX4EIPSAgxtpzCkn3
	y/zYyX/kfsLfZjpOlszrRPOop3jqWJl09+rGmSuoJCiMwBFilpfbON+B6Z3BxQ==
X-Gm-Gg: ASbGnctitbw3mS8AFsKdU7ilCGcX0mMlrb2eljJBAzoOrYKePPSoHeLrJuWeGX5GTI9
	HItD+qJm7eqml6jXrKq01zDBbTSQ2c3t+fwTUmi5pMeNqFb234pvPZSMsUq0K7+CzmeJnxKr+CG
	iA/qVawPD91vESQf30mhYBx8eAzjbI/Vx+QGBSakvXuqz/jEuVabbrInov71K37gp6gNZfWmlNV
	sLRc3mmhfl9jJ72TlwD9Z9B13fuyN6OzvHXo/3SShfSJAljgPzEOA7vnF1FvCF4S/AD0UT5Ea8h
	UcMWv4Rr+EeX9Mnq90jA6lNNcKqXm08GMTei/xeRcANgWhagtdGhUk2RPGtu8p4u8VPWg8iZZOY
	4/0MAxXd3FSI=
X-Google-Smtp-Source: AGHT+IGvK3G4yEiyzk69VR6cKHtA+Xj/s4D1PIW8m33xJwjDyS0LtFiE3S604wnn7NmVCzHTRfOZxA==
X-Received: by 2002:a05:600c:a01:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-43ab0f6fd2amr100868215e9.30.1740586997772;
        Wed, 26 Feb 2025 08:23:17 -0800 (PST)
Message-ID: <7f63e00e-ee0a-41e4-9ece-a805b5986f25@suse.com>
Date: Wed, 26 Feb 2025 17:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] xen/x86: implement EPP support for the amd-cppc
 driver in active mode
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Ray.Huang@amd.com, Jason.Andryuk@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-10-Penny.Zheng@amd.com>
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
In-Reply-To: <20250206083255.1296363-10-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2025 09:32, Penny Zheng wrote:
> @@ -258,14 +259,27 @@ static void amd_cppc_write_request_msrs(void *info)
>  }
>  
>  static int cf_check amd_cppc_write_request(int cpu, uint8_t min_perf,
> -                                           uint8_t des_perf, uint8_t max_perf)
> +                                           uint8_t des_perf, uint8_t max_perf,
> +                                           int epp)
>  {
>      struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
>      uint64_t prev = data->req.raw;
>  
>      data->req.min_perf = min_perf;
>      data->req.max_perf = max_perf;
> -    data->req.des_perf = des_perf;
> +    if ( !opt_cpufreq_active )
> +        data->req.des_perf = des_perf;
> +    else
> +    {
> +        data->req.des_perf = 0;
> +        /* Get pre-defined BIOS value */
> +        if ( epp < 0 )
> +            data->req.epp = epp_init;

Instead of passing in a negative value, could't the caller pass epp_init,
allowing the function parameter to be of an unsigned type?

> @@ -292,7 +306,25 @@ static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
>          return res;
>  
>      return amd_cppc_write_request(policy->cpu, data->caps.lowest_nonlinear_perf,
> -                                  des_perf, data->caps.highest_perf);
> +                                  des_perf, data->caps.highest_perf, -1);
> +}
> +
> +static int read_epp_init_once(void)
> +{
> +    uint64_t val;
> +    static bool read_once = false;
> +
> +    if ( !read_once )
> +    {
> +        if ( rdmsr_safe(MSR_AMD_CPPC_REQ, val) )
> +            return -EINVAL;
> +        epp_init = (val >> 24) & 0xFF;
> +
> +        /* Read pre-defined BIOS value once */
> +        read_once = true;
> +    }
> +
> +    return 0;
>  }

And all processors are (silently) assumed to have been configured the same?

> @@ -381,7 +413,8 @@ static void cf_check amd_cppc_init_msrs(void *info)
>      data->nominal_freq = nominal_freq;
>      data->max_freq = max_freq;
>  
> -    return;
> +    if ( !read_epp_init_once() )
> +        return;

With this kind of a caller the function ought to return bool. If the function
returns an error code, it should not be lost here.

> @@ -443,6 +487,52 @@ static int cf_check amd_cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
>      return 0;
>  }
>  
> +static int cf_check amd_cppc_epp_cpu_init(struct cpufreq_policy *policy)
> +{
> +    int ret;
> +
> +    ret = amd_cppc_cpufreq_init_perf(policy);
> +    if ( ret )
> +        return ret;
> +
> +    policy->policy = cpufreq_parse_policy(policy->governor);
> +
> +    amd_cppc_verbose("CPU %u initialized with amd-cppc active mode\n", policy->cpu);
> +
> +    return 0;
> +}
> +
> +static int amd_cppc_epp_update_limit(const struct cpufreq_policy *policy)
> +{
> +    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, policy->cpu);
> +    uint8_t max_perf, min_perf, des_perf;
> +    int epp = -1;
> +
> +    /* Initial min/max values for CPPC Performance Controls Register */
> +    max_perf = data->caps.highest_perf;
> +    min_perf = data->caps.lowest_perf;
> +
> +    /* CPPC EPP feature require to set zero to the desire perf bit */
> +    des_perf = 0;

Then why the local variable? Can't you pass ...

> +    if ( policy->policy == CPUFREQ_POLICY_PERFORMANCE )
> +    {
> +        /* Force the epp value to be zero for performance policy */
> +        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
> +        min_perf = max_perf;
> +    }
> +    else if ( policy->policy == CPUFREQ_POLICY_POWERSAVE )
> +        /* Force the epp value to be 0xff for powersave policy */
> +        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
> +
> +    return amd_cppc_write_request(policy->cpu, min_perf, des_perf, max_perf, epp);

... 0 here (if need be with a /* des_perf */ comment)?

The line (nit) is too long anyway, and hence needs wrapping no matter what.

> @@ -452,10 +542,22 @@ static const struct cpufreq_driver __initconst_cf_clobber amd_cppc_cpufreq_drive
>      .exit   = amd_cppc_cpufreq_cpu_exit,
>  };
>  
> +static const struct cpufreq_driver  __initconst_cf_clobber amd_cppc_epp_driver =
> +{
> +    .name       = XEN_AMD_CPPC_EPP_DRIVER_NAME,
> +    .verify     = amd_cppc_cpufreq_verify,
> +    .setpolicy  = amd_cppc_epp_set_policy,
> +    .init       = amd_cppc_epp_cpu_init,
> +    .exit       = amd_cppc_cpufreq_cpu_exit,
> +};
> +
>  int __init amd_cppc_register_driver(void)
>  {
>      if ( !cpu_has_cppc )
>          return -ENODEV;
>  
> -    return cpufreq_register_driver(&amd_cppc_cpufreq_driver);
> +    if ( !opt_cpufreq_active )
> +        return cpufreq_register_driver(&amd_cppc_cpufreq_driver);
> +    else
> +        return cpufreq_register_driver(&amd_cppc_epp_driver);
>  }

I'm personally opposed to this style of coding, and you ...

> --- a/xen/drivers/cpufreq/utility.c
> +++ b/xen/drivers/cpufreq/utility.c
> @@ -484,3 +484,14 @@ int __cpufreq_set_policy(struct cpufreq_policy *data,
>  
>      return __cpufreq_governor(data, CPUFREQ_GOV_LIMITS);
>  }
> +
> +unsigned int cpufreq_parse_policy(const struct cpufreq_governor *gov)
> +{
> +    if ( !strncasecmp(gov->name, "performance", CPUFREQ_NAME_LEN) )
> +        return CPUFREQ_POLICY_PERFORMANCE;
> +
> +    if ( !strncasecmp(gov->name, "powersave", CPUFREQ_NAME_LEN) )
> +        return CPUFREQ_POLICY_POWERSAVE;
> +
> +    return CPUFREQ_POLICY_UNKNOWN;
> +}

... aren't doing that consistently anyway. May I ask that you drop the "else"
there, or perhaps switch to using a conditional operator?

> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -83,6 +83,7 @@ struct cpufreq_policy {
>      int8_t              turbo;  /* tristate flag: 0 for unsupported
>                                   * -1 for disable, 1 for enabled
>                                   * See CPUFREQ_TURBO_* below for defines */
> +    unsigned int        policy;

This new field wants connecting, by way of a comment perhaps, to ...

> @@ -133,6 +134,17 @@ extern int cpufreq_register_governor(struct cpufreq_governor *governor);
>  extern struct cpufreq_governor *__find_governor(const char *governor);
>  #define CPUFREQ_DEFAULT_GOVERNOR &cpufreq_gov_dbs
>  
> +#define CPUFREQ_POLICY_UNKNOWN      0
> +/*
> + * If cpufreq_driver->target() exists, the ->governor decides what frequency
> + * within the limits is used. If cpufreq_driver->setpolicy() exists, these
> + * two generic policies are available:
> + */
> +#define CPUFREQ_POLICY_POWERSAVE    1
> +#define CPUFREQ_POLICY_PERFORMANCE  2

... the values to be put there, which - yes - ...

> +unsigned int cpufreq_parse_policy(const struct cpufreq_governor *gov);

... are returned by this function. Such a comment could be as simple as
/* CPUFREQ_POLICY_* */

Jan

