Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C459F5AF757
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400415.642167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSt-00051n-0G; Tue, 06 Sep 2022 21:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400415.642167; Tue, 06 Sep 2022 21:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSs-0004uW-Qz; Tue, 06 Sep 2022 21:50:38 +0000
Received: by outflank-mailman (input) for mailman id 400415;
 Tue, 06 Sep 2022 21:50:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8/AC=ZJ=bounce.vates.fr=bounce-md_30504962.631718cf.v1-8ccb6ebb1d8746c59fc358783ad67ab1@srs-se1.protection.inumbo.net>)
 id 1oVgIV-0000Cs-Im
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:39:55 +0000
Received: from mail136-23.atl41.mandrillapp.com
 (mail136-23.atl41.mandrillapp.com [198.2.136.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e242cf91-2dc9-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 11:54:23 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-23.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4MMLMM6jwpz1XMpv1
 for <xen-devel@lists.xenproject.org>; Tue,  6 Sep 2022 09:54:23 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8ccb6ebb1d8746c59fc358783ad67ab1; Tue, 06 Sep 2022 09:54:23 +0000
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
X-Inumbo-ID: e242cf91-2dc9-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1662458063; x=1662760463; i=andrei.semenov@vates.fr;
	bh=9M3+qLiWJriRB2iQVM16e9Wo2zoVHPoQDkx5vj3yF7g=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mTKiS1YJJO9oWbo5fP2flAiNRZAbs764ovofQu4SwmSqn5ZWs5+Sdn7RJdJY/00Ac
	 DjMemgAr1Jt2f/br6utVVFIoU9crLUFM2D4EYj2zJ4/NnEHJE2MeGcGmRxFI14t/3m
	 qfdtZ/yClmm2bh7kexV/SEdeuzRpTzABXhuC6+Eo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1662458063; h=From : 
 Subject : To : Cc : Message-Id : In-Reply-To : References : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=9M3+qLiWJriRB2iQVM16e9Wo2zoVHPoQDkx5vj3yF7g=; 
 b=gjWmycH6CEwrpfiB3zwMaU/QSoFfJK3wtu/hv2SbUeXbCJNGwQ20xIr8hIrB195GNlh0Bb
 oe0EJK61jWYXowjy/eWAHTMIGuQXid8iunbsE1q2CjXpiRJjoz8XbpYoAQFk3z59jRa1hmDn
 fc0PKVBfS/RvexpzBCSd26GcYAty0=
From: Andrei Semenov <andrei.semenov@vates.fr>
Subject: [PATCH v2 1/2] live migration: do not use deffered bitmap when inappropriate
X-Mailer: git-send-email 2.34.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 5cd6f291-6f11-459d-97c0-d09b574c3896
X-Bm-Transport-Timestamp: 1662458062869
To: andrei.semenov@vates.fr, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Message-Id: <1e7862a0d83c61b7550747591275c38e87d4fbd2.1662457291.git.andrei.semenov@vates.fr>
In-Reply-To: <cover.1662457291.git.andrei.semenov@vates.fr>
References: <cover.1662457291.git.andrei.semenov@vates.fr>
X-Report-Abuse: Please forward a copy of this message, including all headers, to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here: http://mandrillapp.com/contact/abuse?id=30504962.8ccb6ebb1d8746c59fc358783ad67ab1
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20220906:md
Date: Tue, 06 Sep 2022 09:54:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Use deffered bitmap only in PV guests context as it not used for HVM guests.
This allow to reduce memory pressure on domain0 while migrating very large
(memory wise) HVM guests.

Signed-off-by: Andrei Semenov <andrei.semenov@vates.fr>
---
 tools/libs/guest/xg_sr_common.h       | 26 ++++++++++++++++--
 tools/libs/guest/xg_sr_save.c         | 23 +++++++---------
 tools/libs/guest/xg_sr_save_x86_hvm.c | 21 +++++++++++++++
 tools/libs/guest/xg_sr_save_x86_pv.c  | 39 +++++++++++++++++++++++++++
 4 files changed, 93 insertions(+), 16 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 36d45ef56f..941e24d7b7 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -96,6 +96,24 @@ struct xc_sr_save_ops
      */
     int (*check_vm_state)(struct xc_sr_context *ctx);
 
+    /**
+     * For some reasons the page can't be sent for the moment. Postpone this
+     * send to the later stage when domain is suspended.
+     */
+    int (*defer_page)(struct xc_sr_context *ctx, xen_pfn_t pfn);
+
+    /**
+     *  Merge all deferred pages with the dirty pages bitmap (in order to be
+     *  sent).
+     */
+    int (*merge_deferred)(const struct xc_sr_context *ctx,
+                          unsigned long *bitmap, unsigned long *count);
+
+    /**
+     *  Deferred pages was successfully sent. Reset all associated information.
+     */
+    int (*reset_deferred)(struct xc_sr_context *ctx);
+
     /**
      * Clean up the local environment.  Will be called exactly once, either
      * after a successful save, or upon encountering an error.
@@ -243,8 +261,6 @@ struct xc_sr_context
 
             xen_pfn_t *batch_pfns;
             unsigned int nr_batch_pfns;
-            unsigned long *deferred_pages;
-            unsigned long nr_deferred_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
         } save;
 
@@ -349,6 +365,12 @@ struct xc_sr_context
 
                 union
                 {
+                    struct
+                    {
+                        unsigned long *deferred_pages;
+                        unsigned long nr_deferred_pages;
+                    } save;
+
                     struct
                     {
                         /* State machine for the order of received records. */
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 9853d8d846..602b18488d 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -132,8 +132,7 @@ static int write_batch(struct xc_sr_context *ctx)
         /* Likely a ballooned page. */
         if ( mfns[i] == INVALID_MFN )
         {
-            set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
-            ++ctx->save.nr_deferred_pages;
+            ctx->save.ops.defer_page(ctx, ctx->save.batch_pfns[i]);
         }
     }
 
@@ -192,8 +191,7 @@ static int write_batch(struct xc_sr_context *ctx)
             {
                 if ( rc == -1 && errno == EAGAIN )
                 {
-                    set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
-                    ++ctx->save.nr_deferred_pages;
+                    ctx->save.ops.defer_page(ctx, ctx->save.batch_pfns[i]);
                     types[i] = XEN_DOMCTL_PFINFO_XTAB;
                     --nr_pages;
                 }
@@ -641,6 +639,7 @@ static int suspend_and_send_dirty(struct xc_sr_context *ctx)
     xc_interface *xch = ctx->xch;
     xc_shadow_op_stats_t stats = { 0, ctx->save.p2m_size };
     char *progress_str = NULL;
+    unsigned long merged;
     int rc;
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->save.dirty_bitmap_hbuf);
@@ -669,7 +668,7 @@ static int suspend_and_send_dirty(struct xc_sr_context *ctx)
     else
         xc_set_progress_prefix(xch, "Checkpointed save");
 
-    bitmap_or(dirty_bitmap, ctx->save.deferred_pages, ctx->save.p2m_size);
+    ctx->save.ops.merge_deferred(ctx, dirty_bitmap, &merged);
 
     if ( !ctx->save.live && ctx->stream_type == XC_STREAM_COLO )
     {
@@ -681,12 +680,11 @@ static int suspend_and_send_dirty(struct xc_sr_context *ctx)
         }
     }
 
