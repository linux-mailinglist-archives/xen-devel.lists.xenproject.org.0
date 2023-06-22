Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712EC73AC5A
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 00:06:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554180.865224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCSQe-0003td-OW; Thu, 22 Jun 2023 22:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554180.865224; Thu, 22 Jun 2023 22:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCSQe-0003rT-Ll; Thu, 22 Jun 2023 22:05:24 +0000
Received: by outflank-mailman (input) for mailman id 554180;
 Thu, 22 Jun 2023 22:05:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dx+e=CK=kernel.org=dinguyen@srs-se1.protection.inumbo.net>)
 id 1qCSQd-0003rN-9O
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 22:05:23 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df83ce5a-1148-11ee-8611-37d641c3527e;
 Fri, 23 Jun 2023 00:05:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7EF4861917;
 Thu, 22 Jun 2023 22:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB652C433C8;
 Thu, 22 Jun 2023 22:05:14 +0000 (UTC)
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
X-Inumbo-ID: df83ce5a-1148-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687471516;
	bh=dnifwmEwN5EPVqltpiQCF3MdFT37QyzPJA5VU9yHeeQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RzL6J1fXaBDz0XMnNSx8x8mXcyvopQkvOXbep39IPzJX6IZTiyxdwE2nHfhbPls3L
	 N+mS72rPbV5Hplxc5fgNpJiDPbV/HNUcjlNM0k72bojGJ4KjFY1InlFqwVw3x6nnQC
	 91+lFDGDXPX57EeoiKgvynYAipkz9J96TnpYMaik9KnCYZuHYn0BitFhgrP4G1fgbY
	 6R4Jpwcj42qDrlJ2D+uH33pP6SPXmc0IbmA4+yG9XAiy7RYgb0iOqdFeCCR7TQblLZ
	 fmEHl1XvZkPJVwZHZ1ypNXpY1N8YMHO70VuR9LvpNAy1Wj1k/paRgs0NZSlBf4+f5g
	 0uQe2Ka6aNE0g==
Message-ID: <bf396b3f-a3f3-817e-8241-222591f88c97@kernel.org>
Date: Thu, 22 Jun 2023 17:05:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
Content-Language: en-US
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 Mike Rapoport <rppt@kernel.org>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
 <20230622205745.79707-27-vishal.moola@gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20230622205745.79707-27-vishal.moola@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/22/23 15:57, Vishal Moola (Oracle) wrote:
> Part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>   arch/nios2/include/asm/pgalloc.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
> index ecd1657bb2ce..ce6bb8e74271 100644
> --- a/arch/nios2/include/asm/pgalloc.h
> +++ b/arch/nios2/include/asm/pgalloc.h
> @@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
>   
>   extern pgd_t *pgd_alloc(struct mm_struct *mm);
>   
> -#define __pte_free_tlb(tlb, pte, addr)				\
> -	do {							\
> -		pgtable_pte_page_dtor(pte);			\
> -		tlb_remove_page((tlb), (pte));			\
> +#define __pte_free_tlb(tlb, pte, addr)					\
> +	do {								\
> +		pagetable_pte_dtor(page_ptdesc(pte));			\
> +		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
>   	} while (0)
>   
>   #endif /* _ASM_NIOS2_PGALLOC_H */

Acked-by: Dinh Nguyen <dinguyen@kernel.org>

