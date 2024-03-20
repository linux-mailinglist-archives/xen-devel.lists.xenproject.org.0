Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F03D880E0A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 09:57:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695809.1085932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrko-0004M7-8D; Wed, 20 Mar 2024 08:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695809.1085932; Wed, 20 Mar 2024 08:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrko-0004K2-5J; Wed, 20 Mar 2024 08:56:58 +0000
Received: by outflank-mailman (input) for mailman id 695809;
 Wed, 20 Mar 2024 08:56:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqSt=K2=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rmrkn-0004Jw-3t
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 08:56:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd140b98-e697-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 09:56:55 +0100 (CET)
Received: from beta.station (net-93-144-106-196.cust.dsl.teletu.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 515034EE073D;
 Wed, 20 Mar 2024 09:56:54 +0100 (CET)
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
X-Inumbo-ID: cd140b98-e697-11ee-a1ee-f123f15fe8a2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 2/2] xen: address violations of MISRA C Rule 17.1
Date: Wed, 20 Mar 2024 09:51:00 +0100
Message-Id: <f7c2f12ab1b62301cfea3a28707178950f480932.1710923235.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710923235.git.simone.ballarin@bugseng.com>
References: <cover.1710923235.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "The features of `<stdarg.h>' shall not be used"

The Xen community wants to avoid using variadic functions except for
specific circumstances where it feels appropriate by strict code review.

Functions hypercall_create_continuation and hypercall_xlat_continuation
are special hypercalls made to break long running hypercalls into multiple
calls. They take a variable number of arguments depending on the original
hypercall they are trying to continue.

Add SAF deviations for the aforementioned functions.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 docs/misra/safe.json     | 8 ++++++++
 xen/arch/arm/domain.c    | 1 +
 xen/arch/x86/hypercall.c | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 952324f85c..65c90c7618 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -28,6 +28,14 @@
         },
         {
             "id": "SAF-3-safe",
+            "analyser": {
+                "eclair": "MC3R1.R17.1"
+            },
+            "name": "Rule 17.1: special hypercall made to break long running hypercalls into multiple calls.",
+            "text": "They need to take a variable number of arguments depending on the original hypercall they are trying to continue."
+        },
+        {
+            "id": "SAF-4-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 5e7a7f3e7e..f5706bd5b8 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -382,6 +382,7 @@ unsigned long hypercall_create_continuation(
     const char *p = format;
     unsigned long arg, rc;
     unsigned int i;
+    /* SAF-3-safe allowed variadic function */
     va_list args;
 
     current->hcall_preempted = true;
diff --git a/xen/arch/x86/hypercall.c b/xen/arch/x86/hypercall.c
index 01cd73040d..18d8c75522 100644
--- a/xen/arch/x86/hypercall.c
+++ b/xen/arch/x86/hypercall.c
@@ -31,6 +31,7 @@ unsigned long hypercall_create_continuation(
     const char *p = format;
     unsigned long arg;
     unsigned int i;
+    /* SAF-3-safe allowed variadic function */
     va_list args;
 
     curr->hcall_preempted = true;
@@ -115,6 +116,7 @@ int hypercall_xlat_continuation(unsigned int *id, unsigned int nr,
     struct cpu_user_regs *regs;
     unsigned int i, cval = 0;
     unsigned long nval = 0;
+    /* SAF-3-safe allowed variadic function */
     va_list args;
 
     ASSERT(nr <= ARRAY_SIZE(mcs->call.args));
-- 
2.34.1


