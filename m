Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 912FAB074ED
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 13:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045097.1415174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc0YI-0001QR-Kg; Wed, 16 Jul 2025 11:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045097.1415174; Wed, 16 Jul 2025 11:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc0YI-0001Nq-Hc; Wed, 16 Jul 2025 11:43:58 +0000
Received: by outflank-mailman (input) for mailman id 1045097;
 Wed, 16 Jul 2025 11:43:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc0YH-0001Nk-LB
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 11:43:57 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27b1d350-623a-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 13:43:56 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso4851727f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 04:43:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f15c28bf4sm1109196a12.26.2025.07.16.04.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 04:43:54 -0700 (PDT)
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
X-Inumbo-ID: 27b1d350-623a-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752666236; x=1753271036; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qf/0M6Ya0lKNqeluRlo+wccntJ9C9CX/rEM46xtkd38=;
        b=ANCpUsnVbMgZ+dhwvqz7eoz/xILiBjJ/CyuXkeenZp2EjSNx99fsIUmL1AH+zJdHq4
         HyT9gR200ouQbPKu3KVVJcElruCc1iyD7AxS6IimGrOREuxoassG/c3OzQ610X0Iqp50
         6tNKrd6FFU32xA98yoK5VO9bBt3vfiF/WpqBsS+SpP33r7znKcRDZ2rwrcAWbxGOHFWR
         0ZumBd+19GTJdHf5/QcjdS83zB71MzRuzRYwldppVN84jSneXBhWBC1AedDCujaVJxGj
         DVkGbYht/HJHLT6Jv1XfkNi0+XOujIyx+2qaTG4D+BpJqeMEc0y2MKUhURNCUG/9eP7U
         TbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752666236; x=1753271036;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qf/0M6Ya0lKNqeluRlo+wccntJ9C9CX/rEM46xtkd38=;
        b=HHjRwAK/7rheUUML7PD2ARKE4sOUqCUfMUATuxgMagCix9rvuILuB1Ty0DDoIaRxC1
         cJ2GPYcakXbbp0GMOrGIhAZNL6blUnsTKH96t6xUOnbUUNfJH6PnG/qElw5mcor4baet
         +4qS8Mf6sgMUcOBYVsUr9s70rIAVOM5vZuaYkXX4oqRmuFQntZQEcUVBkBzzsYwc1Usi
         RunqccWg78OlLR0d9g7P8or6942x+lG4fwlDr/jo1bPHJxSoebi99gediF/89A6vUmLK
         MrQNZ+1a8XsyBR3jMnIKwzLUA/CEo/qk5F8kfX1J5jnW7t5EVhoisKLuMM2k2O4Yjid9
         H8dA==
X-Forwarded-Encrypted: i=1; AJvYcCXnaCzwgp69ljOZPAvnIYmLBZVNuhz2vAsmLALNyvyAR9mgqaZFhqjATLhWaQ7w/oikC3NuQ4tfdtg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxG7Hrn8IucwOKVRpP1iAHhqX3KKLs8Y+hH/uNdGSJYSATP42XU
	1CSYaWMirD+tuHndSVDydDF0SW7w+AWj4h7rDM61x/wSx+RSRI5e/OH139uThHnHdQ==
X-Gm-Gg: ASbGncuRLx0mzBxc+SnW/ZaWJSxqO0Z0rU9K21iq+O9LCq2sNR76kPfcZiboquJ3fmr
	CE5PloFvCF6+moGrEiou/1PASMcJbpmgP11U28hH1vjAMx8bhSgSG4sntG3F/w8lgVRh3eQRELl
	okEwx5semf+amEnG3X3IghrdXC95BxxKGjIerrYPeyeeGNqymjMW8dqP3j+aSnzM22imMZjhmFs
	vEQuE2tRh7gUu6KWUjYEA5kdN0Qzq4KAJP+3HiQhaobfAFwOrQQKuQvjFmHp6b8B3WIalwrn98d
	df6B2QWdcXY30UOcUha6mQeSykl7q2BlPg/VAG9vXNuRqIcfpBaUb6XB99J0xo2L43uLVEiVdJt
	ZdfCPc9KMWbHFh2lss2dz/l836GKXKMzRYcrnMwxGpYOFikuLV47B4gVwmbb/whd2+dLZKV/ZE4
	zAJqBAy/c=
