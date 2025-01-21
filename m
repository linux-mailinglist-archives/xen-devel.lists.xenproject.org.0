Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69296A178FF
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 09:03:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875126.1285440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ta9Dj-0004iw-Oz; Tue, 21 Jan 2025 08:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875126.1285440; Tue, 21 Jan 2025 08:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ta9Dj-0004gY-MN; Tue, 21 Jan 2025 08:02:47 +0000
Received: by outflank-mailman (input) for mailman id 875126;
 Tue, 21 Jan 2025 08:02:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ta9Di-0004gS-P4
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 08:02:46 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16e4f730-d7ce-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 09:02:42 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38a8b35e168so3637962f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 00:02:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf32150a6sm12859490f8f.15.2025.01.21.00.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 00:02:40 -0800 (PST)
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
X-Inumbo-ID: 16e4f730-d7ce-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737446561; x=1738051361; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e7tTecqTERmlCdRRxd5/kg8ci5254d689LI+sgsVamE=;
        b=dguzg5xVbW03wQg6jI+n5qonXD/SVkdT2DPwHIzmxBvxnZV4EMne/ELfGb6Y+b8d3F
         OiHXyoWyVZVmZC5ma/5aYb6Px3cGQa0KLWHKn/9D/MAvtvJJua91t6HBfy8G/HOpW9r/
         +PmssXNsQc6VRu/K6tisKBD5d/38RA4BxtD7CzutqM1T3l9SwNJkxdx4FLmPs48/JILT
         DKRYZsvO7NtXBwzqRxyUJLes7urwh4NddTPFBp5I6hIl976HMKI4UA15NgwjtW74+cj7
         73XcuReK1LV68sl75KWKsG9aZrOFqwn91mrjewLQNrivx5BIeOGE0gy9yLMTBYzpolyA
         BzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737446561; x=1738051361;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7tTecqTERmlCdRRxd5/kg8ci5254d689LI+sgsVamE=;
        b=bZgUcbYlm4i0US6u3A45Me0FJWgciPUdQYw5OrvMhcbz0sDOduZT0v6PpGFaFkZV3m
         rBFviLcpGhXSH/8jE3bro4ywdG+KJqdarvAPzdhg6i7hev8fUpjAkurHNa8qE592lpiV
         TVbzjUd8B29SQYl/1VuA50z5sXMNWkR/vTBgWwZuv4tf433ztuALv5mEfsqE4d00TfcJ
         W4g9ZJuwHPuobpN6Op8OLmyxiy4enza8XcZLxkzMWVBAHCHrRuz9XF8xZcnsY6cTfKmC
         cb0uRlpIJXJJGSbQlVJuuDoWnjOeUIkdgwde7YD3ImJBxTbLAe65cKqD2Fqjyl/3lklN
         ph7g==
X-Forwarded-Encrypted: i=1; AJvYcCX5SNhwmBgq/BUshfQjf61M35a0dLfS3e1QL4gs3OKp4BaBVkLLt/6SGUAjx/+EVoVui6nxVfX1S0Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyRMOsW7jj9r9zEqQi6Ua7LKU3VQW5k/BQd7EKy0W3bnXvLmYd
	iN2raiEubfoVl1wdFUllab0BCKSlqJhz3341rTBSXfRZWUpp7vNqwsHES7tDWQ==
X-Gm-Gg: ASbGncs22e0YmA9FSJG9ngVJbCZuNeFpPuQrOXYfENysY42uznLk8Y+GP0wHfbNxk1T
	oMD03g5rqX4y57tLHs9lTVVD1ytBOQAzAH4QQ00Askslw/WgBFrDcWAFqbm09mlPhVtVMYnSsXf
	WNMg91EZoGKYJC9jj3euqXcJopuL21uMWfXEdmBkxRLRgbbbhNH40lxcZSSi+NN5ZWz0sbITwwz
	PUciLyFi8hwCWwsggi2qqpDje00kafZg87/Ic6z2diljTXudiCNwcp4j2bh1s6vUx905NfWT4ZG
	b2vh9Jbo8JolrcXeoLBhzg4UW4/17cLuXepKVXANzQN4opwbP8D94q8=
X-Google-Smtp-Source: AGHT+IFKZKIiAvE7n+YZA4eE5PfAmfv/aNEklyEPYvHu1tbkcTSCsrd+376RQYWrEajlZkbfRzLEuw==
X-Received: by 2002:a5d:64e6:0:b0:381:ed32:d604 with SMTP id ffacd0b85a97d-38bf5ad3a71mr12905929f8f.10.1737446561429;
        Tue, 21 Jan 2025 00:02:41 -0800 (PST)
