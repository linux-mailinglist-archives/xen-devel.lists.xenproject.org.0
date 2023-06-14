Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA887303A2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 17:21:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548998.857295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9SJT-0005Oh-9Q; Wed, 14 Jun 2023 15:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548998.857295; Wed, 14 Jun 2023 15:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9SJT-0005Me-5g; Wed, 14 Jun 2023 15:21:35 +0000
Received: by outflank-mailman (input) for mailman id 548998;
 Wed, 14 Jun 2023 15:21:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9SJS-00059p-6H
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 15:21:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24cbd02f-0ac7-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 17:21:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 66B1D63A8D;
 Wed, 14 Jun 2023 15:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A344C433C8;
 Wed, 14 Jun 2023 15:21:24 +0000 (UTC)
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
X-Inumbo-ID: 24cbd02f-0ac7-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686756091;
	bh=il/HQfNL/uVoI8Ww57mtbKzYiPMAc1DKtiQkMGOtIfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EVqVK3+cHzzM3I6jLTXFddZxbFNGPyRkmUP04L3rXdQHtkhROZjeS4xs716iEeHdI
	 3NTDNl7d+xttJku6jL5Vp2AtMEzW22vWDWbwjll2V8vVRNY23vhOyS7i+LK0LxbXdw
	 FLa/cSLNMXXmsxuzrxQhCn+drunkS9V+mQxgMLtHYqy48lWC0KA1CxMftayd+ywuMN
	 LLMWJKOOtCwfpjAWz8cODynASF/ygJUUKBwEscMZxGpjyvRIOPidi0xPpAYKGa2gya
	 /E5L+RC/PloG4xdfJOfUmDMA7VZBXAl85QlMPjo/CmXi01rcsEFX+MuFeeezAt7qfD
	 tIubuOBxrNFBw==
Date: Wed, 14 Jun 2023 18:20:53 +0300
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
Subject: Re: [PATCH v4 32/34] sparc: Convert pgtable_pte_page_{ctor, dtor}()
 to ptdesc equivalents
Message-ID: <20230614152053.GE52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-33-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-33-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:04:21PM -0700, Vishal Moola (Oracle) wrote:
> Part of the conversions to replace pgtable pte constructor/destructors with
> ptdesc equivalents.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/sparc/mm/srmmu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
> index 13f027afc875..8393faa3e596 100644
> --- a/arch/sparc/mm/srmmu.c
> +++ b/arch/sparc/mm/srmmu.c
> @@ -355,7 +355,8 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
>  		return NULL;
>  	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
>  	spin_lock(&mm->page_table_lock);
> -	if (page_ref_inc_return(page) == 2 && !pgtable_pte_page_ctor(page)) {
> +	if (page_ref_inc_return(page) == 2 &&
> +			!pagetable_pte_ctor(page_ptdesc(page))) {
>  		page_ref_dec(page);
>  		ptep = NULL;
>  	}
> @@ -371,7 +372,7 @@ void pte_free(struct mm_struct *mm, pgtable_t ptep)
>  	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
>  	spin_lock(&mm->page_table_lock);
>  	if (page_ref_dec_return(page) == 1)
> -		pgtable_pte_page_dtor(page);
> +		pagetable_pte_dtor(page_ptdesc(page));
>  	spin_unlock(&mm->page_table_lock);
>  
>  	srmmu_free_nocache(ptep, SRMMU_PTE_TABLE_SIZE);
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

