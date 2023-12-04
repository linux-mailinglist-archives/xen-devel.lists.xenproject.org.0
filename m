Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB63804153
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 23:08:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647328.1010342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAH6g-0001UF-C4; Mon, 04 Dec 2023 22:08:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647328.1010342; Mon, 04 Dec 2023 22:08:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAH6g-0001Rw-8z; Mon, 04 Dec 2023 22:08:02 +0000
Received: by outflank-mailman (input) for mailman id 647328;
 Mon, 04 Dec 2023 22:08:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8A84=HP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAH6e-0001Qj-An
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 22:08:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93de5bf8-92f1-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 23:07:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 797BE61408;
 Mon,  4 Dec 2023 22:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBEDC433C8;
 Mon,  4 Dec 2023 22:07:53 +0000 (UTC)
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
X-Inumbo-ID: 93de5bf8-92f1-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701727675;
	bh=Yj9s4ZlBlXNkKQ3M4mmvLhWZ849iVnYCzOnBOl9yV8Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Atv7C3hliiqneW6VcwPC5u55ltlXDlYXXm7lEL/YojYEqlJf8i9/WY6TmuZvZktUs
	 VO7Z9iCrsIXfGbNFTP/chbAgE8uioTHmg3xe4pUvDYCERJ0KTEmRipXkwzoiissTuf
	 Hewe9f6OsYnzqV2kjGqxd/d97F/etRZp/E4MS+6cRPwyn7NSj2uKMAkLdKAwdCM7BT
	 lBx1CPcNB+E4WHz9ihtpnrQfJnop0u/w2kTMR0orpWS+aJE+JDeFqmNKvlmqi55MiP
	 NSYl8AxagMGZflTo+nWRnSo0jLFe3R6ugY3nNdWaI+/V5MWpdrft/TCZMr4CVZRT7a
	 QbKeR49qkvBBQ==
Date: Mon, 4 Dec 2023 14:07:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v6 4/5] [FUTURE] xen/arm: enable vPCI for domUs
In-Reply-To: <ZW2wuqXW-DneUVi0@macbook>
Message-ID: <alpine.DEB.2.22.394.2312041333250.110490@ubuntu-linux-20-04-desktop>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com> <20231113222118.825758-5-stewart.hildebrand@amd.com> <ZWmkh0Xeaynh43N7@macbook> <alpine.DEB.2.22.394.2312011847520.110490@ubuntu-linux-20-04-desktop> <ZW2wuqXW-DneUVi0@macbook>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-63937670-1701725629=:110490"
Content-ID: <alpine.DEB.2.22.394.2312041333510.110490@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-63937670-1701725629=:110490
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2312041333511.110490@ubuntu-linux-20-04-desktop>

