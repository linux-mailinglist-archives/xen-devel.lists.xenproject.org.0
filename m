Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B2153ADB2
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 22:39:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340789.565903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwV7a-0004R8-D7; Wed, 01 Jun 2022 20:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340789.565903; Wed, 01 Jun 2022 20:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwV7a-0004OM-A1; Wed, 01 Jun 2022 20:39:14 +0000
Received: by outflank-mailman (input) for mailman id 340789;
 Wed, 01 Jun 2022 20:39:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nwV7Z-0004OG-8S
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 20:39:13 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e344afed-e1ea-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 22:39:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 27A36CE1C02;
 Wed,  1 Jun 2022 20:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369CBC385B8;
 Wed,  1 Jun 2022 20:39:05 +0000 (UTC)
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
X-Inumbo-ID: e344afed-e1ea-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654115946;
	bh=uCCYMUDRoK5TEeCPzFx34TSsizz+TIyNlx4Fb9bR6Tg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tX0fE9SqDfvPBx5QmUFNLMBxJI3zg5nP5HcbcryDlsMyOKrpMVEX+meb48q4uZ573
	 bv47/ky/Phs0K1S3V1+4d0GOCd/qeTHQ7EGCR8u1b1eDDC/5UKKjDkoEjpswJty4MI
	 /DcEHFQGkmjmcx4jZu0lg0bJI2TcYRe54QjugSEEbyUdAy75kb55C4GcEc/hHkT38E
	 PtctCO32aN7JSVQdPRYL8FRFOGTPhrmUHKlzPDu+xluQUljuBiOkSvXjmmMhgsn18O
	 XUZ2u9sr7Ul6mZv5l0b0RK+NjcWAHMGF1VmD3pI0ElZOltaMYRqA/EUDxUKgkdrnIG
	 VhTm5Y2VjjUXQ==
Date: Wed, 1 Jun 2022 13:39:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH V2] libxl/arm: Create specific IOMMU node to be referred
 by virtio-mmio device
