Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047961C9C5D
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 22:29:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWn9N-00065u-Pf; Thu, 07 May 2020 20:29:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G3Wl=6V=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jWn9M-00065k-Qs
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 20:29:44 +0000
X-Inumbo-ID: 7c3f565d-90a1-11ea-9f76-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c3f565d-90a1-11ea-9f76-12813bfff9fa;
 Thu, 07 May 2020 20:29:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47AF8208CA;
 Thu,  7 May 2020 20:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588883383;
 bh=JHkHdgGEDMlboKH3/jlAnR93QkRSEmRfXO6kUy5ex3M=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=D4Gu7P9sSSztVHChckZqQu3JWKf0L2sfukj1KfUsOLN/ZtEE/4MnRtO7BtbjYdTUZ
 ZELNhFm3ewOFa/veNRX0E8bBl1tR/rXvXoJiIi3Ggc8LTtzT/LljGVO3HWHTdJNqK3
 LHyhLzkU4CJ67+TVGuVWgCCZ6hv3JycbFGIdNDKY=
Date: Thu, 7 May 2020 13:29:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.14 2/3] xen/arm: atomic: Rewrite write_atomic()
In-Reply-To: <20200502160700.19573-3-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2005071329310.14706@sstabellini-ThinkPad-T480s>
References: <20200502160700.19573-1-julien@xen.org>
 <20200502160700.19573-3-julien@xen.org>
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, 2 May 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The current implementation of write_atomic has two issues:
>     1) It cannot be used to write pointer value because the switch
>     contains cast to other size than the size of the pointer.
>     2) It will happily allow to write to a pointer to const.
> 
> Additionally, the Arm implementation is returning a value when the x86
> implementation does not anymore. This was introduced in commit
> 2934148a0773 "x86: simplify a few macros / inline functions". There are
> no users of the return value, so it is fine to drop it.
> 
> The switch is now moved in a static inline helper allowing the compiler
> to prevent use of const pointer and also allow to write pointer value.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/asm-arm/atomic.h | 40 ++++++++++++++++++++++++++----------
>  1 file changed, 29 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/include/asm-arm/atomic.h b/xen/include/asm-arm/atomic.h
> index 3c3d6bb04ee8..ac2798d095eb 100644
> --- a/xen/include/asm-arm/atomic.h
> +++ b/xen/include/asm-arm/atomic.h
> @@ -98,23 +98,41 @@ static always_inline void read_atomic_size(const volatile void *p,
>      }
>  }
>  
> +static always_inline void write_atomic_size(volatile void *p,
> +                                            void *val,
> +                                            unsigned int size)
> +{
> +    switch ( size )
> +    {
> +    case 1:
> +        write_u8_atomic(p, *(uint8_t *)val);
> +        break;
> +    case 2:
> +        write_u16_atomic(p, *(uint16_t *)val);
> +        break;
> +    case 4:
> +        write_u32_atomic(p, *(uint32_t *)val);
> +        break;
> +    case 8:
> +        write_u64_atomic(p, *(uint64_t *)val);
> +        break;
> +    default:
> +        __bad_atomic_size();
> +        break;
> +    }
> +}
> +
>  #define read_atomic(p) ({                                               \
>      union { typeof(*p) val; char c[0]; } x_;                            \
>      read_atomic_size(p, x_.c, sizeof(*p));                              \
>      x_.val;                                                             \
>  })
>  
> -#define write_atomic(p, x) ({                                           \
> -    typeof(*p) __x = (x);                                               \
> -    switch ( sizeof(*p) ) {                                             \
> -    case 1: write_u8_atomic((uint8_t *)p, (uint8_t)__x); break;         \
> -    case 2: write_u16_atomic((uint16_t *)p, (uint16_t)__x); break;      \
> -    case 4: write_u32_atomic((uint32_t *)p, (uint32_t)__x); break;      \
> -    case 8: write_u64_atomic((uint64_t *)p, (uint64_t)__x); break;      \
> -    default: __bad_atomic_size(); break;                                \
> -    }                                                                   \
> -    __x;                                                                \
> -})
> +#define write_atomic(p, x)                                              \
> +    do {                                                                \
> +        typeof(*p) x_ = (x);                                            \
> +        write_atomic_size(p, &x_, sizeof(*p));                          \
> +    } while ( false )
>  
>  #define add_sized(p, x) ({                                              \
>      typeof(*(p)) __x = (x);                                             \
> -- 
> 2.17.1
> 

