Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A4722F270
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 16:40:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k04IC-0000e4-Sd; Mon, 27 Jul 2020 14:39:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM/5=BG=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1k04IB-0000dt-9p
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 14:39:51 +0000
X-Inumbo-ID: 06c97230-d017-11ea-8ac7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06c97230-d017-11ea-8ac7-bc764e2007e4;
 Mon, 27 Jul 2020 14:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0SVN7QjGjE3dnCfA1k5zj/jcGmdnfLnwdJ2VVUqhG5k=; b=WonXnoIWsAqA230psvX0In7bWl
 uVzIRmyiajs2qXzMAeSNEdQ1atSLNx1KeTWA4BDng/75VqLa26X70uHJi5Q4lg2bAI7T94IdQGQx0
 4AxmW14Ua6+sqiJr6c/EDM6OLN/uFEwFC10xYOK41gepNkgHc40jZN6JCKfbMn4sS+t4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k04IA-0001kp-60; Mon, 27 Jul 2020 14:39:50 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k041Q-0002w6-OG; Mon, 27 Jul 2020 14:22:33 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v8 11/15] x86/smpboot: add exit path for clone_mapping()
Date: Mon, 27 Jul 2020 15:22:01 +0100
Message-Id: <c4c7a913319a6c9ae8e9823f8985570dfe7054e8.1595857947.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595857947.git.hongyxia@amazon.com>
References: <cover.1595857947.git.hongyxia@amazon.com>
In-Reply-To: <cover.1595857947.git.hongyxia@amazon.com>
References: <cover.1595857947.git.hongyxia@amazon.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
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
Changed in v7:
- edit commit message.
- begin with rc = 0 and set it to -ENOMEM ahead of if().
---
 xen/arch/x86/smpboot.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 5708573c41..05df08f945 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -676,6 +676,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
     l3_pgentry_t *pl3e;
     l2_pgentry_t *pl2e;
     l1_pgentry_t *pl1e;
+    int rc = 0;
 
     /*
      * Sanity check 'linear'.  We only allow cloning from the Xen virtual
@@ -716,7 +717,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
             pl1e = l2e_to_l1e(*pl2e) + l1_table_offset(linear);
             flags = l1e_get_flags(*pl1e);
             if ( !(flags & _PAGE_PRESENT) )
-                return 0;
+                goto out;
             pfn = l1e_get_pfn(*pl1e);
         }
     }
@@ -724,8 +725,9 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
     if ( !(root_get_flags(rpt[root_table_offset(linear)]) & _PAGE_PRESENT) )
     {
         pl3e = alloc_xen_pagetable();
+        rc = -ENOMEM;
         if ( !pl3e )
-            return -ENOMEM;
+            goto out;
         clear_page(pl3e);
         l4e_write(&rpt[root_table_offset(linear)],
                   l4e_from_paddr(__pa(pl3e), __PAGE_HYPERVISOR));
@@ -738,8 +740,9 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
     if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
     {
         pl2e = alloc_xen_pagetable();
+        rc = -ENOMEM;
         if ( !pl2e )
-            return -ENOMEM;
+            goto out;
         clear_page(pl2e);
         l3e_write(pl3e, l3e_from_paddr(__pa(pl2e), __PAGE_HYPERVISOR));
     }
@@ -754,8 +757,9 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
     if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
     {
         pl1e = alloc_xen_pagetable();
+        rc = -ENOMEM;
         if ( !pl1e )
-            return -ENOMEM;
+            goto out;
         clear_page(pl1e);
         l2e_write(pl2e, l2e_from_paddr(__pa(pl1e), __PAGE_HYPERVISOR));
     }
@@ -776,7 +780,9 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
     else
         l1e_write(pl1e, l1e_from_pfn(pfn, flags));
 
-    return 0;
+    rc = 0;
+ out:
+    return rc;
 }
 
 DEFINE_PER_CPU(root_pgentry_t *, root_pgt);
-- 
2.16.6


