Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE843405FD5
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 01:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183695.331985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOT7r-0000lQ-Fw; Thu, 09 Sep 2021 23:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183695.331985; Thu, 09 Sep 2021 23:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOT7r-0000iv-CA; Thu, 09 Sep 2021 23:06:35 +0000
Received: by outflank-mailman (input) for mailman id 183695;
 Thu, 09 Sep 2021 23:06:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j+xv=N7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mOT7p-0000ip-8K
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 23:06:33 +0000
Received: from mail-lj1-x22f.google.com (unknown [2a00:1450:4864:20::22f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 820d7511-77e1-4a27-affe-70f3a827654a;
 Thu, 09 Sep 2021 23:06:30 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id i28so69789ljm.7
 for <xen-devel@lists.xenproject.org>; Thu, 09 Sep 2021 16:06:30 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id m7sm351737ljj.58.2021.09.09.16.06.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Sep 2021 16:06:28 -0700 (PDT)
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
X-Inumbo-ID: 820d7511-77e1-4a27-affe-70f3a827654a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=bniGfgIdDUqgT663lKQJPFvOk8NcJzQ94iqstSMehBc=;
        b=NUlHVLUHs9X5EljxJUT3ySBsqIlW7NCuyH1PaugohXQ0LsWPDED0dUQsYbevgRWCrz
         uaFPSAXTRA4bNQS0n4LmjmlygpDXLwWDp25sUtyGj1EMfQOmXr7qigd48L2tnwZnjPjs
         XxWh30jB0R5JQvzJe/oFb6UHHkVOFzPL6pTLNbo+gTce2m/m39WZrQAVFcbAxW8jXrXG
         V/dZhWENzDXEKRC8bOfB4vo5Z46NS5O6hZeCLdr9W2w2Y2fnNHYxMKbZ8OgCZSG87xlm
         DPQoijAw2HVqUcZXCTQR1s59sCNyrjkKvgyHNFJ+9urLTmc4qFfGAlyC9WLG7xXZsoFC
         oSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bniGfgIdDUqgT663lKQJPFvOk8NcJzQ94iqstSMehBc=;
        b=NhWhYFABVqvgtFyDEdpmrlWe2ScjqNylIE6foNlr+ZbmtyPuySbzXTjNs8CF5XW1ym
         zz/K6Uu2frsA/+gNQEys1kOJMInvfIm9IrujNuFCHQuJVmXHripVNp9PwVDhfCMvEqsX
         gl9TE9fjZbAWvAyUL+yHiVffGQXWSXnnqOtyrtzPZISdeZEg3h75Dy7fhHq5J66MCyU1
         6aPbDSC8maV4CPvc3e/V78mDFv1EAUVolU0zzfZXnqjOlNVPa40yp32VQZuzMeGXASOP
         h57LUBeub0X2/CiNPvb17Hmqybm+pLRxRv6aGYg9NFCBFIEEx5KDRcPcjSlj4EmIfOl3
         7Uqg==
X-Gm-Message-State: AOAM530zRRvjOEC4y0Q898XsYpCqxSy14EsySeIvZng1SZwXmWmMUjc7
	yUuoRcVu9+9rpISFbgcLC8qPJhCL8uc=
X-Google-Smtp-Source: ABdhPJzKbnEJyz26TsA6xyg4GO75xdCAIa/9qv/TD1BueHbjPh0mM9Icb9/tcxO4OIwoky1Dpmlqbw==
X-Received: by 2002:a2e:b16a:: with SMTP id a10mr1742332ljm.18.1631228788967;
        Thu, 09 Sep 2021 16:06:28 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH] xen/gnttab: Store frame GFN in struct page_info on Arm
Date: Fri, 10 Sep 2021 02:04:48 +0300
Message-Id: <1631228688-30347-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Rework Arm implementation to store grant table frame GFN
in struct page_info directly instead of keeping it in
standalone status/shared arrays.

To cover 64-bit/40-bit IPA on Arm64/Arm32 we need the new
field to hold 52-bit/28-bit respectively. In order to not
grow the size of struct page_info reduce the type_info field
which current context won't suffer. Add new frame_gfn field
on top of the freed bits and introduce access macros. Update
existing macros to deal with GFN value according to new
location.

Also update P2M code on Arm to clean said GFN when putting
a reference on the grant table page in p2m_put_l3_page().

This patch is intended to fix the potential issue on Arm
which might happen when remapping grant-table frame.
A guest (or the toolstack) will unmap the grant-table frame
using XENMEM_remove_physmap. This is a generic hypercall,
so on x86, we are relying on the fact the M2P entry will
be cleared on removal. For architecture without the M2P,
the GFN would still be present in the grant frame/status
array. So on the next call to map the page, we will end up to
request the P2M to remove whatever mapping was the given GFN.
This could well be another mapping.

Besides that, this patch simplifies arch code on Arm by
removing arrays and corresponding management code and
as the result gnttab_init_arch/gnttab_destroy_arch helpers
and struct grant_table_arch become useless and can be dropped.

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
You can find the related discussions at:
https://lore.kernel.org/xen-devel/93d0df14-2c8a-c2e3-8c51-54412190171c@xen.org/
https://lore.kernel.org/xen-devel/1628890077-12545-1-git-send-email-olekstysh@gmail.com/

! Please note, there is still unresolved locking question here for which
I failed to find a suitable solution !

According to the internal conversation:
Now the GFN field in the struct page_info is accessed from
gnttab_set_frame_gfn() in the grant table code and from page_set_frame_gfn()
in the P2M code (the former uses the latter).

We need to prevent the concurrent access to this field. But, we cannot grab
the grant lock from the P2M code because we will introduce a lock inversion.
The page_set_frame_gfn() will be called from the P2M code with the p2m lock held
and then acquire the grant table lock. The gnttab_map_frame() will do the inverse.
---
 xen/arch/arm/p2m.c                | 18 ++++++++++---
 xen/common/grant_table.c          |  9 -------
 xen/common/page_alloc.c           |  1 +
 xen/include/asm-arm/grant_table.h | 53 +++++++++++++--------------------------
 xen/include/asm-arm/mm.h          | 27 ++++++++++++++++----
 xen/include/asm-x86/grant_table.h |  5 ----
 xen/include/asm-x86/mm.h          |  2 ++
 7 files changed, 56 insertions(+), 59 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index eff9a10..7bef210 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -718,8 +718,10 @@ static int p2m_mem_access_radix_set(struct p2m_domain *p2m, gfn_t gfn,
  * TODO: Handle superpages, for now we only take special references for leaf
  * pages (specifically foreign ones, which can't be super mapped today).
  */
-static void p2m_put_l3_page(const lpae_t pte)
+static void p2m_put_l3_page(struct p2m_domain *p2m, const lpae_t pte)
 {
+    mfn_t mfn = lpae_get_mfn(pte);
+
     ASSERT(p2m_is_valid(pte));
 
     /*
@@ -731,11 +733,19 @@ static void p2m_put_l3_page(const lpae_t pte)
      */
     if ( p2m_is_foreign(pte.p2m.type) )
     {
-        mfn_t mfn = lpae_get_mfn(pte);
-
         ASSERT(mfn_valid(mfn));
         put_page(mfn_to_page(mfn));
     }
+
+#ifdef CONFIG_GRANT_TABLE
+    /*
+     * Check whether we deal with grant table page. As the grant table page
+     * is xen_heap page and its entry has known p2m type, detect it and mark
+     * the stored GFN as invalid.
+     */
+    if ( p2m_is_ram(pte.p2m.type) && is_xen_heap_mfn(mfn) )
+        page_set_frame_gfn(mfn_to_page(mfn), INVALID_GFN);
+#endif
 }
 
 /* Free lpae sub-tree behind an entry */
@@ -768,7 +778,7 @@ static void p2m_free_entry(struct p2m_domain *p2m,
         p2m->stats.mappings[level]--;
         /* Nothing to do if the entry is a super-page. */
         if ( level == 3 )
-            p2m_put_l3_page(entry);
+            p2m_put_l3_page(p2m, entry);
         return;
     }
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index b1930e2..9cc3550 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -93,8 +93,6 @@ struct grant_table {
 
     /* Domain to which this struct grant_table belongs. */
     const struct domain *domain;
-
-    struct grant_table_arch arch;
 };
 
 unsigned int __read_mostly opt_max_grant_frames = 64;
@@ -1981,14 +1979,9 @@ int grant_table_init(struct domain *d, int max_grant_frames,
 
     grant_write_lock(gt);
 
-    ret = gnttab_init_arch(gt);
-    if ( ret )
-        goto unlock;
-
     /* gnttab_grow_table() allocates a min number of frames, so 0 is okay. */
     ret = gnttab_grow_table(d, 0);
 
- unlock:
     grant_write_unlock(gt);
 
  out:
@@ -3895,8 +3888,6 @@ grant_table_destroy(
     if ( t == NULL )
         return;
 
-    gnttab_destroy_arch(t);
-
     for ( i = 0; i < nr_grant_frames(t); i++ )
         free_xenheap_page(t->shared_raw[i]);
     xfree(t->shared_raw);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 958ba0c..f7428f9 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1021,6 +1021,7 @@ static struct page_info *alloc_heap_pages(
 
         /* Initialise fields which have other uses for free pages. */
         pg[i].u.inuse.type_info = 0;
+        page_arch_init(&pg[i]);
         page_set_owner(&pg[i], NULL);
 
     }
diff --git a/xen/include/asm-arm/grant_table.h b/xen/include/asm-arm/grant_table.h
index 0ce77f9..77dfa8e 100644
--- a/xen/include/asm-arm/grant_table.h
+++ b/xen/include/asm-arm/grant_table.h
@@ -11,11 +11,6 @@
 #define INITIAL_NR_GRANT_FRAMES 1U
 #define GNTTAB_MAX_VERSION 1
 
-struct grant_table_arch {
-    gfn_t *shared_gfn;
-    gfn_t *status_gfn;
-};
-
 static inline void gnttab_clear_flags(struct domain *d,
                                       unsigned int mask, uint16_t *addr)
 {
@@ -46,35 +41,11 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
 #define gnttab_dom0_frames()                                             \
     min_t(unsigned int, opt_max_grant_frames, PFN_DOWN(_etext - _stext))
 
-#define gnttab_init_arch(gt)                                             \
-({                                                                       \
-    unsigned int ngf_ = (gt)->max_grant_frames;                          \
-    unsigned int nsf_ = grant_to_status_frames(ngf_);                    \
-                                                                         \
-    (gt)->arch.shared_gfn = xmalloc_array(gfn_t, ngf_);                  \
-    (gt)->arch.status_gfn = xmalloc_array(gfn_t, nsf_);                  \
-    if ( (gt)->arch.shared_gfn && (gt)->arch.status_gfn )                \
-    {                                                                    \
-        while ( ngf_-- )                                                 \
-            (gt)->arch.shared_gfn[ngf_] = INVALID_GFN;                   \
-        while ( nsf_-- )                                                 \
-            (gt)->arch.status_gfn[nsf_] = INVALID_GFN;                   \
-    }                                                                    \
-    else                                                                 \
-        gnttab_destroy_arch(gt);                                         \
-    (gt)->arch.shared_gfn ? 0 : -ENOMEM;                                 \
-})
-
-#define gnttab_destroy_arch(gt)                                          \
-    do {                                                                 \
-        XFREE((gt)->arch.shared_gfn);                                    \
-        XFREE((gt)->arch.status_gfn);                                    \
-    } while ( 0 )
-
 #define gnttab_set_frame_gfn(gt, st, idx, gfn)                           \
     do {                                                                 \
-        ((st) ? (gt)->arch.status_gfn : (gt)->arch.shared_gfn)[idx] =    \
-            (gfn);                                                       \
+        struct page_info *pg_ = (st) ? gnttab_status_page(gt, idx)       \
+                                     : gnttab_shared_page(gt, idx);      \
+        page_set_frame_gfn(pg_, gfn);                                    \
     } while ( 0 )
 
 #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
@@ -82,11 +53,21 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
         : gnttab_shared_gfn(NULL, gt, idx);                              \
 })
 
-#define gnttab_shared_gfn(d, t, i)                                       \
-    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
+#define gnttab_shared_page(t, i)    \
+    mfn_to_page(_mfn(__virt_to_mfn((t)->shared_raw[i])))
+
+#define gnttab_status_page(t, i)    \
+    mfn_to_page(_mfn(__virt_to_mfn((t)->status[i])))
 
-#define gnttab_status_gfn(d, t, i)                                       \
-    (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
+#define gnttab_shared_gfn(d, t, i) ({                                    \
+    struct page_info *pg_ = gnttab_shared_page(t, i);                    \
+    page_get_frame_gfn(pg_);                                             \
+})
+
+#define gnttab_status_gfn(d, t, i) ({                                    \
+    struct page_info *pg_ = gnttab_status_page(t, i);                    \
+    page_get_frame_gfn(pg_);                                             \
+})
 
 #define gnttab_need_iommu_mapping(d)                    \
     (is_domain_direct_mapped(d) && is_iommu_enabled(d))
diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index ded74d2..dea4c49 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -39,7 +39,15 @@ struct page_info
         /* Page is in use: ((count_info & PGC_count_mask) != 0). */
         struct {
             /* Type reference count and various PGT_xxx flags and fields. */
-            unsigned long type_info;
+            unsigned long type_info:4;
+
+            /*
+             * Stored GFN if page is used for grant table frame
+             * (bits 59(27)-0).
+             */
+#define PGT_FRAME_GFN_WIDTH      (BITS_PER_LONG - 4)
+#define PGT_INVALID_FRAME_GFN    _gfn((1UL << PGT_FRAME_GFN_WIDTH) - 1)
+            unsigned long frame_gfn:PGT_FRAME_GFN_WIDTH;
         } inuse;
         /* Page is on a free list: ((count_info & PGC_count_mask) == 0). */
         union {
@@ -94,12 +102,12 @@ struct page_info
 #define PG_shift(idx)   (BITS_PER_LONG - (idx))
 #define PG_mask(x, idx) (x ## UL << PG_shift(idx))
 
-#define PGT_none          PG_mask(0, 1)  /* no special uses of this page   */
-#define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
-#define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
+#define PGT_none          (0UL << 3)  /* no special uses of this page   */
+#define PGT_writable_page (1UL << 3)  /* has writable mappings?         */
+#define PGT_type_mask     (1UL << 3)
 
  /* Count of uses of this frame as its current type. */
-#define PGT_count_width   PG_shift(2)
+#define PGT_count_width   1
 #define PGT_count_mask    ((1UL<<PGT_count_width)-1)
 
  /* Cleared when the owning guest 'frees' this page. */
@@ -163,6 +171,15 @@ extern unsigned long xenheap_base_pdx;
 
 #define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
 
+#define page_get_frame_gfn(_p) ({                               \
+    gfn_t gfn_ = _gfn((_p)->u.inuse.frame_gfn);                 \
+    gfn_eq(gfn_, PGT_INVALID_FRAME_GFN) ? INVALID_GFN : gfn_;   \
+})
+
+#define page_set_frame_gfn(_p, _gfn) ((_p)->u.inuse.frame_gfn = gfn_x(_gfn))
+
+#define page_arch_init(_p)   page_set_frame_gfn(_p, INVALID_GFN)
+
 #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
 /* PDX of the first page in the frame table. */
 extern unsigned long frametable_base_pdx;
