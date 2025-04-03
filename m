Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C22BA79D77
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 09:55:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936316.1337597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0FPf-0003nJ-Fc; Thu, 03 Apr 2025 07:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936316.1337597; Thu, 03 Apr 2025 07:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0FPf-0003lo-Bs; Thu, 03 Apr 2025 07:54:59 +0000
Received: by outflank-mailman (input) for mailman id 936316;
 Thu, 03 Apr 2025 07:54:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0FPe-0003li-35
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 07:54:58 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef6f0e6c-1060-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 09:54:57 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso2338325e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 00:54:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec16a3aefsm14012145e9.21.2025.04.03.00.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 00:54:56 -0700 (PDT)
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
X-Inumbo-ID: ef6f0e6c-1060-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743666896; x=1744271696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gaMukuvdUIaWagUwyVANBOItJ+CWoS5b6z07Y9WIUcs=;
        b=RtvkWbms564jOGp6d3tKq7RmNQyBGEefcHxarNXSFXsORwu0b7PB1zH4Nq4/CA2G6v
         4PkNf4ZVpTelwj8grYCI8IIxm7yhzfYGM7DDG6PH2gSdHwgIH6GpxPgvytwQR5Xdt5Rn
         +HmOh83swhTev/M0y9nFq/ciiNOIU/uiOTHA/zv3qBHl4aLH6PUZOzZwVEs9krPBmxns
         V7F1trwScCpVCfhD11bLEQM2zoDAs6skRueVl8vvnHkB/+YPXj3QQVf4mHhpI8tfhv4t
         5AJTGDPDtgzMUycfzDJarzuPsNYRbTLvIMSP66L7dvV0b3MKzXYM+FZa9AOtYNu76gmq
         KRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743666896; x=1744271696;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaMukuvdUIaWagUwyVANBOItJ+CWoS5b6z07Y9WIUcs=;
        b=IrV7cw6wZAnkhClsCWplD0+eqpXXU35rsOFNozhA6zwykirapFNnZUrzTjKdPjpCG4
         sfdzEHFlaTKMW4RTLmU2V6jDPTLt6qJvmFyTS4UXnfm+Ygh0PvR6gL1ymXLp/xh8IGro
         CT4m55a6VII270mENSd2rhlU+8IUeRWk0pO9/hCvzKZL4UXN0Nuh9kJb9OJ5Bt8op0R2
         bhmQFVFe0KXVxti0YRN2m2K06pAF1/gEh7nQrK0BDKa55NvMt/WwqnApIDbMUFYfC1Vq
         pzrfZXEERYa1HhrJkHgAEZ7xtw/Hkq6RHXAH5yZvgGBwZPp7BfzvO86Z1V/EKmdaqeYd
         7c6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIMRiYZBOvWaN5G3S0CYJd2NlKPd9qmhJtj7QGq7K23rBDDK/IhZV4F3w520oCs3PCxyKMgsocfmc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwiTSqjNXFaeGQ5kWkL8uU9DAd3fG8aIWFx6QI6pjERU0/LKLz
	1DIbZ7VCXixJVgDt00L/vleRA9ZpkpvagP7SXgr0R5iipAqZoU0DjpreggbicA==
X-Gm-Gg: ASbGncuSrB4UA0/hjQj+lf+ab+SsNif8H5EhCrAWj3WeOu1YyIKgMGhkT8JFfcykBGM
	SczUB3KDg+ogpd7X8Fijw/E6dcWEE+8gMOI5v9p9lNna5GrIaqmhT4ZMJUmDRAUV0RU5GtHMFyK
	XcPEtJS7aUED5LVzEtZqlze/K6+1+pUR9xHNfs6Zd87bqBhnyLyXYsqVKdIDIb3Xf6jYNwZMEEZ
	KAd0mWOR0CyIjTutR/3OHcMu4C9mlBI0JpnfbFyuSXHC1WUv/AJC1aoqKaR05fkdlqucP+SZ05c
	n2bHuQ7b0lRCzaVmIrvVjwbl+fSqFOaJVDEZywnnAiw/JWDpqQMTskpcsOgQnGbpgGCPe7W56st
	mwAtj7Y+S7EBC84CeCmDyegUdgTjXSg==
X-Google-Smtp-Source: AGHT+IEwjfGjl8AT0TU8Zkz5++wpBF9fYqfr+yysc/RNsqrAqP+pg3+q9NTn83mqzI9yF8ljjXByKw==
X-Received: by 2002:a05:600c:510c:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-43ec139aa3amr13532525e9.8.1743666896422;
        Thu, 03 Apr 2025 00:54:56 -0700 (PDT)
Message-ID: <38efe2ef-a87e-4558-8532-01be16626787@suse.com>
Date: Thu, 3 Apr 2025 09:54:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/15] xen/x86: introduce a new amd cppc driver for
 cpufreq scaling
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-10-Penny.Zheng@amd.com>
 <4fe44e49-f55d-4d2a-ac02-538038e9128c@suse.com>
 <DM4PR12MB84513D678809A610AA9551D0E1AE2@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84513D678809A610AA9551D0E1AE2@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2025 09:40, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, March 25, 2025 5:58 PM
