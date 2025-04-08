Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1238FA80D3C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 16:05:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942274.1341491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29ZO-0003YD-Ai; Tue, 08 Apr 2025 14:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942274.1341491; Tue, 08 Apr 2025 14:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u29ZO-0003WF-71; Tue, 08 Apr 2025 14:04:54 +0000
Received: by outflank-mailman (input) for mailman id 942274;
 Tue, 08 Apr 2025 14:04:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u29ZM-0003W9-LR
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 14:04:52 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fde63b0-1482-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 16:04:50 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so53556665e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 07:04:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec342a3dfsm164721805e9.4.2025.04.08.07.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 07:04:49 -0700 (PDT)
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
X-Inumbo-ID: 6fde63b0-1482-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744121090; x=1744725890; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YHGQOmFDFfD9bvJf1QLqQD9QpITXgHkXWRCqhBE3LzY=;
        b=W2V6topDtl76kJKJB262nIZxj6gOnc9DJm1DYlQ/m4R1WULBI3I7iGqT+8kYce9muc
         7Za6Jsu8JgJGUiLeNTJBncKpWoNXpnbndheCiVeyUaI3FVRzPoij481wUDNVscI8EADC
         L7qOnx5efP8Q6fHQuTUcekf7rltpvJae0UQHAwR/EcBoilEDGFupxGynuUlVVCLvY1zm
         8ChFfGiiMqlmVZSSZMGGkKwAHTbCO9B1YvrYFl7eZal69Xb/tRLT+1wmh3KRs5NEfna7
         mS9LPmmzy+9bTe9ub9s7YqDD29RjTdCr8cGSO2ZLixA1YnVFzn70gh65VcTnfl7hHyVc
         QXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744121090; x=1744725890;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHGQOmFDFfD9bvJf1QLqQD9QpITXgHkXWRCqhBE3LzY=;
        b=Sjt8BSEWqkGjFnKiE5wV5nJj25eLmOAOPhBlrHFLX6PRJgKS6l5kHDL+hSxncr2QJv
         zZjzZcbYBaPYtR1Zxya51LEl4t7rAK0KxnqMqlQZr4FYNnyhg/ksjTJG12OGvbb9eb52
         u61i1c+8SX1/RBA27c2hO6+JQbg9Ly2NpjZVFG4mSCrzUfq2patuhQ8NchiZxFEvBJbu
         V6goP5TUG5VE/pWo2ZPcKVvYSR3oa08y8T0qYkECQ8TST5xgOl2FmodPwT50rAwak5AT
         esVmya7o8f38wfuQqn88FLXnCtG0qtNn6dnjxKj0Al/IBY2YUwPhPjN8o3ETx9Rnd49o
         igbw==
X-Forwarded-Encrypted: i=1; AJvYcCVMWQ8DBol8ob2LI+Q+BtNDcqnXptzvpklaeqOQ6n+6KeaAA4KC0gAJKZhagvC8vhDS/dnc/w1WhGg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5Wp453S0KrK7t0Noi8Dyr2HHnGld8hGY8ux0kDUp8Er85ipBN
	mdE/7NsdKfdSHoqEHpHnwFGSv50s10FXw0caJrOyUm8CrKMXODUcnVGQvscf0Q==
X-Gm-Gg: ASbGncsZ0si1FmAEZpp4V90jq+vampcA9FmEIhSQ5Dro1CpEioPDgw1JIENm2yY+w1l
	Z10Ixbn1F2X4Ru3rMF0hr/jADsjl57Xi7eQkNd5/dqkrhg4bFwN1h7+ttQuJ5GA7rStimsim8I8
	1XhA0r5WotemFyxSU8wujoM+EgNHx8G2WWXzKV8mKVgd6Y6YdoNjgjJwBkIeVVdYuxtBiRVUGp2
	QnpIkMJg5iWj+aEK2YLVGhnZiWHtTJjxBMfGKosgIlZQameiS40x16Xsy2d7NbwLgbxK9M5womX
	KeX/oK7+gGXX+YcWmBY+1vswv7/s80o682xMs4m+UlJwtJykLLlzKkcduLRxotkBuIaHt5/MomQ
	dRRQ/0LhUKau7lG1Q19Yx+j/ScJe0wg==
X-Google-Smtp-Source: AGHT+IFjDoQ3JCftmlS2+nC+axE4A108ry24SslLLsEWGd3BkMm9vU/obtCPhSGkDWe6FWIRlK4tlw==
X-Received: by 2002:a05:600c:83c4:b0:43a:b0ac:b10c with SMTP id 5b1f17b1804b1-43ed0d98fe5mr138874095e9.26.1744121089345;
        Tue, 08 Apr 2025 07:04:49 -0700 (PDT)
