Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C997BEFC7
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 02:30:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614515.955639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq0dK-0006ph-Vv; Tue, 10 Oct 2023 00:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614515.955639; Tue, 10 Oct 2023 00:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq0dK-0006o1-T8; Tue, 10 Oct 2023 00:29:58 +0000
Received: by outflank-mailman (input) for mailman id 614515;
 Tue, 10 Oct 2023 00:29:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z25Z=FY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qq0dI-0006nt-Qs
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 00:29:56 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2241010b-6704-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 02:29:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 78098B816F6;
 Tue, 10 Oct 2023 00:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C526C433C7;
 Tue, 10 Oct 2023 00:29:51 +0000 (UTC)
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
X-Inumbo-ID: 2241010b-6704-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696897793;
	bh=+wRMvUQqKAhGEuI+n5i2O9uzzBEO/HlE+ubvDlGkp2Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BoSuOvxuBibbPpDmtKrIBuxFAiXS7rNupNCI4GvQ4ExotTQ2Fq9RtAN/ddOrwM9ii
	 TkstE0C23LuTHNNnX5ZmbS1zVrlpAk+9Y2R8+UuzVza289Tmmlbds1yBoXERgPSKzl
	 zyvuV8wnSg4skEm/etnckgOLYzxn3r08D7791ZKBJlyt7a9Gi2mVadLNYoEmApsmi6
	 f1fCt2EXmUn0VgXIBwUh0hgLOJ74hW9n4DFei6feqhs365QsLM6gQf3uknD/AM32ZF
	 /v2jiEV1YzLN/6TUAzpPwsIpuRCf65odhD79onQjlfxpISNUwNDBnfTZe4mGlMjGwP
	 Uz8jJBsO731sQ==
Date: Mon, 9 Oct 2023 17:29:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org, 
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
In-Reply-To: <alpine.DEB.2.22.394.2310091653270.3431292@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2310091728500.3431292@ubuntu-linux-20-04-desktop>
References: <20231005181629.4046-1-vikram.garhwal@amd.com> <20231005181629.4046-3-vikram.garhwal@amd.com> <alpine.DEB.2.22.394.2310091653270.3431292@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Oct 2023, Stefano Stabellini wrote:
> On Thu, 5 Oct 2023, Vikram Garhwal wrote:
> > From: Juergen Gross <jgross@suse.com>
> > 
> > Add a memory region which can be used to automatically map granted
> > memory. It is starting at 0x8000000000000000ULL in order to be able to
> > distinguish it from normal RAM.
> > 
> > For this reason the xen.ram memory region is expanded, which has no
> > further impact as it is used just as a container of the real RAM
> > regions and now the grant region.
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> This patch doesn't apply to staging anymore
> 
> 
> > ---
> >  hw/i386/xen/xen-hvm.c           |  3 ++
> >  hw/xen/xen-hvm-common.c         |  4 +--
> >  hw/xen/xen-mapcache.c           | 27 ++++++++++++++
> >  include/exec/ram_addr.h         |  1 +
> >  include/hw/xen/xen-hvm-common.h |  2 ++
> >  include/hw/xen/xen_pvdev.h      |  3 ++
> >  include/sysemu/xen-mapcache.h   |  3 ++
> >  softmmu/physmem.c               | 62 +++++++++++++++++++++------------
> >  8 files changed, 80 insertions(+), 25 deletions(-)
> > 
> > diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> > index f42621e674..67a55558a6 100644
> > --- a/hw/i386/xen/xen-hvm.c
> > +++ b/hw/i386/xen/xen-hvm.c
> > @@ -172,6 +172,9 @@ static void xen_ram_init(PCMachineState *pcms,
> >                                   x86ms->above_4g_mem_size);
> >          memory_region_add_subregion(sysmem, 0x100000000ULL, &ram_hi);
> >      }
> > +
> > +    /* Add grant mappings as a pseudo RAM region. */
> > +    ram_grants = *xen_init_grant_ram();
> >  }
> >  
> >  static XenPhysmap *get_physmapping(hwaddr start_addr, ram_addr_t size)
> > diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> > index 565dc39c8f..b7255977a5 100644
> > --- a/hw/xen/xen-hvm-common.c
> > +++ b/hw/xen/xen-hvm-common.c
> > @@ -9,7 +9,7 @@
> >  #include "hw/boards.h"
> >  #include "hw/xen/arch_hvm.h"
> >  
> > -MemoryRegion ram_memory;
> > +MemoryRegion ram_memory, ram_grants;
> >  
> >  void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
> >                     Error **errp)
> > @@ -26,7 +26,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
> >          return;
> >      }
> >  
> > -    if (mr == &ram_memory) {
> > +    if (mr == &ram_memory || mr == &ram_grants) {
> >          return;
> >      }
> >  
> > diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> > index f7d974677d..8115c44c00 100644
> > --- a/hw/xen/xen-mapcache.c
> > +++ b/hw/xen/xen-mapcache.c
> > @@ -14,7 +14,9 @@
> >  
> >  #include <sys/resource.h>
> >  
> > +#include "hw/xen/xen-hvm-common.h"
> >  #include "hw/xen/xen_native.h"
> > +#include "hw/xen/xen_pvdev.h"
> >  #include "qemu/bitmap.h"
> >  
> >  #include "sysemu/runstate.h"
> > @@ -597,3 +599,28 @@ uint8_t *xen_replace_cache_entry(hwaddr old_phys_addr,
> >      mapcache_unlock();
> >      return p;
> >  }
> > +
> > +MemoryRegion *xen_init_grant_ram(void)
> > +{
> > +    RAMBlock *block;
> > +
> > +    memory_region_init(&ram_grants, NULL, "xen.grants",
> > +                       XEN_MAX_VIRTIO_GRANTS * XC_PAGE_SIZE);
> > +    block = g_malloc0(sizeof(*block));
> > +    block->mr = &ram_grants;
> > +    block->used_length = XEN_MAX_VIRTIO_GRANTS * XC_PAGE_SIZE;
> > +    block->max_length = XEN_MAX_VIRTIO_GRANTS * XC_PAGE_SIZE;
> > +    block->fd = -1;
> > +    block->page_size = XC_PAGE_SIZE;
> > +    block->host = (void *)XEN_GRANT_ADDR_OFF;
> > +    block->offset = XEN_GRANT_ADDR_OFF;
> > +    block->flags = RAM_PREALLOC;
> > +    ram_grants.ram_block = block;
> > +    ram_grants.ram = true;
> > +    ram_grants.terminates = true;
> > +    ram_block_add_list(block);
> > +    memory_region_add_subregion(get_system_memory(), XEN_GRANT_ADDR_OFF,
> > +                                &ram_grants);
> > +
> > +    return &ram_grants;
> 
> It doesn't look like xen_init_grant_ram has anything to do with the
> mapcache. It should be in another file. Maybe ./hw/xen/xen-hvm-common.c
> or ./hw/i386/xen/xen-hvm.c (but this is x86 specific and we need grants
> on ARM too)

Now having seen all the other patches, it might be OK to keep this here.
I am OK with this patch once it is rebased on the latest staging. I
would still advise to split the physdev.c changes to a separate patch.

