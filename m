Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1A6BDD4D9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 10:04:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143184.1476942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8wUJ-00037C-MI; Wed, 15 Oct 2025 08:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143184.1476942; Wed, 15 Oct 2025 08:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8wUJ-00034l-Jd; Wed, 15 Oct 2025 08:03:59 +0000
Received: by outflank-mailman (input) for mailman id 1143184;
 Wed, 15 Oct 2025 08:03:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oFce=4Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8wUI-00034c-6x
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 08:03:58 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7bb608fd-a99d-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 10:03:50 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-421851bcb25so2910816f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Oct 2025 01:03:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm27301563f8f.35.2025.10.15.01.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 01:03:48 -0700 (PDT)
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
X-Inumbo-ID: 7bb608fd-a99d-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760515429; x=1761120229; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JwOlmygE2zUE1cwIJpljvCVJcHOjpKhWGQSi8MynjPM=;
        b=F3XbGc6lkiHDTupeoeHoyOzrMXXQuwByPZpUY4eq/Ub0VpzzzGZuwr1LY1+ZX7OUn8
         /vlUtze6Zc2J0rLxAkiSUHJE5TTIRDtc+/jsH8Mlet2IM+jYUILh0PAKJKGIxnDTod4l
         Z9EET3iLWz6ONLtDciPIJLsUW5eJGIwJ50OUKJ2W8BoUNieeez1wXlCvZxBJW5qbPzWc
         efBg68sUX90eNfFWYSxksXBorhcy80vv5IUBrjK9pT4XSCPUZZHKwUt7HZTuFBE38M+0
         bXlvxGCy+FiwnfyVVXac15bdxRGB9AiOt5aX0sQa2HHg2Xn6wTVbwtAbd53x8mD6Lxof
         XMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760515429; x=1761120229;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwOlmygE2zUE1cwIJpljvCVJcHOjpKhWGQSi8MynjPM=;
        b=fVzpo9bZuBS7xVgC1oz/W84H6p2PHML7ByVEFSAlMu7mAwIQfebA+5Ja3XU357ulHs
         h8I2bcqbU7dyDvln5FZ1WymqyPm9qBMh/cVU5nblVRyNFneWWcBCw9hJ3dZSAEsIQBjk
         2Z5Q5ckFxrMLPAjiQVEcctoE32r8uIiMZLU0hqofaQGUasGKK/YFHa4K06fDWFYaB6f1
         DAhXUAIGDZeZnb3F+b3iO9WHfeODBRmABIRk9F/FTws2IALb3WigZ5+pBacQsRUZ0i+A
         6WaiPxnroRIZ5nT0Uwm7T/7f2MtTHqCebPgHW1ss0+wF+ynoe4loD5l524Srl1Jezkfg
         U4sw==
X-Gm-Message-State: AOJu0YxpY9tTTDNbm1XvwFcB++VG8wZOaWnPaLxC7IghJA92c4C7EHFT
	FBSoXgbSArUiDVLbvIpnhtbcc1jIRhF/zs8LwwZE7MP+SWlbIyiq4Lk0m8Xw/zIPUg==
X-Gm-Gg: ASbGncvieZ/swNaURf+x51BreHGoO00jrKrajToU2AtfHB8hRUIrmj2AkR5ywgVKb/x
	rnF/PF6wwFtVBlu+hi0y2ZF5C2Wc/dMTCXGK3N3waolB0DQae2k+fVBI3R5K2M+i03jhYBg6UJr
	pKVkfClJlVRrK4S7Ef0QYRulhVKcHT0z+2XgyWj4TcJ623tWYhZQlAwEsLimTDr4ksuxnjhDwCY
	WOpDsVD33V2EiMNwUL31YLh9g2A1tx0U5uNcjMTFTetEGE/3LYEQ7t2u4SADG53y3o3hLHVJIQQ
	fOKtAJGqD5Pbi1HqbHT5eA5mMAGWbLYd5WixxgapPkvN2GHrPO5pe3k+rZdN9U3EycSQzLvLQpa
	ENKKk07VSm0yUNe1K91/UEAD7qrSu3VIhZE9mFqfNNOtiuMs3Cax2h3sHIcescTrQi6tAnxDkyB
	WsikuEfZtelzi4SG2/nyxuc8vw0g==
X-Google-Smtp-Source: AGHT+IEI1Ajrpr6gaRgbVP47zeyZQPfoDgJQKKu7c0Vz8OzsRHLIyHDVqfdVf0qQfMbHoJNie9C3Pw==
X-Received: by 2002:a05:6000:603:b0:401:5ad1:682 with SMTP id ffacd0b85a97d-4266e7bf04fmr18238400f8f.14.1760515429317;
        Wed, 15 Oct 2025 01:03:49 -0700 (PDT)
