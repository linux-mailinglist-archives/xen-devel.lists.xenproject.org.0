Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4372F1C3704
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 12:37:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVYT2-00057R-16; Mon, 04 May 2020 10:36:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8vuU=6S=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jVYT0-00057G-AI
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 10:36:54 +0000
X-Inumbo-ID: 2b631c74-8df3-11ea-ae69-bc764e2007e4
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b631c74-8df3-11ea-ae69-bc764e2007e4;
 Mon, 04 May 2020 10:36:53 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id c2so11717397iow.7
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2020 03:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z7DhdbVuTWBeX+O4IPd0jTsuX2yd4sCb6clmYEE1/2Y=;
 b=nlgXE82f7j9kP+WX8XVKFvYdi+Bei6QtLD/bGWYqOs5xa2gOK2qYedOb4kwpYNNIWe
 UjDj+GHbPtqITCCjqm8/YBHYjrP1wksZ6GA3Uh9xNyaKVUWMRxC4gfMq1P5ja5YtOKFy
 oP9DpIlltRjra1LN6yaHicfgA5DA0HVDMwnpy8qUGoHTW5gWkVloupdNQWY6aTh5R3YD
 lZwrapJiwQQFv4wsMcY2GNByeymiyohY6ki6OJE/RZahpahMhdZiepk3j1YSb2x8XiQu
 5vzehZR+PV6Lpwj/uVoxEAM6bDqRyJKUF7GAxWlOGqFCAAM3D6AxRCirX/4gK6/ZatvO
 wMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z7DhdbVuTWBeX+O4IPd0jTsuX2yd4sCb6clmYEE1/2Y=;
 b=tt518HvN/E5Og948tPIzz5WnY+1XFTJJ9h3C7byNEDrjVJKxVCtp258Ry2ZjcElN1W
 PzMIjONRO8pFFwgvhqyEMTuQBWxCfU7NW62TZkURylV+xJ+ZLqkqFtNp8Oo22/8ZE93f
 fuam4FO/thw29F2HjbXXFjsL2CE1Y62xW+hOmXij9cqoGVx2wkNg+ro7+qNN10xV6MXz
 Qw4ScBAAORMfwbL3G4Bf1xnawgfBODnsTG49YmEQ9zmchB8jYS/NgaYFHCTKuAi7nXT2
 Has7hIGSHKmGSGEVydvF/Z7VFcI5/IM5ZIitrbPZQkarR4jT3MJL4wQfd/CrXTjFwhWD
 4ehw==
X-Gm-Message-State: AGi0PuZulKr7gbyOw4TKg9BLYdwdzoBJ3d+/YIqzwzrJdeW23H21Oq6y
 Zfc32xzNTak2RBftgEFznmgG+hiyylnzT0HuNyo=
X-Google-Smtp-Source: APiQypI/2x+ooVsvfmTtWvfpWFQmLFmEX7KN3UuIFQbZR1+rjq/Nb+KNsXHA+PPOQK++HABjNmHkTp/zrsL9NPwFC9s=
X-Received: by 2002:a5e:d918:: with SMTP id n24mr14699845iop.28.1588588612306; 
 Mon, 04 May 2020 03:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200429030409.9406-1-gorbak25@gmail.com>
 <20200429030409.9406-3-gorbak25@gmail.com>
In-Reply-To: <20200429030409.9406-3-gorbak25@gmail.com>
From: Paul Durrant <xadimgnik@gmail.com>
Date: Mon, 4 May 2020 11:36:41 +0100
Message-ID: <CAAgS=SmOQqJco70uK5Ept=ex5nf6WsB2YO0EAnC7S=3ocnJ=6Q@mail.gmail.com>
Subject: RE: [PATCH v2 2/2] Improve legacy vbios handling
To: Grzegorz Uriasz <gorbak25@gmail.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Artur Puzio <artur@puzio.waw.pl>,
 Stefano Stabellini <sstabellini@kernel.org>, jakub@bartmin.ski,
 marmarek@invisiblethingslab.com, Anthony Perard <anthony.perard@citrix.com>,
 Jakub Nowak <j.nowak26@student.uw.edu.pl>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Grzegorz Uriasz <gorbak25@gmail.com>
