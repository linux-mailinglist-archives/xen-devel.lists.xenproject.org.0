Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FF37D1482
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 19:03:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619891.965703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtsty-00084I-HH; Fri, 20 Oct 2023 17:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619891.965703; Fri, 20 Oct 2023 17:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtsty-00082N-EX; Fri, 20 Oct 2023 17:03:10 +0000
Received: by outflank-mailman (input) for mailman id 619891;
 Fri, 20 Oct 2023 17:03:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qtstw-00082H-2r
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 17:03:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtstv-0000A4-Er; Fri, 20 Oct 2023 17:03:07 +0000
Received: from [54.239.6.188] (helo=[192.168.205.12])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtstv-0003ja-8J; Fri, 20 Oct 2023 17:03:07 +0000
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
	bh=FX5we33yGDaFkeVoB2KKuc2RMaQymN06UJQBN5B9hRw=; b=XcAmsaX1UTIj5byn0FDodKzw22
	Qfg387FpsLD66WDJEbk6ClU4pb7Hr2/A5KUB4f4Aa/OU8Cm+xYMB8va3fTIBy2LwhvNDtNwVNYalN
	Ed0CRLGwc1S/OL6+nD8fMCsJPFvJjPehF/+pAE/EcTa6PLoXKqyAoEDR9CdrRgqjUU6o=;
Message-ID: <75deb3bc-1115-42eb-a629-defb09991074@xen.org>
Date: Fri, 20 Oct 2023 18:03:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19 v3 1/8] xen/include: add macro LOWEST_BIT
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1697815135.git.nicola.vetrini@bugseng.com>
 <546cf30aa43d6d0687a9a6c6d23b11128e5783e8.1697815135.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <546cf30aa43d6d0687a9a6c6d23b11128e5783e8.1697815135.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 20/10/2023 16:28, Nicola Vetrini wrote:
> diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
> index d0caae7db298..49f3ebf848e9 100644
> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -8,8 +8,11 @@
>   #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>   #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>   
> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
> +/* Returns the 2^ffs(x) or 0, where ffs(x) is the index of the lowest set bit */
> +#define LOWEST_BIT(x) ((x) & -(x))
> +
> +#define MASK_EXTR(v, m) (((v) & (m)) / LOWEST_BIT(m))
> +#define MASK_INSR(v, m) (((v) * LOWEST_BIT(m)) & (m))
>   
>   #define count_args_(dot, a1, a2, a3, a4, a5, a6, a7, a8, x, ...) x
>   #define count_args(args...) \
> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
> index aea259db1ef2..23cad71c8a47 100644
> --- a/xen/include/xen/types.h
> +++ b/xen/include/xen/types.h

I don't understand how the changes in this file are related to the 
commit. Did you intend to create a separate commit?

The rest LGTM.

> @@ -31,9 +31,9 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
>   #define NULL ((void*)0)
>   #endif
>   
> -#define INT8_MIN        (-127-1)
> -#define INT16_MIN       (-32767-1)
> -#define INT32_MIN       (-2147483647-1)
> +#define INT8_MIN        (-127 - 1)
> +#define INT16_MIN       (-32767 - 1)
> +#define INT32_MIN       (-2147483647 - 1)
>   
>   #define INT8_MAX        (127)
>   #define INT16_MAX       (32767)
> @@ -43,10 +43,10 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
>   #define UINT16_MAX      (65535)
>   #define UINT32_MAX      (4294967295U)
>   
> -#define INT_MAX         ((int)(~0U>>1))
> +#define INT_MAX         ((int)(~0U >> 1))
>   #define INT_MIN         (-INT_MAX - 1)
>   #define UINT_MAX        (~0U)
> -#define LONG_MAX        ((long)(~0UL>>1))
> +#define LONG_MAX        ((long)(~0UL >> 1))
>   #define LONG_MIN        (-LONG_MAX - 1)
>   #define ULONG_MAX       (~0UL)
>   

Cheers,

-- 
Julien Grall

