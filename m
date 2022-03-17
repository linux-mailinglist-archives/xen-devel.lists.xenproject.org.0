Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691F04DCA54
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 16:48:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291655.495169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUsLa-0003Ew-M8; Thu, 17 Mar 2022 15:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291655.495169; Thu, 17 Mar 2022 15:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUsLa-0003Bo-JA; Thu, 17 Mar 2022 15:47:30 +0000
Received: by outflank-mailman (input) for mailman id 291655;
 Thu, 17 Mar 2022 15:47:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H+7p=T4=citrix.com=prvs=06815c04c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nUsLZ-0003Bi-3y
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 15:47:29 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a9ead32-a609-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 16:47:27 +0100 (CET)
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
X-Inumbo-ID: 8a9ead32-a609-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647532047;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YHxqwB0TNJt0ULuF4PH2AsuTX0xKPNKDZtzyIldLM/w=;
  b=SpGyK5EMzhPTlOEBvi5zoaHCxAt76Q+qLqn9ozxBb7viBwzo/5Mzj2Uh
   ysgoPmcHwU6b6tCa01B66aHqCKizZ8879xal5CrIe+/ETORvfHG9foAgs
   KGLeo1xYBou/GgM8HB/uuG9v32LqunmxClJwltSetnUwlUe2+aPXRbJXJ
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68887181
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zFdO0KApYoE6zxVW/9/jw5YqxClBgxIJ4kV8jS/XYbTApDtw1GRVz
 DQbXmCEaKmPNzb1L9F/Odvj9BkD7ZLTx941QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vg3dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPghk
 M99l4TtcDwqM/aLhfQkfTcfOTxxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4eTaaBP
 ppAAdZpRBD9bD0SG1BKNLw7kqCNmD7lViZDsHvA8MLb5ECMlVcsgdABKuH9ZNuOQslEm1eCk
 WjP9W/5HxIyOcSWzHyO9XfEruXChz/hUYQeUrix7Od3gUa7z3YWThYRUDOTo/ajjVWlc8lCM
 EFS8S0rxYAt8GS7Q9+7WAe3yFaUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebTIsy
 xmXntDzDDlHoLyRSHSNsLyTqFuaOzURLGIETT8JS00C+daLiJookhvFQ9JnEai0pt74Azf9x
 3aNtidWulkIpZdVjePhpwmB2m/y4MiSJuIo2unJdjL99DNbfNOcXI+lsh/G/c9uAsGzU1bU6
 RDohPOixOwJCJiMkgmET+MMAKyl6p65DdHMvbJ8N8J/rmrwohZPaagVuWgjfxkxbq7obBezO
 CfuVRVtCIi/1ZdARYt+eMqPBssj1sAM/vy1B6mPPrKijnWcHTJrHR2Ch2bNhwgBc2B2yMnT3
 Kt3l+72UR727ow9kFKLqx81i+ND+8zH7Tq7qWrH5xqmy6GCQ3WeVK0INlCDBshgsv/b/FiKq
 owBb5TXo/m6bAEYSnOLmWL0BQpWRUXX+Lis85AHHgJ9ClcO9J4d5w/5nup6Jt0Nc1V9nebU5
 HCtMnK0O3Kk7UAr3T6iMyg5AJu2BM4XhStiYUQEYAb5s1B+MN3HxPpOKPMKkUwPqbULIQhcF
 KJeJa1tw51nF1z6xtjqRcKk/dI4K0jz217m0ujMSGFXQqOMjjfhorfMFjYDPgFUZsZrnaPSe
 4Gd6z4=
IronPort-HdrOrdr: A9a23:NVnzqqgJP0ZFap4fr2iyU7mKqXBQXtoji2hC6mlwRA09TySZ//
 rBoB0+726RtN9xYgBEpTnuAsS9qB/nmaKdpLNhWotKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFebvN5DNB7PoSjjPWL+od
X-IronPort-AV: E=Sophos;i="5.90,188,1643691600"; 
   d="scan'208";a="68887181"
Date: Thu, 17 Mar 2022 15:47:21 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, <bertrand.marquis@arm.com>, <volodymyr_babchuk@epam.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN][RFC PATCH v3 12/14] tools/libs/ctrl: Implement new xc
 interfaces for dt overlay
Message-ID: <YjNYCeaULixDb8WZ@perard.uk.xensource.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-13-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220308194704.14061-13-fnu.vikram@xilinx.com>

Hi Vikram,

On Tue, Mar 08, 2022 at 11:47:02AM -0800, Vikram Garhwal wrote:
> diff --git a/tools/libs/ctrl/xc_overlay.c b/tools/libs/ctrl/xc_overlay.c
> new file mode 100644
> index 0000000000..8fe780d75a
> --- /dev/null
> +++ b/tools/libs/ctrl/xc_overlay.c

Could rename this new file? I don't think using "overlay" alone is going
to be helpful to figure out what it is about. Renaming it
"xc_dt_overlay.c" would already be better.

> @@ -0,0 +1,51 @@
> +/*
> + *
> + * Overlay control functions.

Maybe "Device Tree overlay functions" would be better. I'm not sure that
"control" is useful in the file description.

> + * Copyright (C) 2021 Xilinx Inc.
> + * Author Vikram Garhwal <fnu.vikram@xilinx.com>
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation;
> + * version 2.1 of the License.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "xc_bitops.h"
> +#include "xc_private.h"
> +#include <xen/hvm/hvm_op.h>
> +#include <libfdt.h>
> +
> +int xc_dt_overlay(xc_interface *xch, void *overlay_fdt, int overlay_fdt_size,
> +                  uint8_t overlay_op)

Shouldn't the function prototype match the types from the sysctl
structure? There is "int" vs "uint32_t" for "overlay_fdt_size".

> +{
> +    int err;
> +    DECLARE_SYSCTL;
> +
> +    DECLARE_HYPERCALL_BOUNCE(overlay_fdt, overlay_fdt_size,
> +                        XC_HYPERCALL_BUFFER_BOUNCE_IN);
> +
> +    if ( (err = xc_hypercall_bounce_pre(xch, overlay_fdt)) )
> +        goto err;
> +
> +    sysctl.cmd = XEN_SYSCTL_dt_overlay;
> +    sysctl.u.dt_overlay.overlay_op = overlay_op;
> +    sysctl.u.dt_overlay.overlay_fdt_size = overlay_fdt_size;
> +
> +    set_xen_guest_handle(sysctl.u.dt_overlay.overlay_fdt, overlay_fdt);
> +
> +    if ( (err = do_sysctl(xch, &sysctl)) != 0 )
> +        PERROR("%s failed\n", __func__);

The \n should be remove from the message. perror already adds a newline,
and it also adds information about the error after the message so a
newline in the middle will make it harder to read the error.

> +
> +err:
> +    xc_hypercall_bounce_post(xch, overlay_fdt);
> +
> +    return err;
> +}

Thanks,

-- 
Anthony PERARD

