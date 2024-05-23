Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F99C8CD04D
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 12:24:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728319.1133197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA5cK-0004Qt-DX; Thu, 23 May 2024 10:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728319.1133197; Thu, 23 May 2024 10:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA5cK-0004O3-9k; Thu, 23 May 2024 10:24:12 +0000
Received: by outflank-mailman (input) for mailman id 728319;
 Thu, 23 May 2024 10:24:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxBl=M2=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sA5cI-0004Mr-11
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 10:24:10 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95fdc122-18ee-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 12:24:07 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56e1bbdb362so9254674a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 03:24:07 -0700 (PDT)
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
X-Inumbo-ID: 95fdc122-18ee-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716459846; x=1717064646; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s+M5wJYiisgpYj+SRPO7ZKLMPAFG0VHDNde4qfV+T6s=;
        b=XdrQ0hie5k4yCcBvsr5ovGunmJHVIBL5SJMLN21KP/hV+/bU93xub9ab+IEY19TWwc
         VFLfce1AeytgfPTMAuYFJS5ec27O4cLVzt8if31gUZew3qiXRHTEATRy+QJCpwsTgeDm
         6m53PAIM9cE4EhZ0R/aIT8n4Z2DwrnkdAClSR0IRaSCrfOTFZ8XwGLBLaZGaQfiaFB68
         Ko3j88LsjIdWXT01uUqdZvfDEEq8FLyFMBSjwwnGLD99Y6b0tGcTmPZwAv+8MkvB+YSS
         6BCVDZiPKPeZinbSPYh1Pg+iwkrgGhW+OP7BbpGjLJjlH1L9xoKnUbvryK4gO3YM0P3B
         I75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716459846; x=1717064646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+M5wJYiisgpYj+SRPO7ZKLMPAFG0VHDNde4qfV+T6s=;
        b=H41B7N1VkGvGQ+LkFszn03nQasSR+JcNdzWBTo3p43qc9o7WU1ZvIDljVhrcpBDDWx
         pzE+vCSI0xVzr8RMGwQtSk+4ASdEtClF/WR0OzPYtfJ+3viFrPbChkO2Is8eRCk4ZTXp
         OysChobzUIXm49aWQQ04eN5bOshU9dS5MYQrgpMOH3MZq0wv3n+K2Byc8EVY5uOtLQls
         yDt4mMBCFRfaDZbSgFjpLbpnJAN+O07SPfvTuULAmtWZ7hkZbNWsYA3YvruaZsvTGzYA
         WqMlEu9HLezaUcEDQ+RiTZNfhbe4t9545D8/g5vtmErgAEu9MDGxzzWuSvqJdPvxafnf
         J+FA==
X-Gm-Message-State: AOJu0YzAxMUp7+gj2qT/f8rR8gR18k+aRjEP6YByLZpp8T7iCbuh7oiA
	5OWfgEHOD4hy6OrAn1/NGH+KdpBz6TV0IMDqPOE5KGueuiewQaPykym6rLqdBlYjXK3eXPY1Jhh
	zZPCPF6CQrnUGHsRPF3pcyf/HhLg=
X-Google-Smtp-Source: AGHT+IHmpOosZkR+uOLMg9CjcV7QyQceBN6nuV+YQZ1MXXxYWRmkYKTA91fZxdK1OtxtBZBBfZl67r0KfJaxekIgzIA=
X-Received: by 2002:a50:d513:0:b0:574:ebf4:f787 with SMTP id
 4fb4d7f45d1cf-57832a3b5eemr4024151a12.19.1716459846266; Thu, 23 May 2024
 03:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240516154804.1114245-1-edgar.iglesias@gmail.com>
 <20240516154804.1114245-8-edgar.iglesias@gmail.com> <dxhms.qrh0wkni3yz@linaro.org>
In-Reply-To: <dxhms.qrh0wkni3yz@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 23 May 2024 12:23:54 +0200
Message-ID: <CAJy5ezqcnoQ=M4H3RkQ69HAie4jNMEQB42f4NSRZUEWU_5=Gkw@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] xen: mapcache: Add support for grant mappings
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: xen-devel@lists.xenproject.org, qemu-devel@nongnu.org, 
	sstabellini@kernel.org, jgross@suse.com, 
	"Edgar E. Iglesias" <edgar.iglesias@amd.com>, Anthony PERARD <anthony@xenproject.org>, 
	Paul Durrant <paul@xen.org>
Content-Type: multipart/alternative; boundary="00000000000068759206191c7389"

--00000000000068759206191c7389
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 9:47=E2=80=AFAM Manos Pitsidianakis <
manos.pitsidianakis@linaro.org> wrote:

