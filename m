Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7B9B08E5E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 15:36:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046905.1417304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOmG-0007Mw-K3; Thu, 17 Jul 2025 13:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046905.1417304; Thu, 17 Jul 2025 13:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOmG-0007KP-Go; Thu, 17 Jul 2025 13:36:00 +0000
Received: by outflank-mailman (input) for mailman id 1046905;
 Thu, 17 Jul 2025 13:35:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucOmF-0007KJ-Bn
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 13:35:59 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8037901-6312-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 15:35:57 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so737383f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 06:35:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31caf7e8984sm1570191a91.23.2025.07.17.06.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 06:35:54 -0700 (PDT)
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
X-Inumbo-ID: f8037901-6312-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752759356; x=1753364156; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e5lSuzlGnalG5cLFrCoxzDU8Kpt81zzps6eBTogKWTY=;
        b=gl8whRs4WQg5qQaM0v7l3bj9QzDq73E0eRnaTwtuZBzD31TZW+iq1xhuq5a/oWgeYS
         k1OA8HBC8XmpOMIE0EPg8kCOqmfsQY41ygwaIDfOpcayC5v9GWTjGLek25AInO/lEABF
         DrNznIIyqcw5q7sPHi2RaeBUBsCqnp1fetS6hBhL+4SOymDugmnwFZrsSdHwGJyxNbC0
         NyskTfqN0bEB/6CeZV3VQNBtAZK4UYyEdMmOOY9LeYqjjB6UQC11Egideb00a8tgLVnE
         c1ZtmfaB8gqEtjr/TG6rhFlAuhGlkYiwJvWkg3tXei0EZD9pAZGXv7i0gv1O5VIrkxoV
         czpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752759356; x=1753364156;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5lSuzlGnalG5cLFrCoxzDU8Kpt81zzps6eBTogKWTY=;
        b=j6OdAIu57M31G0JQn1RfeG2JK8hahI6Ev+etq30rrorD65zgpmvWCGiwzmb14NFahC
         EJema0ofkMY3z3v0jK0bcfpSUlq2I35qmmvLpxONB4psRtDKbVqoWODYgTK+Xm+Gkq/h
         3dwXzVW8gjE/ZjOi5GJV2vp/nrfVxT8dAo/iEN5BVvoJjYPA4/tkb2o78jTO3TeRaBQB
         hYnOTpMhCxxLFN/Kr8nwMtVFZttQJWxzkbJbwVduCogvOghjven/ZW3xZyMKenZztDFL
         GPTnayPqcJPEY2E7LHK/h329X5A/b9OlWbzdOYwgJNn0QBHofjdZuDX4lB0nqCLgMThb
         Rhqg==
X-Forwarded-Encrypted: i=1; AJvYcCW4v7hhKICsj/1gRrwMCgxL4D1XeJT3ege8LUlX6eAL3kjqa8p6qdOuIs2RGr8KC2N6CiwtFI3jkDg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyp/Pb1CXs9csiqWi88WlOsnj3MroS6CwY+l1lp5mc0on/hua2p
	Y32QNhmNNhNBRG/KKkCQZCUpdiDwPqIhAZ1HJ874rETPIDRy8LHIZvEo9vxa7HWeJg==
X-Gm-Gg: ASbGncsKkB+zrcQc+/z+eTprgiTwWnLLgFQtdei4L+YlyoEwxYylBowpAEoqEQ/cXty
	nHOie608QO1ZWznfRdDrQxH5+iVXHNtNalsKNO2PRqCTvlcubg87Bw9yxOMwsyTBIUhoTlOTPdh
	yTMTcftgSBw8WWLytwonqxeWPAo9mDLJgiB8tNiO+BPoNBuKXjHZNVL5MhMx1kz0qKPRMpyxt4Z
	eEwxXb9jtFkQ9fcqT5YMIrsyqq031Hn1Hyl2Mw5OXRZz53vQDlvn7N0JRov+8UKEZnE596X5iOa
	fMjqM0MK4I0UPgejKRmorgPxQ2rxbBYEfOGcnwgPBczXnlX9LSgVtIeG8khTQu1FQIQkBfGeect
	9ItiIAmCywto4mYHSfYZhfFSCWTIgznki2tT3n46CLrIfTJr3nGyfkkN0t4LvtAV7yMV5RabnkE
	desxNtVpE=
X-Google-Smtp-Source: AGHT+IFl1htb5zhVitQbd27fsKxV64/WBeIO89fmaM03C1DsUYeSkk+kxEf7eiXxLDgDeX/LpyEfmQ==
X-Received: by 2002:adf:b646:0:b0:3a4:f50a:bd5f with SMTP id ffacd0b85a97d-3b60dd7303cmr4450391f8f.31.1752759356415;
        Thu, 17 Jul 2025 06:35:56 -0700 (PDT)
