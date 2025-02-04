Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64F8A274F8
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 15:58:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881668.1291827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfKMs-0004tu-AV; Tue, 04 Feb 2025 14:57:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881668.1291827; Tue, 04 Feb 2025 14:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfKMs-0004rJ-7T; Tue, 04 Feb 2025 14:57:38 +0000
Received: by outflank-mailman (input) for mailman id 881668;
 Tue, 04 Feb 2025 14:57:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfKMr-0004qx-Cl
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 14:57:37 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e3516cc-e308-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 15:57:35 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ab7157cf352so611411666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 06:57:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a56103sm948184766b.171.2025.02.04.06.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 06:57:34 -0800 (PST)
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
X-Inumbo-ID: 5e3516cc-e308-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738681054; x=1739285854; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oI7i2Lc8c4/rS/rHo8tJd5JjFJK4E5iI/R4Wy8KOfdk=;
        b=SWVOAE6Ir8SASAIdUZdxahYRHqWM7f5YBp8wAZ8Z9I5AIdz21NbzU2VZIPrPfZ39ga
         RCfGC1LvOhv4oApNLaCigSc2i14Fw/MJ6Td+8yBL1rX11gMOS4VaEjZbJ1Fh2p6NdXuG
         sHvP1FPm5bykuMVK/x+fN7HTAd5wsxolwRbjeLpHrTbN2DQiwnJt6CUksbJIFPU5mixm
         UaF3f8n73BVuff6aVyo4H7fM7kvgDIjkeCcFbfe5zpf38egKjfFmrnT9dxA6lrTfTPXG
         1uIW3JPT9kJDsXpoNwxDgQOQsA98BwkmR0Qz8anETTQFU/4bwq/y7tNj2cEcZkKHJULK
         IoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738681054; x=1739285854;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oI7i2Lc8c4/rS/rHo8tJd5JjFJK4E5iI/R4Wy8KOfdk=;
        b=LOaTmR1VqkfMWghCA7LDKylvwv/0XvTc2t2dyeu7VTE3Q5DVyxEVViX/kKH1879kDz
         yetmtUB9UesUSnVo2bNvYyNfzNIYYYec3iZJBN8ZCJWzvhjE+G+9+Aon+3xAdnVLLS0J
         /NRBzzChmByLddkqal/Y24aAjrcKc71+zDIw1i2yXroBPkbEL6WlVNj1Tor3GLQILUBu
         ApuxA+6Hoi/r329sO4r72NVhXteyXuRi8TbHIHnRxjS6ezm8jQnZ6ezqgJq45W6cYi4/
         zIJTkr+rl7Qv+F53GDBXJOyC7GgTbS/7unmW+T4kFN1hzEba/Z3wKmHZiUAe1uJ2MDYK
         sPXw==
X-Forwarded-Encrypted: i=1; AJvYcCUGB11AXX5XG2YrvAefwwiFiwd8w3GluwqTHWz5gFqTdyNwzky3eZE6Cv9M63WC7mT9IrQ2xzwKSHw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3okayzUCqE30jzCVcLvcRaVuegroqFSOeeZe3PQ68rX4EkJbr
	EPe2pylGKae+9I7nyEBJQR70VcOD/iLT1z3lJKADif/aXl0zejS2G4kEbVz+iw==
X-Gm-Gg: ASbGncsI281srxpum9KIVb5Z9SCYRIK32AV5wlhB2U2lmwMHxTtGvuY2xOiA5UdfI3D
	/FZssZo5gm4Sig+RGjY6yg8jvsBBUjKbm1EYnKip9qgL4P2kTjwOtDtED7d/s+i0676jrVCNRh6
	zWGsXlyAyfnoEqExdTlKgMBeI/5RpN0iehddYhDKIADQ01utq/Q0SiFKwQ9kvOUP0LU+zk3anYL
	LU2/PatjtUjZlsmAn5bp97MFMpuLe0PQiDxysSRA/cgt+U+mds/pEDi897Vp6v8INNgVI9F7Rod
	3OyVrTHNkZlyVGPTkWw/t1E63SAXLlvLndq+rJZPXjJv6SfIem/Ib9RDrQSDCY+HUMxTVq9xyQN
	s
X-Google-Smtp-Source: AGHT+IFDb//GADJLgJfhpbk0axnAhGmPvMIypVwD8KDVome2Esuc1rSh0soeGBryvDomynbBsk4mRw==
X-Received: by 2002:a17:906:f581:b0:ab6:b9d9:818d with SMTP id a640c23a62f3a-ab7480ff212mr547245866b.0.1738681054453;
        Tue, 04 Feb 2025 06:57:34 -0800 (PST)
Message-ID: <b6418443-adc2-4ab4-911e-a196a1f59f5d@suse.com>
Date: Tue, 4 Feb 2025 15:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen/riscv: update mfn calculation in
 pt_mapping_level()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1738587493.git.oleksii.kurochko@gmail.com>
 <133526ddccc22ab39dd6841038157d48bd35da81.1738587493.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <133526ddccc22ab39dd6841038157d48bd35da81.1738587493.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.02.2025 14:12, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -55,6 +55,22 @@
