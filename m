Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 701C75AF747
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:50:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400346.642047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSD-0007Yj-4I; Tue, 06 Sep 2022 21:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400346.642047; Tue, 06 Sep 2022 21:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSC-0007WP-Vr; Tue, 06 Sep 2022 21:49:56 +0000
Received: by outflank-mailman (input) for mailman id 400346;
 Tue, 06 Sep 2022 21:49:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FLlR=ZJ=bounce.vates.fr=bounce-md_30504962.631718d1.v1-a8dca91a88494f7f8b1011af811f372b@srs-se1.protection.inumbo.net>)
 id 1oVgIW-0000Cs-Ii
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:39:56 +0000
Received: from mail136-23.atl41.mandrillapp.com
 (mail136-23.atl41.mandrillapp.com [198.2.136.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2f74d4e-2dc9-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 11:54:24 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-23.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4MMLMP1T42z1XLFCT
 for <xen-devel@lists.xenproject.org>; Tue,  6 Sep 2022 09:54:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a8dca91a88494f7f8b1011af811f372b; Tue, 06 Sep 2022 09:54:25 +0000
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
X-Inumbo-ID: e2f74d4e-2dc9-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1662458065; x=1662760465; i=andrei.semenov@vates.fr;
	bh=pQxC6Pftr2jRoWbYvo9cSoey9URYE0qRetJUWBPSTIk=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=J90RHZxdhtwm0LlZD5oP7VGWGxM2WYnsvbxujyoIj7OZyxJ2L8DcSnznz0iwWhGQx
	 4j8zU2jvtl8f6/tVakm3nXQpuDvU0ui833kHI6YphNgRKEWWa9VteIIOMYKVAUwOhE
	 Y+9kAWW5xFh7MBCSzKb01D1BXCvqY4p5wCLaB1t4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1662458065; h=From : 
 Subject : To : Cc : Message-Id : In-Reply-To : References : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=pQxC6Pftr2jRoWbYvo9cSoey9URYE0qRetJUWBPSTIk=; 
 b=e0+uul0MFDsDLUDNu96xRuh9CG/82ragY2k/HAkqMg56LHNA/ReMr5e51SC+DdBmoopGXO
 Eadu31KqK0bTJRk/lzpfBgCrt940lXdKeR9B5VbqIeAcRYbJiwTxiyU5SRABg3Jkkvm2CvQn
 CIg/M9VSPS2AD5mopYBo9SHRA4HeA=
From: Andrei Semenov <andrei.semenov@vates.fr>
Subject: [PATCH v2 2/2] live migration: use superpages for physmap population on restore when possible
X-Mailer: git-send-email 2.34.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 5cd6f291-6f11-459d-97c0-d09b574c3896
X-Bm-Transport-Timestamp: 1662458064080
To: andrei.semenov@vates.fr, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Message-Id: <657d6dad39f4ab87569470c94afb4cc6d005e829.1662457291.git.andrei.semenov@vates.fr>
In-Reply-To: <cover.1662457291.git.andrei.semenov@vates.fr>
References: <cover.1662457291.git.andrei.semenov@vates.fr>
X-Report-Abuse: Please forward a copy of this message, including all headers, to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here: http://mandrillapp.com/contact/abuse?id=30504962.a8dca91a88494f7f8b1011af811f372b
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20220906:md
Date: Tue, 06 Sep 2022 09:54:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Implement an heuristic for X86 HVM guests which tries to use superpages while
populating guest physmap on live migration. This should impove memory accesses
performances for these guests.

Signed-off-by: Andrei Semenov <andrei.semenov@vates.fr>
---
 tools/include/xen-tools/libs.h           |  4 ++
 tools/libs/guest/xg_private.h            |  3 +
 tools/libs/guest/xg_sr_common.h          | 18 ++++-
 tools/libs/guest/xg_sr_restore.c         | 60 +++++++---------
 tools/libs/guest/xg_sr_restore_x86_hvm.c | 88 +++++++++++++++++++++++-
 tools/libs/guest/xg_sr_restore_x86_pv.c  | 22 +++++-
 6 files changed, 154 insertions(+), 41 deletions(-)

diff --git a/tools/include/xen-tools/libs.h b/tools/include/xen-tools/libs.h
index a16e0c3807..bdd903eb7b 100644
--- a/tools/include/xen-tools/libs.h
+++ b/tools/include/xen-tools/libs.h
@@ -63,4 +63,8 @@
 #define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
 #endif
 
+#ifndef ROUNDDOWN
+#define ROUNDDOWN(_x,_w) ((unsigned long)(_x) & (-1UL << (_w)))
+#endif
+
 #endif	/* __XEN_TOOLS_LIBS__ */
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index 09e24f1227..dcf63b5188 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -134,6 +134,9 @@ typedef uint64_t x86_pgentry_t;
 #define PAGE_SIZE_X86           (1UL << PAGE_SHIFT_X86)
 #define PAGE_MASK_X86           (~(PAGE_SIZE_X86-1))
 
+#define S_PAGE_1GB_ORDER        18
+#define S_PAGE_2MB_ORDER         9
+
 #define NRPAGES(x) (ROUNDUP(x, PAGE_SHIFT) >> PAGE_SHIFT)
 
 static inline xen_pfn_t xc_pfn_to_mfn(xen_pfn_t pfn, xen_pfn_t *p2m,
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 941e24d7b7..96365e05a8 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -137,7 +137,8 @@ struct xc_sr_restore_ops
     bool (*pfn_is_valid)(const struct xc_sr_context *ctx, xen_pfn_t pfn);
 
     /* Set the GFN of a PFN. */
-    void (*set_gfn)(struct xc_sr_context *ctx, xen_pfn_t pfn, xen_pfn_t gfn);
+    void (*set_gfn)(struct xc_sr_context *ctx, xen_pfn_t pfn, xen_pfn_t gfn,
+                    unsigned int order);
 
     /* Set the type of a PFN. */
     void (*set_page_type)(struct xc_sr_context *ctx, xen_pfn_t pfn,
@@ -175,6 +176,17 @@ struct xc_sr_restore_ops
 #define BROKEN_CHANNEL 2
     int (*process_record)(struct xc_sr_context *ctx, struct xc_sr_record *rec);
 
+    /**
+     * Guest physmap population order is based on heuristic which is family
+     * dependant. X86 HVM  heuristic is interested in observing the whole
+     * record (the first) in order to guess how the physmap should be populated.
+     */
+    void (*guess_physmap)(struct xc_sr_context *ctx, unsigned int count,
+                          const xen_pfn_t *pfns, const uint32_t *types);
+
+    /* Get the physmap population order for given PFN */
+    int (*get_physmap_order)(const struct xc_sr_context *ctx, xen_pfn_t pfn);
+
     /**
      * Perform any actions required after the static data has arrived.  Called
      * when the STATIC_DATA_COMPLETE record has been recieved/inferred.
@@ -404,6 +416,10 @@ struct xc_sr_context
                     {
                         /* HVM context blob. */
                         struct xc_sr_blob context;
+
+                        /* Set guest type (based on the first record) */
+                        bool set_guest_type;
+                        bool pvh_guest;
                     } restore;
                 };
             } hvm;
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 074b56d263..af864bd5ea 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -86,18 +86,21 @@ static bool pfn_is_populated(const struct xc_sr_context *ctx, xen_pfn_t pfn)
  * avoid realloc()ing too excessively, the size increased to the nearest power
  * of two large enough to contain the required pfn.
  */
-static int pfn_set_populated(struct xc_sr_context *ctx, xen_pfn_t pfn)
+static int pfn_set_populated(struct xc_sr_context *ctx, xen_pfn_t pfn,
+                             unsigned int order)
 {
     xc_interface *xch = ctx->xch;
+    xen_pfn_t start_pfn = ROUNDDOWN(pfn, order),
+        end_pfn = (ROUNDUP(pfn + 1, order) - 1);
 
-    if ( pfn > ctx->restore.max_populated_pfn )
+    if ( end_pfn > ctx->restore.max_populated_pfn )
     {
         xen_pfn_t new_max;
         size_t old_sz, new_sz;
         unsigned long *p;
 
         /* Round up to the nearest power of two larger than pfn, less 1. */
-        new_max = pfn;
+        new_max = end_pfn;
         new_max |= new_max >> 1;
         new_max |= new_max >> 2;
         new_max |= new_max >> 4;
@@ -123,8 +126,11 @@ static int pfn_set_populated(struct xc_sr_context *ctx, xen_pfn_t pfn)
         ctx->restore.max_populated_pfn = new_max;
     }
 
-    assert(!test_bit(pfn, ctx->restore.populated_pfns));
-    set_bit(pfn, ctx->restore.populated_pfns);
+    for ( pfn = start_pfn; pfn <= end_pfn; ++pfn )
+    {
+        assert(!test_bit(pfn, ctx->restore.populated_pfns));
+        set_bit(pfn, ctx->restore.populated_pfns);
+    }
 
     return 0;
 }
@@ -138,60 +144,40 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
                   const xen_pfn_t *original_pfns, const uint32_t *types)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = malloc(count * sizeof(*mfns)),
