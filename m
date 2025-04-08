Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1841BA803C5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 14:02:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941844.1341241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u27eg-00035J-TB; Tue, 08 Apr 2025 12:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941844.1341241; Tue, 08 Apr 2025 12:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u27eg-00033b-QQ; Tue, 08 Apr 2025 12:02:14 +0000
Received: by outflank-mailman (input) for mailman id 941844;
 Tue, 08 Apr 2025 12:02:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u27ef-00033V-41
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 12:02:13 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b779d77-1471-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 14:02:08 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso43828265e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 05:02:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a79aasm15017931f8f.35.2025.04.08.05.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 05:02:06 -0700 (PDT)
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
X-Inumbo-ID: 4b779d77-1471-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744113727; x=1744718527; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OVIW1TfF/xhcfVYcDEdeQi7PBjrEJXnVMuTqWX2dAIo=;
        b=PrwfOWB+P1ftw22FUMPUz8HW0G421XCRqs6ZVH25Ll8NDggbaPzBuia+fUMA9Yp6wQ
         EgMWMXvIWd+w2xf+58sTUnUtCAfxWu1+SGuPO42VngoUxZBiLMxTvmsR908pYOIfWIiN
         FZvxoz/VLDOxXtgW2ulr8ayd56ygti+/5qdGWHlpDZ89H0sjQenUu+ixza2gfo9bFK5X
         iKp2DagWb7NsLT+u7+wVPgQukUcicL4fKVgIJolNaCMPb2t20w0lBnp94XWzchDWOuti
         qZkaPU+Jh7boxVez1imp7V4PoBfGVppnP5hoWWujQcqNK/g9kNfQpwGN8eZ6En+g+M7I
         Tjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744113727; x=1744718527;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVIW1TfF/xhcfVYcDEdeQi7PBjrEJXnVMuTqWX2dAIo=;
        b=jigyHVWl7r3eQY34WvNipJpg7/HlUoTvDnyvVl9q7PfQlp+OR9BdIuBl4AyOkgqzZd
         ebm4hdbJdLC6aL15UpvTqaU3eFffx3PgUb+dnu3VdFa4ne+D9qSin+YmxVqA49TDSab5
         KAh2GJQJu77d+3Q2aT9ZUitjCu/7739BK687bwiwcf1MRtXturUupTsoywUYtEkHo4Bk
         eqFUHXGoLC3DDbLiPiZCDyFIuG35t5N9hsEm8s6u/ra8RlbLYl+6+u1m4gTKGGaJg6UH
         +Kxo1L1nGgvYjBoopJ7AMTAvR9kKYOrW2wFEvVnGFXIaDwx52xJEL2LeaeqgTLILdZGJ
         0cWw==
X-Forwarded-Encrypted: i=1; AJvYcCXsIS8T1Ly8xMau+RYbwx+rdul05PVraXQ51FtNGUQuB0kyqiTfJP5iezSl0v9AXcoXI59LNSnUmlo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1tXICKhAWHcxwTEqu2VgxuDzeGRo/gZtXwCmpCvxQVoFyz6Mz
	OygFnszcOVGtqex4Bp0BkRHLc54xEtHPi+XxtxmOi9654B2k3s9qWi+dUQX3IA==
X-Gm-Gg: ASbGnctXbfQvccJwQfLfc+OfvVAbtXucQYLHS4P0g49ZdtYXg1p5qE0SRFUPkFRhuRa
	g1UnjadVjr5SK8V8iPnUlGRGufd4qduhj2eMKJztjrB2/DTfrMen3+se9gztxgCZjCaPggB7Var
	+SNFo37rO/+0ahv+V2g+3api93s5pL+cXFiEl1Gl0jyzsAHJ+vAMadJlyAgJt2JD/ExSJByADgh
	97YWkOqBDe/Czh4/VCJgXc4LSkxHRGOy7h75F/Vgv7FT8neeDGHnGiUYzsUKHZfjrFQvDjZNZdz
	G1PvrOrL9sRJg5nQrluJZ5h93stqQsb/EWuJdLX83cpYd51MrltldF0OeuzVnwns6RTiEQcZEQc
	KcEpUZsoHUhYf2uBLry+jrcUtMVy6eQ==
X-Google-Smtp-Source: AGHT+IGjZwTJ4070ZOqIi0mSKsv6qPa5G2CWVqOv9vlX78GcvTyQkykOmckh7ARPavW+j6QhK/MDew==
X-Received: by 2002:a05:600c:3d17:b0:43d:7bfa:2739 with SMTP id 5b1f17b1804b1-43ee0768c11mr110515435e9.23.1744113726903;
        Tue, 08 Apr 2025 05:02:06 -0700 (PDT)
