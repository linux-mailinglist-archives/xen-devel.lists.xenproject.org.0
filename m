Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6BFB07A17
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 17:39:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045382.1415495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4E7-00032G-16; Wed, 16 Jul 2025 15:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045382.1415495; Wed, 16 Jul 2025 15:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4E6-00030G-U6; Wed, 16 Jul 2025 15:39:22 +0000
Received: by outflank-mailman (input) for mailman id 1045382;
 Wed, 16 Jul 2025 15:39:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc4E6-0002zr-7D
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 15:39:22 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0992b593-625b-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 17:39:19 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so604200f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 08:39:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9f20e812sm1606639a91.33.2025.07.16.08.39.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 08:39:17 -0700 (PDT)
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
X-Inumbo-ID: 0992b593-625b-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752680358; x=1753285158; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jOBMhPkFwvcdHtLA93Be6UyKC5dBxPVlPMyPp97D4yo=;
        b=LZZTIenEd4Z73d+K8orZB8BUuqj5XhZa1KuD1xzI81AnUqi29dM2nlzUmTqsFrLLPo
         XX07vPnE253ICajd2hb4SQZrpZqGpxX9VHHfzUiPZ3CvnRVmgLawQ0+dXDPt2nR2Ls9y
         QNpriLF/rZnssRiSjRCXB0l0/WwMkSDIq1kdrAqr5qWu6NTp5yqhHrz2KnVma3N14M+r
         QM1VZs8YLPzH8uoFdnkMb5mPq8OP6kZl38SL2ujoC/8EBd+VMO9dK89CrWmcNdmLxtAr
         lkHczAygWLBpXOsB5Z5LZE5ICqm66AJPpyw91+vnDuJ4+ZsLwUgYLEQR7gMD4ZKf22Ot
         iTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680358; x=1753285158;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOBMhPkFwvcdHtLA93Be6UyKC5dBxPVlPMyPp97D4yo=;
        b=FZR8+HUXGIjFRzIMQRoHdIO8w75eTDCH7Nac9yDHJBGCioQ3EpZ9F7DoxaSAVxCK3R
         F+vbv9NU3bhD/ZAJODwb/tnGoRqKG0SbqoMJeu4VkO2vZzCcywbJEWtF8pnzKilmv45m
         41JVdl/dhZoQRIZrtX1RR+C2lmtH2qehXSxP5TiAeuKjxqMoa6ihOZ78Y3DIhaAh5XZH
         cgwV6UDwKj2onHuULtfEv/OX2/s1BF6F6q5vvUxr26KNSe2kXmorAAIOkXztLQF0OwDa
         YqqMpqry0xa5+QfHdiCW4DTzIvrLhOetpHfciqaBC/wfOY8BBjC3coRc+LOEZ4/vJx7N
         mntQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrMhT/KALhQtVDTvHLA92MqfgGs07g81eBWI1zKnK9sxXw/nSwTNuCq5RYaw/nBNH4OQqMVpP6xhg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydiyeFu6/y/TGXYyXOMcCQgPtSuemIQq8MqJwXIXUPCMm1xj7h
	6RorG5ki9rdVDiJUCNTOtQsRK1ZXdreBpO7IfxG3Ug3ZEieXAolg/POZruH/ZIAJWA==
X-Gm-Gg: ASbGnctOVP7Er3zzRd0ktyMy8mNy/EH61Iz5M1UO2sWjNAvkcAszqBjG6gc1iJvol7T
	XX1SoZ2v5vm+95+DU4CIcnSXQ/lmkgYHQs7GzcYWS2nEwLOqB7IBhKqo8xBMM0jFCanjz8nNANT
	BtzhqAxJ+lFoYNQqrOIVTQuf5C26ZFMXEx0MYH3UXQ3t7Bup2dG6Mmz+zBxfhGKWF9WA41N7BD/
	ikNQ1AnfzMQ7pUkFBCyEFjT06tJf/d2rMdtdphD1i0noclxdFtOKc3nWaZBlGjGy98dUdHA7N8z
	qKGL2r4DuvCwDH88jMvQ48UZzyzOgW7n0nWoHg5xHxBqmgflo7/cLR3iLA9SiUpuSLGMKfIDehI
	GyXNuTFu03sQJGAWUB1hOaOYeTUf4wzbi5N1SWFWFbxsPRqlSB/oZP1w8X+/AGTaoyzveX5HJ/s
	lPq4YIFN4=
