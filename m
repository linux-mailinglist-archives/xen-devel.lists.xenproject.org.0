Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADCCCB0167
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 14:48:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181727.1504737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSy4K-0007s2-JC; Tue, 09 Dec 2025 13:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181727.1504737; Tue, 09 Dec 2025 13:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSy4K-0007qU-GB; Tue, 09 Dec 2025 13:47:56 +0000
Received: by outflank-mailman (input) for mailman id 1181727;
 Tue, 09 Dec 2025 13:47:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sSjK=6P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSy4I-0007qO-SC
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 13:47:54 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8ba5e3c-d505-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 14:47:53 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477b91680f8so63053285e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 05:47:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d2226c5sm32041400f8f.23.2025.12.09.05.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 05:47:52 -0800 (PST)
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
X-Inumbo-ID: a8ba5e3c-d505-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765288073; x=1765892873; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UhBkyX5uhpGgafmHchtPC5kUvkaUK+PvnaNEIWnpNs4=;
        b=B8+9gkI8ogKEblP2awjnrwnnQmwYJKea03F1acgHpv9xBFnfs7F60qtMdtRiTFX/us
         1SGP8mnjGkTgy+hS48JRbUoAD8yQp2oVNs7qMZ6CW8iw76hCxVG9wjOEtB46QdPZEvvi
         qHSj22U87UpG4z2fL/25UJHv+KcwpvxCxCNVybnDSR9YlBbQPZoUh1XlfN33eCAIaVYL
         WnOsM/0YNqSVcIaai4xwgx+3CGPPUrpncxlDIXJp0HSPRlKojf/LYs263wOZPKts9BJv
         sLZA3GRMeL7dsUYJce8oWLpJIhS6IyU0bMMArydZx2/x1piKGwLKCjaOmcBgkAyNciCZ
         3ZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765288073; x=1765892873;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhBkyX5uhpGgafmHchtPC5kUvkaUK+PvnaNEIWnpNs4=;
        b=OzHBSGY7RACmZQPL4OIJiMqWb3EwiUzkDobVzQnkp6BhbuflnRxxR08U6bXB4NqJMr
         K3aJbUa2jsVEaJ+kiwmhaeMouOlaw/t7z22xAX4hjF0VRq/0y/cNGYCsug9wAcH6vEaA
         D0B0I6T8eFvtFXmY9pDRMXuzyXUnSHnLFl6ZoElWYNwhQjm5pExkch4INf2vdXOjUxAd
         4WDL/hs78CbeIiCk9sU6yilJ1QXJB4iUg9YeiFMFQI6RkJHb412eDm/X/d5uERNSYKBT
         OoEOHlsuHeh+co2fFfXX+r+C8Q4qboOX4i9W7hpHoXQiNI+DCzhw3ehzGHiAZQ9ZJuiy
         KRRg==
X-Forwarded-Encrypted: i=1; AJvYcCXMCb34YUf82OmZW3QI8gYuPLivwEs73gC1dSZeicBZ+kOuioaK2EXcReFEtgDnmOXR+kDtxpUJLD4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz38bnY8cAnW4s6GiqIt9ylSyYV6SDTGSGjX8G5gHMtShpT37mN
	ik3VybpQwWvGNbwBBUIudbbzgw5AXjEEgDIuFbvLcGNmZAOMbjTu6eitVwOG8NLrOg==
