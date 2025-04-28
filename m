Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B8BA9F507
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 17:57:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970892.1359447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9QrN-0004Y5-Kl; Mon, 28 Apr 2025 15:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970892.1359447; Mon, 28 Apr 2025 15:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9QrN-0004VM-HQ; Mon, 28 Apr 2025 15:57:33 +0000
Received: by outflank-mailman (input) for mailman id 970892;
 Mon, 28 Apr 2025 15:57:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9QrL-0004VC-9K
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 15:57:31 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ca336d7-2449-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 17:57:29 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-abec8b750ebso823850566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 08:57:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6dee6ec6sm644005466b.0.2025.04.28.08.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 08:57:28 -0700 (PDT)
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
X-Inumbo-ID: 7ca336d7-2449-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745855848; x=1746460648; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b++uVKJkqErDmnya/SJFm/yjmfLDjx7iRvKe+DeeKsI=;
        b=JtcSADBdhIEm3KQHiCWIJ2ra8kIzXMqg5+xSB16CCDVtTw2CrU0P5aJjC2Ul8u8SNK
         PlRFOm3Y2l8otIn1U2hkwQggTCpkHhZx3kcZprKyhEfNpVVKH1euaalS6Ejo5oLNLYzn
         F1SSvxbtPutlpxRTtyKKfSZeCByvxCnqcmSG4zSX+L6KwW1QttnFQhQgwWHrKk8u6kXC
         blIecPUnb9tG7khKshi8NEs9Ah7CKEf+2iSR/7maeHgi8Kz/JhIg4iYzCn/qxEMobKxU
         A6dRH8TAt8IiLIXgu7tvSfZ7zq2FhhGcwxCVfhDlwXblFrLpEytuYY6xFmtNvw4hzD/N
         e0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855848; x=1746460648;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b++uVKJkqErDmnya/SJFm/yjmfLDjx7iRvKe+DeeKsI=;
        b=RiHAMOn114El4YhWqzox1ssosz4FhQ00CdOUPqU+SUNfoLk3fZikkJVc67m9JtE3fM
         181L1d6kMp34rRSofxrX6wMmUD/UrttnPQvC+Pv5xg2oR31MNGEp2sF1Ze1BuWsFwb4e
         JSMK/vrh2qkiRXGfU5d5iUoxkJSolv5TUKSVV5Q7kUpMdQ5PbYeTf72mX5gVu4v0BRhw
         H2c36cM874KfMXEaYHGbCF6BW9rjUqTOv0rHSeZjwJDs7iwpyWkmy8MnrS5dyc53DGuH
         1ew8S8VuQosowTiglu3IU92oKGwEJo4Jb/s318CE4iFYjva8L3HbxhEaJSRR7HBKnGKG
         A5BA==
X-Forwarded-Encrypted: i=1; AJvYcCWwt7+iAf5TFSGBEc4PglRyITzIZMUgNtj5ET1Aviyk1EjiDSBn8LU0JOPdCdI7un+sKSMgQHEhRfk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy72dWUDnMVDIuvg+q9P32JzWSnsFdNkNU8yExbXWXmDgPlf8me
	qoBx7dTukV42LFax9403Sr4qu59hbbvIQNKoqu7qFL8hnXqZZe7N3e4uuoquaQ==
X-Gm-Gg: ASbGncsdSQz1MS/ijROgCrM9sy84lf9kBzd6Q5k+biNgHUeErhrEbRQgTjoMO+RoqDr
	WtZG6IJybuArSQMJxDmjV6Af4FxyK9DCfHx/PZAtK3gBvSTSEzQU6I+/ofvsdtPZjEEeBpq4/tp
	7FHaCAdTZuKzvHU/xd4bhqkEd65ztuXpaL0Y7TLJbcUVr5rxKD+1BmG6nV2MlzwpqT1iV3JmmFP
	VGFR7kNNqEpRIqmMVZlD/625e3bLGRCAQFYL62JkWQGOxg0tCcxv6EB+fUD4Z7eIUj6XOhloHV3
	UUW1vOvcat/E1sJT5n5zK7i2AzN+Ucyyno0HLxGvN8LLPcPsuMqG0AiGrKzT3LJnitTwglslE8R
	IFi5bB0ztaYIIFWhOFW4ziHhjWRIsPuv6yiqP
X-Google-Smtp-Source: AGHT+IHMFtVMMJ0N5Sp5WL2wnqfJyEVGhCqdSrFbuYOKrTPXixP+0LFQcvfRVPPr+lw2NhXuwhwqXg==
X-Received: by 2002:a17:907:d1b:b0:ac3:991:a631 with SMTP id a640c23a62f3a-ace71177f36mr972539666b.34.1745855848504;
        Mon, 28 Apr 2025 08:57:28 -0700 (PDT)
Message-ID: <2e1de23f-cc79-4d37-8667-0afd07736db3@suse.com>
Date: Mon, 28 Apr 2025 17:57:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/15] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-4-Penny.Zheng@amd.com>
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
In-Reply-To: <20250414074056.3696888-4-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 09:40, Penny Zheng wrote:
> In order to provide backward compatibility with existing governors
> that represent performance as frequency, like ondemand, the _CPC
> table can optionally provide processor frequency range values, Lowest
> frequency and Norminal frequency, to let OS use Lowest Frequency/

Nit: Nominal

