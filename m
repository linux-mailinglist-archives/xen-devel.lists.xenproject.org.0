Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6690F944991
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 12:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769552.1180445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZTH6-0007hk-SA; Thu, 01 Aug 2024 10:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769552.1180445; Thu, 01 Aug 2024 10:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZTH6-0007fm-PP; Thu, 01 Aug 2024 10:43:12 +0000
Received: by outflank-mailman (input) for mailman id 769552;
 Thu, 01 Aug 2024 10:43:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZTH5-0007fg-5V
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 10:43:11 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d80b849d-4ff2-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 12:43:09 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5a2ffc34431so5248485a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 03:43:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b10e20dbb8sm7148137a12.49.2024.08.01.03.43.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 03:43:08 -0700 (PDT)
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
X-Inumbo-ID: d80b849d-4ff2-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722508989; x=1723113789; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BfIK8WZ+cDVccf0b2369vE80PaWqGzpN+WawDVlfbqI=;
        b=W2aIZVvBEGvCiSgU0pLcbzSsX849RnGJ6AzGCWPpJytiLTa+PR987xoKYEl/X8ZKzk
         r73APx+yf2Wi7fDYiH5JW/C3pI4NeG1xoVvdI8JY0FW+qCTqH5P/D7NeuQ5xPNQXk5VB
         VqlQAhRhBztrWMJU/N7HLAbxeMD753tutyBVEZru9EZYY0ESLKTRAWbBnCDOdYrMWGpK
         +3Ho4vNKqHDPhuQaC1whHJkEUlvXvcnhZjdwv7Ev2SaIAt4B9qoElTtOuBXrfRT4Rg4R
         vUu/LRQUZcYFZMpd6BKdq8RRt1hwxSesWzAbJly816mp/fo3MUTmL2SJQ+4bZg+27NXG
         3ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722508989; x=1723113789;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfIK8WZ+cDVccf0b2369vE80PaWqGzpN+WawDVlfbqI=;
        b=hiUIAHLB2a/T16vhwKWZUCYax2HbshTDdrjO8pyY5lIsWGTZV9Rre8uYV7pZr0EAqX
         ZU/jwDb4puKD24K/j32URoB4xOgFCmOZfNeScosSH1VGT+YthmRtT9tH7rJisPLbNc4p
         7tLHlMMhoD5DPeQD3UhKcQlJ2EJs0N/PoHTrT3OJIeRckUP9WM2kwSkjmLek6yJi74z8
         YdA4aMweaKCc0URDmPZ1NU1BGIPU/YZShxpMkJiQDzWsPAPlUT4U6V31utqzsmd2ead+
         GYiO0iQ+WmvwIrI3QH2JSSYIB1fIlV/g2NaYDNxCcMXFhni6KMSJpwKoCEmQPCWoQLys
         eBXg==
X-Forwarded-Encrypted: i=1; AJvYcCUyf4xxkUCsgob0mgNaDeN3qnSfRbrI15RHtYADz9rhD2KsPqsbDqWkvWI8o2mN66GCOl40aMXbOL0fMX8G4TZEEKIsvop2IZs5qVtMTfg=
X-Gm-Message-State: AOJu0YzRQuWbmctr/aG5PdZ7Dw/Y1TtkD0RX2hqpD0MIFK5ohwueR9nh
	o9JtD6RSVFP7mmMtwL9gYjue5O/c2WIOPIq7Rpp5C1PGKBlJFnno/58MEsUwAA==
X-Google-Smtp-Source: AGHT+IFHkyTgdZ9V+YUDegOLN/ZBwZPbFxSrjXMDBRCbl89aZUbkbiMu/GpwCKWEgj6jndpzuLZs1A==
X-Received: by 2002:aa7:c04a:0:b0:5a7:464a:abf with SMTP id 4fb4d7f45d1cf-5b7008ae7d3mr1756875a12.24.1722508989067;
        Thu, 01 Aug 2024 03:43:09 -0700 (PDT)
Message-ID: <afc24e73-78e8-4088-9292-33560e599cbe@suse.com>
Date: Thu, 1 Aug 2024 12:43:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] xen/riscv: page table handling
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <595c7b6736d6f718bafc7a677fb13881584ce4dc.1721834549.git.oleksii.kurochko@gmail.com>
 <c2496115-5c42-4cbb-8dde-686a97259609@suse.com>
 <04b40498494cbbd0d78744d87a2310e211f26b85.camel@gmail.com>
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
In-Reply-To: <04b40498494cbbd0d78744d87a2310e211f26b85.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.08.2024 11:33, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-07-30 at 16:22 +0200, Jan Beulich wrote:
>> On 24.07.2024 17:31, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/page.h
>>> +++ b/xen/arch/riscv/include/asm/page.h
>>> @@ -34,6 +34,7 @@
>>>  #define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE |
>>> PTE_WRITABLE)
>>>  #define PTE_TABLE                   (PTE_VALID)
>>>  
>>> +#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE)
>>>  #define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE |
>>> PTE_WRITABLE)
>>
>> No PAGE_HYPERVISOR_RX?
> I haven't used it at the moment, so I haven't provided it.

I'm inclined to suggest to put it there right away. You will need it
rather sooner than later.

