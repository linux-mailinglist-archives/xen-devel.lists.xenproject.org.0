Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5054AC6F4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 18:16:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267305.461037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH7cK-0002kx-Cq; Mon, 07 Feb 2022 17:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267305.461037; Mon, 07 Feb 2022 17:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH7cK-0002j5-9e; Mon, 07 Feb 2022 17:15:56 +0000
Received: by outflank-mailman (input) for mailman id 267305;
 Mon, 07 Feb 2022 17:15:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nH7cI-0002iz-LH
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 17:15:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nH7cH-0008P7-Uy; Mon, 07 Feb 2022 17:15:53 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.85.34.134])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nH7cH-0003VD-O5; Mon, 07 Feb 2022 17:15:53 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=9AklaNXkc/eUFtckciNNpWEwowtxTE53TdJJ8omKKpk=; b=mNPJMjNXabSK9whZNl1tFOMvky
	AA5BLcaBK6y0JplqBert/gz25WuFUR5QE15UGdbnqI3fzI3ib8KlmhSCtfqPZdr+Jqq6AkCfIZ916
	w1FEWwdz1YoKuGD/KQlfeMz09Kgzl9HCMiUQSx/Ns/T0hBzWmrTG15OqORP+LbK6ZaKc=;
Message-ID: <a54213c4-1c68-694e-c130-d95faeef3953@xen.org>
Date: Mon, 7 Feb 2022 17:15:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 05/01/2022 23:11, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Rework Arm implementation to store grant table frame GFN
> in struct page_info directly instead of keeping it in
> standalone status/shared arrays. This patch is based on
> the assumption that grant table page is the xenheap page.

I would write "grant table pages are xenheap pages" or "a grant table 
page is a xenheap page".

[...]

> diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
> index d31a4d6..d6fda31 100644
> --- a/xen/arch/arm/include/asm/grant_table.h
> +++ b/xen/arch/arm/include/asm/grant_table.h
> @@ -11,11 +11,6 @@
>   #define INITIAL_NR_GRANT_FRAMES 1U
>   #define GNTTAB_MAX_VERSION 1
>   
> -struct grant_table_arch {
> -    gfn_t *shared_gfn;
> -    gfn_t *status_gfn;
> -};
> -
>   static inline void gnttab_clear_flags(struct domain *d,
>                                         unsigned int mask, uint16_t *addr)
>   {
> @@ -46,41 +41,12 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>   #define gnttab_dom0_frames()                                             \
>       min_t(unsigned int, opt_max_grant_frames, PFN_DOWN(_etext - _stext))
>   
> -#define gnttab_init_arch(gt)                                             \
> -({                                                                       \
> -    unsigned int ngf_ = (gt)->max_grant_frames;                          \
> -    unsigned int nsf_ = grant_to_status_frames(ngf_);                    \
> -                                                                         \
> -    (gt)->arch.shared_gfn = xmalloc_array(gfn_t, ngf_);                  \
> -    (gt)->arch.status_gfn = xmalloc_array(gfn_t, nsf_);                  \
> -    if ( (gt)->arch.shared_gfn && (gt)->arch.status_gfn )                \
> -    {                                                                    \
> -        while ( ngf_-- )                                                 \
> -            (gt)->arch.shared_gfn[ngf_] = INVALID_GFN;                   \
> -        while ( nsf_-- )                                                 \
> -            (gt)->arch.status_gfn[nsf_] = INVALID_GFN;                   \
> -    }                                                                    \
> -    else                                                                 \
> -        gnttab_destroy_arch(gt);                                         \
> -    (gt)->arch.shared_gfn ? 0 : -ENOMEM;                                 \
> -})
> -
> -#define gnttab_destroy_arch(gt)                                          \
> -    do {                                                                 \
> -        XFREE((gt)->arch.shared_gfn);                                    \
> -        XFREE((gt)->arch.status_gfn);                                    \
> -    } while ( 0 )
> -
>   #define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
>       ({                                                                   \
> -        int rc_ = 0;                                                     \
>           gfn_t ogfn = gnttab_get_frame_gfn(gt, st, idx);                  \
> -        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||           \
> -             (rc_ = guest_physmap_remove_page((gt)->domain, ogfn, mfn,   \
> -                                              0)) == 0 )                 \
> -            ((st) ? (gt)->arch.status_gfn                                \
> -                  : (gt)->arch.shared_gfn)[idx] = (gfn);                 \
> -        rc_;                                                             \
> +        (!gfn_eq(ogfn, INVALID_GFN) && !gfn_eq(ogfn, gfn))               \
> +         ? guest_physmap_remove_page((gt)->domain, ogfn, mfn, 0)         \
> +         : 0;                                                            \

Given that we are implementing something similar to an M2P, I was 
expecting the implementation to be pretty much the same as the x86 helper.

Would you be able to outline why it is different?

>       })
>   
>   #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
> @@ -88,11 +54,21 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>           : gnttab_shared_gfn(NULL, gt, idx);                              \
>   })
>   
> -#define gnttab_shared_gfn(d, t, i)                                       \
> -    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
> +#define gnttab_shared_page(t, i) ({                                      \
> +    virt_to_page((t)->shared_raw[i]);                                    \
> +})

