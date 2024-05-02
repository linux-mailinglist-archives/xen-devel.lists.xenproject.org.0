Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F01A8BA122
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 21:50:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716177.1118283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2cRR-0007a0-CD; Thu, 02 May 2024 19:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716177.1118283; Thu, 02 May 2024 19:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2cRR-0007YV-8x; Thu, 02 May 2024 19:50:05 +0000
Received: by outflank-mailman (input) for mailman id 716177;
 Thu, 02 May 2024 19:50:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1TOG=MF=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s2cRP-0007Dh-Ql
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 19:50:03 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29d5838c-08bd-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 21:50:01 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a5883518135so1018947366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 12:50:01 -0700 (PDT)
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
X-Inumbo-ID: 29d5838c-08bd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714679401; x=1715284201; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfaVwS92YREa0mSSqG+DnBTPDjMpnFYk44qaBNVAgrw=;
        b=cGATaWeKtvtfIvTFcIhI9YmVV3UqPSzo95B2OIaGELjCYSc2ZpvRdKvlSN5J+L/1QL
         wYvcBw8ThR3DfhSMkTRchaOVrkB9VjAXn0FMy1ZWxPlKezOpnWZieJkBdJMXpN+uKT60
         C2WorFo9HCFZ5Mv0PCbNuMsadHUXBOsUcwaF+dds6i/DtkYGPqhFpA+/iXI9QwfYaNQO
         o1W/wQD1sApie4olMiHFSI5ano7lr7sXenZF2BsXkkzzjkDL1sEGF2DMMUE/KSWto0Bq
         5seB7TUY5M8q377bQgnPn5RHofeTONkt6mdRVNc9tzJGwbQ6GxE++HOy5NGocOk/mWUL
         QhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714679401; x=1715284201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfaVwS92YREa0mSSqG+DnBTPDjMpnFYk44qaBNVAgrw=;
        b=qiJ/3vHx+tPKtfsaDL52yGGly2UwFCs+MmJQiYQzbqePlJ4MnNxSUl7Cft/gPoufCm
         6gO0dWYu5huQyOoZILT7r4X8kncNkrIiVxxIwx9jRSJHTqDJzDKq3ZiKMbsJeU95wlk/
         sbAWNRQ48+DWwt92PPbQMJkTYMyFa0w6/s8HrybkNHAOJ8pC1/JrfdxBPxwDtyaAx+ug
         HrJimZr8dUdRO8Zj9pWuzHpC7h6fdSrpJrjuY8NNA5tqjuQq6RBBIGGPxr6JhmxU2R+4
         zzOsFmihZxBYo3gpU5eTnDcLMaJQSgSUArN9gMyNmA1Q0xks++7rYfsWkrk7yYkP1ecv
         opZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqaxY0bX+tWsl9PPxVYSMIOtxNYVzrhxMtlDtStnHMD4FNeeJfq/6cehSHVgaQj0GTv5zlC8ZC2XfbGpkmeiBZ/hyUYaXTM2yJuMPC+EY=
X-Gm-Message-State: AOJu0Yyt+4uzRCPabf9e/1u26pafzOmtuLmH8R/Iw0GqEs8+o5nAC1SI
	Y/PbBp7LriuWY67aSypSnLZ9DqBQbOoQ7GiLzFJHcg4zXMW8MJWkNrBpF6uD+CYoBG+rz51g+dV
	RtO7+8CDG/Nw5DX2NLXQBL3LcJ9M=
X-Google-Smtp-Source: AGHT+IF3UKceKxMn0GLxHk1LXZQB6a3XIa8JX/oAlwmFKq0ZStuQgwHoCnXoQRtfAg5/HJ44bZUqOiXmrttJqaMWg58=
X-Received: by 2002:a50:d741:0:b0:572:727f:d0db with SMTP id
 i1-20020a50d741000000b00572727fd0dbmr286422edj.15.1714679400730; Thu, 02 May
 2024 12:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-17-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2405021156440.624854@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2405021156440.624854@ubuntu-linux-20-04-desktop>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 2 May 2024 21:49:49 +0200
