Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C4C6D5C82
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:59:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517749.803572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdRY-0003UL-3c; Tue, 04 Apr 2023 09:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517749.803572; Tue, 04 Apr 2023 09:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdRX-0003Rj-WD; Tue, 04 Apr 2023 09:59:12 +0000
Received: by outflank-mailman (input) for mailman id 517749;
 Tue, 04 Apr 2023 09:59:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjdMC-0005bo-Gy
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:53:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 926ea3a0-d2ce-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 11:53:39 +0200 (CEST)
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
X-Inumbo-ID: 926ea3a0-d2ce-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680602019;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GbFah8Uej44Bj9X6DdnsRE7vn00ll+/fTK8duGH2gAE=;
  b=RJH/ZgNLZ3lSIqMB3bEan5pDxw5I7g09rzjIzs17XzMBe07KFGPmXftg
   Jwz9ThgHQxbFFZOtKRxnbTOYYZJq4mC70NJur+z1TNFaqmKFPe8OyC42V
   AFY1cI5DZkwSCJOjIJksb0amE++Clo9uFJ4FEVPXWIQXM2zX9TRrsid87
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104161466
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:uoLQVq9Ye3x1JcrNB3lyDrUD/36TJUtcMsCJ2f8bNWPcYEJGY0x3z
 moaD2rSOqqLYGL0edlxbNu+pBlVvpDUyNJiHFRs+X88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmOagX5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklu9
 uIXeQoIYCmZntio+6C4W8hJq8gaeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxhrB+
 DuaoTqR7hcyN8yVxj28z1KVgKzsrBnVAYxJNKGWz6s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 mJlhPuwW2Yp6ufMDyvAqPHN92ja1TUpwXEqRSwaQlo/5tfaupgJkCndTcdCNYO5t4igcd3v+
 AxmvBTSlp1K055Tivrlpw+e696/jsOXF1Bov207Skrgt1okP9D9OuRE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFBz3oRZPhagKvFlDyL5Ba67ogwPBb
 k7Joh9275ROJnasZqIfS9vvW5x3kfaxT4+/CKC8gj9yjn9ZLVfvwc2TTRTIgzCFfLYEysnTx
 qt3ge7zVC1HWMyLPRK9RvsH0K9D+x3SMVj7HMihpzz+iOr2WZJgYetdWLd4RrxjvfzsTcS82
 4o3CvZmPD0ED7KiOHCLrtdDRb3IRFBiba3LRwVsXrbrCmJb9KsJUpc9HZtJl1RZoplo
IronPort-HdrOrdr: A9a23:59oaB6CIYAkWZ2LlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="104161466"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 10/15] x86/boot: Move MSR policy initialisation logic into cpu-policy.c
Date: Tue, 4 Apr 2023 10:52:17 +0100
Message-ID: <20230404095222.1373721-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Switch to the newer cpu_policy nomenclature.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * New
---
 xen/arch/x86/cpu-policy.c             | 84 +++++++++++++++++++++++++++
 xen/arch/x86/include/asm/cpu-policy.h |  3 +
 xen/arch/x86/include/asm/msr.h        |  1 -
 xen/arch/x86/msr.c                    | 84 ---------------------------
 xen/arch/x86/setup.c                  |  3 +-
 5 files changed, 89 insertions(+), 86 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index e9ac1269c35a..f6a2317ed7bd 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -20,6 +20,90 @@ struct cpu_policy __ro_after_init hvm_max_cpu_policy;
 struct cpu_policy __ro_after_init hvm_def_cpu_policy;
 #endif
 
+static void __init calculate_raw_policy(void)
+{
+    struct cpu_policy *p = &raw_cpu_policy;
+
+    /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
+    /* Was already added by probe_cpuid_faulting() */
+
+    if ( cpu_has_arch_caps )
+        rdmsrl(MSR_ARCH_CAPABILITIES, p->arch_caps.raw);
+}
+
+static void __init calculate_host_policy(void)
+{
+    struct cpu_policy *p = &host_cpu_policy;
+
+    *p = raw_cpu_policy;
+
+    /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
+    /* probe_cpuid_faulting() sanity checks presence of MISC_FEATURES_ENABLES */
+    p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
+
+    /* Temporary, until we have known_features[] for feature bits in MSRs. */
+    p->arch_caps.raw &=
+        (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
+         ARCH_CAPS_SKIP_L1DFL | ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO |
+         ARCH_CAPS_IF_PSCHANGE_MC_NO | ARCH_CAPS_TSX_CTRL | ARCH_CAPS_TAA_NO |
+         ARCH_CAPS_SBDR_SSDP_NO | ARCH_CAPS_FBSDP_NO | ARCH_CAPS_PSDP_NO |
+         ARCH_CAPS_FB_CLEAR | ARCH_CAPS_RRSBA | ARCH_CAPS_BHI_NO |
+         ARCH_CAPS_PBRSB_NO);
+}
+
+static void __init calculate_pv_max_policy(void)
+{
+    struct cpu_policy *p = &pv_max_cpu_policy;
+
+    *p = host_cpu_policy;
+
+    p->arch_caps.raw = 0; /* Not supported yet. */
+}
+
+static void __init calculate_pv_def_policy(void)
+{
+    struct cpu_policy *p = &pv_def_cpu_policy;
+
+    *p = pv_max_cpu_policy;
+}
+
+static void __init calculate_hvm_max_policy(void)
+{
+    struct cpu_policy *p = &hvm_max_cpu_policy;
+
+    *p = host_cpu_policy;
+
+    /* It's always possible to emulate CPUID faulting for HVM guests */
+    p->platform_info.cpuid_faulting = true;
+
+    p->arch_caps.raw = 0; /* Not supported yet. */
+}
+
+static void __init calculate_hvm_def_policy(void)
+{
+    struct cpu_policy *p = &hvm_def_cpu_policy;
+
+    *p = hvm_max_cpu_policy;
+}
+
+void __init init_guest_cpu_policies(void)
+{
+    calculate_raw_policy();
+    calculate_host_policy();
+
+    if ( IS_ENABLED(CONFIG_PV) )
+    {
+        calculate_pv_max_policy();
+        calculate_pv_def_policy();
+    }
+
+    if ( hvm_enabled )
+    {
+        calculate_hvm_max_policy();
+        calculate_hvm_def_policy();
+    }
+}
+
 int init_domain_cpu_policy(struct domain *d)
 {
     struct cpu_policy *p = is_pv_domain(d)
diff --git a/xen/arch/x86/include/asm/cpu-policy.h b/xen/arch/x86/include/asm/cpu-policy.h
index 9ba34bbf5ea1..13e2a1f86d13 100644
--- a/xen/arch/x86/include/asm/cpu-policy.h
+++ b/xen/arch/x86/include/asm/cpu-policy.h
@@ -12,6 +12,9 @@ extern struct cpu_policy  pv_def_cpu_policy;
 extern struct cpu_policy hvm_max_cpu_policy;
 extern struct cpu_policy hvm_def_cpu_policy;
 
+/* Initialise the guest cpu_policy objects. */
+void init_guest_cpu_policies(void);
+
 /* Allocate and initialise a CPU policy suitable for the domain. */
 int init_domain_cpu_policy(struct domain *d);
 
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index b59a51d238a7..458841733e18 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -418,7 +418,6 @@ struct vcpu_msrs
     uint32_t dr_mask[4];
 };
 
