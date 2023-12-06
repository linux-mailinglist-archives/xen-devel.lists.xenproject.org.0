Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D38E4806503
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 03:35:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648776.1012733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAhkP-00034S-Dr; Wed, 06 Dec 2023 02:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648776.1012733; Wed, 06 Dec 2023 02:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAhkP-00032Y-Av; Wed, 06 Dec 2023 02:34:49 +0000
Received: by outflank-mailman (input) for mailman id 648776;
 Wed, 06 Dec 2023 02:34:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AMAt=HR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rAhkN-00032Q-RD
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 02:34:47 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 043785d0-93e0-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 03:34:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7B883CE114D;
 Wed,  6 Dec 2023 02:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A9FC433C7;
 Wed,  6 Dec 2023 02:34:37 +0000 (UTC)
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
X-Inumbo-ID: 043785d0-93e0-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701830079;
	bh=gKip2WOPPSDpHnDkWwSUh1dK9OXCb4ajgzoFq5mAdOY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pv1WtZKK2STWBtHJlSBEmuu6aWl0zeJ9nPioSu563cI4Aynql2R49wW0GiDCl0xhg
	 HVULD2Cm8KyP1YZu+CING6txHSf5L2Xj3vXW+fPVSDuVmADpJrwrCVJuCBR5SJeKyO
	 UP58DlD6c+iTT71k/mcjH/zxgQoZyaiEzDOPsPAlbBEnS1HkHmXN5fj78FpBA7LLmV
	 fR17ckAFyWtWuGfgVjP/2AhEgK5v/I2mSuL9QKfIonxQld9r6TcEY+B7oWGC1Onmm6
	 MvbzNjYw6ANsXgIubJp1LKQKXPqxkhZb8ESBtViecHWJEbZg0vy+khVOTcTauQh9t2
	 FMeIiP8YtuKMQ==
Date: Tue, 5 Dec 2023 18:34:35 -0800 (PST)
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
In-Reply-To: <ZW8EkQLTwEEK6fXC@macbook>
Message-ID: <alpine.DEB.2.22.394.2312051529500.110490@ubuntu-linux-20-04-desktop>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com> <20231113222118.825758-5-stewart.hildebrand@amd.com> <ZWmkh0Xeaynh43N7@macbook> <alpine.DEB.2.22.394.2312011847520.110490@ubuntu-linux-20-04-desktop> <ZW2wuqXW-DneUVi0@macbook>
 <alpine.DEB.2.22.394.2312041333250.110490@ubuntu-linux-20-04-desktop> <ZW8EkQLTwEEK6fXC@macbook>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1512514997-1701819442=:110490"
Content-ID: <alpine.DEB.2.22.394.2312051537410.110490@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1512514997-1701819442=:110490
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2312051537411.110490@ubuntu-linux-20-04-desktop>

On Tue, 5 Dec 2023, Roger Pau Monné wrote:
> > > > I don't think we should enable IOREQ servers to handle PCI passthrough
> > > > for PVH guests and/or guests with vPCI. If the domain has vPCI, PCI
> > > > Passthrough can be handled by vPCI just fine. I think this should be a
> > > > good anti-feature to have (a goal to explicitly not add this feature) to
> > > > reduce complexity. Unless you see a specific usecase to add support for
> > > > it?
> > > 
> > > There are passthrough devices (GPUs) that might require some extra
> > > mediation on dom0 (like the Intel GVT-g thing) that would force the
> > > usage of ioreqs to passthrough.
> > 
> > From an architectural perspective, I think it would be cleaner, simpler
> > to maintain, and simpler to understand if Xen was the sole owner of the
> > PCI Root Complex and PCI config space mediation (implemented with vPCI).
> > IOREQ can be used for emulation and it works very well for that. At
> > least in my mind, that makes things much simpler.
> 
> But IOREQ already has all the code to mediate accesses to the PCI
> config space, and the interface to register separate servers for
> different PCI devices.
> 
> We would then need to duplicate this internally for vPCI, so that vPCI
> could forward accesses to IOREQ just for IOREQ to forward to yet a
> different component?  Seems like a lot of duplication for no benefit.

[...] 
 
> Also, you seem to confabulate IOREQ with QEMU, while the latter is
> indeed an user of IOREQ, I do see IOREQ as a simple resource mediator
> inside of Xen, that has the ability to forward such accesses to
> external emulators using an hypercall interface.

