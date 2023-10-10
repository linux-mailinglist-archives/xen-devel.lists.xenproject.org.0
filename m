Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EF27BEFDE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 02:46:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614520.955648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq0sr-0001zq-9X; Tue, 10 Oct 2023 00:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614520.955648; Tue, 10 Oct 2023 00:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq0sr-0001xF-6j; Tue, 10 Oct 2023 00:46:01 +0000
Received: by outflank-mailman (input) for mailman id 614520;
 Tue, 10 Oct 2023 00:45:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z25Z=FY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qq0so-0001x9-Uz
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 00:45:58 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e9f5990-6706-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 02:45:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0EDD4CE1919;
 Tue, 10 Oct 2023 00:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97521C433C8;
 Tue, 10 Oct 2023 00:45:49 +0000 (UTC)
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
X-Inumbo-ID: 5e9f5990-6706-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696898751;
	bh=OVV1ZStN1M/FWxT8rFRWguxElvgWA0balYb+yWWAI+s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lVRkZ/jWo2+PYq/DmUbcTjUuRpfcIGnu4JzGftSJzyqNKyLcRPV8FzVu0EaY7g2Mn
	 RPdkI6hQxrWbZbNTv6joZeeSDZB9uNjT5u94mSHNkZ7aWhKmWhWCQOW03sDwpmDFhb
	 5OujWG4xypFwQ95uqaPfOli2jKWDv0Alai8q95JaEfo1f+fKVALDdKx4ZjdMCqXjmw
	 tqlp1YZpWwLbo4fjHZ0RkkZrFVTKmopqI0gKs4FxqWYlX43+hcJqAKB77liBBqP5Jr
	 0fRyKkM7l8B6kcX3Q6gQZ9ZXELYFG0YxqVlP7YNFpV4hw81ydz4iEcpp9VLbfhhjBC
	 I0gJkJsJGYF4Q==
Date: Mon, 9 Oct 2023 17:45:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH][for-4.19 2/9] arm/bitops: encapsulate violation of
 MISRA C:2012 Rule 10.1
In-Reply-To: <a789098c17d5a45b7388dcf1333751df1126f123.1696514677.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310091745160.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com> <a789098c17d5a45b7388dcf1333751df1126f123.1696514677.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Oct 2023, Nicola Vetrini wrote:
> The definitions of ffs{l}? violate Rule 10.1, by using the well-known
> pattern (x & -x); its usage is wrapped by the LOWEST_POW2 macro.
> 
> No functional change.

Once we settle on a name for LOWEST_POW2 I can provided by reviewed-by
for this and the other patches in this series where LOWEST_POW2 is added


> ---
>  xen/arch/arm/include/asm/bitops.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
> index 71ae14cab355..d119e1ccc952 100644
> --- a/xen/arch/arm/include/asm/bitops.h
> +++ b/xen/arch/arm/include/asm/bitops.h
> @@ -9,6 +9,8 @@
>  #ifndef _ARM_BITOPS_H
>  #define _ARM_BITOPS_H
>  
> +#include <xen/macros.h>
> +
>  #include <asm/asm_defns.h>
>  
>  /*
> @@ -155,8 +157,8 @@ static inline int fls(unsigned int x)
>  }
>  
>  
> -#define ffs(x) ({ unsigned int __t = (x); fls(__t & -__t); })
> -#define ffsl(x) ({ unsigned long __t = (x); flsl(__t & -__t); })
> +#define ffs(x) ({ unsigned int __t = (x); fls(LOWEST_POW2(__t)); })
> +#define ffsl(x) ({ unsigned long __t = (x); flsl(LOWEST_POW2(__t)); })
>  
>  /**
>   * find_first_set_bit - find the first set bit in @word
> -- 
> 2.34.1
> 

