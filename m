Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C30A30986
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 12:10:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885401.1295214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tho9l-0001Xd-Uc; Tue, 11 Feb 2025 11:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885401.1295214; Tue, 11 Feb 2025 11:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tho9l-0001V4-Rk; Tue, 11 Feb 2025 11:10:21 +0000
Received: by outflank-mailman (input) for mailman id 885401;
 Tue, 11 Feb 2025 11:10:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tho9j-0001Uy-UJ
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 11:10:19 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c65f4dd2-e868-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 12:10:17 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ab7d7f0a2cfso154203766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 03:10:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7ea9f43acsm25216766b.12.2025.02.11.03.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 03:10:16 -0800 (PST)
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
X-Inumbo-ID: c65f4dd2-e868-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739272217; x=1739877017; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HAgH2SIhggXbY7HTXWON2YbEv59uwe/0p8n4HCROPZc=;
        b=Vf15eMB8ylKsJSfnT3pIyzPB9socMRvYUImxJaL7M3WrE+VAlNzeSNq/ypIW7RR/Q7
         6+d0KtM/LQkR/dDN/MjM/DhSD4fwpMRc/FaMjOprmjrEw1Iy5zHyxAZi5E38Cnpe2JQO
         sBfC4uZciO1N4B+HQZbbgFl0b2pG+h5Ifjfmhcrb/Ops4QETO+FzKt/aeJ2vHmCM4TB4
         YoMj/bsvtZwmj83ajtiAMFpqOMBVfYnRkzuwpF9UwxLqEuk03Xf0qN4VgG2EIH9kmtcn
         fFnbdeiPWfcIcBpDEyHTFcBmVKAZX+EuSsOneeuMsXJcLxV1k2jg9oWHnlH6zKYaOxB8
         aHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739272217; x=1739877017;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAgH2SIhggXbY7HTXWON2YbEv59uwe/0p8n4HCROPZc=;
        b=uzaOj7Sru38BbRMTpTvE45uV2JngPYuk9hU6sqCQnNAARCfKif272LOy/HO2JJ1WMW
         BXLMRt50alOtVuE+YnvpjQoo48RNmAqPfduiEpBtaxOikhmC7ie3reUuLCgP9qx4LiI/
         D6PHPJuQaKIioPQpWQ4xwqZ4v7BtgCw8VU0M7FZzcMqEQUEgxyGeuXn90GVpFhqcVcOP
         5cSRmSbQLSIqVe6Q3pTEDHDJv5Vp/HIpDUSNe7dLhJTUFOB5YcU+BKqpoqobVnhtltfB
         +uwCXZI4x1MLIVS96TusjjqZ2j6C7N/gLIXKsupSqtxhNPpodXaAEKwtIxdujmxfzjMm
         o8Cw==
X-Forwarded-Encrypted: i=1; AJvYcCU/8bWuNkZJmIvy6oI7vh+ZwnUWVjeXVLZ74ZAoCtLGIkUX3tIHpMQNGHiSfievnElqQ5To2ezWbu8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywr/rxp8vUX9aAaj1fCifhIfIpNDYcubUKYiUtNK9n8PGuxm5aP
	41ougG5mcgzfMKPtsAM3SVUcJ2gUI1PWCXcvD/ZiyM+Wm1tkuHc9XJ9CI2kdhA==
X-Gm-Gg: ASbGncttbsr5U7Nx6Az6MHDCbmw88kJAk3aL6g4tmmd6QcTVfoLuGzuSJj7xIBSEsw9
	hxxrimsjR0sYBYR5iVglNNzWjdklR8Ao/FvPf8L3UL93sVLn5moZ/PAUBZAJT3J761IQuZPS60B
	K4zaU61/Zs4BbncqKpwuQWnv0n0ojvH8IhOdJqUDMtrWI/xoMW0lB+9UM8qucYzeDmq4vRk2JTf
	glvzvsftkkMApzn65WS2QAw/KkOBNvr/AQI6FnouQMMDoq4SVbJP3smqR/9rZjxA2jvRijNjnJT
	xCx5YUeAI9ZpssrLfFiXX0sPYXKya56I6HjLlOOzzHkCxZ3QCB2ZN+mhfO4Q2yS8l908iVawzSK
	K
