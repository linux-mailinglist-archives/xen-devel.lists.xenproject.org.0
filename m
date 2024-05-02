Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2F18BA11C
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 21:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716169.1118274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2cKa-0004qL-JI; Thu, 02 May 2024 19:43:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716169.1118274; Thu, 02 May 2024 19:43:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2cKa-0004o1-Fm; Thu, 02 May 2024 19:43:00 +0000
Received: by outflank-mailman (input) for mailman id 716169;
 Thu, 02 May 2024 19:42:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1TOG=MF=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s2cKZ-0004nv-Hk
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 19:42:59 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cdc448c-08bc-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 21:42:57 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a597c192246so62336666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 12:42:57 -0700 (PDT)
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
X-Inumbo-ID: 2cdc448c-08bc-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714678977; x=1715283777; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOZllDi8OvGMdRL5OmEg4WfFDW3bpic0V8Dsz4KaBgE=;
        b=hO6jdVTKHdZ89Puf/YPwLvM6r2zy/g6gxvHKtX0G3dVyUPZrIj6M8LbQaJ0PcJG9UT
         aqMl+lcDCIjBMyiLOKXvJ8ain33LDqXYdMq6cckHn3Vk3DZ1XOwVE6en5DFKt82IYTye
         UdDPEnr94fvOenDOffILtLljXWb6WteosHquAazpxjDLMaQ78wxVBYtuWrCvyRhmacUz
         VYmHCAowLyX5PSyQ7KXhiY/3yo7lAG+pZu/0+5hEY1AYBogx4O5QLpJwerorwp7yhR03
         mcqzVNKyoxE3QFrydmkRPnIc80v2H7FVQ+E/0diBiaE3tRpWmTMdqSGDomyski0BwxCA
         jy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714678977; x=1715283777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOZllDi8OvGMdRL5OmEg4WfFDW3bpic0V8Dsz4KaBgE=;
        b=rQSsX3Hc2UovFnc3H4eFt4OnHiSFQmsxA+JIrlmoeEtSkGOd6YpmHiO7Ajal+De2gb
         LYQ3Rpttgd+O7YQKBq3UQlfyDMMUvSFVxpFNj1Rs3z5S52NF0ZBeYdTaHUzxiUzuf28g
         6JNtreBzrQMdoEHl4eJ//5JdWrVOPyjSaplpKSr+tQmmGYCLIjv0OpvsSNsc1A7B+soY
         sIocjB3K4R43kvb3v85SSPo1kN7D6Dgebwe0pkl/WAPndGbFPMtq+yEFpF3ceRBaGB1x
         oGUYlQWf1QS1VfIhSI8o12wZ97jY3Ms2Ur/ghOnrd3fFXPKLvuGmNsLkxwjw8OnjXVxb
         ighA==
X-Forwarded-Encrypted: i=1; AJvYcCWIFaD7a5evOCaVhOT29XT120W1pHZ5RpE6ApEWY6XeWniT5umovDMkMMiSTxMIihgAfqQGRwwwiW2s4ymAJG6lkvZbm8WdB++LcJFCf78=
X-Gm-Message-State: AOJu0Yz0xazf4Hqdli4i3k1V6TDxZ8Owlim5YcrNgvjHiUB8yQssaxaD
	tyUmA52Dzg6+wxN7W2Af04oAsFUJN/q+gGp5igd7VEfsBURv5yPYR/vxvN5QRMwSyNDTW+ryqTB
	xGGm5qxKf67gdzzbG8iYVfov+wPs=
X-Google-Smtp-Source: AGHT+IH8Va0CQyduyPWxrVuJV6TU8ZZbOVVj3Kog1k7DHkXdH98rvYhW1sV2IsOOL52e0uNbd06M3XW6wXFR0BTz7YY=
X-Received: by 2002:a50:8e5d:0:b0:572:3f41:25aa with SMTP id
 29-20020a508e5d000000b005723f4125aamr300748edx.11.1714678976373; Thu, 02 May
 2024 12:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-16-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2405011414320.497719@ubuntu-linux-20-04-desktop>
 <CAJy5ezoQ4Q6kc9T8_P3nEU6N20e6Pvr3K_zuM0j95RcG-hDgfw@mail.gmail.com> <alpine.DEB.2.22.394.2405021144270.624854@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2405021144270.624854@ubuntu-linux-20-04-desktop>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 2 May 2024 21:42:44 +0200
