Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBAE8BA0C8
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 20:54:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716156.1118253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2bYa-0007TP-Mu; Thu, 02 May 2024 18:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716156.1118253; Thu, 02 May 2024 18:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2bYa-0007RR-Jx; Thu, 02 May 2024 18:53:24 +0000
Received: by outflank-mailman (input) for mailman id 716156;
 Thu, 02 May 2024 18:53:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Qsp=MF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2bYY-0007RK-SX
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 18:53:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d5000a6-08b5-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 20:53:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BF60361C06;
 Thu,  2 May 2024 18:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99659C4AF1A;
 Thu,  2 May 2024 18:53:13 +0000 (UTC)
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
X-Inumbo-ID: 3d5000a6-08b5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714675997;
	bh=AfimSmHkaoZU3iA7iLwFL/fwp3B+C3d33xlz1Ppucto=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p8PjtnAXAKKL1MIaab9KmHIPBa48bjyhx+vGrYdcMJ393cdQ73/riZ1Q9DzyoqBzJ
	 C7WmIO2KAYVW7sejgzXEtdORiVww0mKnA48OekoGSjwM9vGu1DCTxpyKwalRJNO88C
	 9To05A0iBu4DL51lJt5noboy6Y+nckcv96K0ev0BP13dV0mwylNWugw5s/Ps91M7qg
	 iOQOgqw1DcVUzYJkMYXIc1kZAZYsxWJ7ZZJKe2w8umTaLy5dCZ/6dr5gGt9+Qaip7a
	 eD6v2I7hGqcyRaMNuiBjXTbMKxj4qjW/33eoVt5fudGZ5XuSTpptZY6Wm3+tRFVb7+
	 SJt5Y0cVxmsAg==
Date: Thu, 2 May 2024 11:53:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, 
    jgross@suse.com, "Edgar E. Iglesias" <edgar.iglesias@amd.com>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
    David Hildenbrand <david@redhat.com>, 
    =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
    xen-devel@lists.xenproject.org, Xenia.Ragiadakou@amd.com
Subject: Re: [PATCH v4 15/17] xen: mapcache: Remove assumption of RAMBlock
 with 0 offset
In-Reply-To: <CAJy5ezoQ4Q6kc9T8_P3nEU6N20e6Pvr3K_zuM0j95RcG-hDgfw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405021144270.624854@ubuntu-linux-20-04-desktop>
References: <20240430164939.925307-1-edgar.iglesias@gmail.com> <20240430164939.925307-16-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2405011414320.497719@ubuntu-linux-20-04-desktop> <CAJy5ezoQ4Q6kc9T8_P3nEU6N20e6Pvr3K_zuM0j95RcG-hDgfw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1125765863-1714675481=:624854"
Content-ID: <alpine.DEB.2.22.394.2405021144490.624854@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1125765863-1714675481=:624854
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2405021144491.624854@ubuntu-linux-20-04-desktop>

+Xenia

On Thu, 2 May 2024, Edgar E. Iglesias wrote:
> On Wed, May 1, 2024 at 11:24 PM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
> >
> > On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> > > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > >
> > > The current mapcache assumes that all memory is mapped
> > > in a single RAM MR (the first one with offset 0). Remove
> > > this assumption and propagate the offset to the mapcache
> > > so it can do reverse mappings (from hostptr -> ram_addr).
> > >
> > > This is in preparation for adding grant mappings.
> > >
> > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> >
> >
> > Looking at xen_remap_bucket, it is only using address_index (without
> > adding ram_offset) to map foreign memory. From xen_remap_bucket, I would
> > understand that address_index already includes the ram_offset.
> >
> > Meaning that if we want to map foreign mapping at address 0x5000, then
> > address_index would be 0x5000, even if ram_offset is 0x1000.
> >
> > But then looking xen_ram_addr_from_mapcache_single ram_offset is added
> > to paddr_index to calculate the physical address. So in that case we
> > would want address_index to be 0x4000 and ram_offset to be 0x1000. But
> > xen_remap_bucket would have to sum address_index and ram_offset to map
> > foreign memory.
> >
> > So I am a bit confused, did I get it wrong? One more comment below.
> >
> 
> Thanks Stefano,
> 
> I think the confusion is that this ram_addr_offset is not related to
> guest address-space.
> It's a QEMU internal thing and it shouldn't be included in the address
> used to map foreign memory.
> The mapcache can treat this ram_addr offset like a cookie that we keep
> around to be able to do
> reverse mappings from host pointers into ram_addr space
> (xen_ram_addr_from_mapcache).
> 
> The current mapcache implementation works because we've really only
> been using foreign mappings
> on RAMBlocks with offset 0. We're also creating RAM's such that the
> offset into the RAM is also
> the guest physical address, for x86 this is natural since RAM starts
> at zero (for lowmem) but for
> ARM we're creating larger than needed RAM's (GUEST_RAM0_BASE + ram-size) to
> make this assumption true. Anyway, In this series I'm not addressing
> this second assumption.

