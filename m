Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C50278B329
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 16:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591521.923977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadFq-00046c-VR; Mon, 28 Aug 2023 14:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591521.923977; Mon, 28 Aug 2023 14:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadFq-0003wn-Ir; Mon, 28 Aug 2023 14:30:10 +0000
Received: by outflank-mailman (input) for mailman id 591521;
 Mon, 28 Aug 2023 13:20:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ5s=EN=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qacAT-00031h-7K
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 13:20:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa5f419c-45a5-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 15:20:32 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id F391E4EE0C89;
 Mon, 28 Aug 2023 15:20:31 +0200 (CEST)
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
X-Inumbo-ID: aa5f419c-45a5-11ee-8783-cb3800f73035
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 09/13] xen/common: address violations of MISRA C:2012 Directive 4.10
Date: Mon, 28 Aug 2023 15:20:06 +0200
Message-Id: <fe1768342df0cd9315af87c83cc6d8d09f61b983.1693228255.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693228255.git.simone.ballarin@bugseng.com>
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add inclusion guards to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Also C files, if included somewhere, need to comply with the guideline.

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/common/compat/grant_table.c | 7 +++++++
 xen/common/coverage/gcc_4_7.c   | 5 +++++
 xen/common/decompress.h         | 5 +++++
 xen/common/event_channel.h      | 5 +++++
 xen/common/multicall.c          | 5 +++++
 5 files changed, 27 insertions(+)

diff --git a/xen/common/compat/grant_table.c b/xen/common/compat/grant_table.c
index f8177c84c0..614ad71a59 100644
--- a/xen/common/compat/grant_table.c
+++ b/xen/common/compat/grant_table.c
@@ -3,6 +3,10 @@
  *
  */
 
+
+#ifndef __COMMON_COMPAT_GRANT_TABLE_C__
+#define __COMMON_COMPAT_GRANT_TABLE_C__
+
 #include <xen/hypercall.h>
 #include <compat/grant_table.h>
 
@@ -331,6 +335,9 @@ int compat_grant_table_op(
     return rc;
 }
 
+
+#endif /* __COMMON_COMPAT_GRANT_TABLE_C__ */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/coverage/gcc_4_7.c b/xen/common/coverage/gcc_4_7.c
index 25b4a8bcdc..12e4ec8cbb 100644
--- a/xen/common/coverage/gcc_4_7.c
+++ b/xen/common/coverage/gcc_4_7.c
@@ -14,6 +14,9 @@
  *    Wei Liu <wei.liu2@citrix.com>
  */
 
+#ifndef __COMMON_COVERAGE_GCC_4_7_C__
+#define __COMMON_COVERAGE_GCC_4_7_C__
+
 #include <xen/string.h>
 
 #include "gcov.h"
@@ -193,6 +196,8 @@ size_t gcov_info_to_gcda(char *buffer, const struct gcov_info *info)
     return pos;
 }
 
+#endif /* __COMMON_COVERAGE_GCC_4_7_C__ */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/decompress.h b/xen/common/decompress.h
index e8195b353a..da3c3abb6a 100644
--- a/xen/common/decompress.h
+++ b/xen/common/decompress.h
@@ -1,3 +1,6 @@
+#ifndef __COMMON_DECOMPRESS_H__
+#define __COMMON_DECOMPRESS_H__
+
 #ifdef __XEN__
 
 #include <xen/cache.h>
@@ -23,3 +26,5 @@
 #define large_free free
 
 #endif
+
+#endif /* __COMMON_DECOMPRESS_H__ */
diff --git a/xen/common/event_channel.h b/xen/common/event_channel.h
index 45219ca67c..040bad77f9 100644
--- a/xen/common/event_channel.h
+++ b/xen/common/event_channel.h
@@ -1,5 +1,8 @@
 /* Event channel handling private header. */
 
+#ifndef __COMMON_EVENT_CHANNEL_H__
+#define __COMMON_EVENT_CHANNEL_H__
+
 #include <xen/event.h>
 
 static inline unsigned int max_evtchns(const struct domain *d)
@@ -52,6 +55,8 @@ int evtchn_fifo_init_control(struct evtchn_init_control *init_control);
 int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array);
 void evtchn_fifo_destroy(struct domain *d);
 
+#endif /* __COMMON_EVENT_CHANNEL_H__ */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/multicall.c b/xen/common/multicall.c
index 1f0cc4cb26..421bb25b70 100644
--- a/xen/common/multicall.c
+++ b/xen/common/multicall.c
@@ -2,6 +2,9 @@
  * multicall.c
  */
 
+#ifndef __COMMON_MULTICALL_C__
+#define __COMMON_MULTICALL_C__
+
 #include <xen/types.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
@@ -124,6 +127,8 @@ ret_t do_multicall(
         __HYPERVISOR_multicall, "hi", call_list, nr_calls-i);
 }
 
+#endif /* __COMMON_MULTICALL_C__ */
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