> @@ -497,12 +504,19 @@ static void print_PPC(unsigned int platform_limit)
>      printk("\t_PPC: %d\n", platform_limit);
>  }
>  
> -static int check_psd_pminfo(const struct xen_processor_performance *perf)
> +static int check_psd_pminfo(const struct xen_processor_performance *perf,
> +                            const struct xen_processor_cppc *cppc_data)
>  {
> +    uint32_t shared_type;
> +
> +    if ( !perf && !cppc_data )
> +        return -EINVAL;
> +
> +    shared_type = perf ? perf->shared_type : cppc_data->shared_type;

Why don't you have the caller pass in shared_type? The two pointers aren't
used ...

>      /* check domain coordination */
> -    if ( perf->shared_type != CPUFREQ_SHARED_TYPE_ALL &&
> -         perf->shared_type != CPUFREQ_SHARED_TYPE_ANY &&
> -         perf->shared_type != CPUFREQ_SHARED_TYPE_HW )
> +    if ( shared_type != CPUFREQ_SHARED_TYPE_ALL &&
> +         shared_type != CPUFREQ_SHARED_TYPE_ANY &&
> +         shared_type != CPUFREQ_SHARED_TYPE_HW )
>          return -EINVAL;
>  
>      return 0;

... for anything else.

> @@ -627,6 +641,109 @@ out:
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
> +    {
> +        ret = -EINVAL;
> +        goto out;
> +    }
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
> +
> +    if ( cppc_data->flags & XEN_CPPC_PSD )
> +    {
> +        ret = check_psd_pminfo(NULL, cppc_data);
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
> +                cppc_data->cpc.lowest_nonlinear_perf ||

Where's this ordering spelled out in the spec?

> +             cppc_data->cpc.lowest_nonlinear_perf >
> +                cppc_data->cpc.nominal_perf ||
> +             cppc_data->cpc.nominal_perf > cppc_data->cpc.highest_perf )
> +            /*
> +             * Right now, Xen doesn't actually use perf values
> +             * in ACPI _CPC table, warning is enough.
> +             */
> +            printk(XENLOG_WARNING
> +                   "Broken CPPC perf values: lowest(%u), nonlinear_lowest(%u), nominal(%u), highest(%u)\n",
> +                   cppc_data->cpc.lowest_perf,
> +                   cppc_data->cpc.lowest_nonlinear_perf,
> +                   cppc_data->cpc.nominal_perf,
> +                   cppc_data->cpc.highest_perf);

If this warning was to ever surface, it would likely surface for every CPU.
That's unnecessarily verbose, I guess. Please consider using printk_once()
here.

Also, is "right now" (as the comment says) still going to be true by the
end of the series? Didn't I see you use the values in earlier versions?

> +        /* lowest_mhz and nominal_mhz are optional value */
> +        if ( (cppc_data->cpc.lowest_mhz && cppc_data->cpc.nominal_mhz) &&
> +             cppc_data->cpc.lowest_mhz > cppc_data->cpc.nominal_mhz )

The 1st of the three checks is redundant with the 3rd one. There's also no
point parenthesizing one && against another.

> +            printk(XENLOG_WARNING
> +                   "Broken CPPC freq values: lowest(%u), nominal(%u)\n",
> +                   cppc_data->cpc.lowest_mhz,
> +                   cppc_data->cpc.nominal_mhz);
> +    }
> +
> +    if ( cppc_data->flags == (XEN_CPPC_PSD | XEN_CPPC_CPC) )

If either flag may be clear, ...

> +    {
> +        pm_info->cppc_data = *cppc_data;
> +        if ( cpufreq_verbose )
> +        {
> +            print_PSD(&pm_info->cppc_data.domain_info);
> +            print_CPPC(&pm_info->cppc_data);

... why unconditionally loog both?

> +        }
> +
> +        pm_info->init = XEN_CPPC_INIT;

Plus is it correct to set this flag if either of the incoming flags was clear?

> +        ret = cpufreq_cpu_init(cpuid);
> +#ifndef NDEBUG

Instead of this, ...

> +        if ( ret )
> +            printk(XENLOG_WARNING "No fallback scheme could be replaced now");

... did you perhaps mean to use dprintk()? Also, the wording isn't meaningful
at all. Seeing the message, about everyone will need to go and find the text
in source code in order to stand a chance of gaining even basic understanding
of what's going on.

> @@ -459,6 +464,26 @@ struct xen_processor_performance {
>  typedef struct xen_processor_performance xen_processor_performance_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_processor_performance_t);
>  
> +struct xen_processor_cppc {
> +    uint8_t flags; /* flag for CPPC sub info type */
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
> +    struct xen_psd_package domain_info; /* _PSD */

This being a member of the new type, ...

> --- a/xen/include/xlat.lst
> +++ b/xen/include/xlat.lst
> @@ -168,6 +168,7 @@
>  !	processor_performance		platform.h
>  !	processor_power			platform.h
>  ?	processor_px			platform.h
> +?	processor_cppc			platform.h

... how can it be ? here when it's ...

>  !	psd_package			platform.h

... ! here? And with it being ?, you're lacking a place where you invoke the
resulting checking macro (which I assume would cause a build failure).

Also when laying out struct xen_processor_cppc, please avoid unnecessary
gaps or tail padding - it looks like "shared_type" would better move up. I
think it would also be a good idea to make padding fields explicit, and
check them to be zero. This way they can be assigned meaning later (if need
be) without breaking backwards compatibility.

Jan

