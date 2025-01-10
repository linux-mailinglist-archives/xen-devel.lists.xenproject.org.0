Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798D1A09232
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 14:37:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869622.1281075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWFCt-0001ry-Sp; Fri, 10 Jan 2025 13:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869622.1281075; Fri, 10 Jan 2025 13:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWFCt-0001p4-Q8; Fri, 10 Jan 2025 13:37:47 +0000
Received: by outflank-mailman (input) for mailman id 869622;
 Fri, 10 Jan 2025 13:37:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qOMD=UC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tWFCr-0001Tj-Qk
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 13:37:45 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11371c7b-cf58-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 14:37:43 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1736516242403449.7374866615795;
 Fri, 10 Jan 2025 05:37:22 -0800 (PST)
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
X-Inumbo-ID: 11371c7b-cf58-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1736516246; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ge2D30IO27VeqKRXwsiy17cuGJGBbakTvc8CxdUtzOlVdW76LzLwwNRmctD0/hVq6BK/JtWkQyDsrZY235PkIerA3fhnMoW3fkaoJqffEwb7SG8F58FXTn/NK+Hc7P0BAIoJhIGu1y8fxpe8MfL6TFXQNglMRcBRJ5xMz0tcBWU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736516246; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zaIclZ+P2Am/QS9whECQfa2MB2jJxPcdNJMvnaSU7vM=; 
	b=GNx4exy1z6tTRp/E/vh3fiN0RiHbQhxukSPIIv8i8erugiQthxKaSTKafyHHFmdr9A8AYEtPGkKflz38Znek12cbNu1KKhUdu9aYbCWODrkPQHm7tG5QmcNWKCP9ZSUBvrqx1m+Ku1JKhHY+a5QAaT7sfhFat7iHzcI9mvTZigo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736516246;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=zaIclZ+P2Am/QS9whECQfa2MB2jJxPcdNJMvnaSU7vM=;
	b=CAI5rQGUA1zzYGkBfQahJwD4Vd9j4bDMPZIjf1i9GPsAP6fGef+QI5FUcc89Hp62
	4cWN3mdpCmKK6XcfwJICvNI06xgVzN9jm+S4MLTyd4vphdhg+6C3XNU2BkW4aaeXfJc
	7Q8tnDxOoZPf0Ujp/nK9VoTqFEHlhJBbWYYIH8Ck=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: openxt@googlegroups.com,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.clark6@baesystems.com>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] gnttab: introduce version agnostic macros
Date: Fri, 10 Jan 2025 13:37:10 +0000
Message-Id: <20250110133711.3958202-2-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110133711.3958202-1-dpsmith@apertussolutions.com>
References: <20250110133711.3958202-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Introduce a set of macros that abstract version specifics of the grant table
structures. This lays the ground work for being able to turn off v2 logic and
code.

Authored-by: Christopher Clark <christopher.clark6@baesystems.com>
Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/grant_table.c | 114 +++++++++++++++++----------------------
 1 file changed, 48 insertions(+), 66 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 6c77867f8c..f70a5333d8 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -181,6 +181,7 @@ static int cf_check parse_gnttab_max_maptrack_frames(const char *arg)
 #ifndef GNTTAB_MAX_VERSION
 #define GNTTAB_MAX_VERSION 2
 #endif
+#define get_gt_version(gt) ((gt)->gt_version)
 
 unsigned int __read_mostly opt_gnttab_max_version = GNTTAB_MAX_VERSION;
 static bool __read_mostly opt_transitive_grants = true;
@@ -310,16 +311,30 @@ nr_maptrack_frames(struct grant_table *t)
 #define SHGNT_PER_PAGE_V1 (PAGE_SIZE / sizeof(grant_entry_v1_t))
 #define shared_entry_v1(t, e) \
     ((t)->shared_v1[(e)/SHGNT_PER_PAGE_V1][(e)%SHGNT_PER_PAGE_V1])
+
+/* Operations providing a single interface agnostic to grant table version */
 #define SHGNT_PER_PAGE_V2 (PAGE_SIZE / sizeof(grant_entry_v2_t))
 #define shared_entry_v2(t, e) \
     ((t)->shared_v2[(e)/SHGNT_PER_PAGE_V2][(e)%SHGNT_PER_PAGE_V2])
