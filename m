Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 325E52699F8
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 01:59:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHyNZ-0003xy-GN; Mon, 14 Sep 2020 23:59:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsP3=CX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kHyNX-0003xs-G1
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 23:59:23 +0000
X-Inumbo-ID: 8b851241-5eb5-49f1-9a99-543883383df1
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b851241-5eb5-49f1-9a99-543883383df1;
 Mon, 14 Sep 2020 23:59:22 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 00B5420704;
 Mon, 14 Sep 2020 23:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600127962;
 bh=Zxx6gUUK84SBDeXXVkcsqCFQZhCGRo221vTVDrPu9T0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ZEwc2Z7WNk6KJyKtYAnE0cRrqVduoFMvM1fJX/PUnVJsu8G7wx1QZjzVg3qIscWXo
 48EfLS2FuJ/dtes4EhLeP4AidJWepsPjokvsPMVuaZbG1aihLfpdgms5uhTs3avfrl
 U0hSNTSrrsTjLCFzwR6NicWj9J+PDDR38mfqbpRI=
Date: Mon, 14 Sep 2020 16:59:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, oleksandr_tyshchenko@epam.com, 
 Julien Grall <jgrall@amazon.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] xen/arm: Remove cmpxchg_local() and drop _mb from
 the other helpers
In-Reply-To: <20200911160622.19721-2-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2009141657170.28991@sstabellini-ThinkPad-T480s>
References: <20200911160622.19721-1-julien@xen.org>
 <20200911160622.19721-2-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 11 Sep 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The current set of helpers are quite confusing to follow as the naming
