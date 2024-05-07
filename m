Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C36AB8BEA5B
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 19:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718381.1121000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4OTC-0005uB-H5; Tue, 07 May 2024 17:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718381.1121000; Tue, 07 May 2024 17:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4OTC-0005rw-E5; Tue, 07 May 2024 17:19:14 +0000
Received: by outflank-mailman (input) for mailman id 718381;
 Tue, 07 May 2024 17:19:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0blL=MK=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s4OTA-0005rU-Tc
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 17:19:13 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebdfab3c-0c95-11ef-909c-e314d9c70b13;
 Tue, 07 May 2024 19:19:12 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a5200afe39eso900944566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2024 10:19:12 -0700 (PDT)
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
X-Inumbo-ID: ebdfab3c-0c95-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715102351; x=1715707151; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJb6Fs5+m3mfHuEewj/2Zpd4X1a6+E0R+LSwyHP9T0Y=;
        b=BVW7+WU1EEwFM4CPtFljaRDY5IkPk2jIyS7BnXRlJewnwZskolvI7H/46Abc0aW+M1
         D4lkRkqIvjUte/bfTnR9Og8rVB0O7ngAAjT1sexBA4Xh14VBHuPW6g6XnhyGJ2MWEXQX
         zLfNo8fSDZI6ZEnTKXOlW/CIskBFaVMZBu0LbaZu8nb+tVHftSc05VNKQxsm1VdJM23Y
         4G3aoEhXjJZiS0Hx/DiiW/oOJuUsct9aeuddwPL/4I3QF5FXchiOv0Rnak2AiirISvVd
         z3+po8lTkxHBQNVrfO89b+36bMJ0Lye4AE64EGuWQi1Yr1rhzkU3KGuXH/r/SJRENWyD
         0Y1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715102351; x=1715707151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJb6Fs5+m3mfHuEewj/2Zpd4X1a6+E0R+LSwyHP9T0Y=;
        b=RqDW6VQQXEvtGpuYpfCbga16NLgUVv9DpwjcXBgJyyx7NDbAFRM7j7Y59bifGUsiIz
         ++XdYFyfpb7BfFpzM+WMw55FqxbD9b/3QJxn0ez9z7HrOH+Y3HMRExRBByQA+XoBUbqs
         ukdcQ2uJ8hKX3wG0hL4k5LUGJlUdM1aepsFAXcVp5jU9Tl1iXP30civQ58hIikTnX+kR
         SqChnrX4rLiecgyKvsKZpDGyAuWR6QM8mxDuaXjXzZRjKirfaenEG399mehhvJZgP/hE
         DL7s+HqXXIjZOZla6vUEe99Oki6d++P/4/h2CK8iUFSoei0hy7PimMNAgcAZr9XVrZ8A
         QDZg==
X-Forwarded-Encrypted: i=1; AJvYcCV7X1ruiupBa+GVcgPx7d0OkRImiiUDBTP6y7bDW9GsF6ktiaOqZU2hZw1TlHa+60bhiGg8CYuAUQTMEu4iazjedHqoctETDwYa+QX/Sbk=
X-Gm-Message-State: AOJu0YwHdI/lOgodyt6YDgYFF75av5mWlmt0QV3Dkyrjt8M1JwR5icHV
	2KgK1XzvcDQOxlf7b933uENjw8spZCLcVJnghSU7uChl6yhnLN1Ks83Cbii0K5IuIAhhZKr3cam
	f4b+47OkZIFWkECQ7yM6bz9Hz28U=
