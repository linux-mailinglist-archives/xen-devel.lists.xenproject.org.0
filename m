Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589B68062F1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 00:25:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648687.1012662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAenP-0000Tk-W4; Tue, 05 Dec 2023 23:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648687.1012662; Tue, 05 Dec 2023 23:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAenP-0000Rq-TL; Tue, 05 Dec 2023 23:25:43 +0000
Received: by outflank-mailman (input) for mailman id 648687;
 Tue, 05 Dec 2023 23:25:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQDs=HQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAenN-0000Ri-N1
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 23:25:41 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a7553cf-93c5-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 00:25:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DE3A1B81D64;
 Tue,  5 Dec 2023 23:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A034BC433C8;
 Tue,  5 Dec 2023 23:25:37 +0000 (UTC)
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
X-Inumbo-ID: 9a7553cf-93c5-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701818739;
	bh=/8UjRmebeDMvTDORrR3C6SUgdeWgmCE89/ql4seGRgc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pTp6HvG/XJC0kOIjL+lRLBVkdPuNhUsqodoIbYiiTfzW1OXo0NpOBIRR9pwscnl/v
	 gGKLcitvv8adk+GxVNvX07qUVEx9Sm8ZK99td4+frf1pzKUhM+jAkpuNe/6enEVPxT
	 6rQsE+5lTSldlUPJ+CwPEl1u+DTkLukQpGcOBTFsZ/lTLdi5UFBaKf1L49BxIsR5FI
	 mhHSw/thNlWom2PfZ5jkVS/9hbf11QNPrakC/lUw8i5WTDtGWuIfYjnPDwFDB6ydG3
	 pdlJSiM5U5sZ4yJBYlegPg5DIa30UcJY0j2dUaaUP7T1InkEltoIhFwxz0d/06quhQ
	 JmFDI4+nwkAag==