X-Google-Smtp-Source: AGHT+IE1wzBmO+403aN4G9w63PE8QGh/J/0F82DW15ex+E98W/9WfKohbzOnJchC+HOhqQAzMiEZ9w==
X-Received: by 2002:a5d:584e:0:b0:3a4:fbaf:3f99 with SMTP id ffacd0b85a97d-3b60e4c8e2emr1604735f8f.13.1752666235527;
        Wed, 16 Jul 2025 04:43:55 -0700 (PDT)
Message-ID: <aabb6eeb-fe2a-4b95-b844-560d2c70bcd5@suse.com>
Date: Wed, 16 Jul 2025 13:43:44 +0200
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
In-Reply-To: <b0013513-2646-4de4-a172-0d2ea571a3e8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.07.2025 13:32, Oleksii Kurochko wrote:
> On 7/2/25 10:35 AM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/p2m.c
>>> +++ b/xen/arch/riscv/p2m.c
>>> @@ -387,6 +387,17 @@ static inline bool p2me_is_valid(struct p2m_domain *p2m, pte_t pte)
>>>       return p2m_type_radix_get(p2m, pte) != p2m_invalid;
>>>   }
>>>   
>>> +/*
>>> + * pte_is_* helpers are checking the valid bit set in the
>>> + * PTE but we have to check p2m_type instead (look at the comment above
>>> + * p2me_is_valid())
>>> + * Provide our own overlay to check the valid bit.
>>> + */
>>> +static inline bool p2me_is_mapping(struct p2m_domain *p2m, pte_t pte)
>>> +{
>>> +    return p2me_is_valid(p2m, pte) && (pte.pte & PTE_ACCESS_MASK);
>>> +}
>> Same question as on the earlier patch - does P2M type apply to intermediate
>> page tables at all? (Conceptually it shouldn't.)
> 
> It doesn't matter whether it is an intermediate page table or a leaf PTE pointing
> to a page — PTE should be valid. Considering that in the current implementation
> it’s possible for PTE.v = 0 but P2M.v = 1, it is better to check P2M.v instead
> of PTE.v.

I'm confused by this reply. If you want to name 2nd level page table entries
P2M - fine (but unhelpful). But then for any memory access there's only one
of the two involved: A PTE (Xen accesses) or a P2M (guest accesses). Hence
how can there be "PTE.v = 0 but P2M.v = 1"?

An intermediate page table entry is something Xen controls entirely. Hence
it has no (guest induced) type.

>>> @@ -492,6 +503,70 @@ static pte_t p2m_entry_from_mfn(struct p2m_domain *p2m, mfn_t mfn, p2m_type_t t,
>>>       return e;
>>>   }
>>>   
>>> +/* Generate table entry with correct attributes. */
>>> +static pte_t page_to_p2m_table(struct p2m_domain *p2m, struct page_info *page)
>>> +{
>>> +    /*
>>> +     * Since this function generates a table entry, according to "Encoding
>>> +     * of PTE R/W/X fields," the entry's r, w, and x fields must be set to 0
>>> +     * to point to the next level of the page table.
>>> +     * Therefore, to ensure that an entry is a page table entry,
>>> +     * `p2m_access_n2rwx` is passed to `mfn_to_p2m_entry()` as the access value,
>>> +     * which overrides whatever was passed as `p2m_type_t` and guarantees that
>>> +     * the entry is a page table entry by setting r = w = x = 0.
>>> +     */
>>> +    return p2m_entry_from_mfn(p2m, page_to_mfn(page), p2m_ram_rw, p2m_access_n2rwx);
>> Similarly P2M access shouldn't apply to intermediate page tables. (Moot
>> with that, but (ab)using p2m_access_n2rwx would also look wrong: You did
>> read what it means, didn't you?)
> 
> |p2m_access_n2rwx| was chosen not really because of the description mentioned near
> its declaration, but because it sets r=w=x=0, which RISC-V expects for a PTE that
> points to the next-level page table.
> 
> Generally, I agree that P2M access shouldn't be applied to intermediate page tables.
> 
> What I can suggest in this case is to use|p2m_access_rwx| instead of|p2m_access_n2rwx|,

No. p2m_access_* shouldn't come into play here at all. Period. Just like P2M types
shouldn't. As per above - intermediate page tables are Xen internal constructs.

> which will ensure that the P2M access type isn't applied when|p2m_entry_from_mfn() |is called, and then, after calling|p2m_entry_from_mfn()|, simply set|PTE.r,w,x=0|.
> So this function will look like:
>      /* Generate table entry with correct attributes. */
>      static pte_t page_to_p2m_table(struct p2m_domain *p2m, struct page_info *page)
>      {
>          /*
>          * p2m_ram_rw is chosen for a table entry as p2m table should be valid
>          * from both P2M and hardware point of view.
>          *
>          * p2m_access_rwx is chosen to restrict access permissions, what mean
>          * do not apply access permission for a table entry
>          */
>          pte_t pte = p2m_pte_from_mfn(p2m, page_to_mfn(page), _gfn(0), p2m_ram_rw,
>                                      p2m_access_rwx);
> 
>          /*
>          * Since this function generates a table entry, according to "Encoding
>          * of PTE R/W/X fields," the entry's r, w, and x fields must be set to 0
>          * to point to the next level of the page table.
>          */
>          pte.pte &= ~PTE_ACCESS_MASK;
> 
>          return pte;
>      }
> 
> Does this make sense? Or would it be better to keep the current version of
> |page_to_p2m_table()| and just improve the comment explaining why|p2m_access_n2rwx |is used for a table entry?

No to both, as per above.

>>> +static struct page_info *p2m_alloc_page(struct domain *d)
>>> +{
>>> +    struct page_info *pg;
>>> +
>>> +    /*
>>> +     * For hardware domain, there should be no limit in the number of pages that
>>> +     * can be allocated, so that the kernel may take advantage of the extended
>>> +     * regions. Hence, allocate p2m pages for hardware domains from heap.
>>> +     */
>>> +    if ( is_hardware_domain(d) )
>>> +    {
>>> +        pg = alloc_domheap_page(d, MEMF_no_owner);
>>> +        if ( pg == NULL )
>>> +            printk(XENLOG_G_ERR "Failed to allocate P2M pages for hwdom.\n");
>>> +    }
>> The comment looks to have been taken verbatim from Arm. Whatever "extended
>> regions" are, does the same concept even exist on RISC-V?
> 
> Initially, I missed that it’s used only for Arm. Since it was mentioned in
> |doc/misc/xen-command-line.pandoc|, I assumed it applied to all architectures.
> But now I see that it’s Arm-specific:: ### ext_regions (Arm)
> 
>>
>> Also, special casing Dom0 like this has benefits, but also comes with a
>> pitfall: If the system's out of memory, allocations will fail. A pre-
>> populated pool would avoid that (until exhausted, of course). If special-
>> casing of Dom0 is needed, I wonder whether ...
>>
>>> +    else
>>> +    {
>>> +        spin_lock(&d->arch.paging.lock);
>>> +        pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
>>> +        spin_unlock(&d->arch.paging.lock);
>>> +    }
>> ... going this path but with a Dom0-only fallback to general allocation
>> wouldn't be the better route.
> 
> IIUC, then it should be something like:
>    static struct page_info *p2m_alloc_page(struct domain *d)
>    {
>        struct page_info *pg;
>        
>        spin_lock(&d->arch.paging.lock);
>        pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
>        spin_unlock(&d->arch.paging.lock);
> 
>        if ( !pg && is_hardware_domain(d) )
>        {
>              /* Need to allocate more memory from domheap */
>              pg = alloc_domheap_page(d, MEMF_no_owner);
>              if ( pg == NULL )
>              {
>                  printk(XENLOG_ERR "Failed to allocate pages.\n");
>                  return pg;
>              }
>              ACCESS_ONCE(d->arch.paging.total_pages)++;
>              page_list_add_tail(pg, &d->arch.paging.freelist);
>        }
>     
>        return pg;
> }
> 
> And basically use|d->arch.paging.freelist| for both dom0less and dom0 domains,
> with the only difference being that in the case of Dom0,|d->arch.paging.freelist |could be extended.
> 
> Do I understand your idea correctly?

Broadly yes, but not in the details. For example, I don't think such a
page allocated from the general heap would want appending to freelist.
Commentary and alike also would want tidying.

And of course going forward, for split hardware and control domains the
latter may want similar treatment.

Jan

