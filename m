Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC988875F2E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 09:11:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690137.1075878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riVJG-0000hj-HS; Fri, 08 Mar 2024 08:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690137.1075878; Fri, 08 Mar 2024 08:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riVJG-0000f7-EO; Fri, 08 Mar 2024 08:10:30 +0000
Received: by outflank-mailman (input) for mailman id 690137;
 Fri, 08 Mar 2024 08:10:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PBuc=KO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1riVJE-0000f0-KY
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 08:10:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52010593-dd23-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 09:10:26 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id A63524EE0738;
 Fri,  8 Mar 2024 09:10:24 +0100 (CET)
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
X-Inumbo-ID: 52010593-dd23-11ee-a1ee-f123f15fe8a2
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
Subject: [XEN PATCH] xen/compiler: deviate the inline macro for MISRA C  Rule 20.4
Date: Fri,  8 Mar 2024 09:10:21 +0100
Message-Id: <d2b3ae062756a28a040a9553a4f0e621cfdeb5e0.1709885163.git.nicola.vetrini@bugseng.com>
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
 docs/misra/safe.json       | 8 ++++++++
 xen/include/xen/compiler.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 952324f85cf9..a2bbacddf06a 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -28,6 +28,14 @@
         },
         {
             "id": "SAF-3-safe",
+            "analyser": {
+                "eclair": "MC3R1.R20.4"
+            },
+            "name": "MC3R1.R20.4: allow the augmentation of the inline keyword in some build configurations",
+            "text": "The definition of this macro named inline allows further checking in some build configurations that certain symbols end up in the right sections."
+        },
+        {
+            "id": "SAF-4-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 16d554f2a593..e3d9f9fb8e4b 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -82,6 +82,7 @@
  * inline functions not expanded inline get placed in .init.text.
  */
 #include <xen/init.h>
+/* SAF-3-safe MISRA C Rule 20.4: define the inline macro to perform checks */
 #define inline inline __init
 #endif
 
-- 
2.34.1


