Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A55719264A1
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 17:14:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753201.1161497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP1ge-0004NR-Jb; Wed, 03 Jul 2024 15:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753201.1161497; Wed, 03 Jul 2024 15:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP1ge-0004Lp-G7; Wed, 03 Jul 2024 15:14:24 +0000
Received: by outflank-mailman (input) for mailman id 753201;
 Wed, 03 Jul 2024 15:14:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sP1gc-0004Lh-Lq
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 15:14:22 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec0993b2-394e-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 17:14:20 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52e9c55febcso226861e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 08:14:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-72c6c8ec943sm8204317a12.69.2024.07.03.08.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 08:14:18 -0700 (PDT)
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
X-Inumbo-ID: ec0993b2-394e-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720019660; x=1720624460; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3bJfYb8w6yDf1yhEaKYVhazCPpRHCVXEXDnVqm3Gb9Y=;
        b=TUod8/gIeuxOymhHm6HjbXJdcN0BD+H+pGJJmZuerVFGIqDJPm1czGVjIJgn8b6uef
         bya1W4kKQFFrBlRy9rqaviDoeWIqFqDIEVkbrsJeCAKrlDy6rcICUQjjdhW3uoTRE9G5
         nprcno3ILqSCeP7V7o2YZUtYyAN8wRbKrzoFSDFo/2l02LGUbaaRuumkvFbc8lYoj3OO
         QbHWIhEbDZ3h8iunkbeec3Ms2OYtLBVth16U4oQtKy+dGkHvcYLzlZsPX4czb60bb0da
         XRp7fR7TOY16hKBF96J+iqI06IMFrhw+RenVgxMZ9Dp5t9MZgFtyFAUUb+zLzoEBHoY2
         H1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720019660; x=1720624460;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bJfYb8w6yDf1yhEaKYVhazCPpRHCVXEXDnVqm3Gb9Y=;
        b=lkhDnsr2ZkRyhvaxOg9ZoDO+CD096IeM1YYgwL7qf7tgwLttUeD+JL9y9xJKoXDezc
         UzJMq7dQhMsjosunvABFLFfbpZPLmrNK6Iv/vc3PLE+CspZbT8GcTtNHx3cYMXQ5/u4i
         iG0COC5epedPmq5jdGOs4DvsFCI5qs2D3J7hqsTM5h1V8Xzaw7BGGTmPdCUApY+jtYwg
         g5Wzpm2irmQM90gPsLDmlxR5wh6V/QOoemTaqxAsRhcsUnGSjRJLKBY+XuPG+vKlb94v
         pr6DufsS35TuxO7eWg7pS0qRlgLgBh1RtRvL9KlfzXZ9Jt8Uj0SfRwTlEN8g0FXzweMi
         by2A==
X-Forwarded-Encrypted: i=1; AJvYcCXNef49qkV9LU9/5BZ7bUfrQhx/HChe8FRgQBdWYLd0gDPFxdQOuuKs1DAxwJnRP9ow/FyrmfTChSm6wy43gCr8qIZKT0x/FTGHAvAYN84=
X-Gm-Message-State: AOJu0Yy6uAlKld/WCQ7/5mPgfItGS/iBX7ynCDFT9IlXGNHpeceqd2VN
	u17NvLcEF87gcLCCSblGma9by4U2xd+XfJVXpJ0SCxqK9/TzfmQyKiBf7n8SLw==
X-Google-Smtp-Source: AGHT+IHjPQPkL0ONNKuSRBx+eq/OXAyLqGYo+xSIik/LF1eqrxDRzhb/WfCHxS6j/LendR5ALIyAeQ==
X-Received: by 2002:a05:6512:1384:b0:52c:86d6:e8d7 with SMTP id 2adb3069b0e04-52e8264733dmr9091385e87.13.1720019659719;
        Wed, 03 Jul 2024 08:14:19 -0700 (PDT)
Message-ID: <22cd30f6-3a66-4dc7-8805-86a6daad5700@suse.com>
Date: Wed, 3 Jul 2024 17:14:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/2] x86/cpufreq: separate powernow/hwp/acpi
 cpufreq code
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1719832871.git.Sergiy_Kibrik@epam.com>
 <0f6e8a602fb3106d6b064582ca50d3d5fd4f1174.1719832871.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <0f6e8a602fb3106d6b064582ca50d3d5fd4f1174.1719832871.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2024 14:19, Sergiy Kibrik wrote:
> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -255,7 +255,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>          strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
>  
>      if ( !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
> -                      CPUFREQ_NAME_LEN) )
> +                      CPUFREQ_NAME_LEN) && IS_ENABLED(CONFIG_INTEL) )

Wrapping like this is confusing, not just because of the flawed indentation.
Please can this be

    if ( !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
                  CPUFREQ_NAME_LEN) &&
         IS_ENABLED(CONFIG_INTEL) )

? Perhaps the IS_ENABLED() would also better be first (not just here).

> --- a/xen/drivers/cpufreq/utility.c
> +++ b/xen/drivers/cpufreq/utility.c
> @@ -379,7 +379,7 @@ int cpufreq_driver_getavg(unsigned int cpu, unsigned int flag)
>      if (!cpu_online(cpu) || !(policy = per_cpu(cpufreq_cpu_policy, cpu)))
>          return 0;
>  
> -    freq_avg = get_measured_perf(cpu, flag);
> +    freq_avg = IS_ENABLED(CONFIG_INTEL) ? get_measured_perf(cpu, flag) : 0;
>      if ( freq_avg > 0 )
>          return freq_avg;

Why is this? APERF/MPERF aren't Intel-only MSRs.

> --- a/xen/include/acpi/cpufreq/cpufreq.h
> +++ b/xen/include/acpi/cpufreq/cpufreq.h
> @@ -254,11 +254,20 @@ void intel_feature_detect(struct cpufreq_policy *policy);
>  
>  int hwp_cmdline_parse(const char *s, const char *e);
>  int hwp_register_driver(void);
> +#ifdef CONFIG_INTEL
>  bool hwp_active(void);
> +#else
> +static inline bool hwp_active(void)
> +{
> +    return false;
> +}
> +#endif
> +
>  int get_hwp_para(unsigned int cpu,
>                   struct xen_cppc_para *cppc_para);
>  int set_hwp_para(struct cpufreq_policy *policy,
>                   struct xen_set_cppc_para *set_cppc);
>  
>  int acpi_register_driver(void);
> +
>  #endif /* __XEN_CPUFREQ_PM_H__ */

Nit: This adding of a blank line should be part of the earlier patch.

Jan

