Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F412D3A9B94
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 15:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142983.263789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVFk-0002wb-Oq; Wed, 16 Jun 2021 13:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142983.263789; Wed, 16 Jun 2021 13:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltVFk-0002ui-LU; Wed, 16 Jun 2021 13:06:44 +0000
Received: by outflank-mailman (input) for mailman id 142983;
 Wed, 16 Jun 2021 13:06:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV23-00075D-90
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:52:35 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [81.169.146.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d52c234-137d-4e0e-94cb-eb330f4ac413;
 Wed, 16 Jun 2021 12:51:52 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCpltmO
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:51:47 +0200 (CEST)
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
X-Inumbo-ID: 1d52c234-137d-4e0e-94cb-eb330f4ac413
ARC-Seal: i=1; a=rsa-sha256; t=1623847907; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LMTXMECnOOeKSJF1PJhPqO/25SF9NGK1THJsaFw/1J/70Y45J1kHvpSqyapwdqlfjS
    ipM49hs3lVxcpWlVpQCaMx1E1TVPLYp9rfnlTyD2pCNXF8+Vuw+1xzcx/52WMl/kfAGN
    OgP2Qz73BnsH4oRTZwDMCwjtrQJde4n0ufC7AJsXyUIJj9fYLbFgXK4whg1f09IH/qaK
    xKdt58Rs0VEXrFVKRPYARh9Z5lhA5skY6f7Q38KncPPagZtKKsc8O0/c9FFoeX/U4leC
    n8E57UTQjQOTsXRLzT5CkaJtgyPTbFviN4njGZ3F3D3x0PGKzwIaff3yNtfo3PQfgaJ/
    URrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847907;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=YGLyCDpmfEm63K5TIs+xnzmQnbcLd4l6eUuaqJ8OGLg=;
    b=jXRFafS3o7BXy7rTxn/pEYaFG0E8WY33NmNWTFSQaRBis0744oY8Pyv0hHr/3I2lOZ
    Gax4JSMzlmxlp04trR7+k6VAmxz6VUKsOZtPKAnIAA4OwzpgUoy13onu4FLzkHz9dPZK
    KctNTiLN4mKeUK4kJwVt6Q8B35icMQNhdGYzyLQ3hIX0zu3OhSt8Ljr+ccskJijWmSUo
    7WZfxSyaw6WQhqAmBS4LbMhwVxOX9f2p4CY/NLa+x5HSGqneJetffaJtOIG5LOBllmJJ
    7s0Go3Fwe9q1wm6WwFohapArhlnDBZ9bqIf+IijghCMYnh7dTWO2M/yLHqlSWVhaJTgC
    WTLg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623847907;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=YGLyCDpmfEm63K5TIs+xnzmQnbcLd4l6eUuaqJ8OGLg=;
    b=q8THds8HGfoUSPajomJ9wIW1uH8sUibkJEb3bkBcdaOlZUohpfD7m5LcOugPhyFwog
    104Cp3Lts5G+EAu4WBi+LB4oMuJIeTTdLKuzsXZcWSZaZnzHDbD/bu6D9ivTGM5G8t54
    5Fxj3RSR5JxEsfQ96QmBUPPTV8fvuY5wALKZV6H7f2aftX7bIgdCeoiAJMMfFIx5Ajpd
    FLXgzOAsxM7hJ9PUIy9GgapNYw6NSa6sk1Oq3Fd/ICR80oMZdedzBquBzVTfruekinfg
    2p1op6igS7JFuwBPgKdH/ASiPY56snontUIX+7riJ3KBqSqNcPOF6qVVq9Q2oQCS4yJe
    R6Og==
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
Subject: [PATCH v20210616 29/36] tools: change struct precopy_stats to precopy_stats_t
Date: Wed, 16 Jun 2021 14:51:22 +0200
Message-Id: <20210616125129.26563-30-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616125129.26563-1-olaf@aepfle.de>
References: <20210616125129.26563-1-olaf@aepfle.de>
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
index 5c440f28ec..60bbba6aa9 100644
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
index e486bce96f..537b977ba8 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -488,7 +488,7 @@ static int update_progress_string(struct xc_sr_context *ctx, char **str)
 #define SPP_MAX_ITERATIONS      5
 #define SPP_TARGET_DIRTY_COUNT 50
 
-static int simple_precopy_policy(struct precopy_stats stats, void *user)
+static int simple_precopy_policy(precopy_stats_t stats, void *user)
 {
     return ((stats.dirty_count >= 0 &&
              stats.dirty_count < SPP_TARGET_DIRTY_COUNT) ||
@@ -515,13 +515,13 @@ static int send_memory_live(struct xc_sr_context *ctx)
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

