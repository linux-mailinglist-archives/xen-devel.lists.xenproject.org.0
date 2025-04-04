Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3CEA7BA58
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 12:01:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938026.1338851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0drA-0001a0-TD; Fri, 04 Apr 2025 10:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938026.1338851; Fri, 04 Apr 2025 10:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0drA-0001YY-QT; Fri, 04 Apr 2025 10:01:00 +0000
Received: by outflank-mailman (input) for mailman id 938026;
 Fri, 04 Apr 2025 10:01:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0drA-0001YS-6m
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 10:01:00 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac9a15af-113b-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 12:00:44 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so12418905e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 03:00:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30226bbfsm4028951f8f.90.2025.04.04.03.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 03:00:43 -0700 (PDT)
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
X-Inumbo-ID: ac9a15af-113b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743760844; x=1744365644; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Me87VXmAugcGrPspPCXCRCagC1gzwknzvFTp2wEZ5wo=;
        b=FmKK9xty0o8M0cBSDFnrHpumpeaMolZ4ttDHuEvh1D2SYHdt7u22PlRW0ktrF4id1J
         vQV8E7W/STpczAj8GzuhI+rwdPwzOG7khq3Cg5X7Apt0R+3Ve0Sx6ptmJz11mZ8nMLNB
         iRBDeJW38uIsteN1wyX0q5OboVqAqQk2EC8e0QYIdfWoGFdZRyawdPkjC+N94Ovg/dNK
         mejb5WzktLGVO0h0BlIYNDSGBNoT0fAeCyoDIGNSsez+skO5G9jsSugo5frG0b3An2mB
         PVJUzds/N4kJZkBaqRgvnRdb1ah9lg2wJyBTgdlsrpuLHkmALFwvuOVq3bf186Muvvvg
         4pXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743760844; x=1744365644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Me87VXmAugcGrPspPCXCRCagC1gzwknzvFTp2wEZ5wo=;
        b=RMogJE84Z5Yc7jc9D201yJ63oeuq2wLxYMsLnoJXKYE3rpv81vKwjXwXNbA+jBCCww
         RrNYAMqrfBaJRaha7738+7kiYCM53NqgLRIVBfci12FqZVQuTTuBp6lm6mziIweWSPDG
         fZPx6tC/Wlx0ejZ5C4nZKEfsCK0y4OniIRsaunT2teNE+b42CpyYzaGG4I0P0hOaQv1L
         cxEYlRn7wDt0s/9dp6OGQ7dkQPrNW9JPVrbb+rBR+kxfvneMEWbZsrw7US2FpAALZHEg
         aAGa9o5loF5Pyxb+NotIpmt61iQRiutxl862S3XjShxIRx2PqdTF+wkF2ehkpenTxbBO
         iVLg==
X-Forwarded-Encrypted: i=1; AJvYcCUH/u0UZVuaYuAqUN0uHJaAQeYgMUJ2n6UnNvDmISOBjC3N/p9Kjdy0cFbuirZWh6HxCpbOGZfZUrY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHzz7jxm1AXLtYfrt/oy00rnQzSyha2sGW9Tw83yfsiIon2ELy
	qq6AEakJ8H7H4bryGqYzjZJO25oAhZM+2HbYXPQ8Ld5M75B1TYdbql86o3t3vQ==
X-Gm-Gg: ASbGncsOjayhlaYFHTpI1VlhnwBRJs/526z4hf4CxM+NLQD4XJhdwXnje6S07MXyD4f
	7mAlPBpyQI0tH1jZu+mIfNrcHKBzFl+/8i7H9BsswGIfgyUbnMzdTOW5yuTQnjaBkg0YDWKxbrl
	Ig7RgqVRRcnBgxc00jfsOPhlzLyWtb5tbwIpEsHpM9jcZVhOVVezTypxFfevzWxoB+wotOJCXL8
	Lng2D82j56m1JdbnJfj6Lz+Q1HscC4ilcSndxFl2JavoR3g30aSwbr1LixowSUU3vXyUUP/g1aT
	5InfFFs+ghyrRoKhHSGZFCz558PxyHmaRBJEP9MxJsh9+WA0Xl1XiRsvxDX4xFwlU83Sga0L9An
	S3abojOT47asCUZVUxyi/8ekqsBvH7Q==
X-Google-Smtp-Source: AGHT+IHTs98WHl+62U/uhRijRpW2h4WgPUu0QKRXESthvEe6HsHQCshJEtpr3lb+dmMHEPZl5szBDg==
X-Received: by 2002:a05:600c:a03:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-43ed0d9ce99mr13167355e9.21.1743760844068;
        Fri, 04 Apr 2025 03:00:44 -0700 (PDT)