Let's see if I understand correctly.

The ram_addr space is an internal QEMU address space which is different
from the guest physical address space and thus cannot and should not be
used to do foreign mappings (foreign mapping hypercalls take a guest
physical or a real physical address to map). Is that correct?

If so, then I understand.



> There's a second call in physmem.c to xen_map_cache using the
> block->offset as an address.
> I was considering removing that second call since I can't see how it can work
> (except perhaps in some specific use-case by luck?). Anyway, for now
> I've left it unmodified.

Yes, that code was written with the assumption that block->offset is an
offset in the guest physical address space and could be used as a guest
physical address. Actually, you might have spotted a real bug.
 
The intent was for smaller regions (not the bit RAM region, things like
a ROM region for instance) we could map them in full. So here we were
trying to map the whole thing from start to finish using block->offset
as start.


> > > ---
> > >  hw/xen/xen-mapcache.c         | 25 ++++++++++++++++++-------
> > >  include/sysemu/xen-mapcache.h |  2 ++
> > >  system/physmem.c              |  8 ++++----
> > >  3 files changed, 24 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> > > index 09b5f36d9c..1b32d0c003 100644
> > > --- a/hw/xen/xen-mapcache.c
> > > +++ b/hw/xen/xen-mapcache.c
> > > @@ -43,6 +43,9 @@ typedef struct MapCacheEntry {
> > >  #define XEN_MAPCACHE_ENTRY_DUMMY (1 << 0)
> > >      uint8_t flags;
> > >      hwaddr size;
> > > +
> > > +    /* Keep ram_addr offset for reverse mappings (hostptr -> ram_addr).  */
> > > +    ram_addr_t ram_offset;
> > >      struct MapCacheEntry *next;
> > >  } MapCacheEntry;
> > >
> > > @@ -165,7 +168,8 @@ static void xen_remap_bucket(MapCache *mc,
> > >                               void *vaddr,
> > >                               hwaddr size,
> > >                               hwaddr address_index,
> > > -                             bool dummy)
> > > +                             bool dummy,
> > > +                             ram_addr_t ram_offset)
> > >  {
> > >      uint8_t *vaddr_base;
> > >      xen_pfn_t *pfns;
> > > @@ -244,6 +248,7 @@ static void xen_remap_bucket(MapCache *mc,
> > >      entry->size = size;
> > >      entry->valid_mapping = g_new0(unsigned long,
> > >                                    BITS_TO_LONGS(size >> XC_PAGE_SHIFT));
> > > +    entry->ram_offset = ram_offset;
> > >
> > >      if (dummy) {
> > >          entry->flags |= XEN_MAPCACHE_ENTRY_DUMMY;
> > > @@ -264,6 +269,7 @@ static void xen_remap_bucket(MapCache *mc,
> > >
> > >  static uint8_t *xen_map_cache_unlocked(MapCache *mc,
> > >                                         hwaddr phys_addr, hwaddr size,
> > > +                                       ram_addr_t ram_offset,
> > >                                         uint8_t lock, bool dma, bool is_write)
> > >  {
> > >      MapCacheEntry *entry, *pentry = NULL,
> > > @@ -335,14 +341,16 @@ tryagain:
> > >      if (!entry) {
> > >          entry = g_new0(MapCacheEntry, 1);
> > >          pentry->next = entry;
> > > -        xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy);
> > > +        xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy,
> > > +                         ram_offset);
> > >      } else if (!entry->lock) {
> > >          if (!entry->vaddr_base || entry->paddr_index != address_index ||
> > >                  entry->size != cache_size ||
> > >                  !test_bits(address_offset >> XC_PAGE_SHIFT,
> > >                      test_bit_size >> XC_PAGE_SHIFT,
> > >                      entry->valid_mapping)) {
> > > -            xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy);
> > > +            xen_remap_bucket(mc, entry, NULL, cache_size, address_index, dummy,
> > > +                             ram_offset);
> > >          }
> > >      }
> > >
> > > @@ -389,13 +397,15 @@ tryagain:
> > >
> > >  uint8_t *xen_map_cache(MemoryRegion *mr,
> > >                         hwaddr phys_addr, hwaddr size,
> > > +                       ram_addr_t ram_addr_offset,
> > >                         uint8_t lock, bool dma,
> > >                         bool is_write)
> > >  {
> > >      uint8_t *p;
> > >
> > >      mapcache_lock(mapcache);
> > > -    p = xen_map_cache_unlocked(mapcache, phys_addr, size, lock, dma, is_write);
> > > +    p = xen_map_cache_unlocked(mapcache, phys_addr, size, ram_addr_offset,
> > > +                               lock, dma, is_write);
> > >      mapcache_unlock(mapcache);
> > >      return p;
> > >  }
> > > @@ -432,7 +442,8 @@ static ram_addr_t xen_ram_addr_from_mapcache_single(MapCache *mc, void *ptr)
> > >          raddr = RAM_ADDR_INVALID;
> > >      } else {
> > >          raddr = (reventry->paddr_index << mc->bucket_shift) +
> > > -             ((unsigned long) ptr - (unsigned long) entry->vaddr_base);
> > > +             ((unsigned long) ptr - (unsigned long) entry->vaddr_base) +
> > > +             entry->ram_offset;
> > >      }
> > >      mapcache_unlock(mc);
> > >      return raddr;
> > > @@ -627,8 +638,8 @@ static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
> > >
> > >      trace_xen_replace_cache_entry_dummy(old_phys_addr, new_phys_addr);
> > >
> > > -    xen_remap_bucket(mapcache, entry, entry->vaddr_base,
> > > -                     cache_size, address_index, false);
> > > +    xen_remap_bucket(mc, entry, entry->vaddr_base,
> > > +                     cache_size, address_index, false, entry->ram_offset);
> > >      if (!test_bits(address_offset >> XC_PAGE_SHIFT,
> > >                  test_bit_size >> XC_PAGE_SHIFT,
> > >                  entry->valid_mapping)) {
> > > diff --git a/include/sysemu/xen-mapcache.h b/include/sysemu/xen-mapcache.h
> > > index 1ec9e66752..b5e3ea1bc0 100644
> > > --- a/include/sysemu/xen-mapcache.h
> > > +++ b/include/sysemu/xen-mapcache.h
> > > @@ -19,6 +19,7 @@ typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_offset,
> > >  void xen_map_cache_init(phys_offset_to_gaddr_t f,
> > >                          void *opaque);
> > >  uint8_t *xen_map_cache(MemoryRegion *mr, hwaddr phys_addr, hwaddr size,
> > > +                       ram_addr_t ram_addr_offset,
> > >                         uint8_t lock, bool dma,
> > >                         bool is_write);
> > >  ram_addr_t xen_ram_addr_from_mapcache(void *ptr);
> > > @@ -37,6 +38,7 @@ static inline void xen_map_cache_init(phys_offset_to_gaddr_t f,
> > >  static inline uint8_t *xen_map_cache(MemoryRegion *mr,
> > >                                       hwaddr phys_addr,
> > >                                       hwaddr size,
> > > +                                     ram_addr_t ram_addr_offset,
> > >                                       uint8_t lock,
> > >                                       bool dma,
> > >                                       bool is_write)
> > > diff --git a/system/physmem.c b/system/physmem.c
> > > index 1a5ffcba2a..5b16eeccca 100644
> > > --- a/system/physmem.c
> > > +++ b/system/physmem.c
> > > @@ -2228,13 +2228,13 @@ static void *qemu_ram_ptr_length(RAMBlock *block, ram_addr_t addr,
> > >           * In that case just map the requested area.
> > >           */
> > >          if (xen_mr_is_memory(block->mr)) {
> > > -            return xen_map_cache(block->mr, addr, len, lock, lock,
> > > -                                 is_write);
> > > +            return xen_map_cache(block->mr, addr, len, block->offset,
> > > +                                 lock, lock, is_write);
> >
> > Have you considered not tracking offset and address separately and
> > simply do this?
> >
> >             return xen_map_cache(block->mr, addr + block->offset, len,
> >                                  lock, lock, is_write);
> >
> 
> Unfortunately this won't work since block->offset is not related to where this
> ram is mapped in guest address-space. In the case of grant's, we'd get the
> wrong grant ref. See my previous comment.

OK, this code below (the second xen_map_cache call passing block->offset
as start address) was wrong before this patch. Can we fix it before
changing it further with this patch? I worry about making things even
worse.


> > >          }
> > >
> > >          block->host = xen_map_cache(block->mr, block->offset,
> > > -                                    block->max_length, 1,
> > > -                                    lock, is_write);
> > > +                                    block->max_length, 0,
> > > +                                    1, lock, is_write);
> > >      }
> > >
> > >      return ramblock_ptr(block, addr);
> > > --
> > > 2.40.1
> > >
> 
--8323329-1125765863-1714675481=:624854--

