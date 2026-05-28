Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QA9rO2w8GGo1hggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 15:00:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A900F5F2632
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 15:00:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321166.1588135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSaKb-000239-QA; Thu, 28 May 2026 12:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321166.1588135; Thu, 28 May 2026 12:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSaKb-00021m-Me; Thu, 28 May 2026 12:59:25 +0000
Received: by outflank-mailman (input) for mailman id 1321166;
 Thu, 28 May 2026 12:59:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <rppt@kernel.org>) id 1wSaKZ-00021g-M2
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 12:59:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSaKY-005pee-Ta
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 14:59:22 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <rppt@kernel.org>)
 id 6a183c20-e002-0a2a0a5209dd-0a2a450784b4-46
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 14:59:22 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <rppt@kernel.org>)
 id 6a183c29-229c-0a2a45070019-aceafc1fc1d4-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 14:59:22 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 82E3B42DA7;
 Thu, 28 May 2026 12:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89021F00A3C;
 Thu, 28 May 2026 12:59:15 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779973160;
	bh=naFlqxbhwX4GtaQGoDTgjjV1+FBkawCwOLQmoy6mDlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JbwLu/x1FG/SmagCxHsnTSG/bwx/DFQV3rVzN4ApHWGiyZVwb4zr2qkNRDEc0jmmX
	 mVRc/1Pix+QvQllawmggohd/5IRDMZ8kwmnAZZQnpDW73WKevYxMvYypgjfDtChqtj
	 vTovHyngwMUfbe/bu/2eg8DOzGNsubuHH1cu/FfMqhDLMWWS7nOGJImXXoEIZThwcd
	 7wnPxQd7EmDnNT/U0dyHGlR1D7SeVrFsQnBjcHKwPVNyldsHGd0LBPukpmunI8gWrH
	 EPhShSh4fZMZMxdWT2raVB9v+F402qOB9uBy8aUEwzE0RMwfjb8cHwu/QrYR0yilwq
	 LQgFH9G4MPBHQ==
Date: Thu, 28 May 2026 15:59:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vishal Moola <vishal.moola@gmail.com>
Cc: Dave Hansen <dave.hansen@intel.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Lu Baolu <baolu.lu@linux.intel.com>, xen-devel@lists.xenproject.org,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 0/9] Convert x86 pgd_lists to ptdescs
Message-ID: <ahg8Hz3nj_uMJqnl@kernel.org>
References: <20260527140316.294621-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527140316.294621-1-vishal.moola@gmail.com>
X-purgate-ID: tlsNG-ef75cf/1779973162-29165C48-512DB56D/0/0
X-purgate-type: clean
X-purgate-size: 2123
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vishal.moola@gmail.com,m:dave.hansen@intel.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:baolu.lu@linux.intel.com,m:xen-devel@lists.xenproject.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:vishalmoola@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[rppt@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A900F5F2632
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 03:03:07PM +0100, Vishal Moola wrote:
> This continues the ptdesc conversions for x86[1]. This is a necessary step
> in preparation for the separate allocation of ptdescs from struct page.
> Once ptdescs are not wrappers, the pgd_list should be used to find our
> ptdesc, not page.
> 
> In fact, after patch 4 we can successfully boot a 32-bit x86 kernel
> that separately allocates ptdescs.
> 
> All of the patches are rather straightforward, I just kept them split up
> for ease of review. There are no intended functional changes as ptdescs
> are currently still wrappers around struct page.

Looks straightforward to me indeed :)

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> [1] https://lore.kernel.org/linux-mm/20260211195233.368497-1-vishal.moola@gmail.com/
> 
> ----------------
> 
> I've compiled and booted both 64 and 32 bit on a kernel with separately
> allocated ptdescs. I ensured the codepaths were hit for all the changes
> except Xen.
> 
> This applies cleanly to the tip bot. I'm thinking this can go through
> Dave's mm.
> 
> Vishal Moola (9):
>   x86/mm/pat: Use IS_ENABLED() instead of ifdef
>   x86/mm/pat: Convert __set_pmd_pte() to ptdescs
>   x86/mm/pat: Convert collapse_pmd_page() to ptdescs
>   x86/mm: Convert arch_sync_kernel_mappings() to ptdescs
>   x86/mm: Convert sync_global_pgds_l5() to ptdescs
>   x86/mm: Convert sync_global_pgds_l4() to ptdescs
>   x86/mm: Convert pgd_page_get_mm() to ptdescs
>   x86/xen: Convert xen_mm_pin_all() to ptdescs
>   x86/xen: Convert xen_mm_unpin_all() to ptdescs
> 
>  arch/x86/include/asm/pgtable.h       |  2 +-
>  arch/x86/include/asm/pgtable_types.h |  2 +-
>  arch/x86/mm/fault.c                  |  8 ++++----
>  arch/x86/mm/init_64.c                | 16 ++++++++--------
>  arch/x86/mm/pat/set_memory.c         | 17 ++++++++---------
>  arch/x86/mm/pgtable.c                |  4 ++--
>  arch/x86/xen/mmu_pv.c                | 22 +++++++++++-----------
>  7 files changed, 35 insertions(+), 36 deletions(-)
> 
> -- 
> 2.54.0
> 

-- 
Sincerely yours,
Mike.

