Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190723C7629
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155556.287279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mo4-0001BT-BO; Tue, 13 Jul 2021 18:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155556.287279; Tue, 13 Jul 2021 18:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mo4-000175-4J; Tue, 13 Jul 2021 18:06:56 +0000
Received: by outflank-mailman (input) for mailman id 155556;
 Tue, 13 Jul 2021 18:06:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3Mo2-0002UL-H5
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:06:54 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.101])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21a92166-9a3d-403a-96dc-95dc64418e01;
 Tue, 13 Jul 2021 18:06:26 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6JtB2
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:19 +0200 (CEST)
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
X-Inumbo-ID: 21a92166-9a3d-403a-96dc-95dc64418e01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199579;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Fd4Q1B2DPhDxZ+ElDKm1Z9i8GuAzFG2GaIOlaJriZzY=;
    b=pGHNg93OpQHnVpiCxnMQ9Pw4QQhRBMPvijxM9tSsveV5FJl2EGBWmbmGF4yYDlirbn
    tn1FDgsNc1FfLeVXG9sEhvVtG/uH7B4pD+rGSDaGx5l4++29llXNoHdGpwNuZ9ljJTTN
    3HP39YcSzBPOBYlBe6KgUm5eRb/RTjImATr/rmrYjYtQdFmTIntAL/5a0/Lz92KnxLA6
    MBUL1Mmv5U5F/KVGrIB8Y0tRwGgi8MoU/n+5KvxwTS8PJvX9P5z8H41APDM4grf9dDOy
    DpdrrAWC9iL4ZEZWhFj6A827uyOvgvhnBZMP4rUF8BHuAi0U2sko5AjJPP+9+6aLdsDn
    s27w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgthqlagRsstpH9XYEN5v9xf7dypFU9ge5p0Oi0V"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210713 20/31] tools: restore: split record processing
Date: Tue, 13 Jul 2021 20:05:54 +0200
Message-Id: <20210713180605.12096-21-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

handle_page_data must be able to read directly into mapped guest memory.
This will avoid unneccesary memcpy calls for data which can be consumed verbatim.

Rearrange the code to allow decisions based on the incoming record.

This change is preparation for future changes in handle_page_data,
no change in behavior is intended.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/guest/xg_sr_common.c  | 33 ++++++++++++---------
 tools/libs/guest/xg_sr_common.h  |  4 ++-
 tools/libs/guest/xg_sr_restore.c | 49 ++++++++++++++++++++++----------
 tools/libs/guest/xg_sr_save.c    |  7 ++++-
 4 files changed, 63 insertions(+), 30 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index 17567ab133..cabde4ef74 100644
--- a/tools/libs/guest/xg_sr_common.c
+++ b/tools/libs/guest/xg_sr_common.c
@@ -91,26 +91,33 @@ int write_split_record(struct xc_sr_context *ctx, struct xc_sr_record *rec,
     return -1;
 }
 
