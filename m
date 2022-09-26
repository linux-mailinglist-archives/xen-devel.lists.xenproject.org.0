Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F965EB03F
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 20:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412043.655197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oct2B-0003LQ-RM; Mon, 26 Sep 2022 18:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412043.655197; Mon, 26 Sep 2022 18:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oct2B-0003J3-NU; Mon, 26 Sep 2022 18:40:51 +0000
Received: by outflank-mailman (input) for mailman id 412043;
 Mon, 26 Sep 2022 18:40:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZcVL=Z5=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1oct27-0003IC-Dt
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 18:40:50 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb1b8daa-3dca-11ed-9648-05401a9f4f97;
 Mon, 26 Sep 2022 20:40:45 +0200 (CEST)
Received: from zn.tnic (p200300ea9733e74d329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9733:e74d:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6B1511EC059D;
 Mon, 26 Sep 2022 20:40:40 +0200 (CEST)
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
X-Inumbo-ID: bb1b8daa-3dca-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1664217640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=UV5G03i0J4ZmYbbzPbEHCNnZgOVKlnCjwA4cScXyt1s=;
	b=CBzVjLPvs9Eewc7z3KLHoPORsEoDeJAqHqS/Kz75vg3KYyXNHMSTOMzaMeXc8RciECdqhh
	m7Ew6CupPbe/0o5sFSxIJUobbHC2pcffJ9X6idC0Md8NPm1QQ+VncGgDjYll43QHZBJ6DU
	doPafGRxQGkmnWuTGfFYcedmwt0iBQ0=
Date: Mon, 26 Sep 2022 20:40:34 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 07/10] x86/mtrr: simplify mtrr_bp_init()
Message-ID: <YzHyIrUoLWwKrpxo@zn.tnic>
References: <20220908084914.21703-1-jgross@suse.com>
 <20220908084914.21703-8-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220908084914.21703-8-jgross@suse.com>

On Thu, Sep 08, 2022 at 10:49:11AM +0200, Juergen Gross wrote:
> diff --git a/arch/x86/kernel/cpu/mtrr/mtrr.c b/arch/x86/kernel/cpu/mtrr/mtrr.c
> index 9609a0d235f8..956838bb4481 100644
> --- a/arch/x86/kernel/cpu/mtrr/mtrr.c
> +++ b/arch/x86/kernel/cpu/mtrr/mtrr.c
> @@ -761,13 +761,10 @@ void __init mtrr_bp_init(void)
>  			mtrr_enabled = get_mtrr_state();
>  
>  			if (mtrr_enabled) {
> -				mtrr_bp_pat_init();
>  				cache_generic |= CACHE_GENERIC_MTRR |
>  						 CACHE_GENERIC_PAT;
> -			}
> -
> -			if (mtrr_cleanup(phys_addr)) {
> -				changed_by_mtrr_cleanup = 1;
> +				changed_by_mtrr_cleanup =
> +					mtrr_cleanup(phys_addr);

Just let those lines stick out.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