Message-ID: <98115dfa-0d86-4651-869d-578069ac413c@suse.com>
Date: Tue, 21 Jan 2025 09:02:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/11] xen/x86: introduce a new amd pstate driver for
 cpufreq scaling
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Andryuk, Jason" <Jason.Andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-6-Penny.Zheng@amd.com>
 <f7f03617-e438-48c1-b5b0-1ca975cbc7e6@suse.com>
 <DM4PR12MB8451942DEC644085A16F2391E1E62@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451942DEC644085A16F2391E1E62@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.01.2025 07:14, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Thursday, January 9, 2025 6:55 PM
>>
>> On 03.12.2024 09:11, Penny Zheng wrote:
>>> +    {
>>> +        /* Read Processor Max Speed(mhz) from DMI table as anchor point */
>>> +        mul = dmi_max_speed_mhz;
>>> +        div = data->hw.highest_perf;
>>> +
>>> +        return (unsigned int)(mul / div) * data->hw.lowest_perf *
>>> + 1000;
>>
>> No risk of the cast chopping off set bits?
> 
> Mul shall be uint64_t, highest_perf and lowest_perf shall be uint8_t, and normally
> the equation output shall not be a too big value...
> If you think it's safer to do cast after comparing with the UINT32_MAX, I will add the check

Well, I can only say as much: Dividing a uint64_t by a uint8_t has ample
opportunity for there being more than 32 significant bits in the result.

>>> +    if ( !(val & AMD_CPPC_ENABLE) )
>>> +    {
>>> +        val |= AMD_CPPC_ENABLE;
>>> +        if ( wrmsr_safe(MSR_AMD_CPPC_ENABLE, val) )
>>> +        {
>>> +            amd_pstate_err(policy->cpu,
>> "wrmsr_safe(MSR_AMD_CPPC_ENABLE, %lx)\n", val);
>>> +            data->err = -EINVAL;
>>> +            return;
>>> +        }
>>> +    }
>>
>> Do you really need to enable befor reading ...
>>
>>> +    if ( rdmsr_safe(MSR_AMD_CPPC_CAP1, data->amd_caps) )
>>
>> ... capabilities and ...
>>
> 
> Yes.
> Only when CPPC is enabled, the hardware will calculate the processor’s performance capabilities and
> initialize the performance level fields in the CPPC capability registers.
> See 17.6.3 https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/24593.pdf

Ah yes, I see. Yet then the text there also says that the ENABLE bit can't
be cleared (except by reset), so your error handling is questionable.

>>> +    {
>>> +        amd_pstate_err(policy->cpu, "rdmsr_safe(MSR_AMD_CPPC_CAP1)\n");
>>> +        goto error;
>>> +    }
>>> +
>>> +    if ( data->hw.highest_perf == 0 || data->hw.lowest_perf == 0 ||
>>> +         data->hw.nominal_perf == 0 || data->hw.lowest_nonlinear_perf == 0 )
>>> +    {
>>> +        amd_pstate_err(policy->cpu, "Platform malfunction, read CPPC
>> highest_perf: %u, lowest_perf: %u, nominal_perf: %u, lowest_nonlinear_perf: %u
>> zero value\n",
>>> +                       data->hw.highest_perf, data->hw.lowest_perf,
>>> +                       data->hw.nominal_perf, data->hw.lowest_nonlinear_perf);
>>> +        goto error;
>>> +    }
>>> +
>>> +    min_freq = amd_get_min_freq(data);
>>> +    nominal_freq = amd_get_nominal_freq(data);
>>> +    max_freq = amd_get_max_freq(data);
>>> +    if ( min_freq > max_freq )
>>> +    {
>>> +        amd_pstate_err(policy->cpu, "min_freq(%u) or max_freq(%u) value is
>> incorrect\n",
>>> +                       min_freq, max_freq);
>>> +        goto error;
>>> +    }
>>
>> ... checking them? Error handling would be easier if you enabled only afterwards.
>>
>>> +    highest_perf = data->hw.highest_perf;
>>> +    nominal_perf = data->hw.nominal_perf;
>>> +
>>> +    if ( highest_perf <= nominal_perf )
>>> +        return;
>>> +
>>> +    policy->turbo = CPUFREQ_TURBO_ENABLED; }
>>
>> And why the helper variables in the first place?
> 
> Sorry, maybe a bit more specific, got confused about the question ;/

With local variables like these, you end up with more code volume for
no real gain. IOW what's wrong with

    if ( data->hw.highest_perf <= data->hw.nominal_perf )
        return;

? (As an aside, even if the variables were actually useful, it would
still be better to have them have initializers than to use separate
declarations and assignments.)

Jan

