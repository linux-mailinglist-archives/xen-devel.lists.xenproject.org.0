Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 273788C75CC
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 14:16:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723262.1127946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7a1y-0004af-4O; Thu, 16 May 2024 12:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723262.1127946; Thu, 16 May 2024 12:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7a1y-0004Xq-1c; Thu, 16 May 2024 12:16:18 +0000
Received: by outflank-mailman (input) for mailman id 723262;
 Thu, 16 May 2024 12:16:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DxoZ=MT=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s7a1w-0004Se-QG
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 12:16:16 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1766a1fd-137e-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 14:16:15 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-574b3d6c0f3so3379228a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 05:16:15 -0700 (PDT)
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
X-Inumbo-ID: 1766a1fd-137e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715861775; x=1716466575; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yn+oXlbgVr7a9k+BINSVHmajhWBEJ0sHm25nDF+ijag=;
        b=Bf2AdiSCkzCVv4mwrKDDUmDi3sCamPTf3YSdpJNDyQf5PeZNUBY9hFS84M1CKPTvtv
         3W3coyWkrA7GcCr82TGn0bXKCP3CUJcBW0/BHWUklqKiOFuY7+s/9eRb3f02OrqxfmO0
         U3kJk2w48eYbdF/dU2H216brBzPDlHIc1ErSqopNtOryvOH8EOkOy5nRyV7H+s7Vrlx+
         rNd+7b2mWp7wCvz/KdbBO7xE/vW432DVxQVIkTqdzoq5JG6A+uM2S05ruoiUuL12ZoJz
         FPAkworUhZv1yVIq4lpj4h22Dnw6OYXvQoZSPmElLykLfd/LvkjO+PegpHPIC+wrpIgk
         OLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715861775; x=1716466575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yn+oXlbgVr7a9k+BINSVHmajhWBEJ0sHm25nDF+ijag=;
        b=wTz9DEfFVOLe8ZaIua3bNUvqrEkCOfb6SjcvhxXvy35r8Ny0F+kF68kz88Tg5bft+f
         g5oWO+jI9VnFRSx0a9ejgBjV8xkwIqc4xJafXrdZIxiDqfytWZAuX7JwixrIEvQT5aOu
         VBBmNFIbtYKybxUvVKixRqSoAIm+aUBDiuTgUz93NmFZA0bakUuGQpSvCmumXuQMRGZy
         F+fOl94gUZFlpla+Z+SxwdG98WNkxRtF+c6JPo/AXgIH999Vy+vG5xTRdC3kkWLH4T9Y
         +4ad5nW4xU9KuZGtIU9HR7dzjWl1LsQ7kBIOweGxvmQ/PFTBIMftAuZUc63Zzbp8fQNc
         pw+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAK7PTvQBHLLm6EqXdYMF6D2sQPl50HlIxrhu8RSoW6qQGA0YtQfjf1q+l+hX7vTArOzCgf/GhbC5vgi6wsg/PqxCiJiD+oG8jDqozsOg=
X-Gm-Message-State: AOJu0Yw+r18xFM3NkOC0Lybp6UUIbRqqaueCRstg8TV64ZhMR5EvYGuT
	dkNg+NyUmTx6YkvA28g4wteMHgRmYyc9mSsFzgvO0tpo89N6vliz2GfXl3JLZX+GbLf4jODQ57X
	6vKnKc4+fsBW/sz5Skh5UinFK61s=
X-Google-Smtp-Source: AGHT+IFnT5fCN2Q3WSyadS6/AHfALVLYnoDOnQyI+y3w4CmbQMi4Z9f5oXw7pPPeYA3fC3u8vr/OEv8Pt+tb1RiaPk8=
X-Received: by 2002:a50:d496:0:b0:572:3bcc:8370 with SMTP id
 4fb4d7f45d1cf-5734d4417b4mr11339654a12.0.1715861774886; Thu, 16 May 2024
 05:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240503014449.1046238-1-edgar.iglesias@gmail.com>
 <20240503014449.1046238-7-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2405151605550.2544314@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2405151605550.2544314@ubuntu-linux-20-04-desktop>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 16 May 2024 14:16:03 +0200
