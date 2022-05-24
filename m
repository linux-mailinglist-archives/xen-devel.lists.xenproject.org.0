Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EB653244B
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 09:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336223.560583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPB0-0006A4-9v; Tue, 24 May 2022 07:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336223.560583; Tue, 24 May 2022 07:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPAz-00065q-Vo; Tue, 24 May 2022 07:41:57 +0000
Received: by outflank-mailman (input) for mailman id 336223;
 Tue, 24 May 2022 07:41:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTVj=WA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ntP5z-0003DA-OU
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 07:36:47 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa6e2c68-db04-11ec-837e-e5687231ffcc;
 Tue, 24 May 2022 03:58:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2A009B8171B;
 Tue, 24 May 2022 01:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0355CC385AA;
 Tue, 24 May 2022 01:58:13 +0000 (UTC)
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
X-Inumbo-ID: fa6e2c68-db04-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653357495;
	bh=Cv9XZBa4Hc/gWPaETmcVdmUQuN7p5/VU3A7uzoNojTk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OSoLdx+BBzfvf8wv36fAozO82JJNlzeO9vQ1p/JEsvOCSYSnJbw2wtgCh19TDHhHy
	 /BPY1AY423sAwNT2orpFJ7slTyygINF1MK+6dQeA2VOBmNEVvw+sI6H8xvHjtaYd3f
	 FDur2l6Rz7WLduTHmfvb6RfgBdvBctbshDJHwVVMXV7gspqB1IwzwQpz4UWL9C30UF
	 XztCByCNAXI3IayBHiVgxFrl7fDtalsqMYnoNzg3pQsnBsA6r4tMGYyYD/FF00nHNF
	 5sGFu13IN/UVYghw9VbrG7c44KSxvwomO+GDHsxawwTtbB6PgXN3IJWMIFX/u5Up1k
	 obVnFHYKI18kQ==
Date: Mon, 23 May 2022 18:58:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr <olekstysh@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" <virtualization@lists.linux-foundation.org>, 
    DTML <devicetree@vger.kernel.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux ARM <linux-arm-kernel@lists.infradead.org>, 
    Arnd Bergmann <arnd@arndb.de>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Jason Wang <jasowang@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, Julien Grall <julien@xen.org>, 
    Juergen Gross <jgross@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
    Christoph Hellwig <hch@infradead.org>, 
    Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH V2 5/7] dt-bindings: Add xen,dev-domid property description
 for xen-grant DMA ops
