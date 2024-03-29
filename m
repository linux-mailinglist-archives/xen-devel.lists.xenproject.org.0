Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942A1891582
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 10:12:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699282.1092027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq8H6-0001tA-82; Fri, 29 Mar 2024 09:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699282.1092027; Fri, 29 Mar 2024 09:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rq8H6-0001jE-18; Fri, 29 Mar 2024 09:11:48 +0000
Received: by outflank-mailman (input) for mailman id 699282;
 Fri, 29 Mar 2024 09:11:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LGMC=LD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rq8H5-0000x2-0u
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 09:11:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d9a25db-edac-11ee-afe3-a90da7624cb6;
 Fri, 29 Mar 2024 10:11:45 +0100 (CET)
Received: from nico.bugseng.com (unknown [176.206.12.122])
 by support.bugseng.com (Postfix) with ESMTPSA id 1433F4EE0749;
 Fri, 29 Mar 2024 10:11:45 +0100 (CET)
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
X-Inumbo-ID: 5d9a25db-edac-11ee-afe3-a90da7624cb6
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v3 6/7] xen/mm: address violations of MISRA C Rule 20.7
Date: Fri, 29 Mar 2024 10:11:34 +0100
Message-Id: <9fade8c540f19876fe7928ab91398bd5e94594b4.1711700095.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711700095.git.nicola.vetrini@bugseng.com>
References: <cover.1711700095.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/include/xen/mm.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 3e84960a365f..7561297a7553 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -415,15 +415,15 @@ page_list_splice(struct page_list_head *list, struct page_list_head *head)
 }
 
 #define page_list_for_each(pos, head) \
-    for ( pos = (head)->next; pos; pos = page_list_next(pos, head) )
+    for ( (pos) = (head)->next; (pos); (pos) = page_list_next(pos, head) )
 #define page_list_for_each_safe(pos, tmp, head) \
-    for ( pos = (head)->next; \
-          pos ? (tmp = page_list_next(pos, head), 1) : 0; \
-          pos = tmp )
+    for ( (pos) = (head)->next; \
+          (pos) ? ((tmp) = page_list_next(pos, head), 1) : 0; \
+          (pos) = (tmp) )
 #define page_list_for_each_safe_reverse(pos, tmp, head) \
-    for ( pos = (head)->tail; \
-          pos ? (tmp = page_list_prev(pos, head), 1) : 0; \
-          pos = tmp )
+    for ( (pos) = (head)->tail; \
+          (pos) ? ((tmp) = page_list_prev(pos, head), 1) : 0; \
+          (pos) = (tmp) )
 #else
 # define page_list_head                  list_head
 # define PAGE_LIST_HEAD_INIT             LIST_HEAD_INIT
-- 
2.34.1