This can be simplified to:

#define gnttab_shared_page(t, i) virt_to_page((t)->shared_raw[i])

> +
> +#define gnttab_status_page(t, i) ({                                      \
> +    virt_to_page((t)->status[i]);                                        \
> +})

Same here.

>   
> -#define gnttab_status_gfn(d, t, i)                                       \
> -    (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
> +#define gnttab_shared_gfn(d, t, i) ({                                    \
> +    page_get_xenheap_gfn(gnttab_shared_page(t, i));                      \
> +})

Same here

> +
> +#define gnttab_status_gfn(d, t, i) ({                                    \
> +    page_get_xenheap_gfn(gnttab_status_page(t, i));                      \
> +})

Same here.

>   
>   #define gnttab_need_iommu_mapping(d)                    \
>       (is_domain_direct_mapped(d) && is_iommu_enabled(d))
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 424aaf2..b99044c 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -98,9 +98,22 @@ struct page_info
>   #define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
>   #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
>   
> - /* Count of uses of this frame as its current type. */
> -#define PGT_count_width   PG_shift(2)
> -#define PGT_count_mask    ((1UL<<PGT_count_width)-1)
> + /* 2-bit count of uses of this frame as its current type. */
> +#define PGT_count_mask    PG_mask(3, 3)
> +
> +/*
> + * Stored in bits [28:0] or [60:0] GFN if page is xenheap page.

This comment would be easier to understand if you add resp. (arm32) and 
(arm64) after each range.

> + */
> +#define PGT_gfn_width     PG_shift(3)
> +#define PGT_gfn_mask      ((1UL<<PGT_gfn_width)-1)
> +
> +#define PGT_INVALID_XENHEAP_GFN   _gfn(PGT_gfn_mask)
> +
> +/*
> + * An arch-specific initialization pattern is needed for the type_info field
> + * as it's GFN portion can contain the valid GFN if page is xenheap page.
> + */
> +#define PGT_TYPE_INFO_INIT_PATTERN   gfn_x(PGT_INVALID_XENHEAP_GFN)
>   
>    /* Cleared when the owning guest 'frees' this page. */
>   #define _PGC_allocated    PG_shift(1)
> @@ -358,6 +371,25 @@ void clear_and_clean_page(struct page_info *page);
>   
>   unsigned int arch_get_dma_bitsize(void);
>   
> +static inline gfn_t page_get_xenheap_gfn(const struct page_info *p)
> +{
> +    gfn_t gfn_ = _gfn(p->u.inuse.type_info & PGT_gfn_mask);
> +
> +    ASSERT(is_xen_heap_page(p));
> +
> +    return gfn_eq(gfn_, PGT_INVALID_XENHEAP_GFN) ? INVALID_GFN : gfn_;
> +}
> +
> +static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
> +{
> +    gfn_t gfn_ = gfn_eq(gfn, INVALID_GFN) ? PGT_INVALID_XENHEAP_GFN : gfn;
> +
> +    ASSERT(is_xen_heap_page(p));
> +
> +    p->u.inuse.type_info &= ~PGT_gfn_mask;
> +    p->u.inuse.type_info |= gfn_x(gfn_);
> +}

This is not going to be atomic. So can you outline which locking 
mechanism should be used to protect access (set/get) to the GFN?

I will do another review of the patch once I know what we locking should 
protect the accesses.

Cheers,

-- 
Julien Grall

