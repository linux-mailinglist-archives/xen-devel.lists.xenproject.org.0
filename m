Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4156AEEEC0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 08:29:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029387.1403130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWUUl-0007kK-7M; Tue, 01 Jul 2025 06:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029387.1403130; Tue, 01 Jul 2025 06:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWUUl-0007iW-4J; Tue, 01 Jul 2025 06:29:31 +0000
Received: by outflank-mailman (input) for mailman id 1029387;
 Tue, 01 Jul 2025 06:29:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWUUj-0007iQ-ML
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 06:29:29 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd7b7412-5644-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 08:29:28 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so2423571f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 23:29:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e31c28ebsm9670126a12.37.2025.06.30.23.29.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 23:29:27 -0700 (PDT)
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
X-Inumbo-ID: bd7b7412-5644-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751351368; x=1751956168; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UcSqKHvLvQCvH5w0lahIBcKfhjyFss9C+Eo4pY3fysM=;
        b=JOpG90ddJH+w8tL4z+n4lKv1UCy+9nfUblJcIhedWhK/HWeQUIBznJ5YGcy0gkH8jA
         KkCyC+TqoNzJsr6mCJ4SYnoSJU82VRV3a0GxH7JtILC2IhQxo5s33KDcDksPJ5Qvjpuw
         s4Ms9tf6Ksdr/YzrSPfyONVGtwg8vkqzfOgIgj1BmCoz+bgrIfZTaN1wsjqyMXGGemcO
         zcaNiDzANgNk52+TF7DjVrdqR4ZUjfCH0OzdlacvFQ3MRC9CGS7ngy0q9JSRkINh3PJZ
         Ro1+9RWtBen3QWpBQzr0f0p6uY/0sgt7/QkmKJ4ijbYrvIq4Vz/OAhrLwSlvRHXyipHZ
         fSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751351368; x=1751956168;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcSqKHvLvQCvH5w0lahIBcKfhjyFss9C+Eo4pY3fysM=;
        b=AX5OvZH7ooIzZwg3Z9fcVYzAt6TPN7xQAtyufDKiNPH2yWF0XGhzvAjE2utWLC7vVp
         1sRXz+ey12yNILXopzWbPmuUY9cO86R7DLxCiDXkV5q7Mk5wRGGqZEkESAWbVBT709km
         Jzp0Gl0d0FTU+Q15rZBaSV2YWKkYVkoWt9Y8NtH2g6ErvqeQPo0fNNx6CZkVqa6M25ak
         iQo+maeU5bgRxQL6wTd9cYVHvwhV5z3+ZeaHVi2XYqi923P38EAGjCLAJvqz8LC3ciQk
         RczZ5QInpPalIZLSqRrLdKC6mKFvkZvu/ZpSl0rQQaHddjREblPrDXzT7MkHoZZZAZyW
         VAJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaoTqnJkd8rRC6fCFp1x7WWCCkRZRNNnMVAeZvIeJ3DRD34ZRSr+UJo8iLZAObXeawihslwNFHBII=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAOVJBbLGgnERH218fPUYBCaVton7CVTtunwLluoNd5qjbh2Gl
	GXaqJqOJS5yZBxgmYnmytL2cGeEC80x3fFdsgUnO+AhWBj2zrKnS98/Jhz5ixtsoWg==
X-Gm-Gg: ASbGncuDm8FfLwJTe7KuggE8IZ501EiVXpkTXZzMd/P5sNWKruKO94aPvt7cNqnq9/B
	ezIX+nFxHQAfKdff6Q6iHRJpzJODpc/pCO5vNiBfez+YvPnYKW0S5Z4D4mkd6Rhtj7DEd1FQVeR
	TnqAfpoFC25bFDrVAz5H7r7YPrqzgCNs5tkdygPf4XxaTtFw9Fku4hExA9t507Neu8NfTiYWagd
	QOzMk1X5MQ3kY0Zj+1DU2VX17oMl9g5nHXKsOZWbtzjgH+JEZq7ZPlpMOgMiJoZO3WdhyDnjBJE
	YyBvZiZhSxhO21qoE3hCppg7JNu0GHg7CvomXNCAaL1cdvxA6S7Uv+QrFyf7ZgbzT+P/RinP//Z
	3IwOS9JGjD2finZQ/mR1VSBNg5n7BhPb5zgohStd7pI+gqnrStUA5YNGCkA==
