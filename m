Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9382A93D99D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 22:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765756.1176410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXRMK-0005ms-3l; Fri, 26 Jul 2024 20:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765756.1176410; Fri, 26 Jul 2024 20:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXRMK-0005iL-0S; Fri, 26 Jul 2024 20:16:12 +0000
Received: by outflank-mailman (input) for mailman id 765756;
 Fri, 26 Jul 2024 20:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HdqS=O2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sXRMI-0005he-RH
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 20:16:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3d67f97-4b8b-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 22:16:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2491461671;
 Fri, 26 Jul 2024 20:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27452C4AF09;
 Fri, 26 Jul 2024 20:16:04 +0000 (UTC)
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
X-Inumbo-ID: e3d67f97-4b8b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722024965;
	bh=F8ifxgQXWaNGze3x4qI8bHRWYDbVSo9IftHDTKXH1QU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VK1AujExIMVH+0tSY7eVWXQUOWXWYVyQAGa+tRZ13JdfUWzEixgfu+z8s9MshJ+Ql
	 MzueY+1/QJUUeRVRsTYf+IGnX+OYyw5X14SVLRvqTsl6LPq5UP/ScaDrLREXp5BeZW
	 CXW02XaJcDoy8m54kgWbj/sOE9/69JlDS0LpLvhYyuYXdbIp3PD5lCet117RHXwxTk
	 wq5hGTeR2OCP77udKqVBiddvWytrZsAdjBEom1I5JimH+cdVvSknwxWsZAoxWeYRM9
	 13sSU3GDhnrfFsxbxcgG2KOXnuQe3eaz55y4nNf+F6f6fVyOgDV+N50F76laNxR7TY
	 b89onZOBQLT+w==
Date: Fri, 26 Jul 2024 13:16:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <gwd@xenproject.org>, 
    Julien Grall <julien@xen.org>, Anthony PERARD <anthony@xenproject.org>, 
    Juergen Gross <jgross@suse.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, 
    "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
In-Reply-To: <BL1PR12MB5849C8A40630534241B31941E7B42@BL1PR12MB5849.namprd12.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2407261313160.4857@ubuntu-linux-20-04-desktop>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com> <20240708114124.407797-5-Jiqian.Chen@amd.com> <alpine.DEB.2.22.394.2407221505440.4857@ubuntu-linux-20-04-desktop> <BL1PR12MB5849C8A40630534241B31941E7B42@BL1PR12MB5849.namprd12.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Jul 2024, Chen, Jiqian wrote:
> On 2024/7/23 06:10, Stefano Stabellini wrote:
> > On Mon, 8 Jul 2024, Jiqian Chen wrote:
> >> Some type of domains don't have PIRQs, like PVH, it doesn't do
> >> PHYSDEVOP_map_pirq for each gsi. When passthrough a device
> >> to guest base on PVH dom0, callstack
> >> pci_add_dm_done->XEN_DOMCTL_irq_permission will fail at function
> >> domain_pirq_to_irq, because PVH has no mapping of gsi, pirq and
> >> irq on Xen side.
> >> What's more, current hypercall XEN_DOMCTL_irq_permission requires
> >> passing in pirq to set the access of irq, it is not suitable for
> >> dom0 that doesn't have PIRQs.
> >>
> >> So, add a new hypercall XEN_DOMCTL_gsi_permission to grant/deny
> >> the permission of irq(translate from x86 gsi) to dumU when dom0
> >> has no PIRQs.
> >>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> Signed-off-by: Huang Rui <ray.huang@amd.com>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> ---
> >> CC: Daniel P . Smith <dpsmith@apertussolutions.com>
> >> Remaining comment @Daniel P . Smith:
> >> +        ret = -EPERM;
> >> +        if ( !irq_access_permitted(currd, irq) ||
> >> +             xsm_irq_permission(XSM_HOOK, d, irq, access_flag) )
> >> +            goto gsi_permission_out;
> >> Is it okay to issue the XSM check using the translated value, 
> >> not the one that was originally passed into the hypercall?
> >> ---
> >>  xen/arch/x86/domctl.c              | 32 ++++++++++++++++++++++++++++++
> >>  xen/arch/x86/include/asm/io_apic.h |  2 ++
> >>  xen/arch/x86/io_apic.c             | 17 ++++++++++++++++
> >>  xen/arch/x86/mpparse.c             |  5 ++---
> >>  xen/include/public/domctl.h        |  9 +++++++++
> >>  xen/xsm/flask/hooks.c              |  1 +
> >>  6 files changed, 63 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> >> index 9190e11faaa3..4e9e4c4cfed3 100644
> >> --- a/xen/arch/x86/domctl.c
> >> +++ b/xen/arch/x86/domctl.c
> >> @@ -36,6 +36,7 @@
> >>  #include <asm/xstate.h>
> >>  #include <asm/psr.h>
> >>  #include <asm/cpu-policy.h>
> >> +#include <asm/io_apic.h>
> >>  
> >>  static int update_domain_cpu_policy(struct domain *d,
> >>                                      xen_domctl_cpu_policy_t *xdpc)
> >> @@ -237,6 +238,37 @@ long arch_do_domctl(
> >>          break;
> >>      }
> >>  
> >> +    case XEN_DOMCTL_gsi_permission:
> >> +    {
> >> +        int irq;
> >> +        unsigned int gsi = domctl->u.gsi_permission.gsi;
> >> +        uint8_t access_flag = domctl->u.gsi_permission.access_flag;
> >> +
> >> +        /* Check all bits and pads are zero except lowest bit */
> >> +        ret = -EINVAL;
> >> +        if ( access_flag & ( ~XEN_DOMCTL_GSI_PERMISSION_MASK ) )
> >> +            goto gsi_permission_out;
> >> +        for ( i = 0; i < ARRAY_SIZE(domctl->u.gsi_permission.pad); ++i )
> >> +            if ( domctl->u.gsi_permission.pad[i] )
> >> +                goto gsi_permission_out;
> >> +
> >> +        if ( gsi > highest_gsi() || (irq = gsi_2_irq(gsi)) <= 0 )
> > 
> > gsi is unsigned int but it is passed to gsi_2_irq which takes an int as
> > parameter. If gsi >= INT32_MAX we have a problem. I think we should
> > explicitly check for the possible overflow and return error in that
> > case.
> But here has checked "gsi > highest_gsi()", can highesi_gsi() return a gsi >= INT32_MAX?

In practice it is impossible but in theory it could. But then I looked
at the implementation of highest_gsi() and gsi_end actually a signed
int. So I think this is OK:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

