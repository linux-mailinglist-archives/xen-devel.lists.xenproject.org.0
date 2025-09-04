Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2804EB43B32
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 14:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109931.1459304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu8oV-00046I-85; Thu, 04 Sep 2025 12:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109931.1459304; Thu, 04 Sep 2025 12:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu8oV-00043l-52; Thu, 04 Sep 2025 12:11:39 +0000
Received: by outflank-mailman (input) for mailman id 1109931;
 Thu, 04 Sep 2025 12:11:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uu8oT-00043c-A3
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 12:11:37 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cf387e0-8988-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 14:11:34 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afec5651966so185028366b.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 05:11:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0470f11088sm298889166b.111.2025.09.04.05.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 05:11:34 -0700 (PDT)
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
X-Inumbo-ID: 4cf387e0-8988-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756987894; x=1757592694; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8Q3EHp9v6FdnZ7sKhzqDgygy/4jbvc7hiANoP2TGvuk=;
        b=be1QH5upUK+tlQjMsAyei6n0z6/ScUatu/Tk0qMAPR2YGz6NXVCNiC7dzM0m1q5wlj
         19qtd1Zro0VZACeePz/L8cPzfi6mbujnzTW6qUhDLKpAXN5uiiB7A4a60wRzvv/7FIT+
         NUk+sCIIRIIaldHhuI634aLyk6qpATVayNQ4NNg2kN0FHdh2u3dq/wgu43HVNP8tvLaj
         dfkH9j85otiunwf0BTi2GFHQqZt59K0RKrdi8bTc7o68TaS9s0wgstoxgH8y62etTRgb
         t+bimGAkhLYw2+zZXzy/9eq5hRGLJBcbNsIHS7+zT+l4nZGIddR2usiAHaS5c03c0t08
         Gs4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756987894; x=1757592694;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Q3EHp9v6FdnZ7sKhzqDgygy/4jbvc7hiANoP2TGvuk=;
        b=C9UXkA+VubpLVzTlzjN5C8GjRWwcrnSi4617EtzScvjBZFYVtR+eGJ/0X+e75DBJR4
         uJVVu0rg1F0SyYztluJD4dFfsn39qad8c9sbIBV3GexvqN0348yBEMcXhZS06rOAgOAI
         YipyM7gEPr3UewtzpNrM+IjFFRdNu65Wh2les8KD/eJa78xkWBFvHnxRYUH/wAaSnQ1R
         pqde0LEFooDG9nXJdcF/pjZxZj8hmOcxM2C7PGwV7XfV2J6Fmo41wcTXjqBiDUmdcT7C
         EOpsRxpyB1WX+2/1WbteW5SWqtTiD7nTplSrS1vS4U/ha9KhSBoQnrpwo8dV7IU4d2BN
         +L0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdWRXNiCmXfSQroEJOzKOc8XZ9GTy3EiZPc5zFdW+z8GU8IbJpAgG73XV3sCaRRTaBnhXDxBKKAy0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxv+NwlBt5mp5QMxqNj4aE0ZNiSftoVMjqTpCrolTDNLC1dD+2w
	eTBSfIHAAS+eL5mvJCHDNMkqskJYQ1YxNWeqlNSrGWqPKO9Fc0aVtp6PC4kBlNVFNw==
X-Gm-Gg: ASbGncvHwsNY4LdEk4cgwU/fd4jSmZkz+hnwRnw3c5W0sTYmpzuR5NCRE8Pw1iIoCc3
	imkQzDITw4MclZcP3Oc+hNH/jvQpBFNMQLoopESfo2ZEgEtQT6o2kVvrxZzVeXm7cw93NIsQly5
	R+jLe94FsTNVVl7vVTkwhQQEgNo8Gbu8u/SuA/ItGW7hAlqbBwbBthVWrq+VKT1I9MsFVOFcCk+
	UEEYmyXn3aNqenErSVV2sPCqosH2kbx0mMNr1fpvu5H676MRcf0AkOUUo7sxBYLJ+e4nHu5xXI+
	lacKrxNH+tgJ1VTfh3LHSMrKnTnY62ZfuISEJBle3h7kl1kPmNnbTwUkJbU2oa6vxgIsCcxf+eV
	kuWWP4/LMvcAhIjUeW9uNzA47liacvRrm+ktXbI2J3uCgGva5Zy44+oihCRS5bK+QazOlRnLjsv
	lXpe+lJ/U=
