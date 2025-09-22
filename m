Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A48B937FD
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 00:42:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128076.1468556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0pEM-0001vB-VI; Mon, 22 Sep 2025 22:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128076.1468556; Mon, 22 Sep 2025 22:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0pEM-0001sd-Rh; Mon, 22 Sep 2025 22:41:58 +0000
Received: by outflank-mailman (input) for mailman id 1128076;
 Mon, 22 Sep 2025 22:41:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v0pEK-0001sW-VS
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 22:41:57 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 565fc3e5-9805-11f0-9809-7dc792cee155;
 Tue, 23 Sep 2025 00:41:54 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3f0134ccc0cso3785953f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Sep 2025 15:41:54 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3306061ab62sm14369871a91.5.2025.09.22.15.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 15:41:52 -0700 (PDT)
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
X-Inumbo-ID: 565fc3e5-9805-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758580913; x=1759185713; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C1Bsn0OY3Xig92N/mGRRCwjcnHQL4lADUat1Obrt33Q=;
        b=NsAdaYuq+AIqqDH3+nxubW1ejhbOzCrPsp+lJrp4jHIaKsWNuSNzIB80S2y0FT+Mq6
         jhUceLMGbjQio+RYizqVJppZbfvX7keo7mhsjljPdfSXxzoUrsu3yqCZX7ZqYnq8jNFH
         37PRpYmz/Uiqh76GQ94qvleGVOl6/kpVAsKV2Na5r+b5jay3m+vnHtFH0DvUzmnVXwyC
         XnqUTrk6L9dvNsAX1mBFYt7JaceLUNTPCme9fTntaNAIKEYkreuLBw8ogb8ra0J+ttCO
         T1z1yq52JgoJh91CZJaxOkPhggCByzY8A663DttLTKQfXrm/CGLnWouGZpcB5EqrNTBc
         YPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758580913; x=1759185713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1Bsn0OY3Xig92N/mGRRCwjcnHQL4lADUat1Obrt33Q=;
        b=LUWlLGC6KVFfy3Tx1VdKonGc6v2d4XKwfXF3BbN8MSjL/fANaf8v/MCYk+PIQcT4zM
         g4l/HcpK5i6y8bTSStnq3nmKZYnlIWYxKh3UDvAdu8o4nptwBVGo5zBh296pazqQdJoC
         T9py0wOaKj6KFNmEreDypWc3GHKzeC1uvr8mV2/jDIyWJJ/WWPEJTJVnOyyuGpsnkn5B
         gBBxXCFQutJ6LxIC12axBhDqoBARgart/WIce1l10ldI2s/hioNPqTlxz1nNIs5QrdmM
         8b1+xyKFUmKu73qY5MzVFl4X5bxsxXoT+iKPChn8GvvUBzo6oY15ztZ8xalnukEaPDDn
         UAUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCv6/eSbR3ciqf087Bei+g/4vqCrzUUGN/9MC57R0VcaIMqujYQGymKUQj/LBYTz181EQWZQ7lkCo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOWdJAH+b7+UnjHk74d6kM+FgQtHkGJiCB6OPgVNRXRGeGQIXs
	HWIBhsCpDIbEMLE/yM4Jznbxxrh7su/PPatRSGCaaN1i+64raGMOjzgXnajCddDZ4A==
X-Gm-Gg: ASbGncv9DsC9NT6lNvw4WJU5bv4ck9+5t6afh2s6hHrubsW/K74C7IHaDAHTRke9S+V
	/gwOrxnb85sAz6D1WUxtgHgiM9jtZEbcg+Z7P5LRi+CBSGjE1P5oyMeCg9E8KjsuqvyDHumK2f7
	2FCWWXh94g7LzqUOKWyF0dtQkaoX7JDY/Xg00darX1QbVsrPC+/rUMozBKURwvrLAo+ikijgXND
	ImN0yX5EgjR0F4tf5BXfx2WCTTJ/2xiG95ywAEepGOEL+cXpOW0AgyPzlQzdTc8+MWb7IwJtSsS
	GRijn598yr6DufTTO1EfqMqtmybql+dBsSvv+psFJSf0cOL8Xo4sDw8xDx4vYYuZgrZfQGJtFqt
	KRVZcq2PB8yOqlxZhwmqpUuBStFO3diW1
