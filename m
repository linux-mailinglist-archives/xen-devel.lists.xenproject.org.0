Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 932A279CC09
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 11:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600151.935785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzrE-0002LE-2Y; Tue, 12 Sep 2023 09:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600151.935785; Tue, 12 Sep 2023 09:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzrD-0002IC-UY; Tue, 12 Sep 2023 09:38:55 +0000
Received: by outflank-mailman (input) for mailman id 600151;
 Tue, 12 Sep 2023 09:38:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3Pz=E4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qfzrC-0000lh-Nm
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 09:38:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3017714e-5150-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 11:38:54 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id A13AF4EE0743;
 Tue, 12 Sep 2023 11:38:53 +0200 (CEST)
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
X-Inumbo-ID: 3017714e-5150-11ee-8786-cb3800f73035
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
Subject: [XEN PATCH v2 07/10] xen/common: address violations of MISRA C:2012 Directive 4.10
Date: Tue, 12 Sep 2023 11:36:53 +0200
Message-Id: <580f202ce2b07a91b496f34dc4b300d8fb23dbc8.1694510856.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694510856.git.simone.ballarin@bugseng.com>
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add inclusion guards to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

---
Changes in v2:
- drop changes in C files
---
 xen/common/decompress.h    | 5 +++++
 xen/common/event_channel.h | 5 +++++
 2 files changed, 10 insertions(+)

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
-- 
2.34.1


