Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE761B780D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:09:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRz1A-0002p7-0c; Fri, 24 Apr 2020 14:09:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OF9t=6I=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jRz18-0002ou-EI
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:09:22 +0000
X-Inumbo-ID: 31fde20a-8635-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31fde20a-8635-11ea-b58d-bc764e2007e4;
 Fri, 24 Apr 2020 14:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oqERgF2yFHKDhOM0YC1cTIHrEB14UTlYTe0Bzj5cU0s=; b=LS8ovfLB5o3NZfXfXBXoW4MvI2
 kEBuCOSMUXExf+8V7iVXqmpcK+KU0XX8sSif8H0yHKsJcWWvnEGDEgqalbzMfNffHo2ANrUrA6muF
 CmOCTuTAUpK9RWbTxmLp492RYgvnBe5658SD/7lReX8pnZJnOnvpFhKeYsxAiPOm5+MI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jRz17-0001gK-EM; Fri, 24 Apr 2020 14:09:21 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jRz17-0001fN-2g; Fri, 24 Apr 2020 14:09:21 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 02/15] x86/mm: make sure there is one exit path for
 modify_xen_mappings
Date: Fri, 24 Apr 2020 15:08:53 +0100
Message-Id: <18200ef0e71dae402fbca394f653fb57c62a2cb9.1587735799.git.hongyxia@amazon.com>
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
index 0d7f1f1265..13a34a8d57 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5462,10 +5462,12 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
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
@@ -5476,7 +5478,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 
     while ( v < e )
     {
-        l3_pgentry_t *pl3e = virt_to_xen_l3e(v);
+        pl3e = virt_to_xen_l3e(v);
 
         if ( !pl3e || !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
         {
@@ -5509,7 +5511,8 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             /* PAGE1GB: shatter the superpage and fall through. */
             l2t = alloc_xen_pagetable();
             if ( !l2t )
-                return -ENOMEM;
+                goto out;
+
             for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++ )
                 l2e_write(l2t + i,
                           l2e_from_pfn(l3e_get_pfn(*pl3e) +
@@ -5566,7 +5569,8 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 /* PSE: shatter the superpage and try again. */
                 l1t = alloc_xen_pagetable();
                 if ( !l1t )
-                    return -ENOMEM;
+                    goto out;
+
                 for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
                     l1e_write(&l1t[i],
                               l1e_from_pfn(l2e_get_pfn(*pl2e) + i,
@@ -5699,7 +5703,10 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
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


