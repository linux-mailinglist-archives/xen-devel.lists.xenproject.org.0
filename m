Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BA6C52141
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 12:50:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159886.1488151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ9M4-0005gC-JU; Wed, 12 Nov 2025 11:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159886.1488151; Wed, 12 Nov 2025 11:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ9M4-0005dO-GE; Wed, 12 Nov 2025 11:49:40 +0000
Received: by outflank-mailman (input) for mailman id 1159886;
 Wed, 12 Nov 2025 11:49:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJ9M3-0005dH-Qz
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 11:49:39 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9fb710d-bfbd-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 12:49:37 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-64320b9bb4bso1045055a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 03:49:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f857839sm15877412a12.21.2025.11.12.03.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 03:49:35 -0800 (PST)
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
X-Inumbo-ID: a9fb710d-bfbd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762948176; x=1763552976; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dZsXBBltHKS7myVt68IUNVNFySdlGuq3PycWFZbim5c=;
        b=g7g2d3DUgazqtxpaY2t5zQxZZG4TQR6rmowAWlI8N56jvfN9QSw6tsXPiX/7gRI3+J
         r6wvII7AOGhEgjyuHDP+wfPdcP/tD6/BVb/tJZOw8EpDjNJ9xl6BpWU3nWE8v7MAw5vy
         Ue5y7RKZTm6DLhnEZFq9xk5cHoBceRJeszDwOPtWxD2BCcFCXrzkWY+1CFTDYZKPec/g
         KKwa/NUHHm4F+1MMTbh8/uDt1kBV6kvuTLjqIEQ0gspakLRoO2ljvIsRBrHrukqhHUMh
         bOfPW11bpOo0ZX4jb9R/swnvX0pSWVOI4Y+pKYkl922sNs69bGdkbZI1DNPCi9gJAh/+
         BnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762948176; x=1763552976;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZsXBBltHKS7myVt68IUNVNFySdlGuq3PycWFZbim5c=;
        b=PYjw1ZV12MWkJHhgzclS3kYFKy5MrrGg8gM8DbwvGwQ9M5IIZZ9wiWNd8zK1RYnwkK
         I+S9iJk5TmM3OJl6qsy2nTQQXjZM2nNwDF4Xchg620/HWHnQ7A8NsfF/j8JM81q94xqY
         kHrBsGkElHmpNZgjjkHU/yI7Qlo9u+EKuyHxpIRQeEN03Fhdn0MMTH6azsNZZBDiviIL
         VaBMvuzMBchmEHNrsOF4GUwI2uvDFJuSCsj6fwPG5CBP13glpV48hZk9A4H67qWM+9/H
         MZkjFjfZWzyPu88UrpGF1cBpZml2x2+HLfCt29MUsSFotTm0hrXJ2CUDfL0nxriGHihV
         8MvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX5lVF9sz7qQywjABltrPeF8S5z0DtTAm/tqORnokwRR7Jr5j7zY2bkyal4JfB51TZvIo2zL+CMdo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwCUDTdZFqYbaNwPFMZAqdQiqACo7zgeIcRHmyvA2qvBAnDRkB
	3RHvjGI238UL9bOQImDM/bAJ2jrm+nciWzld0dQz8j0EgH6LvRcQEOauR9tcsXMw1w==
X-Gm-Gg: ASbGncv8O9laGX3ndbPQUvvLADQhqeAcmZRuil6auXEmriIYs5eCRunxEuO2lpUP3T4
	3mGNaPK5bUCw2Ky7vPFmd1XJS7YO7yrjv9K4l+33CC6hIJ+02SbB2OWpGGSmaL1pcWjeYULUH+8
	7QODgVooGqXpYdu7woXKguQ3fdeh1EkPImTHubNmdIj0CvcDi5a6eF4UuLlgJNeP+STTghriiv8
	PetKwXjzOVf69b9gjVxJ9ckt8odNuTHuLzDqClk5ja+MpzICgLulxazCINjq8FLKXkyYwcjQoak
	NqmJj7PJKOvIMeHNIIaGPVqPv+0nwl2+kSAA/9YatD09/zLwiTpbRuTxKokP5ngcnUyYufJ4J0i
	QqPOPbNi1p1LZ4+Djb3fNm1tHQbr0YJ8GkxCar1plz+Lgn5oV6IwkwLEIuXaiXhBuNYp8YGYQGj
	8qZSm2RB6da+30CWdVyuE4pQgTSbqSW6iDB5QOYE6H4WgK+jlRdxCA4uCXJAM4xbnL6nPQ98iNO
	fM=
X-Google-Smtp-Source: AGHT+IEhD+rpqIQ+U3+sFldTkBv/zpilums/HcvjCoLD2OwMaeZNxyMhSArg6uUsOZdqxf83ZysamQ==
X-Received: by 2002:a50:a69a:0:b0:641:57e9:c426 with SMTP id 4fb4d7f45d1cf-642e27d453amr4741152a12.19.1762948176379;
        Wed, 12 Nov 2025 03:49:36 -0800 (PST)
