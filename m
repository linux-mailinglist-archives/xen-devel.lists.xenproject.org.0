Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C09F592EAE7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 16:37:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757564.1166581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRuvC-0001Gu-Sn; Thu, 11 Jul 2024 14:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757564.1166581; Thu, 11 Jul 2024 14:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRuvC-0001F1-QA; Thu, 11 Jul 2024 14:37:22 +0000
Received: by outflank-mailman (input) for mailman id 757564;
 Thu, 11 Jul 2024 14:37:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRuvB-0001Ev-36
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 14:37:21 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 133b0d53-3f93-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 16:37:18 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2eabd22d3f4so10609801fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 07:37:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ca4fc29c81sm4702046a91.29.2024.07.11.07.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 07:37:17 -0700 (PDT)
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
X-Inumbo-ID: 133b0d53-3f93-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720708638; x=1721313438; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Jrg7x/e1yjqXBKrhFhAnFlIUkCngpIsExB73Yo76Cw=;
        b=fwvNbQuhbldkEBfqkNAzZnDT+GZLvD7uKT16I/VOClAF+najsR3zlNbWkTb043Q3ED
         vGZ0Ut8S39GETnJXfdVdELMd0unRhW6PJgBs/KNjE4nquIW3uh99CLN7ZkJ6AKClY6GZ
         0yBWLJJGYjvPfOHkFMjQD8lAlynjVb7EEHX/vjlJjfHJJ4mnuQbbT++KHcP5VE8V4UYQ
         cvftOVSriOo3tmA2hu19EwDE9i+eutCgYHGAYf3RzPhoKF1BmQn4F6ev0qgJ/CbBsBEq
         smtntbvpyKByclOWfeIKTSin6sRM7o7BmBqtGw/TG5Coz/djHDrbdXuVCsDEsYMfHMlc
         Rh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720708638; x=1721313438;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Jrg7x/e1yjqXBKrhFhAnFlIUkCngpIsExB73Yo76Cw=;
        b=q1YCjm9omysD24YMATD5h12aFH6F+9mnmQsD58dn8ym+LEjEx7wPlLBD1rYwgzBHgx
         5q4zzjsYtxkfMKwpPZMUh5OzRqUOg+3yQXPytFaNl+kYUMZlUL6AS+gZpN5mYr87ePF3
         6YkDgOx9SAqlC/p7aWbij5v2L4t+H3ZGUBrAkCkNjAXCQOOuAbFtxrwX0feZIeToEXnW
         hjv+ZzND9DC0Y/pwrvDccnZhIazDTo9NoT8bjwMipVPLr2uCFcXPdJiET8xtpVHW3H6B
         ODTHw3nWPoqgts8rlZMVRAKXoGTLp7SQIR/DaRbEEOPlTaD9HjbjkS9A0Nxt48/tYApJ
         U7Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWEECD48Vhb0n5i4lmf25Gd6LlQ0o9fEPaB5gMUpoN947RZjDzAJPqwbgOe+mqmH3kDZRUiF6GjUDNcper/R1Y+1YmETVnNMKFTA+jv/qE=
X-Gm-Message-State: AOJu0Yyl/i8wNbcBft9XEkj9BKgiTVsyru6OroMyuCMYSJy/EZxStEpN
	y6gNWnr9Od8HlaIpp/ipxTFmMCGV75eyMpXQ/CSMJKSOiUSHZFKaBQkLuvEYLw==
X-Google-Smtp-Source: AGHT+IF51aabHrJGXpXatMCo9pKIqnftiTIvhvAaxtRXfI4F/bMPCdFRnMDZDm6BUcmBzw3bSXzyAg==
X-Received: by 2002:a2e:9b5a:0:b0:2ee:7d3c:670 with SMTP id 38308e7fff4ca-2eeb30e39c5mr60707941fa.19.1720708638324;
        Thu, 11 Jul 2024 07:37:18 -0700 (PDT)
