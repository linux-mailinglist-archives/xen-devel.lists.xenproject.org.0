Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D210F233936
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 21:44:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1ETW-0003Zn-T6; Thu, 30 Jul 2020 19:44:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fgvr=BJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k1ETV-0003Zi-59
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 19:44:21 +0000
X-Inumbo-ID: 0f994682-d29d-11ea-ab18-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f994682-d29d-11ea-ab18-12813bfff9fa;
 Thu, 30 Jul 2020 19:44:20 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A01782072A;
 Thu, 30 Jul 2020 19:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596138259;
 bh=ue3sDqBzxkRw8CCsEptpU2EkFEZDRufHMYpjO1K8rGI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Qf656IJK+gwP3pvxj/fiIL9ZZcDybfp7toHjxMSHIVgpi07NHS9ApNobijP/GPglS
 BE8BPXiRO43m7M6NLsX0TOtnRJOlW90xTcANKw+OA8oCVpi4zretVF5+BUtLZLC1DM
 sbr0PKdHK0VdAcD7UrfnwEhEwsR3T7AHvme/Tdzc=
Date: Thu, 30 Jul 2020 12:44:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: cmpxchg: Add missing memory barriers in
 __cmpxchg_mb_timeout()
In-Reply-To: <20200730170721.23393-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2007301115300.1767@sstabellini-ThinkPad-T480s>
References: <20200730170721.23393-1-julien@xen.org>
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

On Thu, 30 Jul 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The function __cmpxchg_mb_timeout() was intended to have the same
> semantics as __cmpxchg_mb(). Unfortunately, the memory barriers were
> not added when first implemented.
> 
> There is no known issue with the existing callers, but the barriers are
> added given this is the expected semantics in Xen.
> 
> The issue was introduced by XSA-295.
> 
> Backport: 4.8+
> Fixes: 86b0bc958373 ("xen/arm: cmpxchg: Provide a new helper that can timeout")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/asm-arm/arm32/cmpxchg.h | 8 +++++++-
>  xen/include/asm-arm/arm64/cmpxchg.h | 8 +++++++-
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/include/asm-arm/arm32/cmpxchg.h b/xen/include/asm-arm/arm32/cmpxchg.h
> index 49ca2a0d7ab1..0770f272ee99 100644
> --- a/xen/include/asm-arm/arm32/cmpxchg.h
> +++ b/xen/include/asm-arm/arm32/cmpxchg.h
> @@ -147,7 +147,13 @@ static always_inline bool __cmpxchg_mb_timeout(volatile void *ptr,
>  					       int size,
>  					       unsigned int max_try)
>  {
> -	return __int_cmpxchg(ptr, old, new, size, true, max_try);
> +	bool ret;
> +
> +	smp_mb();
> +	ret = __int_cmpxchg(ptr, old, new, size, true, max_try);
> +	smp_mb();
> +
> +	return ret;
>  }
>  
>  #define cmpxchg(ptr,o,n)						\
> diff --git a/xen/include/asm-arm/arm64/cmpxchg.h b/xen/include/asm-arm/arm64/cmpxchg.h
> index 5bc2e1f78674..fc5c60f0bd74 100644
> --- a/xen/include/asm-arm/arm64/cmpxchg.h
> +++ b/xen/include/asm-arm/arm64/cmpxchg.h
> @@ -160,7 +160,13 @@ static always_inline bool __cmpxchg_mb_timeout(volatile void *ptr,
>  					       int size,
>  					       unsigned int max_try)
>  {
> -	return __int_cmpxchg(ptr, old, new, size, true, max_try);
> +	bool ret;
> +
> +	smp_mb();
> +	ret = __int_cmpxchg(ptr, old, new, size, true, max_try);
> +	smp_mb();
> +
> +	return ret;
>  }
>  
>  #define cmpxchg(ptr, o, n) \
> -- 
> 2.17.1
> 

