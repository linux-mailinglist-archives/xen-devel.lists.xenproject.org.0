Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9ED2421EF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 23:26:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5blu-0005q3-TS; Tue, 11 Aug 2020 21:25:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZDC2=BV=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k5blt-0005py-Mz
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 21:25:25 +0000
X-Inumbo-ID: 8f72a595-63e2-4fea-9769-41d16458a3fb
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f72a595-63e2-4fea-9769-41d16458a3fb;
 Tue, 11 Aug 2020 21:25:23 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597181121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m7u9iZM4bgu8PK3FkxHuv+64l2WKnfoRB2cXVRaJnw4=;
 b=hHMPyBCCFhlvypwiG0tlGoOocC/6/w0Nr1YrzlsbqBj4aPtPO/SivNrJhDJEsTmJyGBIdn
 wK0wPPSyrn7SNhuGozY7SxeMQGtH3iWuZKg1GkBrbc8IlgZ2Gx3o6VXa3NqbhOwIfzBaRX
 DDw0wFU1fbPEzxG7beKNyXGeTrMpfuk2yUHezKaaKjlqKA7w5mpEXFXBx76TWqQTGw4fVl
 ChhvpDvDISgZQd4H5KwPka7VdwhciDFvo1qFJDfsKn/qZvzrO8XXhGQCqQFRBZ2c1Gi7gs
 3EM4eZN6+l+aw+/4T6WNsCaZ0eoOLyv/0QwkRGu2PU270twsSL5THasIK9zWdw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597181121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m7u9iZM4bgu8PK3FkxHuv+64l2WKnfoRB2cXVRaJnw4=;
 b=ELIHt1uF/dwRXMv9lB5SfQSoe8rLSoQwm3SbukE5hxSYXAPouA1PkOj1GSCxGPJ4+5QGfT
 SzYNpK6OM0WGwOBw==
To: "Dey\, Megha" <megha.dey@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH RFC v2 02/18] irq/dev-msi: Add support for a new DEV_MSI
 irq domain
In-Reply-To: <8a8a853c-cbe6-b19c-f6ba-c8cdeda84a36@intel.com>
References: <87h7tcgbs2.fsf@nanos.tec.linutronix.de> <87ft8uxjga.fsf@nanos>
 <87d03x5x0k.fsf@nanos.tec.linutronix.de>
 <8a8a853c-cbe6-b19c-f6ba-c8cdeda84a36@intel.com>
Date: Tue, 11 Aug 2020 23:25:20 +0200
Message-ID: <87bljg7u4f.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "Kumar, 
 Sanjay K" <sanjay.k.kumar@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hansen,
 Dave" <dave.hansen@intel.com>, "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "hpa@zytor.com" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "Liu, Yi L" <yi.l.liu@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, "netanelg@mellanox.com" <netanelg@mellanox.com>,
 Marc Zyngier <maz@kernel.org>, "Lin, Jing" <jing.lin@intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "Ortiz, Samuel" <samuel.ortiz@intel.com>,
 "yan.y.zhao@linux.intel.com" <yan.y.zhao@linux.intel.com>,
 xen-devel@lists.xenproject.org, "shahafs@mellanox.com" <shahafs@mellanox.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "parav@mellanox.com" <parav@mellanox.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "Lu, 
 Baolu" <baolu.lu@intel.com>, Juergen Gross <jgross@suse.com>, "Luck,
 Tony" <tony.luck@intel.com>, "Hossain, Mona" <mona.hossain@intel.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

"Dey, Megha" <megha.dey@intel.com> writes:
> On 8/11/2020 2:53 AM, Thomas Gleixner wrote:
>>> And the annoying fact that you need XEN support which opens another can
>>> of worms...
>
> hmm I am not sure why we need Xen support... are you referring to idxd 
> using xen?

What about using IDXD when you are running on XEN? I might be missing
something and IDXD/IMS is hypervisor only, but that still does not solve
this problem on bare metal:

>> x86 still does not associate the irq domain to devices at device
>> discovery time, i.e. the device::msi_domain pointer is never
>> populated.

We can't do that right now due to the way how X86 PCI/MSI allocation
works and being able to do so would make things consistent and way
simpler even for your stuff.

