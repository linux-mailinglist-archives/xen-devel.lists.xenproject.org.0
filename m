Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADB2766610
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 10:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571352.895015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPINg-0007YX-NJ; Fri, 28 Jul 2023 07:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571352.895015; Fri, 28 Jul 2023 07:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPINg-0007Uq-JY; Fri, 28 Jul 2023 07:59:24 +0000
Received: by outflank-mailman (input) for mailman id 571352;
 Fri, 28 Jul 2023 07:59:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6gb0=DO=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qPINe-0006EL-BT
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 07:59:22 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8722443-2d1c-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 09:59:20 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31783d02093so1314238f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jul 2023 00:59:20 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfdd82000000b0030e56a9ff25sm4089629wrl.31.2023.07.28.00.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 00:59:19 -0700 (PDT)
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
X-Inumbo-ID: a8722443-2d1c-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1690531160; x=1691135960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOozgaOFWdrmn1fdpDhbIG2g4lDNcrwwZYe9WA/TRSo=;
        b=RtuhIpsxb/Oe/yK4GIPv0hh4K+ZsNHU5ZAEG6a+KteuXpyUgxfXK0L6C164pmP2PFh
         QZ7Cwhqavw7dn6wky9/OiGbg7gCwiEkpYnnGBKkDGb5YiczfFxmKgjZ4uMs9LHUEkhHL
         NhyfKdTWmuwr0VjsIfLFZdeKxQll5kSOe6l0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690531160; x=1691135960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOozgaOFWdrmn1fdpDhbIG2g4lDNcrwwZYe9WA/TRSo=;
        b=FgM9lTDLSGawLde9FfS2HqR6vQQIoW4MysKItadLxSNdD1k+YgD6bZnGF+Aq8NbKkr
         GF+gbIjfW6O4+g9ti0TCRs6/NIdbCAZ5HahuDdXh8WRHdWdVidhBS4pu7wgeFx6dN3ux
         ITG8l8ndHCeHlnX/pRV/vOnpm1FAaRloRfjkJ2CG2I/tz/MuOiuMqDGuR07a6NQW/aoW
         ptDrN6BU+AX+rwRyFcQtNeKlbsSY5FH8rzsX3x0OXCAZiexuu9mUciFMlJhMfdT0TqXi
         fRdLh5CQSOiOCM9Lp0SHyBYh0YHCVY5V2rqdsHe+6/TdfgsQKV8JK7stDJbQXBea4yyf
         22YA==
X-Gm-Message-State: ABy/qLbWOSIbkin4SyuOoOg2h0atQFkB5pDqDjI3r3LN+8kHGkuRP/rp
	HdsZ2zuJ1fLrh8NX4ZMAlRBgVTeoANpzfe8+ruzf4Q==
X-Google-Smtp-Source: APBJJlFjzbpEP+31/si4/Vu6TgBDuGDUdgmDAb+LQSJdGqLQ5NObMm08ax7tAk4CWuY5q+eCt42g4Q==
X-Received: by 2002:a05:6000:1cc:b0:314:2d71:1f7a with SMTP id t12-20020a05600001cc00b003142d711f7amr1248369wrx.32.1690531159854;
        Fri, 28 Jul 2023 00:59:19 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 5/5] pdx: Add CONFIG_HAS_PDX_COMPRESSION as a common Kconfig option
Date: Fri, 28 Jul 2023 08:59:03 +0100
Message-Id: <20230728075903.7838-6-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a new compile-time flag to allow disabling pdx compression and
compiles out compression-related code/data. It also shorts the pdx<->pfn
conversion macros and creates stubs for masking fucntions.

While at it, removes the old arch-defined CONFIG_HAS_PDX flag, as it was
not removable in practice.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * Merged v1/patch2: Removal of CONFIG_HAS_PDX here (Jan)
---
 xen/arch/arm/Kconfig  |  1 -
 xen/arch/x86/Kconfig  |  1 -
 xen/arch/x86/domain.c | 19 +++++++++++++------
 xen/common/Kconfig    | 13 ++++++++++---
 xen/common/Makefile   |  2 +-
 xen/common/pdx.c      | 15 +++++++++++----
 xen/include/xen/pdx.h | 37 ++++++++++++++++++++++++++++++++++---
 7 files changed, 69 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 439cc94f33..ea1949fbaa 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -14,7 +14,6 @@ config ARM
 	select HAS_ALTERNATIVE
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
-	select HAS_PDX
 	select HAS_PMAP
 	select HAS_UBSAN
 	select IOMMU_FORCE_PT_SHARE
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 92f3a627da..30df085d96 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -24,7 +24,6 @@ config X86
 	select HAS_PASSTHROUGH
 	select HAS_PCI
 	select HAS_PCI_MSI
-	select HAS_PDX
 	select HAS_SCHED_GRANULARITY
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 5f66c2ae33..ee2830aad7 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -458,7 +458,7 @@ void domain_cpu_policy_changed(struct domain *d)
     }
 }
 
-#ifndef CONFIG_BIGMEM
+#if !defined(CONFIG_BIGMEM) && defined(CONFIG_PDX_COMPRESSION)
 /*
  * The hole may be at or above the 44-bit boundary, so we need to determine
  * the total bit count until reaching 32 significant (not squashed out) bits
@@ -485,13 +485,20 @@ static unsigned int __init noinline _domain_struct_bits(void)
 struct domain *alloc_domain_struct(void)
 {
     struct domain *d;
-#ifdef CONFIG_BIGMEM
-    const unsigned int bits = 0;
-#else
+
     /*
-     * We pack the PDX of the domain structure into a 32-bit field within
-     * the page_info structure. Hence the MEMF_bits() restriction.
+     * Without CONFIG_BIGMEM, we pack the PDX of the domain structure into
+     * a 32-bit field within the page_info structure. Hence the MEMF_bits()
+     * restriction. With PDX compression in place the number of bits must
+     * be calculated at runtime, but it's fixed otherwise.
+     *
+     * On systems with CONFIG_BIGMEM there's no packing, and so there's no
+     * such restriction.
      */
