Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE19478BB08
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 00:35:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591846.924384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakpd-0004id-4F; Mon, 28 Aug 2023 22:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591846.924384; Mon, 28 Aug 2023 22:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakpd-0004gx-1D; Mon, 28 Aug 2023 22:35:37 +0000
Received: by outflank-mailman (input) for mailman id 591846;
 Mon, 28 Aug 2023 22:35:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBR3=EN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qakpa-0004gp-Ry
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 22:35:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3256fe3c-45f3-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 00:35:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 99AFC63D94;
 Mon, 28 Aug 2023 22:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4784C433C8;
 Mon, 28 Aug 2023 22:35:29 +0000 (UTC)
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
X-Inumbo-ID: 3256fe3c-45f3-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693262131;
	bh=708JWl30Fs9+YrhRYviHcHnZaSrCmQpcyCVzvwbRaU4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Fl0ULmkkIx8Xl3Wb9Ky56Lvur9J2Ehw2Q8rcgBdRZAdqdaVHwBOEgcfPCEpPjeLyX
	 1i5nhRinD6NPI5SevKXaRE0jeHP3jRCu70SNVFO78Uz3tB2PojiMMS1uW3mVD2MME6
	 2NPY3B9uqZCQ1gewCGMWCur6XSVezzC1t6pwWOG65CNUD4QoDAhv6MTJfwf6e8W9pt
	 Ygge59U4mR9nbkxOlZqsGRPMtmRH9wZQ3zT0qx4ehrcktvz6F+p1HXBnTs7iCegsFh
	 lEQ/y2Wp4vMRtWLbx8vu4TJixnILKbOzS63NQV4qZ9yNDldUbde4eEmAkBJV3x/rkX
	 6RzvRHYn5vjxg==
Date: Mon, 28 Aug 2023 15:35:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 08/13] x86/mm: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <b994059118b867960b619d40d74c8f579c0a4d87.1693228255.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308281535110.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <b994059118b867960b619d40d74c8f579c0a4d87.1693228255.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Aug 2023, Simone Ballarin wrote:
> Add inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> C files, if included somewhere, need to comply with the guideline.
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/mm/guest_walk.c     | 5 +++++
>  xen/arch/x86/mm/hap/guest_walk.c | 4 ++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/xen/arch/x86/mm/guest_walk.c b/xen/arch/x86/mm/guest_walk.c
> index fe7393334f..66c127156d 100644
> --- a/xen/arch/x86/mm/guest_walk.c
> +++ b/xen/arch/x86/mm/guest_walk.c
> @@ -9,6 +9,9 @@
>   * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
>   */
>  
> +#ifndef __X86_MM_GUEST_WALK_C__
> +#define __X86_MM_GUEST_WALK_C__
> +
>  #include <xen/types.h>
>  #include <xen/mm.h>
>  #include <xen/paging.h>
> @@ -576,6 +579,8 @@ void *map_domain_gfn(struct p2m_domain *p2m, gfn_t gfn, mfn_t *mfn,
>  }
>  #endif
>  
> +#endif /* __X86_MM_GUEST_WALK_C__ */
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/x86/mm/hap/guest_walk.c b/xen/arch/x86/mm/hap/guest_walk.c
> index d1b7c5762c..d4ffa8141f 100644
> --- a/xen/arch/x86/mm/hap/guest_walk.c
> +++ b/xen/arch/x86/mm/hap/guest_walk.c
> @@ -7,6 +7,9 @@
>   * Copyright (c) 2007, XenSource Inc.
>   */
>  
> +#ifndef __X86_MM_HAP_GUEST_WALK_C__
> +#define __X86_MM_HAP_GUEST_WALK_C__
> +
>  #include <xen/domain_page.h>
>  #include <xen/paging.h>
>  #include <xen/sched.h>
> @@ -124,6 +127,7 @@ unsigned long cf_check hap_p2m_ga_to_gfn(GUEST_PAGING_LEVELS)(
>      return gfn_x(INVALID_GFN);
>  }
>  
> +#endif /* __X86_MM_HAP_GUEST_WALK_C__ */
>  
>  /*
>   * Local variables:
> -- 
> 2.34.1
> 