> Sent: 29 April 2020 04:04
> To: qemu-devel@nongnu.org
> Cc: Grzegorz Uriasz <gorbak25@gmail.com>;
marmarek@invisiblethingslab.com; artur@puzio.waw.pl;
> jakub@bartmin.ski; j.nowak26@student.uw.edu.pl; Stefano Stabellini
<sstabellini@kernel.org>; Anthony
> Perard <anthony.perard@citrix.com>; Paul Durrant <paul@xen.org>;
xen-devel@lists.xenproject.org
> Subject: [PATCH v2 2/2] Improve legacy vbios handling
>
> The current method of getting the vbios is broken - it just isn't
working on any device I've tested -
> the reason
> for this is explained in the previous patch. The vbios is polymorphic
and getting a proper unmodified
> copy is
> often not possible without reverse engineering the firmware. We don't
need an unmodified copy for most
> purposes -
> an unmodified copy is only needed for initializing the bios framebuffer
and providing the bios with a
> corrupted
> copy of the rom won't do any damage as the bios will just ignore the
rom.
>
> After the i915 driver takes over the vbios is only needed for reading
some metadata/configuration
> stuff etc...
> I've tested that not having any kind of vbios in the guest actually
works fine but on older
> generations of IGD
> there are some slight hiccups. To maximize compatibility the best
approach is to just copy the results
> of the vbios
> execution directly to the guest. It turns out the vbios is always
present on an hardcoded memory range
> in a reserved
> memory range from real mode - all we need to do is to memcpy it into the
guest.
>
> The following patch does 2 things:
> 1) When pci_assign_dev_load_option_rom fails to read the vbios from
sysfs(this works only when the igd
> is not the
> boot gpu - this is unlikely to happen) it falls back to using /dev/mem
to copy the vbios directly to
> the guest.
> Using /dev/mem should be fine as there is more xen specific pci code
which also relies on /dev/mem.

Why bother with sysfs at all if it is unlikely to work?