-        *pfns = malloc(count * sizeof(*pfns));
-    unsigned int i, nr_pfns = 0;
+    xen_pfn_t mfn, pfn;
+    unsigned int i, order;
     int rc = -1;
 
-    if ( !mfns || !pfns )
-    {
-        ERROR("Failed to allocate %zu bytes for populating the physmap",
-              2 * count * sizeof(*mfns));
-        goto err;
-    }
+    /* Feed this record for family dependant heuristic to guess the physmap */
+    ctx->restore.ops.guess_physmap(ctx, count, original_pfns, types);
 
     for ( i = 0; i < count; ++i )
     {
         if ( (!types || page_type_to_populate(types[i])) &&
              !pfn_is_populated(ctx, original_pfns[i]) )
         {
-            rc = pfn_set_populated(ctx, original_pfns[i]);
+            order = ctx->restore.ops.get_physmap_order(ctx, original_pfns[i]);
+            rc = pfn_set_populated(ctx, original_pfns[i], order);
             if ( rc )
                 goto err;
-            pfns[nr_pfns] = mfns[nr_pfns] = original_pfns[i];
-            ++nr_pfns;
-        }
-    }
-
-    if ( nr_pfns )
-    {
-        rc = xc_domain_populate_physmap_exact(
-            xch, ctx->domid, nr_pfns, 0, 0, mfns);
-        if ( rc )
-        {
-            PERROR("Failed to populate physmap");
-            goto err;
-        }
 
-        for ( i = 0; i < nr_pfns; ++i )
-        {
-            if ( mfns[i] == INVALID_MFN )
+            pfn = mfn = ROUNDDOWN(original_pfns[i], order);
+            rc = xc_domain_populate_physmap_exact(xch, ctx->domid, 1, order, 0,
+                                                  &mfn);
+            if ( rc || (mfn == INVALID_MFN) )
             {
-                ERROR("Populate physmap failed for pfn %u", i);
+                ERROR("Failed to populate physmap for pfn %lu (%u)", pfn, order);
                 rc = -1;
                 goto err;
             }
 
-            ctx->restore.ops.set_gfn(ctx, pfns[i], mfns[i]);
+            ctx->restore.ops.set_gfn(ctx, pfn, mfn, order);
         }
     }
 
     rc = 0;
 
  err:
