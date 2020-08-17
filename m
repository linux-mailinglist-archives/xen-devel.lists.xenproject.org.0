Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FAA247AC7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 00:57:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7o3H-0003Zi-UK; Mon, 17 Aug 2020 22:56:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ksrr=B3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k7o3F-0003Ya-Ph
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 22:56:25 +0000
X-Inumbo-ID: c6ab1b40-ca85-4d0b-9e3e-da082d720e46
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6ab1b40-ca85-4d0b-9e3e-da082d720e46;
 Mon, 17 Aug 2020 22:56:25 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E7E82063A;
 Mon, 17 Aug 2020 22:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597704984;
 bh=5+BGwVWOEwpj8TByUvwM8p5P9w7m9OJjeJCPyCDh13o=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Di/60dHn5yZYWDvo9riozOXwuZ1GCghjiX26Ll7ejPYmQsjDbLwdTeyGAl18re3cN
 tcluUN4B+bPJMinezftXgqjlIHE9blRb1KMXqa21PTpKqb2Engar9MxhCNH6ZKbwKP
 CneL1Kox6tBhQrZYh5T6obxZs7eITn5Miol/yH2Q=
Date: Mon, 17 Aug 2020 15:56:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 Wei Liu <wl@xen.org>, 
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen: Introduce cmpxchg64() and guest_cmpxchg64()
In-Reply-To: <20200815172143.1327-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2008171327020.15985@sstabellini-ThinkPad-T480s>
References: <20200815172143.1327-1-julien@xen.org>
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

