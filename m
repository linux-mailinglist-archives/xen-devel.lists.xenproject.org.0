Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094C8B1087F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 13:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055724.1424077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uetl7-00021g-L7; Thu, 24 Jul 2025 11:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055724.1424077; Thu, 24 Jul 2025 11:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uetl7-0001we-HW; Thu, 24 Jul 2025 11:05:09 +0000
Received: by outflank-mailman (input) for mailman id 1055724;
 Thu, 24 Jul 2025 11:05:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=98ak=2F=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uetl5-00011w-9L
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 11:05:07 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dcc6da7-687e-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 13:05:05 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso497431f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 04:05:05 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b76fc6d2b6sm1843244f8f.22.2025.07.24.04.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 04:05:03 -0700 (PDT)
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
X-Inumbo-ID: 0dcc6da7-687e-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753355104; x=1753959904; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPvk01+jvD+QkqQzSEPQ24j6gzkrPWZQXCb8655/PtA=;
        b=oySBWd3RT6/GEpuvb0ZWX1hcLMEfq+TITMXtz/KoIEcsjwcGMW9p41lGUBH/iV87gb
         7DW75HE3aQFm5gOl3/NUBnCFRXFE1eRx7fcTk+y31c/8XrKcA/kJdttyT+z9EIsOY1gb
         Y5k4PSO6l0D+K4a5kH/MUZ+kcYpt76GtY9dLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355104; x=1753959904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JPvk01+jvD+QkqQzSEPQ24j6gzkrPWZQXCb8655/PtA=;
        b=L/9BhvdeCIWgcBZ0myrPhDL648c1pLDC2S8Dav5SqpxP6z4FjCUDMKNzYwBnSBkqbt
         k9JpQyZHhS61t8qHMI9NDZsNDtmUgG05pqZQ2PV0ce8JBWm6vJIYBQxj++mL2IAN1JC9
         Qt6BTGJwO6yKIReSbcR8RKksdecmxgmj8z29f6lOUF5R1gs/YMAMWvYtF+RsyEO4TyfM
         zPAhRYBqbrHujQo6SQWJCXVW2alspU3sFon5X+hfiScLY5HMGuPQq5SOrNy+FHtGcLru
         sG07LXHYrTTrksnHybkLoNZi/QkvjlP75V7XlOjILBLIvOxzmx6eMtSjxvOFrSOs0HFW
         rgtg==
X-Gm-Message-State: AOJu0YywJLlZYKx5dbxqas0jBtEpAVK0wK9H0h2fK6hXb5qflSejMkbk
	tRoaG66CssLite4xElkH0XBwVj7yk1MvsQ2MtP5dm5JTD019Vy01izJ7f3iokkpYNXBZvgEKP+T
	YpAQS
X-Gm-Gg: ASbGncs1d5QkSgn0fxyag4UgDkbD32bBO8E+JVZYgZLJ6rxHN/Au6BaZIyxJCRDBpOS
	u6poxH+FlVd+S8f5PrMq2/3X2S7EcWWUdwkAqF//gX18ksShFvsThakk2vY+Z+lJ8fOPp+h4Jxr
	/x43zLnZPyNTSFKLSVmxFGJKdvDktRrHGBmvn9oNXzT2PVLislWk7HkPzXm/CRIqaao30DMAA3g
	UGpDrkQvSZDwLbPQJyXxZIrCl5KHG+nfYb/Xjjq5PA3+QuI2uzhI08Kth4Odtru9VlT2BDxh7R8
	EU91WvlQDIckS0g5lWUCtvcy5AZ4qvWY2aAnR1uymUKK/VGV320DQUa3hv6jchX6YFItAyfSfHl
	f7Wd6YpNACPxBqiHEdIMiK7C/hEVMt1dSYxryE/jAbl500x1Jpn7AfmoMV1UteaF9SA==
X-Google-Smtp-Source: AGHT+IFxHvuiHvyQ2qSnocuSuJlAPPKbPiqDm0DzpLwM/iUkhFPLpVJfM0jH0cC+ZDfeyCfdYMWWeQ==
X-Received: by 2002:a05:6000:2512:b0:3b3:9c75:acc6 with SMTP id ffacd0b85a97d-3b768f165ecmr5023969f8f.59.1753355104249;
        Thu, 24 Jul 2025 04:05:04 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v3 4/8] pdx: allow per-arch optimization of PDX conversion helpers
Date: Thu, 24 Jul 2025 13:04:12 +0200
Message-ID: <20250724110416.2081-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724110416.2081-1-roger.pau@citrix.com>
References: <20250724110416.2081-1-roger.pau@citrix.com>
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
the translation when not active, using asm goto.  Other architectures use a
generic header that maps the non-xlate to the xlate variants to keep the
previous behavior.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Consume the skip label as parameter in the PDX optimize macro.

