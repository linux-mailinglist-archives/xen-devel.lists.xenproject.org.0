Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DE27889CD
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 16:01:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590940.923306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZXMm-0000Gx-U8; Fri, 25 Aug 2023 14:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590940.923306; Fri, 25 Aug 2023 14:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZXMm-0000Eu-RK; Fri, 25 Aug 2023 14:00:48 +0000
Received: by outflank-mailman (input) for mailman id 590940;
 Fri, 25 Aug 2023 14:00:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sFgK=EK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qZXMl-0000Eo-Rw
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 14:00:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9a901e2-434f-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 16:00:46 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 2873E4EE0737;
 Fri, 25 Aug 2023 16:00:45 +0200 (CEST)
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
X-Inumbo-ID: c9a901e2-434f-11ee-8783-cb3800f73035
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v3] arm64/vfp: address MISRA C:2012 Dir 4.3
Date: Fri, 25 Aug 2023 16:00:23 +0200
Message-Id: <eb05e70faaae3c328bfd3cc6c1aa4c7c90a351fd.1692971966.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Directive 4.3 prescribes the following:
"Assembly language shall be encapsulated and isolated",
on the grounds of improved readability and ease of maintenance.

A static inline function is the chosen encapsulation mechanism.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
- Switched to a static inline function
Changes in v3:
- Applied changes suggested by Michal
---
 xen/arch/arm/arm64/vfp.c | 82 +++++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 38 deletions(-)

diff --git a/xen/arch/arm/arm64/vfp.c b/xen/arch/arm/arm64/vfp.c
index 2d0d7c2e6ddb..c4f89c7b0e33 100644
--- a/xen/arch/arm/arm64/vfp.c
+++ b/xen/arch/arm/arm64/vfp.c
@@ -4,6 +4,48 @@
 #include <asm/vfp.h>
 #include <asm/arm64/sve.h>
 
