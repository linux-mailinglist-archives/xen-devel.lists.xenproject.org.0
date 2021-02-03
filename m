Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2720A30D036
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 01:19:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80757.147914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l75sl-0006SU-7c; Wed, 03 Feb 2021 00:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80757.147914; Wed, 03 Feb 2021 00:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l75sl-0006Ro-46; Wed, 03 Feb 2021 00:18:55 +0000
Received: by outflank-mailman (input) for mailman id 80757;
 Wed, 03 Feb 2021 00:18:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qtc=HF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l75sj-0006RS-Qm
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 00:18:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7911f58f-0040-4802-ae56-3161a006c8fc;
 Wed, 03 Feb 2021 00:18:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0552964E11;
 Wed,  3 Feb 2021 00:18:51 +0000 (UTC)
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
X-Inumbo-ID: 7911f58f-0040-4802-ae56-3161a006c8fc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612311532;
	bh=mx1C+CFztb9VdgnMKD+epikE78i+nTfZa4NOt62pGcw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HGAE8PPeKCrgbzP2B5emDWln0XlfDXRsRbhAMVnuuqfa0hWj9tIw5yn4Ar3XO1z5n
	 fPIjYtf9CDqk2qEHGItJGf1O0bjg/i6zRu4Khef5kIorv3hDIFv9rosD676FwGhA+2
	 ZeapyyTRTkARbTzDjmtQjpMZXWBdC9E4XqB/iwMu3eML0G38kMGHFeQ+x/DAz2C80K
	 a5CGk6MmXw3oRNVQP0pTLOF6M8x5BA0Sd6CovnvuHpPAYp3cYDwBYd2GTYoaOYTF2W
	 NU33WF2q8Bp1fszXB7bp5M8PLPQ7oD94hWvG4W5omx2BdRfqRCKi8cJMFU/bScDnE3
	 KqKVUvT329RVw==
Date: Tue, 2 Feb 2021 16:18:51 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: domain_build: Ignore device nodes with invalid
 addresses
In-Reply-To: <b6d342f8-c833-db88-9808-cdc946999300@xen.org>
Message-ID: <alpine.DEB.2.21.2102021412480.29047@sstabellini-ThinkPad-T480s>
References: <YBmQQ3Tzu++AadKx@mattapan.m5p.com> <a422c04c-f908-6fb6-f2de-fea7b18a6e7d@xen.org> <b6d342f8-c833-db88-9808-cdc946999300@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-470387924-1612304319=:29047"
Content-ID: <alpine.DEB.2.21.2102021418410.29047@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-470387924-1612304319=:29047
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2102021418411.29047@sstabellini-ThinkPad-T480s>

On Tue, 2 Feb 2021, Julien Grall wrote:
> On 02/02/2021 18:12, Julien Grall wrote:
> > On 02/02/2021 17:47, Elliott Mitchell wrote:
> > > The handle_device() function has been returning failure upon
> > > encountering a device address which was invalid.  A device tree which
> > > had such an entry has now been seen in the wild.  As it causes no
> > > failures to simply ignore the entries, ignore them. >
> > > Signed-off-by: Elliott Mitchell <ehem+xenn@m5p.com>
> > > 
> > > ---
> > > I'm starting to suspect there are an awful lot of places in the various
> > > domain_build.c files which should simply ignore errors.  This is now the
> > > second place I've encountered in 2 months where ignoring errors was the
> > > correct action.
> > 
> > Right, as a counterpoint, we run Xen on Arm HW for several years now and
> > this is the first time I heard about issue parsing the DT. So while I
> > appreciate that you are eager to run Xen on the RPI...
> > 
> > >  I know failing in case of error is an engineer's
> > > favorite approach, but there seem an awful lot of harmless failures
> > > causing panics.
> > > 
> > > This started as the thread "[RFC PATCH] xen/arm: domain_build: Ignore
> > > empty memory bank".  Now it seems clear the correct approach is to simply
> > > ignore these entries.
> > 
> > ... we first need to fully understand the issues. Here a few questions:
> >     1) Can you provide more information why you believe the address is
> > invalid?
> >     2) How does Linux use the node?
> >     3) Is it happening with all the RPI DT? If not, what are the
> > differences?
> 
> So I had another look at the device-tree you provided earlier on. The node is
> the following (copied directly from the DTS):
> 
> &pcie0 {
>         pci@1,0 {
>                 #address-cells = <3>;
>                 #size-cells = <2>;
>                 ranges;
> 
>                 reg = <0 0 0 0 0>;
> 
>                 usb@1,0 {
>                         reg = <0x10000 0 0 0 0>;
>                         resets = <&reset RASPBERRYPI_FIRMWARE_RESET_ID_USB>;
>                 };
>         };
> };
> 
> pcie0: pcie@7d500000 {
>    compatible = "brcm,bcm2711-pcie";
>    reg = <0x0 0x7d500000  0x0 0x9310>;
>    device_type = "pci";
>    #address-cells = <3>;
>    #interrupt-cells = <1>;
>    #size-cells = <2>;
>    interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
>                 <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
>    interrupt-names = "pcie", "msi";
>    interrupt-map-mask = <0x0 0x0 0x0 0x7>;
>    interrupt-map = <0 0 0 1 &gicv2 GIC_SPI 143
>                                                      IRQ_TYPE_LEVEL_HIGH>;
>    msi-controller;
>    msi-parent = <&pcie0>;
> 
>    ranges = <0x02000000 0x0 0xc0000000 0x6 0x00000000
>              0x0 0x40000000>;
>    /*
>     * The wrapper around the PCIe block has a bug
>     * preventing it from accessing beyond the first 3GB of
>     * memory.
>     */
>    dma-ranges = <0x02000000 0x0 0x00000000 0x0 0x00000000
>                  0x0 0xc0000000>;
>    brcm,enable-ssc;
> };
> 
> The interpretation of "reg" depends on the context. In this case, we are
> trying to interpret as a memory address from the CPU PoV when it has a
> different meaning (I am not exactly sure what).
> 
> In fact, you are lucky that Xen doesn't manage to interpret it. Xen should
> really stop trying to look region to map when it discover a PCI bus. I wrote a
> quick hack patch that should ignore it:

