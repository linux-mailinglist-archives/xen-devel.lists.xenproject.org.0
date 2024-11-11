Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BF09C3F5A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 14:12:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833746.1249059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDR-00032q-1e; Mon, 11 Nov 2024 13:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833746.1249059; Mon, 11 Nov 2024 13:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDQ-0002tk-L0; Mon, 11 Nov 2024 13:12:24 +0000
Received: by outflank-mailman (input) for mailman id 833746;
 Mon, 11 Nov 2024 13:12:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=//j0=SG=amazon.co.uk=prvs=038d26d0c=eliasely@srs-se1.protection.inumbo.net>)
 id 1tAUDO-0007pD-NL
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 13:12:22 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 939511ca-a02e-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 14:12:19 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 13:12:16 +0000
Received: from EX19MTAUEA001.ant.amazon.com [10.0.44.209:40485]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.25.25:2525]
 with esmtp (Farcaster)
 id 97ed0e1a-4327-40d7-bc26-7f3f8399d6bf; Mon, 11 Nov 2024 13:12:15 +0000 (UTC)
Received: from EX19D008UEC002.ant.amazon.com (10.252.135.242) by
 EX19MTAUEA001.ant.amazon.com (10.252.134.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:15 +0000
Received: from EX19MTAUWA002.ant.amazon.com (10.250.64.202) by
 EX19D008UEC002.ant.amazon.com (10.252.135.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:15 +0000
Received: from email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com
 (10.25.36.210) by mail-relay.amazon.com (10.250.64.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Mon, 11 Nov 2024 13:12:15 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com [10.253.91.118])
 by email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com (Postfix) with
 ESMTPS id 447F942116; Mon, 11 Nov 2024 13:12:14 +0000 (UTC)
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
X-Inumbo-ID: 939511ca-a02e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6Ijk5Ljc4LjE5Ny4yMTgiLCJoZWxvIjoic210cC1mdy04MDAwNy5hbWF6b24uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjkzOTUxMWNhLWEwMmUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzMwNzM5LjYyODcxMSwic2VuZGVyIjoicHJ2cz0wMzhkMjZkMGM9ZWxpYXNlbHlAYW1hem9uLmNvLnVrIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1731330739; x=1762866739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mafc3TENeclkrMcyk4CrldzkIWqGpdnNkd3t+61vW/E=;
  b=GKnC4EPCipWpeBfG0JvFxOXfQAf0xaeRxkExpE5qzzP9LbV0R1BjU6kI
   MV9RJbuCPobmMSh2AyEtLRA23hit1G1OpwzOuNGvm0isUfxOB8RpuEsrB
   kXitmQYSIeiVs1ihl/PX+xUj7749CPcvEp2GY/iR0MqzRIwwi99x95CmC
   g=;
X-IronPort-AV: E=Sophos;i="6.12,145,1728950400"; 
   d="scan'208";a="351236520"
X-Farcaster-Flow-ID: 97ed0e1a-4327-40d7-bc26-7f3f8399d6bf
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH V4 15/15] xen/arm64: Allow the admin to enable/disable the directmap
Date: Mon, 11 Nov 2024 13:11:48 +0000
Message-ID: <20241111131148.52568-16-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241111131148.52568-1-eliasely@amazon.com>
References: <20241111131148.52568-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Julien Grall <jgrall@amazon.com>

Implement the same command line option as x86 to enable/disable the
directmap. By default this is kept enabled.

Also modify setup_directmap_mappings() to populate the L0 entries
related to the directmap area.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    Changes in v2:
        * Rely on the Kconfig option to enable Secret Hiding on Arm64
        * Use generic helper instead of arch_has_directmap()

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 10b0b2714661..c238b866061f 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -799,7 +799,7 @@ that enabling this option cannot guarantee anything beyond what underlying
 hardware guarantees (with, where available and known to Xen, respective
 tweaks applied).
 
-### directmap (x86)
+### directmap (arm64, x86)
 > `= <boolean>`
 
 > Default: `true`
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index aa9e4c381c55..390fe3dd9ebf 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -7,6 +7,7 @@ config ARM_64
 	depends on !ARM_32
 	select 64BIT
 	select HAS_FAST_MULTIPLY
+	select HAS_SECRET_HIDING
 
 config ARM
 	def_bool y
diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index d7cb3ad2da80..320e9efde93e 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -170,16 +170,27 @@ void __init switch_ttbr(uint64_t ttbr)
     update_identity_mapping(false);
 }
 