Message-ID: <fde6c1c2-c439-4020-9301-025b7e8af804@suse.com>
Date: Tue, 8 Apr 2025 16:04:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: Increase XEN_VIRT_SIZE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <808d1b346bc90dde38fd19a6b92ab78d78e42936.1743766932.git.oleksii.kurochko@gmail.com>
 <e5f6ccb3-498f-44cf-8c06-61fa502d93db@suse.com>
 <f35a9969-6154-4e9a-b997-16ca135e85ee@gmail.com>
 <8b2e50f2-1f89-41df-be88-afc9ef24b51a@suse.com>
 <c3b1be9a-d5f5-4cac-a675-7485a99bf51c@gmail.com>
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
In-Reply-To: <c3b1be9a-d5f5-4cac-a675-7485a99bf51c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 15:46, Oleksii Kurochko wrote:
> On 4/8/25 2:02 PM, Jan Beulich wrote:
>> On 08.04.2025 13:51, Oleksii Kurochko wrote:
>>> On 4/7/25 12:09 PM, Jan Beulich wrote:
>>>> On 04.04.2025 18:04, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/include/asm/mm.h
>>>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>>>> @@ -43,13 +43,19 @@ static inline void *maddr_to_virt(paddr_t ma)
>>>>>     */
>>>>>    static inline unsigned long virt_to_maddr(unsigned long va)
>>>>>    {
>>>>> +    const unsigned int vpn1_shift = PAGETABLE_ORDER + PAGE_SHIFT;
>>>>> +    const unsigned long va_vpn = va >> vpn1_shift;
>>>>> +    const unsigned long xen_virt_start_vpn =
>>>>> +        _AC(XEN_VIRT_START, UL) >> vpn1_shift;
>>>>> +    const unsigned long xen_virt_end_vpn =
>>>>> +        xen_virt_start_vpn + ((XEN_VIRT_SIZE >> vpn1_shift) - 1);
>>>>> +
>>>>>        if ((va >= DIRECTMAP_VIRT_START) &&
>>>>>            (va <= DIRECTMAP_VIRT_END))
>>>>>            return directmapoff_to_maddr(va - directmap_virt_start);
>>>>>    
>>>>> -    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
>>>>> -    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
>>>>> -           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
>>>>> +    BUILD_BUG_ON(XEN_VIRT_SIZE > GB(1));
>>>>> +    ASSERT((va_vpn >= xen_virt_start_vpn) && (va_vpn <= xen_virt_end_vpn));
>>>> Not all of the range is backed by memory, and for the excess space the
>>>> translation is therefore (likely) wrong. Which better would be caught by
>>>> the assertion?
>>> Backed here means that the memory is actually mapped?
>>>
>>> IIUC it is needed to check only for the range [XEN_VIRT_START, XEN_VIRT_START+xen_phys_size]
>>> where xen_phys_size=(unsigned long)_end - (unsigned long)_start.
>>>
>>> Did I understand you correctly?
>> I think so, yes. Depending on what you (intend to) do to .init.* at the
>> end of boot, that range may later also want excluding.
> 
> I planned to release everything between __init_begin and __init_end in the following way:
>    destroy_xen_mappings((unsigned long)__init_begin, (unsigned long)__init_end);
> 
> So yes, then I think I have to come up with new ASSERT, add is_init_memory_freed variable and
> if is_init_memory_freed=true then also check that `va` isn't from .init.* range.
> 
> But I'm not quire sure that mapping for .got* should be destroyed after the end of boot. (now it is
> part of [__init_begin,__init_end] range.

Isn't this a non-issue considering

ASSERT(!SIZEOF(.got),      ".got non-empty")
ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")

near the bottom of xen.lds.S?

>>>>> --- a/xen/arch/riscv/mm.c
>>>>> +++ b/xen/arch/riscv/mm.c
>>>>> @@ -31,20 +31,27 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
>>>>>    #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
>>>>>    
>>>>>    /*
>>>>> - * It is expected that Xen won't be more then 2 MB.
>>>>> + * It is expected that Xen won't be more then XEN_VIRT_SIZE MB.
>>>>>     * The check in xen.lds.S guarantees that.
>>>>> - * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
>>>>> - * One for each page level table with PAGE_SIZE = 4 Kb.
>>>>>     *
>>>>> - * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
>>>>> + * Root page table is shared with the initial mapping and is declared
>>>>> + * separetely. (look at stage1_pgtbl_root)
>>>>>     *
>>>>> - * It might be needed one more page table in case when Xen load address
>>>>> - * isn't 2 MB aligned.
>>>>> + * An amount of page tables between root page table and L0 page table
>>>>> + * (in the case of Sv39 it covers L1 table):
>>>>> + *   (CONFIG_PAGING_LEVELS - 2) are needed for an identity mapping and
>>>>> + *   the same amount are needed for Xen.
>>>>>     *
>>>>> - * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
>>>>> - * except that the root page table is shared with the initial mapping
>>>>> + * An amount of L0 page tables:
>>>>> + *   (512 entries of one L0 page table covers 2MB == 1<<XEN_PT_LEVEL_SHIFT(1))
>>>>> + *   XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1) are needed for Xen and
>>>>> + *   one L0 is needed for indenity mapping.
>>>>> + *
>>>>> + *   It might be needed one more page table in case when Xen load
>>>>> + *   address isn't 2 MB aligned.
>>>> Shouldn't we guarantee that?
>>> I think it's sufficient to guarantee 4KB alignment.
>>>
>>> The only real benefit I see in enforcing larger alignment is that it likely enables
>>> the use of superpages for mapping, which would reduce TLB pressure.
>>> But perhaps I'm missing something?
>> No, it's indeed mainly that.
> 
> But then the linker address and the load address should both be aligned to a 2MB or 1GB boundary.
> This likely isn't an issue at all, but could it be a problem if we require 1GB alignment for the
> load address? In that case, might it be difficult for the platform to find a suitable place in
> memory to load Xen for some reason? (I don't think so but maybe I'm missing something)

Why would load address need to be 1Gb aligned? That (as well as 2Mb-)alignment
matters only once you set up paging?

> These changes should probably be part of a separate patch, as currently,|setup_initial_mapping() |only works with 4KB mapping.

That's fine; it's just that - as said - the calculation of how many page tables
you may need has to cover for the worst case.

Jan