-    free(pfns);
-    free(mfns);
-
     return rc;
 }
 
diff --git a/tools/libs/guest/xg_sr_restore_x86_hvm.c b/tools/libs/guest/xg_sr_restore_x86_hvm.c
index d6ea6f3012..2e525443ab 100644
--- a/tools/libs/guest/xg_sr_restore_x86_hvm.c
+++ b/tools/libs/guest/xg_sr_restore_x86_hvm.c
@@ -110,7 +110,7 @@ static xen_pfn_t x86_hvm_pfn_to_gfn(const struct xc_sr_context *ctx,
 
 /* restore_ops function. */
 static void x86_hvm_set_gfn(struct xc_sr_context *ctx, xen_pfn_t pfn,
-                            xen_pfn_t gfn)
+                            xen_pfn_t gfn, unsigned int order)
 {
     /* no op */
 }
@@ -161,6 +161,8 @@ static int x86_hvm_setup(struct xc_sr_context *ctx)
     }
 #endif
 
+    ctx->x86.hvm.restore.set_guest_type = true;
+
     return 0;
 }
 
@@ -192,6 +194,88 @@ static int x86_hvm_process_record(struct xc_sr_context *ctx,
     }
 }
 
+/*
+ * We consider that PVH guest physmap starts from 0 and coninugiously cover the
+ * pysical memory space for the first GB of memory.  HVM guest will have I/0
+ * holes in the first 2MB of memory space (at least for VGA). Therefore we
+ * should observe the very first record (wich comes in physmap order) to find
+ * out how we should map this first GB.
+ * To map the rest of the memory space in both cases (PVH or HVM) we will use
+ * the maximum available order (up to 1GB), except for forth GB wich holds the
+ * low MMIO hole (at least for LAPIC MMIO window and for potential passthroughed
+ * or emulated PCI devices BARs).
+ */
+static void x86_hvm_guess_physmap(struct xc_sr_context *ctx, unsigned int count,
+                         const xen_pfn_t *pfns, const uint32_t *types)
+{
+    xen_pfn_t prev;
+    unsigned int i;
+
+
+    if ( !ctx->x86.hvm.restore.set_guest_type )
+        return;
+
+    for ( i = 0, prev = INVALID_PFN; i < count; ++i )
+    {
+        if ( !types || page_type_to_populate(types[i]) )
+        {
+            if ( prev == INVALID_MFN )
+            {
+                if (pfns[i] != 0)
+                    break;
+            }
+            else
+            {
+                if ( pfns[i] != (prev + 1) )
+                    break;
+            }
+            prev = pfns[i];
+        }
+    }
+
+    ctx->x86.hvm.restore.pvh_guest = (i == count) ? true : false;
+    ctx->x86.hvm.restore.set_guest_type = false;
+}
+
+/*
+ *
+ */
+static int x86_hvm_get_physmap_order(const struct xc_sr_context *ctx,
+                                      xen_pfn_t pfn)
+{
+    int order;
+
+    if ( pfn >= ctx->restore.p2m_size )
+        return 0;
+
+    switch (pfn >> S_PAGE_1GB_ORDER)
+    {
+    case 3:
+        /* The forth GB of memory is mapped with 2MB superpages */
+        order = S_PAGE_2MB_ORDER;
+        break;
+    case 0:
+        if (!ctx->x86.hvm.restore.pvh_guest)
+        {
+            /* First 2MB are mapped as 4K for HVM guest */
+            order = (pfn > 0x1ff) ? S_PAGE_2MB_ORDER : 0;
+            break;
+        }
+    default:
+        order = S_PAGE_1GB_ORDER;
+    }
+
+    if ( ((ROUNDUP(pfn + 1, S_PAGE_1GB_ORDER) - 1) >= ctx->restore.p2m_size) &&
+         order == S_PAGE_1GB_ORDER )
+        order = S_PAGE_2MB_ORDER;
+
+    if ( ((ROUNDUP(pfn + 1, S_PAGE_2MB_ORDER) - 1) >= ctx->restore.p2m_size) &&
+         order == S_PAGE_2MB_ORDER )
+        order = 0;
+
+    return order;
+}
+
 /*
  * restore_ops function.  Sets extra hvm parameters and seeds the grant table.
  */
