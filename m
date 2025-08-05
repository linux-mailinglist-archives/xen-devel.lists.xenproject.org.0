Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCADAB1B21E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 12:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070313.1433969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujF2m-0004ys-St; Tue, 05 Aug 2025 10:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070313.1433969; Tue, 05 Aug 2025 10:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujF2m-0004wI-Ph; Tue, 05 Aug 2025 10:37:20 +0000
Received: by outflank-mailman (input) for mailman id 1070313;
 Tue, 05 Aug 2025 10:37:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujF2l-0004wC-I6
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 10:37:19 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27eb12a6-71e8-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 12:37:16 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-615460d9897so6283002a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 03:37:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a9113e40sm8152320a12.57.2025.08.05.03.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 03:37:15 -0700 (PDT)
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
X-Inumbo-ID: 27eb12a6-71e8-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754390236; x=1754995036; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L3UreZC+nqCKD2Heeq7OOVowSP7ytWR1sKlrgmHlRK8=;
        b=ETrye5FM1TmgCkUsclssjODtnRIdvakU297TCV1mNOuj9ip2xspFpIz54j/qNi6ANB
         c8cl0PligEHZzl8L+faHea0Ov6lTxLyDFH1ij2OoE7Ndk3KCCLJPWDtYNwJ3rs9bNUGt
         v6hyeOePAj1AzKiVVXgW9baBSE1qSPKFhyc4StVj2N4Hew7//bAX+nZsD1WA8o/OcOK3
         0mSKKfP+SeGx1erozmUlF8dOwIssJDzjXvAw0QAdCT0pKIxlrhUXj8mY7bJO+DGvZf0O
         nSoJipiRv4izoAacr69wRbWGn6Qa7AwWK6rCM15Syy2/fNd45rpgBHVA++eZqVerke+5
         ub2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754390236; x=1754995036;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3UreZC+nqCKD2Heeq7OOVowSP7ytWR1sKlrgmHlRK8=;
        b=e4m8jTckJ0KfO1keml0m1Awp0TyZzy53MVWAME+EoJF4+ef3bo21OLr2AGZ3jAqc7E
         rY8RUujl6bST/tTNlIC/Ivme62d4eICFD5U+uHeyyG2Ousq4Ac6DSckwvkMfqV6FjZzo
         kT2qY42eJ7wupzm+zBfKI9M+Avt3zagKBLLJ7Lg22TQ9k+x11551tnYlkwM9FJB5QAFm
         58nFAOcsV1dYYUyo+THWrmsjD7x+Ehvta2A7EASoZrXi8YNsjxkCaaJ0boQStVdbvb+2
         3PBwkR/J5639SQ7FpibWiHgz0AsDoPErt7Ab2JC+fklqspurapNS+5ZiCCNWpXq8VLER
         r5dw==
X-Forwarded-Encrypted: i=1; AJvYcCVPXSvAC7KGqShLZBA1mUbO+Ts/PmYApGdd0azl1AE0gTz+8eSkCvklCbzB7lA/wVdoxsvXSEfKAJY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxtnur5zoi85lxHMzyBDdEfD9cCiXx0YqEZWFX3tdbGVFEAlr3h
	vlRNuYBS9EJ5J7mJyFbx4xyH2V6TCvV+Lwr3hb+qk/tE8cvbWtoygBgVhaW8k8zZCDro9BSlpCt
	T5TQ=
X-Gm-Gg: ASbGncvqw6kX7sIfNY5dr9sfa4wZtncx9CxvBay54T9vOUosukQMuuOpG2MD5v5mEp2
	pi0Q21ayfIh24GLottZnFfx86VGnEdcvxMKh4aqSP6wt0gFKakSKcnRlgKPui+asR7Yr30PzpYi
	3yyO6/zkZFC7CZGuOAKZgO39m9WE9s7asiAMMRGt3KG+njeUTViNSo6QPxCa9miq7pppPq7AsRs
	NLTNXol0GGxb3nBKv2gLeRwvQVbmhXx/lIMRf/BD7CqTRJW+AbSuBZLBQ44bexnjcjU+HBxb1jY
	LLU6jnO6YbAxzW7ycvMroCHuMsqPzmELzCryVzJp+sbk2pHfM/G8Ne9mTSY9k/fDSKfEoMwPaD4
	vXS/Ys/a5hdWGAEvPwv8VNtdN5ywl9CPmJvBwN/mlI4fGU19xGhEqDhGxG00YKpZRouP/xqOzay
	0OEVaa+yk=
