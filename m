Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC76A6EE32
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 11:49:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926280.1329151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx1qB-0002Gk-GP; Tue, 25 Mar 2025 10:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926280.1329151; Tue, 25 Mar 2025 10:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx1qB-0002E4-D5; Tue, 25 Mar 2025 10:49:03 +0000
Received: by outflank-mailman (input) for mailman id 926280;
 Tue, 25 Mar 2025 10:49:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tx1q9-0002Dy-Vm
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 10:49:01 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c11e2818-0966-11f0-9ffa-bf95429c2676;
 Tue, 25 Mar 2025 11:48:58 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so49407175e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 03:48:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f43e50sm195729745e9.12.2025.03.25.03.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 03:48:56 -0700 (PDT)
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
X-Inumbo-ID: c11e2818-0966-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742899737; x=1743504537; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wc4yHwGBNEnzgbC+X38F/I/8kU1nqBxaoqffvRToHog=;
        b=QpzWlvT87kTIWcPqeCNalrB3Rfx6OHKLgNayDTAtmH3j/cBpPbbwzmgGvnQI8Dj1Z8
         UcXBjYMe+odQ0Fc7STMFnReQ7Ms5GM7clhGj0ba0k2YkaIdvELRpFoy5XHY6fjUlNJCa
         CkwVX83nhSj4VRVzMcw/Nx19dUZIbWGmepOjIgo4kx5o7J3OR/srJw7cm1kQrxneuBEZ
         mErFYO90SNw12Q7qlSFW9QKKH1lBrpV3MW93KiKHC0L7cc1/0tNgL0ZC4DBi2/h4bD5t
         SQ1H0O4JVZe1mNeVoKEUPVLy67ANV/PrH8z0e90SHHt8zRJ23d/ysADlJL1FTgSwdUem
         Ihuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742899737; x=1743504537;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wc4yHwGBNEnzgbC+X38F/I/8kU1nqBxaoqffvRToHog=;
        b=CYbUjedzG56TKAp5Ks7012s9zwRsRAR0T16OG55VXKwmHq/ABSRgIiymukHbUeqd2z
         VMv3N531LxKy+fzzGSytDARp4v7WGnWKkDKpzzFFRfG4Duz2RfFmYet3z8/85H2ZH26F
         SqguSyq4MTBJI7+I+neFap/x6Sjl8uhgPdVvqG/o1evWvGbCp+4nB1dHv9IIa1KynqXj
         7C10Ms5mggF1tkS5CGl/B3S5NImk8eyjrM3HDqmrbLpZP70vVAKtSdXwYu/rOog8ArPJ
         NvPSBvEuXMMm8nXqhGGSJK8FWW/ueAfczpL2Ms3e61rE/N+j9i+e0vq+VREcMWWP0urd
         rrPw==
X-Forwarded-Encrypted: i=1; AJvYcCXyYLJ62fcTcM/ys0xhzcthSq2vhGn22Seu7fhotGQkgosM7vT82nZHCpsmDZLSSHI1ln0Q8k7gVeU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrFMbv/W6CNjNJCq3WEORWwVhl6WQV0VmGRZDbohPpsMtrrZ+O
	f26w2larhsKTPKADERpFC3tYDg7iD4+o5D8oOgVQ1fCGhrCfjylKwgdAcpMdLg==
X-Gm-Gg: ASbGncs1ObmmHoQ/LNf4dgCjL035tkaSo//COzaBpESpABHew9B0jh3BTQ9VpvwUjo3
	LeqaJniPv3V4idKoIFaRmkBMy7iEeg5dCp7hiQIvcfzZoXBShHnuXTVUIM8ZSEBpXS4Exsz9+2O
	RUD/vxxQxTaEkJnzgy4VYO6fGdejFKrG0jmz10fTceQi1iYKaEJbGVKV1MzrovgYWIzudGOLCt+
	r4Wthk1zGKCKgLG4uLbOv66mJxdg184U92R47e1sdFxg4n0aOR3rsI0mcWgb9vXpCUsTHzSty6b
	JrQaAPKsEZlsJGx+LGmNe7qYbjLm0aVOuVl1U+S3muEEq2rc/k3ZVxiXBaYoYLLWGfqZSTq7oAt
	BkYIQ9Iw2lXaaT6g4yTgcSOPIq1+RIQ==
X-Google-Smtp-Source: AGHT+IHHXYaJZjPT25SuIsOojRNsG6sGc9JukfqEoU/QG7deiuIqh7jUYWawe8UKabtXqKRCHm6oMQ==
X-Received: by 2002:a05:6000:18ab:b0:39a:c6c4:f877 with SMTP id ffacd0b85a97d-39ac6c4fad7mr3679964f8f.20.1742899737329;
        Tue, 25 Mar 2025 03:48:57 -0700 (PDT)
Message-ID: <6bcd0903-7406-4105-b471-85b5eb0bccc0@suse.com>
Date: Tue, 25 Mar 2025 11:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/15] xen/x86: implement EPP support for the amd-cppc
 driver in active mode
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-13-Penny.Zheng@amd.com>
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
In-Reply-To: <20250306083949.1503385-13-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 09:39, Penny Zheng wrote:
> amd-cppc has 2 operation modes: autonomous (active) mode,
> non-autonomous (passive) mode.
> In active mode, platform ignores the requestd done in the Desired
> Performance Target register and takes into account only the values
> set to the minimum, maximum and energy performance preference(EPP)
> registers.
> The EPP is used in the CCLK DPM controller to drive the frequency
> that a core is going to operate during short periods of activity.
> The SOC EPP targets are configured on a scale from 0 to 255 where 0
> represents maximum performance and 255 represents maximum efficiency.

