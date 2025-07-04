Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C13AF87D1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 08:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032786.1406188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXZnX-0006Ka-Co; Fri, 04 Jul 2025 06:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032786.1406188; Fri, 04 Jul 2025 06:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXZnX-0006J8-9m; Fri, 04 Jul 2025 06:21:23 +0000
Received: by outflank-mailman (input) for mailman id 1032786;
 Fri, 04 Jul 2025 06:21:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXZnV-0006J2-8K
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 06:21:21 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 170797eb-589f-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 08:21:16 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so404962f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 23:21:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c8434f0cdsm11636925ad.77.2025.07.03.23.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 23:21:14 -0700 (PDT)
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
X-Inumbo-ID: 170797eb-589f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751610075; x=1752214875; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hPYvIdqNloTggurBW/gf11WC0VSBbWjYNwH0nO4fFKA=;
        b=ULsYNAnXM6Of2p/Up1okV4ExCuM7LZwmS5TDgZoZRo6dtOk0UQTPOvC9CvOi7YmPJj
         yf2v+N4CH0a7iH/LgQZ+0DL+0WbYK/LmCpVuaUuTUpqJB52zqZmdICHi1LltFsUsiyYB
         d1hHFX/ywqZ3QXyPhMBPxkvy5YCiUSGYr8PtKeW10Knyw4MGBDj4hx7KR7InNAAwHFph
         7eIh0qeICMlUtdekLWEvddFffW+WWkDPgp+qIMh1+kSokX8y7xG9XvWxqQZ+2PSGjsQ8
         DTeW51x1goX8kgDksRi7TD3xa3nQ3tw1TR78VWQ6jbWgYUFRrd2xD1s6X1xBA49AZpxM
         qwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751610075; x=1752214875;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPYvIdqNloTggurBW/gf11WC0VSBbWjYNwH0nO4fFKA=;
        b=I1iYUmdZ6d4Rlda9ad6AzzBQfpL/+lYW3e8FPREYJnmEqjZn1yed6z5AWG/H8z5iGX
         NdM892VGhVv4ux0x1qodv9IUo1Edxqv3cpTz9v1WgYnlu5a37XI7ZBpa9UCyhSOq4Uqg
         v2Az3gyJ92gAMNn4VJ9kBIW33jZFmqplbS1axC6MV0aL9tBk5NINiyQcEYnYZwXznMSr
         nqMuNPkUSsAsNrXBCOOQx8UknKXYKqL5D5T2is3f23+LXWcmI4N3+bDRqX59T5/1CQvm
         fzsv+Gw7edQ8xK035nS9bayqxclGUuZPvr6PLP60J1jNQ+PsofsScIGwRgK3f8Ko4/X2
         yrKg==
X-Forwarded-Encrypted: i=1; AJvYcCVB6IFIQ13DBVKsg3Cbdx3dxF5fv7URVZTlpB+F9V7py7ez+Zdoty3kShmsZU9TnYRcCrQKctWP1Uc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5j48c11JdNlA6klxRylKgwbWxq/v+Ka+x+AxoYEdnT/t/OpXP
	D9XE+SzJR02nXv72yPHqeEUSk1Z10q+VP2B7neHp2ge5Fliu8cHq1FL/f21zDI5D9g==
X-Gm-Gg: ASbGncueYXIP12hdIGjpe2uS+5dd+xu7hHXmJpBQtDoolao/sGiqmUTiwK/aU0rl4nk
	abH5AiLYo6BIas4NyHFbncqLzZaHhTxvxG5VuhOu5RQuw061OWKOtPtTfjRwXp6emtD2GkM5PrB
	7sOFPTnjsBd5Nqk531mFApYxSPkqzvNQfS+wtkXK2z9uwJuIeIU9BUajS/OjOYHHN9Jka2IX4at
	iYnDKbuXt6T79VOqMpkPECFcoDTKIoMdc1mWN58LcfhlERViZ/6sUVg/8GjoMQACQhmgO9WndNk
	BKfRc1n5sh6xGMVDHB7TRETHLg72rFTfqeG78N67PUE8M7HAR6wlWCwqvBwqJ8YGfxxnrRjPcj9
	orileanvlaUKZ2gLCH0ZTzrPxhsdDvEBYMn3WqUvpkW7iVC8=
X-Google-Smtp-Source: AGHT+IEyf2vqufJBQzgH/a13uvpnoeMnZlacNHgm0YngHsJxOM18B51+fTRehefEGH+No1zbSd9/Fg==
X-Received: by 2002:a05:6000:25eb:b0:3a4:d898:3e2d with SMTP id ffacd0b85a97d-3b4964f9453mr856155f8f.24.1751610075146;
        Thu, 03 Jul 2025 23:21:15 -0700 (PDT)
Message-ID: <15694c6c-55eb-4e99-8ee6-3c953bc69f28@suse.com>
Date: Fri, 4 Jul 2025 08:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/18] xen/cpufreq: introduce a new amd cppc driver for
 cpufreq scaling
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-11-Penny.Zheng@amd.com>
 <964dcd5e-6a7d-41f2-94b4-c07672ffdc89@suse.com>
 <DM4PR12MB8451D32EC45867F91C37F702E140A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <d0b2e49a-293a-481d-8c6d-626a19513122@suse.com>
 <DM4PR12MB84512DB2E098CE364A9A53BAE142A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84512DB2E098CE364A9A53BAE142A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.07.2025 05:40, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, July 2, 2025 6:48 PM
