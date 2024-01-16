Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE25A82F4D0
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:02:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668000.1039814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPohU-0003V6-H0; Tue, 16 Jan 2024 19:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668000.1039814; Tue, 16 Jan 2024 19:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPohU-0003TV-E3; Tue, 16 Jan 2024 19:02:16 +0000
Received: by outflank-mailman (input) for mailman id 668000;
 Tue, 16 Jan 2024 19:02:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPoY5-0002UD-BT
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 18:52:33 +0000
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com
 [99.78.197.219]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6783d480-b4a0-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 19:52:32 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1d-m6i4x-f05d30a1.us-east-1.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-80008.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 18:52:30 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan3.iad.amazon.com [10.32.235.38])
 by email-inbound-relay-iad-1d-m6i4x-f05d30a1.us-east-1.amazon.com (Postfix)
 with ESMTPS id 3959A80927; Tue, 16 Jan 2024 18:52:27 +0000 (UTC)
Received: from EX19MTAUEA001.ant.amazon.com [10.0.44.209:59904]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.28.244:2525]
 with esmtp (Farcaster)
 id de6553b2-b322-482f-9b1a-3ff98ed881c5; Tue, 16 Jan 2024 18:52:26 +0000 (UTC)
Received: from EX19D008UEC004.ant.amazon.com (10.252.135.170) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:52:23 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEC004.ant.amazon.com (10.252.135.170) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 18:52:22 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 18:52:21 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6783d480-b4a0-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705431152; x=1736967152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aYNk7nmnUy0AklxdrRg4GNXCK3HA+7wbY/AdUPNJirw=;
  b=mglLoY1/7gW3Gjo3mzrNlMSC42EqmQoRhbVNgQ+w1n0U0s56xeJ9iQGo
   zDGZWtEwHv+GTcpAnEnhn5S/w7+p1zYEzMVF/LXSm9HwI1PDqz5XByezl
   YrYrwZ2qI5Jgk3qtJ2IYmQ1BagxLXC8+LFKFxQ2xK+1BCujbliSERjDzx
   M=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="58742957"
X-Farcaster-Flow-ID: de6553b2-b322-482f-9b1a-3ff98ed881c5
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH v2] xen/arm32: mm: Rename 'first' to 'root' in init_secondary_pagetables()
Date: Tue, 16 Jan 2024 18:50:53 +0000
Message-ID: <20240116185056.15000-25-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116185056.15000-1-eliasely@amazon.com>
References: <20240116185056.15000-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

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
index b6fc0aae07..fb5df667ba 100644
--- a/xen/arch/arm/mmu/smpboot.c
+++ b/xen/arch/arm/mmu/smpboot.c
@@ -84,32 +84,30 @@ int prepare_secondary_mm(int cpu)
 #else
 int prepare_secondary_mm(int cpu)
 {
-    lpae_t *first;
+    lpae_t *root = alloc_xenheap_page();
 
-    first = alloc_xenheap_page(); /* root == first level on 32-bit 3-level trie */
-
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
-    init_ttbr = __pa(first);
+    init_ttbr = __pa(root);
     clean_dcache(init_ttbr);
 
     return 0;
-- 
2.40.1


