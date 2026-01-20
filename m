Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKYSCDa0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168794827C
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208833.1520967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viApm-000374-71; Tue, 20 Jan 2026 12:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208833.1520967; Tue, 20 Jan 2026 12:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viApm-00034f-3o; Tue, 20 Jan 2026 12:27:46 +0000
Received: by outflank-mailman (input) for mailman id 1208833;
 Tue, 20 Jan 2026 12:27:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JoV/=7Z=kernel.org=will@srs-se1.protection.inumbo.net>)
 id 1viApk-00034Z-40
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 12:27:44 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 698df239-f5fb-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 13:27:41 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D94D66011F;
 Tue, 20 Jan 2026 12:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6533FC19423;
 Tue, 20 Jan 2026 12:27:36 +0000 (UTC)
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
X-Inumbo-ID: 698df239-f5fb-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768912059;
	bh=b7Mbdz/B6k9B79H7XOHyXFan5oK4QyoZB2R8RyLKnA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyvATZaSrEe49sh1pTLv223SMZUXupyJ7AEH8b7OsfHEeQacfJO00Zf/WzAHWL9E4
	 YdtXc3YZVh9NSGcUhAD2bQvcACJ5PrjSRas0X6y7UOImj3QPKnx5QP1rSKYrFh5Mts
	 ukTURbyHiw+A+Kz5Vf26qHNwrORw2S4F45MPwEjPavVEHNIxp5dnd7uk7o0/DPXX7+
	 g73KWaKHxGDsX8vefv3wZzROajBumN3ybV4NMn2T3AnSa9jpAw36eCJjIuqT/JPkF0
	 Dt5GgYa0z7KnbSSkgeEZDb889qUkR918KJJZNX1gKKxnazEduQBZ+Q4614JxO2KCTn
	 WhoIppH/1oyUw==
Date: Tue, 20 Jan 2026 12:27:33 +0000
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
Subject: Re: [PATCH v2 1/8] arm64: Provide dcache_by_myline_op_nosync helper
Message-ID: <aW90tXGtLVC0mKWP@willie-the-truck>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-2-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226225254.46197-2-21cnbao@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oppo.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,arm.com:email,samsung.com:email];
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
X-Rspamd-Queue-Id: 168794827C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Dec 27, 2025 at 11:52:41AM +1300, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
> 
> dcache_by_myline_op ensures completion of the data cache operations for a
> region, while dcache_by_myline_op_nosync only issues them without waiting.
> This enables deferred synchronization so completion for multiple regions
> can be handled together later.
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
>  arch/arm64/include/asm/assembler.h  | 24 +++++++++++++++++++-----
>  arch/arm64/kernel/relocate_kernel.S |  3 ++-
>  2 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
> index f0ca7196f6fa..b408ed61866f 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -371,14 +371,13 @@ alternative_endif
>   * [start, end) with dcache line size explicitly provided.
>   *
>   * 	op:		operation passed to dc instruction
> - * 	domain:		domain used in dsb instruction
>   * 	start:          starting virtual address of the region
>   * 	end:            end virtual address of the region
>   *	linesz:		dcache line size
>   * 	fixup:		optional label to branch to on user fault
>   * 	Corrupts:       start, end, tmp
>   */
> -	.macro dcache_by_myline_op op, domain, start, end, linesz, tmp, fixup
> +	.macro raw_dcache_by_myline_op op, start, end, linesz, tmp, fixup
>  	sub	\tmp, \linesz, #1
>  	bic	\start, \start, \tmp
>  .Ldcache_op\@:
> @@ -402,14 +401,13 @@ alternative_endif
>  	add	\start, \start, \linesz
>  	cmp	\start, \end
>  	b.lo	.Ldcache_op\@
> -	dsb	\domain

Naming nit, but I'd prefer this to be dcache_by_myline_op_nosync() for
consistency with the other macros that you're adding. The 'raw' prefix
is used by raw_dcache_line_size() to indicate that we're getting the
value from the underlying hardware register.

>  
>  	_cond_uaccess_extable .Ldcache_op\@, \fixup
>  	.endm
>  
>  /*
>   * Macro to perform a data cache maintenance for the interval
> - * [start, end)
> + * [start, end) and wait for completion
>   *
>   * 	op:		operation passed to dc instruction
>   * 	domain:		domain used in dsb instruction
> @@ -420,7 +418,23 @@ alternative_endif
>   */
>  	.macro dcache_by_line_op op, domain, start, end, tmp1, tmp2, fixup
>  	dcache_line_size \tmp1, \tmp2
> -	dcache_by_myline_op \op, \domain, \start, \end, \tmp1, \tmp2, \fixup
> +	raw_dcache_by_myline_op \op, \start, \end, \tmp1, \tmp2, \fixup
> +	dsb \domain
> +	.endm

This could just be dcache_by_line_op_nosync() + dsb.

Will

