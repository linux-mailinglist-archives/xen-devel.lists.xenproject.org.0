Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51701F951F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 13:18:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkn7r-000073-En; Mon, 15 Jun 2020 11:18:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+Ae=74=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jkn7q-00006r-1t
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 11:18:02 +0000
X-Inumbo-ID: df640ee6-aef9-11ea-b7bb-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df640ee6-aef9-11ea-b7bb-bc764e2007e4;
 Mon, 15 Jun 2020 11:18:01 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ebrzSCwXQMMPYhKsmDkX2cBqaAc8BOt+LK8mHaBgYLg1+kE74OArTI1YVd1Ev8cYk00DH5stRZ
 yoY/ALUQFMjRsmGFKNt26LIP0aXRVOq4J3vL/0La/fWy9tKyafS936+MLuB21H16MT80KdTAlU
 gSomtmfLABc4L0oIh1z9DvIjLKdHuvX9fbmZeNeUKcbeECf9AiGdjmUwyUC+gXY7o4EsP0NAiD
 dVFuG6KBdBX/FpQqKdf+Z4SDHOg8GUtCP/pv1IiK7mlTQNSdGQzm7/l4DgJGP4e/wNvrMzuE7S
 Dyg=
X-SBRS: 2.7
X-MesageID: 20391563
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20391563"
Date: Mon, 15 Jun 2020 13:17:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Grzegorz Uriasz <gorbak25@gmail.com>
Subject: Re: [PATCH 1/3] tools/libxl: Grant VGA IO port permission for
 stubdom/target domain