-void init_guest_msr_policy(void);
 int init_vcpu_msr_policy(struct vcpu *v);
 
 /*
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 93bd93feb644..802fc60baf81 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -38,90 +38,6 @@
 
 DEFINE_PER_CPU(uint32_t, tsc_aux);
 
-static void __init calculate_raw_policy(void)
-{
-    struct msr_policy *mp = &raw_cpu_policy;
-
-    /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
-    /* Was already added by probe_cpuid_faulting() */
-
-    if ( cpu_has_arch_caps )
-        rdmsrl(MSR_ARCH_CAPABILITIES, mp->arch_caps.raw);
-}
-
-static void __init calculate_host_policy(void)
-{
-    struct msr_policy *mp = &host_cpu_policy;
-
-    *mp = raw_cpu_policy;
-
-    /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
-    /* probe_cpuid_faulting() sanity checks presence of MISC_FEATURES_ENABLES */
-    mp->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
-
-    /* Temporary, until we have known_features[] for feature bits in MSRs. */
-    mp->arch_caps.raw &=
-        (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
-         ARCH_CAPS_SKIP_L1DFL | ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO |
-         ARCH_CAPS_IF_PSCHANGE_MC_NO | ARCH_CAPS_TSX_CTRL | ARCH_CAPS_TAA_NO |
-         ARCH_CAPS_SBDR_SSDP_NO | ARCH_CAPS_FBSDP_NO | ARCH_CAPS_PSDP_NO |
-         ARCH_CAPS_FB_CLEAR | ARCH_CAPS_RRSBA | ARCH_CAPS_BHI_NO |
-         ARCH_CAPS_PBRSB_NO);
-}
-
-static void __init calculate_pv_max_policy(void)
-{
-    struct msr_policy *mp = &pv_max_cpu_policy;
-
-    *mp = host_cpu_policy;
-
-    mp->arch_caps.raw = 0; /* Not supported yet. */
-}
-
-static void __init calculate_pv_def_policy(void)
-{
-    struct msr_policy *mp = &pv_def_cpu_policy;
-
-    *mp = pv_max_cpu_policy;
-}
-
-static void __init calculate_hvm_max_policy(void)
-{
-    struct msr_policy *mp = &hvm_max_cpu_policy;
-
-    *mp = host_cpu_policy;
-
-    /* It's always possible to emulate CPUID faulting for HVM guests */
-    mp->platform_info.cpuid_faulting = true;
-
-    mp->arch_caps.raw = 0; /* Not supported yet. */
-}
-
-static void __init calculate_hvm_def_policy(void)
-{
-    struct msr_policy *mp = &hvm_def_cpu_policy;
-
-    *mp = hvm_max_cpu_policy;
-}
-
-void __init init_guest_msr_policy(void)
-{
-    calculate_raw_policy();
-    calculate_host_policy();
-
-    if ( IS_ENABLED(CONFIG_PV) )
-    {
-        calculate_pv_max_policy();
-        calculate_pv_def_policy();
-    }
-
-    if ( hvm_enabled )
-    {
-        calculate_hvm_max_policy();
-        calculate_hvm_def_policy();
-    }
-}
-
 int init_vcpu_msr_policy(struct vcpu *v)
 {
     struct vcpu_msrs *msrs = xzalloc(struct vcpu_msrs);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b29229933d8c..51a19b9019eb 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -50,6 +50,7 @@
 #include <asm/nmi.h>
 #include <asm/alternative.h>
 #include <asm/mc146818rtc.h>
+#include <asm/cpu-policy.h>
 #include <asm/cpuid.h>
 #include <asm/spec_ctrl.h>
 #include <asm/guest.h>
@@ -1991,7 +1992,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         panic("Could not protect TXT memory regions\n");
 
     init_guest_cpuid();
-    init_guest_msr_policy();
+    init_guest_cpu_policies();
 
     if ( xen_cpuidle )
         xen_processor_pmbits |= XEN_PROCESSOR_PM_CX;
-- 
2.30.2


