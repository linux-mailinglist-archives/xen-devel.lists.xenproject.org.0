Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ACD918378
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:58:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749008.1156972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMT9x-0000hG-Tg; Wed, 26 Jun 2024 13:58:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749008.1156972; Wed, 26 Jun 2024 13:58:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMT9x-0000cc-QQ; Wed, 26 Jun 2024 13:58:05 +0000
Received: by outflank-mailman (input) for mailman id 749008;
 Wed, 26 Jun 2024 13:58:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1Ku=N4=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sMT9w-0000af-B1
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:58:04 +0000
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [2607:f8b0:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a2cb9e6-33c4-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 15:58:02 +0200 (CEST)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-700cc97b220so859853a34.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:58:02 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce9318f6sm499371185a.101.2024.06.26.06.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 06:58:00 -0700 (PDT)
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
X-Inumbo-ID: 1a2cb9e6-33c4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719410281; x=1720015081; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXSq9cIt+cDOKNPJ1wEig1h0MbpC9b/C/ll62WYu3WA=;
        b=YCpEDFcFJ7d2G5KY/dtFwIhg8TPxfs3+LvPqcYHhNqtVT7zOir9QjqYWYDZTc+QAHu
         ArMYRa9kO++X8HFRHrOhMKIjWS4hsmZYoccqW9bv9fiJQQWYm8qSfW0WlHisiQRHN+Cq
         epTnWAWXa0XIb1ZVRep/P52AvPfwAczCzmPAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410281; x=1720015081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXSq9cIt+cDOKNPJ1wEig1h0MbpC9b/C/ll62WYu3WA=;
        b=GWZ40zcs3ns+/vKHS4yuVCs5nPmJRtQbtjIzs/6FtTNk4NPmvqgoIceB+f33M+fTpB
         X6bgGMPQiF/7DDmmzSJlztH/hvaYn3xegVJeZZq1/EScS2bh8T8F/5AqCZT0DCj59I5U
         rxssGs+vYYhq/cirfskf5lWA1H9dHgvpa6hIMIPdAZ4YKOlzXvVJQTKMIfGpgRUVZY+Z
         PTfEj1jtVo1fOKvb1d+jNIgG7NL1BgW2wRG7WWzMJ2G4jc4J9BiZ6Oa0tSQ1Z3jcEcbp
         jqS+44NFYpqhsz79ecMH3xU16yCabi0tJuaZkvJTftAU50gWFdYvhGQEthx0K7OrfAlv
         LGUQ==
X-Gm-Message-State: AOJu0Yy+uafvBOeMq5M+fIP1CPNs053Pvs12+iIFgxj6v4h0uf8xDR2T
	0/PT9djhK8oJpgxNUQ/N/3IdaOvITBhEGqPwd+v0rFRuhxKOVPQ3YYjJzdUw++r2EXObq7ZixYl
	Ef24=
X-Google-Smtp-Source: AGHT+IFZ+U741Xe22L3IWdU6A/JpCNgMUNRvCO/9WayrRbFltM4UDYHFtnKiLh3aCsSZgpCCJu66BA==
X-Received: by 2002:a05:6830:e8b:b0:6f9:7145:ed49 with SMTP id 46e09a7af769-700b117f908mr12160357a34.7.1719410280859;
        Wed, 26 Jun 2024 06:58:00 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@cloud.com>
Subject: [PATCH WIP 01/14] x86/cpuid-policy: Add AMD SVM CPUID leaf to featureset
Date: Wed, 26 Jun 2024 14:38:40 +0100
Message-Id: <20240626133853.4150731-2-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626133853.4150731-1-george.dunlap@cloud.com>
References: <20240626133853.4150731-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NOTE: This patch is be partially superseded by Andrew Cooper's "x86:
AMD CPUID handling improvements" series.

Currently, the CPUID leaf for SVM features (extd 0xa.edx) is manually
twiddled:

 - hvm_max_policy takes host_policy and clamps it to supported
   features (with some features unilaterally enabled because they're
   always emulated

 - hvm_default_policy is copied from there

 - When recalculate_policy() is called for a guest, if SVM is clear,
   then the entire leaf is zeroed out.

Move to a mode where the extended features are off by default, and
enabled when nested_virt is enabled.

In cpufeatureset.h, define a new featureset word for the AMD SVM
features, and declare all of the bits defined in
x86/include/asm/hvm/svm/svm.h.  Mark the ones we currently pass
through to the "max policy" as HAP-only and optional.

In cpu-policy.h, define FEATURESET_ead, and convert the un-named space
in struct_cpu_policy into the appropriate union.  FIXME: Do this in a
prerequisite patch, and change all references to p->extd.raw[0xa].

Update x86_cpu_X_to_Y and Y_to_X to copy this into and out of the
appropriate leaf.

Populate this during boot in generic_identify().

Add the new featureset definition into libxl_cpuid.c.

Update the code in calculate_hvm_max_policy() to do nothing with the
"normal" CPUID bits, and use the feature bit to unconditionally enable
VMCBCLEAN. FIXME Move this to a follow-up patch.

In recalculate_cpuid_policy(), enable max_fs when nested_hvm() is
true.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@cloud.com>
---
 tools/libs/light/libxl_cpuid.c              |  1 +
 tools/misc/xen-cpuid.c                      |  1 +
 xen/arch/x86/cpu-policy.c                   | 23 ++++++++++-----------
 xen/arch/x86/cpu/common.c                   |  2 ++
 xen/include/public/arch-x86/cpufeatureset.h | 16 ++++++++++++++
 xen/include/xen/lib/x86/cpu-policy.h        | 10 ++++++++-
 xen/lib/x86/cpuid.c                         |  4 +++-
 7 files changed, 43 insertions(+), 14 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 063fe86eb7..e8000615ab 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -342,6 +342,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
         CPUID_ENTRY(0x00000007,  1, CPUID_REG_EDX),
         MSR_ENTRY(0x10a, CPUID_REG_EAX),
         MSR_ENTRY(0x10a, CPUID_REG_EDX),
+        CPUID_ENTRY(0x8000000a, NA, CPUID_REG_EDX),
 #undef MSR_ENTRY
 #undef CPUID_ENTRY
     };
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 4c4593528d..460acec46c 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -37,6 +37,7 @@ static const struct {
     { "CPUID 0x00000007:1.edx",     "7d1" },
     { "MSR_ARCH_CAPS.lo",         "m10Al" },
     { "MSR_ARCH_CAPS.hi",         "m10Ah" },
+    { "CPUID 0x8000000a.edx",       "ead" },
 };
 
 #define COL_ALIGN "24"
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 304dc20cfa..d3ba177dac 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -751,22 +751,16 @@ static void __init calculate_hvm_max_policy(void)
     if ( !cpu_has_vmx )
         __clear_bit(X86_FEATURE_PKS, fs);
 
-    /* 
+    /*
      * Make adjustments to possible (nested) virtualization features exposed
      * to the guest
      */
     if ( p->extd.svm )
     {
-        /* Clamp to implemented features which require hardware support. */
-        p->extd.raw[0xa].d &= ((1u << SVM_FEATURE_NPT) |
-                               (1u << SVM_FEATURE_LBRV) |
-                               (1u << SVM_FEATURE_NRIPS) |
-                               (1u << SVM_FEATURE_PAUSEFILTER) |
-                               (1u << SVM_FEATURE_DECODEASSISTS));
         /* Enable features which are always emulated. */
-        p->extd.raw[0xa].d |= (1u << SVM_FEATURE_VMCBCLEAN);
+        __set_bit(X86_FEATURE_VMCBCLEAN, fs);
     }
-    
+
     guest_common_max_feature_adjustments(fs);
     guest_common_feature_adjustments(fs);
 
@@ -915,6 +909,14 @@ void recalculate_cpuid_policy(struct domain *d)
             __clear_bit(X86_FEATURE_VMX, max_fs);
             __clear_bit(X86_FEATURE_SVM, max_fs);
         }
