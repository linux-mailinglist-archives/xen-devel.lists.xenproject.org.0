Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F13BC3A9BAB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 15:08:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143063.263899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVH3-0000IN-HS; Wed, 16 Jun 2021 13:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143063.263899; Wed, 16 Jun 2021 13:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVH3-0000Fp-Df; Wed, 16 Jun 2021 13:08:05 +0000
Received: by outflank-mailman (input) for mailman id 143063;
 Wed, 16 Jun 2021 13:08:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV2I-00075D-9Y
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:52:50 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6b65d89-6720-4ffd-a184-2f781514df3e;
 Wed, 16 Jun 2021 12:51:55 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpotmV
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:50 +0200 (CEST)
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
X-Inumbo-ID: e6b65d89-6720-4ffd-a184-2f781514df3e
ARC-Seal: i=1; a=rsa-sha256; t=1623847910; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=FBHkTgZXolibcwjpysZzh8M2qH2k+aSKsoY4a7M4Oow0Xs9T0Wm2Haj6mmlIlJy0Kr
    dDh16bRAqyGU1vzTj7yR6KTbR1apuQAYKJAVc/lS2CqovzKJUO5BGO74TihGU2JH/SAn
    0Notaabw9CAj4nbXVpSUixRlvcFdE8CvTynRchOxS6LW1Q9v0F5HPs8HFnTzKPx++GAX
    5i/Y0SdT12lbo6Gg4LKX5i5Np04j26SPb3jqYZNvTjTgND0qTYi6j2q2l7khuhOd67HJ
    6gi4E8PzZlZLm4wk17b9iQgZgXW6cTr6g6XkshHIE6acYVHMc2b/QLOHHleBNvki+dld
    JRxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847910;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=b3yBWw7yU2epDTrjSW6D9+v+xfIfJnT+XxyS94GOcl8=;
    b=H2SI/FxhNxisGvyhqeDCfOM2s2MYMvmWSqLHovX+WYbylzW+XxiEfLT5On1kI+bD3v
    TL7TTzr+XWcg5KdutNQZAh4R6/x2oWT1XKsYfwYq3FjRNkudN4Tx7/vVvJK2fp/SNQdd
    mrcIoUA1YZJzecTc/O+4fiqxMOG6oLHzjsOCIrU03HG21nYXYMzumBZfpNhQjG90FcfT
    Nc+lsDGudDPX0EPkbgpMfHFyFlgY2ay17tAfs21gWR/JKyIZ50yqet+E3vNAOoP3CbKe
    jPXV9MVdAmPgHOiItbMB+3beqaGSdAQ6UnDJHRlwivJrEMH5zDVgfzJXA0Xca/p8QwIt
    dj0A==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847910;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=b3yBWw7yU2epDTrjSW6D9+v+xfIfJnT+XxyS94GOcl8=;
    b=Ln01R/NUGT1zY8Rr1c8rijll3Cl+j/E0G1PEoVLjpe3cDyQ1pIxIZ3rY/1lsOfI7i8
    PUWanNj6lNj52oXIq53XVA4cAJgTtZXVrT4O8KnaF+EBi9oS0K1wyalqOqiKX1uoCuTG
    98Xi5sWV8EEWby7BhXjt8LW8pHY75yUmQ3QSVUX7OqHJ5Ha3CDWL/Jb9n/gZ7+SGhMK+
    RmBxTjuKgmX0IixB+cuLPQVCnPvb2ILoLMzcq0Iy9sT93gm/iJICw9DOSw1wksBsGEiV
    LAqolLLUwXC+hERsAt5Q7A38e1Mhh6E4cyFUQNze3RASCjO1km6MXqR7Gph9nHcaUCYw
    9Q9Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5l+Vz7FJgt8+TgOd9sTrMwXjWWExsBKQCrpnqhqg=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210616 35/36] tools: use sr_bitmap for populated_pfns
Date: Wed, 16 Jun 2021 14:51:28 +0200
Message-Id: <20210616125129.26563-36-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Olaf Hering <olaf@aepfle.de>