Message-ID: <CAJy5ezoMYmf3HbEraqcK775t59TWH+BUzbPnxkWMMFMNUh6d2w@mail.gmail.com>
Subject: Re: [PATCH v4 16/17] xen: mapcache: Add support for grant mappings
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: qemu-devel@nongnu.org, jgross@suse.com, 
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2024 at 9:18=E2=80=AFPM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Tue, 30 Apr 2024, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> > Add a second mapcache for grant mappings. The mapcache for
> > grants needs to work with XC_PAGE_SIZE granularity since
> > we can't map larger ranges than what has been granted to us.
> >
> > Like with foreign mappings (xen_memory), machines using grants
> > are expected to initialize the xen_grants MR and map it
> > into their address-map accordingly.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >  hw/xen/xen-hvm-common.c         |  12 ++-
> >  hw/xen/xen-mapcache.c           | 158 +++++++++++++++++++++++++-------
> >  include/hw/xen/xen-hvm-common.h |   3 +
> >  include/sysemu/xen.h            |   7 ++
> >  4 files changed, 145 insertions(+), 35 deletions(-)
> >
> > diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> > index 0267b88d26..fdec400491 100644
> > --- a/hw/xen/xen-hvm-common.c
> > +++ b/hw/xen/xen-hvm-common.c
> > @@ -10,12 +10,18 @@
> >  #include "hw/boards.h"
> >  #include "hw/xen/arch_hvm.h"
> >
> > -MemoryRegion xen_memory;
> > +MemoryRegion xen_memory, xen_grants;
> >
> > -/* Check for xen memory.  */
> > +/* Check for any kind of xen memory, foreign mappings or grants.  */
> >  bool xen_mr_is_memory(MemoryRegion *mr)
> >  {
> > -    return mr =3D=3D &xen_memory;
> > +    return mr =3D=3D &xen_memory || mr =3D=3D &xen_grants;
> > +}
> > +
> > +/* Check specifically for grants.  */
> > +bool xen_mr_is_grants(MemoryRegion *mr)
> > +{
> > +    return mr =3D=3D &xen_grants;
> >  }
> >
> >  void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion =
*mr,
> > diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> > index 1b32d0c003..96cd68e28d 100644
> > --- a/hw/xen/xen-mapcache.c
> > +++ b/hw/xen/xen-mapcache.c
> > @@ -14,6 +14,7 @@
> >
> >  #include <sys/resource.h>
> >
> > +#include "hw/xen/xen-hvm-common.h"
> >  #include "hw/xen/xen_native.h"
> >  #include "qemu/bitmap.h"
> >
> > @@ -21,6 +22,8 @@
> >  #include "sysemu/xen-mapcache.h"
> >  #include "trace.h"
> >
> > +#include <xenevtchn.h>
> > +#include <xengnttab.h>
> >
> >  #if HOST_LONG_BITS =3D=3D 32
> >  #  define MCACHE_MAX_SIZE     (1UL<<31) /* 2GB Cap */
> > @@ -41,6 +44,7 @@ typedef struct MapCacheEntry {
> >      unsigned long *valid_mapping;
> >      uint32_t lock;
> >  #define XEN_MAPCACHE_ENTRY_DUMMY (1 << 0)
> > +#define XEN_MAPCACHE_ENTRY_GRANT (1 << 1)
> >      uint8_t flags;
> >      hwaddr size;
> >
> > @@ -74,6 +78,8 @@ typedef struct MapCache {
> >  } MapCache;
> >
> >  static MapCache *mapcache;
> > +static MapCache *mapcache_grants;
> > +static xengnttab_handle *xen_region_gnttabdev;
> >
> >  static inline void mapcache_lock(MapCache *mc)
> >  {
> > @@ -132,6 +138,12 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, =
void *opaque)
> >      unsigned long max_mcache_size;
> >      unsigned int bucket_shift;
> >
> > +    xen_region_gnttabdev =3D xengnttab_open(NULL, 0);
> > +    if (xen_region_gnttabdev =3D=3D NULL) {
> > +        error_report("mapcache: Failed to open gnttab device");
> > +        exit(EXIT_FAILURE);
> > +    }
> > +
> >      if (HOST_LONG_BITS =3D=3D 32) {
> >          bucket_shift =3D 16;
> >      } else {
> > @@ -160,6 +172,15 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, =
void *opaque)
> >      mapcache =3D xen_map_cache_init_single(f, opaque,
> >                                           bucket_shift,
> >                                           max_mcache_size);
> > +
> > +    /*
> > +     * Grant mappings must use XC_PAGE_SIZE granularity since we can't
> > +     * map anything beyond the number of pages granted to us.
> > +     */
> > +    mapcache_grants =3D xen_map_cache_init_single(f, opaque,
> > +                                                XC_PAGE_SHIFT,
> > +                                                max_mcache_size);
> > +
> >      setrlimit(RLIMIT_AS, &rlimit_as);
> >  }
> >
> > @@ -169,17 +190,25 @@ static void xen_remap_bucket(MapCache *mc,
> >                               hwaddr size,
> >                               hwaddr address_index,
> >                               bool dummy,
> > +                             bool grant,
> > +                             bool grant_is_write,
> > +                             hwaddr grant_ref,
> >                               ram_addr_t ram_offset)
>
> Any chance we could pass grant_ref as address_index ?
>

