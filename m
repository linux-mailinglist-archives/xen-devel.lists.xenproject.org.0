Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A188C4299
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 15:56:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720975.1124125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6W9r-0007OO-D9; Mon, 13 May 2024 13:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720975.1124125; Mon, 13 May 2024 13:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6W9r-0007LC-9W; Mon, 13 May 2024 13:56:03 +0000
Received: by outflank-mailman (input) for mailman id 720975;
 Mon, 13 May 2024 13:56:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6Vvt-0002lY-PI
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 13:41:37 +0000
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com
 [207.171.190.10]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82b4e1b4-112e-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 15:41:35 +0200 (CEST)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.6])
 by smtp-border-fw-33001.sea14.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 13:41:26 +0000
Received: from EX19MTAUEB002.ant.amazon.com [10.0.0.204:36883]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.49.39:2525]
 with esmtp (Farcaster)
 id 1e2eaeee-dc0e-4963-bdc9-39279669553c; Mon, 13 May 2024 13:41:25 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEB002.ant.amazon.com (10.252.135.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:25 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 13:41:24 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 13:41:23 +0000
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
X-Inumbo-ID: 82b4e1b4-112e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715607695; x=1747143695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BMLad5szd5dSnCh0YLtH/2Rm7w1Vj1S/B6o9FzZUpnM=;
  b=jxR/A4sxn65hNOYjvhf8d8lhNKCPLi4fp78Uj9QQ+kLgfp63Bls1ND6x
   BLsgoiXGEPeh0zRZsB1s7ZDNMtZsEnUB7nzPnXYXt8588xFpjQ7g51bs0
   hJ6Hlfzxh3nGLwlogunsDbq6+Vl1yqJtbOrQ3NUqR6gOin9X7ny5hn67C
   4=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="344160809"
X-Farcaster-Flow-ID: 1e2eaeee-dc0e-4963-bdc9-39279669553c
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH V3 (resend) 16/19] xen/arm32: mm: Rename 'first' to 'root' in init_secondary_pagetables()
Date: Mon, 13 May 2024 13:40:43 +0000
Message-ID: <20240513134046.82605-17-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513134046.82605-1-eliasely@amazon.com>
References: <20240513134046.82605-1-eliasely@amazon.com>
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


