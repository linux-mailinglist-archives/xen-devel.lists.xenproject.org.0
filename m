Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 811E344DAB3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 17:45:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224810.388321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlDCG-00072w-RY; Thu, 11 Nov 2021 16:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224810.388321; Thu, 11 Nov 2021 16:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlDCG-00070O-NC; Thu, 11 Nov 2021 16:45:08 +0000
Received: by outflank-mailman (input) for mailman id 224810;
 Thu, 11 Nov 2021 16:45:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6S8D=P6=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mlDCF-00070I-EK
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 16:45:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8039661-430e-11ec-a9d2-d9f7a1cc8784;
 Thu, 11 Nov 2021 17:45:05 +0100 (CET)
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
X-Inumbo-ID: b8039661-430e-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636649105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9RjWHzq3K0/KZ4YOHK5IGk+YV9zawLMH8YA/IiNUJqY=;
  b=dS+vEK+sgwWQvmkZz7gkGSGf4cNSVzG8IMFn+3vBPMzJkN1pZOa35ZaD
   fHB7Knd0oxNeLeEpAk0ntvGA8daCZcwz/7v+y34sgdkhoy93utmK03zEg
   j9yJnATWo58P2eRTHENqNP+bOAqJW/3fkKvkDeKHezEpx/S50h//vbfiC
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: sCQEec0xHy4wEGKKnrsvku3IIGwYtdV4V9Wh1nGzqrTurXc+HqTbgX+d6B75+1FJD6AhGGedWu
 yCDy1oVk+c8BGY0FTDVwIKXKUbr7J3aXFxY+XOWjLLs0pw7DOGQ4IQic6bJXBpnQ+GsSrY65Nc
 OONgfgG2Key4Z2r8RQfDX3+gS/wGefQwWojHsVhiqYH3EVdwK8CGTVSS1sZjemlj9HGF63ptC+
 2yRa+R5jQFnUPDUYH3VnbV8aIpRG9VlsFhhKYMRlIvZBB2vBVQY8Q+uwvXkyg7DzrkJjLRnyaY
 //VZdrXcv91vnkTKyLL5dcSo
X-SBRS: 5.1
X-MesageID: 57648061
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:5dofPaKNrzJIrCv1FE+Rm5MlxSXFcZb7ZxGr2PjKsXjdYENS1GcHy
 WMZX2uEMv6PZGuked92O4jnoUsCvsKGxoJgGlZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es6wrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Drvcg6
 +t076W+dll1IPzsmsYXfERxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gpv2JweRaiHD
 yYfQRBmUTj7bB1xBnU4AoohtuStr2vaYRQN/Tp5ooJoujOOnWSdyoPFMcXXUsyHQ91PmUSVr
 X6A+H72ajkEM9iYxSuA42ibjObFliPmW6ofDLS9sPVthTW7xGMJDwYNfUCmuvT/gUm7M/pAL
 2QE9yxoqrI9nGShQ8PhRRS+rDiBtwQFRttLO+Qg7UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq1+LGJ6y2zOjIcKEcSZCsFSxtD6N7myKkxkxbOQ9BLAKOzyNrvFlnY2
 CuWpSIzg7ESi88j1Kih+13DxTW2qfD0ohUdv1uNGDj/t0UgOdDjN9fABUXnAehoJre+H3q/h
 SI9lffAsP5fLZOvngPQabBYdF223MqtPDrZiF9pOpAu8TWx5nKuFbxtDCFCyFRBaZhdJ2KwC
 KPHkUYIvcIIYiP2BUNiS9vpU5xC8ET2KTjyuhk4hPJqa4M5SgKI9ToGiaW4jzG0yxhEfU3S1
 P6mnSeQ4ZQyVfsPINmeHb51PVoXKsYWnDK7qXfTlUTP7FZmTCTJIYrpyXPXBgzD0IuKoR/O7
 /FUPNaQxhNUXYXWO3eMr9NNfA9acCdkWvgaTvC7kMbac2KK/0l7W5fsLU4JIdQ5z8y5aM+Ul
 p1CZqOo4AWm3iCWQel7QntidKnuTf5CQYETZkQR0aKT8yF7O+6Htf5HH7NuJOVP3LEznJZcE
 qheE+3dU6snd9gy02lEBXULhNc5L0rDaMPnF3fNXQXTiLY8HVGUoYG9IVO0nMTMZwLu3fYDT
 3Sb/luzafI+q85KV646sdqjkAG8u2YzguV3UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3U/Z20F+ZeH1ZBGzWJ57iBKiSHrHGoxpVNUbjUcGmFBn/04qire
 c5c0+r4bK8chF9PvoclS+RrwKsy6sHBvbhfygg4TnzHY07yUuFrI2Wc3NkJvapIn+cLtQyzU
 0OJ299bJbTWZ5+1TA9PfFIoN73R2+sVlz/e6eUODH/7vCInrqCaVUhyPgWXjHAPJrVCL454k
 /wqv9Qb6lLjh0NyYMqGlC1d60+FMmcED/c8rpgfDYLm1lgrx1VFbcCOAyP6+sjSOdBFM01sK
 T6InqvSwb9bwxOaIXY0EHHM28tbhIgP508WnANTeQzRl4qXnOIz0T1Q7S8zH1ZcwRhw2u5uP
 nRmah9uLqKU8jY03MVOUghAwe2a6MF1LqAp92Y0qQ==
