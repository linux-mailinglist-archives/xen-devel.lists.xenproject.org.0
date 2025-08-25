Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1DFB344ED
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 17:02:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093331.1448858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYhs-0008KV-8B; Mon, 25 Aug 2025 15:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093331.1448858; Mon, 25 Aug 2025 15:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqYhs-0008I5-4L; Mon, 25 Aug 2025 15:02:00 +0000
Received: by outflank-mailman (input) for mailman id 1093331;
 Mon, 25 Aug 2025 15:01:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqYhq-0008Hz-Cy
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 15:01:58 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 719f8a0b-81c4-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 17:01:56 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb731caaaso674047466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 08:01:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe52735cc2sm539507066b.9.2025.08.25.08.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 08:01:56 -0700 (PDT)
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
X-Inumbo-ID: 719f8a0b-81c4-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756134116; x=1756738916; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E6BvmjzjJDtR2JS+28z200e2vqxB+N8nZljEb+w34KQ=;
        b=GDbJDEJSF0hgcl0fIe/BMkGECs83rTf9ZZ9wjOiKJmKYD7/BgK6m5Yu4/459ULI7qC
         0S10ORR1jYnvugO7RwCvM3EnYvQvrAiqM0sg3z4ieekyz6uzElv2pUcZkhFkpCB84GcY
         /XevhZGPexR7+0znlP4UOHo6VjOMa27t0GIftFvK+NMzit0imFN7BWz3ZV+yUqQOd0KH
         FVHYF7xRcjR7EddZImmvUiOy4H3p7iaTPk4N+nFy5wX6KdkwBShN0aeulxaeW8PnuvvO
         zCVV9oSdP+e5VLdDkkbunL2K1Aq+Ys9VEyXyab+TouTGvcajkkthRsG4uEpUMgHZSpxv
         NLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756134116; x=1756738916;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6BvmjzjJDtR2JS+28z200e2vqxB+N8nZljEb+w34KQ=;
        b=Gkmdj20BsaXfufWMVl7ROa51eHyL/B6O+xT27t58gFjsI+GgKSLfaXCpXj/LljtKqY
         VOT2QzmMDXPObxFpDx0fBPC3+/BJR/iw3ujZCbzLQUlb2VQm6bvHyLlilEUQ9j8jWBU0
         Rlk/vLxTFIK+JdPH1BOeHAeLOyAOabkMx6IUo8V1W2NpSSkz51Cl63smu3G0XCIWAcFC
         NCEeYCyut0lWFNWM8I/nICdvvtGnUCtBIifdrIHJM56T+WIz/mSD1zY9lwpfNeVDSELS
         Lwf0/6qTcCncz0reDS0byXJsaFKzrcXszVQqaDLWu6hcLO4b+MEfQ0aMfB5kAROjy1+7
         g53A==
X-Forwarded-Encrypted: i=1; AJvYcCV0vwHqeGgTczL/EvDlaV8YDy364txJo3tE0teCCiV/jUGdZ4WXi15XBASiq9Y830SlYicKHZ8xBAI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYzFnqW++veEE99QkTi3ScsjYS3HZ6PdnTK2tLkEr5LzutvEca
	nxbNQb3BtjE5IfM8AD+pwvA8XW4B88dQpF8+fv64uYICqDlaOWvHPXBtfFYYTNlf0w==
X-Gm-Gg: ASbGncsikY312qnCxGqWBxPfOjCKddjBWh+4zCWNScY6SyHyf41d595t14byXiGBQgt
	hwW2HTx88wI5ADr7t9Q2JcZgGS2vzJAf4ia+JfhLJO0aq5mQpZZ5plCLjQpHk0C7MlI4Vo0WU0O
	upUqKdZcFuIe1vWhdTijs3VxwaUg53CQKx+89AucsiMEJjCsztNnS0dmnVSe3nrVMpSDr+5RG4F
	RPSlqRluSG1+H3/r1pyxZt7GJ9xWenlS/xvS9lQnBeHJlYchk1JeG094247D2qDL7NKDdV4Md8t
	diL+cN4H7kM4l1rr/fAZwHrv292h6W9iX6KpjTfKg7DdKSXhINBBsyb2y7JdS3tpxQCbNxgCMlm
	gLJVApgyzvkXJFU++6Tw6Z05bdtPUPH2N1/r02mGG2+kK+hm41zDcME6C6jUIoLNixQGayH0iz9
	3vJeqnN9s=
