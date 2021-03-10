Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C16334056
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 15:28:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96129.181638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJzof-0001UC-8E; Wed, 10 Mar 2021 14:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96129.181638; Wed, 10 Mar 2021 14:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJzof-0001Tn-4m; Wed, 10 Mar 2021 14:28:01 +0000
Received: by outflank-mailman (input) for mailman id 96129;
 Wed, 10 Mar 2021 14:27:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8s4R=II=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1lJzod-0001Ti-4L
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 14:27:59 +0000
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60208fd7-687f-4a73-bbdd-2632f1a9bfe6;
 Wed, 10 Mar 2021 14:27:58 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0a9900452923910729ca7d.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:9900:4529:2391:729:ca7d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 325911EC026F;
 Wed, 10 Mar 2021 15:27:57 +0100 (CET)
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
X-Inumbo-ID: 60208fd7-687f-4a73-bbdd-2632f1a9bfe6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1615386477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=ttfTjP2mc2NJJolPrw5G/H4gc7B5Dvgh5Pc2Z3g4DpA=;
	b=G784EB3nGQcdzbE411YJBthr26JHN+gLIXa9Mev0eBrSU7eI4sjreG0NMvN+zNNB54YtHy
	i0jxQFrSMbo47kN4XHS8n7NOZcgZya/AeZtPKe2DkA78ZC7wsMhTyfqjR8mbzAWexYvenm
	xLXKKRRIdxC2CTowlvkgT/jaa0sGEaU=
Date: Wed, 10 Mar 2021 15:27:54 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6 05/12] x86/alternative: support ALTERNATIVE_TERNARY
Message-ID: <20210310142754.GH23521@zn.tnic>
References: <20210309134813.23912-1-jgross@suse.com>
 <20210309134813.23912-6-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210309134813.23912-6-jgross@suse.com>

On Tue, Mar 09, 2021 at 02:48:06PM +0100, Juergen Gross wrote:
> diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/alternative.h
> index 89889618ae01..4fb844e29d26 100644
> --- a/arch/x86/include/asm/alternative.h
> +++ b/arch/x86/include/asm/alternative.h
> @@ -178,6 +178,9 @@ static inline int alternatives_text_reserved(void *start, void *end)
>  	ALTINSTR_REPLACEMENT(newinstr2, 2)				\
>  	".popsection\n"
>  
> +#define ALTERNATIVE_TERNARY(oldinstr, feature, newinstr1, newinstr2)	\
> +	ALTERNATIVE_2(oldinstr, newinstr2, X86_FEATURE_ALWAYS, newinstr1, feature)

Make that:

/*
 * If @feature is set, patch @newinstr_yes, else @newinstr_no
 */
#define ALTERNATIVE_TERNARY(oldinstr, feature, newinstr_yes, newinstr_no) \
        ALTERNATIVE_2(oldinstr, newinstr_no, X86_FEATURE_ALWAYS, newinstr_yes, feature)

and in alternative-asm.h too pls.

Regardless, this looks nice! :)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

