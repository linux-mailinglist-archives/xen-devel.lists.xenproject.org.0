Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F93986920
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 00:22:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804645.1215690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1staNU-00029N-6P; Wed, 25 Sep 2024 22:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804645.1215690; Wed, 25 Sep 2024 22:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1staNU-000276-3R; Wed, 25 Sep 2024 22:20:56 +0000
Received: by outflank-mailman (input) for mailman id 804645;
 Wed, 25 Sep 2024 22:20:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYkR=QX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1staNS-000270-JL
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 22:20:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bf8fcb3-7b8c-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 00:20:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5772A5C0133;
 Wed, 25 Sep 2024 22:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4DF5C4CEC3;
 Wed, 25 Sep 2024 22:20:48 +0000 (UTC)
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
X-Inumbo-ID: 6bf8fcb3-7b8c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727302850;
	bh=EkGK6cqCAU8imVUP/34QTLLRkMcYD8ChRWZFf7fKjt4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ac+ox0SCcY/y8yErrUc5MzDjl/xwdBnCJnNbWHbAixG6pTNM646cLKilssAWXx6SV
	 RwiFKFvBmUdHv9jOOICcQJdJlyYU19NXLNbiZI9Xsmhfe3uGuW19F+nRmvrtkbkklb
	 hJ2a/rmtQSMnmw6HhH6fhRuXLsmC9de0fMYi5tKtrpAMWKg1OGEKv/YKM8khTi+4n8
	 PzA3hhIpacDIc1oxU+HQz6/VjKovBBa/kTl2If0UKx8Yweun4//p9Bl938SyVDvtB7
	 wWYSwXd39XbDgUO8hAN+5c0t5YVTVrzEHJhAtM7QQuir0aauZzLaaRbRGMTV4C4bxl
	 4/UW1NI+5w4Gg==
Date: Wed, 25 Sep 2024 15:20:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    dpsmith@apertussolutions.com, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v1 3/6] xen/arm: create dom0less virtio-pci DT node
In-Reply-To: <f7f6cf0a-5828-4053-bce2-f27df0727ab1@xen.org>
Message-ID: <alpine.DEB.2.22.394.2409251207220.1417852@ubuntu-linux-20-04-desktop>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com> <20240924162359.1390487-4-edgar.iglesias@gmail.com> <ce21a173-61f4-42d5-aa72-5b50135e6d76@xen.org> <ZvQ7mf9MbmSyC6RB@zapote> <d897124b-29c7-4aac-86bf-f1bec1aeade4@xen.org> <ZvQ-AK--W7sWom7r@zapote>
 <CAJy5ezpLVciE0ENGYtC4cwJ7U4rPTR4E68M+vq=2jBgK2it3zg@mail.gmail.com> <f7f6cf0a-5828-4053-bce2-f27df0727ab1@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1143422662-1727291269=:1417852"
Content-ID: <alpine.DEB.2.22.394.2409251208080.1417852@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1143422662-1727291269=:1417852
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2409251208081.1417852@ubuntu-linux-20-04-desktop>

On Wed, 25 Sep 2024, Julien Grall wrote:
> Hi Edgar,
> 
> On 25/09/2024 17:49, Edgar E. Iglesias wrote:
> > On Wed, Sep 25, 2024 at 10:44 AM Edgar E. Iglesias <edgar.iglesias@amd.com>
> > wrote:
> > 
> > > On Wed, Sep 25, 2024 at 05:38:13PM +0100, Julien Grall wrote:
> > > > Hi Edgar,
> > > > 
> > > > On 25/09/2024 17:34, Edgar E. Iglesias wrote:
> > > > > On Wed, Sep 25, 2024 at 08:44:41AM +0100, Julien Grall wrote:
> > > > > > Hi,
> > > > > > On 24/09/2024 17:23, Edgar E. Iglesias wrote:
> > > > > > > From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > > > > > > 
> > > > > > > When virtio-pci is specified in the dom0less domU properties,
> > > create a
> > > > > > > virtio-pci node in the guest's device tree. Set up an mmio handler
> > > with
> > > > > > > a register for the guest to poll when the backend has connected
> > > > > > > and
> > > > > > > virtio-pci bus is ready to be probed. Grant tables may be used by
> > > > > > > specifying virtio-pci = "grants";.
> > > > > > > 
> > > > > > > [Edgar: Use GPEX PCI INTX interrupt swizzling (from PCI specs).
> > > > > > >     Make grants iommu-map cover the entire PCI bus.
> > > > > > >     Add virtio-pci-ranges to specify memory-map for direct-mapped
> > > guests.
> > > > > > >     Document virtio-pci dom0less fdt bindings.]
> > > > > > > Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> > > > > > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > > > > > ---
> > > > > > >     docs/misc/arm/device-tree/booting.txt |  21 +++
> > > > > > >     xen/arch/arm/dom0less-build.c         | 238
> > > ++++++++++++++++++++++++++
> > > > > > >     xen/arch/arm/include/asm/kernel.h     |  15 ++
> > > > > > >     3 files changed, 274 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/docs/misc/arm/device-tree/booting.txt
> > > b/docs/misc/arm/device-tree/booting.txt
> > > > > > > index 3a04f5c57f..82f3bd7026 100644
> > > > > > > --- a/docs/misc/arm/device-tree/booting.txt
> > > > > > > +++ b/docs/misc/arm/device-tree/booting.txt
> > > > > > > @@ -276,6 +276,27 @@ with the following properties:
> > > > > > >         passed through. This option is the default if this
> > > > > > > property
> > > is missing
> > > > > > >         and the user does not provide the device partial device
> > > tree for the domain.
> > > > > > > +- virtio-pci
> > > > > > 
> > > > > > Similar question to the other patches, why is this specific to
> > > virtio PCI?
> > > > > > QEMU (or another device module) is free to emulate whatever it wants
> > > behind
> > > > > > the PCI hosbtridge.
> > > > > 
> > > > > There's no hard limitatino to only virtio-pci devices it's more of a
> > > > > recommendation that PVH guests should not use "emulated" devices but
> > > > > there's nothing stopping it.
> > > > 
> > > > Could you provide a bit more details where this requirement is coming
> > > from?
> > > > For instance, I would expect we would need to do some emulation to boot
> > > > Windows on Arm.
> > > > 
> > > 
> > > I see. I guess it just came from my mental model, I thought part of the
> > > philosophy behind PVH was to avoid emulated devices and use
> > > paravirualized (virtio or something else) or passthrough whereever
> > > possible (except for the basic set of devices needed like vGIC, vuart,
> > > MMU).
> > > 
> > 
> > For  example, we would recommend users to use virtio-net in favor of an
> > emulated eepro1000 or whatever other NIC models available in QEMU.
> 
> Indeed. I would always recommend user to use virtio-net over eepro1000.
> 
> > But there is no hard requirement nor limitation, a user can connect any
> > available PCI device from the QEMU set.
> 
> We need to be clear about what we are exposing to the guest. With this patch
> we will describe a PCI hostbridge in Device Tree (well it is an empty region
> we hope the Device Model to emulate at some point). But the hypervisor will
> not create the device model. Instead, you expect the user/integrator to have
> extra script to launch a Device Model (So it may not even be a hostbridge).
> 
> > 
> > Another thing we're looking to do is to minimize the QEMU build (Kconfig +
> > configure flags) to create a small build with only the stuff needed for
> > virtio-pci.
> 
> It is nice to have a cut down version of QEMU :). However, Xen doesn't care
> about the device model used for the emulation. I have seen some specialized DM
> in the wild (and used them while I was working on disaggregating the DM).
> 
> Anyway, while I understand this approach works in tailored environment, I am
> not convinced this works for a more general approach. The two options I would
> rather consider are:
>   1. Allow the device model to receive access for a single PCI device (IOW
> hook into vPCI).
>   2. Find a way to let the user provide the binding (maybe in a partial
> device-tree) + the list of Interrupts/MMIO that would be emulated by QEMU.
> 
> The second approach might be another way to get a second hostbridge in your
> use case while giving a bit more flexibility in what can be done (thinking
> about disagreggated environment).

