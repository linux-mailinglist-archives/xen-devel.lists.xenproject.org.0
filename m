Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FC8503040
	for <lists+xen-devel@lfdr.de>; Sat, 16 Apr 2022 00:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305915.521050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfU1i-0002LG-0s; Fri, 15 Apr 2022 22:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305915.521050; Fri, 15 Apr 2022 22:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfU1h-0002IF-Sf; Fri, 15 Apr 2022 22:02:49 +0000
Received: by outflank-mailman (input) for mailman id 305915;
 Fri, 15 Apr 2022 22:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nfU1g-0001ST-Cw
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 22:02:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8dfebc9-bd07-11ec-a405-831a346695d4;
 Sat, 16 Apr 2022 00:02:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2682CB82BAA;
 Fri, 15 Apr 2022 22:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B080C385A4;
 Fri, 15 Apr 2022 22:02:45 +0000 (UTC)
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
X-Inumbo-ID: c8dfebc9-bd07-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650060165;
	bh=jMIyyGQ4CRdsA1X7oxI8CTQb0IBKbJqeD84G5GJpvrs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DXvqR0Keim+tfwUUwYyM6574yaiWEcj28C/cHng/0XCSegk9hetkQruScA8hrYQlS
	 /ZD/C1AjvTcFvA+XXBN77pc/acwLax0/RDIpW6c218usILvr5ehxi1F/0eyj6WXzi0
	 O1cDrfH+NOQVSkSKclpyrjWv3CIlYFatU0R4G+J4pyaE20kPRekBJxB7JLzPqRIi6V
	 30Zgqtkgwwv4XNEXn71dvq+Z2MUUCB9bMJs4PyIAj1Q+y/GnNOBNaGU0Est8neT7EQ
	 qOK3sD4Gg9vLArJLSsNa+wTCI6qfW56EyOoPpLezZK1AlyLe43X1zlkbJFNu3ymWJS
	 /vTcXwOaDkD2w==
Date: Fri, 15 Apr 2022 15:02:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 6/6] arm/xen: Assign xen-virtio DMA ops for virtio
 devices in Xen guests
In-Reply-To: <1649963973-22879-7-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204151305050.915916@ubuntu-linux-20-04-desktop>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com> <1649963973-22879-7-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Apr 2022, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Call xen_virtio_setup_dma_ops() only for Xen-aware virtio devices
> in Xen guests if restricted access to the guest memory is enabled.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  include/xen/arm/xen-ops.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/xen/arm/xen-ops.h b/include/xen/arm/xen-ops.h
> index 621da05..28b2ad3 100644
> --- a/include/xen/arm/xen-ops.h
> +++ b/include/xen/arm/xen-ops.h
> @@ -2,12 +2,19 @@
>  #ifndef _ASM_ARM_XEN_OPS_H
>  #define _ASM_ARM_XEN_OPS_H
>  
> +#include <linux/virtio_config.h>
>  #include <xen/swiotlb-xen.h>
> +#include <xen/xen-ops.h>
>  
>  static inline void xen_setup_dma_ops(struct device *dev)
>  {
>  	if (xen_swiotlb_detect())
>  		dev->dma_ops = &xen_swiotlb_dma_ops;
> +
> +#ifdef CONFIG_XEN_VIRTIO
> +	if (arch_has_restricted_virtio_memory_access() && xen_is_virtio_device(dev))
> +		xen_virtio_setup_dma_ops(dev);
> +#endif

This makes sense overall. Considering that the swiotlb-xen case and the
virtio case are mutually exclusive, I would write it like this:

	if (arch_has_restricted_virtio_memory_access() && xen_is_virtio_device(dev))
		xen_virtio_setup_dma_ops(dev);
	else if (xen_swiotlb_detect())
		dev->dma_ops = &xen_swiotlb_dma_ops;

There is no need for #ifdef (also see other comments).

