Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1696F22F02F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 16:22:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k041F-000766-AG; Mon, 27 Jul 2020 14:22:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM/5=BG=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1k041D-00075u-Pm
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 14:22:19 +0000
X-Inumbo-ID: 930a170d-d014-11ea-a7d9-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 930a170d-d014-11ea-a7d9-12813bfff9fa;
 Mon, 27 Jul 2020 14:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d2dy+O8HMS2n5aYbf6tbA9h3T1JBERn3K5gYW9x8m4c=; b=tzYtqK51jVjeJbI/PqrQpGv6f5
 UYzSv7pwygTT35iG/5CeZTZHyKIptE9fQU/oeoogDQjmBnbqIS5hegfEQO0j3b7aQedxesOW2W+wo
 03bDsDS7BwxR/QcvPLqtvm0zyEn7VQB9RI4JbGl+lJz2YFrnimT+H/EPiZPyyeRzD76o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k041C-0001Mj-CH; Mon, 27 Jul 2020 14:22:18 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k041C-0002w6-1i; Mon, 27 Jul 2020 14:22:18 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v8 01/15] x86/mm: map_pages_to_xen would better have one exit
 path
Date: Mon, 27 Jul 2020 15:21:51 +0100
Message-Id: <45a087b2be2f04567af99c630a0bed6500785463.1595857947.git.hongyxia@amazon.com>
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
index 82bc676553..0ade9b3917 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5085,9 +5085,11 @@ int map_pages_to_xen(
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
@@ -5105,10 +5107,11 @@ int map_pages_to_xen(
 
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
@@ -5198,7 +5201,7 @@ int map_pages_to_xen(
 
             l2t = alloc_xen_pagetable();
             if ( l2t == NULL )
-                return -ENOMEM;
+                goto out;
 
             for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++ )
                 l2e_write(l2t + i,
@@ -5227,7 +5230,7 @@ int map_pages_to_xen(
 
         pl2e = virt_to_xen_l2e(virt);
         if ( !pl2e )
-            return -ENOMEM;
+            goto out;
 
         if ( ((((virt >> PAGE_SHIFT) | mfn_x(mfn)) &
                ((1u << PAGETABLE_ORDER) - 1)) == 0) &&
@@ -5271,7 +5274,7 @@ int map_pages_to_xen(
             {
                 pl1e = virt_to_xen_l1e(virt);
                 if ( pl1e == NULL )
-                    return -ENOMEM;
+                    goto out;
             }
             else if ( l2e_get_flags(*pl2e) & _PAGE_PSE )
             {
@@ -5299,7 +5302,7 @@ int map_pages_to_xen(
 
                 l1t = alloc_xen_pagetable();
                 if ( l1t == NULL )
-                    return -ENOMEM;
+                    goto out;
 
                 for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
                     l1e_write(&l1t[i],
@@ -5445,7 +5448,10 @@ int map_pages_to_xen(
 
 #undef flush_flags
 
-    return 0;
+    rc = 0;
+
+ out:
+    return rc;
 }
 
 int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
-- 
2.16.6


