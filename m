Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A23B6D5C60
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517714.803499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdLM-0006IR-IK; Tue, 04 Apr 2023 09:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517714.803499; Tue, 04 Apr 2023 09:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdLM-0006Ds-BO; Tue, 04 Apr 2023 09:52:48 +0000
Received: by outflank-mailman (input) for mailman id 517714;
 Tue, 04 Apr 2023 09:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjdLK-0005bo-MN
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:52:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71dfcd27-d2ce-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 11:52:44 +0200 (CEST)
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
X-Inumbo-ID: 71dfcd27-d2ce-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680601964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lvleilS5BRDLhyzG1k+YQ1TdfDraad9QCp1ZsHyb0Xk=;
  b=WunbCIuEUdHCEfvZ4bFM7QNzud+F87X+JbejyrRmxpS2SqPUiPLvnKcW
   th6/wWn72x1OdW5pTTLauqQZI+Eus8pu50njyMdyQH6CqpcZmdHFiYsXx
   +GliXG8kQQgPqMUQCK0PpWy0zbmos0WPl4+rm7nkcGE7G7v3XLVU5mAIc
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106670669
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:j7CdmqBPer0whRVW/1bjw5YqxClBgxIJ4kV8jS/XYbTApDMl12FWy
 jYWUWmEbPyKZjOkc9txbt/l9E4EsJOAy9M2QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4G9A4gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw171LJ0Fj6
 vUhM3NXZBSgjsm376Kbc7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4TUG5oNwBjJz
 o7A1z6lEz8mC9Xc8wbftULrhajxpAWjdqtHQdVU8dY12QbOlwT/EiY+Sl+TsfS/zEmkVLp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmPwKfJ5weSBkAfUyVMLtchsacLqScCj
 wHT2YmzXHo27ePTECjGnluJkd+sEQVOEUkiSDANdBBGudPng4gYjz3fbu82RcZZkebJ9SHML
 yGi9XZu3+hM05RUjs1X7nic3Wvy+8Ghohodo1yOAzn7tl4RiJuNPdTA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43Nzgbb1HRcNJG8yFoSLLQGypyGgWyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/8vPt7vWp5xl/awfTgAahwzRoMWCqWdiSfdpH0+DaJu9zuFfLcQfVEXZ
 s7ALJfE4YcyAqV71jumL9ogPUsQ7nlmnwv7HMmrpylLJJLCPBZ5v59ZagrRBg34hYvYyDjoH
 yF3bJTVl08GDLKnMkE6M+c7dDg3EJTyPriuw+Q/SwJJClMO9L0JYxMJ/Y4cRg==
IronPort-HdrOrdr: A9a23:3Hy5EK55FGsbrdfn5wPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="106670669"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 04/15] x86: Merge struct msr_policy into struct cpu_policy
Date: Tue, 4 Apr 2023 10:52:11 +0100
Message-ID: <20230404095222.1373721-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

As with the cpuid side, use a temporary define to make struct msr_policy still
work.

Note, this means that domains now have two separate struct cpu_policy
allocations with disjoint information, and system policies are in a similar
position, as well as xc_cpu_policy objects in libxenguest.  All of these
duplications will be addressed in the following patches.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Alter msr_policy -> cpu_policy in comments.
---
 tools/fuzz/cpu-policy/afl-policy-fuzzer.c |   1 -
 xen/arch/x86/include/asm/msr.h            |   3 +-
 xen/include/xen/lib/x86/cpu-policy.h      |  81 ++++++++++++++++-
 xen/include/xen/lib/x86/msr.h             | 104 ----------------------
 xen/lib/x86/msr.c                         |   2 +-
 5 files changed, 83 insertions(+), 108 deletions(-)
 delete mode 100644 xen/include/xen/lib/x86/msr.h

diff --git a/tools/fuzz/cpu-policy/afl-policy-fuzzer.c b/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
index 79e42e8bfd04..0ce3d8e16626 100644
--- a/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
+++ b/tools/fuzz/cpu-policy/afl-policy-fuzzer.c
@@ -10,7 +10,6 @@
 
 #include <xen-tools/common-macros.h>
 #include <xen/lib/x86/cpu-policy.h>
-#include <xen/lib/x86/msr.h>
 #include <xen/domctl.h>
 
 static bool debug;
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 7946b6b24c11..02eddd919c27 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -6,8 +6,9 @@
 #include <xen/types.h>
 #include <xen/percpu.h>
 #include <xen/errno.h>
+#include <xen/kernel.h>
 
-#include <xen/lib/x86/msr.h>
+#include <xen/lib/x86/cpu-policy.h>
 
 #include <asm/asm_defns.h>
 #include <asm/cpufeature.h>
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 666505964d00..53fffca55211 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -3,7 +3,6 @@
 #define XEN_LIB_X86_POLICIES_H
 
 #include <xen/lib/x86/cpuid-autogen.h>
