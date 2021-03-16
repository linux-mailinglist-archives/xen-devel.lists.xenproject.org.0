Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB63333CAEE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 02:37:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98154.186091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLyeG-0004Pk-2T; Tue, 16 Mar 2021 01:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98154.186091; Tue, 16 Mar 2021 01:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLyeF-0004PO-To; Tue, 16 Mar 2021 01:37:27 +0000
Received: by outflank-mailman (input) for mailman id 98154;
 Tue, 16 Mar 2021 01:37:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eCom=IO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lLyeE-0004PJ-J2
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 01:37:26 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d17a672-95cc-4126-a697-ef13d43e6462;
 Tue, 16 Mar 2021 01:37:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8519464FB5;
 Tue, 16 Mar 2021 01:37:24 +0000 (UTC)
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
X-Inumbo-ID: 0d17a672-95cc-4126-a697-ef13d43e6462
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615858644;
	bh=PyLXwa2OaPTwqhfA+5C4VHoYQhFc/ZQMhm4+gbHceaQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IXxwy1/Heqor0UQ7X1gJGuUg1dZZZE0yvPXa6IDaiI60gyl7qUMPmUleBLgPQonLW
	 0CPQdyqjNeEnWcJwEK96c/zd/eXoEXZ+QL6ZOfJRjrzDS16AhCp91mXnGOQeYKtUzo
	 3UWD0pOMhYIk+a+PwLjXpEkrd0eli2yEhiijRds07jviXhFKTyrDmWZ4MuUPouSeKO
	 0lu86Bf1ZVcYFb+n741E1oH4X/3dwyKximAYUsgYxl5aDr4pWPXxoyg4M9jQWKF3Kn
	 H42qvVQb2ynQxOQwZl0qDNwtNjwtKWpzTly+cYUMZF+7QD/+j/qyGqhGdv8FcWiyak
	 NzFjFfDBUxLTQ==
Date: Mon, 15 Mar 2021 18:37:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    volodymyr_babchuk@epam.com, Julien Grall <jgrall@amazon.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15 v2] xen: Bump the minimum version of GCC supported
 to 4.9 for arm32 and 5.1 on arm64
In-Reply-To: <20210313134158.24363-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2103151835550.5325@sstabellini-ThinkPad-T480s>
References: <20210313134158.24363-1-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 13 Mar 2021, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Compilers older than 4.8 have known codegen issues which can lead to
> silent miscompilation:
> 
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145
> 
> Furthermore, pre-4.9 GCC have known bugs (including things like
> internal compiler errors on Arm) which would require workaround (I
> haven't checked if we have any in Xen).
> 
> The minimum version of GCC to build the hypervisor on arm is now
> raised to 4.9.
> 
> In addition to that, on arm64, GCC version >= 4.9 and < 5.1 have been
> shown to emit memory references beyond the stack pointer, resulting in
> memory corruption if an interrupt is taken after the stack pointer has
> been adjusted but before the reference has been executed.
> 
> Therefore, the minimum for arm64 is raised to 5.1.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> This patch is candidate to 4.15 and backport.
> 
> This is only a build change and will be low-risk for anyone using newer
> compiler (5.1+ for arm64 and 4.9+ for arm32). Xen will stop building
> for anyone using older compiler. But it is better than fighting
> with codegen issues.
> 
> Changes in v2:
>     - Only bump the GCC version for Arm.
> ---
>  README                     |  7 +++++--
>  xen/include/xen/compiler.h | 10 ++++++++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/README b/README
> index 8c99c30986c1..aa8b4fe126a8 100644
> --- a/README
> +++ b/README
> @@ -42,8 +42,11 @@ provided by your OS distributor:
>          - GNU Binutils 2.16.91.0.5 or later
>          or
>          - Clang/LLVM 3.5 or later
> -      - For ARM:
> -        - GCC 4.8 or later
> +      - For ARM 32-bit:
> +        - GCC 4.9 or later
> +        - GNU Binutils 2.24 or later
> +      - For ARM 64-bit:
> +        - GCC 5.1 or later
>          - GNU Binutils 2.24 or later
>      * Development install of zlib (e.g., zlib-dev)
>      * Development install of Python 2.6 or later (e.g., python-dev)
> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> index 0ec0b4698ea7..17cf00e1ec92 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -3,6 +3,16 @@
>  
>  #if !defined(__GNUC__) || (__GNUC__ < 4)
>  #error Sorry, your compiler is too old/not recognized.
> +#elif CONFIG_CC_IS_GCC
> +# if defined(CONFIG_ARM_32) && CONFIG_GCC_VERSION < 40900
> +#  error Sorry, your version of GCC is too old - please use 4.9 or newer.
> +# elif defined(CONFIG_ARM_64) && CONFIG_GCC_VERSION < 50100
> +/*
> + * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
> + * https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
> + */
> +#  error Sorry, your version of GCC is too old - please use 5.1 or newer.
> +# endif
>  #endif
>  
>  #define barrier()     __asm__ __volatile__("": : :"memory")
> -- 
> 2.17.1
> 

