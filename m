Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EACF57D7A33
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 03:33:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623399.971256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvpEk-0005Fk-4E; Thu, 26 Oct 2023 01:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623399.971256; Thu, 26 Oct 2023 01:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvpEk-0005Dj-16; Thu, 26 Oct 2023 01:32:38 +0000
Received: by outflank-mailman (input) for mailman id 623399;
 Thu, 26 Oct 2023 01:32:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2QB=GI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qvpEi-0005Dd-O9
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 01:32:36 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 881a42ae-739f-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 03:32:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 509BFCE3C05;
 Thu, 26 Oct 2023 01:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F00EC433C8;
 Thu, 26 Oct 2023 01:32:27 +0000 (UTC)
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
X-Inumbo-ID: 881a42ae-739f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698283949;
	bh=tpmV0jJcukeFv/+kyfO83cg9rK+oV80xWvwmxLTD/8c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AdHkdbhxSkqo3iuHgSv5JXFEKqU/2Nm8D1fs8XlLZE9vgdh/EpSQAo8xEjk+z1MPH
	 nB2yUXzvNhEOgHh4Hm+FsF3ObgWDex4Z2cgqLmBcGBUG32M48jPpP2C4lOp5y5swJj
	 DjmCa09KH1kv0DTMvaaUYlTMUAw3xP07yur4j4AAeGRo/p8YnWjLs9gR1JWim4h2i+
	 AhhlB3kECzJHCTV5p1DHqcytJQZhwMZZIqZHqV/BpprqAhezj8ccPCgO6KbGgPYRzX
	 w9VFDuv0t1XbDH2/cOTFYim0V2/WoqAQpzok5ewR8W9pPshACuAJ1PCIOLpJ+uVXBE
	 OvClxuFefbZ+g==
Date: Wed, 25 Oct 2023 18:32:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, jgross@suse.com, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
    David Hildenbrand <david@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [QEMU][PATCHv2 7/8] xen: add map and unmap callbacks for grant
 region
