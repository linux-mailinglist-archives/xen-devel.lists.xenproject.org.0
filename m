Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7AB8C3FCE
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 13:27:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720877.1123915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6TpF-0007U4-Mp; Mon, 13 May 2024 11:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720877.1123915; Mon, 13 May 2024 11:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6TpF-0007Rd-K1; Mon, 13 May 2024 11:26:37 +0000
Received: by outflank-mailman (input) for mailman id 720877;
 Mon, 13 May 2024 11:26:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2Lj=MQ=amazon.co.uk=prvs=8568adbc3=eliasely@srs-se1.protection.inumbo.net>)
 id 1s6TbD-00036L-Nq
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 11:12:07 +0000
Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com
 [207.171.188.206]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0c81764-1119-11ef-b4bb-af5377834399;
 Mon, 13 May 2024 13:12:05 +0200 (CEST)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-9106.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 11:12:02 +0000
Received: from EX19MTAUEA002.ant.amazon.com [10.0.29.78:57259]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.23.176:2525]
 with esmtp (Farcaster)
 id 684ff723-13e2-42a2-ac85-d062567c045f; Mon, 13 May 2024 11:12:01 +0000 (UTC)
Received: from EX19D008UEC003.ant.amazon.com (10.252.135.194) by
 EX19MTAUEA002.ant.amazon.com (10.252.134.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:12:01 +0000
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19D008UEC003.ant.amazon.com (10.252.135.194) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Mon, 13 May 2024 11:12:00 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Mon, 13 May 2024 11:11:59 +0000
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
X-Inumbo-ID: a0c81764-1119-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715598726; x=1747134726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PLKm6zqnTr1kh3lkUidFqFNcSg3ycGZChl4qwlqzWSo=;
  b=YSM4xdZdF84nXOdrn584UrbfNFjcohDsq+xehbnrH2U2df0AXd3Drz89
   hm6akw2T2MpHdhY4ochxRQTVWrJoYk+6srAcwIqz3DA+3sKALbeUnoKac
   OUhbbWOD6m6Mdg8Axk3/QzoesBegZthJWRiRe5grMeShy91ist0+3SM77
   8=;
X-IronPort-AV: E=Sophos;i="6.08,158,1712620800"; 
   d="scan'208";a="725407129"
X-Farcaster-Flow-ID: 684ff723-13e2-42a2-ac85-d062567c045f
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Elias El Yandouzi <eliasely@amazon.com>
Subject: [PATCH V3 19/19] xen/arm64: Allow the admin to enable/disable the directmap
Date: Mon, 13 May 2024 11:11:17 +0000
Message-ID: <20240513111117.68828-20-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240513111117.68828-1-eliasely@amazon.com>
References: <20240513111117.68828-1-eliasely@amazon.com>
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
index 743d343ffa..cccd5e4282 100644
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
index 0462960fc7..1cb495e334 100644
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
index 826864d25d..81115cce51 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -158,16 +158,27 @@ void __init switch_ttbr(uint64_t ttbr)
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
@@ -188,6 +199,24 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
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
index e0bd23a6ed..5888f29159 100644
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
index def939172c..0f3ffab6ba 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -12,6 +12,7 @@
 #include <xen/grant_table.h>
 #include <xen/guest_access.h>
 #include <xen/mm.h>
+#include <xen/param.h>
 
 #include <xsm/xsm.h>
 
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d15987d6ea..6b06e2f4f5 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -778,6 +778,7 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
     cmdline_parse(cmdline);
 
     setup_mm();
+    printk("Booting with directmap %s\n", has_directmap() ? "on" : "off");
 
     vm_init();
 
-- 
2.40.1