X-Google-Smtp-Source: AGHT+IH1iSOs6GGMLL/1gomtHSHmi7ds5abLYTtNhvEFeLIMQFD353mCYU8NoWx+D2gI9VDOu6BlcA==
X-Received: by 2002:a05:6402:13c2:b0:615:8e47:11b3 with SMTP id 4fb4d7f45d1cf-615e7144a3emr11307343a12.22.1754390235773;
        Tue, 05 Aug 2025 03:37:15 -0700 (PDT)
Message-ID: <3c02593f-deae-4109-9334-0ac4376a9a9e@suse.com>
Date: Tue, 5 Aug 2025 12:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/20] xen/riscv: add root page table allocation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <23c79f07221dee7eb782ebb160442f3a796a41b2.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <23c79f07221dee7eb782ebb160442f3a796a41b2.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> Introduce support for allocating and initializing the root page table
> required for RISC-V stage-2 address translation.
> 
> To implement root page table allocation the following is introduced:
> - p2m_get_clean_page() and p2m_alloc_root_table(), p2m_allocate_root()
>   helpers to allocate and zero a 16 KiB root page table, as mandated
>   by the RISC-V privileged specification for Sv32x4/Sv39x4/Sv48x4/Sv57x4
>   modes.
> - Update p2m_init() to inititialize p2m_root_order.
> - Add maddr_to_page() and page_to_maddr() macros for easier address
>   manipulation.
> - Introduce paging_ret_pages_to_domheap() to return some pages before
>   allocate 16 KiB pages for root page table.
> - Allocate root p2m table after p2m pool is initialized.
> - Add construct_hgatp() to construct the hgatp register value based on
>   p2m->root, p2m->hgatp_mode and VMID.

Imo for this to be complete, freeing of the root table also wants taking
care of. Much like imo p2m_init() would better immediately be accompanied
by the respective teardown function. Once you start using them, you want
to use them in pairs, after all.

> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> @@ -133,11 +133,13 @@
>  #define HGATP_MODE_SV48X4		_UL(9)
>  
>  #define HGATP32_MODE_SHIFT		31
> +#define HGATP32_MODE_MASK		_UL(0x80000000)
>  #define HGATP32_VMID_SHIFT		22
>  #define HGATP32_VMID_MASK		_UL(0x1FC00000)
>  #define HGATP32_PPN			_UL(0x003FFFFF)
>  
>  #define HGATP64_MODE_SHIFT		60
> +#define HGATP64_MODE_MASK		_ULL(0xF000000000000000)
>  #define HGATP64_VMID_SHIFT		44
>  #define HGATP64_VMID_MASK		_ULL(0x03FFF00000000000)
>  #define HGATP64_PPN			_ULL(0x00000FFFFFFFFFFF)
> @@ -170,6 +172,7 @@
>  #define HGATP_VMID_SHIFT		HGATP64_VMID_SHIFT
>  #define HGATP_VMID_MASK			HGATP64_VMID_MASK
>  #define HGATP_MODE_SHIFT		HGATP64_MODE_SHIFT
> +#define HGATP_MODE_MASK			HGATP64_MODE_MASK
>  #else
>  #define MSTATUS_SD			MSTATUS32_SD
>  #define SSTATUS_SD			SSTATUS32_SD
> @@ -181,8 +184,11 @@
>  #define HGATP_VMID_SHIFT		HGATP32_VMID_SHIFT
>  #define HGATP_VMID_MASK			HGATP32_VMID_MASK
>  #define HGATP_MODE_SHIFT		HGATP32_MODE_SHIFT
> +#define HGATP_MODE_MASK			HGATP32_MODE_MASK
>  #endif
>  
> +#define GUEST_ROOT_PAGE_TABLE_SIZE	KB(16)

In another context I already mentioned that imo you want to be careful with
the use of "guest" in identifiers. It's not the guest page tables which have
an order-2 root table, but the P2M (Xen terminology) or G-stage / second
stage (RISC-V spec terminology) ones. As long as you're only doing P2M
work, this may not look significant. But once you actually start dealing
with guest page tables, it easily can end up confusing.

> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -1,8 +1,86 @@
> +#include <xen/domain_page.h>
>  #include <xen/mm.h>
>  #include <xen/rwlock.h>
>  #include <xen/sched.h>
>  
>  #include <asm/paging.h>
> +#include <asm/p2m.h>
> +#include <asm/riscv_encoding.h>
> +
> +unsigned int __read_mostly p2m_root_order;

If this is to be a variable at all, it ought to be __ro_after_init, and
hence it shouldn't be written every time p2m_init() is run. If you want
to to remain as a variable, what's wrong with

const unsigned int p2m_root_order = ilog2(GUEST_ROOT_PAGE_TABLE_SIZE) - PAGE_SHIFT;

or some such? But of course equally well you could have

#define P2M_ROOT_ORDER  (ilog2(GUEST_ROOT_PAGE_TABLE_SIZE) - PAGE_SHIFT)