+        else
+        {
+            /*
+             * Enable SVM features.  This will be empty on VMX
+             * hosts.
+             */
+            fs[FEATURESET_ead] = max_fs[FEATURESET_ead];
+        }
     }
 
     /*
@@ -981,9 +983,6 @@ void recalculate_cpuid_policy(struct domain *d)
          ((vpmu_mode & XENPMU_MODE_ALL) && !is_hardware_domain(d)) )
         p->basic.raw[0xa] = EMPTY_LEAF;
 
-    if ( !p->extd.svm )
-        p->extd.raw[0xa] = EMPTY_LEAF;
-
     if ( !p->extd.page1gb )
         p->extd.raw[0x19] = EMPTY_LEAF;
 }
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index ff4cd22897..da5ad10516 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -478,6 +478,8 @@ static void generic_identify(struct cpuinfo_x86 *c)
 		c->x86_capability[FEATURESET_e7d] = cpuid_edx(0x80000007);
 	if (c->extended_cpuid_level >= 0x80000008)
 		c->x86_capability[FEATURESET_e8b] = cpuid_ebx(0x80000008);
+	if (c->extended_cpuid_level >= 0x8000000a)
+		c->x86_capability[FEATURESET_ead] = cpuid_edx(0x8000000a);
 	if (c->extended_cpuid_level >= 0x80000021)
 		c->x86_capability[FEATURESET_e21a] = cpuid_eax(0x80000021);
 
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index d9eba5e9a7..88d5d0054b 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -365,6 +365,22 @@ XEN_CPUFEATURE(RFDS_CLEAR,         16*32+28) /*!A| Register File(s) cleared by V
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 */
 
