Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D9D91E0E7
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 15:36:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751597.1159614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHD1-0002Ta-0A; Mon, 01 Jul 2024 13:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751597.1159614; Mon, 01 Jul 2024 13:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHD0-0002QE-Ss; Mon, 01 Jul 2024 13:36:42 +0000
Received: by outflank-mailman (input) for mailman id 751597;
 Mon, 01 Jul 2024 13:36:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FOPt=OB=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sOHCz-0001bF-HB
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 13:36:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f22be3b9-37ae-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 15:36:40 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 133A84EE0738;
 Mon,  1 Jul 2024 15:36:36 +0200 (CEST)
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
X-Inumbo-ID: f22be3b9-37ae-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: nicola.vetrini@bugseng.com,
	consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [PATCH 07/17] xen/common: address violations of MISRA C:2012 Directive 4.10
Date: Mon,  1 Jul 2024 15:36:02 +0200
Message-Id: <431bb9460df122ffa9f34c5f5ea4d13d6ca00963.1719829101.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Simone Ballarin <simone.ballarin@bugseng.com>

Add inclusion guards to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

---
Changes in v4:
- drop XEN_ prefix from inclusion guard, according to the feedback received
Changes in v3:
- remove trailing underscores
- change inclusion guard name to adhere to the new standard
Changes in v2:
- drop changes in C files
---
 xen/common/decompress.h    | 5 +++++
 xen/common/event_channel.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/xen/common/decompress.h b/xen/common/decompress.h
index e8195b353a..9bf20e6a2d 100644
--- a/xen/common/decompress.h
+++ b/xen/common/decompress.h
@@ -1,3 +1,6 @@
+#ifndef COMMON_DECOMPRESS_H
+#define COMMON_DECOMPRESS_H
+
 #ifdef __XEN__
 
 #include <xen/cache.h>
@@ -23,3 +26,5 @@
 #define large_free free
 
 #endif
+
+#endif /* COMMON_DECOMPRESS_H */
diff --git a/xen/common/event_channel.h b/xen/common/event_channel.h
index 45219ca67c..502ac39a48 100644
--- a/xen/common/event_channel.h
+++ b/xen/common/event_channel.h
@@ -1,5 +1,8 @@
 /* Event channel handling private header. */
 
+#ifndef COMMON_EVENT_CHANNEL_H
+#define COMMON_EVENT_CHANNEL_H
+
 #include <xen/event.h>
 
 static inline unsigned int max_evtchns(const struct domain *d)
@@ -52,6 +55,8 @@ int evtchn_fifo_init_control(struct evtchn_init_control *init_control);
 int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array);
 void evtchn_fifo_destroy(struct domain *d);
 
+#endif /* COMMON_EVENT_CHANNEL_H */
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


