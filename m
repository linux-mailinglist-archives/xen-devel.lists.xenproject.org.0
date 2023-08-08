Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D029773A52
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579784.907928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMMF-00046D-Jm; Tue, 08 Aug 2023 13:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579784.907928; Tue, 08 Aug 2023 13:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMMF-00043G-FX; Tue, 08 Aug 2023 13:02:43 +0000
Received: by outflank-mailman (input) for mailman id 579784;
 Tue, 08 Aug 2023 13:02:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gjkb=DZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qTMMD-0003KL-8i
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:02:41 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db1c4a94-35eb-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 15:02:40 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fbea14700bso48055405e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Aug 2023 06:02:40 -0700 (PDT)
Received: from localhost.localdomain (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y15-20020a5d4acf000000b003144b50034esm13567072wrs.110.2023.08.08.06.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 06:02:39 -0700 (PDT)
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
X-Inumbo-ID: db1c4a94-35eb-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1691499760; x=1692104560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLKiL/jNslxYi/QSWYQzg3uu6el6+QZP5XsqGeRNlAs=;
        b=Yk2dU9B70C6NTd0q+fmYujVQUDxUzjoJ1Ysp42lk4W37mG7tb3DKPXw/RhRga+2oRR
         M/kOXQzc5+oJVn6ptI/aUS9kSvCrV0rxeKDHsjAyrb8/4pnJY27YeCCAS5399PRQeBIY
         BWMKM/aK7koR6IvEahvAw0xLiWNgi/Wr4WqYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691499760; x=1692104560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLKiL/jNslxYi/QSWYQzg3uu6el6+QZP5XsqGeRNlAs=;
        b=ZGrpmHoJwna1rb1N1Ea0s8BxA2L8UUjuv7e6x2BgP0jKCLQmoTEu2qe2o0SlYIQ8W4
         lXFL4504GWdn79DJcOFZ09aBCOZ3ztNvY4wgynDdsLC8ADe4aYtW03ZGZkphtQZJaUwI
         t5X5vp2nqoiDwegiqN7UpqR3CjQIAS4qSyiOIsVAGIpZny5aWWGD6aJ5MX6vnv1P3Ufd
         gwckdetsMDG3fWfoDBEjZBVqKESZLWTfEEPpyaIJhRdiK63D3utrSdF25XvMPy7CqJRb
         zsXQ98lCpCakR6awF61ugD6W3orPIRdAPLRl4Ilxsm8wgsI3XqO43NDPJpCv4jcNO2LN
         lbPA==
X-Gm-Message-State: AOJu0YzsViNU8HhyhmkVUmN4p/LOfTbaa0VC/beB3nSMYZpB8RjVMKZ2
	k7G8xfwq5DtaLE60qcHosdEKF4cy0HP9TJg8Ttw=
X-Google-Smtp-Source: AGHT+IGaM6+/0iPdaGeT67glHUk1CVKgmWsCdOnkmwkJfkQWD8hDRBMP6LVD/yt05UNn/y/OWrxcyA==
X-Received: by 2002:a1c:7708:0:b0:3fe:108d:7f88 with SMTP id t8-20020a1c7708000000b003fe108d7f88mr7998422wmi.36.1691499759914;
        Tue, 08 Aug 2023 06:02:39 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 4/4] pdx: Add CONFIG_PDX_COMPRESSION as a common Kconfig option
Date: Tue,  8 Aug 2023 14:02:20 +0100
Message-Id: <20230808130220.27891-5-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
References: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a new compile-time flag to allow disabling pdx compression and
compiles out compression-related code/data. It also shorts the pdx<->pfn
conversion macros and creates stubs for masking fucntions.

While at it, removes the old arch-defined CONFIG_HAS_PDX flag, as it was
not removable in practice.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v3:
  * Fixed a typo in Kconfig's help
  * Gated CONFIG_PDX_COMPRESSION under EXPERT=y and left default=ARM
  * Fixed commit message after renaming CONFIG_PDX_COMPRESSION (Julien)
  * Changed #else comment to the reason it executes (Julien)
  * Various blank-line related style changes (Jan)
---
 xen/arch/arm/Kconfig  |  1 -
 xen/arch/x86/Kconfig  |  1 -
 xen/arch/x86/domain.c | 19 +++++++++++++------
 xen/common/Kconfig    | 13 ++++++++++---
 xen/common/Makefile   |  2 +-
 xen/common/pdx.c      | 16 ++++++++++++----
 xen/include/xen/pdx.h | 38 +++++++++++++++++++++++++++++++++++---
 7 files changed, 71 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 57bd1d01d7..224db89c05 100644
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
index fe86a7f853..f476df17e4 100644
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
index 0d248ab941..2c1d1fc3a2 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -23,6 +23,16 @@ config GRANT_TABLE
 
 	  If unsure, say Y.
 
+config PDX_COMPRESSION
+	bool "PDX (Page inDeX) compression support" if EXPERT
+	default ARM
+	help
+	  PDX compression is a technique that allows the hypervisor to
+	  represent physical addresses in a very space-efficient manner.
+	  This is very helpful reducing memory wastage in systems with
+	  memory banks with base addresses far from each other, but carries
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
index d3d38965bd..d3d63b0750 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -31,11 +31,16 @@ unsigned long __read_mostly pdx_group_valid[BITS_TO_LONGS(
 
 bool __mfn_valid(unsigned long mfn)
 {
-    if ( unlikely(evaluate_nospec(mfn >= max_page)) )
+    bool invalid = mfn >= max_page;
+
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
@@ -49,6 +54,8 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn)
         __set_bit(idx, pdx_group_valid);
 }
 
+#ifdef CONFIG_PDX_COMPRESSION
+
 /*
  * Diagram to make sense of the following variables. The masks and shifts
  * are done on mfn values in order to convert to/from pdx:
@@ -176,6 +183,7 @@ void __init pfn_pdx_hole_setup(unsigned long mask)
     ma_top_mask         = pfn_top_mask << PAGE_SHIFT;
 }
 
+#endif /* CONFIG_PDX_COMPRESSION */
 
 /*
  * Local variables:
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index b5367a33ca..6511aba6c7 100644
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
@@ -206,7 +206,39 @@ static inline paddr_t directmapoff_to_maddr(unsigned long offset)
  */
 void pfn_pdx_hole_setup(unsigned long mask);
 
-#endif /* HAS_PDX */
+#else /* !CONFIG_PDX_COMPRESSION */
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
+
+#endif /* CONFIG_PDX_COMPRESSION */
 #endif /* __XEN_PDX_H__ */
 
 /*
-- 
2.34.1


