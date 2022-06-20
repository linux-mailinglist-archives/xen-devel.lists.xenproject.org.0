Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14268551AAE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 15:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352802.579669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3HME-00022b-F1; Mon, 20 Jun 2022 13:22:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352802.579669; Mon, 20 Jun 2022 13:22:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3HME-00020Q-B8; Mon, 20 Jun 2022 13:22:22 +0000
Received: by outflank-mailman (input) for mailman id 352802;
 Mon, 20 Jun 2022 13:22:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hcs/=W3=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1o3HMC-00020K-2K
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 13:22:20 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01885a76-f09c-11ec-bd2d-47488cf2e6aa;
 Mon, 20 Jun 2022 15:22:17 +0200 (CEST)
Received: from zn.tnic (p200300ea974657f0329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9746:57f0:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E81721EC0657;
 Mon, 20 Jun 2022 15:22:12 +0200 (CEST)
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
X-Inumbo-ID: 01885a76-f09c-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1655731333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=LrGpaF007OQqZrjEUL4cOEK+6b5ptHcd1OgrPbOBhQc=;
	b=kWLHioT5UQlaSJoVi5j86oOVwPwb26iLxGk6Lbs+ei26Nq/TNiLbkDhLvIBEcM1dDW7PwE
	REHLuI7rtdbxYZJ11zXspxBMbDlwr0roQw/RaMWMbPlZlmUydz0+9GqupSWNQ5iHJDtzLd
	ZDKnGzQwg1BILxQITGEggBx6lvjZ+IE=
Date: Mon, 20 Jun 2022 15:22:08 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2] x86/pat: fix x86_has_pat_wp()
Message-ID: <YrB0gNtIfCwV+xnE@zn.tnic>
References: <20220620113441.23961-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220620113441.23961-1-jgross@suse.com>

+ Tom.

On Mon, Jun 20, 2022 at 01:34:41PM +0200, Juergen Gross wrote:
> x86_has_pat_wp() is using a wrong test, as it relies on the normal
> PAT configuration used by the kernel. In case the PAT MSR has been
> setup by another entity (e.g. BIOS or Xen hypervisor) it might return
> false even if the PAT configuration is allowing WP mappings.

... because Xen doesn't allow writing the PAT MSR. Please explain
exactly what happens because we will forget.

> The correct way to test for WP support is:
> 
> 1. Get the PTE protection bits needed to select WP mode by reading
>    __cachemode2pte_tbl[_PAGE_CACHE_MODE_WP] (depending on the PAT MSR
>    setting this might return protection bits for a stronger mode, e.g.
>    UC-)
> 2. Translate those bits back into the real cache mode selected by those
>    PTE bits by reading __pte2cachemode_tbl[__pte2cm_idx(prot)]
> 3. Test for the cache mode to be _PAGE_CACHE_MODE_WP

Yes, this is a good explanation albeit a bit too verbose. You can stick
a shorter version of it as a comment over the function so that we don't
have to swap it all back in next time.

> Fixes: 1f6f655e01ad ("x86/mm: Add a x86_has_pat_wp() helper")

If anything, this should be:

f88a68facd9a ("x86/mm: Extend early_memremap() support with additional attrs")

Also, I'm thinking CC:stable here.

> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - fix indexing into __pte2cachemode_tbl[]

Yes, in any case, I see it now. The key aspect being in the comment
above it:

 *   Index into __pte2cachemode_tbl[] are the caching attribute bits of the pte
 *   (_PAGE_PWT, _PAGE_PCD, _PAGE_PAT) at index bit positions 0, 1, 2.

which is how one should index into that array.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

