Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8CEA071E3
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 10:46:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867937.1279476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVp6m-00016j-R2; Thu, 09 Jan 2025 09:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867937.1279476; Thu, 09 Jan 2025 09:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVp6m-00014s-OL; Thu, 09 Jan 2025 09:45:44 +0000
Received: by outflank-mailman (input) for mailman id 867937;
 Thu, 09 Jan 2025 09:45:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVp6k-00014m-VT
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 09:45:42 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d3d90d5-ce6e-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 10:45:41 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4361c705434so5505285e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 01:45:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b7ff0sm1322972f8f.77.2025.01.09.01.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 01:45:40 -0800 (PST)
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
X-Inumbo-ID: 7d3d90d5-ce6e-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736415941; x=1737020741; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q0LmkG/gDa/UWJi/v5fRxjkGy5FqsZItXo1ySAuCzyc=;
        b=EQAso8wlaJX0ejj5gT1RvETcdqelolMVj+zqj/BM8Nhxts3wXo46cMoP71tPIXM12B
         /ZiEwo9yxBsphCEHI/ZkC1x18Czg4rOAC3Us9CsRPa66C0gdICseSjY17XieKAm1TiiU
         uTOecYk0iSATP9eYj2tN7DOEcxY3MsZBXM/jB7vZ253HTwe/fye6v2XOUfhUHb+P3elL
         fqz/BG1VzooLsBXyfyWxerw2F461fnvrOE+P9N+C/biER/5QMCar29s8aaAkYNHvM8h3
         zUPHw5NOHQlCCk+b+zrtewvCFb87xRHdlxJ5+1hv98k0JJ4BJF7kClc1+fGOoOdMJeK2
         iUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736415941; x=1737020741;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0LmkG/gDa/UWJi/v5fRxjkGy5FqsZItXo1ySAuCzyc=;
        b=hlw09smkfRVit1h3Ush0xx5mTAlRbUlmf5Za97137r8b1FlUlSjuw5B/YkDDlXxms9
         BkXPVYBQ40mv9l+cajX+GKHOc71TixO4Inbhg1KF1MCdfCfkUNtwGcLOJ7QFE8gdjStB
         H0NlBUoN04UdWuK/vtvEb2v0trn08wstnn3WzhOJ+V6GGHcxI/UmERE8lE0ZORxSu3Sd
         1Cd+Di8fn39kzp82rKp2TzYtADAzmyj67fk+bgCI4nOTTYsbv/PReSEQ9eS1ZzME6obs
         E9yUz9x0zpAcsjyoTaC5E7mmMOHAx/A1VI0SpN8DAKPAGI2d5o+lqE6Xfoo9u8IuG2x4
         zw7A==
X-Forwarded-Encrypted: i=1; AJvYcCUPMSIR5sHb6IEkHGKFNxJjnkrGahXalTLzYVs1fKMoqdNwKiXcxxcfHzLL/1o6Y0wuZhjF6leKCgU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoIARATg01wVsPDiSKHnYUXbgLgq4fVgL/zQetbsn3xOP5qVh9
	13AZ6EjtvORcUs5ZXpy1myJdup00Gqn7Ajh9I2q7c4c2dcB6ObsSNMFUYctKpg==
X-Gm-Gg: ASbGncu2fZ2z3FDYEpSStaZZ6VIVX1aTvZ2Lp0tLrZuK6lObk1kK1wp3PdsBJb2hDL3
	pxb/ylSyq1LM06UDqD7PqJnQOG8EXYsOQMVDyB8tgWH03UV5MU1clX8jufc/+ysheM8UJncWFK1
	FnLHvj5maWono8ikuwOipl2GLS7qczYC2FCGxhKWNUMv2JC3a51paJ37EY0jQuyuFPtwqASjtls
	5ljTsw0duVNc6pgvD9XRaCVGRvOstzXtxFPD5Kve/rKjqjpKoIciFJX4imLBUW04IiREQYCmYEm
	0ZpRog0MUVqcAq5Rg3Z9136etUVFItYsngyFcckpKg==
X-Google-Smtp-Source: AGHT+IEtATmC1gzxs7n6LyXL2ssMD86kNYEoGs6/OxwbF6Nmo2duaDgkEm2hKrBz90Ifpsdrc53eHQ==
X-Received: by 2002:a5d:5f85:0:b0:385:e013:39ec with SMTP id ffacd0b85a97d-38a872f6a6bmr4834617f8f.8.1736415940959;
        Thu, 09 Jan 2025 01:45:40 -0800 (PST)
Message-ID: <95183589-1a83-4c99-ade4-d37873b85e0a@suse.com>
Date: Thu, 9 Jan 2025 10:45:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/11] xen/x86: introduce new sub-hypercall to get CPPC
 data
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: stefano.stabellini@amd.com, Ray.Huang@amd.com, Xenia.Ragiadakou@amd.com,
 Jason.Andryuk@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-3-Penny.Zheng@amd.com>
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
In-Reply-To: <20241203081111.463400-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.12.2024 09:11, Penny Zheng wrote:
> In order to provide backward compatibility with existing governors
> that represent performance as frequencies, like ondemand, the _CPC
> table can optionally provide processor frequency range values, Lowest
> frequency and Norminal frequency, to let OS use Lowest Frequency/
> Performance and Nominal Frequency/Performance as anchor points to
> create linear mapping of CPPC abstract performance to CPU frequency.
> 
> As Xen is uncapable of parsing the ACPI dynamic table, this commit
> introduces a new sub-hypercall to get required CPPC data from
> dom0 kernel.