> On Thu, 16 May 2024 18:48, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> wrote:
> >From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> >Add a second mapcache for grant mappings. The mapcache for
> >grants needs to work with XC_PAGE_SIZE granularity since
> >we can't map larger ranges than what has been granted to us.
> >
> >Like with foreign mappings (xen_memory), machines using grants
> >are expected to initialize the xen_grants MR and map it
> >into their address-map accordingly.
> >
> >Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> >Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> >---
> > hw/xen/xen-hvm-common.c         |  12 ++-
> > hw/xen/xen-mapcache.c           | 163 ++++++++++++++++++++++++++------
> > include/hw/xen/xen-hvm-common.h |   3 +
> > include/sysemu/xen.h            |   7 ++
> > 4 files changed, 152 insertions(+), 33 deletions(-)
> >
> >diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> >index a0a0252da0..b8ace1c368 100644
> >--- a/hw/xen/xen-hvm-common.c
> >+++ b/hw/xen/xen-hvm-common.c
> >@@ -10,12 +10,18 @@
> > #include "hw/boards.h"
> > #include "hw/xen/arch_hvm.h"
> >
> >-MemoryRegion xen_memory;
> >+MemoryRegion xen_memory, xen_grants;
> >
> >-/* Check for xen memory.  */
> >+/* Check for any kind of xen memory, foreign mappings or grants.  */
> > bool xen_mr_is_memory(MemoryRegion *mr)
> > {
> >-    return mr =3D=3D &xen_memory;
> >+    return mr =3D=3D &xen_memory || mr =3D=3D &xen_grants;
> >+}
> >+
> >+/* Check specifically for grants.  */
> >+bool xen_mr_is_grants(MemoryRegion *mr)
> >+{
> >+    return mr =3D=3D &xen_grants;
> > }
> >
> > void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion
> *mr,
> >diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> >index a07c47b0b1..1cbc2aeaa9 100644
> >--- a/hw/xen/xen-mapcache.c
> >+++ b/hw/xen/xen-mapcache.c
> >@@ -14,6 +14,7 @@
> >
> > #include <sys/resource.h>
> >
> >+#include "hw/xen/xen-hvm-common.h"
> > #include "hw/xen/xen_native.h"
> > #include "qemu/bitmap.h"
> >
> >@@ -21,6 +22,8 @@
> > #include "sysemu/xen-mapcache.h"
> > #include "trace.h"
> >
> >+#include <xenevtchn.h>
> >+#include <xengnttab.h>
> >
> > #if HOST_LONG_BITS =3D=3D 32
> > #  define MCACHE_MAX_SIZE     (1UL<<31) /* 2GB Cap */
> >@@ -41,6 +44,7 @@ typedef struct MapCacheEntry {
> >     unsigned long *valid_mapping;
> >     uint32_t lock;
> > #define XEN_MAPCACHE_ENTRY_DUMMY (1 << 0)
> >+#define XEN_MAPCACHE_ENTRY_GRANT (1 << 1)
>
> Might we get more entry kinds in the future? (for example foreign maps).
> Maybe this could be an enum.
>
>
Perhaps. Foreign mappings are already supported, this flag separates
ordinary foreign mappings from grant foreign mappings.
IMO, since this is not an external interface it's probably better to change
it once we have a concrete use-case at hand.



> >     uint8_t flags;
> >     hwaddr size;
> >     struct MapCacheEntry *next;
> >@@ -71,6 +75,8 @@ typedef struct MapCache {
> > } MapCache;
> >
> > static MapCache *mapcache;
> >+static MapCache *mapcache_grants;
> >+static xengnttab_handle *xen_region_gnttabdev;
> >
> > static inline void mapcache_lock(MapCache *mc)
> > {
> >@@ -131,6 +137,12 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f,
> void *opaque)
> >     unsigned long max_mcache_size;
> >     unsigned int bucket_shift;
> >
> >+    xen_region_gnttabdev =3D xengnttab_open(NULL, 0);
> >+    if (xen_region_gnttabdev =3D=3D NULL) {
> >+        error_report("mapcache: Failed to open gnttab device");
> >+        exit(EXIT_FAILURE);
> >+    }
> >+
> >     if (HOST_LONG_BITS =3D=3D 32) {
> >         bucket_shift =3D 16;
> >     } else {
> >@@ -159,6 +171,15 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f,
> void *opaque)
> >     mapcache =3D xen_map_cache_init_single(f, opaque,
> >                                          bucket_shift,
> >                                          max_mcache_size);
> >+
> >+    /*
> >+     * Grant mappings must use XC_PAGE_SIZE granularity since we can't
> >+     * map anything beyond the number of pages granted to us.
> >+     */
> >+    mapcache_grants =3D xen_map_cache_init_single(f, opaque,
> >+                                                XC_PAGE_SHIFT,
> >+                                                max_mcache_size);
> >+
> >     setrlimit(RLIMIT_AS, &rlimit_as);
> > }
> >
> >@@ -168,17 +189,24 @@ static void xen_remap_bucket(MapCache *mc,
> >                              hwaddr size,
> >                              hwaddr address_index,
> >                              bool dummy,
> >+                             bool grant,
> >+                             bool is_write,
> >                              ram_addr_t ram_offset)
> > {
> >     uint8_t *vaddr_base;
> >-    xen_pfn_t *pfns;
> >+    uint32_t *refs =3D NULL;
> >+    xen_pfn_t *pfns =3D NULL;
> >     int *err;
>
> You should use g_autofree to perform automatic cleanup on function exit
> instead of manually freeing, since the allocations should only live
> within the function call.
>
>
Sounds good, I'll do that in the next version.



> >     unsigned int i;
> >     hwaddr nb_pfn =3D size >> XC_PAGE_SHIFT;
> >
> >     trace_xen_remap_bucket(address_index);
> >
> >-    pfns =3D g_new0(xen_pfn_t, nb_pfn);
> >+    if (grant) {
> >+        refs =3D g_new0(uint32_t, nb_pfn);
> >+    } else {
> >+        pfns =3D g_new0(xen_pfn_t, nb_pfn);
> >+    }
> >     err =3D g_new0(int, nb_pfn);
> >
> >     if (entry->vaddr_base !=3D NULL) {
> >@@ -207,21 +235,51 @@ static void xen_remap_bucket(MapCache *mc,
> >     g_free(entry->valid_mapping);
> >     entry->valid_mapping =3D NULL;
> >
> >-    for (i =3D 0; i < nb_pfn; i++) {
> >-        pfns[i] =3D (address_index << (mc->bucket_shift - XC_PAGE_SHIFT=
))
> + i;
> >+    if (grant) {
> >+        hwaddr grant_base =3D address_index - (ram_offset >>
> XC_PAGE_SHIFT);
> >+
> >+        for (i =3D 0; i < nb_pfn; i++) {
> >+            refs[i] =3D grant_base + i;
> >+        }
> >+    } else {
> >+        for (i =3D 0; i < nb_pfn; i++) {
> >+            pfns[i] =3D (address_index << (mc->bucket_shift -
> XC_PAGE_SHIFT)) + i;
> >+        }
> >     }
> >
> >-    /*
> >-     * If the caller has requested the mapping at a specific address us=
e
> >-     * MAP_FIXED to make sure it's honored.
> >-     */
> >+    entry->flags &=3D ~XEN_MAPCACHE_ENTRY_GRANT;
> >+
> >     if (!dummy) {
> >-        vaddr_base =3D xenforeignmemory_map2(xen_fmem, xen_domid, vaddr=
,
> >-                                           PROT_READ | PROT_WRITE,
> >-                                           vaddr ? MAP_FIXED : 0,
> >-                                           nb_pfn, pfns, err);
>
> Since err is not NULL here, the function might return a valid pointer
> but individual frames might have failed.
>
>
Yes but AFAICT, the case when some pages fail foreign mapping is handled
further down the function (see the valid_mappings bitmap).
Note that this series isn't really changing this existing behaviour for
foreign mappings. In any case, If we spot a bug in existing code, I'm happy
to fix it.



>
> >+        if (grant) {
> >+            int prot =3D PROT_READ;
> >+
> >+            if (is_write) {
> >+                prot |=3D PROT_WRITE;
> >+            }
> >+
> >+            entry->flags |=3D XEN_MAPCACHE_ENTRY_GRANT;
> >+            assert(vaddr =3D=3D NULL);
> >+            vaddr_base =3D
> xengnttab_map_domain_grant_refs(xen_region_gnttabdev,
> >+                                                         nb_pfn,
> >+                                                         xen_domid, ref=
s,
> >+                                                         prot);
> >+        } else {
> >+            /*
> >+             * If the caller has requested the mapping at a specific
> address use
> >+             * MAP_FIXED to make sure it's honored.
> >+             *
> >+             * We don't yet support upgrading mappings from RO to RW, t=
o
> handle
> >+             * models using ordinary address_space_rw(), foreign
> mappings ignore
> >+             * is_write and are always mapped RW.
> >+             */
> >+            vaddr_base =3D xenforeignmemory_map2(xen_fmem, xen_domid,
> vaddr,
> >+                                               PROT_READ | PROT_WRITE,
> >+                                               vaddr ? MAP_FIXED : 0,
> >+                                               nb_pfn, pfns, err);
> >+        }
> >         if (vaddr_base =3D=3D NULL) {
> >-            perror("xenforeignmemory_map2");
> >+            perror(grant ? "xengnttab_map_domain_grant_refs"
> >+                           : "xenforeignmemory_map2");
> >             exit(-1);
> >         }
> >     } else {
> >@@ -261,6 +319,7 @@ static void xen_remap_bucket(MapCache *mc,
> >         }
> >     }
> >
> >+    g_free(refs);
> >     g_free(pfns);
> >     g_free(err);
> > }
> >@@ -268,7 +327,8 @@ static void xen_remap_bucket(MapCache *mc,
> > static uint8_t *xen_map_cache_unlocked(MapCache *mc,
> >                                        hwaddr phys_addr, hwaddr size,
> >                                        ram_addr_t ram_offset,
> >-                                       uint8_t lock, bool dma, bool
> is_write)
> >+                                       uint8_t lock, bool dma,
> >+                                       bool grant, bool is_write)
> > {
> >     MapCacheEntry *entry, *pentry =3D NULL,
> >                   *free_entry =3D NULL, *free_pentry =3D NULL;
> >@@ -340,7 +400,7 @@ tryagain:
> >         entry =3D g_new0(MapCacheEntry, 1);
> >         pentry->next =3D entry;
> >         xen_remap_bucket(mc, entry, NULL, cache_size, address_index,
> dummy,
> >-                         ram_offset);
> >+                         grant, is_write, ram_offset);
> >     } else if (!entry->lock) {
> >         if (!entry->vaddr_base || entry->paddr_index !=3D address_index=
 ||
> >                 entry->size !=3D cache_size ||
> >@@ -348,7 +408,7 @@ tryagain:
> >                     test_bit_size >> XC_PAGE_SHIFT,
> >                     entry->valid_mapping)) {
> >             xen_remap_bucket(mc, entry, NULL, cache_size, address_index=
,
> dummy,
> >-                             ram_offset);
> >+                             grant, is_write, ram_offset);
> >         }
> >     }
> >
> >@@ -399,12 +459,28 @@ uint8_t *xen_map_cache(MemoryRegion *mr,
> >                        uint8_t lock, bool dma,
> >                        bool is_write)
> > {
> >+    bool grant =3D xen_mr_is_grants(mr);
> >+    MapCache *mc =3D grant ? mapcache_grants : mapcache;
> >     uint8_t *p;
> >
> >-    mapcache_lock(mapcache);
> >-    p =3D xen_map_cache_unlocked(mapcache, phys_addr, size,
> ram_addr_offset,
> >-                               lock, dma, is_write);
> >-    mapcache_unlock(mapcache);
> >+    if (grant) {
> >+        /*
> >+         * Grants are only supported via address_space_map(). Anything
> >+         * else is considered a user/guest error.
> >+         *
> >+         * QEMU generally doesn't expect these mappings to ever fail, s=
o
> >+         * if this happens we report an error message and abort().
> >+         */
> >+        if (!lock) {
>
> Nested if conditions that can be flattened, i.e. this could be
>
> if (grant && !lock)
>


Sounds good, will flatten this in the next version.


>
> >+            error_report("Trying access a grant reference without
> mapping it.");
>
> s/Trying access a grant/Tried to access a grant/
>
>
Will fix it, thanks!

Best regards,
Edgar



> >+            abort();
> >+        }
> >+    }
> >+
> >+    mapcache_lock(mc);
> >+    p =3D xen_map_cache_unlocked(mc, phys_addr, size, ram_addr_offset,
> >+                               lock, dma, grant, is_write);
> >+    mapcache_unlock(mc);
> >     return p;
> > }
> >
> >@@ -449,7 +525,14 @@ static ram_addr_t
> xen_ram_addr_from_mapcache_single(MapCache *mc, void *ptr)
> >
> > ram_addr_t xen_ram_addr_from_mapcache(void *ptr)
> > {
> >-    return xen_ram_addr_from_mapcache_single(mapcache, ptr);
> >+    ram_addr_t addr;
> >+
> >+    addr =3D xen_ram_addr_from_mapcache_single(mapcache, ptr);
> >+    if (addr =3D=3D RAM_ADDR_INVALID) {
> >+        addr =3D xen_ram_addr_from_mapcache_single(mapcache_grants, ptr=
);
> >+    }
> >+
> >+    return addr;
> > }
> >
> > static void xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
> >@@ -460,6 +543,7 @@ static void
> xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
> >     hwaddr paddr_index;
> >     hwaddr size;
> >     int found =3D 0;
> >+    int rc;
> >
> >     QTAILQ_FOREACH(reventry, &mc->locked_entries, next) {
> >         if (reventry->vaddr_req =3D=3D buffer) {
> >@@ -502,7 +586,14 @@ static void
> xen_invalidate_map_cache_entry_unlocked(MapCache *mc,
> >     }
> >
> >     ram_block_notify_remove(entry->vaddr_base, entry->size, entry->size=
);
> >-    if (munmap(entry->vaddr_base, entry->size) !=3D 0) {
> >+    if (entry->flags & XEN_MAPCACHE_ENTRY_GRANT) {
> >+        rc =3D xengnttab_unmap(xen_region_gnttabdev, entry->vaddr_base,
> >+                             entry->size >> mc->bucket_shift);
> >+    } else {
> >+        rc =3D munmap(entry->vaddr_base, entry->size);
> >+    }
> >+
> >+    if (rc) {
> >         perror("unmap fails");
> >         exit(-1);
> >     }
> >@@ -521,14 +612,24 @@ typedef struct XenMapCacheData {
> >     uint8_t *buffer;
> > } XenMapCacheData;
> >
> >+static void xen_invalidate_map_cache_entry_single(MapCache *mc, uint8_t
> *buffer)
> >+{
> >+    mapcache_lock(mc);
> >+    xen_invalidate_map_cache_entry_unlocked(mc, buffer);
> >+    mapcache_unlock(mc);
> >+}
> >+
> >+static void xen_invalidate_map_cache_entry_all(uint8_t *buffer)
> >+{
> >+    xen_invalidate_map_cache_entry_single(mapcache, buffer);
> >+    xen_invalidate_map_cache_entry_single(mapcache_grants, buffer);
> >+}
> >+
> > static void xen_invalidate_map_cache_entry_bh(void *opaque)
> > {
> >     XenMapCacheData *data =3D opaque;
> >
> >-    mapcache_lock(mapcache);
> >-    xen_invalidate_map_cache_entry_unlocked(mapcache, data->buffer);
> >-    mapcache_unlock(mapcache);
> >-
> >+    xen_invalidate_map_cache_entry_all(data->buffer);
> >     aio_co_wake(data->co);
> > }
> >
> >@@ -543,9 +644,7 @@ void coroutine_mixed_fn
> xen_invalidate_map_cache_entry(uint8_t *buffer)
> >                                 xen_invalidate_map_cache_entry_bh,
> &data);
> >         qemu_coroutine_yield();
> >     } else {
> >-        mapcache_lock(mapcache);
> >-        xen_invalidate_map_cache_entry_unlocked(mapcache, buffer);
> >-        mapcache_unlock(mapcache);
> >+        xen_invalidate_map_cache_entry_all(buffer);
> >     }
> > }
> >
> >@@ -597,6 +696,7 @@ void xen_invalidate_map_cache(void)
> >     bdrv_drain_all();
> >
> >     xen_invalidate_map_cache_single(mapcache);
> >+    xen_invalidate_map_cache_single(mapcache_grants);
> > }
> >
> > static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,
> >@@ -632,13 +732,16 @@ static uint8_t
> *xen_replace_cache_entry_unlocked(MapCache *mc,
> >         return NULL;
> >     }
> >
> >+    assert((entry->flags & XEN_MAPCACHE_ENTRY_GRANT) =3D=3D 0);
> >+
> >     address_index  =3D new_phys_addr >> mc->bucket_shift;
> >     address_offset =3D new_phys_addr & (mc->bucket_size - 1);
> >
> >     trace_xen_replace_cache_entry_dummy(old_phys_addr, new_phys_addr);
> >
> >     xen_remap_bucket(mc, entry, entry->vaddr_base,
> >-                     cache_size, address_index, false, old_phys_addr);
> >+                     cache_size, address_index, false,
> >+                     false, false, old_phys_addr);
> >     if (!test_bits(address_offset >> XC_PAGE_SHIFT,
> >                 test_bit_size >> XC_PAGE_SHIFT,
> >                 entry->valid_mapping)) {
> >diff --git a/include/hw/xen/xen-hvm-common.h
> b/include/hw/xen/xen-hvm-common.h
> >index 65a51aac2e..3d796235dc 100644
> >--- a/include/hw/xen/xen-hvm-common.h
> >+++ b/include/hw/xen/xen-hvm-common.h
> >@@ -16,6 +16,7 @@
> > #include <xen/hvm/ioreq.h>
> >
> > extern MemoryRegion xen_memory;
> >+extern MemoryRegion xen_grants;
> > extern MemoryListener xen_io_listener;
> > extern DeviceListener xen_device_listener;
> >
> >@@ -29,6 +30,8 @@ extern DeviceListener xen_device_listener;
> >     do { } while (0)
> > #endif
> >
> >+#define XEN_GRANT_ADDR_OFF (1ULL << 63)
> >+
> > static inline uint32_t xen_vcpu_eport(shared_iopage_t *shared_page, int
> i)
> > {
> >     return shared_page->vcpu_ioreq[i].vp_eport;
> >diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
> >index dc72f83bcb..19dccf4d71 100644
> >--- a/include/sysemu/xen.h
> >+++ b/include/sysemu/xen.h
> >@@ -35,6 +35,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t siz=
e,
> >                    struct MemoryRegion *mr, Error **errp);
> >
> > bool xen_mr_is_memory(MemoryRegion *mr);
> >+bool xen_mr_is_grants(MemoryRegion *mr);
> >
> > #else /* !CONFIG_XEN_IS_POSSIBLE */
> >
> >@@ -55,6 +56,12 @@ static inline bool xen_mr_is_memory(MemoryRegion *mr)
> >     return false;
> > }
> >
> >+static inline bool xen_mr_is_grants(MemoryRegion *mr)
> >+{
> >+    g_assert_not_reached();
> >+    return false;
> >+}
> >+
> > #endif /* CONFIG_XEN_IS_POSSIBLE */
> >
> > #endif
> >--
> >2.40.1
> >
> >
>

