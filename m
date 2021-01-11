Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B56862F1D00
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:49:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65183.115507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Jo-0005BT-Fe; Mon, 11 Jan 2021 17:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65183.115507; Mon, 11 Jan 2021 17:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Jo-0005AF-4x; Mon, 11 Jan 2021 17:49:28 +0000
Received: by outflank-mailman (input) for mailman id 65183;
 Mon, 11 Jan 2021 17:49:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1EW-0002a6-1z
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:44:00 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 449b0422-c2b1-4756-a449-977900c3afc4;
 Mon, 11 Jan 2021 17:42:47 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgdM3j
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:39 +0100 (CET)
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
X-Inumbo-ID: 449b0422-c2b1-4756-a449-977900c3afc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386966;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=6/tiFai5Fn5sBSz9mSm2Btg78STWmQMgQ4VdZ6GzPlg=;
	b=ou3/jLCieAotLBgpY6uWC7HdttgJGfjoitzIP+TlTCpn3ork1Y4tycxcVABTKjKC5n
	joNyC0f42hdq6xXSqUhP03kL/R+iycpRd7A6I4RFEU3BZ2XWfQks0f0A+iWEQESQc+su
	xMC9QIgok4WsAmZCu0l5xcymmfWtl/R4HjSx3VWtSixT04MW4/IzdUI/isQ7Wnv/FwDD
	LxERHA7ZrzbR/cdHwzSeED4htyZ09IsOdadOmAQP2USdULN7tGLT5jlPPeELpk8YLzHu
	kInGoDeRK/eIxRQ7Ko5Rz+DF2x+KAjmhPqGs4mE9r0+eX2OsZeKXYW4jL0gYNdMsDNbf
	df7w==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 29/39] tools/guest: restore: split record processing
Date: Mon, 11 Jan 2021 18:42:14 +0100
Message-Id: <20210111174224.24714-30-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

handle_page_data must be able to read directly into mapped guest memory.
This will avoid unneccesary memcpy calls for data which can be consumed verbatim.

Rearrange the code to allow decisions based on the incoming record.

This change is preparation for future changes in handle_page_data,
no change in behavior is intended.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
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
index 3fe665b91d..66d1b0dfe6 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -475,7 +475,9 @@ static inline int write_record(struct xc_sr_context *ctx,
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
index 71b39612ee..93f69b9ba8 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -471,7 +471,7 @@ static int send_checkpoint_dirty_pfn_list(struct xc_sr_context *ctx)
     return rc;
 }
 
-static int process_record(struct xc_sr_context *ctx, struct xc_sr_record *rec);
+static int process_buffered_record(struct xc_sr_context *ctx, struct xc_sr_record *rec);
 static int handle_checkpoint(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
@@ -510,7 +510,7 @@ static int handle_checkpoint(struct xc_sr_context *ctx)
 
         for ( i = 0; i < ctx->restore.buffered_rec_num; i++ )
         {
-            rc = process_record(ctx, &ctx->restore.buffered_records[i]);
+            rc = process_buffered_record(ctx, &ctx->restore.buffered_records[i]);
             if ( rc )
                 goto err;
         }
@@ -571,10 +571,11 @@ static int handle_checkpoint(struct xc_sr_context *ctx)
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
@@ -592,8 +593,13 @@ static int buffer_record(struct xc_sr_context *ctx, struct xc_sr_record *rec)
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
@@ -624,7 +630,7 @@ int handle_static_data_end(struct xc_sr_context *ctx)
     return rc;
 }
 
-static int process_record(struct xc_sr_context *ctx, struct xc_sr_record *rec)
+static int process_buffered_record(struct xc_sr_context *ctx, struct xc_sr_record *rec)
 {
     xc_interface *xch = ctx->xch;
     int rc = 0;
@@ -662,6 +668,19 @@ static int process_record(struct xc_sr_context *ctx, struct xc_sr_record *rec)
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
@@ -745,7 +764,7 @@ static void cleanup(struct xc_sr_context *ctx)
 static int restore(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    struct xc_sr_record rec;
+    struct xc_sr_rhdr rhdr;
     int rc, saved_rc = 0, saved_errno = 0;
 
     IPRINTF("Restoring domain");
@@ -756,7 +775,7 @@ static int restore(struct xc_sr_context *ctx)
 
     do
     {
-        rc = read_record(ctx, ctx->fd, &rec);
+        rc = read_record_header(ctx, ctx->fd, &rhdr);
         if ( rc )
         {
             if ( ctx->restore.buffer_all_records )
@@ -766,25 +785,25 @@ static int restore(struct xc_sr_context *ctx)
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
@@ -795,7 +814,7 @@ static int restore(struct xc_sr_context *ctx)
                 goto err;
         }
 
-    } while ( rec.type != REC_TYPE_END );
+    } while ( rhdr.type != REC_TYPE_END );
 
  remus_failover:
     if ( ctx->stream_type == XC_STREAM_COLO )
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index e724ba9cb8..d766384ed6 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -590,6 +590,7 @@ static int send_memory_live(struct xc_sr_context *ctx)
 static int colo_merge_secondary_dirty_bitmap(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
+    struct xc_sr_rhdr rhdr;
     struct xc_sr_record rec;
     uint64_t *pfns = NULL;
     uint64_t pfn;
@@ -598,7 +599,11 @@ static int colo_merge_secondary_dirty_bitmap(struct xc_sr_context *ctx)
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
 