X-Google-Smtp-Source: AGHT+IEPuiC5sLdYudgIzrbHX9M3LZIhaD7gIQSuL8svTecCCC3dVDEl6GR6AxPCllaaU6Ays84KdA==
X-Received: by 2002:a17:907:d58f:b0:afe:54f6:6d2c with SMTP id a640c23a62f3a-afe54f6a340mr678796366b.60.1756134116360;
        Mon, 25 Aug 2025 08:01:56 -0700 (PDT)
Message-ID: <a4c5e149-828f-4ea9-83e2-79ecc8c56033@suse.com>
Date: Mon, 25 Aug 2025 17:01:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/13] xen/cpufreq: introduce new sub-hypercall to
 propagate CPPC data
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-7-Penny.Zheng@amd.com>
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
In-Reply-To: <20250822105218.3601273-7-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.08.2025 12:52, Penny Zheng wrote:
> --- a/xen/arch/x86/x86_64/cpufreq.c
> +++ b/xen/arch/x86/x86_64/cpufreq.c
> @@ -54,3 +54,22 @@ int compat_set_px_pminfo(uint32_t acpi_id,
>  
>      return set_px_pminfo(acpi_id, xen_perf);
>  }
> +
> +int compat_set_cppc_pminfo(unsigned int acpi_id,
> +                           const struct compat_processor_cppc *cppc_data)
> +
> +{
> +    struct xen_processor_cppc *xen_cppc;
> +    unsigned long xlat_page_current;
> +
> +    xlat_malloc_init(xlat_page_current);
> +
> +    xen_cppc = xlat_malloc_array(xlat_page_current,
> +                                 struct xen_processor_cppc, 1);
> +    if ( unlikely(xen_cppc == NULL) )
> +        return -EFAULT;

I think we want to avoid repeating the earlier mistake with using a wrong
error code. It's ENOMEM or ENOSPC or some such.

> --- a/xen/drivers/acpi/pm-op.c
> +++ b/xen/drivers/acpi/pm-op.c
> @@ -91,7 +91,9 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>      pmpt = processor_pminfo[op->cpuid];
>      policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
>  
> -    if ( !pmpt || !pmpt->perf.states ||
> +    if ( !pmpt ||
> +         ((pmpt->init & XEN_PX_INIT) && !pmpt->perf.states) ||
> +         ((pmpt->init & XEN_CPPC_INIT) && pmpt->perf.state_count) ||

I fear I don't understand this: In the PX case we check whether necessary
data is lacking. In the CPPC case you check that some data was provided
that we don't want to use? Why not similarly check that data we need was
provided?

> @@ -693,6 +699,120 @@ int acpi_set_pdc_bits(unsigned int acpi_id, XEN_GUEST_HANDLE(uint32) pdc)
>      return ret;
>  }
>  
> +static void print_CPPC(const struct xen_processor_cppc *cppc_data)
> +{
> +    printk("\t_CPC: highest_perf=%u, lowest_perf=%u, "
> +           "nominal_perf=%u, lowest_nonlinear_perf=%u, "
> +           "nominal_mhz=%uMHz, lowest_mhz=%uMHz\n",
> +           cppc_data->cpc.highest_perf, cppc_data->cpc.lowest_perf,
> +           cppc_data->cpc.nominal_perf, cppc_data->cpc.lowest_nonlinear_perf,
> +           cppc_data->cpc.nominal_mhz, cppc_data->cpc.lowest_mhz);
> +}
> +
> +int set_cppc_pminfo(unsigned int acpi_id,
> +                    const struct xen_processor_cppc *cppc_data)
> +{
> +    int ret = 0, cpuid;
> +    struct processor_pminfo *pm_info;
> +
> +    cpuid = get_cpu_id(acpi_id);
> +    if ( cpuid < 0 )
> +    {
> +        ret = -EINVAL;
> +        goto out;
> +    }
> +
> +    if ( cppc_data->pad[0] || cppc_data->pad[1] || cppc_data->pad[2] )
> +    {
> +        ret = -EINVAL;
> +        goto out;
> +    }
> +
> +    if ( cpufreq_verbose )
> +        printk("Set CPU%d (ACPI ID %u) CPPC state info:\n",
> +               cpuid, acpi_id);
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
> +    if ( (cppc_data->flags & XEN_CPPC_PSD) &&
> +         !check_psd_pminfo(cppc_data->shared_type) )
> +    {
> +            ret = -EINVAL;
> +            goto out;

Indentation.

Jan

