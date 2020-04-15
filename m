Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A161A900A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 03:03:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOWSQ-0001Iz-Tv; Wed, 15 Apr 2020 01:03:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NGac=57=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jOWSP-0001IG-Fr
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 01:03:13 +0000
X-Inumbo-ID: d9c69c80-7eb4-11ea-b58d-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9c69c80-7eb4-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 01:03:00 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B0CA32076C;
 Wed, 15 Apr 2020 01:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586912579;
 bh=FMlXcRXt/zCRQA/cD6Iv2GQCYoMd2JYd4wrOKCkm6KU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zly7T+H4CPDzIclXBWdJhaKJ541truZ27Mnbq0DENiut9D0fbBRJcs3piPJzKhm0f
 lhBfbBVfvIaUkKWXz8UPA0jz7641V9MPQEE3ITAyQvRV0g62rqkkwlYtHBu+NPfDc5
 wp2KmgdxUCWPRgXVf9Qbjt61XWE0cXCauoVHp4Yo=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 06/12] xen/arm: reserve 1:1 memory for direct_map domUs
Date: Tue, 14 Apr 2020 18:02:49 -0700
Message-Id: <20200415010255.10081-6-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Volodymyr_Babchuk@epam.com, sstabellini@kernel.org, julien@xen.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Use reserve_domheap_pages to implement the direct-map ranges allocation
for DomUs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/domain_build.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a2bb411568..627e0c5e8e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -198,6 +198,40 @@ fail:
     return false;
 }
 
+static void __init reserve_memory_11(struct domain *d,
+                                     struct kernel_info *kinfo,
+                                     struct membank *banks,
+                                     unsigned int nr_banks)
+{
+    unsigned int i, order;
+    struct page_info *pg;
+   
+    kinfo->mem.nr_banks = 0;
+
+    for ( i = 0; i < nr_banks; i++ )
+    {
+        order = get_order_from_bytes(banks[i].size);
+        pg = reserve_domheap_pages(d, banks[i].start, order, 0);
+        if ( pg == NULL || !insert_11_bank(d, kinfo, pg, order) )
+        {
+            printk(XENLOG_ERR
+                   "%pd: cannot reserve memory start=%#"PRIpaddr" size=%#"PRIpaddr"\n",
+                    d, banks[i].start, banks[i].size);
+            BUG();
+        }
+    }
+
+    for( i = 0; i < kinfo->mem.nr_banks; i++ )
+    {
+        printk("BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
+                i,
+                kinfo->mem.bank[i].start,
+                kinfo->mem.bank[i].start + kinfo->mem.bank[i].size,
+                /* Don't want format this as PRIpaddr (16 digit hex) */
+                (unsigned long)(kinfo->mem.bank[i].size >> 20));
+    }
+}
+
 /*
  * This is all pretty horrible.
  *
@@ -2477,8 +2511,7 @@ static int __init construct_domU(struct domain *d,
                    banks[i].start, banks[i].size);
         }
 
-        /* reserve_memory_11(d, &kinfo, &banks[0], i); */
-        BUG();
+        reserve_memory_11(d, &kinfo, &banks[0], i);
     }
 
     rc = prepare_dtb_domU(d, &kinfo);
-- 
2.17.1


