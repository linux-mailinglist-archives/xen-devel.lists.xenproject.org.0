Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489BDA55AF3
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 00:39:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904356.1312246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqKoL-0003RA-7h; Thu, 06 Mar 2025 23:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904356.1312246; Thu, 06 Mar 2025 23:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqKoL-0003Ob-4Z; Thu, 06 Mar 2025 23:39:29 +0000
Received: by outflank-mailman (input) for mailman id 904356;
 Thu, 06 Mar 2025 23:39:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wead=VZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tqKoJ-0003OV-MK
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 23:39:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c2ee659-fae4-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 00:39:25 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 957155C5AA8;
 Thu,  6 Mar 2025 23:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1301BC4CEE0;
 Thu,  6 Mar 2025 23:39:21 +0000 (UTC)
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
X-Inumbo-ID: 3c2ee659-fae4-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741304363;
	bh=wzzmNtslR/vagE5h1Ogs9418U/CX41rQVyV6RD0k0QM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ksbbE8Cmvip4PsI21VCmNANnTEaycdHTvjv+xdkaPjyupo9gJSf5apaTK140hM0Tp
	 54aCMxcuNf7DCUq+H/HTno5ADgJZQ8PqRlr6BP4bQbx8CuxZVo9OwaorxoCNphGSVK
	 sqmrLXNf2bmy0rXxTIz2Kh88eDMzNyha3c9SfEEyczAJ/Oh9D/dFE3CYZehZtQnPvJ
	 BggU0dwqr/okavoGNl1YXTjQUjolZGdlmVLO3mJFOS/XKWYJoaOBwXNi9UUbl23sFn
	 24vBsirF6x6zAXSo1ZW2mMMGJ7vRbyO2yZTDF4jU31Y4nYyGOB16zaBwo80SY3r7rv
	 xXlOsC35ANb2g==
Date: Thu, 6 Mar 2025 15:39:18 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alessandro Muggianu <alemuggianu@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, xenia.ragiadakou@amd.com, 
    Ray.Huang@amd.com
Subject: Re: [RFC] qxl: add additional vram regions to Xen physmap
In-Reply-To: <CAOiua5Ojg9s24eaQkfDuUBMJffABuBEMkohHTjuF5b=-oE3ADw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2503061538490.2600338@ubuntu-linux-20-04-desktop>
References: <CAOiua5Ojg9s24eaQkfDuUBMJffABuBEMkohHTjuF5b=-oE3ADw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+Xenia, Ray

