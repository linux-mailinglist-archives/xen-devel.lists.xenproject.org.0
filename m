Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E327303B0
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 17:22:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549001.857305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9SJz-0005sW-Fn; Wed, 14 Jun 2023 15:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549001.857305; Wed, 14 Jun 2023 15:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9SJz-0005qo-D5; Wed, 14 Jun 2023 15:22:07 +0000
Received: by outflank-mailman (input) for mailman id 549001;
 Wed, 14 Jun 2023 15:22:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9SJx-0005qa-Ut
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 15:22:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 378568ad-0ac7-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 17:22:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D3FB163FB4;
 Wed, 14 Jun 2023 15:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB0F1C433C0;
 Wed, 14 Jun 2023 15:21:55 +0000 (UTC)
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
X-Inumbo-ID: 378568ad-0ac7-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686756123;
	bh=JJW2yi8jE1xj4PNXmFMp5BSxmEmVsW21Z/BKD3ijRqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=haxUs5/rQ77/llId2yHHxl+zVtdTrLbyvMnIz3tsRFOuBfKBsufDFPpl6sJMFJSpX
	 XdXGa/cXbRpEhaCxlcG6vxqZV4ZzAZgnbLFIXOUhwM8Ua9bXir/zJSNTjBAjZ03+JP
	 UcP/tVhaYEkS/wXO6HoiCL3DGRWNQpiMx2frieXMXFBs/EuOP4yKcsZnjumnh7yMwt
	 mljclEUSRo9j+Uj9+qbtKqWdq7GxEjZQSCnkNZEtTei1kMdLBLTj7XgI45NhwTOXr3
	 4sBfJLEgvF707hwHqU6mKKWZix4M1FcPGJaAO0WdwWeDGAbdHkQfY6WNHFdb0Gm/o2
	 ZyO+xqT///0Fg==
Date: Wed, 14 Jun 2023 18:21:25 +0300
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
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v4 33/34] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Message-ID: <20230614152125.GF52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-34-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-34-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:04:22PM -0700, Vishal Moola (Oracle) wrote:
> Part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents. Also cleans up some spacing issues.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/um/include/asm/pgalloc.h | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
> index 8ec7cd46dd96..de5e31c64793 100644
> --- a/arch/um/include/asm/pgalloc.h
> +++ b/arch/um/include/asm/pgalloc.h
> @@ -25,19 +25,19 @@
>   */
>  extern pgd_t *pgd_alloc(struct mm_struct *);
>  
> -#define __pte_free_tlb(tlb,pte, address)		\
> -do {							\
> -	pgtable_pte_page_dtor(pte);			\
> -	tlb_remove_page((tlb),(pte));			\
> +#define __pte_free_tlb(tlb, pte, address)			\
> +do {								\
> +	pagetable_pte_dtor(page_ptdesc(pte));			\
> +	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
>  } while (0)
>  
>  #ifdef CONFIG_3_LEVEL_PGTABLES
>  
> -#define __pmd_free_tlb(tlb, pmd, address)		\
> -do {							\
> -	pgtable_pmd_page_dtor(virt_to_page(pmd));	\
> -	tlb_remove_page((tlb),virt_to_page(pmd));	\
> -} while (0)						\
> +#define __pmd_free_tlb(tlb, pmd, address)			\
> +do {								\
> +	pagetable_pmd_dtor(virt_to_ptdesc(pmd));			\
> +	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
> +} while (0)
>  
>  #endif
>  
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