>>
>>> +#define amd_get_freq(name)                                                  \
>>
>> The macro parameter is used just ...
>>
>>> +    static int amd_get_##name##_freq(const struct amd_cppc_drv_data
>>> + *data,  \
>>
>> ... here, ...
>>
>>> +                                     unsigned int *freq)                    \
>>> +    {                                                                       \
>>> +        const struct xen_processor_cppc *cppc_data = data->cppc_data;       \
>>> +        uint64_t mul, div, res;                                             \
>>> +                                                                            \
>>> +        if ( cppc_data->name##_mhz )                                        \
>>> +        {                                                                   \
>>> +            /* Switch to khz */                                             \
>>> +            *freq = cppc_data->name##_mhz * 1000;                           \
>>
>> ... twice here forthe MHz value, and ...
>>
>>> +            return 0;                                                       \
>>> +        }                                                                   \
>>> +                                                                            \
>>> +        /* Read Processor Max Speed(mhz) as anchor point */                 \
>>> +        mul = this_cpu(amd_max_freq_mhz);                                   \
>>> +        if ( !mul )                                                         \
>>> +            return -EINVAL;                                                 \
>>> +        div = data->caps.highest_perf;                                      \
>>> +        res = (mul * data->caps.name##_perf * 1000) / div;                  \
>>
>> ... here for the respective perf indicator. Why does it take ...
>>
>>> +        if ( res > UINT_MAX )                                               \
>>> +        {                                                                   \
>>> +            printk(XENLOG_ERR                                               \
>>> +                   "Frequeny exceeds maximum value UINT_MAX: %lu\n", res);  \
>>> +            return -EINVAL;                                                 \
>>> +        }                                                                   \
>>> +        *freq = (unsigned int)res;                                          \
>>> +                                                                            \
>>> +        return 0;                                                           \
>>> +    }                                                                       \
>>> +
>>> +amd_get_freq(lowest);
>>> +amd_get_freq(nominal);
>>
>> ... two almost identical functions, when one (with two extra input parameters) would
>> suffice?
>>
> 
> I had a draft fix here, If it doesn't what you hope for, plz let me know
> ```
> static int amd_get_lowest_and_nominal_freq(const struct amd_cppc_drv_data *data,
>                                            unsigned int *lowest_freq,
>                                            unsigned int *nominal_freq)

Why two outputs now when there was just one in the macro-ized form? I was
rather expecting new inputs to appear, to account for the prior uses of
the macro parameter. (As a result the function is now also quite a bit
more complex than it was before. In particular there was no ...

> {
>     const struct xen_processor_cppc *cppc_data = data->cppc_data;
>     uint64_t mul, div, res;
>     uint8_t perf;
> 
>     if ( !lowest_freq && !nominal_freq )
>         return -EINVAL;
> 
>     if ( lowest_freq && cppc_data->cpc.lowest_mhz )
>         /* Switch to khz */
>         *lowest_freq = cppc_data->cpc.lowest_mhz * 1000;
> 
>     if ( nominal_freq && cppc_data->cpc.nominal_mhz )
>         /* Switch to khz */
>         *nominal_freq = cppc_data->cpc.nominal_mhz * 1000;
> 
>     /* Still have unresolved frequency */
>     if ( (lowest_freq && !(*lowest_freq)) ||
>          (nominal_freq && !(*nominal_freq)) )
>     {
>         do {
>             /* Calculate lowest frequency firstly if need */
>             if ( lowest_freq && !(*lowest_freq) )
>                 perf = data->caps.lowest_perf;
>             else
>                 perf = data->caps.nominal_perf;
> 
>             /* Read Processor Max Speed(MHz) as anchor point */
>             mul = this_cpu(amd_max_pxfreq_mhz);
>             if ( mul == INVAL_FREQ_MHZ || !mul )
>             {
>                 printk(XENLOG_ERR
>                        "Failed to read valid processor max frequency as anchor point: %lu\n",
>                        mul);
>                 return -EINVAL;
>             }
>             div = data->caps.highest_perf;
>             res = (mul * perf * 1000) / div;
> 
>             if ( res > UINT_MAX || !res )
>             {
>                 printk(XENLOG_ERR
>                        "Frequeny exceeds maximum value UINT_MAX or being zero value: %lu\n",
>                        res);
>                 return -EINVAL;
>             }
> 
>             if ( lowest_freq && !(*lowest_freq) )
>                 *lowest_freq = (unsigned int)res;
>             else
>                 *nominal_freq = (unsigned int)res;
>         } while ( nominal_freq && !(*nominal_freq) );

... loop there.)

Jan

>     }
> 
>     return 0;
> }
> ```


