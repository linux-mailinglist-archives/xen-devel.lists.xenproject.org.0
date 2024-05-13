Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B338C3F85
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 13:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720816.1123828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Tb9-0006HP-Ft; Mon, 13 May 2024 11:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720816.1123828; Mon, 13 May 2024 11:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Tb9-00067E-1i; Mon, 13 May 2024 11:12:03 +0000
Received: by outflank-mailman (input) for mailman id 720816;
 Mon, 13 May 2024 11:12:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6Tb6-0003MC-9X
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 11:12:00 +0000
Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com
 [52.119.213.154]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d69b471-1119-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 13:11:59 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.2])
 by smtp-border-fw-52004.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 11:11:57 +0000
Received: from EX19MTAUEA001.ant.amazon.com [10.0.0.204:60869]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.42.97:2525]
 with esmtp (Farcaster)
 id 9f190847-4ba4-44c0-9b7e-9231c51b654a; Mon, 13 May 2024 11:11:56 +0000 (UTC)
Received: from EX19D008UEA001.ant.amazon.com (10.252.134.62) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:11:56 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA001.ant.amazon.com (10.252.134.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:11:56 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 11:11:55 +0000
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
X-Inumbo-ID: 9d69b471-1119-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715598719; x=1747134719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BMLad5szd5dSnCh0YLtH/2Rm7w1Vj1S/B6o9FzZUpnM=;
  b=iUsIjZJkOmxZC6Lw+aB3lFd2yz+vv5KSL6J3zXsbTSFppZoB3Fh6DtSN
   6cw0+ByuxiiYyBCuc+d9CdK/mbiVB8Mql0wQ+H7t9wClEH5KXckNAp5jD
   pnyLlghaVdXyjIYPjGoP9JvGBSyHASmQU/upN5sgBlP2MFMOFhs7oDJEf
   I=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="204721251"
X-Farcaster-Flow-ID: 9f190847-4ba4-44c0-9b7e-9231c51b654a
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH V3 16/19] xen/arm32: mm: Rename 'first' to 'root' in init_secondary_pagetables()
Date: Mon, 13 May 2024 11:11:14 +0000
Message-ID: <20240513111117.68828-17-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513111117.68828-1-eliasely@amazon.com>
References: <20240513111117.68828-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Julien Grall <jgrall@amazon.com>

The arm32 version of init_secondary_pagetables() will soon be re-used
for arm64 as well where the root table starts at level 0 rather than level 1.

So rename 'first' to 'root'.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    Changelog in v2:
        * Rebase
        * Fix typo

diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
index 4ffc8254a4..e29b6f34f2 100644
--- a/xen/arch/arm/mmu/smpboot.c
+++ b/xen/arch/arm/mmu/smpboot.c
@@ -109,32 +109,32 @@ int prepare_secondary_mm(int cpu)
 #else
 int prepare_secondary_mm(int cpu)
 {
-    lpae_t *first;
+    lpae_t *root = alloc_xenheap_page();
 
     first = alloc_xenheap_page(); /* root == first level on 32-bit 3-level trie */
 
-    if ( !first )
+    if ( !root )
     {
-        printk("CPU%u: Unable to allocate the first page-table\n", cpu);
+        printk("CPU%u: Unable to allocate the root page-table\n", cpu);
         return -ENOMEM;
     }
 
     /* Initialise root pagetable from root of boot tables */
-    memcpy(first, per_cpu(xen_pgtable, 0), PAGE_SIZE);
-    per_cpu(xen_pgtable, cpu) = first;
+    memcpy(root, per_cpu(xen_pgtable, 0), PAGE_SIZE);
+    per_cpu(xen_pgtable, cpu) = root;
 
     if ( !init_domheap_mappings(cpu) )
     {
         printk("CPU%u: Unable to prepare the domheap page-tables\n", cpu);
         per_cpu(xen_pgtable, cpu) = NULL;
-        free_xenheap_page(first);
+        free_xenheap_page(root);
         return -ENOMEM;
     }
 
     clear_boot_pagetables();
 
     /* Set init_ttbr for this CPU coming up */
-    set_init_ttbr(first);
+    set_init_ttbr(root);
 
     return 0;
 }
-- 
2.40.1