In-Reply-To: <e67bde26-2eff-948a-a2c3-08cc474affa6@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206011338310.1905099@ubuntu-linux-20-04-desktop>
References: <1653944813-17970-1-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.22.394.2205311755010.1905099@ubuntu-linux-20-04-desktop> <e67bde26-2eff-948a-a2c3-08cc474affa6@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1716422508-1654115946=:1905099"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1716422508-1654115946=:1905099
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 1 Jun 2022, Oleksandr wrote:
> On 01.06.22 04:04, Stefano Stabellini wrote:
> > On Tue, 31 May 2022, Oleksandr Tyshchenko wrote:
> > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > 
> > > Reuse generic IOMMU device tree bindings to communicate Xen specific
> > > information for the virtio devices for which the restricted memory
> > > access using Xen grant mappings need to be enabled.
> > > 
> > > Insert "iommus" property pointed to the IOMMU node with "xen,grant-dma"
> > > compatible to all virtio devices which backends are going to run in
> > > non-hardware domains (which are non-trusted by default).
> > > 
> > > Based on device-tree binding from Linux:
> > > Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
> > > 
> > > The example of generated nodes:
> > > 
> > > xen_iommu {
> > >      compatible = "xen,grant-dma";
> > >      #iommu-cells = <0x01>;
> > >      phandle = <0xfde9>;
> > > };
> > > 
> > > virtio@2000000 {
> > >      compatible = "virtio,mmio";
> > >      reg = <0x00 0x2000000 0x00 0x200>;
> > >      interrupts = <0x00 0x01 0xf01>;
> > >      interrupt-parent = <0xfde8>;
> > >      dma-coherent;
> > >      iommus = <0xfde9 0x01>;
> > > };
> > > 
> > > virtio@2000200 {
> > >      compatible = "virtio,mmio";
> > >      reg = <0x00 0x2000200 0x00 0x200>;
> > >      interrupts = <0x00 0x02 0xf01>;
> > >      interrupt-parent = <0xfde8>;
> > >      dma-coherent;
> > >      iommus = <0xfde9 0x01>;
> > > };
> > > 
> > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > ---
> > > !!! This patch is based on non upstreamed yet “Virtio support for
> > > toolstack
> > > on Arm” V8 series which is on review now:
> > > https://lore.kernel.org/xen-devel/1651598763-12162-1-git-send-email-olekstysh@gmail.com/
> > > 
> > > New device-tree binding (commit #5) is a part of solution to restrict
> > > memory
> > > access under Xen using xen-grant DMA-mapping layer (which is also on
> > > review):
> > > https://lore.kernel.org/xen-devel/1653944417-17168-1-git-send-email-olekstysh@gmail.com/
> > > 
> > > Changes RFC -> V1:
> > >     - update commit description
> > >     - rebase according to the recent changes to
> > >       "libxl: Introduce basic virtio-mmio support on Arm"
> > > 
> > > Changes V1 -> V2:
> > >     - Henry already gave his Reviewed-by, I dropped it due to the changes
> > >     - use generic IOMMU device tree bindings instead of custom property
> > >       "xen,dev-domid"
> > >     - change commit subject and description, was
> > >       "libxl/arm: Insert "xen,dev-domid" property to virtio-mmio device
> > > node"
> > > ---
> > >   tools/libs/light/libxl_arm.c          | 49
> > > ++++++++++++++++++++++++++++++++---
> > >   xen/include/public/device_tree_defs.h |  1 +
> > >   2 files changed, 47 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> > > index 9be9b2a..72da3b1 100644
> > > --- a/tools/libs/light/libxl_arm.c
> > > +++ b/tools/libs/light/libxl_arm.c
> > > @@ -865,9 +865,32 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
> > >       return 0;
> > >   }
> > >   +static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
> > > +{
> > > +    int res;
> > > +
> > > +    /* See Linux
> > > Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml */
> > > +    res = fdt_begin_node(fdt, "xen_iommu");
> > > +    if (res) return res;
> > > +
> > > +    res = fdt_property_compat(gc, fdt, 1, "xen,grant-dma");
> > > +    if (res) return res;
> > > +
> > > +    res = fdt_property_cell(fdt, "#iommu-cells", 1);
> > > +    if (res) return res;
> > > +
> > > +    res = fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_IOMMU);
> > > +    if (res) return res;
> > > +
> > > +    res = fdt_end_node(fdt);
> > > +    if (res) return res;
> > > +
> > > +    return 0;
> > > +}
> > >     static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
> > > -                                 uint64_t base, uint32_t irq)
> > > +                                 uint64_t base, uint32_t irq,
> > > +                                 uint32_t backend_domid)
> > >   {
> > >       int res;
> > >       gic_interrupt intr;
> > > @@ -890,6 +913,16 @@ static int make_virtio_mmio_node(libxl__gc *gc, void
> > > *fdt,
> > >       res = fdt_property(fdt, "dma-coherent", NULL, 0);
> > >       if (res) return res;
> > >   +    if (backend_domid != LIBXL_TOOLSTACK_DOMID) {
> > > +        uint32_t iommus_prop[2];
> > > +
> > > +        iommus_prop[0] = cpu_to_fdt32(GUEST_PHANDLE_IOMMU);
> > > +        iommus_prop[1] = cpu_to_fdt32(backend_domid);
> > > +
> > > +        res = fdt_property(fdt, "iommus", iommus_prop,
> > > sizeof(iommus_prop));
> > > +        if (res) return res;
> > > +    }
> > > +
> > >       res = fdt_end_node(fdt);
> > >       if (res) return res;
> > >   @@ -1097,6 +1130,7 @@ static int libxl__prepare_dtb(libxl__gc *gc,
> > > libxl_domain_config *d_config,
> > >       size_t fdt_size = 0;
> > >       int pfdt_size = 0;
> > >       libxl_domain_build_info *const info = &d_config->b_info;
> > > +    bool iommu_created;
> > >       unsigned int i;
> > >         const libxl_version_info *vers;
> > > @@ -1204,11 +1238,20 @@ next_resize:
> > >           if (d_config->num_pcidevs)
> > >               FDT( make_vpci_node(gc, fdt, ainfo, dom) );
> > >   +        iommu_created = false;
> > >           for (i = 0; i < d_config->num_disks; i++) {
> > >               libxl_device_disk *disk = &d_config->disks[i];
> > >   -            if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO)
> > > -                FDT( make_virtio_mmio_node(gc, fdt, disk->base,
> > > disk->irq) );
> > > +            if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
> > > +                if (disk->backend_domid != LIBXL_TOOLSTACK_DOMID &&
> > > +                    !iommu_created) {
> > > +                    FDT( make_xen_iommu_node(gc, fdt) );
> > > +                    iommu_created = true;
> > > +                }
> > > +
> > > +                FDT( make_virtio_mmio_node(gc, fdt, disk->base,
> > > disk->irq,
> > > +                                           disk->backend_domid) );
> > > +            }
> > This is a matter of taste as the code would also work as is, but I would
> > do the following instead:
> > 
> > 
> > if ( d_config->num_disks > 0 &&
> >       disk->backend_domid != LIBXL_TOOLSTACK_DOMID) {
> >       FDT( make_xen_iommu_node(gc, fdt) );
> > }
> > 
> > for (i = 0; i < d_config->num_disks; i++) {
> >      libxl_device_disk *disk = &d_config->disks[i];
> > 
> >      if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO)
> >          FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
> > }
> 
> I got your idea to avoid using local "iommu_created". For that, I think, we
> need to modify the first check to make sure that we have at least one virtio
> device, otherwise we might end up inserting unused IOMMU node. But, it will
> turn into an extra loop to go through num_disks and look for
> LIBXL_DISK_SPECIFICATION_VIRTIO.

I see, then just keep it as is.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1716422508-1654115946=:1905099--