X-Gm-Gg: ASbGncvRFcJKYn2nHAapn1hNgSKsjDaX63bt5hrrJSkCBbMebX9tfssci8CvDbKjeUa
	qZr+kTQElbGyqFsN5eP2lmiW8riP6STvKzHTg/M2zCrfkZwCPvkMTTMDXN3xQPaa/x1ENPTxLY5
	T7EIVIfhlMc/jhBwsFcljfcybigvm4hWuHGB7+90KalQuKiNbCQUdhxIMdJbdUAib9CJLe/KSCk
	qT/kXSYEPZiLec31NCUuop90w8ogZgs3zk1pv8wwc9fT44+xthdbzwIK36V/MvQR9q/AnhYde17
	ZeFA1E7x3WqNDuwPdlDnXiQiSPuSOfsV2pw+Kv67eByscrq8f7xWS9jX3ey0LAPv4+2xBfHPnvE
	kw251VLIC4uZi5uoy8X33iuhl4jKpI8uEGe4TTpye3oZodyKR8Ie2gqztnUyvhg+a3FxIY3xaHj
	JsTozXKTFKCJu5yRyOmzy6Y+4qfQqdhTqc1nvcQmAYqDMbPv9TE/0v2V9RsPxTD5piyeJOIiCv0
	WI=
X-Google-Smtp-Source: AGHT+IFN/kqeNX4ziAJ622gdNkmATi7WrcL48broO2XkmVU8XmIt2oe5uRaIbw/GNIOxyCgKYgLYnw==
X-Received: by 2002:a05:600c:8b73:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-47939e48f87mr128302185e9.31.1765288072635;
        Tue, 09 Dec 2025 05:47:52 -0800 (PST)
Message-ID: <889df78f-7196-4b44-9558-fb83f432e18a@suse.com>
Date: Tue, 9 Dec 2025 14:47:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/19] xen/riscv: introduce metadata table to store P2M
 type
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <2c41da84b3e7fb0f6e6c3c856bff6edaf9e1d505.1763986955.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <2c41da84b3e7fb0f6e6c3c856bff6edaf9e1d505.1763986955.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.11.2025 13:33, Oleksii Kurochko wrote:
> @@ -374,24 +399,107 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
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
> +static void p2m_set_type(pte_t *pte, p2m_type_t t,
> +                         struct p2m_pte_ctx *ctx,
> +                         struct p2m_domain *p2m)

