Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B770877C18
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 10:00:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691267.1077099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW7-0008BW-76; Mon, 11 Mar 2024 09:00:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691267.1077099; Mon, 11 Mar 2024 09:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW6-00082p-Jm; Mon, 11 Mar 2024 09:00:18 +0000
Received: by outflank-mailman (input) for mailman id 691267;
 Mon, 11 Mar 2024 09:00:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWeI=KR=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rjbW4-0006iu-8Y
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 09:00:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6687e97-df85-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 10:00:14 +0100 (CET)
Received: from beta.station (net-93-144-106-196.cust.vodafonedsl.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 37EFA4EE0C9B;
 Mon, 11 Mar 2024 10:00:14 +0100 (CET)
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
X-Inumbo-ID: c6687e97-df85-11ee-afdc-a90da7624cb6
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Subject: [XEN PATCH v3 07/16] xen/common: address violations of MISRA C:2012 Directive 4.10
Date: Mon, 11 Mar 2024 09:59:16 +0100
Message-Id: <c76b93f2e02901f2ff006f19413b113e8e0a2925.1710145041.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710145041.git.simone.ballarin@bugseng.com>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add inclusion guards to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>

---
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
index e8195b353a..41848274ab 100644
--- a/xen/common/decompress.h
+++ b/xen/common/decompress.h
@@ -1,3 +1,6 @@
+#ifndef XEN_COMMON_DECOMPRESS_H
+#define XEN_COMMON_DECOMPRESS_H
+
 #ifdef __XEN__
 
 #include <xen/cache.h>
@@ -23,3 +26,5 @@
 #define large_free free
 
 #endif
+
+#endif /* XEN_COMMON_DECOMPRESS_H */
diff --git a/xen/common/event_channel.h b/xen/common/event_channel.h
index 45219ca67c..a23e39a713 100644
--- a/xen/common/event_channel.h
+++ b/xen/common/event_channel.h
@@ -1,5 +1,8 @@
 /* Event channel handling private header. */
 
+#ifndef XEN_COMMON_EVENT_CHANNEL_H
+#define XEN_COMMON_EVENT_CHANNEL_H
+
 #include <xen/event.h>
 
 static inline unsigned int max_evtchns(const struct domain *d)
@@ -52,6 +55,8 @@ int evtchn_fifo_init_control(struct evtchn_init_control *init_control);
 int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array);
 void evtchn_fifo_destroy(struct domain *d);
 
+#endif /* XEN_COMMON_EVENT_CHANNEL_H */
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