Message-ID: <6a5a9f4e-1f0e-453f-b1d1-d0e2acf97e2a@suse.com>
Date: Wed, 12 Nov 2025 12:49:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 18/18] xen/riscv: introduce metadata table to store
 P2M type
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <d291d2efe7dcc6ddd3d16677a81c57d755c7ada2.1760974017.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d291d2efe7dcc6ddd3d16677a81c57d755c7ada2.1760974017.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.10.2025 17:58, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -20,6 +20,16 @@
>  
>  #define P2M_SUPPORTED_LEVEL_MAPPING 2
>  
> +/*
> + * P2M PTE context is used only when a PTE's P2M type is p2m_ext_storage.
> + * In this case, the P2M type is stored separately in the metadata page.
> + */
> +struct p2m_pte_ctx {
> +    struct page_info *pt_page;   /* Page table page containing the PTE. */
> +    unsigned int index;          /* Index of the PTE within that page. */
> +    unsigned int level;          /* Paging level at which the PTE resides. */
> +};
> +
>  unsigned char __ro_after_init gstage_mode;
>  unsigned int __ro_after_init gstage_root_level;
>  
> @@ -363,24 +373,89 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
>      return pg;
>  }
>  
> -static int p2m_set_type(pte_t *pte, p2m_type_t t)
> +/*
> + * `pte` – PTE entry for which the type `t` will be stored.
> + *
> + * If `t` is `p2m_ext_storage`, both `ctx` and `p2m` must be provided;
> + * otherwise, only p2m may be NULL.
> + */
> +static void p2m_set_type(pte_t *pte, const p2m_type_t t,
> +                         struct p2m_pte_ctx *ctx,
> +                         struct p2m_domain *p2m)
>  {
> -    int rc = 0;
> +    struct page_info **md_pg;
> +    pte_t *metadata = NULL;

I'm not convinced it is a good idea to re-use pte_t for this purpose. If you used
a separate type, and if then you defined that as a bitfield with only a few bits
dedicated to type, future changes (additions) may be quite a bit easier.

> -    if ( t > p2m_first_external )
> -        panic("unimplemeted\n");
> -    else
> +    ASSERT(p2m);
> +
> +     /* Be sure that an index correspondent to page level is passed. */
> +    ASSERT(ctx && ctx->index < P2M_PAGETABLE_ENTRIES(ctx->level));
> +
> +    /*
> +     * For the root page table (16 KB in size), we need to select the correct
> +     * metadata table, since allocations are 4 KB each. In total, there are
> +     * 4 tables of 4 KB each.
> +     * For none-root page table index of ->pt_page[] will be always 0 as
> +     * index won't be higher then 511. ASSERT() above verifies that.
> +     */
> +    md_pg = &ctx->pt_page[ctx->index / PAGETABLE_ENTRIES].v.md.pg;
> +
> +    if ( !*md_pg && (t >= p2m_first_external) )
> +    {
> +        BUG_ON(ctx->level > P2M_SUPPORTED_LEVEL_MAPPING);
> +
> +        if ( ctx->level <= P2M_SUPPORTED_LEVEL_MAPPING )
> +        {
> +            struct domain *d = p2m->domain;

This is (if at all) needed only ...

> +            *md_pg = p2m_alloc_page(p2m);
> +            if ( !*md_pg )
> +            {

... in this more narrow scope.

> +                printk("%s: can't allocate extra memory for dom%d\n",
> +                       __func__, d->domain_id);

The logging text isn't specific enough for my taste. For ordinary printk()s I'd
also recommend against use of __func__ (that's fine for dprintk()).

Also please us %pd in such cases.

> +                domain_crash(d);
> +
> +                return;
> +            }
> +        }
> +    }
> +
> +    if ( *md_pg )
> +        metadata = __map_domain_page(*md_pg);
> +
> +    if ( t < p2m_first_external )
> +    {
>          pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
>  
> -    return rc;
> +        if ( metadata )
> +            metadata[ctx->index].pte = p2m_invalid;

Shouldn't this be accompanied with a BUILD_BUG_ON(p2m_invalid), as otherwise
p2m_alloc_page()'s clearing of the page won't have the intended effect?

> +    }
> +    else
> +    {
> +        pte->pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
> +
> +        metadata[ctx->index].pte = t;

If you set t to p2m_ext_storage here, the pte->pte updating could be moved ...

> +    }

... here, covering both cases. Overally this may then be easier as

    if ( t >= p2m_first_external )
        metadata[ctx->index].pte = t;
    else if ( metadata )
        metadata[ctx->index].pte = p2m_invalid;

    pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);

Then raising the question whether it couldn't still be the real type that's
stored in metadata[] even for t < p2m_first_external. That woiuld further
reduce conditionals.

> +    unmap_domain_page(metadata);
>  }
>  
> -static p2m_type_t p2m_get_type(const pte_t pte)
> +/*
> + * `pte` -> PTE entry that stores the PTE's type.
> + *
> + * If the PTE's type is `p2m_ext_storage`, `ctx` should be provided;
> + * otherwise it could be NULL.
> + */
> +static p2m_type_t p2m_get_type(const pte_t pte, const struct p2m_pte_ctx *ctx)
>  {
>      p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
>  
>      if ( type == p2m_ext_storage )
> -        panic("unimplemented\n");
> +    {
> +        const pte_t *md = __map_domain_page(ctx->pt_page->v.md.pg);
> +        type = md[ctx->index].pte;
> +        unmap_domain_page(md);

Nit (style): Blank line please between declaration(s) and statement(s).

> @@ -470,7 +545,15 @@ static void p2m_set_permission(pte_t *e, p2m_type_t t)
>      }
>  }
>  
> -static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
> +/*
> + * If p2m_pte_from_mfn() is called with p2m_pte_ctx = NULL and p2m = NULL,
> + * it means the function is working with a page table for which the `t`
> + * should not be applicable. Otherwise, the function is handling a leaf PTE
> + * for which `t` is applicable.
> + */
> +static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t,
> +                              struct p2m_pte_ctx *p2m_pte_ctx,
> +                              struct p2m_domain *p2m)
>  {
>      pte_t e = (pte_t) { PTE_VALID };
>  
> @@ -478,7 +561,7 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
>  
>      ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK) || mfn_eq(mfn, INVALID_MFN));
>  
> -    if ( !is_table )
> +    if ( p2m_pte_ctx && p2m )
>      {

Maybe better

    if ( p2m_pte_ctx )
    {
        ASSERT(p2m);
        ...

(if you really think the 2nd check is needed)?

> @@ -506,12 +589,19 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
>  /* Generate table entry with correct attributes. */
>  static pte_t page_to_p2m_table(const struct page_info *page)
>  {
> -    /*
> -     * p2m_invalid will be ignored inside p2m_pte_from_mfn() as is_table is
> -     * set to true and p2m_type_t shouldn't be applied for PTEs which
> -     * describe an intermidiate table.
> -     */
> -    return p2m_pte_from_mfn(page_to_mfn(page), p2m_invalid, true);
> +    return p2m_pte_from_mfn(page_to_mfn(page), p2m_invalid, NULL, NULL);
> +}

How come the comment is dropped? If you deem it unecessary, why was it added
earlier in this same series?

> +static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
> +
> +/*
> + * Free page table's page and metadata page linked to page table's page.
> + */
> +static void p2m_free_table(struct p2m_domain *p2m, struct page_info *tbl_pg)
> +{
> +    if ( tbl_pg->v.md.pg )
> +        p2m_free_page(p2m, tbl_pg->v.md.pg);

To play safe, maybe better also clear tbl_pg->v.md.pg?

> @@ -749,6 +849,10 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>      unsigned int next_level = level - 1;
>      unsigned int level_order = P2M_LEVEL_ORDER(next_level);
>  
> +    struct p2m_pte_ctx p2m_pte_ctx;

I think this would better be one variable instance per scope where it's needed,
and then using an initzializer. Or else ...

> +    /* Init with p2m_invalid just to make compiler happy. */
> +    p2m_type_t old_type = p2m_invalid;
> +
>      /*
>       * This should only be called with target != level and the entry is
>       * a superpage.
> @@ -770,6 +874,19 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>  
>      table = __map_domain_page(page);
>  
> +    if ( MASK_EXTR(entry->pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
> +    {
> +        p2m_pte_ctx.pt_page = tbl_pg;
> +        p2m_pte_ctx.index = offsets[level];
> +        /*
> +         * It doesn't really matter what is a value for a level as
> +         * p2m_get_type() doesn't need it, so it is initialized just in case.
> +         */
> +        p2m_pte_ctx.level = level;
> +
> +        old_type = p2m_get_type(*entry, &p2m_pte_ctx);
> +    }
> +
>      for ( i = 0; i < P2M_PAGETABLE_ENTRIES(next_level); i++ )
>      {
>          pte_t *new_entry = table + i;
> @@ -781,6 +898,15 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>          pte = *entry;
>          pte_set_mfn(&pte, mfn_add(mfn, i << level_order));
>  
> +        if ( MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
> +        {
> +            p2m_pte_ctx.pt_page = page;
> +            p2m_pte_ctx.index = i;
> +            p2m_pte_ctx.level = next_level;

... why are the loop-invariat fields not filled ahead of the loop here?

> @@ -927,7 +1061,13 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>          p2m_clean_pte(entry, p2m->clean_dcache);
>      else
>      {
> -        pte_t pte = p2m_pte_from_mfn(mfn, t, false);
> +        struct p2m_pte_ctx tmp_ctx = {
> +            .pt_page = mfn_to_page(domain_page_map_to_mfn(table)),
> +            .index =  offsets[level],

Nit: Stray blank.

> @@ -1153,7 +1301,14 @@ static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>      if ( pte_is_valid(entry) )
>      {
>          if ( t )
> -            *t = p2m_get_type(entry);
> +        {
> +            struct p2m_pte_ctx p2m_pte_ctx = {
> +                .pt_page = mfn_to_page(domain_page_map_to_mfn(table)),
> +                .index = offsets[level],
> +            };

.level not being set here?

Jan

