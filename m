Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC41B07ACD
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 18:13:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045457.1415585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4ke-0005px-K3; Wed, 16 Jul 2025 16:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045457.1415585; Wed, 16 Jul 2025 16:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4ke-0005nZ-HO; Wed, 16 Jul 2025 16:13:00 +0000
Received: by outflank-mailman (input) for mailman id 1045457;
 Wed, 16 Jul 2025 16:12:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc4kd-0005nT-Id
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 16:12:59 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc73675b-625f-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 18:12:57 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4555f89b236so155615e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 09:12:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f49502sm13438567b3a.115.2025.07.16.09.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 09:12:55 -0700 (PDT)
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
X-Inumbo-ID: bc73675b-625f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752682377; x=1753287177; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dURoBYUkr7lBpsJZpF8x5VSu6D54E5dlbxp7mjxRuhI=;
        b=PAJQrIIk0xBF4/SIj2dn7ZXno1G+UbQq2J08zFblvKcOJT2d1lSNJkMjBVyiR4N7yb
         2UQcSZEAyEJzoHQigY9fAF0HLOSjcKJoCC1KN2eAPDu+IOThCnmhB3PR7ueOY9A1Ju+1
         Bq173oF0SkqjpUxHqNKqOl/Du/QhJZK7aql05WQqzn4C/72mar5gv4ndE3dlhIDEwTfK
         buSaO662FZBPVd+xCaGRJSx9NkHARTjHPErO2EaavRr8NAJJGnRlNP9cTD0wPQ6+I267
         F/sQlPWcIhWkTdeg54Cb6hHMpfW422cBTgi6howxwSNnpnA6ho+XyrdTWFNG6Qisa3ew
         SbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752682377; x=1753287177;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dURoBYUkr7lBpsJZpF8x5VSu6D54E5dlbxp7mjxRuhI=;
        b=ux9zyS5Ekep/IfC7Jhgi2aP74wG5pePOh8wnziJDqv4XZzPqdVY3bjjTqFGzi7dme6
         knNqyZ9eCH84xnYgastSTe9ULvnEdgJrao3uWofCWKD2W8AR7ysj2FrfTVTfMytveDe+
         2MCtMATpUPbPj0jPrLM3CEYidD86dxnuyfW4ptjfTRGs0SebkUB5cV7CQW1BEU9T29E7
         TL7/meH5OCSFHOfEiNWZa7MQb/1wzTMRGzw2nEkMMdJSRos9lTadX5hzY+QAyvz6rLyX
         NS9WhLExtIiq6NkfOzJnkyWwR571Jtxa8Nl5ZcLZL/USNTlCNSBwC0GyYSs2lVfyo3Vc
         3Cdg==
X-Forwarded-Encrypted: i=1; AJvYcCUJSmY5AcPIW5cvhqH7UohpeFI/iO9k648j9cRlfAtc4YCOLC6AN33MFFjmlA2BsYM+a2WPSEqHk4E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yym4zWumX5a2W+xY0QV7wT3dLIX0lix+lliZfzMOzRIwREbYL+r
	B/vp9ka0HAndAq/KgUvKMT/EPFfd0/sEwohiTbkW0MgxxAtILw1SHsLrXLFbpsCKaA==
X-Gm-Gg: ASbGncsBQtqm9SkFdlbRKVnmWvAquZ0N2fO1K2cip9Nik8SMS3kSnPR5YfIZz9Qqv9m
	Hu7TLvKXsllgl3z6OO8xhSMRf0ERFxMDNvLcwdAhXs7Ph3AMfjlaWcdl2VSshxYhdyU6TvDp5Lr
	9fQytkVj+AI6utdcwOMN2haHsMmIXapSr6vsvMg0UjD4S0OMyFbXM8SgeHGWYqt7q9SXZqRuFn8
	dD8r9/Ttk5swQNUNx9+gt6MfWSSjpxddDUnKSgPUGhxHpn1f7Cni5T7WsiBvA3rfjrmykwdYZvg
	0fvtwhQYv75pQaKmWQTYlllV1PnkQUm85F8momIx9NvGelel96PmwDxAL8hhy53K99jVULB3EpN
	/9BdJ1qXuM9a1v7rYSXDSvUekm+Y1SjWpxLyfmrd0TRnSfBaT+eCS2Hf40gzPo/JJlMM+2QgqaV
	5hStUDMhc=