Message-ID: <CAJy5ezq+wd4T91YPEarea4eUXp_CJftvPYMJT2AzA66DWjy34w@mail.gmail.com>
Subject: Re: [PATCH v4 15/17] xen: mapcache: Remove assumption of RAMBlock
 with 0 offset
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, jgross@suse.com, 
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	xen-devel@lists.xenproject.org, Xenia.Ragiadakou@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2024 at 8:53=E2=80=AFPM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> +Xenia
>
> On Thu, 2 May 2024, Edgar E. Iglesias wrote:
> > On Wed, May 1, 2024 at 11:24=E2=80=AFPM Stefano Stabellini
> > <sstabellini@kernel.org> wrote:
> > >
> > > On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> > > > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > > >
> > > > The current mapcache assumes that all memory is mapped
> > > > in a single RAM MR (the first one with offset 0). Remove
> > > > this assumption and propagate the offset to the mapcache
> > > > so it can do reverse mappings (from hostptr -> ram_addr).
> > > >
> > > > This is in preparation for adding grant mappings.
> > > >
> > > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > >
> > >
> > > Looking at xen_remap_bucket, it is only using address_index (without
> > > adding ram_offset) to map foreign memory. From xen_remap_bucket, I wo=
uld
> > > understand that address_index already includes the ram_offset.
> > >
> > > Meaning that if we want to map foreign mapping at address 0x5000, the=
n
> > > address_index would be 0x5000, even if ram_offset is 0x1000.
> > >
> > > But then looking xen_ram_addr_from_mapcache_single ram_offset is adde=
d
> > > to paddr_index to calculate the physical address. So in that case we
> > > would want address_index to be 0x4000 and ram_offset to be 0x1000. Bu=
t
> > > xen_remap_bucket would have to sum address_index and ram_offset to ma=
p
> > > foreign memory.
> > >
> > > So I am a bit confused, did I get it wrong? One more comment below.
> > >
> >
> > Thanks Stefano,
> >
> > I think the confusion is that this ram_addr_offset is not related to
> > guest address-space.
> > It's a QEMU internal thing and it shouldn't be included in the address
> > used to map foreign memory.
> > The mapcache can treat this ram_addr offset like a cookie that we keep
> > around to be able to do
> > reverse mappings from host pointers into ram_addr space
> > (xen_ram_addr_from_mapcache).
> >
> > The current mapcache implementation works because we've really only
> > been using foreign mappings
> > on RAMBlocks with offset 0. We're also creating RAM's such that the
> > offset into the RAM is also
> > the guest physical address, for x86 this is natural since RAM starts
> > at zero (for lowmem) but for
> > ARM we're creating larger than needed RAM's (GUEST_RAM0_BASE + ram-size=
) to
> > make this assumption true. Anyway, In this series I'm not addressing
> > this second assumption.
>
> Let's see if I understand correctly.
>
> The ram_addr space is an internal QEMU address space which is different
> from the guest physical address space and thus cannot and should not be
> used to do foreign mappings (foreign mapping hypercalls take a guest
> physical or a real physical address to map). Is that correct?
>
> If so, then I understand.
>

Yes, that matches my understanding.

