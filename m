Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F1F87E904
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 12:54:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694616.1083563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBZB-00033t-B9; Mon, 18 Mar 2024 11:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694616.1083563; Mon, 18 Mar 2024 11:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBZB-0002xt-2R; Mon, 18 Mar 2024 11:54:09 +0000
Received: by outflank-mailman (input) for mailman id 694616;
 Mon, 18 Mar 2024 11:54:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QoDm=KY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rmBZ8-0001F3-PA
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 11:54:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38e8a27b-e51e-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 12:54:06 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 338494EE074B;
 Mon, 18 Mar 2024 12:54:05 +0100 (CET)
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
X-Inumbo-ID: 38e8a27b-e51e-11ee-afdd-a90da7624cb6
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
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 09/10] xen/wait: address violations of MISRA C Rule 20.7
Date: Mon, 18 Mar 2024 12:53:52 +0100
Message-Id: <1d9f79590a224b4007f34a609b8024b36dd44a04.1710762555.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710762555.git.nicola.vetrini@bugseng.com>
References: <cover.1710762555.git.nicola.vetrini@bugseng.com>
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
 xen/include/xen/wait.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/wait.h b/xen/include/xen/wait.h
index 6eb7667d9c7f..1c68bc564b09 100644
--- a/xen/include/xen/wait.h
+++ b/xen/include/xen/wait.h
@@ -40,12 +40,12 @@ do {                                            \
     if ( condition )                            \
         break;                                  \
     for ( ; ; ) {                               \
-        prepare_to_wait(&wq);                   \
+        prepare_to_wait(&(wq));                 \
         if ( condition )                        \
             break;                              \
         wait();                                 \
     }                                           \
-    finish_wait(&wq);                           \
+    finish_wait(&(wq));                         \
 } while (0)
 
 /* Private functions. */
-- 
2.34.1


