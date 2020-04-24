Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FD71B780A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:09:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRz1B-0002pp-9h; Fri, 24 Apr 2020 14:09:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OF9t=6I=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jRz1A-0002pb-LJ
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:09:24 +0000
X-Inumbo-ID: 310015c6-8635-11ea-94b0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 310015c6-8635-11ea-94b0-12813bfff9fa;
 Fri, 24 Apr 2020 14:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wuKSH+etKo7Jo0+ZezG3H1XK7TumB7Bc+ci7lGz0PLk=; b=bNL3GNbndE1LgY8gb7b+rytX5a
 CZqOmiD5+qjoarwPnP/ejsBi+JEsFbuD+biyMOifNBtKcx4NNw8eV9tJN6Svhw+1Ygk2H2DIkM4y4
 OfL1z4WErTBNxP4vd6kXpJ/tU8NrWFClBVYpWX85EGxVFiD9I/4abtRckdK8yyHG6Gms=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jRz15-0001gC-Uk; Fri, 24 Apr 2020 14:09:19 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jRz15-0001fN-Iw; Fri, 24 Apr 2020 14:09:19 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 01/15] x86/mm: map_pages_to_xen would better have one exit
 path
Date: Fri, 24 Apr 2020 15:08:52 +0100
Message-Id: <65a239b5c283890f83d2e637dbb6d01a673e586b.1587735799.git.hongyxia@amazon.com>
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

We will soon rewrite the function to handle dynamically mapping and
unmapping of page tables. Since dynamic mappings may map and unmap pages
in different iterations of the while loop, we need to lift pl3e out of
the loop.

No functional change.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

---
Changed since v4:
- drop the end_of_loop goto label.

Changed since v3:
- remove asserts on rc since rc never gets changed to anything else.
- reword commit message.
---
 xen/arch/x86/mm.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 355c50ff91..0d7f1f1265 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5073,9 +5073,11 @@ int map_pages_to_xen(
     unsigned int flags)
 {
     bool locking = system_state > SYS_STATE_boot;
+    l3_pgentry_t *pl3e, ol3e;
     l2_pgentry_t *pl2e, ol2e;
     l1_pgentry_t *pl1e, ol1e;
     unsigned int  i;
+    int rc = -ENOMEM;
 
 #define flush_flags(oldf) do {                 \
     unsigned int o_ = (oldf);                  \
@@ -5093,10 +5095,11 @@ int map_pages_to_xen(
 
     while ( nr_mfns != 0 )
     {
-        l3_pgentry_t ol3e, *pl3e = virt_to_xen_l3e(virt);
+        pl3e = virt_to_xen_l3e(virt);
 
         if ( !pl3e )
-            return -ENOMEM;
+            goto out;
+
         ol3e = *pl3e;
 
         if ( cpu_has_page1gb &&
@@ -5186,7 +5189,7 @@ int map_pages_to_xen(
 
             l2t = alloc_xen_pagetable();
             if ( l2t == NULL )
-                return -ENOMEM;
+                goto out;
 
             for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++ )
                 l2e_write(l2t + i,
@@ -5215,7 +5218,7 @@ int map_pages_to_xen(
 
         pl2e = virt_to_xen_l2e(virt);
         if ( !pl2e )
-            return -ENOMEM;
+            goto out;
 
         if ( ((((virt >> PAGE_SHIFT) | mfn_x(mfn)) &
                ((1u << PAGETABLE_ORDER) - 1)) == 0) &&
@@ -5259,7 +5262,7 @@ int map_pages_to_xen(
             {
                 pl1e = virt_to_xen_l1e(virt);
                 if ( pl1e == NULL )
-                    return -ENOMEM;
+                    goto out;
             }
             else if ( l2e_get_flags(*pl2e) & _PAGE_PSE )
             {
@@ -5287,7 +5290,7 @@ int map_pages_to_xen(
 
                 l1t = alloc_xen_pagetable();
                 if ( l1t == NULL )
-                    return -ENOMEM;
+                    goto out;
 
                 for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
                     l1e_write(&l1t[i],
@@ -5433,7 +5436,10 @@ int map_pages_to_xen(
 
 #undef flush_flags
 
-    return 0;
+    rc = 0;
+
+ out:
+    return rc;
 }
 
 int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
-- 
2.24.1.AMZN


