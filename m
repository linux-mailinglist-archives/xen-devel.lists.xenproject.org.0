Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD74B08ADB
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 12:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046563.1416889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucLzM-0005PO-7R; Thu, 17 Jul 2025 10:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046563.1416889; Thu, 17 Jul 2025 10:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucLzM-0005NX-4m; Thu, 17 Jul 2025 10:37:20 +0000
Received: by outflank-mailman (input) for mailman id 1046563;
 Thu, 17 Jul 2025 10:37:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucLzL-0005NQ-8W
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 10:37:19 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02486de6-62fa-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 12:37:17 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so460475f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 03:37:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f1b355sm15385701b3a.80.2025.07.17.03.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 03:37:15 -0700 (PDT)
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
X-Inumbo-ID: 02486de6-62fa-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752748636; x=1753353436; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wSYy00YipdsRu0kt5K556U9fbHum6Q8JicTZV4TGcHI=;
        b=HrfZ2T5JSKwPP9qZZ1/p6oIMur+eYBnlnGVqgidcBMMAox3nc8gV7eV96MMShIK8AU
         GZSr21SeYlLtmhzDnPe3qT6PK12Z1yJPkvgJTmef6/1CqFTJLkKodcfxetBx8asflgCX
         YrQLT0DfoaxgzcGpNHKgNSZEm8A1voaeoRWXprKbwc74BClktr4lL2w6whBcu3pNvwvR
         cp4W2ps3bX3k3IoIXhXgm/SY9+U0CkLZu14LuR0UryYSl+dfE9Y21y7h2y7fNk6UlUY8
         Zim8c0Ew5q4Vt44POBkID0+QyVT9YK/c1pIrmJ87gPCeaNNWvd3iIO1Ckvqta+7rJtaZ
         ie4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748636; x=1753353436;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSYy00YipdsRu0kt5K556U9fbHum6Q8JicTZV4TGcHI=;
        b=hlp2hwGnQ/e0syVa3DHHLSilIyXLunu82/qTb+0FWritHUs2zMHBX1S5swPI2JSauc
         76LWaTjioB/sIt980uBSElzIoqT9vqnZr9Pt94R9PQMmQeZltFubkUKPHaCFrkdBDvLB
         zM6nZbUDdeDmTb3baGPyutk4WThcQIDJP54qc1L2v4tPzt3gAeLRewyaEEOxXUvJb3ZU
         gyZ6lfV3K7upqDkg89GAmSIS0iX1gOf++MFLj7htHgY/a4NDvTnF7SaDcamtrnOuZmQy
         nKb+jcAT8cjkTxwhZVQj3xO3EsWZeZwtE9EJ4AhsgLB8OsQ/IwS7aMHuxaGzacY1s8uf
         Mh2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtfzEdDxwcd0DYy80gzSyO+GTgeMbqQJk26fuok4YkeuKIlOjjT4ndhfRPZFQcszfno3dB8Hx7zYA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUymTpbw+bkrmGuYeDgPB/B4a5Ey5D0K2wH1mYo0arThU4b/Wk
	h42hUPR8leN00xkKbO9pPqpmkGkjiN6nIVFer7VLFFVKMFCE2P+komuOnsBJfmrWaw==
X-Gm-Gg: ASbGncuqxBBpP2Hn5tFHZBHhip4rnQLE6Ph1w2O29uZBV5/+Ff9oGgn8qhttMrOTZ4e
	MkOZJdFZZF82VeH/0vHJEB5edxDcn0vZRhYAIFTLJAJI2uctYcZJiits4rOy0GDka6pJUKn21ZB
	4USQwGXbReAMjIaTATEnWIwWyqXie1t2wD9bMC+qId5nKArKvuBkBYomG73WyAY0D2XEHyzRWwR
	KavMldu9/4Cxi/tQdvPpAQ7kHBHQ1AcrZ7PrrKlw4KELcIrdaI+mqQ7xOkS1NwmBabhga07N97z
	MdBjIbDIddyOn0pFSlA+LfcbXSL4xuXVg7IDTd/k0UC7ro+8QNQF18ij/eyOiOvoodOOREt3NRV
	kihzC9lF+un3a7HUz7g1eO5MJ99yXsIC2cZlUO6jTSHf+XZQ6i1FjjPsKwZysd3eulgBkeZXoIc
	uhBO46xnU=
X-Google-Smtp-Source: AGHT+IFK6E8Dqw/wshPiEQNd9mX/h8nJYCwUenYdhdHuC8CpbJhk2ui1Pc1+DPdvgYrHRp2cbTnWzQ==
X-Received: by 2002:a05:6000:43d4:10b0:3a6:d7ec:c701 with SMTP id ffacd0b85a97d-3b60dd7aa83mr3742807f8f.30.1752748636500;
        Thu, 17 Jul 2025 03:37:16 -0700 (PDT)
