Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E54E813CBC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 22:38:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654762.1022086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtPF-0002Ae-GQ; Thu, 14 Dec 2023 21:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654762.1022086; Thu, 14 Dec 2023 21:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtPF-00027L-DY; Thu, 14 Dec 2023 21:38:09 +0000
Received: by outflank-mailman (input) for mailman id 654762;
 Thu, 14 Dec 2023 21:38:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDtPE-00027F-HL
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 21:38:08 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11489460-9ac9-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 22:38:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 10730B81C85;
 Thu, 14 Dec 2023 21:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89DBCC433C9;
 Thu, 14 Dec 2023 21:38:04 +0000 (UTC)
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
X-Inumbo-ID: 11489460-9ac9-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702589885;
	bh=SwARVrNpFPEk+os6hpP3BfrLy4e5W0jSxktQWs+PggY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WHKYG8Gek8dNaeDkImNoq0qW/dACpdiHa19b4rGT1rZ4N6H5JJwNaphUtdh8HlzC7
	 YCC4ehMJ4F9XAUtyPEDxvR8up7Jr5vUD8zwWbEHqBbVEw3nAXgrH6RgxAZ3lTefABX
	 XUTa9a6mMbxLIYL2YB5cNB9p/bJTTl01Hc+Emo/YqM4LWuUaXKxuwaJwbwPqZ+YIKo
	 MKqZ5mYNI/OnFIPxvUL8oxMOJKT7onCyW+RT+QS0wFrjGhn7RxzIVBy1vIe0o43Gkl
	 FFqS3yxQG19ac/9JeuWpffXp+u8yb3/cw+3fuPu44/Y48JL4Sox0dJQzpUoN0rGOSu
	 DzocZG4cHXWiA==
Date: Thu, 14 Dec 2023 13:38:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/9] xen/arm64: address violations of MISRA C:2012 Rule
 11.8
In-Reply-To: <b29e28544eb7772c3df633b176b9698e0ee9ae88.1702555387.git.maria.celeste.cesario@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312141337520.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com> <b29e28544eb7772c3df633b176b9698e0ee9ae88.1702555387.git.maria.celeste.cesario@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Dec 2023, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
> headline states:
> "A conversion shall not remove any const, volatile or _Atomic qualification
> from the type pointed to by a pointer".
> 
> Add volatile qualifiers missing in casts.
> Arguments p and ptr are originally volatile-qualified.
> There's no reason to drop the qualifiers.
> No functional change.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>  xen/arch/arm/arm64/lib/bitops.c          |  6 ++++--
>  xen/arch/arm/include/asm/arm64/cmpxchg.h | 10 +++++-----
>  2 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/lib/bitops.c b/xen/arch/arm/arm64/lib/bitops.c
> index 20e3f3d6ce..275a780329 100644
> --- a/xen/arch/arm/arm64/lib/bitops.c
> +++ b/xen/arch/arm/arm64/lib/bitops.c
> @@ -32,7 +32,8 @@
>  static always_inline bool int_##name(int nr, volatile void *p, bool timeout,\
>                                       unsigned int max_try)                  \
>  {                                                                           \
> -    volatile uint32_t *ptr = (uint32_t *)p + BITOP_WORD((unsigned int)nr);  \
> +    volatile uint32_t *ptr = (volatile uint32_t *)p +                       \
> +                             BITOP_WORD((unsigned int)nr);                  \
>      const uint32_t mask = BITOP_MASK((unsigned int)nr);                     \
>      unsigned long res, tmp;                                                 \
>                                                                              \
> @@ -67,7 +68,8 @@ bool name##_timeout(int nr, volatile void *p, unsigned int max_try)         \
>  static always_inline bool int_##name(int nr, volatile void *p, int *oldbit, \
>                                       bool timeout, unsigned int max_try)    \
>  {                                                                           \
> -    volatile uint32_t *ptr = (uint32_t *)p + BITOP_WORD((unsigned int)nr);  \
> +    volatile uint32_t *ptr = (volatile uint32_t *)p +                       \
> +                             BITOP_WORD((unsigned int)nr);                  \
>      unsigned int bit = (unsigned int)nr % BITOP_BITS_PER_WORD;              \
>      const uint32_t mask = BITOP_MASK(bit);                                  \
>      unsigned long res, tmp;                                                 \
> diff --git a/xen/arch/arm/include/asm/arm64/cmpxchg.h b/xen/arch/arm/include/asm/arm64/cmpxchg.h
> index dbfaf91567..031fa6d92a 100644
> --- a/xen/arch/arm/include/asm/arm64/cmpxchg.h
> +++ b/xen/arch/arm/include/asm/arm64/cmpxchg.h
> @@ -13,7 +13,7 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
>  		"1:	ldxrb	%w0, %2\n"
>  		"	stlxrb	%w1, %w3, %2\n"
>  		"	cbnz	%w1, 1b\n"
> -			: "=&r" (ret), "=&r" (tmp), "+Q" (*(u8 *)ptr)
> +			: "=&r" (ret), "=&r" (tmp), "+Q" (*(volatile u8 *)ptr)
>  			: "r" (x)
>  			: "memory");
>  		break;
> @@ -22,7 +22,7 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
>  		"1:	ldxrh	%w0, %2\n"
>  		"	stlxrh	%w1, %w3, %2\n"
>  		"	cbnz	%w1, 1b\n"
> -			: "=&r" (ret), "=&r" (tmp), "+Q" (*(u16 *)ptr)
> +			: "=&r" (ret), "=&r" (tmp), "+Q" (*(volatile u16 *)ptr)
>  			: "r" (x)
>  			: "memory");
>  		break;
> @@ -31,7 +31,7 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
>  		"1:	ldxr	%w0, %2\n"
>  		"	stlxr	%w1, %w3, %2\n"
>  		"	cbnz	%w1, 1b\n"
> -			: "=&r" (ret), "=&r" (tmp), "+Q" (*(u32 *)ptr)
> +			: "=&r" (ret), "=&r" (tmp), "+Q" (*(volatile u32 *)ptr)
>  			: "r" (x)
>  			: "memory");
>  		break;
> @@ -40,7 +40,7 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
>  		"1:	ldxr	%0, %2\n"
>  		"	stlxr	%w1, %3, %2\n"
>  		"	cbnz	%w1, 1b\n"
> -			: "=&r" (ret), "=&r" (tmp), "+Q" (*(u64 *)ptr)
> +			: "=&r" (ret), "=&r" (tmp), "+Q" (*(volatile u64 *)ptr)
>  			: "r" (x)
>  			: "memory");
>  		break;
> @@ -82,7 +82,7 @@ static inline bool __cmpxchg_case_##name(volatile void *ptr,		\
>  		"	stxr" #sz "	%w0, %" #w "4, %2\n"		\
>  		"1:\n"							\
>  		: "=&r" (res), "=&r" (oldval),				\
> -		  "+Q" (*(unsigned long *)ptr)				\
> +		  "+Q" (*(volatile unsigned long *)ptr)	\
>  		: "Ir" (*old), "r" (new)				\
>  		: "cc");						\
>  									\
> -- 
> 2.40.0
> 

