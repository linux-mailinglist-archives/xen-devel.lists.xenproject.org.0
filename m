Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 992633C7658
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155670.287422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3My0-0003pL-8P; Tue, 13 Jul 2021 18:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155670.287422; Tue, 13 Jul 2021 18:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3My0-0003kF-2P; Tue, 13 Jul 2021 18:17:12 +0000
Received: by outflank-mailman (input) for mailman id 155670;
 Tue, 13 Jul 2021 18:17:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3MoF-0002kr-Ud
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:07:07 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.174])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08701ffb-e405-11eb-8793-12813bfff9fa;
 Tue, 13 Jul 2021 18:06:24 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6ItB0
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:18 +0200 (CEST)
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
X-Inumbo-ID: 08701ffb-e405-11eb-8793-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199579;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=9FxM3Bx9wXja4XqBD1sGOusWUB3Xe2+i7IOocJp1ap0=;
    b=pmlv471FKO6AMjwr8Z6WkjOjfeDTfhS4g1PsNX7OPQtPlshRqiH1D8t1MyyDwoQY28
    KvOnByp+tMenERKqJ44CYafWgoXdqW+quP8mocvhZcsZmcM5vo7wj6xa48FdiuBKMD2k
    svubuN12GRx9hb6T0FYR1RyYj0t9FThxcE8ujtpcF+LMoOL7kyhr22c/25KS2UkmG0C3
    ihAdX79HLuAIQ3vrzcEWEtTb/H4lEN4AXnjX7PMk5dRFgimqOzTjo2L5TnDh7verjJkE
    /3+jRvcwtro77LyVxMS1amPehmuTuM0nRIgltngD/ivuO651cAOq2C8J8fRiNsjmDWOT
    W+9g==
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
Subject: [PATCH v20210713 18/31] tools: restore: preallocate populate_pfns pfns array
Date: Tue, 13 Jul 2021 20:05:52 +0200
Message-Id: <20210713180605.12096-19-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove repeated allocation from migration loop. There will never be
more than MAX_BATCH_SIZE pages to process in an incoming batch.
Allocate the space once.

Use some prefix to avoid conflict with an array used in handle_page_data.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  |  1 +
 tools/libs/guest/xg_sr_restore.c | 14 +++++++-------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 336be98c93..ca44e59382 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -260,6 +260,7 @@ struct xc_sr_context
             uint32_t *types;
             xen_pfn_t *mfns;
             int *map_errs;
+            xen_pfn_t *pp_pfns;
 
             int send_back_fd;
             unsigned long p2m_size;
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 866a7c86cd..caac4bb5fa 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -138,12 +138,11 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
                   const xen_pfn_t *original_pfns, const uint32_t *types)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = malloc(count * sizeof(*mfns)),
-        *pfns = malloc(count * sizeof(*pfns));
+    xen_pfn_t *mfns = malloc(count * sizeof(*mfns));
     unsigned int i, nr_pfns = 0;
     int rc = -1;
 
-    if ( !mfns || !pfns )
+    if ( !mfns )
     {
         ERROR("Failed to allocate %zu bytes for populating the physmap",
               2 * count * sizeof(*mfns));
@@ -158,7 +157,7 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
             rc = pfn_set_populated(ctx, original_pfns[i]);
             if ( rc )
                 goto err;
-            pfns[nr_pfns] = mfns[nr_pfns] = original_pfns[i];
+            ctx->restore.pp_pfns[nr_pfns] = mfns[nr_pfns] = original_pfns[i];
             ++nr_pfns;
         }
     }
@@ -182,14 +181,13 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
                 goto err;
             }
 
-            ctx->restore.ops.set_gfn(ctx, pfns[i], mfns[i]);
+            ctx->restore.ops.set_gfn(ctx, ctx->restore.pp_pfns[i], mfns[i]);
         }
     }
 
     rc = 0;
 
  err:
-    free(pfns);
     free(mfns);
 
     return rc;
@@ -707,8 +705,9 @@ static int setup(struct xc_sr_context *ctx)
     ctx->restore.types = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.types));
     ctx->restore.mfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.mfns));
     ctx->restore.map_errs = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.map_errs));
+    ctx->restore.pp_pfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.pp_pfns));
     if ( !ctx->restore.pfns || !ctx->restore.types || !ctx->restore.mfns ||
-         !ctx->restore.map_errs )
+         !ctx->restore.map_errs || !ctx->restore.pp_pfns )
     {
         ERROR("Unable to allocate memory");
         rc = -1;
@@ -745,6 +744,7 @@ static void cleanup(struct xc_sr_context *ctx)
 
     free(ctx->restore.buffered_records);
     free(ctx->restore.populated_pfns);
+    free(ctx->restore.pp_pfns);
     free(ctx->restore.map_errs);
     free(ctx->restore.mfns);
     free(ctx->restore.types);