+#if defined(CONFIG_BIGMEM) || !defined(CONFIG_PDX_COMPRESSION)
+    const unsigned int bits = IS_ENABLED(CONFIG_BIGMEM) ? 0 :
+                                                          32 + PAGE_SHIFT;
+#else
     static unsigned int __read_mostly bits;
 
     if ( unlikely(!bits) )
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index dd8d7c3f1c..3a0afd8e83 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -23,6 +23,16 @@ config GRANT_TABLE
 
 	  If unsure, say Y.
 
+config PDX_COMPRESSION
+	bool "PDX (Page inDeX) compression support"
+	default ARM
+	help
+	  PDX compression is a technique that allows the hypervisor to
+	  represent physical addresses in a very space-efficient manner.
+	  This is very helpful reducing memory wastage in systems with
+	  memory banks with base addresses far from each other, but carrier
+	  a performance cost.
+
 config ALTERNATIVE_CALL
 	bool
 
@@ -53,9 +63,6 @@ config HAS_IOPORTS
 config HAS_KEXEC
 	bool
 
-config HAS_PDX
-	bool
-
 config HAS_PMAP
 	bool
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 46049eac35..0020cafb8a 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -29,7 +29,7 @@ obj-y += multicall.o
 obj-y += notifier.o
 obj-$(CONFIG_NUMA) += numa.o
 obj-y += page_alloc.o
-obj-$(CONFIG_HAS_PDX) += pdx.o
+obj-y += pdx.o
 obj-$(CONFIG_PERF_COUNTERS) += perfc.o
 obj-bin-$(CONFIG_HAS_PMAP) += pmap.init.o
 obj-y += preempt.o
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index d3d38965bd..a3b1ba9fbb 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -31,11 +31,15 @@ unsigned long __read_mostly pdx_group_valid[BITS_TO_LONGS(
 
 bool __mfn_valid(unsigned long mfn)
 {
-    if ( unlikely(evaluate_nospec(mfn >= max_page)) )
+    bool invalid = mfn >= max_page;
+#ifdef CONFIG_PDX_COMPRESSION
+    invalid |= mfn & pfn_hole_mask;
+#endif
+
+    if ( unlikely(evaluate_nospec(invalid)) )
         return false;
-    return likely(!(mfn & pfn_hole_mask)) &&
-           likely(test_bit(pfn_to_pdx(mfn) / PDX_GROUP_COUNT,
-                           pdx_group_valid));
+
+    return test_bit(pfn_to_pdx(mfn) / PDX_GROUP_COUNT, pdx_group_valid);
 }
 
 void set_pdx_range(unsigned long smfn, unsigned long emfn)
@@ -49,6 +53,8 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn)
         __set_bit(idx, pdx_group_valid);
 }
 
+#ifdef CONFIG_PDX_COMPRESSION
+
 /*
  * Diagram to make sense of the following variables. The masks and shifts
  * are done on mfn values in order to convert to/from pdx:
@@ -175,6 +181,7 @@ void __init pfn_pdx_hole_setup(unsigned long mask)
     pfn_top_mask        = ~(pfn_pdx_bottom_mask | pfn_hole_mask);
     ma_top_mask         = pfn_top_mask << PAGE_SHIFT;
 }
+#endif /* CONFIG_PDX_COMPRESSION */
 
 
 /*
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 5a82b6bde2..dfb475c8dc 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -67,8 +67,6 @@
  * region involved.
  */
 
-#ifdef CONFIG_HAS_PDX
-
 extern unsigned long max_pdx;
 
 #define PDX_GROUP_COUNT ((1 << PDX_GROUP_SHIFT) / \
@@ -100,6 +98,8 @@ bool __mfn_valid(unsigned long mfn);
 #define mfn_to_pdx(mfn) pfn_to_pdx(mfn_x(mfn))
 #define pdx_to_mfn(pdx) _mfn(pdx_to_pfn(pdx))
 
+#ifdef CONFIG_PDX_COMPRESSION
+
 extern unsigned long pfn_pdx_bottom_mask, ma_va_bottom_mask;
 extern unsigned int pfn_pdx_hole_shift;
 extern unsigned long pfn_hole_mask;
@@ -205,8 +205,39 @@ static inline uint64_t directmapoff_to_maddr(unsigned long offset)
  *             position marks a potentially compressible bit.
  */
 void pfn_pdx_hole_setup(unsigned long mask);
+#else /* CONFIG_PDX_COMPRESSION */
+
+/* Without PDX compression we can skip some computations */
+
+/* pdx<->pfn == identity */
+#define pdx_to_pfn(x) (x)
+#define pfn_to_pdx(x) (x)
+
+/* directmap is indexed by by maddr */
+#define maddr_to_directmapoff(x) (x)
+#define directmapoff_to_maddr(x) (x)
+
+static inline bool pdx_is_region_compressible(unsigned long smfn,
+                                              unsigned long emfn)
+{
+    return true;
+}
+
+static inline uint64_t pdx_init_mask(uint64_t base_addr)
+{
+    return 0;
+}
+
+static inline uint64_t pdx_region_mask(uint64_t base, uint64_t len)
+{
+    return 0;
+}
+
+static inline void pfn_pdx_hole_setup(unsigned long mask)
+{
+}
 
-#endif /* HAS_PDX */
+#endif /* CONFIG_PDX_COMPRESSION */
 #endif /* __XEN_PDX_H__ */
 
 /*
-- 
2.34.1


