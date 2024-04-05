Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 824AE899927
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 11:15:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701161.1095356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsfeq-0007it-Ba; Fri, 05 Apr 2024 09:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701161.1095356; Fri, 05 Apr 2024 09:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsfeq-0007cS-3n; Fri, 05 Apr 2024 09:14:48 +0000
Received: by outflank-mailman (input) for mailman id 701161;
 Fri, 05 Apr 2024 09:14:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUTm=LK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rsfeo-0007WZ-Ti
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 09:14:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f17dc861-f32c-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 11:14:45 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 331774EE0743;
 Fri,  5 Apr 2024 11:14:44 +0200 (CEST)
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
X-Inumbo-ID: f17dc861-f32c-11ee-a1ef-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 2/9] x86/cpuid: address violation of MISRA C Rule 16.2
Date: Fri,  5 Apr 2024 11:14:30 +0200
Message-Id: <f957c92d9a00c66df47fc3cac336e378488b9fea.1712305581.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712305581.git.nicola.vetrini@bugseng.com>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the switch so that a violation of MISRA C Rule 16.2 is resolved
(A switch label shall only be used when the most closely-enclosing
compound statement is the body of a switch statement).
Note that the switch clause ending with the pseudo
keyword "fallthrough" is an allowed exception to Rule 16.3.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/cpuid.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 7290a979c667..0a7c55199f94 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -331,23 +331,22 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
         switch ( subleaf )
         {
         case 1:
-            if ( p->xstate.xsavec || p->xstate.xsaves )
-            {
-                /*
-                 * TODO: Figure out what to do for XSS state.  VT-x manages
-                 * host vs guest MSR_XSS automatically, so as soon as we start
-                 * supporting any XSS states, the wrong XSS will be in
-                 * context.
-                 */
-                BUILD_BUG_ON(XSTATE_XSAVES_ONLY != 0);
-
-                /*
-                 * Read CPUID[0xD,0/1].EBX from hardware.  They vary with
-                 * enabled XSTATE, and appropraite XCR0|XSS are in context.
-                 */
+            if ( !(p->xstate.xsavec || p->xstate.xsaves) )
+                break;
+            /*
+             * TODO: Figure out what to do for XSS state.  VT-x manages
+             * host vs guest MSR_XSS automatically, so as soon as we start
+             * supporting any XSS states, the wrong XSS will be in
+             * context.
+             */
+            BUILD_BUG_ON(XSTATE_XSAVES_ONLY != 0);
+            fallthrough;
         case 0:
-                res->b = cpuid_count_ebx(leaf, subleaf);
-            }
+            /*
+             * Read CPUID[0xD,0/1].EBX from hardware.  They vary with
+             * enabled XSTATE, and appropriate XCR0|XSS are in context.
+             */
+            res->b = cpuid_count_ebx(leaf, subleaf);
             break;
         }
         break;
-- 
2.34.1