X-Google-Smtp-Source: AGHT+IHkUcuqwzDVqhNhZE8NGgCet4Xtlfsz24oRz6u9rPdnIXCZTAFmc9X68dABcGkOcJ9XRzzqBw==
X-Received: by 2002:a17:906:4fca:b0:b04:6546:347e with SMTP id a640c23a62f3a-b0465463a5bmr659419766b.51.1756987894499;
        Thu, 04 Sep 2025 05:11:34 -0700 (PDT)
Message-ID: <71560c55-b3e7-4049-bf7d-5474982c76dd@suse.com>
Date: Thu, 4 Sep 2025 14:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] xen/cpufreq: implement amd-cppc driver for CPPC in
 passive mode
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
 <20250904063518.2097629-3-Penny.Zheng@amd.com>
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
In-Reply-To: <20250904063518.2097629-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.09.2025 08:35, Penny Zheng wrote:
> @@ -50,10 +139,333 @@ int __init amd_cppc_cmdline_parse(const char *s, const char *e)
>      return 0;
>  }
>  
> +/*
> + * If CPPC lowest_freq and nominal_freq registers are exposed then we can
> + * use them to convert perf to freq and vice versa. The conversion is
> + * extrapolated as an linear function passing by the 2 points:
> + *  - (Low perf, Low freq)
> + *  - (Nominal perf, Nominal freq)
> + * Parameter freq is always in kHz.
> + */
> +static int amd_cppc_khz_to_perf(const struct amd_cppc_drv_data *data,
> +                                unsigned int freq, uint8_t *perf)
> +{
> +    const struct xen_processor_cppc *cppc_data = data->cppc_data;
> +    unsigned int mul, div;
> +    int offset = 0, res;
> +
> +    if ( cppc_data->cpc.lowest_mhz &&
> +         data->caps.nominal_perf > data->caps.lowest_perf &&
> +         cppc_data->cpc.nominal_mhz > cppc_data->cpc.lowest_mhz )
> +    {
> +        mul = data->caps.nominal_perf - data->caps.lowest_perf;
> +        div = cppc_data->cpc.nominal_mhz - cppc_data->cpc.lowest_mhz;
> +
> +        /*
> +         * We don't need to convert to kHz for computing offset and can
> +         * directly use nominal_mhz and lowest_mhz as the division
> +         * will remove the frequency unit.
> +         */
> +        offset = data->caps.nominal_perf -
> +                 (mul * cppc_data->cpc.nominal_mhz) / div;
> +    }
> +    else
> +    {
> +        /* Read Processor Max Speed(MHz) as anchor point */
> +        mul = data->caps.highest_perf;
> +        div = this_cpu(pxfreq_mhz);

How do you know you ever initialized this instance of the per-CPU variable?
amd_cppc_init_msrs() may never have run for this particular CPU.

> +static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
> +                                            unsigned int target_freq,
> +                                            unsigned int relation)
> +{
> +    struct amd_cppc_drv_data *data = policy->u.amd_cppc;
> +    uint8_t des_perf;
> +    int res;
> +
> +    if ( unlikely(!target_freq) )
> +        return 0;
> +
> +    res = amd_cppc_khz_to_perf(data, target_freq, &des_perf);
> +    if ( res )
> +        return res;
> +
> +    /*
> +     * Having a performance level lower than the lowest nonlinear
> +     * performance level, such as, lowest_perf <= perf <= lowest_nonliner_perf,
> +     * may actually cause an efficiency penalty, So when deciding the min_perf
> +     * value, we prefer lowest nonlinear performance over lowest performance.
> +     */
> +    amd_cppc_write_request(policy->cpu, data, data->caps.lowest_nonlinear_perf,
> +                           des_perf, data->caps.highest_perf,
> +                           /* Pre-defined BIOS value for passive mode */
> +                           per_cpu(epp_init, policy->cpu));

This may access per-CPU data of an offline CPU.

Jan

