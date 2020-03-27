Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1969195DEA
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 19:52:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHu3v-00085R-Od; Fri, 27 Mar 2020 18:50:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiP0=5M=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jHu3u-00084u-AN
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 18:50:34 +0000
X-Inumbo-ID: d0334ad6-705b-11ea-8a16-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0334ad6-705b-11ea-8a16-12813bfff9fa;
 Fri, 27 Mar 2020 18:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BE/ggHUpivzYWOJvoMk+gTgNDKBm4EEXr+ZyW2JUzQI=; b=Hbc52EMFjO4AE9KmOyBeHC70oq
 8Zq9G0+Qt7apNPBHg4kuf3l8jG+VM9Y8Vp73H/rll0Z+BEkV+phZQIEsT2Zj7jRE85tR8wJYIOxBb
 lZrGdDTuxmv7g9e2jjkyT7VKB6XWL9pynwVcJKABh5GUzvf4ryhGXP2ywiD+akHIzGwA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jHu3i-0008Ko-D8; Fri, 27 Mar 2020 18:50:22 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jHu3i-0007P4-4L; Fri, 27 Mar 2020 18:50:22 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 18:50:12 +0000
Message-Id: <20200327185012.1795-6-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200327185012.1795-1-paul@xen.org>
References: <20200327185012.1795-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH 5/5] tools/libxc: make use of domain context
 SHARED_INFO record...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

... in the save/restore code.

This patch replaces direct mapping of the shared_info_frame (retrieved
using XEN_DOMCTL_getdomaininfo) with save/load of the domain context
SHARED_INFO record.

No modifications are made to the definition of the migration stream at
this point. Subsequent patches will define a record in the libxc domain
image format for passing domain context and convert the save/restore code
to use that.

Signed-off-by: Paul Durrant <paul@xen.org>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>
---
 tools/libxc/xc_sr_common.h         |  7 +++-
 tools/libxc/xc_sr_common_x86.c     | 58 ++++++++++++++++++++++++++++++
 tools/libxc/xc_sr_common_x86.h     |  4 +++
 tools/libxc/xc_sr_common_x86_pv.c  | 52 +++++++++++++++++++++++++++
 tools/libxc/xc_sr_common_x86_pv.h  |  3 ++
 tools/libxc/xc_sr_restore_x86_pv.c | 40 ++++++++-------------
 tools/libxc/xc_sr_save_x86_pv.c    | 26 ++------------
 tools/libxc/xg_save_restore.h      |  1 +
 8 files changed, 142 insertions(+), 49 deletions(-)

