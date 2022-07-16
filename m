Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8A9576F8E
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jul 2022 16:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368761.600158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCjEN-0002gH-Tx; Sat, 16 Jul 2022 14:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368761.600158; Sat, 16 Jul 2022 14:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCjEN-0002e4-PG; Sat, 16 Jul 2022 14:57:19 +0000
Received: by outflank-mailman (input) for mailman id 368761;
 Sat, 16 Jul 2022 14:57:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KCTf=XV=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oCjEM-0002OT-Bj
 for xen-devel@lists.xenproject.org; Sat, 16 Jul 2022 14:57:18 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9561aeb8-0517-11ed-924f-1f966e50362f;
 Sat, 16 Jul 2022 16:57:16 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id d12so12204467lfq.12
 for <xen-devel@lists.xenproject.org>; Sat, 16 Jul 2022 07:57:16 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a19504d000000b00489e64dcf75sm1500151lfj.204.2022.07.16.07.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 07:57:15 -0700 (PDT)
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
X-Inumbo-ID: 9561aeb8-0517-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J6bLnQbN2THnje0cYKpZNnTrTAJ0NLkOSbUXbhosl7E=;
        b=cdl+jeDHbSaVh8RF2KuhK5K1KSIwZNWH+q145h0BJ7Rzfwg6ElbAtISFyvTyII/z5e
         i0s2a3v5gxr5r4xUmi6SiR8yMtGCSXXa+o5R1u7e/5Tm5Aq4hrAXKesJppXenAvag76N
         8vP5jFTLQ5xi8yJOb6tRGAG8JYW6B5ir87yEOc+swTEE7xZCVaNAYa2Bolt8WhfGmH9C
         B+yjpnzDS49T5NpRjW7fTHERF0KvJUhEJBZbrwvkZgp4QMhmPFo7J8vJ0wqJYuAnIe58
         mAYdbGFN8Ku23ny3VwFbR9pwEr9m8uobU2r2xP/0u7iM88ToEbk8sD0BAWAgS+GAR0fi
         pNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J6bLnQbN2THnje0cYKpZNnTrTAJ0NLkOSbUXbhosl7E=;
        b=zKxG/ni7P2YEph0rt9ruTP+GAbQdHQd1JBSyKeOhHMTE9u9wH53D7jQPQ+ZZOl9AUC
         8fQIKeRL1DZkYC0G9m/GT+5tj8Ej0ni0SEdDDbD0XA/kZ41B6q6EKrSHeH0euTbGHYwT
         NqyGEitQUDUSnuIy5Yim2X8cB0XCo41CgaoTovvSPZN1gC0ktFT8rWWzjk4l+cn+Fmb4
         m6VWlJ/YV2K5eAuLwkALfQQJ48ho4X484x8862jXJpxoVXtYSgt9Uw88TqMFXnNHlOmE
         /L47yMAiEn4klilJqjtE1QyaWe+mkLH8IfcWOzER71rMGKfjSgP67FElRbJY1X2+Mi10
         qqbQ==
X-Gm-Message-State: AJIora+dS67Dgv+vLS/QAXJZhuz7H5PA353eazadqCzEKukTaN+Wy4cg
	xn4FDVIkkDTlyymNDmL2TbilbXWh7NAQig==
X-Google-Smtp-Source: AGRyM1vVJ6Tkr1z8JkJGPokfsvE1DjhTWGpnVFoEZDuX7I0bu6bLedn5BsUN1EWMSmxmNgrhxfn8aQ==
X-Received: by 2002:a05:6512:31c1:b0:48a:2990:17b6 with SMTP id j1-20020a05651231c100b0048a299017b6mr2984052lfe.10.1657983435694;
        Sat, 16 Jul 2022 07:57:15 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH V7 2/2] xen/gnttab: Store frame GFN in struct page_info on Arm
Date: Sat, 16 Jul 2022 17:56:58 +0300
Message-Id: <20220716145658.4175730-2-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220716145658.4175730-1-olekstysh@gmail.com>
References: <20220716145658.4175730-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Rework Arm implementation to store grant table frame GFN
in struct page_info directly instead of keeping it in
standalone status/shared arrays. This patch is based on
the assumption that a grant table page is a xenheap page.

