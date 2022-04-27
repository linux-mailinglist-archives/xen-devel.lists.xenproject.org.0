Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0627511C18
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 18:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315236.533697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njk85-0003li-0z; Wed, 27 Apr 2022 16:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315236.533697; Wed, 27 Apr 2022 16:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njk84-0003iY-Tc; Wed, 27 Apr 2022 16:03:00 +0000
Received: by outflank-mailman (input) for mailman id 315236;
 Wed, 27 Apr 2022 16:02:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njk83-0003iG-Hv
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 16:02:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njk83-0001SL-55; Wed, 27 Apr 2022 16:02:59 +0000
Received: from [54.239.6.186] (helo=[192.168.24.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njk82-0007yr-Up; Wed, 27 Apr 2022 16:02:59 +0000
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
	bh=8oNkFj8jmw3Du7ovep81MmJhJqcTmyaj2BQnahSLOS8=; b=aaPpi8RkFE9SjUuoqJest/sNiz
	o2CP559sIk/jR2HZE5j+CJjJzEujvjvQj86kGX3EDO3Bfe/DCNzRpahLBnnldz+bhXg8mf7OcwDe6
	GY5cEjtRmiHaV1tOHTXDuP47/8zx1VgRZYcB6nhitkmtsPseCBcKmW5joXjM2VzPFjsM=;
Message-ID: <8dda4ad4-2211-1205-1933-8353f6649593@xen.org>
Date: Wed, 27 Apr 2022 17:02:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [RFC PATCH] xen/arm: p2m don't fall over on FEAT_LPA enabled hw
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 xen-devel@lists.xenproject.org
Cc: stratos-dev@op-lists.linaro.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20220426160548.2020794-1-alex.bennee@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220426160548.2020794-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alex,

On 26/04/2022 17:05, Alex Bennée wrote:
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index fb71fa4c1c..e5a88095f8 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -2030,7 +2030,7 @@ void __init setup_virt_paging(void)
>           unsigned int root_order; /* Page order of the root of the p2m */
>           unsigned int sl0;    /* Desired SL0, maximum in comment */
>       } pa_range_info[] = {
> -        /* T0SZ minimum and SL0 maximum from ARM DDI 0487A.b Table D4-5 */
> +        /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table D5-6 */
>           /*      PA size, t0sz(min), root-order, sl0(max) */
>           [0] = { 32,      32/*32*/,  0,          1 },
>           [1] = { 36,      28/*28*/,  0,          1 },
> @@ -2038,7 +2038,7 @@ void __init setup_virt_paging(void)
>           [3] = { 42,      22/*22*/,  3,          1 },
>           [4] = { 44,      20/*20*/,  0,          2 },
>           [5] = { 48,      16/*16*/,  0,          2 },
> -        [6] = { 0 }, /* Invalid */
> +        [6] = { 52,      12/*12*/,  3,          3 },
>           [7] = { 0 }  /* Invalid */
>       };
>   
> @@ -2069,10 +2069,13 @@ void __init setup_virt_paging(void)
>           }
>       }
>   
> -    /* pa_range is 4 bits, but the defined encodings are only 3 bits */
> +    /* pa_range is 4 bits but we don't support all modes */
>       if ( pa_range >= ARRAY_SIZE(pa_range_info) || !pa_range_info[pa_range].pabits )
>           panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", pa_range);
>   
> +    if ( pa_range > 5 )
> +        pa_range = 5;

I think it would be better to restrict the p2m_ipa_bits rather than the 
PA range. This can be done by initializing p2m_ipa_bits to PADDR_BITS (48).

Cheers,

-- 
Julien Grall