On Thu, 6 Mar 2025, Alessandro Muggianu wrote:
> Hi all,
> 
> Using QXL graphics on Windows 10 hvm domains causes the guest to become
> extremely slow. The behaviour will happen as soon as Windows loads the
> driver, so the VM will initially work normally while the OS is loading.
> 
> This was reproduced on the current master but to my knowledge it's
> always been an issue for Windows 10 guests on Xen (issue is not present
> on KVM).
> 
> The normal VGA display adapter uses a single vram memory region which is
> registered as the Xen framebuffer with xen_register_framebuffer().
> This will cause it to be mapped to the Xen physmap in xen_add_to_physmap().
> 
> In the case of one or multiple QXL devices, only the first memory region
> of the first (primary) device will be registered with Xen as framebuffer
> and added to physmap (since it reuses the vga code), while I think all
> other memory regions will be accessed via the IOREQ server, which
> probably has too much overhead and seems to be the cause of the
> unresponsive guest.
> 
> We made an attempt at fixing the problem by forcing those memory regions
> to be added to the Xen physmap in xen_add_to_physmap().
> 
> This solves the performance issue and seems to be enough to make
> QXL work. Multi-screen, additional resolutions, etc., all seems fine.
> 
> However, there is a lot I don't understand so I am not sure the change
> is sensible. Hoping to get some expert eyes on this.
> 
> I see these issues with the current change:
> 
> * Broken migration. When trying to restore the domain, this assertion
>   will fail for the qxl memory regions I added to the physmap (the ones
>   named "qxl.vram" or "qxl.vgavram"), because the address returned by
>   xen_replace_cache_entry() is different from what we get from
>   memory_region_get_ram_ptr():
> 
>     qemu-system-i386: ../hw/i386/xen/xen-hvm.c:317:
> xen_add_to_physmap: Assertion `p && p ==
> memory_region_get_ram_ptr(mr)' failed.
> 
>   If I understand correctly, we try to recreate the physmap entry for
>   the region by calling xen_replace_cache_entry(), which retrieves
>   the guest memory address using xenforeignmemory_map2(), since the VRAM
>   should belong to the guest and not QEMU (however this might not be the
>   case for the QXL memory regions?). The address we obtain should
>   also match the one obtained through memory_region_get_ram_ptr(),
>   which (I think) will come from the restored VM state.
> 
>   In qxl.c, I'm only calling memory_region_get_ram_ptr(&qxl->vram_bar)
>   to ensure the region is mapped on the host (not doing so will cause
>   issues later), but I'm not using the returned pointer anywhere.
>   Maybe it's supposed to be saved with the VM state?
> 
> * Now that I'm using a list of regions registered as Xen framebuffer, I
>   don't know what to do in xen_sync_dirty_bitmap(). At the moment I
>   forced it to only call memory_region_set_dirty() on the "original"
>   framebuffer in a quick and dirty way, since it seems like we get there
>   only from the vga code but not from the QXL code, which seems to use
>   memory_region_set_dirty() instead (from qxl_set_dirty()).
> 
> * I used memory_region_set_log(<qxl_mem_region>, true, DIRTY_MEMORY_VGA)
>    or the regions won't be actually added in arch_xen_set_memory(). I don't
>    know if that's the right call, I just copied what we do for std VGA.
> 
> Hoping there isn't a fundamental issue with the approach, it would be
> great to have this working!
> 
> The issue should be easy to reproduce but please let me know if I failed
> to provide some important information.
> 
> Thank you,
> 
> Alessandro
> 
> ---
> 
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index 7178dec85d..80dc0b2131 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -29,6 +29,7 @@
>  #include "qemu/main-loop.h"
>  #include "qemu/module.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/xen/xen.h"
>  #include "sysemu/runstate.h"
>  #include "migration/vmstate.h"
>  #include "trace.h"
> @@ -2139,11 +2140,14 @@ static void qxl_realize_common(PCIQXLDevice
> *qxl, Error **errp)
>      memory_region_init_alias(&qxl->vram32_bar, OBJECT(qxl), "qxl.vram32",
>                               &qxl->vram_bar, 0, qxl->vram32_size);
> 
> +    memory_region_get_ram_ptr(&qxl->vram_bar);
>      memory_region_init_io(&qxl->io_bar, OBJECT(qxl), &qxl_io_ops, qxl,
>                            "qxl-ioports", io_size);
>      if (qxl->have_vga) {
>          vga_dirty_log_start(&qxl->vga);
>      }
> +    xen_register_framebuffer(&qxl->vram_bar);
> +    memory_region_set_log(&qxl->vram_bar, true, DIRTY_MEMORY_VGA);
>      memory_region_set_flush_coalesced(&qxl->io_bar);
> 
> 
> @@ -2268,6 +2272,9 @@ static void qxl_realize_secondary(PCIDevice
> *dev, Error **errp)
>      qxl->id = qemu_console_get_index(qxl->vga.con); /* == channel_id */
> 
>      qxl_realize_common(qxl, errp);
> +
> +    xen_register_framebuffer(&qxl->vga.vram);
> +    memory_region_set_log(&qxl->vga.vram, true, DIRTY_MEMORY_VGA);
>  }
> 
>  static int qxl_pre_save(void *opaque)
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 4f6446600c..33c7c14804 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -14,6 +14,8 @@
>  #include "qapi/qapi-commands-migration.h"
>  #include "trace.h"
> 
> +#include "exec/ramblock.h"
> +
>  #include "hw/i386/pc.h"
>  #include "hw/irq.h"
>  #include "hw/i386/apic-msidef.h"
> @@ -26,7 +28,7 @@
>  #include "exec/target_page.h"
> 
>  static MemoryRegion ram_640k, ram_lo, ram_hi;
> -static MemoryRegion *framebuffer;
> +static QLIST_HEAD(, XenFramebuffer) xen_framebuffer;
>  static bool xen_in_migration;
> 
>  /* Compatibility with older version */
> @@ -175,6 +177,17 @@ static void xen_ram_init(PCMachineState *pcms,
>      }
>  }
> 
> +static MemoryRegion *get_framebuffer_by_name(const char *name) {
> +    XenFramebuffer *fb = NULL;
> +
> +    QLIST_FOREACH(fb, &xen_framebuffer, list) {
> +        if (g_strcmp0(memory_region_name(fb->mr), name) == 0) {
> +            return fb->mr;
> +        }
> +    }
> +    return NULL;
> +}
> +
>  static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size,
>                                     int page_mask)
>  {
> @@ -254,6 +267,7 @@ static int xen_add_to_physmap(XenIOState *state,
>      unsigned long nr_pages;
>      int rc = 0;
>      XenPhysmap *physmap = NULL;
> +    XenFramebuffer *fb = NULL;
>      hwaddr pfn, start_gpfn;
>      hwaddr phys_offset = memory_region_get_ram_addr(mr);
>      const char *mr_name;
> @@ -269,9 +283,14 @@ static int xen_add_to_physmap(XenIOState *state,
>       * the linear framebuffer to be that region.
>       * Avoid tracking any regions that is not videoram and avoid tracking
>       * the legacy vga region. */
> -    if (mr == framebuffer && start_addr > 0xbffff) {
> -        goto go_physmap;
> +    if (start_addr > 0xbffff) {
> +        QLIST_FOREACH(fb, &xen_framebuffer, list) {
> +            if (mr == fb->mr) {
> +                goto go_physmap;
> +            }
> +        }
>      }
> +
>      return -1;
> 
>  go_physmap:
> @@ -293,6 +312,7 @@ go_physmap:
>          /* Now when we have a physmap entry we can replace a dummy mapping with
>           * a real one of guest foreign memory. */
>          uint8_t *p = xen_replace_cache_entry(phys_offset, start_addr, size);
> +        // For qxl.vram this assert will fail
>          assert(p && p == memory_region_get_ram_ptr(mr));
> 
>          return 0;
> @@ -406,7 +426,8 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
>  #define ENODATA  ENOENT
>  #endif
>          if (errno == ENODATA) {
> -            memory_region_set_dirty(framebuffer, 0, size);
> +            MemoryRegion *fb = get_framebuffer_by_name("vga.vram");
> +            memory_region_set_dirty(fb, 0, size);
>              DPRINTF("xen: track_dirty_vram failed (0x" HWADDR_FMT_plx
>                      ", 0x" HWADDR_FMT_plx "): %s\n",
>                      start_addr, start_addr + size, strerror(errno));
> @@ -419,8 +440,10 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
>          while (map != 0) {
>              j = ctzl(map);
>              map &= ~(1ul << j);
> -            memory_region_set_dirty(framebuffer,
> -                                    (i * width + j) * page_size, page_size);
> +            MemoryRegion *fb = get_framebuffer_by_name("vga.vram");
> +            memory_region_set_dirty(fb,
> +                                   (i * width + j) * page_size, page_size);
> +
>          };
>      }
>  }
> @@ -618,6 +641,8 @@ void xen_hvm_init_pc(PCMachineState *pcms,
> MemoryRegion **ram_memory)
> 
>      xen_is_stubdomain = xen_check_stubdomain(state->xenstore);
> 
> +    QLIST_INIT(&xen_framebuffer);
> +
>      QLIST_INIT(&xen_physmap);
>      xen_read_physmap(state);
> 
> @@ -658,7 +683,12 @@ err:
> 
>  void xen_register_framebuffer(MemoryRegion *mr)
>  {
> -    framebuffer = mr;
> +    XenFramebuffer *fb = NULL;
> +
> +    fb= g_new(XenFramebuffer, 1);
> +    fb->mr = mr;
> +
> +    QLIST_INSERT_HEAD(&xen_framebuffer, fb, list);
>  }
> 
>  void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
> diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
> index 3d796235dc..8eba992c55 100644
> --- a/include/hw/xen/xen-hvm-common.h
> +++ b/include/hw/xen/xen-hvm-common.h
> @@ -43,6 +43,13 @@ static inline ioreq_t
> *xen_vcpu_ioreq(shared_iopage_t *shared_page, int vcpu)
> 
>  #define BUFFER_IO_MAX_DELAY  100
> 
> +typedef struct XenFramebuffer {
> +    MemoryRegion *mr;
> +
> +    QLIST_ENTRY(XenFramebuffer) list;
> +} XenFramebuffer;
> +
> +
>  typedef struct XenPhysmap {
>      hwaddr start_addr;
>      ram_addr_t size;
> 

