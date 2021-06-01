Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C353977C4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:14:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135041.251286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo71j-0004Pi-T1; Tue, 01 Jun 2021 16:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135041.251286; Tue, 01 Jun 2021 16:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo71j-0004Ml-OR; Tue, 01 Jun 2021 16:13:59 +0000
Received: by outflank-mailman (input) for mailman id 135041;
 Tue, 01 Jun 2021 16:13:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo70f-0005Ec-3L
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:12:53 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7758098d-fefe-4003-bede-ed93932f6711;
 Tue, 01 Jun 2021 16:11:41 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBZ1BT
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:35 +0200 (CEST)
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
X-Inumbo-ID: 7758098d-fefe-4003-bede-ed93932f6711
ARC-Seal: i=1; a=rsa-sha256; t=1622563896; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=kc7Yj/zHkuxSkuv91lZrKLFhxicbkhg2PrG0a22bcdRA4EYn0v6h6gKz34AdefHZl+
    EJyvTAopM/CfodrzWrb147NRFmFDJz/XfJrO6Jq8f/8Wbdt7UlIKnGzR+ASqGVGf8x+o
    Rz7bh5z49QsWnCQS4g0icfQs1hIRAxEswdZCD5OpCUhYm+ZXfIg816YZEcpPD4Nfy1V5
    zjydUXGqGR2Xj1v26rFjjfsUcSVTbVotBX488J+WaNOEL0GgopJJbfw3cRgLIB4kjtN7
    YrcfPsZcDHHS0DNoJzFRcQwLqcZXt7Hl8JOyfEOnr4Ml4duXdfmAVBqzndEfhjvBFOPl
    Ptkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563896;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=KiB5zmNJWHh3QN6pLulGVrCrsceJ5e3LZlNQkeTmQNs=;
    b=r7uWJ9iWXTHG6ECfj3bEZt5/Lo06UgF5YH3FHjvxUwYrQJPhrxCFqJHq5oHFNDo97C
    SOybKMZEGGtKfKZMz3cJsEZV8c3ctBTiklqKuuXHkpSDHUSwgFVW6kCLgA+vstWxE/+F
    QT2A0zxs/XKEOUwDxzVKMdPYXvjGTaywBIyAgdFXR3y+4/i8kycF+UwZAa1F4IhdwJ1i
    ujNFtHYD9wk7uVpYoywTP/4H2J3MegGylO+lGdemO9PdYrn/aOivc8An49yyOTuJmqQD
    ygv2ILdRbdwJYCRJO8K30tLH97nw8PPMCN5TdIjuydQqSc91dgTk2+KMIHi+d4p0pc1T
    B+HQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563896;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=KiB5zmNJWHh3QN6pLulGVrCrsceJ5e3LZlNQkeTmQNs=;
    b=naDXOxfkmm5wQsb35m1m/5F9QiDgv5TjkdmqtNiP/cHO0E/XhKL7kQ+OO/+eZQCN89
    GMxdCnfgXCAPoEFvvA8CLNwAr8eXorkxeI2UcQCmm1TNdnNqoPIpnYqBsmeSi/gBS9TT
    sxQAmMKxtGaMvAe2papjTwG9uhxBk8hp7zNQcjqUDEX9331uoZswbOf7DvJ2lmmtm/G9
    wTjQizEt0u5TTUcUFcsWjxNOs6/P+GjUkFYzA60hJLufZHtZ2GJcFWx3qw4GvXWdDmNM
    /jdcYxg0pVu2F14esr9R6Vw0uOMap4adylS5ifs+pwqOsAUjlO2ZZGyTGT4dubU8atdd
    a0sg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 24/38] tools/guest: restore: split record processing
Date: Tue,  1 Jun 2021 18:11:04 +0200
Message-Id: <20210601161118.18986-25-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

handle_page_data must be able to read directly into mapped guest memory.
This will avoid unneccesary memcpy calls for data which can be consumed verbatim.

Rearrange the code to allow decisions based on the incoming record.

This change is preparation for future changes in handle_page_data,
no change in behavior is intended.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/saverestore/common.c  | 33 ++++++++++++---------
 tools/libs/saverestore/common.h  |  4 ++-
 tools/libs/saverestore/restore.c | 49 ++++++++++++++++++++++----------
 tools/libs/saverestore/save.c    |  7 ++++-
 4 files changed, 63 insertions(+), 30 deletions(-)

diff --git a/tools/libs/saverestore/common.c b/tools/libs/saverestore/common.c
index 77128bc747..7da7fa4e2c 100644
--- a/tools/libs/saverestore/common.c
+++ b/tools/libs/saverestore/common.c
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
diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 9de09ae64a..73256f08ab 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -487,7 +487,9 @@ static inline int write_record(struct xc_sr_context *ctx,
  *
  * On failure, the contents of the record structure are undefined.
  */
-int read_record(struct xc_sr_context *ctx, int fd, struct xc_sr_record *rec);
+int read_record_header(struct xc_sr_context *ctx, int fd, struct xc_sr_rhdr *rhdr);
+int read_record_data(struct xc_sr_context *ctx, int fd, struct xc_sr_rhdr *rhdr,
+                     struct xc_sr_record *rec);
 
 /*
  * This would ideally be private in restore.c, but is needed by
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index 598a4aa06d..bb1574ed74 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
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
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index c4876ba24c..b59cb069ed 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
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
 