Message-ID: <106fb5b5-937f-480b-82ad-12a0fb972caf@suse.com>
Date: Thu, 17 Jul 2025 12:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/17] xen/riscv: implement p2m_next_level()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <cc696a9e4e74233c81f0cbcfd303cee91b8271af.1749555949.git.oleksii.kurochko@gmail.com>
 <1496586d-484c-4e99-aea7-974be335150f@suse.com>
 <b0013513-2646-4de4-a172-0d2ea571a3e8@gmail.com>
 <aabb6eeb-fe2a-4b95-b844-560d2c70bcd5@suse.com>
 <d63ab4e1-d98b-4251-a5c7-87bf4688d5bb@gmail.com>
 <b57e5145-8112-4e86-9d0d-fd836039bd26@suse.com>
 <a3beabba-b320-4401-861e-b528309b786d@gmail.com>
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
In-Reply-To: <a3beabba-b320-4401-861e-b528309b786d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.07.2025 11:42, Oleksii Kurochko wrote:
> On 7/16/25 6:12 PM, Jan Beulich wrote:
>> On 16.07.2025 17:53, Oleksii Kurochko wrote:
>>> On 7/16/25 1:43 PM, Jan Beulich wrote:
>>>> On 16.07.2025 13:32, Oleksii Kurochko wrote:
>>>>> On 7/2/25 10:35 AM, Jan Beulich wrote:
>>>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>>>> --- a/xen/arch/riscv/p2m.c
>>>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>>>> @@ -387,6 +387,17 @@ static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>>>>>>         return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>>>>>>     }
>>>>>>>     
>>>>>>> +/*
>>>>>>> + * pte_is_* helpers are checking the valid bit set in the
>>>>>>> + * PTE but we have to check p2m_type instead (look at the comment above
>>>>>>> + * p2me_is_valid())
>>>>>>> + * Provide our own overlay to check the valid bit.
>>>>>>> + */
>>>>>>> +static inline bool p2me_is_mapping(struct p2m_domain *p2m, pte_t pte)
>>>>>>> +{
>>>>>>> +    return p2me_is_valid(p2m, pte) && (pte.pte & PTE_ACCESS_MASK);
>>>>>>> +}
>>>>>> Same question as on the earlier patch - does P2M type apply to intermediate
>>>>>> page tables at all? (Conceptually it shouldn't.)
>>>>> It doesn't matter whether it is an intermediate page table or a leaf PTE pointing
>>>>> to a page — PTE should be valid. Considering that in the current implementation
>>>>> it’s possible for PTE.v = 0 but P2M.v = 1, it is better to check P2M.v instead
>>>>> of PTE.v.
>>>> I'm confused by this reply. If you want to name 2nd level page table entries
>>>> P2M - fine (but unhelpful). But then for any memory access there's only one
>>>> of the two involved: A PTE (Xen accesses) or a P2M (guest accesses). Hence
>>>> how can there be "PTE.v = 0 but P2M.v = 1"?
>>> I think I understand your confusion, let me try to rephrase.
>>>
>>> The reason for having both|p2m_is_valid()| and|pte_is_valid()| is that I want to
>>> have the ability to use the P2M PTE valid bit to track which pages were accessed
>>> by a vCPU, so that cleaning and invalidating RAM associated with the guest vCPU
>>> won't be too expensive, for example.
>> I don't know what you're talking about here.
> 
> https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/mmu/p2m.c#L1649

How does that Arm function matter here? Aiui you don't need anything like that
in RISC-V, as there caches don't need disabling temporarily.

>>> In this case, the P2M PTE valid bit will be set to 0, but the P2M PTE type bits
>>> will be set to something other than|p2m_invalid| (even for a table entries),
>>> so when an MMU fault occurs, we can properly resolve it.
>>>
>>> So, if the P2M PTE type (what|p2m_is_valid()| checks) is set to|p2m_invalid|, it
>>> means that the valid bit (what|pte_is_valid()| checks) should be set to 0, so
>>> the P2M PTE is genuinely invalid.
>>>
>>> It could also be the case that the P2M PTE type isn't|p2m_invalid (and P2M PTE valid will be intentionally set to 0 to have
>>> ability to track which pages were accessed for the reason I wrote above)|, and when MMU fault occurs we could
>>> properly handle it and set to 1 P2M PTE valid bit to 1...
>>>
>>>> An intermediate page table entry is something Xen controls entirely. Hence
>>>> it has no (guest induced) type.
>>> ... And actually it is a reason why it is needed to set a type even for an
>>> intermediate page table entry.
>>>
>>> I hope now it is a lit bit clearer what and why was done.
>> Sadly not. I still don't see what use the P2M type in of an intermediate page
>> table is going to be. It surely can't reliably describe all of the entries that
>> page table holds. Intermediate page tables and leaf pages are just too different
>> to share a concept like this, I think. That said, I'll be happy to be shown code
>> demonstrating the contrary.
> 
> Then it is needed to introduce new p2m_type_t - p2m_table and use it.
> Would it be better?
> 
> I still need some type to have ability to distinguish if p2m is valid or not from
> p2m management and hardware point of view.
> If there is no need for such distinguish why all archs introduce p2m_invalid?
> Isn't enough just to use P2M PTE valid bit?

At least on x86 we don't tag intermediate page tables with P2M types. For
ordinary leaf entries the situation is different, as there may be varying
reasons why a PTE has its valid (on x86: present) bit cleared. Hence the
type is relevant there, just to know what to do when a page is accessed
through such a not-present PTE.

Jan

