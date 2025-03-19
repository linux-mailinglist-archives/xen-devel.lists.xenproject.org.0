Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6842DA6935B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 16:29:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920880.1324928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuvLs-0000zX-05; Wed, 19 Mar 2025 15:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920880.1324928; Wed, 19 Mar 2025 15:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuvLr-0000wS-TZ; Wed, 19 Mar 2025 15:29:03 +0000
Received: by outflank-mailman (input) for mailman id 920880;
 Wed, 19 Mar 2025 15:29:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBEQ=WG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuvLr-0000wM-AP
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 15:29:03 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1fec89d-04d6-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 16:29:01 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso34122405e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 08:29:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df33d7sm21946642f8f.17.2025.03.19.08.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 08:29:00 -0700 (PDT)
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
X-Inumbo-ID: e1fec89d-04d6-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742398140; x=1743002940; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=woN9XHE1DKpQYeaRz9fxcwHymAsNrh+urqEVaw9Uv8M=;
        b=ABT2CoJUbR05Fyv6GhtvgHAPF15AKXofyP9Z8N9OEnikFLEMZlk/QuIQBXmQ67mrch
         EmImaXgLIZtIKrMoDf4s/jQhhq0ZBQzy/57zXJoROVm7bbXo3RWmprTLUqU53GKxMcsG
         CdQQfJNG5zH1wkFPAy9tpAsjjuRHefgtLAgLD8dEB7Uwaan580XCKVUAe/t6/gSkB+w3
         zdu3sDzzMGWhHzjG7II1ZWpYtK/XQPftbkYiTcntWoQp73eA6lAUPBbgt9pjp1SMbP0V
         +n5dNh647Z1+acwVYxCideWXbEYlEcgMpYXLiOz6BxXRHDcUQH+PwMlhzHTN60jZNS4K
         /yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742398140; x=1743002940;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woN9XHE1DKpQYeaRz9fxcwHymAsNrh+urqEVaw9Uv8M=;
        b=vI7sXP2rMrCGn3r8S7RzGhxNteVmKSUwGmq4z1rZ0GfO3+aDFDc5xFsDxT2Y0xcEoo
         3V+NZmh9WjY+1C77msWd0g1gMm5zlU/SjNBO82nupasa6u4L/P44I5e0Bo05EofU6ncB
         6WfeSOk+weHyL14LRf91oZg3j9fuvndh7aQuqjDQLmHZh0ybzknsvQ+TAhizI1ayU24Q
         09exXe+33mPHjZdVBy57yaiLTSNih42XfRHIeezomwUH90yaFSgTsE7OTwg8OCjBPB0H
         Jrd8eK7EcvDg7hJdUCZj32SCYGFTlLNGgRUqBSK34dE7U2TGRs4+n1P2wqaJxzw45z8Z
         2GbA==
X-Forwarded-Encrypted: i=1; AJvYcCV5Ju1HY14NV0DgbrP+AlSvleoqxMVbj7vxLv2T5ncf2yyJtDS9wlACasTYD3oxHi1onrA7+rwysAY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzerpy5kH7Fc+u4DD+E7GRWK9l6AGR92m3o7Mu1ivKkBgUXrrb2
	t7gdAhPRc5iRkt9puIJIrKNtf1TVREvTeAe9+b5mna3iUb1oSwJBI71zrtbjVA==
X-Gm-Gg: ASbGncsEmsqJ7rE65Wix5Y64HRBM+wrTIWSwFEx2Q+qA94X70r5MB5J6qTEOfqi4hVM
	FmLf6StJy9WJkUB72H3phRe96szf/AYY1iEOXxkeNbYx0JYyAwS0YI6p+OmrGBaLuux50pxcqoC
	rsNh6/yRwKBqZZzkIio9UjqF/Z0m0DH4Q0PvKGZrCqrub33I2MqzkXzhpf/um4UDMsVJdopQ4Py
	vV7L6KBliB0Rz4Cw2iYPgUO8M1R4JdywyuOfhYb5n6REBHM8OCXSyTv2TWhHnJbnGbDths330Cw
	3VZFfmCq/NhsYQC0qjnKOYB+UZMKyds7eVRPUlGF1WxIwWuO94CVhCn4caX+rUxDhDjqX9d+lyw
	nVIx9uMVw5RnD9BDHEO+hIeK2pL9IyA==
