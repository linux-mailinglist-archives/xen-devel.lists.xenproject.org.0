Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AE8485C25
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 00:11:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253797.435055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5FR7-00014n-B3; Wed, 05 Jan 2022 23:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253797.435055; Wed, 05 Jan 2022 23:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5FR7-00012w-7r; Wed, 05 Jan 2022 23:11:17 +0000
Received: by outflank-mailman (input) for mailman id 253797;
 Wed, 05 Jan 2022 23:11:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dEfz=RV=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1n5FR5-00012k-3f
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 23:11:15 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c692833d-6e7c-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 00:11:13 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id o3so1200532wrh.10
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jan 2022 15:11:13 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id g6sm332859wri.67.2022.01.05.15.11.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jan 2022 15:11:11 -0800 (PST)
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
X-Inumbo-ID: c692833d-6e7c-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=Ae9ftYILNSlTI/fd71zBrPhkEGdReyryH0rCBU7WhKU=;
        b=JxA0ZYbfORxLGLz7Ws5MBJ9q9fZ/hCn0H/e9STFOUg6Bocb6CkcUeEAQqYHmSqbLm0
         +HylV3f9wmLsSkKLv8Hds4/vd2SfMMtZJJtI39hLbu8hc/0hpOgsS50Ga6JPKOam+ifr
         LJjeKrXOArUgLXRvZJsW/IC8TlBwFYjffR+3QYgU+ayAxAbV64FGZy5X1FCjBuXjdh55
         +lsJfoq9QASIOwByIp7cX/xliWlt6U7P2KfUJA4EJsBYlT8BljOPXgK4bblQnWvBUzKP
         eWBb3I4z/aayCd0pCE1qgklmtHIW1OQAcbTjFBYz0ToS6CSNzns26ZriLLN4hD5pDNhY
         J54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Ae9ftYILNSlTI/fd71zBrPhkEGdReyryH0rCBU7WhKU=;
        b=IWPDOzt3AYWGKla8F66Z2WVsdIuiBZr4/8/CpyCTloup8wwVjRkaXIdLhHXhOKvH8D
         FQyNcC0biwUgdV85stL9EpdWCMJBfyKBlC8TQ8h3WVirHO0j8LNxTtfmk/WeV5TyxrQ9
         +Dl2MZoru4cp8S2Bqgeb2a/CafBr2O6uLpx/tB1dB3owAXOnWbJVdVdijR6zKWh0oaFl
         9Ch6yUKSx8D4C26poVsfQthvV33TZ5fjtXV5+7ihpQa1/S5AKMsjCPKz2FDFS65Mcojn
         7S+cz12m+nj8gbmI86YB+BM1YZuvWofBZttIMG85LKgB+Pon8M0z1QuvlYYikeI2f3js
         McXA==
X-Gm-Message-State: AOAM530pn/Ltl/Euo2JqnYP1+tKlvWUU6EJVcscBP8hgA9C8E2cXC5uK
	Q2z3zdVVnY4svFNvgO8VaRCs/J45GT0=
X-Google-Smtp-Source: ABdhPJyU9sEzEhpF92CDLEo3BL1NcTzAOlqwnDxcUrqZFtVq25F5GShOwDuwEICZRr+IkHE+CN9Nbw==
X-Received: by 2002:a05:6000:180c:: with SMTP id m12mr2082592wrh.494.1641424272289;
        Wed, 05 Jan 2022 15:11:12 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
Date: Thu,  6 Jan 2022 01:11:08 +0200
Message-Id: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Rework Arm implementation to store grant table frame GFN
in struct page_info directly instead of keeping it in
standalone status/shared arrays. This patch is based on
the assumption that grant table page is the xenheap page.

To cover 64-bit/40-bit IPA on Arm64/Arm32 we need the space
to hold 52-bit/28-bit + extra bit value respectively. In order
to not grow the size of struct page_info borrow the required
amount of bits from type_info's count portion which current
context won't suffer (currently only 1 bit is used on Arm).
Please note, to minimize code changes and avoid introducing
an extra #ifdef-s to the header, we keep the same amount of
bits on both subarches, although the count portion on Arm64
could be wider, so we waste some bits here.

Introduce corresponding PGT_* constructs and access macros.
Update existing gnttab macros to deal with GFN value according
to new location. Also update the use of count portion on Arm
in share_xen_page_with_guest().

