Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE111A3A0C1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 16:04:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891872.1300884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkP9J-0001nG-OP; Tue, 18 Feb 2025 15:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891872.1300884; Tue, 18 Feb 2025 15:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkP9J-0001lU-Ln; Tue, 18 Feb 2025 15:04:37 +0000
Received: by outflank-mailman (input) for mailman id 891872;
 Tue, 18 Feb 2025 15:04:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Dy=VJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkP9I-0001lO-BG
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 15:04:36 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa5e2cbf-ee09-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 16:04:35 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-54524740032so4710886e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 07:04:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbc551123esm69761966b.127.2025.02.18.07.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 07:04:34 -0800 (PST)
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
X-Inumbo-ID: aa5e2cbf-ee09-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739891075; x=1740495875; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HNA3IXVHJMaG63LSZOBnkMKZu6uTyg1ZvtABjY39+jA=;
        b=ep/i8Q9fj+jczIfeLQfJAVrOffhNoj155iAFLNR2Gf3DjbI6a+1mINsESo+9mgD76i
         mTtenng9gZMC9KIorY/3vIanO4dkbCUHa899Hd8P+PoVwFB4hNy4m2uhiqDvmynu8ru4
         1lRo72FrbpRAdPNLR/jTLMkEf/pmGXoQzKJOIM/KMD9fJhxBGntZo+ce5diIauTLsi8C
         UdZ1ROtZS4qXznAeO5NazwjD0jq+OfriiPPz8+gfeJ8Z60+PH/CMi1vjxUW7iJ1pUuY/
         1D183i0OuC9wqY5DmLtOc5p+DbFsENzRSE6G1VxCabYggmOTrlTynqf0JsNPO3F+kPFC
         XHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739891075; x=1740495875;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNA3IXVHJMaG63LSZOBnkMKZu6uTyg1ZvtABjY39+jA=;
        b=lAmqfPwMh/M3UTaaManJzkjRWj5Mtg/QQPeBRtwgtMbj7i5uW0JaNrYfwDRbOA8val
         FPR+BAPVXMgCnDF7OcRU3/i77hpY1kLCA8h5AvYsh7OfI9X6W+6SA37/wMFUxQ1G4Pix
         WEbjbkI83VJq4OrPFoxClf1XtCpjJJ+RHXDlAnQm3BB60r2aOVXdKUAADi5XpaYZsDiq
         9hz/wqM2MXNDre0/L1xHetFe6gkaH0exCG4+BkCIp4/TeoQv3edZGiGkXQudPDwg0LXL
         jr6heInecAsyN3/swjjw5F2OuodbwE+bHtFsRqlSe8Ioi7kRunpZbFtLbpun3SQmi/pp
         qgQg==
X-Forwarded-Encrypted: i=1; AJvYcCXbAMODHvcnElnZWGXKN0li9/A42t+d2pBUClcfa113r5te3AqdBRYwJgceROxshE1YYpaZUccYixI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6BVCTid8J+pinNP74QwDac7qt/eAOK7UtZxMMzWs6xTcwfnee
	r0dKa2ACYk+9hwcySYxnvYsLjlZnR3qAKTrQNKHh/wqxaWHNLRLEX1+UMThAIQ==
X-Gm-Gg: ASbGncsSn6OV051PdW6/vDLruymTju1n+o2CdnkhshoAIqwL45tbTZ04AIv2JT/dggN
	hc6pVX7/KJ5k/UkRZSKv4alKFdNmIaQ+JQdq+mwf0J3cpDEt41YzEJHrvJNRl6wDzpOpK1qVrm3
	bNYgr+P6o/f3XaEmCAFgM/XKNQJWYQPRI2eqgOvK6vjsAib/AMjbROppR155G0JxY+JcVDhhVbg
	x6LbSBztmQVX1OwaG2yDdVWggN5JiQea5v0cVmt/9s2pRr+iWHHbzlbjUgPkNXWaCcRbrK0VSgg
	ROzK4Vx052SwObsZjjjX54Xi9YINAl+PCBifiWXnzrrxkDYrT1mUfgM3PWouUIF5RbfHsWsLdia
	Q
X-Google-Smtp-Source: AGHT+IFMrOJdfHy4eriPsC5sAm/y8yGw6xu1VkaJwz/J7uhyoTStYbIt7TCsSh1UPPaBBwc2ct6ICA==
X-Received: by 2002:a05:6512:2815:b0:545:8c5:44cb with SMTP id 2adb3069b0e04-5452fe67216mr5229840e87.31.1739891074577;
        Tue, 18 Feb 2025 07:04:34 -0800 (PST)