Message-ID: <2bb47153-2c9f-4c7e-a1bb-e32a628e990d@suse.com>
Date: Thu, 11 Jul 2024 16:37:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] xen/riscv: map FDT
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
 <7e492df051c949744755a221c0448c740d2c681b.1720002425.git.oleksii.kurochko@gmail.com>
 <3afd94c0-25f4-4ed8-83d2-6f261b8a64b3@suse.com>
 <021d29540f8e9abec118e9ca9dcd9675310eda84.camel@gmail.com>
 <9592e857-bf1c-4e26-acd7-dfb5bb12103e@suse.com>
 <fda966116ce17b9be0b1a467bd31436a6b5ad225.camel@gmail.com>
 <e58a9128-efdd-4bff-9562-08d5605d0a13@suse.com>
 <040e6b1d9b8bbe2b316e0e5b891c2564df28335d.camel@gmail.com>
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
In-Reply-To: <040e6b1d9b8bbe2b316e0e5b891c2564df28335d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.07.2024 13:28, Oleksii wrote:
> On Thu, 2024-07-11 at 12:50 +0200, Jan Beulich wrote:
>> On 11.07.2024 12:26, Oleksii wrote:
>>> On Thu, 2024-07-11 at 11:54 +0200, Jan Beulich wrote:
>>>> On 11.07.2024 11:40, Oleksii wrote:
>>>>> On Wed, 2024-07-10 at 14:38 +0200, Jan Beulich wrote:
>>>>>> On 03.07.2024 12:42, Oleksii Kurochko wrote:
>>>>>>> Except mapping of FDT, it is also printing command line
>>>>>>> passed
>>>>>>> by
>>>>>>> a DTB and initialize bootinfo from a DTB.
>>>>>>
>>>>>> I'm glad the description isn't empty here. However, ...
>>>>>>
>>>>>>> --- a/xen/arch/riscv/riscv64/head.S
>>>>>>> +++ b/xen/arch/riscv/riscv64/head.S
>>>>>>> @@ -41,6 +41,9 @@ FUNC(start)
>>>>>>>  
>>>>>>>          jal     setup_initial_pagetables
>>>>>>>  
>>>>>>> +        mv      a0, s1
>>>>>>> +        jal     fdt_map
>>>>>>> +
>>>>>>>          /* Calculate proper VA after jump from 1:1 mapping
>>>>>>> */
>>>>>>>          la      a0, .L_primary_switched
>>>>>>>          sub     a0, a0, s2
>>>>>>
>>>>>> ... it could do with clarifying why this needs calling from
>>>>>> assembly
>>>>>> code. Mapping the FDT clearly looks like something that wants
>>>>>> doing
>>>>>> from start_xen(), i.e. from C code.
>>>>> fdt_map() expected to work while MMU is off as it is using
>>>>> setup_initial_mapping() which is working with physical address.
>>>>
>>>> Hmm, interesting. When the MMU is off, what does "map" mean? Yet
>>>> then
>>>> it feels I'm misunderstanding what you're meaning to tell me ...
>>> Let's look at examples of the code:
>>> 1. The first thing issue will be here:
>>>    void* __init early_fdt_map(paddr_t fdt_paddr)
>>>    {
>>>        unsigned long dt_phys_base = fdt_paddr;
>>>        unsigned long dt_virt_base;
>>>        unsigned long dt_virt_size;
>>>    
>>>        BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
>>>        if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN || fdt_paddr %
>>> SZ_2M 
>>>    ||
>>>              fdt_totalsize(fdt_paddr) > BOOT_FDT_VIRT_SIZE )
>>> MMU doesn't now about virtual address of fdt_paddr as fdt_paddr
>>> wasn't
>>> mapped.
>>>
>>> 2. In setup_initial_mapping() we have HANDLE_PGTBL() where pgtbl is
>>> a
>>> pointer to physical address ( which also  should be mapped in MMU
>>> if we
>>> want to access it after MMU is enabled ):
>>>    #define
>>> HANDLE_PGTBL(curr_lvl_num)                                    
>>>    \
>>>        index = pt_index(curr_lvl_num,
>>> page_addr);                        
>>>    \
>>>        if ( pte_is_valid(pgtbl[index])
>>> )                                 
>>>    \
>>>       
>>> {                                                                 
>>>    \
>>>            /* Find L{ 0-3 } table
>>> */                                     
>>>    \
>>>            pgtbl = (pte_t
>>> *)pte_to_paddr(pgtbl[index]);                  
>>>    \
>>>       
>>> }                                                                 
>>>    \
>>>       
>>> else                                                              
>>>    \
>>>       
>>> {                                                                 
>>>    \
>>>            /* Allocate new L{0-3} page table
>>> */                          
>>>    \
>>>            if ( mmu_desc->pgtbl_count == PGTBL_INITIAL_COUNT
>>> )           
>>>    \
>>>           
>>> {                                                             
>>>    \
>>>                early_printk("(XEN) No initial table
>>> available\n");       
>>>    \
>>>                /* panic(), BUG() or ASSERT() aren't ready now.
>>> */        
>>>    \
>>>               
>>> die();                                                    
>>>    \
>>>           
>>> }                                                             
>>>    \
>>>            mmu_desc-
>>>> pgtbl_count++;                                      
>>>    \
>>>            pgtbl[index] = paddr_to_pte((unsigned long)mmu_desc-
>>>    >next_pgtbl,    \
>>>                                       
>>> PTE_VALID);                       
>>>    \
>>>            pgtbl = mmu_desc-
>>>> next_pgtbl;                                 
>>>    \
>>>            mmu_desc->next_pgtbl +=
>>> PAGETABLE_ENTRIES;                    
>>>    \
>>>        }
>>>    
>>> So we can't use setup_initial_mapping() when MMU is enabled as
>>> there is
>>> a part of the code which uses physical address which are not
>>> mapped.
>>>
>>> We have only mapping for for liner_start <-> load_start and the
>>> small
>>> piece of code in text section ( _ident_start ):
>>>     setup_initial_mapping(&mmu_desc,
>>>                           linker_start,
>>>                           linker_end,
>>>                           load_start);
>>>
>>>     if ( linker_start == load_start )
>>>         return;
>>>
>>>     ident_start = (unsigned long)turn_on_mmu
>>> &XEN_PT_LEVEL_MAP_MASK(0);
>>>     ident_end = ident_start + PAGE_SIZE;
>>>
>>>     setup_initial_mapping(&mmu_desc,
>>>                           ident_start,
>>>                           ident_end,
>>>                           ident_start);
>>>
>>> We can use setup_initial_mapping() when MMU is enabled only in case
>>> when linker_start is equal to load_start.
>>>
>>> As an option we can consider for as a candidate for identaty
>>> mapping
>>> also section .bss.page_aligned where root and nonroot page tables
>>> are
>>> located.
>>>
>>> Does it make sense now?
>>
>> I think so, yet at the same time it only changes the question: Why is
>> it
>> that you absolutely need to use setup_initial_mapping()?
> There is no strict requirement to use setup_initial_mapping(). That
> function is available to me at the moment, and I haven't found a better
> option other than reusing what I currently have.
> 
> If not to use setup_initial_mapping() then it is needed to introduce
> xen_{un}map_table(), create_xen_table(), xen_pt_next_level(),
> xen_pt_update{_entry}(), map_pages_to_xen(). What I did a little bit
> later here:
> https://gitlab.com/xen-project/people/olkur/xen/-/commit/a4619d0902e0a012ac2f709d31621a8d499bca97
> Am I confusing something?
> 
> Could you please recommend me how to better?

I think you've sorted this for yourself already, judging from subsequent
communication on this thread, where you indicate you'll introduce
map_pages_to_xen() first. That's the way I'd have expected you to go.

Jan