-#include <xen/lib/x86/msr.h>
 
 #define FEATURESET_1d     0 /* 0x00000001.edx      */
 #define FEATURESET_1c     1 /* 0x00000001.ecx      */
@@ -107,6 +106,9 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor);
      CPUID_GUEST_NR_XSTATE - !!CPUID_GUEST_NR_XSTATE +  \
      CPUID_GUEST_NR_EXTD + 2 /* hv_limit and hv2_limit */ )
 
+/* Maximum number of MSRs written when serialising a cpu_policy. */
+#define MSR_MAX_SERIALISED_ENTRIES 2
+
 struct cpu_policy
 {
 #define DECL_BITFIELD(word) _DECL_BITFIELD(FEATURESET_ ## word)
@@ -324,6 +326,44 @@ struct cpu_policy
         };
     } extd;
 
+    /*
+     * 0x000000ce - MSR_INTEL_PLATFORM_INFO
+     *
+     * This MSR is non-architectural, but for simplicy we allow it to be read
+     * unconditionally.  CPUID Faulting support can be fully emulated for HVM
+     * guests so can be offered unconditionally, while support for PV guests
+     * is dependent on real hardware support.
+     */
+    union {
+        uint32_t raw;
+        struct {
+            uint32_t :31;
+            bool cpuid_faulting:1;
+        };
+    } platform_info;
+
+    /*
+     * 0x0000010a - MSR_ARCH_CAPABILITIES
+     *
+     * This is an Intel-only MSR, which provides miscellaneous enumeration,
+     * including those which indicate that microarchitectrual sidechannels are
+     * fixed in hardware.
+     */
+    union {
+        uint32_t raw;
+        struct {
+            bool rdcl_no:1;
+            bool ibrs_all:1;
+            bool rsba:1;
+            bool skip_l1dfl:1;
+            bool ssb_no:1;
+            bool mds_no:1;
+            bool if_pschange_mc_no:1;
+            bool tsx_ctrl:1;
+            bool taa_no:1;
+        };
+    } arch_caps;
+
 #undef __DECL_BITFIELD
 #undef _DECL_BITFIELD
 #undef DECL_BITFIELD
@@ -337,6 +377,7 @@ struct cpu_policy
 
 /* Temporary */
 #define cpuid_policy cpu_policy
