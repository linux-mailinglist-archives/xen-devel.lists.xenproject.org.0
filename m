Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE23AEF50E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 12:28:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029488.1403237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYDT-0005r6-FL; Tue, 01 Jul 2025 10:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029488.1403237; Tue, 01 Jul 2025 10:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYDT-0005pR-CK; Tue, 01 Jul 2025 10:27:55 +0000
Received: by outflank-mailman (input) for mailman id 1029488;
 Tue, 01 Jul 2025 10:27:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWYDS-0005pL-MU
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 10:27:54 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b09ea6e-5666-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 12:27:52 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so4637512f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 03:27:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af557b3a2sm11143691b3a.104.2025.07.01.03.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 03:27:50 -0700 (PDT)
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
X-Inumbo-ID: 0b09ea6e-5666-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751365671; x=1751970471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l01/jmjimKrTY5R8H/escBJEc8oWFdhiuTD7K01tXfc=;
        b=DSq4BplwIA9oerfdtZlyHAaeLphMA164cAmblA9atN3CepVm7XgjNbD/R3PrOsGokQ
         5Ax2dJ8Gs7RqjEdWUYqrTkTDy/UZSpdSPGyP9tJA16MGn3trJqXuisSJ8+3Oc6EyXwdH
         BRJCTVIeMfX12SaHiWsFfVrwXfiUpWG0GfCr7YiyFsLNMEgoQXEpYy6lAe7hy+MGXcjh
         B3GU80o08CmUdTlDiA+7Cl8rPdGDwPRqrKARuNz3v3MK5Ftn9aNSWNjTYmsUEYSjenaJ
         J/zuiNHUf2qRGLgUwnJwnxx21TbmmrXAHQBjnb79wBFFoZbckl8GvyxnyI0fbgjZp6+2
         LfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751365671; x=1751970471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l01/jmjimKrTY5R8H/escBJEc8oWFdhiuTD7K01tXfc=;
        b=MSMkx4CkMZPbRDNWaZjadah1cttOc6kRk8H4NQky6abiqy1cp6DztqnbUBg10v5R9g
         JDwc4rkout0mt6cWTwNtqKssLT0OMSY4auRciMbm1opru2OjjNUrheueUUshn0qIcipg
         xWdRgJdqVqQawrzWHvUNmHfWFsjqRQk3QZy7noPSdxzrzLE6XfWDGJAOq6c4CJOqCHCP
         W2ZtyOn/Hbh3IjfoIw+gk7VkHk7nLVEwdoRpoajKvkkgVXjpha9uWAG83kLUABcBhJac
         TA1s4NzKmvgDxoygu1iSwEQl88t/EUV+h9bw3LN7Lq5Cqd30RVvmLtOrlvyan2u/pAUl
         irNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWboQ9qK9Mg1r68NobDqp0VdJCKdAkqy2NxvO8zIRlSscgOXLfgDtduu+HhhQbYS1t4DOXpTKt3m7U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGv1VHb1fUO1g7eou8kn3/4W82cYpJGC63UFe6OAVNvCEgWg15
	RAlXw+hAigIyvU4epW7XzwD3Nn4X+lA91U4/hlYjao3C1XsZj9+PnAO6GanQDqA2bg==
X-Gm-Gg: ASbGncvDqya2OlNGweJpYF8wPpuRGbzrDtLQJ9l8grFPLgletE8HrkeoWMxqxILTpQ4
	tDdWKq4tOkdL50dJgRcUar95Q7OAsR5b10aeS947HE7Q9aQ9wj01wcYx00PH8Jm3JWWQdy7s8f9
	Ttqtsd4h/wXfXHgV5/9Vj4rlnZ0L03Cm/ZnjfKixkqf076/fmnKwJZEDC10+JU/2r7qU0Q1IZ3x
	dCSerQyQG8CeYYH4DWnBiKF8aP8FRCvKgUDHgJMnsi+vY+OJVSCtufX2JyFWeJZyso4SGhqxoNn
	vurbr75qoE6sLa6aqieU7oNqlml9L+BkmrlRVq+2izf0JeibCAstjAUzVi2qpM7aJ+R0FT8moGp
	1JhVkgeyGnlLlf/iYXTdASCYnIJcc9UyfZnsbJ410pEXrSE4=
