Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 338C5366DEF
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114551.218423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDeC-0008J9-Vw; Wed, 21 Apr 2021 14:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114551.218423; Wed, 21 Apr 2021 14:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDeC-0008HE-N8; Wed, 21 Apr 2021 14:16:08 +0000
Received: by outflank-mailman (input) for mailman id 114551;
 Wed, 21 Apr 2021 14:16:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lZDeA-0008CS-8N
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:16:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZDeA-0000zz-2C; Wed, 21 Apr 2021 14:16:06 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZDe9-00045m-Mc; Wed, 21 Apr 2021 14:16:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:References:In-Reply-To:Message-Id:
	Date:Subject:Cc:To:From; bh=e2V44CgmFQW85Zs36UVR3r9TRcWz+UvEfVkPDI9D+b4=; b=E
	qPv1kGkyBxxVonllqQdD+ZLCwMjTNDAsbuyBwr+jiT79+wbV//FOfZ6X7Ib2+lu59tPzM0Hnfk+K5
	0sU42tfRax9K0uCPaIJpASdNO/Wc5EgYsUE128z/CWzJCEkuim4RzWX9cF1m5THp/x3vd+RBPuFsI
	gkNdsO8aHZkUS7QM=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v10 09/13] x86/smpboot: add exit path for clone_mapping()
Date: Wed, 21 Apr 2021 15:15:37 +0100
Message-Id: <8507e4918c5c310eac77ceef4b45f86e2d7745fb.1619014052.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619014052.git.hongyxia@amazon.com>
References: <cover.1619014052.git.hongyxia@amazon.com>
In-Reply-To: <cover.1619014052.git.hongyxia@amazon.com>
References: <cover.1619014052.git.hongyxia@amazon.com>

From: Wei Liu <wei.liu2@citrix.com>

We will soon need to clean up page table mappings in the exit path.

No functional change.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Acked-by: Jan Beulich <jbeulich@suse.com>

---
Changed in v7:
- edit commit message.
- begin with rc = 0 and set it to -ENOMEM ahead of if().
---
 xen/arch/x86/smpboot.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 82c1012e892f..e90c4dfa8a88 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -696,6 +696,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
     l3_pgentry_t *pl3e;
     l2_pgentry_t *pl2e;
     l1_pgentry_t *pl1e;
+    int rc = 0;
 
     /*
      * Sanity check 'linear'.  We only allow cloning from the Xen virtual
@@ -736,7 +737,7 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
             pl1e = l2e_to_l1e(*pl2e) + l1_table_offset(linear);
             flags = l1e_get_flags(*pl1e);
             if ( !(flags & _PAGE_PRESENT) )
-                return 0;
+                goto out;
             pfn = l1e_get_pfn(*pl1e);
         }
     }
@@ -744,8 +745,9 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
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
@@ -758,8 +760,9 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
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
@@ -774,8 +777,9 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
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
@@ -796,7 +800,9 @@ static int clone_mapping(const void *ptr, root_pgentry_t *rpt)
     else
         l1e_write(pl1e, l1e_from_pfn(pfn, flags));
 
-    return 0;
+    rc = 0;
+ out:
+    return rc;
 }
 
 DEFINE_PER_CPU(root_pgentry_t *, root_pgt);
-- 
2.23.4