> +static void clear_and_clean_page(struct page_info *page)
> +{
> +    clear_domain_page(page_to_mfn(page));
> +
> +    /*
> +     * If the IOMMU doesn't support coherent walks and the p2m tables are
> +     * shared between the CPU and IOMMU, it is necessary to clean the
> +     * d-cache.
> +     */

That is, ...

> +    clean_dcache_va_range(page, PAGE_SIZE);

... this call really wants to be conditional?

> +}
> +
> +static struct page_info *p2m_allocate_root(struct domain *d)

With there also being p2m_alloc_root_table() and with that being the sole
caller of the function here, I wonder: Is having this in a separate
function really outweighing the possible confusion of which of the two
functions to use?

> +{
> +    struct page_info *page;
> +
> +    /*
> +     * As mentioned in the Priviliged Architecture Spec (version 20240411)
> +     * in Section 18.5.1, for the paged virtual-memory schemes  (Sv32x4,
> +     * Sv39x4, Sv48x4, and Sv57x4), the root page table is 16 KiB and must
> +     * be aligned to a 16-KiB boundary.
> +     */
> +    page = alloc_domheap_pages(d, P2M_ROOT_ORDER, MEMF_no_owner);
> +    if ( !page )
> +        return NULL;
> +
> +    for ( unsigned int i = 0; i < P2M_ROOT_PAGES; i++ )
> +        clear_and_clean_page(page + i);
> +
> +    return page;
> +}
> +
> +unsigned long construct_hgatp(struct p2m_domain *p2m, uint16_t vmid)
> +{
> +    unsigned long ppn;
> +
> +    ppn = PFN_DOWN(page_to_maddr(p2m->root)) & HGATP_PPN;

Why not page_to_pfn() or mfn_x(page_to_mfn())? I.e. why mix different groups
of accessors?

As to "& HGATP_PPN" - that's making an assumption that you could avoid by
using ...

> +    /* TODO: add detection of hgatp_mode instead of hard-coding it. */
> +#if RV_STAGE1_MODE == SATP_MODE_SV39
> +    p2m->hgatp_mode = HGATP_MODE_SV39X4;
> +#elif RV_STAGE1_MODE == SATP_MODE_SV48
> +    p2m->hgatp_mode = HGATP_MODE_SV48X4;
> +#else
> +#   error "add HGATP_MODE"
> +#endif
> +
> +    return ppn | MASK_INSR(p2m->hgatp_mode, HGATP_MODE_MASK) |
> +                 MASK_INSR(vmid, HGATP_VMID_MASK);

... MASK_INSR() also on "ppn".

As to the writing of p2m->hgatp_mode - you don't want to do this here, when
this is the function to calculate the value to put into hgatp. This field
needs calculating only once, perhaps in p2m_init().

> +static int p2m_alloc_root_table(struct p2m_domain *p2m)
> +{
> +    struct domain *d = p2m->domain;
> +    struct page_info *page;
> +    const unsigned int nr_root_pages = P2M_ROOT_PAGES;

Is this local variable really of any use?

> +    /*
> +     * Return back nr_root_pages to assure the root table memory is also
> +     * accounted against the P2M pool of the domain.
> +     */
> +    if ( !paging_ret_pages_to_domheap(d, nr_root_pages) )
> +        return -ENOMEM;
> +
> +    page = p2m_allocate_root(d);
> +    if ( !page )
> +        return -ENOMEM;

Hmm, and the pool is then left shrunk by 4 pages?

> --- a/xen/arch/riscv/paging.c
> +++ b/xen/arch/riscv/paging.c
> @@ -54,6 +54,36 @@ int paging_freelist_init(struct domain *d, unsigned long pages,
>  
>      return 0;
>  }
> +
> +bool paging_ret_pages_to_domheap(struct domain *d, unsigned int nr_pages)
> +{
> +    struct page_info *page;
> +
> +    ASSERT(spin_is_locked(&d->arch.paging.lock));
> +
> +    if ( ACCESS_ONCE(d->arch.paging.total_pages) < nr_pages )
> +        return false;
> +
> +    for ( unsigned int i = 0; i < nr_pages; i++ )
> +    {
> +        /* Return memory to domheap. */
> +        page = page_list_remove_head(&d->arch.paging.freelist);
> +        if( page )
> +        {
> +            ACCESS_ONCE(d->arch.paging.total_pages)--;
> +            free_domheap_page(page);
> +        }
> +        else
> +        {
> +            printk(XENLOG_ERR
> +                   "Failed to free P2M pages, P2M freelist is empty.\n");
> +            return false;

Looks pretty redundant with half of paging_freelist_init(), including the
stray full stop in the log message.

Jan