I assume you having struct p2m_domain * separate from ctx here is because the
"get" counterpart wouldn't need it. The same is true for the level member,
though. I wonder therefore whether putting p2m in pte_ctx as well wouldn't
make for an overall cleaner interface. (But this is truly just a thought; I
don#t mean to insist here.)

>  {
> -    int rc = 0;
> +    struct page_info **md_pg;
> +    struct md_t *metadata = NULL;
>  
> -    if ( t > p2m_first_external )
> -        panic("unimplemeted\n");
> -    else
> -        pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
> +    ASSERT(p2m);
>  
> -    return rc;
> +    /*
> +     * It is sufficient to compare ctx->index with PAGETABLE_ENTRIES because,
> +     * even for the p2m root page table (which is a 16 KB page allocated as
> +     * four 4 KB pages), calc_offset() guarantees that the page-table index
> +     * will always fall within the range [0, 511].
> +     */
> +    ASSERT(ctx && ctx->index < PAGETABLE_ENTRIES);
> +
> +    /*
> +     * At the moment, p2m_get_root_pointer() returns one of four possible p2m
> +     * root pages, so there is no need to search for the correct ->pt_page
> +     * here.
> +     * Non-root page tables are 4 KB pages, so simply using ->pt_page is
> +     * sufficient.
> +     */
> +    md_pg = &ctx->pt_page->v.md.pg;
> +
> +    if ( !*md_pg && (t >= p2m_first_external) )
> +    {
> +        BUG_ON(ctx->level > P2M_MAX_SUPPORTED_LEVEL_MAPPING);
> +
> +        if ( ctx->level <= P2M_MAX_SUPPORTED_LEVEL_MAPPING )
> +        {
> +            /*
> +             * Since p2m_alloc_page() initializes an allocated page with zeros, p2m_invalid
> +             * is expected to have the value 0 as well. This ensures that if a metadata
> +             * page is accessed before being properly initialized, the correct type
> +             * (p2m_invalid in this case) will be returned.
> +             */

Nit: Line length.

Also imo "properly initialized" is ambiguous. The clearing of the page can already
count as such. No access to the page may happen ahead of this clearing.

> +            BUILD_BUG_ON(p2m_invalid);
> +
> +            *md_pg = p2m_alloc_page(p2m);
> +            if ( !*md_pg )
> +            {
> +                printk("%pd: can't allocate metadata page\n", p2m->domain);
> +                domain_crash(p2m->domain);
> +
> +                return;
> +            }
> +        }
> +    }
> +
> +    if ( *md_pg )
> +        metadata = __map_domain_page(*md_pg);
> +
> +    if ( t >= p2m_first_external )
> +    {
> +        metadata[ctx->index].type = t;
> +
> +        t = p2m_ext_storage;
> +    }
> +    else if ( metadata )
> +        metadata[ctx->index].type = p2m_invalid;
> +
> +    pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
> +
> +    unmap_domain_page(metadata);
>  }

Just to mention (towards future work): Once a metadata page goes back to be
entirely zero-filled, it could as well be hooked off and returned to the pool.
Not doing so may mean detaining an unused page indefinitely.

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
> +    /*
> +     * Since the PTE is initialized with all zeros by default, p2m_invalid must
> +     * have the value 0. This ensures that if p2m_get_type() is called for a GFN
> +     * that hasn't been initialized, the correct type (p2m_invalid in this case)
> +     * will be returned. It also guarantees that metadata won't be touched when
> +     * the GFN hasn't been initialized.
> +     */
> +    BUILD_BUG_ON(p2m_invalid);

I don't think comment and BUILD_BUG_ON() need repeating here. That's relevant
only when (zero-)initializing the page.

>      if ( type == p2m_ext_storage )
> -        panic("unimplemented\n");
> +    {
> +        const struct md_t *md = __map_domain_page(ctx->pt_page->v.md.pg);
> +
> +        type = md[ctx->index].type;

In exchange you may want to assert here that the type found is
>= p2m_first_external (as - supposedly - guaranteed by p2m_set_type()).

> @@ -792,6 +952,13 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>          pte = *entry;
>          pte_set_mfn(&pte, mfn_add(mfn, i << level_order));
>  
> +        if ( MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
> +        {
> +            p2m_pte_ctx.index = i;
> +
> +            p2m_set_type(&pte, old_type, &p2m_pte_ctx, p2m);

In order to re-use p2m_pte_ctx across multiple iterations without fully re-
initializing, you want the respective parameter of p2m_set_type() be pointer-
to-const.

> @@ -894,13 +1061,21 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>      {
>          /* We need to split the original page. */
>          pte_t split_pte = *entry;
> +        struct page_info *tbl_pg = mfn_to_page(domain_page_map_to_mfn(table));
>  
>          ASSERT(pte_is_superpage(*entry, level));
>  
> -        if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets) )
> +        if ( !p2m_split_superpage(p2m, &split_pte, level, target, offsets,
> +                                  tbl_pg) )
>          {
> +            struct p2m_pte_ctx tmp_ctx = {
> +                .pt_page = tbl_pg,
> +                .index = offsets[level],
> +                .level = level,
> +            };

This, ...

> @@ -938,7 +1113,13 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>          p2m_clean_pte(entry, p2m->clean_dcache);
>      else
>      {
> -        pte_t pte = p2m_pte_from_mfn(mfn, t, false);
> +        struct p2m_pte_ctx tmp_ctx = {
> +            .pt_page = mfn_to_page(domain_page_map_to_mfn(table)),
> +            .index = offsets[level],
> +            .level = level,
> +        };

... this, and ...

> @@ -974,7 +1155,15 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>      if ( pte_is_valid(orig_pte) &&
>           (!pte_is_valid(*entry) ||
>            !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte))) )
> -        p2m_free_subtree(p2m, orig_pte, level);
> +    {
> +        struct p2m_pte_ctx tmp_ctx = {
> +            .pt_page = mfn_to_page(domain_page_map_to_mfn(table)),
> +            .index = offsets[level],
> +            .level = level,
> +        };

... this initializer are identical. Perhaps (sorry) it wasn't a good idea
after all to move the context variable from function scope to the more
narrow ones?

Jan