+#define msr_policy cpu_policy
 
 struct old_cpu_policy
 {
@@ -438,9 +479,11 @@ void x86_cpuid_policy_clear_out_of_range_leaves(struct cpuid_policy *p);
 #ifdef __XEN__
 #include <public/arch-x86/xen.h>
 typedef XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_leaf_buffer_t;
+typedef XEN_GUEST_HANDLE_64(xen_msr_entry_t) msr_entry_buffer_t;
 #else
 #include <xen/arch-x86/xen.h>
 typedef xen_cpuid_leaf_t cpuid_leaf_buffer_t[];
+typedef xen_msr_entry_t msr_entry_buffer_t[];
 #endif
 
 /**
@@ -480,6 +523,42 @@ int x86_cpuid_copy_from_buffer(struct cpuid_policy *policy,
                                uint32_t nr_entries, uint32_t *err_leaf,
                                uint32_t *err_subleaf);
 
+/**
+ * Serialise an msr_policy object into an array.
+ *
+ * @param policy     The msr_policy to serialise.
+ * @param msrs       The array of msrs to serialise into.
+ * @param nr_entries The number of entries in 'msrs'.
+ * @returns -errno
+ *
+ * Writes at most MSR_MAX_SERIALISED_ENTRIES.  May fail with -ENOBUFS if the
+ * buffer array is too short.  On success, nr_entries is updated with the
+ * actual number of msrs written.
+ */
+int x86_msr_copy_to_buffer(const struct msr_policy *policy,
+                           msr_entry_buffer_t msrs, uint32_t *nr_entries);
+
+/**
+ * Unserialise an msr_policy object from an array of msrs.
+ *
+ * @param policy     The msr_policy object to unserialise into.
+ * @param msrs       The array of msrs to unserialise from.
+ * @param nr_entries The number of entries in 'msrs'.
+ * @param err_msr    Optional hint for error diagnostics.
+ * @returns -errno
+ *
+ * Reads at most MSR_MAX_SERIALISED_ENTRIES.  May fail for a number of reasons
+ * based on the content in an individual 'msrs' entry, including the MSR index
+ * not being valid in the policy, the flags field being nonzero, or if the
+ * value provided would truncate when stored in the policy.  In such cases,
+ * the optional err_* pointer will identify the problematic MSR.
+ *
+ * No content validation is performed on the data stored in the policy object.
+ */
+int x86_msr_copy_from_buffer(struct msr_policy *policy,
+                             const msr_entry_buffer_t msrs, uint32_t nr_entries,
+                             uint32_t *err_msr);
+
 /*
  * Calculate whether two policies are compatible.
  *
diff --git a/xen/include/xen/lib/x86/msr.h b/xen/include/xen/lib/x86/msr.h
deleted file mode 100644
index 48ba4a59c036..000000000000
--- a/xen/include/xen/lib/x86/msr.h
+++ /dev/null
@@ -1,104 +0,0 @@
-/* Common data structures and functions consumed by hypervisor and toolstack */
-#ifndef XEN_LIB_X86_MSR_H
-#define XEN_LIB_X86_MSR_H
-
-/* Maximum number of MSRs written when serialising msr_policy. */
-#define MSR_MAX_SERIALISED_ENTRIES 2
-
-/* MSR policy object for shared per-domain MSRs */
-struct msr_policy
-{
-    /*
-     * 0x000000ce - MSR_INTEL_PLATFORM_INFO
-     *
-     * This MSR is non-architectural, but for simplicy we allow it to be read
-     * unconditionally.  CPUID Faulting support can be fully emulated for HVM
-     * guests so can be offered unconditionally, while support for PV guests
-     * is dependent on real hardware support.
-     */
-    union {
-        uint32_t raw;
-        struct {
-            uint32_t :31;
-            bool cpuid_faulting:1;
-        };
-    } platform_info;
-
-    /*
-     * 0x0000010a - MSR_ARCH_CAPABILITIES
-     *
-     * This is an Intel-only MSR, which provides miscellaneous enumeration,
-     * including those which indicate that microarchitectrual sidechannels are
-     * fixed in hardware.
-     */
-    union {
-        uint32_t raw;
-        struct {
-            bool rdcl_no:1;
-            bool ibrs_all:1;
-            bool rsba:1;
-            bool skip_l1dfl:1;
-            bool ssb_no:1;
-            bool mds_no:1;
-            bool if_pschange_mc_no:1;
-            bool tsx_ctrl:1;
-            bool taa_no:1;
-        };
-    } arch_caps;
-};
-
-#ifdef __XEN__
-#include <public/arch-x86/xen.h>
-typedef XEN_GUEST_HANDLE_64(xen_msr_entry_t) msr_entry_buffer_t;
-#else
-#include <xen/arch-x86/xen.h>
-typedef xen_msr_entry_t msr_entry_buffer_t[];
-#endif
-
-/**
- * Serialise an msr_policy object into an array.
- *
- * @param policy     The msr_policy to serialise.
- * @param msrs       The array of msrs to serialise into.
- * @param nr_entries The number of entries in 'msrs'.
- * @returns -errno
- *
- * Writes at most MSR_MAX_SERIALISED_ENTRIES.  May fail with -ENOBUFS if the
- * buffer array is too short.  On success, nr_entries is updated with the
- * actual number of msrs written.
- */
-int x86_msr_copy_to_buffer(const struct msr_policy *policy,
-                           msr_entry_buffer_t msrs, uint32_t *nr_entries);
-
-/**
- * Unserialise an msr_policy object from an array of msrs.
- *
- * @param policy     The msr_policy object to unserialise into.
- * @param msrs       The array of msrs to unserialise from.
- * @param nr_entries The number of entries in 'msrs'.
- * @param err_msr    Optional hint for error diagnostics.
- * @returns -errno
- *
- * Reads at most MSR_MAX_SERIALISED_ENTRIES.  May fail for a number of reasons
- * based on the content in an individual 'msrs' entry, including the MSR index
- * not being valid in the policy, the flags field being nonzero, or if the
- * value provided would truncate when stored in the policy.  In such cases,
- * the optional err_* pointer will identify the problematic MSR.
- *
- * No content validation is performed on the data stored in the policy object.
- */
-int x86_msr_copy_from_buffer(struct msr_policy *policy,
-                             const msr_entry_buffer_t msrs, uint32_t nr_entries,
-                             uint32_t *err_msr);
-
-#endif /* !XEN_LIB_X86_MSR_H */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/lib/x86/msr.c b/xen/lib/x86/msr.c
index 7d71e92a380a..c4d885e7b568 100644
--- a/xen/lib/x86/msr.c
+++ b/xen/lib/x86/msr.c
@@ -1,6 +1,6 @@
 #include "private.h"
 
-#include <xen/lib/x86/msr.h>
+#include <xen/lib/x86/cpu-policy.h>
 
 /*
  * Copy a single MSR into the provided msr_entry_buffer_t buffer, performing a
-- 
2.30.2