X-Google-Smtp-Source: AGHT+IG8PGiUQTofYueDcTbt2lGTUDk8BLwLjs7zE49E8B/VTSrEKaghFN5ekd8X5uk1OhPQRKN05w==
X-Received: by 2002:a5d:5d0f:0:b0:3a5:2875:f985 with SMTP id ffacd0b85a97d-3b60e541decmr2774268f8f.59.1752682376442;
        Wed, 16 Jul 2025 09:12:56 -0700 (PDT)
Message-ID: <b57e5145-8112-4e86-9d0d-fd836039bd26@suse.com>
Date: Wed, 16 Jul 2025 18:12:45 +0200
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
In-Reply-To: <d63ab4e1-d98b-4251-a5c7-87bf4688d5bb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.07.2025 17:53, Oleksii Kurochko wrote:
> On 7/16/25 1:43 PM, Jan Beulich wrote:
>> On 16.07.2025 13:32, Oleksii Kurochko wrote:
>>> On 7/2/25 10:35 AM, Jan Beulich wrote:
>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/p2m.c
>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>> @@ -387,6 +387,17 @@ static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>>>>        return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>>>>    }
>>>>>    
>>>>> +/*
>>>>> + * pte_is_* helpers are checking the valid bit set in the
>>>>> + * PTE but we have to check p2m_type instead (look at the comment above
>>>>> + * p2me_is_valid())
>>>>> + * Provide our own overlay to check the valid bit.
>>>>> + */
>>>>> +static inline bool p2me_is_mapping(struct p2m_domain *p2m, pte_t pte)
>>>>> +{
>>>>> +    return p2me_is_valid(p2m, pte) && (pte.pte & PTE_ACCESS_MASK);
>>>>> +}
>>>> Same question as on the earlier patch - does P2M type apply to intermediate
>>>> page tables at all? (Conceptually it shouldn't.)
>>> It doesn't matter whether it is an intermediate page table or a leaf PTE pointing
>>> to a page — PTE should be valid. Considering that in the current implementation
>>> it’s possible for PTE.v = 0 but P2M.v = 1, it is better to check P2M.v instead
>>> of PTE.v.
>> I'm confused by this reply. If you want to name 2nd level page table entries
>> P2M - fine (but unhelpful). But then for any memory access there's only one
>> of the two involved: A PTE (Xen accesses) or a P2M (guest accesses). Hence
>> how can there be "PTE.v = 0 but P2M.v = 1"?
> 
> I think I understand your confusion, let me try to rephrase.
> 
> The reason for having both|p2m_is_valid()| and|pte_is_valid()| is that I want to
> have the ability to use the P2M PTE valid bit to track which pages were accessed
> by a vCPU, so that cleaning and invalidating RAM associated with the guest vCPU
> won't be too expensive, for example.

I don't know what you're talking about here.

> In this case, the P2M PTE valid bit will be set to 0, but the P2M PTE type bits
> will be set to something other than|p2m_invalid| (even for a table entries),
> so when an MMU fault occurs, we can properly resolve it.
> 
> So, if the P2M PTE type (what|p2m_is_valid()| checks) is set to|p2m_invalid|, it
> means that the valid bit (what|pte_is_valid()| checks) should be set to 0, so
> the P2M PTE is genuinely invalid.
> 
> It could also be the case that the P2M PTE type isn't|p2m_invalid (and P2M PTE valid will be intentionally set to 0 to have 
> ability to track which pages were accessed for the reason I wrote above)|, and when MMU fault occurs we could
> properly handle it and set to 1 P2M PTE valid bit to 1...
> 
>>
>> An intermediate page table entry is something Xen controls entirely. Hence
>> it has no (guest induced) type.
> 
> ... And actually it is a reason why it is needed to set a type even for an
> intermediate page table entry.
> 
> I hope now it is a lit bit clearer what and why was done.

Sadly not. I still don't see what use the P2M type in of an intermediate page
table is going to be. It surely can't reliably describe all of the entries that
page table holds. Intermediate page tables and leaf pages are just too different
to share a concept like this, I think. That said, I'll be happy to be shown code
demonstrating the contrary.

