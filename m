Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A49225B27
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jul 2020 11:17:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxRvS-0003Iw-1h; Mon, 20 Jul 2020 09:17:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UosC=A7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jxRvQ-0003Ir-ER
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 09:17:32 +0000
X-Inumbo-ID: d5ce2732-ca69-11ea-9f71-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5ce2732-ca69-11ea-9f71-12813bfff9fa;
 Mon, 20 Jul 2020 09:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595236650;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=761O2jMMTizDRhBkzusMXoTQ7elMaVRw7s3TgsyAkFw=;
 b=R2BpURaALpFkA6OdzqgxcuHIoonpIKH/5IrBNa2kYXHKEDKIzyRw/jkZ
 9CpTbC+IWhRcFqRMRsQR/HOQZjAvY8ad2ZWtQyCTHywjCAUQRQO8KjVtB
 sQ2dwkeNDHIg008qxKqqcjbXf/4fZSh+6FrKVd4LtQ1AJ4rGy+2AaOgQp 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: jsEwx8eF/OmsbTwmK8MGM8UqP2uVjfJDPI9CDm/4dCbbbhEE2F5Amjfr3YFy9TjJbqFh9Wc/Eb
 BKULP9pAKLZyLOB7ukILJ0UlkCCdc2+UFLxwFqc56dXi0At3zGRrKbaBLHBirsliwvcMWsgaFb
 kEzud1fTOXrH3b40gckDOxyI71FItiMPl7OftAX5XJdl3ex2WospZk2CJAzl0SWItu+JYyFq4W
 ON6XtNlCXZrwiYRKiUuo7NFlBMUXT4kbPmSgngGpZ8mgnrZi1cVbHZ+Jb2k9Gkx8NudB7xpuYb
 qkw=
X-SBRS: 2.7
X-MesageID: 23064256
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,374,1589256000"; d="scan'208";a="23064256"
Date: Mon, 20 Jul 2020 11:17:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr <olekstysh@gmail.com>
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
Message-ID: <20200720091722.GF7191@Air-de-Roger>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 17, 2020 at 09:34:14PM +0300, Oleksandr wrote:
> On 17.07.20 18:00, Roger Pau Monné wrote:
> > On Fri, Jul 17, 2020 at 05:11:02PM +0300, Oleksandr Tyshchenko wrote:
> > > requires
> > > some implementation to forward guest MMIO access to a device model. And as
> > > it
> > > turned out the Xen on x86 contains most of the pieces to be able to use that
> > > transport (via existing IOREQ concept). Julien has already done a big amount
> > > of work in his PoC (xen/arm: Add support for Guest IO forwarding to a
> > > device emulator).
> > > Using that code as a base we managed to create a completely functional PoC
> > > with DomU
> > > running on virtio block device instead of a traditional Xen PV driver
> > > without
> > > modifications to DomU Linux. Our work is mostly about rebasing Julien's
> > > code on the actual
> > > codebase (Xen 4.14-rc4), various tweeks to be able to run emulator
> > > (virtio-disk backend)
> > > in other than Dom0 domain (in our system we have thin Dom0 and keep all
> > > backends
> > > in driver domain),
> > How do you handle this use-case? Are you using grants in the VirtIO
> > ring, or rather allowing the driver domain to map all the guest memory
> > and then placing gfn on the ring like it's commonly done with VirtIO?
> 
> Second option. Xen grants are not used at all as well as event channel and
> Xenbus. That allows us to have guest
> 
> *unmodified* which one of the main goals. Yes, this may sound (or even
> sounds) non-secure, but backend which runs in driver domain is allowed to
> map all guest memory.

Supporting unmodified guests is certainly a fine goal, but I don't
think it's incompatible with also trying to expand the spec in
parallel in order to support grants in a negotiated way (see below).

That way you could (long term) regain some of the lost security.

> > Do you have any plans to try to upstream a modification to the VirtIO
> > spec so that grants (ie: abstract references to memory addresses) can
> > be used on the VirtIO ring?
> 
> But VirtIO spec hasn't been modified as well as VirtIO infrastructure in the
> guest. Nothing to upsteam)

OK, so there's no intention to add grants (or a similar interface) to
the spec?

I understand that you want to support unmodified VirtIO frontends, but
I also think that long term frontends could negotiate with backends on
the usage of grants in the shared ring, like any other VirtIO feature
negotiated between the frontend and the backend.

This of course needs to be on the spec first before we can start
implementing it, and hence my question whether a modification to the
spec in order to add grants has been considered.

It's fine to say that you don't have any plans in this regard.