-int read_record(struct xc_sr_context *ctx, int fd, struct xc_sr_record *rec)
+int read_record_header(struct xc_sr_context *ctx, int fd, struct xc_sr_rhdr *rhdr)
 {
     xc_interface *xch = ctx->xch;
-    struct xc_sr_rhdr rhdr;
-    size_t datasz;
 
-    if ( read_exact(fd, &rhdr, sizeof(rhdr)) )
+    if ( read_exact(fd, rhdr, sizeof(*rhdr)) )
     {
         PERROR("Failed to read Record Header from stream");
         return -1;
     }
 
-    if ( rhdr.length > REC_LENGTH_MAX )
+    if ( rhdr->length > REC_LENGTH_MAX )
     {
-        ERROR("Record (0x%08x, %s) length %#x exceeds max (%#x)", rhdr.type,
-              rec_type_to_str(rhdr.type), rhdr.length, REC_LENGTH_MAX);
+        ERROR("Record (0x%08x, %s) length %#x exceeds max (%#x)", rhdr->type,
+              rec_type_to_str(rhdr->type), rhdr->length, REC_LENGTH_MAX);
         return -1;
     }
 
-    datasz = ROUNDUP(rhdr.length, REC_ALIGN_ORDER);
+    return 0;
+}
+
+int read_record_data(struct xc_sr_context *ctx, int fd, struct xc_sr_rhdr *rhdr,
+                     struct xc_sr_record *rec)
+{
+    xc_interface *xch = ctx->xch;
+    size_t datasz;
+
+    datasz = ROUNDUP(rhdr->length, REC_ALIGN_ORDER);
 
     if ( datasz )
     {
@@ -119,7 +126,7 @@ int read_record(struct xc_sr_context *ctx, int fd, struct xc_sr_record *rec)
         if ( !rec->data )
         {
             ERROR("Unable to allocate %zu bytes for record data (0x%08x, %s)",
-                  datasz, rhdr.type, rec_type_to_str(rhdr.type));
+                  datasz, rhdr->type, rec_type_to_str(rhdr->type));
             return -1;
         }
 
@@ -128,18 +135,18 @@ int read_record(struct xc_sr_context *ctx, int fd, struct xc_sr_record *rec)
             free(rec->data);
             rec->data = NULL;
             PERROR("Failed to read %zu bytes of data for record (0x%08x, %s)",
-                   datasz, rhdr.type, rec_type_to_str(rhdr.type));
+                   datasz, rhdr->type, rec_type_to_str(rhdr->type));
             return -1;
         }
     }
     else
         rec->data = NULL;
 
-    rec->type   = rhdr.type;
-    rec->length = rhdr.length;
+    rec->type   = rhdr->type;
+    rec->length = rhdr->length;
 
     return 0;
