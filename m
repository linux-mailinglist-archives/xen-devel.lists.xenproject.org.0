Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A957AAF1250
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 12:48:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030919.1404611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWv0m-0001gp-7x; Wed, 02 Jul 2025 10:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030919.1404611; Wed, 02 Jul 2025 10:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWv0m-0001eq-4W; Wed, 02 Jul 2025 10:48:20 +0000
Received: by outflank-mailman (input) for mailman id 1030919;
 Wed, 02 Jul 2025 10:48:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWv0k-0001eh-Mi
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 10:48:18 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fbfd4b9-5732-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 12:48:17 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4537edf2c3cso66004555e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 03:48:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39ba8esm132952915ad.129.2025.07.02.03.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 03:48:16 -0700 (PDT)
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
X-Inumbo-ID: 0fbfd4b9-5732-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751453297; x=1752058097; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kdf0ih7LCwuwCYqiUW9O3odujrSv68Poj0wFppeFPw4=;
        b=SzlNDNsoFATN8RFtdCsu5lJXQ29HnVoaMH42zG0R2zMyVqfo7Dx1BRMfpbjsEuuEIm
         diae/fF2dlIxxXYfKYsl4gETvtU9Z/FXytjAOlhCBywLWe0PBNb4TJi/mU3/Qw2Fpc9A
         Thf3Ar4AaYKJjDdPSG60WlqLCkHoRxVke0R1wFUoToviFuUeKoMUuRHLs6SgnlEk/yYv
         yg6xjhkCT/faUSlyyYTYG2tHYnnB9s5bbnmEV/J/XzEFXzB9y7+Enb+nW5QfQkal1cLb
         D6Vrsphv/1BBgDaXXg5IOAioHpTW1HzPzuS+phjOy8nUaKauQgVEUUjDdX1kVnlrFqCb
         rFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453297; x=1752058097;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdf0ih7LCwuwCYqiUW9O3odujrSv68Poj0wFppeFPw4=;
        b=xPb4089icT3mk7TVgy4ItlMqXCYYqdb6EdF5C7uIsswuAn4Et5RwCwayjwF78s6KhP
         GxwGXvSbTNu8D8yRGXh8NskYX9aXWrYLJPNNbJwHFUanuR2ljzHzRrw6O1eIOcW2twAF
         +6NPo1oAAnn4A4gJ/DIiR2WrK+xedr5yPEmlNLTqRdTi+PGs7vsjxRyf7ZIGWjqfXcG8
         tD5UKApdld/V8jZFli3xiB86SC9ehTp8BcYngv+iZTPGupn9bm3qmEKTElRLq0lug9Bc
         obHWN3EL/mP27HCfL32VctuOaf3VBWkEsyVOlf7rWnvK58atnU4LZ+4I4JU1WXg2XHZm
         cc5w==
X-Forwarded-Encrypted: i=1; AJvYcCVDwak+QHlgPVvAq6zT2co6jxTsbIOYiTiCZASfIz55cplvKxPMQsWzcbw4aFLYSi/8dnHK08f6ssM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyW9wgdelwGzl9KlaRZRMcMB8oZ9UmcFAWTvxSaFOc2ECtdUnTp
	kkjQ+HOLyyRM/dZClCYbWTuO2c9Y4XjzKR2tocPdt5YJ98DhqNTvFM5t9MdKwyazNw==
X-Gm-Gg: ASbGncuO1GX6W0gHts0g6GENoe6HzdkKsiaGnoDRiYqE+KuaUOEmnoMgLaJgxHlxLlF
	Lx+Ga+HF44dlqQlRYPdnxwujNjAtEIl8S0r/SlTcnTWbaziq40zf8uIa8er0MteL7NMwyj4A6+K
	KLha0Q+8empJKUPMMWd957O4+DJu6Fpg9lXD0eLzOcup2ImC9hkrSEQ/ON98oCeRtCubEkELMIC
	MEAg00CjF/oL+YQfSdjnXA32wYxq3z9NAnuj+fxOziVSSbVmHu/Z4hzJISJMHY0MwND8N4g9OGk
	gQcY8DOI+72ztiTFDzTpKkBDos6m+43LbCfTUQHCJTBHpk4LiFcOtsM4MfRoE+1sfPs6SJ5uBkp
	eIsLTs2iPkD8Gt98/tXzhPT2Qf2wCKu8HmGHCkNgXWzmWl2o=
