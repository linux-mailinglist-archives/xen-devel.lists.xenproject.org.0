Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC195AD5B80
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 18:11:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011915.1390449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPO2R-0001bu-CU; Wed, 11 Jun 2025 16:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011915.1390449; Wed, 11 Jun 2025 16:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPO2R-0001aE-9b; Wed, 11 Jun 2025 16:10:55 +0000
Received: by outflank-mailman (input) for mailman id 1011915;
 Wed, 11 Jun 2025 16:10:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPO2P-0001YX-NB
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 16:10:53 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dfe0cb0-46de-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 18:10:39 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso69552f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 09:10:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236030780bcsm90039105ad.15.2025.06.11.09.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 09:10:38 -0700 (PDT)
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
X-Inumbo-ID: 9dfe0cb0-46de-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749658239; x=1750263039; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CDi9+1roc6QnyLVJtsYDkxHsWwb49iH+ZbTAyzzTfiw=;
        b=aei4/mVpMi9B2atX9PPVxMm8IPQJjbufey+as7WgcB4t7YHTFpLiawN9WJjE+NrUJb
         5l5Az93HQ4kNDa66uX4RPAwlGERWBGA6F+I0TaxyC/mdQpDLP8eXwlG6DLOkUrBZfxKT
         pZLsGNxs6uw5MXBQwdmApR4+bKNaj7+RQDHaR9S19grhutBFNRnqguzGhjP0wu5IHSGn
         QL2Nq7HY25oKEJbMPwe/Bs45k/5OOlWbVyRSUJwzD9aBQ1dYYyOxgmXU/Q8f0+fOo99y
         TwaXS0Jiz8rzM6l2agP6MpNGdtaISYgsnUoZ6rJFKGF1hjHxDDIIwb/ZSPguWGFUesCN
         Ac6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658239; x=1750263039;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDi9+1roc6QnyLVJtsYDkxHsWwb49iH+ZbTAyzzTfiw=;
        b=CBWaiBturOIGiat7JMYse7udl0OQJIHGpSG/1YppnekHwcCWoBd5Lh3X2YWEOVZ/yM
         6QMnglF++/bvKQR5LDYJcKNdWvB5XmqEIi1rpEWJeEuo//q9AOMAxHuUz7QVEJC7rgSO
         R+bRLHCrFX3fRmH72oor/MUY4d2dlzhmqFEPySLGmwqPJ39mABUx18D3ZNJQKZW11Nsy
         j9au8BaT3CHXKG4oB70hPE4GwR+Urua0dqJb926ktrqqsO0gkjO/J/rGO6a9QIPYF17S
         02KViwOtcgt5R1ASiXcRzoiBN+en7GWZfHhsHAg1/VQLRXSDMiKAWP3H11cDIPYvUrHG
         xdyA==
X-Forwarded-Encrypted: i=1; AJvYcCVfWsk+M8oHJsoZdjrF8xFBo675SNCe68wjL861gyF16GRMkYFm54zyN0kTGqujarjpGoeMZmk659I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnVU3+Aa9cQAS8JUQatHZZRIaM7GjHLYt3JJXk7D9PSYaTKYdO
	WJMNNpFVDUE03xGS9LnRgAn25JcniJwKz5irCzokxuLu49qkSzMqNadjgFSknRDW3g==
X-Gm-Gg: ASbGnctTjZ+RiZsD8L5hdvb+C+g2baLsFLVALIsoJmdfXjtVrwWD1DcZfMnJFy3LIbH
	RiAyvYBtxW2a8b/TyXAJXZOFMbvOUP6NW0xJlUDsCMsiA9QOsZLMPT8Ibra8vn3m9/7fLwUWYsp
	5DKyhOzOL6TscAzI6hQvwOz/fPVuBwCt69V8SbWgjf0GvaDEm9EG7QH8rA5efI/eI1Id+wbP5Gj
	IDKffncWJbPVUG1yO+NO8uT1baFScwu025f8vQfWAVejo4urIv4Axj54bvHlW51/cL3GZzoC6Nd
	zyIvcztiRq9LalTBhjP65NPw4pahNODKmWsK3sAKSwXDpx5jovk6n/8rZmXMxYxsJJH0rEt+Zil
	kG7bvVvsBSxEgPlK1mo+BqXYW72AqtzIXVMzGX6kjvbybRZE=
