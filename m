Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DD21E7B62
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:12:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jecvz-0004mv-TO; Fri, 29 May 2020 11:12:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5BQD=7L=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jecvx-0004me-SZ
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:12:17 +0000
X-Inumbo-ID: 3fbe03e2-a19d-11ea-9dbe-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fbe03e2-a19d-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 11:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wpKga3yyO5WYBCcsTT/9ZqLEb5cI9pIQiRxp5mp3PjU=; b=RyNqcxQd5F8o0SmM/SdkYCxZ/x
 /HD7oLZYAEojQE/q/FHNkVirpBbrotQnDPYk2oVVfYNC06Kqto67WzrWaSMf6KUnOqiQ84152Myp+
 Ar172xs0z4a8Quc2UZ1w5C3wxWMb1IQqUY0FIVyBg3ROhNs24vlQC0kNkyxXrlXiqkME=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jecvt-00021p-H9; Fri, 29 May 2020 11:12:13 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jecvt-0006tM-79; Fri, 29 May 2020 11:12:13 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 02/15] x86/mm: make sure there is one exit path for
 modify_xen_mappings
Date: Fri, 29 May 2020 12:11:46 +0100
Message-Id: <3edeb558a0586cf5ecb235c9159cd00fe1197b9e.1590750232.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590750232.git.hongyxia@amazon.com>
References: <cover.1590750232.git.hongyxia@amazon.com>
In-Reply-To: <cover.1590750232.git.hongyxia@amazon.com>
References: <cover.1590750232.git.hongyxia@amazon.com>
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

We will soon need to handle dynamically mapping / unmapping page
tables in the said function. Since dynamic mappings may map and unmap
pl3e in different iterations, lift pl3e out of the loop.

No functional change.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

---
Changed since v4:
- drop the end_of_loop goto label.

Changed since v3:
- remove asserts on rc since it never gets changed to anything else.
---
 xen/arch/x86/mm.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index d99f9bc133..462682ba70 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5457,10 +5457,12 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 {
     bool locking = system_state > SYS_STATE_boot;
+    l3_pgentry_t *pl3e;
     l2_pgentry_t *pl2e;
     l1_pgentry_t *pl1e;
     unsigned int  i;
     unsigned long v = s;
+    int rc = -ENOMEM;
 
     /* Set of valid PTE bits which may be altered. */
 #define FLAGS_MASK (_PAGE_NX|_PAGE_RW|_PAGE_PRESENT)
@@ -5471,7 +5473,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 
     while ( v < e )
     {
-        l3_pgentry_t *pl3e = virt_to_xen_l3e(v);
+        pl3e = virt_to_xen_l3e(v);
 
         if ( !pl3e || !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
         {
@@ -5504,7 +5506,8 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             /* PAGE1GB: shatter the superpage and fall through. */
             l2t = alloc_xen_pagetable();
             if ( !l2t )
-                return -ENOMEM;
+                goto out;
+
             for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++ )
                 l2e_write(l2t + i,
                           l2e_from_pfn(l3e_get_pfn(*pl3e) +
@@ -5561,7 +5564,8 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 /* PSE: shatter the superpage and try again. */
                 l1t = alloc_xen_pagetable();
                 if ( !l1t )
-                    return -ENOMEM;
+                    goto out;
+
                 for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
                     l1e_write(&l1t[i],
                               l1e_from_pfn(l2e_get_pfn(*pl2e) + i,
@@ -5694,7 +5698,10 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
     flush_area(NULL, FLUSH_TLB_GLOBAL);
 
 #undef FLAGS_MASK
-    return 0;
+    rc = 0;
+
+ out:
+    return rc;
 }
 
 #undef flush_area
-- 
2.24.1.AMZN