X-Google-Smtp-Source: AGHT+IFUXT6BeJ7c3n3K5d++DoJUdzjHd7RpbAjNmzfZo+MSDnGjyI5Rz/EyuFz4mpYVtJrYkKJCuw==
X-Received: by 2002:a05:6000:491d:b0:3a4:fbaf:3f99 with SMTP id ffacd0b85a97d-3a8f4a160e8mr14881492f8f.13.1751351367930;
        Mon, 30 Jun 2025 23:29:27 -0700 (PDT)
Message-ID: <49de841e-d3dd-447f-98f2-77de8b2acf94@suse.com>
Date: Tue, 1 Jul 2025 08:29:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/17] xen/riscv: add root page table allocation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <76675ddb7517e4cceb63472c94944046b255da01.1749555949.git.oleksii.kurochko@gmail.com>
 <9c89ead3-7577-46f2-acc2-6dd8d793ab89@suse.com>
 <c9924195-17e5-4f47-869a-c7930a65538c@gmail.com>
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
In-Reply-To: <c9924195-17e5-4f47-869a-c7930a65538c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.06.2025 18:18, Oleksii Kurochko wrote:
> On 6/30/25 5:22 PM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/p2m.h
>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>> @@ -26,6 +26,12 @@ struct p2m_domain {
>>>       /* Pages used to construct the p2m */
>>>       struct page_list_head pages;
>>>   
>>> +    /* The root of the p2m tree. May be concatenated */
>>> +    struct page_info *root;
>>> +
>>> +    /* Address Translation Table for the p2m */
>>> +    paddr_t hgatp;
>> Does this really need holding in a struct field? Can't is be re-created at
>> any time from "root" above?
> 
> Yes, with the current one implementation, I agree it would be enough only
> root. But as you noticed below...
> 
>> And such re-creation is apparently infrequent,
>> if happening at all after initial allocation. (But of course I don't know
>> what future patches of yours will bring.) This is even more so if ...
>>
>>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>>> @@ -133,11 +133,13 @@
>>>   #define HGATP_MODE_SV48X4		_UL(9)
>>>   
>>>   #define HGATP32_MODE_SHIFT		31
>>> +#define HGATP32_MODE_MASK		_UL(0x80000000)
>>>   #define HGATP32_VMID_SHIFT		22
>>>   #define HGATP32_VMID_MASK		_UL(0x1FC00000)
>>>   #define HGATP32_PPN			_UL(0x003FFFFF)
>>>   
>>>   #define HGATP64_MODE_SHIFT		60
>>> +#define HGATP64_MODE_MASK		_ULL(0xF000000000000000)
>>>   #define HGATP64_VMID_SHIFT		44
>>>   #define HGATP64_VMID_MASK		_ULL(0x03FFF00000000000)
>> ... VMID management is going to change as previously discussed, at which
>> point the value to put in hgatp will need (partly) re-calculating at certain
>> points anyway.
> 
> ... after VMID management will changed to per-CPU base then it will be needed
> to update re-calculate hgatp each time vCPU on pCPU is changed.
> In this case I prefer to have partially calculated 'hgatp'.

But why, when you need to do some recalculation anyway?

>>> --- a/xen/arch/riscv/p2m.c
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -41,6 +41,91 @@ void p2m_write_unlock(struct p2m_domain *p2m)
>>>       write_unlock(&p2m->lock);
>>>   }
>>>   
>>> +static void clear_and_clean_page(struct page_info *page)
>>> +{
>>> +    clean_dcache_va_range(page, PAGE_SIZE);
>>> +    clear_domain_page(page_to_mfn(page));
>>> +}
>> A function of this name can, imo, only clear and then clean. Question is why
>> it's the other way around, and what the underlying requirement is for the
>> cleaning part to be there in the first place. Maybe that's obvious for a
>> RISC-V person, but it's entirely non-obvious to me (Arm being different in
>> this regard because of running with caches disabled at certain points in
>> time).
> 
> You're right, the current name|clear_and_clean_page()| implies that clearing
> should come before cleaning, which contradicts the current implementation.
> The intent here is to ensure that the page contents are consistent in RAM
> (not just in cache) before use by other entities (guests or devices).
> 
> The clean must follow the clear — so yes, the order needs to be reversed.

