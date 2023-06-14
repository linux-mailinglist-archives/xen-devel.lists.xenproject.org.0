Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D9B7302EA
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 17:08:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548943.857194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9S6n-0006N9-Ta; Wed, 14 Jun 2023 15:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548943.857194; Wed, 14 Jun 2023 15:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9S6n-0006Kx-Qs; Wed, 14 Jun 2023 15:08:29 +0000
Received: by outflank-mailman (input) for mailman id 548943;
 Wed, 14 Jun 2023 15:08:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9S6m-0006Kk-QZ
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 15:08:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5080a6e0-0ac5-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 17:08:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C103D64274;
 Wed, 14 Jun 2023 15:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8B4C433C8;
 Wed, 14 Jun 2023 15:08:19 +0000 (UTC)
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
X-Inumbo-ID: 5080a6e0-0ac5-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686755306;
	bh=KMZ0sWg3oWLcgQ10FZDJEZz1Q4wDlpsgjoFRtVSwfW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H25tJoPWfpWcsaynauNwXB5hTK36bRqtx/0xTnssPgH0lhjlolKnlOLsfsGu434eI
	 CxYybNyd9SBr/0zVFCnQrFd7/DAbM63g53GRk5YtH7zmCHpo6SmKK/U51sN1E2BFQl
	 m04/LPDFqZFfvtJmJDOYTB/nU393uOzKg1Z3ZAInkjBg8hEXnAKN3CDXAJ7hETSDfQ
	 bbwHZ58euJx0VpBLsdgAjNte0WFG4VJlXw54eBPKUuDtJgtDpvznyTJ/YlrJnQxY8Q
	 qCOf+ZUXW3rIBbsyRwFsS4/dxVgK+bq5VCCnS7blNCFjXDH39Ph8uFmZvgC9UdIhtD
	 AY2vel4DKq+Jg==
Date: Wed, 14 Jun 2023 18:07:48 +0300
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
Subject: Re: [PATCH v4 23/34] hexagon: Convert __pte_free_tlb() to use ptdescs
Message-ID: <20230614150748.GV52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-24-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-24-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:04:12PM -0700, Vishal Moola (Oracle) wrote:
> Part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/hexagon/include/asm/pgalloc.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
> index f0c47e6a7427..55988625e6fb 100644
> --- a/arch/hexagon/include/asm/pgalloc.h
> +++ b/arch/hexagon/include/asm/pgalloc.h
> @@ -87,10 +87,10 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
>  		max_kernel_seg = pmdindex;
>  }
>  
> -#define __pte_free_tlb(tlb, pte, addr)		\
> -do {						\
> -	pgtable_pte_page_dtor((pte));		\
> -	tlb_remove_page((tlb), (pte));		\
> +#define __pte_free_tlb(tlb, pte, addr)				\
> +do {								\
> +	pagetable_pte_dtor((page_ptdesc(pte)));			\
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

