Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB2F82F593
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 20:40:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668171.1040194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPpI0-0006kL-1B; Tue, 16 Jan 2024 19:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668171.1040194; Tue, 16 Jan 2024 19:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPpHz-0006ho-UP; Tue, 16 Jan 2024 19:39:59 +0000
Received: by outflank-mailman (input) for mailman id 668171;
 Tue, 16 Jan 2024 19:39:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmx9=I2=amazon.co.uk=prvs=738631f0b=eliasely@srs-se1.protection.inumbo.net>)
 id 1rPp5X-0003Xv-Jh
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 19:27:07 +0000
Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com
 [52.119.213.154]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b08b66f-b4a5-11ee-98f1-6d05b1d4d9a1;
 Tue, 16 Jan 2024 20:27:06 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1d-m6i4x-25ac6bd5.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-52004.iad7.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 19:27:05 +0000
Received: from smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev
 (iad7-ws-svc-p70-lb3-vlan2.iad.amazon.com [10.32.235.34])
 by email-inbound-relay-iad-1d-m6i4x-25ac6bd5.us-east-1.amazon.com (Postfix)
 with ESMTPS id 2875E49E4D; Tue, 16 Jan 2024 19:27:01 +0000 (UTC)
Received: from EX19MTAUEB002.ant.amazon.com [10.0.29.78:45873]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.95.118:2525]
 with esmtp (Farcaster)
 id 98f57ce2-9333-45bc-9ae3-0f84349af0f9; Tue, 16 Jan 2024 19:27:00 +0000 (UTC)
Received: from EX19D008UEC004.ant.amazon.com (10.252.135.170) by
 EX19MTAUEB002.ant.amazon.com (10.252.135.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:48 +0000
Received: from EX19MTAUEB001.ant.amazon.com (10.252.135.35) by
 EX19D008UEC004.ant.amazon.com (10.252.135.170) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 19:26:48 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (10.253.91.118) by mail-relay.amazon.com (10.252.135.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 16 Jan 2024 19:26:47 +0000
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
X-Inumbo-ID: 3b08b66f-b4a5-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1705433227; x=1736969227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bXzdRNb+zZSWrMCWDYUPYL1ZiOjiL92dtef2XmbIpMo=;
  b=Q8AvmtJf4ZsrgXTlelbv8j5FR3wVday9zQQ/PGbrpdid0DMyGTRSNuaJ
   zXd9J3hXeDYPKB7o5zfpZu/Bu6/IFhUSMSbPwutQbHKToqs9qCfgU2mC3
   rPwh6fDrxcRjT+hTCnbRodHB2IbSCkppQUgHc23AZd8nuPU6qBjvk68HV
   s=;
X-IronPort-AV: E=Sophos;i="6.05,200,1701129600"; 
   d="scan'208";a="178399576"
X-Farcaster-Flow-ID: 98f57ce2-9333-45bc-9ae3-0f84349af0f9
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Julien Grall
	<jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH v2 (resend) 27/27] xen/arm64: Allow the admin to enable/disable the directmap
Date: Tue, 16 Jan 2024 19:26:11 +0000
Message-ID: <20240116192611.41112-28-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
References: <20240116192611.41112-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: Bulk

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
index 63c946f482..df90b1c4c9 100644
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
index 278243f0d6..7a19826233 100644
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
index f4a81aa705..22e1e5b9f4 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -157,16 +157,27 @@ void __init switch_ttbr(uint64_t ttbr)
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
@@ -187,6 +198,24 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
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
index b15a18a494..7fb75c5c3e 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -12,6 +12,7 @@
 #include <xen/grant_table.h>
 #include <xen/guest_access.h>
 #include <xen/mm.h>
+#include <xen/param.h>
 
 #include <xsm/xsm.h>
 
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 3dec365c57..2bd060d321 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -748,6 +748,7 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
     cmdline_parse(cmdline);
 
     setup_mm();
+    printk("Booting with directmap %s\n", has_directmap() ? "on" : "off");
 
     vm_init();
 
-- 
2.40.1


