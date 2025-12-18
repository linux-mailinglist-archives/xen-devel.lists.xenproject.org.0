Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F575CCBF4B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 14:17:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189583.1510327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWDs6-0005AK-V4; Thu, 18 Dec 2025 13:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189583.1510327; Thu, 18 Dec 2025 13:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWDs6-00058q-SL; Thu, 18 Dec 2025 13:16:46 +0000
Received: by outflank-mailman (input) for mailman id 1189583;
 Thu, 18 Dec 2025 13:16:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWDs5-00057w-Jl
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 13:16:45 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c538b080-dc13-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 14:16:32 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so5929265e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 05:16:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be279d6d8sm42337945e9.10.2025.12.18.05.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 05:16:31 -0800 (PST)
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
X-Inumbo-ID: c538b080-dc13-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766063791; x=1766668591; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pw2Id4jeiee2DdZWCrc3Q12FtfinQY6laWIk5vOqSHc=;
        b=Jt44lJE6pAu3tXfWyHJ4f9TG8PjNRHCDojrcQQAHZfw/+GjlObOVUAbeFWCKYJql4T
         BfZxCkvRT17Xyy6Yadjf0Dctt6sSCCc1IP60Qu5h16g8PSzmcQnS+Nf2l1hlDfOsKCkY
         42zBHXMzmkjAbCuDact5npqc3FjqJWvq+bUM+mluamCN2pZLhk7GdK9kOauCAxHM03vb
         8ca6U9J6/ySCELAWy7KVX6DqW2nuxsy1tw6f+/NEmJtZlmqh2/x199spn1wfwIvWD8Q3
         8N553D9x5GL0UKqGIUAV+LH3no4vjiRuUMNBWtUboDJ+MSYprzx05q5FMmKNiLYPcptp
         ByBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766063791; x=1766668591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pw2Id4jeiee2DdZWCrc3Q12FtfinQY6laWIk5vOqSHc=;
        b=GWuKXct0IZsq65N8ocnsqzSqXdat5m4z70JTDIJ39sBZjxDyFXhsndT6Acd+v42fDr
         N72mn2ewbzKS3uxVE+b+zK1FqP2AUCUb0dI27mqQR03POuiXkujntPZIefy+jYeslks9
         ORGXcWMIiuiJwyToY9QLVklqbM/WuB0l5wVn5gu5NHq2fcEwsQFz+OIM2FaLGsLXMrsy
         oMW0D6cslO0qJToUg/7hfp9acD8+mbX7CWQC6c+vXEifR3jqMgaYeWsu8HG5mHb03b7L
         zVst20QjnG/mI4reRWDOzaozhTRYKdF7IdXYpXoj8+L5gE0uZoMm7x88ONxHSxBbF3R9
         2MGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxjqw5x2LUoO9Oc3+KCg/xOmu353ZamS62VjvIVetgc6VsGLPtIO5meXPkwtcagRnGlpB9XOdbiY4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEzLsMueZVFCB5i5P8pNvFbL1JZtEilvUVzbjgyi6U3bmwgKDU
	VluMXoH3ZiA6aZKjukP963odNGcruwZ3XzAGcdV9FN99O6mt89xoIpWJO7N8xjj9rQ==
X-Gm-Gg: AY/fxX5n6ObGxos6cQnt/tdNHG9pjta0evk/cgZXubIiuCe53L6py/WXzaWykKOisPU
	5te97LJf1Fe44bJWY8x0stQcWiREJ9EgzHnfsir92Gb3QheVbFRHDc+v1Ud3A8KSZ/5lUP3OfBm
	YYtGqCry/QwWLkdXeP2nylB75jtJ6wbqaiwjNn1qy8OCh9EI7k7beyc5gd3a6Utw3WNcviapQJQ
	+Yi1YbSivSszxbI9IVb7bguHY1w4hndT3dT1HBrJe0aohWacvfURDXMFbmR5tWpDxh48NYC06ek
	Zortz3e8PyoILCkpFbcUgWdu2J7K55iF3jK2JjAv4EPZPUCZkPw6dpdX4kGWW67miNFmQgxd8aW
	wRpv6uec2gxoRwMDirKb2YuXQm52IgcWEo09hxr/YbEr2K60dN9Wfhyr4Sh9m7iEny3SpZYlGxx
	bf4qmhOB5SxGxO9ii9SXcp/8o146x4u+540YdwAscDNAB8KVsu4H0Hg3rfOh0Q0XHYPnujCPj05
	A4=
X-Google-Smtp-Source: AGHT+IE3pR0YX5eSvrLCSuA24PYk+aSuQZaQwKQV1bVt+fyHeXVsJahurfY33pxCACGBkw5bKsVNhA==
X-Received: by 2002:a05:600c:64c5:b0:477:b48d:ba7a with SMTP id 5b1f17b1804b1-47a8f915607mr214320665e9.32.1766063791500;
        Thu, 18 Dec 2025 05:16:31 -0800 (PST)
Message-ID: <c7a00f3e-cbbf-46b3-8d37-ed4565a9314a@suse.com>
Date: Thu, 18 Dec 2025 14:16:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 18/19] xen/riscv: introduce metadata table to store P2M
 type
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
 <b1e4ed0bb4e2f47a7cdb6afe4b9b05462e00fc84.1765879052.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b1e4ed0bb4e2f47a7cdb6afe4b9b05462e00fc84.1765879052.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.12.2025 17:55, Oleksii Kurochko wrote:
