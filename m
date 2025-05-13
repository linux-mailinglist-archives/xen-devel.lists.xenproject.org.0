Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C36ACAB4D68
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 09:56:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982596.1368951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEkUS-0001vg-6p; Tue, 13 May 2025 07:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982596.1368951; Tue, 13 May 2025 07:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEkUS-0001te-45; Tue, 13 May 2025 07:55:52 +0000
Received: by outflank-mailman (input) for mailman id 982596;
 Tue, 13 May 2025 07:55:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEkUQ-0001tY-Bc
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 07:55:50 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af2ad56f-2fcf-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 09:55:49 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-acae7e7587dso832624466b.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 00:55:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad219322b57sm735605066b.41.2025.05.13.00.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 00:55:48 -0700 (PDT)
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
X-Inumbo-ID: af2ad56f-2fcf-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747122949; x=1747727749; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nv7EWyZgim7/UFpmyR8gu9/EgRayFdRE40B009wkuaw=;
        b=TOJ3KoRI/fv8siAbedYgoK6jUz056DL92ulqK9wsDDvSmgYlLsmHXb9vL9HBGcUAsN
         IOc5628WwrSMmUk5TrPC9LBkjst/LNxo3wbaa3/QETh/Rd8WU/7kZLXItcUgRQBlG4IO
         dLI2wBu7tT5oQfTWLPAtAe80hR8C+JB3j+qlIk2mqAOh3M09s0t+firmQ+E22/KlmcFc
         EB6Qa7fwhKLESi9kGroCOGfsIRKzyqha2bFq7JEwRu0cUMkOJxcBkxz+taH7JgU56m3W
         P84z/MBK+Eg8/UjTyJ5yxn/IGQq6YAA62JB4thUCjGgVyyTzp6ggP8/mLAgpq7vYL5vl
         bO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747122949; x=1747727749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nv7EWyZgim7/UFpmyR8gu9/EgRayFdRE40B009wkuaw=;
        b=ncihiJxFtTli3EqQr4RLDdcT/fZZWGIh54UaOsBPoQsFWf1g/kSABYrey5wwztXIHI
         75Z94NqKZ8nhPsxQX7HjsGMkPkhBps2n1Du6xaSZa7oaglF4+B+iOHTJhv+KfOPOqzeG
         gCA5aEpFBR+4rkKZIPC2ykhLQXnOmPCwaXitocDpuweZjcIrZvq+4y0s8M2ZyqQLBtVo
         rkFh8TLeX/gxM+C9wXncREDI15m2X/NrBrC2PgVV5Lj7f0KQ502iSIOzYp1s+lpmc8tr
         1VGt4iOkWuU5+2nVJJWOWtBz8cVDFhZkkToZirlTnyqcggzpiS8My5k+wzlxZU7XhQwZ
         FkFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKklUzaByvVhcrbIwHDSXKdNsU7W4ZYLxmjbF20PmdlumO5GS5PXOqgrJmg4zHjDWglm6ggEpJdx8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRrkeWUuLdF+UsJZCyFKs8LRRie+h3JUus3bPVB7V+ldrnuIaZ
	KGTSUanJ63BNXEL1YWReUiKRM2TrjBwo9U2+KDgrXZ7S9wKoJ5vRXSXP55KZUQ==
X-Gm-Gg: ASbGncsIHJ2dqZNDEXIALrb069yETLp2E2vCzXcFTeRVfQvUm6Ff9D4fmW+CfTkwAgy
	qzxFyt8aF32XgX2SBe1ZaOH7Uqbto19p8HDMRjs2BnUGm2sx5akEWdN0bGUdQ7Xfby2L55H3KAa
	mJxZi9TOVkpUyiBI6A1DeFIdfcEBUscgkUJsMtx5i/3N3FsCB7YwE/kvmK8eNsxnkI/DXTPBgxR
	h6mxyRrUu29LOmY3sbywPHF/IhUtaIZQcZdQMQJjjGTFUsAU2w0oRDLrXLNIlbW8h0mvkBViXXR
	IQ/+6/eB+I6mmhR3b3bO14ZSdNMIaKQN+Hl5M3SfOTBUgkq/tAAeR1+ytjnJwtGk/Y0fkjekSVK
	WIYdXe6YEsHE9yE9ReSd6dD7SqlfMi/O+7hx2