>>
>> On 02.07.2025 11:49, Penny, Zheng wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Tuesday, June 17, 2025 12:00 AM
>>>> To: Penny, Zheng <penny.zheng@amd.com>
>>>>
>>>> On 27.05.2025 10:48, Penny Zheng wrote:
>>>>> +static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
>>>>> +                                            unsigned int target_freq,
>>>>> +                                            unsigned int relation) {
>>>>> +    unsigned int cpu = policy->cpu;
>>>>> +    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data,
>> cpu);
>>>>> +    uint8_t des_perf;
>>>>> +    int res;
>>>>> +
>>>>> +    if ( unlikely(!target_freq) )
>>>>> +        return 0;
>>>>> +
>>>>> +    res = amd_cppc_khz_to_perf(data, target_freq, &des_perf);
>>>>> +    if ( res )
>>>>> +        return res;
>>>>> +
>>>>> +    /*
>>>>> +     * Setting with "lowest_nonlinear_perf" to ensure governoring
>>>>> +     * performance in P-state range.
>>>>> +     */
>>>>> +    amd_cppc_write_request(policy->cpu, data->caps.lowest_nonlinear_perf,
>>>>> +                           des_perf, data->caps.highest_perf);
>>>>
>>>> I fear I don't understand the comment, and hence it remains unclear
>>>> to me why lowest_nonlinear_perf is being used here.
>>>
>>> How about
>>> ```
>>> Choose lowest nonlinear performance as the minimum performance level at which
>> the platform may run.
>>> Lowest nonlinear performance is the lowest performance level at which
>>> nonlinear power savings are achieved, Above this threshold, lower performance
>> levels should be generally more energy efficient than higher performance levels.
>>> ```
>>
>> I finally had to go to the ACPI spec to understand what this is about. There looks to
>> be an implication that lowest <= lowest_nonlinear, and states in that range would
>> correspond more to T-states than to P-states. With that I think I agree with the use
> 
> Yes, It doesn't have definitive conclusion about relation between lowest and lowest_nonlinear
> In our internal FW designed spec, it always shows lowest_nonlinear corresponds to P2
> 
>> of lowest_nonlinear here. The comment, however, could do with moving farther
>> away from merely quoting the pretty abstract text in the ACPI spec, as such
>> quoting doesn't help in clarifying terminology used, when that terminology also isn't
>> explained anywhere else in the code base.
> 
> 
> How about we add detailed explanations about each terminology in the beginning
> declaration , see:
> ```
> +/*
> + * Field highest_perf, nominal_perf, lowest_nonlinear_perf, and lowest_perf
> + * contain the values read from CPPC capability MSR.
> + * Field highest_perf represents highest performance, which is the absolute
> + * maximum performance an individual processor may reach, assuming ideal
> + * conditions
> + * Field nominal_perf represents maximum sustained performance level of the
> + * processor, assuming ideal operating conditions.
> + * Field lowest_nonlinear_perf represents Lowest Nonlinear Performance, which
> + * is the lowest performance level at which nonlinear power savings are
> + * achieved. Above this threshold, lower performance levels should be
> + * generally more energy efficient than higher performance levels.

Which is still only the vague statement also found in the spec. This says nothing
about what happens below that level, or what the relationship to other fields is.

> + * Field lowest_perf represents the absolute lowest performance level of the
> + * platform.
> + *
> + * Field max_perf, min_perf, des_perf store the values for CPPC request MSR.
> + * Field max_perf conveys the maximum performance level at which the platform
> + * may run. And it may be set to any performance value in the range
> + * [lowest_perf, highest_perf], inclusive.
> + * Field min_perf conveys the minimum performance level at which the platform
> + * may run. And it may be set to any performance value in the range
> + * [lowest_perf, highest_perf], inclusive but must be less than or equal to
> + * max_perf.
> + * Field des_perf conveys performance level Xen is requesting. And it may be
> + * set to any performance value in the range [min_perf, max_perf], inclusive.
> + */
> +struct amd_cppc_drv_data
> +{
> +    const struct xen_processor_cppc *cppc_data;
> +    union {
> +        uint64_t raw;
> +        struct {
> +            unsigned int lowest_perf:8;
> +            unsigned int lowest_nonlinear_perf:8;
> +            unsigned int nominal_perf:8;
> +            unsigned int highest_perf:8;
> +            unsigned int :32;
> +        };
> +    } caps;
> +    union {
> +        uint64_t raw;
> +        struct {
> +            unsigned int max_perf:8;
> +            unsigned int min_perf:8;
> +            unsigned int des_perf:8;
> +            unsigned int epp:8;
> +            unsigned int :32;
> +        };
> +    } req;
> +
> +    int err;
> +};
> ``
> Then here, we could elaborate the reason why we choose lowest_nonlinear_perf over lowest_perf:
> ```
> +    /*
> +     * Having a performance level lower than the lowest nonlinear
> +     * performance level, such as, lowest_perf <= perf <= lowest_nonliner_perf,
> +     * may actually cause an efficiency penalty, So when deciding the min_perf
> +     * value, we prefer lowest nonlinear performance over lowest performance
> +     */
> +    amd_cppc_write_request(policy->cpu, data->caps.lowest_nonlinear_perf,
> +                           des_perf, data->caps.highest_perf);
> ```

This reads fine to me.

Question then is though: Is setting lowest_perf as the low boundary a good
idea in any of the places? (Iirc it is used in one or two places. Or am I
misremembering?)

Jan