>
>
> > There's a second call in physmem.c to xen_map_cache using the
> > block->offset as an address.
> > I was considering removing that second call since I can't see how it ca=
n work
> > (except perhaps in some specific use-case by luck?). Anyway, for now
> > I've left it unmodified.
>
> Yes, that code was written with the assumption that block->offset is an
> offset in the guest physical address space and could be used as a guest
> physical address. Actually, you might have spotted a real bug.
>
> The intent was for smaller regions (not the bit RAM region, things like
> a ROM region for instance) we could map them in full. So here we were
> trying to map the whole thing from start to finish using block->offset
> as start.
>
>
> > > > ---
> > > >  hw/xen/xen-mapcache.c         | 25 ++++++++++++++++++-------
> > > >  include/sysemu/xen-mapcache.h |  2 ++
> > > >  system/physmem.c              |  8 ++++----
> > > >  3 files changed, 24 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> > > > index 09b5f36d9c..1b32d0c003 100644
> > > > --- a/hw/xen/xen-mapcache.c
> > > > +++ b/hw/xen/xen-mapcache.c
> > > > @@ -43,6 +43,9 @@ typedef struct MapCacheEntry {
> > > >  #define XEN_MAPCACHE_ENTRY_DUMMY (1 << 0)
> > > >      uint8_t flags;
> > > >      hwaddr size;
> > > > +
> > > > +    /* Keep ram_addr offset for reverse mappings (hostptr -> ram_a=
ddr).  */
> > > > +    ram_addr_t ram_offset;
> > > >      struct MapCacheEntry *next;
> > > >  } MapCacheEntry;
> > > >
> > > > @@ -165,7 +168,8 @@ static void xen_remap_bucket(MapCache *mc,
> > > >                               void *vaddr,
> > > >                               hwaddr size,
> > > >                               hwaddr address_index,
> > > > -                             bool dummy)
> > > > +                             bool dummy,
> > > > +                             ram_addr_t ram_offset)
> > > >  {
> > > >      uint8_t *vaddr_base;
> > > >      xen_pfn_t *pfns;
> > > > @@ -244,6 +248,7 @@ static void xen_remap_bucket(MapCache *mc,
> > > >      entry->size =3D size;
> > > >      entry->valid_mapping =3D g_new0(unsigned long,
> > > >                                    BITS_TO_LONGS(size >> XC_PAGE_SH=
IFT));
> > > > +    entry->ram_offset =3D ram_offset;
> > > >
> > > >      if (dummy) {
> > > >          entry->flags |=3D XEN_MAPCACHE_ENTRY_DUMMY;
> > > > @@ -264,6 +269,7 @@ static void xen_remap_bucket(MapCache *mc,
> > > >
> > > >  static uint8_t *xen_map_cache_unlocked(MapCache *mc,
> > > >                                         hwaddr phys_addr, hwaddr si=
ze,
> > > > +                                       ram_addr_t ram_offset,
> > > >                                         uint8_t lock, bool dma, boo=
l is_write)
> > > >  {
> > > >      MapCacheEntry *entry, *pentry =3D NULL,
> > > > @@ -335,14 +341,16 @@ tryagain:
> > > >      if (!entry) {
> > > >          entry =3D g_new0(MapCacheEntry, 1);
> > > >          pentry->next =3D entry;
> > > > -        xen_remap_bucket(mc, entry, NULL, cache_size, address_inde=
x, dummy);
> > > > +        xen_remap_bucket(mc, entry, NULL, cache_size, address_inde=
x, dummy,
> > > > +                         ram_offset);
> > > >      } else if (!entry->lock) {
> > > >          if (!entry->vaddr_base || entry->paddr_index !=3D address_=
index ||
> > > >                  entry->size !=3D cache_size ||
> > > >                  !test_bits(address_offset >> XC_PAGE_SHIFT,
> > > >                      test_bit_size >> XC_PAGE_SHIFT,
> > > >                      entry->valid_mapping)) {
> > > > -            xen_remap_bucket(mc, entry, NULL, cache_size, address_=
index, dummy);
> > > > +            xen_remap_bucket(mc, entry, NULL, cache_size, address_=
index, dummy,
> > > > +                             ram_offset);
> > > >          }
> > > >      }
> > > >
> > > > @@ -389,13 +397,15 @@ tryagain:
> > > >
> > > >  uint8_t *xen_map_cache(MemoryRegion *mr,
> > > >                         hwaddr phys_addr, hwaddr size,
> > > > +                       ram_addr_t ram_addr_offset,
> > > >                         uint8_t lock, bool dma,
> > > >                         bool is_write)
> > > >  {
> > > >      uint8_t *p;
> > > >
> > > >      mapcache_lock(mapcache);
> > > > -    p =3D xen_map_cache_unlocked(mapcache, phys_addr, size, lock, =
dma, is_write);
> > > > +    p =3D xen_map_cache_unlocked(mapcache, phys_addr, size, ram_ad=
dr_offset,
> > > > +                               lock, dma, is_write);
> > > >      mapcache_unlock(mapcache);
> > > >      return p;
> > > >  }
> > > > @@ -432,7 +442,8 @@ static ram_addr_t xen_ram_addr_from_mapcache_si=
ngle(MapCache *mc, void *ptr)
> > > >          raddr =3D RAM_ADDR_INVALID;
> > > >      } else {
> > > >          raddr =3D (reventry->paddr_index << mc->bucket_shift) +
> > > > -             ((unsigned long) ptr - (unsigned long) entry->vaddr_b=
ase);
> > > > +             ((unsigned long) ptr - (unsigned long) entry->vaddr_b=
ase) +
> > > > +             entry->ram_offset;
> > > >      }
> > > >      mapcache_unlock(mc);
> > > >      return raddr;
> > > > @@ -627,8 +638,8 @@ static uint8_t *xen_replace_cache_entry_unlocke=
d(MapCache *mc,
> > > >
> > > >      trace_xen_replace_cache_entry_dummy(old_phys_addr, new_phys_ad=
dr);
> > > >
> > > > -    xen_remap_bucket(mapcache, entry, entry->vaddr_base,
> > > > -                     cache_size, address_index, false);
> > > > +    xen_remap_bucket(mc, entry, entry->vaddr_base,
> > > > +                     cache_size, address_index, false, entry->ram_=
offset);
> > > >      if (!test_bits(address_offset >> XC_PAGE_SHIFT,
> > > >                  test_bit_size >> XC_PAGE_SHIFT,
> > > >                  entry->valid_mapping)) {
> > > > diff --git a/include/sysemu/xen-mapcache.h b/include/sysemu/xen-map=
cache.h
> > > > index 1ec9e66752..b5e3ea1bc0 100644
> > > > --- a/include/sysemu/xen-mapcache.h
> > > > +++ b/include/sysemu/xen-mapcache.h
> > > > @@ -19,6 +19,7 @@ typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr p=
hys_offset,
> > > >  void xen_map_cache_init(phys_offset_to_gaddr_t f,
> > > >                          void *opaque);
> > > >  uint8_t *xen_map_cache(MemoryRegion *mr, hwaddr phys_addr, hwaddr =
size,
> > > > +                       ram_addr_t ram_addr_offset,
> > > >                         uint8_t lock, bool dma,
> > > >                         bool is_write);
> > > >  ram_addr_t xen_ram_addr_from_mapcache(void *ptr);
> > > > @@ -37,6 +38,7 @@ static inline void xen_map_cache_init(phys_offset=
_to_gaddr_t f,
> > > >  static inline uint8_t *xen_map_cache(MemoryRegion *mr,
> > > >                                       hwaddr phys_addr,
> > > >                                       hwaddr size,
> > > > +                                     ram_addr_t ram_addr_offset,
> > > >                                       uint8_t lock,
> > > >                                       bool dma,
> > > >                                       bool is_write)
> > > > diff --git a/system/physmem.c b/system/physmem.c
> > > > index 1a5ffcba2a..5b16eeccca 100644
> > > > --- a/system/physmem.c
> > > > +++ b/system/physmem.c
> > > > @@ -2228,13 +2228,13 @@ static void *qemu_ram_ptr_length(RAMBlock *=
block, ram_addr_t addr,
> > > >           * In that case just map the requested area.
> > > >           */
> > > >          if (xen_mr_is_memory(block->mr)) {
> > > > -            return xen_map_cache(block->mr, addr, len, lock, lock,
> > > > -                                 is_write);
> > > > +            return xen_map_cache(block->mr, addr, len, block->offs=
et,
> > > > +                                 lock, lock, is_write);
> > >
> > > Have you considered not tracking offset and address separately and
> > > simply do this?
> > >
> > >             return xen_map_cache(block->mr, addr + block->offset, len=
,
> > >                                  lock, lock, is_write);
> > >
> >
> > Unfortunately this won't work since block->offset is not related to whe=
re this
> > ram is mapped in guest address-space. In the case of grant's, we'd get =
the
> > wrong grant ref. See my previous comment.
>
> OK, this code below (the second xen_map_cache call passing block->offset
> as start address) was wrong before this patch. Can we fix it before
> changing it further with this patch? I worry about making things even
> worse.
>

I'll dig around and see if we can find something that explains more.
There's some older code that implements some sort of address-translation
for x86 between ram_addr space and guest physical addresses but
that code is turned off with newer Xen versions (disabled in my build).

https://github.com/qemu/qemu/blob/master/hw/xen/xen-mapcache.c#L330
https://github.com/qemu/qemu/blob/master/hw/i386/xen/xen-hvm.c#L193

Cheers,
Edgar


> > > >          }
> > > >
> > > >          block->host =3D xen_map_cache(block->mr, block->offset,
> > > > -                                    block->max_length, 1,
> > > > -                                    lock, is_write);
> > > > +                                    block->max_length, 0,
> > > > +                                    1, lock, is_write);
> > > >      }
> > > >
> > > >      return ramblock_ptr(block, addr);
> > > > --
> > > > 2.40.1
> > > >
> >

