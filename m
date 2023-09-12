Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9220179CC3D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 11:47:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600192.935845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzyx-0006u6-9E; Tue, 12 Sep 2023 09:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600192.935845; Tue, 12 Sep 2023 09:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzyx-0006r5-4z; Tue, 12 Sep 2023 09:46:55 +0000
Received: by outflank-mailman (input) for mailman id 600192;
 Tue, 12 Sep 2023 09:46:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3Pz=E4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qfzr0-0008Jk-Av
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 09:38:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 280b60d6-5150-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 11:38:40 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 0EDA54EE0743;
 Tue, 12 Sep 2023 11:38:40 +0200 (CEST)
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
X-Inumbo-ID: 280b60d6-5150-11ee-9b0d-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 03/10] misra: add deviations for direct inclusion guards
Date: Tue, 12 Sep 2023 11:36:49 +0200
Message-Id: <0c1fb82b539d939e7c6655a9a8f3d7fe8b213cef.1694510856.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694510856.git.simone.ballarin@bugseng.com>
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add deviation comments to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

Inclusion guards must appear at the beginning of the headers
(comments are permitted anywhere).

This patch adds deviation comments using the format specified
in docs/misra/safe.json for headers with just the direct
inclusion guard before the inclusion guard since they are
safe and not supposed to comply with the directive.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

---
The patch has been introduced in v2.
---
 docs/misra/safe.json                 | 8 ++++++++
 xen/arch/arm/include/asm/hypercall.h | 1 +
 xen/arch/x86/include/asm/hypercall.h | 1 +
 xen/include/xen/unaligned.h          | 1 +
 4 files changed, 11 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index e8e200cb0a..0ec594f6bf 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -36,6 +36,14 @@
         },
         {
             "id": "SAF-4-safe",
+            "analyser": {
+                "eclair": "MC3R1.D4.10"
+            },
+            "name": "Dir 4.10: direct inclusion guard before",
+            "text": "Headers with just the direct inclusion guard before the inclusion guard are safe."
+        },
+        {
+            "id": "SAF-5-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/arm/include/asm/hypercall.h b/xen/arch/arm/include/asm/hypercall.h
index ccd26c5184..24f8c61a73 100644
--- a/xen/arch/arm/include/asm/hypercall.h
+++ b/xen/arch/arm/include/asm/hypercall.h
@@ -1,3 +1,4 @@
+/* SAF-3-safe direct inclusion guard before */
 #ifndef __XEN_HYPERCALL_H__
 #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
 #endif
diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index ec2edc771e..dfdfe80021 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -2,6 +2,7 @@
  * asm-x86/hypercall.h
  */
 
+/* SAF-3-safe direct inclusion guard before */
 #ifndef __XEN_HYPERCALL_H__
 #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
 #endif
diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
index 0a2b16d05d..190ada7800 100644
--- a/xen/include/xen/unaligned.h
+++ b/xen/include/xen/unaligned.h
@@ -3,6 +3,7 @@
  * without faulting, and at least reasonably efficiently.  Other architectures
  * will need to have a custom asm/unaligned.h.
  */
+/* SAF-3-safe direct inclusion guard before */
 #ifndef __ASM_UNALIGNED_H__
 #error "xen/unaligned.h should not be included directly - include asm/unaligned.h instead"
 #endif
-- 
2.34.1


