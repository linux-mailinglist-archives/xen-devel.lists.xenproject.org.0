Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B95C876E5A8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 12:27:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576227.902162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVYW-0002jO-BE; Thu, 03 Aug 2023 10:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576227.902162; Thu, 03 Aug 2023 10:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVYW-0002fQ-7G; Thu, 03 Aug 2023 10:27:44 +0000
Received: by outflank-mailman (input) for mailman id 576227;
 Thu, 03 Aug 2023 10:27:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYgs=DU=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qRVYU-0000aV-Sk
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 10:27:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6038b78b-31e8-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 12:27:41 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 8CAAA4EE0740;
 Thu,  3 Aug 2023 12:27:40 +0200 (CEST)
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
X-Inumbo-ID: 6038b78b-31e8-11ee-8613-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 13/13] xen: address violations of MISRA C:2012 Rule 7.3
Date: Thu,  3 Aug 2023 12:22:28 +0200
Message-Id: <5b625185f779b9903463b8abd1aabfe7d5d8e548.1691053438.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691053438.git.simone.ballarin@bugseng.com>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
states:
"The lowercase character 'l' shall not be used in a literal suffix".

Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.

The changes in this patch are mechanical.

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/include/xen/bitops.h  | 8 ++++----
 xen/include/xen/tasklet.h | 4 ++--
 xen/include/xen/time.h    | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index e926047932..654f525fb4 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -186,12 +186,12 @@ static inline unsigned int generic_hweight64(uint64_t w)
     if ( BITS_PER_LONG < 64 )
         return generic_hweight32(w >> 32) + generic_hweight32(w);
 
-    w -= (w >> 1) & 0x5555555555555555ul;
-    w =  (w & 0x3333333333333333ul) + ((w >> 2) & 0x3333333333333333ul);
-    w =  (w + (w >> 4)) & 0x0f0f0f0f0f0f0f0ful;
+    w -= (w >> 1) & 0x5555555555555555UL;
+    w =  (w & 0x3333333333333333UL) + ((w >> 2) & 0x3333333333333333UL);
+    w =  (w + (w >> 4)) & 0x0f0f0f0f0f0f0f0fUL;
 
     if ( IS_ENABLED(CONFIG_HAS_FAST_MULTIPLY) )
-        return (w * 0x0101010101010101ul) >> 56;
+        return (w * 0x0101010101010101UL) >> 56;
 
     w += w >> 8;
     w += w >> 16;
diff --git a/xen/include/xen/tasklet.h b/xen/include/xen/tasklet.h
index ea73171f6e..193acf8f42 100644
--- a/xen/include/xen/tasklet.h
+++ b/xen/include/xen/tasklet.h
@@ -37,8 +37,8 @@ struct tasklet
 DECLARE_PER_CPU(unsigned long, tasklet_work_to_do);
 #define _TASKLET_enqueued  0 /* Tasklet work is enqueued for this CPU. */
 #define _TASKLET_scheduled 1 /* Scheduler has scheduled do_tasklet(). */
-#define TASKLET_enqueued   (1ul << _TASKLET_enqueued)
-#define TASKLET_scheduled  (1ul << _TASKLET_scheduled)
+#define TASKLET_enqueued   (1UL << _TASKLET_enqueued)
+#define TASKLET_scheduled  (1UL << _TASKLET_scheduled)
 
 static inline bool tasklet_work_to_do(unsigned int cpu)
 {
diff --git a/xen/include/xen/time.h b/xen/include/xen/time.h
index 9ceaec541f..5aafdda4f3 100644
--- a/xen/include/xen/time.h
+++ b/xen/include/xen/time.h
@@ -57,9 +57,9 @@ struct tm wallclock_time(uint64_t *ns);
 #define SECONDS(_s)     ((s_time_t)((_s)  * 1000000000ULL))
 #define MILLISECS(_ms)  ((s_time_t)((_ms) * 1000000ULL))
 #define MICROSECS(_us)  ((s_time_t)((_us) * 1000ULL))
-#define STIME_MAX ((s_time_t)((uint64_t)~0ull>>1))
+#define STIME_MAX ((s_time_t)((uint64_t)~0ULL>>1))
 /* Chosen so (NOW() + delta) wont overflow without an uptime of 200 years */
-#define STIME_DELTA_MAX ((s_time_t)((uint64_t)~0ull>>2))
+#define STIME_DELTA_MAX ((s_time_t)((uint64_t)~0ULL>>2))
 
 /* Explicitly OR with 1 just in case version number gets out of sync. */
 #define version_update_begin(v) (((v) + 1) | 1)
-- 
2.34.1