> 
> > 
> > > misc fixes for our use-cases and tool support for the
> > > configuration.
> > > Unfortunately, Julien doesn’t have much time to allocate on the work
> > > anymore,
> > > so we would like to step in and continue.
> > > 
> > > *A few word about the Xen code:*
> > > You can find the whole Xen series at [5]. The patches are in RFC state
> > > because
> > > some actions in the series should be reconsidered and implemented properly.
> > > Before submitting the final code for the review the first IOREQ patch
> > > (which is quite
> > > big) will be split into x86, Arm and common parts. Please note, x86 part
> > > wasn’t
> > > even build-tested so far and could be broken with that series. Also the
> > > series probably
> > > wants splitting into adding IOREQ on Arm (should be focused first) and
> > > tools support
> > > for the virtio-disk (which is going to be the first Virtio driver)
> > > configuration before going
> > > into the mailing list.
> > Sending first a patch series to enable IOREQs on Arm seems perfectly
> > fine, and it doesn't have to come with the VirtIO backend. In fact I
> > would recommend that you send that ASAP, so that you don't spend time
> > working on the backend that would likely need to be modified
> > according to the review received on the IOREQ series.
> 
> Completely agree with you, I will send it after splitting IOREQ patch and
> performing some cleanup.
> 
> However, it is going to take some time to make it properly taking into the
> account
> 
> that personally I won't be able to test on x86.

We have gitlab and the osstest CI loop (plus all the reviewers) so we
should be able to spot any regressions. Build testing on x86 would be
nice so that you don't need to resend to fix build issues.

> 
> > 
> > > What I would like to add here, the IOREQ feature on Arm could be used not
> > > only
> > > for implementing Virtio, but for other use-cases which require some
> > > emulator entity
> > > outside Xen such as custom PCI emulator (non-ECAM compatible) for example.
> > > 
> > > *A few word about the backend(s):*
> > > One of the main problems with Virtio in Xen on Arm is the absence of
> > > “ready-to-use” and “out-of-Qemu” Virtio backends (I least am not aware of).
> > > We managed to create virtio-disk backend based on demu [3] and kvmtool [4]
> > > using
> > > that series. It is worth mentioning that although Xenbus/Xenstore is not
> > > supposed
> > > to be used with native Virtio, that interface was chosen to just pass
> > > configuration from toolstack
> > > to the backend and notify it about creating/destroying Guest domain (I
> > > think it is
> > I would prefer if a single instance was launched to handle each
> > backend, and that the configuration was passed on the command line.
> > Killing the user-space backend from the toolstack is fine I think,
> > there's no need to notify the backend using xenstore or any other
> > out-of-band methods.
> > 
> > xenstore has proven to be a bottleneck in terms of performance, and it
> > would be better if we can avoid using it when possible, specially here
> > that you have to do this from scratch anyway.
> 
> Let me elaborate a bit more on this.
> 
> In current backend implementation, the Xenstore is *not* used for
> communication between backend (VirtIO device) and frontend (VirtIO driver),
> frontend knows nothing about it.
> 
> Xenstore was chosen as an interface in order to be able to pass
> configuration from toolstack in Dom0 to backend which may reside in other
> than Dom0 domain (DomD in our case),

There's 'xl devd' which can be used on the driver domain to spawn
backends, maybe you could add the logic there so that 'xl devd' calls
the backend executable with the required command line parameters, so
that the backend itself doesn't need to interact with xenstore in any
way?

That way in the future we could use something else instead of
xenstore, like Argo for instance in order to pass the backend data
from the control domain to the driver domain.

> also looking into the Xenstore entries backend always knows when the
> intended guest is been created/destroyed.

xl devd should also do the killing of backends anyway when a domain is
destroyed, or else malfunctioning user-space backends could keep
running after the domain they are serving is destroyed.

> I may mistake, but I don't think we can avoid using Xenstore (or other
> interface provided by toolstack) for the several reasons.
> 
> Besides a virtio-disk configuration (a disk to be assigned to the guest, R/O
> mode, etc), for each virtio-mmio device instance
> 
> a pair (mmio range + IRQ) are allocated by toolstack at the guest
> construction time and inserted into virtio-mmio device tree node
> 
> in the guest device tree. And for the backend to properly operate these
> variable parameters are also passed to the backend via Xenstore.

I think you could pass all these parameters as command line arguments
to the backend?

> The other reasons are:
> 
> 1. Automation. With current backend implementation we don't need to pause
> guest right after creating it, then go to the driver domain and spawn
> backend and
> 
> after that go back to the dom0 and unpause the guest.

xl devd should be capable of handling this for you on the driver
domain.

> 2. Ability to detect when guest with involved frontend has gone away and
> properly release resource (guest destroy/reboot).
> 
> 3. Ability to (re)connect to the newly created guest with involved frontend
> (guest create/reboot).
> 
> 4. What is more that having Xenstore support the backend is able to detect
> the dom_id it runs into and the guest dom_id, there is no need pass them via
> command line.
> 
> 
> I will be happy to explain in details after publishing backend code).

As I'm not the one doing the work I certainly won't stop you from
using xenstore on the backend. I would certainly prefer if the backend
gets all the information it needs from the command line so that the
configuration data is completely agnostic to the transport layer used
to convey it.

Thanks, Roger.