In-Reply-To: <390ba7bb-ee9e-b7b7-5f08-71a7245fa4ec@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2205231856330.1905099@ubuntu-linux-20-04-desktop>
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com> <1651947548-4055-6-git-send-email-olekstysh@gmail.com> <CAK8P3a2cAnXr8TDDYTiFxTWzQxa67sGnYDQRRD+=Q8_cSb1mEw@mail.gmail.com> <56e8c32d-6771-7179-005f-26ca58555659@gmail.com>
 <CAK8P3a1YhkEZ8gcbXHEa5Bwx-4VVRJO8SUHf8=RNWRsc2Yo-+A@mail.gmail.com> <460a746c-6b61-214b-4653-44a1430e314d@gmail.com> <alpine.DEB.2.22.394.2205181802310.1905099@ubuntu-linux-20-04-desktop> <6f469e9c-c26e-f4be-9a85-710afb0d77eb@gmail.com>
 <390ba7bb-ee9e-b7b7-5f08-71a7245fa4ec@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-279637414-1653357495=:1905099"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-279637414-1653357495=:1905099
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 23 May 2022, Oleksandr wrote:
> > > On Thu, 19 May 2022, Oleksandr wrote:
> > > > > On Wed, May 18, 2022 at 5:06 PM Oleksandr <olekstysh@gmail.com> wrote:
> > > > > > On 18.05.22 17:32, Arnd Bergmann wrote:
> > > > > > > On Sat, May 7, 2022 at 7:19 PM Oleksandr Tyshchenko
> > > > > > > <olekstysh@gmail.com> wrote:
> > > > > > >     This would mean having a device
> > > > > > > node for the grant-table mechanism that can be referred to using
> > > > > > > the
> > > > > > > 'iommus'
> > > > > > > phandle property, with the domid as an additional argument.
> > > > > > I assume, you are speaking about something like the following?
> > > > > > 
> > > > > > 
> > > > > > xen_dummy_iommu {
> > > > > >       compatible = "xen,dummy-iommu";
> > > > > >       #iommu-cells = <1>;
> > > > > > };
> > > > > > 
> > > > > > virtio@3000 {
> > > > > >       compatible = "virtio,mmio";
> > > > > >       reg = <0x3000 0x100>;
> > > > > >       interrupts = <41>;
> > > > > > 
> > > > > >       /* The device is located in Xen domain with ID 1 */
> > > > > >       iommus = <&xen_dummy_iommu 1>;
> > > > > > };
> > > > > Right, that's that's the idea,
> > > > thank you for the confirmation
> > > > 
> > > > 
> > > > 
> > > > >    except I would not call it a 'dummy'.
> > > > >   From the perspective of the DT, this behaves just like an IOMMU,
> > > > > even if the exact mechanism is different from most hardware IOMMU
> > > > > implementations.
> > > > well, agree
> > > > 
> > > > 
> > > > > > > It does not quite fit the model that Linux currently uses for
> > > > > > > iommus,
> > > > > > > as that has an allocator for dma_addr_t space
> > > > > > yes (# 3/7 adds grant-table based allocator)
> > > > > > 
> > > > > > 
> > > > > > > , but it would think it's
> > > > > > > conceptually close enough that it makes sense for the binding.
> > > > > > Interesting idea. I am wondering, do we need an extra actions for
> > > > > > this
> > > > > > to work in Linux guest (dummy IOMMU driver, etc)?
> > > > > It depends on how closely the guest implementation can be made to
> > > > > resemble a normal iommu. If you do allocate dma_addr_t addresses,
> > > > > it may actually be close enough that you can just turn the grant-table
> > > > > code into a normal iommu driver and change nothing else.
> > > > Unfortunately, I failed to find a way how use grant references at the
> > > > iommu_ops level (I mean to fully pretend that we are an IOMMU driver). I
> > > > am
> > > > not too familiar with that, so what is written below might be wrong or
> > > > at
> > > > least not precise.
> > > > 
> > > > The normal IOMMU driver in Linux doesn’t allocate DMA addresses by
> > > > itself, it
> > > > just maps (IOVA-PA) what was requested to be mapped by the upper layer.
> > > > The
> > > > DMA address allocation is done by the upper layer (DMA-IOMMU which is
> > > > the glue
> > > > layer between DMA API and IOMMU API allocates IOVA for PA?). But, all
> > > > what we
> > > > need here is just to allocate our specific grant-table based DMA
> > > > addresses
> > > > (DMA address = grant reference + offset in the page), so let’s say we
> > > > need an
> > > > entity to take a physical address as parameter and return a DMA address
> > > > (what
> > > > actually commit #3/7 is doing), and that’s all. So working at the
> > > > dma_ops
> > > > layer we get exactly what we need, with the minimal changes to guest
> > > > infrastructure. In our case the Xen itself acts as an IOMMU.
> > > > 
> > > > Assuming that we want to reuse the IOMMU infrastructure somehow for our
> > > > needs.
> > > > I think, in that case we will likely need to introduce a new specific
> > > > IOVA
> > > > allocator (alongside with a generic one) to be hooked up by the
> > > > DMA-IOMMU
> > > > layer if we run on top of Xen. But, even having the specific IOVA
> > > > allocator to
> > > > return what we indeed need (DMA address = grant reference + offset in
> > > > the
> > > > page) we will still need the specific minimal required IOMMU driver to
> > > > be
> > > > present in the system anyway in order to track the mappings(?) and do
> > > > nothing
> > > > with them, returning a success (this specific IOMMU driver should have
> > > > all
> > > > mandatory callbacks implemented).
> > > > 
> > > > I completely agree, it would be really nice to reuse generic IOMMU
> > > > bindings
> > > > rather than introducing Xen specific property if what we are trying to
> > > > implement in current patch series fits in the usage of "iommus" in Linux
> > > > more-less. But, if we will have to add more complexity/more components
> > > > to the
> > > > code for the sake of reusing device tree binding, this raises a question
> > > > whether that’s worthwhile.
> > > > 
> > > > Or I really missed something?
> > > I think Arnd was primarily suggesting to reuse the IOMMU Device Tree
> > > bindings, not necessarily the IOMMU drivers framework in Linux (although
> > > that would be an added bonus.)
> > > 
> > > I know from previous discussions with you that making the grant table
> > > fit in the existing IOMMU drivers model is difficult, but just reusing
> > > the Device Tree bindings seems feasible?
> > 
> > I started experimenting with that. As wrote in a separate email, I got a
> > deferred probe timeout,
> > 
> > after inserting required nodes into guest device tree, which seems to be a
> > consequence of the unavailability of IOMMU, I will continue to investigate
> > this question.
> 
> 
> I have experimented with that. Yes, just reusing the Device Tree bindings is
> technically feasible (and we are able to do this by only touching
> grant-dma-ops.c), although deferred probe timeout still stands (as there is no
> IOMMU driver being present actually).
> 
> [    0.583771] virtio-mmio 2000000.virtio: deferred probe timeout, ignoring
> dependency
> [    0.615556] virtio_blk virtio0: [vda] 4096000 512-byte logical blocks (2.10
> GB/1.95 GiB)
> 
> 
> Below the working diff (on top of current series):
> 
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index da9c7ff..6586152 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -272,17 +272,24 @@ static const struct dma_map_ops xen_grant_dma_ops = {
> 
>  bool xen_is_grant_dma_device(struct device *dev)
>  {
> +       struct device_node *iommu_np;
> +       bool has_iommu;
> +
>         /* XXX Handle only DT devices for now */
>         if (!dev->of_node)
>                 return false;
> 
> -       return of_property_read_bool(dev->of_node, "xen,backend-domid");
> +       iommu_np = of_parse_phandle(dev->of_node, "iommus", 0);
> +       has_iommu = iommu_np && of_device_is_compatible(iommu_np,
> "xen,grant-dma");
> +       of_node_put(iommu_np);
> +
> +       return has_iommu;
>  }
> 
>  void xen_grant_setup_dma_ops(struct device *dev)
>  {
>         struct xen_grant_dma_data *data;
> -       uint32_t domid;
> +       struct of_phandle_args iommu_spec;
> 
>         data = find_xen_grant_dma_data(dev);
>         if (data) {
> @@ -294,16 +301,30 @@ void xen_grant_setup_dma_ops(struct device *dev)
>         if (!dev->of_node)
>                 goto err;
> 
> -       if (of_property_read_u32(dev->of_node, "xen,backend-domid", &domid)) {
> -               dev_err(dev, "xen,backend-domid property is not present\n");
> +       if (of_parse_phandle_with_args(dev->of_node, "iommus", "#iommu-cells",
> +                       0, &iommu_spec)) {
> +               dev_err(dev, "Cannot parse iommus property\n");
> +               goto err;
> +       }
> +
> +       if (!of_device_is_compatible(iommu_spec.np, "xen,grant-dma") ||
> +                       iommu_spec.args_count != 1) {
> +               dev_err(dev, "Incompatible IOMMU node\n");
> +               of_node_put(iommu_spec.np);
>                 goto err;
>         }
> 
> +       of_node_put(iommu_spec.np);
> +
>         data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>         if (!data)
>                 goto err;
> 
> -       data->backend_domid = domid;
> +       /*
> +        * The endpoint ID here means the ID of the domain where the
> corresponding
> +        * backend is running
> +        */
> +       data->backend_domid = iommu_spec.args[0];
> 
>         if (xa_err(xa_store(&xen_grant_dma_devices, (unsigned long)dev, data,
>                         GFP_KERNEL))) {
> (END)
> 
> 
> 
> Below, the nodes generated by Xen toolstack:
> 
>         xen_grant_dma {
>                 compatible = "xen,grant-dma";
>                 #iommu-cells = <0x01>;
>                 phandle = <0xfde9>;
>         };
> 
>         virtio@2000000 {
>                 compatible = "virtio,mmio";
>                 reg = <0x00 0x2000000 0x00 0x200>;
>                 interrupts = <0x00 0x01 0xf01>;
>                 interrupt-parent = <0xfde8>;
>                 dma-coherent;
>                 iommus = <0xfde9 0x01>;
>         };
 
Not bad! I like it.
 
 
> I am wondering, would be the proper solution to eliminate deferred probe
> timeout issue in our particular case (without introducing an extra IOMMU
> driver)?

In reality I don't think there is a way to do that. I would create an
empty skelethon IOMMU driver for xen,grant-dma.
--8323329-279637414-1653357495=:1905099--

