Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C0EB1B17C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 11:53:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070228.1433916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujEMC-00039a-2Q; Tue, 05 Aug 2025 09:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070228.1433916; Tue, 05 Aug 2025 09:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujEMB-00031U-PT; Tue, 05 Aug 2025 09:53:19 +0000
Received: by outflank-mailman (input) for mailman id 1070228;
 Tue, 05 Aug 2025 09:53:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xkmx=2R=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujEM9-00026G-RI
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 09:53:17 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02297962-71e2-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 11:53:16 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b7886bee77so4477966f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 02:53:16 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3b95f4sm18447847f8f.23.2025.08.05.02.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 02:53:14 -0700 (PDT)
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
X-Inumbo-ID: 02297962-71e2-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754387595; x=1754992395; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1xBFAQp2tU3X5eYxoTRxXwfOAwjqwHWw59TnMhPZ9E=;
        b=c7MBeCHiCF/1qUpO+iiwYHbrHY9wcB+QuR2xazxnaFp4qjTLqPTR2LtDv1utuNCBgH
         mLqLd13md5+PXbvXvf5bT98cPORVCM3tjny5EmoK7y9f5IzxPWFN8J+NOpjGRt48AAWZ
         DZOJZltmaspumcZLHnl0fAzNrQTVbm/IDn6cQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754387595; x=1754992395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1xBFAQp2tU3X5eYxoTRxXwfOAwjqwHWw59TnMhPZ9E=;
        b=GLtiPxzGsu4E6tKIYRXwTdjyD5BpFILq3EvgkcOKkYbldps8Dr4O7AtanZ63rFjK1E
         EKnoV+X2kCLy3UIOwma26MjqkJgomBEpcJct1OpG2ic85e005oc+1Cb/6BJO1vH2dcYn
         IDmPvDXFZ1UsAFQTFrLzNJE4ZNTAwn8nkKe23cu8CVvtG4lscqQT4fGrgRKGZ53HA38A
         TCTAEVEaUQX8ofqL+aX5KRDEelW8NVvdgfmOY3bl1ycKHNlRNPDtF/8Qqxj8HxkgMG9v
         xy+O7z5ctFbyaO1ZPZ0hqo56XyyZVHCJvGatEz6uCoJoGKVdd9LRiEU3il4+EbE1af+F
         mcKg==
X-Gm-Message-State: AOJu0YzdMR7yG4bRWb5amUVeQOkD7ISxBhBgMTC6gEYD2JdSebsEUj08
	3c1EzmdvAau7dEurca9jkEAViWDtpu7yx6eIyGLvrPc4YC2j9zprL9a4jJ3JKpz0pPGXs6N9UjC
	8nzNq
X-Gm-Gg: ASbGncvzxsNC7HZPe1VJkJ5G1Ny1JYdVfnePHfFmxd9HEr0XETfY/v33Y4swDQtErJp
	OBca8ZsUaCYKRWbEJAbt1rZTjI/WUOTJlR6uxjsQO4fc7aejhN5Z/DqJcXCpsbW2sXHl/lCf5FB
	qiUxjVYqRmuDCvYcLJz3oGu52LlleCE0xz9AN+/ZTWJnXrw5hX9DotlOlV9n6aEmI1v/Cj1NIF+
	rOjVJtwwiFM8ntV9uVi26C3IEcrcX8yxXrUiG6QMK9rFwRk74hsuCYrpYq+RWun27H5gl/GIDoi
	nySQEaSo4ic+EDZj4XDnsblvuQnQz1azqu9HS8OUZgLdBt2BeBRSZtGHzvRKI7kGVPboLmlbk99
	zxUFQLSZVvPeO1P/JezYC5sO5805y6/cVl+UhZ2em1l5iN0qTskJHcOwnEIWHlT5idg==
