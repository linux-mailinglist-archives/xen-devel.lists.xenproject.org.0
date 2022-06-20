Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DF85515C6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 12:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352729.579579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Ebq-0006bk-As; Mon, 20 Jun 2022 10:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352729.579579; Mon, 20 Jun 2022 10:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Ebq-0006ZI-7i; Mon, 20 Jun 2022 10:26:18 +0000
Received: by outflank-mailman (input) for mailman id 352729;
 Mon, 20 Jun 2022 10:26:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hcs/=W3=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1o3Ebj-0006XX-F5
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 10:26:16 +0000
Received: from mail.skyhub.de (mail.skyhub.de [2a01:4f8:190:11c2::b:1457])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61c1a98c-f083-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 12:26:02 +0200 (CEST)
Received: from zn.tnic (p200300ea974657f0329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9746:57f0:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D9D7D1EC05ED;
 Mon, 20 Jun 2022 12:26:00 +0200 (CEST)
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
X-Inumbo-ID: 61c1a98c-f083-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1655720760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=q17a9XDpjwTWrwYDkkTaQRPmMqGL4q0bN7aju6sX8fc=;
	b=ot3uDji6ieMC7dhTqMOPLpRfYZ+D/oOGVFqRzqgKnfa0kcNpM/bfgTF0HcgcUwm1ytR3UF
	ZcxLVAfRbqvIk7ehY+JDCg/3PXcH03o7yOuj7hy3MWW6UBKZz+alWlDdoJiftWvYpq7DOu
	W9CoStDuS1uK4u2ui87Jeq2OESCWxlw=
Date: Mon, 20 Jun 2022 12:26:27 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, jbeulich@suse.com,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 1/2] x86/pat: fix x86_has_pat_wp()
Message-ID: <YrBLU2C5cJoalnax@zn.tnic>
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220503132207.17234-2-jgross@suse.com>

On Tue, May 03, 2022 at 03:22:06PM +0200, Juergen Gross wrote:
> x86_has_pat_wp() is using a wrong test, as it relies on the normal
> PAT configuration used by the kernel. In case the PAT MSR has been
> setup by another entity (e.g. BIOS or Xen hypervisor) it might return
> false even if the PAT configuration is allowing WP mappings.
> 
> Fixes: 1f6f655e01ad ("x86/mm: Add a x86_has_pat_wp() helper")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/mm/init.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> index d8cfce221275..71e182ebced3 100644
> --- a/arch/x86/mm/init.c
> +++ b/arch/x86/mm/init.c
> @@ -80,7 +80,8 @@ static uint8_t __pte2cachemode_tbl[8] = {
>  /* Check that the write-protect PAT entry is set for write-protect */
>  bool x86_has_pat_wp(void)
>  {
> -	return __pte2cachemode_tbl[_PAGE_CACHE_MODE_WP] == _PAGE_CACHE_MODE_WP;
> +	return __pte2cachemode_tbl[__cachemode2pte_tbl[_PAGE_CACHE_MODE_WP]] ==
> +	       _PAGE_CACHE_MODE_WP;

So this code always makes my head spin... especially after vacation but
lemme take a stab:

__pte2cachemode_tbl indices are of type enum page_cache_mode.

What you've done is index with

__cachemode2pte_tbl[_PAGE_CACHE_MODE_WP]

which gives uint16_t.

So, if at all, this should do __pte2cm_idx(_PAGE_CACHE_MODE_WP) to index
into it.

But I'm still unclear on the big picture. Looking at Jan's explanation,
there's something about PAT init being skipped due to MTRRs not being
emulated by Xen.... or something to that effect.

So if that's the case, the Xen guest code should init PAT in its own
way, so that the generic code works with this without doing hacks.

But I'm only guessing - this needs a *lot* more elaboration and
explanation why exactly this is needed.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