>>> +    unsigned long pbmt:2;
>>> +    unsigned long n:1;
>>> +#elif RV_STAGE1_MODE == SATP_MODE_SV48
>>> +    unsigned long ppn0:9;
>>> +    unsigned long ppn1:9;
>>> +    unsigned long ppn2:9;
>>> +    unsigned long ppn3:17;
>>> +    unsigned long rsw2:7;
>>> +    unsigned long pbmt:2;
>>> +    unsigned long n:1;
>>> +#else
>>> +#error "Add proper bits for SATP_MODE"
>>> +#endif
>>> +} pt_t;
>>
>> I can't spot a use anywhere of e.g. ppn0. Would be nice to understand
>> in
>> what contexts these bitfields are going to be used. I notice you
>> specifically
>> don't use them in e.g. pte_is_table().
> I don't use them at the moment. I just introduced them for the possible
> future using. I can re-check what of them I am using in my private
> branches and come up here only with that one which are really used.

Just to clarify: If you need any of the bitfields, then of course you
want to introduce all of them, properly named. Yet with the PTE_*
constants I'm wondering whether really you need them in addition.

>>> +/* Sanity check of the entry */
>>> +static bool xen_pt_check_entry(pte_t entry, mfn_t mfn, unsigned
>>> int level,
>>> +                               unsigned int flags)
>>
>> The comment wants extending to indicate what the parameters mean wrt
>> what
>> is going to be checked. For example, ...
>>
>>> +{
>>> +    /* Sanity check when modifying an entry. */
>>> +    if ( mfn_eq(mfn, INVALID_MFN) )
>>
>> ... it's unclear to me why incoming INVALID_MFN would indicate
>> modification
>> of an entry, whereas further down _PAGE_PRESENT supposedly indicates
>> insertion.
> The statement inside if isn't correct. It should be:
>    if ( (flags & _PAGE_PRESENT) && mfn_eq(mfn, INVALID_MFN) )
> 
> INVALID_MFN indicates modification because of how xen_pt_update() is
> used:
>    int map_pages_to_xen(unsigned long virt,
>                         mfn_t mfn,
>                         unsigned long nr_mfns,
>                         unsigned int flags)
>    {
>        return xen_pt_update(virt, mfn, nr_mfns, flags);
>    }
>    
>    int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
>    {
>        return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_PRESENT);
>    }
>    
>    int destroy_xen_mappings(unsigned long s, unsigned long e)
>    {
>        ASSERT(IS_ALIGNED(s, PAGE_SIZE));
>        ASSERT(IS_ALIGNED(e, PAGE_SIZE));
>        ASSERT(s <= e);
>        return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, 0);
>    }
>    
>    int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int
>    nf)
>    {
>        ASSERT(IS_ALIGNED(s, PAGE_SIZE));
>        ASSERT(IS_ALIGNED(e, PAGE_SIZE));
>        ASSERT(s <= e);
>        return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, nf);
>    }
> 
> The idea is the following:
>   the MFN is not valid and we are not populating page table. This means
> we either modify entry or remove an entry.

Right. My request stands though: The comment ahead of the function wants
extending to state how it is to be used correctly.

>>> +    mfn = pte_get_mfn(*entry);
>>> +
>>> +    xen_unmap_table(*table);
>>> +    *table = xen_map_table(mfn);
>>> +
>>> +    return XEN_TABLE_NORMAL_PAGE;
>>> +}
>>
>> Normal page? Not normal table?
> It just mean that this points not to super_page so potenially the in
> the next one table will have an entry that would be normal page.

Or a normal page table, if you haven't reached leaf level yet. IOW maybe
better XEN_TABLE_NORMAL, covering both cases?

>>> +    unsigned int target = arch_target;
>>> +    pte_t *table;
>>> +    /*
>>> +     * The intermediate page tables are read-only when the MFN is
>>> not valid
>>> +     * This means we either modify permissions or remove an entry.
>>> +     */
>>> +    bool read_only = mfn_eq(mfn, INVALID_MFN);
>>
>> I'm afraid I can't make a connection between the incoming MFN being
>> INVALID_MFN and intermediate tables being intended to remain
>> unaltered.
> 
> It is becuase of xen_pt_update() is used:
>    int __init populate_pt_range(unsigned long virt, unsigned long
>    nr_mfns)
>    {
>        return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_PRESENT);
>    }
> So if pt is only populated then they are read_only and so they shouldn't
> be allocated what means ptes are only or being removed or modified.

Like above, such special assumptions would better be put in a comment.

>>> +int map_pages_to_xen(unsigned long virt,
>>> +                     mfn_t mfn,
>>> +                     unsigned long nr_mfns,
>>> +                     unsigned int flags)
>>> +{
>>> +    return xen_pt_update(virt, mfn, nr_mfns, flags);
>>> +}
>>
>> Why this wrapping of two functions taking identical arguments?
> map_pages_to_xen() sounds more clear regarding the way how it should be
> used.
> 
> xen_pt_update() will be also used inside other functions. Look at the
> example above.

They could as well use map_pages_to_xen() then? Or else the wrapper may
want to check (assert) that it is _not_ called with one of the special
case arguments that xen_pt_update() knows how to deal with?

Jan

