Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58798B952E
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 09:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715594.1117341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Qm0-0003gU-6x; Thu, 02 May 2024 07:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715594.1117341; Thu, 02 May 2024 07:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Qm0-0003dY-3i; Thu, 02 May 2024 07:22:32 +0000
Received: by outflank-mailman (input) for mailman id 715594;
 Thu, 02 May 2024 07:22:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1TOG=MF=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s2Qly-0003dS-J2
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 07:22:30 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb2af934-0854-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 09:22:28 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5709cb80b03so8049364a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 00:22:28 -0700 (PDT)
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
X-Inumbo-ID: bb2af934-0854-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714634548; x=1715239348; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBJFJ5wMx1BtKIT2P03my37zyaWn91PkqyxuO5aXPNk=;
        b=d66o55N8FW/h6DzzLHctEX1ZE9oIcWra8yzPIHSlvddSJHNqScbDcSMD9Pi3b+VKuK
         O3fvy9RMTYdczM8SOvBCArVSPapQc+VTl9BPEXJtRJuvc7tFi111wGoeYVWC9OFINxpu
         54VldijEgQH5K+RQfGiB7bDBxul+q5NDTgAziV95TAUoyeMh+DmBeslJhQOkfqzoUP3G
         FOfYM+0OTzoIM1RhnVIkF0ddJ7+8pnUv1oT+CDugZngOnpXVZL2idjS8igEVyz/m5768
         Sj6VRX2SCeHHlSL/g/+zjPrPHxOIKpRth+OnSAqp4AZkvnsFjxJu7XK2LuPUCrGCELT/
         GJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714634548; x=1715239348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBJFJ5wMx1BtKIT2P03my37zyaWn91PkqyxuO5aXPNk=;
        b=a/83VWUMX62T9Ph5IeRHfi5ZIQHjZ3m6XjJcumGwdZSXzvT5LcZahXnsSihUL1FKqc
         jnrbU6R1Una3OFf6vkdySI1IR0DRXzGdd+mHXoKet4Hu/FKt7f2/B6Ho50khOvuN9UbZ
         2Gqh2XnJIdEUbMQvieDs7ebQm7Bz5b29dZT6fcUhZjCBXn6wCRFjDVm0CBlRFz6kQnpd
         //9EyoHiYLIxzR8X46EizO+IFgZw+9qNCpc7qklBZTu4da5urKC9nuX1s81Iu58zrhHO
         rHTNg5TDDuz7MkmLiN4wHq/3PTCBj2ScsIpciV7xZebhGIcbOvs6fB0FG70WKOiIf5ff
         Hb7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSFlwGm5riNo+YI66sEgwn+XP/h8K+xPr5zqG3WL3OotlylbSfqDETupfxJq+PmGHeUlgU5kstaNN2AF3YFlvQi/3rzb+h/E5UUSbGWqE=
X-Gm-Message-State: AOJu0Yx9hSX3yAnKklYfKb2igCBQPS3iEJ6hv2B6VN+e/2YnAJl5Xhb6
	w468pErX0v4/oX09x88opLx5CwmPPusLNIweREs3vM9oruS3BmJgp0YtyIT2+++AaJ5N/lXbWUS
	otp7XfesEMf3jyafdV2wn+yXTuMQ=
X-Google-Smtp-Source: AGHT+IHSlb8IZgbXfdiILZJA/hvGebr0LK4P+w6/TsM+AJ6nYP9B3xdfVB6EUd55X8OzdH8lqoW18BT4TFiV4dMG2EU=
X-Received: by 2002:a50:bb26:0:b0:572:4faf:ed68 with SMTP id
 y35-20020a50bb26000000b005724fafed68mr3115003ede.27.1714634547567; Thu, 02
 May 2024 00:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-16-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2405011414320.497719@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2405011414320.497719@ubuntu-linux-20-04-desktop>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 2 May 2024 09:22:15 +0200
Message-ID: <CAJy5ezoQ4Q6kc9T8_P3nEU6N20e6Pvr3K_zuM0j95RcG-hDgfw@mail.gmail.com>
Subject: Re: [PATCH v4 15/17] xen: mapcache: Remove assumption of RAMBlock
 with 0 offset
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, jgross@suse.com, 
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 1, 2024 at 11:24=E2=80=AFPM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> > The current mapcache assumes that all memory is mapped
> > in a single RAM MR (the first one with offset 0). Remove
> > this assumption and propagate the offset to the mapcache
> > so it can do reverse mappings (from hostptr -> ram_addr).
> >
> > This is in preparation for adding grant mappings.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>
>
> Looking at xen_remap_bucket, it is only using address_index (without
> adding ram_offset) to map foreign memory. From xen_remap_bucket, I would
> understand that address_index already includes the ram_offset.
>
> Meaning that if we want to map foreign mapping at address 0x5000, then
> address_index would be 0x5000, even if ram_offset is 0x1000.
>
> But then looking xen_ram_addr_from_mapcache_single ram_offset is added
> to paddr_index to calculate the physical address. So in that case we
> would want address_index to be 0x4000 and ram_offset to be 0x1000. But
> xen_remap_bucket would have to sum address_index and ram_offset to map
> foreign memory.
>
> So I am a bit confused, did I get it wrong? One more comment below.
>

