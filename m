Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D243D861FC8
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 23:31:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684952.1065230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rde3j-0006J0-IF; Fri, 23 Feb 2024 22:30:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684952.1065230; Fri, 23 Feb 2024 22:30:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rde3j-0006HU-Fc; Fri, 23 Feb 2024 22:30:23 +0000
Received: by outflank-mailman (input) for mailman id 684952;
 Fri, 23 Feb 2024 22:30:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEAM=KA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rde3i-0006HO-B6
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 22:30:22 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1effd2a4-d29b-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 23:30:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C5EFECE2E7A;
 Fri, 23 Feb 2024 22:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B17C433F1;
 Fri, 23 Feb 2024 22:30:11 +0000 (UTC)
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
X-Inumbo-ID: 1effd2a4-d29b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708727414;
	bh=XDpdY/K24aHYoj+1hE2HmwgSYhlLtwJ0OGq3GfCguro=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T44fXxbNneK6gM2J33cw7IEC2ywU463ss60xjpuzd2lagrgOsot7GGbPhRl1i3cL7
	 HyOJah0Yne3SJbms/JvzHuEah2CwHwFOu0porp7tAaGH5eJNmIA6o2JmGn5viEsitb
	 d7OTzcH/grO8rXi0guYPzHFsRo1H29YUAbN9GpxBgVvVFmp1/svXBRTAL4w470ixfR
	 cXcrwT1myPsoUxjfuqZKwg3VFNWXAHku9Nw5qbNNuBA12emIYNWzOH1awL/u53BMqL
	 8uWrP9Up1eMmGgR2iuz8GA+KCOQhfGBQdodNzxEnuRrc/3qRhHykekw9ARFsa/WVoM
	 uod3epd2OttzA==
Date: Fri, 23 Feb 2024 14:30:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, 
    "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [RFC XEN PATCH v5 2/5] x86/pvh: Allow (un)map_pirq when dom0 is
 PVH
In-Reply-To: <BL1PR12MB58497693D450A36C84EE8B22E7552@BL1PR12MB5849.namprd12.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2402231425300.754277@ubuntu-linux-20-04-desktop>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com> <20240112061317.418658-3-Jiqian.Chen@amd.com> <alpine.DEB.2.22.394.2402221632170.754277@ubuntu-linux-20-04-desktop> <BL1PR12MB58497693D450A36C84EE8B22E7552@BL1PR12MB5849.namprd12.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Feb 2024, Chen, Jiqian wrote:
> On 2024/2/23 08:40, Stefano Stabellini wrote:
> > On Fri, 12 Jan 2024, Jiqian Chen wrote:
> >> If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
> >> a passthrough device by using gsi, see
> >> xen_pt_realize->xc_physdev_map_pirq and
> >> pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
> >> will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
> >> is not allowed because currd is PVH dom0 and PVH has no
> >> X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.
> >>
> >> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
> >> PHYSDEVOP_unmap_pirq for the failed path to unmap pirq. And
> >> add a new check to prevent self map when caller has no PIRQ
> >> flag.
> >>
> >> Co-developed-by: Huang Rui <ray.huang@amd.com>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> ---
> >>  xen/arch/x86/hvm/hypercall.c |  2 ++
> >>  xen/arch/x86/physdev.c       | 22 ++++++++++++++++++++++
> >>  2 files changed, 24 insertions(+)
> >>
> >> diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> >> index 6ad5b4d5f11f..493998b42ec5 100644
> >> --- a/xen/arch/x86/hvm/hypercall.c
> >> +++ b/xen/arch/x86/hvm/hypercall.c
> >> @@ -74,6 +74,8 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>      {
> >>      case PHYSDEVOP_map_pirq:
> >>      case PHYSDEVOP_unmap_pirq:
> >> +        break;
> >> +
> >>      case PHYSDEVOP_eoi:
> >>      case PHYSDEVOP_irq_status_query:
> >>      case PHYSDEVOP_get_free_pirq:
> >> diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
> >> index 47c4da0af7e1..7f2422c2a483 100644
> >> --- a/xen/arch/x86/physdev.c
> >> +++ b/xen/arch/x86/physdev.c
> >> @@ -303,11 +303,22 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>      case PHYSDEVOP_map_pirq: {
> >>          physdev_map_pirq_t map;
> >>          struct msi_info msi;
> >> +        struct domain *d;
> >>  
> >>          ret = -EFAULT;
> >>          if ( copy_from_guest(&map, arg, 1) != 0 )
> >>              break;
> >>  
> >> +        d = rcu_lock_domain_by_any_id(map.domid);
> >> +        if ( d == NULL )
> >> +            return -ESRCH;
> >> +        if ( !is_pv_domain(d) && !has_pirq(d) )
> > 
> > I think this could just be:
> > 
> >     if ( !has_pirq(d) )
> > 
> > Right?
> No. In the beginning, I only set this condition here, but it destroyed PV dom0.
> Because  PV has no pirq flag too, it can match this condition and return -EOPNOTSUPP, PHYSDEVOP_map_pirq will fail.

Yes I get it now. Thanks for the explanation. I think "has_pirq" is
misnamed and should probably be hvm_has_pirq or something like that.

I am not asking to fix it, but maybe an in-code comment here would help,
like:

/* if it is an HVM guest, check if it has PIRQs */

in any case:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

