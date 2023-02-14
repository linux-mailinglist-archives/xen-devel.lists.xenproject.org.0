Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8652695828
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 06:08:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494957.765180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRnXN-0007Ia-S3; Tue, 14 Feb 2023 05:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494957.765180; Tue, 14 Feb 2023 05:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRnXN-0007GR-P1; Tue, 14 Feb 2023 05:07:29 +0000
Received: by outflank-mailman (input) for mailman id 494957;
 Tue, 14 Feb 2023 05:07:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1fg6=6K=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1pRnXM-0007GL-FW
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 05:07:28 +0000
Received: from MTA-05-3.privateemail.com (mta-05-3.privateemail.com
 [68.65.122.15]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 783a7726-ac25-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 06:07:26 +0100 (CET)
Received: from mta-05.privateemail.com (localhost [127.0.0.1])
 by mta-05.privateemail.com (Postfix) with ESMTP id 0FBA418000AF;
 Tue, 14 Feb 2023 00:07:24 -0500 (EST)
Received: from localhost.localdomain (c-73-126-95-14.hsd1.ma.comcast.net
 [73.126.95.14])
 by mta-05.privateemail.com (Postfix) with ESMTPA id D068A18000B2;
 Tue, 14 Feb 2023 00:07:16 -0500 (EST)
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
X-Inumbo-ID: 783a7726-ac25-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1676351243;
	bh=U/t2aKecr1XPTUqutXYj+EG7n3HpJaTp5C9X4aDmHqY=;
	h=From:To:Cc:Subject:Date:From;
	b=OvBMe5ElsruzOj1OegqEs8cgxoeOwFDp7FMDTO/LL9IP0TCRoFm4iFHFS1GOKEjt5
	 FeXJnOvPPY2KQeMujIqb7Jxko6tFDxvL79LTJnF9JETZUmC719wH69aJydeviHBK9T
	 U/R4Ef2yB+xbqwl8jVkXM9nv4U6BOJFyHhAdlYoWx5uMb7LV2yZOpbVQpZmzSinBjm
	 ANE9Kl5iPY1pGK5zQrsr1WRPJ8UVsQPmbBkFklb8Zjqopz0PEjDPpJNzjNwyE+vS5b
	 VALydlWAA/tQnpBV8kbvbuBGNH1pLBAxYv6BF/PggodYpB/vm50J2zGKJr0a+AgvzC
	 xjwZScl/DHohg==
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86: Perform mem_sharing teardown before paging teardown
Date: Tue, 14 Feb 2023 00:07:06 -0500
Message-Id: <3af8dbf3134b48f6bbc8f917e5fecaf8daee1c3d.1676351034.git.tamas@tklengyel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

An assert failure has been observed at p2m-basic.c:173 when performing vm
forking and then destroying the forked VM. The assert checks whether the
domain's shared pages counter is 0. According to the patch that originally
added the assert (7bedbbb5c31) the p2m_teardown should only happen after
mem_sharing already relinquished all shared pages.

In this patch we flip the order in which relinquish ops are called to avoid
tripping the assert.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
Note: it is unclear why this assert hasn't tripped in the past. It hasn't
been observed with 4.17-rc1 but it is in RELEASE-4.17.0
---
 xen/arch/x86/domain.c | 52 +++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index db3ebf062d..453ec52b6a 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2310,6 +2310,32 @@ int domain_relinquish_resources(struct domain *d)
         if ( ret )
             return ret;
 
+#ifdef CONFIG_MEM_SHARING
+    PROGRESS(shared):
+
+        if ( is_hvm_domain(d) )
+        {
+            /* If the domain has shared pages, relinquish them allowing
+             * for preemption. */
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
@@ -2350,32 +2376,6 @@ int domain_relinquish_resources(struct domain *d)
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