-};
+}
 
 static void __attribute__((unused)) build_assertions(void)
 {
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index c6c6a31dc6..077d8f2890 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -458,7 +458,9 @@ static inline int write_record(struct xc_sr_context *ctx,
  *
  * On failure, the contents of the record structure are undefined.
  */
-int read_record(struct xc_sr_context *ctx, int fd, struct xc_sr_record *rec);
+int read_record_header(struct xc_sr_context *ctx, int fd, struct xc_sr_rhdr *rhdr);
+int read_record_data(struct xc_sr_context *ctx, int fd, struct xc_sr_rhdr *rhdr,
+                     struct xc_sr_record *rec);
 
 /*
  * This would ideally be private in restore.c, but is needed by
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 2734ef06fd..8f6da97d09 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -466,7 +466,7 @@ static int send_checkpoint_dirty_pfn_list(struct xc_sr_context *ctx)
     return rc;
 }
 
-static int process_record(struct xc_sr_context *ctx, struct xc_sr_record *rec);
+static int process_buffered_record(struct xc_sr_context *ctx, struct xc_sr_record *rec);
 static int handle_checkpoint(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
@@ -505,7 +505,7 @@ static int handle_checkpoint(struct xc_sr_context *ctx)
 
         for ( i = 0; i < ctx->restore.buffered_rec_num; i++ )
         {
-            rc = process_record(ctx, &ctx->restore.buffered_records[i]);
+            rc = process_buffered_record(ctx, &ctx->restore.buffered_records[i]);
             if ( rc )
                 goto err;
         }
@@ -566,10 +566,11 @@ static int handle_checkpoint(struct xc_sr_context *ctx)
     return rc;
 }
 
-static int buffer_record(struct xc_sr_context *ctx, struct xc_sr_record *rec)
+static int buffer_record(struct xc_sr_context *ctx, struct xc_sr_rhdr *rhdr)
 {
     xc_interface *xch = ctx->xch;
     unsigned int new_alloc_num;
+    struct xc_sr_record rec;
     struct xc_sr_record *p;
 
     if ( ctx->restore.buffered_rec_num >= ctx->restore.allocated_rec_num )
@@ -587,8 +588,13 @@ static int buffer_record(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         ctx->restore.allocated_rec_num = new_alloc_num;
     }
 
+    if ( read_record_data(ctx, ctx->fd, rhdr, &rec) )
+    {
+        return -1;
+    }
+
     memcpy(&ctx->restore.buffered_records[ctx->restore.buffered_rec_num++],
-           rec, sizeof(*rec));
+           &rec, sizeof(rec));
 
     return 0;
 }
@@ -619,7 +625,7 @@ int handle_static_data_end(struct xc_sr_context *ctx)
     return rc;
 }
 
-static int process_record(struct xc_sr_context *ctx, struct xc_sr_record *rec)
+static int process_buffered_record(struct xc_sr_context *ctx, struct xc_sr_record *rec)
 {
     xc_interface *xch = ctx->xch;
     int rc = 0;
@@ -657,6 +663,19 @@ static int process_record(struct xc_sr_context *ctx, struct xc_sr_record *rec)
     return rc;
 }
 
+static int process_incoming_record_header(struct xc_sr_context *ctx, struct xc_sr_rhdr *rhdr)
+{
+    struct xc_sr_record rec;
+    int rc;
+
+    rc = read_record_data(ctx, ctx->fd, rhdr, &rec);
+    if ( rc )
+        return rc;
+
+    return process_buffered_record(ctx, &rec);
+}
+
+
 static int setup(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
@@ -753,7 +772,7 @@ static void cleanup(struct xc_sr_context *ctx)
 static int restore(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    struct xc_sr_record rec;
+    struct xc_sr_rhdr rhdr;
     int rc, saved_rc = 0, saved_errno = 0;
 
     IPRINTF("Restoring domain");
@@ -764,7 +783,7 @@ static int restore(struct xc_sr_context *ctx)
 
     do
     {
-        rc = read_record(ctx, ctx->fd, &rec);
+        rc = read_record_header(ctx, ctx->fd, &rhdr);
         if ( rc )
         {
             if ( ctx->restore.buffer_all_records )
@@ -774,25 +793,25 @@ static int restore(struct xc_sr_context *ctx)
         }
 
         if ( ctx->restore.buffer_all_records &&
-             rec.type != REC_TYPE_END &&
-             rec.type != REC_TYPE_CHECKPOINT )
+             rhdr.type != REC_TYPE_END &&
+             rhdr.type != REC_TYPE_CHECKPOINT )
         {
-            rc = buffer_record(ctx, &rec);
+            rc = buffer_record(ctx, &rhdr);
             if ( rc )
                 goto err;
         }
         else
         {
-            rc = process_record(ctx, &rec);
+            rc = process_incoming_record_header(ctx, &rhdr);
             if ( rc == RECORD_NOT_PROCESSED )
             {
-                if ( rec.type & REC_TYPE_OPTIONAL )
+                if ( rhdr.type & REC_TYPE_OPTIONAL )
                     DPRINTF("Ignoring optional record %#x (%s)",
-                            rec.type, rec_type_to_str(rec.type));
+                            rhdr.type, rec_type_to_str(rhdr.type));
                 else
                 {
                     ERROR("Mandatory record %#x (%s) not handled",
-                          rec.type, rec_type_to_str(rec.type));
+                          rhdr.type, rec_type_to_str(rhdr.type));
                     rc = -1;
                     goto err;
                 }
@@ -803,7 +822,7 @@ static int restore(struct xc_sr_context *ctx)
                 goto err;
         }
 
-    } while ( rec.type != REC_TYPE_END );
+    } while ( rhdr.type != REC_TYPE_END );
 
  remus_failover:
     if ( ctx->stream_type == XC_STREAM_COLO )
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index c74c8d9348..ef8c49f23d 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -591,6 +591,7 @@ static int send_memory_live(struct xc_sr_context *ctx)
 static int colo_merge_secondary_dirty_bitmap(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
+    struct xc_sr_rhdr rhdr;
     struct xc_sr_record rec;
     uint64_t *pfns = NULL;
     uint64_t pfn;
@@ -599,7 +600,11 @@ static int colo_merge_secondary_dirty_bitmap(struct xc_sr_context *ctx)
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->save.dirty_bitmap_hbuf);
 
-    rc = read_record(ctx, ctx->save.recv_fd, &rec);
+    rc = read_record_header(ctx, ctx->save.recv_fd, &rhdr);
+    if ( rc )
+        goto err;
+
+    rc = read_record_data(ctx, ctx->save.recv_fd, &rhdr, &rec);
     if ( rc )
         goto err;
 

