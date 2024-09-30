Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B26098A374
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 14:50:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807350.1218766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svFqc-0006Dz-KR; Mon, 30 Sep 2024 12:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807350.1218766; Mon, 30 Sep 2024 12:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svFqc-0006B8-Ec; Mon, 30 Sep 2024 12:49:54 +0000
Received: by outflank-mailman (input) for mailman id 807350;
 Mon, 30 Sep 2024 12:49:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LvNS=Q4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1svFqa-0005el-DJ
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 12:49:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b738270-7f2a-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 14:49:51 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.161.44.57])
 by support.bugseng.com (Postfix) with ESMTPSA id 8E5524EE074C;
 Mon, 30 Sep 2024 14:49:49 +0200 (CEST)
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
X-Inumbo-ID: 7b738270-7f2a-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1727700590; bh=tAlH5qx3tE+Jaw9OwhxZVte9uodMsa8rU6Z7XQGTGJU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u3kEpWfdlOTNaxngRs6M4fiXbraQFOJoW1z9LpehVzN30ejy7IH0qIhKVkSoXPcuF
	 O64OCK9wymMLkdpbhbuA3R1Wt5prdinNMm1tsWl4zNUSzt6xWFyV7eGLqH0fGXoCto
	 JQ0LIV/uPGoBfM+oAcKBrnV/fHf9Uqyiru5+sX35nmasde1EsUtcJs85Bge3BUwoL6
	 /Y0PkOqHNxakut4CAUdGe0tKJ4L8OX5aIXElC3Qjbo/1yNl8SgkUKxx9BbHviEBXyp
	 1ZsUCtvkx1A58MLDIh9EZuD9f8Nk0wEkr/TO2gnnxXgwiJlZ9iakwAPxTZ3/pF+Vuo
	 OMrK/E1pqxwQg==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 2/3] xen/gnttab: address a violation of MISRA C Rule 13.6
Date: Mon, 30 Sep 2024 14:49:16 +0200
Message-ID: <cfd2873eb69707ec3f33ea888951ae5676c43bab.1727690180.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1727690180.git.federico.serafini@bugseng.com>
References: <cover.1727690180.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

guest_handle_ok()'s expansion contains a sizeof() involving its
first argument guest_handle_cast().
The expansion of the latter, in turn, contains a variable
initialization.

Since MISRA considers the initialization (even of a local variable)
a side effect, the chain of expansions mentioned above violates
MISRA C:2012 Rule 13.6 (The operand of the `sizeof' operator shall not
contain any expression which has potential side effect).

Refactor the code to address the rule violation.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- better description;
- preserved original indentation.
---
 xen/common/compat/grant_table.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/xen/common/compat/grant_table.c b/xen/common/compat/grant_table.c
index 5ad0debf96..bbb717bf64 100644
--- a/xen/common/compat/grant_table.c
+++ b/xen/common/compat/grant_table.c
@@ -78,12 +78,15 @@ int compat_grant_table_op(
         cmd_op = cmd;
     switch ( cmd_op )
     {
-#define CASE(name) \
-    case GNTTABOP_##name: \
-        if ( unlikely(!guest_handle_okay(guest_handle_cast(uop, \
-                                                           gnttab_##name##_compat_t), \
-                                         count)) ) \
-            rc = -EFAULT; \
+#define CASE(name)                                                  \
+    case GNTTABOP_ ## name:                                         \
+    {                                                               \
+        XEN_GUEST_HANDLE_PARAM(gnttab_ ## name ## _compat_t) h =    \
+            guest_handle_cast(uop, gnttab_ ## name ## _compat_t);   \
+                                                                    \
+        if ( unlikely(!guest_handle_okay(h, count)) )               \
+            rc = -EFAULT;                                           \
+    }                                                               \
         break
 
 #ifndef CHECK_gnttab_map_grant_ref
-- 
2.43.0


