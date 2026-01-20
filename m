Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPw/FS+0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC8C48240
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208842.1520978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viAvg-0004gp-QI; Tue, 20 Jan 2026 12:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208842.1520978; Tue, 20 Jan 2026 12:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viAvg-0004ei-NT; Tue, 20 Jan 2026 12:33:52 +0000
Received: by outflank-mailman (input) for mailman id 1208842;
 Tue, 20 Jan 2026 12:33:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JoV/=7Z=kernel.org=will@srs-se1.protection.inumbo.net>)
 id 1viAve-0004eb-N8
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 12:33:50 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43fecaeb-f5fc-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 13:33:48 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5099943FA3;
 Tue, 20 Jan 2026 12:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 001ABC16AAE;
 Tue, 20 Jan 2026 12:33:42 +0000 (UTC)
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
X-Inumbo-ID: 43fecaeb-f5fc-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768912426;
	bh=Y0bXJFrIMQu42HkX8sO2hSl2uRvMmAIUm4N1kYYXYbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TxGZV8yxxs7f9OIOe/76/YrYaqjVeBTLmNJdeq9rZnYXtQBKVVFzF9G+vZXhnfGlh
	 vT9CZ7egfF2YJDaVzTZCoXW7WvjE6P9hHlULJeQGsNLJOVQ6GN8ql7pboCjgU4WGCe
	 Vt8ME1f66ylY9a+GCkoyhnoJhXrb39PCRzYGGNaz54bIGYkZiF1bgZi24H9uytWylw
	 9Pa1LQ5sYMXUi5RHj69gPO6rv2NvuLMgE69i3zkNmc//4jIPBEZz5BqT8SQXYiPd6j
	 m+4BX8yGRcFm1xNp3e9O6KxgephbObAfu5q0mTQt6b0ny660NNsJKm//uUu92158VD
	 Rk2ttoJ8XgDvA==
Date: Tue, 20 Jan 2026 12:33:39 +0000
From: Will Deacon <will@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Cc: catalin.marinas@arm.com, m.szyprowski@samsung.com, robin.murphy@arm.com,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Barry Song <baohua@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH v2 3/8] arm64: Provide dcache_inval_poc_nosync helper
Message-ID: <aW92I_sn9VqDPLKz@willie-the-truck>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-4-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226225254.46197-4-21cnbao@gmail.com>
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:21cnbao@gmail.com,m:catalin.marinas@arm.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:baohua@kernel.org,m:leon@kernel.org,m:ada.coupriediaz@arm.com,m:ardb@kernel.org,m:maz@kernel.org,m:anshuman.khandual@arm.com,m:ryan.roberts@arm.com,m:surenb@google.com,m:zhengtangquan@oppo.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[will@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,arm.com:email,samsung.com:email,oppo.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2EC8C48240
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Dec 27, 2025 at 11:52:43AM +1300, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
> 
> dcache_inval_poc_nosync does not wait for the data cache invalidation to
> complete. Later, we defer the synchronization so we can wait for all SG
> entries together.
> 
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <baohua@kernel.org>
> ---
>  arch/arm64/include/asm/cacheflush.h |  1 +
>  arch/arm64/mm/cache.S               | 42 +++++++++++++++++++++--------
>  2 files changed, 32 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
> index 9b6d0a62cf3d..382b4ac3734d 100644
> --- a/arch/arm64/include/asm/cacheflush.h
> +++ b/arch/arm64/include/asm/cacheflush.h
> @@ -74,6 +74,7 @@ extern void icache_inval_pou(unsigned long start, unsigned long end);
>  extern void dcache_clean_inval_poc(unsigned long start, unsigned long end);
>  extern void dcache_inval_poc(unsigned long start, unsigned long end);
>  extern void dcache_clean_poc(unsigned long start, unsigned long end);
> +extern void dcache_inval_poc_nosync(unsigned long start, unsigned long end);
>  extern void dcache_clean_poc_nosync(unsigned long start, unsigned long end);
>  extern void dcache_clean_pop(unsigned long start, unsigned long end);
>  extern void dcache_clean_pou(unsigned long start, unsigned long end);
> diff --git a/arch/arm64/mm/cache.S b/arch/arm64/mm/cache.S
> index 4a7c7e03785d..99a093d3aecb 100644
> --- a/arch/arm64/mm/cache.S
> +++ b/arch/arm64/mm/cache.S
> @@ -132,17 +132,7 @@ alternative_else_nop_endif
>  	ret
>  SYM_FUNC_END(dcache_clean_pou)
>  
> -/*
> - *	dcache_inval_poc(start, end)
> - *
> - * 	Ensure that any D-cache lines for the interval [start, end)
> - * 	are invalidated. Any partial lines at the ends of the interval are
> - *	also cleaned to PoC to prevent data loss.
> - *
> - *	- start   - kernel start address of region
> - *	- end     - kernel end address of region
> - */
> -SYM_FUNC_START(__pi_dcache_inval_poc)
> +.macro raw_dcache_inval_poc_macro
>  	dcache_line_size x2, x3
>  	sub	x3, x2, #1
>  	tst	x1, x3				// end cache line aligned?
> @@ -158,11 +148,41 @@ SYM_FUNC_START(__pi_dcache_inval_poc)
>  3:	add	x0, x0, x2
>  	cmp	x0, x1
>  	b.lo	2b
> +.endm
> +
> +/*
> + *	dcache_inval_poc(start, end)
> + *
> + * 	Ensure that any D-cache lines for the interval [start, end)
> + * 	are invalidated. Any partial lines at the ends of the interval are
> + *	also cleaned to PoC to prevent data loss.
> + *
> + *	- start   - kernel start address of region
> + *	- end     - kernel end address of region
> + */
> +SYM_FUNC_START(__pi_dcache_inval_poc)
> +	raw_dcache_inval_poc_macro
>  	dsb	sy
>  	ret
>  SYM_FUNC_END(__pi_dcache_inval_poc)
>  SYM_FUNC_ALIAS(dcache_inval_poc, __pi_dcache_inval_poc)
>  
> +/*
> + *	dcache_inval_poc_nosync(start, end)
> + *
> + * 	Issue the instructions of D-cache lines for the interval [start, end)
> + * 	for invalidation. Not necessarily cleaned to PoC till an explicit dsb
> + *	sy is issued later
> + *
> + *	- start   - kernel start address of region
> + *	- end     - kernel end address of region
> + */
> +SYM_FUNC_START(__pi_dcache_inval_poc_nosync)
> +	raw_dcache_inval_poc_macro
> +	ret

Sorry, similar naming nit to the other patch. Let's have the macro use
the 'nosync' suffix instead of the 'raw' prefix. You can chuck some
underscores at it if you want to keep the name of this function the same.

Will

