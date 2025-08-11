Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B400B21015
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 17:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077782.1438806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUhO-0004H3-IT; Mon, 11 Aug 2025 15:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077782.1438806; Mon, 11 Aug 2025 15:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulUhO-0004El-FW; Mon, 11 Aug 2025 15:44:34 +0000
Received: by outflank-mailman (input) for mailman id 1077782;
 Mon, 11 Aug 2025 15:44:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulUhM-0004Ed-Da
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 15:44:32 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0faa62c8-76ca-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 17:44:26 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6157ed5dc51so6849706a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 08:44:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe7970sm18260768a12.31.2025.08.11.08.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 08:44:25 -0700 (PDT)
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
X-Inumbo-ID: 0faa62c8-76ca-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754927066; x=1755531866; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UXafO7uxTKUktMIwSK6ra5CRi8PNG11GR/ceZ/aySVk=;
        b=WCbQOkWt7fRefcg34upnypiq++R7VNsUrccpInLakCfWtbhKvoDrAoi0AjqaCfUfqB
         C012J3ImxuiMkamBXpKWrV+oUtDimV4Sa2C9jU3iP0YMxGyNv47k6eml7IZFu9xnOoz9
         /p+NY5xwkrUVjqTQzJqMyes1GBvM4OV0Vem/9i9WEHC+1M4yKA9ZiNAfuMoQo3odGPBh
         Oa8ZOya6lkj21Jznf0mgR4mJ6qIODfP7WhPPhHrjSBrPnVDktHDnQJQ7dkxpLUfiGMEO
         381AqxLayGdtxrK9/Jc5QuFAwsPvXLALAnTxABHhT8plby/j05SBORtfn8N9LQM1ERlt
         JSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927066; x=1755531866;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXafO7uxTKUktMIwSK6ra5CRi8PNG11GR/ceZ/aySVk=;
        b=fx0dReN1nUCoRn0xDMDk+2a9o5SAOdvCUf6B00qBi3nXdCcUX9NXxiXtZ05b967FfQ
         o31+FWIMgTZO4pPQeCjTPGMRyvsSp56Q2JGeuYurn9NIVS74h0UP1n7UQnPk3WTp7GzD
         nutr2r1TSxwckfC4vISfTcu8BlQu8zhRsnoO38vNxgesUh+2BXi3IlTV82pvfKHJn7uE
         0kpgG2ALiL2oLp8qz/V6TfgCSgWxOLVfQ1QLIxxOXf+1qNWdVt3hMGrwpi5hllW4/SvQ
         iwK+iGfw8qVAoUgz3ldM3Vs9mekbPUUcE1cp8WojGCRoux2KEe2LiviiN1G7VPZ5G1Xd
         p5Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVr7TeJPp3qZSkwZ+RYl1pxYQTOs1pGSUDa252SqBq6tn0TAWd8FUVI00U6z6TepSUOwsQ5tbgLCSA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuXpf8/vKOjjCJfpzuwl3RIx7NWt0lZZ8PlzHtf4FJvOkSEeYr
	qkkEWGUjqkxh0FDBqU85NeWGcMIr1TwhiPie4OQURoYPUejb5U3lzAD1FI6ge3Hjzw==
X-Gm-Gg: ASbGncvMMx9xltchFQ5jK2CMHZweBTiFgf5D5eOjtVflmId9SuoYANhFIuyJUq0I8u0
	ogx0gbj2tIeSgMrVkkXtlCmRAtbt+C9fpm5g3clv84MWTHXbTf2ynq3eGRkn44xs7ExzECxIkcT
	8YhVeYwdCAExJTf7LIu+YglVriOgU8exvqlp7VKtOxgnQH63gApSKCDZNVbmlROCSZ1JHg6G02Y
	ktdjvJwG8OkF7Gv0tl7eQoq3xBxGBa4dX8iQHwpbEdfv2UGKag0BIi7Yd8tSF19r2ln0TqgD+NP
	Nuco+Jqbymf71Q+NfjNXedMcFMzbmwUR9iUrtTM6bntPcnyRfQxGfypnrVgo7RLC0YYgH1nHh1S
	urLg2XswC2TipwWc4eR/Rl/pOpa3Bu4QNWtb3lASJcVrpnlYoYlKi8qiXkISx8v/No9O3DB/7Gf
	ZltJxkgmw=
X-Google-Smtp-Source: AGHT+IHMnuRY9TMGooUvfvZWDpMMSIKL8PKfwjMJmQD4PVHf3gOO0uJfCZN3x+nGfIBTDHk/LMOn0Q==
X-Received: by 2002:a05:6402:2111:b0:618:f34:f61a with SMTP id 4fb4d7f45d1cf-6180f34fb0dmr7850962a12.17.1754927066045;
        Mon, 11 Aug 2025 08:44:26 -0700 (PDT)
