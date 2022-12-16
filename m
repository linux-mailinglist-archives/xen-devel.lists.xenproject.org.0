Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BBC64EB49
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 13:18:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464565.723008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69em-0007f8-I9; Fri, 16 Dec 2022 12:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464565.723008; Fri, 16 Dec 2022 12:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69em-0007S5-Cq; Fri, 16 Dec 2022 12:17:40 +0000
Received: by outflank-mailman (input) for mailman id 464565;
 Fri, 16 Dec 2022 12:17:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69ej-0007LG-NZ
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 12:17:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69ej-00033s-Em; Fri, 16 Dec 2022 12:17:37 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69DR-0004sN-Cv; Fri, 16 Dec 2022 11:49:25 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=dh6R0xvYO+Uecym5XhNbTlIrTn3W2pIvTvhO9tTqCTc=; b=Mmd0gMpbkfRWybrVgpKrSIOnad
	zRsL/sM8qC+NAsevmoXMv4/2NxlERhkQFHWlVllESfoPqg7z2K9bG8KBFDlSDTw7azkRp2u5bL9Rq
	rfmwu//83oRrJKri8ugLzZNwEavEct/vhRf/9a9LciBMt4qkp5XqzefhDMA0CyKlXYHQ=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 22/22] xen/arm64: Allow the admin to enable/disable the directmap
Date: Fri, 16 Dec 2022 11:48:53 +0000
Message-Id: <20221216114853.8227-23-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216114853.8227-1-julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Implement the same command line option as x86 to enable/disable the
directmap. By default this is kept enabled.

Also modify setup_directmap_mappings() to populate the L0 entries
related to the directmap area.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----
    This patch is in an RFC state we need to decide what to do for arm32.

    Also, this is moving code that was introduced in this series. So
    this will need to be fix in the next version (assuming Arm64 will
    be ready).

    This was sent early as PoC to enable secret-free hypervisor
    on Arm64.
---
 docs/misc/xen-command-line.pandoc   |  2 +-
 xen/arch/arm/include/asm/arm64/mm.h |  2 +-
 xen/arch/arm/include/asm/mm.h       | 12 +++++----
 xen/arch/arm/mm.c                   | 40 +++++++++++++++++++++++++++--
 xen/arch/arm/setup.c                |  1 +
 5 files changed, 48 insertions(+), 9 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index a63e4612acac..948035286acc 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -760,7 +760,7 @@ Specify the size of the console debug trace buffer. By specifying `cpu:`
 additionally a trace buffer of the specified size is allocated per cpu.
 The debug trace feature is only enabled in debugging builds of Xen.
 
-### directmap (x86)
+### directmap (arm64, x86)
 > `= <boolean>`
 
 > Default: `true`
diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
index aa2adac63189..8b5dcb091750 100644
--- a/xen/arch/arm/include/asm/arm64/mm.h
+++ b/xen/arch/arm/include/asm/arm64/mm.h
@@ -7,7 +7,7 @@
  */
 static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 {
-    return true;
+    return opt_directmap;
 }
 
 #endif /* __ARM_ARM64_MM_H__ */
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index d73abf1bf763..ef9ad3b366e3 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -9,6 +9,13 @@
 #include <public/xen.h>
 #include <xen/pdx.h>
 
+extern bool opt_directmap;
+
+static inline bool arch_has_directmap(void)
+{
+    return opt_directmap;
+}
+
 #if defined(CONFIG_ARM_32)
 # include <asm/arm32/mm.h>
 #elif defined(CONFIG_ARM_64)
@@ -411,11 +418,6 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
     } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
 }
 
-static inline bool arch_has_directmap(void)
-{
-    return true;
-}
-
 /* Helpers to allocate, map and unmap a Xen page-table */
 int create_xen_table(lpae_t *entry);
 lpae_t *xen_map_table(mfn_t mfn);
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index f5fb957554a5..925d81c450e8 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -15,6 +15,7 @@
 #include <xen/init.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
+#include <xen/param.h>
 #include <xen/pfn.h>
 #include <xen/pmap.h>
 #include <xen/sched.h>
@@ -131,6 +132,12 @@ vaddr_t directmap_virt_start __read_mostly;
 unsigned long directmap_base_pdx __read_mostly;
 #endif
 
+bool __ro_after_init opt_directmap = true;
+/* TODO: Decide what to do for arm32. */
+#ifdef CONFIG_ARM_64
+boolean_param("directmap", opt_directmap);
+#endif
+
 unsigned long frametable_base_pdx __read_mostly;
 unsigned long frametable_virt_end __read_mostly;
 
@@ -606,16 +613,27 @@ void __init setup_directmap_mappings(unsigned long base_mfn,
     directmap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
 }
 #else /* CONFIG_ARM_64 */
-/* Map the region in the directmap area. */
+/*
+ * This either populate a valid fdirect map, or allocates empty L1 tables
+ * and creates the L0 entries for the given region in the direct map
+ * depending on arch_has_directmap().
+ *
+ * When directmap=no, we still need to populate empty L1 tables in the
+ * directmap region. The reason is that the root page-table (i.e. L0)
+ * is per-CPU and secondary CPUs will initialize their root page-table
+ * based on the pCPU0 one. So L0 entries will be shared if they are
+ * pre-populated. We also rely on the fact that L1 tables are never
+ * freed.
+ */
 void __init setup_directmap_mappings(unsigned long base_mfn,
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
@@ -636,6 +654,24 @@ void __init setup_directmap_mappings(unsigned long base_mfn,
         panic("cannot add directmap mapping at %lx below heap start %lx\n",
               base_mfn, mfn_x(directmap_mfn_start));
 
+
+    if ( !arch_has_directmap() )
+    {
+        vaddr_t vaddr = (vaddr_t)__mfn_to_virt(base_mfn);
+        unsigned int i, slot;
+
+        slot = first_table_offset(vaddr);
+        nr_mfns += base_mfn - mfn_gb;
+        for ( i = 0; i < nr_mfns; i += BIT(XEN_PT_LEVEL_ORDER(0), UL), slot++ )
+        {
+            lpae_t *entry = &cpu0_pgtable[slot];
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
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index b1a8f91bb385..83ded03c7b1f 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1032,6 +1032,7 @@ void __init start_xen(unsigned long boot_phys_offset,
     cmdline_parse(cmdline);
 
     setup_mm();
+    printk("Booting with directmap %s\n", arch_has_directmap() ? "on" : "off");
 
     vm_init();
 
-- 
2.38.1


