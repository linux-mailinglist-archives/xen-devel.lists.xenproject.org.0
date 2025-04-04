Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFC2A7B55F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 03:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937714.1338621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Vc9-0001NC-Eg; Fri, 04 Apr 2025 01:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937714.1338621; Fri, 04 Apr 2025 01:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0Vc9-0001Ky-BC; Fri, 04 Apr 2025 01:12:57 +0000
Received: by outflank-mailman (input) for mailman id 937714;
 Fri, 04 Apr 2025 01:12:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oGR=WW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u0Vc7-0001Kc-Ny
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 01:12:55 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edac53ff-10f1-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 03:12:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B7653A4351E;
 Fri,  4 Apr 2025 01:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFEAC4CEE3;
 Fri,  4 Apr 2025 01:12:49 +0000 (UTC)
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
X-Inumbo-ID: edac53ff-10f1-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743729170;
	bh=jwnXwt4wQtNBkUetU0ySAwwrAE6n7F/J5GjR4hoY78o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KHzsYAD7Kfnb9CYtrnYOKnt/SDm8m2PXlWb37kX8z5zSDJI1mvHLEmN/gv+edE5+4
	 Pyp2jSE34vgofslmELN01uEnfoT1kWrfWsVmSDeoyAEU7b129pJh/VVVWUv6VbNzMB
	 KPiCeK4Ghe4RkuIkd526Zu7j46IrfKYZ5x52GDj6M/IsqxlNzZReEC4jU8WqmiDxAM
	 i8Ba+WtU/zEe3l3kY1B5qFscLCMgXooXqUbM+SYZZiv4xKkcF+MSUrThPE/o1YTkHC
	 MdfFGsBjUKZuDxyuDo6cFzPwZjX8TnkFYv/w8ahOiC6UN89pRJM0EO4EZIdfNqFvEe
	 mfizUmQYHwPvw==
Date: Thu, 3 Apr 2025 18:12:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 6/7] xen/arm: dom0less use has_dtb local variable
In-Reply-To: <20250403214608.152954-7-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504031812420.3529306@ubuntu-linux-20-04-desktop>
References: <20250403214608.152954-1-jason.andryuk@amd.com> <20250403214608.152954-7-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Apr 2025, Jason Andryuk wrote:
> Store the result of finding a "multiboot,device-tree" node.  This will
> simplity adding hardware domain checks.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> v3:
> New
> 
> Could be squashed into the next patch, but this helps make the next one
> cleaner.
> ---
>  xen/arch/arm/dom0less-build.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 284190d54f..a72961dfb4 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -1031,6 +1031,7 @@ void __init create_domUs(void)
>              .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>          };
>          unsigned int flags = 0U;
> +        bool has_dtb = false;
>          uint32_t val;
>          int rc;
>  
> @@ -1065,9 +1066,10 @@ void __init create_domUs(void)
>               !strcmp(dom0less_iommu, "enabled") )
>              iommu = true;
>  
> -        if ( iommu_enabled &&
> -             (iommu || dt_find_compatible_node(node, NULL,
> -                                               "multiboot,device-tree")) )
> +        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
> +            has_dtb = true;
> +
> +        if ( iommu_enabled && (iommu || has_dtb) )
>              d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>  
>          if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
> -- 
> 2.49.0
> 