Message-ID: <CAJy5ezoB+MZDhPN0iWcTTTy_ufdVwK1qOpU-5M4aJ+Ujfv9TQg@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] xen: mapcache: Pass the ram_addr offset to xen_map_cache()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, jgross@suse.com, 
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>, Anthony PERARD <anthony@xenproject.org>, 
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 1:08=E2=80=AFAM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Fri, 3 May 2024, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> > Pass the ram_addr offset to xen_map_cache.
> > This is in preparation for adding grant mappings that need
> > to compute the address within the RAMBlock.
> >
> > No functional changes.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >  hw/xen/xen-mapcache.c         | 16 +++++++++++-----
> >  include/sysemu/xen-mapcache.h |  2 ++
> >  system/physmem.c              |  9 +++++----
> >  3 files changed, 18 insertions(+), 9 deletions(-)
> >
> > diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> > index ec95445696..26bc38a9e3 100644
> > --- a/hw/xen/xen-mapcache.c
> > +++ b/hw/xen/xen-mapcache.c
> > @@ -167,7 +167,8 @@ static void xen_remap_bucket(MapCache *mc,
> >                               void *vaddr,
> >                               hwaddr size,
> >                               hwaddr address_index,
> > -                             bool dummy)
> > +                             bool dummy,
> > +                             ram_addr_t ram_offset)
> >  {
> >      uint8_t *vaddr_base;
> >      xen_pfn_t *pfns;
> > @@ -266,6 +267,7 @@ static void xen_remap_bucket(MapCache *mc,
> >
> >  static uint8_t *xen_map_cache_unlocked(MapCache *mc,
> >                                         hwaddr phys_addr, hwaddr size,
> > +                                       ram_addr_t ram_offset,
> >                                         uint8_t lock, bool dma, bool is=
_write)
> >  {
> >      MapCacheEntry *entry, *pentry =3D NULL,
> > @@ -337,14 +339,16 @@ tryagain:
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
> > @@ -391,13 +395,15 @@ tryagain:
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
> > @@ -632,7 +638,7 @@ static uint8_t *xen_replace_cache_entry_unlocked(Ma=
pCache *mc,
> >      trace_xen_replace_cache_entry_dummy(old_phys_addr, new_phys_addr);
> >
> >      xen_remap_bucket(mc, entry, entry->vaddr_base,
> > -                     cache_size, address_index, false);
> > +                     cache_size, address_index, false, new_phys_addr);
>
> Everything else makes sense, but I don't understand how can it be that
> new_phys_addr is the block->offset here?
>

Agreed, this should be old_phys_addr propagated via phys_offset from
xen_add_to_physmap().
The reason this didn't have an effect here is that we currently only
use the ram_addr offset for grants,
and xen_replace_cache_entry is never called for grants. Anyway, I'll
fix this in the next version!




>
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
> > index b7847db1a2..33d09f7571 100644
> > --- a/system/physmem.c
> > +++ b/system/physmem.c
> > @@ -2231,13 +2231,14 @@ static void *qemu_ram_ptr_length(RAMBlock *bloc=
k, ram_addr_t addr,
> >           */
> >          if (xen_mr_is_memory(block->mr)) {
> >              return xen_map_cache(block->mr, block->offset + addr,
> > -                                 len, lock, lock,
> > -                                 is_write);
> > +                                 len, block->offset,
> > +                                 lock, lock, is_write);
> >          }
> >
> >          block->host =3D xen_map_cache(block->mr, block->offset,
> > -                                    block->max_length, 1,
> > -                                    lock, is_write);
> > +                                    block->max_length,
> > +                                    block->offset,
> > +                                    1, lock, is_write);
> >      }
>
> This is OK but it is really making it clear that there is a mistake in
> the code. OK for now but it is something to fix in the future.
>
>
> >      return ramblock_ptr(block, addr);
> > --
> > 2.40.1
> >

