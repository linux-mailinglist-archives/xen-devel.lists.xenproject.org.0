Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1615AF1147
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 12:10:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030862.1404531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWuPU-0000Dc-Th; Wed, 02 Jul 2025 10:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030862.1404531; Wed, 02 Jul 2025 10:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWuPU-0000BU-QZ; Wed, 02 Jul 2025 10:09:48 +0000
Received: by outflank-mailman (input) for mailman id 1030862;
 Wed, 02 Jul 2025 10:09:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWuPT-0000BH-4m
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 10:09:47 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adf5d276-572c-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 12:09:45 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so2836738f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 03:09:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af55c5837sm14267279b3a.116.2025.07.02.03.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 03:09:44 -0700 (PDT)
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
X-Inumbo-ID: adf5d276-572c-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751450985; x=1752055785; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S1mNb/xRGqBglA2c4xhM14ByXJI+Lwh4tusXa453DG8=;
        b=eBbuO+g/VEKLr9AJOxLUovqS6xHmAIApTPvcl7RPR3pctkxzeXhXzV6NAzKer0gjU+
         LdN8WEsSn5KH9UGCQudpbZi0suvIB6poKsXAQtIF8GWrdey5HpjZr9I9dc/GDsw6NjDr
         IDZ2qiD5geRELBlkFIBbex0QgbbJWqrldIq5kq3gczmEW8n5ap5ujbRyjavDpDm9ghLG
         zS94IoYUusNJA6E1jcn1ayTpruZYuCTBuVPZE7QIfKYCriosm2QM1roG0UkEBUvoCpCF
         aCfmxRuWwU3tKIFo/A3xafQ7FaCQH0Br/JhWcCUNef389u7zZS9m2rF7O7yLrHpYoZdp
         Od9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751450985; x=1752055785;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1mNb/xRGqBglA2c4xhM14ByXJI+Lwh4tusXa453DG8=;
        b=QaGnu85GtUBlDRj0BTi1/Ck6YvFgEn97hZjqFKep+yZmaFVBkqVzmInf/wEN8ZeZ4a
         6bBgvSY1cqbumfLPnIri2ay1HvVtGzAi4wxWDJ1vlk8ejHPTtzVK8GzjZbW8P9CD53i6
         S8HEC8HDDR4Hb+R48B9a25PED46VHbL2rdfvhuAH99DhZriQCvwM2j2LdrUcO5NKADNW
         loxFxlP2trvZurlXwFCSllayzM0/UlFx04xFG956GvLLuUSOuNOMewPmGh93l4NvHdrW
         S47O2XJvw1RlaFTakiOyC0VCQONBfM+q9n2yxVJhe20mWsu+yq3Re/oSsGPh3HukSjNz
         I2uA==
X-Forwarded-Encrypted: i=1; AJvYcCWO7bcJhqCBO+i892H5IMLpPUZRzIl1tx6D3MNrrlZqh7Iu3rjdwjxfnyq5i6xR0GH79+QpbVJkYKk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxVGCfWEZ8uALD+zVGNqKhv34etvp3fu/TgJb9M/R1v0/kPCfU
	/qnsu2JKNDAW4k8808ad3gK7X2OK4/9E/z+TDoU73WGxiiW8yuSCbbVEyCZopTYBVA==
X-Gm-Gg: ASbGncu7XGN9qxIMArHZBE7ImRb05epd1R0B5cu9JhVhmSM7eR8E8g9tukRYNSA8E6I
	vjztK66q/n/IaBQfi+pVBNSBDUTV2b5l9LW3zc4FTu8744KPvPKj3/s+U4JEyGgK6MKEqAoMA3D
	cEsgAssyh8ILnIHC5N99WKpawKBCBJ7a9G3Uy79t7SIiVbIhgSbkW5q6THNeE4QSmLGCz4ew7r7
	tr7U73C0ZArYzNeAfvd0EQbpiJFoz9BVozRJZCNY6QdjgHU1AM/14broOepu73i665kl2pPsIdj
	AsRTLm0ww+hK9+sVwIV1iOcNe+4hK9Qy/yu0Djveifrfv7NjGZsoQYEHtD/tI7r+L0pYwAAiiZv
	zHpVacSQwQL3LnpdgijJZV0HdPWKhhw/JfLVNLRi1w6nL+tA=
X-Google-Smtp-Source: AGHT+IFQNWK13V0Tretz5EoePiecu6F7l2hlP5kYH97KokEPKFI6s9sZD15foA9/1QlgtKFKvkwA+w==
X-Received: by 2002:a05:6000:2509:b0:3a4:d02e:84af with SMTP id ffacd0b85a97d-3b201e8374dmr1387644f8f.58.1751450985068;
        Wed, 02 Jul 2025 03:09:45 -0700 (PDT)
Message-ID: <aa769aa7-739c-4e59-8aea-d07398025b2f@suse.com>
Date: Wed, 2 Jul 2025 12:09:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/17] xen/riscv: implement mfn_valid() and page
 reference, ownership handling helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <50159d05e75c14ca62ee6cab5a4d30645981827a.1749555949.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <50159d05e75c14ca62ee6cab5a4d30645981827a.1749555949.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Oleksii Kurochko wrote:
