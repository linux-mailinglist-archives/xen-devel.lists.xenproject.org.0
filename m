Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4427947F08
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 18:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772317.1182768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb0Lu-0000R0-GX; Mon, 05 Aug 2024 16:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772317.1182768; Mon, 05 Aug 2024 16:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb0Lu-0000O4-DB; Mon, 05 Aug 2024 16:14:30 +0000
Received: by outflank-mailman (input) for mailman id 772317;
 Mon, 05 Aug 2024 16:14:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I4ub=PE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sb0Lt-0000Ny-2C
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 16:14:29 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9a4b5ff-5345-11ef-bc03-fd08da9f4363;
 Mon, 05 Aug 2024 18:14:27 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5a3b866ebc9so14982991a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 09:14:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c0b8e7sm470139366b.72.2024.08.05.09.14.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Aug 2024 09:14:26 -0700 (PDT)
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
X-Inumbo-ID: c9a4b5ff-5345-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722874467; x=1723479267; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eCAKDuUU/1wCeEvBVVMiSsFmNNuG6C0f0pjIPN8QTgA=;
        b=WkCl3PVoQKJmLEgCicvbsM/oy3zCaEFLNWE9yj2swil5tV73sVzGTxPKVMUxfxHobr
         vge0lnxolW8qFv/GtbYVy1kGKrSGz2h7D2D/cCfrj7MkPSgLvOFCCq2xbH/grKQzHURF
         waF4BWwybtZQqVLQUjjaq8TwAO5anB+U/kjriRoHsrzzVlX+qoV98FOOvpKTICQIDmB4
         yWGylzzKycrzUFb3yCAcbW8K47S28359e/gSjU168FVGM+AwvBA2wszJdafOsUL+uWOx
         2k+nLjgsJuLAIdkRqCCuk9yZHhmuvLqkDSqhDsGUsVk74UePMHW5H13ChL0THnQ/teyw
         /wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722874467; x=1723479267;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCAKDuUU/1wCeEvBVVMiSsFmNNuG6C0f0pjIPN8QTgA=;
        b=JsAFY5fBLSzFlBnvTyWcI4849W9uGnlLyACeNTDT9rYVI2qXH0xwRQKiulsSTMd6SB
         vdSultmWiF7xT2ovTNANROtLeEz90BBPFytYVS63okge/T71/1Gk8uWmBtgz+60sLFxx
         NgiWMhvGiK/dr+q8fkayIjFUDiPiy1zgWiOYXCHvKcOgUigvpFqEKEyQfNhpM+ockGiR
         2OujS9S5VwFdguwusxDcKpIBiRqh7N+a0rpVkiCB93dfM+/AM+gbibp+nJqYs+RcQ0Kp
         NCt33FWDg6714L3kIGfhlzPryYFymszBNDAjiK35RmGAof1tFgXsSgmGQ2x0z82D7VOd
         9p7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXs5ZoW9zaDuDZ9GcMdxdH8WtVlQzBwnATuSKV7/14Bjvhnz7drISN4DEbMeGiecZFfxvhDSG20Lmq/ZPpq1FvIZ/+RszpAn5PxVosJaJ0=
X-Gm-Message-State: AOJu0YxNWi0IpBIYeyTSjQKxXqXiw5lpXkO4JAFfS+etIPVKIJiMxHeL
	ngJLKu46/FTL+Ij3qdqea1/JjCorGVWwy4ZQzO53HWNzR/x4BCjA+h4Mf+LQrw==
X-Google-Smtp-Source: AGHT+IFlIEuXyh4sZj8FmIr3FWs4tk3XG1Pmb+2A4p/f2pKoIT7/aQ3k+1srIdaztu2N6BuNC3ij0g==
X-Received: by 2002:a17:906:7314:b0:a7a:af5d:f313 with SMTP id a640c23a62f3a-a7dc4faba47mr886307666b.22.1722874466713;
        Mon, 05 Aug 2024 09:14:26 -0700 (PDT)
