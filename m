Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DE54DCCD9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 18:46:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291710.495326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUuCB-0005X0-Ms; Thu, 17 Mar 2022 17:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291710.495326; Thu, 17 Mar 2022 17:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUuCB-0005TV-Jr; Thu, 17 Mar 2022 17:45:55 +0000
Received: by outflank-mailman (input) for mailman id 291710;
 Thu, 17 Mar 2022 17:45:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H+7p=T4=citrix.com=prvs=06815c04c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nUuC9-0005TP-T4
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 17:45:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15657e67-a61a-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 18:45:51 +0100 (CET)
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
X-Inumbo-ID: 15657e67-a61a-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647539151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qv5intto8o+LEBAiJPvAtnHNzbOi/voXf02/V/EjfXA=;
  b=ICegvA5ObE++/6FQICbZixreeuFIqMzOF5kstfO5lqxL8JUK2umnfp5S
   f7aj03jVCaJEw++m1DkE3LGStSXpUqAiOyin0OPg4oltLcbrFD3QuHZ1s
   8qM4yVkD97IK0pzRfgmNHfyHzj7tSOpLIJDn1TdtNAxs0P7OzyoKhNfZb
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68900319
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BeUBXqK7BLn/meLiFE+RIJUlxSXFcZb7ZxGr2PjKsXjdYENShjADz
 mZMW27QbKqOZmT8Kopyadnl800D75bQz9I2QAVlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2dc32YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PBjqpXzRD0pBO73k743fjx/Ch9UZ7ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ6aPP
 5JCMGsHgBLoTRlCOFU7WJ0FmtjvvGPaSgcBiWLMnP9ii4TU5FMoi+W8WDbPQfSUQsFSkledt
 3jx9W3zCREHN/SS0TOAtHmrg4fnly7hRJgbErH+8/dwmUCS3UQaEhhQXly+ydG7hVS5QMl3M
 FEP92wlqq1a3FOvZsnwWVu/unHslg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC2
 FmU2c3oBiZmtZWFSHac8KfSpjS3UQAXMGsDaCksXQYDpd75r+kblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN0uYdUjjvvhuwqd2nT1+8aPHlVdChjrsnyNyy1mbc2oXYySqmPQt9xtCaGAcHPbo
 y1R8ySB19wmAZaInS2LZewCGrC1+vqIWAHhbU5T84oJrGr0pSP6FWxEyHQnfRoybJ5YEdP8S
 BWL0T698qO/K5dDgUVfR4uqQ/onwqH7fTgOfqCFN4EeCnSdmeLuwc2PWaJy9z21+KTPuftmU
 Xt+TSpKJSxGYUiA5GDqL9rxKZdxmkgDKZr7HPgXNSiP37uEf2KyQrwYKlaIZe1RxPra/FqJr
 okGbZXSlEg3vAjCjs//q9J7wbcidyRTOHwLg5YPKr7rzvRORQnN9MM9MZt+Itc4zsy5Z8/D/
 22nW18w9bYMrSavFOl+UVg6MOmHdc8m9RoTZHVwVX71iylLSdv+t883KspoFYTLAcQ+lJaYu
 dFeIJ7eahmOIxyakwkggW7V99UzKk702VrQY0JIolEXJvZdeuAAwfe8FiOHycXEJnDn3Sfii
 9VMDj/mfKc=
IronPort-HdrOrdr: A9a23:homRiqrX7PmIiHpGEhyZL6YaV5opeYIsimQD101hICG8cqSj9v
 xGuM5rsiMc6QxhPE3I9urtBEDtexzhHNtOkO8s1NSZLWzbUQmTXeJfBOLZqlWKcUDDH6xmpM
 VdmsBFeaTN5DNB7foSjjPXL+od
X-IronPort-AV: E=Sophos;i="5.90,188,1643691600"; 
   d="scan'208";a="68900319"
Date: Thu, 17 Mar 2022 17:45:34 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, <bertrand.marquis@arm.com>, <volodymyr_babchuk@epam.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN][RFC PATCH v3 13/14] tools/libs/light: Implement new libxl
 functions for device tree overlay ops
Message-ID: <YjNzvrQDX4uu7E3b@perard.uk.xensource.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-14-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220308194704.14061-14-fnu.vikram@xilinx.com>

On Tue, Mar 08, 2022 at 11:47:03AM -0800, Vikram Garhwal wrote:
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>  tools/include/libxl.h            |  3 ++
>  tools/libs/light/Makefile        |  1 +
>  tools/libs/light/libxl_overlay.c | 67 ++++++++++++++++++++++++++++++++
>  3 files changed, 71 insertions(+)
>  create mode 100644 tools/libs/light/libxl_overlay.c
> 
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 51a9b6cfac..b31e17c2ce 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -2419,6 +2419,9 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
>                                          int *num);
>  void libxl_device_pci_list_free(libxl_device_pci* list, int num);
>  
> +int libxl_dt_overlay(libxl_ctx *ctx, void *overlay,
> +                     int overlay_size, uint8_t overlay_op);
> +