diff --git a/tools/libxc/xc_sr_common.h b/tools/libxc/xc_sr_common.h
index 5dd51ccb15..df21b46dc7 100644
--- a/tools/libxc/xc_sr_common.h
+++ b/tools/libxc/xc_sr_common.h
@@ -287,6 +287,11 @@ struct xc_sr_context
     {
         struct /* x86 */
         {
+            struct {
+                void *buffer;
+                unsigned int len;
+            } domain_context;
+
             struct /* x86 PV guest. */
             {
                 /* 4 or 8; 32 or 64 bit domain */
@@ -314,7 +319,7 @@ struct xc_sr_context
                 /* The guest pfns containing the p2m leaves */
                 xen_pfn_t *p2m_pfns;
 
-                /* Read-only mapping of guests shared info page */
+                /* Pointer to shared_info (located in context buffer)  */
                 shared_info_any_t *shinfo;
 
                 /* p2m generation count for verifying validity of local p2m. */
diff --git a/tools/libxc/xc_sr_common_x86.c b/tools/libxc/xc_sr_common_x86.c
index 011684df97..7d297b75b5 100644
--- a/tools/libxc/xc_sr_common_x86.c
+++ b/tools/libxc/xc_sr_common_x86.c
@@ -42,6 +42,64 @@ int handle_x86_tsc_info(struct xc_sr_context *ctx, struct xc_sr_record *rec)
     return 0;
 }
 
+int x86_get_context(struct xc_sr_context *ctx, uint32_t mask)
+{
+    xc_interface *xch = ctx->xch;
+    int rc;
+
+    if ( ctx->x86.domain_context.buffer )
+    {
+        ERROR("Domain context already present");
+        return -1;
+    }
+
+    rc = xc_domain_getcontext(xch, ctx->domid, mask, NULL, 0);
+    if ( rc < 0 )
+    {
+        PERROR("Unable to get size of domain context");
+        return -1;
+    }
+
+    ctx->x86.domain_context.buffer = malloc(rc);
+    if ( ctx->x86.domain_context.buffer == NULL )
+    {
+        PERROR("Unable to allocate memory for domain context");
+        return -1;
+    }
+
+    rc = xc_domain_getcontext(xch, ctx->domid, mask,
+                              ctx->x86.domain_context.buffer, rc);
+    if ( rc < 0 )
+    {
+        PERROR("Unable to get domain context");
+        return -1;
+    }
+
+    ctx->x86.domain_context.len = rc;
+
+    return 0;
+}
+
+int x86_set_context(struct xc_sr_context *ctx, uint32_t mask)
+{
+    xc_interface *xch = ctx->xch;
+
+    if ( !ctx->x86.domain_context.buffer )
+    {
+        ERROR("Domain context not present");
+        return -1;
+    }
+
+    return xc_domain_setcontext(xch, ctx->domid, mask,
+                                ctx->x86.domain_context.buffer,
+                                ctx->x86.domain_context.len);
+}
+
+void x86_cleanup(struct xc_sr_context *ctx)
+{
+    free(ctx->x86.domain_context.buffer);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libxc/xc_sr_common_x86.h b/tools/libxc/xc_sr_common_x86.h
index ebc4355bd1..1746094081 100644
--- a/tools/libxc/xc_sr_common_x86.h
+++ b/tools/libxc/xc_sr_common_x86.h
@@ -14,6 +14,10 @@ int write_x86_tsc_info(struct xc_sr_context *ctx);
  */
 int handle_x86_tsc_info(struct xc_sr_context *ctx, struct xc_sr_record *rec);
 
+int x86_get_context(struct xc_sr_context *ctx, uint32_t mask);
+int x86_set_context(struct xc_sr_context *ctx, uint32_t mask);
+void x86_cleanup(struct xc_sr_context *ctx);
+
 #endif
 /*
  * Local variables:
diff --git a/tools/libxc/xc_sr_common_x86_pv.c b/tools/libxc/xc_sr_common_x86_pv.c
index d3d425cb82..3e6f130e56 100644
--- a/tools/libxc/xc_sr_common_x86_pv.c
+++ b/tools/libxc/xc_sr_common_x86_pv.c
@@ -182,6 +182,58 @@ int x86_pv_map_m2p(struct xc_sr_context *ctx)
     return rc;
 }
 
+int x86_pv_get_shinfo(struct xc_sr_context *ctx)
+{
+    unsigned int off = 0;
+    struct domain_save_descriptor *desc;
+    int rc;
+
+    rc = x86_get_context(ctx, DOMAIN_SAVE_MASK(SHARED_INFO));
+    if ( rc )
+        return rc;
+
+    do {
+        if ( ctx->x86.domain_context.len - off < sizeof(*desc) )
+        {
+            return -1;
+        }
+        desc = ctx->x86.domain_context.buffer + off;
+        off += sizeof(*desc);
+
+        switch (desc->typecode)
+        {
+        case DOMAIN_SAVE_CODE(SHARED_INFO):
+        {
+            DOMAIN_SAVE_TYPE(SHARED_INFO) *s;
+
+            if ( ctx->x86.domain_context.len - off < sizeof(*s) )
+                return -1;
+
+            s = ctx->x86.domain_context.buffer + off;
+            ctx->x86.pv.shinfo = (shared_info_any_t *)s->buffer;
+            /* fall through */
+        }
+        default:
+            off += (desc->length);
+            break;
+        }
+    } while ( desc->typecode != DOMAIN_SAVE_CODE(END) );
+
+    if ( !ctx->x86.pv.shinfo )
+        return -1;
+
+    return 0;
+}
+
+int x86_pv_set_shinfo(struct xc_sr_context *ctx)
+{
+    if ( !ctx->x86.pv.shinfo )
+        return -1;
+
+    return ctx->x86.pv.shinfo ?
+        x86_set_context(ctx, DOMAIN_SAVE_MASK(SHARED_INFO)) : -1;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libxc/xc_sr_common_x86_pv.h b/tools/libxc/xc_sr_common_x86_pv.h
index 2ed03309af..01442f48fb 100644
--- a/tools/libxc/xc_sr_common_x86_pv.h
+++ b/tools/libxc/xc_sr_common_x86_pv.h
@@ -97,6 +97,9 @@ int x86_pv_domain_info(struct xc_sr_context *ctx);
  */
 int x86_pv_map_m2p(struct xc_sr_context *ctx);
 
+int x86_pv_get_shinfo(struct xc_sr_context *ctx);
+int x86_pv_set_shinfo(struct xc_sr_context *ctx);
+
 #endif
 /*
  * Local variables:
diff --git a/tools/libxc/xc_sr_restore_x86_pv.c b/tools/libxc/xc_sr_restore_x86_pv.c
index 904ccc462a..4dbc7f0da5 100644
--- a/tools/libxc/xc_sr_restore_x86_pv.c
+++ b/tools/libxc/xc_sr_restore_x86_pv.c
@@ -864,8 +864,7 @@ static int handle_shared_info(struct xc_sr_context *ctx,
 {
     xc_interface *xch = ctx->xch;
     unsigned int i;
-    int rc = -1;
-    shared_info_any_t *guest_shinfo = NULL;
+    int rc;
     const shared_info_any_t *old_shinfo = rec->data;
 
     if ( !ctx->x86.pv.restore.seen_pv_info )
@@ -878,39 +877,30 @@ static int handle_shared_info(struct xc_sr_context *ctx,
     {
         ERROR("X86_PV_SHARED_INFO record wrong size: length %u"
               ", expected 4096", rec->length);
-        goto err;
+        return -1;
     }
 
-    guest_shinfo = xc_map_foreign_range(
-        xch, ctx->domid, PAGE_SIZE, PROT_READ | PROT_WRITE,
-        ctx->dominfo.shared_info_frame);
-    if ( !guest_shinfo )
-    {
-        PERROR("Failed to map Shared Info at mfn %#lx",
-               ctx->dominfo.shared_info_frame);
-        goto err;
-    }
+    rc = x86_pv_get_shinfo(ctx);
+    if ( rc )
+        return rc;
 
-    MEMCPY_FIELD(guest_shinfo, old_shinfo, vcpu_info, ctx->x86.pv.width);
-    MEMCPY_FIELD(guest_shinfo, old_shinfo, arch, ctx->x86.pv.width);
+    MEMCPY_FIELD(ctx->x86.pv.shinfo, old_shinfo, vcpu_info,
+                 ctx->x86.pv.width);
+    MEMCPY_FIELD(ctx->x86.pv.shinfo, old_shinfo, arch, ctx->x86.pv.width);
 
-    SET_FIELD(guest_shinfo, arch.pfn_to_mfn_frame_list_list,
+    SET_FIELD(ctx->x86.pv.shinfo, arch.pfn_to_mfn_frame_list_list,
               0, ctx->x86.pv.width);
 
-    MEMSET_ARRAY_FIELD(guest_shinfo, evtchn_pending, 0, ctx->x86.pv.width);
+    MEMSET_ARRAY_FIELD(ctx->x86.pv.shinfo, evtchn_pending, 0,
+                       ctx->x86.pv.width);
     for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
-        SET_FIELD(guest_shinfo, vcpu_info[i].evtchn_pending_sel,
+        SET_FIELD(ctx->x86.pv.shinfo, vcpu_info[i].evtchn_pending_sel,
                   0, ctx->x86.pv.width);
 
-    MEMSET_ARRAY_FIELD(guest_shinfo, evtchn_mask, 0xff, ctx->x86.pv.width);
-
-    rc = 0;
+    MEMSET_ARRAY_FIELD(ctx->x86.pv.shinfo, evtchn_mask, 0xff,
+                       ctx->x86.pv.width);
 
- err:
-    if ( guest_shinfo )
-        munmap(guest_shinfo, PAGE_SIZE);
-
-    return rc;
+    return x86_pv_set_shinfo(ctx);
 }
 
 /* restore_ops function. */
diff --git a/tools/libxc/xc_sr_save_x86_pv.c b/tools/libxc/xc_sr_save_x86_pv.c
index f3ccf5bb4b..7c4fcffa92 100644
--- a/tools/libxc/xc_sr_save_x86_pv.c
+++ b/tools/libxc/xc_sr_save_x86_pv.c
@@ -9,25 +9,6 @@ static inline bool is_canonical_address(xen_vaddr_t vaddr)
     return ((int64_t)vaddr >> 47) == ((int64_t)vaddr >> 63);
 }
 