X-Google-Smtp-Source: AGHT+IG5pKDyHFkSQE+LiQfWe1zbzS9V8i8LkZTWZenbeTMSS9QRJVLZ4H7SLaRWlZbQgdKmn8pahA==
X-Received: by 2002:a5d:5d0b:0:b0:3e7:68b2:c556 with SMTP id ffacd0b85a97d-405c523c775mr230295f8f.26.1758580913469;
        Mon, 22 Sep 2025 15:41:53 -0700 (PDT)
Message-ID: <4c2eb99b-3e88-4364-8c3f-7c70d4064ef4@suse.com>
Date: Tue, 23 Sep 2025 00:41:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/18] xen/riscv: introduce metadata table to store P2M
 type
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <f1e346b228ea76eb5bd988e8aab0062cbea58c9d.1758145428.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f1e346b228ea76eb5bd988e8aab0062cbea58c9d.1758145428.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.09.2025 23:55, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -149,6 +149,15 @@ struct page_info
>              /* Order-size of the free chunk this page is the head of. */
>              unsigned int order;
>          } free;
> +
> +        /* Page is used as an intermediate P2M page table */
> +        struct {
> +            /*
> +             * Pointer to a page which store metadata for an intermediate page
> +             * table.
> +             */
> +            struct page_info *metadata;

Any reason for this to not be "page" or "pg"? The metadata aspect is already
covered ...

> +        } md;

... by the "md" here.

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -16,6 +16,16 @@
>  #include <asm/paging.h>
>  #include <asm/riscv_encoding.h>
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
>  unsigned long __ro_after_init gstage_mode;
>  unsigned int __ro_after_init gstage_root_level;
>  
> @@ -289,24 +299,98 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>      return __map_domain_page(p2m->root + root_table_indx);
>  }
>  
> -static int p2m_set_type(pte_t *pte, p2m_type_t t)
> +static struct page_info * p2m_alloc_table(struct p2m_domain *p2m);

Nit: Stray blank again.