diff --git a/xen/include/asm-x86/grant_table.h b/xen/include/asm-x86/grant_table.h
index 84e3296..0eb018f 100644
--- a/xen/include/asm-x86/grant_table.h
+++ b/xen/include/asm-x86/grant_table.h
@@ -14,9 +14,6 @@
 
 #define INITIAL_NR_GRANT_FRAMES 1U
 
-struct grant_table_arch {
-};
-
 static inline int create_grant_host_mapping(uint64_t addr, mfn_t frame,
                                             unsigned int flags,
                                             unsigned int cache_flags)
@@ -35,8 +32,6 @@ static inline int replace_grant_host_mapping(uint64_t addr, mfn_t frame,
     return replace_grant_pv_mapping(addr, frame, new_addr, flags);
 }
 
-#define gnttab_init_arch(gt) 0
-#define gnttab_destroy_arch(gt) do {} while ( 0 )
 #define gnttab_set_frame_gfn(gt, st, idx, gfn) do {} while ( 0 )
 #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
     mfn_t mfn_ = (st) ? gnttab_status_mfn(gt, idx)                       \
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index cb90527..d2ea39b 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -327,6 +327,8 @@ struct page_info
 
 #define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
 
+#define page_arch_init(_p)    do {} while ( 0 )
+
 #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
 extern unsigned long max_page;
 extern unsigned long total_pages;
-- 
2.7.4


