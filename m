Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9897030E5F3
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 23:19:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81078.149154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7QU7-0005rC-44; Wed, 03 Feb 2021 22:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81078.149154; Wed, 03 Feb 2021 22:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7QU7-0005qn-12; Wed, 03 Feb 2021 22:18:51 +0000
Received: by outflank-mailman (input) for mailman id 81078;
 Wed, 03 Feb 2021 22:18:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qtc=HF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l7QU6-0005qi-95
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 22:18:50 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 339fe853-52fc-4719-a9e8-a4bc45d04afd;
 Wed, 03 Feb 2021 22:18:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBC2664DF0;
 Wed,  3 Feb 2021 22:18:47 +0000 (UTC)
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
X-Inumbo-ID: 339fe853-52fc-4719-a9e8-a4bc45d04afd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612390728;
	bh=yyIRAdp9HTCLKYMLp8vzMTGuEyMMqbW0akmu5TfQk9E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jdb28UDAbopek7XmGT5z1jxAQOX0/dYcCOROTXdMftB/hM4+mDKx+nSqEWJQe4lSQ
	 kE+VIHIAUNZyl9WYGui+1ISgGAwhMAO06NLr/4k2pT9XEJUHhVHIV7PsUQq0jP43yO
	 bSB//6vTMv12D1qkPZSrKx7we63sjN6zqUehHMrl/HiMGhOWUug3Hzdfi7ikcJdF8V
	 cMj7rZ/O4DI/9DoFKLa0JDFrIbggHbPVG1/FW8MpOA7uS7FuamK8BEMUcSbDLSpXKt
	 kSgeonKaurg2PVcXE655IDjUA7Gq1bIOgOeiIdZ6zxb6hDqy2Dm90j3fCE1t7QnlfL
	 RcTs67gkCUkBg==
Date: Wed, 3 Feb 2021 14:18:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: domain_build: Ignore device nodes with invalid
 addresses
In-Reply-To: <06d6b9ec-0db9-d6da-e30b-df9f9381157d@xen.org>
Message-ID: <alpine.DEB.2.21.2102031315350.29047@sstabellini-ThinkPad-T480s>
References: <YBmQQ3Tzu++AadKx@mattapan.m5p.com> <a422c04c-f908-6fb6-f2de-fea7b18a6e7d@xen.org> <b6d342f8-c833-db88-9808-cdc946999300@xen.org> <alpine.DEB.2.21.2102021412480.29047@sstabellini-ThinkPad-T480s> <06d6b9ec-0db9-d6da-e30b-df9f9381157d@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1596983874-1612387817=:29047"
Content-ID: <alpine.DEB.2.21.2102031331460.29047@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1596983874-1612387817=:29047
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2102031331461.29047@sstabellini-ThinkPad-T480s>