+/* AMD-defined CPU features, CPUID level 0x8000000a.edx, word 18 */
+XEN_CPUFEATURE(NPT,                 18*32+ 0) /*h  Nested page table support */
+XEN_CPUFEATURE(LBRV,                18*32+ 1) /*h  LBR virtualization support */
+XEN_CPUFEATURE(SVML,                18*32+ 2) /*   SVM locking MSR support */
+XEN_CPUFEATURE(NRIPS,               18*32+ 3) /*h  Next RIP save on VMEXIT support */
+XEN_CPUFEATURE(TSCRATEMSR,          18*32+ 4) /*   TSC ratio MSR support */
+XEN_CPUFEATURE(VMCBCLEAN,           18*32+ 5) /*h  VMCB clean bits support */
+XEN_CPUFEATURE(FLUSHBYASID,         18*32+ 6) /*   TLB flush by ASID support */
+XEN_CPUFEATURE(DECODEASSISTS,       18*32+ 7) /*h  Decode assists support */
+XEN_CPUFEATURE(PAUSEFILTER,         18*32+10) /*h  Pause intercept filter support */
+XEN_CPUFEATURE(PAUSETHRESH,         18*32+12) /*   Pause intercept filter threshold */
+XEN_CPUFEATURE(VLOADSAVE,           18*32+15) /*   virtual vmload/vmsave */
+XEN_CPUFEATURE(VGIF,                18*32+16) /*   Virtual GIF */
+XEN_CPUFEATURE(SSS,                 18*32+19) /*   NPT Supervisor Shadow Stacks */
+XEN_CPUFEATURE(SPEC_CTRL,           18*32+20) /*   MSR_SPEC_CTRL virtualisation */
+
 #endif /* XEN_CPUFEATURE */
 
 /* Clean up from a default include.  Close the enum (for C). */
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index d26012c6da..445325a5b5 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -22,6 +22,7 @@
 #define FEATURESET_7d1       15 /* 0x00000007:1.edx    */
 #define FEATURESET_m10Al     16 /* 0x0000010a.eax      */
 #define FEATURESET_m10Ah     17 /* 0x0000010a.edx      */
+#define FEATURESET_ead       18 /* 0x8000000a.edx      */
 
 struct cpuid_leaf
 {
@@ -296,7 +297,14 @@ struct cpu_policy
             uint32_t /* d */:32;
 
             uint64_t :64, :64; /* Leaf 0x80000009. */
-            uint64_t :64, :64; /* Leaf 0x8000000a - SVM rev and features. */
+
+            /* Leaf 0x8000000a - SVM rev and features. */
+            uint64_t /* a, b */:64, /* c */:32;
+            union {
+                uint32_t ead;
+                struct { DECL_BITFIELD(ead); };
+            };
+
             uint64_t :64, :64; /* Leaf 0x8000000b. */
             uint64_t :64, :64; /* Leaf 0x8000000c. */
             uint64_t :64, :64; /* Leaf 0x8000000d. */
diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
index eb7698dc73..d68f442d4e 100644
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -81,7 +81,8 @@ void x86_cpu_policy_to_featureset(
     fs[FEATURESET_7d1]       = p->feat._7d1;
     fs[FEATURESET_m10Al]     = p->arch_caps.lo;
     fs[FEATURESET_m10Ah]     = p->arch_caps.hi;
-}
+    fs[FEATURESET_ead]       = p->extd.ead;
+ }
 
 void x86_cpu_featureset_to_policy(
     const uint32_t fs[FEATURESET_NR_ENTRIES], struct cpu_policy *p)
@@ -104,6 +105,7 @@ void x86_cpu_featureset_to_policy(
     p->feat._7d1             = fs[FEATURESET_7d1];
     p->arch_caps.lo          = fs[FEATURESET_m10Al];
     p->arch_caps.hi          = fs[FEATURESET_m10Ah];
+    p->extd.ead              = fs[FEATURESET_ead];
 }
 
 void x86_cpu_policy_recalc_synth(struct cpu_policy *p)
-- 
2.25.1