Message-ID: <225785e7-721a-4d44-a1f7-0611175f094e@suse.com>
Date: Tue, 18 Feb 2025 16:04:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] xen/x86: introduce a new amd cppc driver for
 cpufreq scaling
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Andryuk, Jason"
 <Jason.Andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-6-Penny.Zheng@amd.com>
 <0fe9e3b1-3d2c-4ddf-87c4-b0de2a586182@suse.com>
 <DM4PR12MB8451A1436E68B906D8C2E89BE1FA2@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB8451A1436E68B906D8C2E89BE1FA2@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.02.2025 08:40, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, February 12, 2025 12:46 AM
>> To: Penny, Zheng <penny.zheng@amd.com>
>>
>> On 06.02.2025 09:32, Penny Zheng wrote:
>>> +static int amd_cppc_khz_to_perf(const struct amd_cppc_drv_data *data,
>>> +unsigned int freq, uint8_t *perf)
>>
>> Overlong line again. Please sort throughout the series.
>>
>>> +{
>>> +    const struct xen_processor_cppc *cppc_data = data->cppc_data;
>>> +    uint64_t mul, div, offset = 0, res;
>>> +
>>> +    if ( freq == (cppc_data->nominal_freq * 1000) )
>>
>> There's no comment anywhere what the units of the values are. Therefore the
>> multiplication by 1000 here leaves me wondering why consistent units aren't used in
>> the first place. (From the name of the function I might guess that "freq" is in kHz,
>> and then perhaps ->{min,max,nominal}_freq are in MHz.
>> Then for the foreseeable future we're hopefully safe here wrt overflow.)
> 
> These conversion functions are designed in the first place for *ondemand* governor, which
> reports performance as CPU frequencies. In generic governor->target() functions, we are always
> take freq in KHz, but in CPPC ACPI spec, the frequency is read in Mhz from register...

That's all fine, but it wants reflecting in our sources somehow. Perhaps
simply by either naming the variables/fields accordingly (see how we e.g.
have a cpu_khz global variable, rather than it being named e.g. cpu_freq)
or by at least adding brief comments to their declarations.

>>> +    {
>>> +        *perf = data->caps.nominal_perf;
>>> +        return 0;
>>> +    }
>>> +
>>> +    if ( freq == (cppc_data->lowest_freq * 1000) )
>>> +    {
>>> +        *perf = data->caps.lowest_perf;
>>> +        return 0;
>>> +    }
>>> +
>>> +    if ( (cppc_data->lowest_freq) && (cppc_data->nominal_freq) )
>>
>> Why the inner parentheses?
>>
>>> +    {
>>> +        mul = data->caps.nominal_perf - data->caps.lowest_perf;
>>> +        div = cppc_data->nominal_freq - cppc_data->lowest_freq;
>>> +        /*
>>> +         * We don't need to convert to kHz for computing offset and can
>>> +         * directly use nominal_freq and lowest_freq as the division
>>> +         * will remove the frequency unit.
>>> +         */
>>> +        div = div ?: 1;
>>> +        offset = data->caps.nominal_perf - (mul *
>>> + cppc_data->nominal_freq) / div;
>>
>> I fear I can't convince myself that the subtraction can't ever underflow.
>> With
>>
>> O = offset
>> Pn = data->caps.nominal_perf
>> Pl = data->caps.lowest_perf
>> Fn = cppc_data->nominal_freq
>> Fl = cppc_data->lowest_freq
>>
>> the above becomes
>>
>> O = Pn - ((Pn - Pl) * Fn) / (Fn - Fl)
>>
>> and your assumption is O >= 0 (and for inputs: Fn >= Fl and Pn >= Pl). That for me
>> transforms to
>>
>> (Pn - Pl) * Fn <= Pn * (Fn - Fl)
>>
>> and further
>>
>> -(Pl * Fn) <= -(Pn * Fl)
>>
>> or
>>
>> Pn * Fl <= Pl * Fn
>>
>> and I don't see why this would always hold. Yet if there can be underflow, I wonder
>> whether the calculation is actually correct. Or, ...
> 
> Because we are assuming that in normal circumstances, when F==0, P is the offset value, and
> It shall be an non-smaller-than-zero value, tbh, ==0 is more logical fwit
> So if it is underflow, I might think the hardware itself is malfunctional.

Why so? The more that I continued ...

>>> +    }
>>> +    else
>>> +    {
>>> +        /* Read Processor Max Speed(mhz) as anchor point */
>>> +        mul = data->caps.highest_perf;
>>> +        div = this_cpu(max_freq_mhz);
>>> +        if ( !div )
>>> +            return -EINVAL;
>>> +    }
>>> +
>>> +    res = offset + (mul * freq) / (div * 1000);
>>
>> ... considering that a negative offset here isn't really an issue, as long as the rhs of
>> the addition is large enough, is offset perhaps meant to be a signed quantity (and
>> considering it's in principle an [abstract] perf value, it doesn't even need to be a 64-
>> bit one, i.e. perhaps one of the cases where plain int is appropriate to use)?

... my explanation here, including the outline of an approach to deal with
this.

Jan

