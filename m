Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68222760234
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 00:24:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569252.889620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO3yV-0000Y4-Vk; Mon, 24 Jul 2023 22:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569252.889620; Mon, 24 Jul 2023 22:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO3yV-0000WO-Sm; Mon, 24 Jul 2023 22:24:19 +0000
Received: by outflank-mailman (input) for mailman id 569252;
 Mon, 24 Jul 2023 22:24:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJiQ=DK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qO3yU-0000WC-HS
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 22:24:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2c9202c-2a70-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 00:24:16 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4A5C26143D;
 Mon, 24 Jul 2023 22:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D18C433C7;
 Mon, 24 Jul 2023 22:24:13 +0000 (UTC)
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
X-Inumbo-ID: d2c9202c-2a70-11ee-b23c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690237454;
	bh=T4VaUWM7QMySV5arEfjq710+X6f2/x+T6JgWklnuo58=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FQhBwsG0uVLL6zEuQxekSWx3wzp6wbjsbBh51uQ+a1lRB9b7m5uVDXaK0qaYQP0Nx
	 ImqfttZHRJTcXrQK5bZ0WGD54x5sBbKycCT9YDquhc2gHX3Y4QF6stnooXY+2CXAfn
	 04uQF6rgKoieGqSwqz866jGfk17OfAnZQIZgAcC+l4J8OQDpCMWGjgbyH/rVraMBOt
	 EvCMZYnphwyzT8ULNcevFEVHC+9cgNCCgXHEranKVFSOnyCS7VFsmyqJg6K1yNyRoY
	 13MiIbcQN2H7VUMPxCTGMYHi9/G87I9sdDGzC1W4YMA6kxZEZQIHKAilzV9oSRk8/8
	 ZZmcNEp0wsjeQ==
Date: Mon, 24 Jul 2023 15:24:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v2] xen/arm/atomic: change parameter name in
 atomic_cmpxchg() definition
In-Reply-To: <a45f6a84f3c50a694e0f55042ef1b2f9ad9ac57d.1690184136.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307241524050.3118466@ubuntu-linux-20-04-desktop>
References: <a45f6a84f3c50a694e0f55042ef1b2f9ad9ac57d.1690184136.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jul 2023, Federico Serafini wrote:
> Change parameter name from 'ptr' to 'v' in the function definition thus
> addressing violations of MISRA C:2012 Rule 8.3: "All declarations of an
> object or function shall use the same names and type qualifiers".
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
>   - added arm tag;
>   - propagated change to arm32.
> ---
>  xen/arch/arm/include/asm/arm32/atomic.h | 8 ++++----
>  xen/arch/arm/include/asm/arm64/atomic.h | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/atomic.h b/xen/arch/arm/include/asm/arm32/atomic.h
> index 2832a72792..33f9e73b19 100644
> --- a/xen/arch/arm/include/asm/arm32/atomic.h
> +++ b/xen/arch/arm/include/asm/arm32/atomic.h
> @@ -113,13 +113,13 @@ static inline void atomic_and(int m, atomic_t *v)
>  	: "cc");
>  }
>  
> -static inline int atomic_cmpxchg(atomic_t *ptr, int old, int new)
> +static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
>  {
>  	int oldval;
>  	unsigned long res;
>  
>  	smp_mb();
> -	prefetchw(&ptr->counter);
> +	prefetchw(&v->counter);
>  
>  	do {
>  		__asm__ __volatile__("@ atomic_cmpxchg\n"
> @@ -127,8 +127,8 @@ static inline int atomic_cmpxchg(atomic_t *ptr, int old, int new)
>  		"mov	%0, #0\n"
>  		"teq	%1, %4\n"
>  		"strexeq %0, %5, [%3]\n"
> -		    : "=&r" (res), "=&r" (oldval), "+Qo" (ptr->counter)
> -		    : "r" (&ptr->counter), "Ir" (old), "r" (new)
> +		    : "=&r" (res), "=&r" (oldval), "+Qo" (v->counter)
> +		    : "r" (&v->counter), "Ir" (old), "r" (new)
>  		    : "cc");
>  	} while (res);
>  
> diff --git a/xen/arch/arm/include/asm/arm64/atomic.h b/xen/arch/arm/include/asm/arm64/atomic.h
> index 2d42567866..4460165295 100644
> --- a/xen/arch/arm/include/asm/arm64/atomic.h
> +++ b/xen/arch/arm/include/asm/arm64/atomic.h
> @@ -105,7 +105,7 @@ static inline void atomic_and(int m, atomic_t *v)
>  	: "Ir" (m));
>  }
>  
> -static inline int atomic_cmpxchg(atomic_t *ptr, int old, int new)
> +static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
>  {
>  	unsigned long tmp;
>  	int oldval;
> @@ -119,7 +119,7 @@ static inline int atomic_cmpxchg(atomic_t *ptr, int old, int new)
>  "	stxr	%w0, %w4, %2\n"
>  "	cbnz	%w0, 1b\n"
>  "2:"
> -	: "=&r" (tmp), "=&r" (oldval), "+Q" (ptr->counter)
> +	: "=&r" (tmp), "=&r" (oldval), "+Q" (v->counter)
>  	: "Ir" (old), "r" (new)
>  	: "cc");
>  
> -- 
> 2.34.1
> 

