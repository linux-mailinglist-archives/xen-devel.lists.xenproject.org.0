Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B195BB1C960
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 17:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071953.1435287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujgTw-0006pP-JG; Wed, 06 Aug 2025 15:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071953.1435287; Wed, 06 Aug 2025 15:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujgTw-0006mk-FX; Wed, 06 Aug 2025 15:55:12 +0000
Received: by outflank-mailman (input) for mailman id 1071953;
 Wed, 06 Aug 2025 15:55:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujgTu-0006ma-Vc
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 15:55:11 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id baa94805-72dd-11f0-a323-13f23c93f187;
 Wed, 06 Aug 2025 17:55:09 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-61580eb7995so168426a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 08:55:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6175ee53a1esm4837953a12.10.2025.08.06.08.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 08:55:08 -0700 (PDT)
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
X-Inumbo-ID: baa94805-72dd-11f0-a323-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754495709; x=1755100509; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nBrcVeEOKjMpJx0BDYd/GLhJIcFDGo13DW/xz+p/iMQ=;
        b=gufF9GidO9cs9QRcfsU7p0zuhat6Oy0s6pBnUrTtgbLdcHv4qkbqXtHjxNhLnhul00
         +/ZjIUGwn6rjNS4vrocvt/7R+Dj37AH8o0phZqfscrFk9jbWasN3WZVBnkcWHnaLpFuZ
         ivdiq7Ws+TQrV1kwBjxwiY1TiaBrvQkSF4DxsKF0pULbNoQjiHKFen9/MPrsQuG7qug1
         iXVVzDytkBJBnYf/uKm1wMODrHuCXU4B/wjo0oVOJxh9o66Q7pt/uA9QBHBETPVrDx0t
         DxLt3Jm15QBUtyeGKO7yZ8ULdK77oSw9HoCEWqkURjBIZoGcqoQC0V6h+KEaKGK+BLoR
         DLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754495709; x=1755100509;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBrcVeEOKjMpJx0BDYd/GLhJIcFDGo13DW/xz+p/iMQ=;
        b=qkghzrRu5Qbx5BzHh0Z2chRG4ZOkyQoDHbD4jjkxyRo506Q4iMUQl2dev8voMUxKIe
         T+7GW7UpkshwC4d+Nn/CtACjzmDqH2qN0yC6nODQUBhy0XVAfAabkwfstL7uRBQ7M3Vz
         FDg726x858akBAlAgLFU8JPAl7/P3Wvm0gvIjfYPllxQ9OOA/sAI0Il2eM95P06gCuTT
         XtONDcdhvq4UghgTAFCv50oFGdLxyDvAj+z4PzA4ZW2HCVdGNx3YOXmgTDW+lSYPAY9m
         YMprrVo+ruk7x1RtWhwcRdjOuCu9ENpHaRTSYwq1yF1tbSM/XmjkhstK4AcuGRg4h1jg
         +dlA==
X-Forwarded-Encrypted: i=1; AJvYcCXyj6KDngDn/eLkBFqXseulpInyG+bYowjIX8G2qG87mSe52g28lq14ftEXM4S56UzNGFWvP54gGcs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqyI//JR5uFm3Pzv4txjvGwUzraZRLp9+jV+wpoEfICjy631Oc
	WehOTFcfNvDOOTqRX6CmOV7JAOIw1I31QeJM5EI8xCnWufaCO3OMr3nWKiWFdaAY5w==
X-Gm-Gg: ASbGncuZfbrmR+HVZnEenf/ZgYYjrp/T5iPy751L5nOIy1AigoQ7G8/qXE5WCvlcmWg
	huCOlKz5J2VOpq6a8jbz/VbtqSS7gL+yfzRB+LHWseW/R3+Ar/B5Q6kodaTdtVYCBWurY34aTTP
	LZzkuSs7FIHUXXvpwpfZTC2fB4veAHAOKcAG7pkW2amAkWYf0/q9aWCGB75AGYnmo5iatVX/kh1
	zB1zmsRjGGm9CK9b0Qd2WgKd98UwUbdCM+L/nHnEMRdCuI299IUm9ggrJAvj5ipTuIQZyTewLbI
	JqMouVvAjZteiixh/LhizKp6wVILLAj+P4vamil4bdX6wmzeHUXaoSZqH+BzuxBuTVexbrm+IMr
	vBdXpmeENe6bAfNNEmkWF1upOVN9DRmugsqlfB+M7p3zSgmfTOD6o37FZCJMRhBPdkwEhgtRrzz
	1+pyp51hA=
