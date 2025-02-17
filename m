Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A45A7A38914
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 17:27:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890657.1299801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk3xY-0005ZT-GO; Mon, 17 Feb 2025 16:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890657.1299801; Mon, 17 Feb 2025 16:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk3xY-0005X0-DW; Mon, 17 Feb 2025 16:27:04 +0000
Received: by outflank-mailman (input) for mailman id 890657;
 Mon, 17 Feb 2025 16:27:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tk3xX-000531-Em
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 16:27:03 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04d90c92-ed4c-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 17:27:02 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-abadccdfe5aso514576866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 08:27:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa99f283sm99712866b.32.2025.02.17.08.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 08:27:01 -0800 (PST)
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
X-Inumbo-ID: 04d90c92-ed4c-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739809622; x=1740414422; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w7HUjlX9eZLcBQksWU+wLQFj/8UI0v19Zjwf/FT6UtE=;
        b=Gb+EWGb3ZbnmWMVa0BkLXImpNdwpdhIDhgaOtNB4Te8F7/jKntEosYFtVUC3DQo6Eh
         0yRPYYE3hIQtNUCWPg1+UCCftJJSL+5BXuw/qtcFk3k56ROs55T29vpns6Wmsqz6Gc0H
         W2hSGFYzXZCx+3EE+284Hgp8O/l3GLIZn7yn9JhRAtYEQBz0zl26cMWAVIYi6oOhUl3W
         h3X96uWCHPOl0BEfwT2i50kGSfbZlN1cvPc81uywYWr1Qnykkmj6uLMt5yUY4JVaP0mK
         6f0Fp7u2sr+oMz04dnVMtZo2i1R6Wn/23MfluPKSfatipRbggA5uZuvU9RUpGHMhVMJv
         p+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739809622; x=1740414422;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7HUjlX9eZLcBQksWU+wLQFj/8UI0v19Zjwf/FT6UtE=;
        b=pyLqoK+LXdhagJenMAKEtzr9RSsBcUYpzxmO9zX6rzCE3FLbQRjptdY53Ic4lIF7su
         PVVEJtybqpSabZMA25fXU1ZhcUltgMiWrSSzdOAZMtC8k26882qjO3/7lj94/q8UooOr
         3AFlDNqNZliCUN9yNttPVSFp05H9iohT1NtKXenmvi9jdE/BP86lwYl/XZUV7ALjK6oF
         HNpAVQrp54ISoJ8lNXGeGC+1gzGhUD4Wj+ei35Iqski2twJCyd0yyhW1EDW+NTHbxfG8
         wM+0s0Yl2oWPQF8UOgYf+FbpyMaaB6ttlXtogE+jfwda2ubAREXQoyCJDvzNq1lCWLW8
         LH0w==
X-Forwarded-Encrypted: i=1; AJvYcCVxgn2fj27ke4OBnbc2xb64SYupkjG0i/sckiE6bAbunhJhscK9sg5FQ08iuM7Pzvn36T9zrp0sT6Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRusC2IgD+GafERr4TGb8Q6AH1swEZnLjZ8OoObO1NZW6v0ERJ
	vBRtk6CY8Id7Ki7b7uvUFYCNTO5YkljGXeLLqHuFM2od4kpjcuQFsboGXzorAg==
X-Gm-Gg: ASbGnctj2BWLFeUEWoH35q5q5RkEnJNubvag58bFDJpWNXr3GazTWMuuMnFID6EOUC/
	m+94hKgacgObNaVyzTO0DR/jXr8YnAm0T/u3gRlXcj3gdxKPCY+fKi/DyefHRoTYrNdC17odjVe
	aSynvjQsbtt127pEZlCNiZV9w90hl9cYLAXo9nXuLCf8DtXoDIE981Zecni3NDH/ektuOJ0hVCw
	X9vA2im3W4B+yHODCP8AXU0sEtuDlybDFMuST+OO+s0qhWpWO3CroWiuD/Ze10WThRysoT51+ik
	Lstd+PLtKeqWSDpFwuxdGl1qsqsdfGrS8USHjFZW3G6CZTbdDLY5DBCfruv+7QLLGCNHOhnsrM9
	q
X-Google-Smtp-Source: AGHT+IFXGntu55XuQh2yxE7jyqQiYWZWovJaGYZsx9CI1m6wA1SkZDUofmeaY4wrBFAykDqZl1OboA==
X-Received: by 2002:a17:906:4fd5:b0:ab7:fc9a:28e1 with SMTP id a640c23a62f3a-abb70db75f4mr1049457666b.52.1739809622182;
        Mon, 17 Feb 2025 08:27:02 -0800 (PST)