We have been using different terminologies until now. IOREQ could mean
anything from the ABI interface, the emulator side (QEMU) or the
hypervisor side (Xen). I am going to align with your wording and say:

IOREQ: only the IOREQ implementation in Xen (xen/common/ioreq.c)
IOREQ server: QEMU or alternative

I think it is OK if we use IOREQ internally within Xen to hook vPCI with
PCI config space accesses and emulation. I don't think it is a good idea
to attempt to enable IOREQ servers (e.g. QEMU) to implement PCI
Passthrough when vPCI is also enabled for the domain, at least
initially.


> > I understand there are non-trivial cases, like virtual GPUs with
> > hardware access, but I don't classify those as passthrough. That's
> > because there isn't one device that gets fully assigned to the guest.
> > Instead, there is an emulated device (hence IOREQ) with certain MMIO
> > regions and interrupts that end up being directly mapped from real
> > hardware.
> > 
> > So I think it is natural in those cases to use IOREQ and it is also
> > natural to have QEMU remap MMIO/IRQs at runtime. From a vPCI
> > perspective, I hope it will mostly look as if the device is assigned to
> > Dom0. Even if it ends up being more complex than that, Rome wasn't
> > built in one day, and I don't think we should try to solve this problem
> > on day1 (as long as the interfaces are not stable interfaces).
> 
> I don't see IOREQ as dealing explicitly with emulation.  Yes, it does
> allow for emulators to be implemented in user-space, but at the end
> it's just an interface that allows forwarding accesses to certain
> resources (for the case we are speaking about here, PCI config space)
> to entities that registered as handlers.
> 
> vPCI OTOH just deals with a very specific resource (PCI config space)
> and only allows internal handlers to be registered on a byte
> granularity.
> 
> So your proposal would be to implement a hierarchy like the one on the
> diagram below:
> 
>     ┌────────┐ ┌──────────┐ ┌──────────────────┐
>     │ Memory │ │ IO Ports │ │ PCI config space │
>     └───────┬┘ └┬─────────┘ └───┬──────────────┘
>             │   │               │
>             │   │           ┌───┴──┐
>             │   │           │ vPCI │
>             │   │           └─┬──┬─┘
>          ┌──┴───┴┐            │  │
>          │ IOREQ ├────────────┘  │
>          └────┬──┘               │
>               │                  │
>  ┌────────────┴──┐              ┌┴──────────────┐
>  │ IOREQ servers │              │ vPCI handlers │
>  └───────────────┘              └───────────────┘

Yes


> While what I'm proposing would look like:
> 
>     ┌────────┐ ┌──────────┐ ┌──────────────────┐
>     │ Memory │ │ IO Ports │ │ PCI config space │
>     └────┬───┘ └────┬─────┘ └────────┬─────────┘
>          │          │                │
>          └─────┬────┴────┬───────────┘
>                │  IOREQ  │
>                └─┬─────┬─┘
>                  │     │
>  ┌───────────────┤     └────┬──────┐
>  │ IOREQ servers │          │ vPCI │
>  └───────────────┘          └───┬──┘
>                                 │
>                             ┌───┴───────────┐
>                             │ vPCI handlers │
>                             └───────────────┘

I don't have a major problem with this, but I find it less clear than
the first one.

Let's say that all domains are PVH (or ARM guests). QEMU is running in
Dom0. If QEMU does emulation, that's fine. If QEMU implements PCI
Passthrough then QEMU uses libpci to do PCI config space reads and
write, which go to the Linux kernel in Dom0, which ends up doing PCI
config space reads and writes on the device, and that goes via vPCI in
Xen (vPCI for Dom0). So actually vPCI is still present. It is a lot
simpler to think that vPCI is in charge of all mediated PCI config space
accesses rather than thinking that for the same device vPCI handles PCI
config space accesses for Dom0 but not for DomU.

It is not my preference but I am OK to compromise and go ahead with the
architecture you proposed but please let's keep IOREQ servers out of the
PCI Passthrough picture at least initially.


> I'm obviously biased, but I think the latter is cleaner, and allows
> all resources to be arbitrated by the same component (IOREQ).
> 
> If the concern is about the IOREQ hypercall interface, it would be
> fine to introduce an option that limit IOREQs to internal users
> (vPCI) without supporting external IOREQ servers.
> 
> Think of IOREQ as a resource mediator inside of Xen, that just does
> the PCI address decoding and forwards the access to the interested
> party, either an external IOREQ server or vPCI.

