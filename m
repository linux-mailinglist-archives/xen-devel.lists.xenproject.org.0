Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBA483A48F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 09:51:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670806.1043824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYyN-0005zw-Bu; Wed, 24 Jan 2024 08:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670806.1043824; Wed, 24 Jan 2024 08:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSYyN-0005xl-9B; Wed, 24 Jan 2024 08:51:03 +0000
Received: by outflank-mailman (input) for mailman id 670806;
 Wed, 24 Jan 2024 08:51:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSYyM-0005xd-8x
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 08:51:02 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b250d9f4-ba95-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 09:51:00 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cf1288097aso15519131fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 00:51:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w28-20020a02cf9c000000b0046f177277desm45510jar.108.2024.01.24.00.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 00:50:59 -0800 (PST)
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
X-Inumbo-ID: b250d9f4-ba95-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706086259; x=1706691059; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=55T1hPpBQANGO/GLRngLaJp3A6Mt9O4uX1ghnAaCyBc=;
        b=Ue2gcOUTH4V0OlAlvzDFXsa0qouCqg7O7Qe5LUn3tVIg0efVNJM7C38M6hZ/svTseo
         UntIwPX8BlF0SFM0ygslX4tzvlIjzP15VgW2bR5fGktZ3Ya/dWKubB9kSwWvYOkWQWDQ
         ZDDEZGmm0EZfRvT8oqYr55oS4AR89oCJUkFwiZomIixv6OPFczeZzycOmyTP3XvpesXB
         V82DxHD7lK5GM0M/dOvuRj6qTE3zV6p7bIRME89xME8jvr3wgPwF4R7d+MIiEHv7soSu
         IqijPdaKw2fdVdH+qHT4PyVMp9hR0VFk/5qs2G3pqjWgXg5YmDpaXBVg8/FUmeHZLBys
         EQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706086259; x=1706691059;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=55T1hPpBQANGO/GLRngLaJp3A6Mt9O4uX1ghnAaCyBc=;
        b=dIRyW2zPyjMp5IAq+xNUiyhDfwERwwROv9GwH9r3Ase7bBfOeLYxtl4I+jcUjF6RKE
         +nDoAi5kZeCpNBKJwgb7Gw2Q4+cTzdryWe8q/DANFWtgp/CyvbEZnjJuGyvwmC4xeDK3
         UB5a7wjhjixiJV3itkcUv4Dfa3KlMTsxc6/87lKr/U+0wP45buj9TqN3gTTud4xHksX6
         /crHzw24+wTMq44BGmLSRGH+jfAihTQcul3vzTEtsUTyw82EtnPGr4L57gYV6w6MKCX1
         PqDnuntwXnSVlNsqD17vstj1drEkNQSzv24G15uyMXQvqxqnrXidqNHMovQf9Xbepi+V
         ZKgg==
X-Gm-Message-State: AOJu0YyN6XRZ96sBKtT2Yf4mdEs1fcdAQLifCLyZz+kppcE4T9nJgiYq
	VK5qFyFfTpwwbAu2bZ/Tqg6EZ3KDUPaOVzWLxP+uig+UylL66IgoklmSJ4cWgw==
X-Google-Smtp-Source: AGHT+IGR9Tbs5Z7GxBNfLbGzNL049IPkRbCv0jiU9m21L3qYy3QBIrK4NFB7TPzV7X7fuMycjtCv+w==
X-Received: by 2002:a2e:780c:0:b0:2cd:15c9:247f with SMTP id t12-20020a2e780c000000b002cd15c9247fmr631505ljc.80.1706086259619;
        Wed, 24 Jan 2024 00:50:59 -0800 (PST)
Message-ID: <16bdb126-0cee-4014-9a88-d916455e35c4@suse.com>
Date: Wed, 24 Jan 2024 09:50:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12.2 01/15] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <20240115194309.45683-1-stewart.hildebrand@amd.com>
 <7e936e6a-3218-4c4a-ac68-a58cd363a11d@suse.com>
 <e05e63ab-a86f-45c4-bd80-2b7d6b99aa3d@amd.com>
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
In-Reply-To: <e05e63ab-a86f-45c4-bd80-2b7d6b99aa3d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.01.2024 06:07, Stewart Hildebrand wrote:
> On 1/23/24 09:29, Jan Beulich wrote:
>> On 15.01.2024 20:43, Stewart Hildebrand wrote:
>>> @@ -1043,11 +1043,11 @@ static int __pci_enable_msix(struct pci_dev *pdev, struct msi_info *msi,
>>>  {
>>>      struct msi_desc *old_desc;
>>>  
>>> -    ASSERT(pcidevs_locked());
>>> -
>>>      if ( !pdev || !pdev->msix )
>>>          return -ENODEV;
>>>  
>>> +    ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));
>>> +
>>>      if ( msi->entry_nr >= pdev->msix->nr_entries )
>>>          return -EINVAL;
>>
>> Further looking at this - is dereferencing pdev actually safe without holding
>> the global lock?
> 
> Are you referring to the new placement of the ASSERT, which opens up the possibility that pdev could be dereferenced and the function return before the ASSERT? If that is what you mean, I see your point. The ASSERT was placed there simply because we wanted to check that pdev != NULL first. See prior discussion at [1]. Hmm.. How about splitting the pdev-checking condition? E.g.:
> 
>     if ( !pdev )
>         return -ENODEV;
> 
>     ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));
> 
>     if ( !pdev->msix )
>         return -ENODEV;

Yes, this is the particular arrangement I would have expected (at least
partly based on the guessing of the purpose of holding those locks).

Jan

> [1] https://lore.kernel.org/xen-devel/85a52f8d-d6db-4478-92b1-2b6305769c96@amd.com/


