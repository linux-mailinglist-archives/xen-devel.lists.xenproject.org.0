Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A327992A538
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 16:57:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755472.1163839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQpnl-0000Be-A5; Mon, 08 Jul 2024 14:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755472.1163839; Mon, 08 Jul 2024 14:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQpnl-00009p-7F; Mon, 08 Jul 2024 14:57:13 +0000
Received: by outflank-mailman (input) for mailman id 755472;
 Mon, 08 Jul 2024 14:57:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8GMZ=OI=bounce.vates.tech=bounce-md_30504962.668bfe44.v1-f42f66745943415097d2db68bb7d108c@srs-se1.protection.inumbo.net>)
 id 1sQpnj-0008AG-Cz
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 14:57:11 +0000
Received: from mail179-23.suw41.mandrillapp.com
 (mail179-23.suw41.mandrillapp.com [198.2.179.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5954224a-3d3a-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 16:57:09 +0200 (CEST)
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-23.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4WHnK01tKbz35hbXQ
 for <xen-devel@lists.xenproject.org>; Mon,  8 Jul 2024 14:57:08 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f42f66745943415097d2db68bb7d108c; Mon, 08 Jul 2024 14:57:08 +0000
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
X-Inumbo-ID: 5954224a-3d3a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720450628; x=1720711128;
	bh=4piNvsS4WN4SgZz9wtn4pAeV5N5WpyNXM0WLds1yayM=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tmckCEB20Sl2tuCkFwQ/Ro5YNUG5cuHwSURybQ+tOCxmpxCVm0Fb3On/tA4d4bsdX
	 bDkQK7N4hV9s0gW2Mu0t/eX1z32B6mEyALSpgjqEyDTvCr/YfTjHIMv7KYggaisvAj
	 VmaSqVV1Xcgzj/gSvnpL9pV7F0qG0BGxuLYIEyHaf0c6O96N92hr4fCwvd0tWuZ6LF
	 D3XBDyaEmLkHwHAKBHN2LII2jb6DdRdVRrCzxHjkl57KBmbVoL6yHw0hMcyvu3wr0v
	 /5QQkM6qstONQN0YjHAcuv2xvQ6IbdCOIvKzsgjcbGgWIJG9t6wacbdPXtUGzfZJ2K
	 aw1Eh6F7pBOWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720450628; x=1720711128; i=anthony.perard@vates.tech;
	bh=4piNvsS4WN4SgZz9wtn4pAeV5N5WpyNXM0WLds1yayM=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gAC5i15jQevQU0FxvDvv97JBAKFr4GjvQ43RivsewCluio7O95HIiIy4DamprS/Yf
	 CgkryRmt4VKcfmEZSQgW5UPOUOSAABuFjuM2m5MKgOTa4rN6CHhfmJ8PHETusLnN0R
	 /odAMs23czKICaP/nGCSkZJoWnIu9TTAtATEU7y4q5qeIiSKUs7/X/Y3svPJVNhr4f
	 LG60zJgHUVlqCF4tc2qK5lL5PMyfSTpVHJm1E0DtKi5D+9K9bD/ipn9u1TbZ5moYwS
	 cRwuUPk33NonjwDQoZNqcwKWVr3dBNy8XvnO7MJx/hAmI8OaQR8kxwljFj3fqDOlPm
	 qi3ygjZbJIc0w==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20XEN=20PATCH=20v12=207/7]=20tools:=20Add=20new=20function=20to=20do=20PIRQ=20(un)map=20on=20PVH=20dom0?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720450626167
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui <ray.huang@amd.com>
Message-Id: <Zov+QeadGqtzOfKY@l14>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com> <20240708114124.407797-8-Jiqian.Chen@amd.com>
In-Reply-To: <20240708114124.407797-8-Jiqian.Chen@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f42f66745943415097d2db68bb7d108c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240708:md
Date: Mon, 08 Jul 2024 14:57:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Jul 08, 2024 at 07:41:24PM +0800, Jiqian Chen wrote:
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index a4029e3ac810..d869bbec769e 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -1774,6 +1774,16 @@ void libxl__arch_update_domain_config(libxl__gc *gc,
>  {
>  }
>  
> +int libxl__arch_hvm_map_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
> +{
> +    return -1;

It's best to return an ERROR_* for libxl error code instead of -1.
ERROR_NI seems to be the one, it probably means not-implemented. Or
maybe ERROR_INVAL would do to.

> +}
> +
> +int libxl__arch_hvm_unmap_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
> +{
> +    return -1;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 96cb4da0794e..3d25997921cc 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -17,6 +17,7 @@
>  #include "libxl_osdeps.h" /* must come before any other headers */
>  
>  #include "libxl_internal.h"
> +#include "libxl_arch.h"
>  
>  #define PCI_BDF                "%04x:%02x:%02x.%01x"
>  #define PCI_BDF_SHORT          "%02x:%02x.%01x"
> @@ -1478,6 +1479,16 @@ static void pci_add_dm_done(libxl__egc *egc,
>      fclose(f);
>      if (!pci_supp_legacy_irq())
>          goto out_no_irq;
> +
> +    /*
> +     * When dom0 is PVH and mapping a x86 gsi to pirq for domU,
> +     * should use gsi to grant irq permission.
> +     */
> +    if (!libxl__arch_hvm_map_gsi(gc, pci_encode_bdf(pci), domid))

Could you store the result of libxl__arch_hvm_map_gsi() in `rc', then
test that in the condition?

> +        goto pci_permissive;

Why do you skip part of the function on success?
But also, please avoid the "goto" coding style, in libxl, it's tolerated
for error handling when used to skip to the end of function to have a
single path (or error path) out of a function.

> +    else
> +        LOGED(WARN, domid, "libxl__arch_hvm_map_gsi failed (err=%d)", errno);

No one reads logs unless there's a failure or something doesn't work. So
here we just ignore failure returned by libxl__arch_hvm_map_gsi(), is it
the right things to do? Usually, just ignoring error is wrong.

FYI: LOGE* already logs errno.

> +
>      sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
>                                  pci->bus, pci->dev, pci->func);
>      f = fopen(sysfs_path, "r");
> @@ -1505,6 +1516,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>      }
>      fclose(f);
>  
> +pci_permissive:
>      /* Don't restrict writes to the PCI config space from this VM */
>      if (pci->permissive) {
>          if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/permissive",
> @@ -2229,6 +2241,11 @@ skip_bar:
>      if (!pci_supp_legacy_irq())
>          goto skip_legacy_irq;
>  
> +    if (!libxl__arch_hvm_unmap_gsi(gc, pci_encode_bdf(pci), domid))
> +        goto skip_legacy_irq;
> +    else
> +        LOGED(WARN, domid, "libxl__arch_hvm_unmap_gsi failed (err=%d)", errno);
> +
>      sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
>                             pci->bus, pci->dev, pci->func);
>  
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 60643d6f5376..e7756d323cb6 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -879,6 +879,117 @@ void libxl__arch_update_domain_config(libxl__gc *gc,
>                                   libxl_defbool_val(src->b_info.u.hvm.pirq));
>  }
>  
> +struct pcidev_map_pirq {
> +    uint32_t sbdf;
> +    uint32_t pirq;
> +    XEN_LIST_ENTRY(struct pcidev_map_pirq) entry;
> +};
> +
> +static pthread_mutex_t pcidev_pirq_mutex = PTHREAD_MUTEX_INITIALIZER;
> +static XEN_LIST_HEAD(, struct pcidev_map_pirq) pcidev_pirq_list =
> +    XEN_LIST_HEAD_INITIALIZER(pcidev_pirq_list);
> +
> +int libxl__arch_hvm_map_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
> +{
> +    int pirq = -1, gsi, r;
> +    xc_domaininfo_t info;
> +    struct pcidev_map_pirq *pcidev_pirq;
> +    libxl_ctx *ctx = libxl__gc_owner(gc);

Instead of declaring "ctx", you can use the macro "CTX" when you need
"ctx".

> +
> +    r = xc_domain_getinfo_single(ctx->xch, LIBXL_TOOLSTACK_DOMID, &info);
> +    if (r < 0) {
> +        LOGED(ERROR, domid, "getdomaininfo failed (error=%d)", errno);
> +        return r;

libxl_*() functions should return only libxl error code, that is return
code from other libxl_* functions, useally store in 'rc', or one of ERROR_*.

> +    }
> +    if ((info.flags & XEN_DOMINF_hvm_guest) &&
> +        !(info.arch_config.emulation_flags & XEN_X86_EMU_USE_PIRQ)) {
> +        gsi = xc_physdev_gsi_from_pcidev(ctx->xch, sbdf);
> +        if (gsi < 0) {
> +            return ERROR_FAIL;
> +        }
> +        r = xc_physdev_map_pirq(ctx->xch, domid, gsi, &pirq);
> +        if (r < 0) {
> +            LOGED(ERROR, domid, "xc_physdev_map_pirq gsi=%d (error=%d)",
> +                  gsi, errno);
> +            return r;
> +        }
> +        r = xc_domain_gsi_permission(ctx->xch, domid, gsi, 1);
> +        if (r < 0) {
> +            LOGED(ERROR, domid, "xc_domain_gsi_permission gsi=%d (error=%d)",
> +                  gsi, errno);
> +            return r;
> +        }
> +    } else {
> +        return ERROR_FAIL;

Is it really an error?

I few values can be returned here,
  * ERROR_INVAL meaing that the function was called on a dom0 that don't
    do "GSI",
  * 0, that is success, because the function check if it need to do
    anything, and since there's nothing to do, we can return success.

> +    }
> +
> +    /* Save the pirq for the usage of unmapping */
> +    pcidev_pirq = malloc(sizeof(struct pcidev_map_pirq));
> +    if (!pcidev_pirq) {
> +        LOGED(ERROR, domid, "no memory for saving pirq of pcidev info");
> +        return ERROR_NOMEM;
> +    }
> +    pcidev_pirq->sbdf = sbdf;
> +    pcidev_pirq->pirq = pirq;
> +
> +    assert(!pthread_mutex_lock(&pcidev_pirq_mutex));
> +    XEN_LIST_INSERT_HEAD(&pcidev_pirq_list, pcidev_pirq, entry);

I don't think that's going to work as you expect. libxl isn't a daemon
(or sometime it is but used for several domains), so anything store in
memory will be lost, or would be shared with other guest.

Do you need this mappins sbdf<-> pirq ? Is there a way to query this
information later from the environement? If not, you will need to store
the data somewhere else, probably in "libxl_domain_config *d_config" as
libxl can retrive the data with libxl__get_domain_configuration().
There's also the posibility to store that info in xenstore, but we
should probably avoid that.

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