X-Google-Smtp-Source: AGHT+IHCXJlgj5HPygomuHDBAPEkDw/rMxaKDZv8waEMOSqcLyVnCm0f+xN2+j715GPaIeZJSPSCjA==
X-Received: by 2002:a05:6000:18ac:b0:3a5:28f4:24ad with SMTP id ffacd0b85a97d-3a558aa51admr3300434f8f.21.1749658239073;
        Wed, 11 Jun 2025 09:10:39 -0700 (PDT)
Message-ID: <0de0ea5c-64c9-4ac8-8e76-750cb3036419@suse.com>
Date: Wed, 11 Jun 2025 18:10:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/18] xen/cpufreq: introduce new sub-hypercall to
 propagate CPPC data
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-5-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-5-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> @@ -635,6 +641,124 @@ out:
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
> +    if ( cpuid < 0 || !cppc_data )

The !cppc_data part isn't really needed, is it?

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
> +        printk("Set CPU acpi_id(%u) cpuid(%d) CPPC State info:\n",
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
> +    if ( cppc_data->flags & XEN_CPPC_PSD )
> +    {
> +        ret = check_psd_pminfo(cppc_data->shared_type);
> +        if ( ret )
> +            goto out;
> +    }
> +
> +    if ( cppc_data->flags & XEN_CPPC_CPC )
> +    {
> +        if ( cppc_data->cpc.highest_perf == 0 ||
> +             cppc_data->cpc.highest_perf > UINT8_MAX ||
> +             cppc_data->cpc.nominal_perf == 0 ||
> +             cppc_data->cpc.nominal_perf > UINT8_MAX ||
> +             cppc_data->cpc.lowest_nonlinear_perf == 0 ||
> +             cppc_data->cpc.lowest_nonlinear_perf > UINT8_MAX ||
> +             cppc_data->cpc.lowest_perf == 0 ||
> +             cppc_data->cpc.lowest_perf > UINT8_MAX ||
> +             cppc_data->cpc.lowest_perf >
> +                cppc_data->cpc.nominal_perf ||
> +             cppc_data->cpc.lowest_nonlinear_perf >
> +                cppc_data->cpc.nominal_perf ||
> +             cppc_data->cpc.nominal_perf > cppc_data->cpc.highest_perf )
> +            /*
> +             * Right now, Xen doesn't actually use highest_perf/nominal_perf/
> +             * lowest_nonlinear_perf/lowest_perf values read from ACPI _CPC
> +             * table. Xen reads CPPC capability MSR to get these four values.
> +             * So warning is enough.
> +             */
> +            printk_once(XENLOG_WARNING
> +                        "Broken CPPC perf values: lowest(%u), nonlinear_lowest(%u), nominal(%u), highest(%u)\n",
> +                        cppc_data->cpc.lowest_perf,
> +                        cppc_data->cpc.lowest_nonlinear_perf,
> +                        cppc_data->cpc.nominal_perf,
> +                        cppc_data->cpc.highest_perf);
> +
> +        /* lowest_mhz and nominal_mhz are optional value */
> +        if ( cppc_data->cpc.lowest_mhz > cppc_data->cpc.nominal_mhz )
> +        {
> +            printk_once(XENLOG_WARNING
> +                        "Broken CPPC freq values: lowest(%u), nominal(%u)\n",
> +                        cppc_data->cpc.lowest_mhz,
> +                        cppc_data->cpc.nominal_mhz);
> +            /* Re-set with zero values, instead of keeping invalid values */
> +            pm_info->cppc_data.cpc.nominal_mhz = 0;
> +            pm_info->cppc_data.cpc.lowest_mhz = 0;
> +        }
> +    }
> +
> +    if ( cppc_data->flags == (XEN_CPPC_PSD | XEN_CPPC_CPC) )
> +    {
> +        if ( cpufreq_verbose )
> +        {
> +            print_PSD(&pm_info->cppc_data.domain_info);
> +            print_CPPC(&pm_info->cppc_data);
> +        }
> +
> +        pm_info->init = XEN_CPPC_INIT;
> +        ret = cpufreq_cpu_init(cpuid);
> +#ifndef NDEBUG
> +        if ( ret )
> +            dprintk(XENLOG_WARNING,
> +                    "CPU %u failed to be initialized with amd-cppc mode, and users could only reboot and re-define cmdline with \"cpufreq=xen\"",
> +                    cpuid);
> +#endif

What use if the #ifdef here? The more that NDEBUG controls behavior of ASSERT(),
not that of (debug) logging.

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
> @@ -370,6 +371,10 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_getidletime_t);
>  #define XEN_PX_PPC   4
>  #define XEN_PX_PSD   8
>  
> +/* CPPC sub info type */
> +#define XEN_CPPC_PSD   1
> +#define XEN_CPPC_CPC   2
> +
>  struct xen_power_register {
>      uint32_t     space_id;
>      uint32_t     bit_width;
> @@ -457,6 +462,30 @@ struct xen_processor_performance {
>  typedef struct xen_processor_performance xen_processor_performance_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_processor_performance_t);
>  
> +struct xen_processor_cppc {
> +    uint8_t flags; /* flag for CPPC sub info type */

A common way of commenting on such would be /* XEN_CPPC_... */.

In any event, here and ...

> +    uint8_t pad[3]; /* padding and must be zero */

... here (and of course anywhere else) - please adhere to designated comment
style.

> +    /*
> +     * Subset _CPC fields useful for CPPC-compatible cpufreq
> +     * driver's initialization
> +     */
> +    struct {
> +        uint32_t highest_perf;
> +        uint32_t nominal_perf;
> +        uint32_t lowest_nonlinear_perf;
> +        uint32_t lowest_perf;
> +        uint32_t lowest_mhz;
> +        uint32_t nominal_mhz;
> +    } cpc;
> +    /* Coordination type of this processor */
> +#define XEN_CPUPERF_SHARED_TYPE_HW   1 /* HW does needed coordination */
> +#define XEN_CPUPERF_SHARED_TYPE_ALL  2 /* All dependent CPUs should set freq */
> +#define XEN_CPUPERF_SHARED_TYPE_ANY  3 /* Freq can be set from any dependent CPU */

What's this? The exact same #define-s already exist in struct
xen_processor_performance, unless I'm missing a hard to notice spelling
difference. You can simply ...

> +    uint32_t shared_type;

... use the comment suggestion from above here as well.

> --- a/xen/include/xen/pmstat.h
> +++ b/xen/include/xen/pmstat.h
> @@ -7,8 +7,13 @@
>  
>  int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf);
>  long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
> +int set_cppc_pminfo(unsigned int acpi_id,
> +                    const struct xen_processor_cppc *cppc_data);

Nit: Relative ordering would be nice to be consistent between this group
and ...

>  #ifdef CONFIG_COMPAT
> +struct compat_processor_cppc;
> +int compat_set_cppc_pminfo(unsigned int acpi_id,
> +                           const struct compat_processor_cppc *cppc_data);
>  struct compat_processor_performance;
>  int compat_set_px_pminfo(uint32_t acpi_id, struct compat_processor_performance *perf);
>  struct compat_processor_power;

... this one. (Personally I dislike additions at the top of any group,
as this gives the impression that the new stuff is "more important" than
what has been there already. See also how in a number of places we simply
sort alphabetically, to avoid the common "insert at top" and "insert at
bottom" patterns.)

> --- a/xen/include/xlat.lst
> +++ b/xen/include/xlat.lst
> @@ -168,6 +168,7 @@
>  !	processor_performance		platform.h
>  !	processor_power			platform.h
>  ?	processor_px			platform.h
> +!	processor_cppc			platform.h
>  !	psd_package			platform.h
>  ?	xenpf_enter_acpi_sleep		platform.h
>  ?	xenpf_pcpu_version		platform.h

Please obey to sorting in this file.

Jan

