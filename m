Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11239AD5D23
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:23:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011970.1390516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPAA-0003Tw-5X; Wed, 11 Jun 2025 17:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011970.1390516; Wed, 11 Jun 2025 17:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPAA-0003OW-16; Wed, 11 Jun 2025 17:22:58 +0000
Received: by outflank-mailman (input) for mailman id 1011970;
 Wed, 11 Jun 2025 17:22:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJt8=Y2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPPA8-0002dK-Pt
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 17:22:56 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6e638a8-46e8-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 19:22:56 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so187125e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 10:22:56 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45325140f30sm27011275e9.4.2025.06.11.10.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 10:22:54 -0700 (PDT)
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
X-Inumbo-ID: b6e638a8-46e8-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749662576; x=1750267376; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkTPtYu2X1Hla12Ld0GVwhz+81hY0W8JQvDMWI2yhDk=;
        b=H1cO+EFHPnUAvJqxaZgqjQXsXP+W7zaO4cxvrpk48TyC79tFX1LAT03qHluFl/9TIi
         gDFiBmnIUlLDV/QJfXvlv416DEgjr/+nO9CJEq8R6Nt8rN8wfj7AU55Hv1i6ibwrCGFz
         RywfFDGMfOUXY7r7hOvfWuVNUOukTPwj1V3GE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749662576; x=1750267376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jkTPtYu2X1Hla12Ld0GVwhz+81hY0W8JQvDMWI2yhDk=;
        b=tkbVb8KaXi4wRFHT/uGGqqFdTvj1w80JcS+P7wxxK3hLNZBR1Tlg7Oo1sP5u+JdhyM
         RvK4YN0TCKVOBkY7zscuOxUWqMe9Dwh1SDF/5FQuC7/hwNT3Ixj2gQQae4Bb26h4L4yG
         A6rTkTfC4mDWsRDKoJzs9SxWlRGWMjr/ozd4YjkhuCInCkX/kDVAuHhOOhTvM23WI525
         B0fb5ircdYz5mQzBBE/tMsInTwT+J6FYz/mN9WrAtSob9T5nuTku4OybnS9Zxx3yY+uY
         Nk6yfU6v3hsdqDabcJNxVCdnXw94H3WHl3LDp2pJDCMrD7PRMo2hrEr/YOP0Pa8k7ivG
         9mjQ==
X-Gm-Message-State: AOJu0Yx1oCfNYyczvPkcZhkLro6SnWGUBNIU3KHPOldZOQXJM1zsCp/j
	eUN+Dt2kr0WmO6pVybtBoilaDJpYuRjfPSjPoFuONuSa98ZE22lnBkqdbPx+LSsHZFFUczQe0iO
	2up1d
X-Gm-Gg: ASbGncslyyvXda86BjKlVJdPoiqyM9jeKyus40ZhTgh3krC4shNt/83S2tTCSZI//Nh
	Xz9QHZPnCimZ0c3e1od9ibyt9GedfwgxAdCii4QzbtFyXHhvaAIW8nEHS8boz8oOM2/zPe0ueVB
	CdyslVefxltNvMXSdtnFD32zu+mNVgCHEGoadgQMb7xbnXsx0jdiE3QN59YmPhfm0YNdmiWwfOY
	+/5zcPxvwoC2ekyUdHPMbpBGVMsKuaoQAbi9VOS42dL7x9bFA5sn60Z0naR/8AjiNI96s/fJxSo
	BPBUkDZs/woIJBskafBj8piSNJHi0/BCQAKs1ayVIE1hrPOIcEuADHkYOpQw86nSy1gXtTbKc8p
	xojtPLo/p49GxKwie7NAt90Rkkbd54I8FNgo=
