Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B61818608
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 12:06:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656669.1025043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXvR-0004Oe-BJ; Tue, 19 Dec 2023 11:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656669.1025043; Tue, 19 Dec 2023 11:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXvR-0004KT-3A; Tue, 19 Dec 2023 11:06:13 +0000
Received: by outflank-mailman (input) for mailman id 656669;
 Tue, 19 Dec 2023 11:06:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Div9=H6=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rFXvP-0003cc-4X
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 11:06:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d234269-9e5e-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 12:06:09 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id DBB564EE0C96;
 Tue, 19 Dec 2023 12:06:08 +0100 (CET)
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
X-Inumbo-ID: 9d234269-9e5e-11ee-9b0f-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [PATCH v2 5/6] xen: remove unused function ERR_CAST
Date: Tue, 19 Dec 2023 12:05:13 +0100
Message-Id: <e6152a631d3bb6ad4c798fe9d795b360100d63f5.1702982442.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
References: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

Function ERR_CAST contains a violation of MISRA C:2012 Rule 11.8,
whose headline states:
"A conversion shall not remove any const, volatile or _Atomic qualification
from the type pointed to by a pointer".

Since the function has no users, it is appropriate to remove it.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
Commit introduced in v2.
---
 xen/include/xen/err.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/xen/include/xen/err.h b/xen/include/xen/err.h
index 2f29b57d28..cbdd1bf7f8 100644
--- a/xen/include/xen/err.h
+++ b/xen/include/xen/err.h
@@ -36,19 +36,6 @@ static inline long __must_check IS_ERR_OR_NULL(const void *ptr)
 	return !ptr || IS_ERR_VALUE((unsigned long)ptr);
 }
 
-/**
- * ERR_CAST - Explicitly cast an error-valued pointer to another pointer type
- * @ptr: The pointer to cast.
- *
- * Explicitly cast an error-valued pointer to another pointer type in such a
- * way as to make it clear that's what's going on.
- */
-static inline void * __must_check ERR_CAST(const void *ptr)
-{
-	/* cast away the const */
-	return (void *)ptr;
-}
-
 static inline int __must_check PTR_RET(const void *ptr)
 {
 	return IS_ERR(ptr) ? PTR_ERR(ptr) : 0;
-- 
2.40.0


