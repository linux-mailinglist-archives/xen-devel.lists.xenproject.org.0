Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0D6C475BF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 15:53:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158401.1486730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vITGi-0002ns-KV; Mon, 10 Nov 2025 14:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158401.1486730; Mon, 10 Nov 2025 14:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vITGi-0002mi-Hq; Mon, 10 Nov 2025 14:53:20 +0000
Received: by outflank-mailman (input) for mailman id 1158401;
 Mon, 10 Nov 2025 14:53:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vITGh-0002mX-Dd
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 14:53:19 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe138d4d-be44-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 15:53:18 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b403bb7843eso563783766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 06:53:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bdbc95e4sm1133486866b.12.2025.11.10.06.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 06:53:16 -0800 (PST)
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
X-Inumbo-ID: fe138d4d-be44-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762786397; x=1763391197; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qWbUcsoDsnhykZseLVGlMZHroLW5Lmx6xTj8GoPQ6Bo=;
        b=OjX+omoo5cDj/yCJjxXugRP65GQk0Dk+sn/FGpnzN0QaptN+l1PD2nM7Q6SxviylSH
         CF7QYpMT/d2A5qzqDyS7GBrzJk0u8SWIkYRHFgzMPV4KepHgMtl1NQ613Rf68rG55imR
         I+uqCaNvJyPTNuxFWN3p7IuBHj5EKnl4/rA6DOEKzMU/VoN+pWV1q3Vu61B/4rnpEW+I
         03K9Z2++gMCAu2peXPOAuvVc6T7W7+ov51Bb7huyiBEacHATUZ/cES53JsvFKg5Qz5fi
         /IHj7nEHsFHg/6n1wMtH6/UPIae8iuoG29hD0N+7RWpXHHhLIY0iYquZPHId8fztWAK1
         jiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762786397; x=1763391197;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWbUcsoDsnhykZseLVGlMZHroLW5Lmx6xTj8GoPQ6Bo=;
        b=F3nNJS5edYm/f/HktEFzxd0+p6e3FtBUGzGpvRK1qo1W0ZCaYtHQCkM5PGG1pHEjy3
         68FyM7h7kK8wDkyoJZPW+Q5bmtfAg16Z3Djn8df+B3qeOI2h20J11HTGVjSXZxuXtC4l
         oGNhwwt+OiERsuF46qlo/zUA1iB3r9nlLHnzVZ7+ToQI+sWkGyXisom7c5wz7znwKRER
         M2Er1khECKxfvo3zzVlnQiSuiDSATiHu7jenGnmwHt4fr074dsKm6rF+Aljd8QUQOxPu
         NzUJjLhsKK4gKPZaFWP4A2GdZzdUpZTn9/ZUqjY1Umhz0PmX9fAk5lWLxBLgGvCqZwlO
         576Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLjdVIiDGWsgp/5ToQLCsMdhB2/Pf/wyH1nKW4sPagLjYLWSghVt+qn/P9o7ybEMyz86OBObYSAl4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyYceS4KyXepAg/zxTxmeadVTmce8reWwk5fYgjYwAipdDfPu8
	an/4QsjDfBiSBxOO2Q3JZpesz6RbOtL9Rm1wQ0qViJnYHe0c7QfsmoH64Bebz2Ssiw==
X-Gm-Gg: ASbGncs20kgdyyHvP3FXHJ8yuGwbhFgQuP7UJvfOx4ntXfVZQyb+znwFldEWGrclfsa
	kKFdYKkH7CsEYP7CTcOvNmaG6OeviaNaYu/2BfsAPUs7wZ7hONU4wpaQFpvr90ZvINT4uyQs/r9
	qcAmoU0BokkZ9F8TtkUdQEIb0P2KrfKRpyzq4NA/0MS0+gaCD79htLO3qh98V/gQox4PTk+wakz
	6KWxkN+lvi+6cFf7+H1wDk7JqrSCyua5ZwFX3Rcz+LgylnLgJnIvA+tlcqXg+YFKRYAl2+RKbdF
	X8ewr8Iz1JLbiDQ8E65zymxk9XU77AB7Lu3a6T33JK7hXQT6nFudfxsCo282YVEeIW+6zxgxUof
	BrqsnxTXwQpdYdM4pYuAcWScUYXRPn30NWmJ20JaT4lUHRIUS0DcLLPXt4NcTVG4bXsx3YNc3r4
	iI+SJO3m0WKtpjYNHnjKksgrVPWX57PvGgfAZHX0uv4mXK9vA6QWY5Njo4Uyq0QJSA
X-Google-Smtp-Source: AGHT+IEbyGCFzMqvbUEVfcw5oTNWsbQad134yhYRsHkrhI8rZ7Gj/Pc5aalD3EZTSnaa+shduRdJNg==
X-Received: by 2002:a17:907:3e86:b0:b71:854:4e4e with SMTP id a640c23a62f3a-b72e044fa03mr817905966b.38.1762786397194;
        Mon, 10 Nov 2025 06:53:17 -0800 (PST)
