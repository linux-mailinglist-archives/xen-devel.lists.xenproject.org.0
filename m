Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AAE7302E7
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 17:08:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548938.857184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9S65-0005qd-M1; Wed, 14 Jun 2023 15:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548938.857184; Wed, 14 Jun 2023 15:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9S65-0005oC-J4; Wed, 14 Jun 2023 15:07:45 +0000
Received: by outflank-mailman (input) for mailman id 548938;
 Wed, 14 Jun 2023 15:07:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9S63-0005o4-O1
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 15:07:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34ffa0b6-0ac5-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 17:07:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8DEC26433D;
 Wed, 14 Jun 2023 15:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBECC433C0;
 Wed, 14 Jun 2023 15:07:33 +0000 (UTC)
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
X-Inumbo-ID: 34ffa0b6-0ac5-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686755259;
	bh=JsVwqtt4rn+oBmP9veLZYMWTShEVF7o+ZQx0DgLi4Zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C5kIgCv/a7WFPC5tRs5sqFZpJHWZmRkycbqhaUCenxA+sXENaMqraBn8uW0a+QebT
	 mZ6OdRi8HqTKN/fLlxiLY+gYTEXBMlPJd7k4eHkAR+MLf6P+LaRVRHLiwBZOMWFPeh
	 Fhqqn9UjnVNIm5Q5RdXmqRztziwcn9ltJweM50aQJ0s3juJZJPLTo3DhbuvPdQJPaq
	 h2LbrXxJrmkyH9p2jpuC5ESJKX7YVXMhAfWp7vNoPgXlO5lI86wghzWDGdue/lx2YA
	 x6FoTUTEZw7X60hwDiqn+akRr/yO0jO9WPeQeAUaQGxHZWlG5RVnPrpPcimJ1Z2/OZ
	 FP8RrhHA6VKEw==
Date: Wed, 14 Jun 2023 18:07:03 +0300
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
	Hugh Dickins <hughd@google.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v4 22/34] csky: Convert __pte_free_tlb() to use ptdescs
Message-ID: <20230614150703.GU52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-23-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-23-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:04:11PM -0700, Vishal Moola (Oracle) wrote:
> Part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> Acked-by: Guo Ren <guoren@kernel.org>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/csky/include/asm/pgalloc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
> index 7d57e5da0914..9c84c9012e53 100644
> --- a/arch/csky/include/asm/pgalloc.h
> +++ b/arch/csky/include/asm/pgalloc.h
> @@ -63,8 +63,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  
>  #define __pte_free_tlb(tlb, pte, address)		\
>  do {							\
> -	pgtable_pte_page_dtor(pte);			\
> -	tlb_remove_page(tlb, pte);			\
> +	pagetable_pte_dtor(page_ptdesc(pte));		\
> +	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
>  } while (0)
>  
>  extern void pagetable_init(void);
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

