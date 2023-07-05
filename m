Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8AB749127
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 00:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559543.874598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHBPl-0001XM-EZ; Wed, 05 Jul 2023 22:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559543.874598; Wed, 05 Jul 2023 22:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHBPl-0001VS-Bk; Wed, 05 Jul 2023 22:56:01 +0000
Received: by outflank-mailman (input) for mailman id 559543;
 Wed, 05 Jul 2023 22:55:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsP3=CX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qHBPj-0001VF-CJ
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 22:55:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a7483f2-1b87-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 00:55:58 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EBD5C617D6;
 Wed,  5 Jul 2023 22:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 471D4C433C7;
 Wed,  5 Jul 2023 22:55:55 +0000 (UTC)
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
X-Inumbo-ID: 1a7483f2-1b87-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688597756;
	bh=iCjXfAWyaodspGZXjz4PHtjmYjcAp7/azNCHO+AfHcY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cwZJT0tbs4kGnZrXzrpb6/3vO+ScZnIdtP++dF0SEN5jDVosDTR80ab8JbVlceeey
	 mSM/9uLWBSyZjwjhiKNQ4/VfnNP6wWSfjOUtlXd5J5nsCBoDeXiV2u3cD9bndh9uJx
	 D1QrvVZxDLp4xK/QCNTFlq8MCzYJrq/3ynAJGENkvn6EBvaRaoDXN7fT6z5n0d8Q1O
	 Dqg0WsgQeJt+zhyoHbUNRcdkghmdUW8y8IZOzs/Z/M+1RsZjuYrO0H7/3O010dJQrv
	 OfBBT1arWr7pdf+qSowfEtTkoopeHW1J8O6lk/DP9nyAPkFvKSJkkuJHuh0OnwtJLP
	 dJ+e3tUwmNUVg==
Date: Wed, 5 Jul 2023 15:55:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Add missing 'U' in IMTTLBR0_TTBR_MASK
 for shifted constant
In-Reply-To: <20230704203032.4062921-1-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2307051555460.761183@ubuntu-linux-20-04-desktop>
References: <20230704203032.4062921-1-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Jul 2023, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> With enabling both CONFIG_UBSAN and CONFIG_IPMMU_VMSA I have got the following
> splat when an IOMMU driver tried to setup page tables:
> 
> (XEN) ipmmu: /soc/iommu@e67b0000: d1: Set IPMMU context 1 (pgd 0x77fe90000)
> (XEN) ================================================================================
> (XEN) UBSAN: Undefined behaviour in drivers/passthrough/arm/ipmmu-vmsa.c:558:51
> (XEN) left shift of 1048575 by 12 places cannot be represented in type 'int'
> (XEN) Xen WARN at common/ubsan/ubsan.c:172
> (XEN) ---[ Xen-4.18-unstable  arm64  debug=y ubsan=y  Tainted:      S ]----
> ...
> 
> This points to shifted constant in IMTTLBR0_TTBR_MASK. Fix that by adding
> missing 'U' to it.
> 
> This should also address MISRA Rule 7.2:
> 
> A "u" or "U" suffix shall be applied to all integer constants that
> are represented in an unsigned type.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> index 24b9e09a6b..0ccfa53255 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -201,7 +201,7 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
>  #define IMTTBCR_TSZ0_SHIFT             0
>  
>  #define IMTTLBR0              0x0010
> -#define IMTTLBR0_TTBR_MASK    (0xfffff << 12)
> +#define IMTTLBR0_TTBR_MASK    (0xfffffU << 12)
>  #define IMTTUBR0              0x0014
>  #define IMTTUBR0_TTBR_MASK    (0xff << 0)
>  
> -- 
> 2.34.1
> 