X-Google-Smtp-Source: AGHT+IH56MoFg1l/9roICGzaF4ifaXFqYu19Qw+TeioT/NsSWCrG3mIxolTzeMggykSjZV7JoHMfuA==
X-Received: by 2002:a05:6402:34d2:b0:601:470b:6d47 with SMTP id 4fb4d7f45d1cf-617b377d61amr50331a12.1.1754495708922;
        Wed, 06 Aug 2025 08:55:08 -0700 (PDT)
Message-ID: <98dc796e-bb14-435e-8c19-53e5de60cc43@suse.com>
Date: Wed, 6 Aug 2025 17:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/20] xen/riscv: Implement p2m_free_subtree() and
 related helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <41845723a7b0e3efd09095d13e57aace6f7747ef.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <41845723a7b0e3efd09095d13e57aace6f7747ef.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -79,10 +79,20 @@ typedef enum {
>      p2m_ext_storage,    /* Following types'll be stored outsude PTE bits: */
>      p2m_grant_map_rw,   /* Read/write grant mapping */
>      p2m_grant_map_ro,   /* Read-only grant mapping */
> +    p2m_map_foreign_rw, /* Read/write RAM pages from foreign domain */
> +    p2m_map_foreign_ro, /* Read-only RAM pages from foreign domain */
>  } p2m_type_t;
>  
>  #define p2m_mmio_direct p2m_mmio_direct_io
>  
> +/*
> + * Bits 8 and 9 are reserved for use by supervisor software;
> + * the implementation shall ignore this field.
> + * We are going to use to save in these bits frequently used types to avoid
> + * get/set of a type from radix tree.
> + */
> +#define P2M_TYPE_PTE_BITS_MASK  0x300
> +
>  /* We use bitmaps and mask to handle groups of types */
>  #define p2m_to_mask(t_) BIT(t_, UL)
>  
> @@ -93,10 +103,16 @@ typedef enum {
>  #define P2M_GRANT_TYPES (p2m_to_mask(p2m_grant_map_rw) | \
>                           p2m_to_mask(p2m_grant_map_ro))
>  
> +                            /* Foreign mappings types */

