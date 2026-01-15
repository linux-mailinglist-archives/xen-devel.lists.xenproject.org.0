Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D259D21CFF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 01:16:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203934.1518851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgB1Y-00031e-DA; Thu, 15 Jan 2026 00:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203934.1518851; Thu, 15 Jan 2026 00:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgB1Y-0002yu-9u; Thu, 15 Jan 2026 00:15:40 +0000
Received: by outflank-mailman (input) for mailman id 1203934;
 Thu, 15 Jan 2026 00:15:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=by25=7U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vgB1W-0002yo-6I
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 00:15:38 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b38d987-f1a7-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 01:15:28 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 84F3740600;
 Thu, 15 Jan 2026 00:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5611C4CEF7;
 Thu, 15 Jan 2026 00:15:24 +0000 (UTC)
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
X-Inumbo-ID: 4b38d987-f1a7-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768436126;
	bh=l9alCJCT/vpCtrOLevRubwd+Mx/jfZHgoIsNZfh0rks=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aVzmSnPuw39iNNTgUZNRfKYIBbjeBe/5r/yvvpeT6OUHY0gBko5p9yIBSFMOypcTW
	 slaVMS3UBgHu83iFYViWTL3YBWHg3MWcDrnK1Ke7aCQT+KBRSB1QKZdIIfyHDe7Riu
	 Hr+ZtwabU6h2eQO1pFzEB0h0ozjupfx+aC+oQELAixcelx/t75eR+SSNcCgtSTV/fe
	 YqHzI1PyGclIkBO/XeBDW0eavyJzH+rnlza3zLdR66RtHhSPBXJLn3zn4elNhYzBzh
	 KlvP4EQP/xUsOMBmgvpmfDEd9AM2ZXLK5FtYEgq8RsaM8PhphWy1IrCbPW3Ljs4Ybj
	 BMt+o4yNADk2Q==
Date: Wed, 14 Jan 2026 16:15:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v7 1/5] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
In-Reply-To: <837eab835a75e7f668c5a49074991b2fcba56156.1768415200.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2601141612110.8589@ubuntu-linux-20-04-desktop>
References: <cover.1768415200.git.oleksii_moisieiev@epam.com> <837eab835a75e7f668c5a49074991b2fcba56156.1768415200.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-814617685-1768436088=:8589"
Content-ID: <alpine.DEB.2.22.394.2601141615070.8589@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-814617685-1768436088=:8589
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2601141615071.8589@ubuntu-linux-20-04-desktop>