Message-ID: <20200615111749.GC735@Air-de-Roger>
References: <cover.1592171394.git.gorbak25@gmail.com>
 <87d74a21bde95cfc7c53fad56bf8f0e47724953e.1592171394.git.gorbak25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <87d74a21bde95cfc7c53fad56bf8f0e47724953e.1592171394.git.gorbak25@gmail.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Ian Jackson <ian.jackson@eu.citrix.com>, marmarek@invisiblethingslab.com,
 Anthony PERARD <anthony.perard@citrix.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org, contact@puzio.waw.pl
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Jun 14, 2020 at 10:12:01PM +0000, Grzegorz Uriasz wrote:
> When qemu is running inside a linux based stubdomain, qemu does not
> have the necessary permissions to map the ioports to the target domain.
> Currently, libxl is granting permissions only for the VGA RAM memory region
> and not passing the required ioports. This patch grants the required
> permission for the necessary vga io ports.
> 
> Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
> ---
>  tools/libxl/libxl_pci.c | 99 ++++++++++++++++++++++++++++++-----------
>  1 file changed, 73 insertions(+), 26 deletions(-)
> 
> diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
> index 957ff5c8e9..436190f790 100644
> --- a/tools/libxl/libxl_pci.c
> +++ b/tools/libxl/libxl_pci.c
> @@ -2441,17 +2441,75 @@ void libxl__device_pci_destroy_all(libxl__egc *egc, uint32_t domid,
>      }
>  }
>  
> +static int libxl__grant_legacy_vga_permissions(libxl__gc *gc, const uint32_t domid) {
> +    int ret, i;

Nit: i can be unsigned int since it's only used as a loop counter.

> +    uint64_t vga_iomem_start = 0xa0000 >> XC_PAGE_SHIFT;
> +    uint64_t vga_iomem_npages = 0x20;

unsigned int is fine to store the size.

> +    uint32_t stubdom_domid = libxl_get_stubdom_id(CTX, domid);
> +    uint64_t vga_ioport_start[] = {0x3B0, 0x3C0};
> +    uint64_t vga_ioport_size[] = {0xC, 0x20};

For IO ports ranges/sizes you can safely use unsigned ints, those only
go up to 65535, and also constify the array since it's read-only.

Can you expand a bit on where those ranges are taken from?

Why not pass the whole 0x03B0-0x03DF range?

> +
> +    /* VGA RAM */
> +    ret = xc_domain_iomem_permission(CTX->xch, stubdom_domid,
> +                                     vga_iomem_start, vga_iomem_npages, 1);
> +    if (ret < 0) {
> +        LOGED(ERROR, domid,
> +              "failed to give stubdom%d access to iomem range "
> +              "%"PRIx64"-%"PRIx64" for VGA passthru",
> +              stubdom_domid,
> +              vga_iomem_start, (vga_iomem_start + (vga_iomem_npages << XC_PAGE_SHIFT) - 1));
> +        return ret;

I think it would be better to return a libxl error code here:
ERROR_FAIL. You already log the error code, and libxl functions have
their own set of error codes.

> +    }
> +    ret = xc_domain_iomem_permission(CTX->xch, domid,
> +                                     vga_iomem_start, vga_iomem_npages, 1);
> +    if (ret < 0) {
> +        LOGED(ERROR, domid,
> +              "failed to give dom%d access to iomem range "
> +              "%"PRIx64"-%"PRIx64" for VGA passthru",
> +              domid, vga_iomem_start, (vga_iomem_start + (vga_iomem_npages << XC_PAGE_SHIFT) - 1));
> +        return ret;
> +    }
> +
> +    /* VGA IOPORTS */
> +    for (i = 0 ; i < 2 ; i++) {

Please use ARRAY_SIZE(vga_ioport_start) here. And I would also assert
that both vga_ioport_start and vga_ioport_size arrays have the same
sizes before the loop.

> +        ret = xc_domain_ioport_permission(CTX->xch, stubdom_domid,
> +                                          vga_ioport_start[i], vga_ioport_size[i], 1);
> +        if (ret < 0) {
> +            LOGED(ERROR, domid,
> +                  "failed to give stubdom%d access to ioport range "
> +                  "%"PRIx64"-%"PRIx64" for VGA passthru",
> +                  stubdom_domid,
> +                  vga_ioport_start[i], (vga_ioport_start[i] + vga_ioport_size[i] - 1));
> +            return ret;
> +        }
> +        ret = xc_domain_ioport_permission(CTX->xch, domid,
> +                                          vga_ioport_start[i], vga_ioport_size[i], 1);
> +        if (ret < 0) {
> +            LOGED(ERROR, domid,
> +                  "failed to give dom%d access to ioport range "
> +                  "%"PRIx64"-%"PRIx64" for VGA passthru",
> +                  domid, vga_ioport_start[i], (vga_ioport_start[i] + vga_ioport_size[i] - 1));
> +            return ret;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static int libxl__grant_igd_opregion_permission(libxl__gc *gc, const uint32_t domid) {
> +    return 0;
> +}
> +
>  int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
>                                        libxl_domain_config *const d_config)
>  {
> -    int i, ret;
> +    int i, ret = 0;
> +    bool vga_found = false, igd_found = false;
>  
>      if (!libxl_defbool_val(d_config->b_info.u.hvm.gfx_passthru))
>          return 0;
>  
> -    for (i = 0 ; i < d_config->num_pcidevs ; i++) {
> -        uint64_t vga_iomem_start = 0xa0000 >> XC_PAGE_SHIFT;
> -        uint32_t stubdom_domid;
> +    for (i = 0 ; i < d_config->num_pcidevs && !igd_found ; i++) {
>          libxl_device_pci *pcidev = &d_config->pcidevs[i];
>          unsigned long pci_device_class;
>  
> @@ -2460,30 +2518,19 @@ int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
>          if (pci_device_class != 0x030000) /* VGA class */
>              continue;
>  
> -        stubdom_domid = libxl_get_stubdom_id(CTX, domid);
> -        ret = xc_domain_iomem_permission(CTX->xch, stubdom_domid,
> -                                         vga_iomem_start, 0x20, 1);
> -        if (ret < 0) {
> -            LOGED(ERROR, domid,
> -                  "failed to give stubdom%d access to iomem range "
> -                  "%"PRIx64"-%"PRIx64" for VGA passthru",
> -                  stubdom_domid,
> -                  vga_iomem_start, (vga_iomem_start + 0x20 - 1));
> -            return ret;
> -        }
> -        ret = xc_domain_iomem_permission(CTX->xch, domid,
> -                                         vga_iomem_start, 0x20, 1);
> -        if (ret < 0) {
> -            LOGED(ERROR, domid,
> -                  "failed to give dom%d access to iomem range "
> -                  "%"PRIx64"-%"PRIx64" for VGA passthru",
> -                  domid, vga_iomem_start, (vga_iomem_start + 0x20 - 1));
> -            return ret;
> -        }
> -        break;
> +        vga_found = true;
> +        if (pcidev->bus == 0 && pcidev->dev == 2 && pcidev->func == 0)
> +            igd_found = true;

Could you check that the vendor is Intel also using
sysfs_dev_get_vendor?

Or else this could trigger on AMD boxes if they happen to have a VGA
PCI device at 00:2.0.

Thanks, Roger.

