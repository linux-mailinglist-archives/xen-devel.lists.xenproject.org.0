Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 558FFC8D43C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 08:58:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173533.1498565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOWtI-0000B5-A0; Thu, 27 Nov 2025 07:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173533.1498565; Thu, 27 Nov 2025 07:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOWtI-000093-6L; Thu, 27 Nov 2025 07:58:12 +0000
Received: by outflank-mailman (input) for mailman id 1173533;
 Thu, 27 Nov 2025 07:58:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOWtG-00008x-NF
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 07:58:10 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d052f249-cb66-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 08:58:09 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so3002535e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 23:58:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4791164d365sm17193555e9.12.2025.11.26.23.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 23:58:07 -0800 (PST)
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
X-Inumbo-ID: d052f249-cb66-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764230288; x=1764835088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h0KIwiuIH3nUKAr+RUieLKs8a8/4ggIbaVDhtsBfKRs=;
        b=ZHWSwQNhvM4eZ1oNaYHdKIvbFrBU9KszBlaWR4jE5SzlyAku0Bo+gj9S7ome0kkJ4x
         OJDYaxQDpoq7JPxzzXplZKK8t+J3xNZCXJ7efkKjdHN/HscMqBLqCKLvrDfoHITSro8v
         fkOKIvoCQpWxc9hgsTl16GvXYyWWeQyoiUVBX8fm0wsjYikrMWpHcqji2hc7LlRPI9Et
         l3moZFGSAYWmKOal6qBzXJ1lJMX+QTh6w4d7BbcjgneUTo1lxwvuVzOXzLzB4YSh+c4S
         vio54Bud5Ck/qAWDhPGs2xD1NUSFZr/uShgoXHJZmCW2ksY0iXAZ6Zh7o8gEzSR3L+bd
         mbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764230288; x=1764835088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0KIwiuIH3nUKAr+RUieLKs8a8/4ggIbaVDhtsBfKRs=;
        b=kqj4VbGFi0nDSFmNopHX5BfnfTWPSxyW9Jp0+SVOBxhYp2vyZ8lP5CUgZgOrBUEuLZ
         03AJuZ+wOosxjQBJz4Jp0Uz9VVX7V0nEJwFCl0n4zeSKAiHiEgccQ75r+5EK/SmQhrGy
         h51UxNieBwhsrM13vBT0eYHbk+6rpZQTMpYLP0Exa6WsXGbUdKrRIasa++QoQkSspW/V
         MtLagpLrAoHz8hVSngUgndOoq470sByLEf68YhYaFmHK0wmw2yqcx34Gv22lRctCPz0C
         /eSjk6BSxAtYOeWsG0Ud7wFwndym7phwd7DfWOF3NeBVcUBQOU23c0kbSMOW0sTdCzYu
         y6Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWSF3gCoKOw1eEXzWi2AC6uLi0gvykyJOBYIaGWXEusAvvYe8cfJt5xxw9VOpnB1TSTGBaoajt+Iuw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwofEvoqa3LvH301JcFW21z7Ue+Ee6TAPGZuTeyfXVfJPMGaFr8
	8jBpq94Ng7c3l4YnDQ7lLMX6BUMhGXXniia+fv2x9asWsihg5LEphQiv7g00qWvQAA==
