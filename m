Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F769C1712
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 08:38:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832242.1247649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9JXv-0002Ot-HE; Fri, 08 Nov 2024 07:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832242.1247649; Fri, 08 Nov 2024 07:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9JXv-0002Mg-EZ; Fri, 08 Nov 2024 07:36:43 +0000
Received: by outflank-mailman (input) for mailman id 832242;
 Fri, 08 Nov 2024 07:36:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t9JXu-0002MY-Na
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 07:36:42 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 306f4b5b-9da4-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 08:36:38 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37d3ecad390so1677624f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 23:36:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177e87537sm24067445ad.270.2024.11.07.23.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 23:36:37 -0800 (PST)
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
X-Inumbo-ID: 306f4b5b-9da4-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzAiLCJoZWxvIjoibWFpbC13cjEteDQzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMwNmY0YjViLTlkYTQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDUxMzk4LjgyOTQ5OSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731051398; x=1731656198; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qMZCOHjAe0ESWN7d7HfkJuBRNqsqigUwVWdtBQnWMc0=;
        b=IAtVb79ql7W8RRYghjN9rFgIHfxPY3/Vu76/zn9uDRDMcPsjBexPzLKdBuMOvxw9rj
         FdGYkawRTfL3aRzf4+blFDJxjUnkB3v+BWrSnlQCrMt8ZE/ER6voMtcBClNwezBYVy9w
         O+oE0NM0PSxmZYAbyBkLyxcUSZeOPPdZECkrFWnVW2ewsmrvLkh2aQEh+0y+0z5URxz1
         9SDApRiUOGOVsSAnXQebAJmcCev28uR/+kUYI3l8/LJJYIX4k8WpPBvtO6PNeb0g45JN
         GHoKDuy4WMJ0vIhz6PEL0AWrWUfqouvN6vS7DToXSvNFLtdHPqRQYU8nzlg+M89qThjB
         CKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731051398; x=1731656198;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMZCOHjAe0ESWN7d7HfkJuBRNqsqigUwVWdtBQnWMc0=;
        b=i8HuWx/Ud65KYviO0PNXo+rluSkDhcwaNg48MCJDK1nJZbFReFDJv+u2chn2IlpjVX
         Q8SpYKIp247bUVTU8ZOvehfJwDQBKQCNst4TsU2YgLdZ5XuMr116EwTdFZDgt/rJpRXk
         vJsUfhU4oZClWwGRpiX20BfROKRm6ngCod3CjcHqdg+IPZJL6SwY7ZMnkNjVKBrG8njS
         9asIGe26IH1f4fXxouFrm5NsRb1F7G3bBCwcuuOXasnHKDj045jf0q7IlVtIaSU0YYDy
         gJ1JwzZXE6Vsk4gsQQXlGvaz1jgt2pg1VfUk8QGglhElpdmJrYCBtcRe8P3ifsg5WZ9p
         Isxw==
X-Forwarded-Encrypted: i=1; AJvYcCVunssWf09fasgn5TwhL06AxLCQ1sRJK15qEhVQ/Y9KBXBnGUBkYhQiQ8LMXwN2PgccscyEy/KSm88=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygUpq2MbOpThOeCRoVqZpEfK+NSlevYZox9k4wv6DWXATiV8v2
	iwpAerPkpYYoTXjEqVN6vSGLu5FpApPi9tJHhI2YA86jeo3yhbpO9qphH/7Nbg==
X-Google-Smtp-Source: AGHT+IGK7DkmkNjAsaBFx/fWzjGTZ5XdgNVZ+U5p4R/JVIzf6NxMhK6GvoW595KXeGY518WT6kGjTA==
X-Received: by 2002:a5d:5f8e:0:b0:37d:5251:e5ad with SMTP id ffacd0b85a97d-381f0f40e32mr1983677f8f.2.1731051397940;
        Thu, 07 Nov 2024 23:36:37 -0800 (PST)