X-Google-Smtp-Source: AGHT+IFHLgGTaQ6E5u7Plz8Q4Qef8ivTkL1ylGSdq7BstwwYvvUspsHFDN/BNElPxIzFK+sVHrumXg==
X-Received: by 2002:a5d:588a:0:b0:3b7:e3c3:fbb6 with SMTP id ffacd0b85a97d-3b8d94ba9aemr9316236f8f.31.1754387594710;
        Tue, 05 Aug 2025 02:53:14 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 4/8] pdx: allow per-arch optimization of PDX conversion helpers
Date: Tue,  5 Aug 2025 11:52:53 +0200
Message-ID: <20250805095257.74975-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250805095257.74975-1-roger.pau@citrix.com>
References: <20250805095257.74975-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are four performance critical PDX conversion helpers that do the PFN
to/from PDX and the physical addresses to/from directmap offsets
translations.

In the absence of an active PDX compression, those functions would still do
the calculations needed, just to return the same input value as no
translation is in place and hence PFN and PDX spaces are identity mapped.

To reduce the overhead of having to do the pointless calculations allow
architectures to implement the translation helpers in a per-arch header.
Rename the existing conversion functions to add a trailing _xlate suffix,
so that the per-arch headers can define the non suffixed versions.

Currently only x86 implements meaningful custom handlers to short circuit
the translation when not active, using asm goto.  Other architectures use
generic macros that map the non-xlate to the xlate variants to keep the
previous behavior.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Use has_include.

Changes since v2:
 - Consume the skip label as parameter in the PDX optimize macro.

Changes since v1:
 - Pull return out of OPTIMIZE_PDX macro.
 - undef OPTIMIZE_PDX.
---
Would it make sense to move the x86 implementation to the common pdx.h
header and let architectures define PDX_ASM_GOTO_SKIP instead?
---
 xen/arch/x86/include/asm/cpufeatures.h |  1 +
 xen/arch/x86/include/asm/pdx.h         | 71 ++++++++++++++++++++++++++
 xen/arch/x86/srat.c                    |  6 ++-
 xen/common/pdx.c                       | 10 ++--
 xen/include/xen/pdx.h                  | 29 ++++++++---
 5 files changed, 106 insertions(+), 11 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/pdx.h

diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index bc108c3819e8..71308d9dafc8 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -42,6 +42,7 @@ XEN_CPUFEATURE(XEN_IBT,           X86_SYNTH(27)) /* Xen uses CET Indirect Branch
 XEN_CPUFEATURE(IBPB_ENTRY_PV,     X86_SYNTH(28)) /* MSR_PRED_CMD used by Xen for PV */
 XEN_CPUFEATURE(IBPB_ENTRY_HVM,    X86_SYNTH(29)) /* MSR_PRED_CMD used by Xen for HVM */
 XEN_CPUFEATURE(USE_VMCALL,        X86_SYNTH(30)) /* Use VMCALL instead of VMMCALL */
+XEN_CPUFEATURE(PDX_COMPRESSION,   X86_SYNTH(31)) /* PDX compression */
 
 /* Bug words follow the synthetic words. */
 #define X86_NR_BUG 1
