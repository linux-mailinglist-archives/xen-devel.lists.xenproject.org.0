Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB4384C8B5
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 11:33:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677345.1053885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXfF2-0000G1-Jh; Wed, 07 Feb 2024 10:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677345.1053885; Wed, 07 Feb 2024 10:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXfF2-0000Cr-Gr; Wed, 07 Feb 2024 10:33:20 +0000
Received: by outflank-mailman (input) for mailman id 677345;
 Wed, 07 Feb 2024 10:33:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXfF0-0000Cl-KP
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 10:33:18 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dbe148d-c5a4-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 11:33:16 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40fff96d5daso3837445e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 02:33:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h13-20020a05600c314d00b0040fdc7f4fcdsm4894934wmo.4.2024.02.07.02.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 02:33:15 -0800 (PST)
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
X-Inumbo-ID: 4dbe148d-c5a4-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707301996; x=1707906796; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ZGj5tm/xCQ2+UYNEw9SgAD65WI1XL19bihdd14q2NI=;
        b=UAGL6JAOgv7wy/NXnGZ6UDsuQMSEWv8b0BZVFCJPhcQyTUT0ex3AmISUd3flGOjPgJ
         YtHNtEKAWtZeCWdZdsqZODdekSNiA+g5KaNwTK8XzgmOc+fAp7aBT0xHg7DlCy+3ahzy
         1k8+Z/RHB8z4BVUivV2EatuevPtU2xfVCjZPkS4bkDM0onDc29d5TRWT2lCVczsT3Lt/
         Hkay4ogacYtiUEgB0hsoGnQHpb/VS71A1tT89x+iG2oritoK+Hy8RjRDIGxRAOTTQx52
         /lMkoOSxiva14QfwGWcLpCaXOylcI//SBvbsGdoJ6qLu7ncyKmoychHd3RpSE0t5o2bL
         We6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707301996; x=1707906796;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZGj5tm/xCQ2+UYNEw9SgAD65WI1XL19bihdd14q2NI=;
        b=xM3yrSrnc8ngJTMnyw26HzicPt2yMQy6EPVQYlced/pjE9uh44fPgm/nhN3n24TUwo
         jRRo6D7rJXadsVtPuimaUYMYIyw8x7XToQiWNgV3+lpaXrLkcgappXmPNFj94sb3w9/p
         2lh01wNKKB0I1+LuxvjZulwdJjLvP2nXglRNwE6gC6e/2zFZiPMkN4zD3hO+KMwGES9u
         uhQZJt38Amso8GLcJ4cDvHgHgmse5mVjKGJ/0NVJeGiJfNdNL4vLlwLaQ0UCugCHIkiD
         uim59lHkctvXZ6gDP+iUU56T8eerB4LVvELMZH5+PshwKWV8y3BwEdT8crip4TWsfWYa
         cJNQ==
X-Gm-Message-State: AOJu0YzLV2C26qnWTKjaf/6sf81TcZAZdIKK0QH8QgcfZJhirEVrfcup
	AJ093eT6GQZCipPHdwx/nxGSragY7y8nYQZ7FhNamPGgSyVnf/Hvaok64BRBMA==
X-Google-Smtp-Source: AGHT+IE1yd8TsaNvx8WfeHmQG2itRlSrKm7BVviPV4E6vn6HI6IjGuqnYJoVT+KaS91ODyB63DPFsw==
X-Received: by 2002:a05:600c:524d:b0:410:471:a2e with SMTP id fc13-20020a05600c524d00b0041004710a2emr1378298wmb.32.1707301996045;
        Wed, 07 Feb 2024 02:33:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSFwsBZF0dcIs8rE6fkwRoTJ42P87bkQzxNqCj9CjZY8+vUfP2u1aM4+J6thwyUveomgzopFtSuPTyXPGuk4u9qIkyqjFk3otdSw20yII=
Message-ID: <6ac74dfb-1899-41a9-9e1c-5a204fb5913f@suse.com>
Date: Wed, 7 Feb 2024 11:33:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] iommu/vt-d: switch to common RMRR checker
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20240201170159.66330-1-roger.pau@citrix.com>
 <20240201170159.66330-4-roger.pau@citrix.com>
 <90f8e183-5e78-49e8-ae2f-9898c1d7686b@suse.com> <ZcNG5C9gEzlcWJPw@macbook>
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
In-Reply-To: <ZcNG5C9gEzlcWJPw@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.02.2024 10:01, Roger Pau Monné wrote:
> On Tue, Feb 06, 2024 at 12:28:07PM +0100, Jan Beulich wrote:
>> On 01.02.2024 18:01, Roger Pau Monne wrote:
>>> Use the newly introduced generic unity map checker.
>>>
>>> Also drop the message recommending the usage of iommu_inclusive_mapping: the
>>> ranges would end up being mapped anyway even if some of the checks above
>>> failed, regardless of whether iommu_inclusive_mapping is set.
>>
>> I'm afraid I don't understand this: When not in an appropriate E820
>> region, you now even fail IOMMU initialization. Shouldn't such
>> failure only occur when inclusive mappings weren't requested? At
>> which point referring to that option is still relevant?
> 
> This is now better handled, since the VT-d code will use the same
> logic as the AMD-Vi logic and attempt to 'convert' such bogus RMRR
> regions so they can be safely used.  iommu_unity_region_ok() signals
> the RMRR region is impossible to be used, and hence not even
> iommu_inclusive_mapping would help in that case.

Impossible only in so far as we don't know whether a such named region
would actually still be accessed post-boot. But yes, if it wouldn't be
accessed, there would also be no need for passing the extra option.

>  Also note that
> iommu_inclusive_mapping is only applicable to PV, so the message was
> already wrong in the PVH case.

This is a fair point, which probably wants mentioning as (partial)
justification. Plus iirc the intention was to get rid of that option
anyway, at some point.

Jan