On Mon, 4 Dec 2023, Roger Pau Monné wrote:
> On Fri, Dec 01, 2023 at 06:56:32PM -0800, Stefano Stabellini wrote:
> > On Fri, 1 Dec 2023, Roger Pau Monné wrote:
> > > On Mon, Nov 13, 2023 at 05:21:13PM -0500, Stewart Hildebrand wrote:
> > > > @@ -1618,6 +1630,14 @@ int iommu_do_pci_domctl(
> > > >          bus = PCI_BUS(machine_sbdf);
> > > >          devfn = PCI_DEVFN(machine_sbdf);
> > > >  
> > > > +        if ( needs_vpci(d) && !has_vpci(d) )
> > > > +        {
> > > > +            printk(XENLOG_G_WARNING "Cannot assign %pp to %pd: vPCI support not enabled\n",
> > > > +                   &PCI_SBDF(seg, bus, devfn), d);
> > > > +            ret = -EPERM;
> > > > +            break;
> > > 
> > > I think this is likely too restrictive going forward.  The current
> > > approach is indeed to enable vPCI on a per-domain basis because that's
> > > how PVH dom0 uses it, due to being unable to use ioreq servers.
> > > 
> > > If we start to expose vPCI suport to guests the interface should be on
> > > a per-device basis, so that vPCI could be enabled for some devices,
> > > while others could still be handled by ioreq servers.
> > > 
> > > We might want to add a new flag to xen_domctl_assign_device (used by
> > > XEN_DOMCTL_assign_device) in order to signal whether the device will
> > > use vPCI.
> > 
> > Actually I don't think this is a good idea. I am all for flexibility but
> > supporting multiple different configurations comes at an extra cost for
> > both maintainers and contributors. I think we should try to reduce the
> > amount of configurations we support rather than increasing them
> > (especially on x86 where we have PV, PVH, HVM).
> 
> I think it's perfectly fine to initially require a domain to have all
> its devices either passed through using vPCI or ireqs, but the
> interface IMO should allow for such differentiation in the future.
> That's why I think introducing a domain wide vPCI flag might not be
> the best option going forward.
> 
> It would be perfectly fine for XEN_DOMCTL_assign_device to set a
> domain wide vPCI flag, iow:
> 
> if ( HYPERCALL_VPCI_FLAG_SET && !has_vpci(d) )
> {
>     if ( has_arch_pdevs(d) )
>     {
>         printk("All passthrough devices must use the same backend\n");
>         return -EINVAL;
>     }
> 
>     /* Set vPCI domain flag */
> }

That would be fine by me, but maybe we can avoid this change too. I was
imagining that vPCI would be enabled at domain creation, not at runtime.
And that vPCI would be enabled by default for all PVH guests (once we
are past the initial experimental phase.)


> We have already agreed that we want to aim for a setup where ioreqs
> and vPCI could be used for the same domain, but I guess you assumed
> that ioreqs would be used for emulated devices exclusively and vPCI
> for passthrough devices?

Yes, that's right


> Overall if we agree that ioreqs and vPCI should co-exist for a domain,
> I'm not sure there's much reason to limit ioreqs to only handle
> emulated devices, seems like an arbitrary limitation.

Reply below


> > I don't think we should enable IOREQ servers to handle PCI passthrough
> > for PVH guests and/or guests with vPCI. If the domain has vPCI, PCI
> > Passthrough can be handled by vPCI just fine. I think this should be a
> > good anti-feature to have (a goal to explicitly not add this feature) to
> > reduce complexity. Unless you see a specific usecase to add support for
> > it?
> 
> There are passthrough devices (GPUs) that might require some extra
> mediation on dom0 (like the Intel GVT-g thing) that would force the
> usage of ioreqs to passthrough.

From an architectural perspective, I think it would be cleaner, simpler
to maintain, and simpler to understand if Xen was the sole owner of the
PCI Root Complex and PCI config space mediation (implemented with vPCI).
IOREQ can be used for emulation and it works very well for that. At
least in my mind, that makes things much simpler.

I understand there are non-trivial cases, like virtual GPUs with
hardware access, but I don't classify those as passthrough. That's
because there isn't one device that gets fully assigned to the guest.
Instead, there is an emulated device (hence IOREQ) with certain MMIO
regions and interrupts that end up being directly mapped from real
hardware.

So I think it is natural in those cases to use IOREQ and it is also
natural to have QEMU remap MMIO/IRQs at runtime. From a vPCI
perspective, I hope it will mostly look as if the device is assigned to
Dom0. Even if it ends up being more complex than that, Rome wasn't
built in one day, and I don't think we should try to solve this problem
on day1 (as long as the interfaces are not stable interfaces).


> It's important that the interfaces we introduce are correct IMO,
> because that ends up reflecting on the configuration options that we
> expose to users on xl/libxl.  While both XEN_DOMCTL_createdomain and
> XEN_DOMCTL_assign_device are unstable interfaces, how the vPCI option
> gets placed there will ultimately influence how the option gets
> exposed in xl/libxl, and the interface there is relevant to keep
> stable for end user sanity.

I agree with you on the stable interfaces. The important part is not to
introduce changes to stable interfaces that could limit us in the
future. Specifically that includes xl and libxl, we need to be careful
there. But I don't see a single per-domain vPCI enable/disable option as
a problem. Let's say that in the future we have a mediated vGPU
implementation: if it works together with vPCI then the per-domain vPCI
option in libxl will be enabled (either explicitely or by default), if
it doesn't then vPCI will be disabled (either explicitely or by the
newer vGPU options.)

For *unstable* interfaces (XEN_DOMCTL_assign_device) I would rather wait
before adding more changes on top of them, not because I don't care
about the mediated GPU problem (we do have something similar at AMD),
but because I worry that if we try to change them now we might not do a
good enough job. I would prefer to wait until we know more about the
actual use case, ideally with code supporting it.

I think the difference in points of views comes from the fact that I see
vPCI as the default, QEMU only as a limited peripheral emulator (or
mediator for the vGPU case) but not in control. vPCI and QEMU are not
equal in my view. vPCI is in charge and always present if not in very
uncommon setups (even if we decide to hook it inside Xen by using
internal IOREQ interfaces). QEMU might come and go.

Now that I am writing this, I realize this is also why I wasn't too
happy with the idea of hooking vPCI using IOREQ. It makes them look as
if they are the same, while I don't they should be considered at the
same level of priority, criticality, safety, integration in the system,
etc.
--8323329-63937670-1701725629=:110490--

