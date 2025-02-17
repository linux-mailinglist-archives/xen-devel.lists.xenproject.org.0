Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859B4A382A0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 13:11:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890342.1299327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjzxU-0001j5-5m; Mon, 17 Feb 2025 12:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890342.1299327; Mon, 17 Feb 2025 12:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjzxU-0001gb-36; Mon, 17 Feb 2025 12:10:44 +0000
Received: by outflank-mailman (input) for mailman id 890342;
 Mon, 17 Feb 2025 12:10:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjzxT-0001gV-2J
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 12:10:43 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 350a4883-ed28-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 13:10:41 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-abb75200275so265925766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 04:10:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb9da9f0desm169659866b.105.2025.02.17.04.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 04:10:40 -0800 (PST)
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
X-Inumbo-ID: 350a4883-ed28-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739794241; x=1740399041; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YJ3qtkh8owPXzF67qwh6HN2aUt4d529MQtmTr/qeDm8=;
        b=fgT/k1hTLD9Z5rHRxNIILrGXRqjUsgih0ESNKP7sIbtQsbvcrIQYPB0dHC28WWLMJM
         tMHsrCjSkghgVtupx11puUEMf8OkJqRtnTMIW0fIlmBcWUO/9Ob0EMAfL4zAFTtZUT6S
         u0oQbxDkDkK/9DGUfAlneKXmEfT42OfI2zsbk+wpaGmbk/YBXX8XFtNLcV6BkEUpyo5I
         mKOJhtIU3QBgL0A0zj8xxSa04V3/z+/sv1WvDUXIJUNzfz2jTMXrq+igu1az30FzIfz5
         kFhnV9T0/lUxyYow/vb3Lm1SCGWkSqr4B2FsZFAMV2MHDqGMpCJnrwxdhbviTMXzv9oX
         Btvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739794241; x=1740399041;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ3qtkh8owPXzF67qwh6HN2aUt4d529MQtmTr/qeDm8=;
        b=CRdB+yQvZYDp/KavBPpZfrgXbXv+pfNboEFdD8JwQFHk517TbemzbJXzKz0iLrML4e
         tg3IY85EfDqI8jpXxKGCTHc/sk7hKJ5CvX6MPsX/TluIlHWWQwn4k5nrmLCXOskFCHRV
         9Vd7jnFXtFEVXBIGQKOT+bD9ooDGkofIOy3o49XBkgHBFgwB7GuzdS/6xMOqml3Qxe0G
         MMzKn7WRO84/NHtq3kt2PQvOpOQEqk7U7ordlMbhFVJFauuXvaGa4IZd+htwnx3ezky/
         FPocY134XApP3SkdlgYTH3Fjnrm5C8s+wPjjb+P+HKphOXZd8ExCRnmgS8qwZntUyzJz
         Rorg==
X-Forwarded-Encrypted: i=1; AJvYcCUaqW5tNIjmeiqGUzSXDyVF0wUpETxRUcy/s3h3YNuI0wfaNe5qtOKK588vuFHTN/ZraTfWfXTyZIs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymIENnkgbnxT7UestBqHkREliG2Bl6mF/uaISjlhLLYUHWGA4O
	FnePs2FBa+dDknHe3P0WfohcLUgWMjzu0B9P3FgYiAkLQ66WCwYeejaSEyiL0Q==
X-Gm-Gg: ASbGncuO5QH/uAIOXjUlauLGZEj8AmZK4sTpFRwiGQ3+I2TUCN/4d20gaDMJjLe013n
	fQqqv9iv06Naq195LO1XaT9k4v0JgDEpZAdNzsoXSg4b4JMG0wZs8DHbS2+S9qwGtadbbmMrY6s
	H+pQC/OtOI9av4VMdg4nKzwO//lx3SDAbeqluU2Sv+g8UzO9AIceTeuGjJesLiXQ+8Tgf/qZ8IZ
	gezBC22hrACW3Moa6DTno5V/g+VuQOdebc34+jauhFA+DpElk3uz/oN1VIvbP1qLj5t4RbXktXV
	gQ/ACAp6SNVLdPU/A/UVvEyR6v6vLewdprk7q//Nc6SNJtpnz16EXd/n/zPaRafXVwpA5RqMKs3
	t
X-Google-Smtp-Source: AGHT+IHlAsiWXpr6yv7heXsz2Y92CWwVBmVvXYvZYbOce1fuutgC0lKFXAj8dz+ULiFe/j85riMs8g==
X-Received: by 2002:a17:906:dc8e:b0:ab7:aaf2:f7f9 with SMTP id a640c23a62f3a-abb70de28d4mr1022423566b.42.1739794241081;
        Mon, 17 Feb 2025 04:10:41 -0800 (PST)