So this is the other way around from "perf" values, where aiui 0xff is
"highest"?

> @@ -537,6 +537,12 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
>  * `amd-cppc` selects ACPI Collaborative Performance and Power Control (CPPC)
>    on supported AMD hardware to provide finer grained frequency control
>    mechanism. The default is disabled.
> +* `active` is to enable amd-cppc driver in active(autonomous) mode. In this
> +  mode, users could write to energy performance preference register to tell
> +  hardware if they want to bias toward performance or energy efficiency. Then
> +  built-in CPPC power algorithm will calculate the runtime workload and adjust
> +  the realtime cores frequency automatically according to the power supply and

What are "the realtime cores"?

> +  thermal, core voltage and some other hardware conditions.

I think there better would be only one "and" in the enumeration of conditions.

> @@ -261,7 +276,20 @@ static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
>          return res;
>  
>      return amd_cppc_write_request(policy->cpu, data->caps.lowest_nonlinear_perf,
> -                                  des_perf, data->caps.highest_perf);
> +                                  des_perf, data->caps.highest_perf,
> +                                  /* Pre-defined BIOS value for passive mode */
> +                                  per_cpu(epp_init, policy->cpu));
> +}
> +
> +static int read_epp_init(void)
> +{
> +    uint64_t val;
> +
> +    if ( rdmsr_safe(MSR_AMD_CPPC_REQ, val) )
> +        return -EINVAL;

I'm unconvinced of using rdmsr_safe() everywhere (i.e. this also goes for earlier
patches). Unless you can give a halfway reasonable scenario under which by the
time we get here there's still a chance that the MSR isn't implemented in the
next lower layer (hardware or another hypervisor, just to explain what's meant,
without me assuming that the driver should come into play in the first place when
we run virtualized ourselves).

Furthermore you call this function unconditionally, i.e. if there was a chance
for the MSR read to fail, CPU init would needlessly fail when in passive mode.

> +    this_cpu(epp_init) = (val >> 24) & 0xFF;

Please can you #define a suitable mask constant in msr-index.h, such that you can
use MASK_EXTR() here?

> @@ -411,12 +441,78 @@ static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
>  
>      amd_cppc_boost_init(policy, data);
>  
> +    return 0;
> +}
> +
> +static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
> +{
> +    int ret;
> +
> +    ret = amd_cppc_cpufreq_init_perf(policy);
> +    if ( ret )
> +        return ret;
> +
>      amd_cppc_verbose("CPU %u initialized with amd-cppc passive mode\n",
>                       policy->cpu);
>  
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
> +    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data,
> +                                                    policy->cpu);

Nit: Indentation is off by one here.

> +    uint8_t max_perf, min_perf, epp;
> +
> +    /* Initial min/max values for CPPC Performance Controls Register */
> +    /*
> +     * Continuous CPPC performance scale in active mode is [lowest_perf,
> +     * highest_perf]
> +     */
> +    max_perf = data->caps.highest_perf;
> +    min_perf = data->caps.lowest_perf;
> +
> +    epp = per_cpu(epp_init, policy->cpu);
> +    if ( policy->policy == CPUFREQ_POLICY_PERFORMANCE )

This may want to be switch() instead.

> +    {
> +        /* Force the epp value to be zero for performance policy */
> +        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
> +        min_perf = max_perf;
> +    }
> +    else if ( policy->policy == CPUFREQ_POLICY_POWERSAVE )
> +        /* Force the epp value to be 0xff for powersave policy */
> +        /*
> +         * If set max_perf = min_perf = lowest_perf, we are putting
> +         * cpu cores in idle.
> +         */

Nit: Such two successive comments want combining. (Same near the top of the
function, as I notice only now.)

Furthermore I'm in trouble with interpreting this comment: To me "lowest"
doesn't mean "doing nothing" but "doing things as efficiently in terms of
power use as possible". IOW that's not idle. Yet the comment reads as if it
was meant to be an explanation of why we can't set max_perf from min_perf
here. That is, not matter what's meant to be said, I think this needs re-
wording (and possibly using subjunctive mood).

> +        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
> +
> +    return amd_cppc_write_request(policy->cpu, min_perf,
> +                                  /* des_perf = 0 for epp mode */
> +                                  0,

The comment could do with putting on the same line as the 0, e.g.
(slightly adjusted)

    return amd_cppc_write_request(policy->cpu, min_perf,
                                  0 /* no des_perf for epp mode */,
                                  max_perf, epp);

> +static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
> +{
> +    return amd_cppc_epp_update_limit(policy);
> +}

So the purpose of this wrapper is solely to have the actual function's
parameter be pointer-to-const? I don't think that's worth it; I also don't
think we do such elsewhere.

> --- a/xen/drivers/cpufreq/utility.c
> +++ b/xen/drivers/cpufreq/utility.c
> @@ -491,3 +491,14 @@ int __cpufreq_set_policy(struct cpufreq_policy *data,
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

Hmm, this isn't really parsing (in the sense of dealing with e.g. command
line elements). Maybe cpufreq_get_policy() or, more explicitly,
cpufreq_policy_from_governor()? Or something along these lines?

I also don't see why the more expensive case-insensitive comparison
routine needs using here.

Jan

