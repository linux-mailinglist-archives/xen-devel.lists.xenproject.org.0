Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D2B6981A0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 18:08:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496156.766745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSLGV-00030a-Fz; Wed, 15 Feb 2023 17:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496156.766745; Wed, 15 Feb 2023 17:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSLGV-0002y0-DI; Wed, 15 Feb 2023 17:08:19 +0000
Received: by outflank-mailman (input) for mailman id 496156;
 Wed, 15 Feb 2023 17:08:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dp1N=6L=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1pSLGT-0002xu-RS
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 17:08:17 +0000
Received: from MTA-08-3.privateemail.com (mta-08-3.privateemail.com
 [198.54.127.61]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55e72334-ad53-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 18:08:16 +0100 (CET)
Received: from mta-08.privateemail.com (localhost [127.0.0.1])
 by mta-08.privateemail.com (Postfix) with ESMTP id 7108818000A1;
 Wed, 15 Feb 2023 12:08:14 -0500 (EST)
Received: from localhost.localdomain (c-73-126-95-14.hsd1.ma.comcast.net
 [73.126.95.14])
 by mta-08.privateemail.com (Postfix) with ESMTPA id 041A918000A0;
 Wed, 15 Feb 2023 12:08:06 -0500 (EST)
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
X-Inumbo-ID: 55e72334-ad53-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1676480894;
	bh=w68mtRdRllSdCaMn2vsvCBnT6Q4zJSnE9BFgcS4DrkY=;
	h=From:To:Cc:Subject:Date:From;
	b=lYfHmOk+bF1+8+b/5OEVqlCveopUzDzCDj4WdrwgpHxg11wLRMRYZSkNMxUBMm/DR
	 ha1Cq6ucFTcUDi/pPDqnl3ueSjYIbonuPLqju0pqRxmJTENX/NCEenJlSWQ38d24E8
	 OfeomqOU6/tg/Nrt1EOiiXmTEb8IGkwyTbMya4UI9JTC/zSSH81i1PyCwGk7kXJij1
	 vKOzrJwQrIHtthcXLFkmqCLutOqAh+Al4Rc8lTe8hBiVjuBEMsqe4qGvjJHG/AvQSH
	 khJlwkHVzRj6csFsbVfIM62CRNENApEA13XZn+iVv8IfvJZ4/iMLCRzgbALWgxhCdL
	 rM1dDL79SkZSw==
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86: Perform mem_sharing teardown before paging teardown
Date: Wed, 15 Feb 2023 12:07:58 -0500
Message-Id: <a7df4a01d7b901eb7b43be08f6fd3dce82ebbcd0.1676480656.git.tamas@tklengyel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

An assert failure has been observed in p2m_teardown when performing vm
forking and then destroying the forked VM (p2m-basic.c:173). The assert
checks whether the domain's shared pages counter is 0. According to the
patch that originally added the assert (7bedbbb5c31) the p2m_teardown
should only happen after mem_sharing already relinquished all shared pages.

In this patch we flip the order in which relinquish ops are called to avoid
tripping the assert.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
Fixes: e7aa55c0aab3 ("x86/p2m: free the paging memory pool preemptively")
---
v2: comsetic fixes
---
 xen/arch/x86/domain.c | 56 ++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index db3ebf062d..a42f03e8e5 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2289,9 +2289,9 @@ int domain_relinquish_resources(struct domain *d)
 
         enum {
             PROG_iommu_pagetables = 1,
+            PROG_shared,
             PROG_paging,
             PROG_vcpu_pagetables,
-            PROG_shared,
             PROG_xen,
             PROG_l4,
             PROG_l3,
@@ -2310,6 +2310,34 @@ int domain_relinquish_resources(struct domain *d)
         if ( ret )
             return ret;
 
+#ifdef CONFIG_MEM_SHARING
+    PROGRESS(shared):
+
+        if ( is_hvm_domain(d) )
+        {
+            /*
+             * If the domain has shared pages, relinquish them allowing
+             * for preemption.
+             */
+            ret = relinquish_shared_pages(d);
+            if ( ret )
+                return ret;
+
+            /*
+             * If the domain is forked, decrement the parent's pause count
+             * and release the domain.
+             */
+            if ( mem_sharing_is_fork(d) )
+            {
+                struct domain *parent = d->parent;
+
+                d->parent = NULL;
+                domain_unpause(parent);
+                put_domain(parent);
+            }
+        }
+#endif
+
     PROGRESS(paging):
 
         /* Tear down paging-assistance stuff. */
@@ -2350,32 +2378,6 @@ int domain_relinquish_resources(struct domain *d)
             d->arch.auto_unmask = 0;
         }
 
-#ifdef CONFIG_MEM_SHARING
-    PROGRESS(shared):
-
-        if ( is_hvm_domain(d) )
-        {
-            /* If the domain has shared pages, relinquish them allowing
-             * for preemption. */
-            ret = relinquish_shared_pages(d);
-            if ( ret )
-                return ret;
-
-            /*
-             * If the domain is forked, decrement the parent's pause count
-             * and release the domain.
-             */
-            if ( mem_sharing_is_fork(d) )
-            {
-                struct domain *parent = d->parent;
-
-                d->parent = NULL;
-                domain_unpause(parent);
-                put_domain(parent);
-            }
-        }
-#endif
-
         spin_lock(&d->page_alloc_lock);
         page_list_splice(&d->arch.relmem_list, &d->page_list);
         INIT_PAGE_LIST_HEAD(&d->arch.relmem_list);
-- 
2.34.1


