Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F4796A545
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 19:17:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789461.1199069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slX8y-00082e-UQ; Tue, 03 Sep 2024 17:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789461.1199069; Tue, 03 Sep 2024 17:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slX8y-00080p-Ri; Tue, 03 Sep 2024 17:16:40 +0000
Received: by outflank-mailman (input) for mailman id 789461;
 Tue, 03 Sep 2024 17:16:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mp5y=QB=bounce.vates.tech=bounce-md_30504962.66d74472.v1-14ef460a330442a188b9aab4067833ba@srs-se1.protection.inumbo.net>)
 id 1slX8w-0007q5-Ej
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 17:16:39 +0000
Received: from mail177-17.suw61.mandrillapp.com
 (mail177-17.suw61.mandrillapp.com [198.2.177.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 455abcb4-6a18-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 19:16:35 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-17.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4WysjZ2n54zRKLr0G
 for <xen-devel@lists.xenproject.org>; Tue,  3 Sep 2024 17:16:34 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 14ef460a330442a188b9aab4067833ba; Tue, 03 Sep 2024 17:16:34 +0000
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
X-Inumbo-ID: 455abcb4-6a18-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1725383794; x=1725644294;
	bh=BUZGCzWeGcZSAfYXyEHOG1g6dCWH/4p7pScSkneeioI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=eO6cWR75HmWsJGnpM1NeAD/cmfjk0Y2Ac27he7VMwPCCPg/0zYuPL3vOLhZHZMMjR
	 dVSFODJkdMyUNFCPhkNJ0zEgxrnkAyHZCseCzPLMxVce8RqBsp6hxgkkeff8A9sD5t
	 TwNY0c/S/pgCcAOmcy9I3Mpj8iTJb+8nFJhDuTblO1iI6pUyuVHbGrYK8V8Xgyi+nk
	 9LtOW2Vhf3pHdyCQJCELY0cxff1brr3BOmeG5lRA7x3shzB07E6l4++PAxW/OTdK1i
	 iBZVnQTkZKP57FKfvNaOsRcfBIbxdSHRVBW7f3BUtE2SR/JpIY/PguPWlw7k71B6Dx
	 KxeakBMuPKXEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1725383794; x=1725644294; i=anthony.perard@vates.tech;
	bh=BUZGCzWeGcZSAfYXyEHOG1g6dCWH/4p7pScSkneeioI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hcN+oRJ/hMvC4T53vpdMLj+Bw3kpksns8cbXEN3moCm0Oj9Y5WkBVLZf8C0mua5s6
	 BFX+hHHUuNzXXfO9MoCePVI4FlfawlrkJwY31E9sLXooKIffYGZ3Miz5ChZ7dGIbqe
	 odeMx8NSGIAFVf1bTcPE5JJ9TFwknfpKuoCJfWyXj7jf+a+J5g9h6L0slt3/2eIpAA
	 pZ59/89h/LccU6XnOMtPzu47kWNwsNxrKlcbNFsUzJbuybHOAgL5fT4g+skAZpRtok
	 PhbOp6JJfTxbJ5t8cU3sonzmgyVAn/1s/CWJRJxFPU2y/Sa8dcwW6eJOmafEKPPp+D
	 E2BKyvGp79jRw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20XEN=20PATCH=20v14=205/5]=20tools:=20Add=20new=20function=20to=20do=20PIRQ=20(un)map=20on=20PVH=20dom0?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1725383791679
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui <ray.huang@amd.com>
Message-Id: <ZtdEbxUu5nvISi4i@l14>
References: <20240903070424.982218-1-Jiqian.Chen@amd.com> <20240903070424.982218-6-Jiqian.Chen@amd.com>
In-Reply-To: <20240903070424.982218-6-Jiqian.Chen@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.14ef460a330442a188b9aab4067833ba?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240903:md
Date: Tue, 03 Sep 2024 17:16:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Sep 03, 2024 at 03:04:24PM +0800, Jiqian Chen wrote:
> When dom0 is PVH, and passthrough a device to dumU, xl will
> use the gsi number of device to do a pirq mapping, see
> pci_add_dm_done->xc_physdev_map_pirq, but the gsi number is
> got from file /sys/bus/pci/devices/<sbdf>/irq, that confuses
> irq and gsi, they are in different space and are not equal,
> so it will fail when mapping.
> To solve this issue, use xc_physdev_gsi_from_dev to get the

The function name has changed, it's not xc_physdev_gsi_from_dev anymore
;-). It is always possible to write commit description without naming
the functions that are going to be use, they are in the patch anyway.
But, the description should be updated to reflect changes in previous
patches.