Message-ID: <93111e6d-976f-45b1-810c-c52c74efa215@suse.com>
Date: Fri, 4 Apr 2025 12:00:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: Increase XEN_VIRT_SIZE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <e5fa4219ccf43125e2489cc8c49b4404e6ed22ce.1743434164.git.oleksii.kurochko@gmail.com>
 <54ebdcb7-071f-411f-803a-930dc330a497@suse.com>
 <32264ccb-e566-41e0-973f-5bc7d874f970@gmail.com>
 <9d7e1553-3af8-4fc3-a400-8714d9b68411@suse.com>
 <30d8e316-aff5-498a-b2bd-448e0b2518ae@gmail.com>
 <3c2127ec-63fb-457b-8229-fc8a2b9fbf00@suse.com>
 <a4eb8bcf-7043-4661-8879-cdb33d1ca252@gmail.com>
 <14ac3e72-d21d-4b45-a434-d123152c0113@suse.com>
 <d954c167-8243-43ab-9bfb-2e47c8ea171a@gmail.com>
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
In-Reply-To: <d954c167-8243-43ab-9bfb-2e47c8ea171a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.04.2025 10:43, Oleksii Kurochko wrote:
> 
> On 4/4/25 9:52 AM, Jan Beulich wrote:
>> On 04.04.2025 09:31, Oleksii Kurochko wrote:
>>> On 4/4/25 8:56 AM, Jan Beulich wrote:
>>>> On 03.04.2025 18:20, Oleksii Kurochko wrote:
>>>>> On 4/1/25 6:04 PM, Jan Beulich wrote:
>>>>>> On 01.04.2025 17:58, Oleksii Kurochko wrote:
>>>>>>> On 3/31/25 6:14 PM, Jan Beulich wrote:
>>>>>>>> On 31.03.2025 17:20, Oleksii Kurochko wrote:
>>>>>>>>> +        _AC(XEN_VIRT_START, UL) >> vpn1_shift;
>>>>>>>>> +    const unsigned long xen_virt_end_vpn =
>>>>>>>>> +        xen_virt_starn_vpn + ((XEN_VIRT_SIZE >> vpn1_shift) - 1);
>>>>>>>>> +
>>>>>>>>>          if ((va >= DIRECTMAP_VIRT_START) &&
>>>>>>>>>              (va <= DIRECTMAP_VIRT_END))
>>>>>>>>>              return directmapoff_to_maddr(va - directmap_virt_start);
>>>>>>>>>      
>>>>>>>>> -    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
>>>>>>>>> -    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
>>>>>>>>> -           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
>>>>>>>>> +    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(8));
>>>>>>>> Is it necessary to be != ? Won't > suffice?
>>>>>>> It could be just > MB(2). Or perphaps >=.
>>>>>>> = would make the build fail, wouldn't it?
>>>>> I just realized that BUILD_BUG_ON() condition is compared to zero so actually everything what
>>>>> will make the condition true will cause a build fail as inside it used !(condition).
>>>> ???
>>> |BUILD_BUG_ON()| forces a compilation error if the given condition is true. Therefore, if the condition
>>> |XEN_VIRT_SIZE != MB(2)| is changed to|XEN_VIRT_SIZE > MB(2)|, the condition will always evaluate to true
>>> (assuming|XEN_VIRT_SIZE| is greater than 2 MB), which will result in a compilation error.
>> Well, it was you who used MB(2) in a reply, when previously talk was of MB(8),
>> and that to grow to MB(16). The BUILD_BUG_ON() is - aiui - about you having set
>> aside enough page table space. Quite possibly the need for this BUILD_BUG_ON()
>> then disappears altogether when XEN_VIRT_SIZE is properly taken into account
>> for the number-of-page-tables calculation. In no event do I see why the MB(2)
>> boundary would be relevant for anything going forward.
> 
> Also, doesn’t|BUILD_BUG_ON()| affect how the|ASSERT()| that follows it is written?
> 
> The changes, at the moment, look like:
> +    const unsigned int vpn1_shift = PAGETABLE_ORDER + PAGE_SHIFT;
> +    const unsigned long va_vpn = va >> vpn1_shift;
> +    const unsigned long xen_virt_start_vpn =
> +        _AC(XEN_VIRT_START, UL) >> vpn1_shift;
> +    const unsigned long xen_virt_end_vpn =
> +        xen_virt_start_vpn + ((XEN_VIRT_SIZE >> vpn1_shift) - 1);
> +
>       if ((va >= DIRECTMAP_VIRT_START) &&
>           (va <= DIRECTMAP_VIRT_END))
>           return directmapoff_to_maddr(va - directmap_virt_start);
>   
> -    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
> -    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
> -           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
> +    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(16));
> +    ASSERT((va_vpn >= xen_virt_start_vpn) && (va_vpn <= xen_virt_end_vpn));
> 
> 
> If|XEN_VIRT_SIZE| is greater than|GB(1)|, then|xen_virt_end_vpn| may be calculated
> incorrectly.
> 
> For example, if|XEN_VIRT_START| is|0xFFFFFFFF80000000| and|XEN_VIRT_SIZE| is|0x40200000|,
> then|(XEN_VIRT_SIZE >> vpn1_shift)| equals 513, whereas|va_vpn| is always in the range [0, 511],
> but xen_virt_end_vpn will be greater then 511.
> 
> So shouldn't it  be checked before ASSERT() that XEN_VIRT_SIZE is <= GB(1):
>    BUILD_BUG_ON(XEN_VIRT_SIZE <= GB(1))?

Yes, that would make sense.

Jan

