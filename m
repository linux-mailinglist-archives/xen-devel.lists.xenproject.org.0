Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3777A93E524
	for <lists+xen-devel@lfdr.de>; Sun, 28 Jul 2024 14:48:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766124.1176661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sY3JU-0006Fu-LM; Sun, 28 Jul 2024 12:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766124.1176661; Sun, 28 Jul 2024 12:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sY3JU-0006D5-Hj; Sun, 28 Jul 2024 12:47:48 +0000
Received: by outflank-mailman (input) for mailman id 766124;
 Sun, 28 Jul 2024 12:47:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h+eR=O4=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1sY3JT-0006Cz-H6
 for xen-devel@lists.xenproject.org; Sun, 28 Jul 2024 12:47:47 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9583d2e5-4cdf-11ef-bc01-fd08da9f4363;
 Sun, 28 Jul 2024 14:47:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1520FCE01FE;
 Sun, 28 Jul 2024 12:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1214EC116B1;
 Sun, 28 Jul 2024 12:47:33 +0000 (UTC)
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
X-Inumbo-ID: 9583d2e5-4cdf-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722170862;
	bh=7DAw1bh/7KLG2aowoCQ2qKx/EFyJdeQ1d+TtPaE81w4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKSOfRoyAcagm/ZCjuUtmZe1LP1/m3qOMpkt+Ja038rI7l8A3gAIiS9vTlhyRlcph
	 q9W3Gs/md02my2rqjor8RoVRuhKeRng2CLjeuQpPwElHl4VIJ1PE8mhHy3nlfCsgPo
	 diba//3nG7207nq7Hoz29mmSrKFjel41IEd1K+OUbqJ9ji9TOMZcPpMQo+WMhANpud
	 6Q847BLXlRgpdKyKpfoIprH/01r3UrVLIMjJqRG5P1sgBD0Z0nzmDaGOzqSAcDzpJq
	 76zEEQv9n49HVtrhliR31CW/giJaLvR0UAqUXFsYST53aU5H48QgjliObfxaz9+zTj
	 RELQP2y7z3fMw==
Date: Sun, 28 Jul 2024 15:47:19 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v1 2/3] mm/hugetlb: enforce that PMD PT sharing has split
 PMD PT locks
Message-ID: <ZqY918UEsmkbIGOn@kernel.org>
References: <20240726150728.3159964-1-david@redhat.com>
 <20240726150728.3159964-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726150728.3159964-3-david@redhat.com>

On Fri, Jul 26, 2024 at 05:07:27PM +0200, David Hildenbrand wrote:
> Sharing page tables between processes but falling back to per-MM page
> table locks cannot possibly work.
> 
> So, let's make sure that we do have split PMD locks by adding a new
> Kconfig option and letting that depend on CONFIG_SPLIT_PMD_PTLOCKS.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  fs/Kconfig              | 4 ++++
>  include/linux/hugetlb.h | 5 ++---
>  mm/hugetlb.c            | 8 ++++----
>  3 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/Kconfig b/fs/Kconfig
> index a46b0cbc4d8f6..0e4efec1d92e6 100644
> --- a/fs/Kconfig
> +++ b/fs/Kconfig
> @@ -288,6 +288,10 @@ config HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>  	depends on ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
>  	depends on SPARSEMEM_VMEMMAP
>  
> +config HUGETLB_PMD_PAGE_TABLE_SHARING
> +	def_bool HUGETLB_PAGE
> +	depends on ARCH_WANT_HUGE_PMD_SHARE && SPLIT_PMD_PTLOCKS
> +
>  config ARCH_HAS_GIGANTIC_PAGE
>  	bool
>  
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index da800e56fe590..4d2f3224ff027 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -1243,7 +1243,7 @@ static inline __init void hugetlb_cma_reserve(int order)
>  }
>  #endif
>  
> -#ifdef CONFIG_ARCH_WANT_HUGE_PMD_SHARE
> +#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
>  static inline bool hugetlb_pmd_shared(pte_t *pte)
>  {
>  	return page_count(virt_to_page(pte)) > 1;
> @@ -1279,8 +1279,7 @@ bool __vma_private_lock(struct vm_area_struct *vma);
>  static inline pte_t *
>  hugetlb_walk(struct vm_area_struct *vma, unsigned long addr, unsigned long sz)
>  {
> -#if defined(CONFIG_HUGETLB_PAGE) && \
> -	defined(CONFIG_ARCH_WANT_HUGE_PMD_SHARE) && defined(CONFIG_LOCKDEP)
> +#if defined(CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING) && defined(CONFIG_LOCKDEP)
>  	struct hugetlb_vma_lock *vma_lock = vma->vm_private_data;
>  
>  	/*
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 0858a18272073..c4d94e122c41f 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -7211,7 +7211,7 @@ long hugetlb_unreserve_pages(struct inode *inode, long start, long end,
>  	return 0;
>  }
>  
> -#ifdef CONFIG_ARCH_WANT_HUGE_PMD_SHARE
> +#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
>  static unsigned long page_table_shareable(struct vm_area_struct *svma,
>  				struct vm_area_struct *vma,
>  				unsigned long addr, pgoff_t idx)
> @@ -7373,7 +7373,7 @@ int huge_pmd_unshare(struct mm_struct *mm, struct vm_area_struct *vma,
>  	return 1;
>  }
>  
> -#else /* !CONFIG_ARCH_WANT_HUGE_PMD_SHARE */
> +#else /* !CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING */
>  
>  pte_t *huge_pmd_share(struct mm_struct *mm, struct vm_area_struct *vma,
>  		      unsigned long addr, pud_t *pud)
> @@ -7396,7 +7396,7 @@ bool want_pmd_share(struct vm_area_struct *vma, unsigned long addr)
>  {
>  	return false;
>  }
> -#endif /* CONFIG_ARCH_WANT_HUGE_PMD_SHARE */
> +#endif /* CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING */
>  
>  #ifdef CONFIG_ARCH_WANT_GENERAL_HUGETLB
>  pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
> @@ -7494,7 +7494,7 @@ unsigned long hugetlb_mask_last_page(struct hstate *h)
>  /* See description above.  Architectures can provide their own version. */
>  __weak unsigned long hugetlb_mask_last_page(struct hstate *h)
>  {
> -#ifdef CONFIG_ARCH_WANT_HUGE_PMD_SHARE
> +#ifdef CONFIG_HUGETLB_PMD_PAGE_TABLE_SHARING
>  	if (huge_page_size(h) == PMD_SIZE)
>  		return PUD_SIZE - PMD_SIZE;
>  #endif
> -- 
> 2.45.2
> 
> 

-- 
Sincerely yours,
Mike.

