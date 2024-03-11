Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEB5877C22
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 10:00:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691262.1077051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW2-00073W-Nl; Mon, 11 Mar 2024 09:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691262.1077051; Mon, 11 Mar 2024 09:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW2-0006zX-JO; Mon, 11 Mar 2024 09:00:14 +0000
Received: by outflank-mailman (input) for mailman id 691262;
 Mon, 11 Mar 2024 09:00:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWeI=KR=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rjbW1-0006j9-AA
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 09:00:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c45e3e27-df85-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 10:00:11 +0100 (CET)
Received: from beta.station (net-93-144-106-196.cust.vodafonedsl.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id B8C4D4EE0C96;
 Mon, 11 Mar 2024 10:00:10 +0100 (CET)
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
X-Inumbo-ID: c45e3e27-df85-11ee-a1ee-f123f15fe8a2
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
Subject: [XEN PATCH v3 01/16] misra: add deviation for headers that explicitly avoid guards
Date: Mon, 11 Mar 2024 09:59:10 +0100
Message-Id: <310fe4a0ccd0ad45bcf1cd9811ac56c9a560dd0b.1710145041.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710145041.git.simone.ballarin@bugseng.com>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
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
Changes in v3:
- fix inconsistent deviation ID
- change comment-based deviation text
Changes in v2:
- use the format introduced with doc/misra/safe.json instead of
  a generic text-based deviation
---
 docs/misra/safe.json                        | 9 +++++++++
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 xen/include/public/errno.h                  | 1 +
 3 files changed, 11 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 952324f85c..e98956d604 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -28,6 +28,15 @@
         },
         {
             "id": "SAF-3-safe",
+            "analyser": {
+                "eclair": "MC3R1.D4.10"
+            },
+            "name": "Dir 4.10: headers that leave it up to the caller to include them correctly",
+            "text": "Headers that deliberatively avoid inclusion guards explicitly leaving responsibility to the caller are allowed."
+
+            },
+            {
+            "id": "SAF-4-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 0374cec3a2..f78a461d93 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -23,6 +23,7 @@
  * their XEN_CPUFEATURE() being appropriate in the included context.
  */
 
+/* SAF-3-safe omitted inclusion guard */
 #ifndef XEN_CPUFEATURE
 
 /*
diff --git a/xen/include/public/errno.h b/xen/include/public/errno.h
index 5a78a7607c..28e064b67f 100644
--- a/xen/include/public/errno.h
+++ b/xen/include/public/errno.h
@@ -17,6 +17,7 @@
  * will unilaterally #undef XEN_ERRNO().
  */
 
+/* SAF-3-safe omitted inclusion guard */
 #ifndef XEN_ERRNO
 
 /*
-- 
2.34.1