+
+#define shared_entry_full_frame(gt, ref) \
+    ( get_gt_version(gt) == 1 ? shared_entry_v1((gt), (ref)).frame : \
+                                shared_entry_v2((gt), (ref)).full_page.frame )
+#define set_shared_entry(gt, ref, val) \
+    ( get_gt_version(gt) == 1 ? (shared_entry_v1((gt), (ref)).frame = (val)) : \
+                                (shared_entry_v2((gt), (ref)).full_page.frame = (val)) )
+#define status_addr(gt, ref, flags_addr) \
+    ( evaluate_nospec(get_gt_version(gt) == 1) ? (flags_addr) : &status_entry((gt), (ref)) )
+
 #define STGNT_PER_PAGE (PAGE_SIZE / sizeof(grant_status_t))
 #define status_entry(t, e) \
     ((t)->status[(e)/STGNT_PER_PAGE][(e)%STGNT_PER_PAGE])
+
+
 static grant_entry_header_t *
 shared_entry_header(struct grant_table *t, grant_ref_t ref)
 {
-    switch ( t->gt_version )
+    switch ( get_gt_version(t) )
     {
     case 1:
         /* Returned values should be independent of speculative execution */
@@ -709,7 +724,7 @@ get_maptrack_handle(
 /* Number of grant table entries. Caller must hold d's grant table lock. */
 static unsigned int nr_grant_entries(struct grant_table *gt)
 {
-    switch ( gt->gt_version )
+    switch ( get_gt_version(gt) )
     {
 #define f2e(nr, ver) (((nr) << PAGE_SHIFT) / sizeof(grant_entry_v##ver##_t))
     case 1:
@@ -1090,23 +1105,20 @@ map_grant_ref(
     }
 
     /* Make sure we do not access memory speculatively */
-    status = evaluate_nospec(rgt->gt_version == 1) ? &shah->flags
-                                                   : &status_entry(rgt, ref);
+    status = status_addr(rgt, ref, &shah->flags);
 
     if ( !act->pin ||
          (!(op->flags & GNTMAP_readonly) &&
           !(act->pin & (GNTPIN_hstw_mask|GNTPIN_devw_mask))) )
     {
-        if ( (rc = _set_status(shah, status, rd, rgt->gt_version, act,
+        if ( (rc = _set_status(shah, status, rd, get_gt_version(rgt), act,
                                op->flags & GNTMAP_readonly, 1,
                                ld->domain_id)) != GNTST_okay )
             goto act_release_out;
 
         if ( !act->pin )
         {
-            unsigned long gfn = evaluate_nospec(rgt->gt_version == 1) ?
-                                shared_entry_v1(rgt, ref).frame :
-                                shared_entry_v2(rgt, ref).full_page.frame;
+            unsigned long gfn = shared_entry_full_frame(rgt, ref);
 
             rc = get_paged_frame(gfn, &mfn, &pg,
                                  op->flags & GNTMAP_readonly, rd);
@@ -1603,11 +1615,7 @@ unmap_common_complete(struct gnttab_unmap_common *op)
 
     act = active_entry_acquire(rgt, op->ref);
     sha = shared_entry_header(rgt, op->ref);
-
-    if ( evaluate_nospec(rgt->gt_version == 1) )
-        status = &sha->flags;
-    else
-        status = &status_entry(rgt, op->ref);
+    status = status_addr(rgt, op->ref, &sha->flags);
 
     pg = !is_iomem_page(act->mfn) ? mfn_to_page(op->mfn) : NULL;
 
@@ -1930,7 +1938,7 @@ gnttab_grow_table(struct domain *d, unsigned int req_nr_frames)
     }
 
     /* Status pages - version 2 */
-    if ( evaluate_nospec(gt->gt_version > 1) )
+    if ( evaluate_nospec(get_gt_version(gt) > 1) )
     {
         if ( gnttab_populate_status_frames(d, gt, req_nr_frames) )
             goto shared_alloc_failed;
@@ -2105,7 +2113,7 @@ gnttab_setup_table(
     }
 
     if ( (op.nr_frames > nr_grant_frames(gt) ||
-          ((gt->gt_version > 1) &&
+          ((get_gt_version(gt) > 1) &&
            (grant_to_status_frames(op.nr_frames) > nr_status_frames(gt)))) &&
          gnttab_grow_table(d, op.nr_frames) )
     {
@@ -2267,6 +2275,7 @@ gnttab_transfer(
     mfn_t mfn;
     unsigned int max_bitsize;
     struct active_grant_entry *act;
+    unsigned long frame;
 
     if ( !opt_grant_transfer )
         return -EOPNOTSUPP;
@@ -2354,7 +2363,7 @@ gnttab_transfer(
         }
 
         max_bitsize = domain_clamp_alloc_bitsize(
-            e, e->grant_table->gt_version > 1 || paging_mode_translate(e)
+            e, get_gt_version(e->grant_table) > 1 || paging_mode_translate(e)
                ? BITS_PER_LONG + PAGE_SHIFT : 32 + PAGE_SHIFT);
         if ( max_bitsize < BITS_PER_LONG + PAGE_SHIFT &&
              (mfn_x(mfn) >> (max_bitsize - PAGE_SHIFT)) )
@@ -2452,22 +2461,12 @@ gnttab_transfer(
         grant_read_lock(e->grant_table);
         act = active_entry_acquire(e->grant_table, gop.ref);
 
-        if ( evaluate_nospec(e->grant_table->gt_version == 1) )
-        {
-            grant_entry_v1_t *sha = &shared_entry_v1(e->grant_table, gop.ref);
+        frame = shared_entry_full_frame(e->grant_table, gop.ref);
+        rc = guest_physmap_add_page(e, _gfn(frame), mfn, 0);
 
-            rc = guest_physmap_add_page(e, _gfn(sha->frame), mfn, 0);
-            if ( !paging_mode_translate(e) )
-                sha->frame = mfn_x(mfn);
-        }
-        else
-        {
-            grant_entry_v2_t *sha = &shared_entry_v2(e->grant_table, gop.ref);
+        if ( !paging_mode_translate(e) )
+            set_shared_entry(e->grant_table, gop.ref, mfn_x(mfn));
 
-            rc = guest_physmap_add_page(e, _gfn(sha->full_page.frame), mfn, 0);
-            if ( !paging_mode_translate(e) )
-                sha->full_page.frame = mfn_x(mfn);
-        }
         smp_wmb();
         shared_entry_header(e->grant_table, gop.ref)->flags |=
             GTF_transfer_completed;
@@ -2512,16 +2511,15 @@ release_grant_for_copy(
     act = active_entry_acquire(rgt, gref);
     sha = shared_entry_header(rgt, gref);
     mfn = act->mfn;
+    status = status_addr(rgt, gref, &sha->flags);
 
-    if ( evaluate_nospec(rgt->gt_version == 1) )
+    if ( evaluate_nospec(get_gt_version(rgt) == 1) )
     {
-        status = &sha->flags;
         td = rd;
         trans_gref = gref;
     }
     else
     {
-        status = &status_entry(rgt, gref);
         td = (act->src_domid == rd->domain_id)
              ? rd : knownalive_domain_from_domid(act->src_domid);
         trans_gref = act->trans_gref;
@@ -2573,7 +2571,6 @@ acquire_grant_for_copy(
     struct active_grant_entry *act;
     grant_status_t *status;
     uint32_t old_pin;
-    domid_t trans_domid;
     grant_ref_t trans_gref;
     struct domain *td;
     mfn_t grant_mfn;
@@ -2597,6 +2594,7 @@ acquire_grant_for_copy(
     /* This call also ensures the above check cannot be passed speculatively */
     shah = shared_entry_header(rgt, gref);
     act = active_entry_acquire(rgt, gref);
+    old_pin = act->pin;
 
     /* If already pinned, check the active domid and avoid refcnt overflow. */
     if ( act->pin &&
@@ -2610,7 +2608,7 @@ acquire_grant_for_copy(
         goto unlock_out;
     }
 
-    if ( evaluate_nospec(rgt->gt_version == 1) )
+    if ( evaluate_nospec(get_gt_version(rgt) == 1) )
     {
         sha2 = NULL;
         status = &shah->flags;
@@ -2621,9 +2619,10 @@ acquire_grant_for_copy(
         status = &status_entry(rgt, gref);
     }
 
-    old_pin = act->pin;
     if ( sha2 && (shah->flags & GTF_type_mask) == GTF_transitive )
     {
+        domid_t trans_domid;
+
         if ( (!old_pin || (!readonly &&
                            !(old_pin & (GNTPIN_devw_mask|GNTPIN_hstw_mask)))) &&
              (rc = _set_status_v2(shah, status, rd, act, readonly, 0,
@@ -2752,7 +2751,7 @@ acquire_grant_for_copy(
     else if ( !old_pin ||
               (!readonly && !(old_pin & (GNTPIN_devw_mask|GNTPIN_hstw_mask))) )
     {
-        if ( (rc = _set_status(shah, status, rd, rgt->gt_version, act,
+        if ( (rc = _set_status(shah, status, rd, get_gt_version(rgt), act,
                                readonly, 0, ldom)) != GNTST_okay )
              goto unlock_out;
 
@@ -3406,7 +3405,7 @@ gnttab_get_version(XEN_GUEST_HANDLE_PARAM(gnttab_get_version_t) uop)
         return rc;
     }
 
-    op.version = d->grant_table->gt_version;
+    op.version = get_gt_version(d->grant_table);
 
     rcu_unlock_domain(d);
 
@@ -3464,7 +3463,7 @@ swap_grant_ref(grant_ref_t ref_a, grant_ref_t ref_b)
         goto out;
     }
 
-    if ( evaluate_nospec(gt->gt_version == 1) )
+    if ( evaluate_nospec(get_gt_version(gt) == 1) )
     {
         grant_entry_v1_t shared;
 
@@ -3878,10 +3877,7 @@ int gnttab_release_mappings(struct domain *d)
 
         act = active_entry_acquire(rgt, ref);
         sha = shared_entry_header(rgt, ref);
-        if ( rgt->gt_version == 1 )
-            status = &sha->flags;
-        else
-            status = &status_entry(rgt, ref);
+        status = status_addr(rgt, ref, &sha->flags);
 
         pg = !is_iomem_page(act->mfn) ? mfn_to_page(act->mfn) : NULL;
 
@@ -4047,11 +4043,11 @@ int mem_sharing_gref_to_gfn(struct grant_table *gt, grant_ref_t ref,
 
     grant_read_lock(gt);
 
-    if ( gt->gt_version < 1 )
+    if ( get_gt_version(gt) < 1 )
         rc = -EINVAL;
     else if ( ref >= nr_grant_entries(gt) )
         rc = -ENOENT;
-    else if ( evaluate_nospec(gt->gt_version == 1) )
+    else if ( evaluate_nospec(get_gt_version(gt) == 1) )
     {
         const grant_entry_v1_t *sha1 = &shared_entry_v1(gt, ref);
 
@@ -4072,12 +4068,7 @@ int mem_sharing_gref_to_gfn(struct grant_table *gt, grant_ref_t ref,
     if ( !rc && (flags & GTF_type_mask) != GTF_permit_access )
         rc = -ENXIO;
     else if ( !rc && status )
-    {
-        if ( evaluate_nospec(gt->gt_version == 1) )
-            *status = flags;
-        else
-            *status = status_entry(gt, ref);
-    }
+        *status = *status_addr(gt, ref, &flags);
 
     grant_read_unlock(gt);
 
@@ -4131,7 +4122,7 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
 {
     const struct grant_table *gt = d->grant_table;
 
-    ASSERT(gt->gt_version != 0);
+    ASSERT(get_gt_version(gt) != 0);
 
     if ( idx >= nr_grant_frames(gt) )
     {
@@ -4204,7 +4195,7 @@ int gnttab_acquire_resource(
         break;
 
     case XENMEM_resource_grant_table_id_status:
-        if ( gt->gt_version != 2 )
+        if ( get_gt_version(gt) != 2 )
             break;
 
         /* Check that void ** is a suitable representation for gt->status. */
@@ -4256,7 +4247,7 @@ int gnttab_map_frame(struct domain *d, unsigned long idx, gfn_t gfn, mfn_t *mfn)
 
     grant_write_lock(gt);
 
-    if ( evaluate_nospec(gt->gt_version == 2) && (idx & XENMAPIDX_grant_table_status) )
+    if ( evaluate_nospec(get_gt_version(gt) == 2) && (idx & XENMAPIDX_grant_table_status) )
     {
         idx &= ~XENMAPIDX_grant_table_status;
         status = true;
@@ -4299,7 +4290,7 @@ static void gnttab_usage_print(struct domain *rd)
 
     printk("grant-table for remote d%d (v%u)\n"
            "  %u frames (%u max), %u maptrack frames (%u max)\n",
-           rd->domain_id, gt->gt_version,
+           rd->domain_id, get_gt_version(gt),
            nr_grant_frames(gt), gt->max_grant_frames,
            nr_maptrack_frames(gt), gt->max_maptrack_frames);
 
@@ -4319,17 +4310,8 @@ static void gnttab_usage_print(struct domain *rd)
         }
 
         sha = shared_entry_header(gt, ref);
-
-        if ( gt->gt_version == 1 )
-        {
-            status = sha->flags;
-            frame = shared_entry_v1(gt, ref).frame;
-        }
-        else
-        {
-            frame = shared_entry_v2(gt, ref).full_page.frame;
-            status = status_entry(gt, ref);
-        }
+        frame = shared_entry_full_frame(gt, ref);
+        status = *status_addr(gt, ref, &sha->flags);
 
         first = 0;
 
-- 
2.34.1


