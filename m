Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193B21F96F0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 14:45:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkoTS-0007pi-DX; Mon, 15 Jun 2020 12:44:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+Ae=74=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jkoTQ-0007pd-64
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 12:44:24 +0000
X-Inumbo-ID: effd71e6-af05-11ea-bb8b-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id effd71e6-af05-11ea-bb8b-bc764e2007e4;
 Mon, 15 Jun 2020 12:44:22 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Makh8j15Bgehfs9r8zSNf1pupkRXeJKdgc5+e60sBNgUr83+Vgxfxb/z853DV87MKt3vkugXp5
 TcL/pOCn6CK/Lui4nfSBGXo2Ncy42lcVGUy1kWim5UyzphIP7rGd1biBjCNpyFpFIs1D8fc0Im
 OKvam3e8NoRC8Fs2GmkqpJFWYFI+lNRVmtEja5EFWma7/HfG67pdgI1pm4H7B7zEKl2spm1Pgt
 DLnMRcWUIVC/X/c5p4ZuUUJbWqRNJ4Rh/wS3/DgYLgNYIinRi16Z57lxVv8PS/hTLalQWoutO9
 /rA=
X-SBRS: 2.7
X-MesageID: 20827550
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20827550"
Date: Mon, 15 Jun 2020 14:44:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Grzegorz Uriasz <gorbak25@gmail.com>
Subject: Re: [PATCH 2/3] tools/libxl: Grant permission for mapping opregions
 to the target domain
Message-ID: <20200615124413.GE735@Air-de-Roger>
References: <cover.1592171394.git.gorbak25@gmail.com>
 <18bebc4af48b83d71b3247082434b958be84b841.1592171394.git.gorbak25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <18bebc4af48b83d71b3247082434b958be84b841.1592171394.git.gorbak25@gmail.com>
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

On Sun, Jun 14, 2020 at 10:12:02PM +0000, Grzegorz Uriasz wrote:
> IGD VGA devices require a special opregion MMIO region which functions as
> an extra BAR in the PCI configuration space. Right now qemu is assigning those
> permissions - this is failing inside a linux based stubdomain as the
> stubdomain is not privileged. This patch grants the permissions for
> opregions in libxl instead of qemu. Granting permissions in qemu may be removed
> when this patch get's merged - for now linux based stubdomains which use IGD's
> need to patch qemu and include this patch in xen for IGD passthrough to work.
> 
> Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>

Thanks for the patch!

> ---
>  tools/libxl/libxl_pci.c | 46 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
> index 436190f790..48b1d8073b 100644
> --- a/tools/libxl/libxl_pci.c
> +++ b/tools/libxl/libxl_pci.c
> @@ -2497,7 +2497,51 @@ static int libxl__grant_legacy_vga_permissions(libxl__gc *gc, const uint32_t dom
>  }
>  
>  static int libxl__grant_igd_opregion_permission(libxl__gc *gc, const uint32_t domid) {
> -    return 0;
> +    char* sysfs_path;
> +    FILE* f;
> +    uint32_t igd_host_opregion;
> +    int ret = 0;

No need to init ret.

> +    uint32_t stubdom_domid = libxl_get_stubdom_id(CTX, domid);
> +
> +    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/config", 0, 0, 2, 0);
> +    f = fopen(sysfs_path, "r");
> +    if (!f) {
> +        LOGED(ERROR, domid, "Unable to access IGD config space");
> +        return ERROR_FAIL;
> +    }
> +
> +    ret = fseek(f, 0xfc, SEEK_SET);
> +    if (ret < 0) {
> +        LOGED(ERROR, domid, "Unable to lseek in PCI config space");
> +        goto out;
> +    }
> +
> +    ret = fread((void*)&igd_host_opregion, 4, 1, f);
> +    if (ret < 0) {
> +        LOGED(ERROR, domid, "Unable to read opregion register");
> +        goto out;
> +    }
> +
> +    ret = xc_domain_iomem_permission(CTX->xch, stubdom_domid,
> +                                     (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT), 0x3, 1);
> +    if (ret < 0) {
> +        LOGED(ERROR, domid,
> +              "failed to give stubdom%d access to %"PRIx32" opregions for igd passthrough", stubdom_domid, igd_host_opregion);
> +        goto out;
> +    }

I think you only need to do this if there's a stubdomain? If
stubdom_domid is 0 then you don't need to do this.

Also, I'm not sure hardcoding the size is correct, AFAICT the size
should be fetched from the OpRegion Header size field?

The specification I'm reading for IGD OpRegion for Skylake processors
mentions the size of the OpRegion is 8KiB (so 2 pages).

> +
> +    ret = xc_domain_iomem_permission(CTX->xch, domid,
> +                                     (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT), 0x3, 1);
> +    if (ret < 0) {
> +        LOGED(ERROR, domid,
> +              "failed to give dom%d access to %"PRIx32" opregions for igd passthrough", domid, igd_host_opregion);
> +        goto out;
> +    }
> +
> +    out:

You should remove the leading spaces on the label.

> +    if(f)

No need for the 'if (f)', since all code paths leading here will have
f != NULL.

> +        fclose(f);
> +    return ret;

I think you want to return ERROR_FAIL if ret, ie: return ret ?
ERROR_FAIL : 0;

Thanks, Roger.

