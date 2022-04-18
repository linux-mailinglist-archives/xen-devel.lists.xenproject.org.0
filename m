Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61BF505F78
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 23:41:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307636.522842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngZ7f-0001gc-QU; Mon, 18 Apr 2022 21:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307636.522842; Mon, 18 Apr 2022 21:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngZ7f-0001eN-NX; Mon, 18 Apr 2022 21:41:27 +0000
Received: by outflank-mailman (input) for mailman id 307636;
 Mon, 18 Apr 2022 21:41:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hjWk=U4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ngZ7e-0001eH-KT
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 21:41:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b337284-bf60-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 23:41:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 742EC60FE4;
 Mon, 18 Apr 2022 21:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412D2C385A7;
 Mon, 18 Apr 2022 21:41:22 +0000 (UTC)
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
X-Inumbo-ID: 4b337284-bf60-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650318082;
	bh=qeusrSDpnDNRhAcxBb6eiJKfM1LFf3UbltkauHYqh3s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AUzUdmkpEJS1jb6KO5nZMgdjeH6o6Z+L0z3nJ57eWFSjUL80NSJdvP5JTNfHjkWYM
	 Zkbe9/u5ijwnAF6VJiEYcORvYX2VhKNoIjvpGjkuSvg/pyQKGP3i2VjZKWQfIbgSg4
	 Yy6kwq+RJ1aA+miWnyMkHk87r1G1dEOFK6voGEvdZ9EYJK576qM+cH9IfBbVRXWO8W
	 e3q+EP7lkGKMfBdnWAkZPyfFgMD0XCsA7JLyHg31LIxralw+cJxpa6mRH7ZGOhtlWB
	 J/retS6nZ+WAmUYfzk/6MDSzxF2PuRKpEVtL1k2l4izwcvXDydK9pQ/hbI9ltvmcu6
	 Y+quXQE4Fj41A==
Date: Mon, 18 Apr 2022 14:41:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, 
    Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jiamei Xie <Jiamei.Xie@arm.com>, Henry Wang <Henry.Wang@arm.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V7 2/2] libxl: Introduce basic virtio-mmio support on
 Arm
In-Reply-To: <1649442065-8332-3-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204181417370.915916@ubuntu-linux-20-04-desktop>
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com> <1649442065-8332-3-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-529431033-1650317034=:915916"
Content-ID: <alpine.DEB.2.22.394.2204181426371.915916@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-529431033-1650317034=:915916
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2204181426372.915916@ubuntu-linux-20-04-desktop>

On Fri, 8 Apr 2022, Oleksandr Tyshchenko wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> This patch introduces helpers to allocate Virtio MMIO params
> (IRQ and memory region) and create specific device node in
> the Guest device-tree with allocated params. In order to deal
> with multiple Virtio devices, reserve corresponding ranges.
> For now, we reserve 1MB for memory regions and 10 SPIs.
> 
> As these helpers should be used for every Virtio device attached
> to the Guest, call them for Virtio disk(s).
> 
> Please note, with statically allocated Virtio IRQs there is
> a risk of a clash with a physical IRQs of passthrough devices.
> For the first version, it's fine, but we should consider allocating
> the Virtio IRQs automatically. Thankfully, we know in advance which
> IRQs will be used for passthrough to be able to choose non-clashed
> ones.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Tested-by: Jiamei Xie <Jiamei.xie@arm.com>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

I realize that we are at v7 and I haven't reviewed this before, so I'll
limit my comments. I'll clarify the ones that I think are more important
from the one that are less important.


> ---
> @Jiamei, @Henry I decided to leave your T-b and R-b tags with the minor
> change I made, are you still happy with that?
> 
> s/if (disk->virtio)/if (disk->protocol == LIBXL_DISK_PROTOCOL_VIRTIO_MMIO)
> 
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Changes RFC -> V1:
>    - was squashed with:
>      "[RFC PATCH V1 09/12] libxl: Handle virtio-mmio irq in more correct way"
>      "[RFC PATCH V1 11/12] libxl: Insert "dma-coherent" property into virtio-mmio device node"
>      "[RFC PATCH V1 12/12] libxl: Fix duplicate memory node in DT"
>    - move VirtIO MMIO #define-s to xen/include/public/arch-arm.h
> 
> Changes V1 -> V2:
>    - update the author of a patch
> 
> Changes V2 -> V3:
>    - no changes
> 
> Changes V3 -> V4:
>    - no changes
> 
> Changes V4 -> V5:
>    - split the changes, change the order of the patches
>    - drop an extra "virtio" configuration option
>    - update patch description
>    - use CONTAINER_OF instead of own implementation
>    - reserve ranges for Virtio MMIO params and put them
>      in correct location
>    - create helpers to allocate Virtio MMIO params, add
>      corresponding sanity-сhecks
>    - add comment why MMIO size 0x200 is chosen
>    - update debug print
>    - drop Wei's T-b
> 
> Changes V5 -> V6:
>    - rebase on current staging
> 
> Changes V6 -> V7:
>    - rebase on current staging
>    - add T-b and R-b tags
>    - update according to the recent changes to
>      "libxl: Add support for Virtio disk configuration"
> ---
>  tools/libs/light/libxl_arm.c  | 131 +++++++++++++++++++++++++++++++++++++++++-
>  xen/include/public/arch-arm.h |   7 +++
>  2 files changed, 136 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index eef1de0..8132a47 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -8,6 +8,56 @@
>  #include <assert.h>
>  #include <xen/device_tree_defs.h>
>  
> +/*
> + * There is no clear requirements for the total size of Virtio MMIO region.
> + * The size of control registers is 0x100 and device-specific configuration
> + * registers starts at the offset 0x100, however it's size depends on the device
> + * and the driver. Pick the biggest known size at the moment to cover most
> + * of the devices (also consider allowing the user to configure the size via
> + * config file for the one not conforming with the proposed value).
> + */
> +#define VIRTIO_MMIO_DEV_SIZE   xen_mk_ullong(0x200)

