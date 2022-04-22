Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5EA50C26B
	for <lists+xen-devel@lfdr.de>; Sat, 23 Apr 2022 01:01:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311287.528465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni2Go-0004pU-DE; Fri, 22 Apr 2022 23:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311287.528465; Fri, 22 Apr 2022 23:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ni2Go-0004nM-99; Fri, 22 Apr 2022 23:00:58 +0000
Received: by outflank-mailman (input) for mailman id 311287;
 Fri, 22 Apr 2022 23:00:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0EE=VA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ni2Gm-0002xN-H9
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 23:00:56 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10a65f16-c290-11ec-8fc2-03012f2f19d4;
 Sat, 23 Apr 2022 01:00:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 07606B83302;
 Fri, 22 Apr 2022 23:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6B6C385A0;
 Fri, 22 Apr 2022 23:00:53 +0000 (UTC)
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
X-Inumbo-ID: 10a65f16-c290-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650668453;
	bh=Tt3wwME8ZrAnjoqNSv/eny+SL/xKTMCNW0YOwL5HtmU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pbkp72Syh6ze1/sVyi2ZMLT+cvAgwDIUvVnmDhf93VYSNywj5WeHzORptbyE6qnCp
	 Kj0veLD6zjTWSl2azkAW3joi+nFnQJPt4r/40N62vmTbpV8HQk0UAypHp4iJt9mvhb
	 VbCPtoxYVel6jnB7YSXPTl1xFeMsUV7fkRz+W0JFs6lfFbQiORL+7ALl8VgRQFMwzz
	 WgbYAr7QXc/+YIBuhsGqgGJ/aWpcXxJ3bmWsmxsHklj4NSJDY+EbVYRYxltALvFvFn
	 bOoCfKQq8f7CkYyjMLMJ9/2i1c3g7V8uz0QOmYsPhnz29cg0NlwTAulTy+D9D5kY0I
	 zZC4ySq0Nur6w==
Date: Fri, 22 Apr 2022 16:00:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V1 6/6] arm/xen: Assign xen-grant DMA ops for xen-grant
 DMA devices
In-Reply-To: <1650646263-22047-7-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204221537160.915916@ubuntu-linux-20-04-desktop>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com> <1650646263-22047-7-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 22 Apr 2022, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> As the main (and single at the moment) purpose of xen-grant
> DMA devices is to enable using virtio devices in Xen guests
> in a safe manner, assign xen-grant DMA ops only if restricted
> access to the guest memory is enabled.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes RFC -> V1:
>    - update commit subject/description
>    - remove #ifdef CONFIG_XEN_VIRTIO
>    - re-organize the check taking into the account that
>      swiotlb and virtio cases are mutually exclusive
>    - update according to the new naming scheme:
>      s/virtio/grant_dma
> ---
>  include/xen/arm/xen-ops.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/include/xen/arm/xen-ops.h b/include/xen/arm/xen-ops.h
> index 288deb1..26954e5 100644
> --- a/include/xen/arm/xen-ops.h
> +++ b/include/xen/arm/xen-ops.h
> @@ -2,12 +2,17 @@
>  #ifndef _ASM_ARM_XEN_OPS_H
>  #define _ASM_ARM_XEN_OPS_H
>  
> +#include <linux/virtio_config.h>
>  #include <xen/swiotlb-xen.h>
> +#include <xen/xen-ops.h>
>  
>  static inline void xen_setup_dma_ops(struct device *dev)
>  {
>  #ifdef CONFIG_XEN
> -	if (xen_swiotlb_detect())
> +	if (arch_has_restricted_virtio_memory_access() &&
> +			xen_is_grant_dma_device(dev))
> +		xen_grant_setup_dma_ops(dev);
> +	else if (xen_swiotlb_detect())
>  		dev->dma_ops = &xen_swiotlb_dma_ops;
>  #endif
>  }
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