The part about IOREQ (xen/common/ioreq.c) being a resource mediator is
OKish.

I had many discussions over the years with various members of the larger
open source embedded community (Linaro, etc.) and the problem is that
when one says "IOREQ" typically people think of QEMU or other userspace
emulators. They don't think of the Xen side of it. This becomes very
relevant here because Xen is the only part of the system that is
getting safety-certified and it is important to convey the message that
nothing else in required to be safety-certified to have a fully working
Xen system that supports PCI Passthrough.

In short, it is important that the community doesn't get the idea that
QEMU needs to be safety-certified to have PCI Passthrough working
correctly with Xen in a safety scenario.

 
> > > It's important that the interfaces we introduce are correct IMO,
> > > because that ends up reflecting on the configuration options that we
> > > expose to users on xl/libxl.  While both XEN_DOMCTL_createdomain and
> > > XEN_DOMCTL_assign_device are unstable interfaces, how the vPCI option
> > > gets placed there will ultimately influence how the option gets
> > > exposed in xl/libxl, and the interface there is relevant to keep
> > > stable for end user sanity.
> > 
> > I agree with you on the stable interfaces. The important part is not to
> > introduce changes to stable interfaces that could limit us in the
> > future. Specifically that includes xl and libxl, we need to be careful
> > there. But I don't see a single per-domain vPCI enable/disable option as
> > a problem. Let's say that in the future we have a mediated vGPU
> > implementation: if it works together with vPCI then the per-domain vPCI
> > option in libxl will be enabled (either explicitely or by default), if
> > it doesn't then vPCI will be disabled (either explicitely or by the
> > newer vGPU options.)
> 
> If vPCI is hooked into IOREQ there won't be a need anymore to register
> the vPCI config space traps, as that would be done by IOREQ, and hence
> vPCI managed devices could be registered at runtime with IOREQ.  IOW:
> there won't be a need anymore to signal at domain creation whether
> vPCI is intended to be used or not.

For safety, we have requirements to specify everything statically before
boot so typically anything dynamic is a problem.


> We would obviously need to enable IOREQ for all domains with IOMMU
> enabled, as it would be IOREQ that register the PCI config space
> handlers.

This bit might be OK


> > For *unstable* interfaces (XEN_DOMCTL_assign_device) I would rather wait
> > before adding more changes on top of them, not because I don't care
> > about the mediated GPU problem (we do have something similar at AMD),
> > but because I worry that if we try to change them now we might not do a
> > good enough job. I would prefer to wait until we know more about the
> > actual use case, ideally with code supporting it.
> > 
> > I think the difference in points of views comes from the fact that I see
> > vPCI as the default, QEMU only as a limited peripheral emulator (or
> > mediator for the vGPU case) but not in control. vPCI and QEMU are not
> > equal in my view. vPCI is in charge and always present if not in very
> > uncommon setups (even if we decide to hook it inside Xen by using
> > internal IOREQ interfaces). QEMU might come and go.
> 
> Xen needs a single component that mediates accesses to resources,
> whether that's IOREQ, or something else I don't really care that much.
> Having vPCI mediate accesses to the PCI config space, and IOREQ to the
> memory (and on x86 IO port) space just seems awfully complicated for
> AFAICT no real benefit.
>
> > Now that I am writing this, I realize this is also why I wasn't too
> > happy with the idea of hooking vPCI using IOREQ. It makes them look as
> > if they are the same, while I don't they should be considered at the
> > same level of priority, criticality, safety, integration in the system,
> > etc.
> 
> I feel there are some fears with IOREQ from a safety PoV?  The code
> that does the resource multiplexing is small, and as said above if
> there are safety concerns with the hypercall interface it would be
> fine to limit it's usage to internal handlers only.

Yes it is about safety. Everything within Xen will be safety-certified,
hence usable in a safety critical scenario, everything outside of Xen
might not.

The fear is not on the IOREQ itself because xen/common/ioreq.c is part
of the certification scope. The fear is that IOREQ servers (e.g. QEMU)
are somehow in the picture when we discuss safety architectures with PCI
Passthrough, or that IOREQ servers could interfere with vPCI. By
"interfere" I mean that QEMU running in dom0 (a deprivileged dom0) will
be able to cause a malfunction in Xen vPCI.

Yes, limiting the hypercall interface would help in that regard because
it would limit Xen exposure.
--8323329-1512514997-1701819442=:110490--

