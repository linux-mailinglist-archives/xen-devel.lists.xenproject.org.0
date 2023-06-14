Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D29730394
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 17:21:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548990.857284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9SIj-0004mN-Sr; Wed, 14 Jun 2023 15:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548990.857284; Wed, 14 Jun 2023 15:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9SIj-0004jj-Pi; Wed, 14 Jun 2023 15:20:49 +0000
Received: by outflank-mailman (input) for mailman id 548990;
 Wed, 14 Jun 2023 15:20:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9SIh-0004jT-Pa
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 15:20:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08305fea-0ac7-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 17:20:45 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6917063A46;
 Wed, 14 Jun 2023 15:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7CFC433C8;
 Wed, 14 Jun 2023 15:20:36 +0000 (UTC)
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
X-Inumbo-ID: 08305fea-0ac7-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686756043;
	bh=96hB/Dutg7+YAlKNWDoQ2GAzZAZD6BC/gRuTrx6fMnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PFKiOvSreJTfh5Xtv6ubZJTR9fklehqu0ZAN5wgMUW/sLqZjohhJPxRlmW70y9tfb
	 MJLE0xzsHXtV1/gKV+4z7tPzVs1ZREMtj8U0/znRVOW0O8y6uNIHnGpjzdr49RBrYC
	 xBb5NI93jS0qUzMwboMr7y3y4ocYh19ocFZmLT8j7b8qsMYlxYS9jlizQt+L95Bpg7
	 ZJLiQdwmzorCuBbqjkmB8vgbIliB9r128kkEi0yENbNqrP9+TzrpqoRpFbndP1I//x
	 MAHASOLZvbHnJOfb7hXUM8MLSqBbEToS6swaIXlfv1V66JK3DzG4OV417sT6SCG7QR
	 ESRbrUE0cTyFQ==
Date: Wed, 14 Jun 2023 18:20:05 +0300
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
	Hugh Dickins <hughd@google.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v4 31/34] sparc64: Convert various functions to use
 ptdescs
Message-ID: <20230614152005.GD52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-32-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-32-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:04:20PM -0700, Vishal Moola (Oracle) wrote:
> As part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents, convert various page table functions to use ptdescs.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/sparc/mm/init_64.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index 04f9db0c3111..105915cd2eee 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -2893,14 +2893,15 @@ pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
>  
>  pgtable_t pte_alloc_one(struct mm_struct *mm)
>  {
> -	struct page *page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> -	if (!page)
> +	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL | __GFP_ZERO, 0);
> +
> +	if (!ptdesc)
>  		return NULL;
> -	if (!pgtable_pte_page_ctor(page)) {
> -		__free_page(page);
> +	if (!pagetable_pte_ctor(ptdesc)) {
> +		pagetable_free(ptdesc);
>  		return NULL;
>  	}
> -	return (pte_t *) page_address(page);
> +	return ptdesc_address(ptdesc);
>  }
>  
>  void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
> @@ -2910,10 +2911,10 @@ void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
>  
>  static void __pte_free(pgtable_t pte)
>  {
> -	struct page *page = virt_to_page(pte);
> +	struct ptdesc *ptdesc = virt_to_ptdesc(pte);
>  
> -	pgtable_pte_page_dtor(page);
> -	__free_page(page);
> +	pagetable_pte_dtor(ptdesc);
> +	pagetable_free(ptdesc);
>  }
>  
>  void pte_free(struct mm_struct *mm, pgtable_t pte)
> -- 
> 2.40.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Sincerely yours,
Mike.