> Implement the mfn_valid() macro to verify whether a given MFN is valid by
> checking that it falls within the range [start_page, max_page).
> These bounds are initialized based on the start and end addresses of RAM.
> 
> As part of this patch, start_page is introduced and initialized with the
> PFN of the first RAM page.
> 
> Also, after providing a non-stub implementation of the mfn_valid() macro,
> the following compilation errors started to occur:
>   riscv64-linux-gnu-ld: prelink.o: in function `__next_node':
>   /build/xen/./include/xen/nodemask.h:202: undefined reference to `page_is_ram_type'
>   riscv64-linux-gnu-ld: prelink.o: in function `get_free_buddy':
>   /build/xen/common/page_alloc.c:881: undefined reference to `page_is_ram_type'
>   riscv64-linux-gnu-ld: prelink.o: in function `alloc_heap_pages':
>   /build/xen/common/page_alloc.c:1043: undefined reference to `page_get_owner_and_reference'
>   riscv64-linux-gnu-ld: /build/xen/common/page_alloc.c:1098: undefined reference to `page_is_ram_type'
>   riscv64-linux-gnu-ld: prelink.o: in function `ns16550_interrupt':
>   /build/xen/drivers/char/ns16550.c:205: undefined reference to `get_page'
>   riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol `page_get_owner_and_reference' isn't defined
>   riscv64-linux-gnu-ld: final link failed: bad value
>   make[2]: *** [arch/riscv/Makefile:35: xen-syms] Error 1
> To resolve these errors, the following functions have also been introduced,
> based on their Arm counterparts:
> - page_get_owner_and_reference() and its variant to safely acquire a
>   reference to a page and retrieve its owner.
> - put_page() and put_page_nr() to release page references and free the page
>   when the count drops to zero.
>   For put_page_nr(), code related to static memory configuration is wrapped
>   with CONFIG_STATIC_MEMORY, as this configuration has not yet been moved to
>   common code. Therefore, PGC_static and free_domstatic_page() are not
>   introduced for RISC-V. However, since this configuration could be useful
>   in the future, the relevant code is retained and conditionally compiled.
> - A stub for page_is_ram_type() that currently always returns 0 and asserts
>   unreachable, as RAM type checking is not yet implemented.

How does this end up working when common code references the function?

> @@ -288,8 +289,12 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>  #define page_get_owner(p)    (p)->v.inuse.domain
>  #define page_set_owner(p, d) ((p)->v.inuse.domain = (d))
>  
> -/* TODO: implement */
> -#define mfn_valid(mfn) ({ (void)(mfn); 0; })
> +extern unsigned long start_page;
> +
> +#define mfn_valid(mfn) ({                                   \
> +    unsigned long mfn__ = mfn_x(mfn);                       \
> +    likely((mfn__ >= start_page) && (mfn__ < max_page));    \
> +})

I don't think you should try to be clever and avoid using __mfn_valid() here,
at least not without an easily identifiable TODO. Surely you've seen that both
Arm and x86 use it.

Also, according to all I know, likely() doesn't work very well when used like
this, except for architectures supporting conditionally executed insns (like
Arm32 or IA-64, i.e. beyond conditional branches). I.e. if you want to use
likely() here, I think you need two of them.

> @@ -525,6 +520,8 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
>  #error setup_{directmap,frametable}_mapping() should be implemented for RV_32
>  #endif
>  
> +unsigned long __read_mostly start_page;

Memory hotplug question again: __read_mostly or __ro_after_init?

> @@ -613,3 +612,91 @@ void __iomem *ioremap(paddr_t pa, size_t len)
>  {
>      return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
>  }
> +
> +int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
> +{
> +    ASSERT_UNREACHABLE();
> +
> +    return 0;
> +}
> +
> +static struct domain *page_get_owner_and_nr_reference(struct page_info *page,
> +                                                      unsigned long nr)
> +{
> +    unsigned long x, y = page->count_info;
> +    struct domain *owner;
> +
> +    /* Restrict nr to avoid "double" overflow */
> +    if ( nr >= PGC_count_mask )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return NULL;
> +    }

I question the validity of this, already in the Arm original: I can't spot
how the caller guarantees to stay below that limit. Without such an
(attempted) guarantee, ASSERT_UNREACHABLE() is wrong to use. All I can see
is process_shm_node() incrementing shmem_extra[].nr_shm_borrowers, without
any limit check.

> +    do {
> +        x = y;
> +        /*
> +         * Count ==  0: Page is not allocated, so we cannot take a reference.
> +         * Count == -1: Reference count would wrap, which is invalid.
> +         */

May I once again ask that you look carefully at comments (as much as at code)
you copy. Clearly this comment wasn't properly updated when the bumping by 1
was changed to bumping by nr.

> +        if ( unlikely(((x + nr) & PGC_count_mask) <= nr) )
> +            return NULL;
> +    }
> +    while ( (y = cmpxchg(&page->count_info, x, x + nr)) != x );
> +
> +    owner = page_get_owner(page);
> +    ASSERT(owner);
> +
> +    return owner;
> +}
> +
> +struct domain *page_get_owner_and_reference(struct page_info *page)
> +{
> +    return page_get_owner_and_nr_reference(page, 1);
> +}
> +
> +void put_page_nr(struct page_info *page, unsigned long nr)
> +{
> +    unsigned long nx, x, y = page->count_info;
> +
> +    do {
> +        ASSERT((y & PGC_count_mask) >= nr);
> +        x  = y;
> +        nx = x - nr;
> +    }
> +    while ( unlikely((y = cmpxchg(&page->count_info, x, nx)) != x) );
> +
> +    if ( unlikely((nx & PGC_count_mask) == 0) )
> +    {
> +#ifdef CONFIG_STATIC_MEMORY
> +        if ( unlikely(nx & PGC_static) )
> +            free_domstatic_page(page);
> +        else
> +#endif

Such #ifdef-ed-out code is liable to go stale. Minimally use IS_ENABLED().
Even better would imo be if you introduced a "stub" PGC_static, resolving
to 0 (i.e. for now unconditionally).

Jan