Message-ID: <4cb43a9e-3fec-4e02-a75f-f6440197c1a3@suse.com>
Date: Wed, 15 Oct 2025 10:03:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86: make Viridian support optional
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
 <aOzt8gfxkdQXZ6O1@Mac.lan> <e6972ea5-2139-4f4d-8d2c-2979fe2fad99@epam.com>
 <aO5gdh6C_uQoFHPH@Mac.lan> <afe544d3-575c-44e8-9068-8c79f69d6175@epam.com>
 <aO9UgQ3J27hVgGIa@Mac.lan>
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
In-Reply-To: <aO9UgQ3J27hVgGIa@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.10.2025 10:00, Roger Pau Monné wrote:
> On Tue, Oct 14, 2025 at 06:48:23PM +0300, Grygorii Strashko wrote:
>>
>>
>> On 14.10.25 17:38, Roger Pau Monné wrote:
>>> On Tue, Oct 14, 2025 at 04:24:53PM +0300, Grygorii Strashko wrote:
>>>> On 13.10.25 15:17, Roger Pau Monné wrote:
>>>>> On Tue, Sep 30, 2025 at 12:52:16PM +0000, Grygorii Strashko wrote:
>>>>>> From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>>>>> +
>>>>>> +	  If unsure, say Y.
>>>>>> +
>>>>>>    config MEM_PAGING
>>>>>>    	bool "Xen memory paging support (UNSUPPORTED)" if UNSUPPORTED
>>>>>>    	depends on VM_EVENT
>>>>>> diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
>>>>>> index 6ec2c8f2db56..736eb3f966e9 100644
>>>>>> --- a/xen/arch/x86/hvm/Makefile
>>>>>> +++ b/xen/arch/x86/hvm/Makefile
>>>>>> @@ -1,6 +1,6 @@
>>>>>>    obj-$(CONFIG_AMD_SVM) += svm/
>>>>>>    obj-$(CONFIG_INTEL_VMX) += vmx/
>>>>>> -obj-y += viridian/
>>>>>> +obj-$(CONFIG_VIRIDIAN) += viridian/
>>>>>>    obj-y += asid.o
>>>>>>    obj-y += dm.o
>>>>>> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>>>>>> index 23bd7f078a1d..95a80369b9b8 100644
>>>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>>>> @@ -701,9 +701,12 @@ int hvm_domain_initialise(struct domain *d,
>>>>>>        if ( hvm_tsc_scaling_supported )
>>>>>>            d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
>>>>>> -    rc = viridian_domain_init(d);
>>>>>> -    if ( rc )
>>>>>> -        goto fail2;
>>>>>> +    if ( is_viridian_domain(d) )
>>>>>> +    {
>>>>>> +        rc = viridian_domain_init(d);
>>>>>> +        if ( rc )
>>>>>> +            goto fail2;
>>>>>> +    }
>>>>>
>>>>> Are you sure this works as expected?
>>>>>
>>>>> The viridian_feature_mask() check is implemented using an HVM param,
>>>>> and hence can only be possibly set after the domain object is created.
>>>>> AFAICT is_viridian_domain(d) will unconditionally return false when
>>>>> called from domain_create() context, because the HVM params cannot
>>>>> possibly be set ahead of the domain being created.
>>>>
>>>> You are right. Thanks for the this catch.
>>>>
>>>> Taking above into account above, it seems Jan's proposal to convert below
>>>> viridian APIs into wrappers for VIRIDIAN=n case is right way to move forward:
>>>>
>>>> int viridian_vcpu_init(struct vcpu *v);
>>>> int viridian_domain_init(struct domain *d);
>>>> void viridian_vcpu_deinit(struct vcpu *v);
>>>> void viridian_domain_deinit(struct domain *d);
>>>>
>>>> Right?
>>>
>>> Possibly. If you don't want to introduce a XEN_DOMCTL_createdomain
>>> flag you need to exclusively use the Kconfig option to decide whether
>>> the Viridian related structs must be allocated.  IOW: you could also
>>> solve it by using IS_ENABLED(CONFIG_VIRIDIAN) instead of
>>> is_viridian_domain() for most of the calls here.
>>>
>>> The wrapper option might be better IMO, rather than adding
>>> IS_ENABLED(CONFIG_VIRIDIAN) around.
>>
>> I'll do wrappers - less if(s) in common HVM code.
>>
>>>
>>>> [1] https://patchwork.kernel.org/comment/26595213/
>>>>
>>>>>
>>>>> If you want to do anything like this you will possibly need to
>>>>> introduce a new flag to XEN_DOMCTL_createdomain to signal whether the
>>>>> domain has Viridian extensions are enabled or not, so that it's know
>>>>> in the context where domain_create() gets called.
>>>>
>>>> In my opinion, it might be good not to go so far within this submission.
>>>> - It's not intended  to change existing behavior of neither Xen nor toolstack
>>>>    for VIRIDIAN=y (default)
>>>> - just optout Viridian support when not needed.
>>>
>>> OK, that's fine.
>>>
>>> On further request though: if Viridian is build-time disabled in
>>> Kconfig, setting or fetching HVM_PARAM_VIRIDIAN should return -ENODEV
>>> or similar error.  I don't think this is done as part of this patch.

ENODEV was suggested here; it's not clear to me why ...

> Another bit I've noticed, you will need to adjust write_hvm_params()
> so it can tolerate xc_hvm_param_get() returning an error when
> HVM_PARAM_VIRIDIAN is not implemented by the hypervisor.
> 
> Implementing the Viridian features using an HVM parameter was a bad
> approach probably.
> 
>> Sure. Just have to ask for clarification what to return:
>> -EOPNOTSUPP (my choise) vs -EINVAL.

... other values were suggested here.

> Let me add Jan also to the To: field so we get consensus in one round.
> 
> I won't use EINVAL, because that's returned for deprecated parameters
> also, and when the passed Viridian feature mask is invalid.
> 
> EOPNOTSUPP is also returned for non-implemented hypercalls, so I'm not
> sure whether it could cause confusion here, as the hypercall is
> implemented, it's just the param that's not supported if
> build-disabled.  Maybe ENODEV or ENXIO?

I'd be okay with either of these two, with a slight preference to ENODEV.

Jan