+static inline void save_state(uint64_t *fpregs)
+{
+    asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
+                 "stp q2, q3, [%1, #16 * 2]\n\t"
+                 "stp q4, q5, [%1, #16 * 4]\n\t"
+                 "stp q6, q7, [%1, #16 * 6]\n\t"
+                 "stp q8, q9, [%1, #16 * 8]\n\t"
+                 "stp q10, q11, [%1, #16 * 10]\n\t"
+                 "stp q12, q13, [%1, #16 * 12]\n\t"
+                 "stp q14, q15, [%1, #16 * 14]\n\t"
+                 "stp q16, q17, [%1, #16 * 16]\n\t"
+                 "stp q18, q19, [%1, #16 * 18]\n\t"
+                 "stp q20, q21, [%1, #16 * 20]\n\t"
+                 "stp q22, q23, [%1, #16 * 22]\n\t"
+                 "stp q24, q25, [%1, #16 * 24]\n\t"
+                 "stp q26, q27, [%1, #16 * 26]\n\t"
+                 "stp q28, q29, [%1, #16 * 28]\n\t"
+                 "stp q30, q31, [%1, #16 * 30]\n\t"
+                 : "=Q" (*fpregs) : "r" (fpregs));
+}
+
+static inline void restore_state(const uint64_t *fpregs)
+{
+    asm volatile("ldp q0, q1, [%1, #16 * 0]\n\t"
+                 "ldp q2, q3, [%1, #16 * 2]\n\t"
+                 "ldp q4, q5, [%1, #16 * 4]\n\t"
+                 "ldp q6, q7, [%1, #16 * 6]\n\t"
+                 "ldp q8, q9, [%1, #16 * 8]\n\t"
+                 "ldp q10, q11, [%1, #16 * 10]\n\t"
+                 "ldp q12, q13, [%1, #16 * 12]\n\t"
+                 "ldp q14, q15, [%1, #16 * 14]\n\t"
+                 "ldp q16, q17, [%1, #16 * 16]\n\t"
+                 "ldp q18, q19, [%1, #16 * 18]\n\t"
+                 "ldp q20, q21, [%1, #16 * 20]\n\t"
+                 "ldp q22, q23, [%1, #16 * 22]\n\t"
+                 "ldp q24, q25, [%1, #16 * 24]\n\t"
+                 "ldp q26, q27, [%1, #16 * 26]\n\t"
+                 "ldp q28, q29, [%1, #16 * 28]\n\t"
+                 "ldp q30, q31, [%1, #16 * 30]\n\t"
+                 : : "Q" (*fpregs), "r" (fpregs));
+}
+
 void vfp_save_state(struct vcpu *v)
 {
     if ( !cpu_has_fp )
@@ -12,25 +54,7 @@ void vfp_save_state(struct vcpu *v)
     if ( is_sve_domain(v->domain) )
         sve_save_state(v);
     else
-    {
-        asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
-                     "stp q2, q3, [%1, #16 * 2]\n\t"
-                     "stp q4, q5, [%1, #16 * 4]\n\t"
-                     "stp q6, q7, [%1, #16 * 6]\n\t"
-                     "stp q8, q9, [%1, #16 * 8]\n\t"
-                     "stp q10, q11, [%1, #16 * 10]\n\t"
-                     "stp q12, q13, [%1, #16 * 12]\n\t"
-                     "stp q14, q15, [%1, #16 * 14]\n\t"
-                     "stp q16, q17, [%1, #16 * 16]\n\t"
-                     "stp q18, q19, [%1, #16 * 18]\n\t"
-                     "stp q20, q21, [%1, #16 * 20]\n\t"
-                     "stp q22, q23, [%1, #16 * 22]\n\t"
-                     "stp q24, q25, [%1, #16 * 24]\n\t"
-                     "stp q26, q27, [%1, #16 * 26]\n\t"
-                     "stp q28, q29, [%1, #16 * 28]\n\t"
-                     "stp q30, q31, [%1, #16 * 30]\n\t"
-                     : "=Q" (*v->arch.vfp.fpregs) : "r" (v->arch.vfp.fpregs));
-    }
+        save_state(v->arch.vfp.fpregs);
 
     v->arch.vfp.fpsr = READ_SYSREG(FPSR);
     v->arch.vfp.fpcr = READ_SYSREG(FPCR);
@@ -46,25 +70,7 @@ void vfp_restore_state(struct vcpu *v)
     if ( is_sve_domain(v->domain) )
         sve_restore_state(v);
     else
-    {
-        asm volatile("ldp q0, q1, [%1, #16 * 0]\n\t"
-                     "ldp q2, q3, [%1, #16 * 2]\n\t"
-                     "ldp q4, q5, [%1, #16 * 4]\n\t"
-                     "ldp q6, q7, [%1, #16 * 6]\n\t"
-                     "ldp q8, q9, [%1, #16 * 8]\n\t"
-                     "ldp q10, q11, [%1, #16 * 10]\n\t"
-                     "ldp q12, q13, [%1, #16 * 12]\n\t"
-                     "ldp q14, q15, [%1, #16 * 14]\n\t"
-                     "ldp q16, q17, [%1, #16 * 16]\n\t"
-                     "ldp q18, q19, [%1, #16 * 18]\n\t"
-                     "ldp q20, q21, [%1, #16 * 20]\n\t"
-                     "ldp q22, q23, [%1, #16 * 22]\n\t"
-                     "ldp q24, q25, [%1, #16 * 24]\n\t"
-                     "ldp q26, q27, [%1, #16 * 26]\n\t"
-                     "ldp q28, q29, [%1, #16 * 28]\n\t"
-                     "ldp q30, q31, [%1, #16 * 30]\n\t"
-                     : : "Q" (*v->arch.vfp.fpregs), "r" (v->arch.vfp.fpregs));
-    }
+        restore_state(v->arch.vfp.fpregs);
 
     WRITE_SYSREG(v->arch.vfp.fpsr, FPSR);
     WRITE_SYSREG(v->arch.vfp.fpcr, FPCR);
-- 
2.34.1