Message-ID: <51ebbaee-7927-488c-b69c-2bec1ba3b34c@suse.com>
Date: Mon, 17 Feb 2025 13:10:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250217102732.2343729-1-luca.fancellu@arm.com>
 <20250217102732.2343729-2-luca.fancellu@arm.com>
 <cbea397a-e919-4b00-a56a-f706ddc13e53@suse.com>
 <5CB44FBF-09A3-4587-B5A5-3D4BBB9D58A5@arm.com>
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
In-Reply-To: <5CB44FBF-09A3-4587-B5A5-3D4BBB9D58A5@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.02.2025 12:55, Luca Fancellu wrote:
>> On 17 Feb 2025, at 10:50, Jan Beulich <jbeulich@suse.com> wrote:
>> On 17.02.2025 11:27, Luca Fancellu wrote:
>>> When Xen is built without HAS_PASSTHROUGH, there are some parts
>>> in arm and x86 where iommu_* functions are called in the codebase,
>>> but their implementation is under xen/drivers/passthrough that is
>>> not built.
>>
>> Why the mention of x86, where HAS_PASSTHROUGH is always selected?
> 
> sure, I’ll remove x86
> 
>>
>>> So provide some stub for these functions in order to build Xen
>>> when !HAS_PASSTHROUGH, which is the case for example on systems
>>> with MPU support.
>>
>> Is this fixing a build issue when MPU=y? If so, ...
>>
>>> For gnttab_need_iommu_mapping() in the Arm part, modify the macro
>>> to use IS_ENABLED for the HAS_PASSTHROUGH Kconfig.
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>
>> ... is there a Fixes: tag missing?
> 
> right, I’ll add a tag, but I don’t expect it to be backported, also the MPU will still
> have some changes needed before being able to build, should I put a tag even
> if this is the case?

If you're fixing an issue an earlier commit introduced, it's always a
good idea to add a Fixes: tag. That'll also help reviewers and
observers.

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
>>> @@ -122,6 +124,24 @@ int arch_iommu_domain_init(struct domain *d);
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
>>> +    return 0;
>>
>> Shouldn't this fail when is_iommu_enabled(d) is true? (The use of the
>> predicate here as well as in the real function is slightly strange, but
>> that's the way it is.)
> 
> Right, probably you know better this code than me, I started from the assumption
> that when !HAS_PASSTHROUGH, 'iommu_enabled' is false.
> 
> is_iommu_enabled(d) checks if the domain structure ‘options’ field has
> XEN_DOMCTL_CDF_iommu, this flag is set on domain creation when ‘iommu_enabled'
> is true on arm and x86.
> 
> So when !HAS_PASSTHROUGH can we assume is_iommu_enabled(d) give false?
> Or shall we return for example the value of is_iommu_enabled(d)?

Since HAS_PASSTHROUGH being selected conditionally a (pretty) new, I
fear that assumptions shouldn't be made. It's possible the stub could
remain as is, yet even then - if only for documentation purposes - I'd
suggest to have some ASSERT() there. In the end it all depends on how
XEN_DOMCTL_CDF_iommu is handled when !HAS_PASSTHROUGH.

>>> @@ -381,17 +423,19 @@ struct domain_iommu {
>>> #define iommu_set_feature(d, f)   set_bit(f, dom_iommu(d)->features)
>>> #define iommu_clear_feature(d, f) clear_bit(f, dom_iommu(d)->features)
>>>
>>> +/* Does the IOMMU pagetable need to be kept synchronized with the P2M */
>>
>> This comment belongs to just ...
>>
>>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>> /* Are we using the domain P2M table as its IOMMU pagetable? */
>>> #define iommu_use_hap_pt(d)       (IS_ENABLED(CONFIG_HVM) && \
>>>                                    dom_iommu(d)->hap_pt_share)
>>>
>>> -/* Does the IOMMU pagetable need to be kept synchronized with the P2M */
>>> -#ifdef CONFIG_HAS_PASSTHROUGH
>>> #define need_iommu_pt_sync(d)     (dom_iommu(d)->need_sync)
>>
>> ... this, not also iommu_use_hap_pt().
> 
> I’ll move that close to need_iommu_pt_sync(d)
> 
>> There's a connection between the
>> two, but that is unrelated to what the comment says. I'm also not clear
>> about the need for ...
>>
>>> int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>>                     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
>>> #else
>>> +#define iommu_use_hap_pt(d)       ({ (void)(d); false; })
>>> +
>>> #define need_iommu_pt_sync(d)     ({ (void)(d); false; })
>>
>> ... this change, i.e. the need for a stub. Afaics there's nothing in the
>> description to help understanding this need.
> 
> Ok, so in arch/arm/p2m.c the function p2m_set_way_flush() uses this,
> so I provided a stub, do you think I should provide something in the
> commit message to explain that or shold I try to find another way in order to
> don’t provide this stub?

Finding another way would be preferred, but isn't a requirement. Looking
at p2m_set_way_flush() I for one can't figure how page table arrangements
can matter there. Nor can I see how "flush by VA" fits with MPU (where,
aiui, there's no real notion of VA). So yes, if this can't be done
differently to avoid the need for the stub, something will imo want saying
in the description.

Jan

