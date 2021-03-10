Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3755F33491B
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 21:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96305.182058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK5kU-0006Wf-Tg; Wed, 10 Mar 2021 20:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96305.182058; Wed, 10 Mar 2021 20:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK5kU-0006WG-Qb; Wed, 10 Mar 2021 20:48:06 +0000
Received: by outflank-mailman (input) for mailman id 96305;
 Wed, 10 Mar 2021 20:48:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmjm=II=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lK5kT-0006WB-IP
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 20:48:05 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0e6379d-9352-4d1a-8335-43d6536368b4;
 Wed, 10 Mar 2021 20:48:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D27364FAF;
 Wed, 10 Mar 2021 20:48:03 +0000 (UTC)
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
X-Inumbo-ID: a0e6379d-9352-4d1a-8335-43d6536368b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615409283;
	bh=ojGzT8l9D92MEjIk+0sXh0dVACwtYQPkIDsUydDMuJ8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=j4kzH9EFYMNm8r4Hj5m+vrwNjH04rTJ89OxpeHXLuWHoNepUduGgWEky4O6jAKiCA
	 WshFa7ZUSh7xRKKsxaTLa5hkVPgd+fF7089u/ILf6Vk/6QEmycrV8ix+fDQKN5+fgN
	 ktmt7tCgw6FYlhDTn4Dffj3zJ4VU0nJv0M3n5UikGWX9Je+v0uWRU7XJev1vPbrIbs
	 s4vstm0jwjxkPRQrpZgQquc/R3SzWCzN89odlTtXspCy7GFUJOyq671Wt2GjBcw9oF
	 sFKP4Dwm3MHgzTXyZ0IbStEIl4eKlfQri9Ja0uFATtrtVxH4ShlmSyfJhTCjd0Gxvm
	 2LWdybwfWyoog==
Date: Wed, 10 Mar 2021 12:48:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported
 to 4.9 (5.1 on arm64)
In-Reply-To: <20210306214148.27021-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2103101244460.16374@sstabellini-ThinkPad-T480s>
References: <20210306214148.27021-1-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 6 Mar 2021, Julien Grall wrote:
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
> The minimum version of GCC to build the hypervisor is now raised to 4.9.
> 
> In addition to that, on arm64, GCC version >= 4.9 and < 5.1 have been
> shown to emit memory references beyond the stack pointer, resulting in
> memory corruption if an interrupt is taken after the stack pointer has
> been adjusted but before the reference has been executed.
> 
> Therefore, the minimum for arm64 is raised to 5.1.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

For the ARM part:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> I don't have a strong opinion on the minimum version for GCC on x86.
> So this is following Andrew's suggestion and the minimum from Linux.
> 
> This patch is candidate to 4.15 and backport.
> 
> This is only a build change and will be low-risk for anyone using newer
> compiler (5.1+ for arm64 and 4.9 for everyone else). Xen will stop
> building for anyone using older compiler. But it is better than fighting
> with codegen issues.
> ---
>  README                     |  9 ++++++---
>  xen/include/xen/compiler.h | 13 +++++++++++++
>  2 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/README b/README
> index 8c99c30986c1..5c32c03f2ea1 100644
> --- a/README
> +++ b/README
> @@ -38,12 +38,15 @@ provided by your OS distributor:
>      * GNU Make v3.80 or later
>      * C compiler and linker:
>        - For x86:
> -        - GCC 4.1.2_20070115 or later
> +        - GCC 4.9 or later
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
> index 0ec0b4698ea7..46779660cc8f 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -5,6 +5,19 @@
>  #error Sorry, your compiler is too old/not recognized.
>  #endif
>  
> +#if CONFIG_CC_IS_GCC
> +# if CONFIG_GCC_VERSION < 40900
> +/* https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145 */
> +#  error Sorry, your version of GCC is too old - please use 4.9 or newer.
> +# elif defined(CONFIG_ARM_64) && CONFIG_GCC_VERSION < 50100
> +/*
> + * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
> + * https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
> + */
> +#  error Sorry, your version of GCC is too old - please use 5.1 or newer.
> +# endif
> +#endif
> +
>  #define barrier()     __asm__ __volatile__("": : :"memory")
>  
>  #define likely(x)     __builtin_expect(!!(x),1)
 


