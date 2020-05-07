Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2EA1C9C5C
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 22:29:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWn94-00064Y-Fc; Thu, 07 May 2020 20:29:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G3Wl=6V=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jWn92-00064S-NT
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 20:29:24 +0000
X-Inumbo-ID: 6f5e0ea6-90a1-11ea-9887-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f5e0ea6-90a1-11ea-9887-bc764e2007e4;
 Thu, 07 May 2020 20:29:24 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B66B208CA;
 Thu,  7 May 2020 20:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588883361;
 bh=C/FjtARnN2djUbFPhCW9yNk/5S3TNogKH8l7LXGiYC4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=gwIjJPwh6mEzOkMf/Tm/IoswjhNZx/MzBVpfXnGoP0ZGaQglVkoTK7gFLlotlMN7z
 NMDKd3WpkjX47AA9FjTu0l8PTR6Z5yL/84JxDVVBOSVTToPbYAxsaasye4LTCCW+eO
 m68+qlOBr+RTl/bgnl5I3MkydVRB2E3MfeoY2ilI=
Date: Thu, 7 May 2020 13:29:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.14 1/3] xen/arm: atomic: Allow read_atomic() to be
 used in more cases
In-Reply-To: <20200502160700.19573-2-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2005071325210.14706@sstabellini-ThinkPad-T480s>
References: <20200502160700.19573-1-julien@xen.org>
 <20200502160700.19573-2-julien@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, 2 May 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The current implementation of read_atomic() on Arm will not allow to:
>     1) Read a value from a pointer to const because the temporary
>     variable will be const and therefore it is not possible to assign
>     any value. This can be solved by using a union between the type and
>     a char[0].
>     2) Read a pointer value (e.g void *) because the switch contains
>     cast from other type than the size of a pointer. This can be solved by
>     by introducing a static inline for the switch and use void * for the
>     pointer.
> 
> Reported-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/include/asm-arm/atomic.h | 37 +++++++++++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/include/asm-arm/atomic.h b/xen/include/asm-arm/atomic.h
> index e81bf80e305c..3c3d6bb04ee8 100644
> --- a/xen/include/asm-arm/atomic.h
> +++ b/xen/include/asm-arm/atomic.h
> @@ -71,18 +71,37 @@ build_add_sized(add_u32_sized, "", WORD, uint32_t)
>  #undef build_atomic_write
>  #undef build_add_sized
>  
> +void __bad_atomic_read(const volatile void *p, void *res);
>  void __bad_atomic_size(void);
>  
> +static always_inline void read_atomic_size(const volatile void *p,
> +                                           void *res,
> +                                           unsigned int size)
> +{
> +    switch ( size )
> +    {
> +    case 1:
> +        *(uint8_t *)res = read_u8_atomic(p);
> +        break;
> +    case 2:
> +        *(uint16_t *)res = read_u16_atomic(p);
> +        break;
> +    case 4:
> +        *(uint32_t *)res = read_u32_atomic(p);
> +        break;
> +    case 8:
> +        *(uint64_t *)res = read_u64_atomic(p);
> +        break;
> +    default:
> +        __bad_atomic_read(p, res);
> +        break;
> +    }
> +}
> +
>  #define read_atomic(p) ({                                               \
> -    typeof(*p) __x;                                                     \
> -    switch ( sizeof(*p) ) {                                             \
> -    case 1: __x = (typeof(*p))read_u8_atomic((uint8_t *)p); break;      \
> -    case 2: __x = (typeof(*p))read_u16_atomic((uint16_t *)p); break;    \
> -    case 4: __x = (typeof(*p))read_u32_atomic((uint32_t *)p); break;    \
> -    case 8: __x = (typeof(*p))read_u64_atomic((uint64_t *)p); break;    \
> -    default: __x = 0; __bad_atomic_size(); break;                       \
> -    }                                                                   \
> -    __x;                                                                \
> +    union { typeof(*p) val; char c[0]; } x_;                            \
> +    read_atomic_size(p, x_.c, sizeof(*p));                              \

Wouldn't it be better to pass x_ as follows:

    read_atomic_size(p, &x_, sizeof(*p));

?

In my tests both ways works. I prefer the version with &x_ but given
that it works either way:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> +    x_.val;                                                             \
>  })
>  
>  #define write_atomic(p, x) ({                                           \
> -- 
> 2.17.1
> 

