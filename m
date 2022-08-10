Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8082E58F393
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 22:35:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384034.619295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLsOz-0005py-W5; Wed, 10 Aug 2022 20:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384034.619295; Wed, 10 Aug 2022 20:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLsOz-0005n6-Sq; Wed, 10 Aug 2022 20:34:05 +0000
Received: by outflank-mailman (input) for mailman id 384034;
 Wed, 10 Aug 2022 20:34:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z72a=YO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oLsOy-0005mz-1l
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 20:34:04 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c47c4c9c-18eb-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 22:34:02 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AA32EB81B5D;
 Wed, 10 Aug 2022 20:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89845C433C1;
 Wed, 10 Aug 2022 20:33:58 +0000 (UTC)
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
X-Inumbo-ID: c47c4c9c-18eb-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660163639;
	bh=FSiQ1JPQhpwxTegkCE1Wd53aKULem9fIt+fhoTdU9qY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iHFTYqVLKVYfaQQWLKrfLVhgf8k61GGd42Ep1f2E2Yws2aPIettwo7jGTRsuXB7A/
	 sRv1y3M0S7ErhbbCxCU8wgEDUmu5DBYkAvdzQqjUIz01j3PYvhv9boaOGwsm8Pt2aT
	 T0EdYm+7zW4XPiVDWLzAA3JE3sMNYpZzgLUpFQg5TnqhxwCGrvRJuY65IihP03hzIQ
	 dq0y7+F7zb4x7ZsZnbHFgS1O9ezC605UK3cqdmUuGVBgaJKmcl2WIn5LcNOaGESCE/
	 VkfvEoWqElW5gv5/FRbFRsXvWlGEXfZjaa9PNBFWGb615wtd63V74SPPAiWlZEY6IK
	 G8bNmxTrwSANQ==
Date: Wed, 10 Aug 2022 13:33:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: gic: Fix MISRA C 2012 Rule 20.7 violation
In-Reply-To: <20220810101539.1909143-1-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2208101333480.3790@ubuntu-linux-20-04-desktop>
References: <20220810101539.1909143-1-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Aug 2022, Xenia Ragiadakou wrote:
> In GIC_PRI_TO_GUEST(), add parentheses around the macro parameter 'pri' to
> prevent against unintended expansions and realign comment.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/include/asm/gic.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
> index b3c6c67933..3692fae393 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -152,8 +152,8 @@
>  #define GIC_PRI_IPI_ALL    ((GIC_PRI_IPI << 24) | (GIC_PRI_IPI << 16) |\
>                              (GIC_PRI_IPI << 8) | GIC_PRI_IPI)
>  
> -#define GIC_PRI_TO_GUEST(pri) (pri >> 3) /* GICH_LR and GICH_VMCR only support
> -                                            5 bits for guest irq priority */
> +#define GIC_PRI_TO_GUEST(pri) ((pri) >> 3) /* GICH_LR and GICH_VMCR only support
> +                                              5 bits for guest irq priority */
>  
>  #define GICH_LR_PENDING         1
>  #define GICH_LR_ACTIVE          2
> -- 
> 2.34.1
> 