--00000000000068759206191c7389
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, May 23, 2024 at 9:47=E2=80=AFAM M=
anos Pitsidianakis &lt;<a href=3D"mailto:manos.pitsidianakis@linaro.org">ma=
nos.pitsidianakis@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 16 May 2024 =
18:48, &quot;Edgar E. Iglesias&quot; &lt;<a href=3D"mailto:edgar.iglesias@g=
mail.com" target=3D"_blank">edgar.iglesias@gmail.com</a>&gt; wrote:<br>
&gt;From: &quot;Edgar E. Iglesias&quot; &lt;<a href=3D"mailto:edgar.iglesia=
s@amd.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<br>
&gt;<br>
&gt;Add a second mapcache for grant mappings. The mapcache for<br>
&gt;grants needs to work with XC_PAGE_SIZE granularity since<br>
&gt;we can&#39;t map larger ranges than what has been granted to us.<br>
&gt;<br>
&gt;Like with foreign mappings (xen_memory), machines using grants<br>
&gt;are expected to initialize the xen_grants MR and map it<br>
&gt;into their address-map accordingly.<br>
&gt;<br>
&gt;Signed-off-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@a=
md.com" target=3D"_blank">edgar.iglesias@amd.com</a>&gt;<br>
&gt;Reviewed-by: Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kerne=
l.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;<br>
&gt;---<br>
&gt; hw/xen/xen-hvm-common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 ++=
-<br>
&gt; hw/xen/xen-mapcache.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 163 ++=
++++++++++++++++++++++++------<br>
&gt; include/hw/xen/xen-hvm-common.h |=C2=A0 =C2=A03 +<br>
&gt; include/sysemu/xen.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A07 ++<br>
&gt; 4 files changed, 152 insertions(+), 33 deletions(-)<br>
&gt;<br>
&gt;diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c<br>
&gt;index a0a0252da0..b8ace1c368 100644<br>
&gt;--- a/hw/xen/xen-hvm-common.c<br>
&gt;+++ b/hw/xen/xen-hvm-common.c<br>
&gt;@@ -10,12 +10,18 @@<br>
&gt; #include &quot;hw/boards.h&quot;<br>
&gt; #include &quot;hw/xen/arch_hvm.h&quot;<br>
&gt; <br>
&gt;-MemoryRegion xen_memory;<br>
&gt;+MemoryRegion xen_memory, xen_grants;<br>
&gt; <br>
&gt;-/* Check for xen memory.=C2=A0 */<br>
&gt;+/* Check for any kind of xen memory, foreign mappings or grants.=C2=A0=
 */<br>