v02:
- remove xg_ prefix from called functions
---
 tools/libs/saverestore/common.h          | 21 +++++++-
 tools/libs/saverestore/restore.c         | 69 ------------------------
 tools/libs/saverestore/restore_x86_hvm.c |  9 ++++
 tools/libs/saverestore/restore_x86_pv.c  |  7 +++
 4 files changed, 35 insertions(+), 71 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 43aa1a7b86..43a31f9aa5 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -403,8 +403,7 @@ struct xc_sr_context
             uint32_t     xenstore_domid,  console_domid;
 
             /* Bitmap of currently populated PFNs during restore. */
-            unsigned long *populated_pfns;
-            xen_pfn_t max_populated_pfn;
+            struct sr_bitmap populated_pfns;
 
             /* Sender has invoked verify mode on the stream. */
             bool verify;
@@ -629,6 +628,24 @@ static inline bool page_type_has_stream_data(uint32_t type)
     }
     return ret;
 }
+
+static inline bool pfn_is_populated(struct xc_sr_context *ctx, xen_pfn_t pfn)
+{
+    return sr_test_bit(pfn, &ctx->restore.populated_pfns);
+}
+
+static inline int pfn_set_populated(struct xc_sr_context *ctx, xen_pfn_t pfn)
+{
+    xc_interface *xch = ctx->xch;
+
+    if ( sr_set_bit(pfn, &ctx->restore.populated_pfns) == false )
+    {
+        PERROR("Failed to realloc populated_pfns bitmap");
+        errno = ENOMEM;
+        return -1;
+    }
+    return 0;
+}
 #endif
 /*
  * Local variables:
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index d0148606bf..8f7bce2585 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -71,64 +71,6 @@ static int read_headers(struct xc_sr_context *ctx)
     return 0;
 }
 
-/*
- * Is a pfn populated?
- */
-static bool pfn_is_populated(const struct xc_sr_context *ctx, xen_pfn_t pfn)
-{
-    if ( pfn > ctx->restore.max_populated_pfn )
-        return false;
-    return test_bit(pfn, ctx->restore.populated_pfns);
-}
-
-/*
- * Set a pfn as populated, expanding the tracking structures if needed. To
- * avoid realloc()ing too excessively, the size increased to the nearest power
- * of two large enough to contain the required pfn.
- */
-static int pfn_set_populated(struct xc_sr_context *ctx, xen_pfn_t pfn)
-{
-    xc_interface *xch = ctx->xch;
-
-    if ( pfn > ctx->restore.max_populated_pfn )
-    {
-        xen_pfn_t new_max;
-        size_t old_sz, new_sz;
-        unsigned long *p;
-
-        /* Round up to the nearest power of two larger than pfn, less 1. */
-        new_max = pfn;
-        new_max |= new_max >> 1;
-        new_max |= new_max >> 2;
-        new_max |= new_max >> 4;
-        new_max |= new_max >> 8;
-        new_max |= new_max >> 16;
-#ifdef __x86_64__
-        new_max |= new_max >> 32;
-#endif
-
-        old_sz = bitmap_size(ctx->restore.max_populated_pfn + 1);
-        new_sz = bitmap_size(new_max + 1);
-        p = realloc(ctx->restore.populated_pfns, new_sz);
-        if ( !p )
-        {
-            ERROR("Failed to realloc populated bitmap");
-            errno = ENOMEM;
-            return -1;
-        }
-
-        memset((uint8_t *)p + old_sz, 0x00, new_sz - old_sz);
-
-        ctx->restore.populated_pfns    = p;
-        ctx->restore.max_populated_pfn = new_max;
-    }
-
-    assert(!test_bit(pfn, ctx->restore.populated_pfns));
-    set_bit(pfn, ctx->restore.populated_pfns);
-
-    return 0;
-}
-
 /*
  * Given a set of pfns, obtain memory from Xen to fill the physmap for the
  * unpopulated subset.  If types is NULL, no page type checking is performed
@@ -929,16 +871,6 @@ static int setup(struct xc_sr_context *ctx)
     if ( rc )
         goto err;
 
-    ctx->restore.max_populated_pfn = (32 * 1024 / 4) - 1;
-    ctx->restore.populated_pfns = bitmap_alloc(
-        ctx->restore.max_populated_pfn + 1);
-    if ( !ctx->restore.populated_pfns )
-    {
-        ERROR("Unable to allocate memory for populated_pfns bitmap");
-        rc = -1;
-        goto err;
-    }
-
     ctx->restore.buffered_records = malloc(
         DEFAULT_BUF_RECORDS * sizeof(struct xc_sr_record));
     if ( !ctx->restore.buffered_records )
@@ -977,7 +909,6 @@ static void cleanup(struct xc_sr_context *ctx)
 
     free(ctx->restore.m);
     free(ctx->restore.buffered_records);
-    free(ctx->restore.populated_pfns);
 
     if ( ctx->restore.ops.cleanup(ctx) )
         PERROR("Failed to clean up");
diff --git a/tools/libs/saverestore/restore_x86_hvm.c b/tools/libs/saverestore/restore_x86_hvm.c
index bd63bd2818..97e7e0f48c 100644
--- a/tools/libs/saverestore/restore_x86_hvm.c
+++ b/tools/libs/saverestore/restore_x86_hvm.c
@@ -136,6 +136,7 @@ static int x86_hvm_localise_page(struct xc_sr_context *ctx,
 static int x86_hvm_setup(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
+    unsigned long max_pfn;
 
     if ( ctx->restore.guest_type != DHDR_TYPE_X86_HVM )
     {
@@ -161,6 +162,13 @@ static int x86_hvm_setup(struct xc_sr_context *ctx)
     }
 #endif
 
+    max_pfn = max(ctx->restore.p2m_size, ctx->dominfo.max_memkb >> (PAGE_SHIFT-10));
+    if ( !sr_bitmap_expand(&ctx->restore.populated_pfns, max_pfn) )
+    {
+        PERROR("Unable to allocate memory for populated_pfns bitmap");
+        return -1;
+    }
+
     return 0;
 }
 
@@ -241,6 +249,7 @@ static int x86_hvm_stream_complete(struct xc_sr_context *ctx)
 
 static int x86_hvm_cleanup(struct xc_sr_context *ctx)
 {
+    sr_bitmap_free(&ctx->restore.populated_pfns);
     free(ctx->x86.hvm.restore.context.ptr);
 
     free(ctx->x86.restore.cpuid.ptr);
diff --git a/tools/libs/saverestore/restore_x86_pv.c b/tools/libs/saverestore/restore_x86_pv.c
index 96608e5231..c73a3cd99f 100644
--- a/tools/libs/saverestore/restore_x86_pv.c
+++ b/tools/libs/saverestore/restore_x86_pv.c
@@ -1060,6 +1060,12 @@ static int x86_pv_setup(struct xc_sr_context *ctx)
     if ( rc )
         return rc;
 
+    if ( !sr_bitmap_expand(&ctx->restore.populated_pfns, 32 * 1024 / 4) )
+    {
+        PERROR("Unable to allocate memory for populated_pfns bitmap");
+        return -1;
+    }
+
     ctx->x86.pv.restore.nr_vcpus = ctx->dominfo.max_vcpu_id + 1;
     ctx->x86.pv.restore.vcpus = calloc(sizeof(struct xc_sr_x86_pv_restore_vcpu),
                                        ctx->x86.pv.restore.nr_vcpus);
@@ -1153,6 +1159,7 @@ static int x86_pv_stream_complete(struct xc_sr_context *ctx)
  */
 static int x86_pv_cleanup(struct xc_sr_context *ctx)
 {
+    sr_bitmap_free(&ctx->restore.populated_pfns);
     free(ctx->x86.pv.p2m);
     free(ctx->x86.pv.p2m_pfns);
 

