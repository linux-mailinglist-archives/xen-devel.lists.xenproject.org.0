Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A7622B80B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 22:45:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyi4V-0001AX-C8; Thu, 23 Jul 2020 20:44:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lw2b=BC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jyi4T-0001AS-Nu
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 20:44:05 +0000
X-Inumbo-ID: 3f3f1920-cd25-11ea-8782-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f3f1920-cd25-11ea-8782-bc764e2007e4;
 Thu, 23 Jul 2020 20:44:05 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC07F2065E;
 Thu, 23 Jul 2020 20:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595537044;
 bh=OpWpCb8rL/SmrzCCJV8ZKI0dEkRstb/48b6TMagit3Q=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ubCdb9HjBGjSX5kqp1zt3yREs3ZLGJz/1/+vCTnJq+m8ORwToFwpTi08c3QiMcCOl
 RLdNybg8yu6selCwVaOkoBETtIufE8uKwdrIS0CSX5WZWjh9W5a/gHCBp794S0PXAJ
 hQ/7hQfoS5NjKkASChBVvzBs42jtpnZ98wxqrfew=
Date: Thu, 23 Jul 2020 13:44:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
Subject: Re: [RFC PATCH v1 2/4] xen/arm: Discovering PCI devices and add the
 PCI devices in XEN.
In-Reply-To: <666df0147054dda8af13ae74a89be44c69984295.1595511416.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2007231337140.17562@sstabellini-ThinkPad-T480s>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <666df0147054dda8af13ae74a89be44c69984295.1595511416.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 andrew.cooper3@citrix.com, Bertrand.Marquis@arm.com, jbeulich@suse.com,
 xen-devel@lists.xenproject.org, nd@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 23 Jul 2020, Rahul Singh wrote:
> Hardware domain is in charge of doing the PCI enumeration and will
> discover the PCI devices and then will communicate to XEN via hyper
> call PHYSDEVOP_pci_device_add to add the PCI devices in XEN.
> 
> Change-Id: Ie87e19741689503b4b62da911c8dc2ee318584ac

Same question about Change-Id


> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/arch/arm/physdev.c | 42 +++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
> index e91355fe22..274720f98a 100644
> --- a/xen/arch/arm/physdev.c
> +++ b/xen/arch/arm/physdev.c
> @@ -9,12 +9,48 @@
>  #include <xen/errno.h>
>  #include <xen/sched.h>
>  #include <asm/hypercall.h>
> -
> +#include <xen/guest_access.h>
> +#include <xsm/xsm.h>
>  
>  int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  {
> -    gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=%d: not implemented\n", cmd);
> -    return -ENOSYS;
> +    int ret = 0;
> +
> +    switch ( cmd )
> +    {
> +#ifdef CONFIG_HAS_PCI
> +        case PHYSDEVOP_pci_device_add:
> +            {
> +                struct physdev_pci_device_add add;
> +                struct pci_dev_info pdev_info;
> +                nodeid_t node = NUMA_NO_NODE;
> +
> +                ret = -EFAULT;
> +                if ( copy_from_guest(&add, arg, 1) != 0 )
> +                    break;
> +
> +                pdev_info.is_extfn = !!(add.flags & XEN_PCI_DEV_EXTFN);
> +                if ( add.flags & XEN_PCI_DEV_VIRTFN )
> +                {
> +                    pdev_info.is_virtfn = 1;
> +                    pdev_info.physfn.bus = add.physfn.bus;
> +                    pdev_info.physfn.devfn = add.physfn.devfn;
> +                }
> +                else
> +                    pdev_info.is_virtfn = 0;
> +
> +                ret = pci_add_device(add.seg, add.bus, add.devfn,
> +                                &pdev_info, node);
> +
> +                break;
> +            }
> +#endif
> +        default:
> +            gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=%d: not implemented\n", cmd);
> +            ret = -ENOSYS;
> +    }

I think we should make the implementation common between arm and x86 by
creating xen/common/physdev.c:do_physdev_op as a shared entry point for
PHYSDEVOP hypercalls implementations. See for instance:

xen/common/sysctl.c:do_sysctl

and

xen/arch/arm/sysctl.c:arch_do_sysctl
xen/arch/x86/sysctl.c:arch_do_sysctl


Jan, Andrew, Roger, any opinions?