What you don't address though - why's the cleaning needed in the first place?

>>> +static struct page_info *p2m_allocate_root(struct domain *d)
>>> +{
>>> +    struct page_info *page;
>>> +    unsigned int order = get_order_from_bytes(KB(16));
>> While better than a hard-coded order of 2, this still is lacking. Is there
>> a reason there can't be a suitable manifest constant in the header?
> 
> No any specific reason, I just decided not to introduce new definition as
> it is going to be used only inside this function.
> 
> I think it will make sense to have in p2m.c:
>   #define P2M_ROOT_PT_SIZE KB(16)
> If it isn't the best one option, then what about to move this defintion
> to config.h or asm/p2m.h.

It's defined by the hardware, so neither of the two headers looks to be a
good fit. Nor is the P2M_ prefix really in line with this being hardware-
defined. page.h has various paging-related hw definitions, and
riscv_encoding.h may also be a suitable place. There may be other candidates
that I'm presently overlooking.

>>> +    unsigned int nr_pages = _AC(1,U) << order;
>> Nit (style): Missing blank after comma.
> 
> I've changed that to BIT(order, U)
> 
>>
>>> +    /* Return back nr_pages necessary for p2m root table. */
>>> +
>>> +    if ( ACCESS_ONCE(d->arch.paging.p2m_total_pages) < nr_pages )
>>> +        panic("Specify more xen,domain-p2m-mem-mb\n");
>> You shouldn't panic() in anything involved in domain creation. You want to
>> return NULL in this case.
> 
> It makes sense in this case just to return NULL.
> 
>>
>> Further, to me the use of "more" looks misleading here. Do you perhaps mean
>> "larger" or "bigger"?
>>
>> This also looks to be happening without any lock held. If that's intentional,
>> I think the "why" wants clarifying in a code comment.
> 
> Agree, returning back pages necessary for p2m root table should be done under
> spin_lock(&d->arch.paging.lock).

Which should be acquired at the paging_*() layer then, not at the p2m_*() layer.
(As long as you mean to have that separation, that is. See the earlier discussion
on that matter.)

>>> +    for ( unsigned int i = 0; i < nr_pages; i++ )
>>> +    {
>>> +        /* Return memory to domheap. */
>>> +        page = page_list_remove_head(&d->arch.paging.p2m_freelist);
>>> +        if( page )
>>> +        {
>>> +            ACCESS_ONCE(d->arch.paging.p2m_total_pages)--;
>>> +            free_domheap_page(page);
>>> +        }
>>> +        else
>>> +        {
>>> +            printk(XENLOG_ERR
>>> +                   "Failed to free P2M pages, P2M freelist is empty.\n");
>>> +            return NULL;
>>> +        }
>>> +    }
>> The reason for doing this may also want to be put in a comment.
> 
> I thought it would be enough the comment above: /* Return back nr_pages necessary for p2m root table. */

That describes what the code does, but not why.

>>> +{
>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>> +
>>> +    p2m->root = p2m_allocate_root(d);
>>> +    if ( !p2m->root )
>>> +        return -ENOMEM;
>>> +
>>> +    p2m->hgatp = hgatp_from_page(p2m);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
>>>   
>>>   /*
>>> @@ -228,5 +313,14 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>>           }
>>>       }
>>>   
>>> +    /*
>>> +    * First, wait for the p2m pool to be initialized. Then allocate the root
>> Why "wait"? There's waiting here.
> 
> I am not really get your question.
> 
> "wait" here is about the initialization of the pool which happens above this comment.

But there's no "waiting" involved. What you talk about is one thing needing to
happen after the other.

Jan