> 2) When dealing with IGD in the more generic code we skip the allocation
of the rom resource - the
> reason for this is to prevent
> a malicious guest from modifying the vbios in the host -> this is needed
as someone might try to pwn
> the i915 driver in the host by doing so
> (attach igd to guest, guest modifies vbios, the guest is terminated and
the idg is reattached to the
> host, i915 driver in the host uses data from the modified vbios).
> This is also needed to not overwrite the proper shadow copy made before.
>
> I've tested this patch and it works fine - the guest isn't complaining
about the missing vbios tables
> and the pci config
> space in the guest looks fine.
>
> Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
> ---
>  hw/xen/xen_pt.c          |  8 +++++--
>  hw/xen/xen_pt_graphics.c | 48 +++++++++++++++++++++++++++++++++++++---
>  hw/xen/xen_pt_load_rom.c |  2 +-
>  3 files changed, 52 insertions(+), 6 deletions(-)
>
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index b91082cb8b..ffc3559dd4 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -483,8 +483,12 @@ static int
xen_pt_register_regions(XenPCIPassthroughState *s, uint16_t *cmd)
>                     i, r->size, r->base_addr, type);
>      }
>
> -    /* Register expansion ROM address */
> -    if (d->rom.base_addr && d->rom.size) {
> +    /*
> +     * Register expansion ROM address. If we are dealing with a ROM
> +     * shadow copy for legacy vga devices then don't bother to map it
> +     * as previous code creates a proper shadow copy
> +     */
> +    if (d->rom.base_addr && d->rom.size &&
!(is_igd_vga_passthrough(d))) {

You don't need the brackets around is_igd_vga_passthrough()

  Paul


>          uint32_t bar_data = 0;
>
>          /* Re-set BAR reported by OS, otherwise ROM can't be read. */
> diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
> index a3bc7e3921..fe0ef2685c 100644
> --- a/hw/xen/xen_pt_graphics.c
> +++ b/hw/xen/xen_pt_graphics.c
> @@ -129,7 +129,7 @@ int xen_pt_unregister_vga_regions(XenHostPCIDevice
*dev)
>      return 0;
>  }
>
> -static void *get_vgabios(XenPCIPassthroughState *s, int *size,
> +static void *get_sysfs_vgabios(XenPCIPassthroughState *s, int *size,
>                         XenHostPCIDevice *dev)
>  {
>      return pci_assign_dev_load_option_rom(&s->dev, size,
> @@ -137,6 +137,45 @@ static void *get_vgabios(XenPCIPassthroughState *s,
int *size,
>                                            dev->dev, dev->func);
>  }
>
> +static void xen_pt_direct_vbios_copy(XenPCIPassthroughState *s, Error
**errp)
> +{
> +    int fd = -1;
> +    void *guest_bios = NULL;
> +    void *host_vbios = NULL;
> +    /* This is always 32 pages in the real mode reserved region */
> +    int bios_size = 32 << XC_PAGE_SHIFT;
> +    int vbios_addr = 0xc0000;
> +
> +    fd = open("/dev/mem", O_RDONLY);
> +    if (fd == -1) {
> +        error_setg(errp, "Can't open /dev/mem: %s", strerror(errno));
> +        return;
> +    }
> +    host_vbios = mmap(NULL, bios_size,
> +            PROT_READ, MAP_ANONYMOUS | MAP_PRIVATE, fd, vbios_addr);
> +    close(fd);
> +
> +    if (host_vbios == MAP_FAILED) {
> +        error_setg(errp, "Failed to mmap host vbios: %s",
strerror(errno));
> +        return;
> +    }
> +
> +    memory_region_init_ram(&s->dev.rom, OBJECT(&s->dev),
> +            "legacy_vbios.rom", bios_size, &error_abort);
> +    guest_bios = memory_region_get_ram_ptr(&s->dev.rom);
> +    memcpy(guest_bios, host_vbios, bios_size);
> +
> +    if (munmap(host_vbios, bios_size) == -1) {
> +        XEN_PT_LOG(&s->dev, "Failed to unmap host vbios: %s\n",
strerror(errno));
> +    }
> +
> +    cpu_physical_memory_write(vbios_addr, guest_bios, bios_size);
> +    memory_region_set_address(&s->dev.rom, vbios_addr);
> +    pci_register_bar(&s->dev, PCI_ROM_SLOT,
PCI_BASE_ADDRESS_SPACE_MEMORY, &s->dev.rom);
> +    s->dev.has_rom = true;
> +    XEN_PT_LOG(&s->dev, "Legacy VBIOS registered\n");
> +}
> +
>  /* Refer to Seabios. */
>  struct rom_header {
>      uint16_t signature;
> @@ -179,9 +218,11 @@ void xen_pt_setup_vga(XenPCIPassthroughState *s,
XenHostPCIDevice *dev,
>          return;
>      }
>
> -    bios = get_vgabios(s, &bios_size, dev);
> +    bios = get_sysfs_vgabios(s, &bios_size, dev);
>      if (!bios) {
> -        error_setg(errp, "VGA: Can't get VBIOS");
> +        XEN_PT_LOG(&s->dev, "Unable to get host VBIOS from sysfs - "
> +                            "falling back to a direct copy of memory
ranges\n");
> +        xen_pt_direct_vbios_copy(s, errp);
>          return;
>      }
>
> @@ -223,6 +264,7 @@ void xen_pt_setup_vga(XenPCIPassthroughState *s,
XenHostPCIDevice *dev,
>
>      /* Currently we fixed this address as a primary for legacy BIOS. */
>      cpu_physical_memory_write(0xc0000, bios, bios_size);
> +    XEN_PT_LOG(&s->dev, "Legacy VBIOS registered\n");
>  }
>
>  uint32_t igd_read_opregion(XenPCIPassthroughState *s)
> diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
> index 9f100dc159..8cd9aa84dc 100644
> --- a/hw/xen/xen_pt_load_rom.c
> +++ b/hw/xen/xen_pt_load_rom.c
> @@ -65,7 +65,7 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
>          goto close_rom;
>      }
>
> -    pci_register_bar(dev, PCI_ROM_SLOT, 0, &dev->rom);
> +    pci_register_bar(dev, PCI_ROM_SLOT, PCI_BASE_ADDRESS_SPACE_MEMORY,
&dev->rom);
>      dev->has_rom = true;
>      *size = st.st_size;
>  close_rom:
> --
> 2.26.1

