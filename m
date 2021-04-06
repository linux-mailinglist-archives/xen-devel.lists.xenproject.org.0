Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C6E355190
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 13:06:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105808.202457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjXW-0004fW-UW; Tue, 06 Apr 2021 11:06:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105808.202457; Tue, 06 Apr 2021 11:06:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjXW-0004dl-LP; Tue, 06 Apr 2021 11:06:34 +0000
Received: by outflank-mailman (input) for mailman id 105808;
 Tue, 06 Apr 2021 11:06:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lTjXU-0004bL-TE
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 11:06:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lTjXU-00053k-OF; Tue, 06 Apr 2021 11:06:32 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lTjXU-0002qD-7v; Tue, 06 Apr 2021 11:06:32 +0000
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
	Date:Subject:Cc:To:From; bh=WyOLTWy30UAQ1i+d+4Gv5h1nt743T4iqL5WX21fKHJs=; b=F
	rbB/vL/o0AwCfSeS1ZtEsipXn5nqwQTNJcXuBgbzqVmr1GKCYDdjW2yvZjW7WAnMjjOrKDI8Uh0a8
	swwf7Tff+tN0aS2yZbNrnH+60UGjC7JW5VdKYHEyawpeI6oJ+W6Uy+k428Z0GbXZKYTUNni7e8ckI
	V247oIHt5qEaWkUc=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v9 09/13] x86/smpboot: add exit path for clone_mapping()
Date: Tue,  6 Apr 2021 12:05:57 +0100
Message-Id: <1277cb7cb71edbb03a13f9db8fe07810e68c7248.1617706782.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617706782.git.hongyxia@amazon.com>
References: <cover.1617706782.git.hongyxia@amazon.com>
In-Reply-To: <cover.1617706782.git.hongyxia@amazon.com>
References: <cover.1617706782.git.hongyxia@amazon.com>

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
2.23.3


