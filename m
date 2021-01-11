Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544172F1CFF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:49:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65182.115497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Jn-0005AG-Th; Mon, 11 Jan 2021 17:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65182.115497; Mon, 11 Jan 2021 17:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Jn-00059e-NR; Mon, 11 Jan 2021 17:49:27 +0000
Received: by outflank-mailman (input) for mailman id 65182;
 Mon, 11 Jan 2021 17:49:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1Eg-0002a6-2A
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:44:10 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.104])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id edfd91d1-90e2-4a9b-9da3-d8e6867119a1;
 Mon, 11 Jan 2021 17:42:49 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHggM3p
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:42 +0100 (CET)
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
X-Inumbo-ID: edfd91d1-90e2-4a9b-9da3-d8e6867119a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386968;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=Gzr3qB/ER0pPGA/ReU1WnH9O9LgHDHVskc4u4fK3Qng=;
	b=pCqVYqqFo1RlkPm8ByECSG3uxqvJyUak9MWgaTy/hVcMvReN3QMrx6zkgInT3iM3wZ
	Mlkn69M8xCskSkyUKcnNTPrREY2cFbODJuwaEk3NYDheBLLxNKvOqBHQIN9kNvFxvFTb
	J5rJ3azU4eGgOLtfC/dqwRcF+xkFEKEentShD/7yPUV8f7IuM+aNa4YcTm7RM0cG4RPe
	nHae4dhQYQzcDXTAXkE1wX/p8wl6g5leCOPSyLl2h75ffHHEQdTre3U5VA8LQn/8mwd/
	2SAgAjsHni9GF0lvvijNrmnve4ow+el4xVRlYn3lMiecWlSXcpm5e7p5h7ccv3/s9wlK
	tsdQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 35/39] tools: change struct precopy_stats to precopy_stats_t
Date: Mon, 11 Jan 2021 18:42:20 +0100
Message-Id: <20210111174224.24714-36-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will help libxl_save_msgs_gen.pl to copy the struct as a region of memory.

No change in behavior intented.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/include/xenguest.h        | 7 +++----
 tools/libs/guest/xg_sr_common.h | 2 +-
 tools/libs/guest/xg_sr_save.c   | 6 +++---
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 775cf34c04..b567d7e0ec 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -435,18 +435,17 @@ static inline xen_pfn_t xc_dom_p2m(struct xc_dom_image *dom, xen_pfn_t pfn)
 struct xenevtchn_handle;
 
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
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index f76af23bcc..ba2f7e72b1 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -271,7 +271,7 @@ struct xc_sr_context
             size_t pages_sent;
             size_t overhead_sent;
 
-            struct precopy_stats stats;
+            precopy_stats_t stats;
 
             unsigned int nr_batch_pfns;
             unsigned long *deferred_pages;
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index d766384ed6..c86180730f 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
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

