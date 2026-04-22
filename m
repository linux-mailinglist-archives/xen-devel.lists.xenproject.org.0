Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GD4SEL1F6Wl3XAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 00:03:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89BD44B320
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 00:03:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291219.1570413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFfec-0000F1-Oq; Wed, 22 Apr 2026 22:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291219.1570413; Wed, 22 Apr 2026 22:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFfec-0000DF-LL; Wed, 22 Apr 2026 22:02:42 +0000
Received: by outflank-mailman (input) for mailman id 1291219;
 Wed, 22 Apr 2026 22:02:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1wFfeb-0000D9-DA
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 22:02:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFfea-00CMMP-QA
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 00:02:40 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e9456b-2eae-0a2a0a5409dd-0a2a450ca3b6-18
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 00:02:40 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <sstabellini@kernel.org>)
 id 69e9457f-62f1-0a2a450c0019-ac6904fe9f98-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 00:02:40 +0200
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 14C2461334;
 Wed, 22 Apr 2026 22:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84666C19425;
 Wed, 22 Apr 2026 22:02:38 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776895358;
	bh=eVqQbhtcmM6jxGXcwZAWX+7cU7dFEViGdbj3XrFpMfI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KXPm/YAkF+EWCndYuDOVyTtmRkH99JTl8+MfrluMxcDpLi/LfTZ0QN7g0xHO7hvda
	 +CMXRUvclh4UnQG+UGAyeVPSuriNPkuEETGHAQtdcJnk5Om/b4n5S75NtGDzSPJj0y
	 1iAydKabdDoF+BNPsunrHPoV81RDff+OCQqe9bzmnJyx2lLW8Rc0NFIxE1UwTNX5qi
	 MGI3IpzG0oW8X0HlulQB+2U4OvC3m3ErzLWecagh/VUSKAnJMoiy8oPZHyS1AtThZh
	 EorK23wz+xUOgI42pZfVlPFBhqb9vMD3MJy2yMBmrVPGbJ9EURbVh1DbYOYMASHvEB
	 NPTENeL0uLgXw==
Date: Wed, 22 Apr 2026 15:02:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com
Subject: Re: [PATCH v1 1/1] arm64/insn: Avoid undefined behaviour in branch
 offset decode
In-Reply-To: <20260422164506.2234095-2-edgar.iglesias@amd.com>
Message-ID: <alpine.DEB.2.22.394.2604221502320.2712345@ubuntu-linux-20-04-desktop>
References: <20260422164506.2234095-1-edgar.iglesias@amd.com> <20260422164506.2234095-2-edgar.iglesias@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-d25034/1776895360-F4C07CF5-2527E894/0/0
X-purgate-type: clean
X-purgate-size: 1717
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edgar.iglesias@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D89BD44B320
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 22 Apr 2026, Edgar E. Iglesias wrote:
> Branch offset decoding sign-extends the immediate by shifting it left into
> bit 31 and back. Perform the left shift in uint32_t and cast to int32_t
> only for the final right shift to avoid UBSAN failures on negative offsets.
> 
> Fixes: 6dbf3f0e3074 ("xen/arm: arm64: Add helpers to decode and encode branch instructions")
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  xen/arch/arm/arm64/insn.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/insn.c b/xen/arch/arm/arm64/insn.c
> index 81f7914610..6b97a84ba7 100644
> --- a/xen/arch/arm/arm64/insn.c
> +++ b/xen/arch/arm/arm64/insn.c
> @@ -225,22 +225,22 @@ u32 __kprobes aarch64_insn_gen_nop(void)
>   */
>  int32_t aarch64_get_branch_offset(uint32_t insn)
>  {
> -	int32_t imm;
> +	uint32_t imm;
>  
>  	if (aarch64_insn_is_b(insn) || aarch64_insn_is_bl(insn)) {
>  		imm = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_26, insn);
> -		return (imm << 6) >> 4;
> +		return (int32_t)(imm << 6) >> 4;
>  	}
>  
>  	if (aarch64_insn_is_cbz(insn) || aarch64_insn_is_cbnz(insn) ||
>  	    aarch64_insn_is_bcond(insn)) {
>  		imm = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_19, insn);
> -		return (imm << 13) >> 11;
> +		return (int32_t)(imm << 13) >> 11;
>  	}
>  
>  	if (aarch64_insn_is_tbz(insn) || aarch64_insn_is_tbnz(insn)) {
>  		imm = aarch64_insn_decode_immediate(AARCH64_INSN_IMM_14, insn);
> -		return (imm << 18) >> 16;
> +		return (int32_t)(imm << 18) >> 16;
>  	}
>  
>  	/* Unhandled instruction */
> -- 
> 2.43.0
> 

