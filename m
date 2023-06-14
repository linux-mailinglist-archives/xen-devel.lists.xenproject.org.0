Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC4B730034
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 15:36:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548786.856924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Qes-0007Z9-Me; Wed, 14 Jun 2023 13:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548786.856924; Wed, 14 Jun 2023 13:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Qes-0007WA-Js; Wed, 14 Jun 2023 13:35:34 +0000
Received: by outflank-mailman (input) for mailman id 548786;
 Wed, 14 Jun 2023 13:35:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9Qer-0007W4-3I
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 13:35:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5498c472-0ab8-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 15:35:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E80460F45;
 Wed, 14 Jun 2023 13:35:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0713C433CA;
 Wed, 14 Jun 2023 13:35:22 +0000 (UTC)
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
X-Inumbo-ID: 5498c472-0ab8-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686749729;
	bh=81ZlQN2KCaIJsbaaGHZ2hKMohISmlbSD+ssqzisoAQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=peVIK5PcFaRM99or9IKjg5Wk1GpROr9ctyT8BIC08WEGhT/YvEFdtyhqzVHUa/AJj
	 e0i1V5xO3S+nkbZMN2Z1j+Bn1zFA3bcGptvRkcKcxOtQ1DiUiH/SRvFWkjYuPvNtOb
	 /7PZZr5SP19VfVlFD96OM/KULQ1zOIX2Xbubj4bVzLGTDR+801nenrylY8DxDwa57O
	 6Uw9KCAyHqA9nB1qo3GINyvqzZNtOwnsJDGtTX7sr0o8aiGfHvWm3PF1wyD410WZI6
	 eWxsBLAJy2LJHLpDUj97I0afV+G5xEfwOHfY+jLMTVk+L4qUJ/WcbncB5RrE8B814w
	 cPPJ2HH5q8yYA==
Date: Wed, 14 Jun 2023 16:34:51 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v4 04/34] pgtable: Create struct ptdesc
Message-ID: <20230614133451.GC52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-5-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-5-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:03:53PM -0700, Vishal Moola (Oracle) wrote:
> Currently, page table information is stored within struct page. As part
> of simplifying struct page, create struct ptdesc for page table
> information.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/pgtable.h | 51 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index c5a51481bbb9..330de96ebfd6 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -975,6 +975,57 @@ static inline void ptep_modify_prot_commit(struct vm_area_struct *vma,
>  #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
>  #endif /* CONFIG_MMU */
>  
> +
> +/**
> + * struct ptdesc - Memory descriptor for page tables.
> + * @__page_flags: Same as page flags. Unused for page tables.
> + * @pt_list: List of used page tables. Used for s390 and x86.
> + * @_pt_pad_1: Padding that aliases with page's compound head.
> + * @pmd_huge_pte: Protected by ptdesc->ptl, used for THPs.
> + * @_pt_s390_gaddr: Aliases with page's mapping. Used for s390 gmap only.
> + * @pt_mm: Used for x86 pgds.
> + * @pt_frag_refcount: For fragmented page table tracking. Powerpc and s390 only.
> + * @ptl: Lock for the page table.

Do you mind aligning the descriptions by @pt_frag_refcount? I think it'll
be more readable.

> + *
> + * This struct overlays struct page for now. Do not modify without a good
> + * understanding of the issues.
> + */
> +struct ptdesc {
> +	unsigned long __page_flags;
> +
> +	union {
> +		struct list_head pt_list;
> +		struct {
> +			unsigned long _pt_pad_1;
> +			pgtable_t pmd_huge_pte;
> +		};
> +	};
> +	unsigned long _pt_s390_gaddr;
> +
> +	union {
> +		struct mm_struct *pt_mm;
> +		atomic_t pt_frag_refcount;
> +	};
> +
> +#if ALLOC_SPLIT_PTLOCKS
> +	spinlock_t *ptl;
> +#else
> +	spinlock_t ptl;
> +#endif
> +};
> +
> +#define TABLE_MATCH(pg, pt)						\
> +	static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
> +TABLE_MATCH(flags, __page_flags);
> +TABLE_MATCH(compound_head, pt_list);
> +TABLE_MATCH(compound_head, _pt_pad_1);
> +TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
> +TABLE_MATCH(mapping, _pt_s390_gaddr);
> +TABLE_MATCH(pt_mm, pt_mm);
> +TABLE_MATCH(ptl, ptl);
> +#undef TABLE_MATCH
> +static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
> +
>  /*
>   * No-op macros that just return the current protection value. Defined here
>   * because these macros can be used even if CONFIG_MMU is not defined.
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

