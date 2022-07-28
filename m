Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC303583643
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 03:27:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376545.609401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGsIu-0002va-Hg; Thu, 28 Jul 2022 01:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376545.609401; Thu, 28 Jul 2022 01:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGsIu-0002t4-EE; Thu, 28 Jul 2022 01:27:08 +0000
Received: by outflank-mailman (input) for mailman id 376545;
 Thu, 28 Jul 2022 01:27:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M61b=YB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oGsIs-0002sy-Rs
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 01:27:06 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63338e8d-0e14-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 03:27:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 69F34CE2409;
 Thu, 28 Jul 2022 01:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E5A2C433C1;
 Thu, 28 Jul 2022 01:27:01 +0000 (UTC)
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
X-Inumbo-ID: 63338e8d-0e14-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658971621;
	bh=kZvWyMfOxQe8a61w4boVUHXl/mfeigG/DPDDQE/zMBM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EQPKmee2Z7RFPqPDxhWc+isi7CrXVh+r+JAZS5m2rY7OF2poJiuNRmQVjFIdrFss6
	 oChkWhYvdHcX4Ouqzz7H8lYHlKFWrXzgBGYeBq3CbzjLIQhbp51HRAV9fTLTyOmb8C
	 pNwCfyz9by3VwWcQ8214yKAHVJyoXeud19lB1lOd5ROlvtElygSRkywx0ZTyUPklDp
	 xy1JOavM7PN8VKy2cL4zqRssDR53wUfaEUo40tZtdt4AD610htA8JH0iAhhDWLsA0S
	 eeP0LyxolnjvubqSVsZjVk5MqPRyac9v434EbT0WehhZOvJPocGKEgfyetLUSTwkY4
	 IMJ5X3KD84WiA==
Date: Wed, 27 Jul 2022 18:26:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/1] xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule 20.7
 violation
In-Reply-To: <20220727171841.1163075-2-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207271826530.4648@ubuntu-linux-20-04-desktop>
References: <20220727171841.1163075-1-burzalodowa@gmail.com> <20220727171841.1163075-2-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Jul 2022, Xenia Ragiadakou wrote:
> The macro parameter 'p' is used as an expression and needs to be enclosed in
> parentheses.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Changes in v2:
> - remove parentheses in the cases that p is not used as an expression that is
>   when it is used as a function argument
> 
>  xen/arch/arm/include/asm/atomic.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/include/asm/atomic.h
> index ac2798d095..1f60c28b1b 100644
> --- a/xen/arch/arm/include/asm/atomic.h
> +++ b/xen/arch/arm/include/asm/atomic.h
> @@ -123,15 +123,15 @@ static always_inline void write_atomic_size(volatile void *p,
>  }
>  
>  #define read_atomic(p) ({                                               \
> -    union { typeof(*p) val; char c[0]; } x_;                            \
> -    read_atomic_size(p, x_.c, sizeof(*p));                              \
> +    union { typeof(*(p)) val; char c[0]; } x_;                          \
> +    read_atomic_size(p, x_.c, sizeof(*(p)));                            \
>      x_.val;                                                             \
>  })
>  
>  #define write_atomic(p, x)                                              \
>      do {                                                                \
> -        typeof(*p) x_ = (x);                                            \
> -        write_atomic_size(p, &x_, sizeof(*p));                          \
> +        typeof(*(p)) x_ = (x);                                          \
> +        write_atomic_size(p, &x_, sizeof(*(p)));                        \
>      } while ( false )
>  
>  #define add_sized(p, x) ({                                              \
> -- 
> 2.34.1
> 

