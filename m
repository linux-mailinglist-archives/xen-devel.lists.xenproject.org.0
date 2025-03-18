Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6806DA66F07
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 09:50:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918654.1323301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuSeu-0001bB-1a; Tue, 18 Mar 2025 08:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918654.1323301; Tue, 18 Mar 2025 08:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuSet-0001Z1-UJ; Tue, 18 Mar 2025 08:50:47 +0000
Received: by outflank-mailman (input) for mailman id 918654;
 Tue, 18 Mar 2025 08:50:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuSet-0001Yv-6p
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 08:50:47 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 149086b3-03d6-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 09:50:45 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ac2c663a3daso408675866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 01:50:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3147efb0csm814435366b.65.2025.03.18.01.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 01:50:44 -0700 (PDT)
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
X-Inumbo-ID: 149086b3-03d6-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742287845; x=1742892645; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s2UB2+otQI+HBnU90fAci1OhkPqPUjZu9QxdJKxhTCQ=;
        b=R1DDIEK8G1N6lQeW5fYAa/KFWJIowQ3Gd9MOUcQ3jrEPr23MvvsdQc911B7cJ3JX41
         MBHN8luf7WSI2ArJBTsBzFi9NJ9+6Ng2eA/s+zS+09xUT8b69Y0UhKmgLkHbuzPsp/f2
         ot0gJ3kCQ1waMFl4RO58GqBUubiduUhgFav/rGntoh4WkUgzC/2RuK9ZQSTz/BhQ5eUM
         2BhukzsgoSdydMDyQzjE7WDxosgKaW9lyO0fzdLDT41Z0svAuLtf+g8L473co7YyH5wX
         0/IchL954pA1a61jKO3Ad/NMxsnOdgQHa6OHWvysrORHCSrcKlz0xVy96o2xyuD9F/eu
         A1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742287845; x=1742892645;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2UB2+otQI+HBnU90fAci1OhkPqPUjZu9QxdJKxhTCQ=;
        b=hyx1gFA8ffqHjCD7RqGl/aBMN77s+btOMv/SKmTfDAXMe/1JYGLIEv6Y+HQad/n+QI
         QI3KUD2NMqaLmNcvLFavAClH5kQqbg8g+SvRhbFNiHXVGNDDx5fIKHB/x/jv9VeQVT8z
         9W2dcpvlOC/J/x8a9cAhBMEoZ93g+ChRz/VSByxKC5N4ZOKEvr2mOYOlXwuGyztkvaWX
         QgOTv+xs6Lemdsi3ahuU16kYUM1ev1OWmr3C2ksY5m+nt0dF0xQyloMEi4mWOBGBrHKN
         nPdgx7e7zwCxWOdt5+MO8IXDZGpK3mkty2wzkTskrwHVKaeqx7vs7+EtRoB937JKsJEp
         Otog==
X-Forwarded-Encrypted: i=1; AJvYcCUqiOLTD9YTqai+VU5p4gi8t+SyagQIpDP2mt7uVmphO18H9mVLFwNqr/crSYeUBD7YA3sVLxyOu5M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTzFKvNV60w9zcAHgxeBv/3XxtU/qJ0rSY66fR99iCnpCw4Hz2
	X707Xn+jvfUeqd6iqYI389LcHDvNFyOpqGi9LoiKeRJvjphZ0AP3w4jdIdSO/g==
X-Gm-Gg: ASbGncvXXU/JY940rCtxjnVf8koZW7+xSsXCPTgthIujPBiB036rM/3QJaVA1ORFZXn
	i1BsUwuAuq0HbS8Kqy2H4Js0yTQBvnpSxWH3scumW1CCq4HpGmHJ3T3Q6KXGkwMDXajVE5UYhn1
	hU8PZ1V+Zh/bvkV85KOQPaX6/1h6KxdvR8KXP3onCIKGEhhkOkzE/8MQaInv5oNvIPhlTKvjweM
	DvIsJaIn8sXZpwuJNlFTJIc6MDRjiesBnWva1mxLv0Eo9BhNeYmFFh6zOuKNNUniK282nXPlbsE
	VuZA/zYT9zMLszS121wwzyQJHmZ1RRAJgB1ibWV/OB7/odLozO/k+KLVpyAqZccRxar7o8tOBns
	NtP8UKoK1gcs77SeJozJIR/XtoxRKUA==
X-Google-Smtp-Source: AGHT+IG+t5ZXjLwjJyM4UnPJRMexXs8huwdlDJ/rrvbMjW3ejIPeM9WhoJUrp2AOr4oy9pLHF6HlKA==
X-Received: by 2002:a17:907:7d89:b0:ac2:9683:ad2c with SMTP id a640c23a62f3a-ac3304a3a56mr1469362766b.57.1742287844662;
        Tue, 18 Mar 2025 01:50:44 -0700 (PDT)
Message-ID: <cb1ecd64-d528-4a6f-8333-bce66589a13b@suse.com>
Date: Tue, 18 Mar 2025 09:50:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/msi: always propagate MSI register writes from
 __setup_msi_irq()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250318084725.52261-1-roger.pau@citrix.com>
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
In-Reply-To: <20250318084725.52261-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.03.2025 09:47, Roger Pau Monne wrote:
> After 8e60d47cf011 writes from __setup_msi_irq() will no longer be
> propagated to the MSI registers if the IOMMU IRTE was already allocated.
> Given the purpose of __setup_msi_irq() is MSI initialization, always
> propagate the write to the hardware, regardless of whether the IRTE was
> already allocated.
> 
> No functional change expected, as the write should always be propagated in
> __setup_msi_irq(), but make it explicit on the write_msi_msg() call.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