Message-ID: <cfe9da20-5680-4f42-92f6-f46350811380@suse.com>
Date: Mon, 10 Nov 2025 15:53:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 10/18] xen/riscv: implement p2m_set_range()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <d689c48582505b0dab6896b414d01d844d834bd5.1760974017.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d689c48582505b0dab6896b414d01d844d834bd5.1760974017.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.10.2025 17:57, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -8,12 +8,45 @@
>  #include <xen/rwlock.h>
>  #include <xen/types.h>
>  
> +#include <asm/page.h>
>  #include <asm/page-bits.h>
>  
>  extern unsigned char gstage_mode;
> +extern unsigned int gstage_root_level;
>  
>  #define P2M_ROOT_ORDER  (ilog2(GSTAGE_ROOT_PAGE_TABLE_SIZE) - PAGE_SHIFT)
>  #define P2M_ROOT_PAGES  BIT(P2M_ROOT_ORDER, U)
> +#define P2M_ROOT_LEVEL  gstage_root_level
> +
> +/*
> + * According to the RISC-V spec:
> + *   When hgatp.MODE specifies a translation scheme of Sv32x4, Sv39x4, Sv48x4,
> + *   or Sv57x4, G-stage address translation is a variation on the usual
> + *   page-based virtual address translation scheme of Sv32, Sv39, Sv48, or
> + *   Sv57, respectively. In each case, the size of the incoming address is
> + *   widened by 2 bits (to 34, 41, 50, or 59 bits).
> + *
> + * P2M_LEVEL_ORDER(lvl) defines the bit position in the GFN from which
> + * the index for this level of the P2M page table starts. The extra 2
> + * bits added by the "x4" schemes only affect the root page table width.
> + *
> + * Therefore, this macro can safely reuse XEN_PT_LEVEL_ORDER() for all
> + * levels: the extra 2 bits do not change the indices of lower levels.
> + *
> + * The extra 2 bits are only relevant if one tried to address beyond the
> + * root level (i.e., P2M_LEVEL_ORDER(P2M_ROOT_LEVEL + 1)), which is
> + * invalid.
> + */
> +#define P2M_LEVEL_ORDER(lvl) XEN_PT_LEVEL_ORDER(lvl)

Is the last paragraph of the comment really needed? It talks about something
absurd / impossible only.

> +#define P2M_ROOT_EXTRA_BITS(lvl) (2 * ((lvl) == P2M_ROOT_LEVEL))
> +
> +#define P2M_PAGETABLE_ENTRIES(lvl) \
> +    (BIT(PAGETABLE_ORDER + P2M_ROOT_EXTRA_BITS(lvl), UL))
> +
> +#define GFN_MASK(lvl) (P2M_PAGETABLE_ENTRIES(lvl) - 1UL)

If I'm not mistaken, this is a mask with the low 10 or 12 bits set.
That's not really something you can apply to a GFN, unlike the name
suggests.

> +#define P2M_LEVEL_SHIFT(lvl) (P2M_LEVEL_ORDER(lvl) + PAGE_SHIFT)

Whereas here the macro name doesn't make clear what is shifted: An
address or a GFN. (It's the former, aiui.)

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -9,6 +9,7 @@
>  #include <xen/rwlock.h>
>  #include <xen/sched.h>
>  #include <xen/sections.h>
> +#include <xen/xvmalloc.h>
>  
>  #include <asm/csr.h>
>  #include <asm/flushtlb.h>
> @@ -17,6 +18,43 @@
>  #include <asm/vmid.h>
>  
>  unsigned char __ro_after_init gstage_mode;
> +unsigned int __ro_after_init gstage_root_level;

Like for mode, I'm unconvinced of this being a global (and not per-P2M /
per-domain).

> +/*
> + * The P2M root page table is extended by 2 bits, making its size 16KB
> + * (instead of 4KB for non-root page tables). Therefore, P2M root page
> + * is allocated as four consecutive 4KB pages (since alloc_domheap_pages()
> + * only allocates 4KB pages).
> + */
> +#define ENTRIES_PER_ROOT_PAGE \
> +    (P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL) / P2M_ROOT_ORDER)
> +
> +static inline unsigned int calc_offset(unsigned int lvl, vaddr_t va)

Where would a vaddr_t come from here? Your input are guest-physical addresses,
if I'm not mistaken.