@@ -258,6 +342,8 @@ struct xc_sr_restore_ops restore_ops_x86_hvm =
     .localise_page   = x86_hvm_localise_page,
     .setup           = x86_hvm_setup,
     .process_record  = x86_hvm_process_record,
+    .guess_physmap   = x86_hvm_guess_physmap,
+    .get_physmap_order = x86_hvm_get_physmap_order,
     .static_data_complete = x86_static_data_complete,
     .stream_complete = x86_hvm_stream_complete,
     .cleanup         = x86_hvm_cleanup,
diff --git a/tools/libs/guest/xg_sr_restore_x86_pv.c b/tools/libs/guest/xg_sr_restore_x86_pv.c
index dc50b0f5a8..f8545f941a 100644
--- a/tools/libs/guest/xg_sr_restore_x86_pv.c
+++ b/tools/libs/guest/xg_sr_restore_x86_pv.c
@@ -59,7 +59,7 @@ static int expand_p2m(struct xc_sr_context *ctx, unsigned long max_pfn)
     ctx->x86.pv.max_pfn = max_pfn;
     for ( i = (old_max ? old_max + 1 : 0); i <= max_pfn; ++i )
     {
-        ctx->restore.ops.set_gfn(ctx, i, INVALID_MFN);
+        ctx->restore.ops.set_gfn(ctx, i, INVALID_MFN, 0);
         ctx->restore.ops.set_page_type(ctx, i, 0);
     }
 
@@ -947,9 +947,10 @@ static void x86_pv_set_page_type(struct xc_sr_context *ctx, xen_pfn_t pfn,
 
 /* restore_ops function. */
 static void x86_pv_set_gfn(struct xc_sr_context *ctx, xen_pfn_t pfn,
-                           xen_pfn_t mfn)
+                           xen_pfn_t mfn, unsigned int order)
 {
     assert(pfn <= ctx->x86.pv.max_pfn);
+    assert(!order);
 
     if ( ctx->x86.pv.width == sizeof(uint64_t) )
         /* 64 bit guest.  Need to expand INVALID_MFN for 32 bit toolstacks. */
@@ -1113,6 +1114,21 @@ static int x86_pv_process_record(struct xc_sr_context *ctx,
     }
 }
 
+/*
+ * There's no reliable heuristic which can predict the PV guest physmap.
+ * Therefore the 0 order always will be used.
+ */
+static void x86_pv_guess_physmap(struct xc_sr_context *ctx, unsigned int count,
+                                 const xen_pfn_t *pfns, const uint32_t *types)
+{
+}
+
+static int x86_pv_get_physmap_order(const struct xc_sr_context *ctx,
+                                    xen_pfn_t pfn)
+{
+    return 0;
+}
+
 /*
  * restore_ops function.  Update the vcpu context in Xen, pin the pagetables,
  * rewrite the p2m and seed the grant table.
@@ -1194,6 +1210,8 @@ struct xc_sr_restore_ops restore_ops_x86_pv =
     .localise_page   = x86_pv_localise_page,
     .setup           = x86_pv_setup,
     .process_record  = x86_pv_process_record,
+    .guess_physmap   = x86_pv_guess_physmap,
+    .get_physmap_order = x86_pv_get_physmap_order,
     .static_data_complete = x86_static_data_complete,
     .stream_complete = x86_pv_stream_complete,
     .cleanup         = x86_pv_cleanup,
-- 
2.34.1



Andrei Semenov | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions
w: vates.fr | xcp-ng.org | xen-orchestra.com