X-Google-Smtp-Source: AGHT+IHzPl749cmxfeCOU6YKp3BHkm4wlDB8bzNeDtJ8RWYkZc6/rcMIsfeYj7dbXK0fiWx41EAl1A==
X-Received: by 2002:a5d:64ee:0:b0:392:c64:9aef with SMTP id ffacd0b85a97d-399739c1f58mr3287383f8f.20.1742398140346;
        Wed, 19 Mar 2025 08:29:00 -0700 (PDT)
Message-ID: <9a0ac3c1-e448-4acd-a471-d8d8e14fbc44@suse.com>
Date: Wed, 19 Mar 2025 16:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <95d779f00127defa37f3c5056c762ea0da47fc53.1741958647.git.mykyta_poturai@epam.com>
 <d646b0b9-bae8-4f97-908a-f2e52cac708d@suse.com>
 <710bfddb-6ce3-4b11-bcd8-91f17d4f5be2@epam.com>
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
In-Reply-To: <710bfddb-6ce3-4b11-bcd8-91f17d4f5be2@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2025 16:21, Mykyta Poturai wrote:
> On 17.03.25 16:56, Jan Beulich wrote:
>> On 14.03.2025 14:34, Mykyta Poturai wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> The main purpose of this patch is to add a way to register PCI device
>>> (which is behind the IOMMU) using the generic PCI-IOMMU DT bindings [1]
>>> before assigning that device to a domain.
>>>
>>> This behaves similarly to the existing iommu_add_dt_device API, except it
>>> handles PCI devices, and it is to be invoked from the add_device hook in the
>>> SMMU driver.
>>>
>>> The function dt_map_id to translate an ID through a downstream mapping
>>> (which is also suitable for mapping Requester ID) was borrowed from Linux
>>> (v5.10-rc6) and updated according to the Xen code base.
>>>
>>> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt
>>>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>>> ---
>>> Regarding pci_for_each_dma_alias question: getting host bridge node
>>> directly seems like a simpler solution with the same result. AFAIU
>>> with pci_for_each_dma_alias in linux we would arrive to the host brige
>>> node anyway, but also try to call dt_map_id for each device along the
>>> way. I am not sure why exactly it is done this way in linux, as
>>> according to the pci-iommu.txt, iommu-map node can only be present in
>>> the PCI root.
>>>
>>> v8->v9:
>>> * replace DT_NO_IOMMU with 1
>>> * guard iommu_add_pci_sideband_ids with CONFIG_ARM
>>
>> I fear I'm confused: Isn't this contradicting ...
>>
>>> v7->v8:
>>> * ENOSYS->EOPNOTSUPP
>>> * move iommu_add_pci_sideband_ids to iommu.c to fix x86 build
>>
>> ... this earlier change? Really, with there being no caller, I can't see
>> why there could be any build issue here affecting only x86. Except for
>> Misra complaining about unreachable code being introduced, which I'm sure
>> I said before should be avoided.
> 
> The original reason for moving this function was the conflicting ACPI
> and EFI headers, I described it in V8 comments here[1].
> 
>>
>>> --- a/xen/drivers/passthrough/iommu.c
>>> +++ b/xen/drivers/passthrough/iommu.c
>>> @@ -20,6 +20,7 @@
>>>   #include <xen/param.h>
>>>   #include <xen/softirq.h>
>>>   #include <xen/keyhandler.h>
>>> +#include <xen/acpi.h>
>>>   #include <xsm/xsm.h>
>>>
>>>   #ifdef CONFIG_X86
>>> @@ -744,6 +745,20 @@ int __init iommu_get_extra_reserved_device_memory(iommu_grdm_t *func,
>>>       return 0;
>>>   }
>>>
>>> +#ifdef CONFIG_ARM
>>
>> I realize we have CONFIG_X86 here as well (visible even in context of the
>> earlier hunk. Yet then the goal ought to be to reduce these anomalies, not
>> add new ones. Since I don't have a clear picture of what's wanted, I'm also
>> in trouble suggesting any alternative, I'm afraid.
> 
> Here is a short summary:
> 
> The main problem is that we need this function somewhere, but there is
> no good place for it. It is only called on ARM for now but it's not
> ARM-specific by nature and can be eventually used on other platforms as
> well. It can't be just dropped because of the effort to support the
> co-existence of DT and ACPI. It also can't be declared as a static
> function because it requires the inclusion of <xen/acpi.h> for
> acpi_disabled define, which leads to build errors[1]. And without ifdef
> guards it would be a MISRA violation.

An abridged version of this ought to go in the patch description, I think.
This is special, so it needs calling out.

As to the placement - would making an entirely new .c file possibly help?
(Then, instead of in the patch description, maybe the special aspect could
be put in a code comment at the top of the file.)

Jan