Message-ID: <6bf1d945-e9c1-4e90-aced-cb52ab8e93e3@suse.com>
Date: Mon, 17 Feb 2025 17:27:01 +0100
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
 <51ebbaee-7927-488c-b69c-2bec1ba3b34c@suse.com>
 <6B58EB7A-1A39-40FC-94CF-C871AA3AE06C@arm.com>
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
In-Reply-To: <6B58EB7A-1A39-40FC-94CF-C871AA3AE06C@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.02.2025 17:14, Luca Fancellu wrote:
>>
>>>>> --- a/xen/include/xen/iommu.h
>>>>> +++ b/xen/include/xen/iommu.h
>>>>> @@ -110,6 +110,8 @@ extern int8_t iommu_hwdom_reserved;
>>>>>
>>>>> extern unsigned int iommu_dev_iotlb_timeout;
>>>>>
>>>>> +#ifdef CONFIG_HAS_PASSTHROUGH
>>>>> +
>>>>> int iommu_setup(void);
>>>>> int iommu_hardware_setup(void);
>>>>>
>>>>> @@ -122,6 +124,24 @@ int arch_iommu_domain_init(struct domain *d);
>>>>> void arch_iommu_check_autotranslated_hwdom(struct domain *d);
>>>>> void arch_iommu_hwdom_init(struct domain *d);
>>>>>
>>>>> +#else
>>>>> +
>>>>> +static inline int iommu_setup(void)
>>>>> +{
>>>>> +    return -ENODEV;
>>>>> +}
>>>>> +
>>>>> +static inline int iommu_domain_init(struct domain *d, unsigned int opts)
>>>>> +{
>>>>> +    return 0;
>>>>
>>>> Shouldn't this fail when is_iommu_enabled(d) is true? (The use of the
>>>> predicate here as well as in the real function is slightly strange, but
>>>> that's the way it is.)
>>>
>>> Right, probably you know better this code than me, I started from the assumption
>>> that when !HAS_PASSTHROUGH, 'iommu_enabled' is false.
>>>
>>> is_iommu_enabled(d) checks if the domain structure ‘options’ field has
>>> XEN_DOMCTL_CDF_iommu, this flag is set on domain creation when ‘iommu_enabled'
>>> is true on arm and x86.
>>>
>>> So when !HAS_PASSTHROUGH can we assume is_iommu_enabled(d) give false?
>>> Or shall we return for example the value of is_iommu_enabled(d)?
>>
>> Since HAS_PASSTHROUGH being selected conditionally a (pretty) new, I
>> fear that assumptions shouldn't be made. It's possible the stub could
>> remain as is, yet even then - if only for documentation purposes - I'd
>> suggest to have some ASSERT() there. In the end it all depends on how
>> XEN_DOMCTL_CDF_iommu is handled when !HAS_PASSTHROUGH.
> 
> I’ve tried to add an ASSERT(!is_iommu_enabled(d)); but it’s not building, I’m starting to think there
> is some reason why I can’t do that but I didn’t figure out why, I’ve added the inclusion for xen/sched.h,
> but it still says implicit declaration of function ‘is_iommu_enabled’…

Well, xen/sched.h includes xen/iommu.h. Hence when you make the latter
include xen/sched.h, that'll have a meaningful effect on use sites
of xen/iommu.h; wherever xen/sched.h is used the nested #include will
do nothing due to the include guard.

> But I could assert for !iommu_enabled: I checked into common/domain.c, sanitise_domain_config,
> if a domain is called with XEN_DOMCTL_CDF_iommu set, the function would fail if !iommu_enabled,
> so I would say that the stub returns the expected value (0) since for sure iommu_enabled is false and
> there cannot be a domain with that flag set that has the iommu_enabled=true under !HAS_PASSTHROUGH.
> 
> But would it be ok to add this assert (ASSERT(!iommu_enabled);) even if we know that iommu_enabled
> is false, since !HAS_PASSTHROUGH ?

Such an assertion then isn't very useful, imo. Since, as you say,
sanitise_domain_config() properly covers the !HAS_PASSTHROUGH case even
for cases like the MPU one, I think the code is fine then. A brief
comment might be nice ...

Jan