Yes, good catch :-)
grant_ref is already the same as address_index.


> Also instead of grant_is_write we could have a generic is_write that
> applies to both.

Sounds good.

>
> I am not sure about this, but instead of bool grant, we could check on
> address_index using XEN_GRANT_ADDR_OFF? This one might not work.
>

Yeah, this won't work since we're only getting the offset into the
xen_grants memory region.

> I admit that there is no real advantage on these suggestions except to
> consolidate the parameters and make them look a bit more similar in the
> two cases.
>
>
>
> >  {
> >      uint8_t *vaddr_base;
> > -    xen_pfn_t *pfns;
> > +    uint32_t *refs =3D NULL;
> > +    xen_pfn_t *pfns =3D NULL;
> >      int *err;
> >      unsigned int i;
> >      hwaddr nb_pfn =3D size >> XC_PAGE_SHIFT;
> >
> >      trace_xen_remap_bucket(address_index);
> >
> > -    pfns =3D g_new0(xen_pfn_t, nb_pfn);
> > +    if (grant) {
> > +        refs =3D g_new0(uint32_t, nb_pfn);
> > +    } else {
> > +        pfns =3D g_new0(xen_pfn_t, nb_pfn);
> > +    }
> >      err =3D g_new0(int, nb_pfn);
> >
> >      if (entry->vaddr_base !=3D NULL) {
> > @@ -208,21 +237,45 @@ static void xen_remap_bucket(MapCache *mc,
> >      g_free(entry->valid_mapping);
> >      entry->valid_mapping =3D NULL;
> >
> > -    for (i =3D 0; i < nb_pfn; i++) {
> > -        pfns[i] =3D (address_index << (mc->bucket_shift - XC_PAGE_SHIF=
T)) + i;
> > +    if (grant) {
> > +        for (i =3D 0; i < nb_pfn; i++) {
> > +            refs[i] =3D grant_ref + i;
> > +        }
> > +    } else {
> > +        for (i =3D 0; i < nb_pfn; i++) {
> > +            pfns[i] =3D (address_index << (mc->bucket_shift - XC_PAGE_=
SHIFT)) + i;
> > +        }
> >      }
> >
> > -    /*
> > -     * If the caller has requested the mapping at a specific address u=
se
> > -     * MAP_FIXED to make sure it's honored.
> > -     */
> > +    entry->flags &=3D ~XEN_MAPCACHE_ENTRY_GRANT;
> > +
> >      if (!dummy) {
> > -        vaddr_base =3D xenforeignmemory_map2(xen_fmem, xen_domid, vadd=
r,
> > -                                           PROT_READ | PROT_WRITE,
> > -                                           vaddr ? MAP_FIXED : 0,
> > -                                           nb_pfn, pfns, err);
> > +        if (grant) {
> > +            int prot =3D PROT_READ;
> > +
> > +            if (grant_is_write) {
> > +                prot |=3D PROT_WRITE;
> > +            }
> > +
> > +            entry->flags |=3D XEN_MAPCACHE_ENTRY_GRANT;
> > +            assert(vaddr =3D=3D NULL);
> > +            vaddr_base =3D xengnttab_map_domain_grant_refs(xen_region_=
gnttabdev,
> > +                                                         nb_pfn,
> > +                                                         xen_domid, re=
fs,
> > +                                                         prot);
> > +        } else {
> > +            /*
> > +             * If the caller has requested the mapping at a specific a=
ddress use
> > +             * MAP_FIXED to make sure it's honored.
> > +             */
> > +            vaddr_base =3D xenforeignmemory_map2(xen_fmem, xen_domid, =
vaddr,
> > +                                               PROT_READ | PROT_WRITE,
> > +                                               vaddr ? MAP_FIXED : 0,
> > +                                               nb_pfn, pfns, err);
> > +        }
> >          if (vaddr_base =3D=3D NULL) {
> > -            perror("xenforeignmemory_map2");
> > +            perror(grant ? "xengnttab_map_domain_grant_refs"
> > +                           : "xenforeignmemory_map2");
> >              exit(-1);
> >          }
> >      } else {
> > @@ -263,6 +316,7 @@ static void xen_remap_bucket(MapCache *mc,
> >          }
> >      }
> >
> > +    g_free(refs);
> >      g_free(pfns);
> >      g_free(err);
> >  }
> > @@ -270,10 +324,12 @@ static void xen_remap_bucket(MapCache *mc,
> >  static uint8_t *xen_map_cache_unlocked(MapCache *mc,
> >                                         hwaddr phys_addr, hwaddr size,
> >                                         ram_addr_t ram_offset,
> > -                                       uint8_t lock, bool dma, bool is=
_write)
> > +                                       uint8_t lock, bool dma,
> > +                                       bool grant, bool is_write)
> >  {
> >      MapCacheEntry *entry, *pentry =3D NULL,
> >                    *free_entry =3D NULL, *free_pentry =3D NULL;
> > +    hwaddr grant_ref =3D phys_addr >> XC_PAGE_SHIFT;
> >      hwaddr address_index;
> >      hwaddr address_offset;
> >      hwaddr cache_size =3D size;
> > @@ -342,7 +398,7 @@ tryagain:
> >          entry =3D g_new0(MapCacheEntry, 1);
> >          pentry->next =3D entry;
> >          xen_remap_bucket(mc, entry, NULL, cache_size, address_index, d=
ummy,
> > -                         ram_offset);
> > +                         grant, is_write, grant_ref, ram_offset);
> >      } else if (!entry->lock) {
> >          if (!entry->vaddr_base || entry->paddr_index !=3D address_inde=
x ||
> >                  entry->size !=3D cache_size ||
> > @@ -350,7 +406,7 @@ tryagain:
> >                      test_bit_size >> XC_PAGE_SHIFT,
> >                      entry->valid_mapping)) {
> >              xen_remap_bucket(mc, entry, NULL, cache_size, address_inde=
x, dummy,
> > -                             ram_offset);
> > +                             grant, is_write, grant_ref, ram_offset);
> >          }
> >      }
> >
> > @@ -401,12 +457,28 @@ uint8_t *xen_map_cache(MemoryRegion *mr,
> >                         uint8_t lock, bool dma,
> >                         bool is_write)
> >  {
> > +    bool grant =3D xen_mr_is_grants(mr);
> > +    MapCache *mc =3D grant ? mapcache_grants : mapcache;
> >      uint8_t *p;
> >
> > -    mapcache_lock(mapcache);
> > -    p =3D xen_map_cache_unlocked(mapcache, phys_addr, size, ram_addr_o=
ffset,
> > -                               lock, dma, is_write);
> > -    mapcache_unlock(mapcache);
> > +    if (grant) {
> > +        /*
> > +         * Grants are only supported via address_space_map(). Anything
> > +         * else is considered a user/guest error.
> > +         *
> > +         * QEMU generally doesn't expect these mappings to ever fail, =
so
> > +         * if this happens we report an error message and abort().
> > +         */
> > +        if (!lock) {
> > +            error_report("Trying access a grant reference without mapp=
ing it.");
> > +            abort();
> > +        }
> > +    }
> > +
> > +    mapcache_lock(mc);
> > +    p =3D xen_map_cache_unlocked(mc, phys_addr, size, ram_addr_offset,
> > +                               lock, dma, grant, is_write);
> > +    mapcache_unlock(mc);
> >      return p;
> >  }
> >
> > @@ -451,7 +523,14 @@ static ram_addr_t xen_ram_addr_from_mapcache_singl=
e(MapCache *mc, void *ptr)
> >
> >  ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
> >  {
> > -    return xen_ram_addr_from_mapcache_single(mapcache, ptr);
> > +    ram_addr_t addr;
> > +
> > +    addr =3D xen_ram_addr_from_mapcache_single(mapcache, ptr);
> > +    if (addr =3D=3D RAM_ADDR_INVALID) {
> > +        addr =3D xen_ram_addr_from_mapcache_single(mapcache_grants, pt=
r);
> > +    }
> > +
> > +    return addr;
> >  }
> >
> >  static void xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
> > @@ -504,9 +583,14 @@ static void xen_invalidate_map_cache_entry_unlocke=
d(MapCache *mc,
> >      }
> >
> >      ram_block_notify_remove(entry->vaddr_base, entry->size, entry->siz=
e);
> > -    if (munmap(entry->vaddr_base, entry->size) !=3D 0) {
> > -        perror("unmap fails");
> > -        exit(-1);
> > +    if (entry->flags & XEN_MAPCACHE_ENTRY_GRANT) {
> > +        xengnttab_unmap(xen_region_gnttabdev, entry->vaddr_base,
> > +                    (entry->size + mc->bucket_size - 1) >> mc->bucket_=
shift);
>
> Am I getting this right that the + mc->bucket_size - 1 is unnecessary
> because the bucket size is PAGE_SIZE and we can only map at page
> granularity?
>

Yes, you're right.
I'll fix this up in the next version.


> Also can we check for return errors?

Yes, I'll add error checking.


>
>
> > +    } else {
> > +        if (munmap(entry->vaddr_base, entry->size) !=3D 0) {
> > +            perror("unmap fails");
> > +            exit(-1);
> > +        }
> >      }
> >      if (pentry) {
> >          pentry->next =3D entry->next;
> > @@ -522,14 +606,24 @@ typedef struct XenMapCacheData {
> >      uint8_t *buffer;
> >  } XenMapCacheData;
> >
> > +static void xen_invalidate_map_cache_entry_single(MapCache *mc, uint8_=
t *buffer)
> > +{
> > +    mapcache_lock(mc);
> > +    xen_invalidate_map_cache_entry_unlocked(mc, buffer);
> > +    mapcache_unlock(mc);
> > +}
> > +
> > +static void xen_invalidate_map_cache_entry_all(uint8_t *buffer)
> > +{
> > +    xen_invalidate_map_cache_entry_single(mapcache, buffer);
> > +    xen_invalidate_map_cache_entry_single(mapcache_grants, buffer);
> > +}
> > +
> >  static void xen_invalidate_map_cache_entry_bh(void *opaque)
> >  {
> >      XenMapCacheData *data =3D opaque;
> >
> > -    mapcache_lock(mapcache);
> > -    xen_invalidate_map_cache_entry_unlocked(mapcache, data->buffer);
> > -    mapcache_unlock(mapcache);
> > -
> > +    xen_invalidate_map_cache_entry_all(data->buffer);
> >      aio_co_wake(data->co);
> >  }
> >
> > @@ -544,9 +638,7 @@ void coroutine_mixed_fn xen_invalidate_map_cache_en=
try(uint8_t *buffer)
> >                                  xen_invalidate_map_cache_entry_bh, &da=
ta);
> >          qemu_coroutine_yield();
> >      } else {
> > -        mapcache_lock(mapcache);
> > -        xen_invalidate_map_cache_entry_unlocked(mapcache, buffer);
> > -        mapcache_unlock(mapcache);
> > +        xen_invalidate_map_cache_entry_all(buffer);
> >      }
> >  }
> >
> > @@ -598,6 +690,7 @@ void xen_invalidate_map_cache(void)
> >      bdrv_drain_all();
> >
> >      xen_invalidate_map_cache_single(mapcache);
> > +    xen_invalidate_map_cache_single(mapcache_grants);
> >  }
> >
> >  static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
> > @@ -639,7 +732,8 @@ static uint8_t *xen_replace_cache_entry_unlocked(Ma=
pCache *mc,
> >      trace_xen_replace_cache_entry_dummy(old_phys_addr, new_phys_addr);
> >
> >      xen_remap_bucket(mc, entry, entry->vaddr_base,
> > -                     cache_size, address_index, false, entry->ram_offs=
et);
> > +                     cache_size, address_index, false,
> > +                     false, false, 0, entry->ram_offset);
>
> If I understand correctly, xen_replace_cache_entry_unlocked cannot be
> called on grants because xen_replace_cache_entry_unlocked is always
> called on unlocked entries while grants are always locked. Should we
> have an assert on !entry->lock and/or !(entry->flags & XEN_MAPCACHE_ENTRY=
_GRANT)?
>

