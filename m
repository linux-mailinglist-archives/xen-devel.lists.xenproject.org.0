Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 856D7B8BA34
	for <lists+xen-devel@lfdr.de>; Sat, 20 Sep 2025 01:37:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127175.1468266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzkef-0008Oc-61; Fri, 19 Sep 2025 23:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127175.1468266; Fri, 19 Sep 2025 23:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzkef-0008N8-34; Fri, 19 Sep 2025 23:36:41 +0000
Received: by outflank-mailman (input) for mailman id 1127175;
 Fri, 19 Sep 2025 23:36:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uzkec-0008N2-QZ
 for xen-devel@lists.xenproject.org; Fri, 19 Sep 2025 23:36:38 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79c70d95-95b1-11f0-9809-7dc792cee155;
 Sat, 20 Sep 2025 01:36:33 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3e9042021faso1934019f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Sep 2025 16:36:33 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26980053201sm66193015ad.17.2025.09.19.16.36.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 16:36:32 -0700 (PDT)
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
X-Inumbo-ID: 79c70d95-95b1-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758324993; x=1758929793; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/oRXW3JGWAIM3WD61rtwJF5PiZxqPQvTEOg1PZaCEEU=;
        b=OJ213T9i0rLAHKS3RXK2WuJRnRxTXyyzonyMh2J2b4Nlc3KqdyjEilUWqh+hsDOyFi
         ofLbqTI/j5Jx7zlDQS0iriJfkSkctpk5qALtYgzbzHptUpxKl1BW+g1CFzCSYBz14t1U
         iodFDI+IJCoGRLvFoGjUnwq5B3glsNO4v/4CELg4QtYT5kRPOF3k0iSGv49YYlhKYnkk
         vBiVGigRaWSsycFKs2eZyjZECVKYf63a46fCJT5yhD7SAYnyc51Gxw/xAlMNMBIQCBVb
         HaFaIwM9YUBB5pI7zWruuAq/MTZJ/LpJ8Qood7iLp6pI6YTFQte2zMWXuTxtKdJN1CCw
         U1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758324993; x=1758929793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/oRXW3JGWAIM3WD61rtwJF5PiZxqPQvTEOg1PZaCEEU=;
        b=Zac6Y2xpxdu0fM0gjjS9UCj33a4R9gVdnC3+7fmweE4tXmGOrITyb40N1JZp2eg4Un
         g/AvPwT0YtIJjbpDJgnfcEGBmwB0/vu2zxyidjpkmEvL2Yk68hzeq1odccJyWjcqDUNH
         pPZ0GoEM1y8mpeqSH7vmAJ6DqJATf2nPlKc265XB3PHJLtbZZmw6zKDGKSHQMSElvfQr
         nww5C1WmPru0U4HV6h5rHZn8KdbSXsxNVqM4XHiKXbkSbdO43Iq2H7GE7/xNG33S8LEt
         i9F5uYn98HIA95WWed1VgKf4LEeBk87Na6nKZeQj9N4XiKSsCUnNMa6BedCTC+boSFWB
         mgbw==
X-Forwarded-Encrypted: i=1; AJvYcCVG1ie2f5M3couJjXS9r2zQCbyjAfGl0zoFryc/OpufxCevSmFXH9sCj8R+/hmC4QA299fnbnbrSVE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFFJG1ER8UTZGfL1jlbLWJix2X+6D4n3bjlExFnM3LTTOjUAPL
	qnqwvdgabZIm30QU95UwS2adAPdjrKBTdYVsdtEOwNCxjzKBt7L1VSYxvev0Xx9OoA==
X-Gm-Gg: ASbGncugXStTq/27CWdWa2IYAJ+d4iIjNbYyzeW7jQyQHt/MKcgnK7tml5uuOvSssL6
	EAoIcgw+qW1hN5j8o8lIjdw5bwcu8pTqP2qWpGa5bXdyxi5OgxAM5jKnofDuIqkTyO48Gq8WZ56
	GtaMgOS7Q0/oKhwgSSDMOYxa0gd6fyB0PLvVWHR7Jm9jNU+B6PtZEGm2gMFcr17EbAIvdsb+7g8
	/Hd3+wiu2kaovpJvIEtQYb7GDcu9Kdt7muG65spkrvYM4D2LwW/e2kNZQvHUr3z+fJsqivvUugH
	ymmoe5npo8Wst3Mh+MhiCObVg7lti+dHJxhMX6OJn47J5wj+E97SKHYttNi3fpmY3EBLM2aV/Fz
	BlLtadQfaj56oi2D7MyoWPTDzIGLFBtxT
X-Google-Smtp-Source: AGHT+IFpkHa7Fsng17P8IJk3bs+GZMuCgLISa7SuZxI9lIejC768Dz9aEaaztOCpQP2poS6HE3p8sA==
X-Received: by 2002:a05:6000:605:b0:3ea:5f76:3f7a with SMTP id ffacd0b85a97d-3ee7e0116d6mr2956081f8f.22.1758324992752;
        Fri, 19 Sep 2025 16:36:32 -0700 (PDT)