Changes since v1:
 - Pull return out of OPTIMIZE_PDX macro.
 - undef OPTIMIZE_PDX.
---
Would it make sense to move the x86 implementation to the common pdx.h
header and let architectures define PDX_ASM_GOTO_SKIP instead?
---
 xen/arch/arm/include/asm/Makefile      |  1 +
 xen/arch/ppc/include/asm/Makefile      |  1 +
 xen/arch/riscv/include/asm/Makefile    |  1 +
 xen/arch/x86/include/asm/cpufeatures.h |  1 +
 xen/arch/x86/include/asm/pdx.h         | 75 ++++++++++++++++++++++++++
 xen/arch/x86/srat.c                    |  6 ++-
 xen/common/pdx.c                       | 10 ++--
 xen/include/asm-generic/pdx.h          | 24 +++++++++
 xen/include/xen/pdx.h                  | 22 +++++---
 9 files changed, 130 insertions(+), 11 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/pdx.h
 create mode 100644 xen/include/asm-generic/pdx.h

diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 4565baca6a4d..cec13c889dab 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -5,6 +5,7 @@ generic-y += hardirq.h
 generic-y += iocap.h
 generic-y += irq-dt.h
 generic-y += paging.h
+generic-y += pdx.h
 generic-y += percpu.h
 generic-y += random.h
 generic-y += softirq.h
diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index c989a7f89b34..0ad45133baac 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -6,6 +6,7 @@ generic-y += hardirq.h
 generic-y += hypercall.h
 generic-y += iocap.h
 generic-y += paging.h
+generic-y += pdx.h
 generic-y += percpu.h
 generic-y += perfc_defn.h
 generic-y += random.h
diff --git a/xen/arch/riscv/include/asm/Makefile b/xen/arch/riscv/include/asm/Makefile
index bfdf186c682f..de04daf68df3 100644
--- a/xen/arch/riscv/include/asm/Makefile
+++ b/xen/arch/riscv/include/asm/Makefile
@@ -7,6 +7,7 @@ generic-y += hypercall.h
 generic-y += iocap.h
 generic-y += irq-dt.h
 generic-y += paging.h
+generic-y += pdx.h
 generic-y += percpu.h
 generic-y += perfc_defn.h
 generic-y += random.h
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
index 000000000000..00666e49831a
--- /dev/null
+++ b/xen/arch/x86/include/asm/pdx.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef X86_PDX_H
+#define X86_PDX_H
+
+#ifndef CONFIG_PDX_NONE
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
+#endif /* !CONFIG_PDX_NONE */
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
index ad7871ad90be..f4ee2198841d 100644
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
diff --git a/xen/include/asm-generic/pdx.h b/xen/include/asm-generic/pdx.h
new file mode 100644
index 000000000000..4dea2b97c3e5
--- /dev/null
+++ b/xen/include/asm-generic/pdx.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef GENERIC_PDX_H
+#define GENERIC_PDX_H
+
+#ifndef CONFIG_PDX_NONE
+
+#define pdx_to_pfn pdx_to_pfn_xlate
+#define pfn_to_pdx pfn_to_pdx_xlate
+#define maddr_to_directmapoff maddr_to_directmapoff_xlate
+#define directmapoff_to_maddr directmapoff_to_maddr_xlate
+
+#endif /* !CONFIG_PDX_NONE */
+
+#endif /* GENERIC_PDX_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 10153da98bf1..91fc32370f21 100644
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
@@ -159,6 +159,14 @@ static inline paddr_t directmapoff_to_maddr(unsigned long offset)
 
 #endif /* CONFIG_PDX_MASK_COMPRESSION */
 
+/*
+ * Allow each architecture to define it's (possibly optimized) versions of the
+ * translation functions.
+ *
+ * Do not use _xlate suffixed functions, always use the non _xlate variants.
+ */
+#include <asm/pdx.h>
+
 #ifdef CONFIG_PDX_NONE
 
 /* Without PDX compression we can skip some computations */
@@ -181,8 +189,9 @@ static inline void pfn_pdx_add_region(paddr_t base, paddr_t size)
 {
 }
 
-static inline void pfn_pdx_compression_setup(paddr_t base)
+static inline bool pfn_pdx_compression_setup(paddr_t base)
 {
+    return false;
 }
 
 static inline void pfn_pdx_compression_reset(void)
@@ -215,8 +224,9 @@ void pfn_pdx_add_region(paddr_t base, paddr_t size);
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