X-Google-Smtp-Source: AGHT+IGl4aWcvM+580d59kYVJt6J/TIw0/S9A88EwJy2nsKC4dankoJEo04a6Ct4IEezazd8WxDbcCDSrDREQxhRmgc=
X-Received: by 2002:a50:d78b:0:b0:568:cdd8:cf60 with SMTP id
 4fb4d7f45d1cf-5731d9b5e37mr305529a12.8.1715102351091; Tue, 07 May 2024
 10:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-16-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2405011414320.497719@ubuntu-linux-20-04-desktop>
 <CAJy5ezoQ4Q6kc9T8_P3nEU6N20e6Pvr3K_zuM0j95RcG-hDgfw@mail.gmail.com>
 <alpine.DEB.2.22.394.2405021144270.624854@ubuntu-linux-20-04-desktop>
 <CAJy5ezq+wd4T91YPEarea4eUXp_CJftvPYMJT2AzA66DWjy34w@mail.gmail.com> <alpine.DEB.2.22.394.2405021301400.624854@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2405021301400.624854@ubuntu-linux-20-04-desktop>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Tue, 7 May 2024 19:18:57 +0200
Message-ID: <CAJy5ezoTVyP5Rs=zM3jdY2NKhwQqDuCWD9oG72m4Xsdc-kmc+A@mail.gmail.com>
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

On Thu, May 2, 2024 at 10:02=E2=80=AFPM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Thu, 2 May 2024, Edgar E. Iglesias wrote:
> > On Thu, May 2, 2024 at 8:53=E2=80=AFPM Stefano Stabellini
> > <sstabellini@kernel.org> wrote:
> > >
> > > +Xenia
> > >
> > > On Thu, 2 May 2024, Edgar E. Iglesias wrote:
> > > > On Wed, May 1, 2024 at 11:24=E2=80=AFPM Stefano Stabellini
> > > > <sstabellini@kernel.org> wrote:
> > > > >
> > > > > On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> > > > > > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> > > > > >
> > > > > > The current mapcache assumes that all memory is mapped
> > > > > > in a single RAM MR (the first one with offset 0). Remove
> > > > > > this assumption and propagate the offset to the mapcache
> > > > > > so it can do reverse mappings (from hostptr -> ram_addr).
> > > > > >
> > > > > > This is in preparation for adding grant mappings.
> > > > > >
> > > > > > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > > > >
> > > > >
> > > > > Looking at xen_remap_bucket, it is only using address_index (with=
out
> > > > > adding ram_offset) to map foreign memory. From xen_remap_bucket, =
I would
> > > > > understand that address_index already includes the ram_offset.
> > > > >
> > > > > Meaning that if we want to map foreign mapping at address 0x5000,=
 then
> > > > > address_index would be 0x5000, even if ram_offset is 0x1000.
> > > > >
> > > > > But then looking xen_ram_addr_from_mapcache_single ram_offset is =
added
> > > > > to paddr_index to calculate the physical address. So in that case=
 we