diff --git a/xen/arch/x86/include/asm/pdx.h b/xen/arch/x86/include/asm/pdx.h
new file mode 100644
index 000000000000..6be7e1185eb1
--- /dev/null
+++ b/xen/arch/x86/include/asm/pdx.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef X86_PDX_H
+#define X86_PDX_H
+
+#include <asm/alternative.h>
+
+/*
+ * Introduce a macro to avoid repeating the same asm goto block in each helper.
+ * Note the macro is strictly tied to the code in the helpers.
+ */
+#define PDX_ASM_GOTO(label)                         \
+    asm_inline goto (                               \
+        ALTERNATIVE(                                \
+            "",                                     \
+            "jmp %l0",                              \
+            ALT_NOT(X86_FEATURE_PDX_COMPRESSION))   \
+        : : : : label )
+
+static inline unsigned long pfn_to_pdx(unsigned long pfn)
+{
+    PDX_ASM_GOTO(skip);
+
+    return pfn_to_pdx_xlate(pfn);
+
+ skip:
+    return pfn;
+}
+
+static inline unsigned long pdx_to_pfn(unsigned long pdx)
+{
+    PDX_ASM_GOTO(skip);
+
+    return pdx_to_pfn_xlate(pdx);
+
+ skip:
+    return pdx;
+}
+
+static inline unsigned long maddr_to_directmapoff(paddr_t ma)
+{
+    PDX_ASM_GOTO(skip);
+
+    return maddr_to_directmapoff_xlate(ma);
+
+ skip:
+    return ma;
+}
+
+static inline paddr_t directmapoff_to_maddr(unsigned long offset)
+{
+    PDX_ASM_GOTO(skip);
+
+    return directmapoff_to_maddr_xlate(offset);
+
+ skip:
+    return offset;
+}
+
+#undef PDX_ASM_GOTO_SKIP
+
+#endif /* X86_PDX_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 747607439fb4..42ccb0c0f3ae 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -298,7 +298,8 @@ void __init srat_parse_regions(paddr_t addr)
 	acpi_table_parse_srat(ACPI_SRAT_TYPE_MEMORY_AFFINITY,
 			      srat_parse_region, 0);
 
-	pfn_pdx_compression_setup(addr);
+	if (!pfn_pdx_compression_setup(addr))
+		return;
 
 	/* Ensure all RAM ranges in the e820 are covered. */
 	for (i = 0; i < e820.nr_map; i++) {
@@ -318,6 +319,9 @@ void __init srat_parse_regions(paddr_t addr)
 			return;
 		}
 	}
+
+	/* If we got this far compression is working as expected. */
+	setup_force_cpu_cap(X86_FEATURE_PDX_COMPRESSION);
 }
 
 unsigned int numa_node_to_arch_nid(nodeid_t n)
diff --git a/xen/common/pdx.c b/xen/common/pdx.c
index f4a3dcf6cb60..c9ec86729151 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -215,7 +215,7 @@ static uint64_t __init pdx_init_mask(uint64_t base_addr)
                          (uint64_t)1 << (MAX_ORDER + PAGE_SHIFT)) - 1);
 }
 
-void __init pfn_pdx_compression_setup(paddr_t base)
+bool __init pfn_pdx_compression_setup(paddr_t base)
 {
     unsigned int i, j, bottom_shift = 0, hole_shift = 0;
     unsigned long mask = pdx_init_mask(base) >> PAGE_SHIFT;
@@ -224,7 +224,7 @@ void __init pfn_pdx_compression_setup(paddr_t base)
     {
         printk(XENLOG_DEBUG "PFN compression disabled%s\n",
                pdx_compress ? ": no ranges provided" : "");
-        return;
+        return false;
     }
 
     if ( nr_ranges > ARRAY_SIZE(ranges) )
@@ -232,7 +232,7 @@ void __init pfn_pdx_compression_setup(paddr_t base)
         printk(XENLOG_WARNING
                "Too many PFN ranges (%u > %zu), not attempting PFN compression\n",
                nr_ranges, ARRAY_SIZE(ranges));
-        return;
+        return false;
     }
 
     for ( i = 0; i < nr_ranges; i++ )
@@ -263,7 +263,7 @@ void __init pfn_pdx_compression_setup(paddr_t base)
         }
     }
     if ( !hole_shift )
-        return;
+        return false;
 
     printk(KERN_INFO "PFN compression on bits %u...%u\n",
            bottom_shift, bottom_shift + hole_shift - 1);
@@ -274,6 +274,8 @@ void __init pfn_pdx_compression_setup(paddr_t base)
     pfn_hole_mask       = ((1UL << hole_shift) - 1) << bottom_shift;
     pfn_top_mask        = ~(pfn_pdx_bottom_mask | pfn_hole_mask);
     ma_top_mask         = pfn_top_mask << PAGE_SHIFT;
