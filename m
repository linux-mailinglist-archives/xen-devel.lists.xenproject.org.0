Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC62873036B
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 17:18:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548974.857255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9SGA-0002DF-1N; Wed, 14 Jun 2023 15:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548974.857255; Wed, 14 Jun 2023 15:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9SG9-0002B1-Uo; Wed, 14 Jun 2023 15:18:09 +0000
Received: by outflank-mailman (input) for mailman id 548974;
 Wed, 14 Jun 2023 15:18:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9SG8-00029H-9T
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 15:18:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a863a5d1-0ac6-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 17:18:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ACE9E63EB4;
 Wed, 14 Jun 2023 15:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67DA4C433C8;
 Wed, 14 Jun 2023 15:17:56 +0000 (UTC)
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
X-Inumbo-ID: a863a5d1-0ac6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686755883;
	bh=law0Zw5GwZ4vUNNNJfg9xYUAxoAT1vEtTRSmu8uyTiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cB937Fc379p2H6sidrtQvcyE7SjhSVDiQ8fsfmvBYud73st4wP2Qr6CFo6WX9/s01
	 JYMAIyN+HTRUEnFbhSLa+5Bn06wSCkvLo2zbfe78NcaE+yN0m1csBgyzH+54BdgaWi
	 hkj4tSqaMdn2dDgxx8M+SxKDaATfhmPSw7zNp6q69zKYgpuwrRcJK0OU5fI0Lc5b7j
	 +QW7NONIzYePXcwPMPgPxV4DoA23QefODa2dgADcpUJVKL052M5kYJPDNeYMVnlftS
	 C4Vh7z6LpoOu9Cg6NCMdB+LohoR3p8kQll2UeaT5KBeo1s+c1aEFnsfa9r1LjcJVdi
	 JIaKu8RQMiB8g==
Date: Wed, 14 Jun 2023 18:17:26 +0300
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
	Hugh Dickins <hughd@google.com>, Jonas Bonn <jonas@southpole.se>
Subject: Re: [PATCH v4 28/34] openrisc: Convert __pte_free_tlb() to use
 ptdescs
Message-ID: <20230614151726.GA52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-29-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-29-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:04:17PM -0700, Vishal Moola (Oracle) wrote:
> Part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/openrisc/include/asm/pgalloc.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
> index b7b2b8d16fad..c6a73772a546 100644
> --- a/arch/openrisc/include/asm/pgalloc.h
> +++ b/arch/openrisc/include/asm/pgalloc.h
> @@ -66,10 +66,10 @@ extern inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  
>  extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
>  
> -#define __pte_free_tlb(tlb, pte, addr)	\
> -do {					\
> -	pgtable_pte_page_dtor(pte);	\
> -	tlb_remove_page((tlb), (pte));	\
> +#define __pte_free_tlb(tlb, pte, addr)				\
> +do {								\
> +	pagetable_pte_dtor(page_ptdesc(pte));			\
> +	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
>  } while (0)
>  
>  #endif
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

