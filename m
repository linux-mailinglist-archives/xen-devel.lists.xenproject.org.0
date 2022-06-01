Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078FF539A96
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 03:04:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340130.565082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwCmf-0002dt-HW; Wed, 01 Jun 2022 01:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340130.565082; Wed, 01 Jun 2022 01:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwCmf-0002b5-EG; Wed, 01 Jun 2022 01:04:25 +0000
Received: by outflank-mailman (input) for mailman id 340130;
 Wed, 01 Jun 2022 01:04:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nwCme-0002az-ES
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 01:04:24 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c605d59f-e146-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 03:04:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 79F94B816D7;
 Wed,  1 Jun 2022 01:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A09C385A9;
 Wed,  1 Jun 2022 01:04:20 +0000 (UTC)
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
X-Inumbo-ID: c605d59f-e146-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654045461;
	bh=kW5xdDcGdNBM55f+KPx7Jkd8syxwJ//ekvpEVj5fpIg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=j3p+qbK3MoH6Hna9Wv7INOefAW+kCSe8/T9nNxnQs/3gxiqD/91gJIywTlvmp6ltD
	 3WNm901iZLSNvlpjNk1+yahbcFFTqIIensrcyZ0aP1EIFWRqFghA+EU71IhRpqQj7T
	 vvhYDnYOBBZsgAqz9fQ65ZztXFuM42FoQdfWnHZKvCKIvh2dlq0eHJSVQ5gd50HZhs
	 tZlNdloM5zXoBTFn5PFz2QfH1TquihkOEYq+DA7PupBAc5kJwYFh60Rd8f2nDSTjiX
	 8Z+X8EoM2lJ63L+Dq+GMQ3lkMosnKX2OQJvkr7n0H0n4fFmUZqeuve9K6qTlEiu2T8
	 tAYEAdZ2KVc3g==
Date: Tue, 31 May 2022 18:04:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH V2] libxl/arm: Create specific IOMMU node to be referred
 by virtio-mmio device
