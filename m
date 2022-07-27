Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231745829ED
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 17:47:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376303.608981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGjFT-0005Kd-OU; Wed, 27 Jul 2022 15:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376303.608981; Wed, 27 Jul 2022 15:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGjFT-0005I9-Li; Wed, 27 Jul 2022 15:46:59 +0000
Received: by outflank-mailman (input) for mailman id 376303;
 Wed, 27 Jul 2022 15:46:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oGjFS-0005I3-I6
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 15:46:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGjFS-0000SW-6C; Wed, 27 Jul 2022 15:46:58 +0000
Received: from [54.239.6.186] (helo=[192.168.6.7])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGjFR-0001xT-Vs; Wed, 27 Jul 2022 15:46:58 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=aAwzEbIlutvB8c35pb6mLQLOgTLWg9DYdy1tiprim1E=; b=4IwU4Q+jqCcQuc1gk3lDhP1DtE
	XpyZF2fjt8PVF7tqap86WlN/nMlFe9WP+HKf8J6nFBQMDrWowZ3J8mGN963FrPPAbF0hvVwecL640
	QhmMEYH3I/RO5PA3rl7xniqjVJw7wtrd56W+iOJ3PNpnufga/d/r+pvP0KWTGWF2/dys=;
Message-ID: <d0e8f4b6-a66e-48c3-4f29-728cc7f5fafc@xen.org>
Date: Wed, 27 Jul 2022 16:46:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [PATCH 2/2] xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule 2.5
 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220727153254.1143503-1-burzalodowa@gmail.com>
 <20220727153254.1143503-3-burzalodowa@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220727153254.1143503-3-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xenia,

On 27/07/2022 16:32, Xenia Ragiadakou wrote:
> Remove unused macro atomic_xchg().
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
>   xen/arch/arm/include/asm/atomic.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/include/asm/atomic.h
> index f5ef744b4b..a2dc125291 100644
> --- a/xen/arch/arm/include/asm/atomic.h
> +++ b/xen/arch/arm/include/asm/atomic.h
> @@ -223,8 +223,6 @@ static inline int atomic_add_unless(atomic_t *v, int a, int u)
>       return __atomic_add_unless(v, a, u);
>   }
>   
> -#define atomic_xchg(v, new) (xchg(&((v)->counter), new))
> -

While I agree this is unused today, the wrapper is quite trivial and 
part of the generic API (x86 also provides one). So I am not in favor of 
removing it just to please MISRA.

That said, if Bertrand and Stefano agrees with removing it then you 
should also remove the x86 version to avoid inconsistency.

Cheers,

-- 
Julien Grall

