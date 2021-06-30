Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6127D3B7B21
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 02:50:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148105.273590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyOQx-00077b-38; Wed, 30 Jun 2021 00:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148105.273590; Wed, 30 Jun 2021 00:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyOQw-00074z-Vn; Wed, 30 Jun 2021 00:50:30 +0000
Received: by outflank-mailman (input) for mailman id 148105;
 Wed, 30 Jun 2021 00:50:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZaJs=LY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lyOQv-00074p-91
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 00:50:29 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b3d08f5-9ab7-4d2d-a358-c61c1a1c955d;
 Wed, 30 Jun 2021 00:50:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D530161D6E;
 Wed, 30 Jun 2021 00:50:27 +0000 (UTC)
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
X-Inumbo-ID: 9b3d08f5-9ab7-4d2d-a358-c61c1a1c955d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625014228;
	bh=2T2MfbcJXYl5bhffk3l2gpCiddXKi6U6XNOiSQZoxUg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QIMYj+rXVHw6NRyIWKnBsLZy3k/hL9d/A5bayGegjcdyzqzXa0AW9Vka08oZCdDQz
	 2LwDhtDC18HqFWDIXttBcMkH0XtkVG4y8aKQAJjvBcr1Zh0zo2sTTg0q6alP5Ypz0X
	 3nb32/tz8gF19zSGDwkjWHUDiAPHX0TS5rJmUHx1Wp5CNDonVhOLBXO9DL565BtwZa
	 B8T/Wbf/mKTcBk1+T0kZqOlL1Z732VvsRnb/an+rIto0MSqeCNlGOXG3nvoh+XgomH
	 vKB9tUwmwFbovO90+ea/c5lY8kv/04UTau5758WMZVX9g4gSPSd911KUC2uxoPw5eY
	 ZJbO3rwrgV9lw==
Date: Tue, 29 Jun 2021 17:50:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] iommu/arm: ipmmu-vmsa: Add compatible for Renesas R-Car
 M3-W+ SoC
In-Reply-To: <1623698292-7464-1-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2106291750160.9437@sstabellini-ThinkPad-T480s>
References: <1623698292-7464-1-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Jun 2021, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The "renesas,r8a77961" string identifies M3-W+ (aka M3-W ES3.0)
> instead of "renesas,r8a7796" since Linux commit:
> "9c9f7891093b02eb64ca4e1c7ab776a4296c058f soc: renesas: Identify R-Car M3-W+".
> Add new compatible to the Xen driver.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> index 8b8e3a0..1255b0d 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -1316,6 +1316,7 @@ static const struct dt_device_match ipmmu_dt_match[] __initconst =
>      DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a7795"),
>      DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a77965"),
>      DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a7796"),
> +    DT_MATCH_COMPATIBLE("renesas,ipmmu-r8a77961"),
>      { /* sentinel */ },
>  };
>  
> -- 
> 2.7.4
> 