&gt; bool xen_mr_is_memory(MemoryRegion *mr)<br>
&gt; {<br>
&gt;-=C2=A0 =C2=A0 return mr =3D=3D &amp;xen_memory;<br>
&gt;+=C2=A0 =C2=A0 return mr =3D=3D &amp;xen_memory || mr =3D=3D &amp;xen_g=
rants;<br>
&gt;+}<br>
&gt;+<br>
&gt;+/* Check specifically for grants.=C2=A0 */<br>
&gt;+bool xen_mr_is_grants(MemoryRegion *mr)<br>
&gt;+{<br>
&gt;+=C2=A0 =C2=A0 return mr =3D=3D &amp;xen_grants;<br>
&gt; }<br>
&gt; <br>
&gt; void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion =
*mr,<br>
&gt;diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c<br>
&gt;index a07c47b0b1..1cbc2aeaa9 100644<br>
&gt;--- a/hw/xen/xen-mapcache.c<br>
&gt;+++ b/hw/xen/xen-mapcache.c<br>
&gt;@@ -14,6 +14,7 @@<br>
&gt; <br>
&gt; #include &lt;sys/resource.h&gt;<br>
&gt; <br>
&gt;+#include &quot;hw/xen/xen-hvm-common.h&quot;<br>
&gt; #include &quot;hw/xen/xen_native.h&quot;<br>
&gt; #include &quot;qemu/bitmap.h&quot;<br>
&gt; <br>
&gt;@@ -21,6 +22,8 @@<br>
&gt; #include &quot;sysemu/xen-mapcache.h&quot;<br>
&gt; #include &quot;trace.h&quot;<br>
&gt; <br>
&gt;+#include &lt;xenevtchn.h&gt;<br>
&gt;+#include &lt;xengnttab.h&gt;<br>
&gt; <br>
&gt; #if HOST_LONG_BITS =3D=3D 32<br>
&gt; #=C2=A0 define MCACHE_MAX_SIZE=C2=A0 =C2=A0 =C2=A0(1UL&lt;&lt;31) /* 2=
GB Cap */<br>
&gt;@@ -41,6 +44,7 @@ typedef struct MapCacheEntry {<br>
&gt;=C2=A0 =C2=A0 =C2=A0unsigned long *valid_mapping;<br>
&gt;=C2=A0 =C2=A0 =C2=A0uint32_t lock;<br>
&gt; #define XEN_MAPCACHE_ENTRY_DUMMY (1 &lt;&lt; 0)<br>
&gt;+#define XEN_MAPCACHE_ENTRY_GRANT (1 &lt;&lt; 1)<br>
<br>
Might we get more entry kinds in the future? (for example foreign maps). <b=
r>
Maybe this could be an enum.<br>
<br></blockquote><div><br></div><div>Perhaps. Foreign mappings are already =
supported, this flag separates ordinary foreign mappings from grant foreign=
 mappings.</div><div>IMO, since this is not an external interface it&#39;s =
probably better to change it once we have a concrete use-case at hand.</div=
><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0uint8_t flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0hwaddr size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0struct MapCacheEntry *next;<br>
&gt;@@ -71,6 +75,8 @@ typedef struct MapCache {<br>
&gt; } MapCache;<br>
&gt; <br>
&gt; static MapCache *mapcache;<br>
&gt;+static MapCache *mapcache_grants;<br>
&gt;+static xengnttab_handle *xen_region_gnttabdev;<br>
&gt; <br>
&gt; static inline void mapcache_lock(MapCache *mc)<br>
&gt; {<br>
&gt;@@ -131,6 +137,12 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, =
void *opaque)<br>
&gt;=C2=A0 =C2=A0 =C2=A0unsigned long max_mcache_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0unsigned int bucket_shift;<br>
&gt; <br>
&gt;+=C2=A0 =C2=A0 xen_region_gnttabdev =3D xengnttab_open(NULL, 0);<br>
&gt;+=C2=A0 =C2=A0 if (xen_region_gnttabdev =3D=3D NULL) {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;mapcache: Failed to ope=
n gnttab device&quot;);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(EXIT_FAILURE);<br>
&gt;+=C2=A0 =C2=A0 }<br>
&gt;+<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (HOST_LONG_BITS =3D=3D 32) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bucket_shift =3D 16;<br>
&gt;=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;@@ -159,6 +171,15 @@ void xen_map_cache_init(phys_offset_to_gaddr_t f, =
void *opaque)<br>
&gt;=C2=A0 =C2=A0 =C2=A0mapcache =3D xen_map_cache_init_single(f, opaque,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bucket_shift,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 max_mcache_size);<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 /*<br>
&gt;+=C2=A0 =C2=A0 =C2=A0* Grant mappings must use XC_PAGE_SIZE granularity=
 since we can&#39;t<br>
&gt;+=C2=A0 =C2=A0 =C2=A0* map anything beyond the number of pages granted =
to us.<br>
&gt;+=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;+=C2=A0 =C2=A0 mapcache_grants =3D xen_map_cache_init_single(f, opaque,=
<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 XC_PAGE_SHIFT,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 max_mcache_size);<br>
&gt;+<br>
&gt;=C2=A0 =C2=A0 =C2=A0setrlimit(RLIMIT_AS, &amp;rlimit_as);<br>
&gt; }<br>
&gt; <br>
&gt;@@ -168,17 +189,24 @@ static void xen_remap_bucket(MapCache *mc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hwaddr size,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hwaddr address_index,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool dummy,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool grant,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_write,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ram_addr_t ram_offset)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0uint8_t *vaddr_base;<br>
&gt;-=C2=A0 =C2=A0 xen_pfn_t *pfns;<br>
&gt;+=C2=A0 =C2=A0 uint32_t *refs =3D NULL;<br>
&gt;+=C2=A0 =C2=A0 xen_pfn_t *pfns =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0int *err;<br>
<br>
You should use g_autofree to perform automatic cleanup on function exit <br=
>
instead of manually freeing, since the allocations should only live <br>
within the function call.<br>
<br></blockquote><div><br></div><div>Sounds good, I&#39;ll do that in the n=
ext version.</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0unsigned int i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0hwaddr nb_pfn =3D size &gt;&gt; XC_PAGE_SHIFT;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0trace_xen_remap_bucket(address_index);<br>
&gt; <br>
&gt;-=C2=A0 =C2=A0 pfns =3D g_new0(xen_pfn_t, nb_pfn);<br>
&gt;+=C2=A0 =C2=A0 if (grant) {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 refs =3D g_new0(uint32_t, nb_pfn);<br>
&gt;+=C2=A0 =C2=A0 } else {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pfns =3D g_new0(xen_pfn_t, nb_pfn);<br>
&gt;+=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0err =3D g_new0(int, nb_pfn);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0if (entry-&gt;vaddr_base !=3D NULL) {<br>
&gt;@@ -207,21 +235,51 @@ static void xen_remap_bucket(MapCache *mc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0g_free(entry-&gt;valid_mapping);<br>
&gt;=C2=A0 =C2=A0 =C2=A0entry-&gt;valid_mapping =3D NULL;<br>
&gt; <br>
&gt;-=C2=A0 =C2=A0 for (i =3D 0; i &lt; nb_pfn; i++) {<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pfns[i] =3D (address_index &lt;&lt; (mc-&g=
t;bucket_shift - XC_PAGE_SHIFT)) + i;<br>
&gt;+=C2=A0 =C2=A0 if (grant) {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 hwaddr grant_base =3D address_index - (ram=
_offset &gt;&gt; XC_PAGE_SHIFT);<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; nb_pfn; i++) {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 refs[i] =3D grant_base + i;<=
br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;+=C2=A0 =C2=A0 } else {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; nb_pfn; i++) {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pfns[i] =3D (address_index &=
lt;&lt; (mc-&gt;bucket_shift - XC_PAGE_SHIFT)) + i;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;-=C2=A0 =C2=A0 /*<br>
&gt;-=C2=A0 =C2=A0 =C2=A0* If the caller has requested the mapping at a spe=
cific address use<br>
&gt;-=C2=A0 =C2=A0 =C2=A0* MAP_FIXED to make sure it&#39;s honored.<br>
&gt;-=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;+=C2=A0 =C2=A0 entry-&gt;flags &amp;=3D ~XEN_MAPCACHE_ENTRY_GRANT;<br>
&gt;+<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (!dummy) {<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vaddr_base =3D xenforeignmemory_map2(xen_f=
mem, xen_domid, vaddr,<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0PROT_READ | PROT_WRITE,<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vaddr ? MAP_FIXED : 0,<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0nb_pfn, pfns, err);<br>
<br>
Since err is not NULL here, the function might return a valid pointer <br>
but individual frames might have failed.<br>
<br></blockquote><div><br></div><div>Yes but AFAICT, the case when some pag=
es fail foreign mapping is handled further=C2=A0down the function (see the =
valid_mappings bitmap).</div><div>Note that this series isn&#39;t really ch=
anging this existing behaviour for foreign mappings. In any case, If we spo=
t a bug in existing code, I&#39;m happy to fix it.</div><div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grant) {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int prot =3D PROT_READ;<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (is_write) {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prot |=3D PROT=
_WRITE;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&gt;flags |=3D XEN_MAP=
CACHE_ENTRY_GRANT;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(vaddr =3D=3D NULL);<b=
r>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vaddr_base =3D xengnttab_map=
_domain_grant_refs(xen_region_gnttabdev,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nb_pfn,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen_domid, refs,=
<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prot);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If the caller has re=
quested the mapping at a specific address use<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* MAP_FIXED to make su=
re it&#39;s honored.<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We don&#39;t yet sup=
port upgrading mappings from RO to RW, to handle<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* models using ordinar=
y address_space_rw(), foreign mappings ignore<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* is_write and are alw=
ays mapped RW.<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vaddr_base =3D xenforeignmem=
ory_map2(xen_fmem, xen_domid, vaddr,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0PROT_READ | PROT_WRITE,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0vaddr ? MAP_FIXED : 0,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0nb_pfn, pfns, err);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (vaddr_base =3D=3D NULL) {<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perror(&quot;xenforeignmemor=
y_map2&quot;);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perror(grant ? &quot;xengntt=
ab_map_domain_grant_refs&quot;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;xenforeignmemory_map2&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(-1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;@@ -261,6 +319,7 @@ static void xen_remap_bucket(MapCache *mc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;+=C2=A0 =C2=A0 g_free(refs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0g_free(pfns);<br>
&gt;=C2=A0 =C2=A0 =C2=A0g_free(err);<br>
&gt; }<br>
&gt;@@ -268,7 +327,8 @@ static void xen_remap_bucket(MapCache *mc,<br>
&gt; static uint8_t *xen_map_cache_unlocked(MapCache *mc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hwadd=
r phys_addr, hwaddr size,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ram_a=
ddr_t ram_offset,<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_=
t lock, bool dma, bool is_write)<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_=
t lock, bool dma,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool g=
rant, bool is_write)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0MapCacheEntry *entry, *pentry =3D NULL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*f=
ree_entry =3D NULL, *free_pentry =3D NULL;<br>
&gt;@@ -340,7 +400,7 @@ tryagain:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry =3D g_new0(MapCacheEntry, 1);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pentry-&gt;next =3D entry;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen_remap_bucket(mc, entry, NULL, cac=
he_size, address_index, dummy,<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ram_offset);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0grant, is_write, ram_offset);<br>
&gt;=C2=A0 =C2=A0 =C2=A0} else if (!entry-&gt;lock) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!entry-&gt;vaddr_base || entry-&g=
t;paddr_index !=3D address_index ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt=
;size !=3D cache_size ||<br>
&gt;@@ -348,7 +408,7 @@ tryagain:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0test_bit_size &gt;&gt; XC_PAGE_SHIFT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0entry-&gt;valid_mapping)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen_remap_bucket(mc, en=
try, NULL, cache_size, address_index, dummy,<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ram_offset);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0grant, is_write, ram_offset);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;@@ -399,12 +459,28 @@ uint8_t *xen_map_cache(MemoryRegion *mr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 uint8_t lock, bool dma,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 bool is_write)<br>
&gt; {<br>
&gt;+=C2=A0 =C2=A0 bool grant =3D xen_mr_is_grants(mr);<br>
&gt;+=C2=A0 =C2=A0 MapCache *mc =3D grant ? mapcache_grants : mapcache;<br>
&gt;=C2=A0 =C2=A0 =C2=A0uint8_t *p;<br>
&gt; <br>
&gt;-=C2=A0 =C2=A0 mapcache_lock(mapcache);<br>
&gt;-=C2=A0 =C2=A0 p =3D xen_map_cache_unlocked(mapcache, phys_addr, size, =
ram_addr_offset,<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lock, dma, is_write);<br>
&gt;-=C2=A0 =C2=A0 mapcache_unlock(mapcache);<br>
&gt;+=C2=A0 =C2=A0 if (grant) {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Grants are only supported via addr=
ess_space_map(). Anything<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* else is considered a user/guest er=
ror.<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* QEMU generally doesn&#39;t expect =
these mappings to ever fail, so<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* if this happens we report an error=
 message and abort().<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!lock) {<br>
<br>
Nested if conditions that can be flattened, i.e. this could be <br>
<br>
if (grant &amp;&amp; !lock)<br></blockquote><div><br></div><div><br></div><=
div>Sounds good, will flatten this in the next version.</div><div>=C2=A0<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Trying ac=
cess a grant reference without mapping it.&quot;);<br>
<br>
s/Trying access a grant/Tried to access a grant/<br>
<br></blockquote><div><br></div><div>Will fix=C2=A0it, thanks!</div><div><b=
r></div><div>Best regards,</div><div>Edgar</div><div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;+=C2=A0 =C2=A0 }<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 mapcache_lock(mc);<br>
&gt;+=C2=A0 =C2=A0 p =3D xen_map_cache_unlocked(mc, phys_addr, size, ram_ad=
dr_offset,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lock, dma, grant, is_write);<br>
&gt;+=C2=A0 =C2=A0 mapcache_unlock(mc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0return p;<br>
&gt; }<br>
&gt; <br>
&gt;@@ -449,7 +525,14 @@ static ram_addr_t xen_ram_addr_from_mapcache_singl=
e(MapCache *mc, void *ptr)<br>
&gt; <br>
&gt; ram_addr_t xen_ram_addr_from_mapcache(void *ptr)<br>
&gt; {<br>
&gt;-=C2=A0 =C2=A0 return xen_ram_addr_from_mapcache_single(mapcache, ptr);=
<br>
&gt;+=C2=A0 =C2=A0 ram_addr_t addr;<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 addr =3D xen_ram_addr_from_mapcache_single(mapcache, ptr=
);<br>
&gt;+=C2=A0 =C2=A0 if (addr =3D=3D RAM_ADDR_INVALID) {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D xen_ram_addr_from_mapcache_single=
(mapcache_grants, ptr);<br>
&gt;+=C2=A0 =C2=A0 }<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 return addr;<br>
&gt; }<br>
&gt; <br>
&gt; static void xen_invalidate_map_cache_entry_unlocked(MapCache *mc,<br>
&gt;@@ -460,6 +543,7 @@ static void xen_invalidate_map_cache_entry_unlocked=
(MapCache *mc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0hwaddr paddr_index;<br>
&gt;=C2=A0 =C2=A0 =C2=A0hwaddr size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0int found =3D 0;<br>
&gt;+=C2=A0 =C2=A0 int rc;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0QTAILQ_FOREACH(reventry, &amp;mc-&gt;locked_entries=
, next) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (reventry-&gt;vaddr_req =3D=3D buf=
fer) {<br>
&gt;@@ -502,7 +586,14 @@ static void xen_invalidate_map_cache_entry_unlocke=
d(MapCache *mc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0ram_block_notify_remove(entry-&gt;vaddr_base, entry=
-&gt;size, entry-&gt;size);<br>
&gt;-=C2=A0 =C2=A0 if (munmap(entry-&gt;vaddr_base, entry-&gt;size) !=3D 0)=
 {<br>
&gt;+=C2=A0 =C2=A0 if (entry-&gt;flags &amp; XEN_MAPCACHE_ENTRY_GRANT) {<br=
>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D xengnttab_unmap(xen_region_gnttabde=
v, entry-&gt;vaddr_base,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt;size &gt;&gt; mc-&gt;bucket_shi=
ft);<br>
&gt;+=C2=A0 =C2=A0 } else {<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D munmap(entry-&gt;vaddr_base, entry-=
&gt;size);<br>
&gt;+=C2=A0 =C2=A0 }<br>
&gt;+<br>
&gt;+=C2=A0 =C2=A0 if (rc) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror(&quot;unmap fails&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(-1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;@@ -521,14 +612,24 @@ typedef struct XenMapCacheData {<br>
&gt;=C2=A0 =C2=A0 =C2=A0uint8_t *buffer;<br>
&gt; } XenMapCacheData;<br>
&gt; <br>
&gt;+static void xen_invalidate_map_cache_entry_single(MapCache *mc, uint8_=
t *buffer)<br>
&gt;+{<br>
&gt;+=C2=A0 =C2=A0 mapcache_lock(mc);<br>
&gt;+=C2=A0 =C2=A0 xen_invalidate_map_cache_entry_unlocked(mc, buffer);<br>
&gt;+=C2=A0 =C2=A0 mapcache_unlock(mc);<br>
&gt;+}<br>
&gt;+<br>
&gt;+static void xen_invalidate_map_cache_entry_all(uint8_t *buffer)<br>
&gt;+{<br>
&gt;+=C2=A0 =C2=A0 xen_invalidate_map_cache_entry_single(mapcache, buffer);=
<br>
&gt;+=C2=A0 =C2=A0 xen_invalidate_map_cache_entry_single(mapcache_grants, b=
uffer);<br>
&gt;+}<br>
&gt;+<br>
&gt; static void xen_invalidate_map_cache_entry_bh(void *opaque)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0XenMapCacheData *data =3D opaque;<br>
&gt; <br>
&gt;-=C2=A0 =C2=A0 mapcache_lock(mapcache);<br>
&gt;-=C2=A0 =C2=A0 xen_invalidate_map_cache_entry_unlocked(mapcache, data-&=
gt;buffer);<br>
&gt;-=C2=A0 =C2=A0 mapcache_unlock(mapcache);<br>
&gt;-<br>
&gt;+=C2=A0 =C2=A0 xen_invalidate_map_cache_entry_all(data-&gt;buffer);<br>
&gt;=C2=A0 =C2=A0 =C2=A0aio_co_wake(data-&gt;co);<br>
&gt; }<br>
&gt; <br>
&gt;@@ -543,9 +644,7 @@ void coroutine_mixed_fn xen_invalidate_map_cache_en=
try(uint8_t *buffer)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xen_invalidate_map_cache_en=
try_bh, &amp;data);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_coroutine_yield();<br>
&gt;=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mapcache_lock(mapcache);<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 xen_invalidate_map_cache_entry_unlocked(ma=
pcache, buffer);<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mapcache_unlock(mapcache);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 xen_invalidate_map_cache_entry_all(buffer)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; }<br>
&gt; <br>
&gt;@@ -597,6 +696,7 @@ void xen_invalidate_map_cache(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0bdrv_drain_all();<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0xen_invalidate_map_cache_single(mapcache);<br>
&gt;+=C2=A0 =C2=A0 xen_invalidate_map_cache_single(mapcache_grants);<br>
&gt; }<br>
&gt; <br>
&gt; static uint8_t *xen_replace_cache_entry_unlocked(MapCache *mc,<br>
&gt;@@ -632,13 +732,16 @@ static uint8_t *xen_replace_cache_entry_unlocked(=
MapCache *mc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;+=C2=A0 =C2=A0 assert((entry-&gt;flags &amp; XEN_MAPCACHE_ENTRY_GRANT) =
=3D=3D 0);<br>
&gt;+<br>
&gt;=C2=A0 =C2=A0 =C2=A0address_index=C2=A0 =3D new_phys_addr &gt;&gt; mc-&=
gt;bucket_shift;<br>
&gt;=C2=A0 =C2=A0 =C2=A0address_offset =3D new_phys_addr &amp; (mc-&gt;buck=
et_size - 1);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0trace_xen_replace_cache_entry_dummy(old_phys_addr, =
new_phys_addr);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0xen_remap_bucket(mc, entry, entry-&gt;vaddr_base,<b=
r>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cache_size, address_index, false, old_phys_addr);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cache_size, address_index, false,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0false, false, old_phys_addr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (!test_bits(address_offset &gt;&gt; XC_PAGE_SHIF=
T,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_bit_=
size &gt;&gt; XC_PAGE_SHIFT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-&gt=
;valid_mapping)) {<br>
&gt;diff --git a/include/hw/xen/xen-hvm-common.h b/include/hw/xen/xen-hvm-c=
ommon.h<br>
&gt;index 65a51aac2e..3d796235dc 100644<br>
&gt;--- a/include/hw/xen/xen-hvm-common.h<br>
&gt;+++ b/include/hw/xen/xen-hvm-common.h<br>
&gt;@@ -16,6 +16,7 @@<br>
&gt; #include &lt;xen/hvm/ioreq.h&gt;<br>
&gt; <br>
&gt; extern MemoryRegion xen_memory;<br>
&gt;+extern MemoryRegion xen_grants;<br>
&gt; extern MemoryListener xen_io_listener;<br>
&gt; extern DeviceListener xen_device_listener;<br>
&gt; <br>
&gt;@@ -29,6 +30,8 @@ extern DeviceListener xen_device_listener;<br>
&gt;=C2=A0 =C2=A0 =C2=A0do { } while (0)<br>
&gt; #endif<br>
&gt; <br>
&gt;+#define XEN_GRANT_ADDR_OFF (1ULL &lt;&lt; 63)<br>
&gt;+<br>
&gt; static inline uint32_t xen_vcpu_eport(shared_iopage_t *shared_page, in=
t i)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0return shared_page-&gt;vcpu_ioreq[i].vp_eport;<br>
&gt;diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h<br>
&gt;index dc72f83bcb..19dccf4d71 100644<br>
&gt;--- a/include/sysemu/xen.h<br>
&gt;+++ b/include/sysemu/xen.h<br>
&gt;@@ -35,6 +35,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t si=
ze,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
truct MemoryRegion *mr, Error **errp);<br>
&gt; <br>
&gt; bool xen_mr_is_memory(MemoryRegion *mr);<br>
&gt;+bool xen_mr_is_grants(MemoryRegion *mr);<br>
&gt; <br>
&gt; #else /* !CONFIG_XEN_IS_POSSIBLE */<br>
&gt; <br>
&gt;@@ -55,6 +56,12 @@ static inline bool xen_mr_is_memory(MemoryRegion *mr=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; }<br>
&gt; <br>
&gt;+static inline bool xen_mr_is_grants(MemoryRegion *mr)<br>
&gt;+{<br>
&gt;+=C2=A0 =C2=A0 g_assert_not_reached();<br>
&gt;+=C2=A0 =C2=A0 return false;<br>
&gt;+}<br>
&gt;+<br>
&gt; #endif /* CONFIG_XEN_IS_POSSIBLE */<br>
&gt; <br>
&gt; #endif<br>
&gt;-- <br>
&gt;2.40.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--00000000000068759206191c7389--