> @@ -370,24 +396,101 @@ static struct page_info *p2m_alloc_page(struct p2m_domain *p2m)
>      return pg;
>  }
>  
> -static int p2m_set_type(pte_t *pte, p2m_type_t t)
> +/*
> + * `pte` – PTE entry for which the type `t` will be stored.
> + *
> + * If `t` is `p2m_ext_storage`, both `ctx` and `p2m` must be provided.

Stale comment? There's no ...

> + */
> +static void p2m_set_type(pte_t *pte, p2m_type_t t,
> +                         const struct p2m_pte_ctx *ctx)

... "p2m" among the parameters anymore. Furthermore, would any caller pass in
p2m_ext_storage? Judging from the code you may mean "If `t` is greater or
equal to `p2m_first_external` ..."

>  {
> -    int rc = 0;
> +    struct page_info **md_pg;
> +    struct md_t *metadata = NULL;
>  
> -    if ( t > p2m_first_external )
> -        panic("unimplemeted\n");
> -    else
> -        pte->pte |= MASK_INSR(t, P2M_TYPE_PTE_BITS_MASK);
> +    /*
> +     * It is sufficient to compare ctx->index with PAGETABLE_ENTRIES because,
> +     * even for the p2m root page table (which is a 16 KB page allocated as
> +     * four 4 KB pages), calc_offset() guarantees that the page-table index
> +     * will always fall within the range [0, 511].
> +     */
> +    ASSERT(ctx && ctx->index < PAGETABLE_ENTRIES);
>  
> -    return rc;
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

With this, ...

> +        if ( ctx->level <= P2M_MAX_SUPPORTED_LEVEL_MAPPING )

... this isn't needed (dead code). Things would be different with ASSERT().

Also, isn't this a requirement independent of P2M type? In which case it should
be moved out of the if()? Yet then, further code in the function (including in
the body of this if()) doesn't look to be using ->level. Then why the check?

> @@ -477,7 +580,14 @@ static void p2m_set_permission(pte_t *e, p2m_type_t t)
>      }
>  }
>  
> -static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
> +/*
> + * If p2m_pte_from_mfn() is called with p2m_pte_ctx = NULL,
> + * it means the function is working with a page table for which the `t`
> + * should not be applicable. Otherwise, the function is handling a leaf PTE
> + * for which `t` is applicable.
> + */
> +static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t,
> +                              struct p2m_pte_ctx *p2m_pte_ctx)

Name the parameter just "ctx", as you have it elsewhere?

> @@ -679,12 +804,14 @@ static void p2m_free_page(struct p2m_domain *p2m, struct page_info *pg)
>  
>  /* Free pte sub-tree behind an entry */
>  static void p2m_free_subtree(struct p2m_domain *p2m,
> -                             pte_t entry, unsigned int level)
> +                             pte_t entry,
> +                             const struct p2m_pte_ctx *p2m_pte_ctx)

Same question here then.

> @@ -756,6 +891,10 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>      unsigned int next_level = level - 1;
>      unsigned int level_order = P2M_LEVEL_ORDER(next_level);
>  
> +    struct p2m_pte_ctx p2m_pte_ctx;
> +    /* Init with p2m_invalid just to make compiler happy. */
> +    p2m_type_t old_type = p2m_invalid;
> +
>      /*
>       * This should only be called with target != level and the entry is
>       * a superpage.
> @@ -777,6 +916,24 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, pte_t *entry,
>  
>      table = __map_domain_page(page);
>  
> +    p2m_pte_ctx.p2m = p2m;

To play safe and have all struct fields initialized (all others implicitly),
better make this the initializer of the variable? Then you could shorten ...

> +    if ( MASK_EXTR(entry->pte, P2M_TYPE_PTE_BITS_MASK) == p2m_ext_storage )
> +    {
> +        p2m_pte_ctx.pt_page = tbl_pg;
> +        p2m_pte_ctx.index = offsets[level];
> +        /*
> +         * It doesn't really matter what is a value for a level as
> +         * p2m_get_type() doesn't need it, so it is initialized just in case.
> +         */
> +        p2m_pte_ctx.level = level;

... the comment here and really omit the assignment of .level.

> @@ -840,6 +1004,7 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>       * are still allowed.
>       */
>      bool removing_mapping = mfn_eq(mfn, INVALID_MFN);
> +    struct p2m_pte_ctx tmp_ctx;
>      P2M_BUILD_LEVEL_OFFSETS(p2m, offsets, gfn_to_gaddr(gfn));
>  
>      ASSERT(p2m_is_write_locked(p2m));
> @@ -882,6 +1047,8 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>  
>      entry = table + offsets[level];
>  
> +    tmp_ctx.p2m = p2m;

Again better make this the variable's initializer?

> @@ -970,7 +1147,9 @@ static int p2m_set_entry(struct p2m_domain *p2m,
>      if ( pte_is_valid(orig_pte) &&
>           (!pte_is_valid(*entry) ||
>            !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte))) )
> -        p2m_free_subtree(p2m, orig_pte, level);
> +    {
> +        p2m_free_subtree(p2m, orig_pte, &tmp_ctx);
> +    }

Why braces all of the sudden?

Jan