Date: Tue, 5 Dec 2023 15:25:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v6 4/5] [FUTURE] xen/arm: enable vPCI for domUs
In-Reply-To: <075bae3d-c255-4354-9917-191cce3ba1b1@amd.com>
Message-ID: <alpine.DEB.2.22.394.2312051524210.110490@ubuntu-linux-20-04-desktop>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com> <20231113222118.825758-5-stewart.hildebrand@amd.com> <ZWmkh0Xeaynh43N7@macbook> <alpine.DEB.2.22.394.2312011847520.110490@ubuntu-linux-20-04-desktop> <ZW2wuqXW-DneUVi0@macbook>
 <alpine.DEB.2.22.394.2312041333250.110490@ubuntu-linux-20-04-desktop> <ZW8EkQLTwEEK6fXC@macbook> <8980b420-8e6a-4dd9-ba5f-bd2eb527c2f7@amd.com> <ZW9ZYeDD7k146LsB@macbook> <075bae3d-c255-4354-9917-191cce3ba1b1@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1995270885-1701818739=:110490"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1995270885-1701818739=:110490
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 5 Dec 2023, Stewart Hildebrand wrote:
> On 12/5/23 12:09, Roger Pau Monné wrote:
> > On Tue, Dec 05, 2023 at 11:27:03AM -0500, Stewart Hildebrand wrote:
> >> On 12/5/23 06:08, Roger Pau Monné wrote:
> >>> On Mon, Dec 04, 2023 at 02:07:51PM -0800, Stefano Stabellini wrote:
> >>>> On Mon, 4 Dec 2023, Roger Pau Monné wrote:
> >>>>> On Fri, Dec 01, 2023 at 06:56:32PM -0800, Stefano Stabellini wrote:
> >>>>>> On Fri, 1 Dec 2023, Roger Pau Monné wrote:
> >>>>>>> On Mon, Nov 13, 2023 at 05:21:13PM -0500, Stewart Hildebrand wrote:
> >>>>>>>> @@ -1618,6 +1630,14 @@ int iommu_do_pci_domctl(
> >>>>>>>>          bus = PCI_BUS(machine_sbdf);
> >>>>>>>>          devfn = PCI_DEVFN(machine_sbdf);
> >>>>>>>>  
> >>>>>>>> +        if ( needs_vpci(d) && !has_vpci(d) )
> >>>>>>>> +        {
> >>>>>>>> +            printk(XENLOG_G_WARNING "Cannot assign %pp to %pd: vPCI support not enabled\n",
> >>>>>>>> +                   &PCI_SBDF(seg, bus, devfn), d);
> >>>>>>>> +            ret = -EPERM;
> >>>>>>>> +            break;
> >>>>>>>
> >>>>>>> I think this is likely too restrictive going forward.  The current
> >>>>>>> approach is indeed to enable vPCI on a per-domain basis because that's
> >>>>>>> how PVH dom0 uses it, due to being unable to use ioreq servers.
> >>>>>>>
> >>>>>>> If we start to expose vPCI suport to guests the interface should be on
> >>>>>>> a per-device basis, so that vPCI could be enabled for some devices,
> >>>>>>> while others could still be handled by ioreq servers.
> >>>>>>>
> >>>>>>> We might want to add a new flag to xen_domctl_assign_device (used by
> >>>>>>> XEN_DOMCTL_assign_device) in order to signal whether the device will
> >>>>>>> use vPCI.
> >>>>>>
> >>>>>> Actually I don't think this is a good idea. I am all for flexibility but
> >>>>>> supporting multiple different configurations comes at an extra cost for
> >>>>>> both maintainers and contributors. I think we should try to reduce the
> >>>>>> amount of configurations we support rather than increasing them
> >>>>>> (especially on x86 where we have PV, PVH, HVM).
> >>>>>
> >>>>> I think it's perfectly fine to initially require a domain to have all
> >>>>> its devices either passed through using vPCI or ireqs, but the
> >>>>> interface IMO should allow for such differentiation in the future.
> >>>>> That's why I think introducing a domain wide vPCI flag might not be
> >>>>> the best option going forward.
> >>>>>
> >>>>> It would be perfectly fine for XEN_DOMCTL_assign_device to set a
> >>>>> domain wide vPCI flag, iow:
> >>>>>
> >>>>> if ( HYPERCALL_VPCI_FLAG_SET && !has_vpci(d) )
> >>>>> {
> >>>>>     if ( has_arch_pdevs(d) )
> >>>>>     {
> >>>>>         printk("All passthrough devices must use the same backend\n");
> >>>>>         return -EINVAL;
> >>>>>     }
> >>>>>
> >>>>>     /* Set vPCI domain flag */
> >>>>> }
> >>>>
> >>>> That would be fine by me, but maybe we can avoid this change too. I was
> >>>> imagining that vPCI would be enabled at domain creation, not at runtime.
> >>>> And that vPCI would be enabled by default for all PVH guests (once we
> >>>> are past the initial experimental phase.)
> >>>
> >>> Then we don't even need a new CDF flag, and just enable vPCI when
> >>> IOMMU is enabled?  IOW: we can key the enabling of vPCI to
> >>> XEN_DOMCTL_CDF_iommu for specific domain types?
> >>
> >> There are many Arm based platforms that need to use iommu but don't have (or don't use) PCI, so we'd still like to have a separate vPCI flag.
> > 
> > OK, read below though - if we switch to vPCI being a descendant of
> > IOREQ (so that the PCI config space decoding is done by IOREQ) we
> > could hotplug vPCI managed devices at runtime without requiring any
> > prior initialization at domain create, since the traps to the PCI
> > config space would be setup by IOREQ.
> > 
> > We might need a PCI flag in order to signal whether the domain is
> > intended to use PCI devices or not, and so whether IOREQ needs to
> > setup PCI config space traps (either fully emulated or passthrough
> > devices).  But that would be arch-specific AFAICT, as on x86 we
> > always trap accesses to the PCI IO ports.
> 
> On Arm, the toolstack (or dom0less creation code) needs to construct a {v,ioreq}PCI root complex node in the device tree before guest boot. Attempting to hot plug such a device tree node at runtime sounds like a goal for the (far) future. On Arm, we don't trap the {v,ioreq}PCI config space by default, so, yes, we for sure would need such a {v,ioreq}PCI flag for setting up the {v,ioreq}PCI mmio handlers if we go this route.

Yes and also dynamic configuration and hotplug are actually detrimental
in safety configurations where you need as much as possible, ideally
everything, to be specified at build time.
--8323329-1995270885-1701818739=:110490--