> +/*
> + * `pte` – PTE entry for which the type `t` will be stored.
> + *
> + * If `t` is `p2m_ext_storage`, both `ctx` and `p2m` must be provided;
> + * otherwise, they may be NULL.
> + */
> +static void p2m_set_type(pte_t *pte, const p2m_type_t t,
> +                         struct p2m_pte_ctx *ctx,
> +                         struct p2m_domain *p2m)
>  {
> -    int rc = 0;
> +    /*
> +    * For the root page table (16 KB in size), we need to select the correct
> +    * metadata table, since allocations are 4 KB each. In total, there are
> +    * 4 tables of 4 KB each.
> +    * For none-root page table index of ->pt_page[] will be always 0 as
> +    * index won't be higher then 511. ASSERT() below verifies that.
> +    */
> +    struct page_info **md_pg =
> +        &ctx->pt_page[ctx->index / PAGETABLE_ENTRIES].v.md.metadata;
> +    pte_t *metadata = NULL;
> +
> +     /* Be sure that an index correspondent to page level is passed. */
> +    ASSERT(ctx->index <= P2M_PAGETABLE_ENTRIES(ctx->level));

Doesn't this need to be < ?

> +    if ( !*md_pg && (t >= p2m_first_external) )
> +    {
> +        /*
> +         * Ensure that when `t` is stored outside the PTE bits
> +         * (i.e. `t == p2m_ext_storage` or higher),
> +         * both `ctx` and `p2m` are provided.
> +         */
> +        ASSERT(p2m && ctx);

Imo this would want to be checked whenever t > p2m_first_external, no
matter whether a metadata page was already allocated.

> -    if ( t > p2m_first_external )
> -        panic("unimplemeted\n");
> -    else
> +        if ( ctx->level <= P2M_SUPPORTED_LEVEL_MAPPING )
> +        {
> +            struct domain *d = p2m->domain;
> +
> +            *md_pg = p2m_alloc_table(p2m);
> +            if ( !*md_pg )
> +            {
> +                printk("%s: can't allocate extra memory for dom%d\n",
> +                        __func__, d->domain_id);
> +                domain_crash(d);
> +            }
> +        }
> +        else
> +            /*
> +             * It is not legal to set a type for an entry which shouldn't
> +             * be mapped.
> +             */
> +            ASSERT_UNREACHABLE();

Something not being legal doesn't mean it can't happen. Imo in this case
BUG_ON() (in place of the if() above) would be better.

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
> +    }
> +    else
> +    {
> +        pte->pte |= MASK_INSR(p2m_ext_storage, P2M_TYPE_PTE_BITS_MASK);
> +
> +        metadata[ctx->index].pte = t;

Afaict metadata can still be NULL when you get here.

> +    }
> +
> +    if ( metadata )
> +        unmap_domain_page(metadata);

According to the x86 implementation, passing NULL here ought to be fine,
so no if() needed.

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
> +        pte_t *md = __map_domain_page(ctx->pt_page->v.md.metadata);

Pointer-to-const?

> +        type = md[ctx->index].pte;
> +        unmap_domain_page(ctx->pt_page->v.md.metadata);

I'm pretty sure you want to pass md here, not the pointer you passed
into __map_domain_page().

> @@ -381,7 +465,10 @@ static void p2m_set_permission(pte_t *e, p2m_type_t t)
>      }
>  }
>  
> -static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
> +static pte_t p2m_pte_from_mfn(const mfn_t mfn, const p2m_type_t t,
> +                              struct p2m_pte_ctx *p2m_pte_ctx,
> +                              const bool is_table,

Do you really need both "is_table" and the context pointer? Couldn't
the "is intermediate page table" case be identified by a NULL context
and/or p2m pointer?

Also why "const" all of the sudden?

> @@ -435,22 +527,47 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
>      return pg;
>  }
>  
> +static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg);
> +
> +/*
> + * Allocate a page table with an additional extra page to store
> + * metadata for each entry of the page table.

Isn't this stale now? At which point the question is whether ...

> + * Link this metadata page to page table page's list field.
> + */
> +static struct page_info *p2m_alloc_table(struct p2m_domain *p2m)
> +{
> +    struct page_info *page_tbl = p2m_alloc_page(p2m);
> +
> +    if ( !page_tbl )
> +        return NULL;
> +
> +    clear_and_clean_page(page_tbl, p2m->clean_dcache);
> +
> +    return page_tbl;
> +}

... the function is needed in the first place.

> +/*
> + * Free page table's page and metadata page linked to page table's page.
> + */
> +static void p2m_free_table(struct p2m_domain *p2m, struct page_info *tbl_pg)
> +{
> +    ASSERT(tbl_pg->v.md.metadata);

Why, when you no longer unconditionally alloc that page?

> +    if ( tbl_pg->v.md.metadata )
> +        p2m_free_page(p2m, tbl_pg->v.md.metadata);
> +    p2m_free_page(p2m, tbl_pg);
> +}
> +
>  /*
>   * Allocate a new page table page with an extra metadata page and hook it
>   * in via the given entry.
>   */

This comment looks to have been inapplicable already when it was introduced.