X-Gm-Gg: ASbGncsgbk+Wdu6SSqK+vAPGPNP9BDVNkmD5NBczxWucRYH03ySalKnXJraNiVAwgRs
	NKlvM1ReMrBhbdks4Gn9gBCXHF1rgepEKD+eBq7lescmz4o69hArTZHsXU+7fSpmhFz8dTewULR
	8lAJ5Dqh53tb8zzAsfWRIc1+Miz5zcbE+fmW9KEItKdJaQOslFq6uoVAyBZQL0zNX+j71fq+f5f
	Y6xmV/zNtXeoENx2HniT4v39rKB2tqsKMpQOSDdY2BY4yU8FpIsUe4EObMryx2lmeR7MDlCldBc
	glr/GA9KNRw4jiWqjLeUp8U1TVHFgEgBtGW+aNINjvMk0PK8whAjp1MtXVdzF/DiAW+yrjX5b+a
	E9YbJTEirOHrJSGBEex9JMz/V1EBu+68/jbup/BOdlDzU7Alwa5Tk0BL/HM2vrbL80AR86jo46X
	K4q3Kz5ji4wBRATL9VDC/NunI83kji7p6wCkYUY/XgYusD1FcW7Vspe5u6bSKLh88T8kZK5K1Ur
	Xg=
X-Google-Smtp-Source: AGHT+IHwXbzHRq7LQ4X4yTDayxN0WjJ5rycMzSBVDHdUYZIhjjnHgosZbbGbC+gC9huSG/dm2boRfA==
X-Received: by 2002:a05:600c:1c19:b0:477:7bca:8b3c with SMTP id 5b1f17b1804b1-47904b10379mr119206445e9.19.1764230288501;
        Wed, 26 Nov 2025 23:58:08 -0800 (PST)
Message-ID: <63ee65cc-1e8b-4f00-a882-7e96fe1e1eac@suse.com>
Date: Thu, 27 Nov 2025 08:58:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/amd: Fix race editing DE_CFG
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251126132220.881028-1-andrew.cooper3@citrix.com>
 <20251126132220.881028-4-andrew.cooper3@citrix.com>
 <52fd793f-5bb1-4e14-a64c-b431b0ae83a6@suse.com>
 <f2101ed6-470c-4d6a-88dc-d2776010c346@citrix.com>
 <d13547b3-15f4-4814-8bd5-1f5dfb96fc39@citrix.com>
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
In-Reply-To: <d13547b3-15f4-4814-8bd5-1f5dfb96fc39@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2025 18:56, Andrew Cooper wrote:
> On 26/11/2025 4:55 pm, Andrew Cooper wrote:
>> On 26/11/2025 3:07 pm, Jan Beulich wrote:
>>> On 26.11.2025 14:22, Andrew Cooper wrote:
>>>> @@ -1075,6 +966,112 @@ static void cf_check fam17_disable_c6(void *arg)
>>>>  	wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
>>>>  }
>>>>  
>>>> +static bool zenbleed_use_chickenbit(void)
>>>> +{
>>>> +    unsigned int curr_rev;
>>>> +    uint8_t fixed_rev;
>>>> +
>>>> +    /*
>>>> +     * If we're virtualised, we can't do family/model checks safely, and
>>>> +     * we likely wouldn't have access to DE_CFG even if we could see a
>>>> +     * microcode revision.
>>>> +     *
>>>> +     * A hypervisor may hide AVX as a stopgap mitigation.  We're not in a
>>>> +     * position to care either way.  An admin doesn't want to be disabling
>>>> +     * AVX as a mitigation on any build of Xen with this logic present.
>>>> +     */
>>>> +    if ( cpu_has_hypervisor || boot_cpu_data.family != 0x17 )
>>>> +        return false;
>>>> +
>>>> +    curr_rev = this_cpu(cpu_sig).rev;
>>>> +    switch ( curr_rev >> 8 )
>>>> +    {
>>>> +    case 0x083010: fixed_rev = 0x7a; break;
>>>> +    case 0x086001: fixed_rev = 0x0b; break;
>>>> +    case 0x086081: fixed_rev = 0x05; break;
>>>> +    case 0x087010: fixed_rev = 0x32; break;
>>>> +    case 0x08a000: fixed_rev = 0x08; break;
>>>> +    default:
>>>> +        /*
>>>> +         * With the Fam17h check above, most parts getting here are Zen1.
>>>> +         * They're not affected.  Assume Zen2 ones making it here are affected
>>>> +         * regardless of microcode version.
>>>> +         */
>>>> +        return is_zen2_uarch();
>>>> +    }
>>>> +
>>>> +    return (uint8_t)curr_rev >= fixed_rev;
>>>> +}
>>>> +
>>>> +void amd_init_de_cfg(const struct cpuinfo_x86 *c)
>>>> +{
>>>> +    uint64_t val, new = 0;
>>>> +
>>>> +    /* The MSR doesn't exist on Fam 0xf/0x11. */
>>>> +    if ( c->family != 0xf && c->family != 0x11 )
>>>> +        return;
>>> Comment and code don't match. Did you mean
>>>
>>>     if ( c->family == 0xf || c->family == 0x11 )
>>>         return;
>>>
>>> (along the lines of what you have in amd_init_lfence_dispatch())?
>> Oh - that was a last minute refactor which I didn't do quite correctly. 
>> Yes, it should match amd_init_lfence_dispatch().
>>
>>>> +    /*
>>>> +     * On Zen3 (Fam 0x19) and later CPUs, LFENCE is unconditionally dispatch
>>>> +     * serialising, and is enumerated in CPUID.  Hypervisors may also
>>>> +     * enumerate it when the setting is in place and MSR_AMD64_DE_CFG isn't
>>>> +     * available.
>>>> +     */
>>>> +    if ( !test_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability) )
>>>> +        new |= AMD64_DE_CFG_LFENCE_SERIALISE;
>>>> +
>>>> +    /*
>>>> +     * If vulnerable to Zenbleed and not mitigated in microcode, use the
>>>> +     * bigger hammer.
>>>> +     */
>>>> +    if ( zenbleed_use_chickenbit() )
>>>> +        new |= (1 << 9);
>>>> +
>>>> +    if ( !new )
>>>> +        return;
>>>> +
>>>> +    if ( rdmsr_safe(MSR_AMD64_DE_CFG, &val) ||
>>>> +         (val & new) == new )
>>>> +        return;
>>>> +
>>>> +    /*
>>>> +     * DE_CFG is a Core-scoped MSR, and this write is racy.  However, both
>>>> +     * threads calculate the new value from state which expected to be
>>>> +     * consistent across CPUs and unrelated to the old value, so the result
>>>> +     * should be consistent.
>>>> +     */
>>>> +    wrmsr_safe(MSR_AMD64_DE_CFG, val | new);
>>> Either of the bits may be the cause of #GP. In that case we wouldn't set the
>>> other bit, even if it may be possible to set it.
>> This MSR does not #GP on real hardware.