> +{
> +    unsigned int offset = (va >> P2M_LEVEL_SHIFT(lvl)) & GFN_MASK(lvl);
> +
> +    /*
> +     * For P2M_ROOT_LEVEL, `offset` ranges from 0 to 2047, since the root
> +     * page table spans 4 consecutive 4KB pages.
> +     * We want to return an index within one of these 4 pages.
> +     * The specific page to use is determined by `p2m_get_root_pointer()`.
> +     *
> +     * Example: if `offset == 512`:
> +     *  - A single 4KB page holds 512 entries.
> +     *  - Therefore, entry 512 corresponds to index 0 of the second page.
> +     *
> +     * At all other levels, only one page is allocated, and `offset` is
> +     * always in the range 0 to 511, since the VPN is 9 bits long.
> +     */
> +    return offset % ENTRIES_PER_ROOT_PAGE;

Seeing something "root" used here (when this is for all levels) is pretty odd,
despite all the commentary. Given all the commentary, why not simply

    return offset & ((1U << PAGETABLE_ORDER) - 1);

?

> +}
> +
> +#define P2M_MAX_ROOT_LEVEL 4
> +
> +#define P2M_DECLARE_OFFSETS(var, addr) \
> +    unsigned int var[P2M_MAX_ROOT_LEVEL] = {-1};\
> +    for ( unsigned int i = 0; i <= gstage_root_level; i++ ) \
> +        var[i] = calc_offset(i, addr);

This surely is more than just "declare", and it's dealing with all levels no
matter whether you actually will use all offsets.

> @@ -259,13 +308,293 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>      return rc;
>  }
>  
> +/*
> + * Map one of the four root pages of the P2M root page table.
> + *
> + * The P2M root page table is larger than normal (16KB instead of 4KB),
> + * so it is allocated as four consecutive 4KB pages. This function selects
> + * the appropriate 4KB page based on the given GFN and returns a mapping
> + * to it.
> + *
> + * The caller is responsible for unmapping the page after use.
> + *
> + * Returns NULL if the calculated offset into the root table is invalid.
> + */
> +static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
> +{
> +    unsigned long root_table_indx;
> +
> +    root_table_indx = gfn_x(gfn) >> P2M_LEVEL_ORDER(P2M_ROOT_LEVEL);

With the variable name shortened (to e.g. idx) this could be its initializer
without ending up with too long a line. The root_table_ prefix isn't really
adding much value in the context of this function.

> +    if ( root_table_indx >= P2M_ROOT_PAGES )
> +        return NULL;
> +
> +    /*
> +     * The P2M root page table is extended by 2 bits, making its size 16KB
> +     * (instead of 4KB for non-root page tables). Therefore, p2m->root is
> +     * allocated as four consecutive 4KB pages (since alloc_domheap_pages()
> +     * only allocates 4KB pages).
> +     *
> +     * Initially, `root_table_indx` is derived directly from `va`.

There's no 'va' here.

> +static inline void p2m_clean_pte(pte_t *p, bool clean_pte)

"clean_pte" as a parameter name of a function of this name is, well, odd.

> +/* Insert an entry in the p2m */
> +static int p2m_set_entry(struct p2m_domain *p2m,
> +                         gfn_t gfn,
> +                         unsigned long page_order,
> +                         mfn_t mfn,
> +                         p2m_type_t t)
> +{
> +    unsigned int level;
> +    unsigned int target = page_order / PAGETABLE_ORDER;
> +    pte_t *entry, *table, orig_pte;
> +    int rc;
> +    /*
> +     * A mapping is removed only if the MFN is explicitly set to INVALID_MFN.
> +     * Other MFNs that are considered invalid by mfn_valid() (e.g., MMIO)
> +     * are still allowed.
> +     */
> +    bool removing_mapping = mfn_eq(mfn, INVALID_MFN);
> +    P2M_DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
> +
> +    ASSERT(p2m_is_write_locked(p2m));
> +
> +    /*
> +     * Check if the level target is valid: we only support
> +     * 4K - 2M - 1G mapping.
> +     */
> +    ASSERT(target <= 2);
> +
> +    table = p2m_get_root_pointer(p2m, gfn);
> +    if ( !table )
> +        return -EINVAL;
> +
> +    for ( level = P2M_ROOT_LEVEL; level > target; level-- )
> +    {
> +        /*
> +         * Don't try to allocate intermediate page table if the mapping
> +         * is about to be removed.
> +         */
> +        rc = p2m_next_level(p2m, !removing_mapping,
> +                            level, &table, offsets[level]);
> +        if ( (rc == P2M_TABLE_MAP_NONE) || (rc == P2M_TABLE_MAP_NOMEM) )
> +        {
> +            rc = (rc == P2M_TABLE_MAP_NONE) ? -ENOENT : -ENOMEM;
> +            /*
> +             * We are here because p2m_next_level has failed to map
> +             * the intermediate page table (e.g the table does not exist
> +             * and none should be allocated). It is a valid case
> +             * when removing a mapping as it may not exist in the
> +             * page table. In this case, just ignore lookup failure.
> +             */
> +            rc = removing_mapping ? 0 : rc;
> +            goto out;
> +        }
> +
> +        if ( rc != P2M_TABLE_NORMAL )
> +            break;
> +    }
> +
> +    entry = table + offsets[level];
> +
> +    /*
> +     * If we are here with level > target, we must be at a leaf node,
> +     * and we need to break up the superpage.
> +     */
> +    if ( level > target )
> +    {
> +        panic("Shattering isn't implemented\n");
> +    }
> +
> +    /*
> +     * We should always be there with the correct level because all the
> +     * intermediate tables have been installed if necessary.
> +     */
> +    ASSERT(level == target);
> +
> +    orig_pte = *entry;
> +
> +    if ( removing_mapping )
> +        p2m_clean_pte(entry, p2m->clean_dcache);
> +    else
> +    {
> +        pte_t pte = p2m_pte_from_mfn(mfn, t);
> +
> +        p2m_write_pte(entry, pte, p2m->clean_dcache);
> +
> +        p2m->max_mapped_gfn = gfn_max(p2m->max_mapped_gfn,
> +                                      gfn_add(gfn, BIT(page_order, UL) - 1));
> +        p2m->lowest_mapped_gfn = gfn_min(p2m->lowest_mapped_gfn, gfn);
> +    }
> +
> +    p2m->need_flush = true;
> +
> +    /*
> +     * Currently, the infrastructure required to enable CONFIG_HAS_PASSTHROUGH
> +     * is not ready for RISC-V support.
> +     *
> +     * When CONFIG_HAS_PASSTHROUGH=y, iommu_iotlb_flush() should be done
> +     * here.
> +     */
> +#ifdef CONFIG_HAS_PASSTHROUGH
> +#   error "add code to flush IOMMU TLB"
> +#endif
> +
> +    rc = 0;
> +
> +    /*
> +     * In case of a VALID -> INVALID transition, the original PTE should
> +     * always be freed.
> +     *
> +     * In case of a VALID -> VALID transition, the original PTE should be
> +     * freed only if the MFNs are different. If the MFNs are the same
> +     * (i.e., only permissions differ), there is no need to free the
> +     * original PTE.
> +     */
> +    if ( pte_is_valid(orig_pte) &&
> +         (!pte_is_valid(*entry) ||
> +         !mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte))) )

