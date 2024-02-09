Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19C284FF61
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 23:03:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678855.1056427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYYxJ-0000DN-Gu; Fri, 09 Feb 2024 22:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678855.1056427; Fri, 09 Feb 2024 22:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYYxJ-0000Br-DX; Fri, 09 Feb 2024 22:02:45 +0000
Received: by outflank-mailman (input) for mailman id 678855;
 Fri, 09 Feb 2024 22:02:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H1sd=JS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rYYxI-0000Bc-U4
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 22:02:44 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1eb0b65-c796-11ee-98f5-efadbce2ee36;
 Fri, 09 Feb 2024 23:02:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B7D82CE212A;
 Fri,  9 Feb 2024 22:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC27C433F1;
 Fri,  9 Feb 2024 22:02:35 +0000 (UTC)
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
X-Inumbo-ID: f1eb0b65-c796-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707516157;
	bh=OkDQU3kSODec1b1x5RiJrZTr3MsFnUPpdlIyO0LN6Ag=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tAw4wVBCeN6BxDlKoyXb/3f3Bn++j49BOn8gu8QegyPyeAOztj0OGD9wWKOv5CSWr
	 +YotrJhBA/7U+iqGQL5vPxndfC1Z1TKsNcyQWib3UYPU/GWCgGeWulR2DRTrumLx5w
	 OA+mt2fWk+UrpVZeOg5BYHKIJcF+VjzFzvWOxO2hqPi6IBuVxKP9RMlXZiEDpfTMkk
	 8dH1y8HhaQ9TfCZArDd3ifHixGLwXPcU50kKoc0yufKKKC5u1gyVbOvcDNxHJZZKVG
	 iryeGvIFwhmTJ6qKr0x03fwG8EftyIYZ29Kq/gJUfMQgpGJLrevDgXVOHghDeABFJ8
	 GprsJMJgBgw2g==
Date: Fri, 9 Feb 2024 14:02:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Xen Devel <xen-devel@lists.xenproject.org>, 
    Consulting <consulting@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, Jbeulich <jbeulich@suse.com>, 
    Andrew Cooper3 <andrew.cooper3@citrix.com>, 
    Roger Pau <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: Return type of clean_and_invalidate_dcache_va_range
In-Reply-To: <e050b096ff39aa857f9c267a8dbb4ef6@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2402091402080.1925432@ubuntu-linux-20-04-desktop>
References: <e050b096ff39aa857f9c267a8dbb4ef6@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 Feb 2024, Nicola Vetrini wrote:
> Hi all,
> 
> In the context of violations of MISRA C:2012 Rule 17.7: "The value returned by
> a function having non-void return type shall be used", I was looking at the
> function "clean_and_invalidate_dcache_va_range". It has the following
> signature on both arm and x86:
> 
> static inline int clean_and_invalidate_dcache_va_range
>     (const void *p, unsigned long size)
> 
> The commit that introduced it for Arm ~9 years ago (71d64afe3e12: "arm: return
> int from *_dcache_va_range") [1] mentions that on Arm it can't fail, but
> supposedly it can on x86.
> 
> However, as far as I can tell, for both arch-es the implementation now always
> returns 0 [2][3], so perhaps the mention of -EOPNOTSUPP for x86 is no longer
> true (I wasn't able to reconstruct if there was a time at which this was true,
> even in the same commit that changed the return type to int).
> 
> The question is: should the return type be void, since it appears that every
> user is ignoring the returned value (violating the rule), except the one in
> common/grant_table.c [4]?

Looking at the implementation on both ARM and x86, I am in favor of
changing the return type to void



> The other two resolution paths are either allowing this function's result to
> be ignored or cast all ignored invocations to void, with the first being
> cleaner from a code readability perspective.
> 
> [1] These functions cannot really fail on ARM, but their x86 equivalents can
> (-EOPNOTSUPP). Change the prototype to return int.
> [2]
> https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/include/asm/page.h#L218
> [3]
> https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/x86/include/asm/flushtlb.h#L188
> [4]
> https://gitlab.com/xen-project/xen/-/blob/staging/xen/common/grant_table.c#L3576
> 
> -- 
> Nicola Vetrini, BSc
> Software Engineer, BUGSENG srl (https://bugseng.com)
> 

