Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B22ED7D7A24
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 03:27:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623395.971247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvp9h-0003lL-HN; Thu, 26 Oct 2023 01:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623395.971247; Thu, 26 Oct 2023 01:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvp9h-0003j3-Do; Thu, 26 Oct 2023 01:27:25 +0000
Received: by outflank-mailman (input) for mailman id 623395;
 Thu, 26 Oct 2023 01:27:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2QB=GI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qvp9g-0003iq-3M
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 01:27:24 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce18c562-739e-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 03:27:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 50CC6CE3C81;
 Thu, 26 Oct 2023 01:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18CE0C433C7;
 Thu, 26 Oct 2023 01:27:12 +0000 (UTC)
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
X-Inumbo-ID: ce18c562-739e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698283634;
	bh=Ii3W8WPXM+HaC7H23lkbyui90eXEuTIW1dNd/XtNoaw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UVcUJrsETKIvGaOKN6+h4LRyyW5MwynTcXdxGg1sFjPh0+NHnCz6Yec0TLSqT815t
	 BL5mRFd/7ttTQ1+cEMgRFYjs4HMpSo+W4GWBI+tk4OtaEfQOcbLbWuUwUuAsBafw6z
	 gRXLbxOjbM9bfPmEN0KQC5AefHKsdF6v5+tdoCsji2UgPybHLw5eiMGqp86kPnV30L
	 teNYSKI+i705sF0bnmTqyX2e9IVzkQ+sts1l1bqJftrhmndVi57dG1Smm4jRMuGT+8
	 FoVcNXzPRnzNOSLyltN9MGctXJTh4n1ILOyOonaa5swWyntFlLe/QP2H2HMLprJOFv
	 M3iIOxAe/WjWw==
Date: Wed, 25 Oct 2023 18:27:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Eduardo Habkost <eduardo@habkost.net>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [QEMU][PATCHv2 3/8] xen: add pseudo RAM region for grant
 mappings