-    rc = send_dirty_pages(ctx, stats.dirty_count + ctx->save.nr_deferred_pages);
+    rc = send_dirty_pages(ctx, stats.dirty_count + merged);
     if ( rc )
         goto out;
 
-    bitmap_clear(ctx->save.deferred_pages, ctx->save.p2m_size);
-    ctx->save.nr_deferred_pages = 0;
+    ctx->save.ops.reset_deferred(ctx);
 
  out:
     xc_set_progress_prefix(xch, NULL);
@@ -805,18 +803,16 @@ static int setup(struct xc_sr_context *ctx)
         xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
     ctx->save.batch_pfns = malloc(MAX_BATCH_SIZE *
                                   sizeof(*ctx->save.batch_pfns));
-    ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
 
-    if ( !ctx->save.batch_pfns || !dirty_bitmap || !ctx->save.deferred_pages )
+    if ( !ctx->save.batch_pfns || !dirty_bitmap )
     {
-        ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
-              " deferred pages");
+        ERROR("Unable to allocate memory for dirty bitmaps, batch pfns");
         rc = -1;
         errno = ENOMEM;
         goto err;
     }
 
-    rc = 0;
+    rc = ctx->save.ops.reset_deferred(ctx);
 
  err:
     return rc;
@@ -837,7 +833,6 @@ static void cleanup(struct xc_sr_context *ctx)
 
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
-    free(ctx->save.deferred_pages);
     free(ctx->save.batch_pfns);
 }
 
diff --git a/tools/libs/guest/xg_sr_save_x86_hvm.c b/tools/libs/guest/xg_sr_save_x86_hvm.c
index 1634a7bc43..3c762a0af0 100644
--- a/tools/libs/guest/xg_sr_save_x86_hvm.c
+++ b/tools/libs/guest/xg_sr_save_x86_hvm.c
@@ -211,6 +211,24 @@ static int x86_hvm_end_of_checkpoint(struct xc_sr_context *ctx)
     return 0;
 }
 
