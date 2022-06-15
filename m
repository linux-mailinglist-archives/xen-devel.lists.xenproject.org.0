Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0289D54CB3A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 16:24:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350152.576398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1TwV-00057A-Pt; Wed, 15 Jun 2022 14:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350152.576398; Wed, 15 Jun 2022 14:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1TwV-000547-Lx; Wed, 15 Jun 2022 14:24:23 +0000
Received: by outflank-mailman (input) for mailman id 350152;
 Wed, 15 Jun 2022 14:24:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9BPj=WW=citrix.com=prvs=158bd2e8d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o1TwT-000541-OO
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 14:24:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d737b8c5-ecb6-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 16:24:20 +0200 (CEST)
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
X-Inumbo-ID: d737b8c5-ecb6-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655303059;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uyGzlJigE87uMdbioX2cHoy8gZ64p4MGoSKppMcIGjY=;
  b=SwXkCQhcMLirwp+m8mXRGCKz1dwQWHhOwZwUm434CWtPu/3PPZlJdKhd
   mMXQLJuAg7VFMk5576VVPB+GWRJ+xgY4BpgZkG3rw+1P1fYaHEg7gRUO8
   lCoQvPTpyQ6E7zmqApxtVMvMfHJdn1slkJIwDtRDsUuSHSzcIagtFXUiL
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 76225591
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JdRMu6NAKQGub/nvrR1al8FynXyQoLVcMsEvi/4bfWQNrUp01j1Vn
 GBND2nTM/qIYjf9c4hzbdvip05Qu5+GydU1HQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZn29Mw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zx
 9937o6vFUAVeZaQtadDTxdBTgxQIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gRQ6yEO
 pdIMFKDajz6TSFJFwYvDag5kaSKnUevcy1ntQ2s8P9fD2/7k1UqjemF3MDuUseRWcxfk0Kcp
 2TH12f0GBcXMJqY0zXt2nCjnOjUhgvgRZkfUra/85ZCgkCXx2EVIA0bUx28u/bRokSzQc5FI
 koYvC8nt7Ev9VeDR8P4GRa/pRasgBkYXNZBFvwg3yuEwKHU/gWxC3ANS3hKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqYisJThAZ8sLjiI42hxPLCN1kFcadidn4Gir5x
 TyQmzQvnLUYjcMN1KKT8EjOhnSnoZ2hZhQy/Q/NWWWm6Ct2YYekY8qj7l2zxelEBJaUSB+Gp
 ndspiSFxLlQV9fXznXLGbhTWuHyjxqYDNHCqVFlJcIz6GjqxzmYIa0Tvi1wPRpEHNlRLFcFf
 3TvVRNtCI57ZSX3MPUuPNjvV6zG3oC7S427C6m8gs5mJ8EoKVTZpHwGiVu4hTiFraQ6rU0o1
 X53m+6IBG1SN6loxSHeqww1ge5ynXBWKY8+qPnGI/WbPVm2Pif9pU8tagfmUwzAxPrsTP/p2
 9heLdCW7B5UTffzZCLamaZKcw1XdyNiW8+s+5cGHgJmHuaBMDh5Y8I9PJt7I9A190irvrygE
 o6Btr9wlwOk2CyvxfSiYXF/crL/NatCQYYAFXV0Zz6AgiF7Ca72tft3X8ZmJtEPqb08pcOYu
 tFYIq1s9NwUEmSZk9ncBLGgxLFfmOOD3l/XZnP7PmFuIPaNhWXho7fZQ+cmzwFWZgLfiCf0i
 +fIOt/zKXbbezlfMQ==
IronPort-HdrOrdr: A9a23:EAL9yqnrnflVGYH2++qzFIhnprjpDfIs3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5OUtQ/OxoV5PsfZqxz/JICMwqTNCftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyXMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.91,302,1647316800"; 
   d="scan'208";a="76225591"
Date: Wed, 15 Jun 2022 15:23:54 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Julien Grall" <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH V10 1/3] libxl: Add support for Virtio disk configuration
Message-ID: <YqnrerEAFXJUCRL1@perard.uk.xensource.com>
References: <1655143522-14356-1-git-send-email-olekstysh@gmail.com>
 <1655143522-14356-2-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1655143522-14356-2-git-send-email-olekstysh@gmail.com>

On Mon, Jun 13, 2022 at 09:05:20PM +0300, Oleksandr Tyshchenko wrote:
> diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
> index a5ca778..673b0d6 100644
> --- a/tools/libs/light/libxl_disk.c
> +++ b/tools/libs/light/libxl_disk.c
> @@ -575,6 +660,41 @@ cleanup:
>      return rc;
>  }
>  
> +static int libxl__device_disk_get_path(libxl__gc *gc, uint32_t domid,
> +                                       char **path)
> +{
> +    const char *xen_dir, *virtio_dir;
> +    char *xen_path, *virtio_path;
> +    int rc;
> +
> +    /* default path */
> +    xen_path = GCSPRINTF("%s/device/%s",
> +                         libxl__xs_libxl_path(gc, domid),
> +                         libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VBD));
> +
> +    rc = libxl__xs_read_checked(gc, XBT_NULL, xen_path, &xen_dir);
> +    if (rc)
> +        return rc;
> +
> +    virtio_path = GCSPRINTF("%s/device/%s",
> +                            libxl__xs_libxl_path(gc, domid),
> +                            libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VIRTIO_DISK));
> +
> +    rc = libxl__xs_read_checked(gc, XBT_NULL, virtio_path, &virtio_dir);
> +    if (rc)
> +        return rc;
> +
> +    if (xen_dir && virtio_dir) {
> +        LOGD(ERROR, domid, "Invalid configuration, both xen and virtio paths are present");
> +        return ERROR_INVAL;
> +    } else if (virtio_dir)
> +        *path = virtio_path;
> +    else
> +        *path = xen_path;

Small coding style issue, could you use blocks {} on all part of the
if...else, since you are using them on one of the block? This is
described in tools/libs/light/CODING_STYLE (5. Block structure).

> diff --git a/tools/xl/xl_block.c b/tools/xl/xl_block.c
> index 70eed43..f2b0ff5 100644
> --- a/tools/xl/xl_block.c
> +++ b/tools/xl/xl_block.c
> @@ -50,6 +50,11 @@ int main_blockattach(int argc, char **argv)
>          return 0;
>      }
>  
> +    if (disk.specification != LIBXL_DISK_SPECIFICATION_XEN) {
> +        fprintf(stderr, "block-attach is only supported for specification xen\n");

This check prevents a previously working `block-attach` command line
from working.

    # xl -Tvvv block-attach 0 /dev/vg/guest_disk,raw,hda
    block-attach is only supported for specification xen

At least, that works by adding ",specification=xen", but it should work
without it as "xen" is the default (from the man page).

Maybe the check is done too soon, or maybe a better place to do it would
be in libxl.

libxl__device_disk_setdefault() is called much later, while executing
libxl_device_disk_add(), so `xl` can't use the default been done there
to "disk.specification".

`xl block-attach` calls libxl_device_disk_add() which I think is only
called for hotplug of disk. If I recall correctly, libxl__add_disks() is
called instead at guest creation. So maybe it is possible to do
something in libxl_device_disk_add(), but that a function defined by a
macro, and the macro is using the same libxl__device_disk_add() that
libxl_device_disk_add(). On the other hand, there is a "hotplug"
parameter to libxl__device_disk_setdefault(), maybe that could be use?


Cheers,

-- 
Anthony PERARD

