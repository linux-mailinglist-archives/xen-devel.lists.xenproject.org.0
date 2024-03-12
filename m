Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4998792CA
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 12:14:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691778.1078118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk050-0001GJ-67; Tue, 12 Mar 2024 11:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691778.1078118; Tue, 12 Mar 2024 11:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk050-0001En-2v; Tue, 12 Mar 2024 11:13:58 +0000
Received: by outflank-mailman (input) for mailman id 691778;
 Tue, 12 Mar 2024 11:13:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=krxI=KS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rk04y-0001Ef-RO
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 11:13:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d014617-e061-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 12:13:54 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id DDE774EE0C90;
 Tue, 12 Mar 2024 12:13:52 +0100 (CET)
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
X-Inumbo-ID: 9d014617-e061-11ee-a1ee-f123f15fe8a2
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
Subject: [XEN PATCH v2] xen/compiler: deviate the inline macro for MISRA C  Rule 20.4
Date: Tue, 12 Mar 2024 12:13:49 +0100
Message-Id: <0e48f35eaa95bbba6c2b8219e412bfd6d9c82b52.1710241987.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 20.4 states: "A macro shall not be defined with the same name
as a keyword".

Defining this macro with the same name as the inline keyword
allows for additionally checking that out-of-lined static inline
functions end up in the correct section while minimizing churn and
has a positive impact on the overall safety. See [1] for additional
context on the motivation of this deviation.

No functional change.

[1] https://lore.kernel.org/xen-devel/adaa6d55-266d-4df8-8967-9340080d17e4@citrix.com/

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Rephrased SAF comment to be more general and added exact motivation
  for the redefinition of "inline" in deviation.rst.
---
 docs/misra/deviations.rst  | 6 ++++++
 docs/misra/safe.json       | 8 ++++++++
 xen/include/xen/compiler.h | 1 +
 3 files changed, 15 insertions(+)

diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 123c78e20a01..f8b40dd1e461 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -322,6 +322,12 @@ Deviations related to MISRA C:2012 Rules:
          - /\* Fallthrough \*/
          - /\* Fallthrough. \*/
 
+   * - R20.4
+     -  The override of the keyword \"inline\" in xen/compiler.h is present so
+        that section contents checks pass when the compiler chooses not to
+        inline a particular function.
+     - Comment-based deviation.
+
    * - R20.7
      - Code violating Rule 20.7 is safe when macro parameters are used:
        (1) as function arguments;
diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 952324f85cf9..d361d0e65ceb 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -28,6 +28,14 @@
         },
         {
             "id": "SAF-3-safe",
+            "analyser": {
+                "eclair": "MC3R1.R20.4"
+            },
+            "name": "MC3R1.R20.4: allow the definition of a macro with the same name as a keyword in some special cases",
+            "text": "The definition of a macro with the same name as a keyword can be useful in certain configurations to improve the guarantees that can be provided by Xen. See docs/misra/deviations.rst for a precise rationale for all such cases."
+        },
+        {
+            "id": "SAF-4-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 16d554f2a593..fc87a2edad7f 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -82,6 +82,7 @@
  * inline functions not expanded inline get placed in .init.text.
  */
 #include <xen/init.h>
+/* SAF-3-safe MISRA C Rule 20.4: allow section checks to pass when not inlined */
 #define inline inline __init
 #endif
 
-- 
2.34.1