+static int x86_hvm_defer_page(struct xc_sr_context *ctx, xen_pfn_t pfn)
+{
+    return 0;
+}
+
+static int x86_hvm_merge_deferred(const struct xc_sr_context *ctx,
+                                 unsigned long *bitmap, unsigned long *count)
+{
+    *count = 0;
+
+    return 0;
+}
+
+static int x86_hvm_reset_deferred(struct xc_sr_context *ctx)
+{
+    return 0;
+}
+
 static int x86_hvm_cleanup(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
@@ -237,6 +255,9 @@ struct xc_sr_save_ops save_ops_x86_hvm =
     .start_of_checkpoint = x86_hvm_start_of_checkpoint,
     .end_of_checkpoint   = x86_hvm_end_of_checkpoint,
     .check_vm_state      = x86_hvm_check_vm_state,
+    .defer_page          = x86_hvm_defer_page,
+    .merge_deferred      = x86_hvm_merge_deferred,
+    .reset_deferred      = x86_hvm_reset_deferred,
     .cleanup             = x86_hvm_cleanup,
 };
 
diff --git a/tools/libs/guest/xg_sr_save_x86_pv.c b/tools/libs/guest/xg_sr_save_x86_pv.c
index 4964f1f7b8..5fdc7e9590 100644
--- a/tools/libs/guest/xg_sr_save_x86_pv.c
+++ b/tools/libs/guest/xg_sr_save_x86_pv.c
@@ -1031,6 +1031,7 @@ static int x86_pv_normalise_page(struct xc_sr_context *ctx, xen_pfn_t type,
  */
 static int x86_pv_setup(struct xc_sr_context *ctx)
 {
+    xc_interface *xch = ctx->xch;
     int rc;
 
     rc = x86_pv_domain_info(ctx);
@@ -1049,6 +1050,15 @@ static int x86_pv_setup(struct xc_sr_context *ctx)
     if ( rc )
         return rc;
 
+    ctx->x86.pv.save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
+
+    if (!ctx->x86.pv.save.deferred_pages)
+    {
+        ERROR("Unable to allocate memory for deferred pages");
+        errno = ENOMEM;
+        return -1;
+    }
+
     return 0;
 }
 
@@ -1116,9 +1126,35 @@ static int x86_pv_check_vm_state(struct xc_sr_context *ctx)
     return x86_pv_check_vm_state_p2m_list(ctx);
 }
 
+static int x86_pv_defer_page(struct xc_sr_context *ctx, xen_pfn_t pfn)
+{
+    set_bit(pfn, ctx->x86.pv.save.deferred_pages);
+    ++ctx->x86.pv.save.nr_deferred_pages;
+
+    return 0;
+}
+
+static int x86_pv_merge_deferred(const struct xc_sr_context *ctx,
+                                 unsigned long *bitmap, unsigned long *count)
+{
+    bitmap_or(bitmap, ctx->x86.pv.save.deferred_pages, ctx->save.p2m_size);
+    *count = ctx->x86.pv.save.nr_deferred_pages;
+
+    return 0;
+}
+
+static int x86_pv_reset_deferred(struct xc_sr_context *ctx)
+{
+    bitmap_clear(ctx->x86.pv.save.deferred_pages, ctx->save.p2m_size);
+    ctx->x86.pv.save.nr_deferred_pages = 0;
+
+    return 0;
+}
+
 static int x86_pv_cleanup(struct xc_sr_context *ctx)
 {
     free(ctx->x86.pv.p2m_pfns);
+    free(ctx->x86.pv.save.deferred_pages);
 
     if ( ctx->x86.pv.p2m )
         munmap(ctx->x86.pv.p2m, ctx->x86.pv.p2m_frames * PAGE_SIZE);
@@ -1142,6 +1178,9 @@ struct xc_sr_save_ops save_ops_x86_pv =
     .start_of_checkpoint = x86_pv_start_of_checkpoint,
     .end_of_checkpoint   = x86_pv_end_of_checkpoint,
     .check_vm_state      = x86_pv_check_vm_state,
+    .defer_page          = x86_pv_defer_page,
+    .merge_deferred      = x86_pv_merge_deferred,
+    .reset_deferred      = x86_pv_reset_deferred,
     .cleanup             = x86_pv_cleanup,
 };
 
-- 
2.34.1



Andrei Semenov | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions
w: vates.fr | xcp-ng.org | xen-orchestra.com

