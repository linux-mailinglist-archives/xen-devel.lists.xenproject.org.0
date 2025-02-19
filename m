Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D4AA3BFF5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 14:30:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892919.1301861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkk9u-0005cS-0M; Wed, 19 Feb 2025 13:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892919.1301861; Wed, 19 Feb 2025 13:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkk9t-0005Zh-TI; Wed, 19 Feb 2025 13:30:37 +0000
Received: by outflank-mailman (input) for mailman id 892919;
 Wed, 19 Feb 2025 13:30:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkk9s-0005ZZ-D7
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 13:30:36 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2f2d87e-eec5-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 14:30:35 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e04f2b1685so5038520a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 05:30:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e05168c467sm5749481a12.48.2025.02.19.05.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 05:30:34 -0800 (PST)
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
X-Inumbo-ID: b2f2d87e-eec5-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739971834; x=1740576634; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kMVrgTisSgGUlMUXcIA14e35QYBNYIWn+8/J00yr9cE=;
        b=CDip8rNSnmUIFo+AsoLMZ8o78o08H8CAF4QpElPm11HN+isjC1TFdwmv+5SmTgw7+Y
         iSgOq6yFoKYWtKvm6qs0Sx9imMRvh83CrAIa1ceCINSMNpRQj3h/T2nJPYRJNLDSVoWi
         6MFJdFEDRg/tQ32cv4YR/K6z6S68aW1io+h3JaIDeDde05uhORuNeD3/eV9UlBfJLl2+
         J21VYp+fR2yuqx/xlodQSXpJ0PukVi4Md0wvGHsCmKfSn+/4jG5kASc6wIzH726kekrk
         FkciAZSZ/qyBLsb5QOFT6gWSKSEiDeCmoAIw96los9Daej7plrJYfa2VUcKyTbMufn1c
         yaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739971834; x=1740576634;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMVrgTisSgGUlMUXcIA14e35QYBNYIWn+8/J00yr9cE=;
        b=HA66y7AFaR08Rs+k9/eumTdKO0ILtawkPejQTYCL6fhkJ/0hff+9HC/+m+GKtQRdsF
         vzomrLeTEN7ngzB2MJwPt+7wjed2QHBOG+/cJkPPrWlXzR6+LeMd0Ud9erqzbdKAnOyb
         KVNmEqIFkGJ38bMytk7/4jdN0+9GwBLvPej6rxSXpuY0w5yIsjElU2XklI86u9batkec
         VYTniY7+n5LfQT0+fBVgbXHDJY3OGZbLSRleLH3A8KB0hJub/7+lOeL7ENUf231GwqSv
         DP56v73dUov5NaKMWwjtWvtF5lPLS+nDcwvtsEjBPGX6zq/xIuU9je3ejnHwdAvfhsD/
         xF3g==
X-Forwarded-Encrypted: i=1; AJvYcCVPJJReD7ZkUMYsYovALa8gR+f9mDwOVR/Tm3V7tZw+Se4+D4p10S/nrpYj6AihHmeY+p89lRVX70s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTNFm/SFnb6M5EVMwlU1Bw75UnjI77deDqqFDo4Spfeky4NqSo
	BAPvZ1DkzeVZG/ilu76ZuhHVuIlYh+SjAB3kENG5Mmvwrrx+YmV0F5Qi9QSPAg==
X-Gm-Gg: ASbGncshz/gJAfJTo7NvgvacggLC+VrmCqUhi8tXwo6BMmuGwnBRRd+oI58EyJLJCed
	9H0GFR8ddsq5myIxRqSEG85zOS+oJswpyPXiTXcxnVAUgAAO1PMMBsFwtwUHcuSjYBBXgLxffG5
	1E2nL2vEtfWkfwLGumyZXjf8h3Qu/0sG5JZ6tU0S7ciEa92+7yZiygdtt7mnBuWJyGVcjrjZYAH
	nXR2dIeE7FtaOuxpCLMCpW2nrOIYx9ZGsU1Ch4uTKudaufIvpXPyZgz6t8FAp8vbkVZyaDti0Yk
	AwIXpVHuit+BZ7tZeym6ZjE99cpBvjnYPWAoUBicfzWfTuF+XVAE/3PMld6E9zGCkyjcJR4/Hnr
	u
X-Google-Smtp-Source: AGHT+IEidzYkCzd8fR/r14dDz5QhqknsqRg+pvamW0xHpdWmi+3nFmT/mVBGdFZEkgbFeahvqbtsQg==
X-Received: by 2002:a05:6402:430f:b0:5df:b6e1:4690 with SMTP id 4fb4d7f45d1cf-5e03602e5eemr48342656a12.12.1739971834429;
        Wed, 19 Feb 2025 05:30:34 -0800 (PST)