X-Google-Smtp-Source: AGHT+IGeowy5V9UeQe29qAL+kIweKeErx0vCYnWxfn76pqpDYuIEVxif2NJGw/6XUhWO5eGQgPwUrA==
X-Received: by 2002:a17:907:7d90:b0:ab7:bcf9:34f with SMTP id a640c23a62f3a-ab7bcf95824mr716096666b.15.1739272216880;
        Tue, 11 Feb 2025 03:10:16 -0800 (PST)
Message-ID: <d3198e8c-2723-484c-b305-822a681d544b@suse.com>
Date: Tue, 11 Feb 2025 12:10:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Ray.Huang@amd.com, Jason.Andryuk@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-3-Penny.Zheng@amd.com>
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
In-Reply-To: <20250206083255.1296363-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2025 09:32, Penny Zheng wrote:
> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -572,6 +572,10 @@ ret_t do_platform_op(
>              break;
>          }
>  
> +        case XEN_PM_CPPC:
> +            ret = set_cppc_pminfo(op->u.set_pminfo.id, &op->u.set_pminfo.u.cppc_data);

Nit: Too long line.

> --- a/xen/arch/x86/x86_64/cpufreq.c
> +++ b/xen/arch/x86/x86_64/cpufreq.c
> @@ -26,6 +26,8 @@
>  #include <xen/pmstat.h>
>  #include <compat/platform.h>
>  
> +CHECK_processor_cppc;
> +
>  CHECK_processor_px;

May I ask that you insert below the pre-existing CHECK_* rather than above?
Or wait - maybe you were aiming at sorting these alphabetically? That would
perhaps be fine then.

> @@ -458,6 +459,53 @@ static void print_PPC(unsigned int platform_limit)
>      printk("\t_PPC: %d\n", platform_limit);
>  }
>  
> +static void print_CPPC(const struct xen_processor_cppc *cppc_data)
> +{
> +    printk("\t_CPC: highest_perf=%u, lowest_perf=%u, "
> +           "nominal_perf=%u, lowest_nonlinear_perf=%u, "
> +           "nominal_freq=%uMhz, lowest_freq=%uMhz\n",

Nit: MHz please.

> +           cppc_data->highest_perf, cppc_data->lowest_perf,
> +           cppc_data->nominal_perf, cppc_data->lowest_nonlinear_perf,
> +           cppc_data->nominal_freq, cppc_data->lowest_freq);
> +}
> +
> +int set_cppc_pminfo(uint32_t acpi_id, const struct xen_processor_cppc *cppc_data)

Too long a line again.

Also while print_CPPC() is placed okay, this function wants to move
down, past set_px_pminfo().

> +{
> +    int ret = 0, cpuid;
> +    struct processor_pminfo *pm_info;
> +
> +    cpuid = get_cpu_id(acpi_id);
> +    if ( cpuid < 0 || !cppc_data )
> +    {
> +        ret = -EINVAL;
> +        goto out;
> +    }
> +    if ( cpufreq_verbose )
> +        printk("Set CPU acpi_id(%d) cpuid(%d) CPPC State info:\n",
> +               acpi_id, cpuid);
> +
> +    pm_info = processor_pminfo[cpuid];
> +    if ( !pm_info )
> +    {
> +        pm_info = xvzalloc(struct processor_pminfo);
> +        if ( !pm_info )
> +        {
> +            ret = -ENOMEM;
> +            goto out;
> +        }
> +        processor_pminfo[cpuid] = pm_info;
> +    }
> +    pm_info->acpi_id = acpi_id;
> +    pm_info->id = cpuid;
> +    pm_info->cppc_data = *cppc_data;
> +
> +    if ( cpufreq_verbose )
> +        print_CPPC(&pm_info->cppc_data);
> +
> + out:
> +    return ret;
> +}

What's the interaction between the data set by set_px_pminfo() and the
data set here? In particular, what's going to happen if both functions
come into play for the same CPU? Shouldn't there be some sanity checks?
Will consumers be able to tell which of the two were correctly invoked,
before using respective data? Even in the event of no code changes at
all to address this, it will want discussing in the patch description.

> --- a/xen/include/xen/pmstat.h
> +++ b/xen/include/xen/pmstat.h
> @@ -5,6 +5,7 @@
>  #include <public/platform.h> /* for struct xen_processor_power */
>  #include <public/sysctl.h>   /* for struct pm_cx_stat */
>  
> +int set_cppc_pminfo(uint32_t cpu, const struct xen_processor_cppc *cppc_data);

Surprisingly this line is within limits, when the (supposedly) one char
shorter line at the definition site is not. Which points out a Misra
violation: Declaration and definition ought to agree in parameter names.

Jan