Message-ID: <12adb163-5f6b-4478-9592-7423b8db69a9@suse.com>
Date: Mon, 11 Aug 2025 17:44:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/20] xen/riscv: introduce metadata table to store P2M
 type
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <802d757c167121c0a5ae2e529f5a365f779c5e59.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <802d757c167121c0a5ae2e529f5a365f779c5e59.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> RISC-V's PTE has only two available bits that can be used to store the P2M
> type. This is insufficient to represent all the current RISC-V P2M types.
> Therefore, some P2M types must be stored outside the PTE bits.
> 
> To address this, a metadata table is introduced to store P2M types that
> cannot fit in the PTE itself. Not all P2M types are stored in the
> metadata table—only those that require it.
> 
> The metadata table is linked to the intermediate page table via the
> `struct page_info`'s list field of the corresponding intermediate page.
> 
> To simplify the allocation and linking of intermediate and metadata page
> tables, `p2m_{alloc,free}_table()` functions are implemented.
> 
> These changes impact `p2m_split_superpage()`, since when a superpage is
> split, it is necessary to update the metadata table of the new
> intermediate page table — if the entry being split has its P2M type set
> to `p2m_ext_storage` in its `P2M_TYPES` bits.

Oh, this was an aspect I didn't realize when commenting on the name of
the enumerator. I think you want to keep the name for the purpose here,
but you better wouldn't apply relational operators to it (and hence
have a second value to serve that purpose).

> In addition to updating
> the metadata of the new intermediate page table, the corresponding entry
> in the metadata for the original superpage is invalidated.
> 
> Also, update p2m_{get,set}_type to work with P2M types which don't fit
> into PTE bits.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

No Suggested-by: or anything?

> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -150,6 +150,15 @@ struct page_info
>              /* Order-size of the free chunk this page is the head of. */
>              unsigned int order;
>          } free;
> +
> +        /* Page is used to store metadata: p2m type. */

That's not correct. The page thus described is what the pointer below
points to. Here it's more like "Page is used as an intermediate P2M
page table".

> +        struct {
> +            /*
> +             * Pointer to a page which store metadata for an intermediate page
> +             * table.
> +             */
> +            struct page_info *metadata;
> +        } md;

In the description you say you would re-use the list field.

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -101,7 +101,16 @@ static int p2m_alloc_root_table(struct p2m_domain *p2m)
>  {
>      struct domain *d = p2m->domain;
>      struct page_info *page;
> -    const unsigned int nr_root_pages = P2M_ROOT_PAGES;
> +    /*
> +     * If the root page table starts at Level <= 2, and since only 1GB, 2MB,
> +     * and 4KB mappings are supported (as enforced by the ASSERT() in
> +     * p2m_set_entry()), it is necessary to allocate P2M_ROOT_PAGES for
> +     * the root page table itself, plus an additional P2M_ROOT_PAGES for
> +     * metadata storage. This is because only two free bits are available in
> +     * the PTE, which are not sufficient to represent all possible P2M types.
> +     */
> +    const unsigned int nr_root_pages = P2M_ROOT_PAGES *
> +                                       ((P2M_ROOT_LEVEL <= 2) ? 2 : 1);
>  
>      /*
>       * Return back nr_root_pages to assure the root table memory is also
> @@ -114,6 +123,23 @@ static int p2m_alloc_root_table(struct p2m_domain *p2m)
>      if ( !page )
>          return -ENOMEM;
>  
> +    if ( P2M_ROOT_LEVEL <= 2 )
> +    {
> +        /*
> +         * In the case where P2M_ROOT_LEVEL <= 2, it is necessary to allocate
> +         * a page of the same size as that used for the root page table.
> +         * Therefore, p2m_allocate_root() can be safely reused.
> +         */
> +        struct page_info *metadata = p2m_allocate_root(d);
> +        if ( !metadata )
> +        {
> +            free_domheap_pages(page, P2M_ROOT_ORDER);
> +            return -ENOMEM;
> +        }
> +
> +        page->v.md.metadata = metadata;

Don't you need to install such a link for every one of the 4 pages?

> @@ -198,24 +224,25 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>      return __map_domain_page(p2m->root + root_table_indx);
>  }
>  
> -static int p2m_set_type(pte_t *pte, p2m_type_t t)
> +static void p2m_set_type(pte_t *pte, const p2m_type_t t, const unsigned int i)
>  {
> -    int rc = 0;
> -
>      if ( t > p2m_ext_storage )
> -        panic("unimplemeted\n");
> +    {
> +        ASSERT(pte);
> +
> +        pte[i].pte = t;

What does i identify here?

> +    }
>      else
>          pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
> -
> -    return rc;
>  }
>  
> -static p2m_type_t p2m_get_type(const pte_t pte)
> +static p2m_type_t p2m_get_type(const pte_t pte, const pte_t *metadata,
> +                               const unsigned int i)
>  {
>      p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
>  
>      if ( type == p2m_ext_storage )
> -        panic("unimplemented\n");
> +        type = metadata[i].pte;
>  
>      return type;
>  }