X-Google-Smtp-Source: AGHT+IFgWT4jERhURBaaV7IdOzOpS71w3ZR8cxBZ+PefDGAyZ0K/1TK/B1CrOfEVgzsBOCjtRAmCGA==
X-Received: by 2002:a05:600c:4f06:b0:453:608:a18b with SMTP id 5b1f17b1804b1-4532b28d858mr8680555e9.9.1749662575471;
        Wed, 11 Jun 2025 10:22:55 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 5/8] pdx: allow optimizing PDX conversion helpers
Date: Wed, 11 Jun 2025 19:16:33 +0200
Message-ID: <20250611171636.5674-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611171636.5674-1-roger.pau@citrix.com>
References: <20250611171636.5674-1-roger.pau@citrix.com>
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
architectures to short-circuit the logic by providing a macro.  Implement
such short-circuiting for x86 using asm goto and alternatives.  This
results in the optimized case (when PDX compression is not enabled) doing
an unconditional jump to a label, while the non-optimized case is left
as-is.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/cpufeatures.h |  1 +
 xen/arch/x86/srat.c                    |  6 +++-
 xen/common/pdx.c                       |  8 +++--
 xen/include/xen/pdx.h                  | 46 ++++++++++++++++++++------
 4 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index 9e3ed21c026d..85e1a6f0a055 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -43,6 +43,7 @@ XEN_CPUFEATURE(XEN_IBT,           X86_SYNTH(27)) /* Xen uses CET Indirect Branch
 XEN_CPUFEATURE(IBPB_ENTRY_PV,     X86_SYNTH(28)) /* MSR_PRED_CMD used by Xen for PV */
 XEN_CPUFEATURE(IBPB_ENTRY_HVM,    X86_SYNTH(29)) /* MSR_PRED_CMD used by Xen for HVM */
 XEN_CPUFEATURE(USE_VMCALL,        X86_SYNTH(30)) /* Use VMCALL instead of VMMCALL */
+XEN_CPUFEATURE(PDX_COMPRESSION,   X86_SYNTH(31)) /* PDX compression */
 
 /* Bug words follow the synthetic words. */
 #define X86_NR_BUG 1
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 7042fd3c3d88..96a87bbce35b 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -298,7 +298,8 @@ void __init srat_parse_regions(paddr_t addr)
 	acpi_table_parse_srat(ACPI_SRAT_TYPE_MEMORY_AFFINITY,
 			      srat_parse_region, 0);
 
-	pfn_pdx_compression_setup(addr);
+	if (!pfn_pdx_compression_setup(addr))
+		return;
 
 	/* Ensure all ranges in the e820 are covered. */
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
index 65b337860d52..7d14100224fe 100644
--- a/xen/common/pdx.c
+++ b/xen/common/pdx.c
@@ -230,7 +230,7 @@ static uint64_t __init pdx_init_mask(uint64_t base_addr)
                          (uint64_t)1 << (MAX_ORDER + PAGE_SHIFT)) - 1);
 }
 
-void __init pfn_pdx_compression_setup(paddr_t base)
+bool __init pfn_pdx_compression_setup(paddr_t base)
 {
     unsigned int i, j, bottom_shift = 0, hole_shift = 0;
     unsigned long mask = pdx_init_mask(base);
@@ -240,7 +240,7 @@ void __init pfn_pdx_compression_setup(paddr_t base)
         printk(XENLOG_WARNING
                "Too many PFN ranges (%u), not attempting PFN compression\n",
                nr);
-        return;
+        return false;
     }
 
     for ( i = 0; i < nr; i++ )
@@ -272,7 +272,7 @@ void __init pfn_pdx_compression_setup(paddr_t base)
         }
     }
     if ( !hole_shift )
-        return;
+        return false;
 
     printk(KERN_INFO "PFN compression on bits %u...%u\n",
            bottom_shift, bottom_shift + hole_shift - 1);
@@ -283,6 +283,8 @@ void __init pfn_pdx_compression_setup(paddr_t base)
     pfn_hole_mask       = ((1UL << hole_shift) - 1) << bottom_shift;
     pfn_top_mask        = ~(pfn_pdx_bottom_mask | pfn_hole_mask);
     ma_top_mask         = pfn_top_mask << PAGE_SHIFT;