+
+    return true;
 }
 
 void __init pfn_pdx_compression_reset(void)
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 10153da98bf1..425d45e9f08e 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -114,7 +114,7 @@ extern unsigned long pfn_top_mask, ma_top_mask;
  * @param pfn Frame number
  * @return Obtained pdx after compressing the pfn
  */
-static inline unsigned long pfn_to_pdx(unsigned long pfn)
+static inline unsigned long pfn_to_pdx_xlate(unsigned long pfn)
 {
     return (pfn & pfn_pdx_bottom_mask) |
            ((pfn & pfn_top_mask) >> pfn_pdx_hole_shift);
@@ -126,7 +126,7 @@ static inline unsigned long pfn_to_pdx(unsigned long pfn)
  * @param pdx Page index
  * @return Obtained pfn after decompressing the pdx
  */
-static inline unsigned long pdx_to_pfn(unsigned long pdx)
+static inline unsigned long pdx_to_pfn_xlate(unsigned long pdx)
 {
     return (pdx & pfn_pdx_bottom_mask) |
            ((pdx << pfn_pdx_hole_shift) & pfn_top_mask);
@@ -139,7 +139,7 @@ static inline unsigned long pdx_to_pfn(unsigned long pdx)
  * @return Offset on the direct map where that
  *         machine address can be accessed
  */
-static inline unsigned long maddr_to_directmapoff(paddr_t ma)
+static inline unsigned long maddr_to_directmapoff_xlate(paddr_t ma)
 {
     return (((ma & ma_top_mask) >> pfn_pdx_hole_shift) |
             (ma & ma_va_bottom_mask));
@@ -151,7 +151,7 @@ static inline unsigned long maddr_to_directmapoff(paddr_t ma)
  * @param offset Offset into the direct map
  * @return Corresponding machine address of that virtual location
  */
-static inline paddr_t directmapoff_to_maddr(unsigned long offset)
+static inline paddr_t directmapoff_to_maddr_xlate(unsigned long offset)
 {
     return ((((paddr_t)offset << pfn_pdx_hole_shift) & ma_top_mask) |
             (offset & ma_va_bottom_mask));
@@ -181,8 +181,9 @@ static inline void pfn_pdx_add_region(paddr_t base, paddr_t size)
 {
 }
 
-static inline void pfn_pdx_compression_setup(paddr_t base)
+static inline bool pfn_pdx_compression_setup(paddr_t base)
 {
+    return false;
 }
 
 static inline void pfn_pdx_compression_reset(void)
@@ -191,6 +192,21 @@ static inline void pfn_pdx_compression_reset(void)
 
 #else /* !CONFIG_PDX_NONE */
 
+/*
+ * Allow each architecture to define its (possibly optimized) versions of the
+ * translation functions.
+ *
+ * Do not use _xlate suffixed functions, always use the non _xlate variants.
+ */
+#if __has_include(<asm/pdx.h>)
+# include <asm/pdx.h>
+#else
+# define pdx_to_pfn pdx_to_pfn_xlate
+# define pfn_to_pdx pfn_to_pdx_xlate
+# define maddr_to_directmapoff maddr_to_directmapoff_xlate
+# define directmapoff_to_maddr directmapoff_to_maddr_xlate
+#endif
+
 /* Shared functions implemented by all PDX compressions. */
 
 /**
@@ -215,8 +231,9 @@ void pfn_pdx_add_region(paddr_t base, paddr_t size);
  * range of the current memory regions.
  *
  * @param base address to start compression from.
+ * @return True if PDX compression has been enabled.
  */
-void pfn_pdx_compression_setup(paddr_t base);
+bool pfn_pdx_compression_setup(paddr_t base);
 
 /**
  * Reset the global variables to it's default values, thus disabling PFN
-- 
2.49.0