On Sat, 15 Aug 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The IOREQ code is using cmpxchg() with 64-bit value. At the moment, this
> is x86 code, but there is plan to make it common.
> 
> To cater 32-bit arch, introduce two new helpers to deal with 64-bit
> cmpxchg.
> 
> The Arm 32-bit implementation of cmpxchg64() is based on the __cmpxchg64
> in Linux v5.8 (arch/arm/include/asm/cmpxchg.h).
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  xen/include/asm-arm/arm32/cmpxchg.h | 68 +++++++++++++++++++++++++++++
>  xen/include/asm-arm/arm64/cmpxchg.h |  5 +++
>  xen/include/asm-arm/guest_atomics.h | 22 ++++++++++
>  xen/include/asm-x86/guest_atomics.h |  2 +
>  xen/include/asm-x86/x86_64/system.h |  2 +
>  5 files changed, 99 insertions(+)
> 
> diff --git a/xen/include/asm-arm/arm32/cmpxchg.h b/xen/include/asm-arm/arm32/cmpxchg.h
> index 0770f272ee99..5e2fa6ee38a0 100644
> --- a/xen/include/asm-arm/arm32/cmpxchg.h
> +++ b/xen/include/asm-arm/arm32/cmpxchg.h
> @@ -87,6 +87,38 @@ __CMPXCHG_CASE(b, 1)
>  __CMPXCHG_CASE(h, 2)
>  __CMPXCHG_CASE( , 4)
>  
> +static inline bool __cmpxchg_case_8(volatile uint64_t *ptr,
> +			 	    uint64_t *old,
> +			 	    uint64_t new,
> +			 	    bool timeout,
> +				    unsigned int max_try)
> +{
> +	uint64_t oldval;
> +	uint64_t res;
> +
> +	do {
> +		asm volatile(
> +		"	ldrexd		%1, %H1, [%3]\n"
> +		"	teq		%1, %4\n"
> +		"	teqeq		%H1, %H4\n"
> +		"	movne		%0, #0\n"
> +		"	movne		%H0, #0\n"
> +		"	bne		2f\n"
> +		"	strexd		%0, %5, %H5, [%3]\n"
> +		"	teq		%0, #0\n"

Apologies if I am misreading this code, but this last "teq" instruction
doesn't seem to be useful?


> +		"2:"
> +		: "=&r" (res), "=&r" (oldval), "+Qo" (*ptr)
                                              ^ not used ?


> +		: "r" (ptr), "r" (*old), "r" (new)
> +		: "memory", "cc");
> +		if (!res)
> +			break;
> +	} while (!timeout || ((--max_try) > 0));
> +
> +	*old = oldval;
> +
> +	return !res;
> +}
> +
>  static always_inline bool __int_cmpxchg(volatile void *ptr, unsigned long *old,
>  					unsigned long new, int size,
>  					bool timeout, unsigned int max_try)
> @@ -156,6 +188,30 @@ static always_inline bool __cmpxchg_mb_timeout(volatile void *ptr,
>  	return ret;
>  }
>  
> +/*
> + * The helper may fail to update the memory if the action takes too long.
> + *
> + * @old: On call the value pointed contains the expected old value. It will be
> + * updated to the actual old value.
> + * @max_try: Maximum number of iterations
> + *
> + * The helper will return true when the update has succeeded (i.e no
> + * timeout) and false if the update has failed.
> + */
> +static always_inline bool __cmpxchg64_mb_timeout(volatile uint64_t *ptr,
> +						 uint64_t *old,
> +						 uint64_t new,
> +						 unsigned int max_try)
> +{
> +	bool ret;
> +
> +	smp_mb();
> +	ret = __cmpxchg_case_8(ptr, old, new, true, max_try);
> +	smp_mb();
> +
> +	return ret;
> +}
> +
>  #define cmpxchg(ptr,o,n)						\
>  	((__typeof__(*(ptr)))__cmpxchg_mb((ptr),			\
>  					  (unsigned long)(o),		\
> @@ -167,6 +223,18 @@ static always_inline bool __cmpxchg_mb_timeout(volatile void *ptr,
>  				       (unsigned long)(o),		\
>  				       (unsigned long)(n),		\
>  				       sizeof(*(ptr))))
> +
> +static inline uint64_t cmpxchg64(volatile uint64_t *ptr,
> +				 uint64_t old,
> +				 uint64_t new)
> +{
> +	smp_mb();

I was looking at the existing code I noticed that we don't have a
corresponding smp_mb(); in this position. Is it needed here because of
the 64bit-ness?


> +	if (!__cmpxchg_case_8(ptr, &old, new, false, 0))
> +		ASSERT_UNREACHABLE();
> +
> +	return old;
> +}
> +
>  #endif
>  /*
>   * Local variables:
> diff --git a/xen/include/asm-arm/arm64/cmpxchg.h b/xen/include/asm-arm/arm64/cmpxchg.h
> index fc5c60f0bd74..de9cd0ee2b07 100644
> --- a/xen/include/asm-arm/arm64/cmpxchg.h
> +++ b/xen/include/asm-arm/arm64/cmpxchg.h
> @@ -187,6 +187,11 @@ static always_inline bool __cmpxchg_mb_timeout(volatile void *ptr,
>  	__ret; \
>  })
>  
> +#define cmpxchg64(ptr, o, n) cmpxchg(ptr, o, n)
> +
> +#define __cmpxchg64_mb_timeout(ptr, old, new, max_try) \
> +	__cmpxchg_mb_timeout(ptr, old, new, 8, max_try)
> +
>  #endif
>  /*
>   * Local variables:
> diff --git a/xen/include/asm-arm/guest_atomics.h b/xen/include/asm-arm/guest_atomics.h
> index af27cc627bf3..28ce402bea79 100644
> --- a/xen/include/asm-arm/guest_atomics.h
> +++ b/xen/include/asm-arm/guest_atomics.h
> @@ -115,6 +115,28 @@ static inline unsigned long __guest_cmpxchg(struct domain *d,
>                                           (unsigned long)(n),\
>                                           sizeof (*(ptr))))
>  
> +static inline uint64_t guest_cmpxchg64(struct domain *d,
> +                                       volatile uint64_t *ptr,
> +                                       uint64_t old,
> +                                       uint64_t new)
> +{
> +    uint64_t oldval = old;
> +
> +    perfc_incr(atomics_guest);
> +
> +    if ( __cmpxchg64_mb_timeout(ptr, &oldval, new,
> +                                this_cpu(guest_safe_atomic_max)) )
> +        return oldval;
> +
> +    perfc_incr(atomics_guest_paused);
> +
> +    domain_pause_nosync(d);
> +    oldval = cmpxchg64(ptr, old, new);
> +    domain_unpause(d);
> +
> +    return oldval;
> +}
> +
>  #endif /* _ARM_GUEST_ATOMICS_H */
>  /*
>   * Local variables:
> diff --git a/xen/include/asm-x86/guest_atomics.h b/xen/include/asm-x86/guest_atomics.h
> index 029417c8ffc1..f4de9d3631ff 100644
> --- a/xen/include/asm-x86/guest_atomics.h
> +++ b/xen/include/asm-x86/guest_atomics.h
> @@ -20,6 +20,8 @@
>      ((void)(d), test_and_change_bit(nr, p))
>  
>  #define guest_cmpxchg(d, ptr, o, n) ((void)(d), cmpxchg(ptr, o, n))
> +#define guest_cmpxchg64(d, ptr, o, n) ((void)(d), cmpxchg64(ptr, o, n))
> +
>  
>  #endif /* _X86_GUEST_ATOMICS_H */
>  /*
> diff --git a/xen/include/asm-x86/x86_64/system.h b/xen/include/asm-x86/x86_64/system.h
> index f471859c19cc..c1b16105e9f2 100644
> --- a/xen/include/asm-x86/x86_64/system.h
> +++ b/xen/include/asm-x86/x86_64/system.h
> @@ -5,6 +5,8 @@
>      ((__typeof__(*(ptr)))__cmpxchg((ptr),(unsigned long)(o),            \
>                                     (unsigned long)(n),sizeof(*(ptr))))
>  
> +#define cmpxchg64(ptr, o, n) cmpxchg(ptr, o, n)
> +
>  /*
>   * Atomic 16 bytes compare and exchange.  Compare OLD with MEM, if
>   * identical, store NEW in MEM.  Return the initial value in MEM.
> -- 
> 2.17.1
> 

