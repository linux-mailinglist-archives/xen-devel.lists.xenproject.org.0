Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5763787B89E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 08:37:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692946.1080701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfem-0000fT-26; Thu, 14 Mar 2024 07:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692946.1080701; Thu, 14 Mar 2024 07:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfel-0000d3-Vo; Thu, 14 Mar 2024 07:37:39 +0000
Received: by outflank-mailman (input) for mailman id 692946;
 Thu, 14 Mar 2024 07:37:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujj0=KU=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rkfel-0000cv-72
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 07:37:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bac60428-e1d5-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 08:37:37 +0100 (CET)
Received: from truciono.bugseng.com (unknown [78.209.96.112])
 by support.bugseng.com (Postfix) with ESMTPSA id 8EE514EE0739;
 Thu, 14 Mar 2024 08:37:35 +0100 (CET)
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
X-Inumbo-ID: bac60428-e1d5-11ee-afdd-a90da7624cb6
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2] xen: avoid grep fodder define and undef
Date: Thu, 14 Mar 2024 08:37:28 +0100
Message-Id: <1f41883b6688d669d912f9358beccca016bd7ba8.1710401549.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Place an "#if 0" before grep fodder #define-s and remove
the #undef-s.

This addresses violations of MISRA C:2012 Rules 20.5 ("#undef should
not be used") and 5.5 ("Identifiers shall be distinct from macro
names").

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/iommu.h    |  5 +----
 xen/include/xen/mm-frame.h | 15 +++------------
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 9621459c63..ef57f31417 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -33,13 +33,10 @@ TYPE_SAFE(uint64_t, dfn);
 #define PRI_dfn     PRIx64
 #define INVALID_DFN _dfn(~0ULL)
 
-#ifndef dfn_t
+#if 0
 #define dfn_t /* Grep fodder: dfn_t, _dfn() and dfn_x() are defined above */
 #define _dfn
 #define dfn_x
-#undef dfn_t
-#undef _dfn
-#undef dfn_x
 #endif
 
 static inline dfn_t __must_check dfn_add(dfn_t dfn, unsigned long i)
diff --git a/xen/include/xen/mm-frame.h b/xen/include/xen/mm-frame.h
index c25e836f25..d973aec901 100644
--- a/xen/include/xen/mm-frame.h
+++ b/xen/include/xen/mm-frame.h
@@ -14,13 +14,10 @@ TYPE_SAFE(unsigned long, mfn);
  */
 #define INVALID_MFN_INITIALIZER { INVALID_MFN_RAW }
 
-#ifndef mfn_t
+#if 0
 #define mfn_t /* Grep fodder: mfn_t, _mfn() and mfn_x() are defined above */
 #define _mfn
 #define mfn_x
-#undef mfn_t
-#undef _mfn
-#undef mfn_x
 #endif
 
 static inline mfn_t __must_check mfn_add(mfn_t mfn, unsigned long i)
@@ -53,13 +50,10 @@ TYPE_SAFE(unsigned long, gfn);
  */
 #define INVALID_GFN_INITIALIZER { INVALID_GFN_RAW }
 
-#ifndef gfn_t
+#if 0
 #define gfn_t /* Grep fodder: gfn_t, _gfn() and gfn_x() are defined above */
 #define _gfn
 #define gfn_x
-#undef gfn_t
-#undef _gfn
-#undef gfn_x
 #endif
 
 static inline gfn_t __must_check gfn_add(gfn_t gfn, unsigned long i)
@@ -85,13 +79,10 @@ static inline bool gfn_eq(gfn_t x, gfn_t y)
 TYPE_SAFE(unsigned long, pfn);
 #define PRI_pfn          "05lx"
 
-#ifndef pfn_t
+#if 0
 #define pfn_t /* Grep fodder: pfn_t, _pfn() and pfn_x() are defined above */
 #define _pfn
 #define pfn_x
-#undef pfn_t
-#undef _pfn
-#undef pfn_x
 #endif
 
 #endif /* __XEN_FRAME_NUM_H__ */
-- 
2.34.1