To cover 64-bit/40-bit IPA on Arm64/Arm32 we need the space
to hold 52-bit/28-bit + extra bit value respectively. In order
to not grow the size of struct page_info borrow the required
amount of bits from type_info's count portion which current
context won't suffer (currently only 1 bit is used on Arm).
Please note, to minimize code changes and avoid introducing
an extra #ifdef-s to the header, we keep the same amount of
bits on both subarches, although the count portion on Arm64
could be wider, so we waste some bits here.

Introduce corresponding PGT_* constructs and access macro
page_get(set)_xenheap_gfn. Please note, all accesses to
the GFN portion of type_info field should always be protected
by the P2M lock. In case when it is not feasible to satisfy
that requirement (risk of deadlock, lock inversion, etc)
it is important to make sure that all non-protected updates
to this field are atomic.
As several non-protected read accesses still exist within
current code (most calls to page_get_xenheap_gfn() are not
protected by the P2M lock) the subsequent patch will introduce
hardening code for p2m_remove_mapping() to be called with P2M
lock held in order to check any difference between what is
already mapped and what is requested to be ummapped.

Update existing gnttab macros to deal with GFN value according
to new location. Also update the use of count portion of type_info
field on Arm in share_xen_page_with_guest().

While at it, extend this simplified M2P-like approach for any
xenheap pages which are proccessed in xenmem_add_to_physmap_one()
except foreign ones. Update the code to set GFN portion after
establishing new mapping for the xenheap page in said function
and to clean GFN portion when putting a reference on that page
in p2m_put_l3_page().

And for everything to work correctly introduce arch-specific
initialization pattern PGT_TYPE_INFO_INITIALIZER to be applied
to type_info field during initialization at alloc_heap_pages()
and acquire_staticmem_pages(). The pattern's purpose on Arm
is to clear the GFN portion before use, on x86 it is just
a stub.

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

Please note, this patch also changes the behavior how the shared_info
page (which is xenheap RAM page) is mapped in xenmem_add_to_physmap_one().
Now, we only allow to map the shared_info at once. The subsequent
attempts to map it will result in -EBUSY. Doing that we mandate
the caller to first unmap the page before mapping it again. This is
to prevent Xen creating an unwanted hole in the P2M. For instance,
this could happen if the firmware stole a RAM address for mapping
the shared_info page into but forgot to unmap it afterwards.

Besides that, this patch simplifies arch code on Arm by
removing arrays and corresponding management code and
as the result gnttab_init_arch/gnttab_destroy_arch helpers
and struct grant_table_arch become useless and can be
dropped globally.

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Dear @RISC-V maintainers, please note in current patch I drop arch
specific helpers gnttab_init(destroy)_arch helpers as unneeded for
both Arm and x86. Please let me know if you are going to reuse them
in the nearest future and I will retain them.

You can find the related discussions at:
https://lore.kernel.org/xen-devel/93d0df14-2c8a-c2e3-8c51-54412190171c@xen.org/
https://lore.kernel.org/xen-devel/1628890077-12545-1-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1631652245-30746-1-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1632425551-18910-1-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1641424268-12968-1-git-send-email-olekstysh@gmail.com/
https://lore.kernel.org/xen-devel/1652294845-13980-1-git-send-email-olekstysh@gmail.com/

Changes RFC1 -> RFC2:
 - update patch description
 - add/update comments in code
 - clarify check in p2m_put_l3_page()
 - introduce arch_alloc_xenheap_page() and arch_free_xenheap_page()
   and drop page_arch_init()
 - add ASSERT to gnttab_shared_page() and gnttab_status_page()
 - rework changes to Arm's struct page_info: do not split type_info,
   allocate GFN portion by reducing count portion, create corresponding
   PGT_* construct, etc
 - update page_get_frame_gfn() and page_set_frame_gfn()
 - update the use of count portion on Arm
 - drop the leading underscore in the macro parameter names

Changes RFC2 -> RFC3:
 - update patch description
 - drop PGT_count_base and MASK_INSR() in share_xen_page_with_guest()
 - update alloc_xenheap_page() and free_xenheap_page() for SEPARATE_XENHEAP
   case (Arm32)
 - provide an extra bit for GFN portion, to get PGT_INVALID_FRAME_GFN
   one bit more than the maximum number of physical address bits on Arm32

