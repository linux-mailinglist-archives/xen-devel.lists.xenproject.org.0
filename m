Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5769A6FF76A
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 18:33:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533485.830213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px9DE-0006ni-4M; Thu, 11 May 2023 16:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533485.830213; Thu, 11 May 2023 16:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px9DE-0006m3-1g; Thu, 11 May 2023 16:32:16 +0000
Received: by outflank-mailman (input) for mailman id 533485;
 Thu, 11 May 2023 16:32:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fLOV=BA=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1px9DC-0006lx-Bh
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 16:32:14 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61b83990-f019-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 18:32:12 +0200 (CEST)
Received: from zn.tnic (p5de8e8ea.dip0.t-ipconnect.de [93.232.232.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D9DC31EC041F;
 Thu, 11 May 2023 18:32:11 +0200 (CEST)
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
X-Inumbo-ID: 61b83990-f019-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1683822731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=dygT3SQ1Awb918Yj04yvCpz0F75Gt7jJXYbHPMQO368=;
	b=R5T5ei9aRn2WmdaOiQI0b3lTEpke8mwH+YA13JUw69yB2L7ZadnZ0U2BTvfGyaOHt4JfRC
	3Aoy+LxV7mQkAih2yejm5Zzwfnof6sebecZ/7cyw7rLXxwO+GHLihccOrl0u8gG8MDSzAm
	XmteUQ7nficYxQuDo4lTodt4dy/cl80=
Date: Thu, 11 May 2023 18:32:08 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-hyperv@vger.kernel.org, linux-doc@vger.kernel.org,
	mikelley@microsoft.com, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org, Jonathan Corbet <corbet@lwn.net>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v6 00/16] x86/mtrr: fix handling with PAT but without MTRR
Message-ID: <20230511163208.GDZF0YiOfxQhSo4RDm@fat_crate.local>
References: <20230502120931.20719-1-jgross@suse.com>
 <20230509201437.GFZFqprc6otRejDPUt@fat_crate.local>
 <20230509233641.GGZFrZCTDH7VwUMp5R@fat_crate.local>
 <20230510133024.GBZFuccC1FxIZNKL+8@fat_crate.local>
 <4c47a11c-0565-678d-3467-e01c5ec16600@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c47a11c-0565-678d-3467-e01c5ec16600@suse.com>

On Wed, May 10, 2023 at 05:53:15PM +0200, Juergen Gross wrote:
> Urgh, yes, there is something missing:
> 
> diff --git a/arch/x86/kernel/cpu/mtrr/generic.c b/arch/x86/kernel/cpu/mtrr/generic.c
> index 031f7ea8e72b..9544e7d13bb3 100644
> --- a/arch/x86/kernel/cpu/mtrr/generic.c
> +++ b/arch/x86/kernel/cpu/mtrr/generic.c
> @@ -521,8 +521,12 @@ u8 mtrr_type_lookup(u64 start, u64 end, u8 *uniform)
>         for (i = 0; i < cache_map_n && start < end; i++) {
>                 if (start >= cache_map[i].end)
>                         continue;

So the loop will go through the map until...

> -               if (start < cache_map[i].start)
> +               if (start < cache_map[i].start) {

... it reaches the first entry where that is true.

>                         type = type_merge(type, mtrr_state.def_type, uniform);

the @type argument is MTRR_TYPE_INVALID, def_type is WRBACK so what
this'll do is simply get you the default WRBACK type:

type_merge:
        if (type == MTRR_TYPE_INVALID)
                return new_type;

> +                       start = cache_map[i].start;
> +                       if (end <= start)
> +                               break;

Now you break here because end <= start. Why?

You can just as well do:

	if (start < cache_map[i].start) {
		/* region non-overlapping with the region in the map */
		if (end <= cache_map[i].start)
			return type_merge(type, mtrr_state.def_type, uniform);

		... rest of the processing ...

In general, I get it that your code is slick but I want it to be
maintainable - not slick. I'd like for when people look at this, not
have to  add a bunch of debugging output in order to swap the whole
thing back into their brains.

So mtrr_type_lookup() definitely needs comments explaining what goes
where.

You can send it as a diff ontop - I'll merge it.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

