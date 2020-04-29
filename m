Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1892C1BD712
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 10:21:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jThxn-00027A-Lt; Wed, 29 Apr 2020 08:21:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/uTc=6N=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jThxm-000274-5j
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 08:21:02 +0000
X-Inumbo-ID: 5c0487b4-89f2-11ea-b9cf-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c0487b4-89f2-11ea-b9cf-bc764e2007e4;
 Wed, 29 Apr 2020 08:21:01 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j2so1363617wrs.9
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2020 01:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=bYaqg9ydbwBt0js6txP6ki/prPNP0trtCyBSqQbrobQ=;
 b=X/ifDRcsX//oWfrKOCF95UTlM8nTjbfEN2YNN8a3lxS7/WXdwJIVECtAdjJMtF6dnl
 9rKyYKthAh8vSUTJq/7CwI8XjEKKjH0tImI32k7XRHe/9ygtRgrOD8FwtbVCKB2pDgR1
 w9AwHePJ19NNJ3vz6Hgu1fGmjs8D/PP+R0nQOycHVYgIobXh02Z7Ey74T7Eue9qJWSW6
 ozgwk+VYqqDqjXVCw7Utot5okJA9LYrZs9SOb5PKO8DE70sY6pMdQL+Cjw2BhERZnzAg
 qQXjCHzVgi3oY7+Lxgev+Bb/e24I90hkUId50P5i4nOUY0TD0km9L2Vz7HAbA3AB0IaL
 5Z9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=bYaqg9ydbwBt0js6txP6ki/prPNP0trtCyBSqQbrobQ=;
 b=oU970X3EXyxM4HMUKpqthKeIzwdK1S7QuksQ1F6onQSDyReYMfjANitiHvMGmNu740
 MLK/rnJ8oI/59g/kUQfPduI+idIM0W1kQb2J/Yn8GsR/6TXEuuVZpOgkdQnkk2/ESDQl
 QKjeIa4Gxvcq3pkVyRzl6zRLM+9etgStfOgSEtuJEx0Ft2h/yityVY6qWgPqp4VhiU/N
 bYkK0N4WnPOhqIniOv5x1pHZRkzWS3/FShhoYlbXzHAXap07zIvsbWcpip4/c7rTN1D3
 hr+D1jiHPkwZmsFe0vP0fxPw1/Sed7W9K69WlKCYKLwR9QcXnU8UOJ8ouXuRHEXlypND
 fncQ==
X-Gm-Message-State: AGi0Puby7jf2ToZeprP6XyAJGEBD4i+johH2R0LtaGGCiGApNyO/hu/f
 RaX7id4uQ0XWdTAPC3AFkP8=
X-Google-Smtp-Source: APiQypIdTB9pj3s5+HsG0ipZxTuN6qEj6czRhMIH2sYciiFQV+4evNyC5gWUJUJvyUxzDBEnb/V7wA==
X-Received: by 2002:a5d:4b43:: with SMTP id w3mr38262885wrs.208.1588148460211; 
 Wed, 29 Apr 2020 01:21:00 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id i25sm6530739wml.43.2020.04.29.01.20.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Apr 2020 01:20:59 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Grzegorz Uriasz'" <gorbak25@gmail.com>,
	<qemu-devel@nongnu.org>
References: <20200429030409.9406-1-gorbak25@gmail.com>
 <20200429030409.9406-3-gorbak25@gmail.com>
In-Reply-To: <20200429030409.9406-3-gorbak25@gmail.com>
Subject: RE: [PATCH v2 2/2] Improve legacy vbios handling
Date: Wed, 29 Apr 2020 09:20:58 +0100
Message-ID: <000101d61dff$1d0f5b60$572e1220$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFtlR//ELGf2l/FYLvu2IzrckebEAI2wQ0TqU8dnlA=
Content-Language: en-gb
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
Reply-To: paul@xen.org
Cc: artur@puzio.waw.pl, 'Stefano Stabellini' <sstabellini@kernel.org>,
 jakub@bartmin.ski, marmarek@invisiblethingslab.com,
 'Anthony Perard' <anthony.perard@citrix.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Grzegorz Uriasz <gorbak25@gmail.com>
> Sent: 29 April 2020 04:04
> To: qemu-devel@nongnu.org
> Cc: Grzegorz Uriasz <gorbak25@gmail.com>; marmarek@invisiblethingslab.com; artur@puzio.waw.pl;
> jakub@bartmin.ski; j.nowak26@student.uw.edu.pl; Stefano Stabellini <sstabellini@kernel.org>; Anthony
> Perard <anthony.perard@citrix.com>; Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Subject: [PATCH v2 2/2] Improve legacy vbios handling
> 
> The current method of getting the vbios is broken - it just isn't working on any device I've tested -
> the reason
> for this is explained in the previous patch. The vbios is polymorphic and getting a proper unmodified
> copy is
> often not possible without reverse engineering the firmware. We don't need an unmodified copy for most
> purposes -
> an unmodified copy is only needed for initializing the bios framebuffer and providing the bios with a
> corrupted
> copy of the rom won't do any damage as the bios will just ignore the rom.
> 
> After the i915 driver takes over the vbios is only needed for reading some metadata/configuration
> stuff etc...
> I've tested that not having any kind of vbios in the guest actually works fine but on older
> generations of IGD
> there are some slight hiccups. To maximize compatibility the best approach is to just copy the results
> of the vbios
> execution directly to the guest. It turns out the vbios is always present on an hardcoded memory range
> in a reserved
> memory range from real mode - all we need to do is to memcpy it into the guest.
> 
> The following patch does 2 things:
> 1) When pci_assign_dev_load_option_rom fails to read the vbios from sysfs(this works only when the igd
> is not the
> boot gpu - this is unlikely to happen) it falls back to using /dev/mem to copy the vbios directly to
> the guest.

