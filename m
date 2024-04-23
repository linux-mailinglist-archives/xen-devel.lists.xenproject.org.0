Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9008B8AEA58
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:13:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710793.1110291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHpg-0006ZA-Mk; Tue, 23 Apr 2024 15:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710793.1110291; Tue, 23 Apr 2024 15:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHpg-0006X1-IS; Tue, 23 Apr 2024 15:13:20 +0000
Received: by outflank-mailman (input) for mailman id 710793;
 Tue, 23 Apr 2024 15:13:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r5BF=L4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rzHpf-0003wh-7J
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:13:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0365ff2f-0184-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 17:13:17 +0200 (CEST)
Received: from nico.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 12D364EE073C;
 Tue, 23 Apr 2024 17:13:13 +0200 (CEST)
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
X-Inumbo-ID: 0365ff2f-0184-11ef-b4bb-af5377834399
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
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
Subject: [XEN PATCH 05/10] xen/spinlock: address violations of MISRA C Rule 20.7
Date: Tue, 23 Apr 2024 17:12:47 +0200
Message-Id: <620466b08df1efb706e757aee05a8d7f7e6e8f4a.1713885065.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713885065.git.nicola.vetrini@bugseng.com>
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
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
 xen/common/spinlock.c      | 2 +-
 xen/include/xen/spinlock.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 5aa9ba618859..558ea7ac3518 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -269,7 +269,7 @@ void spin_debug_disable(void)
         profile->lock_cnt++;                                                 \
     }
 #define LOCK_PROFILE_VAR(var, val)    s_time_t var = (val)
-#define LOCK_PROFILE_BLOCK(var)       var = var ? : NOW()
+#define LOCK_PROFILE_BLOCK(var)       (var) = (var) ? : NOW()
 #define LOCK_PROFILE_BLKACC(tst, val)                                        \
     if ( tst )                                                               \
     {                                                                        \
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 18793c5e29cb..8825affb25ca 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -141,7 +141,7 @@ struct lock_profile_qhead {
         }                                                                     \
         prof->name = #l;                                                      \
         prof->ptr.lockptr = &(s)->l;                                          \
-        prof->is_rlock = isr;                                                 \
+        prof->is_rlock = (isr);                                               \
         prof->next = (s)->profile_head.elem_q;                                \
         (s)->profile_head.elem_q = prof;                                      \
     } while( 0 )
-- 
2.34.1