In-Reply-To: <20231025212422.30371-8-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2310251832100.271731@ubuntu-linux-20-04-desktop>
References: <20231025212422.30371-1-vikram.garhwal@amd.com> <20231025212422.30371-8-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Oct 2023, Vikram Garhwal wrote:
> From: Juergen Gross <jgross@suse.com>
> 
> Add the callbacks for mapping/unmapping guest memory via grants to the
> special grant memory region.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  hw/xen/xen-mapcache.c | 175 +++++++++++++++++++++++++++++++++++++++++-
>  system/physmem.c      |  11 ++-
>  2 files changed, 181 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index 8a61c7dde6..feb4a3b886 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -9,6 +9,8 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/queue.h"
> +#include "qemu/thread.h"
>  #include "qemu/units.h"
>  #include "qemu/error-report.h"
>  
> @@ -23,6 +25,8 @@
>  #include "sysemu/xen-mapcache.h"
>  #include "trace.h"
>  
> +#include <xenevtchn.h>
> +#include <xengnttab.h>
>  
>  //#define MAPCACHE_DEBUG
>  
> @@ -385,7 +389,7 @@ uint8_t *xen_map_cache(hwaddr phys_addr, hwaddr size,
>      return p;
>  }
>  
> -ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
> +static ram_addr_t xen_ram_addr_from_mapcache_try(void *ptr)
>  {
>      MapCacheEntry *entry = NULL;
>      MapCacheRev *reventry;
> @@ -594,10 +598,178 @@ uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
>      return p;
>  }
>  
> +struct XENMappedGrantRegion {
> +    void *addr;
> +    unsigned int pages;
> +    unsigned int refs;
> +    unsigned int prot;
> +    uint32_t idx;
> +    QLIST_ENTRY(XENMappedGrantRegion) list;
> +};
> +
> +static xengnttab_handle *xen_region_gnttabdev;
> +static QLIST_HEAD(GrantRegionList, XENMappedGrantRegion) xen_grant_mappings =
> +    QLIST_HEAD_INITIALIZER(xen_grant_mappings);
> +static QemuMutex xen_map_mutex;
> +
> +static void *xen_map_grant_dyn(MemoryRegion **mr, hwaddr addr, hwaddr *plen,
> +                               bool is_write, MemTxAttrs attrs)
> +{
> +    unsigned int page_off = addr & (XC_PAGE_SIZE - 1);
> +    unsigned int i;
> +    unsigned int total_grants = 0;
> +    unsigned int nrefs = (page_off + *plen + XC_PAGE_SIZE - 1) >> XC_PAGE_SHIFT;
> +    uint32_t ref = (addr - XEN_GRANT_ADDR_OFF) >> XC_PAGE_SHIFT;
> +    uint32_t *refs = NULL;
> +    unsigned int prot = PROT_READ;
> +    struct XENMappedGrantRegion *mgr = NULL;
> +
> +    if (is_write) {
> +        prot |= PROT_WRITE;
> +    }
> +
> +    qemu_mutex_lock(&xen_map_mutex);
> +
> +    QLIST_FOREACH(mgr, &xen_grant_mappings, list) {
> +        if (mgr->idx == ref &&
> +            mgr->pages == nrefs &&
> +            (mgr->prot & prot) == prot) {
> +            break;
> +        }
> +
> +        total_grants += mgr->pages;
> +    }
> +
> +    if (!mgr) {
> +        if (nrefs + total_grants >= XEN_MAX_VIRTIO_GRANTS) {
> +            return NULL;

missing qemu_mutex_unlock


> +        }
> +
> +        mgr = g_new(struct XENMappedGrantRegion, 1);
> +
> +        if (nrefs == 1) {
> +            refs = &ref;
> +        } else {
> +            refs = g_new(uint32_t, nrefs);
> +            for (i = 0; i < nrefs; i++) {
> +                refs[i] = ref + i;
> +            }
> +        }
> +        mgr->addr = xengnttab_map_domain_grant_refs(xen_region_gnttabdev, nrefs,
> +                                                    xen_domid, refs, prot);
> +        if (mgr->addr) {
> +            mgr->pages = nrefs;
> +            mgr->refs = 1;
> +            mgr->prot = prot;
> +            mgr->idx = ref;
> +
> +            QLIST_INSERT_HEAD(&xen_grant_mappings, mgr, list);
> +        } else {
> +            g_free(mgr);
> +            mgr = NULL;
> +        }
> +    } else {
> +        mgr->refs++;
> +    }
> +
> +    qemu_mutex_unlock(&xen_map_mutex);
> +
> +    if (nrefs > 1) {
> +        g_free(refs);
> +    }
> +
> +    return mgr ? mgr->addr + page_off : NULL;
> +}
> +
> +static void xen_unmap_grant_dyn(MemoryRegion *mr, void *buffer, ram_addr_t addr,
> +                                hwaddr len, bool is_write, hwaddr access_len)
> +{
> +    unsigned int page_off = (unsigned long)buffer & (XC_PAGE_SIZE - 1);
> +    unsigned int nrefs = (page_off + len + XC_PAGE_SIZE - 1) >> XC_PAGE_SHIFT;
> +    unsigned int prot = PROT_READ;
> +    struct XENMappedGrantRegion *mgr = NULL;
> +
> +    if (is_write) {
> +        prot |= PROT_WRITE;
> +    }
> +
> +    qemu_mutex_lock(&xen_map_mutex);
> +
> +    QLIST_FOREACH(mgr, &xen_grant_mappings, list) {
> +        if (mgr->addr == buffer - page_off &&
> +            mgr->pages == nrefs &&
> +            (mgr->prot & prot) == prot) {
> +            break;
> +        }
> +    }
> +    if (mgr) {
> +        mgr->refs--;
> +        if (!mgr->refs) {
> +            xengnttab_unmap(xen_region_gnttabdev, mgr->addr, nrefs);
> +
> +            QLIST_REMOVE(mgr, list);
> +            g_free(mgr);
> +        }
> +    } else {
> +        error_report("xen_unmap_grant_dyn() trying to unmap unknown buffer");
> +    }
> +
> +    qemu_mutex_unlock(&xen_map_mutex);
> +}
> +
> +static ram_addr_t xen_ram_addr_from_grant_cache(void *ptr)
> +{
> +    unsigned int page_off = (unsigned long)ptr & (XC_PAGE_SIZE - 1);
> +    struct XENMappedGrantRegion *mgr = NULL;
> +    ram_addr_t raddr = RAM_ADDR_INVALID;
> +
> +    qemu_mutex_lock(&xen_map_mutex);
> +
> +    QLIST_FOREACH(mgr, &xen_grant_mappings, list) {
> +        if (mgr->addr == ptr - page_off) {
> +            break;
> +        }
> +    }
> +
> +    if (mgr) {
> +        raddr = (mgr->idx << XC_PAGE_SHIFT) + page_off + XEN_GRANT_ADDR_OFF;
> +    }
> +
> +    qemu_mutex_unlock(&xen_map_mutex);
> +
> +    return raddr;
> +}
> +
> +ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
> +{
> +    ram_addr_t raddr;
> +
> +    raddr = xen_ram_addr_from_mapcache_try(ptr);
> +    if (raddr == RAM_ADDR_INVALID) {
> +        raddr = xen_ram_addr_from_grant_cache(ptr);
> +    }
> +
> +    return raddr;
> +}
> +
> +static const struct MemoryRegionOps xen_grant_mr_ops = {
> +    .map = xen_map_grant_dyn,
> +    .unmap = xen_unmap_grant_dyn,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
>  MemoryRegion *xen_init_grant_ram(void)
>  {
>      RAMBlock *block;
>  
> +    qemu_mutex_init(&xen_map_mutex);
> +
> +    xen_region_gnttabdev = xengnttab_open(NULL, 0);
> +    if (xen_region_gnttabdev == NULL) {
> +        fprintf(stderr, "can't open gnttab device\n");
> +        return NULL;
> +    }
> +
>      memory_region_init(&ram_grants, NULL, "xen.grants",
>                         XEN_MAX_VIRTIO_GRANTS * XC_PAGE_SIZE);
>      block = g_malloc0(sizeof(*block));
> @@ -612,6 +784,7 @@ MemoryRegion *xen_init_grant_ram(void)
>      ram_grants.ram_block = block;
>      ram_grants.ram = true;
>      ram_grants.terminates = true;
> +    ram_grants.ops = &xen_grant_mr_ops;
>      ram_block_add_list(block);
>      memory_region_add_subregion(get_system_memory(), XEN_GRANT_ADDR_OFF,
>                                  &ram_grants);
> diff --git a/system/physmem.c b/system/physmem.c
> index 5db1b32823..155a8c05fb 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -2233,13 +2233,16 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
>  
>      if (xen_enabled()) {
>          ram_addr_t ram_addr;
> +
>          RCU_READ_LOCK_GUARD();
>          ram_addr = xen_ram_addr_from_mapcache(ptr);
> -        block = qemu_get_ram_block(ram_addr);
> -        if (block) {
> -            *offset = ram_addr - block->offset;
> +        if (ram_addr != RAM_ADDR_INVALID) {
> +            block = qemu_get_ram_block(ram_addr);
> +            if (block) {
> +                *offset = ram_addr - block->offset;
> +            }
> +            return block;
>          }
> -        return block;
>      }
>  
>      RCU_READ_LOCK_GUARD();
> -- 
> 2.17.1
> 