Actually, I don't think we need to make this generic. We only support
virtio-disk now and I think it is fine if this was called
VIRTIO_DISK_MMIO_DEV_SIZE and the size was exactly the size needed by
virtio-disk. When/if we support another virtio protocol we can add set
the appropriate size of that one as well.

At the moment as you can see below:

     */
    for (i = 0; i < d_config->num_disks; i++) {
        libxl_device_disk *disk = &d_config->disks[i];

        if (disk->protocol == LIBXL_DISK_PROTOCOL_VIRTIO_MMIO) {

it is all very virtio-disk specific, so we might as well exploit it for
the better :-)

Given that we are at v7 of this series, I don't think this is very
important, so I think it is OK if we keep the code as is.


> +static uint64_t virtio_mmio_base;
> +static uint32_t virtio_mmio_irq;

No need for these two variables to be global in this file, they could be
local variables in libxl__arch_domain_prepare_config.

I think that this is a change we should make if possible before
committing these patches.



> +static void init_virtio_mmio_params(void)
> +{
> +    virtio_mmio_base = GUEST_VIRTIO_MMIO_BASE;
> +    virtio_mmio_irq = GUEST_VIRTIO_MMIO_SPI_FIRST;
> +}
> +
> +static uint64_t alloc_virtio_mmio_base(libxl__gc *gc)
> +{
> +    uint64_t base = virtio_mmio_base;

If virtio_mmio_base is local in libxl__arch_domain_prepare_config, then
it could be passed here as parameter (as pointer).

If we make the dev MMIO size (GUEST_VIRTIO_MMIO_SIZE) specific to
virtio-disk, then we could pass it also as argument to this function:

static uint64_t alloc_virtio_mmio_base(libxl__gc *gc,
                                       uint64 *virtio_mmio_base,
                                       uint64_t dev_mmio_size)


> +    /* Make sure we have enough reserved resources */
> +    if ((virtio_mmio_base + VIRTIO_MMIO_DEV_SIZE >
> +        GUEST_VIRTIO_MMIO_BASE + GUEST_VIRTIO_MMIO_SIZE)) {
> +        LOG(ERROR, "Ran out of reserved range for Virtio MMIO BASE 0x%"PRIx64"\n",
> +            virtio_mmio_base);
> +        return 0;
> +    }
> +    virtio_mmio_base += VIRTIO_MMIO_DEV_SIZE;
> +
> +    return base;
> +}
> +
> +static uint32_t alloc_virtio_mmio_irq(libxl__gc *gc)
> +{
> +    uint32_t irq = virtio_mmio_irq;
> +
> +    /* Make sure we have enough reserved resources */
> +    if (virtio_mmio_irq > GUEST_VIRTIO_MMIO_SPI_LAST) {
> +        LOG(ERROR, "Ran out of reserved range for Virtio MMIO IRQ %u\n",
> +            virtio_mmio_irq);
> +        return 0;
> +    }
> +    virtio_mmio_irq++;
> +
> +    return irq;
> +}
> +
>  static const char *gicv_to_string(libxl_gic_version gic_version)
>  {
>      switch (gic_version) {
> @@ -26,8 +76,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>  {
>      uint32_t nr_spis = 0;
>      unsigned int i;
> -    uint32_t vuart_irq;
> -    bool vuart_enabled = false;
> +    uint32_t vuart_irq, virtio_irq = 0;
> +    bool vuart_enabled = false, virtio_enabled = false;
>  
>      /*
>       * If pl011 vuart is enabled then increment the nr_spis to allow allocation
> @@ -39,6 +89,35 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>          vuart_enabled = true;
>      }
>  
> +    /*
> +     * Virtio MMIO params are non-unique across the whole system and must be
> +     * initialized for every new guest.
> +     */
> +    init_virtio_mmio_params();

No need to initialize them in init_virtio_mmio_params, you could just
do:

  uint64_t virtio_mmio_base = GUEST_VIRTIO_MMIO_BASE;
  uint32_t virtio_mmio_irq = GUEST_VIRTIO_MMIO_SPI_FIRST;

at the top of libxl__arch_domain_prepare_config


> +    for (i = 0; i < d_config->num_disks; i++) {
> +        libxl_device_disk *disk = &d_config->disks[i];
> +
> +        if (disk->protocol == LIBXL_DISK_PROTOCOL_VIRTIO_MMIO) {
> +            disk->base = alloc_virtio_mmio_base(gc);
> +            if (!disk->base)
> +                return ERROR_FAIL;
> +
> +            disk->irq = alloc_virtio_mmio_irq(gc);
> +            if (!disk->irq)
> +                return ERROR_FAIL;
> +
> +            if (virtio_irq < disk->irq)
> +                virtio_irq = disk->irq;
> +            virtio_enabled = true;
> +
> +            LOG(DEBUG, "Allocate Virtio MMIO params for Vdev %s: IRQ %u BASE 0x%"PRIx64,
> +                disk->vdev, disk->irq, disk->base);
> +        }
> +    }
> +
> +    if (virtio_enabled)
> +        nr_spis += (virtio_irq - 32) + 1;
> +
>      for (i = 0; i < d_config->b_info.num_irqs; i++) {
>          uint32_t irq = d_config->b_info.irqs[i];
>          uint32_t spi;
> @@ -58,6 +137,13 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>              return ERROR_FAIL;
>          }
>  
> +        /* The same check as for vpl011 */
> +        if (virtio_enabled &&
> +           (irq >= GUEST_VIRTIO_MMIO_SPI_FIRST && irq <= virtio_irq)) {

NIT: alignment:

        if (virtio_enabled &&
            (irq >= GUEST_VIRTIO_MMIO_SPI_FIRST && irq <= virtio_irq)) {



> +            LOG(ERROR, "Physical IRQ %u conflicting with Virtio MMIO IRQ range\n", irq);
> +            return ERROR_FAIL;
> +        }
> +
>          if (irq < 32)
>              continue;
>  
> @@ -787,6 +873,39 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
>      return 0;
>  }
>  
> +
> +static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
> +                                 uint64_t base, uint32_t irq)
> +{
> +    int res;
> +    gic_interrupt intr;
> +    /* Placeholder for virtio@ + a 64-bit number + \0 */
> +    char buf[24];
> +
> +    snprintf(buf, sizeof(buf), "virtio@%"PRIx64, base);
> +    res = fdt_begin_node(fdt, buf);
> +    if (res) return res;
> +
> +    res = fdt_property_compat(gc, fdt, 1, "virtio,mmio");
> +    if (res) return res;
> +
> +    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
> +                            1, base, VIRTIO_MMIO_DEV_SIZE);
> +    if (res) return res;
> +
> +    set_interrupt(intr, irq, 0xf, DT_IRQ_TYPE_EDGE_RISING);
> +    res = fdt_property_interrupts(gc, fdt, &intr, 1);
> +    if (res) return res;
> +
> +    res = fdt_property(fdt, "dma-coherent", NULL, 0);
> +    if (res) return res;
> +
> +    res = fdt_end_node(fdt);
> +    if (res) return res;
> +
> +    return 0;
> +}
> +
>  static const struct arch_info *get_arch_info(libxl__gc *gc,
>                                               const struct xc_dom_image *dom)
>  {
> @@ -988,6 +1107,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>      size_t fdt_size = 0;
>      int pfdt_size = 0;
>      libxl_domain_build_info *const info = &d_config->b_info;
> +    unsigned int i;
>  
>      const libxl_version_info *vers;
>      const struct arch_info *ainfo;
> @@ -1094,6 +1214,13 @@ next_resize:
>          if (d_config->num_pcidevs)
>              FDT( make_vpci_node(gc, fdt, ainfo, dom) );
>  
> +        for (i = 0; i < d_config->num_disks; i++) {
> +            libxl_device_disk *disk = &d_config->disks[i];
> +
> +            if (disk->protocol == LIBXL_DISK_PROTOCOL_VIRTIO_MMIO)
> +                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
> +        }
> +
>          if (pfdt)
>              FDT( copy_partial_fdt(gc, fdt, pfdt) );
>  
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index ab05fe1..c8b6058 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -407,6 +407,10 @@ typedef uint64_t xen_callback_t;
>  
>  /* Physical Address Space */
>  
> +/* Virtio MMIO mappings */
> +#define GUEST_VIRTIO_MMIO_BASE   xen_mk_ullong(0x02000000)
> +#define GUEST_VIRTIO_MMIO_SIZE   xen_mk_ullong(0x00100000)
> +
>  /*
>   * vGIC mappings: Only one set of mapping is used by the guest.
>   * Therefore they can overlap.
> @@ -493,6 +497,9 @@ typedef uint64_t xen_callback_t;
>  
>  #define GUEST_VPL011_SPI        32
>  
> +#define GUEST_VIRTIO_MMIO_SPI_FIRST   33
> +#define GUEST_VIRTIO_MMIO_SPI_LAST    43
> +
>  /* PSCI functions */
>  #define PSCI_cpu_suspend 0
>  #define PSCI_cpu_off     1
> -- 
> 2.7.4
> 
--8323329-529431033-1650317034=:915916--