On Wed, 14 Jan 2026, Oleksii Moisieiev wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Add chained handling of assigned DT devices to support access-controller
> functionality through SCI framework, so a DT device assign request can be
> passed to firmware for processing and enabling VM access to the requested
> device (for example, device power management through SCMI).
> 
> The SCI access-controller DT device processing is called before the IOMMU
> path. It runs for any DT-described device (protected or not, and even when
> the IOMMU is disabled). The IOMMU path remains unchanged for PCI devices;
> only the DT path is relaxed to permit non-IOMMU devices.
> 
> This lets xl.cfg:"dtdev" list both IOMMU-protected and non-protected DT
> devices:
> 
> dtdev = [
>     "/soc/video@e6ef0000", <- IOMMU protected device
>     "/soc/i2c@e6508000", <- not IOMMU protected device
> ]
> 
> The change is done in two parts:
> 1) call sci_do_domctl() in do_domctl() before IOMMU processing and propagate
> its error if it fails while the IOMMU path succeeds (unhandled cases return
> -ENXIO and are ignored);
> 2) update iommu_do_dt_domctl() to check for dt_device_is_protected() and
> not fail if DT device is not protected by IOMMU. iommu_do_pci_domctl
> doesn't need to be updated because iommu_do_domctl first tries
> iommu_do_pci_domctl (when CONFIG_HAS_PCI) and falls back to
> iommu_do_dt_domctl only if PCI returns -ENODEV.
> The new dt_device_is_protected() bypass in iommu_do_dt_domctl only
> applies to DT-described devices; SCI parameters are carried via DT nodes.
> PCI devices handled by iommu_do_pci_domctl do not carry DT/SCI
> metadata in this path, so there is no notion of “SCI parameters on a
> non-IOMMU-protected PCI device” for it to interpret or to skip. The
> PCI path should continue to report errors if assignment cannot be
> performed by the IOMMU layer.
> So we should leave iommu_do_pci_domctl unchanged; the SCI/DT-specific
> relaxations belong only in the DT path.
> Also SCI handling only exists when DT is present.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> 
> Changes in v7:
> - update domctl to build on both Arm and x86 platforms
> - move ret1 declaration to the top of the function as required by code
> style
> 
> Changes in v6:
> - change iommu_do_domctl and sci_do_domctl command order and
> call sci_do_domctl first which will produce cleaner code path.
> Also dropped changing return code when iommu was disabled in
> iommu_do_domctl.
> 
> Changes in v5:
> - return -EINVAL if mediator without assign_dt_device was provided
> - invert return code check for iommu_do_domctl in
> XEN_DOMCTL_assign_device domctl processing to make cleaner code
> - change -ENOTSUPP error code to -ENXIO in sci_do_domctl
> - handle -ENXIO return comde of iommu_do_domctl
> - leave !dt_device_is_protected check in iommu_do_dt_domctl to make
> code work the same way it's done in "handle_device" call while
> creating hwdom(dom0) and "handle_passthrough_prop" call for dom0less
> creation
> - drop return check from sci_assign_dt_device call as not needed
> - do not return EINVAL when addign_dt_device is not set. That is
> because this callback is optional and not implemented in single-agent driver
> 
>  xen/arch/arm/firmware/sci.c             | 35 +++++++++++++++++++++++++
>  xen/arch/arm/include/asm/firmware/sci.h | 14 ++++++++++
>  xen/common/domctl.c                     | 35 ++++++++++++++++++++++++-
>  xen/drivers/passthrough/device_tree.c   |  6 +++++
>  4 files changed, 89 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
> index aa93cda7f0..31a7e5c28b 100644
> --- a/xen/arch/arm/firmware/sci.c
> +++ b/xen/arch/arm/firmware/sci.c
> @@ -126,6 +126,41 @@ int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
>      return 0;
>  }
>  
> +int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
> +                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> +{
> +    struct dt_device_node *dev;
> +    int ret = 0;
> +
> +    switch ( domctl->cmd )
> +    {
> +    case XEN_DOMCTL_assign_device:
> +        ret = -ENXIO;
> +        if ( domctl->u.assign_device.dev != XEN_DOMCTL_DEV_DT )
> +            break;
> +
> +        if ( !cur_mediator )
> +            break;
> +
> +        if ( !cur_mediator->assign_dt_device )
> +            break;
> +
> +        ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
> +                                    domctl->u.assign_device.u.dt.size, &dev);
> +        if ( ret )
> +            return ret;
> +
> +        ret = sci_assign_dt_device(d, dev);
> +
> +        break;
> +    default:
> +        /* do not fail here as call is chained with iommu handling */
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
>  static int __init sci_init(void)
>  {
>      struct dt_device_node *np;
> diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include/asm/firmware/sci.h
> index 3500216bc2..a2d314e627 100644
> --- a/xen/arch/arm/include/asm/firmware/sci.h
> +++ b/xen/arch/arm/include/asm/firmware/sci.h
> @@ -146,6 +146,14 @@ int sci_dt_finalize(struct domain *d, void *fdt);
>   * control" functionality.
>   */
>  int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev);
> +
> +/*
> + * SCI domctl handler
> + *
> + * Only XEN_DOMCTL_assign_device is handled for now.
> + */
> +int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
> +                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
>  #else
>  
>  static inline bool sci_domain_is_enabled(struct domain *d)
> @@ -195,6 +203,12 @@ static inline int sci_assign_dt_device(struct domain *d,
>      return 0;
>  }
>  
> +static inline int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
> +                                XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> +{
> +    return 0;
> +}
> +
>  #endif /* CONFIG_ARM_SCI */
>  
>  #endif /* __ASM_ARM_SCI_H */
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 954d790226..5a31cccdd7 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -29,6 +29,9 @@
>  #include <xen/xvmalloc.h>
>  
>  #include <asm/current.h>
> +#if IS_ENABLED(CONFIG_ARM)
> +#include <asm/firmware/sci.h>
> +#endif
>  #include <asm/irq.h>
>  #include <asm/page.h>
>  #include <asm/p2m.h>
> @@ -274,7 +277,7 @@ static bool is_stable_domctl(uint32_t cmd)
>  
>  long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>  {
> -    long ret = 0;
> +    long ret = 0, ret1 = 0;
>      bool copyback = false;
>      struct xen_domctl curop, *op = &curop;
>      struct domain *d;
> @@ -827,7 +830,37 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>      case XEN_DOMCTL_test_assign_device:
>      case XEN_DOMCTL_deassign_device:
>      case XEN_DOMCTL_get_device_group:
> +        if ( IS_ENABLED(CONFIG_ARM) )

I skipped the last round of review so if this is addressing a comment
from Jan I am OK with this as is.

However, I would check directly on CONFIG_ARM_SCI.


> +        {
> +            /*
> +             * Add chained handling of assigned DT devices to support
> +             * access-controller functionality through SCI framework, so
> +             * DT device assign request can be passed to FW for processing and
> +             * enabling VM access to requested device.
> +             * The access-controller DT device processing is called before IOMMU
> +             * processing preserving return code and expected to be executed for
> +             * any DT device regardless if DT device is protected by IOMMU or
> +             * not (or IOMMU is disabled).
> +             */
> +            ret1 = sci_do_domctl(op, d, u_domctl);
> +            if ( ret1 < 0 )
> +                return ret1;
> +        }
> +        else
> +            ret1 = -ENXIO;
> +
>          ret = iommu_do_domctl(op, d, u_domctl);
> +        if ( ret < 0 )
> +            return ret;
> +
> +        /*
> +         * If IOMMU processing was successful, check for SCI processing return
> +         * code and if it was failed then overwrite the return code to propagate
> +         * SCI failure back to caller.
> +         */
> +        if ( ret1 != -ENXIO )
> +            ret = ret1;
> +
>          break;
>  
>      case XEN_DOMCTL_get_paging_mempool_size:
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index f5850a2607..29a44dc773 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -379,6 +379,12 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>              break;
>          }
>  
> +        if ( !dt_device_is_protected(dev) )
> +        {
> +            ret = 0;
> +            break;
> +        }
> +
>          ret = iommu_assign_dt_device(d, dev);
>  
>          if ( ret )
> -- 
> 2.34.1
> 
--8323329-814617685-1768436088=:8589--