X-Google-Smtp-Source: AGHT+IH4tEMMGTLFnUeVeiW1thG2rmKgQ8wSWavE5sn8QBe+GoOZo8bn82CvzxK2onnYjYT0Nhw1AQ==
X-Received: by 2002:a5d:4403:0:b0:3a5:1222:ac64 with SMTP id ffacd0b85a97d-3a9176038bbmr12873049f8f.38.1751365671400;
        Tue, 01 Jul 2025 03:27:51 -0700 (PDT)
Message-ID: <b658471f-28f2-4ee7-b1c1-41837daa72c2@suse.com>
Date: Tue, 1 Jul 2025 12:27:40 +0200
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
 <49de841e-d3dd-447f-98f2-77de8b2acf94@suse.com>
 <55144da9-cf8e-4b73-8817-e72d8ff91019@gmail.com>
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
In-Reply-To: <55144da9-cf8e-4b73-8817-e72d8ff91019@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.07.2025 11:44, Oleksii Kurochko wrote:
> On 7/1/25 8:29 AM, Jan Beulich wrote:
>> On 30.06.2025 18:18, Oleksii Kurochko wrote:
>>> On 6/30/25 5:22 PM, Jan Beulich wrote:
>>>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/include/asm/p2m.h
>>>>> +++ b/xen/arch/riscv/include/asm/p2m.h
>>>>> @@ -26,6 +26,12 @@ struct p2m_domain {
>>>>>        /* Pages used to construct the p2m */
>>>>>        struct page_list_head pages;
>>>>>    
>>>>> +    /* The root of the p2m tree. May be concatenated */
>>>>> +    struct page_info *root;
>>>>> +
>>>>> +    /* Address Translation Table for the p2m */
>>>>> +    paddr_t hgatp;
>>>> Does this really need holding in a struct field? Can't is be re-created at
>>>> any time from "root" above?
>>> Yes, with the current one implementation, I agree it would be enough only
>>> root. But as you noticed below...
>>>
>>>> And such re-creation is apparently infrequent,
>>>> if happening at all after initial allocation. (But of course I don't know
>>>> what future patches of yours will bring.) This is even more so if ...
>>>>
>>>>> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
>>>>> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
>>>>> @@ -133,11 +133,13 @@
>>>>>    #define HGATP_MODE_SV48X4		_UL(9)
>>>>>    
>>>>>    #define HGATP32_MODE_SHIFT		31
>>>>> +#define HGATP32_MODE_MASK		_UL(0x80000000)
>>>>>    #define HGATP32_VMID_SHIFT		22
>>>>>    #define HGATP32_VMID_MASK		_UL(0x1FC00000)
>>>>>    #define HGATP32_PPN			_UL(0x003FFFFF)
>>>>>    
>>>>>    #define HGATP64_MODE_SHIFT		60
>>>>> +#define HGATP64_MODE_MASK		_ULL(0xF000000000000000)
>>>>>    #define HGATP64_VMID_SHIFT		44
>>>>>    #define HGATP64_VMID_MASK		_ULL(0x03FFF00000000000)
>>>> ... VMID management is going to change as previously discussed, at which
>>>> point the value to put in hgatp will need (partly) re-calculating at certain
>>>> points anyway.
>>> ... after VMID management will changed to per-CPU base then it will be needed
>>> to update re-calculate hgatp each time vCPU on pCPU is changed.
>>> In this case I prefer to have partially calculated 'hgatp'.
>> But why, when you need to do some recalculation anyway?
> 
> Less operations will be needed to do.

Right; I wonder how big the savings would be.

> If we have partially prepared 'hgatp' then we have to only update VMID bits
> instead of getting ppn for page, then calculate hgatp_mode each time.
> But if you think it isn't really needed I can add vmid argument for hgatp_from_page()
> and just call this function when an update of hgatp is needed.

I think it'll need to be struct p2m_domain * that you (also?) pass in. In the
longer run I think you will want to support all three permitted modes, with
smaller guests using fewer page table levels.

As to "also" - maybe it's better to change the name of the function, and pass
in just (const if possible) struct p2m_domain *.

>>>>> --- a/xen/arch/riscv/p2m.c
>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>> @@ -41,6 +41,91 @@ void p2m_write_unlock(struct p2m_domain *p2m)
>>>>>        write_unlock(&p2m->lock);
>>>>>    }
>>>>>    
>>>>> +static void clear_and_clean_page(struct page_info *page)
>>>>> +{
>>>>> +    clean_dcache_va_range(page, PAGE_SIZE);
>>>>> +    clear_domain_page(page_to_mfn(page));
>>>>> +}
>>>> A function of this name can, imo, only clear and then clean. Question is why
>>>> it's the other way around, and what the underlying requirement is for the
>>>> cleaning part to be there in the first place. Maybe that's obvious for a
>>>> RISC-V person, but it's entirely non-obvious to me (Arm being different in
>>>> this regard because of running with caches disabled at certain points in
>>>> time).
>>> You're right, the current name|clear_and_clean_page()| implies that clearing
>>> should come before cleaning, which contradicts the current implementation.
>>> The intent here is to ensure that the page contents are consistent in RAM
>>> (not just in cache) before use by other entities (guests or devices).
>>>
>>> The clean must follow the clear — so yes, the order needs to be reversed.
>> What you don't address though - why's the cleaning needed in the first place?
> 
> If we clean the data cache first, we flush the d-cache and then use the page to
> perform the clear operation. As a result, the "cleared" value will be written into
> the d-cache. To avoid polluting the d-cache with the "cleared" value, the correct
> sequence is to clear the page first, then clean the data cache.