Message-ID: <35b277c6-8715-4c5b-b82d-ae29bbac8643@suse.com>
Date: Mon, 5 Aug 2024 18:14:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] xen/riscv: setup fixmap mapping
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <04576976b82b97442f645b83b3d62475d144af8e.1721834549.git.oleksii.kurochko@gmail.com>
 <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
 <afbbf9ed7c575e3b2c3f9a668db0b27258822ee0.camel@gmail.com>
 <d68f3047-5b12-4802-aac3-bb0b9c76cb08@suse.com>
 <ca7ba33e8314d776a1c7928730ab58eeec58dde7.camel@gmail.com>
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
In-Reply-To: <ca7ba33e8314d776a1c7928730ab58eeec58dde7.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.08.2024 18:02, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-08-05 at 17:45 +0200, Jan Beulich wrote:
>> On 05.08.2024 17:13, oleksii.kurochko@gmail.com wrote:
>>> On Mon, 2024-07-29 at 15:35 +0200, Jan Beulich wrote:
>>>>> +    }
>>>>> +
>>>>> +    BUG_ON(pte_is_valid(*pte));
>>>>> +
>>>>> +    tmp = paddr_to_pte(LINK_TO_LOAD((unsigned
>>>>> long)&xen_fixmap),
>>>>> PTE_TABLE);
>>>>
>>>> I'm a little puzzled by the use of LINK_TO_LOAD() (and
>>>> LOAD_TO_LINK()
>>>> a
>>>> little further up) here. Don't you have functioning __pa() and
>>>> __va()?
>>> Can __pa() and __va() be used in this case?
>>>
>>> According to comments for other architectures, these macros are
>>> used
>>> for converting between Xen heap virtual addresses (VA) and machine
>>> addresses (MA). I may have misunderstood what is meant by the Xen
>>> heap
>>> in this context, but I'm not sure if xen_fixmap[] and page tables
>>> are
>>> considered part of the Xen heap.
>>
>> I didn't check Arm, but on x86 virt_to_maddr() (underlying __pa())
>> has
>> special case code to also allow addresses within the Xen image
>> (area).
> 
> Yes, it is true for __virt_to_maddr:
>    static inline unsigned long __virt_to_maddr(unsigned long va)
>    {
>        ASSERT(va < DIRECTMAP_VIRT_END);
>        if ( va >= DIRECTMAP_VIRT_START )
>            va -= DIRECTMAP_VIRT_START;
>        else
>        {
>            BUILD_BUG_ON(XEN_VIRT_END - XEN_VIRT_START != GB(1));
>            /* Signed, so ((long)XEN_VIRT_START >> 30) fits in an imm32. */
>            ASSERT(((long)va >> (PAGE_ORDER_1G + PAGE_SHIFT)) ==
>                   ((long)XEN_VIRT_START >> (PAGE_ORDER_1G + PAGE_SHIFT)));
>    
>            va += xen_phys_start - XEN_VIRT_START;
>        }
>        return (va & ma_va_bottom_mask) |
>               ((va << pfn_pdx_hole_shift) & ma_top_mask);
>    }
>    
> But in case of __maddr_to_virt ( __va() ) it is using directmap region:
>    static inline void *__maddr_to_virt(unsigned long ma)
>    {
>        ASSERT(pfn_to_pdx(ma >> PAGE_SHIFT) < (DIRECTMAP_SIZE >>
>    PAGE_SHIFT));
>        return (void *)(DIRECTMAP_VIRT_START +
>                        ((ma & ma_va_bottom_mask) |
>                         ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));
>    }
> 
> But I have to use both __va() and __pa().
> __va() inside cycle to find L1 page table:
> 
>     for ( i = HYP_PT_ROOT_LEVEL; i-- > 1; )
>     {
>         BUG_ON(!pte_is_valid(*pte));
> 
>         pte = (pte_t *)LOAD_TO_LINK(pte_to_paddr(*pte));
>         pte = &pte[pt_index(i, FIXMAP_ADDR(0))];
>     }
> 
> __pa() to set a physical address of L0 page table:
>     tmp = paddr_to_pte(LINK_TO_LOAD((unsigned long)&xen_fixmap),
> PTE_TABLE);
>     write_pte(pte, tmp);

Hmm, then using at least LINK_TO_LOAD() is going to be unavoidable for the
time being, I guess. Yet midterm I think they should disappear from here. 

Jan

