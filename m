Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ECC7BEF70
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 02:03:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614498.955609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq0Cg-0002Br-9D; Tue, 10 Oct 2023 00:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614498.955609; Tue, 10 Oct 2023 00:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq0Cg-0002A0-5k; Tue, 10 Oct 2023 00:02:26 +0000
Received: by outflank-mailman (input) for mailman id 614498;
 Tue, 10 Oct 2023 00:02:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z25Z=FY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qq0Ce-00029e-81
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 00:02:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48195012-6700-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 02:02:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 19C8661467;
 Tue, 10 Oct 2023 00:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8AFC433C8;
 Tue, 10 Oct 2023 00:02:17 +0000 (UTC)
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
X-Inumbo-ID: 48195012-6700-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696896139;
	bh=4iYTwEmPZb1jiFlgBkYVXVww5GMKtN89UiP07vhNGN0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CznwwrSaYzTyR2FBoOfEQ5UutoZSH8L4nZikWnnWDBV824wAe1wP8sTpYjVXliWZY
	 qiNjjGaGoEqea8RlWcxsZdohmNBPyMGnoAaYnzKYzK/nEq9GWJ6DJsHw9BVXshM8Hi
	 W4YZCbBuYptv0k/j5YyP/PkP5YBPCMiB2pCiC7Zug9VNAPO4NkA6+r9NNSUUDH9fVg
	 0MLxO5D8eyFNvnGmsCeeRLJf7bMMarViywSf8Mr/wj2MTcbPyEPCVSNWqIWsduKhJY
	 vICD2x9F43LC9leObCH9kZS7N5/XbbFqJw9vBu0wADbr2ECD+8ZkT5KxGjkmL/NEjn
	 0cq6aVOxfyFlw==
Date: Mon, 9 Oct 2023 17:02:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, 
    Juergen Gross <jgross@suse.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
    David Hildenbrand <david@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [QEMU][PATCH v1 2/7] xen: add pseudo RAM region for grant
 mappings
In-Reply-To: <20231005181629.4046-3-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2310091653270.3431292@ubuntu-linux-20-04-desktop>
References: <20231005181629.4046-1-vikram.garhwal@amd.com> <20231005181629.4046-3-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Oct 2023, Vikram Garhwal wrote:
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

This patch doesn't apply to staging anymore


> ---
>  hw/i386/xen/xen-hvm.c           |  3 ++
>  hw/xen/xen-hvm-common.c         |  4 +--
>  hw/xen/xen-mapcache.c           | 27 ++++++++++++++
>  include/exec/ram_addr.h         |  1 +
>  include/hw/xen/xen-hvm-common.h |  2 ++
>  include/hw/xen/xen_pvdev.h      |  3 ++
>  include/sysemu/xen-mapcache.h   |  3 ++
>  softmmu/physmem.c               | 62 +++++++++++++++++++++------------
>  8 files changed, 80 insertions(+), 25 deletions(-)
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

It doesn't look like xen_init_grant_ram has anything to do with the
mapcache. It should be in another file. Maybe ./hw/xen/xen-hvm-common.c
or ./hw/i386/xen/xen-hvm.c (but this is x86 specific and we need grants
on ARM too)


> +}
> diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> index 90676093f5..c0b5f9a7d0 100644
> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -139,6 +139,7 @@ void qemu_ram_free(RAMBlock *block);
>  int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp);
>  
>  void qemu_ram_msync(RAMBlock *block, ram_addr_t start, ram_addr_t length);
> +void ram_block_add_list(RAMBlock *new_block);
>  
>  /* Clear whole block of mem */
>  static inline void qemu_ram_block_writeback(RAMBlock *block)
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
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 309653c722..e182a2fa07 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c


You might want to split this change out of this patch to make it easier
to get the physmem.c maintainers' attention


> @@ -1803,12 +1803,47 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
>      }
>  }
>  
> +static void ram_block_add_list_locked(RAMBlock *new_block)
> + {
> +     RAMBlock *block;
> +     RAMBlock *last_block = NULL;
> +
> +    /*
> +     * Keep the list sorted from biggest to smallest block.  Unlike QTAILQ,
> +     * QLIST (which has an RCU-friendly variant) does not have insertion at
> +     * tail, so save the last element in last_block.
> +     */
> +    RAMBLOCK_FOREACH(block) {
> +        last_block = block;
> +        if (block->max_length < new_block->max_length) {
> +            break;
> +        }
> +    }
> +    if (block) {
> +        QLIST_INSERT_BEFORE_RCU(block, new_block, next);
> +    } else if (last_block) {
> +        QLIST_INSERT_AFTER_RCU(last_block, new_block, next);
> +    } else { /* list is empty */
> +        QLIST_INSERT_HEAD_RCU(&ram_list.blocks, new_block, next);
> +    }
> +    ram_list.mru_block = NULL;
> +
> +    /* Write list before version */
> +    smp_wmb();
> +    ram_list.version++;
> +}
> +
> +void ram_block_add_list(RAMBlock *new_block)
> +{
> +    qemu_mutex_lock_ramlist();
> +    ram_block_add_list_locked(new_block);
> +    qemu_mutex_unlock_ramlist();
> +}
> +
>  static void ram_block_add(RAMBlock *new_block, Error **errp)
>  {
>      const bool noreserve = qemu_ram_is_noreserve(new_block);
>      const bool shared = qemu_ram_is_shared(new_block);
> -    RAMBlock *block;
> -    RAMBlock *last_block = NULL;
>      ram_addr_t old_ram_size, new_ram_size;
>      Error *err = NULL;
>  
> @@ -1846,28 +1881,9 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
>      if (new_ram_size > old_ram_size) {
>          dirty_memory_extend(old_ram_size, new_ram_size);
>      }
> -    /* Keep the list sorted from biggest to smallest block.  Unlike QTAILQ,
> -     * QLIST (which has an RCU-friendly variant) does not have insertion at
> -     * tail, so save the last element in last_block.
> -     */
> -    RAMBLOCK_FOREACH(block) {
> -        last_block = block;
> -        if (block->max_length < new_block->max_length) {
> -            break;
> -        }
> -    }
> -    if (block) {
> -        QLIST_INSERT_BEFORE_RCU(block, new_block, next);
> -    } else if (last_block) {
> -        QLIST_INSERT_AFTER_RCU(last_block, new_block, next);
> -    } else { /* list is empty */
> -        QLIST_INSERT_HEAD_RCU(&ram_list.blocks, new_block, next);
> -    }
> -    ram_list.mru_block = NULL;
>  
> -    /* Write list before version */
> -    smp_wmb();
> -    ram_list.version++;
> +    ram_block_add_list_locked(new_block);
> +
>      qemu_mutex_unlock_ramlist();
>  
>      cpu_physical_memory_set_dirty_range(new_block->offset,
> -- 
> 2.17.1
> 