Nit: Why so far to the right?

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -197,6 +197,16 @@ static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
>      return __map_domain_page(p2m->root + root_table_indx);
>  }
>  
> +static p2m_type_t p2m_get_type(const pte_t pte)
> +{
> +    p2m_type_t type = MASK_EXTR(pte.pte, P2M_TYPE_PTE_BITS_MASK);
> +
> +    if ( type == p2m_ext_storage )
> +        panic("unimplemented\n");

That is, as per p2m.h additions you pretend to add support for foreign types
here, but then you don't?

> @@ -248,11 +258,136 @@ static int p2m_next_level(struct p2m_domain *p2m, bool alloc_tbl,
>      return P2M_TABLE_MAP_NONE;
>  }
>  
> +static void p2m_put_foreign_page(struct page_info *pg)
> +{
> +    /*
> +     * It’s safe to call put_page() here because arch_flush_tlb_mask()
> +     * will be invoked if the page is reallocated before the end of
> +     * this loop, which will trigger a flush of the guest TLBs.
> +     */
> +    put_page(pg);
> +}

How can one know the comment is true? arch_flush_tlb_mask() still lives in
stubs.c, and hence what it is eventually going to do (something like Arm's
vs more like x86'es) is entirely unknown right now.

> +/* Put any references on the single 4K page referenced by mfn. */
> +static void p2m_put_4k_page(mfn_t mfn, p2m_type_t type)
> +{
> +    /* TODO: Handle other p2m types */
> +
> +    if ( p2m_is_foreign(type) )
> +    {
> +        ASSERT(mfn_valid(mfn));
> +        p2m_put_foreign_page(mfn_to_page(mfn));
> +    }
> +
> +    /*
> +     * Detect the xenheap page and mark the stored GFN as invalid.
> +     * We don't free the underlying page until the guest requested to do so.
> +     * So we only need to tell the page is not mapped anymore in the P2M by
> +     * marking the stored GFN as invalid.
> +     */
> +    if ( p2m_is_ram(type) && is_xen_heap_mfn(mfn) )
> +        page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);

Isn't this for grants? p2m_is_ram() doesn't cover p2m_grant_map_*.

> +}
> +
> +/* Put any references on the superpage referenced by mfn. */
> +static void p2m_put_2m_superpage(mfn_t mfn, p2m_type_t type)
> +{
> +    struct page_info *pg;
> +    unsigned int i;
> +
> +    ASSERT(mfn_valid(mfn));
> +
> +    pg = mfn_to_page(mfn);
> +
> +    for ( i = 0; i < XEN_PT_ENTRIES; i++, pg++ )
> +        p2m_put_foreign_page(pg);
> +}

In p2m_put_4k_page() you check the type, whereas here you don't.

> +/* Put any references on the page referenced by pte. */
> +static void p2m_put_page(const pte_t pte, unsigned int level)
> +{
> +    mfn_t mfn = pte_get_mfn(pte);
> +    p2m_type_t p2m_type = p2m_get_type(pte);
> +
> +    ASSERT(pte_is_valid(pte));
> +
> +    /*
> +     * TODO: Currently we don't handle level 2 super-page, Xen is not
> +     * preemptible and therefore some work is needed to handle such
> +     * superpages, for which at some point Xen might end up freeing memory
> +     * and therefore for such a big mapping it could end up in a very long
> +     * operation.
> +     */
> +    switch ( level )
> +    {
> +    case 1:
> +        return p2m_put_2m_superpage(mfn, p2m_type);
> +
> +    case 0:
> +        return p2m_put_4k_page(mfn, p2m_type);
> +    }

Yet despite the comment not even an assertion for level 2 and up?

>  /* Free pte sub-tree behind an entry */
>  static void p2m_free_subtree(struct p2m_domain *p2m,
>                               pte_t entry, unsigned int level)
>  {
> -    panic("%s: hasn't been implemented yet\n", __func__);
> +    unsigned int i;
> +    pte_t *table;
> +    mfn_t mfn;
> +    struct page_info *pg;
> +
> +    /* Nothing to do if the entry is invalid. */
> +    if ( !pte_is_valid(entry) )
> +        return;
> +
> +    if ( pte_is_superpage(entry, level) || (level == 0) )

Perhaps swap the two conditions around?

> +    {
> +#ifdef CONFIG_IOREQ_SERVER
> +        /*
> +         * If this gets called then either the entry was replaced by an entry
> +         * with a different base (valid case) or the shattering of a superpage
> +         * has failed (error case).
> +         * So, at worst, the spurious mapcache invalidation might be sent.
> +         */
> +        if ( p2m_is_ram(p2m_get_type(p2m, entry)) &&
> +             domain_has_ioreq_server(p2m->domain) )
> +            ioreq_request_mapcache_invalidate(p2m->domain);
> +#endif
> +
> +        p2m_put_page(entry, level);
> +
> +        return;
> +    }
> +
> +    table = map_domain_page(pte_get_mfn(entry));
> +    for ( i = 0; i < XEN_PT_ENTRIES; i++ )
> +        p2m_free_subtree(p2m, table[i], level - 1);

In p2m_put_page() you comment towards concerns for level >= 2; no similar
concerns for the resulting recursion here?

> +    unmap_domain_page(table);
> +
> +    /*
> +     * Make sure all the references in the TLB have been removed before
> +     * freing the intermediate page table.
> +     * XXX: Should we defer the free of the page table to avoid the
> +     * flush?
> +     */
> +    p2m_tlb_flush_sync(p2m);
> +
> +    mfn = pte_get_mfn(entry);
> +    ASSERT(mfn_valid(mfn));
> +
> +    pg = mfn_to_page(mfn);
> +
> +    page_list_del(pg, &p2m->pages);
> +    p2m_free_page(p2m, pg);

Once again I wonder whether this code path was actually tested: p2m_free_page()
also invokes page_list_del(), and double deletions typically won't end very
well.

Jan

