Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A9D90408A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 17:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738556.1145376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3og-0005gx-AB; Tue, 11 Jun 2024 15:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738556.1145376; Tue, 11 Jun 2024 15:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3og-0005al-3T; Tue, 11 Jun 2024 15:53:46 +0000
Received: by outflank-mailman (input) for mailman id 738556;
 Tue, 11 Jun 2024 15:53:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sLxx=NN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sH3oe-0005DH-8P
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 15:53:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c75677dd-280a-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 17:53:43 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 830934EE0756;
 Tue, 11 Jun 2024 17:53:42 +0200 (CEST)
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
X-Inumbo-ID: c75677dd-280a-11ef-90a3-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH 3/6] xen/guest_access: address violations of MISRA rule 20.7
Date: Tue, 11 Jun 2024 17:53:33 +0200
Message-Id: <2dbc4b40261b91de2148e467ce0fdade5cc89c50.1718117557.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718117557.git.nicola.vetrini@bugseng.com>
References: <cover.1718117557.git.nicola.vetrini@bugseng.com>
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
 xen/include/xen/guest_access.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/guest_access.h b/xen/include/xen/guest_access.h
index af33ae3ab652..8bd2a124e823 100644
--- a/xen/include/xen/guest_access.h
+++ b/xen/include/xen/guest_access.h
@@ -49,9 +49,9 @@
     ((XEN_GUEST_HANDLE(type)) { &(hnd).p->fld })
 
 #define guest_handle_from_ptr(ptr, type)        \
-    ((XEN_GUEST_HANDLE_PARAM(type)) { (type *)ptr })
+    ((XEN_GUEST_HANDLE_PARAM(type)) { (type *)(ptr) })
 #define const_guest_handle_from_ptr(ptr, type)  \
-    ((XEN_GUEST_HANDLE_PARAM(const_##type)) { (const type *)ptr })
+    ((XEN_GUEST_HANDLE_PARAM(const_##type)) { (const type *)(ptr) })
 
 /*
  * Copy an array of objects to guest context via a guest handle,
-- 
2.34.1