>> The right thing to do is to convert XEN MSI support over to proper irq
>> domains. This allows to populate device::msi_domain which makes a lot of
>> things simpler and also more consistent.
>
> do you think this cleanup is to be a precursor to my patches? I could 
> look into it but I am not familiar with the background of Xen
>
> and this stuff. Can you please provide further guidance on where to
> look

As I said:

>> So to support this new fangled device MSI stuff we'd need yet more
>> x86/xen specific arch_*msi_irqs() indirection and hackery, which is not
>> going to happen.

  git grep arch_.*msi_irq arch/x86

This indirection prevents storing the irq_domain pointer in the device
at probe/detection time. Native code already uses irq domains for
PCI/MSI but we can't exploit the full potential because then
pci_msi_setup_msi_irqs() would never end up in arch_setup_msi_irqs()
which breaks XEN.

I was reminded of that nastiness when I was looking at sensible ways to
integrate this device MSI maze proper.

From a conceptual POV this stuff, which is not restricted to IDXD at all,
looks like this:

           ]-------------------------------------------|
PCI BUS -- | PCI device                                |
           ]-------------------|                       |
           | Physical function |                       |
           ]-------------------|                       |
           ]-------------------|----------|            |
           | Control block for subdevices |            |
           ]------------------------------|            |
           |            | <- "Subdevice BUS"           |
           |            |                              |
           |            |-- Subddevice 0               | 
           |            |-- Subddevice 1               | 
           |            |-- ...                        | 
           |            |-- Subddevice N               | 
           ]-------------------------------------------|

It does not matter whether this is IDXD with it's magic devices or a
network card with a gazillion of queues. Conceptually we need to look at
them as individual subdevices.

And obviously the above picture gives you the topology. The physical
function device belongs to PCI in all aspects including the MSI
interrupt control. The control block is part of the PCI device as well
and it even can have regular PCI/MSI interrupts for its own
purposes. There might be devices where the Physical function device does
not exist at all and the only true PCI functionality is the control
block to manage subdevices. That does not matter and does not change the
concept.

Now the subdevices belong topology wise NOT to the PCI part. PCI is just
the transport they utilize. And their irq domain is distinct from the
PCI/MSI domain for reasons I explained before.

So looking at it from a Linux perspective:

  pci-bus -> PCI device (managed by PCI/MSI domain)
               - PF device
               - CB device (hosts DEVMSI domain)
                    | "Subdevice bus"
                    | - subdevice
                    | - subdevice
                    | - subdevice

Now you would assume that figuring out the irq domain which the DEVMSI
domain serving the subdevices on the subdevice bus should take as parent
is pretty trivial when looking at the topology, right?

CB device's parent is PCI device and we know that PCI device MSI is
handled by the PCI/MSI domain which is either system wide or per IR
unit.

So getting the relevant PCI/MSI irq domain is as simple as doing:

   pcimsi_domain = pcidevice->device->msi_domain;

and then because we know that this is a hierarchy the parent domain of
pcimsi_domain is the one which is the parent of our DEVMSI domain, i.e.:

   parent = pcmsi_domain->parent;

Obvious, right?

What's not so obvious is that pcidevice->device->msi_domain is not
populated on x86 and trying to get the parent from there is a NULL
pointer dereference which does not work well.

So you surely can hack up some workaround for this, but that's just
proliferating crap. We want this to be consistent and there is
absolutely no reason why that network card with the MSI storage in the
queue data should not work on any other architecture.

We do the correct association already for IOMMU and whatever topological
stuff is attached to (PCI) devices on probe/detection time so making it
consistent for irq domains is just a logical consequence and matter of
consistency.

Back in the days when x86 was converted to hierarchical irq domains in
order to support I/O APIC hotplug this workaround was accepted to make
progress and it was meant as a transitional step. Of course after the
goal was achieved nobody @Intel cared anymore and so far this did not
cause big problems. But now it does and we really want to make this
consistent first.

And no we are not making an exception for IDXD either just because
that's Intel only. Intel is not special and not exempt from cleaning
stuff up before adding new features especially not when the stuff to
cleanup is a leftover from Intel itself. IOW, we are not adding more
crap on top of crap which should not exists anymore.

It's not rocket science to fix this. All it needs is to let XEN create
irq domains and populate them during init.

On device detection/probe the proper domain needs to be determined which
is trivial and then stored in device->msi_domain. That makes
arch_.*_msi_irq() go away and a lot of code just simpler.

Thanks,

        tglx