Message-ID: <8b2e50f2-1f89-41df-be88-afc9ef24b51a@suse.com>
Date: Tue, 8 Apr 2025 14:02:05 +0200
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
In-Reply-To: <f35a9969-6154-4e9a-b997-16ca135e85ee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.04.2025 13:51, Oleksii Kurochko wrote:
> On 4/7/25 12:09 PM, Jan Beulich wrote:
>> On 04.04.2025 18:04, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/mm.h
>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>> @@ -43,13 +43,19 @@ static inline void *maddr_to_virt(paddr_t ma)
>>>    */
>>>   static inline unsigned long virt_to_maddr(unsigned long va)
>>>   {
>>> +    const unsigned int vpn1_shift = PAGETABLE_ORDER + PAGE_SHIFT;
>>> +    const unsigned long va_vpn = va >> vpn1_shift;
>>> +    const unsigned long xen_virt_start_vpn =
>>> +        _AC(XEN_VIRT_START, UL) >> vpn1_shift;
>>> +    const unsigned long xen_virt_end_vpn =
>>> +        xen_virt_start_vpn + ((XEN_VIRT_SIZE >> vpn1_shift) - 1);
>>> +
>>>       if ((va >= DIRECTMAP_VIRT_START) &&
>>>           (va <= DIRECTMAP_VIRT_END))
>>>           return directmapoff_to_maddr(va - directmap_virt_start);
>>>   
>>> -    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
>>> -    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
>>> -           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
>>> +    BUILD_BUG_ON(XEN_VIRT_SIZE > GB(1));
>>> +    ASSERT((va_vpn >= xen_virt_start_vpn) && (va_vpn <= xen_virt_end_vpn));
>> Not all of the range is backed by memory, and for the excess space the
>> translation is therefore (likely) wrong. Which better would be caught by
>> the assertion?
> 
> Backed here means that the memory is actually mapped?
> 
> IIUC it is needed to check only for the range [XEN_VIRT_START, XEN_VIRT_START+xen_phys_size]
> where xen_phys_size=(unsigned long)_end - (unsigned long)_start.
> 
> Did I understand you correctly?

I think so, yes. Depending on what you (intend to) do to .init.* at the
end of boot, that range may later also want excluding.

>>> --- a/xen/arch/riscv/mm.c
>>> +++ b/xen/arch/riscv/mm.c
>>> @@ -31,20 +31,27 @@ unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
>>>   #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
>>>   
>>>   /*
>>> - * It is expected that Xen won't be more then 2 MB.
>>> + * It is expected that Xen won't be more then XEN_VIRT_SIZE MB.
>>>    * The check in xen.lds.S guarantees that.
>>> - * At least 3 page tables (in case of Sv39 ) are needed to cover 2 MB.
>>> - * One for each page level table with PAGE_SIZE = 4 Kb.
>>>    *
>>> - * One L0 page table can cover 2 MB(512 entries of one page table * PAGE_SIZE).
>>> + * Root page table is shared with the initial mapping and is declared
>>> + * separetely. (look at stage1_pgtbl_root)
>>>    *
>>> - * It might be needed one more page table in case when Xen load address
>>> - * isn't 2 MB aligned.
>>> + * An amount of page tables between root page table and L0 page table
>>> + * (in the case of Sv39 it covers L1 table):
>>> + *   (CONFIG_PAGING_LEVELS - 2) are needed for an identity mapping and
>>> + *   the same amount are needed for Xen.
>>>    *
>>> - * CONFIG_PAGING_LEVELS page tables are needed for the identity mapping,
>>> - * except that the root page table is shared with the initial mapping
>>> + * An amount of L0 page tables:
>>> + *   (512 entries of one L0 page table covers 2MB == 1<<XEN_PT_LEVEL_SHIFT(1))
>>> + *   XEN_VIRT_SIZE >> XEN_PT_LEVEL_SHIFT(1) are needed for Xen and
>>> + *   one L0 is needed for indenity mapping.
>>> + *
>>> + *   It might be needed one more page table in case when Xen load
>>> + *   address isn't 2 MB aligned.
>> Shouldn't we guarantee that?
> 
> I think it's sufficient to guarantee 4KB alignment.
> 
> The only real benefit I see in enforcing larger alignment is that it likely enables
> the use of superpages for mapping, which would reduce TLB pressure.
> But perhaps I'm missing something?

No, it's indeed mainly that.

> Or did you mean that if 2MB alignment isn't guaranteed, then we might need two extra
> page tables—one if the start address isn't 2MB aligned, and the Xen size is larger than 2MB?
> Then yes one more page table should be added to PGTBL_INITIAL_COUNT.

Well, of course - if alignment isn't guaranteed, crossing whatever boundaries
of course needs accounting for.

Jan