+
+    return true;
 }
 
 void __init pfn_pdx_compression_reset(void)
diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index 43ce36fcbb56..6cc0f54cff83 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -67,6 +67,26 @@
  * region involved.
  */
 
+/* Macro defined per-arch to skip PDX logic when there's no compression. */
+#ifdef CONFIG_X86
+# include <asm/alternative.h>
+
+# define OPTIMIZE_PDX(transform, raw)                   \
+    asm_inline goto (                                   \
+        ALTERNATIVE(                                    \
+            "",                                         \
+            "jmp %l[skip]",                             \
+            ALT_NOT(X86_FEATURE_PDX_COMPRESSION))       \
+        : : : : skip );                                 \
+    return (transform);                                 \
+                                                        \
+ skip:                                                  \
+    return (raw)
+#else
+# define OPTIMIZE_PDX(transform, raw)                   \
+     return (transform)
+#endif
+
 extern unsigned long max_pdx;
 
 #define PDX_GROUP_COUNT ((1 << PDX_GROUP_SHIFT) / \
@@ -123,8 +143,9 @@ extern unsigned long pfn_top_mask, ma_top_mask;
  */
 static inline unsigned long pfn_to_pdx(unsigned long pfn)
 {
-    return (pfn & pfn_pdx_bottom_mask) |
-           ((pfn & pfn_top_mask) >> pfn_pdx_hole_shift);
+    OPTIMIZE_PDX((pfn & pfn_pdx_bottom_mask) |
+                 ((pfn & pfn_top_mask) >> pfn_pdx_hole_shift),
+                 pfn);
 }
 
 /**
@@ -135,8 +156,9 @@ static inline unsigned long pfn_to_pdx(unsigned long pfn)
  */
 static inline unsigned long pdx_to_pfn(unsigned long pdx)
 {
-    return (pdx & pfn_pdx_bottom_mask) |
-           ((pdx << pfn_pdx_hole_shift) & pfn_top_mask);
+    OPTIMIZE_PDX((pdx & pfn_pdx_bottom_mask) |
+                 ((pdx << pfn_pdx_hole_shift) & pfn_top_mask),
+                 pdx);
 }
 
 /**
@@ -148,8 +170,9 @@ static inline unsigned long pdx_to_pfn(unsigned long pdx)
  */
 static inline unsigned long maddr_to_directmapoff(paddr_t ma)
 {
-    return (((ma & ma_top_mask) >> pfn_pdx_hole_shift) |
-            (ma & ma_va_bottom_mask));
+    OPTIMIZE_PDX(((ma & ma_top_mask) >> pfn_pdx_hole_shift) |
+                  (ma & ma_va_bottom_mask),
+                  ma);
 }
 
 /**
@@ -160,8 +183,9 @@ static inline unsigned long maddr_to_directmapoff(paddr_t ma)
  */
 static inline paddr_t directmapoff_to_maddr(unsigned long offset)
 {
-    return ((((paddr_t)offset << pfn_pdx_hole_shift) & ma_top_mask) |
-            (offset & ma_va_bottom_mask));
+    OPTIMIZE_PDX(((((paddr_t)offset << pfn_pdx_hole_shift) & ma_top_mask) |
+                 (offset & ma_va_bottom_mask)),
+                 offset);
 }
 
 #endif /* CONFIG_PDX_MASK_COMPRESSION */
@@ -188,8 +212,9 @@ static inline void pfn_pdx_add_region(paddr_t base, paddr_t size)
 {
 }
 
-static inline void pfn_pdx_compression_setup(paddr_t base)
+static inline bool pfn_pdx_compression_setup(paddr_t base)
 {
+    return false;
 }
 
 static inline void pfn_pdx_compression_reset(void)
@@ -222,8 +247,9 @@ void pfn_pdx_add_region(paddr_t base, paddr_t size);
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