X-Google-Smtp-Source: AGHT+IEJaF75DsVZVt+/n4EwVhkxdUn2u6CLNMroZ4j8KeBrilhrVCqg8lBiEyQxoTUy3JutCZ9URA==
X-Received: by 2002:a05:6000:65b:b0:3a5:270e:7d3 with SMTP id ffacd0b85a97d-3b613909f16mr18947f8f.13.1752680358487;
        Wed, 16 Jul 2025 08:39:18 -0700 (PDT)
Message-ID: <916162aa-01fa-42a3-82c6-42a2c635f082@suse.com>
Date: Wed, 16 Jul 2025 17:39:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/19] xen/cpufreq: introduce new sub-hypercall to
 propagate CPPC data
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-11-Penny.Zheng@amd.com>
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
In-Reply-To: <20250711035106.2540522-11-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 05:50, Penny Zheng wrote:
> --- a/xen/drivers/acpi/pm-op.c
> +++ b/xen/drivers/acpi/pm-op.c
> @@ -91,7 +91,8 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>      pmpt = processor_pminfo[op->cpuid];
>      policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
>  
> -    if ( !pmpt || !pmpt->perf.states ||
> +    if ( !pmpt || ((pmpt->init & XEN_PX_INIT) && !pmpt->perf.states) ||
> +         ((pmpt->init & XEN_CPPC_INIT) && pmpt->perf.state_count) ||

Nit: I think this would be neater if the PX_INIT part was also moved to its own
line.

> @@ -697,6 +703,122 @@ int acpi_set_pdc_bits(unsigned int acpi_id, XEN_GUEST_HANDLE(uint32) pdc)
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
> +        printk("Set CPU acpi_id(%u) cpuid(%d) CPPC State info:\n",

May I suggest "Set CPU%d (ACPI ID %u) CPPC state info:\n"

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
> +        if ( !check_psd_pminfo(cppc_data->shared_type) )

Please convert these into a single if().

> +        {
> +            ret = -EINVAL;
> +            goto out;
> +        }
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
> +                cppc_data->cpc.lowest_nonlinear_perf ||
> +             cppc_data->cpc.lowest_nonlinear_perf >
> +                cppc_data->cpc.nominal_perf ||

Indentation is a little odd here. Best may be to use parentheses:

             cppc_data->cpc.lowest_perf > UINT8_MAX ||
             (cppc_data->cpc.lowest_perf >
              cppc_data->cpc.lowest_nonlinear_perf) ||
             (cppc_data->cpc.lowest_nonlinear_perf >
              cppc_data->cpc.nominal_perf) ||

Otherwise, strictly speaking, no extra indentation should be used. I can see
though that this would hamper readability, so the next best alternative would
appear to be to make the extra indentation a proper level (i.e. 4 blanks):

             cppc_data->cpc.lowest_perf > UINT8_MAX ||
             cppc_data->cpc.lowest_perf >
                 cppc_data->cpc.lowest_nonlinear_perf ||
             cppc_data->cpc.lowest_nonlinear_perf >
                 cppc_data->cpc.nominal_perf ||

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

If they're optional, what if lowest_mhz is provided but nominal_mhz isn't?
Wouldn't the warning needlessly trigger in that case?

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
> +        if ( ret )
> +            printk_once(XENLOG_WARNING
> +                        "CPU%u failed amd-cppc mode init; use \"cpufreq=xen\" instead",
> +                        cpuid);

cpuid is still int, so wants printing with %d.

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

As per this, ...

> @@ -457,6 +462,26 @@ struct xen_processor_performance {
>  typedef struct xen_processor_performance xen_processor_performance_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_processor_performance_t);
>  
> +struct xen_processor_cppc {
> +    uint8_t flags; /* IN: XEN_CPPC_xxx */

... it's a type that's living here, not a collection of flags. Any reason the
field isn't named "type"?

> +    uint8_t pad[3];
> +    /*
> +     * IN: Subset _CPC fields useful for CPPC-compatible cpufreq
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

What, again, was the reason to wrap these into a sub-struct?

Jan

