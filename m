Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFAB9C3F60
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 14:12:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833748.1249067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDS-0003Pj-JK; Mon, 11 Nov 2024 13:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833748.1249067; Mon, 11 Nov 2024 13:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDS-0003Ha-9y; Mon, 11 Nov 2024 13:12:26 +0000
Received: by outflank-mailman (input) for mailman id 833748;
 Mon, 11 Nov 2024 13:12:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=//j0=SG=amazon.co.uk=prvs=038d26d0c=eliasely@srs-se1.protection.inumbo.net>)
 id 1tAUDQ-0008Hn-Md
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 13:12:24 +0000
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95deb6a8-a02e-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 14:12:22 +0100 (CET)
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.124.125.6])
 by smtp-border-fw-2101.iad2.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 13:12:20 +0000
Received: from EX19MTAUEC001.ant.amazon.com [10.0.44.209:10517]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.48.172:2525]
 with esmtp (Farcaster)
 id 804aad27-cab7-4eac-9bdb-4779792ac1c9; Mon, 11 Nov 2024 13:12:19 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEC001.ant.amazon.com (10.252.135.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:12 +0000
Received: from EX19MTAUEB002.ant.amazon.com (10.252.135.47) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:12 +0000
Received: from email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com
 (10.124.125.2) by mail-relay.amazon.com (10.252.135.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Mon, 11 Nov 2024 13:12:12 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com [10.253.91.118])
 by email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com (Postfix) with
 ESMTPS id A8FE142135; Mon, 11 Nov 2024 13:12:10 +0000 (UTC)
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
X-Inumbo-ID: 95deb6a8-a02e-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjcyLjIxLjE5Ni4yNSIsImhlbG8iOiJzbXRwLWZ3LTIxMDEuYW1hem9uLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijk1ZGViNmE4LWEwMmUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzMwNzQyLjY1NzIyNCwic2VuZGVyIjoicHJ2cz0wMzhkMjZkMGM9ZWxpYXNlbHlAYW1hem9uLmNvLnVrIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1731330743; x=1762866743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t/Di9+ifphdv1CaRTq5b3lwW03qipQ4WvhcCEQKzEXA=;
  b=TOVBV7MnznI4AaX8UADInVJln1hio2ycN2dwbSpHqXnW8RSGEVpTVGbb
   clSb/vlxqQwb8tqZzogHBfjl3DAKkAIPMSFmf/rHGPhaKuAm3tWUIBz9I
   uBrnCsIakZ5wbU2LZtFMH0UZ7XP3VRqjTmzOyB2AULFURGpwW6+y6x2E3
   Q=;
X-IronPort-AV: E=Sophos;i="6.12,145,1728950400"; 
   d="scan'208";a="441710997"
X-Farcaster-Flow-ID: 804aad27-cab7-4eac-9bdb-4779792ac1c9
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH V4 12/15] xen/arm32: mm: Rename 'first' to 'root' in init_secondary_pagetables()
Date: Mon, 11 Nov 2024 13:11:45 +0000
Message-ID: <20241111131148.52568-13-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241111131148.52568-1-eliasely@amazon.com>
References: <20241111131148.52568-1-eliasely@amazon.com>
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
index 4ffc8254a44b..37e91d72b785 100644
--- a/xen/arch/arm/mmu/smpboot.c
+++ b/xen/arch/arm/mmu/smpboot.c
@@ -109,32 +109,30 @@ int prepare_secondary_mm(int cpu)
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
-    set_init_ttbr(first);
+    set_init_ttbr(root);
 
     return 0;
 }
-- 
2.40.1