Message-ID: <cc8f85f6-8c22-411a-bcba-085cf51defb3@suse.com>
Date: Thu, 17 Jul 2025 15:35:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/19] xen/x86: implement amd-cppc-epp driver for CPPC
 in active mode
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-14-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711035106.2540522-14-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 05:51, Penny Zheng wrote:
> --- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> @@ -67,7 +67,14 @@
>   * max_perf.
>   * Field des_perf conveys performance level Xen governor is requesting. And it
>   * may be set to any performance value in the range [min_perf, max_perf],
> - * inclusive.
> + * inclusive. In active mode, desf_perf must be zero.

Nit (typo): des_perf

> @@ -259,11 +276,18 @@ static void cf_check amd_cppc_write_request_msrs(void *info)
>  }
>  
>  static void amd_cppc_write_request(unsigned int cpu, uint8_t min_perf,
> -                                   uint8_t des_perf, uint8_t max_perf)
> +                                   uint8_t des_perf, uint8_t max_perf,
> +                                   uint8_t epp)
>  {
>      struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
>      uint64_t prev = data->req.raw;
>  
> +    if ( !opt_active_mode )
> +        data->req.des_perf = des_perf;
> +    else
> +        data->req.des_perf = 0;

In amd_cppc_epp_set_policy() you pass 0 anyway. Why is this needed? With this
change dropped, opt_active_mode can become __initdata. (But of course you may
want to add an assertion instead, in which case the variable needs to stay
where it is at least in debug builds.)

> +    data->req.epp = epp;

Ahead of this patch, aren't you mis-handling this field then, in that you
clear it (as you never read the MSR)?

>      data->req.min_perf = min_perf;
>      data->req.max_perf = max_perf;
>      data->req.des_perf = des_perf;

Don't you need to delete this line with the addition above, or alternatively
change the above to

    if ( opt_active_mode )
        data->req.des_perf = 0;

?

> @@ -274,6 +298,14 @@ static void amd_cppc_write_request(unsigned int cpu, uint8_t min_perf,
>      on_selected_cpus(cpumask_of(cpu), amd_cppc_write_request_msrs, data, 1);
>  }
>  
> +static void read_epp_init(void)
> +{
> +    uint64_t val;
> +
> +    rdmsrl(MSR_AMD_CPPC_REQ, val);
> +    this_cpu(epp_init) = MASK_EXTR(val, AMD_CPPC_EPP_MASK);
> +}

I'm unconvinced this is worth a separate function.

> +static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
> +{
> +    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data,
> +                                                   policy->cpu);
> +    uint8_t max_perf, min_perf, epp;
> +
> +    /*
> +     * On default, set min_perf with lowest_nonlinear_perf, and max_perf
> +     * with the highest, to ensure performance scaling in P-states range.
> +     */
> +    max_perf = data->caps.highest_perf;
> +    min_perf = data->caps.lowest_nonlinear_perf;
> +
> +    /*
> +     * In policy CPUFREQ_POLICY_PERFORMANCE, increase min_perf to
> +     * highest_perf to achieve ultmost performance.
> +     * In policy CPUFREQ_POLICY_POWERSAVE, decrease max_perf to
> +     * lowest_nonlinear_perf to achieve ultmost power saving.
> +     */
> +    switch ( policy->policy )
> +    {
> +    case CPUFREQ_POLICY_PERFORMANCE:
> +        /* Force the epp value to be zero for performance policy */
> +        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
> +        min_perf = data->caps.highest_perf;

Use the local variable you have, i.e. max_perf?

> +        break;
> +
> +    case CPUFREQ_POLICY_POWERSAVE:
> +        /* Force the epp value to be 0xff for powersave policy */
> +        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
> +        max_perf = data->caps.lowest_nonlinear_perf;

Use the local variable you have, i.e. min_perf?

> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -245,6 +245,7 @@
>  #define MSR_AMD_CPPC_ENABLE                 0xc00102b1U
>  #define  AMD_CPPC_ENABLE                    (_AC(1, ULL) << 0)
>  #define MSR_AMD_CPPC_REQ                    0xc00102b3U
> +#define  AMD_CPPC_EPP_MASK                  (_AC(0xff, ULL) << 24)

The reason I noticed the EPP issue in amd_cppc_write_request() is because
I wondered why you would need this, when you have the fields defined in
struct amd_cppc_drv_data.

Jan