> > > > > would want address_index to be 0x4000 and ram_offset to be 0x1000=
. But
> > > > > xen_remap_bucket would have to sum address_index and ram_offset t=
o map
> > > > > foreign memory.
> > > > >
> > > > > So I am a bit confused, did I get it wrong? One more comment belo=
w.
> > > > >
> > > >
> > > > Thanks Stefano,
> > > >
> > > > I think the confusion is that this ram_addr_offset is not related t=
o
> > > > guest address-space.
> > > > It's a QEMU internal thing and it shouldn't be included in the addr=
ess
> > > > used to map foreign memory.
> > > > The mapcache can treat this ram_addr offset like a cookie that we k=
eep
> > > > around to be able to do
> > > > reverse mappings from host pointers into ram_addr space
> > > > (xen_ram_addr_from_mapcache).
> > > >
> > > > The current mapcache implementation works because we've really only
> > > > been using foreign mappings
> > > > on RAMBlocks with offset 0. We're also creating RAM's such that the
> > > > offset into the RAM is also
> > > > the guest physical address, for x86 this is natural since RAM start=
s
> > > > at zero (for lowmem) but for
> > > > ARM we're creating larger than needed RAM's (GUEST_RAM0_BASE + ram-=
size) to
> > > > make this assumption true. Anyway, In this series I'm not addressin=
g
> > > > this second assumption.
> > >
> > > Let's see if I understand correctly.
> > >
> > > The ram_addr space is an internal QEMU address space which is differe=
nt
> > > from the guest physical address space and thus cannot and should not =
be
> > > used to do foreign mappings (foreign mapping hypercalls take a guest
> > > physical or a real physical address to map). Is that correct?
> > >
> > > If so, then I understand.
> > >
> >
> > Yes, that matches my understanding.
> >
> > >
> > >
> > > > There's a second call in physmem.c to xen_map_cache using the
> > > > block->offset as an address.
> > > > I was considering removing that second call since I can't see how i=
t can work
> > > > (except perhaps in some specific use-case by luck?). Anyway, for no=
w
> > > > I've left it unmodified.
> > >
> > > Yes, that code was written with the assumption that block->offset is =
an
> > > offset in the guest physical address space and could be used as a gue=
st
> > > physical address. Actually, you might have spotted a real bug.
> > >
> > > The intent was for smaller regions (not the bit RAM region, things li=
ke
> > > a ROM region for instance) we could map them in full. So here we were
> > > trying to map the whole thing from start to finish using block->offse=
t
> > > as start.
> > >
> > >
> > > > > > ---
> > > > > >  hw/xen/xen-mapcache.c         | 25 ++++++++++++++++++-------
> > > > > >  include/sysemu/xen-mapcache.h |  2 ++
> > > > > >  system/physmem.c              |  8 ++++----
> > > > > >  3 files changed, 24 insertions(+), 11 deletions(-)
> > > > > >
> > > > > > diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> > > > > > index 09b5f36d9c..1b32d0c003 100644
> > > > > > --- a/hw/xen/xen-mapcache.c
> > > > > > +++ b/hw/xen/xen-mapcache.c
> > > > > > @@ -43,6 +43,9 @@ typedef struct MapCacheEntry {
> > > > > >  #define XEN_MAPCACHE_ENTRY_DUMMY (1 << 0)
> > > > > >      uint8_t flags;
> > > > > >      hwaddr size;
> > > > > > +
> > > > > > +    /* Keep ram_addr offset for reverse mappings (hostptr -> r=
am_addr).  */
> > > > > > +    ram_addr_t ram_offset;
> > > > > >      struct MapCacheEntry *next;
> > > > > >  } MapCacheEntry;
> > > > > >
> > > > > > @@ -165,7 +168,8 @@ static void xen_remap_bucket(MapCache *mc,
> > > > > >                               void *vaddr,
> > > > > >                               hwaddr size,
> > > > > >                               hwaddr address_index,
> > > > > > -                             bool dummy)
> > > > > > +                             bool dummy,
> > > > > > +                             ram_addr_t ram_offset)
> > > > > >  {
> > > > > >      uint8_t *vaddr_base;
> > > > > >      xen_pfn_t *pfns;
> > > > > > @@ -244,6 +248,7 @@ static void xen_remap_bucket(MapCache *mc,
> > > > > >      entry->size =3D size;
> > > > > >      entry->valid_mapping =3D g_new0(unsigned long,
> > > > > >                                    BITS_TO_LONGS(size >> XC_PAG=
E_SHIFT));
> > > > > > +    entry->ram_offset =3D ram_offset;
> > > > > >
> > > > > >      if (dummy) {
> > > > > >          entry->flags |=3D XEN_MAPCACHE_ENTRY_DUMMY;
> > > > > > @@ -264,6 +269,7 @@ static void xen_remap_bucket(MapCache *mc,
> > > > > >
> > > > > >  static uint8_t *xen_map_cache_unlocked(MapCache *mc,
> > > > > >                                         hwaddr phys_addr, hwadd=
r size,
> > > > > > +                                       ram_addr_t ram_offset,
> > > > > >                                         uint8_t lock, bool dma,=
 bool is_write)
> > > > > >  {
> > > > > >      MapCacheEntry *entry, *pentry =3D NULL,
> > > > > > @@ -335,14 +341,16 @@ tryagain:
> > > > > >      if (!entry) {
> > > > > >          entry =3D g_new0(MapCacheEntry, 1);
> > > > > >          pentry->next =3D entry;
> > > > > > -        xen_remap_bucket(mc, entry, NULL, cache_size, address_=
index, dummy);
> > > > > > +        xen_remap_bucket(mc, entry, NULL, cache_size, address_=
index, dummy,
> > > > > > +                         ram_offset);
> > > > > >      } else if (!entry->lock) {
> > > > > >          if (!entry->vaddr_base || entry->paddr_index !=3D addr=
ess_index ||
> > > > > >                  entry->size !=3D cache_size ||
> > > > > >                  !test_bits(address_offset >> XC_PAGE_SHIFT,
> > > > > >                      test_bit_size >> XC_PAGE_SHIFT,
> > > > > >                      entry->valid_mapping)) {
> > > > > > -            xen_remap_bucket(mc, entry, NULL, cache_size, addr=
ess_index, dummy);
> > > > > > +            xen_remap_bucket(mc, entry, NULL, cache_size, addr=
ess_index, dummy,
> > > > > > +                             ram_offset);
> > > > > >          }
> > > > > >      }
> > > > > >
> > > > > > @@ -389,13 +397,15 @@ tryagain:
> > > > > >
> > > > > >  uint8_t *xen_map_cache(MemoryRegion *mr,
> > > > > >                         hwaddr phys_addr, hwaddr size,
> > > > > > +                       ram_addr_t ram_addr_offset,
> > > > > >                         uint8_t lock, bool dma,
> > > > > >                         bool is_write)
> > > > > >  {
> > > > > >      uint8_t *p;
> > > > > >
> > > > > >      mapcache_lock(mapcache);
> > > > > > -    p =3D xen_map_cache_unlocked(mapcache, phys_addr, size, lo=
ck, dma, is_write);
> > > > > > +    p =3D xen_map_cache_unlocked(mapcache, phys_addr, size, ra=
m_addr_offset,
> > > > > > +                               lock, dma, is_write);
> > > > > >      mapcache_unlock(mapcache);
> > > > > >      return p;
> > > > > >  }
> > > > > > @@ -432,7 +442,8 @@ static ram_addr_t xen_ram_addr_from_mapcach=
e_single(MapCache *mc, void *ptr)
> > > > > >          raddr =3D RAM_ADDR_INVALID;
> > > > > >      } else {
> > > > > >          raddr =3D (reventry->paddr_index << mc->bucket_shift) =
+
> > > > > > -             ((unsigned long) ptr - (unsigned long) entry->vad=
dr_base);
> > > > > > +             ((unsigned long) ptr - (unsigned long) entry->vad=
dr_base) +
> > > > > > +             entry->ram_offset;
> > > > > >      }
> > > > > >      mapcache_unlock(mc);
> > > > > >      return raddr;
> > > > > > @@ -627,8 +638,8 @@ static uint8_t *xen_replace_cache_entry_unl=
ocked(MapCache *mc,
> > > > > >
> > > > > >      trace_xen_replace_cache_entry_dummy(old_phys_addr, new_phy=
s_addr);
> > > > > >
> > > > > > -    xen_remap_bucket(mapcache, entry, entry->vaddr_base,
> > > > > > -                     cache_size, address_index, false);
> > > > > > +    xen_remap_bucket(mc, entry, entry->vaddr_base,
> > > > > > +                     cache_size, address_index, false, entry->=
ram_offset);
> > > > > >      if (!test_bits(address_offset >> XC_PAGE_SHIFT,
> > > > > >                  test_bit_size >> XC_PAGE_SHIFT,
> > > > > >                  entry->valid_mapping)) {
> > > > > > diff --git a/include/sysemu/xen-mapcache.h b/include/sysemu/xen=
-mapcache.h
> > > > > > index 1ec9e66752..b5e3ea1bc0 100644
> > > > > > --- a/include/sysemu/xen-mapcache.h
> > > > > > +++ b/include/sysemu/xen-mapcache.h
> > > > > > @@ -19,6 +19,7 @@ typedef hwaddr (*phys_offset_to_gaddr_t)(hwad=
dr phys_offset,
> > > > > >  void xen_map_cache_init(phys_offset_to_gaddr_t f,
> > > > > >                          void *opaque);
> > > > > >  uint8_t *xen_map_cache(MemoryRegion *mr, hwaddr phys_addr, hwa=
ddr size,
> > > > > > +                       ram_addr_t ram_addr_offset,
> > > > > >                         uint8_t lock, bool dma,
> > > > > >                         bool is_write);
> > > > > >  ram_addr_t xen_ram_addr_from_mapcache(void *ptr);
> > > > > > @@ -37,6 +38,7 @@ static inline void xen_map_cache_init(phys_of=
fset_to_gaddr_t f,
> > > > > >  static inline uint8_t *xen_map_cache(MemoryRegion *mr,
> > > > > >                                       hwaddr phys_addr,
> > > > > >                                       hwaddr size,
> > > > > > +                                     ram_addr_t ram_addr_offse=
t,
> > > > > >                                       uint8_t lock,
> > > > > >                                       bool dma,
> > > > > >                                       bool is_write)
> > > > > > diff --git a/system/physmem.c b/system/physmem.c
> > > > > > index 1a5ffcba2a..5b16eeccca 100644
> > > > > > --- a/system/physmem.c
> > > > > > +++ b/system/physmem.c
> > > > > > @@ -2228,13 +2228,13 @@ static void *qemu_ram_ptr_length(RAMBlo=
ck *block, ram_addr_t addr,
> > > > > >           * In that case just map the requested area.
> > > > > >           */
> > > > > >          if (xen_mr_is_memory(block->mr)) {
> > > > > > -            return xen_map_cache(block->mr, addr, len, lock, l=
ock,
> > > > > > -                                 is_write);
> > > > > > +            return xen_map_cache(block->mr, addr, len, block->=
offset,
> > > > > > +                                 lock, lock, is_write);
> > > > >
> > > > > Have you considered not tracking offset and address separately an=
d
> > > > > simply do this?
> > > > >
> > > > >             return xen_map_cache(block->mr, addr + block->offset,=
 len,
> > > > >                                  lock, lock, is_write);
> > > > >
> > > >
> > > > Unfortunately this won't work since block->offset is not related to=
 where this
> > > > ram is mapped in guest address-space. In the case of grant's, we'd =
get the
> > > > wrong grant ref. See my previous comment.
> > >
> > > OK, this code below (the second xen_map_cache call passing block->off=
set
> > > as start address) was wrong before this patch. Can we fix it before
> > > changing it further with this patch? I worry about making things even
> > > worse.
> > >
> >
> > I'll dig around and see if we can find something that explains more.
> > There's some older code that implements some sort of address-translatio=
n
> > for x86 between ram_addr space and guest physical addresses but
> > that code is turned off with newer Xen versions (disabled in my build).
> >
> > https://github.com/qemu/qemu/blob/master/hw/xen/xen-mapcache.c#L330
> > https://github.com/qemu/qemu/blob/master/hw/i386/xen/xen-hvm.c#L193
>
> I don't have any more insights but I think Xenia might have a better
> idea as she has fixed bugs related to this to get virtio-gpu to work.

Hi again,

I found the reason this works today is because for RAM's created after
xen_memory,
QEMU hypercalls into Xen to populate the guest memory map with RAM at the g=
iven
ram_offset.
https://github.com/qemu/qemu/blob/master/hw/xen/xen-hvm-common.c#L44

The current grant series does not affect this current behaviour but I
think it would be
good to make the offset handling a little more explicit by adding the
addr+ram_offset
in the map-cache (except for the special grant region) and always
passing them in
the same argument slots. I'll try to improve this in the next version
and add some
comments and we can discuss from there.

Cheers,
Edgar