If you want to avoid cache pollution, I think you'd need to use a form of stores
which simply bypass the cache. Yet then - why would this matter here, but not
elsewhere? Wouldn't you better leave such to the hardware, unless you can prove
a (meaningful) performance gain?

>>>>> +    unsigned int nr_pages = _AC(1,U) << order;
>>>> Nit (style): Missing blank after comma.
>>> I've changed that to BIT(order, U)
>>>
>>>>> +    /* Return back nr_pages necessary for p2m root table. */
>>>>> +
>>>>> +    if ( ACCESS_ONCE(d->arch.paging.p2m_total_pages) < nr_pages )
>>>>> +        panic("Specify more xen,domain-p2m-mem-mb\n");
>>>> You shouldn't panic() in anything involved in domain creation. You want to
>>>> return NULL in this case.
>>> It makes sense in this case just to return NULL.
>>>
>>>> Further, to me the use of "more" looks misleading here. Do you perhaps mean
>>>> "larger" or "bigger"?
>>>>
>>>> This also looks to be happening without any lock held. If that's intentional,
>>>> I think the "why" wants clarifying in a code comment.
>>> Agree, returning back pages necessary for p2m root table should be done under
>>> spin_lock(&d->arch.paging.lock).
>> Which should be acquired at the paging_*() layer then, not at the p2m_*() layer.
>> (As long as you mean to have that separation, that is. See the earlier discussion
>> on that matter.)
> 
> Then partly p2m_set_allocation() should be moved to paging_*() too.

Not exactly sure what you mean. On x86 at least the paging layer part of
the function is pretty slim.

>>>>> +    for ( unsigned int i = 0; i < nr_pages; i++ )
>>>>> +    {
>>>>> +        /* Return memory to domheap. */
>>>>> +        page = page_list_remove_head(&d->arch.paging.p2m_freelist);
>>>>> +        if( page )
>>>>> +        {
>>>>> +            ACCESS_ONCE(d->arch.paging.p2m_total_pages)--;
>>>>> +            free_domheap_page(page);
>>>>> +        }
>>>>> +        else
>>>>> +        {
>>>>> +            printk(XENLOG_ERR
>>>>> +                   "Failed to free P2M pages, P2M freelist is empty.\n");
>>>>> +            return NULL;
>>>>> +        }
>>>>> +    }
>>>> The reason for doing this may also want to be put in a comment.
>>> I thought it would be enough the comment above: /* Return back nr_pages necessary for p2m root table. */
>> That describes what the code does, but not why.
> 
> I will add to the comment: "... to get the memory accounting right".

I'm sorry to be picky, but what is "right"? You want assure the root table
memory is also accounted against the P2M pool of the domain. Can't you say
exactly that?

Jan

