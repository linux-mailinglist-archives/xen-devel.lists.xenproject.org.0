Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A703C762C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:07:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155563.287315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MoD-0003Jh-58; Tue, 13 Jul 2021 18:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155563.287315; Tue, 13 Jul 2021 18:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3MoC-00039O-T7; Tue, 13 Jul 2021 18:07:04 +0000
Received: by outflank-mailman (input) for mailman id 155563;
 Tue, 13 Jul 2021 18:07:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3MoA-0002kr-UQ
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:07:02 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.170])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08701ffa-e405-11eb-8793-12813bfff9fa;
 Tue, 13 Jul 2021 18:06:24 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6HtAw
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:17 +0200 (CEST)
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
X-Inumbo-ID: 08701ffa-e405-11eb-8793-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199577;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=SHDAXXjQ4k5wqGqgpZ5ML0uGXKdasaiKGHiNj6axBrA=;
    b=USdFIKxpv0yDNCsW+ZdmUnwSYK+mlD+t9QhFMzLQMGv38mnlBbQ4pE6ErpP/pUguwf
    jbniADxY0RwY0LeHmvos3wlJTmz8oTXwpsb/vkNQFSQtnrSrxoQrSpNNL7OG+feIJbwv
    y3DzpcZajCgmFPnQiCW+SZvOC1aAPeSTO0okqDdgT7iWIlRneiDpGiGuq5V50PDqlaoo
    dH79WEABvneFg7XnwSn37PMKR3l/i4QS8u02HQXgjBeARX3qzQYVpUl4N6Z7IDRiK3wP
    sfiDbeOp2Mplfo+MzMNKIRkE+EeYosRGrbOyX3z/iald+672r+x5xRJyGg3rWcXfIXs6
    6nig==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgthqlagRsstpH9XYEN5v9xf7dypFU9ge5p0Oi0V"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210713 14/31] tools: restore: preallocate pfns array
Date: Tue, 13 Jul 2021 20:05:48 +0200
Message-Id: <20210713180605.12096-15-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove repeated allocation from migration loop. There will never be
more than MAX_BATCH_SIZE pages to process in an incoming batch.
Allocate the space once.

Adjust the verification for page count. It must be at least one page,
but not more than MAX_BATCH_SIZE.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  |  1 +
 tools/libs/guest/xg_sr_restore.c | 23 +++++++++++++++--------
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 34d4c15b22..d32b4c46f3 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -256,6 +256,7 @@ struct xc_sr_context
         {
             struct xc_sr_restore_ops ops;
             struct restore_callbacks *callbacks;
+            xen_pfn_t *pfns;
 
             int send_back_fd;
             unsigned long p2m_size;
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index aa4113d7f6..e812f65f99 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -314,7 +314,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
     unsigned int i, pages_of_data = 0;
     int rc = -1;
 
-    xen_pfn_t *pfns = NULL, pfn;
+    xen_pfn_t pfn;
     uint32_t *types = NULL, type;
 
     /*
@@ -349,9 +349,9 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         goto err;
     }
 
-    if ( pages->count < 1 )
+    if ( !pages->count || pages->count > MAX_BATCH_SIZE )
     {
-        ERROR("Expected at least 1 pfn in PAGE_DATA record");
+        ERROR("Unexpected pfn count %u in PAGE_DATA record", pages->count);
         goto err;
     }
 
@@ -362,9 +362,8 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         goto err;
     }
 
-    pfns = malloc(pages->count * sizeof(*pfns));
     types = malloc(pages->count * sizeof(*types));
-    if ( !pfns || !types )
+    if ( !types )
     {
         ERROR("Unable to allocate enough memory for %u pfns",
               pages->count);
@@ -393,7 +392,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
              * have a page worth of data in the record. */
             pages_of_data++;
 
-        pfns[i] = pfn;
+        ctx->restore.pfns[i] = pfn;
         types[i] = type;
     }
 
@@ -407,11 +406,10 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         goto err;
     }
 
-    rc = process_page_data(ctx, pages->count, pfns, types,
+    rc = process_page_data(ctx, pages->count, ctx->restore.pfns, types,
                            &pages->pfn[pages->count]);
  err:
     free(types);
-    free(pfns);
 
     return rc;
 }
@@ -728,6 +726,14 @@ static int setup(struct xc_sr_context *ctx)
         goto err;
     }
 
+    ctx->restore.pfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.pfns));
+    if ( !ctx->restore.pfns )
+    {
+        ERROR("Unable to allocate memory");
+        rc = -1;
+        goto err;
+    }
+
     ctx->restore.buffered_records = malloc(
         DEFAULT_BUF_RECORDS * sizeof(struct xc_sr_record));
     if ( !ctx->restore.buffered_records )
@@ -758,6 +764,7 @@ static void cleanup(struct xc_sr_context *ctx)
 
     free(ctx->restore.buffered_records);
     free(ctx->restore.populated_pfns);
+    free(ctx->restore.pfns);
 
     if ( ctx->restore.ops.cleanup(ctx) )
         PERROR("Failed to clean up");