Message-ID: <04eea7f5-92a5-452c-84af-e95d70d090b6@suse.com>
Date: Fri, 8 Nov 2024 08:36:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86/mm: introduce helpers to detect super page
 alignment
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241106122927.26461-1-roger.pau@citrix.com>
 <20241106122927.26461-2-roger.pau@citrix.com>
 <85d6a128-965b-4f39-8d08-2b2084db65b4@suse.com> <ZyzlxiipPvbUjs0r@macbook>
 <Zyz2pYEjbh9SVnAl@macbook>
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
In-Reply-To: <Zyz2pYEjbh9SVnAl@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.11.2024 18:19, Roger Pau Monné wrote:
> On Thu, Nov 07, 2024 at 05:07:34PM +0100, Roger Pau Monné wrote:
>> On Thu, Nov 07, 2024 at 11:42:11AM +0100, Jan Beulich wrote:
>>> On 06.11.2024 13:29, Roger Pau Monne wrote:
>>>> --- a/xen/arch/x86/include/asm/page.h
>>>> +++ b/xen/arch/x86/include/asm/page.h
>>>> @@ -200,6 +200,12 @@ static inline l4_pgentry_t l4e_from_paddr(paddr_t pa, unsigned int flags)
>>>>  #define l4_table_offset(a)         \
>>>>      (((a) >> L4_PAGETABLE_SHIFT) & (L4_PAGETABLE_ENTRIES - 1))
>>>>  
>>>> +/* Check if an address is aligned for a given slot level. */
>>>> +#define SLOT_IS_ALIGNED(v, m, s) \
>>>> +    IS_ALIGNED(PFN_DOWN(v) | mfn_x(m), (1UL << ((s) - PAGE_SHIFT)) - 1)
>>>
>>> The check involving an address and an MFN, I think the comment would better
>>> also reflect this. "Check if a (va,mfn) tuple is suitably aligned to be
>>> mapped by a large page at a given page table level"?
>>>
>>> As to the name of this helper macro - "SLOT" can mean about anything when
>>> not further qualified. If the macro was local to ...
>>>
>>>> +#define IS_L3E_ALIGNED(v, m) SLOT_IS_ALIGNED(v, m, L3_PAGETABLE_SHIFT)
>>>> +#define IS_L2E_ALIGNED(v, m) SLOT_IS_ALIGNED(v, m, L2_PAGETABLE_SHIFT)
>>>> +
>>>>  /* Convert a pointer to a page-table entry into pagetable slot index. */
>>>>  #define pgentry_ptr_to_slot(_p)    \
>>>>      (((unsigned long)(_p) & ~PAGE_MASK) / sizeof(*(_p)))
>>>> --- a/xen/arch/x86/mm.c
>>>> +++ b/xen/arch/x86/mm.c
>>>
>>> ... this (sole) file using the derived ones, that might be acceptable. If
>>> it's to remain in page.h, how about e.g. IS_LnE_ALIGNED()?
>>
>> Since you expressed further concerns in the next patch, I will move it
>> to being local to mm.c.  I don't have any other use-case, but assumed
>> the macros are generic enough to be useful in other contexts.
>>
>>> I further wonder whether it wouldn't be neater if just the level was passed
>>> into the helper. Doing so wouldn't even require token concatenation (which
>>> iirc both you and Andrew don't like in situations like this one), as the
>>> mask can be calculated from just level and PAGETABLE_ORDER. At which point
>>> it may even make sense to leave out the wrapper macros.
>>
>> I can see what I can do.
> 
> Would something like:
> 
> #define IS_LnE_ALIGNED(v, m, n) \
>     IS_ALIGNED(PFN_DOWN(v) | mfn_x(m), (1UL << (PAGETABLE_ORDER * (n - 1))) - 1)
> 
> Defined only in the context of map_pages_to_xen() be OK with you?

Yes.

> I'm unsure whether it would be better if I still provided the
> IS_L{2,3}E_ALIGNED() macros based on that, as IMO those macros made
> the conditionals clearer to read.

Not sure without actually seeing it in place. Without those wrapper macros,
having n be the first macro parameter may help reduce the visual difference
between both variants. Yet if you clearly feel better with the wrappers,
I'm not going to insist on omitting them.

Jan

