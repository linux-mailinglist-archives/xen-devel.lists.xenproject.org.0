Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2647BEFC1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 02:28:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614509.955628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq0bV-0006EQ-HI; Tue, 10 Oct 2023 00:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614509.955628; Tue, 10 Oct 2023 00:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq0bV-0006CR-Ej; Tue, 10 Oct 2023 00:28:05 +0000
Received: by outflank-mailman (input) for mailman id 614509;
 Tue, 10 Oct 2023 00:28:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z25Z=FY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qq0bT-0006CJ-RC
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 00:28:03 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df34e7bc-6703-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 02:28:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C6541B8092E;
 Tue, 10 Oct 2023 00:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EE7C433C7;
 Tue, 10 Oct 2023 00:27:59 +0000 (UTC)
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
X-Inumbo-ID: df34e7bc-6703-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696897681;
	bh=n+8+kl0l5qmiaXi9T/lzTbJXS41Rqkh31n8ODesFFDc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GkmcLmsW5uOr3PYNV+wFCan7+dD7MB4Ut9rncB7I0ckaliyDuAX/tNZFTCdXJ1SKQ
	 4BmEGVBvvyAWIcm4NoGqxN+PDzu+gNPNNsJGXnrVVEyDboTwQ6lXOiSRDHkqao1z4i
	 IShMKDdHfoS907mCbXjlNtYH4J7w28xe1RyRedFHr4RcqcTlWLb5uUoQJAH+SZ2I1a
	 oiWKi14Dekljh6tJmEJsWXjHd6he4gn1606QVO+Ce8riradu0sTsT30s5qOjnru+b2
	 NNWiExLT16h/bShCbpYx6d40b5ntOwgxsb+arnCgfyF33SZdruKeYOCqvjBeC4DlFW
	 OGqn8oNVwpgeg==
Date: Mon, 9 Oct 2023 17:27:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, 
    Juergen Gross <jgross@suse.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
    David Hildenbrand <david@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [QEMU][PATCH v1 6/7] xen: add map and unmap callbacks for grant
 region
In-Reply-To: <20231005181629.4046-7-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2310091727390.3431292@ubuntu-linux-20-04-desktop>
References: <20231005181629.4046-1-vikram.garhwal@amd.com> <20231005181629.4046-7-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Oct 2023, Vikram Garhwal wrote:
> From: Juergen Gross <jgross@suse.com>
> 
> Add the callbacks for mapping/unmapping guest memory via grants to the
> special grant memory region.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

This looks good. We need to add a check to make sure we don't exceed
XEN_MAX_VIRTIO_GRANTS.



> ---
>  hw/xen/xen-mapcache.c | 167 +++++++++++++++++++++++++++++++++++++++++-
>  softmmu/physmem.c     |  11 ++-
>  2 files changed, 173 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index 8a61c7dde6..52844a6a9d 100644
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
> @@ -594,10 +598,170 @@ uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
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
> +    }
> +    if (!mgr) {
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
> @@ -612,6 +776,7 @@ MemoryRegion *xen_init_grant_ram(void)
>      ram_grants.ram_block = block;
>      ram_grants.ram = true;
>      ram_grants.terminates = true;
> +    ram_grants.ops = &xen_grant_mr_ops;
>      ram_block_add_list(block);
>      memory_region_add_subregion(get_system_memory(), XEN_GRANT_ADDR_OFF,
>                                  &ram_grants);
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 5f425bea1c..e5346386db 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2250,13 +2250,16 @@ RAMBlock *qemu_ram_block_from_host(void *ptr, bool round_offset,
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

