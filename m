Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D1B59A83B
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 00:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390503.627991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAIM-0008TM-5z; Fri, 19 Aug 2022 22:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390503.627991; Fri, 19 Aug 2022 22:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAIM-0008QA-1l; Fri, 19 Aug 2022 22:16:50 +0000
Received: by outflank-mailman (input) for mailman id 390503;
 Fri, 19 Aug 2022 22:16:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1Kg=YX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oPAIL-0007qn-2Z
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 22:16:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9db0712e-200c-11ed-9250-1f966e50362f;
 Sat, 20 Aug 2022 00:16:48 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B39F617AD;
 Fri, 19 Aug 2022 22:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F28C433C1;
 Fri, 19 Aug 2022 22:16:46 +0000 (UTC)
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
X-Inumbo-ID: 9db0712e-200c-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660947407;
	bh=eqkMh2orCp/UA2eOqvApA1AAnsIjGkgE5XPmBgJkEWY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qHtedCIm9fkifdRoipflqgC74UifvTVkAdeh8Ilgnn0lAXm/VVOUzq5ZOHZKghhR4
	 e35Q9vmwSsB21ONTfYBmfUtaKGdAx+/T36tXFq6ebNNKeYdFhwx0K+RfszMWuUA6WY
	 YBwTuxzyA7a4XR0ICU+9hXvWumoQmg7ibEafi0X1sD8DNkOojR7YZtGPljrmIGaBO+
	 WxtFERlyrWR1Ysa1mR1jI2RRGEr73A/C92HMp3ygnliCw6g0xi2hbNzEYjGco2//FD
	 Sr+rOzzZDje9PPk4ZPbxXMSRADY0gZ8uChNgYAQhLFKwe3Q6qielhky6U4MusNqHv0
	 Q5h10WUw7eoBA==
Date: Fri, 19 Aug 2022 15:16:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 4/7] xen/vgic: Fix MISRA C 2012 Rule 20.7 violation
In-Reply-To: <20220819194359.1196539-5-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2208191516380.3790@ubuntu-linux-20-04-desktop>
References: <20220819194359.1196539-1-burzalodowa@gmail.com> <20220819194359.1196539-5-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Aug 2022, Xenia Ragiadakou wrote:
> In macro VGIC_V3_LR_INDEX(), add parentheses around the macro parameter
> to prevent against unintended expansions.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/include/asm/new_vgic.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/new_vgic.h b/xen/arch/arm/include/asm/new_vgic.h
> index ab57fcd91d..b7fa9ab11a 100644
> --- a/xen/arch/arm/include/asm/new_vgic.h
> +++ b/xen/arch/arm/include/asm/new_vgic.h
> @@ -43,7 +43,7 @@ enum vgic_type {
>  
>  #define VGIC_V2_MAX_LRS         (1 << 6)
>  #define VGIC_V3_MAX_LRS         16
> -#define VGIC_V3_LR_INDEX(lr)    (VGIC_V3_MAX_LRS - 1 - lr)
> +#define VGIC_V3_LR_INDEX(lr)    (VGIC_V3_MAX_LRS - 1 - (lr))
>  
>  #define VGIC_CONFIG_EDGE        false
>  #define VGIC_CONFIG_LEVEL       true
> -- 
> 2.34.1
> 

