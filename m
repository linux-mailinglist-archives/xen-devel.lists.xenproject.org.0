Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A02A8887036
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 17:02:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696954.1088219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnhLQ-0001Jn-4D; Fri, 22 Mar 2024 16:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696954.1088219; Fri, 22 Mar 2024 16:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnhLP-0001G1-V6; Fri, 22 Mar 2024 16:02:11 +0000
Received: by outflank-mailman (input) for mailman id 696954;
 Fri, 22 Mar 2024 16:02:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kYs8=K4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rnhLP-0000WB-DB
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 16:02:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89d1882e-e865-11ee-afe0-a90da7624cb6;
 Fri, 22 Mar 2024 17:02:09 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 0B02A4EE0C90;
 Fri, 22 Mar 2024 17:02:09 +0100 (CET)
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
X-Inumbo-ID: 89d1882e-e865-11ee-afe0-a90da7624cb6
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	George Dunlap <george.dunlap@citrix.com>
Subject: [XEN PATCH 04/11] xentrace: address violation of MISRA C Rule 20.7
Date: Fri, 22 Mar 2024 17:01:53 +0100
Message-Id: <06c112784c54fcd87792bb96515ecdf91b2109c3.1711118582.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711118582.git.nicola.vetrini@bugseng.com>
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
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
 xen/include/public/trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/public/trace.h b/xen/include/public/trace.h
index 62a179971d2a..3c9f9c3c18b2 100644
--- a/xen/include/public/trace.h
+++ b/xen/include/public/trace.h
@@ -67,7 +67,7 @@
 #define TRC_SCHED_CLASS_EVT(_c, _e) \
   ( ( TRC_SCHED_CLASS | \
       ((TRC_SCHED_##_c << TRC_SCHED_ID_SHIFT) & TRC_SCHED_ID_MASK) ) + \
-    (_e & TRC_SCHED_EVT_MASK) )
+    ((_e) & TRC_SCHED_EVT_MASK) )
 
 /* Trace classes for DOM0 operations */
 #define TRC_DOM0_DOMOPS     0x00041000   /* Domains manipulations */
-- 
2.34.1


