Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 259755BD530
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 21:26:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408895.651753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaMOm-0002pT-0e; Mon, 19 Sep 2022 19:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408895.651753; Mon, 19 Sep 2022 19:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaMOl-0002mX-TE; Mon, 19 Sep 2022 19:25:43 +0000
Received: by outflank-mailman (input) for mailman id 408895;
 Mon, 19 Sep 2022 19:25:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fBMf=ZW=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1oaMOj-0002mR-MK
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 19:25:41 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7dcc260-3850-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 21:25:39 +0200 (CEST)
Received: from zn.tnic (p200300ea9733e79d329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9733:e79d:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6AE7D1EC01D2;
 Mon, 19 Sep 2022 21:25:34 +0200 (CEST)
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
X-Inumbo-ID: d7dcc260-3850-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1663615534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=F9PypRJJonu/owp4xrRfoXhBJ3jDL2onqnjEb1GXu3Y=;
	b=e73OG2H0WGw9U8n57rAKIiTBCILi25gC0NTfDGY8v21Yznj6PkJjSepxXE+TLVdgVuXfBP
	JTb1vTweHpXufHSi//l9bVP40yg3OS7zY3NuanLnAgGopwqabn4DwvIdJ+nJlG3iOB19h3
	O+cPJ4/A4lxbtmRf0RizHjQwCcaMCTA=
Date: Mon, 19 Sep 2022 21:25:30 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 05/10] x86/mtrr: split generic_set_all()
Message-ID: <YyjCKs7H3Lvnf3Jr@zn.tnic>
References: <20220908084914.21703-1-jgross@suse.com>
 <20220908084914.21703-6-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220908084914.21703-6-jgross@suse.com>

On Thu, Sep 08, 2022 at 10:49:09AM +0200, Juergen Gross wrote:
> Split generic_set_all() into multiple parts, while moving the main
> function body into cacheinfo.c.
> 
> This prepares the support of PAT without needing MTRR support by

"Prepare PAT support without ... "

> moving the main function body of generic_set_all() into cacheinfo.c
> while renaming it to cache_cpu_init(). The MTRR specific parts are
> moved into a dedicated small function called by cache_cpu_init().
> The PAT and MTRR specific functions are called conditionally based
> on the cache_generic bit settings.
> 
> The setting of smp_changes_mask is merged into the (new) function

... and so on. So the commit message should not say what you're doing -
that should be visible from the diff itself. It should talk more about
the *why* you're doing it.

...

> diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
> index 47e2c72fa8a4..36378604ec61 100644
> --- a/arch/x86/kernel/cpu/cacheinfo.c
> +++ b/arch/x86/kernel/cpu/cacheinfo.c
> @@ -1120,3 +1120,22 @@ void cache_enable(void) __releases(cache_disable_lock)
>  
>  	raw_spin_unlock(&cache_disable_lock);
>  }
> +
> +void cache_cpu_init(void)
> +{
> +	unsigned long flags;
> +
> +	local_irq_save(flags);
> +	cache_disable();
> +
> +	/* Set MTRR state. */

Yeah, and when you name the functions properly as you've done, you don't
really need those comments anymore either.

> +	if (cache_generic & CACHE_GENERIC_MTRR)
> +		mtrr_generic_set_state();
> +
> +	/* Set PAT. */

And this one.

> +	if (cache_generic & CACHE_GENERIC_PAT)
> +		pat_init();
> +
> +	cache_enable();
> +	local_irq_restore(flags);
> +}
> diff --git a/arch/x86/kernel/cpu/mtrr/generic.c b/arch/x86/kernel/cpu/mtrr/generic.c
> index 5ed397f03a87..fc7b2d952737 100644
> --- a/arch/x86/kernel/cpu/mtrr/generic.c
> +++ b/arch/x86/kernel/cpu/mtrr/generic.c
> @@ -731,30 +731,19 @@ void mtrr_enable(void)
>  	mtrr_wrmsr(MSR_MTRRdefType, deftype_lo, deftype_hi);
>  }
>  
> -static void generic_set_all(void)
> +void mtrr_generic_set_state(void)
>  {
>  	unsigned long mask, count;
> -	unsigned long flags;
> -
> -	local_irq_save(flags);
> -	cache_disable();
>  
>  	/* Actually set the state */
>  	mask = set_mtrr_state();
>  
> -	/* also set PAT */
> -	pat_init();
> -
> -	cache_enable();
> -	local_irq_restore(flags);
> -
>  	/* Use the atomic bitops to update the global mask */
>  	for (count = 0; count < sizeof(mask) * 8; ++count) {
>  		if (mask & 0x01)
>  			set_bit(count, &smp_changes_mask);
>  		mask >>= 1;
>  	}
> -
>  }
>  
>  /**
> @@ -854,7 +843,7 @@ int positive_have_wrcomb(void)
>   * Generic structure...
>   */
>  const struct mtrr_ops generic_mtrr_ops = {
> -	.set_all		= generic_set_all,
> +	.set_all		= cache_cpu_init,

I was gonna say that this looks weird - a set_all function pointer
assigned to a init function but that changes in the next patch.

But yeah, I like where this is going.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

