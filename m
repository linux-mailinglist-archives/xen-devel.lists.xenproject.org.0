Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGtQDBhVGGoQjQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 16:45:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6A55F3E6B
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 16:45:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321209.1588143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSbyP-0007oh-34; Thu, 28 May 2026 14:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321209.1588143; Thu, 28 May 2026 14:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSbyO-0007nD-VS; Thu, 28 May 2026 14:44:36 +0000
Received: by outflank-mailman (input) for mailman id 1321209;
 Thu, 28 May 2026 14:43:44 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <william.kucharski@linux.dev>) id 1wSbxX-0007mD-Ol
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 14:43:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSbxX-008TQ6-0A
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 16:43:43 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <william.kucharski@linux.dev>)
 id 6a18548c-2eae-0a2a0a5409dd-0a2a4507a92e-42
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 16:43:42 +0200
Received: from [91.218.175.180] (helo=out-180.mta0.migadu.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <william.kucharski@linux.dev>)
 id 6a18549d-229c-0a2a45070019-5bdaafb4b521-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 16:43:41 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=key1 header.d=linux.dev header.i="@linux.dev" header.h="From:Subject:Date:Message-Id:To:Cc:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779979421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JaKylE9tmtxoDlvo1H6WypisSB7E9IbupaqeU2jxRQk=;
	b=UFA0TctBDoJctOHOsP80cIuOFeSA66cIPh1Azl9LETzBIkMwxe/ebMG53bjcMzoCC5tRVX
	uKP5vrf0O+p9HzNa1tStAw2NKP9KWd5O/MGfVsHSy/pa1ZWNeLUyMrQIU0HSHXygfLz9q3
	+uH7ft1SDabLwk+BS+qTxDas3b5SyT0=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH 0/9] Convert x86 pgd_lists to ptdescs
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: William Kucharski <william.kucharski@linux.dev>
In-Reply-To: <20260527140316.294621-1-vishal.moola@gmail.com>
Date: Thu, 28 May 2026 08:43:25 -0600
Cc: Dave Hansen <dave.hansen@intel.com>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 x86@kernel.org,
 Mike Rapoport <rppt@kernel.org>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <83A6AC90-A51D-4E1E-9ADA-50195FA2485A@linux.dev>
References: <20260527140316.294621-1-vishal.moola@gmail.com>
To: Vishal Moola <vishal.moola@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-purgate-ID: tlsNG-ef75cf/1779979422-0A772C48-5930820B/0/0
X-purgate-type: clean
X-purgate-size: 2133
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dave.hansen@intel.com,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:rppt@kernel.org,m:baolu.lu@linux.intel.com,m:xen-devel@lists.xenproject.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:vishal.moola@gmail.com,m:vishalmoola@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[william.kucharski@linux.dev,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[william.kucharski@linux.dev,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CA6A55F3E6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Looks great!

Reviewed-by: William Kucharski <william.kucharski@linux.dev>

> On May 27, 2026, at 08:03, Vishal Moola <vishal.moola@gmail.com> =
wrote:
>=20
> This continues the ptdesc conversions for x86[1]. This is a necessary =
step
> in preparation for the separate allocation of ptdescs from struct =
page.
> Once ptdescs are not wrappers, the pgd_list should be used to find our
> ptdesc, not page.
>=20
> In fact, after patch 4 we can successfully boot a 32-bit x86 kernel
> that separately allocates ptdescs.
>=20
> All of the patches are rather straightforward, I just kept them split =
up
> for ease of review. There are no intended functional changes as =
ptdescs
> are currently still wrappers around struct page.
>=20
> [1] =
https://lore.kernel.org/linux-mm/20260211195233.368497-1-vishal.moola@gmai=
l.com/
>=20
> ----------------
>=20
> I've compiled and booted both 64 and 32 bit on a kernel with =
separately
> allocated ptdescs. I ensured the codepaths were hit for all the =
changes
> except Xen.
>=20
> This applies cleanly to the tip bot. I'm thinking this can go through
> Dave's mm.
>=20
> Vishal Moola (9):
>  x86/mm/pat: Use IS_ENABLED() instead of ifdef
>  x86/mm/pat: Convert __set_pmd_pte() to ptdescs
>  x86/mm/pat: Convert collapse_pmd_page() to ptdescs
>  x86/mm: Convert arch_sync_kernel_mappings() to ptdescs
>  x86/mm: Convert sync_global_pgds_l5() to ptdescs
>  x86/mm: Convert sync_global_pgds_l4() to ptdescs
>  x86/mm: Convert pgd_page_get_mm() to ptdescs
>  x86/xen: Convert xen_mm_pin_all() to ptdescs
>  x86/xen: Convert xen_mm_unpin_all() to ptdescs
>=20
> arch/x86/include/asm/pgtable.h       |  2 +-
> arch/x86/include/asm/pgtable_types.h |  2 +-
> arch/x86/mm/fault.c                  |  8 ++++----
> arch/x86/mm/init_64.c                | 16 ++++++++--------
> arch/x86/mm/pat/set_memory.c         | 17 ++++++++---------
> arch/x86/mm/pgtable.c                |  4 ++--
> arch/x86/xen/mmu_pv.c                | 22 +++++++++++-----------
> 7 files changed, 35 insertions(+), 36 deletions(-)
>=20
> --=20
> 2.54.0
>=20
>=20


