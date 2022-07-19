Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B3557A2C8
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 17:16:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370738.602608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDowa-0002Ve-IU; Tue, 19 Jul 2022 15:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370738.602608; Tue, 19 Jul 2022 15:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDowa-0002Ta-FB; Tue, 19 Jul 2022 15:15:28 +0000
Received: by outflank-mailman (input) for mailman id 370738;
 Tue, 19 Jul 2022 15:15:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=66Ww=XY=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1oDowV-0002TU-1x
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 15:15:26 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a866dfd-0775-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 17:15:20 +0200 (CEST)
Received: from zn.tnic (p200300ea97297609329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9729:7609:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A7AEA1EC050F;
 Tue, 19 Jul 2022 17:15:15 +0200 (CEST)
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
X-Inumbo-ID: 9a866dfd-0775-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1658243715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=19tyF3hcmEXgvgnp46r5wyMNhL+B65efr3ypQp+I6Lc=;
	b=bgi94v/2BF7PUNqG8xmemrFZBnufFiYdPdUaAnPFw21wpY2AenhYjpMtVIXjal1w+mzOf/
	/mJpaBLsrk1CG9OmmXyV1Mk42F2fLkopvrYioaM30O2wLjdfezvPIdmQCQWST61U2bwz0K
	8qYCxwZHFYMHLQZMFQVOq4Y1vdDkO/E=
Date: Tue, 19 Jul 2022 17:15:11 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, brchuckz@netscape.net,
	jbeulich@suse.com, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/3] x86: decouple pat and mtrr handling
Message-ID: <YtbKf51S4lTaziKm@zn.tnic>
References: <20220715142549.25223-1-jgross@suse.com>
 <20220715142549.25223-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220715142549.25223-4-jgross@suse.com>

On Fri, Jul 15, 2022 at 04:25:49PM +0200, Juergen Gross wrote:
> Today PAT is usable only with MTRR being active, with some nasty tweaks
> to make PAT usable when running as Xen PV guest, which doesn't support
> MTRR.
> 
> The reason for this coupling is, that both, PAT MSR changes and MTRR
> changes, require a similar sequence and so full PAT support was added
> using the already available MTRR handling.
> 
> Xen PV PAT handling can work without MTRR, as it just needs to consume
> the PAT MSR setting done by the hypervisor without the ability and need
> to change it. This in turn has resulted in a convoluted initialization
> sequence and wrong decisions regarding cache mode availability due to
> misguiding PAT availability flags.
> 
> Fix all of that by allowing to use PAT without MTRR and by adding an
> environment dependent PAT init function.

Aha, there's the explanation I was looking for.

> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 0a1bd14f7966..3edfb779dab5 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -2408,8 +2408,8 @@ void __init cache_bp_init(void)
>  {
>  	if (IS_ENABLED(CONFIG_MTRR))
>  		mtrr_bp_init();
> -	else
> -		pat_disable("PAT support disabled because CONFIG_MTRR is disabled in the kernel.");
> +
> +	pat_cpu_init();
>  }
>  
>  void cache_ap_init(void)
> @@ -2417,7 +2417,8 @@ void cache_ap_init(void)
>  	if (cache_aps_delayed_init)
>  		return;
>  
> -	mtrr_ap_init();
> +	if (!mtrr_ap_init())
> +		pat_ap_init_nomtrr();
>  }

So I'm reading this as: if it couldn't init AP's MTRRs, init its PAT.

But currently, the code sets the MTRRs for the delayed case or when the
CPU is not online by doing ->set_all and in there it sets first MTRRs
and then PAT.

I think the code above should simply try the two things, one after the
other, independently from one another.

And I see you've added another stomp machine call for PAT only.

Now, what I think the design of all this should be, is:

you have a bunch of things you need to do at each point:

* cache_ap_init

* cache_aps_init

* ...

Now, in each those, you look at whether PAT or MTRR is supported and you
do only those which are supported.

Also, the rendezvous handler should do:

	if MTRR:
		do MTRR specific stuff

	if PAT:
		do PAT specific stuff

This way you have clean definitions of what needs to happen when and you
also do *only* the things that the platform supports, by keeping the
proper order of operations - I believe MTRRs first and then PAT.

This way we'll get rid of that crazy maze of who calls what and when.

But first we need to define those points where stuff needs to happen and
then for each point define what stuff needs to happen.

How does that sound?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