X-Google-Smtp-Source: AGHT+IEJ2xUz/eGW5r2sLW90vvhSJZZtQ+C9wz2JIEc3jjy8McsLAoxq2jXtzoEH/7xsyFJE+Ci4cg==
X-Received: by 2002:a05:6000:43d8:b0:3a4:f9e7:2796 with SMTP id ffacd0b85a97d-3b2001ac40bmr1342678f8f.35.1751453296657;
        Wed, 02 Jul 2025 03:48:16 -0700 (PDT)
Message-ID: <d0b2e49a-293a-481d-8c6d-626a19513122@suse.com>
Date: Wed, 2 Jul 2025 12:48:08 +0200
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
In-Reply-To: <DM4PR12MB8451D32EC45867F91C37F702E140A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2025 11:49, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, June 17, 2025 12:00 AM
>> To: Penny, Zheng <penny.zheng@amd.com>
>>
>> On 27.05.2025 10:48, Penny Zheng wrote:
>>> --- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
>>> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
>>> +        /*
>>> +         * We don't need to convert to kHz for computing offset and can
>>> +         * directly use nominal_mhz and lowest_mhz as the division
>>> +         * will remove the frequency unit.
>>> +         */
>>> +        offset = data->caps.nominal_perf -
>>> +                 (mul * cppc_data->cpc.nominal_mhz) / div;
>>> +    }
>>> +    else
>>> +    {
>>> +        /* Read Processor Max Speed(MHz) as anchor point */
>>> +        mul = data->caps.highest_perf;
>>> +        div = this_cpu(pxfreq_mhz);
>>> +        if ( !div )
>>> +            return -EINVAL;
>>
>> What's wrong about the function arguments in this case? (Same question again on
>> further uses of EINVAL below.)
> 
> If we could not get processor max frequency, the whole function is useless...
> Maybe -EOPNOTSUPP is more suitable than -EINVAL;

I don't like EOPNOTSUPP very much either for the purpose, but it's surely better
than EINVAL.

>>> +static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
>>> +                                            unsigned int target_freq,
>>> +                                            unsigned int relation) {
>>> +    unsigned int cpu = policy->cpu;
>>> +    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
>>> +    uint8_t des_perf;
>>> +    int res;
>>> +
>>> +    if ( unlikely(!target_freq) )
>>> +        return 0;
>>> +
>>> +    res = amd_cppc_khz_to_perf(data, target_freq, &des_perf);
>>> +    if ( res )
>>> +        return res;
>>> +
>>> +    /*
>>> +     * Setting with "lowest_nonlinear_perf" to ensure governoring
>>> +     * performance in P-state range.
>>> +     */
>>> +    amd_cppc_write_request(policy->cpu, data->caps.lowest_nonlinear_perf,
>>> +                           des_perf, data->caps.highest_perf);
>>
>> I fear I don't understand the comment, and hence it remains unclear to me why
>> lowest_nonlinear_perf is being used here.
> 
> How about
> ```
> Choose lowest nonlinear performance as the minimum performance level at which the platform may run.
> Lowest nonlinear performance is the lowest performance level at which nonlinear power savings are achieved,
> Above this threshold, lower performance levels should be generally more energy efficient than higher performance levels.
> ```

I finally had to go to the ACPI spec to understand what this is about. There looks
to be an implication that lowest <= lowest_nonlinear, and states in that range
would correspond more to T-states than to P-states. With that I think I agree with
the use of lowest_nonlinear here. The comment, however, could do with moving
farther away from merely quoting the pretty abstract text in the ACPI spec, as
such quoting doesn't help in clarifying terminology used, when that terminology
also isn't explained anywhere else in the code base.

Jan