X-Google-Smtp-Source: AGHT+IH3WH6+vs185lqNL2X+6afgvMgV3fsbKDwV80d9gUiM0//4gz1AhJL2lPn7ped27Ju5Zhd9Ww==
X-Received: by 2002:a17:907:7da2:b0:ace:3a1b:d3d with SMTP id a640c23a62f3a-ad218ea82a1mr1540242066b.2.1747122948792;
        Tue, 13 May 2025 00:55:48 -0700 (PDT)
Message-ID: <a11915b2-055f-4474-b3aa-a99d3712cb9b@suse.com>
Date: Tue, 13 May 2025 09:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/15] xen/x86: introduce a new amd cppc driver for
 cpufreq scaling
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-10-Penny.Zheng@amd.com>
 <448d6036-09ad-4505-800d-47606e8a3274@suse.com>
 <DM4PR12MB8451439DD06E810826853838E188A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451439DD06E810826853838E188A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.05.2025 11:19, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, April 29, 2025 10:29 PM
>>
>> On 14.04.2025 09:40, Penny Zheng wrote:
>>> --- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
>>> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
>>> +/*
>>> + * If CPPC lowest_freq and nominal_freq registers are exposed then we
>>> +can
>>> + * use them to convert perf to freq and vice versa. The conversion is
>>> + * extrapolated as an linear function passing by the 2 points:
>>> + *  - (Low perf, Low freq)
>>> + *  - (Nominal perf, Nominal freq)
>>> + */
>>> +static int amd_cppc_khz_to_perf(const struct amd_cppc_drv_data *data,
>>> +                                unsigned int freq, uint8_t *perf) {
>>> +    const struct xen_processor_cppc *cppc_data = data->cppc_data;
>>> +    uint64_t mul, div;
>>> +    int offset = 0, res;
>>> +
>>> +    if ( freq == (cppc_data->cpc.nominal_mhz * 1000) )
>>> +    {
>>> +        *perf = data->caps.nominal_perf;
>>> +        return 0;
>>> +    }
>>> +
>>> +    if ( freq == (cppc_data->cpc.lowest_mhz * 1000) )
>>> +    {
>>> +        *perf = data->caps.lowest_perf;
>>> +        return 0;
>>> +    }
>>
>> How likely is it that these two early return paths are taken, when the incoming
>> "freq" is 25 or 5 MHz granular? IOW - is it relevant to shortcut these two cases?
>>
> 
> Sorry, I may not understand what you mean here.
> Answering " How likely is it that these two early return paths are taken "
> It's rare ig.... maybe *ondemand* governor will frequently give frequency around nominal frequency,
> but the exact value is rare ig.
> I'm confused about " when the incoming  "freq" is 25 or 5 MHz granular ".
> Are we talking about is it worthy to have these two early return paths considering it is rarely taken

Yes - why have extra code which is expected to be hardly ever used. Things
would be different if such shortcuts covered common cases.

>>> +static int amd_get_max_freq(const struct amd_cppc_drv_data *data,
>>> +                            unsigned int *max_freq) {
>>> +    unsigned int nom_freq = 0, boost_ratio;
>>> +    int res;
>>> +
>>> +    res = amd_get_lowest_or_nominal_freq(data,
>>> +                                         data->cppc_data->cpc.nominal_mhz,
>>> +                                         data->caps.nominal_perf,
>>> +                                         &nom_freq);
>>> +    if ( res )
>>> +        return res;
>>> +
>>> +    boost_ratio = (unsigned int)(data->caps.highest_perf /
>>> +                                 data->caps.nominal_perf);
>>
>> I may have seen logic ensuring nominal_perf isn't 0, so that part may be fine. What
>> guarantees this division to yield a positive value, though?
>> If it yields zero (say 0xff / 0x80), ...
> 
> I think maybe you were saying 0x80/0xff to yield zero value. For that, we checked that highest_perf
> must not be smaller than nominal_perf during init, see ...

No, I indeed meant 0xff / 0x80, but yes, that will yield 1, not 0. My main
point though was about this calculation being pretty far off the real value
(rather closer to 2), i.e. in the overall calculation (including ...

>>> +    *max_freq = nom_freq * boost_ratio;

... this multiplication) some scaling may want introducing, or the
multiplication may want doing ahead of the division.

Jan