Changes RFC3 -> V4:
 - rebase on Jan's "gnttab: remove guest_physmap_remove_page() call
   from gnttab_map_frame()"
 - finally resolve locking question by recent Julien's suggestion,
   so drop the RFC tag
 - update comments in Arm's mm.h/p2m.c to not mention grant table
 - convert page_set(get)_frame_gfn to static inline func and
   rename them to page_set(get)_xenheap_gfn()
 - rename PGT_INVALID_FRAME_GFN to PGT_INVALID_XENHEAP_GFN
 - add ASSERT(is_xen_heap_page(...)) in page_set(get)_frame_gfn
 - remove BUG_ON() in arch_free_xenheap_page
 - remove local type_info in share_xen_page_with_guest()
 - remove an extra argument p2m in p2m_put_l3_page()
 - remove #ifdef CONFIG_GRANT_TABLE in p2m_put_l3_page()
 - also cover real-only pages by using p2m_is_ram instead of a check
   against p2m_ram_rw in p2m_put_l3_page() and use "else if" construct
 - call arch_free_xenheap_page() before clearing the PGC_xen_heap in
   free_xenheap_pages()
 - remove ASSERT() in gnttab_shared(status)_page and use simpler
   virt_to_page
 - remove local pg_ in gnttab_shared(status)_gfn
 - update patch description to reflect recent changes

Changes V4 -> V5:
 - rebase on latest staging
 - update patch description
 - drop arch_alloc(free)_xenheap_page macro and use arch-specific
   initialization pattern to clear GFN portion before use
 - add const to struct page_info *p in page_get_xenheap_gfn
 - fix a breakage on Arm32

Changes V5 -> V6:
 - update patch description
 - add/update comments in code
 - s/PGT_TYPE_INFO_INIT_PATTERN/PGT_TYPE_INFO_INITIALIZER
 - define PGT_TYPE_INFO_INITIALIZER in page_alloc.c if arch doesn't define it
 - modify page_get_xenheap_gfn() to use ACCESS_ONCE() when reading type_info field
 - modify page_set_xenheap_gfn() to use cmpxchg() when changing type_info field
 - apply PGT_TYPE_INFO_INITIALIZER in alloc_heap_pages() and acquire_staticmem_pages()
   rather than altering both flavors of alloc_xenheap_pages() to make an extra
   assignment
 - simplify gnttab_shared(status)_page and gnttab_(shared)status_gfn macro
 - update a check in Arm's gnttab_set_frame_gfn()

Changes V6 -> V7:
 - make this commit to be the last
 - update commit description and add/update comments in code
---
 xen/arch/arm/include/asm/grant_table.h | 53 ++++++--------------------
 xen/arch/arm/include/asm/mm.h          | 47 +++++++++++++++++++++--
 xen/arch/arm/mm.c                      | 51 ++++++++++++++++++++++---
 xen/arch/arm/p2m.c                     |  7 +++-
 xen/arch/x86/include/asm/grant_table.h |  5 ---
 xen/common/grant_table.c               |  9 -----
 xen/common/page_alloc.c                |  8 +++-
 7 files changed, 112 insertions(+), 68 deletions(-)

diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
index a283dd5cd6..e13dfeefa5 100644
--- a/xen/arch/arm/include/asm/grant_table.h
+++ b/xen/arch/arm/include/asm/grant_table.h
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
@@ -56,53 +51,27 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
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
 #define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
-    ({                                                                   \
-        int rc_ = 0;                                                     \
-        gfn_t ogfn = gnttab_get_frame_gfn(gt, st, idx);                  \
-        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||           \
-             (rc_ = guest_physmap_remove_page((gt)->domain, ogfn, mfn,   \
-                                              0)) == 0 )                 \
-            ((st) ? (gt)->arch.status_gfn                                \
-                  : (gt)->arch.shared_gfn)[idx] = (gfn);                 \
-        rc_;                                                             \
-    })
+    (gfn_eq(gfn, INVALID_GFN)                                            \
+     ? guest_physmap_remove_page((gt)->domain,                           \
+                                 gnttab_get_frame_gfn(gt, st, idx),      \
+                                 mfn, 0)                                 \
+     : 0)
 
 #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
    (st) ? gnttab_status_gfn(NULL, gt, idx)                               \
         : gnttab_shared_gfn(NULL, gt, idx);                              \
 })
 
+#define gnttab_shared_page(t, i)   virt_to_page((t)->shared_raw[i])
+
+#define gnttab_status_page(t, i)   virt_to_page((t)->status[i])
+
 #define gnttab_shared_gfn(d, t, i)                                       \
-    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
+    page_get_xenheap_gfn(gnttab_shared_page(t, i))
 
 #define gnttab_status_gfn(d, t, i)                                       \