While at it, extend this simplified M2P-like approach for any
xenheap pages which are proccessed in xenmem_add_to_physmap_one()
except foreign ones. Update the code to set GFN portion after
establishing new mapping for the xenheap page in said function
and to clean GFN portion when putting a reference on that page
in p2m_put_l3_page().

And for everything to work correctly introduce arch-specific
initialization pattern PGT_TYPE_INFO_INIT_PATTERN to be ORed
with type_info field in alloc_xenheap_pages(). The pattern's
purpose on Arm is to clear the GFN portion before use, on x86
it is just a stub.

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
https://lore.kernel.org/xen-devel/1638563610-4419-1-git-send-email-olekstysh@gmail.com/

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
---
 xen/arch/arm/include/asm/grant_table.h | 58 ++++++++++------------------------
 xen/arch/arm/include/asm/mm.h          | 38 ++++++++++++++++++++--
 xen/arch/arm/mm.c                      | 24 ++++++++++++--
 xen/arch/arm/p2m.c                     |  7 ++--
 xen/arch/x86/include/asm/grant_table.h |  5 ---
 xen/arch/x86/include/asm/mm.h          |  3 ++
 xen/common/grant_table.c               |  9 ------
 xen/common/page_alloc.c                |  7 ++++
 8 files changed, 88 insertions(+), 63 deletions(-)

diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
index d31a4d6..d6fda31 100644
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
@@ -46,41 +41,12 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
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
     ({                                                                   \
-        int rc_ = 0;                                                     \
         gfn_t ogfn = gnttab_get_frame_gfn(gt, st, idx);                  \
-        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||           \
-             (rc_ = guest_physmap_remove_page((gt)->domain, ogfn, mfn,   \
-                                              0)) == 0 )                 \
-            ((st) ? (gt)->arch.status_gfn                                \
-                  : (gt)->arch.shared_gfn)[idx] = (gfn);                 \
-        rc_;                                                             \
+        (!gfn_eq(ogfn, INVALID_GFN) && !gfn_eq(ogfn, gfn))               \
+         ? guest_physmap_remove_page((gt)->domain, ogfn, mfn, 0)         \
+         : 0;                                                            \
     })
 
 #define gnttab_get_frame_gfn(gt, st, idx) ({                             \
@@ -88,11 +54,21 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
         : gnttab_shared_gfn(NULL, gt, idx);                              \
 })
 
-#define gnttab_shared_gfn(d, t, i)                                       \
-    (((i) >= nr_grant_frames(t)) ? INVALID_GFN : (t)->arch.shared_gfn[i])
+#define gnttab_shared_page(t, i) ({                                      \
+    virt_to_page((t)->shared_raw[i]);                                    \
+})
+
+#define gnttab_status_page(t, i) ({                                      \
+    virt_to_page((t)->status[i]);                                        \
+})
 
-#define gnttab_status_gfn(d, t, i)                                       \
-    (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
+#define gnttab_shared_gfn(d, t, i) ({                                    \
+    page_get_xenheap_gfn(gnttab_shared_page(t, i));                      \
+})
+
+#define gnttab_status_gfn(d, t, i) ({                                    \
+    page_get_xenheap_gfn(gnttab_status_page(t, i));                      \
+})
 
 #define gnttab_need_iommu_mapping(d)                    \
     (is_domain_direct_mapped(d) && is_iommu_enabled(d))
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 424aaf2..b99044c 100644
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
+ * Stored in bits [28:0] or [60:0] GFN if page is xenheap page.
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
+#define PGT_TYPE_INFO_INIT_PATTERN   gfn_x(PGT_INVALID_XENHEAP_GFN)
 
  /* Cleared when the owning guest 'frees' this page. */
 #define _PGC_allocated    PG_shift(1)
@@ -358,6 +371,25 @@ void clear_and_clean_page(struct page_info *page);
 
 unsigned int arch_get_dma_bitsize(void);
 