In-Reply-To: <20231025212422.30371-4-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2310251826500.271731@ubuntu-linux-20-04-desktop>
References: <20231025212422.30371-1-vikram.garhwal@amd.com> <20231025212422.30371-4-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Oct 2023, Vikram Garhwal wrote:
> From: Juergen Gross <jgross@suse.com>
> 
> Add a memory region which can be used to automatically map granted
> memory. It is starting at 0x8000000000000000ULL in order to be able to
> distinguish it from normal RAM.
> 
> For this reason the xen.ram memory region is expanded, which has no
> further impact as it is used just as a container of the real RAM
> regions and now the grant region.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/i386/xen/xen-hvm.c           |  3 +++
>  hw/xen/xen-hvm-common.c         |  4 ++--
>  hw/xen/xen-mapcache.c           | 27 +++++++++++++++++++++++++++
>  include/hw/xen/xen-hvm-common.h |  2 ++
>  include/hw/xen/xen_pvdev.h      |  3 +++
>  include/sysemu/xen-mapcache.h   |  3 +++
>  6 files changed, 40 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index f42621e674..67a55558a6 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -172,6 +172,9 @@ static void xen_ram_init(PCMachineState *pcms,
>                                   x86ms->above_4g_mem_size);
>          memory_region_add_subregion(sysmem, 0x100000000ULL, &ram_hi);
>      }
> +
> +    /* Add grant mappings as a pseudo RAM region. */
> +    ram_grants = *xen_init_grant_ram();
>  }
>  
>  static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size)
> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index 565dc39c8f..b7255977a5 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -9,7 +9,7 @@
>  #include "hw/boards.h"
>  #include "hw/xen/arch_hvm.h"
>  
> -MemoryRegion ram_memory;
> +MemoryRegion ram_memory, ram_grants;
>  
>  void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
>                     Error **errp)
> @@ -26,7 +26,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
>          return;
>      }
>  
> -    if (mr == &ram_memory) {
> +    if (mr == &ram_memory || mr == &ram_grants) {
>          return;
>      }
>  
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index f7d974677d..8115c44c00 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -14,7 +14,9 @@
>  
>  #include <sys/resource.h>
>  
> +#include "hw/xen/xen-hvm-common.h"
>  #include "hw/xen/xen_native.h"
> +#include "hw/xen/xen_pvdev.h"
>  #include "qemu/bitmap.h"
>  
>  #include "sysemu/runstate.h"
> @@ -597,3 +599,28 @@ uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
>      mapcache_unlock();
>      return p;
>  }
> +
> +MemoryRegion *xen_init_grant_ram(void)
> +{
> +    RAMBlock *block;
> +
> +    memory_region_init(&ram_grants, NULL, "xen.grants",
> +                       XEN_MAX_VIRTIO_GRANTS * XC_PAGE_SIZE);
> +    block = g_malloc0(sizeof(*block));
> +    block->mr = &ram_grants;
> +    block->used_length = XEN_MAX_VIRTIO_GRANTS * XC_PAGE_SIZE;
> +    block->max_length = XEN_MAX_VIRTIO_GRANTS * XC_PAGE_SIZE;
> +    block->fd = -1;
> +    block->page_size = XC_PAGE_SIZE;
> +    block->host = (void *)XEN_GRANT_ADDR_OFF;
> +    block->offset = XEN_GRANT_ADDR_OFF;
> +    block->flags = RAM_PREALLOC;
> +    ram_grants.ram_block = block;
> +    ram_grants.ram = true;
> +    ram_grants.terminates = true;
> +    ram_block_add_list(block);
> +    memory_region_add_subregion(get_system_memory(), XEN_GRANT_ADDR_OFF,
> +                                &ram_grants);
> +
> +    return &ram_grants;
> +}
> diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-common.h
> index 4e9904f1a6..0d300ba898 100644
> --- a/include/hw/xen/xen-hvm-common.h
> +++ b/include/hw/xen/xen-hvm-common.h
> @@ -17,6 +17,8 @@
>  #include <xen/hvm/ioreq.h>
>  
>  extern MemoryRegion ram_memory;
> +
> +extern MemoryRegion ram_grants;
>  extern MemoryListener xen_io_listener;
>  extern DeviceListener xen_device_listener;
>  
> diff --git a/include/hw/xen/xen_pvdev.h b/include/hw/xen/xen_pvdev.h
> index ddad4b9f36..0f1b5edfa9 100644
> --- a/include/hw/xen/xen_pvdev.h
> +++ b/include/hw/xen/xen_pvdev.h
> @@ -80,4 +80,7 @@ int xen_pv_send_notify(struct XenLegacyDevice *xendev);
>  void xen_pv_printf(struct XenLegacyDevice *xendev, int msg_level,
>                     const char *fmt, ...)  G_GNUC_PRINTF(3, 4);
>  
> +#define XEN_GRANT_ADDR_OFF    0x8000000000000000ULL
> +#define XEN_MAX_VIRTIO_GRANTS 65536
> +
>  #endif /* QEMU_HW_XEN_PVDEV_H */
> diff --git a/include/sysemu/xen-mapcache.h b/include/sysemu/xen-mapcache.h
> index c8e7c2f6cf..f4bedb1c11 100644
> --- a/include/sysemu/xen-mapcache.h
> +++ b/include/sysemu/xen-mapcache.h
> @@ -10,6 +10,7 @@
>  #define XEN_MAPCACHE_H
>  
>  #include "exec/cpu-common.h"
> +#include "exec/ram_addr.h"
>  
>  typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
>                                           ram_addr_t size);
> @@ -25,6 +26,8 @@ void xen_invalidate_map_cache(void);
>  uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
>                                   hwaddr new_phys_addr,
>                                   hwaddr size);
> +MemoryRegion *xen_init_grant_ram(void);
> +
>  #else
>  
>  static inline void xen_map_cache_init(phys_offset_to_gaddr_t f,
> -- 
> 2.17.1
> 