>>>>> +static struct page_info *p2m_alloc_page(struct domain *d)
>>>>> +{
>>>>> +    struct page_info *pg;
>>>>> +
>>>>> +    /*
>>>>> +     * For hardware domain, there should be no limit in the number of pages that
>>>>> +     * can be allocated, so that the kernel may take advantage of the extended
>>>>> +     * regions. Hence, allocate p2m pages for hardware domains from heap.
>>>>> +     */
>>>>> +    if ( is_hardware_domain(d) )
>>>>> +    {
>>>>> +        pg = alloc_domheap_page(d, MEMF_no_owner);
>>>>> +        if ( pg == NULL )
>>>>> +            printk(XENLOG_G_ERR "Failed to allocate P2M pages for hwdom.\n");
>>>>> +    }
>>>> The comment looks to have been taken verbatim from Arm. Whatever "extended
>>>> regions" are, does the same concept even exist on RISC-V?
>>> Initially, I missed that it’s used only for Arm. Since it was mentioned in
>>> |doc/misc/xen-command-line.pandoc|, I assumed it applied to all architectures.
>>> But now I see that it’s Arm-specific:: ### ext_regions (Arm)
>>>
>>>> Also, special casing Dom0 like this has benefits, but also comes with a
>>>> pitfall: If the system's out of memory, allocations will fail. A pre-
>>>> populated pool would avoid that (until exhausted, of course). If special-
>>>> casing of Dom0 is needed, I wonder whether ...
>>>>
>>>>> +    else
>>>>> +    {
>>>>> +        spin_lock(&d->arch.paging.lock);
>>>>> +        pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
>>>>> +        spin_unlock(&d->arch.paging.lock);
>>>>> +    }
>>>> ... going this path but with a Dom0-only fallback to general allocation
>>>> wouldn't be the better route.
>>> IIUC, then it should be something like:
>>>     static struct page_info *p2m_alloc_page(struct domain *d)
>>>     {
>>>         struct page_info *pg;
>>>         
>>>         spin_lock(&d->arch.paging.lock);
>>>         pg = page_list_remove_head(&d->arch.paging.p2m_freelist);

Note this: Here you _remove_ from freelist, because you want to actually
use the page. Then clearly ...

>>>         spin_unlock(&d->arch.paging.lock);
>>>
>>>         if ( !pg && is_hardware_domain(d) )
>>>         {
>>>               /* Need to allocate more memory from domheap */
>>>               pg = alloc_domheap_page(d, MEMF_no_owner);
>>>               if ( pg == NULL )
>>>               {
>>>                   printk(XENLOG_ERR "Failed to allocate pages.\n");
>>>                   return pg;
>>>               }
>>>               ACCESS_ONCE(d->arch.paging.total_pages)++;
>>>               page_list_add_tail(pg, &d->arch.paging.freelist);
>>>         }
>>>      
>>>         return pg;
>>> }
>>>
>>> And basically use|d->arch.paging.freelist| for both dom0less and dom0 domains,
>>> with the only difference being that in the case of Dom0,|d->arch.paging.freelist |could be extended.
>>>
>>> Do I understand your idea correctly?
>> Broadly yes, but not in the details. For example, I don't think such a
>> page allocated from the general heap would want appending to freelist.
>> Commentary and alike also would want tidying.
> 
> Could you please explain why it wouldn't want appending to freelist?

... adding to freelist here is wrong: You want to use this separately
allocated page, too. Else once it is freed it'll be added to freelist
a 2nd time, leading to a corrupt list.

>> And of course going forward, for split hardware and control domains the
>> latter may want similar treatment.
> 
> Could you please clarify what is the difference between hardware and control
> domains?
> I thought that it is the same or is it for the case when we have
> dom0 (control domain) which runs domD (hardware domain) and guest domain?

That's the common case, yes, but conceptually the two can be separate.
And if you've followed recent discussions on the list you would also
have noticed that work is being done in that direction. (But this was
really a forward-looking comment; I didn't mean to make you cover that
case right away. Just wanted you to be aware.)

Jan

