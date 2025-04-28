Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5DFA9EF3D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 13:37:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970580.1359233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Mmi-00071n-Qk; Mon, 28 Apr 2025 11:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970580.1359233; Mon, 28 Apr 2025 11:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Mmi-000702-Nz; Mon, 28 Apr 2025 11:36:28 +0000
Received: by outflank-mailman (input) for mailman id 970580;
 Mon, 28 Apr 2025 11:36:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9Mmh-0006zw-ND
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 11:36:27 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0337c792-2425-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 13:36:23 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so28806485e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 04:36:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d1e19e1sm152179965e9.0.2025.04.28.04.36.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 04:36:22 -0700 (PDT)
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
X-Inumbo-ID: 0337c792-2425-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745840183; x=1746444983; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v/VEjH8Mc2rJbHbL8+rjku2zwWptdjvvKxW5xxcn4t0=;
        b=a3wgJwwndxxzzsu9xsPm4crtPkm2mAUnHTKrppgM7zj+E1xfeQu15tbqeqllHt1QjQ
         Jv3kgpBfxoU6j5GCqOTJ4K4evaQ8DOdstuzZ4+e2aBpURVNgd3vOMYv7KLAAea6/OoAZ
         1Xom7epZEYfTDH8vVgbl4MZpJ1UtyEzQw4ff+ELK+9lGi3LxwrVTug9FxP2IrAAA16EI
         OfOdWOQ+MtrsHjC+he8ALdwy5qNVkBfk82ufhOy7MEmY1x+hiDeBUXVRZyxTa6adCyFg
         6Yyk7M52+6OcY1JPH0qeMu0jdX7mKFS1N7CbuKv72cxQ45/EFfmqq3dpdqxO7Y78+TSJ
         oEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745840183; x=1746444983;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/VEjH8Mc2rJbHbL8+rjku2zwWptdjvvKxW5xxcn4t0=;
        b=Plq2myfS7I1nVGZaYeVjTZsUCBnnTy0dGLAOQYbMcfsdXwmZiNmqGZStCjQN+MVFIe
         P75RhtQcUL7pd16au5tSZZwuvuosWRaB4RRNVnWQ3YLgrt/xVDQFPPvdp99OxeufYW29
         ZyLRmOt/7F8jhTrvcm2c7p9ua+YCOssI2FnGRYZCQZ/xD9cbD0F+q7GXRUJr2IR/1bkb
         0FkjTJtRonJZswP0NvZa0LZvzt6JqY0fNMuo+RPwPKbtN4VevTxA2zisOoCrTFrZzWRZ
         SXKt1EJuHGmCTi+v4ttyH7834BITbQ55x7VDusZxQZZraGkSKWRasa8QpLTZB5dhxgd0
         hTLw==
X-Forwarded-Encrypted: i=1; AJvYcCX8YqG+6AcsiK9TVOLWzpz/MJ9pdbccg8j+iZ01kjUcLyP/CT8PA5a2bBgisBrkdezBOUyZWvUJpx0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvKsNhToq49hJE2PE8T+vYH03DDZ7s7VZRdh0OdrVbociaVuFw
	QeK7UDBnw+6dT1u/WiQyRSy0+wmPC833sk+sHBNRlyiSlokoju5M61tt4n2nHg==
X-Gm-Gg: ASbGncsE0/54bW8k0YMXjJcPrNpKdofahzRjzfZc5G5o0byks13dp/ZCNTg5mYPMWWH
	J24jXfuiNpyzI9awPo3x6dki0AZIM9q5DRI+/R1gdn0/QBHDvs26CaMaBSHqfbKcMaPdvVqrV0y
	3kIQtq56cnt2M5Dl0X/kmz8x8Q0NKamX54cXlifFGRLF3ev1e8yFTCpQ9S8vukzW8D8XqJVj9CE
	lQzF59mcoavDCH0nCSAaf4Sf9DtPOhYcQTSxpASKczzGaHhc02DKm1zTjWtTAoBYuyjisDQA+ss
	taCsKBu3qP694gpTYrGby9JGAaAnMRxoQi3TG5JWf1iNpIxBKkyAMEoGgLexYWhFqo/vJAn3OBo
	MOYw2YcCpR2pF4DoPcVRstCZO1g==
