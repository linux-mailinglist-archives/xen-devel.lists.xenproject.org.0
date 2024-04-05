Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778FD899926
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 11:15:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701164.1095387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsfes-0008RN-DU; Fri, 05 Apr 2024 09:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701164.1095387; Fri, 05 Apr 2024 09:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsfes-0008Na-4t; Fri, 05 Apr 2024 09:14:50 +0000
Received: by outflank-mailman (input) for mailman id 701164;
 Fri, 05 Apr 2024 09:14:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUTm=LK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rsfer-0007cm-7p
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 09:14:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2db2379-f32c-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 11:14:47 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id B86004EE073F;
 Fri,  5 Apr 2024 11:14:46 +0200 (CEST)
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
X-Inumbo-ID: f2db2379-f32c-11ee-afe6-a90da7624cb6
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
Subject: [XEN PATCH v2 5/9] xen/domctl: address violations of MISRA C Rule 16.2
Date: Fri,  5 Apr 2024 11:14:33 +0200
Message-Id: <5ba6dafed08ca148f7ea92e4c8f7fc947f825cd0.1712305581.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712305581.git.nicola.vetrini@bugseng.com>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the first clauses so that a violation of
MISRA C Rule 16.2 is resolved (a switch label should be immediately
enclosed in the compound statement of the switch).
Note that the switch clause ending with the pseudo
keyword "fallthrough" is an allowed exception to Rule 16.3.

Convert fallthrough comments in other clauses to the pseudo-keyword
while at it.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/domctl.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index f2e0e36a17c3..cad0ff9d2ec0 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -293,6 +293,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 
     switch ( op->cmd )
     {
+    case XEN_DOMCTL_createdomain:
+        d = NULL;
+        break;
     case XEN_DOMCTL_assign_device:
     case XEN_DOMCTL_deassign_device:
         if ( op->domain == DOMID_IO )
@@ -302,16 +305,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         }
         else if ( op->domain == DOMID_INVALID )
             return -ESRCH;
-        /* fall through */
+        fallthrough;
     case XEN_DOMCTL_test_assign_device:
     case XEN_DOMCTL_vm_event_op:
         if ( op->domain == DOMID_INVALID )
         {
-    case XEN_DOMCTL_createdomain:
             d = NULL;
             break;
         }
-        /* fall through */
+        fallthrough;
     default:
         d = rcu_lock_domain_by_id(op->domain);
         if ( !d )
-- 
2.34.1


