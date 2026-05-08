Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCReIr9N/mllowAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 22:55:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3207B4FBAF9
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 22:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304225.1577302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSE3-0007II-Nw; Fri, 08 May 2026 20:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304225.1577302; Fri, 08 May 2026 20:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSE3-0007Fy-LP; Fri, 08 May 2026 20:55:11 +0000
Received: by outflank-mailman (input) for mailman id 1304225;
 Fri, 08 May 2026 20:55:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.brodsky@arm.com>) id 1wLSE1-0007Fr-Qk
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 20:55:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLSE1-000AXG-0f
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 22:55:09 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.brodsky@arm.com>)
 id 69fe4d03-2eae-0a2a0a5409dd-0a2a45078d66-40
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 22:55:08 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <kevin.brodsky@arm.com>)
 id 69fe4dac-229c-0a2a45070019-d98c6eacd0de-1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 22:55:08 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A79F1C25;
 Fri,  8 May 2026 13:55:02 -0700 (PDT)
Received: from [10.57.35.132] (unknown [10.57.35.132])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B76E33F836;
 Fri,  8 May 2026 13:55:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="Date:Subject:To:Cc:References:From:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778273707; bh=EYkONMkW0IatpZ5QawspWJ7T/VJZH158OZO7NH03taE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oT/QNC9yXHo4z1ugT7/FLiBNGDpaiDMdHzLuLsLDP/RfnuNDn7+RkOx6fUHYck5WY
	 4JiTtgOh/rHTuurIlP+VjgGp6OdeXiP8hc2bG238RdglsrJ4AC+VD81LgCQr74gaL9
	 avbGNpzxwH5AeadHWfiYrYy0idGktRIUI2usTaMk=
Message-ID: <362bc938-18ea-4f6a-938a-893dfb1c956d@arm.com>
Date: Fri, 8 May 2026 22:54:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: Tolerate nested XEN_LAZY_MMU entering/leaving
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
Cc: marmarek@invisiblethingslab.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20260508143933.493013-1-jgross@suse.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260508143933.493013-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1778273708-23979C48-DAF182A4/0/0
X-purgate-type: clean
X-purgate-size: 2086
X-Rspamd-Queue-Id: 3207B4FBAF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:mid,arm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:marmarek@invisiblethingslab.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kevin.brodsky@arm.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[kevin.brodsky@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 08/05/2026 16:39, Juergen Gross wrote:
> With the support of nested lazy mmu sections it can happen that
> arch_enter_lazy_mmu_mode() is being called twice without a call of
> arch_leave_lazy_mmu_mode() in between, as the lazy_mmu_*() helpers
> are not disabling preemption when checking for nested lazy mmu
> sections.

I think this is a correct description of the issue, i.e. potentially we
have arch_enter_lazy_mmu_mode() called twice *sequentially*. Therefore I
don't think that disabling preemption inside arch_enter_lazy_mmu_mode()
is enough - we have a problem with preemption occurring inside
lazy_mmu_mode_enable() generally, not necessarily inside
arch_enter_lazy_mmu_mode().

Preemption shouldn't matter if commit 291b3abed657 is reverted. AFAICT
this is the only easy fix.

- Kevin

> This is a problem when running as a Xen PV guest, as
> xen_enter_lazy_mmu() and xen_leave_lazy_mmu() don't tolerate this
> case.
>
> Fix that in xen_enter_lazy_mmu() and xen_leave_lazy_mmu() in order
> not to hurt all other lazy mmu mode users.
>
> Fixes: 291b3abed657 ("x86/xen: use lazy_mmu_state when context-switching")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/xen/mmu_pv.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index c80d0058efd1..3eee5f84f8a7 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -2145,7 +2145,10 @@ static void xen_set_fixmap(unsigned idx, phys_addr_t phys, pgprot_t prot)
>  
>  static void xen_enter_lazy_mmu(void)
>  {
> -	enter_lazy(XEN_LAZY_MMU);
> +	preempt_disable();
> +	if (xen_get_lazy_mode() != XEN_LAZY_MMU)
> +		enter_lazy(XEN_LAZY_MMU);
> +	preempt_enable();
>  }
>  
>  static void xen_flush_lazy_mmu(void)
> @@ -2182,7 +2185,8 @@ static void xen_leave_lazy_mmu(void)
>  {
>  	preempt_disable();
>  	xen_mc_flush();
> -	leave_lazy(XEN_LAZY_MMU);
> +	if (xen_get_lazy_mode() != XEN_LAZY_NONE)
> +		leave_lazy(XEN_LAZY_MMU);
>  	preempt_enable();
>  }
>  

