Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FBB9B2A11
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 09:19:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826280.1240478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Ky4-0005vG-36; Mon, 28 Oct 2024 08:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826280.1240478; Mon, 28 Oct 2024 08:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Ky3-0005sO-VQ; Mon, 28 Oct 2024 08:19:15 +0000
Received: by outflank-mailman (input) for mailman id 826280;
 Mon, 28 Oct 2024 08:19:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5Ky2-0005sG-Vq
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 08:19:14 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f981f05-9505-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 09:19:12 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5cbb6166c06so3281998a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 01:19:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b302f03b5sm352050466b.166.2024.10.28.01.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 01:19:10 -0700 (PDT)
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
X-Inumbo-ID: 4f981f05-9505-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730103551; x=1730708351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2lYoNHPqNc7F4/2LKfFO/lqz5PKZtAbIOno/fDugc98=;
        b=e5FhoO9DhWjI7NQ9Hn/+sm7akqKzrRtYyjMFKjLv5YCBLmlU3Pn4jbYNCpMVLFk6Pw
         kZILMWfmyzT5Z1ktcIj/33zi3bRAA9rfznyTNxQt38jtJok8sYr+2Gy0wCIB7oQTsZkP
         oFNownnYAVGN4FK69os8fi9cZBVj0GJBgyveUBhAkKKDkRBBUXUqMMgdwN/P0Text3Ut
         HVRcoOspNmHEoxHlytcqzXgnnfVZ4o7lkxbCHrjqR8MX1u9YSFCmHjjJHoY8UyjowdeX
         qeA3LfJpjSwOz8q5+uInbZa/bnvvihf9tUJGoPYtnlMV/hH7qsIhHs0sbWxfU/WUbyMF
         QDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730103551; x=1730708351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lYoNHPqNc7F4/2LKfFO/lqz5PKZtAbIOno/fDugc98=;
        b=Spu7PxNf1EF79XT/b9xnhTHypDTy8tWKvA1q/2yOk9d8X+zZfJcHMu39LShsTQR7Xt
         PR6qZfj8pmVUQKcfP6JLWgVZOaooqKju9qAOQa698k5Gbql2tboUVrkt+qhp0iLCTvFO
         0u2sd2wiqlZFywR4lGhR+9oVr7XW1qnxm5NulpPOXnW9Wk0Qusum689Dwxsb0KxRReET
         k+bQAlPev+o6lCXDJ7hnR9YVdzSrRRygLfrqdGNTRXangLybXijJr02X4R80CHns9zIK
         YAIC6xqeWZIkVnizFgrWdsga9UQzCV+eFDwBnfxXeVLfDjuox2TDTHgpcmTQ52NzA5Cq
         XY0g==
X-Forwarded-Encrypted: i=1; AJvYcCVn4S7wpZZ5vXKb9fgbuOfBSz99sIi8jPBN/BwrnLGoT4+45vH1kZ+CwpwethHfQxg2aYQduSJol80=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztmICwpehFfP0YwFs5900cYyvbtYgmvMyJJa0EAtVX/WhqCKUk
	gGiTmjWpAGPBaInWIV4BiqJ34NyFmrSgWddrl/IxlIqASlahD0SDBXOL98ryZA==
X-Google-Smtp-Source: AGHT+IGCt3DImz3TrlW5MpQ5kiIqaNS6P+9Yi1TM57vNc8UFNCvRZ3Ci/lVdnlqDD9WHW5y9HLI81A==
X-Received: by 2002:a17:907:6d0e:b0:a99:f0d0:4ce3 with SMTP id a640c23a62f3a-a9de5d97f44mr642472866b.17.1730103550873;
        Mon, 28 Oct 2024 01:19:10 -0700 (PDT)
