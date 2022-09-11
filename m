Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEAC5B4D41
	for <lists+xen-devel@lfdr.de>; Sun, 11 Sep 2022 12:18:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404989.647611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXK0x-0004tG-Lk; Sun, 11 Sep 2022 10:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404989.647611; Sun, 11 Sep 2022 10:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXK0x-0004r7-Iy; Sun, 11 Sep 2022 10:16:35 +0000
Received: by outflank-mailman (input) for mailman id 404989;
 Sun, 11 Sep 2022 10:16:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pbpW=ZO=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1oXK0r-0004r1-JN
 for xen-devel@lists.xenproject.org; Sun, 11 Sep 2022 10:16:34 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb1fd324-31ba-11ed-9760-273f2230c3a0;
 Sun, 11 Sep 2022 12:16:28 +0200 (CEST)
Received: from nazgul.tnic (dynamic-046-114-095-207.46.114.pool.telefonica.de
 [46.114.95.207])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5D84B1EC051E;
 Sun, 11 Sep 2022 12:16:21 +0200 (CEST)
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
X-Inumbo-ID: cb1fd324-31ba-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1662891381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=hJrCkWXjtCrX48n+DB+7ZxKF7ya+Il6FKndkZXY0O3U=;
	b=pYSvtLPy2UVoMjaip5Tp8A1pPKEn9TGAn6mcjjSmZ1ZYSZASFmzqizlye+FYIogPOnAWzz
	pv7QA+VdovvXBgn4U0qaoeiRe58UxUuVCEvDfXCQtadFSzuBXJtRwqDUQDQiYoqD2LsT9D
	r4/zbGNglCLHAAWama8Zv2FAptDJffI=
Date: Sun, 11 Sep 2022 12:16:32 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 03/10] x86/mtrr: replace use_intel() with a local flag
Message-ID: <Yx21cizZHNzD38z7@nazgul.tnic>
References: <20220908084914.21703-1-jgross@suse.com>
 <20220908084914.21703-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220908084914.21703-4-jgross@suse.com>

On Thu, Sep 08, 2022 at 10:49:07AM +0200, Juergen Gross wrote:
> diff --git a/arch/x86/include/asm/cacheinfo.h b/arch/x86/include/asm/cacheinfo.h
> index 86b2e0dcc4bf..1aeafa9888f7 100644
> --- a/arch/x86/include/asm/cacheinfo.h
> +++ b/arch/x86/include/asm/cacheinfo.h
> @@ -2,6 +2,11 @@
>  #ifndef _ASM_X86_CACHEINFO_H
>  #define _ASM_X86_CACHEINFO_H
>  
> +/* Kernel controls MTRR and/or PAT MSRs. */
> +extern unsigned int cache_generic;

So this should be called something more descriptive like

	memory_caching_types

or so to denote that this is a bitfield of supported memory caching
technologies. The code then would read as

	if (memory_caching_types & CACHE_MTRR)

The name's still not optimal tho - needs more brooding over.

> +#define CACHE_GENERIC_MTRR 0x01
> +#define CACHE_GENERIC_PAT  0x02

And those should be CACHE_{MTRR,PAT}.

>  void cacheinfo_amd_init_llc_id(struct cpuinfo_x86 *c, int cpu);
>  void cacheinfo_hygon_init_llc_id(struct cpuinfo_x86 *c, int cpu);
>  
> diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
> index 66556833d7af..3b05d3ade7a6 100644
> --- a/arch/x86/kernel/cpu/cacheinfo.c
> +++ b/arch/x86/kernel/cpu/cacheinfo.c
> @@ -35,6 +35,9 @@ DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_llc_shared_map);
>  /* Shared L2 cache maps */
>  DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_l2c_shared_map);
>  
> +/* Kernel controls MTRR and/or PAT MSRs. */
> +unsigned int cache_generic;

This should either be __ro_after_init and initialized to 0 or you need
accessors...

>  u32 num_var_ranges;
> -static bool __mtrr_enabled;
> -
> -static bool mtrr_enabled(void)
> -{
> -	return __mtrr_enabled;
> -}
> +static bool mtrr_enabled;

Hmm, I don't like this. There's way too many boolean flags in the mtrr
code. There's mtrr_state.enabled too. ;-\

Can we set (or clear) X86_FEATURE_MTRR to denote MTRR enablement status
and get rid of one more boolean flag?

...

>  void __init mtrr_bp_init(void)
>  {
> +	bool use_generic = false;
>  	u32 phys_addr;
>  
>  	init_ifs();
> @@ -694,6 +691,7 @@ void __init mtrr_bp_init(void)
>  
>  	if (boot_cpu_has(X86_FEATURE_MTRR)) {
>  		mtrr_if = &generic_mtrr_ops;
> +		use_generic = true;
>  		size_or_mask = SIZE_OR_MASK_BITS(36);
>  		size_and_mask = 0x00f00000;
>  		phys_addr = 36;
> @@ -755,15 +753,18 @@ void __init mtrr_bp_init(void)
>  	}
>  
>  	if (mtrr_if) {
> -		__mtrr_enabled = true;
> -		set_num_var_ranges();
> +		mtrr_enabled = true;
> +		set_num_var_ranges(use_generic);

You don't need use_generic either:

		set_num_var_ranges(mtrr_if == generic_mtrr_ops);

(The reason being I wanna get rid of that nasty minefield of boolean
vars all round that code).

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

