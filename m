Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D1975BF1A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 08:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567366.886329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMjyL-0006n2-QO; Fri, 21 Jul 2023 06:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567366.886329; Fri, 21 Jul 2023 06:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMjyL-0006l5-NX; Fri, 21 Jul 2023 06:50:41 +0000
Received: by outflank-mailman (input) for mailman id 567366;
 Fri, 21 Jul 2023 06:50:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIrH=DH=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qMjyK-0006kz-U6
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 06:50:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6f2eba8-2792-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 08:50:39 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.162.18.33])
 by support.bugseng.com (Postfix) with ESMTPSA id D8F394EE0C89;
 Fri, 21 Jul 2023 08:50:36 +0200 (CEST)
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
X-Inumbo-ID: e6f2eba8-2792-11ee-b23a-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH] xen/arm: p2m: refactor 'p2m_get_entry'
Date: Fri, 21 Jul 2023 08:49:58 +0200
Message-Id: <118566cd8b9ebbcedd2b610f5f602cc31c12fd55.1689922099.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function is refactored to avoid using a
local dummy variable that served as a fallback
if the parameter 't' is NULL.

Storing the address of that variable into 't' caused
static analysis tools not to be able to recognize the
validity of the initialization, and to help with automatic
checking the two usages of 't' have been slightly refactored.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Suggested-by: Julien Grall <julien@xen.org>
---
 xen/arch/arm/p2m.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index de32a2d638..05d65db01b 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -496,16 +496,13 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
     lpae_t entry, *table;
     int rc;
     mfn_t mfn = INVALID_MFN;
-    p2m_type_t _t;
     DECLARE_OFFSETS(offsets, addr);
 
     ASSERT(p2m_is_locked(p2m));
     BUILD_BUG_ON(THIRD_MASK != PAGE_MASK);
 
-    /* Allow t to be NULL */
-    t = t ?: &_t;
-
-    *t = p2m_invalid;
+    if ( t )
+        *t = p2m_invalid;
 
     if ( valid )
         *valid = false;
@@ -549,7 +546,8 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
 
     if ( p2m_is_valid(entry) )
     {
-        *t = entry.p2m.type;
+        if ( t )
+            *t = entry.p2m.type;
 
         if ( a )
             *a = p2m_mem_access_radix_get(p2m, gfn);
-- 
2.34.1