X-Google-Smtp-Source: AGHT+IGZngNmxfjlOcIVuckB06bsG3ff4LX2Eu1RYrVZlFgZSinlZuAxw7ZKBhi+Nw9ezkBlp53Qig==
X-Received: by 2002:a05:600c:1395:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-440a65e4642mr129508715e9.10.1745840183062;
        Mon, 28 Apr 2025 04:36:23 -0700 (PDT)
Message-ID: <49ef6503-59c4-4802-931b-cfbc5a3b213f@suse.com>
Date: Mon, 28 Apr 2025 13:36:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
 <7fa0bde7-3aa9-48f4-a0ed-d03216edcc4e@suse.com>
 <c33b906f-f9cb-45e5-ac84-28dc687a6f7a@epam.com>
 <b4baad49-f751-42e6-9785-6d71aac3ebc3@suse.com>
 <4b5c5c57-2d7a-41ef-8ab8-caf9f2593b2c@epam.com>
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
In-Reply-To: <4b5c5c57-2d7a-41ef-8ab8-caf9f2593b2c@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.04.2025 13:26, Mykyta Poturai wrote:
> On 28.04.25 12:01, Jan Beulich wrote:
>> On 28.04.2025 10:21, Mykyta Poturai wrote:
>>> On 17.03.25 17:07, Jan Beulich wrote:
>>>> On 14.03.2025 14:34, Mykyta Poturai wrote:
>>>>> --- a/xen/arch/arm/pci/pci.c
>>>>> +++ b/xen/arch/arm/pci/pci.c
>>>>> @@ -16,9 +16,18 @@
>>>>>    #include <xen/device_tree.h>
>>>>>    #include <xen/errno.h>
>>>>>    #include <xen/init.h>
>>>>> +#include <xen/iommu.h>
>>>>>    #include <xen/param.h>
>>>>>    #include <xen/pci.h>
>>>>>    
>>>>> +bool is_pci_passthrough_enabled(bool dom0)
>>>>> +{
>>>>> +    if ( dom0 )
>>>>> +        return pci_passthrough_enabled || iommu_enabled;
>>>>
>>>> As I think I said before - the function's name now no longer expresses
>>>> what it really checks. That (imo heavily) misleading at the use sites
>>>> of this function.
>>>
>>> I've spent some more time thinking about how to better deal with this.
>>> In the end, I think your earlier suggestion about introducing a new arch
>>> specific function is the best approach, but I want to agree on the
>>> naming before sending new patches. Would "arch_requires_pci_physdev" be
>>> an appropriate name in your opinion?
>>>
>>> At the call sites it will look like this:
>>>       case PHYSDEVOP_pci_device_remove: {
>>>           struct physdev_pci_device dev;
>>>
>>>           if ( !is_pci_passthrough_enabled() && !arch_requires_pci_physdev())
>>>               return -EOPNOTSUPP;
>>
>> There are several questions that affect naming: Is it really "requires"? Is
>> it really all PCI-related physdevops? Is the ordering of naming elements in
>> line with what we use elsewhere (arch_ first is, but perhaps either pci or
>> physdevop wants to move earlier)?
> 
> I understand the issue with the ordering, will 
> "arch_pci_requires_physdev_ops" or "arch_physdev_pci_update_required" be 
> better? Regarding the specific ops, only add/remove are needed, but I am 
> not sure how to elegantly encode this in the name. Maybe you can suggest 
> something better if you have something specific in mind?

Simply arch_pci_device_physdevop()? This would also avoid the question if
it's "requires", "wants", or yet something else. (I'm not going to insist
that the verb be omitted, though. If it's included, I'd ask though that
it match in tense the "enabled" in the other predicate.) And it would cover
PHYSDEVOP_pci_device_reset as well, which sooner or later I expect you'll
discover you want/need Dom0 to issue, too.

Jan

