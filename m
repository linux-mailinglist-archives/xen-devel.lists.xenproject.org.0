Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76D122C862
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 16:50:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyz1R-0005Xl-2j; Fri, 24 Jul 2020 14:50:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWcK=BD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jyz1Q-0005R6-CV
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 14:50:04 +0000
X-Inumbo-ID: f4a13235-cdbc-11ea-a402-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4a13235-cdbc-11ea-a402-12813bfff9fa;
 Fri, 24 Jul 2020 14:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595602203;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TB6ji7a43ZCHERjgPgXcqAao5g0lQPKrWUbY/b1zT7w=;
 b=cPjIWYm8pEqHiTUWRZuMOSt6H3gHc08e3lObRjLRCUtxYlJI6C+HaXak
 uB+4QkH9CPaBaolz1K/KKHHWiViHREr9Pf3HGqO7f7qR+BV+78JKPGxtZ
 dxgYP9mpeywsMH64C64EFR7Jd+t92oOnhXp019oMDssoLxL9/+q2a5GbO E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: e38tHvubSEl/OAFsy4+7Xl7djadcZrsyYGl/Hbh3zLKBZQG63b1uzdKWwl/4JNSzQ23arLPscW
 7Ja60I9ksMCFgzTl5iF6SaPWpur7nNlSt3TjTB6gm7pdUp4OX9O1oW/LcOUjGuzxGx2e0D0+QP
 +Nm3AktNyNJQ+yBN3VpFiKeTO/qR5R25MFkUmXSDP/jlq0pUQNiK9dm3U3g/uziNSzTBPF00X0
 KZdgoJl7cWoPl5MuMc3ks5Inp5IVkHUbPwPKF+I+iiwXTdclyOH8xwQ+SkvTbv43sfC3PcwtsV
 uTM=
X-SBRS: 2.7
X-MesageID: 23129670
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,391,1589256000"; d="scan'208";a="23129670"
Date: Fri, 24 Jul 2020 16:49:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH v1 2/4] xen/arm: Discovering PCI devices and add the
 PCI devices in XEN.
Message-ID: <20200724144955.GK7191@Air-de-Roger>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <666df0147054dda8af13ae74a89be44c69984295.1595511416.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2007231337140.17562@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2007231337140.17562@sstabellini-ThinkPad-T480s>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Rahul Singh <rahul.singh@arm.com>, Julien Grall <julien@xen.org>,
 andrew.cooper3@citrix.com, Bertrand.Marquis@arm.com, jbeulich@suse.com,
 xen-devel@lists.xenproject.org, nd@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 23, 2020 at 01:44:03PM -0700, Stefano Stabellini wrote:
> On Thu, 23 Jul 2020, Rahul Singh wrote:
> > Hardware domain is in charge of doing the PCI enumeration and will
> > discover the PCI devices and then will communicate to XEN via hyper
> > call PHYSDEVOP_pci_device_add to add the PCI devices in XEN.
> > 
> > Change-Id: Ie87e19741689503b4b62da911c8dc2ee318584ac
> 
> Same question about Change-Id
> 
> 
> > Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> > ---
> >  xen/arch/arm/physdev.c | 42 +++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 39 insertions(+), 3 deletions(-)
> > 
> > diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
> > index e91355fe22..274720f98a 100644
> > --- a/xen/arch/arm/physdev.c
> > +++ b/xen/arch/arm/physdev.c
> > @@ -9,12 +9,48 @@
> >  #include <xen/errno.h>
> >  #include <xen/sched.h>
> >  #include <asm/hypercall.h>
> > -
> > +#include <xen/guest_access.h>
> > +#include <xsm/xsm.h>
> >  
> >  int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >  {
> > -    gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=%d: not implemented\n", cmd);
> > -    return -ENOSYS;
> > +    int ret = 0;
> > +
> > +    switch ( cmd )
> > +    {
> > +#ifdef CONFIG_HAS_PCI
> > +        case PHYSDEVOP_pci_device_add:
> > +            {
> > +                struct physdev_pci_device_add add;
> > +                struct pci_dev_info pdev_info;
> > +                nodeid_t node = NUMA_NO_NODE;
> > +
> > +                ret = -EFAULT;
> > +                if ( copy_from_guest(&add, arg, 1) != 0 )
> > +                    break;
> > +
> > +                pdev_info.is_extfn = !!(add.flags & XEN_PCI_DEV_EXTFN);
> > +                if ( add.flags & XEN_PCI_DEV_VIRTFN )
> > +                {
> > +                    pdev_info.is_virtfn = 1;
> > +                    pdev_info.physfn.bus = add.physfn.bus;
> > +                    pdev_info.physfn.devfn = add.physfn.devfn;
> > +                }
> > +                else
> > +                    pdev_info.is_virtfn = 0;
> > +
> > +                ret = pci_add_device(add.seg, add.bus, add.devfn,
> > +                                &pdev_info, node);
> > +
> > +                break;
> > +            }
> > +#endif
> > +        default:
> > +            gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=%d: not implemented\n", cmd);
> > +            ret = -ENOSYS;
> > +    }
> 
> I think we should make the implementation common between arm and x86 by
> creating xen/common/physdev.c:do_physdev_op as a shared entry point for
> PHYSDEVOP hypercalls implementations. See for instance:
> 
> xen/common/sysctl.c:do_sysctl
> 
> and
> 
> xen/arch/arm/sysctl.c:arch_do_sysctl
> xen/arch/x86/sysctl.c:arch_do_sysctl
> 
> 
> Jan, Andrew, Roger, any opinions?

Oh, physdev ops don't have a common entry point, it's all per-arch.
Since Arm has no physdev ops at all, I think we should start by adding
a common do_physdev_op and move PHYSDEVOP_pci_device_add into it,
leaving the rest of x86 operations as arch_do_physdev_op.

Thanks, Roger.

