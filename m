Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF05096AEB9
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 04:43:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789707.1199324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slfyR-00029u-F7; Wed, 04 Sep 2024 02:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789707.1199324; Wed, 04 Sep 2024 02:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slfyR-00027J-Bj; Wed, 04 Sep 2024 02:42:23 +0000
Received: by outflank-mailman (input) for mailman id 789707;
 Wed, 04 Sep 2024 02:42:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J9Y9=QC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1slfyP-000279-M6
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 02:42:21 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ce8be66-6a67-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 04:42:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E9228A40074;
 Wed,  4 Sep 2024 02:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E9AC4CEC4;
 Wed,  4 Sep 2024 02:42:15 +0000 (UTC)
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
X-Inumbo-ID: 4ce8be66-6a67-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725417736;
	bh=AetPxWHj1tyA+TYy0iJZ7s+P/Bx9arRnKf95nv1f6nw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G1Clr5sBoCMqIh8G07ICLb9LWTJYjyks/Jn4kyAWLTXIBQ+Yi3zHDwP7HoRLJdRuB
	 /MHoZm7GUws9BzuwYc7Tg4mzeZ6adcPUPH3Q5k2589bNjxjVTozOB1ajQHwlgaKOIL
	 L+FdxIPZJVMnyTwNkSHBPS5iBtJjDJZK5OSdLdJcp2/9d4ee2A2QwaXLfz2gm0jnFF
	 GFI0+P5vSGjQFs69CPjWbcKqnCwUsvypAvQ7ShPmlx7Wf3jLzS5F2BE4nbKpM4ORou
	 FqxorlCgA62DOOauPLjtQxWJRGlQ+DE5KT2FcLAxKLjPDtZ9BSD0YHGhDaP035XaYv
	 RJbh03XrIdsZA==
Date: Tue, 3 Sep 2024 19:42:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] arm/div64: Drop do_div() macro for GCC version < 4
In-Reply-To: <20240903124834.2240364-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2409031941390.53815@ubuntu-linux-20-04-desktop>
References: <20240903124834.2240364-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Sep 2024, Michal Orzel wrote:
> As stated in README, the minimum supported GCC version for arm32 is
> 4.9, therefore drop the custom do_div() macro in favor of using the
> optimized version.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> To be merged after:
> https://lore.kernel.org/xen-devel/20240902100355.3032079-2-andrew.cooper3@citrix.com
> ---
>  xen/arch/arm/include/asm/div64.h | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/div64.h b/xen/arch/arm/include/asm/div64.h
> index da1f1fcbd503..8fe17f0ff27c 100644
> --- a/xen/arch/arm/include/asm/div64.h
> +++ b/xen/arch/arm/include/asm/div64.h
> @@ -54,20 +54,6 @@
>  	__rem;							\
>  })
>  
> -#if __GNUC__ < 4
> -
> -/*
> - * gcc versions earlier than 4.0 are simply too problematic for the
> - * optimized implementation below. First there is gcc PR 15089 that
> - * tend to trig on more complex constructs, spurious .global __udivsi3
> - * are inserted even if none of those symbols are referenced in the
> - * generated code, and those gcc versions are not able to do constant
> - * propagation on long long values anyway.
> - */
> -#define do_div(n, base) __do_div_asm(n, base)
> -
> -#elif __GNUC__ >= 4
> -
>  #include <xen/bug.h>
>  
>  /*
> @@ -217,8 +203,6 @@
>  	__r;								\
>  })
>  
> -#endif /* GCC version */
> -
>  #endif /* BITS_PER_LONG */
>  
>  #endif
> -- 
> 2.25.1
> 