Message-ID: <cc864728-0302-4ddc-88e0-c5330e3dc409@suse.com>
Date: Wed, 19 Feb 2025 14:30:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250218095130.2666580-1-luca.fancellu@arm.com>
 <20250218095130.2666580-2-luca.fancellu@arm.com>
 <bc6b785c-627e-4185-aa02-b90b9e592d08@suse.com>
 <E6E21F32-EA02-4DE1-80CC-98D3A21FBF79@arm.com>
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
In-Reply-To: <E6E21F32-EA02-4DE1-80CC-98D3A21FBF79@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.02.2025 14:06, Luca Fancellu wrote:
>> On 19 Feb 2025, at 12:45, Jan Beulich <jbeulich@suse.com> wrote:
>> On 18.02.2025 10:51, Luca Fancellu wrote:
>>> --- a/xen/include/xen/iommu.h
>>> +++ b/xen/include/xen/iommu.h
>>> @@ -110,6 +110,8 @@ extern int8_t iommu_hwdom_reserved;
>>>
>>> extern unsigned int iommu_dev_iotlb_timeout;
>>>
>>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>> +
>>> int iommu_setup(void);
>>> int iommu_hardware_setup(void);
>>>
>>> @@ -122,6 +124,28 @@ int arch_iommu_domain_init(struct domain *d);
>>> void arch_iommu_check_autotranslated_hwdom(struct domain *d);
>>> void arch_iommu_hwdom_init(struct domain *d);
>>>
>>> +#else
>>> +
>>> +static inline int iommu_setup(void)
>>> +{
>>> +    return -ENODEV;
>>> +}
>>> +
>>> +static inline int iommu_domain_init(struct domain *d, unsigned int opts)
>>> +{
>>> +    /*
>>> +     * When !HAS_PASSTHROUGH, iommu_enabled is set to false and the expected
>>> +     * behaviour of this function is to return success in that case.
>>> +     */
>>> +    return 0;
>>> +}
>>
>> Hmm. Would the function be anywhere near likely to do anything else than
>> what it's expected to do? My original concern here was with "opts"
>> perhaps asking for something that cannot be supported. But that was wrong
>> thinking on my part. Here what you do is effectively open-code what the
>> real iommu_domain_init() would do: Return success when !is_iommu_enabled().
>> Which in turn follows from !iommu_enabled when !HAS_PASSTHROUGH.
>>
>> On that basis I'd be okay if the comment was dropped again. Else it imo
>> wants re-wording to get closer to the explanation above.
> 
> Would it be ok for you a comment saying:
> “This stub returns the same as the real iommu_domain_init()
>  function: success when !is_iommu_enabled(), which value is based on iommu_enabled
> that is false when !HAS_PASSTHROUGH"

I'm sorry, but this is too verbose for my taste. What's wrong with the more
terse

"Return as the real iommu_domain_init() would: Success when
 !is_iommu_enabled(), following from !iommu_enabled when !HAS_PASSTHROUGH"

?

>>> @@ -383,12 +429,12 @@ struct domain_iommu {
>>> #define iommu_set_feature(d, f)   set_bit(f, dom_iommu(d)->features)
>>> #define iommu_clear_feature(d, f) clear_bit(f, dom_iommu(d)->features)
>>>
>>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>> /* Are we using the domain P2M table as its IOMMU pagetable? */
>>> #define iommu_use_hap_pt(d)       (IS_ENABLED(CONFIG_HVM) && \
>>>                                    dom_iommu(d)->hap_pt_share)
>>>
>>> /* Does the IOMMU pagetable need to be kept synchronized with the P2M */
>>> -#ifdef CONFIG_HAS_PASSTHROUGH
>>> #define need_iommu_pt_sync(d)     (dom_iommu(d)->need_sync)
>>>
>>> int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>
>> Coming back to my v2 comment: Why exactly is this change needed here? If
>> things build fine without the macro being defined when !HAS_PASSTHROUGH,
>> surely they will also build fine with it being defined?
> 
> I’ve defined an empty stub on an header included only on MPU systems for the
> p2m module, this is why it is building

But that wasn't part of the patch, was it? I.e. with this series alone
applied, things still don't build?

> I didn’t modify p2m_set_way_flush() which lives in arm common code, because
> it will be used also on MPU systems (R82 has MPU at EL2 but MMU/MPU at EL1)
> and I would like to stay the same and be used by MMU/MPU subsystems.
> 
>> As per the
>> respective revlog entry, this change looks to belong into whatever is
>> going to be done to deal with the one Arm use of the macro. Or maybe
>> it's unneeded altogether.
> 
> I didn’t understand that you were opposing to protecting iommu_use_hap_pt() when
> !HAS_PASSTHROUGH, I thought you were referring only to the stub in the #else
> branch.
> Can I ask why?

Sure. And no, I'm not against the extra protection. I'm against unnecessary
code churn. That is, any such a re-arrangement wants to have some kind of
justification.

> in any case when !HAS_PASSTHROUGH, this macro is not usable
> since dom_iommu() is resolved to a membed that doesn’t exist in the configuration,
> am I missing something?

You very likely aren't, yet the macro's presence also does no harm. We
have lots of macros and declarations which are usable only in certain
configurations. Sometimes this just happens to be that way, sometimes it's
actually deliberate (e.g. to facilitate DCE).

Jan