On Wed, 3 Feb 2021, Julien Grall wrote:
> On 03/02/2021 00:18, Stefano Stabellini wrote:
> > On Tue, 2 Feb 2021, Julien Grall wrote:
> > > On 02/02/2021 18:12, Julien Grall wrote:
> > > > On 02/02/2021 17:47, Elliott Mitchell wrote:
> > > > > The handle_device() function has been returning failure upon
> > > > > encountering a device address which was invalid.  A device tree which
> > > > > had such an entry has now been seen in the wild.  As it causes no
> > > > > failures to simply ignore the entries, ignore them. >
> > > > > Signed-off-by: Elliott Mitchell <ehem+xenn@m5p.com>
> > > > > 
> > > > > ---
> > > > > I'm starting to suspect there are an awful lot of places in the
> > > > > various
> > > > > domain_build.c files which should simply ignore errors.  This is now
> > > > > the
> > > > > second place I've encountered in 2 months where ignoring errors was
> > > > > the
> > > > > correct action.
> > > > 
> > > > Right, as a counterpoint, we run Xen on Arm HW for several years now and
> > > > this is the first time I heard about issue parsing the DT. So while I
> > > > appreciate that you are eager to run Xen on the RPI...
> > > > 
> > > > >   I know failing in case of error is an engineer's
> > > > > favorite approach, but there seem an awful lot of harmless failures
> > > > > causing panics.
> > > > > 
> > > > > This started as the thread "[RFC PATCH] xen/arm: domain_build: Ignore
> > > > > empty memory bank".  Now it seems clear the correct approach is to
> > > > > simply
> > > > > ignore these entries.
> > > > 
> > > > ... we first need to fully understand the issues. Here a few questions:
> > > >      1) Can you provide more information why you believe the address is
> > > > invalid?
> > > >      2) How does Linux use the node?
> > > >      3) Is it happening with all the RPI DT? If not, what are the
> > > > differences?
> > > 
> > > So I had another look at the device-tree you provided earlier on. The node
> > > is
> > > the following (copied directly from the DTS):
> > > 
> > > &pcie0 {
> > >          pci@1,0 {
> > >                  #address-cells = <3>;
> > >                  #size-cells = <2>;
> > >                  ranges;
> > > 
> > >                  reg = <0 0 0 0 0>;
> > > 
> > >                  usb@1,0 {
> > >                          reg = <0x10000 0 0 0 0>;
> > >                          resets = <&reset
> > > RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
> > >                  };
> > >          };
> > > };
> > > 
> > > pcie0: pcie@7d500000 {
> > >     compatible = "brcm,bcm2711-pcie";
> > >     reg = <0x0 0x7d500000  0x0 0x9310>;
> > >     device_type = "pci";
> > >     #address-cells = <3>;
> > >     #interrupt-cells = <1>;
> > >     #size-cells = <2>;
> > >     interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> > >                  <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> > >     interrupt-names = "pcie", "msi";
> > >     interrupt-map-mask = <0x0 0x0 0x0 0x7>;
> > >     interrupt-map = <0 0 0 1 &gicv2 GIC_SPI 143
> > >                                                       IRQ_TYPE_LEVEL_HIGH>;
> > >     msi-controller;
> > >     msi-parent = <&pcie0>;
> > > 
> > >     ranges = <0x02000000 0x0 0xc0000000 0x6 0x00000000
> > >               0x0 0x40000000>;
> > >     /*
> > >      * The wrapper around the PCIe block has a bug
> > >      * preventing it from accessing beyond the first 3GB of
> > >      * memory.
> > >      */
> > >     dma-ranges = <0x02000000 0x0 0x00000000 0x0 0x00000000
> > >                   0x0 0xc0000000>;
> > >     brcm,enable-ssc;
> > > };
> > > 
> > > The interpretation of "reg" depends on the context. In this case, we are
> > > trying to interpret as a memory address from the CPU PoV when it has a
> > > different meaning (I am not exactly sure what).
> > > 
> > > In fact, you are lucky that Xen doesn't manage to interpret it. Xen should
> > > really stop trying to look region to map when it discover a PCI bus. I
> > > wrote a
> > > quick hack patch that should ignore it:
> > 
> > Yes, I think you are right. There are a few instances where "reg" is not
> > a address ready to be remapped. It is not just PCI, although that's the
> > most common.  Maybe we need a list, like skip_matches in handle_node.
> 
> From my understanding, "reg" can be considered as an MMIO region only if all
> the *parents up to the root have the property "ranges" and they are not on a
> different bus (e.g. pci).
> 
> Do you have example where this is not the case?

