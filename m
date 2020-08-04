Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 651A523C230
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 01:23:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k36HE-0001sB-81; Tue, 04 Aug 2020 23:23:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWh=BO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k36HC-0001rm-Gn
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 23:23:22 +0000
X-Inumbo-ID: eb4875ce-fcfe-48c7-96bf-150906aea421
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb4875ce-fcfe-48c7-96bf-150906aea421;
 Tue, 04 Aug 2020 23:23:22 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 283EB2073E;
 Tue,  4 Aug 2020 23:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596583401;
 bh=Ey9+1CdkZ+XZ6lcXk7hQ6Np+Ap3ZTgAwJFD9LKmfTY8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=rVBS4T8w8ATJdRgP7xazg4QONFEdi9ALNGbkmeGNGFnOKgkrGK4CIfr/+JJNiM+g0
 /GALs+GN7IclAoL75vGL4/UERPztygHx48vFaI7YLD4wTTkUxurAyv4U7zkfg1BGuU
 Tk2q72UCB8Fhrkl+TX0lDc3h7t/Co0U3Lb3JsBFc=
Date: Tue, 4 Aug 2020 16:23:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [RFC PATCH V1 11/12] libxl: Insert "dma-coherent" property into
 virtio-mmio device node
In-Reply-To: <1596478888-23030-12-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2008041559330.5748@sstabellini-ThinkPad-T480s>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-12-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 3 Aug 2020, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Without "dma-coherent" property present in virtio-mmio device node,
> guest assumes it is non-coherent and making non-cacheable accesses
> to the vring when the DMA API is used for vring operations.
> But virtio-mmio device which runs at the host size is making cacheable
> accesses to vring. This all may result in a loss of coherency between
> the guest and host.
> 
> With this patch we can avoid modifying guest at all, otherwise we
> need to force VirtIO framework to not use DMA API for vring operations.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This should also be folded in the first patch for libxl

> ---
>  tools/libxl/libxl_arm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tools/libxl/libxl_arm.c b/tools/libxl/libxl_arm.c
> index 469a8b0..a68fb14 100644
> --- a/tools/libxl/libxl_arm.c
> +++ b/tools/libxl/libxl_arm.c
> @@ -726,6 +726,9 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
>      res = fdt_property_interrupts(gc, fdt, &intr, 1);
>      if (res) return res;
>  
> +    res = fdt_property(fdt, "dma-coherent", NULL, 0);
> +    if (res) return res;
> +
>      res = fdt_end_node(fdt);
>      if (res) return res;
>  
> -- 
> 2.7.4
> 