IronPort-HdrOrdr: A9a23:nHlxx68g9dSCsS+KYIBuk+DYI+orL9Y04lQ7vn2YSXRuHPBws/
 re+MjztCWE7Qr5N0tMpTntAsW9qDbnhPlICOoqTNWftWvd2FdARbsKheCJ/9SjIVycygc079
 YHT0EUMrzN5DZB4vrH3A==
X-IronPort-AV: E=Sophos;i="5.87,226,1631592000"; 
   d="scan'208";a="57648061"
Date: Thu, 11 Nov 2021 16:44:59 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, <bertrand.marquis@arm.com>, <volodymyr_babchuk@epam.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [XEN][RFC PATCH v2 11/12] tools/libs/light: Implement new libxl
 functions for device tree overlay ops
Message-ID: <YY1Ii0gSMmCCaiy2@perard>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
 <1636441347-133850-12-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1636441347-133850-12-git-send-email-fnu.vikram@xilinx.com>

On Mon, Nov 08, 2021 at 11:02:26PM -0800, Vikram Garhwal wrote:
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>  tools/include/libxl.h            |  5 ++++
>  tools/libs/light/Makefile        |  3 ++
>  tools/libs/light/libxl_overlay.c | 65 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 73 insertions(+)
>  create mode 100644 tools/libs/light/libxl_overlay.c
> 
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 2e8679d..3dcb3e7 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -2406,6 +2406,11 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
>                                          int *num);
>  void libxl_device_pci_list_free(libxl_device_pci* list, int num);
>  
> +#if defined (CONFIG_OVERLAY_DTB)
> +int libxl_dt_overlay(libxl_ctx *ctx, void *overlay,
> +                     int overlay_size, uint8_t op);
> +#endif
> +

This won't work. "libxl.h" is a public header to be installed, so
CONFIG_OVERLAY_DTB won't mean anything to other application making use
of libxl.

Instead, can you always provide libxl_dt_overlay() but which would
return ENOSYS when libxl is built without CONFIG_OVERLAY_DTB?


>  /*
>   * Turns the current process into a backend device service daemon
>   * for a driver domain.
> diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
> index 194bc5f..0fffa93 100644
> --- a/tools/libs/light/Makefile
> +++ b/tools/libs/light/Makefile
> @@ -117,6 +117,9 @@ SRCS-y += libxl_genid.c
>  SRCS-y += _libxl_types.c
>  SRCS-y += libxl_flask.c
>  SRCS-y += _libxl_types_internal.c
> +ifeq ($(CONFIG_OVERLAY_DTB),y)
> +SRCS-y += libxl_overlay.o

FYI, the "-y" is so that you can do
    SRCS-$(CONFIG_OVERLAY_DTB) += libxl_overlay.o
;-)

> diff --git a/tools/libs/light/libxl_overlay.c b/tools/libs/light/libxl_overlay.c
> new file mode 100644
> index 0000000..d965aee
> --- /dev/null
> +++ b/tools/libs/light/libxl_overlay.c
> @@ -0,0 +1,65 @@
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

Does "fdt" can have a better type than a plain pointer?

There is a "size" provided, is it the size of the blob pointed by "fdt"?
If so, can the size been the first thing to be check? Surely there is a
minimum size for *fdt.

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
> +                     uint8_t op)

What is "op"? What the function is supposed to do beside calling libxc?

> +{
> +    int rc = 0;
> +    GC_INIT(ctx);

The function should have "GC_FREE;" before returning.

> +
> +    if (check_overlay_fdt(gc, overlay_dt, overlay_dt_size)) {
> +        LOG(ERROR, "Overlay DTB check failed\n");
> +        return ERROR_FAIL;
> +    } else
> +        LOG(DEBUG, "Overlay DTB check passed\n");

FYI, there is no need for "\n" when using LOG().

> +
> +    /* We don't need to do  xc_interface_open here. */
> +    rc = xc_dt_overlay(ctx->xch, overlay_dt, overlay_dt_size, op);

"rc" is reserved for libxl error code, xc_* return value should be
stored in "r" instead.

> +
> +    if (rc)
> +        LOG(ERROR, "%s: Adding/Removing overlay dtb failed.\n", __func__);
> +
> +    return rc;
> +}
> +

Thanks,

-- 
Anthony PERARD

