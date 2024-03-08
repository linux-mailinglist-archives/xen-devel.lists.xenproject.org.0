Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F7D87631C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 12:21:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690220.1076008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYHq-0006OX-81; Fri, 08 Mar 2024 11:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690220.1076008; Fri, 08 Mar 2024 11:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYHq-0006Lk-3A; Fri, 08 Mar 2024 11:21:14 +0000
Received: by outflank-mailman (input) for mailman id 690220;
 Fri, 08 Mar 2024 11:21:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PBuc=KO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1riYHo-00067H-2M
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 11:21:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f70e9300-dd3d-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 12:21:10 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 0CAA94EE074D;
 Fri,  8 Mar 2024 12:21:08 +0100 (CET)
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
X-Inumbo-ID: f70e9300-dd3d-11ee-a1ee-f123f15fe8a2
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
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 1/7] xen/spinlock: address violations of MISRA C Rule 20.7
Date: Fri,  8 Mar 2024 12:20:58 +0100
Message-Id: <59e9749d3c6a22469bc9fb804b7b7c13850e9e94.1709896401.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709896401.git.nicola.vetrini@bugseng.com>
References: <cover.1709896401.git.nicola.vetrini@bugseng.com>
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
 xen/include/xen/spinlock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 1cd9120eac7a..0e6a083dfb9e 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -94,7 +94,7 @@ struct lock_profile_qhead {
     int32_t                   idx;     /* index for printout */
 };
 
-#define _LOCK_PROFILE(lockname) { .name = #lockname, .lock = &lockname, }
+#define _LOCK_PROFILE(lockname) { .name = #lockname, .lock = &(lockname), }
 #define _LOCK_PROFILE_PTR(name)                                               \
     static struct lock_profile * const __lock_profile_##name                  \
     __used_section(".lockprofile.data") =                                     \
-- 
2.34.1