In-Reply-To: <1653944813-17970-1-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2205311755010.1905099@ubuntu-linux-20-04-desktop>
References: <1653944813-17970-1-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-526242627-1654045461=:1905099"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-526242627-1654045461=:1905099
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 31 May 2022, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Reuse generic IOMMU device tree bindings to communicate Xen specific
> information for the virtio devices for which the restricted memory
> access using Xen grant mappings need to be enabled.
> 
> Insert "iommus" property pointed to the IOMMU node with "xen,grant-dma"
> compatible to all virtio devices which backends are going to run in
> non-hardware domains (which are non-trusted by default).
> 
> Based on device-tree binding from Linux:
> Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
> 
> The example of generated nodes:
> 
> xen_iommu {
>     compatible = "xen,grant-dma";
>     #iommu-cells = <0x01>;
>     phandle = <0xfde9>;
> };
> 
> virtio@2000000 {
>     compatible = "virtio,mmio";
>     reg = <0x00 0x2000000 0x00 0x200>;
>     interrupts = <0x00 0x01 0xf01>;
>     interrupt-parent = <0xfde8>;
>     dma-coherent;
>     iommus = <0xfde9 0x01>;
> };
> 
> virtio@2000200 {
>     compatible = "virtio,mmio";
>     reg = <0x00 0x2000200 0x00 0x200>;
>     interrupts = <0x00 0x02 0xf01>;
>     interrupt-parent = <0xfde8>;
>     dma-coherent;
>     iommus = <0xfde9 0x01>;
> };
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> !!! This patch is based on non upstreamed yet “Virtio support for toolstack
> on Arm” V8 series which is on review now:
> https://lore.kernel.org/xen-devel/1651598763-12162-1-git-send-email-olekstysh@gmail.com/
> 
> New device-tree binding (commit #5) is a part of solution to restrict memory
> access under Xen using xen-grant DMA-mapping layer (which is also on review):
> https://lore.kernel.org/xen-devel/1653944417-17168-1-git-send-email-olekstysh@gmail.com/
> 
> Changes RFC -> V1:
>    - update commit description
>    - rebase according to the recent changes to
>      "libxl: Introduce basic virtio-mmio support on Arm"
> 
> Changes V1 -> V2:
>    - Henry already gave his Reviewed-by, I dropped it due to the changes
>    - use generic IOMMU device tree bindings instead of custom property
>      "xen,dev-domid"
>    - change commit subject and description, was
>      "libxl/arm: Insert "xen,dev-domid" property to virtio-mmio device node"
> ---
>  tools/libs/light/libxl_arm.c          | 49 ++++++++++++++++++++++++++++++++---
>  xen/include/public/device_tree_defs.h |  1 +
>  2 files changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 9be9b2a..72da3b1 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -865,9 +865,32 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
>      return 0;
>  }
>  
> +static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
> +{
> +    int res;
> +
> +    /* See Linux Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml */
> +    res = fdt_begin_node(fdt, "xen_iommu");
> +    if (res) return res;
> +
> +    res = fdt_property_compat(gc, fdt, 1, "xen,grant-dma");
> +    if (res) return res;
> +
> +    res = fdt_property_cell(fdt, "#iommu-cells", 1);
> +    if (res) return res;
> +
> +    res = fdt_property_cell(fdt, "phandle", GUEST_PHANDLE_IOMMU);
> +    if (res) return res;
> +
> +    res = fdt_end_node(fdt);
> +    if (res) return res;
> +
> +    return 0;
> +}
>  
>  static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
> -                                 uint64_t base, uint32_t irq)
> +                                 uint64_t base, uint32_t irq,
> +                                 uint32_t backend_domid)
>  {
>      int res;
>      gic_interrupt intr;
> @@ -890,6 +913,16 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
>      res = fdt_property(fdt, "dma-coherent", NULL, 0);
>      if (res) return res;
>  
> +    if (backend_domid != LIBXL_TOOLSTACK_DOMID) {
> +        uint32_t iommus_prop[2];
> +
> +        iommus_prop[0] = cpu_to_fdt32(GUEST_PHANDLE_IOMMU);
> +        iommus_prop[1] = cpu_to_fdt32(backend_domid);
> +
> +        res = fdt_property(fdt, "iommus", iommus_prop, sizeof(iommus_prop));
> +        if (res) return res;
> +    }
> +
>      res = fdt_end_node(fdt);
>      if (res) return res;
>  
> @@ -1097,6 +1130,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>      size_t fdt_size = 0;
>      int pfdt_size = 0;
>      libxl_domain_build_info *const info = &d_config->b_info;
> +    bool iommu_created;
>      unsigned int i;
>  
>      const libxl_version_info *vers;
> @@ -1204,11 +1238,20 @@ next_resize:
>          if (d_config->num_pcidevs)
>              FDT( make_vpci_node(gc, fdt, ainfo, dom) );
>  
> +        iommu_created = false;
>          for (i = 0; i < d_config->num_disks; i++) {
>              libxl_device_disk *disk = &d_config->disks[i];
>  
> -            if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO)
> -                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
> +            if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
> +                if (disk->backend_domid != LIBXL_TOOLSTACK_DOMID &&
> +                    !iommu_created) {
> +                    FDT( make_xen_iommu_node(gc, fdt) );
> +                    iommu_created = true;
> +                }
> +
> +                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
> +                                           disk->backend_domid) );
> +            }

This is a matter of taste as the code would also work as is, but I would
do the following instead:


if ( d_config->num_disks > 0 &&
     disk->backend_domid != LIBXL_TOOLSTACK_DOMID) {
     FDT( make_xen_iommu_node(gc, fdt) );
}

for (i = 0; i < d_config->num_disks; i++) {
    libxl_device_disk *disk = &d_config->disks[i];

    if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO)
        FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
}

but I would give my acked-by anyway


>          }
>  
>          if (pfdt)
> diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/device_tree_defs.h
> index 209d43d..df58944 100644
> --- a/xen/include/public/device_tree_defs.h
> +++ b/xen/include/public/device_tree_defs.h
> @@ -7,6 +7,7 @@
>   * onwards. Reserve a high value for the GIC phandle.
>   */
>  #define GUEST_PHANDLE_GIC (65000)
> +#define GUEST_PHANDLE_IOMMU (GUEST_PHANDLE_GIC + 1)
>  
>  #define GUEST_ROOT_ADDRESS_CELLS 2
>  #define GUEST_ROOT_SIZE_CELLS 2
> -- 
> 2.7.4
> 
--8323329-526242627-1654045461=:1905099--

