Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF209391BB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 17:25:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762203.1172325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuuU-0008PF-Rj; Mon, 22 Jul 2024 15:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762203.1172325; Mon, 22 Jul 2024 15:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuuU-0008Ne-NP; Mon, 22 Jul 2024 15:25:10 +0000
Received: by outflank-mailman (input) for mailman id 762203;
 Mon, 22 Jul 2024 15:25:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVuuT-0008NY-08
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 15:25:09 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 932ef0f6-483e-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 17:25:06 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5a10bb7b237so3872163a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 08:25:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30c7d30a0sm6307989a12.83.2024.07.22.08.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 08:25:05 -0700 (PDT)
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
X-Inumbo-ID: 932ef0f6-483e-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721661906; x=1722266706; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CqEvfyyxNNGQfu+BQ10gGIuY/jWL5R9RFbGKJU6Bnkk=;
        b=KCrGJUzWLjnA4FwqZt6iBeN5d9I3ESKu5cn/UVpoYCLNCxW7SV72Up4oUMXHkh8LzK
         lVA3xPGBv9hh7yqlnMpCYMI6WdBeT1zYwu9HHihpS4WoSz0/CBzmxQK8Y+ymuNfpCokK
         83NS1efdbvatwbjPUeRnOg7vcGSEQi9ZMpCAz2cut8xaVYoIqRF+RSBCpkDuAWyhDj5V
         tOg1K58xBbKhgDLzoNoV6Zwda8jYpuAhkuoN5Mzo6d73Emlvlb5p22FEEMH3Od1MdYUs
         cpOsuEILwpdqwqRicYBPBQyxcVgs+kDaOcr6eA2Uq/BR8rgd3SXRRnVFMzPJ7zp13QC0
         P9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721661906; x=1722266706;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqEvfyyxNNGQfu+BQ10gGIuY/jWL5R9RFbGKJU6Bnkk=;
        b=E9faG+fyHRYgIWTbqhNtVaSeKE6+XfeV4p6Gh6bGaNMOQtEAmoESswLblJAQokcwTl
         N4S0jxqRGrfTb39MndXJcAL1coDwduuszruG+msp8ItcovRNucU/ZEmWLd9w+Nb85xgR
         vzOBA12i/GZEklrcX8P/ymqLrMapJYOx0XXVAhuG6xKsreHX67DFa3ga4QmhhREGz2d6
         cJIlUURfW794hIo9ShqYkgE5HWmB/RdeQBnLCbSGunRHslbqVdpZ6QFWC8+QnNBKp0nf
         xbKIw2XdThrV7cakvirVex9tE+Bw3oDQTTBulE/93fBJM/OS/WH3sD3SIbDclpgEzOjY
         7urA==
X-Forwarded-Encrypted: i=1; AJvYcCVyxbotFUzOFXEMDqMJqCIGRibFZsG6cNaLvtxB3EvNmmxRJuBgTceeMOCNjBfhvYh3Fzv0qavJaWSypoQIbU1anBmgbX9EYnS7wC9EQW0=
X-Gm-Message-State: AOJu0Yym6Xga6UmwQMYV0gPjBrJBRcsnHAP5OlF1M6Wqt7ovGUj+Vjgx
	tnHImVwf2wskDhhAFnDjP8M9t+W9x6q0LKyoPp9YxDUT6hNYitm7xUHyf/Vcjg==
X-Google-Smtp-Source: AGHT+IE9bc+oSdVl/n4OxRKz2ZWt811QEf23iy0O4PeW5GeCz4r6FzNrN2m1MUgwU//Lv02zMgRg0g==
X-Received: by 2002:a50:8ad8:0:b0:5a2:9683:2bb6 with SMTP id 4fb4d7f45d1cf-5a941a3b8d8mr191795a12.1.1721661906174;
        Mon, 22 Jul 2024 08:25:06 -0700 (PDT)
Message-ID: <53e2a88b-8d2d-477a-84cb-5b44af365dbe@suse.com>
Date: Mon, 22 Jul 2024 17:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] xen/riscv: setup fixmap mapping
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <b1776fb20603cb56b0aea17ef998ea951d2bbda9.1720799926.git.oleksii.kurochko@gmail.com>
 <16648c6c-416d-4205-8d16-38c006251bb9@suse.com>
 <26a45d85fa22a696b629e602e87d5d95626b77f0.camel@gmail.com>
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
In-Reply-To: <26a45d85fa22a696b629e602e87d5d95626b77f0.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.07.2024 16:36, Oleksii wrote:
> On Mon, 2024-07-22 at 14:42 +0200, Jan Beulich wrote:
>> On 12.07.2024 18:22, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/config.h
>>> +++ b/xen/arch/riscv/include/asm/config.h
>>> @@ -74,11 +74,20 @@
>>>  #error "unsupported RV_STAGE1_MODE"
>>>  #endif
>>>  
>>> +#define XEN_SIZE                MB(2)
>>> +#define XEN_VIRT_END            (XEN_VIRT_START + XEN_SIZE)
>>> +
>>> +#define BOOT_FDT_VIRT_START     XEN_VIRT_END
>>> +#define BOOT_FDT_VIRT_SIZE      MB(4)
>>> +
>>>  #define DIRECTMAP_SLOT_END      509
>>>  #define DIRECTMAP_SLOT_START    200
>>>  #define DIRECTMAP_VIRT_START    SLOTN(DIRECTMAP_SLOT_START)
>>>  #define DIRECTMAP_SIZE          (SLOTN(DIRECTMAP_SLOT_END) -
>>> SLOTN(DIRECTMAP_SLOT_START))
>>>  
>>> +#define FIXMAP_BASE             (BOOT_FDT_VIRT_START +
>>> BOOT_FDT_VIRT_SIZE)
>>> +#define FIXMAP_ADDR(n)          (FIXMAP_BASE + (n) * PAGE_SIZE)
>>
>> Why exactly do you insert this here, and not adjacent to
>> BOOT_FDT_VIRT_*,
>> which it actually is adjacent with?
> I tried to follow alphabetical order.

Oh, X before B (just making fun) ... Anyway, my take here is that sorting
by address is going to be more helpful.

>>> --- a/xen/arch/riscv/mm.c
>>> +++ b/xen/arch/riscv/mm.c
>>> @@ -49,6 +49,9 @@ stage1_pgtbl_root[PAGETABLE_ENTRIES];
>>>  pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>>>  stage1_pgtbl_nonroot[PGTBL_INITIAL_COUNT * PAGETABLE_ENTRIES];
>>>  
>>> +pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>>> +xen_fixmap[PAGETABLE_ENTRIES];
>>
>> Any reason this cannot be static?
> It will be used by pmap:
>    static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
>    {
>        pte_t *entry = &xen_fixmap[slot];
>        pte_t pte;
>    
>        ASSERT(!pte_is_valid(*entry));
>    
>        pte = mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
>        pte.pte |= PTE_LEAF_DEFAULT;
>        write_pte(entry, pte);
>    }
>    
>    static inline void arch_pmap_unmap(unsigned int slot)
>    {
>        pte_t pte = {};
>    
>        write_pte(&xen_fixmap[slot], pte);
>    }

Yet as asked there - shouldn't that be set_fixmap() and clear_fixmap()?

Jan