As you are making changes to libxl's API, you are going to need to add a
"#define LIBXL_HAVE_*" in "include/libxl.h" about the availability of
the new function.

>  /*
>   * Turns the current process into a backend device service daemon
>   * for a driver domain.
> diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
> index 453bea0067..405115c13c 100644
> --- a/tools/libs/light/Makefile
> +++ b/tools/libs/light/Makefile
> @@ -116,6 +116,7 @@ SRCS-y += libxl_genid.c
>  SRCS-y += _libxl_types.c
>  SRCS-y += libxl_flask.c
>  SRCS-y += _libxl_types_internal.c
> +SRCS-y += libxl_overlay.o

Building this new file unconditionally is an issue at the moment.
"./configure" doesn't check if libfdt is on the system unless we happen
to build for Arm. And libfdt is mandatory when building for Arm.

Could you build this new source file on Arm only? With a comment why.
    "SRCS-$(CONFIG_ARM) +="

Alternatively, you could try to rework configure to always check for
libfdt, but I doubt that device tree overlay are going to be useful on
x86 at the moment.


Then, libxl_dt_overlay() will need a stub that just return an error when
building on system that don't have libfdt.

>  
>  ifeq ($(CONFIG_LIBNL),y)
>  CFLAGS_LIBXL += $(LIBNL3_CFLAGS)
> diff --git a/tools/libs/light/libxl_overlay.c b/tools/libs/light/libxl_overlay.c
> new file mode 100644
> index 0000000000..e370e8cac8
> --- /dev/null
> +++ b/tools/libs/light/libxl_overlay.c

Could you rename this new file "libxl_dt_overlay.c"? There could be
other kind of "overlay".

> @@ -0,0 +1,67 @@
> +/*
> + * Copyright (C) 2021 Xilinx Inc.
> + * Author Vikram Garhwal <fnu.vikram@xilinx.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU Lesser General Public License as published
> + * by the Free Software Foundation; version 2.1 only. with the special
> + * exception on linking described in file LICENSE.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU Lesser General Public License for more details.
> + */
> +
> +#include "libxl_osdeps.h" /* must come before any other headers */
> +#include "libxl_internal.h"
> +#include <libfdt.h>
> +#include <xenguest.h>
> +#include <xenctrl.h>
> +
> +static int check_overlay_fdt(libxl__gc *gc, void *fdt, size_t size)
> +{
> +    int r;
> +
> +    if (fdt_magic(fdt) != FDT_MAGIC) {
> +        LOG(ERROR, "Overlay FDT is not a valid Flat Device Tree");
> +        return ERROR_FAIL;
> +    }
> +
> +    r = fdt_check_header(fdt);
> +    if (r) {
> +        LOG(ERROR, "Failed to check the overlay FDT (%d)", r);
> +        return ERROR_FAIL;
> +    }
> +
> +    if (fdt_totalsize(fdt) > size) {
> +        LOG(ERROR, "Overlay FDT totalsize is too big");
> +        return ERROR_FAIL;
> +    }
> +
> +    return 0;
> +}
> +
> +int libxl_dt_overlay(libxl_ctx *ctx, void *overlay_dt, int overlay_dt_size,

I wonder whether the type of "overlay_dt_size" should be something else.
check_overlay_fdt() takes a "size_t", but the hypercall takes
"uint32_t".

> +                     uint8_t overlay_op)
> +{
> +    int rc = 0;

By CODING_STYLE, "rc" shouldn't be set when declared.

> +    GC_INIT(ctx);
> +
> +    if (check_overlay_fdt(gc, overlay_dt, overlay_dt_size)) {
> +        LOG(ERROR, "Overlay DTB check failed\n");

No need for \n, it's already added by LOG().

> +        GC_FREE;
> +        return ERROR_FAIL;

Instead of writing GC_FREE more than once, could you set "rc" then "goto
out;"?

> +    } else
> +        LOG(DEBUG, "Overlay DTB check passed\n");

This needs to be in a {} block because the true side of the "if" uses
braces.

> +
> +    /* We don't need to do  xc_interface_open here. */

That comment isn't very useful, as it is a fact of using "ctx".

> +    rc = xc_dt_overlay(ctx->xch, overlay_dt, overlay_dt_size, overlay_op);

Instead of "rc", could you store the result of xc_dt_overlay() in "r"?
"rc" is reserved for libxl error code. Also, the return value of
libxl_dt_overlay() can't be the return value of xc_dt_overlay().
There's some better explanation in the CODING_STYLE file, if needed.

> +    if (rc)
> +        LOG(ERROR, "%s: Adding/Removing overlay dtb failed.\n", __func__);
> +
> +    GC_FREE;
> +    return rc;
> +}

Thanks,

-- 
Anthony PERARD

