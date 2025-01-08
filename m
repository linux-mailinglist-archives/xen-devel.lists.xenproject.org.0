Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE23A05FEC
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:21:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867551.1279157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXri-0000mA-EY; Wed, 08 Jan 2025 15:21:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867551.1279157; Wed, 08 Jan 2025 15:21:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXri-0000jd-Bt; Wed, 08 Jan 2025 15:21:02 +0000
Received: by outflank-mailman (input) for mailman id 867551;
 Wed, 08 Jan 2025 15:21:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVXq2-0008Lg-Bx
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:19:18 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed63cabb-cdd3-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 16:19:17 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d122cf8dd1so29422630a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:19:17 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae71desm2488412166b.89.2025.01.08.07.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 07:19:16 -0800 (PST)
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
X-Inumbo-ID: ed63cabb-cdd3-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736349557; x=1736954357; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzrS2Bw0H8USJct01IYqEGdeeRooPpKhcpnuOPYIt28=;
        b=T9EE7M546zVv71S6qXEjvuyB1KHnNnR7rJCvJfMgr7/IzWXoXOKonOiAXWA6KNxLcv
         Rl4vzX0I85fsIAYYZUT9uVoIdbEYgZVeLvF/N/rMKZn9Xog9Q7teN0YJ7SGukVsn36Gv
         OP6Hf/SxFAZ3XKvwUdjqIOOY5J/h7LjVQJRqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349557; x=1736954357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzrS2Bw0H8USJct01IYqEGdeeRooPpKhcpnuOPYIt28=;
        b=qrsALIhSM/uwb6qyrnvz8vVXOqYvzeeRlEfjkZH/hcdSeRkb+v7OGmZi5mUJni3p7E
         U2d4PBWy/XtvsV4n6ikUxChBxpGCTJa6Y/hjptffW7o/VkHwMDW9m789ux/VQ871263O
         dCBDqrXm+bAg/iQv7p6AQqYdDu/eQoqIyge7m6dnFXCccPQfqGheKrUI3YtsusAC3jYs
         qv9MPG8RJ73Wx5we2ejq/2tVHCczuliVsLFn3A6u7HDhRenU5bepUFRRx98kKzHaWZFX
         kfQytqlyAKD2wVVNfj/mgkjmC6ZNYt/j7FZqTgFSE/esCvIjcp4PmC0FDSUfpNnTFpsk
         vadA==
X-Gm-Message-State: AOJu0YxNO+G1HdW3kqwiUJGPLtTxLbPBUL0+zav2KZiRtDA6qh6ADppZ
	Z97KpmMmQX7BCWAsjmXlhtSXLz9L3nifUveKWFY6mmU5KZqb++geLYUZa8rwBSxDdqWdCtQyRj3
	bwZTpbg==
X-Gm-Gg: ASbGncvCCMzlzsWHdf00mY+atR85PGBepjbPunnD/465QjWBCC/RpjIh9XMLdoQQxu5
	P4sZ+lrXvRU2SMmKGqHXv5hAq8ldMRbue1ezejhGMn0RYOg/eR9emYjVAdxk5PFsASzMg/Idwdh
	SDnIO7WxVu7GnIuDymKCzYBTmg1PVpmG/MYojbaG5Flb6HUTZrFSY7Ip9LxZ+YiFVebfzayVniS
	ZgXhaQ3z8SS7cC3FCZ3cDLJkMdM2EZccXBzDG9cnufGIDvsytBPUDRfEWf0z3Gky+asR+1DYjLY
	ilM=
X-Google-Smtp-Source: AGHT+IEzh2vXVXXW5B5Ed5ZTzK8fKIgHzlWWpwrWKLYvwwb30s4uKM+ShVikFKtNzNtPnQJDrTJRfg==
X-Received: by 2002:a05:6402:1ed4:b0:5d0:ed71:3ce4 with SMTP id 4fb4d7f45d1cf-5d972dfea2amr2948651a12.6.1736349556914;
        Wed, 08 Jan 2025 07:19:16 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Elias El Yandouzi <eliasely@amazon.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v5 15/15] xen/arm64: Allow the admin to enable/disable the directmap
Date: Wed,  8 Jan 2025 15:18:22 +0000
Message-ID: <20250108151822.16030-16-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
References: <20250108151822.16030-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Implement the same command line option as x86 to enable/disable the
directmap. By default this is kept enabled.

Also modify setup_directmap_mappings() to populate the L0 entries
related to the directmap area.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v4->v5:
  * Fixed typo in comment. s/fdirect/direct/
  * Adjusted comment so 's/directmap=no/asi=true'
  * Adjusted printk() so 's/on/full' and 's/off/on demand'
  * s/HAS_SECRET_HIDING/HAS_ONDEMAND_DIRECTMAP. Otherwise
    CONFIG_ONDEMAND_DIRECTMAP won't appear on the menu for ARM
    (Note: I didn't test ARM because I have no boxes to do so)

v1->v2:
  * Rely on the Kconfig option to enable Secret Hiding on Arm64
  * Use generic helper instead of arch_has_directmap()
---
 docs/misc/xen-command-line.pandoc   |  2 +-
 xen/arch/arm/Kconfig                |  1 +
 xen/arch/arm/arm64/mmu/mm.c         | 39 +++++++++++++++++++++++++++--
 xen/arch/arm/include/asm/arm64/mm.h |  7 ++----
 xen/arch/arm/setup.c                |  2 ++
 5 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 6a1351b6c09b..68cbaf17e768 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -202,7 +202,7 @@ to appropriate auditing by Xen.  Argo is disabled by default.
     This option is disabled by default, to protect domains from a DoS by a
     buggy or malicious other domain spamming the ring.
 
-### asi (x86)
+### asi (arm64, x86)
 > `= <boolean>`
 
 > Default: `false`
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 5c31bb616608..ec9536a1111e 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -8,6 +8,7 @@ config ARM_64
 	select 64BIT
 	select HAS_FAST_MULTIPLY
 	select HAS_LLC_COLORING if !NUMA
+	select HAS_ONDEMAND_DIRECTMAP
 
 config ARM
 	def_bool y
diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index 8e121e5ffe8d..99f14ce17878 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -3,6 +3,7 @@
 #include <xen/init.h>
 #include <xen/llc-coloring.h>
 #include <xen/mm.h>
+#include <xen/param.h>
 #include <xen/pfn.h>
 
 #include <asm/domain_page.h>
@@ -14,6 +15,11 @@
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
 
+#ifdef CONFIG_ONDEMAND_DIRECTMAP
+bool __ro_after_init opt_ondemand_dmap;
+boolean_param("asi", opt_ondemand_dmap);
+#endif
+
 static DEFINE_PAGE_TABLE(xen_first_id);
 static DEFINE_PAGE_TABLE(xen_second_id);
 static DEFINE_PAGE_TABLE(xen_third_id);
@@ -204,16 +210,27 @@ void __init switch_ttbr(uint64_t ttbr)
     update_identity_mapping(false);
 }
 
-/* Map the region in the directmap area. */
+/*
+ * This either populate a valid directmap, or allocates empty L1 tables
+ * and creates the L0 entries for the given region in the direct map
+ * depending on has_directmap().
+ *
+ * When asi=true, we still need to populate empty L1 tables in the
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
@@ -234,6 +251,24 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
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
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 3b1ab6be3fbd..e3505dca8889 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -346,6 +346,8 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
     device_tree_flattened = early_fdt_map(fdt_paddr);
 
     setup_mm();
+    printk("Booting with directmap: %s\n",
+           has_directmap() ? "full" : "on demand");
 
     vm_init();
 
-- 
2.47.1