Sounds good, I'll add this in the next version as well.

>
>
> >      if (!test_bits(address_offset >> XC_PAGE_SHIFT,
> >                  test_bit_size >> XC_PAGE_SHIFT,
> >                  entry->valid_mapping)) {
> > diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-c=
ommon.h
> > index 65a51aac2e..3d796235dc 100644
> > --- a/include/hw/xen/xen-hvm-common.h
> > +++ b/include/hw/xen/xen-hvm-common.h
> > @@ -16,6 +16,7 @@
> >  #include <xen/hvm/ioreq.h>
> >
> >  extern MemoryRegion xen_memory;
> > +extern MemoryRegion xen_grants;
> >  extern MemoryListener xen_io_listener;
> >  extern DeviceListener xen_device_listener;
> >
> > @@ -29,6 +30,8 @@ extern DeviceListener xen_device_listener;
> >      do { } while (0)
> >  #endif
> >
> > +#define XEN_GRANT_ADDR_OFF (1ULL << 63)
> > +
> >  static inline uint32_t xen_vcpu_eport(shared_iopage_t *shared_page, in=
t i)
> >  {
> >      return shared_page->vcpu_ioreq[i].vp_eport;
> > diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
> > index dc72f83bcb..19dccf4d71 100644
> > --- a/include/sysemu/xen.h
> > +++ b/include/sysemu/xen.h
> > @@ -35,6 +35,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t si=
ze,
> >                     struct MemoryRegion *mr, Error **errp);
> >
> >  bool xen_mr_is_memory(MemoryRegion *mr);
> > +bool xen_mr_is_grants(MemoryRegion *mr);
> >
> >  #else /* !CONFIG_XEN_IS_POSSIBLE */
> >
> > @@ -55,6 +56,12 @@ static inline bool xen_mr_is_memory(MemoryRegion *mr=
)
> >      return false;
> >  }
> >
> > +static inline bool xen_mr_is_grants(MemoryRegion *mr)
> > +{
> > +    g_assert_not_reached();
> > +    return false;
> > +}
> > +
> >  #endif /* CONFIG_XEN_IS_POSSIBLE */
> >
> >  #endif
> > --
> > 2.40.1
> >

