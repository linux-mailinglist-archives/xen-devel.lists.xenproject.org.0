Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ADA918264
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748855.1156793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMShv-0003Iq-3u; Wed, 26 Jun 2024 13:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748855.1156793; Wed, 26 Jun 2024 13:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMShv-0003GQ-0d; Wed, 26 Jun 2024 13:29:07 +0000
Received: by outflank-mailman (input) for mailman id 748855;
 Wed, 26 Jun 2024 13:29:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+tE4=N4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sMSht-00030Q-Dy
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:29:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0de584a5-33c0-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 15:29:03 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id 485DA4EE0756;
 Wed, 26 Jun 2024 15:29:02 +0200 (CEST)
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
X-Inumbo-ID: 0de584a5-33c0-11ef-90a3-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v2 for-4.20 1/7] automation/eclair: address violations of MISRA C Rule 20.7
Date: Wed, 26 Jun 2024 15:28:47 +0200
Message-Id: <679b1948690fecf06c9e81b398f7bf9bf5a292d2.1719407840.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719407840.git.nicola.vetrini@bugseng.com>
References: <cover.1719407840.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses".

The helper macro bitmap_switch has parameters that cannot be parenthesized
in order to comply with the rule, as that would break its functionality.
Moreover, the risk of misuse due developer confusion is deemed not
substantial enough to warrant a more involved refactor, thus the macro
is deviated for this rule.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Switched to a comment-based deviation to allow other tools to
pick this deviation up automatically.
---
 docs/misra/safe.json     | 8 ++++++++
 xen/include/xen/bitmap.h | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index c213e0a0be3b..3f18ef401c7d 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -60,6 +60,14 @@
         },
         {
             "id": "SAF-7-safe",
+            "analyser": {
+                "eclair": "MC3R1.R20.7"
+            },
+            "name": "MC3R1.R20.7: deliberately non-parenthesized macro argument",
+            "text": "A macro parameter expands to an expression that is non-parenthesized, as doing so would break the functionality."
+        },
+        {
+            "id": "SAF-8-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index b9f980e91930..6ee39aa35ac6 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -103,10 +103,13 @@ extern int bitmap_allocate_region(unsigned long *bitmap, int pos, int order);
 #define bitmap_switch(nbits, zero, small, large)			  \
 	unsigned int n__ = (nbits);					  \
 	if (__builtin_constant_p(nbits) && !n__) {			  \
+		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
 		zero;							  \
 	} else if (__builtin_constant_p(nbits) && n__ <= BITS_PER_LONG) { \
+		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
 		small;							  \
 	} else {							  \
+		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
 		large;							  \
 	}
 
-- 
2.34.1