> real gsi and add a new function xc_physdev_map_pirq_gsi to get
> a free pirq for gsi(why not use current function
> xc_physdev_map_pirq, because it doesn't support to allocate a
> free pirq, what's more, to prevent changing it and affecting
> its callers, so add xc_physdev_map_pirq_gsi).
> 
> Besides, PVH dom0 doesn't have PIRQ flag, it doesn't do
> PHYSDEVOP_map_pirq for each gsi. So grant function callstack
> pci_add_dm_done->XEN_DOMCTL_irq_permission will fail at function
> domain_pirq_to_irq. And old hypercall XEN_DOMCTL_irq_permission
> requires passing in pirq, it is not suitable for dom0 that
> doesn't have PIRQs to grant irq permission.
> To solve this issue, use the new hypercall
> XEN_DOMCTL_gsi_permission to grant the permission of irq(
> translate from gsi) to dumU when dom0 has no PIRQs.
>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
> ---
> diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
> index 460a8e779ce8..c752cd1f4410 100644
> --- a/tools/libs/ctrl/xc_physdev.c
> +++ b/tools/libs/ctrl/xc_physdev.c
> @@ -95,6 +95,33 @@ int xc_physdev_map_pirq_msi(xc_interface *xch,
>      return rc;
>  }
>  
> +int xc_physdev_map_pirq_gsi(xc_interface *xch,
> +                            uint32_t domid,
> +                            int gsi,
> +                            int *pirq)
> +{
> +    int rc;
> +    struct physdev_map_pirq map;
> +
> +    if ( !pirq )
> +    {
> +        errno = EINVAL;
> +        return -1;
> +    }
> +    memset(&map, 0, sizeof(struct physdev_map_pirq));
> +    map.domid = domid;
> +    map.type = MAP_PIRQ_TYPE_GSI;
> +    map.index = gsi;

You can write instead, when declaring `map`:

    struct physdev_map_pirq map = {
        .domid = domid,
        .type = MAP_PIRQ_TYPE_GSI,
        .index = gsi,
    };

Then there's no need to call memset(), the compiler will know what to
do.

> +    map.pirq = *pirq;
> +
> +    rc = do_physdev_op(xch, PHYSDEVOP_map_pirq, &map, sizeof(map));
> +
> +    if ( !rc )
> +        *pirq = map.pirq;
> +
> +    return rc;
> +}
> +
>  int xc_physdev_unmap_pirq(xc_interface *xch,
>                            uint32_t domid,
>                            int pirq)
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 96cb4da0794e..2014a67e6e56 100644
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
> @@ -1478,32 +1479,43 @@ static void pci_add_dm_done(libxl__egc *egc,
>      fclose(f);
>      if (!pci_supp_legacy_irq())
>          goto out_no_irq;
> -    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
> -                                pci->bus, pci->dev, pci->func);
> -    f = fopen(sysfs_path, "r");
> -    if (f == NULL) {
> -        LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
> -        goto out_no_irq;
> -    }
> -    if ((fscanf(f, "%u", &irq) == 1) && irq) {
> -        r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
> -        if (r < 0) {
> -            LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
> -                  irq, r);
> -            fclose(f);
> -            rc = ERROR_FAIL;
> +
> +    /* When dom0 is PVH, should use gsi to map pirq and grant permission */
> +    rc = libxl__arch_local_domain_has_pirq_notion(gc);
> +    if (!rc) {

Here, you can libxl__arch_local_domain_has_pirq_notion() within the if()
condition because the function returns a bool. (Also, `rc` is for libxl
error code, so we can make the mistake here in thinking that there an
error code been been store.) Alternatively, you could declare "bool ok"
and use that.

After that, it will be easier to read the condition has "if has pirq" or
"if ok" instead of "if no error".



> +        rc = libxl__arch_hvm_map_gsi(gc, pci_encode_bdf(pci), domid);
> +        if (rc) {
> +            LOGED(ERROR, domainid, "libxl__arch_hvm_map_gsi failed");

I think LOGD() instead of LOGED() would be enough here.
libxl__arch_hvm_map_gsi() already logs `strerror(errno)` so there's no
need to print it again.

>              goto out;
>          }
> -        r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
> -        if (r < 0) {
> -            LOGED(ERROR, domainid,
> -                  "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
> -            fclose(f);
> -            rc = ERROR_FAIL;
> -            goto out;
> +    } else {
> +        sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
> +                                    pci->bus, pci->dev, pci->func);
> +        f = fopen(sysfs_path, "r");
> +        if (f == NULL) {
> +            LOGED(ERROR, domainid, "Couldn't open %s", sysfs_path);
> +            goto out_no_irq;
> +        }
> +        if ((fscanf(f, "%u", &irq) == 1) && irq) {
> +            r = xc_physdev_map_pirq(ctx->xch, domid, irq, &irq);
> +            if (r < 0) {
> +                LOGED(ERROR, domainid, "xc_physdev_map_pirq irq=%d (error=%d)",
> +                    irq, r);
> +                fclose(f);
> +                rc = ERROR_FAIL;
> +                goto out;
> +            }
> +            r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
> +            if (r < 0) {
> +                LOGED(ERROR, domainid,
> +                    "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
> +                fclose(f);
> +                rc = ERROR_FAIL;
> +                goto out;
> +            }
>          }
> +        fclose(f);
>      }
> -    fclose(f);
>  
>      /* Don't restrict writes to the PCI config space from this VM */
>      if (pci->permissive) {
> @@ -2229,33 +2241,43 @@ skip_bar:
>      if (!pci_supp_legacy_irq())
>          goto skip_legacy_irq;
>  
> -    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
> -                           pci->bus, pci->dev, pci->func);
> -
> -    f = fopen(sysfs_path, "r");
> -    if (f == NULL) {
> -        LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
> -        goto skip_legacy_irq;
> -    }
> +    /* When dom0 is PVH, should use gsi to unmap pirq and deny permission */
> +    rc = libxl__arch_local_domain_has_pirq_notion(gc);
> +    if (!rc) {
> +        rc = libxl__arch_hvm_unmap_gsi(gc, pci_encode_bdf(pci), domid);
> +        if (rc) {
> +            LOGED(ERROR, domid, "libxl__arch_hvm_unmap_gsi failed");
> +            goto out;
> +        }
> +    } else {
> +        sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/irq", pci->domain,
> +                            pci->bus, pci->dev, pci->func);
>  
> -    if ((fscanf(f, "%u", &irq) == 1) && irq) {
> -        rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
> -        if (rc < 0) {
> -            /*
> -             * QEMU may have already unmapped the IRQ. So the error
> -             * may be spurious. For now, still print an error message as
> -             * it is not easy to distinguished between valid and
> -             * spurious error.
> -             */
> -            LOGED(ERROR, domid, "xc_physdev_unmap_pirq irq=%d", irq);
> +        f = fopen(sysfs_path, "r");
> +        if (f == NULL) {
> +            LOGED(ERROR, domid, "Couldn't open %s", sysfs_path);
> +            goto skip_legacy_irq;
>          }
> -        rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
> -        if (rc < 0) {
> -            LOGED(ERROR, domid, "xc_domain_irq_permission irq=%d", irq);
> +
> +        if ((fscanf(f, "%u", &irq) == 1) && irq) {
> +            rc = xc_physdev_unmap_pirq(ctx->xch, domid, irq);
> +            if (rc < 0) {
> +                /*
> +                * QEMU may have already unmapped the IRQ. So the error

The * ...     here ^ should be aligned with the * on the previous line.

> +                * may be spurious. For now, still print an error message as
> +                * it is not easy to distinguished between valid and
> +                * spurious error.
> +                */
> +                LOGED(ERROR, domid, "xc_physdev_unmap_pirq irq=%d", irq);
> +            }
> +            rc = xc_domain_irq_permission(ctx->xch, domid, irq, 0);
> +            if (rc < 0) {
> +                LOGED(ERROR, domid, "xc_domain_irq_permission irq=%d", irq);
> +            }
>          }
> -    }
>  
> -    fclose(f);
> +        fclose(f);
> +    }
>  
>  skip_legacy_irq:
>  
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 60643d6f5376..20e3956f09b8 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> +int libxl__arch_hvm_map_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
> +{
> +    int pirq = -1, gsi, r;
> +
> +    gsi = xc_pcidev_get_gsi(CTX->xch, sbdf);
> +    if (gsi < 0) {
> +        return ERROR_FAIL;
> +    }
> +
> +    r = xc_physdev_map_pirq_gsi(CTX->xch, domid, gsi, &pirq);
> +    if (r < 0) {
> +        LOGED(ERROR, domid, "xc_physdev_map_pirq_gsi gsi=%d ret=%d", gsi, r);

`r` should be -1, I don't think loggin it is useful..

> +        return ERROR_FAIL;
> +    }
> +
> +    r = xc_domain_gsi_permission(CTX->xch, domid, gsi, XEN_DOMCTL_GSI_GRANT);
> +    if (r < 0) {
> +        LOGED(ERROR, domid, "xc_domain_gsi_permission gsi=%d ret=%d", gsi, r);

Same here. And in the next function.

> +        return ERROR_FAIL;
> +    }
> +
> +    return 0;
> +}
> +
> +int libxl__arch_hvm_unmap_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
> +{
> +    int pirq = -1, gsi, r;
> +
> +    gsi = xc_pcidev_get_gsi(CTX->xch, sbdf);
> +    if (gsi < 0) {
> +        return ERROR_FAIL;
> +    }
> +
> +    /* Before unmapping, use mapping to get the already mapped pirq first */
> +    r = xc_physdev_map_pirq_gsi(CTX->xch, domid, gsi, &pirq);
> +    if (r < 0) {
> +        LOGED(ERROR, domid, "xc_physdev_map_pirq_gsi gsi=%d ret=%d", gsi, r);
> +        return ERROR_FAIL;
> +    }
> +
> +    r = xc_physdev_unmap_pirq(CTX->xch, domid, pirq);
> +    if (r < 0) {
> +        LOGED(ERROR, domid, "xc_physdev_unmap_pirq gsi=%d ret=%d", gsi, r);
> +        return ERROR_FAIL;
> +    }
> +
> +    r = xc_domain_gsi_permission(CTX->xch, domid, gsi, XEN_DOMCTL_GSI_REVOKE);
> +    if (r < 0) {
> +        LOGED(ERROR, domid, "xc_domain_gsi_permission gsi=%d ret=%d", gsi, r);
> +        return ERROR_FAIL;
> +    }
> +
> +    return 0;
> +}


Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