Yes, I think you are right. There are a few instances where "reg" is not
a address ready to be remapped. It is not just PCI, although that's the
most common.  Maybe we need a list, like skip_matches in handle_node.


> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 374bf655ee34..937fd1e387b7 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1426,7 +1426,7 @@ static int __init handle_device(struct domain *d, struct
> dt_device_node *dev,
> 
>  static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>                                struct dt_device_node *node,
> -                              p2m_type_t p2mt)
> +                              p2m_type_t p2mt, bool pci_bus)
>  {
>      static const struct dt_device_match skip_matches[] __initconst =
>      {
> @@ -1532,9 +1532,14 @@ static int __init handle_node(struct domain *d, struct
> kernel_info *kinfo,
>                 "WARNING: Path %s is reserved, skip the node as we may re-use
> the path.\n",
>                 path);
> 
> -    res = handle_device(d, node, p2mt);
> -    if ( res)
> -        return res;
> +    if ( !pci_bus )
> +    {
> +        res = handle_device(d, node, p2mt);
> +        if ( res)
> +           return res;
> +
> +        pci_bus = dt_device_type_is_equal(node, "pci");
> +    }
> 
>      /*
>       * The property "name" is used to have a different name on older FDT
> @@ -1554,7 +1559,7 @@ static int __init handle_node(struct domain *d, struct
> kernel_info *kinfo,
> 
>      for ( child = node->child; child != NULL; child = child->sibling )
>      {
> -        res = handle_node(d, kinfo, child, p2mt);
> +        res = handle_node(d, kinfo, child, p2mt, pci_bus);
>          if ( res )
>              return res;
>      }
> @@ -2192,7 +2197,7 @@ static int __init prepare_dtb_hwdom(struct domain *d,
> struct kernel_info *kinfo)
> 
>      fdt_finish_reservemap(kinfo->fdt);
> 
> -    ret = handle_node(d, kinfo, dt_host, default_p2mt);
> +    ret = handle_node(d, kinfo, dt_host, default_p2mt, false);
>      if ( ret )
>          goto err;
> 
> A less hackish possibility would be to modify dt_number_of_address() and
> return 0 when the device is a child of a PCI below.
> 
> Stefano, do you have any opinions?

Would PCIe even work today? Because if it doesn't, we could just add it
to skip_matches until we get PCI passthrough properly supported.

But aside from PCIe, let's say that we know of a few nodes for which
"reg" needs a special treatment. I am not sure it makes sense to proceed
with parsing those nodes without knowing how to deal with that. So maybe
we should add those nodes to skip_matches until we know what to do with
them. At that point, I would imagine we would introduce a special
handle_device function that knows what to do. In the case of PCIe,
something like "handle_device_pcie".
--8323329-470387924-1612304319=:29047--