-/*
- * Maps the guests shared info page.
- */
-static int map_shinfo(struct xc_sr_context *ctx)
-{
-    xc_interface *xch = ctx->xch;
-
-    ctx->x86.pv.shinfo = xc_map_foreign_range(
-        xch, ctx->domid, PAGE_SIZE, PROT_READ, ctx->dominfo.shared_info_frame);
-    if ( !ctx->x86.pv.shinfo )
-    {
-        PERROR("Failed to map shared info frame at mfn %#lx",
-               ctx->dominfo.shared_info_frame);
-        return -1;
-    }
-
-    return 0;
-}
-
 /*
  * Copy a list of mfns from a guest, accounting for differences between guest
  * and toolstack width.  Can fail if truncation would occur.
@@ -1041,7 +1022,7 @@ static int x86_pv_setup(struct xc_sr_context *ctx)
     if ( rc )
         return rc;
 
-    rc = map_shinfo(ctx);
+    rc = x86_pv_get_shinfo(ctx);
     if ( rc )
         return rc;
 
@@ -1112,12 +1093,11 @@ static int x86_pv_cleanup(struct xc_sr_context *ctx)
     if ( ctx->x86.pv.p2m )
         munmap(ctx->x86.pv.p2m, ctx->x86.pv.p2m_frames * PAGE_SIZE);
 
-    if ( ctx->x86.pv.shinfo )
-        munmap(ctx->x86.pv.shinfo, PAGE_SIZE);
-
     if ( ctx->x86.pv.m2p )
         munmap(ctx->x86.pv.m2p, ctx->x86.pv.nr_m2p_frames * PAGE_SIZE);
 
+    x86_cleanup(ctx);
+
     return 0;
 }
 
diff --git a/tools/libxc/xg_save_restore.h b/tools/libxc/xg_save_restore.h
index 303081df0d..296b523963 100644
--- a/tools/libxc/xg_save_restore.h
+++ b/tools/libxc/xg_save_restore.h
@@ -19,6 +19,7 @@
 
 #include <xen/foreign/x86_32.h>
 #include <xen/foreign/x86_64.h>
+#include <xen/save.h>
 
 /*
 ** We process save/restore/migrate in batches of pages; the below
-- 
2.20.1


