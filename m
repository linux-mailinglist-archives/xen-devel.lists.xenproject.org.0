Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1003977B1
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jun 2021 18:12:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135011.251188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo709-0006Ak-Hk; Tue, 01 Jun 2021 16:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135011.251188; Tue, 01 Jun 2021 16:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lo709-000624-88; Tue, 01 Jun 2021 16:12:21 +0000
Received: by outflank-mailman (input) for mailman id 135011;
 Tue, 01 Jun 2021 16:12:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HQ7/=K3=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lo707-0005X1-0T
 for xen-devel@lists.xenproject.org; Tue, 01 Jun 2021 16:12:19 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.104])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08fba356-fd76-4932-91f5-08adea71b95f;
 Tue, 01 Jun 2021 16:11:42 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx51GBc1BZ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Jun 2021 18:11:38 +0200 (CEST)
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
X-Inumbo-ID: 08fba356-fd76-4932-91f5-08adea71b95f
ARC-Seal: i=1; a=rsa-sha256; t=1622563898; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=h/1sE7f735WbI7yPgAA9MGI8Nd6R6y99TEAhwGOGR88axJzA6YQjdLY2jnSRo+J5bh
    5VOeSe2YgyrbJpL4PSRovNzBUm7YRtu605kwZlKHaIaSdgEmXhYGXgyb3RWbNy0Auwuv
    FdeeXRfdfoYPwzZvXldE4kQt4fLYEk/PdDNVUQcP5xIzXDmuVTnPSIGAFYNQ5s/gEn8q
    Vr5VQIXEQRjHNpuJetYWUytNmm4uxWKX8p9bKZpGh94EAVgIj4+Ik5Z0FpD8o6EVLSGP
    McWZIDRVmBFeg3yMN9wGHdkbF+NHpQBnUHl2j2EnGzmw+/wKVBozM73uvonXhsvPFWq3
    gy5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563898;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=qhG0lw5KlRBNwnqR+lID3/utnVv1YZhnHFw1MeFsVt0=;
    b=tYY9fiG0VkhKyuGz+oE3vIiS809HD/c+N/9Ys7iBjS+CyGF+CSR4w7D9tHxz+TKhWb
    pPYUls34Tin16HTrYKaO5CtWJE9ReALQ55d48RaJFgUymUC5wsse8lGzJOQshWAz9ysp
    pct+EV3Jw3y1iRNgm9+/smZBh8vNSKImwSDUHuVCvXhGMqEkOW2BMqmO3z3UzSv1Uutf
    VwWnmNu49YTBj/sLJv0N9LtCA5JnaV894ExYxPVaY6vHl/cc7O8p8hV8o23KGwMSOCqs
    7aV5MGhUdGIEGQ3epJVuzz4yFXTJVH354AS99TSU+t5Km0CELIxcGtVGjSypQXYKyOop
    9d4g==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622563898;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=qhG0lw5KlRBNwnqR+lID3/utnVv1YZhnHFw1MeFsVt0=;
    b=SnLjOEIWOF3dJBgmgSGgEWMsmdoJJAPSwbSuqpWSfrQx5cI/cXBsfmuHABoNfFCDqG
    Bha0fJhbCqZ6L/LtuapHJxp2SruWGQriEkGQcbQF+KuA6h0/oSJIBz0Gu16RypFC5Ee4
    aPk027v/nnOQLxXcg1eJxRm4oPygov9JWZAjZQCvcFa4RVo/2VbavwCnsBf80CqhWCr5
    LC+NQ/u8AnnwawGN0czS/Lb0EbU6xTabLihK8peb93nJCOYp9AkW6sJ2W5xAm/QTyIAe
    u0hGt19MMQyg9bWr3l+6atuSOsj77bUnpWszzGhIvQ82TQGctCo+UlkqvseI34Pt6Egl
    iozg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs09ValFcstyKtnZMLOo4jr88Zf5nXI1mYJUK+h"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210601 29/38] tools: change struct precopy_stats to precopy_stats_t
Date: Tue,  1 Jun 2021 18:11:09 +0200
Message-Id: <20210601161118.18986-30-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601161118.18986-1-olaf@aepfle.de>
References: <20210601161118.18986-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will help libxl_save_msgs_gen.pl to copy the struct as a region of memory.

No change in behavior intented.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/include/xensaverestore.h  | 7 +++----
 tools/libs/saverestore/common.h | 2 +-
 tools/libs/saverestore/save.c   | 6 +++---
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/tools/include/xensaverestore.h b/tools/include/xensaverestore.h
index 0410f0469e..dca0134605 100644
--- a/tools/include/xensaverestore.h
+++ b/tools/include/xensaverestore.h
@@ -23,18 +23,17 @@
 #define XCFLAGS_DEBUG     (1 << 1)
 
 /* For save's precopy_policy(). */
-struct precopy_stats
-{
+typedef struct {
     unsigned int iteration;
     unsigned long total_written;
     long dirty_count; /* -1 if unknown */
-};
+} precopy_stats_t;
 
 /*
  * A precopy_policy callback may not be running in the same address
  * space as libxc an so precopy_stats is passed by value.
  */
-typedef int (*precopy_policy_t)(struct precopy_stats, void *);
+typedef int (*precopy_policy_t)(precopy_stats_t, void *);
 
 /* callbacks provided by xc_domain_save */
 struct save_callbacks {
diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 4218a8ecd6..cf8d6545e2 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -283,7 +283,7 @@ struct xc_sr_context
             size_t pages_sent;
             size_t overhead_sent;
 
-            struct precopy_stats stats;
+            precopy_stats_t stats;
 
             unsigned int nr_batch_pfns;
             unsigned long *deferred_pages;
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index b59cb069ed..523457eaba 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -489,7 +489,7 @@ static int update_progress_string(struct xc_sr_context *ctx, char **str)
 #define SPP_MAX_ITERATIONS      5
 #define SPP_TARGET_DIRTY_COUNT 50
 
-static int simple_precopy_policy(struct precopy_stats stats, void *user)
+static int simple_precopy_policy(precopy_stats_t stats, void *user)
 {
     return ((stats.dirty_count >= 0 &&
              stats.dirty_count < SPP_TARGET_DIRTY_COUNT) ||
@@ -516,13 +516,13 @@ static int send_memory_live(struct xc_sr_context *ctx)
     precopy_policy_t precopy_policy = ctx->save.callbacks->precopy_policy;
     void *data = ctx->save.callbacks->data;
 
-    struct precopy_stats *policy_stats;
+    precopy_stats_t *policy_stats;
 
     rc = update_progress_string(ctx, &progress_str);
     if ( rc )
         goto out;
 
-    ctx->save.stats = (struct precopy_stats){
+    ctx->save.stats = (precopy_stats_t){
         .dirty_count = ctx->save.p2m_size,
     };
     policy_stats = &ctx->save.stats;

