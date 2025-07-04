Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A71AF899A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:35:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032911.1406327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaxE-00067m-ID; Fri, 04 Jul 2025 07:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032911.1406327; Fri, 04 Jul 2025 07:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXaxE-00065i-Fd; Fri, 04 Jul 2025 07:35:28 +0000
Received: by outflank-mailman (input) for mailman id 1032911;
 Fri, 04 Jul 2025 07:35:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXaxD-00065c-GU
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:35:27 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72ff6027-58a9-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 09:35:25 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so286963f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 00:35:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce429b34dsm1266351b3a.120.2025.07.04.00.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 00:35:23 -0700 (PDT)
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
X-Inumbo-ID: 72ff6027-58a9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751614524; x=1752219324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/Iwq7dJYpNyXf8K5JER8zGbkeJ1ZFACtfFmNZz2xXic=;
        b=PgTrBY623Y81+KFaa65qutMUV/7X6pscFP7phkzM7ldDGUf3vLyv56YPDYXTURqYoB
         7+exf5rNupLfa/cT/TYCOyCATZFhXNU0FJL4wGCevyMAQ54Z1TuxI88ihxLqApQUVWlh
         m7Grpy0DroGZMhbkrSe2S84Ap6gVYfgzHizCIOSmrS5NYMhZd/3JtG5/xdmIV9E7/nZZ
         RxcoOxsottqbe+asyb2gWuzCp89w7kLd/9hgj+TsOgn6bAaM+LhgQuElyXy7zMc9henx
         Pgm5FhXbMx0TL6ZAHMeeNQpMVh3t5gS0/ZWd0MVMQevAI7vjEaNZYCqC3jHJd0ODMW4P
         m2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751614524; x=1752219324;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Iwq7dJYpNyXf8K5JER8zGbkeJ1ZFACtfFmNZz2xXic=;
        b=dD8uLCyC/OIZCoM6w+Hy5lObkML7Opq9JC+AfLt7YLmMw3Es4qThXQQwrYPCbpm6X7
         Lgcqc/TvkVBdMETkSNjblGSVpAv6qoXU1J78B62y4lRozt6nmrZWYpsPCf3wGtM7jbUX
         nxMgRQGaPeE1uli1GWTbcLPtqsvy0Ct0DEc43YFBvDN7Df08mxfGNn2xQpeFyWS/CGc2
         CREaZpgst38FQmskpt+PEMLpsQ+MlFs7PrDucTQcV4CUHCLbsrr2SZyenZOT6zF8lLBX
         LgPvGa9xAIOXzwXDefPC9tMHq+yRYrJDuGrPmMcNJu1HPvS2ygEE8M5lYWwRMzmUi/ye
         DpOA==
X-Forwarded-Encrypted: i=1; AJvYcCXcSoV/9LQHrNNVEP4mBFTn/bSFOXiYoCFUfzzN4838JliNKxMi/3vuUgzaxSe8PpZe5e94Jm6omlY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrtHgVsBvROdUZLNU5EIkgwuECeOyn4xanGamUoCVCIL0ekghu
	gagrIq1roShQvc1ZGez9aVZulS1o+XilqwLxxbcB2/TKbnkoYutfM+rhGmcv46+KJA==
X-Gm-Gg: ASbGncu/hD7q3yIhbJEM0C//kwTmIgpWFxlBo5ms78deU7mQ24tjDdNbAtz5di5gfja
	Vn0KYKoeQ1asYZ4+GijXvtNU0FyUueSGCPOxBW9Xrs3/amL5lfAd1PP70Fyl+XqNarozT2KHDoY
	NCPDuHipSl41Ua5f35macUVyo9+xecgXw5IFPSPohD2tfmo6nc2py1rgbnI4DkPajTu7qHZOAZI
	bCgqI46ZnltJDjbz9hnd4B181RGpK/ZnnsXKkMMEelMPGOnh5bKWIe2rlczQ0xJ0NjC/6j8c5VG
	E2Igw2cTIkCjsBWD5uhuRP8NOMCTOeeuyJLY9viyoz/x/2oXGUOqQz05Y7+5ZpQMV0poJB8C7wl
	YPHc6A3CUKXWMY88C9wAgsa7kQQ5vImHQTDUcEoSU8L0BYe9RnTDc2fcdPw==