Message-ID: <18bcb41c-bbbc-4f9c-b34d-1a9887025159@suse.com>
Date: Mon, 28 Oct 2024 09:19:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] xen/riscv: introduce setup_mm()
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
 <300a4a5911766d42ec01c3fcaee664d72b484296.1729068334.git.oleksii.kurochko@gmail.com>
 <37929e86-0394-499e-ada1-4686ff77d3f7@suse.com>
 <abc1c95497372f3a46b34c6694b75b4e1647d4b9.camel@gmail.com>
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
In-Reply-To: <abc1c95497372f3a46b34c6694b75b4e1647d4b9.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.10.2024 16:27, oleksii.kurochko@gmail.com wrote:
> On Thu, 2024-10-17 at 17:15 +0200, Jan Beulich wrote:
>> On 16.10.2024 11:15, Oleksii Kurochko wrote:
>>> +vaddr_t directmap_virt_end __read_mostly;
>>
>> __ro_after_init? And moved ahead of the identifier, just like ...
>>
>>> +/*
>>> + * Setup memory management
>>> + *
>>> + * RISC-V 64 has a large virtual address space (the minimum
>>> supported
>>> + * MMU mode is Sv39, which provides TBs of VA space).
>>> + * In the case of RISC-V 64, the directmap and frametable are
>>> mapped
>>> + * starting from physical address 0 to simplify the page_to_mfn(),
>>> + * mfn_to_page(), and maddr_to_virt() calculations, as there is no
>>> need
>>> + * to account for {directmap, frametable}_base_pdx in this setup.
>>> + */
>>> +void __init setup_mm(void)
>>
>> ... __init is placed e.g. here.
>>
>> It's also unclear why the variable needs to be non-static.
> As it could be use then for some ASSERT(), for example, in
> virt_to_page() as Arm or x86 do.

"Could be" is too little here. Misra dislikes identifiers which could
be static, but aren't. If it's not used right now (nor any time soon),
it should imo be static until a use appears requiring it to be globally
visible.

>>> +{
>>> +    const struct membanks *banks = bootinfo_get_mem();
>>> +    paddr_t ram_end = 0;
>>> +    paddr_t ram_size = 0;
>>> +    unsigned int i;
>>> +
>>> +    /*
>>> +     * We need some memory to allocate the page-tables used for
>>> the directmap
>>> +     * mappings. But some regions may contain memory already
>>> allocated
>>> +     * for other uses (e.g. modules, reserved-memory...).
>>> +     *
>>> +     * For simplicity, add all the free regions in the boot
>>> allocator.
>>> +     */
>>> +    populate_boot_allocator();
>>> +
>>> +    total_pages = 0;
>>> +
>>> +    for ( i = 0; i < banks->nr_banks; i++ )
>>> +    {
>>> +        const struct membank *bank = &banks->bank[i];
>>> +        paddr_t bank_end = bank->start + bank->size;
>>> +
>>> +        ram_size = ram_size + bank->size;
>>> +        ram_end = max(ram_end, bank_end);
>>> +    }
>>> +
>>> +    setup_directmap_mappings(PFN_DOWN(ram_end));
>>
>> While you may want to use non-offset-ed mappings, I can't see how you
>> can
>> validly map just a single huge chunk, no matter whether there are
>> holes
>> in there. Such holes could hold MMIO regions, which I'm sure would
>> require
>> more careful mapping (to avoid cacheable accesses, or even
>> speculative
>> ones).
> My intention was to avoid subraction of directmap_start ( = ram_start )
> in maddr_to_virt() to have less  operations during maddr to virt
> calculation:
>    static inline void *maddr_to_virt(paddr_t ma)
>    {
>        /* Offset in the direct map, accounting for pdx compression */
>        unsigned long va_offset = maddr_to_directmapoff(ma);
>    
>        ASSERT(va_offset < DIRECTMAP_SIZE);
>    
>        return (void *)(DIRECTMAP_VIRT_START /* - directmap_start */ +
>    va_offset);
>    }
> But it seems I don't have any chance to avoid that because of mentioned
> by you reasons... Except probably to have a config which will hard code
> RAM_START for each platform ( what on other hand will make Xen less
> flexible in some point ).
> Does it make sense to have a config instead of identifying ram_start in
> runtime?

I don't think building Xen for just one (kind of) platform is going to be
overly useful (except maybe for development purposes, yet the goal ought
to be to be flexible, and hence it may be a bad idea even while developing
new code).

Jan

