Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63A479CC06
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 11:38:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600135.935754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzql-0000oP-6f; Tue, 12 Sep 2023 09:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600135.935754; Tue, 12 Sep 2023 09:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzql-0000mJ-30; Tue, 12 Sep 2023 09:38:27 +0000
Received: by outflank-mailman (input) for mailman id 600135;
 Tue, 12 Sep 2023 09:38:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3Pz=E4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qfzqk-0000lh-4f
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 09:38:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e561451-5150-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 11:38:24 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id CB11A4EE0745;
 Tue, 12 Sep 2023 11:38:23 +0200 (CEST)
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
X-Inumbo-ID: 1e561451-5150-11ee-8786-cb3800f73035
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 01/10] misra: add deviation for headers that explicitly avoid guards
Date: Tue, 12 Sep 2023 11:36:47 +0200
Message-Id: <e78d0868a635fe9fba851bb8c2cfc80ba6d73491.1694510856.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694510856.git.simone.ballarin@bugseng.com>
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some headers, under specific circumstances (documented in a comment at
the beginning of the file), explicitly avoid inclusion guards: the caller
is responsible for including them correctly.

These files are not supposed to comply with Directive 4.10:
"Precautions shall be taken in order to prevent the contents of a header
file being included more than once"

This patch adds deviation cooments for headers that avoid guards.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

---
Changes in v2:
- use the format introduced with doc/misra/safe.json instead of
  a generic text-based deviation
---
 docs/misra/safe.json                        | 8 ++++++++
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 xen/include/public/errno.h                  | 1 +
 3 files changed, 10 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 39c5c056c7..db438c9770 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -20,6 +20,14 @@
         },
         {
             "id": "SAF-2-safe",
+            "analyser": {
+                "eclair": "MC3R1.D4.10"
+            },
+            "name": "Dir 4.10: headers that leave it up to the caller to include them correctly",
+            "text": "Headers that deliberatively avoid inclusion guards explicitly leaving responsibility to the caller are allowed."
+        },
+        {
+            "id": "SAF-3-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 6b6ce2745c..eac1ae4b2a 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -23,6 +23,7 @@
  * their XEN_CPUFEATURE() being appropriate in the included context.
  */
 
+/* SAF-1-safe header that leaves it up to the caller to include them correctly */
 #ifndef XEN_CPUFEATURE
 
 /*
diff --git a/xen/include/public/errno.h b/xen/include/public/errno.h
index 5a78a7607c..8b60ac74ae 100644
--- a/xen/include/public/errno.h
+++ b/xen/include/public/errno.h
@@ -17,6 +17,7 @@
  * will unilaterally #undef XEN_ERRNO().
  */
 
+/* SAF-1-safe header that leaves it up to the caller to include them correctly */
 #ifndef XEN_ERRNO
 
 /*
-- 
2.34.1