Overall this feels pretty fragile, as the caller has to pass several values
which all need to be in sync with one another. If you ...

> @@ -265,7 +292,10 @@ static void p2m_set_permission(pte_t *e, p2m_type_t t)
>      }
>  }
>  
> -static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
> +static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t,
> +                              struct page_info *metadata_pg,
> +                              const unsigned int indx,
> +                              bool is_table)
>  {
>      pte_t e = (pte_t) { PTE_VALID };
>  
> @@ -285,12 +315,21 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
>  
>      if ( !is_table )
>      {
> +        pte_t *metadata = __map_domain_page(metadata_pg);

... map the page anyway, no matter whether ...

>          p2m_set_permission(&e, t);
>  
> +        metadata[indx].pte = p2m_invalid;
> +
>          if ( t < p2m_ext_storage )
> -            p2m_set_type(&e, t);
> +            p2m_set_type(&e, t, indx);
>          else
> -            panic("unimplemeted\n");
> +        {
> +            e.pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
> +            p2m_set_type(metadata, t, indx);
> +        }

... you'll actually use it, maybe best to map both pages at the same point?

And as said elsewhere, no, I don't think you want to use p2m_set_type() for
two entirely different purposes.

> @@ -323,22 +364,71 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
>      return pg;
>  }
>  
> +static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
> +
> +/*
> + * Allocate a page table with an additional extra page to store
> + * metadata for each entry of the page table.
> + * Link this metadata page to page table page's list field.
> + */
> +static struct page_info * p2m_alloc_table(struct p2m_domain *p2m)

Nit: Stray blank after * again.

> +{
> +    enum table_type
> +    {
> +        INTERMEDIATE_TABLE=0,

If you really think you need the "= 0", then please with blanks around '='.

> +        /*
> +         * At the moment, metadata is going to store P2M type
> +         * for each PTE of page table.
> +         */
> +        METADATA_TABLE,
> +        TABLE_MAX
> +    };
> +
> +    struct page_info *tables[TABLE_MAX];
> +
> +    for ( unsigned int i = 0; i < TABLE_MAX; i++ )
> +    {
> +        tables[i] = p2m_alloc_page(p2m);
> +
> +        if ( !tables[i] )
> +            goto out;
> +
> +        clear_and_clean_page(tables[i]);
> +    }
> +
> +    tables[INTERMEDIATE_TABLE]->v.md.metadata = tables[METADATA_TABLE];
> +
> +    return tables[INTERMEDIATE_TABLE];
> +
> + out:
> +    for ( unsigned int i = 0; i < TABLE_MAX; i++ )
> +        if ( tables[i] )

You didn't clear all of tables[] first, though. This kind of cleanup is
often better done as

    while ( i-- > 0 )
        ...

You don't even need an if() then, as you know allocations succeeded for all
earlier array slots.

> +            p2m_free_page(p2m, tables[i]);
> +
> +    return NULL;
> +}

I'm also surprised you allocate the metadata table no matter whether you'll
actually need it. That'll double your average paging pool usage, when in a
typical case only very few entries would actually require this extra
storage.

> @@ -453,10 +543,9 @@ static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
>  }
>  
>  /* Put any references on the page referenced by pte. */
> -static void p2m_put_page(const pte_t pte, unsigned int level)
> +static void p2m_put_page(const pte_t pte, unsigned int level, p2m_type_t p2mt)
>  {
>      mfn_t mfn = pte_get_mfn(pte);
> -    p2m_type_t p2m_type = p2m_get_type(pte);
>  
>      ASSERT(pte_is_valid(pte));
>  
> @@ -470,10 +559,10 @@ static void p2m_put_page(const pte_t pte, unsigned int level)
>      switch ( level )
>      {
>      case 1:
> -        return p2m_put_2m_superpage(mfn, p2m_type);
> +        return p2m_put_2m_superpage(mfn, p2mt);
>  
>      case 0:
> -        return p2m_put_4k_page(mfn, p2m_type);
> +        return p2m_put_4k_page(mfn, p2mt);
>      }
>  }

Might it be better to introduce this function in this shape right away, in
the earlier patch?

> @@ -690,18 +791,23 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>      {
>          /* We need to split the original page. */
>          pte_t split_pte = *entry;
> +        struct page_info *metadata = virt_to_page(table)->v.md.metadata;

This (or along these lines) is how I would have expected things to be done
elsewhere as well, limiting the amount of arguments you need to pass
around.

Jan