The famous one is CPUs. These are some other examples I could find with
a quick search:

			nvmem_firmware {
				compatible = "xlnx,zynqmp-nvmem-fw";
				#address-cells = <0x1>;
				#size-cells = <0x1>;

				soc_revision@0 {
					reg = <0x0 0x4>;
				};
			};

		cci@fd6e0000 {
			compatible = "arm,cci-400";
			reg = <0x0 0xfd6e0000 0x0 0x9000>;
			ranges = <0x0 0x0 0xfd6e0000 0x10000>;
			#address-cells = <0x1>;
			#size-cells = <0x1>;

			pmu@9000 {
				compatible = "arm,cci-400-pmu,r1";
				reg = <0x9000 0x5000>;
				interrupt-parent = <0x4>;
				interrupts = <0x0 0x7b 0x4 0x0 0x7b 0x4 0x0 0x7b 0x4 0x0 0x7b 0x4 0x0 0x7b 0x4>;
			};
		};


		i2c@ff020000 {
			compatible = "cdns,i2c-r1p14";
			status = "okay";
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x11 0x4>;
			reg = <0x0 0xff020000 0x0 0x1000>;
			#address-cells = <0x1>;
			#size-cells = <0x0>;
			clocks = <0x3 0x3d>;
			clock-frequency = <0x61a80>;

			gpio@20 {
				compatible = "ti,tca6416";
				reg = <0x20>;


		ethernet@ff0e0000 {
			compatible = "cdns,zynqmp-gem", "cdns,gem";
			status = "okay";
			interrupt-parent = <0x4>;
			interrupts = <0x0 0x3f 0x4 0x0 0x3f 0x4>;
			reg = <0x0 0xff0e0000 0x0 0x1000>;
			clock-names = "pclk", "hclk", "tx_clk";
			#address-cells = <0x1>;
			#size-cells = <0x0>;
			iommus = <0xd 0x877>;
			clocks = <0xc 0xc 0xc>;
			phy-handle = <0xe>;
			phy-mode = "rgmii-id";
			#stream-id-cells = <0x1>;
			phandle = <0x16>;

			ethernet-phy@c {
				reg = <0xc>;
				ti,rx-internal-delay = <0x8>;
				ti,tx-internal-delay = <0xa>;
				ti,fifo-depth = <0x1>;
				ti,dp83867-rxctrl-strap-quirk;
				phandle = <0xe>;
			};
		};


The rule that *parents up to the root have the property "ranges"* seems
to apply correctly to all these cases. Good.


> Whether Xen does it correctly is another question :).
> 
> > 
> > 
> > > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > > index 374bf655ee34..937fd1e387b7 100644
> > > --- a/xen/arch/arm/domain_build.c
> > > +++ b/xen/arch/arm/domain_build.c
> > > @@ -1426,7 +1426,7 @@ static int __init handle_device(struct domain *d,
> > > struct
> > > dt_device_node *dev,
> > > 
> > >   static int __init handle_node(struct domain *d, struct kernel_info
> > > *kinfo,
> > >                                 struct dt_device_node *node,
> > > -                              p2m_type_t p2mt)
> > > +                              p2m_type_t p2mt, bool pci_bus)
> > >   {
> > >       static const struct dt_device_match skip_matches[] __initconst =
> > >       {
> > > @@ -1532,9 +1532,14 @@ static int __init handle_node(struct domain *d,
> > > struct
> > > kernel_info *kinfo,
> > >                  "WARNING: Path %s is reserved, skip the node as we may
> > > re-use
> > > the path.\n",
> > >                  path);
> > > 
> > > -    res = handle_device(d, node, p2mt);
> > > -    if ( res)
> > > -        return res;
> > > +    if ( !pci_bus )
> > > +    {
> > > +        res = handle_device(d, node, p2mt);
> > > +        if ( res)
> > > +           return res;
> > > +
> > > +        pci_bus = dt_device_type_is_equal(node, "pci");
> > > +    }
> > > 
> > >       /*
> > >        * The property "name" is used to have a different name on older FDT
> > > @@ -1554,7 +1559,7 @@ static int __init handle_node(struct domain *d,
> > > struct
> > > kernel_info *kinfo,
> > > 
> > >       for ( child = node->child; child != NULL; child = child->sibling )
> > >       {
> > > -        res = handle_node(d, kinfo, child, p2mt);
> > > +        res = handle_node(d, kinfo, child, p2mt, pci_bus);
> > >           if ( res )
> > >               return res;
> > >       }
> > > @@ -2192,7 +2197,7 @@ static int __init prepare_dtb_hwdom(struct domain
> > > *d,
> > > struct kernel_info *kinfo)
> > > 
> > >       fdt_finish_reservemap(kinfo->fdt);
> > > 
> > > -    ret = handle_node(d, kinfo, dt_host, default_p2mt);
> > > +    ret = handle_node(d, kinfo, dt_host, default_p2mt, false);
> > >       if ( ret )
> > >           goto err;
> > > 
> > > A less hackish possibility would be to modify dt_number_of_address() and
> > > return 0 when the device is a child of a PCI below.
> > > 
> > > Stefano, do you have any opinions?
> > 
> > Would PCIe even work today? Because if it doesn't, we could just add it
> > to skip_matches until we get PCI passthrough properly supported.
> PCIe (or PCI) definitely works in dom0 today but Xen is not aware of the
> hostbridge. So you would break quite a few uses cases by skipping the nodes.

Never mind my suggestion


> > But aside from PCIe, let's say that we know of a few nodes for which
> > "reg" needs a special treatment. I am not sure it makes sense to proceed
> > with parsing those nodes without knowing how to deal with that.
> 
> I believe that most of the time the "special" treatment would be to ignore the
> property "regs" as it will not be an CPU memory address.
> 
> > So maybe
> > we should add those nodes to skip_matches until we know what to do with
> > them. At that point, I would imagine we would introduce a special
> > handle_device function that knows what to do. In the case of PCIe,
> > something like "handle_device_pcie".
> Could you outline how "handle_device_pcie()" will differ with handle_node()?
> 
> In fact, the problem is not the PCIe node directly. Instead, it is the second
> level of nodes below it (i.e usb@...).
> 
> The current implementation of dt_number_of_address() only look at the bus type
> of the parent. As the parent has no bus type and "ranges" then it thinks this
> is something we can translate to a CPU address.
> 
> However, this is below a PCI bus so the meaning of "reg" is completely
> different. In this case, we only need to ignore "reg".

I see what you are saying and I agree: if we had to introduce a special
case for PCI, then  dt_number_of_address() seems to be a good place.  In
fact, we already have special PCI handling, see our
__dt_translate_address function and xen/common/device_tree.c:dt_busses.

Which brings the question: why is this actually failing?

pcie0 {
     ranges = <0x02000000 0x0 0xc0000000 0x6 0x00000000 0x0 0x40000000>;

Which means that PCI addresses 0xc0000000-0x100000000 become 0x600000000-0x700000000.

The offending DT is:

&pcie0 {
         pci@1,0 {
                 #address-cells = <3>;
                 #size-cells = <2>;
                 ranges;

                 reg = <0 0 0 0 0>;

                 usb@1,0 {
                         reg = <0x10000 0 0 0 0>;
                         resets = <&reset RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
                 };
         };
};


reg = <0x10000 0 0 0 0> means that usb@1,0 is PCI device 01:00.0.
However, the rest of the regs cells are left as zero. It shouldn't be an
issue because usb@1,0 is a child of pci@1,0 but pci@1,0 is not a bus. So
in theory dt_number_of_address() should already return 0 for it.

Maybe reg = <0 0 0 0 0> is the problem. In that case, we could simply
add a check to skip 0 size ranges. Just a hack to explain what I mean:

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 18825e333e..236b30675b 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -866,6 +866,9 @@ int dt_device_get_address(const struct dt_device_node *dev, unsigned int index,
     unsigned int flags;
 
     addrp = dt_get_address(dev, index, size, &flags);
+    if ( *size == 0 )
+        return 0;
+
     if ( addrp == NULL )
         return -EINVAL;
 
--8323329-1596983874-1612387817=:29047--

