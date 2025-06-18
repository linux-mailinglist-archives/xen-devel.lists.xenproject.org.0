Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 095FEADDFE0
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 02:05:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018623.1395495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRgIN-00012L-2Q; Wed, 18 Jun 2025 00:04:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018623.1395495; Wed, 18 Jun 2025 00:04:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRgIM-00010u-W1; Wed, 18 Jun 2025 00:04:50 +0000
Received: by outflank-mailman (input) for mailman id 1018623;
 Wed, 18 Jun 2025 00:04:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8JDB=ZB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uRgIK-00010o-PD
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 00:04:48 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d80b5d08-4bd7-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 02:04:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C438A629C5;
 Wed, 18 Jun 2025 00:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5AEEC4CEE3;
 Wed, 18 Jun 2025 00:04:43 +0000 (UTC)
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
X-Inumbo-ID: d80b5d08-4bd7-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750205085;
	bh=S6LmIBSMSPvwWa/NclMirxSjiCctzIioVBLdBfRn+KY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LTsV6rghZVpjqMlZATeWN7t9JDCwKUtA5u0ho7PUcD3k7Ey+qHF32WFFA9E8NV4iY
	 8pYTtJrP09jDLyWxFmnHdzHCvSHtXRBeJv2eHpWDYgyy8z/8fjAx8tu+rRTAXy3SO/
	 YdikwLn7QXdw+jV9g4FdxAIKu8x5+g2K4wybf+lVhEULWt/3R6NXz53rcLrrcrzbZr
	 djOxH52MqVYrX+w2x4FFympxPfr2pRRy886sZyrST63cRzE9VJ0bfb08ApYfiphXbS
	 gnV/2+LWslYqhH++CJiQ7Q38rfIud7Ag5ikXrodZSfZIg3bivWLRDKP++ZzbC0XDHu
	 b9q6Za8MYkHsA==
Date: Tue, 17 Jun 2025 17:04:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device
 to handle not only iommu