Thanks Stefano,

I think the confusion is that this ram_addr_offset is not related to
guest address-space.
It's a QEMU internal thing and it shouldn't be included in the address
used to map foreign memory.
The mapcache can treat this ram_addr offset like a cookie that we keep
around to be able to do
reverse mappings from host pointers into ram_addr space
(xen_ram_addr_from_mapcache).

The current mapcache implementation works because we've really only
been using foreign mappings
on RAMBlocks with offset 0. We're also creating RAM's such that the
offset into the RAM is also
the guest physical address, for x86 this is natural since RAM starts
at zero (for lowmem) but for
ARM we're creating larger than needed RAM's (GUEST_RAM0_BASE + ram-size) to
make this assumption true. Anyway, In this series I'm not addressing
this second assumption.

There's a second call in physmem.c to xen_map_cache using the
block->offset as an address.
I was considering removing that second call since I can't see how it can wo=
rk
(except perhaps in some specific use-case by luck?). Anyway, for now
I've left it unmodified.


>
> > ---
> >  hw/xen/xen-mapcache.c         | 25 ++++++++++++++++++-------
> >  include/sysemu/xen-mapcache.h |  2 ++
> >  system/physmem.c              |  8 ++++----
> >  3 files changed, 24 insertions(+), 11 deletions(-)
> >
> > diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> > index 09b5f36d9c..1b32d0c003 100644
> > --- a/hw/xen/xen-mapcache.c
> > +++ b/hw/xen/xen-mapcache.c
> > @@ -43,6 +43,9 @@ typedef struct MapCacheEntry {
> >  #define XEN_MAPCACHE_ENTRY_DUMMY (1 << 0)
> >      uint8_t flags;
> >      hwaddr size;
> > +
> > +    /* Keep ram_addr offset for reverse mappings (hostptr -> ram_addr)=
.  */
> > +    ram_addr_t ram_offset;
> >      struct MapCacheEntry *next;
> >  } MapCacheEntry;
> >
> > @@ -165,7 +168,8 @@ static void xen_remap_bucket(MapCache *mc,
> >                               void *vaddr,
> >                               hwaddr size,
> >                               hwaddr address_index,
> > -                             bool dummy)
> > +                             bool dummy,
> > +                             ram_addr_t ram_offset)
> >  {
> >      uint8_t *vaddr_base;
> >      xen_pfn_t *pfns;
> > @@ -244,6 +248,7 @@ static void xen_remap_bucket(MapCache *mc,
> >      entry->size =3D size;
> >      entry->valid_mapping =3D g_new0(unsigned long,
> >                                    BITS_TO_LONGS(size >> XC_PAGE_SHIFT)=
);
> > +    entry->ram_offset =3D ram_offset;
> >
> >      if (dummy) {
> >          entry->flags |=3D XEN_MAPCACHE_ENTRY_DUMMY;
> > @@ -264,6 +269,7 @@ static void xen_remap_bucket(MapCache *mc,
> >
> >  static uint8_t *xen_map_cache_unlocked(MapCache *mc,
> >                                         hwaddr phys_addr, hwaddr size,
> > +                                       ram_addr_t ram_offset,
> >                                         uint8_t lock, bool dma, bool is=
_write)
> >  {
> >      MapCacheEntry *entry, *pentry =3D NULL,
> > @@ -335,14 +341,16 @@ tryagain:
> >      if (!entry) {
> >          entry =3D g_new0(MapCacheEntry, 1);
> >          pentry->next =3D entry;
> > -        xen_remap_bucket(mc, entry, NULL, cache_size, address_index, d=
ummy);
> > +        xen_remap_bucket(mc, entry, NULL, cache_size, address_index, d=
ummy,
> > +                         ram_offset);
> >      } else if (!entry->lock) {
> >          if (!entry->vaddr_base || entry->paddr_index !=3D address_inde=
x ||
> >                  entry->size !=3D cache_size ||
> >                  !test_bits(address_offset >> XC_PAGE_SHIFT,
> >                      test_bit_size >> XC_PAGE_SHIFT,
> >                      entry->valid_mapping)) {
> > -            xen_remap_bucket(mc, entry, NULL, cache_size, address_inde=
x, dummy);
> > +            xen_remap_bucket(mc, entry, NULL, cache_size, address_inde=
x, dummy,
> > +                             ram_offset);
> >          }
> >      }
> >
> > @@ -389,13 +397,15 @@ tryagain:
> >
> >  uint8_t *xen_map_cache(MemoryRegion *mr,
> >                         hwaddr phys_addr, hwaddr size,
> > +                       ram_addr_t ram_addr_offset,
> >                         uint8_t lock, bool dma,
> >                         bool is_write)
> >  {
> >      uint8_t *p;
> >
> >      mapcache_lock(mapcache);
> > -    p =3D xen_map_cache_unlocked(mapcache, phys_addr, size, lock, dma,=
 is_write);
> > +    p =3D xen_map_cache_unlocked(mapcache, phys_addr, size, ram_addr_o=
ffset,
> > +                               lock, dma, is_write);
> >      mapcache_unlock(mapcache);
> >      return p;
> >  }
> > @@ -432,7 +442,8 @@ static ram_addr_t xen_ram_addr_from_mapcache_single=
(MapCache *mc, void *ptr)
> >          raddr =3D RAM_ADDR_INVALID;
> >      } else {
> >          raddr =3D (reventry->paddr_index << mc->bucket_shift) +
> > -             ((unsigned long) ptr - (unsigned long) entry->vaddr_base)=
;
> > +             ((unsigned long) ptr - (unsigned long) entry->vaddr_base)=
 +
> > +             entry->ram_offset;
> >      }
> >      mapcache_unlock(mc);
> >      return raddr;
> > @@ -627,8 +638,8 @@ static uint8_t *xen_replace_cache_entry_unlocked(Ma=
pCache *mc,
> >
> >      trace_xen_replace_cache_entry_dummy(old_phys_addr, new_phys_addr);
> >
> > -    xen_remap_bucket(mapcache, entry, entry->vaddr_base,
> > -                     cache_size, address_index, false);
> > +    xen_remap_bucket(mc, entry, entry->vaddr_base,
> > +                     cache_size, address_index, false, entry->ram_offs=
et);
> >      if (!test_bits(address_offset >> XC_PAGE_SHIFT,
> >                  test_bit_size >> XC_PAGE_SHIFT,
> >                  entry->valid_mapping)) {
> > diff --git a/include/sysemu/xen-mapcache.h b/include/sysemu/xen-mapcach=
e.h
> > index 1ec9e66752..b5e3ea1bc0 100644
> > --- a/include/sysemu/xen-mapcache.h
> > +++ b/include/sysemu/xen-mapcache.h
> > @@ -19,6 +19,7 @@ typedef hwaddr (*phys_offset_to_gaddr_t)(hwaddr phys_=
offset,
> >  void xen_map_cache_init(phys_offset_to_gaddr_t f,
> >                          void *opaque);
> >  uint8_t *xen_map_cache(MemoryRegion *mr, hwaddr phys_addr, hwaddr size=
,
> > +                       ram_addr_t ram_addr_offset,
> >                         uint8_t lock, bool dma,
> >                         bool is_write);
> >  ram_addr_t xen_ram_addr_from_mapcache(void *ptr);
> > @@ -37,6 +38,7 @@ static inline void xen_map_cache_init(phys_offset_to_=
gaddr_t f,
> >  static inline uint8_t *xen_map_cache(MemoryRegion *mr,
> >                                       hwaddr phys_addr,
> >                                       hwaddr size,
> > +                                     ram_addr_t ram_addr_offset,
> >                                       uint8_t lock,
> >                                       bool dma,
> >                                       bool is_write)
> > diff --git a/system/physmem.c b/system/physmem.c
> > index 1a5ffcba2a..5b16eeccca 100644
> > --- a/system/physmem.c
> > +++ b/system/physmem.c
> > @@ -2228,13 +2228,13 @@ static void *qemu_ram_ptr_length(RAMBlock *bloc=
k, ram_addr_t addr,
> >           * In that case just map the requested area.
> >           */
> >          if (xen_mr_is_memory(block->mr)) {
> > -            return xen_map_cache(block->mr, addr, len, lock, lock,
> > -                                 is_write);
> > +            return xen_map_cache(block->mr, addr, len, block->offset,
> > +                                 lock, lock, is_write);
>
> Have you considered not tracking offset and address separately and
> simply do this?
>
>             return xen_map_cache(block->mr, addr + block->offset, len,
>                                  lock, lock, is_write);
>

Unfortunately this won't work since block->offset is not related to where t=
his
ram is mapped in guest address-space. In the case of grant's, we'd get the
wrong grant ref. See my previous comment.

Cheers,
Edgar


>
> >          }
> >
> >          block->host =3D xen_map_cache(block->mr, block->offset,
> > -                                    block->max_length, 1,
> > -                                    lock, is_write);
> > +                                    block->max_length, 0,
> > +                                    1, lock, is_write);
> >      }
> >
> >      return ramblock_ptr(block, addr);
> > --
> > 2.40.1
> >

