Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A20A58EA6B
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 12:24:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383527.618711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLisn-00045i-JF; Wed, 10 Aug 2022 10:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383527.618711; Wed, 10 Aug 2022 10:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLisn-00042G-GP; Wed, 10 Aug 2022 10:24:13 +0000
Received: by outflank-mailman (input) for mailman id 383527;
 Wed, 10 Aug 2022 10:24:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oLism-00042A-Dn
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 10:24:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oLism-0006ix-3M; Wed, 10 Aug 2022 10:24:12 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oLisl-000391-SY; Wed, 10 Aug 2022 10:24:12 +0000
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
	bh=j7U8MFVL+GnuHEKO1Vv9JnH5B4RnMXCvBNhiNJwhdCs=; b=Qd1ZXc1mmFHaTlXM1g5L6cNkIe
	oIea2KyWy0ZwIrWhIu0eweUQM7gfhbMlG3/gp1XIao+aLFvgnivkmoGZ0gZMJuNnsbvtK94jsnMQI
	ZYAp/WzH/75xZ2ougls53K7Fo0FSMwmNt6n8pNJQbXMlxQge+v3z4abUTJVg9KidRRQE=;
Message-ID: <8ee01e21-4941-a46d-a5f5-c132c078afa3@xen.org>
Date: Wed, 10 Aug 2022 11:24:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH] xen/arm: gic: Fix MISRA C 2012 Rule 20.7 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220810101539.1909143-1-burzalodowa@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220810101539.1909143-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xenia,

Thank for your effort to make Xen MISRA compliant. Personally, I find 
quite difficult to follow what's going on with dozen of single patches.

It is also makes more difficult for a committer to apply them. For 
instance, tools like 'b4' can easily apply a series. So there are less 
effort required.

So would you be able to try to batch your patches in larger series 
(maybe 10-20 patches)?

Cheers,

On 10/08/2022 11:15, Xenia Ragiadakou wrote:
> In GIC_PRI_TO_GUEST(), add parentheses around the macro parameter 'pri' to
> prevent against unintended expansions and realign comment.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
>   xen/arch/arm/include/asm/gic.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
> index b3c6c67933..3692fae393 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -152,8 +152,8 @@
>   #define GIC_PRI_IPI_ALL    ((GIC_PRI_IPI << 24) | (GIC_PRI_IPI << 16) |\
>                               (GIC_PRI_IPI << 8) | GIC_PRI_IPI)
>   
> -#define GIC_PRI_TO_GUEST(pri) (pri >> 3) /* GICH_LR and GICH_VMCR only support
> -                                            5 bits for guest irq priority */
> +#define GIC_PRI_TO_GUEST(pri) ((pri) >> 3) /* GICH_LR and GICH_VMCR only support
> +                                              5 bits for guest irq priority */
>   
>   #define GICH_LR_PENDING         1
>   #define GICH_LR_ACTIVE          2

-- 
Julien Grall

