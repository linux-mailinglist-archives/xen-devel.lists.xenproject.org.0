Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9298376AF6C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 11:47:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574016.899185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlxy-0007J3-9m; Tue, 01 Aug 2023 09:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574016.899185; Tue, 01 Aug 2023 09:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQlxy-0007GS-6R; Tue, 01 Aug 2023 09:46:58 +0000
Received: by outflank-mailman (input) for mailman id 574016;
 Tue, 01 Aug 2023 09:46:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJ0s=DS=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qQlxw-0007G2-JC
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 09:46:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58787a72-3050-11ee-b259-6b7b168915f2;
 Tue, 01 Aug 2023 11:46:55 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-79-35-203-138.retail.telecomitalia.it [79.35.203.138])
 by support.bugseng.com (Postfix) with ESMTPSA id EE4FA4EE0737;
 Tue,  1 Aug 2023 11:46:52 +0200 (CEST)
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
X-Inumbo-ID: 58787a72-3050-11ee-b259-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] xen/spinlock: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Tue,  1 Aug 2023 11:46:46 +0200
Message-Id: <29b6a47a2711f065c02a3d2d94e1a201986cf015.1690882872.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Give a name to unnamed parameters to address violations of
MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
named parameters").
Keep consistency between parameter names and types used in function
declarations and the ones used in the corresponding function
definitions, thus addressing violations of MISRA C:2012 Rule 8.3
("All declarations of an object or function shall use the same names
and type qualifiers").

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/spinlock.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 0a02a527dc..4a1c155e96 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -125,8 +125,9 @@ struct lock_profile_qhead {
     } while(0)
 
 void _lock_profile_register_struct(
-    int32_t, struct lock_profile_qhead *, int32_t);
-void _lock_profile_deregister_struct(int32_t, struct lock_profile_qhead *);
+    int32_t type, struct lock_profile_qhead *qhead, int32_t idx);
+void _lock_profile_deregister_struct(int32_t type,
+                                     struct lock_profile_qhead *qhead);
 
 #define lock_profile_register_struct(type, ptr, idx)                          \
     _lock_profile_register_struct(type, &((ptr)->profile_head), idx)
@@ -178,7 +179,7 @@ typedef struct spinlock {
 #define spin_lock_init(l) (*(l) = (spinlock_t)SPIN_LOCK_UNLOCKED)
 
 void _spin_lock(spinlock_t *lock);
-void _spin_lock_cb(spinlock_t *lock, void (*cond)(void *), void *data);
+void _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data);
 void _spin_lock_irq(spinlock_t *lock);
 unsigned long _spin_lock_irqsave(spinlock_t *lock);
 
-- 
2.34.1