>  #define PTE_SMALL       BIT(10, UL)
>  #define PTE_POPULATE    BIT(11, UL)
>  
> +/*
> + * In the case when modifying or destroying a mapping, it is necessary to
> + * search until a leaf node is found, instead of searching for a page table
> + * entry based on the precalculated `level` and `order` (look at pt_update()).
> + * This is because when `mfn` == INVALID_MFN, the `mask`(in pt_mapping_level())
> + * will take into account only `vfn`, which could accidentally return an
> + * incorrect level, leading to the discovery of an incorrect page table entry.
> + *
> + * For example, if `vfn` is page table level 1 aligned, but it was mapped as
> + * page table level 0, then pt_mapping_level() will return `level` = 1,
> + * since only `vfn` (which is page table level 1 aligned) is taken into account
> + * when `mfn` == INVALID_MFN (look at pt_mapping_level()).
> + */
> +
> +#define PTE_LEAF_SEARCH BIT(12, UL)

Is it intended for callers outside of pt.c to make use of this? If not,
it better wouldn't be globally exposed.

Furthermore, this isn't a property of the PTE(s) to be created, so is
likely wrong to mix with PTE_* flags. (PTE_POPULATE is on the edge of
also falling in this category, btw.) Perhaps ...

> --- a/xen/arch/riscv/pt.c
> +++ b/xen/arch/riscv/pt.c
> @@ -187,11 +187,10 @@ static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
>  
>  /* Update an entry at the level @target. */
>  static int pt_update_entry(mfn_t root, vaddr_t virt,
> -                           mfn_t mfn, unsigned int target,
> +                           mfn_t mfn, unsigned int *target,

... you instead want to have callers of this function preset *target
to a special value (e.g. UINT_MAX or CONFIG_PAGING_LEVELS) indicating
the level is wanted as an output.

> @@ -205,39 +204,48 @@ static int pt_update_entry(mfn_t root, vaddr_t virt,
>      bool alloc_tbl = !mfn_eq(mfn, INVALID_MFN) || (flags & PTE_POPULATE);
>      pte_t pte, *entry;
>  
> -    /* convenience aliases */
> -    DECLARE_OFFSETS(offsets, virt);
> -
> -    table = map_table(root);
> -    for ( ; level > target; level-- )
> +    if ( flags & PTE_LEAF_SEARCH )
>      {
> -        rc = pt_next_level(alloc_tbl, &table, offsets[level]);
> -        if ( rc == XEN_TABLE_MAP_NOMEM )
> +        entry = pt_walk(virt, target);
> +        BUG_ON(!pte_is_mapping(*entry));

Is this really necessarily a bug? Can't one want to determine how deep
the (populated) page tables are for a given VA?

Hmm, here I can see why you have pt_walk() return a pointer. As per the
comment on the earlier patch, I don't think this is a good idea. You
may want to have

static pte_t *_pt_walk(...)
{
    ...
}

pte_t pt_walk(...)
{
    return *_pt_walk(...);
}

> @@ -345,9 +353,6 @@ static int pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
>          return level;
>  
>      /*
> -     * Don't take into account the MFN when removing mapping (i.e
> -     * MFN_INVALID) to calculate the correct target order.
> -     *
>       * `vfn` and `mfn` must be both superpage aligned.
>       * They are or-ed together and then checked against the size of
>       * each level.

You drop part of the comment without altering the code being commented.
What's the deal?

> @@ -415,19 +420,33 @@ static int pt_update(vaddr_t virt, mfn_t mfn,
>  
>      spin_lock(&pt_lock);
>  
> -    while ( left )
> +    /* look at the comment above the definition of PTE_LEAF_SEARCH */
> +    if ( mfn_eq(mfn, INVALID_MFN) && !(flags & PTE_POPULATE) )
>      {
> -        unsigned int order, level;
> +        flags |= PTE_LEAF_SEARCH;
> +    }

For readability I think it would be better if the figure braces were
dropped.

> -        level = pt_mapping_level(vfn, mfn, left, flags);
> -        order = XEN_PT_LEVEL_ORDER(level);
> +    while ( left )
> +    {
> +        unsigned int order = 0, level;
>  
> -        ASSERT(left >= BIT(order, UL));
> +        if ( !(flags & PTE_LEAF_SEARCH) )
> +        {
> +            level = pt_mapping_level(vfn, mfn, left, flags);
> +            order = XEN_PT_LEVEL_ORDER(level);
> +            ASSERT(left >= BIT(order, UL));

Assignment to order and assertion are ...

> +        }
>  
> -        rc = pt_update_entry(root, vfn << PAGE_SHIFT, mfn, level, flags);
> +        rc = pt_update_entry(root, vfn << PAGE_SHIFT, mfn, &level, flags);
>          if ( rc )
>              break;
>  
> +        if ( flags & PTE_LEAF_SEARCH )
> +        {
> +            order = XEN_PT_LEVEL_ORDER(level);
> +            ASSERT(left >= BIT(order, UL));
> +        }

... repeated here, with neither left nor order being passed into
pt_update_entry(). Does this really need doing twice? (I have to
admit that I have trouble determining what the assertion is about.
For order alone it clearly could be done centrally after the call.)

Jan