Besides my continued impression of this condition being more complex than it
ought to be expected, indentation is off by one on the last of the three lines.
(Since, otoh, I can't suggest any simpler expression (for now), this isn't a
request to further change it.)

> +/* Return mapping order for given gfn, mfn and nr */
> +static unsigned long p2m_mapping_order(gfn_t gfn, mfn_t mfn, unsigned long nr)
> +{
> +    unsigned long mask;
> +    /* 1gb, 2mb, 4k mappings are supported */
> +    unsigned int level = min(P2M_ROOT_LEVEL, _AC(2, U));

Further up you has such a literal 2 already - please make a constant, so all
instances can easily be associated with one another.

> +    unsigned long order = 0;
> +
> +    mask = !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
> +    mask |= gfn_x(gfn);
> +
> +    for ( ; level != 0; level-- )
> +    {
> +        if ( !(mask & (BIT(P2M_LEVEL_ORDER(level), UL) - 1)) &&
> +             (nr >= BIT(P2M_LEVEL_ORDER(level), UL)) )
> +        {
> +                order = P2M_LEVEL_ORDER(level);
> +                break;

I'm pretty sure I did complain about the too deep indentation here already.

> +        }
> +    }
> +
> +    return order;
> +}
> +
>  static int p2m_set_range(struct p2m_domain *p2m,
>                           gfn_t sgfn,
>                           unsigned long nr,
>                           mfn_t smfn,
>                           p2m_type_t t)
>  {
> -    return -EOPNOTSUPP;
> +    int rc = 0;
> +    unsigned long left = nr;
> +
> +    /*
> +     * Any reference taken by the P2M mappings (e.g. foreign mapping) will
> +     * be dropped in relinquish_p2m_mapping(). As the P2M will still
> +     * be accessible after, we need to prevent mapping to be added when the
> +     * domain is dying.
> +     */
> +    if ( unlikely(p2m->domain->is_dying) )
> +        return -EACCES;
> +
> +    while ( left )
> +    {
> +        unsigned long order = p2m_mapping_order(sgfn, smfn, left);
> +
> +        rc = p2m_set_entry(p2m, sgfn, order, smfn, t);
> +        if ( rc )
> +            break;
> +
> +        sgfn = gfn_add(sgfn, BIT(order, UL));
> +        if ( !mfn_eq(smfn, INVALID_MFN) )
> +           smfn = mfn_add(smfn, BIT(order, UL));

Off-by-1 indentation again.

Jan