>  static int p2m_create_table(struct p2m_domain *p2m, pte_t *entry)
>  {
> -    struct page_info *page;
> +    struct page_info *page = p2m_alloc_table(p2m);
>  
>      ASSERT(!pte_is_valid(*entry));
>  
> -    page = p2m_alloc_page(p2m);
> -    if ( page == NULL )
> -        return -ENOMEM;
> -
> -    clear_and_clean_page(page, p2m->clean_dcache);
> -
>      p2m_write_pte(entry, page_to_p2m_table(page), p2m->clean_dcache);
>  
>      return 0;

As per above I don't think any change is needed here.

> @@ -629,7 +748,7 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
>           * has failed (error case).
>           * So, at worst, the spurious mapcache invalidation might be sent.
>           */
> -        if ( p2m_is_ram(p2m_get_type(p2m, entry)) &&
> +        if ( p2m_is_ram(p2mt) &&
>               domain_has_ioreq_server(p2m->domain) )
>              ioreq_request_mapcache_invalidate(p2m->domain);
>  #endif

This change wants making right in the earlier patch, where "p2mt" is
being introduced.

> @@ -639,9 +758,21 @@ static void p2m_free_subtree(struct p2m_domain *p2m,
>          return;
>      }
>  
> -    table = map_domain_page(pte_get_mfn(entry));
> +    mfn = pte_get_mfn(entry);
> +    ASSERT(mfn_valid(mfn));
> +    table = map_domain_page(mfn);
> +    pg = mfn_to_page(mfn);
> +
>      for ( i = 0; i < P2M_PAGETABLE_ENTRIES(level); i++ )
> -        p2m_free_subtree(p2m, table[i], level - 1);
> +    {
> +        struct p2m_pte_ctx tmp_ctx = {
> +            .pt_page = pg,
> +            .index = i,
> +            .level = level -1

Nit: Missing blank after - . Also it is generally better to end such
initialization with a comma.

> @@ -707,6 +834,22 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>          pte = *entry;
>          pte_set_mfn(&pte, mfn_add(mfn, i << level_order));
>  
> +        if ( MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
> +        {
> +            struct p2m_pte_ctx p2m_pte_ctx = {
> +                .pt_page = tbl_pg,
> +                .index = offsets[level],
> +            };

Assuming using "level" is correct here (which it looks like it is), ...

> +            p2m_type_t old_type = p2m_get_type(pte, &p2m_pte_ctx);

... can't this move ahead of the loop?

> +            p2m_pte_ctx.pt_page = page;
> +            p2m_pte_ctx.index = i;
> +            p2m_pte_ctx.level = level;

Whereas - doesn't this need to be "next_level"?

> @@ -718,7 +861,7 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>       */
>      if ( next_level != target )
>          rv = p2m_split_superpage(p2m, table + offsets[next_level],
> -                                 level - 1, target, offsets);
> +                                 level - 1, target, offsets, page);

And btw (alredy in the earlier patch introducing this code) - why isn't
it "next_level" here, instead of "level - 1" (if already you have that
variable)?

> @@ -812,13 +955,21 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>      {
>          /* We need to split the original page. */
>          pte_t split_pte = *entry;
> +        struct page_info *tbl_pg = virt_to_page(table);

This isn't valid on a pointer obtained from map_domain_page().

> @@ -892,7 +1049,15 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>      if ( pte_is_valid(orig_pte) &&
>           (!mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) ||
>            (removing_mapping && mfn_eq(pte_get_mfn(*entry), _mfn(0)))) )
> -        p2m_free_subtree(p2m, orig_pte, level);
> +    {
> +        struct p2m_pte_ctx tmp_ctx = {
> +                .pt_page = virt_to_page(table),
> +                .index = offsets[level],
> +                .level = level,

Nit: Indentation is off here.

> @@ -1082,7 +1246,14 @@ static mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>      if ( pte_is_valid(entry) )
>      {
>          if ( t )
> -            *t = p2m_get_type(entry);
> +        {
> +            struct p2m_pte_ctx p2m_pte_ctx = {
> +                .pt_page = virt_to_page(table),
> +                .index = offsets[level],
> +            };
> +
> +            *t = p2m_get_type(entry,&p2m_pte_ctx);

Nit: Blank after comma please.

Jan

