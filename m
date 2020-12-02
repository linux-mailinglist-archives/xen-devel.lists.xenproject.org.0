Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FDB2CBD0A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 13:33:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42691.76804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkRJM-0006kH-TA; Wed, 02 Dec 2020 12:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42691.76804; Wed, 02 Dec 2020 12:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkRJM-0006js-PR; Wed, 02 Dec 2020 12:32:44 +0000
Received: by outflank-mailman (input) for mailman id 42691;
 Wed, 02 Dec 2020 12:32:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DXNT=FG=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1kkRJK-0006jn-Ex
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 12:32:43 +0000
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4cab47ae-c2ff-4eb8-a472-8e46912ccb2a;
 Wed, 02 Dec 2020 12:32:40 +0000 (UTC)
Received: from zn.tnic (p200300ec2f161b00e186258fb055049e.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f16:1b00:e186:258f:b055:49e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 839061EC0445;
 Wed,  2 Dec 2020 13:32:39 +0100 (CET)
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
X-Inumbo-ID: 4cab47ae-c2ff-4eb8-a472-8e46912ccb2a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1606912359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=o/X2Q8TjgxS2AV7FMOJUAyk9P7ykB2huuy5Ud2cBljk=;
	b=fME5MejkgBN0mNXJWemh6uyBGI0q25TJUz52B4+MjOgCtx/vrQOy0f9Ub8yPrBnpMg8dIl
	1BtvFqXRtCl5jfju1qfzn/8xxugE+mK0UXIH4WMg2ulGvxAIS6TwI4OPYiLuQNYyxJFg8+
	GLKfO3eez6x6jvEShA/6zBynFK93hw4=
Date: Wed, 2 Dec 2020 13:32:35 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, peterz@infradead.org,
	luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 04/12] x86/xen: drop USERGS_SYSRET64 paravirt call
Message-ID: <20201202123235.GD2951@zn.tnic>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201120114630.13552-5-jgross@suse.com>

On Fri, Nov 20, 2020 at 12:46:22PM +0100, Juergen Gross wrote:
> @@ -123,12 +115,15 @@ SYM_INNER_LABEL(entry_SYSCALL_64_after_hwframe, SYM_L_GLOBAL)
>  	 * Try to use SYSRET instead of IRET if we're returning to
>  	 * a completely clean 64-bit userspace context.  If we're not,
>  	 * go to the slow exit path.
> +	 * In the Xen PV case we must use iret anyway.
>  	 */
> -	movq	RCX(%rsp), %rcx
> -	movq	RIP(%rsp), %r11
>  
> -	cmpq	%rcx, %r11	/* SYSRET requires RCX == RIP */
> -	jne	swapgs_restore_regs_and_return_to_usermode
> +	ALTERNATIVE __stringify( \
> +		movq	RCX(%rsp), %rcx; \
> +		movq	RIP(%rsp), %r11; \
> +		cmpq	%rcx, %r11;	/* SYSRET requires RCX == RIP */ \
> +		jne	swapgs_restore_regs_and_return_to_usermode), \
> +	"jmp	swapgs_restore_regs_and_return_to_usermode", X86_FEATURE_XENPV

Why such a big ALTERNATIVE when you can simply do:

        /*
         * Try to use SYSRET instead of IRET if we're returning to
         * a completely clean 64-bit userspace context.  If we're not,
         * go to the slow exit path.
         * In the Xen PV case we must use iret anyway.
         */
        ALTERNATIVE "", "jmp swapgs_restore_regs_and_return_to_usermode", X86_FEATURE_XENPV

        movq    RCX(%rsp), %rcx;
        movq    RIP(%rsp), %r11;
        cmpq    %rcx, %r11;     /* SYSRET requires RCX == RIP */ \
        jne     swapgs_restore_regs_and_return_to_usermode

?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