"get" as used both here and in the title is, to me, something an entity
does actively. Xen is entirely passive here, though. (Reading the title
I was first assuming this is about a sub-op to get certain data out of
Xen.)

> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -572,6 +572,12 @@ ret_t do_platform_op(
>              break;
>          }
>  
> +        case XEN_PM_CPPC:
> +        {
> +            ret = set_cppc_pminfo(op->u.set_pminfo.id, &op->u.set_pminfo.u.cppc_data);
> +        }
> +        break;

No such unnecessary figure braces please, which - once dropped - will
also call for "break" to be indented one level deeper.

> --- a/xen/arch/x86/x86_64/cpufreq.c
> +++ b/xen/arch/x86/x86_64/cpufreq.c
> @@ -54,3 +54,21 @@ int compat_set_px_pminfo(uint32_t acpi_id,
>  
>      return set_px_pminfo(acpi_id, xen_perf);
>  }
> +
> +int compat_set_cppc_pminfo(uint32_t acpi_id,
> +                           struct compat_processor_cppc *cppc_data)
> +{
> +    struct xen_processor_cppc *xen_cppc;
> +    unsigned long xlat_page_current;
> +
> +    xlat_malloc_init(xlat_page_current);
> +
> +    xen_cppc = xlat_malloc_array(xlat_page_current,
> +                                    struct xen_processor_cppc, 1);
> +    if ( unlikely(xen_cppc == NULL) )
> +        return -EFAULT;
> +
> +    XLAT_processor_cppc(xen_cppc, cppc_data);
> +
> +    return set_cppc_pminfo(acpi_id, xen_cppc);
> +}

Why's this needed? The structure - for now at least - consists of only
uint32_t-s, and hence has identical layout for compat callers.

> --- a/xen/drivers/cpufreq/cpufreq.c
> +++ b/xen/drivers/cpufreq/cpufreq.c
> @@ -458,6 +458,56 @@ static void print_PPC(unsigned int platform_limit)
>      printk("\t_PPC: %d\n", platform_limit);
>  }
>  
> +static void print_CPPC(struct xen_processor_cppc *cppc_data)

Pointer-to-const?

> +{
> +    printk("\t_CPC: highest_perf=%u, lowest_perf=%u, "
> +           "nominal_perf=%u, lowest_nonlinear_perf=%u, "
> +           "nominal_freq=%uMhz, lowest_freq=%uMhz\n",
> +           cppc_data->highest_perf, cppc_data->lowest_perf,
> +           cppc_data->nominal_perf, cppc_data->lowest_nonlinear_perf,
> +           cppc_data->nominal_freq, cppc_data->lowest_freq);
> +}
> +
> +int set_cppc_pminfo(uint32_t acpi_id, struct xen_processor_cppc *cppc_data)

Pointer-to-const?

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
> +        pm_info = xzalloc(struct processor_pminfo);

Please be aware that new code is supposed to be using xvmalloc().

> +        if ( !pm_info )
> +        {
> +            ret = -ENOMEM;
> +            goto out;
> +        }
> +        processor_pminfo[cpuid] = pm_info;
> +    }
> +    pm_info->acpi_id = acpi_id;
> +    pm_info->id = cpuid;
> +
> +    memcpy ((void *)&pm_info->cppc_data,
> +            (void *)cppc_data,
> +            sizeof(struct xen_processor_cppc));

What use are these casts? Also please no blank before the opening parenthesis
of a function call, and please sizeof(*cppc_data). Yet then - why memcpy() in
the first place? This can be a (type safe) structure assignment, can't it?

> --- a/xen/include/public/platform.h
> +++ b/xen/include/public/platform.h
> @@ -363,6 +363,7 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_getidletime_t);
>  #define XEN_PM_PX   1
>  #define XEN_PM_TX   2
>  #define XEN_PM_PDC  3
> +#define XEN_PM_CPPC 4
>  
>  /* Px sub info type */
>  #define XEN_PX_PCT   1
> @@ -432,6 +433,15 @@ struct xen_processor_px {
>  typedef struct xen_processor_px xen_processor_px_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_processor_px_t);
>  
> +struct xen_processor_cppc {
> +    uint32_t highest_perf;
> +    uint32_t nominal_perf;
> +    uint32_t lowest_perf;
> +    uint32_t lowest_nonlinear_perf;
> +    uint32_t lowest_freq;
> +    uint32_t nominal_freq;
> +};

_CPC contains a lot more data. Please clarify on what basis this subset was
chosen. (Keeping the chosen fields in the order _CPC has them might also be
a good idea.)

> --- a/xen/include/xlat.lst
> +++ b/xen/include/xlat.lst
> @@ -166,6 +166,7 @@
>  !	processor_cx			platform.h
>  !	processor_flags			platform.h
>  !	processor_performance		platform.h
> +!	processor_cppc			platform.h
>  !	processor_power			platform.h
>  ?	processor_px			platform.h
>  !	psd_package			platform.h

Please obey to alphabetic sorting. As per an earlier comment I also expect
this wants to be using '?' in place of '!'.

Jan