-    (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
+    page_get_xenheap_gfn(gnttab_status_page(t, i))
 
 #define gnttab_need_iommu_mapping(d)                    \
     (is_domain_direct_mapped(d) && is_iommu_enabled(d))
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index c4bc3cd1e5..6c0a3c789f 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -98,9 +98,22 @@ struct page_info
 #define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
 #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
 
- /* Count of uses of this frame as its current type. */
-#define PGT_count_width   PG_shift(2)
-#define PGT_count_mask    ((1UL<<PGT_count_width)-1)
+ /* 2-bit count of uses of this frame as its current type. */
+#define PGT_count_mask    PG_mask(3, 3)
+
+/*
+ * Stored in bits [28:0] (arm32) or [60:0] (arm64) GFN if page is xenheap page.
+ */
+#define PGT_gfn_width     PG_shift(3)
+#define PGT_gfn_mask      ((1UL<<PGT_gfn_width)-1)
+
+#define PGT_INVALID_XENHEAP_GFN   _gfn(PGT_gfn_mask)
+
+/*
+ * An arch-specific initialization pattern is needed for the type_info field
+ * as it's GFN portion can contain the valid GFN if page is xenheap page.
+ */
+#define PGT_TYPE_INFO_INITIALIZER   gfn_x(PGT_INVALID_XENHEAP_GFN)
 
  /* Cleared when the owning guest 'frees' this page. */
 #define _PGC_allocated    PG_shift(1)
@@ -354,6 +367,34 @@ void clear_and_clean_page(struct page_info *page);
 
 unsigned int arch_get_dma_bitsize(void);
 
+/*
+ * All accesses to the GFN portion of type_info field should always be
+ * protected by the P2M lock. In case when it is not feasible to satisfy
+ * that requirement (risk of deadlock, lock inversion, etc) it is important
+ * to make sure that all non-protected updates to this field are atomic.
+ */
+static inline gfn_t page_get_xenheap_gfn(const struct page_info *p)
+{
+    gfn_t gfn_ = _gfn(ACCESS_ONCE(p->u.inuse.type_info) & PGT_gfn_mask);
+
+    ASSERT(is_xen_heap_page(p));
+
+    return gfn_eq(gfn_, PGT_INVALID_XENHEAP_GFN) ? INVALID_GFN : gfn_;
+}
+
+static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
+{
+    gfn_t gfn_ = gfn_eq(gfn, INVALID_GFN) ? PGT_INVALID_XENHEAP_GFN : gfn;
+    unsigned long x, nx, y = p->u.inuse.type_info;
+
+    ASSERT(is_xen_heap_page(p));
+
+    do {
+        x = y;
+        nx = (x & ~PGT_gfn_mask) | gfn_x(gfn_);
+    } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
+}
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 009b8cd9ef..e59a4ce6d0 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1449,9 +1449,21 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
 
     spin_lock(&d->page_alloc_lock);
 
-    /* The incremented type count pins as writable or read-only. */
-    page->u.inuse.type_info =
-        (flags == SHARE_ro ? PGT_none : PGT_writable_page) | 1;
+    /*
+     * The incremented type count pins as writable or read-only.
+     *
+     * Please note, the update of type_info field here is not atomic as
+     * we use Read-Modify-Write operation on it. But currently it is fine
+     * because the caller of page_set_xenheap_gfn() (which is another place
+     * where type_info is updated) would need to acquire a reference on
+     * the page. This is only possible after the count_info is updated *and*
+     * there is a barrier between the type_info and count_info. So there is
+     * no immediate need to use cmpxchg() here.
+     */
+    page->u.inuse.type_info &= ~(PGT_type_mask | PGT_count_mask);
+    page->u.inuse.type_info |= (flags == SHARE_ro ? PGT_none
+                                                  : PGT_writable_page) |
+                                MASK_INSR(1, PGT_count_mask);
 
     page_set_owner(page, d);
     smp_wmb(); /* install valid domain ptr before updating refcnt. */
@@ -1554,8 +1566,37 @@ int xenmem_add_to_physmap_one(
         return -ENOSYS;
     }
 
-    /* Map at new location. */
-    rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
+    /*
+     * Map at new location. Here we need to map xenheap RAM page differently
+     * because we need to store the valid GFN and make sure that nothing was
+     * mapped before (the stored GFN is invalid). And these actions need to be
+     * performed with the P2M lock held. The guest_physmap_add_entry() is just
+     * a wrapper on top of p2m_set_entry().
+     */
+    if ( !p2m_is_ram(t) || !is_xen_heap_mfn(mfn) )
+        rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
+    else
+    {
+        struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+        p2m_write_lock(p2m);
+        if ( gfn_eq(page_get_xenheap_gfn(mfn_to_page(mfn)), INVALID_GFN) )
+        {
+            rc = p2m_set_entry(p2m, gfn, 1, mfn, t, p2m->default_access);
+            if ( !rc )
+                page_set_xenheap_gfn(mfn_to_page(mfn), gfn);
+        }
+        else
+            /*
+             * Mandate the caller to first unmap the page before mapping it
+             * again. This is to prevent Xen creating an unwanted hole in
+             * the P2M. For instance, this could happen if the firmware stole
+             * a RAM address for mapping the shared_info page into but forgot
+             * to unmap it afterwards.
+             */
+            rc = -EBUSY;
+        p2m_write_unlock(p2m);
+    }
 
     /*
      * For XENMAPSPACE_gmfn_foreign if we failed to add the mapping, we need
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 2a0d383df4..eec5e90ab0 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -716,6 +716,8 @@ static int p2m_mem_access_radix_set(struct p2m_domain *p2m, gfn_t gfn,
  */
 static void p2m_put_l3_page(const lpae_t pte)
 {
+    mfn_t mfn = lpae_get_mfn(pte);
+
     ASSERT(p2m_is_valid(pte));
 
     /*
@@ -727,11 +729,12 @@ static void p2m_put_l3_page(const lpae_t pte)
      */
     if ( p2m_is_foreign(pte.p2m.type) )
     {
-        mfn_t mfn = lpae_get_mfn(pte);
-
         ASSERT(mfn_valid(mfn));
         put_page(mfn_to_page(mfn));
     }
+    /* Detect the xenheap page and mark the stored GFN as invalid. */
+    else if ( p2m_is_ram(pte.p2m.type) && is_xen_heap_mfn(mfn) )
+        page_set_xenheap_gfn(mfn_to_page(mfn), INVALID_GFN);
 }
 
 /* Free lpae sub-tree behind an entry */
diff --git a/xen/arch/x86/include/asm/grant_table.h b/xen/arch/x86/include/asm/grant_table.h
index a8a21439a4..5c23cec90c 100644
--- a/xen/arch/x86/include/asm/grant_table.h
+++ b/xen/arch/x86/include/asm/grant_table.h
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
 #define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
     (gfn_eq(gfn, INVALID_GFN)                                            \
      ? guest_physmap_remove_page((gt)->domain,                           \
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index aea0ad30a7..ad773a6996 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -99,8 +99,6 @@ struct grant_table {
 
     /* Domain to which this struct grant_table belongs. */
     struct domain *domain;
-
-    struct grant_table_arch arch;
 };
 
 unsigned int __read_mostly opt_max_grant_frames = 64;
@@ -2018,14 +2016,9 @@ int grant_table_init(struct domain *d, int max_grant_frames,
 
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
@@ -3939,8 +3932,6 @@ grant_table_destroy(
     if ( t == NULL )
         return;
 
-    gnttab_destroy_arch(t);
-
     for ( i = 0; i < nr_grant_frames(t); i++ )
         free_xenheap_page(t->shared_raw[i]);
     xfree(t->shared_raw);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index fe0e15429a..6ca986584d 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -155,6 +155,10 @@
 #define PGC_reserved 0
 #endif
 
+#ifndef PGT_TYPE_INFO_INITIALIZER
+#define PGT_TYPE_INFO_INITIALIZER 0
+#endif
+
 /*
  * Comma-separated list of hexadecimal page numbers containing bad bytes.
  * e.g. 'badpage=0x3f45,0x8a321'.
@@ -1024,7 +1028,7 @@ static struct page_info *alloc_heap_pages(
                                 &tlbflush_timestamp);
 
         /* Initialise fields which have other uses for free pages. */
-        pg[i].u.inuse.type_info = 0;
+        pg[i].u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
         page_set_owner(&pg[i], NULL);
 
     }
@@ -2702,7 +2706,7 @@ static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
          */
         pg[i].count_info = PGC_reserved | PGC_state_inuse;
         /* Initialise fields which have other uses for free pages. */
-        pg[i].u.inuse.type_info = 0;
+        pg[i].u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
         page_set_owner(&pg[i], NULL);
     }
 
-- 
2.25.1