> is not very consistent.
> 
> Given that cmpxchg_local() is not used in Xen, drop it completely.
> Furthermore, adopt a naming with _mb so all names are now consistent.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v2:
>         - Patch added
> ---
>  xen/include/asm-arm/arm32/cmpxchg.h | 31 ++++++-----------------
>  xen/include/asm-arm/arm64/cmpxchg.h | 38 +++++++----------------------
>  xen/include/asm-arm/guest_atomics.h |  6 ++---
>  3 files changed, 19 insertions(+), 56 deletions(-)
> 
> diff --git a/xen/include/asm-arm/arm32/cmpxchg.h b/xen/include/asm-arm/arm32/cmpxchg.h
> index 0770f272ee99..3ef1e5c63276 100644
> --- a/xen/include/asm-arm/arm32/cmpxchg.h
> +++ b/xen/include/asm-arm/arm32/cmpxchg.h
> @@ -112,23 +112,12 @@ static always_inline unsigned long __cmpxchg(volatile void *ptr,
>  					     unsigned long new,
>  					     int size)
>  {
> +	smp_mb();
>  	if (!__int_cmpxchg(ptr, &old, new, size, false, 0))
>  		ASSERT_UNREACHABLE();
> -
> -	return old;
> -}
> -
> -static always_inline unsigned long __cmpxchg_mb(volatile void *ptr,
> -                                                unsigned long old,
> -                                                unsigned long new, int size)
> -{
> -	unsigned long ret;
> -
> -	smp_mb();
> -	ret = __cmpxchg(ptr, old, new, size);
>  	smp_mb();
>  
> -	return ret;
> +	return old;
>  }
>  
>  /*
> @@ -141,11 +130,11 @@ static always_inline unsigned long __cmpxchg_mb(volatile void *ptr,
>   * The helper will return true when the update has succeeded (i.e no
>   * timeout) and false if the update has failed.
>   */
> -static always_inline bool __cmpxchg_mb_timeout(volatile void *ptr,
> -					       unsigned long *old,
> -					       unsigned long new,
> -					       int size,
> -					       unsigned int max_try)
> +static always_inline bool __cmpxchg_timeout(volatile void *ptr,
> +					    unsigned long *old,
> +					    unsigned long new,
> +					    int size,
> +					    unsigned int max_try)
>  {
>  	bool ret;
>  
> @@ -157,12 +146,6 @@ static always_inline bool __cmpxchg_mb_timeout(volatile void *ptr,
>  }
>  
>  #define cmpxchg(ptr,o,n)						\
> -	((__typeof__(*(ptr)))__cmpxchg_mb((ptr),			\
> -					  (unsigned long)(o),		\
> -					  (unsigned long)(n),		\
> -					  sizeof(*(ptr))))
> -
> -#define cmpxchg_local(ptr,o,n)						\
>  	((__typeof__(*(ptr)))__cmpxchg((ptr),				\
>  				       (unsigned long)(o),		\
>  				       (unsigned long)(n),		\
> diff --git a/xen/include/asm-arm/arm64/cmpxchg.h b/xen/include/asm-arm/arm64/cmpxchg.h
> index fc5c60f0bd74..f4a8c1ccba80 100644
> --- a/xen/include/asm-arm/arm64/cmpxchg.h
> +++ b/xen/include/asm-arm/arm64/cmpxchg.h
> @@ -125,23 +125,12 @@ static always_inline unsigned long __cmpxchg(volatile void *ptr,
>  					     unsigned long new,
>  					     int size)
>  {
> +	smp_mb();
>  	if (!__int_cmpxchg(ptr, &old, new, size, false, 0))
>  		ASSERT_UNREACHABLE();
> -
> -	return old;
> -}
> -
> -static always_inline unsigned long __cmpxchg_mb(volatile void *ptr,
> -						unsigned long old,
> -						unsigned long new, int size)
> -{
> -	unsigned long ret;
> -
> -	smp_mb();
> -	ret = __cmpxchg(ptr, old, new, size);
>  	smp_mb();
>  
> -	return ret;
> +	return old;
>  }
>  
>  /*
> @@ -154,11 +143,11 @@ static always_inline unsigned long __cmpxchg_mb(volatile void *ptr,
>   * The helper will return true when the update has succeeded (i.e no
>   * timeout) and false if the update has failed.
>   */
> -static always_inline bool __cmpxchg_mb_timeout(volatile void *ptr,
> -					       unsigned long *old,
> -					       unsigned long new,
> -					       int size,
> -					       unsigned int max_try)
> +static always_inline bool __cmpxchg_timeout(volatile void *ptr,
> +					    unsigned long *old,
> +					    unsigned long new,
> +					    int size,
> +					    unsigned int max_try)
>  {
>  	bool ret;
>  
> @@ -173,17 +162,8 @@ static always_inline bool __cmpxchg_mb_timeout(volatile void *ptr,
>  ({ \
>  	__typeof__(*(ptr)) __ret; \
>  	__ret = (__typeof__(*(ptr))) \
> -		__cmpxchg_mb((ptr), (unsigned long)(o), (unsigned long)(n), \
> -			     sizeof(*(ptr))); \
> -	__ret; \
> -})
> -
> -#define cmpxchg_local(ptr, o, n) \
> -({ \
> -	__typeof__(*(ptr)) __ret; \
> -	__ret = (__typeof__(*(ptr))) \
> -		__cmpxchg((ptr), (unsigned long)(o), \
> -			  (unsigned long)(n), sizeof(*(ptr))); \
> +		__cmpxchg((ptr), (unsigned long)(o), (unsigned long)(n), \
> +			  sizeof(*(ptr))); \
>  	__ret; \
>  })
>  
> diff --git a/xen/include/asm-arm/guest_atomics.h b/xen/include/asm-arm/guest_atomics.h
> index af27cc627bf3..20347849e56c 100644
> --- a/xen/include/asm-arm/guest_atomics.h
> +++ b/xen/include/asm-arm/guest_atomics.h
> @@ -96,14 +96,14 @@ static inline unsigned long __guest_cmpxchg(struct domain *d,
>  
>      perfc_incr(atomics_guest);
>  
> -    if ( __cmpxchg_mb_timeout(ptr, &oldval, new, size,
> -                              this_cpu(guest_safe_atomic_max)) )
> +    if ( __cmpxchg_timeout(ptr, &oldval, new, size,
> +                           this_cpu(guest_safe_atomic_max)) )
>          return oldval;
>  
>      perfc_incr(atomics_guest_paused);
>  
>      domain_pause_nosync(d);
> -    oldval = __cmpxchg_mb(ptr, old, new, size);
> +    oldval = __cmpxchg(ptr, old, new, size);
>      domain_unpause(d);
>  
>      return oldval;
> -- 
> 2.17.1
> 

