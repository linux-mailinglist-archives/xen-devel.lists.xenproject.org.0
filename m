Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 816C1939C56
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 10:15:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762676.1172913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAgS-0000He-42; Tue, 23 Jul 2024 08:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762676.1172913; Tue, 23 Jul 2024 08:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAgR-0000FF-Vy; Tue, 23 Jul 2024 08:15:43 +0000
Received: by outflank-mailman (input) for mailman id 762676;
 Tue, 23 Jul 2024 08:15:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0IL=OX=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sWAgQ-0007w0-V8
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 08:15:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c03feec9-48cb-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 10:15:41 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-35-51-193.retail.telecomitalia.it [79.35.51.193])
 by support.bugseng.com (Postfix) with ESMTPSA id A5D214EE0744;
 Tue, 23 Jul 2024 10:15:38 +0200 (CEST)
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
X-Inumbo-ID: c03feec9-48cb-11ef-8776-851b0ebba9a2
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [XEN PATCH v5 03/17] misra: add deviations for direct inclusion guards
Date: Tue, 23 Jul 2024 10:14:55 +0200
Message-Id: <f7687205a0177ff695703b77cd125e3842d63afb.1721720583.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Simone Ballarin <simone.ballarin@bugseng.com>

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

Note that with SAF-10-safe in place, failures to have proper guards later
in the header files will not be reported

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

---
Changes in v5:
- rebase against the current staging tree

Changes in v4:
- Added comment clarifying that no further checks will be performed
on a file that has a SAF-10-safe deviation against missing inclusion
guards.
- rebased against the current staging tree

Changes in v3:
- fix inconsistent deviation ID
The patch has been introduced in v2.
---
 docs/misra/safe.json                 | 8 ++++++++
 xen/arch/arm/include/asm/hypercall.h | 1 +
 xen/arch/x86/include/asm/hypercall.h | 1 +
 3 files changed, 10 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index ffa8bfdc4a..684346386e 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -84,6 +84,14 @@
         },
         {
             "id": "SAF-10-safe",
+            "analyser": {
+                "eclair": "MC3R1.D4.10"
+            },
+            "name": "Dir 4.10: direct inclusion guard before",
+            "text": "Headers with just the direct inclusion guard before the inclusion guard are safe."
+        },
+        {
+            "id": "SAF-11-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/arm/include/asm/hypercall.h b/xen/arch/arm/include/asm/hypercall.h
index ccd26c5184..07e231f8b5 100644
--- a/xen/arch/arm/include/asm/hypercall.h
+++ b/xen/arch/arm/include/asm/hypercall.h
@@ -1,3 +1,4 @@
+/* SAF-10-safe direct inclusion guard before */
 #ifndef __XEN_HYPERCALL_H__
 #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
 #endif
diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index ec2edc771e..389fa62af2 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -2,6 +2,7 @@
  * asm-x86/hypercall.h
  */
 
+/* SAF-10-safe direct inclusion guard before */
 #ifndef __XEN_HYPERCALL_H__
 #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
 #endif
-- 
2.34.1