X-Google-Smtp-Source: AGHT+IEPVhB0LYtPLoenncRTVboO9paARLGg00wroJ6gibxZKS5xNCvlwmUDxO/oM3wlMaCdYCAFpA==
X-Received: by 2002:a05:6000:41c3:b0:3a5:3b15:ef52 with SMTP id ffacd0b85a97d-3b4964bc8c0mr1039145f8f.8.1751614524401;
        Fri, 04 Jul 2025 00:35:24 -0700 (PDT)
Message-ID: <3cab7d60-3537-4bf1-867b-cf40735eae88@suse.com>
Date: Fri, 4 Jul 2025 09:35:16 +0200
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
 <15694c6c-55eb-4e99-8ee6-3c953bc69f28@suse.com>
 <DM4PR12MB84519333B094A966F4E467C4E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84519333B094A966F4E467C4E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.07.2025 09:23, Penny, Zheng wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Friday, July 4, 2025 2:21 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v5 10/18] xen/cpufreq: introduce a new amd cppc driver for
>> cpufreq scaling
>>
>> On 04.07.2025 05:40, Penny, Zheng wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Wednesday, July 2, 2025 6:48 PM
>>>>
>>>> On 02.07.2025 11:49, Penny, Zheng wrote:
>>>>>> -----Original Message-----
>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>> Sent: Tuesday, June 17, 2025 12:00 AM
>>>>>> To: Penny, Zheng <penny.zheng@amd.com>
>>>>>>
>>>>>> On 27.05.2025 10:48, Penny Zheng wrote:
>>>>>>> +static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
>>>>>>> +                                            unsigned int target_freq,
>>>>>>> +                                            unsigned int relation) {
>>>>>>> +    unsigned int cpu = policy->cpu;
>>>>>>> +    const struct amd_cppc_drv_data *data =
>>>>>>> +per_cpu(amd_cppc_drv_data,
>>>> cpu);
>>>>>>> +    uint8_t des_perf;
>>>>>>> +    int res;
>>>>>>> +
>>>>>>> +    if ( unlikely(!target_freq) )
>>>>>>> +        return 0;
>>>>>>> +
>>>>>>> +    res = amd_cppc_khz_to_perf(data, target_freq, &des_perf);
>>>>>>> +    if ( res )
>>>>>>> +        return res;
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * Setting with "lowest_nonlinear_perf" to ensure governoring
>>>>>>> +     * performance in P-state range.
>>>>>>> +     */
>>>>>>> +    amd_cppc_write_request(policy->cpu, data-
>>> caps.lowest_nonlinear_perf,
>>>>>>> +                           des_perf, data->caps.highest_perf);
>>>>>>
>>>>>> I fear I don't understand the comment, and hence it remains unclear
>>>>>> to me why lowest_nonlinear_perf is being used here.
>>>>>
>>>>> How about
>>>>> ```
>>>>> Choose lowest nonlinear performance as the minimum performance level
>>>>> at which
>>>> the platform may run.
>>>>> Lowest nonlinear performance is the lowest performance level at
>>>>> which nonlinear power savings are achieved, Above this threshold,
>>>>> lower performance
>>>> levels should be generally more energy efficient than higher performance levels.
>>>>> ```
>>>>
>>>> I finally had to go to the ACPI spec to understand what this is
>>>> about. There looks to be an implication that lowest <=
>>>> lowest_nonlinear, and states in that range would correspond more to
>>>> T-states than to P-states. With that I think I agree with the use
>>>
>>> Yes, It doesn't have definitive conclusion about relation between
>>> lowest and lowest_nonlinear In our internal FW designed spec, it
>>> always shows lowest_nonlinear corresponds to P2
>>>
>>>> of lowest_nonlinear here. The comment, however, could do with moving
>>>> farther away from merely quoting the pretty abstract text in the ACPI
>>>> spec, as such quoting doesn't help in clarifying terminology used,
>>>> when that terminology also isn't explained anywhere else in the code base.
>>>
>>>
>>> How about we add detailed explanations about each terminology in the
>>> beginning declaration , see:
>>> ```
>>> +/*
>>> + * Field highest_perf, nominal_perf, lowest_nonlinear_perf, and
>>> +lowest_perf
>>> + * contain the values read from CPPC capability MSR.
>>> + * Field highest_perf represents highest performance, which is the
>>> +absolute
>>> + * maximum performance an individual processor may reach, assuming
>>> +ideal
>>> + * conditions
>>> + * Field nominal_perf represents maximum sustained performance level
>>> +of the
>>> + * processor, assuming ideal operating conditions.
>>> + * Field lowest_nonlinear_perf represents Lowest Nonlinear
>>> +Performance, which
>>> + * is the lowest performance level at which nonlinear power savings
>>> +are
>>> + * achieved. Above this threshold, lower performance levels should be
>>> + * generally more energy efficient than higher performance levels.
>>
>> Which is still only the vague statement also found in the spec. This says nothing
>> about what happens below that level, or what the relationship to other fields is.
>>
>>> + * Field lowest_perf represents the absolute lowest performance level
>>> +of the
>>> + * platform.
>>> + *
>>> + * Field max_perf, min_perf, des_perf store the values for CPPC request MSR.
>>> + * Field max_perf conveys the maximum performance level at which the
>>> +platform
>>> + * may run. And it may be set to any performance value in the range
>>> + * [lowest_perf, highest_perf], inclusive.
>>> + * Field min_perf conveys the minimum performance level at which the
>>> +platform
>>> + * may run. And it may be set to any performance value in the range
>>> + * [lowest_perf, highest_perf], inclusive but must be less than or
>>> +equal to
>>> + * max_perf.
>>> + * Field des_perf conveys performance level Xen is requesting. And it
>>> +may be
>>> + * set to any performance value in the range [min_perf, max_perf], inclusive.
>>> + */
>>> +struct amd_cppc_drv_data
>>> +{
>>> +    const struct xen_processor_cppc *cppc_data;
>>> +    union {
>>> +        uint64_t raw;
>>> +        struct {
>>> +            unsigned int lowest_perf:8;
>>> +            unsigned int lowest_nonlinear_perf:8;
>>> +            unsigned int nominal_perf:8;
>>> +            unsigned int highest_perf:8;
>>> +            unsigned int :32;
>>> +        };
>>> +    } caps;
>>> +    union {
>>> +        uint64_t raw;
>>> +        struct {
>>> +            unsigned int max_perf:8;
>>> +            unsigned int min_perf:8;
>>> +            unsigned int des_perf:8;
>>> +            unsigned int epp:8;
>>> +            unsigned int :32;
>>> +        };
>>> +    } req;
>>> +
>>> +    int err;
>>> +};
>>> ``
>>> Then here, we could elaborate the reason why we choose lowest_nonlinear_perf
>> over lowest_perf:
>>> ```
>>> +    /*
>>> +     * Having a performance level lower than the lowest nonlinear
>>> +     * performance level, such as, lowest_perf <= perf <= lowest_nonliner_perf,
>>> +     * may actually cause an efficiency penalty, So when deciding the min_perf
>>> +     * value, we prefer lowest nonlinear performance over lowest performance
>>> +     */
>>> +    amd_cppc_write_request(policy->cpu, data->caps.lowest_nonlinear_perf,
>>> +                           des_perf, data->caps.highest_perf);
>>> ```
>>
>> This reads fine to me.
>>
>> Question then is though: Is setting lowest_perf as the low boundary a good idea in
>> any of the places? (Iirc it is used in one or two places. Or am I
>> misremembering?)
> 
> Yes, in active mode, I choose lowest_perf as min_perf to try to extend the limitation for active(autonomous) mode
> Maybe it is not a good choice. Maybe cpufreq driver is limited to do performance tuning in P-states range.

Indeed I think we should limit ourselves to P-state management; management of T-states
was never introduced into Xen, so far. But please be sure to make the connection to P-
and T-states in the commentary you add.

Jan

