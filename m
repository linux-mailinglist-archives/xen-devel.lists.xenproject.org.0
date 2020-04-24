Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E01CA1B7836
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:20:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRzBi-0005Cs-6M; Fri, 24 Apr 2020 14:20:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OF9t=6I=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jRzBg-0005Cb-1p
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:20:16 +0000
X-Inumbo-ID: b4b7478a-8636-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4b7478a-8636-11ea-b58d-bc764e2007e4;
 Fri, 24 Apr 2020 14:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WuHZzCeYG5C/b2g02WeZNMxfNBzADEMLdtqdGqvTvAU=; b=CGmFqXrswBnXEgsEUtJqz1C1Y5
 HUvGO2SmQtdlfTptXzTOW0DFxw44kXES8+86535RR/2O/aXlYD9rOcISb4t7dw5p3rKnglMNNEqoN
 w3dxw24uM2rV+bhCrWRTvJHKX9EdIas5o6vFa2oC/ERqzwNARSgPB/edOticec6jhS9k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jRzBa-0001xB-99; Fri, 24 Apr 2020 14:20:10 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jRz1K-0001fN-VT; Fri, 24 Apr 2020 14:09:35 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 11/15] x86/smpboot: clone_mapping should have one exit path
Date: Fri, 24 Apr 2020 15:09:02 +0100
Message-Id: <7c84de54ad0ae7a2e7c0c36ac7fa43860f8de995.1587735799.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587735799.git.hongyxia@amazon.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
In-Reply-To: <cover.1587735799.git.hongyxia@amazon.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Wei Liu <wei.liu2@citrix.com>

We will soon need to clean up page table mappings in the exit path.

No functional change.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/smpboot.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 275ce7661d..5b0e24f925 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -675,6 +675,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
     l3_pgentry_t *pl3e;
     l2_pgentry_t *pl2e;
     l1_pgentry_t *pl1e;
+    int rc = -ENOMEM;
 
     /*
      * Sanity check 'linear'.  We only allow cloning from the Xen virtual
@@ -715,7 +716,10 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
             pl1e = l2e_to_l1e(*pl2e) + l1_table_offset(linear);
             flags = l1e_get_flags(*pl1e);
             if ( !(flags & _PAGE_PRESENT) )
-                return 0;
+            {
+                rc = 0;
+                goto out;
+            }
             pfn = l1e_get_pfn(*pl1e);
         }
     }
@@ -724,7 +728,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
     {
         pl3e = alloc_xen_pagetable();
         if ( !pl3e )
-            return -ENOMEM;
+            goto out;
         clear_page(pl3e);
         l4e_write(&rpt[root_table_offset(linear)],
                   l4e_from_paddr(__pa(pl3e), __PAGE_HYPERVISOR));
@@ -738,7 +742,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
     {
         pl2e = alloc_xen_pagetable();
         if ( !pl2e )
-            return -ENOMEM;
+            goto out;
         clear_page(pl2e);
         l3e_write(pl3e, l3e_from_paddr(__pa(pl2e), __PAGE_HYPERVISOR));
     }
@@ -754,7 +758,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
     {
         pl1e = alloc_xen_pagetable();
         if ( !pl1e )
-            return -ENOMEM;
+            goto out;
         clear_page(pl1e);
         l2e_write(pl2e, l2e_from_paddr(__pa(pl1e), __PAGE_HYPERVISOR));
     }
@@ -775,7 +779,9 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
     else
         l1e_write(pl1e, l1e_from_pfn(pfn, flags));
 
-    return 0;
+    rc = 0;
+ out:
+    return rc;
 }
 
 DEFINE_PER_CPU(root_pgentry_t *, root_pgt);
-- 
2.24.1.AMZN