I consider this unexpected / inconsistent, at least as long as some of the
bits would be documented as reserved. "Would be" because the particular
Fam17 and Fam19 PPRs I'm looking at don't even mention DE_CFG (or BP_CFG,
for that matter).

>> Also, both of these bits come from instructions AMD have provided,
>> saying "set $X in case $Y", which we have honoured as part of the
>> conditions for setting up new, which I consider to be a reasonable
>> guarantee that no #GP will ensue.

The AMD instructions are for particular models, aren't they? While that
may mean the bits are fine to blindly (try to) set on other models, pretty
likely this can't be extended to other families. (While
zenbleed_use_chickenbit() is family-specific, the LFENCE bit is tried
without regard to family.)

>> This wrmsr_safe() is covering the virt case, because older Xen and
>> Byhive used to disallow writes to it, and OpenBSD would explode as a
>> consequence.  Xen's fix was 4175fd3ccd17.
>>
>> I toyed with the idea of having a tristate de_cfg_writeable, but that
>> got very ugly very quickly
>>
>> The other option would be to ignore DE_CFG entirely under virt.  That's
>> what we do for BP_CFG already, and no hypervisor is going to really let
>> us have access to it, and it would downgrade to non-safe variants.
> 
> In fact, ignoring the virt case for DE_CFG makes this generally nicer.

And being consistent with what we do with BP_CFG looks desirable to me as
well.

Jan

