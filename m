Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080877C716F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 17:29:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615844.957385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqxca-000820-R8; Thu, 12 Oct 2023 15:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615844.957385; Thu, 12 Oct 2023 15:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqxca-0007yl-Lz; Thu, 12 Oct 2023 15:29:08 +0000
Received: by outflank-mailman (input) for mailman id 615844;
 Thu, 12 Oct 2023 15:29:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oWZW=F2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qqxcY-0006QI-SX
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 15:29:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14ade131-6914-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 17:29:06 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 657A04EE074A;
 Thu, 12 Oct 2023 17:29:05 +0200 (CEST)
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
X-Inumbo-ID: 14ade131-6914-11ee-98d4-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [XEN PATCH][for-4.19 v2 7/8] xen/types: address Rule 10.1 for DECLARE_BITMAP use
Date: Thu, 12 Oct 2023 17:28:51 +0200
Message-Id: <f94b0c9411937a4003b86b5850b6d4ad91dff5d5.1697123806.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697123806.git.nicola.vetrini@bugseng.com>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Given its use in the declaration
'DECLARE_BITMAP(features, IOMMU_FEAT_count)' the argument
'bits' has essential type 'enum iommu_feature', which is not
allowed by the Rule as an operand to the addition operator
in macro 'BITS_TO_LONGS'.

This construct is deviated with a deviation comment.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 docs/misra/safe.json    | 8 ++++++++
 xen/include/xen/iommu.h | 1 +
 xen/include/xen/types.h | 8 ++++++++
 3 files changed, 17 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 39c5c056c7d4..952324f85cf9 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -20,6 +20,14 @@
         },
         {
             "id": "SAF-2-safe",
+            "analyser": {
+                "eclair": "MC3R1.R10.1"
+            },
+            "name": "MC3R1.R10.1: use of an enumeration constant in an arithmetic operation",
+            "text": "This violation can be fixed with a cast to (int) of the enumeration constant, but a deviation was chosen due to code readability (see also the comment in BITS_TO_LONGS)."
+        },
+        {
+            "id": "SAF-3-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 0e747b0bbc1c..d5c25770915b 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -360,6 +360,7 @@ struct domain_iommu {
 #endif
 
     /* Features supported by the IOMMU */
+    /* SAF-2-safe enum constant in arithmetic operation */
     DECLARE_BITMAP(features, IOMMU_FEAT_count);
 
     /* Does the guest share HAP mapping with the IOMMU? */
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index aea259db1ef2..50171ea1ad28 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -22,6 +22,14 @@ typedef signed long ssize_t;
 
 typedef __PTRDIFF_TYPE__ ptrdiff_t;
 
+/*
+ * Users of this macro are expected to pass a positive value.
+ *
+ * Eventually, this should become an unsigned quantity, but this
+ * requires fixing various uses of this macro and BITS_PER_LONG in signed
+ * contexts, such as type-safe 'min' macro uses, which give rise to build errors
+ * when the arguments have differing signedness, due to the build flags used.
+ */
 #define BITS_TO_LONGS(bits) \
     (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
 #define DECLARE_BITMAP(name,bits) \
-- 
2.34.1