-/* Map the region in the directmap area. */
+/*
+ * This either populate a valid fdirect map, or allocates empty L1 tables
+ * and creates the L0 entries for the given region in the direct map
+ * depending on has_directmap().
+ *
+ * When directmap=no, we still need to populate empty L1 tables in the
+ * directmap region. The reason is that the root page-table (i.e. L0)
+ * is per-CPU and secondary CPUs will initialize their root page-table
+ * based on the pCPU0 one. So L0 entries will be shared if they are
+ * pre-populated. We also rely on the fact that L1 tables are never
+ * freed.
+ */
 static void __init setup_directmap_mappings(unsigned long base_mfn,
                                             unsigned long nr_mfns)
 {
+    unsigned long mfn_gb = base_mfn & ~((FIRST_SIZE >> PAGE_SHIFT) - 1);
     int rc;
 
     /* First call sets the directmap physical and virtual offset. */
     if ( mfn_eq(directmap_mfn_start, INVALID_MFN) )
     {
-        unsigned long mfn_gb = base_mfn & ~((FIRST_SIZE >> PAGE_SHIFT) - 1);
 
         directmap_mfn_start = _mfn(base_mfn);
         directmap_base_pdx = mfn_to_pdx(_mfn(base_mfn));
@@ -200,6 +211,24 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
         panic("cannot add directmap mapping at %lx below heap start %lx\n",
               base_mfn, mfn_x(directmap_mfn_start));
 
+    if ( !has_directmap() )
+    {
+        vaddr_t vaddr = (vaddr_t)__mfn_to_virt(base_mfn);
+        lpae_t *root = this_cpu(xen_pgtable);
+        unsigned int i, slot;
+
+        slot = first_table_offset(vaddr);
+        nr_mfns += base_mfn - mfn_gb;
+        for ( i = 0; i < nr_mfns; i += BIT(XEN_PT_LEVEL_ORDER(0), UL), slot++ )
+        {
+            lpae_t *entry = &root[slot];
+
+            if ( !lpae_is_valid(*entry) && !create_xen_table(entry) )
+                panic("Unable to populate zeroeth slot %u\n", slot);
+        }
+        return;
+    }
+
     rc = map_pages_to_xen((vaddr_t)__mfn_to_virt(base_mfn),
                           _mfn(base_mfn), nr_mfns,
                           PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
index b4f7545d2c87..2b1140a6b994 100644
--- a/xen/arch/arm/include/asm/arm64/mm.h
+++ b/xen/arch/arm/include/asm/arm64/mm.h
@@ -3,13 +3,10 @@
 
 extern DEFINE_PAGE_TABLE(xen_pgtable);
 
-/*
- * On ARM64, all the RAM is currently direct mapped in Xen.
- * Hence return always true.
- */
+/* On Arm64, the user can chose whether all the RAM is directmap. */
 static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 {
-    return true;
+    return has_directmap();
 }
 
 void arch_setup_page_tables(void);
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index def939172cc5..0f3ffab6bab6 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -12,6 +12,7 @@
 #include <xen/grant_table.h>
 #include <xen/guest_access.h>
 #include <xen/mm.h>
+#include <xen/param.h>
 
 #include <xsm/xsm.h>
 
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index b33483b8eacf..2e0870dc8af6 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -328,6 +328,7 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
     cmdline_parse(cmdline);
 
     setup_mm();
+    printk("Booting with directmap %s\n", has_directmap() ? "on" : "off");
 
     vm_init();
 
-- 
2.40.1