In-Reply-To: <f7a82cbe-2967-487f-9947-b56d1dea3e84@epam.com>
Message-ID: <alpine.DEB.2.22.394.2506171701190.1780597@ubuntu-linux-20-04-desktop>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com> <4f58bf9c47c40413ee9250c4cd21458382aac857.1747669845.git.oleksii_moisieiev@epam.com> <alpine.DEB.2.22.394.2505211715210.147219@ubuntu-linux-20-04-desktop>
 <f7a82cbe-2967-487f-9947-b56d1dea3e84@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1675787614-1750205085=:1780597"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1675787614-1750205085=:1780597
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 12 Jun 2025, Oleksii Moisieiev wrote:
> Hi Stefano,
> 
> I'm very sorry for a long silence. Please see my answers below:
> 
> On 22/05/2025 03:25, Stefano Stabellini wrote:
> > On Mon, 19 May 2025, Oleksii Moisieiev wrote:
> >> From: Grygorii Strashko<grygorii_strashko@epam.com>
> >>
> >> Add chained handling of assigned DT devices to support access-controller
> >> functionality through SCI framework, so DT device assign request can be
> >> passed to FW for processing and enabling VM access to requested device
> >> (for example, device power management through FW interface like SCMI).
> >>
> >> The SCI access-controller DT device processing is chained after IOMMU
> >> processing and expected to be executed for any DT device regardless of its
> >> protection by IOMMU (or if IOMMU is disabled).
> >>
> >> This allows to pass not only IOMMU protected DT device through
> >> xl.cfg:"dtdev" property for processing:
> >>
> >> dtdev = [
> >>      "/soc/video@e6ef0000", <- IOMMU protected device
> >>      "/soc/i2c@e6508000", <- not IOMMU protected device
> >> ]
> >>
> >> The change is done in two parts:
> >> 1) update iommu_do_dt_domctl() to check for dt_device_is_protected() and
> >> not fail if DT device is not protected by IOMMU
> >> 2) add chained call to sci_do_domctl() in do_domctl()
> >>
> >> Signed-off-by: Grygorii Strashko<grygorii_strashko@epam.com>
> >> Signed-off-by: Oleksii Moisieiev<oleksii_moisieiev@epam.com>
> >> ---
> >>
> >>
> >>
> >>   xen/arch/arm/firmware/sci.c             | 37 +++++++++++++++++++++++++
> >>   xen/arch/arm/include/asm/firmware/sci.h | 14 ++++++++++
> >>   xen/common/domctl.c                     | 19 +++++++++++++
> >>   xen/drivers/passthrough/device_tree.c   |  6 ++++
> >>   4 files changed, 76 insertions(+)
> >>
> >> diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
> >> index e1522e10e2..8efd541c4f 100644
> >> --- a/xen/arch/arm/firmware/sci.c
> >> +++ b/xen/arch/arm/firmware/sci.c
> >> @@ -126,6 +126,43 @@ int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
> >>       return 0;
> >>   }
> >>   
> >> +int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
> >> +                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> >> +{
> >> +    struct dt_device_node *dev;
> >> +    int ret = 0;
> >> +
> >> +    switch ( domctl->cmd )
> >> +    {
> >> +    case XEN_DOMCTL_assign_device:
> >> +        ret = -EOPNOTSUPP;
> > Are you sure -EOPNOTSUPP is the right error code for the 3 checks below?
> 
> The -EOPNOTSUPP code is used because this is part of a chained call after
> iommu_do_domctl, as stated in xen/common/domctl.c:859. The 
> XEN_DOMCTL_assign_device
> call is expected to handle any DT device, regardless of whether the DT 
> device is
> protected by an IOMMU or if the IOMMU is disabled.
> The following cases are considered:
> 
> 1. IOMMU Protected Device (Success)
> 
> If the device is protected by the IOMMU and iommu_do_domctl returns 0, 
> we continue
> processing the DT device by calling sci_do_domctl.
> 
> 2. IOMMU Disabled (-EOPNOTSUPP from iommu_do_domctl)
> 
> If iommu_do_domctl returns -EOPNOTSUPP, indicating that the IOMMU is 
> disabled,
> we still proceed to call sci_do_domctl.

OK this makes sense.  I think it is OK to have a special error code to
say "the IOMMU is disabled" but I don't know if it is a good idea to try
to use -EOPNOTSUPP for that. -EOPNOTSUPP could mean a hypervisor
configuration with domctl disabled, for instance.

It might be wiser to use a different error code. Maybe ENOENT?


> 3. Error from iommu_do_domctl (Fail State)
> 
> If iommu_do_domctl returns any error, the system enters a fail state, and
> sci_do_domctl is not called.
> 
> 4. -EOPNOTSUPP from sci_do_domctl
> 
> If sci_do_domctl returns -EOPNOTSUPP, this indicates one of the following:
> - The provided device is not a DT device.
> - There is no cur_mediator available (indicating that the SCI subsystem 
> is enabled
> in the configuration, but no mediator was provided).
> - The current mediator does not support assign_dt_device (this is 
> expected to be changed;
> see below for details).
> In this case, -EOPNOTSUPP is returned but will be ignored, and the 
> original return value from iommu_do_domctl will be used as the final result.

Same comment as before. We need to be careful not confuse this case you
described with other cases where sci_do_domctl is simply not
implemented.


> 5. Return Code from sci_do_domctl
> 
> If sci_do_domctl returns 0 (success) or an error code (failure),
> the return value from iommu_do_domctl is overridden, and the result from 
> sci_do_domctl is returned.
> Note: -EOPNOTSUPP from iommu_do_domctl will also be overridden since
> step 2 was successfully completed (or failed).
> >> +        if ( domctl->u.assign_device.dev != XEN_DOMCTL_DEV_DT )
> >> +            break;
> > this one
> >
> >> +        if ( !cur_mediator )
> >> +            break;
> > this one
> >
> >> +        if ( !cur_mediator->assign_dt_device )
> >> +            break;
> > and also this one? It seems more like an -EINVAL as the caller used a
> > wrong parameter?
> 
> I think you are right that this case should return -EINVAL because we 
> should fail if mediator
> 
> without implemented mandatory features was provided. Will be fixed.
> 
> >> +        ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
> >> +                                    domctl->u.assign_device.u.dt.size, &dev);
> >> +        if ( ret )
> >> +            return ret;
> >> +
> >> +        ret = sci_assign_dt_device(d, dev);
> >> +        if ( ret )
> >> +            break;
> >> +
> >> +        break;
> >> +    default:
> >> +        /* do not fail here as call is chained with iommu handling */
> > It looks like this should be an error
> >
> >
> >> +        break;
> >> +    }
> >> +
> >> +    return ret;
> >> +}
> >> +
> >>   static int __init sci_init(void)
> >>   {
> >>       struct dt_device_node *np;
> >> diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include/asm/firmware/sci.h
> >> index 71fb54852e..b8d1bc8a62 100644
> >> --- a/xen/arch/arm/include/asm/firmware/sci.h
> >> +++ b/xen/arch/arm/include/asm/firmware/sci.h
> >> @@ -146,6 +146,14 @@ int sci_dt_finalize(struct domain *d, void *fdt);
> >>    * control" functionality.
> >>    */
> >>   int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev);
> >> +
> >> +/*
> >> + * SCI domctl handler
> >> + *
> >> + * Only XEN_DOMCTL_assign_device is handled for now.
> >> + */
> >> +int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
> >> +                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
> >>   #else
> >>   
> >>   static inline bool sci_domain_is_enabled(struct domain *d)
> >> @@ -195,6 +203,12 @@ static inline int sci_assign_dt_device(struct domain *d,
> >>       return 0;
> >>   }
> >>   
> >> +static inline int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
> >> +                                XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> >> +{
> >> +    return 0;
> >> +}
> >> +
> >>   #endif /* CONFIG_ARM_SCI */
> >>   
> >>   #endif /* __ASM_ARM_SCI_H */
> >> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> >> index 05abb581a0..a74ee92067 100644
> >> --- a/xen/common/domctl.c
> >> +++ b/xen/common/domctl.c
> >> @@ -27,6 +27,7 @@
> >>   #include <xen/vm_event.h>
> >>   #include <xen/monitor.h>
> >>   #include <asm/current.h>
> >> +#include <asm/firmware/sci.h>
> >>   #include <asm/irq.h>
> >>   #include <asm/page.h>
> >>   #include <asm/p2m.h>
> >> @@ -851,6 +852,24 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> >>       case XEN_DOMCTL_deassign_device:
> >>       case XEN_DOMCTL_get_device_group:
> >>           ret = iommu_do_domctl(op, d, u_domctl);
> >> +
> >> +        if ( !ret || ret == -EOPNOTSUPP )
> > It is better to invert the check:
> >
> > if ( ret < 0 && ret != -EOPNOTSUPP )
> >      return ret;
> +
> >> +        {
> >> +            int ret1;
> >> +            /*
> >> +             * Add chained handling of assigned DT devices to support
> >> +             * access-controller functionality through SCI framework, so
> >> +             * DT device assign request can be passed to FW for processing and
> >> +             * enabling VM access to requested device.
> >> +             * The access-controller DT device processing is chained after IOMMU
> >> +             * processing and expected to be executed for any DT device
> >> +             * regardless if DT device is protected by IOMMU or not (or IOMMU
> >> +             * is disabled).
> >> +             */
> >> +            ret1 = sci_do_domctl(op, d, u_domctl);
> >> +            if ( ret1 != -EOPNOTSUPP )
> >> +                ret = ret1;
> >> +        }
> >>           break;
> >>   
> >>       case XEN_DOMCTL_get_paging_mempool_size:
> >> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> >> index 075fb25a37..2624767e51 100644
> >> --- a/xen/drivers/passthrough/device_tree.c
> >> +++ b/xen/drivers/passthrough/device_tree.c
> >> @@ -318,6 +318,12 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> >>               break;
> >>           }
> >>   
> >> +        if ( !dt_device_is_protected(dev) )
> >> +        {
> >> +            ret = 0;
> >> +            break;
> >> +        }
> > I am concerned about this: previously we would call
> > iommu_assign_dt_device and the same check at the beginning of
> > iommu_assign_dt_device would return -EINVAL. Now it is a success.
> >
> > I am not sure this is appropriate. I wonder if instead we should:
> >
> > - remove this chunk from the patch
> > - change the return error for !dt_device_is_protected at the top of
> >    iommu_assign_dt_device from -EINVAL to -EOPNOTSUPP
> > - this would fall into the same ret != -EOPNOTSUPP check after
> >    iommu_do_domctl
> 
> That's a good point. I think we should do the same for
> 
>  > if ( !is_iommu_enabled(d) )
> 
>  >  return -EINVAL;
> 
> because in this case we should process sci as well. I will do the change
> 
> >>           ret = iommu_assign_dt_device(d, dev);
> >>   
> >>           if ( ret )
> >> -- 
> >> 2.34.1
> >>
--8323329-1675787614-1750205085=:1780597--

