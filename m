Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268098A84B1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 15:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707522.1105527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx5Nx-0006zd-Vp; Wed, 17 Apr 2024 13:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707522.1105527; Wed, 17 Apr 2024 13:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx5Nx-0006xV-Rs; Wed, 17 Apr 2024 13:31:37 +0000
Received: by outflank-mailman (input) for mailman id 707522;
 Wed, 17 Apr 2024 13:31:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RDzn=LW=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rx5Nw-0006f3-I5
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 13:31:36 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf6e704f-fcbe-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 15:31:35 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-78f042e6b13so26290985a.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 06:31:35 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 ou5-20020a05620a620500b0078d5b3b5b4asm8423537qkn.125.2024.04.17.06.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 06:31:33 -0700 (PDT)
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
X-Inumbo-ID: cf6e704f-fcbe-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713360694; x=1713965494; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iQl9OECV+6vYbyMwu5eq+WC6LM71BPCU5F8o6RjC3Yo=;
        b=Mou3Ov0H+eWgPswbS4b39JFpeAPNKDaiBxlWWpr7xz508j4xupro0nANDyZi0G1XIG
         YdQGOBHErqXSlY8zFEzKR/IGp+0qXfkoMuBFDO/knWLolkU5cPXfJEciAQD4aJjaGjpZ
         zWuOxqoEat1Uch2cyOLQYIcUGq2Nb5HoCLqSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713360694; x=1713965494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQl9OECV+6vYbyMwu5eq+WC6LM71BPCU5F8o6RjC3Yo=;
        b=NA0fGun46E6+ysZDSyGdBP01e7+HRTWymB0E+UKQLXz8T7BE/tbpysFad5VjCY8ToA
         1a9E6HUiWmW1CKkySce/kQAxFLcKp5AL0xfWIvIQCWXVguhX2gmjD1PZr0h+RSJiSRB/
         SWmkXuOJUgmUxiSfioq3ALKwwY0gowesMGLED5fI6T4l81yZF1TxEkXmY483oO+K7O6T
         XTb1dn7kK1qtsBImnwTwQuq52+WeC0qJzcn/Y6foU32sEIZSXddAFukOb0/OpCCT0fEt
         bgw1yKqxAJJid7aeRTOGDAsB9cLAFPYblPDsN98wsJMrA3TbeImTjAGCAOkWiamVgBfU
         ST6A==
X-Gm-Message-State: AOJu0Ywopz6OuJYEH6PcshjFRRD98sQchap+L/2YbjC6s0B39xzkEfzs
	4AEPUQNvYJZ6zrVZyYY6Osbu1Ehp4FZpzGN4teF9KDJeAXb1bWiEU8boFH7PXi+SASXpsDEfZKe
	gUJU=
X-Google-Smtp-Source: AGHT+IEJyI1sraoM+s1p6wtpKHxX0lGKSqPZK/vrs8RwHoQsR7vQo3/j/5+JxDUd4NTWbE8DSJgzKQ==
X-Received: by 2002:a05:620a:45a7:b0:78d:5dfd:2241 with SMTP id bp39-20020a05620a45a700b0078d5dfd2241mr23107474qkb.58.1713360694154;
        Wed, 17 Apr 2024 06:31:34 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@cloud.com>
Subject: [PATCH] x86/cpuid-policy: Add AMD SVM CPUID leaf to featureset
Date: Wed, 17 Apr 2024 14:22:37 +0100
Message-Id: <20240417132237.2946862-1-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 xen/arch/x86/cpu-policy.c                   | 19 +++++++++----------
 xen/arch/x86/cpu/common.c                   |  2 ++
 xen/include/public/arch-x86/cpufeatureset.h | 16 ++++++++++++++++
 xen/include/xen/lib/x86/cpu-policy.h        | 10 +++++++++-
 xen/lib/x86/cpuid.c                         |  4 +++-
 6 files changed, 40 insertions(+), 12 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index ce4f3c7095..2c5749c3a0 100644
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
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 4b6d962763..4a5d1b916b 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -754,14 +754,8 @@ static void __init calculate_hvm_max_policy(void)
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
     
     guest_common_max_feature_adjustments(fs);
@@ -909,6 +903,14 @@ void recalculate_cpuid_policy(struct domain *d)
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
@@ -975,9 +977,6 @@ void recalculate_cpuid_policy(struct domain *d)
          ((vpmu_mode & XENPMU_MODE_ALL) && !is_hardware_domain(d)) )
         p->basic.raw[0xa] = EMPTY_LEAF;
 
-    if ( !p->extd.svm )
-        p->extd.raw[0xa] = EMPTY_LEAF;
-
     if ( !p->extd.page1gb )
         p->extd.raw[0x19] = EMPTY_LEAF;
 }
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 28d7f34c4d..5093379a43 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -477,6 +477,8 @@ static void generic_identify(struct cpuinfo_x86 *c)
 		c->x86_capability[FEATURESET_e7d] = cpuid_edx(0x80000007);
 	if (c->extended_cpuid_level >= 0x80000008)
 		c->x86_capability[FEATURESET_e8b] = cpuid_ebx(0x80000008);
+	if (c->extended_cpuid_level >= 0x8000000a)
+		c->x86_capability[FEATURESET_ead] = cpuid_edx(0x8000000a);
 	if (c->extended_cpuid_level >= 0x80000021)
 		c->x86_capability[FEATURESET_e21a] = cpuid_eax(0x80000021);
 
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 53f13dec31..c5c712cca3 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -357,6 +357,22 @@ XEN_CPUFEATURE(RFDS_CLEAR,         16*32+28) /*!A Register File(s) cleared by VE
 
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
index d5e447e9dc..4e5c05c56d 100644
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