+static inline gfn_t page_get_xenheap_gfn(const struct page_info *p)
+{
+    gfn_t gfn_ = _gfn(p->u.inuse.type_info & PGT_gfn_mask);
+
+    ASSERT(is_xen_heap_page(p));
+
+    return gfn_eq(gfn_, PGT_INVALID_XENHEAP_GFN) ? INVALID_GFN : gfn_;
+}
+
+static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
+{
+    gfn_t gfn_ = gfn_eq(gfn, INVALID_GFN) ? PGT_INVALID_XENHEAP_GFN : gfn;
+
+    ASSERT(is_xen_heap_page(p));
+
+    p->u.inuse.type_info &= ~PGT_gfn_mask;
+    p->u.inuse.type_info |= gfn_x(gfn_);
+}
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index eea926d..4f4cab3 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1382,8 +1382,10 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
     spin_lock(&d->page_alloc_lock);
 
     /* The incremented type count pins as writable or read-only. */
-    page->u.inuse.type_info =
-        (flags == SHARE_ro ? PGT_none : PGT_writable_page) | 1;
+    page->u.inuse.type_info &= ~(PGT_type_mask | PGT_count_mask);
+    page->u.inuse.type_info |= (flags == SHARE_ro ? PGT_none
+                                                  : PGT_writable_page) |
+                                MASK_INSR(1, PGT_count_mask);
 
     page_set_owner(page, d);
     smp_wmb(); /* install valid domain ptr before updating refcnt. */
@@ -1487,7 +1489,23 @@ int xenmem_add_to_physmap_one(
     }
 
     /* Map at new location. */
-    rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
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
+            rc = -EBUSY;
+        p2m_write_unlock(p2m);
+    }
 
     /*
      * For XENMAPSPACE_gmfn_foreign if we failed to add the mapping, we need
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 8b20b43..fd8aff9 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -720,6 +720,8 @@ static int p2m_mem_access_radix_set(struct p2m_domain *p2m, gfn_t gfn,
  */
 static void p2m_put_l3_page(const lpae_t pte)
 {
+    mfn_t mfn = lpae_get_mfn(pte);
+
     ASSERT(p2m_is_valid(pte));
 
     /*
@@ -731,11 +733,12 @@ static void p2m_put_l3_page(const lpae_t pte)
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
index a8a2143..5c23cec 100644
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
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 5dbcee8..b6b0dce 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -57,6 +57,9 @@
 #define PGT_count_width   PG_shift(8)
 #define PGT_count_mask    ((1UL<<PGT_count_width)-1)
 
+/* No arch-specific initialization pattern is needed for the type_info field. */
+#define PGT_TYPE_INFO_INIT_PATTERN   0
+
 /* Are the 'type mask' bits identical? */
 #define PGT_type_equal(x, y) (!(((x) ^ (y)) & PGT_type_mask))
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 0262f2c..01d7a29 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -94,8 +94,6 @@ struct grant_table {
 
     /* Domain to which this struct grant_table belongs. */
     struct domain *domain;
-
-    struct grant_table_arch arch;
 };
 
 unsigned int __read_mostly opt_max_grant_frames = 64;
@@ -1997,14 +1995,9 @@ int grant_table_init(struct domain *d, int max_grant_frames,
 
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
@@ -3911,8 +3904,6 @@ grant_table_destroy(
     if ( t == NULL )
         return;
 
-    gnttab_destroy_arch(t);
-
     for ( i = 0; i < nr_grant_frames(t); i++ )
         free_xenheap_page(t->shared_raw[i]);
     xfree(t->shared_raw);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 38eea87..ec7d803 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2159,6 +2159,7 @@ void init_xenheap_pages(paddr_t ps, paddr_t pe)
 void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
 {
     struct page_info *pg;
+    unsigned int i;
 
     ASSERT(!in_irq());
 
@@ -2167,6 +2168,9 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
     if ( unlikely(pg == NULL) )
         return NULL;
 
+    for ( i = 0; i < (1u << order); i++ )
+        pg[i].u.inuse.type_info |= PGT_TYPE_INFO_INIT_PATTERN;
+
     return page_to_virt(pg);
 }
 
@@ -2214,7 +2218,10 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
         return NULL;
 
     for ( i = 0; i < (1u << order); i++ )
+    {
         pg[i].count_info |= PGC_xen_heap;
+        pg[i].u.inuse.type_info |= PGT_TYPE_INFO_INIT_PATTERN;
+    }
 
     return page_to_virt(pg);
 }
-- 
2.7.4