Why bother with sysfs if it is unlikely to work?

> Using /dev/mem should be fine as there is more xen specific pci code which also relies on /dev/mem.
> 2) When dealing with IGD in the more generic code we skip the allocation of the rom resource - the
> reason for this is to prevent
> a malicious guest from modifying the vbios in the host -> this is needed as someone might try to pwn
> the i915 driver in the host by doing so
> (attach igd to guest, guest modifies vbios, the guest is terminated and the idg is reattached to the
> host, i915 driver in the host uses data from the modified vbios).
> This is also needed to not overwrite the proper shadow copy made before.
> 
> I've tested this patch and it works fine - the guest isn't complaining about the missing vbios tables
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
> @@ -483,8 +483,12 @@ static int xen_pt_register_regions(XenPCIPassthroughState *s, uint16_t *cmd)
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
> +    if (d->rom.base_addr && d->rom.size && !(is_igd_vga_passthrough(d))) {

You don't need brackets around the function call.

  Paul

>          uint32_t bar_data = 0;
> 
>          /* Re-set BAR reported by OS, otherwise ROM can't be read. */
> diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
> index a3bc7e3921..fe0ef2685c 100644
> --- a/hw/xen/xen_pt_graphics.c
> +++ b/hw/xen/xen_pt_graphics.c
> @@ -129,7 +129,7 @@ int xen_pt_unregister_vga_regions(XenHostPCIDevice *dev)
>      return 0;
>  }
> 
> -static void *get_vgabios(XenPCIPassthroughState *s, int *size,
> +static void *get_sysfs_vgabios(XenPCIPassthroughState *s, int *size,
>                         XenHostPCIDevice *dev)
>  {
>      return pci_assign_dev_load_option_rom(&s->dev, size,
> @@ -137,6 +137,45 @@ static void *get_vgabios(XenPCIPassthroughState *s, int *size,
>                                            dev->dev, dev->func);
>  }
> 
> +static void xen_pt_direct_vbios_copy(XenPCIPassthroughState *s, Error **errp)
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
> +        error_setg(errp, "Failed to mmap host vbios: %s", strerror(errno));
> +        return;
> +    }
> +
> +    memory_region_init_ram(&s->dev.rom, OBJECT(&s->dev),
> +            "legacy_vbios.rom", bios_size, &error_abort);
> +    guest_bios = memory_region_get_ram_ptr(&s->dev.rom);
> +    memcpy(guest_bios, host_vbios, bios_size);
> +
> +    if (munmap(host_vbios, bios_size) == -1) {
> +        XEN_PT_LOG(&s->dev, "Failed to unmap host vbios: %s\n", strerror(errno));
> +    }
> +
> +    cpu_physical_memory_write(vbios_addr, guest_bios, bios_size);
> +    memory_region_set_address(&s->dev.rom, vbios_addr);
> +    pci_register_bar(&s->dev, PCI_ROM_SLOT, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->dev.rom);
> +    s->dev.has_rom = true;
> +    XEN_PT_LOG(&s->dev, "Legacy VBIOS registered\n");
> +}
> +
>  /* Refer to Seabios. */
>  struct rom_header {
>      uint16_t signature;
> @@ -179,9 +218,11 @@ void xen_pt_setup_vga(XenPCIPassthroughState *s, XenHostPCIDevice *dev,
>          return;
>      }
> 
> -    bios = get_vgabios(s, &bios_size, dev);
> +    bios = get_sysfs_vgabios(s, &bios_size, dev);
>      if (!bios) {
> -        error_setg(errp, "VGA: Can't get VBIOS");
> +        XEN_PT_LOG(&s->dev, "Unable to get host VBIOS from sysfs - "
> +                            "falling back to a direct copy of memory ranges\n");
> +        xen_pt_direct_vbios_copy(s, errp);
>          return;
>      }
> 
> @@ -223,6 +264,7 @@ void xen_pt_setup_vga(XenPCIPassthroughState *s, XenHostPCIDevice *dev,
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
> +    pci_register_bar(dev, PCI_ROM_SLOT, PCI_BASE_ADDRESS_SPACE_MEMORY, &dev->rom);
>      dev->has_rom = true;
>      *size = st.st_size;
>  close_rom:
> --
> 2.26.1