Thank you for the suggestion on the second option, I think that is
close to what we intended. Let me add a few more details.

There has been a significant trend toward using virtio for all virtual
interfaces in automotive and other industries for several years now.
While I'm not entirely sure about Windows, all the operating systems we
work with (e.g. Android, RTOSes) are optimizing for virtio interfaces.
The expectation is that guests will either access physical devices or
virtio devices. I mention this in response to the specialized vs.
general approach - virtio is becoming (or has already become) the
standard, at least in automotive and embedded sectors. This is why we
have introduced the new specialized QEMU machine for virtio only on both
ARM and x86. However, you are right that the solution is somewhat
dependent on the QEMU emulation provided, meaning it isn't fully
generalized and may not work with other device models. Let's see if we
can improve this. 

I agree that a single PCI root complex is the cleanest solution from a
Xen perspective. However, aside from the level of effort required, it's
also important to consider QEMU integration. The separate root complex
integrates very well into QEMU's own view of the world, and that is
important too because the more we deviate the more we are at risk of
triggering unwanted bugs in QEMU. Bugs that would only show up in a Xen
configuration and we would responsible to fix. The two PCI RCs approach
is simple because it is low complexity from a QEMU point of view. The
trade-off is having the two PCI RCs exposed to the VM instead of one,
but in our tests two PCI RCs work well on both ARM and even x86. So I
think the two PCI RCs approach is viable. (Also I believe that
technically is a single PCI RC with two host bridges.)

For the second option, I'll let Edgar investigate but I think that would
work, thank you for being flexible. We would still need patches 4-6 from
this series.

Let's assume we'll proceed with patches 4-6 and, as agreed, skip patches
1-2. Then my first thought would be to rely on ImageBuilder to generate
the complete virtio DT node. While I usually like using ImageBuilder,
in this case, I lean toward having Xen generate the domU nodes. There
are a few reasons for this: the partial DTB is typically used for
passthrough and related information, which isn't the case here. Although
ImageBuilder can merge multiple partial DTBs, I think it's best not to
depend on that more delicate feature, for scenarios where a user wants
both a passthrough device and a virtio device.

But we could change the DT properties to be more explicitly related to
an emulated PCI root complex, which could be provided by any device
model and not only QEMU. Also we can avoid saying "virtio" in the
property name because although our use-case is virtio, as you wrote
there is nothing that ties this to virtio today. So what about the
following dom0less device tree properties instead?

secondary-emulated-pci-host-bridge = <ecam_address ecam_size
                                      memory_address memory_size
                                      prefetch_address prefetch_size
                                      irq_start, irq_how_many,
                                      flags>;
one of the special flags could be grants enabled/disabled.

This way:

- The list of interrupts and MMIOs is explicit
- The fact that we are talking about a seconday emulated host bridge is
  explicit, in the description we can say we expect it to be provided by
  an ioreq device model. We can call it secondary-ioreq-pci-host-bridge
- The Xen-generated domU device tree description is still generic and
  reusable. Let's say that someone comes up with a different use-case
  and a different device model but still wants a PCI host bridge, they
  can reuse this. The DomU DT is standard for a generic PCI host bridge.
- We don't need ImageBuilder to generate/edit complex device tree nodes
  and merge partial device trees
--8323329-1143422662-1727291269=:1417852--