Message-ID: <6ee4846e-dd27-4588-aac5-f2fe2937db18@suse.com>
Date: Sat, 20 Sep 2025 01:36:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/18] xen/riscv: implement p2m_set_range()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <5e325267a792a9a0f4cb387b4e3287d22dc8d173.1758145428.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5e325267a792a9a0f4cb387b4e3287d22dc8d173.1758145428.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.09.2025 23:55, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -16,6 +16,7 @@
>  #include <asm/riscv_encoding.h>
>  
>  unsigned long __ro_after_init gstage_mode;
> +unsigned int __ro_after_init gstage_root_level;
>  
>  void __init gstage_mode_detect(void)
>  {
> @@ -53,6 +54,7 @@ void __init gstage_mode_detect(void)
>          if ( MASK_EXTR(csr_read(CSR_HGATP), HGATP_MODE_MASK) == mode )
>          {
>              gstage_mode = mode;
> +            gstage_root_level = modes[mode_idx].paging_levels - 1;
>              break;
>          }
>      }
> @@ -210,6 +212,9 @@ int p2m_init(struct domain *d)
>      rwlock_init(&p2m->lock);
>      INIT_PAGE_LIST_HEAD(&p2m->pages);
>  
> +    p2m->max_mapped_gfn = _gfn(0);
> +    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
> +
>      /*
>       * Currently, the infrastructure required to enable CONFIG_HAS_PASSTHROUGH
>       * is not ready for RISC-V support.
> @@ -251,13 +256,287 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>      return rc;
>  }
>  
> +/*
> + * Find and map the root page table. The caller is responsible for
> + * unmapping the table.

With the root table being 4 pages, "the root table" is slightly misleading
here: Yu never map the entire table.

> + * The function will return NULL if the offset into the root table is
> + * invalid.
> + */
> +static pte_t *p2m_get_root_pointer(struct p2m_domain *p2m, gfn_t gfn)
> +{
> +    unsigned long root_table_indx;
> +
> +    root_table_indx = gfn_x(gfn) >> P2M_LEVEL_ORDER(P2M_ROOT_LEVEL);
> +    if ( root_table_indx >= P2M_ROOT_PAGES )
> +        return NULL;
> +
> +    /*
> +     * The P2M root page table is extended by 2 bits, making its size 16KB
> +     * (instead of 4KB for non-root page tables). Therefore, p2m->root is
> +     * allocated as four consecutive 4KB pages (since alloc_domheap_pages()
> +     * only allocates 4KB pages).
> +     *
> +     * To determine which of these four 4KB pages the root_table_indx falls
> +     * into, we divide root_table_indx by
> +     * P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL - 1).
> +     */
> +    root_table_indx /= P2M_PAGETABLE_ENTRIES(P2M_ROOT_LEVEL - 1);

The subtraction of 1 here feels odd: You're after the root table's
number of entries, i.e. I'd expect you to pass just P2M_ROOT_LEVEL.
And the way P2M_PAGETABLE_ENTRIES() works also suggests so.

> +/*
> + * Insert an entry in the p2m. This should be called with a mapping
> + * equal to a page/superpage.
> + */

I don't follow this comment: There isn't any mapping being passed in, is there?

> +static int p2m_set_entry(struct p2m_domain *p2m,
> +                           gfn_t gfn,
> +                           unsigned long page_order,
> +                           mfn_t mfn,
> +                           p2m_type_t t)

Nit: Indentation.

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
> +    DECLARE_OFFSETS(offsets, gfn_to_gaddr(gfn));
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
> +             * and they p2m tree is read-only).

I thought I commented on this or something similar already: Calling the
p2m tree "read-only" is imo misleading.

> It is a valid case
> +             * when removing a mapping as it may not exist in the
> +             * page table. In this case, just ignore it.

I fear the "it" has no reference; aiui you mean "ignore the lookup failure",
but the comment isn't worded to refer to that by "it".

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
> +     * Free the entry only if the original pte was valid and the base
> +     * is different (to avoid freeing when permission is changed).
> +     *
> +     * If previously MFN 0 was mapped and it is going to be removed
> +     * and considering that during removing MFN 0 is used then `entry`
> +     * and `new_entry` will be the same and p2m_free_subtree() won't be
> +     * called. This case is handled explicitly.
> +     */
> +    if ( pte_is_valid(orig_pte) &&
> +         (!mfn_eq(pte_get_mfn(*entry), pte_get_mfn(orig_pte)) ||
> +          (removing_mapping && mfn_eq(pte_get_mfn(*entry), _mfn(0)))) )
> +        p2m_free_subtree(p2m, orig_pte, level);

I continue to fail to understand why the MFN would matter here. Isn't the
need to free strictly tied to a VALID -> NOT VALID transition? A permission
change simply retains the VALID state of an entry.

Jan

