Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66145939C58
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 10:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762674.1172894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAgN-0008Dd-JR; Tue, 23 Jul 2024 08:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762674.1172894; Tue, 23 Jul 2024 08:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAgN-0008AO-Ft; Tue, 23 Jul 2024 08:15:39 +0000
Received: by outflank-mailman (input) for mailman id 762674;
 Tue, 23 Jul 2024 08:15:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0IL=OX=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sWAgL-0007w0-CQ
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 08:15:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcebe19c-48cb-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 10:15:35 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-35-51-193.retail.telecomitalia.it [79.35.51.193])
 by support.bugseng.com (Postfix) with ESMTPSA id 4B9634EE0742;
 Tue, 23 Jul 2024 10:15:33 +0200 (CEST)
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
X-Inumbo-ID: bcebe19c-48cb-11ef-8776-851b0ebba9a2
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [XEN PATCH v5 01/17] misra: add deviation for headers that explicitly avoid guards
Date: Tue, 23 Jul 2024 10:14:53 +0200
Message-Id: <ad912232b11d925cc5456e064ebf41eb208201e8.1721720583.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Simone Ballarin <simone.ballarin@bugseng.com>

Some headers, under specific circumstances (documented in a comment at
the beginning of the file), explicitly do not have strict inclusion
guards: the caller is responsible for including them correctly.

These files are not supposed to comply with Directive 4.10:
"Precautions shall be taken in order to prevent the contents of a header
file being included more than once"

This patch adds deviation cooments for headers that avoid guards.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

---
Changes in v5:
- edit deviation description
- edit commit message
Changes in v3:
- fix inconsistent deviation ID
- change comment-based deviation text
Changes in v2:
- use the format introduced with doc/misra/safe.json instead of
  a generic text-based deviation
---
 docs/misra/safe.json                        | 8 ++++++++
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 xen/include/public/errno.h                  | 1 +
 3 files changed, 10 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 3f18ef401c..44d1c4890e 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -68,6 +68,14 @@
         },
         {
             "id": "SAF-8-safe",
+            "analyser": {
+                "eclair": "MC3R1.D4.10"
+            },
+            "name": "Dir 4.10: headers that leave it up to the caller to include them correctly",
+            "text": "Headers that deliberatively leave the responsability of their correct inclusion to the caller are allowed."
+        },
+        {
+            "id": "SAF-9-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index d9eba5e9a7..3962ba9342 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -23,6 +23,7 @@
  * their XEN_CPUFEATURE() being appropriate in the included context.
  */
 
+/* SAF-8-safe inclusion procedure left to caller */
 #ifndef XEN_CPUFEATURE
 
 /*
diff --git a/xen/include/public/errno.h b/xen/include/public/errno.h
index 5a78a7607c..b9fc6762fb 100644
--- a/xen/include/public/errno.h
+++ b/xen/include/public/errno.h
@@ -17,6 +17,7 @@
  * will unilaterally #undef XEN_ERRNO().
  */
 
+/* SAF-8-safe inclusion procedure left to caller */
 #ifndef XEN_ERRNO
 
 /*
-- 
2.34.1


