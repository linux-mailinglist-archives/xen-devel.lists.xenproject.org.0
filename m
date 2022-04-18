Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0EB505F79
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 23:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307641.522854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngZD9-0002Qy-Dn; Mon, 18 Apr 2022 21:47:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307641.522854; Mon, 18 Apr 2022 21:47:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngZD9-0002Oe-Af; Mon, 18 Apr 2022 21:47:07 +0000
Received: by outflank-mailman (input) for mailman id 307641;
 Mon, 18 Apr 2022 21:47:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hjWk=U4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ngZD7-0002OY-KR
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 21:47:05 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 160b7632-bf61-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 23:47:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CC07BB810BC;
 Mon, 18 Apr 2022 21:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE40C385A1;
 Mon, 18 Apr 2022 21:47:01 +0000 (UTC)
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
X-Inumbo-ID: 160b7632-bf61-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650318422;
	bh=7+Xds58jFRdKBOXoypL1eP8EJZkvYKIUOpOuQi6rZvg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YKBQhGGOeTNfMtz/n5lnSGdyRpDFLBv5ba2OUPC6PirkMk3Il5J8DfBD+OAj1KCx1
	 JW1AafAZ1vP/R4LeFluFJ4ROKf2qa1JsEaUjm/BIsLEgpe9mH0uKQNgShzC1I5vPz+
	 9sGiMyhVsPrPloIl8ED8yb2l8ZBDvOKI7hvxh9p3yVXerhvAKCWZb+L4kI3AZavl/W
	 TrarhS+JUv2wH2U2U5eIsJtducrj2K3z8LJJMiyxXiR/ToWgXyF5+P/XS3FuK6zlQO
	 c6WyKcNaZei3qbzssTHlHpQNrK0lY9cj96XkR0Krpzh3FHTdBzTaVH2ch6bJavcGNN
	 h214WSbFlwBfQ==
Date: Mon, 18 Apr 2022 14:47:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Henry Wang <Henry.Wang@arm.com>, Kaly Xin <Kaly.Xin@arm.com>, 
    Jiamei Xie <Jiamei.Xie@arm.com>, 
    =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] libxl/arm: Insert "xen,dev-domid" property to
 virtio-mmio device node
In-Reply-To: <1649964960-24864-1-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204181445300.915916@ubuntu-linux-20-04-desktop>
References: <1649964960-24864-1-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-785202687-1650318422=:915916"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-785202687-1650318422=:915916
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 14 Apr 2022, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This is needed for grant table based DMA ops layer (CONFIG_XEN_VIRTIO)
> at the guest side to retrieve the ID of Xen domain where the corresponding
> backend resides (it is used as an argument to the grant table APIs).
> 
> This is a part of restricted memory access under Xen feature.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

I think this looks good overall. Instead of mentioning details of the
Linux implementation, we should mention the device tree binding instead,
including a link to it. The device tree binding is the relevant spec in
this case.


> ---
> !!! This patch is based on non upstreamed yet “Virtio support for toolstack
> on Arm” series which is on review now:
> https://lore.kernel.org/xen-devel/1649442065-8332-1-git-send-email-olekstysh@gmail.com/
> 
> All details are at:
> https://lore.kernel.org/xen-devel/1649963973-22879-1-git-send-email-olekstysh@gmail.com/
> ---
>  tools/libs/light/libxl_arm.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 8132a47..d9b26fc 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -875,7 +875,8 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
>  
>  
>  static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
> -                                 uint64_t base, uint32_t irq)
> +                                 uint64_t base, uint32_t irq,
> +                                 uint32_t backend_domid)
>  {
>      int res;
>      gic_interrupt intr;
> @@ -900,6 +901,14 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
>      res = fdt_property(fdt, "dma-coherent", NULL, 0);
>      if (res) return res;
>  
> +    if (backend_domid != LIBXL_TOOLSTACK_DOMID) {
> +        uint32_t domid[1];
> +
> +        domid[0] = cpu_to_fdt32(backend_domid);
> +        res = fdt_property(fdt, "xen,dev-domid", domid, sizeof(domid));
> +        if (res) return res;
> +    }
> +
>      res = fdt_end_node(fdt);
>      if (res) return res;
>  
> @@ -1218,7 +1227,8 @@ next_resize:
>              libxl_device_disk *disk = &d_config->disks[i];
>  
>              if (disk->protocol == LIBXL_DISK_PROTOCOL_VIRTIO_MMIO)
> -                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
> +                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
> +                                           disk->backend_domid) );
>          }
>  
>          if (pfdt)
> -- 
> 2.7.4
> 
--8323329-785202687-1650318422=:915916--

