Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E5488FD0B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 11:30:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698873.1091087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpn10-0007JQ-CR; Thu, 28 Mar 2024 10:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698873.1091087; Thu, 28 Mar 2024 10:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpn10-0007G0-8t; Thu, 28 Mar 2024 10:29:46 +0000
Received: by outflank-mailman (input) for mailman id 698873;
 Thu, 28 Mar 2024 10:29:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cj01=LC=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rpn0y-0006m1-Ge
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 10:29:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11caa065-ecee-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 11:29:34 +0100 (CET)
Received: from beta.bugseng.com (unknown [176.206.12.122])
 by support.bugseng.com (Postfix) with ESMTPSA id 73F9F4EE0744;
 Thu, 28 Mar 2024 11:29:40 +0100 (CET)
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
X-Inumbo-ID: 11caa065-ecee-11ee-a1ef-f123f15fe8a2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v3 2/2] MISRA C Rule 20.7 states: "The features of `<stdarg.h>' shall not be used"
Date: Thu, 28 Mar 2024 11:29:35 +0100
Message-Id: <97008d1b28eb922b3c0041830b09e827396aa0ec.1711621080.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711621080.git.simone.ballarin@bugseng.com>
References: <cover.1711621080.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Xen community wants to avoid using variadic functions except for
specific circumstances where it feels appropriate by strict code review.

Functions hypercall_create_continuation and hypercall_xlat_continuation
are internal helper functions made to break long running hypercalls into
multiple calls. They take a variable number of arguments depending on the
original hypercall they are trying to continue.

Add SAF deviations for the aforementioned functions.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

---
Changes in v3:
- rebase: change SAF-3-safe to SAF-4-safe.
Changes in v2:
- replaced "special hypercalls" with "internal helper functions".
---
 docs/misra/safe.json     | 8 ++++++++
 xen/arch/arm/domain.c    | 1 +
 xen/arch/x86/hypercall.c | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index d361d0e65c..fe2bc18509 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -36,6 +36,14 @@
         },
         {
             "id": "SAF-4-safe",
+            "analyser": {
+                "eclair": "MC3R1.R17.1"
+            },
+            "name": "Rule 17.1: internal helper functions made to break long running hypercalls into multiple calls.",
+            "text": "They need to take a variable number of arguments depending on the original hypercall they are trying to continue."
+        },
+        {
+            "id": "SAF-5-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index f38cb5e04c..34cbfe699a 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -382,6 +382,7 @@ unsigned long hypercall_create_continuation(
     const char *p = format;
     unsigned long arg, rc;
     unsigned int i;
+    /* SAF-4-safe allowed variadic function */
     va_list args;
 
     current->hcall_preempted = true;
diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
index 01cd73040d..133e9f221c 100644
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -31,6 +31,7 @@ unsigned long hypercall_create_continuation(
     const char *p = format;
     unsigned long arg;
     unsigned int i;
+    /* SAF-4-safe allowed variadic function */
     va_list args;
 
     curr->hcall_preempted = true;
@@ -115,6 +116,7 @@ int hypercall_xlat_continuation(unsigned int *id, unsigned int nr,
     struct cpu_user_regs *regs;
     unsigned int i, cval = 0;
     unsigned long nval = 0;
+    /* SAF-4-safe allowed variadic function */
     va_list args;
 
     ASSERT(nr <= ARRAY_SIZE(mcs->call.args));
-- 
2.34.1


