Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705AF6CF4CE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 22:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516353.800373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phcly-0007Iy-RL; Wed, 29 Mar 2023 20:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516353.800373; Wed, 29 Mar 2023 20:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phcly-0007FG-O1; Wed, 29 Mar 2023 20:51:58 +0000
Received: by outflank-mailman (input) for mailman id 516353;
 Wed, 29 Mar 2023 20:51:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PU7e=7V=citrix.com=prvs=445237bd4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phclw-0005Jv-S4
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 20:51:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 898a2b0c-ce73-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 22:51:54 +0200 (CEST)
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
X-Inumbo-ID: 898a2b0c-ce73-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680123114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AC62e4fNE4D+/bp1TOidQW3qjNM3sXqT95rabMm92XE=;
  b=ONBBCpS2wVdyQ/b5rbg/38drHeUVHpnlCARRbaqfWCFjKzNWT67RNc0x
   Q5WaYA9KaS3K7IV+9UwUipK7u2Iq1+kKcKbsCoVk2xWJRsyIVmotirrtB
   k0mfLDYK9JHUG3Lw6pmmBmLlQsSATCWlpU63QJhs0zyPyR8BHfOSjUcB3
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 102947421
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:SN0TmahwIWiENMxYkeHr0WpEX161GhAKZh0ujC45NGQN5FlHY01je
 htvWmCGa/+CMWOmfth2PoSypxxSsJeHmNNiHlY5qCszQnwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5wWPzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQDOW88cjvfldm13eucb/NyvuMHCubSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 jiXozulWEhy2Nq34HmPzXOsu+P0k2DFda0VPYeb5KBGjwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XrY3N9wXI+iTEsVhpa0sXI/JMIjQ+WafN5DpaSqvvaIGSlq
 9yVlxTSl4n/nOZSifrqrACX3278znTaZlVrv1uKBwpJ+is8Pdf4PNLwtDA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGFb5J+i8GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510nfC5TIi7Ca6EMIQmjn1NmOmvpnkGiam4gQjQfLUEy/lja
 f93j+73ZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjG8vhT6pLHPCT9Ye5cYDOzghURsPvsTPP9r
 4wOaKNnCnx3DIXDX8Ug2dVNfQ1VcSBiXcmeRg4+XrfrHzeK0VoJU5f5qY7NsaQ+90iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:bJj9n6ts80p+C33ddaAK4DIH7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-IronPort-AV: E=Sophos;i="5.98,301,1673931600"; 
   d="scan'208";a="102947421"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 6/9] x86: Merge a domain's {cpuid,msr} policy objects
Date: Wed, 29 Mar 2023 21:51:34 +0100
Message-ID: <20230329205137.323253-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230329205137.323253-1-andrew.cooper3@citrix.com>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Right now, they're the same underlying type, containing disjoint information.

Drop the d->arch.msr pointer, and union d->arch.cpuid to give it a second name
of cpu_policy in the interim.

Merge init_domain_{cpuid,msr}_policy() into a single init_domain_cpu_policy(),
moving the implementation into cpu-policy.c

No practical change, but this does half the memory allocated for a policy
information per domain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu-policy.c             | 49 +++++++++++++++++++++++++
 xen/arch/x86/cpuid.c                  | 23 ------------
 xen/arch/x86/domain.c                 | 16 +++------
 xen/arch/x86/domctl.c                 | 35 +++++++++---------
 xen/arch/x86/include/asm/cpu-policy.h |  4 +++
 xen/arch/x86/include/asm/cpuid.h      |  3 --
 xen/arch/x86/include/asm/domain.h     |  7 ++--
 xen/arch/x86/include/asm/msr.h        |  1 -
 xen/arch/x86/mm/mem_sharing.c         |  3 +-
 xen/arch/x86/msr.c                    | 52 ++-------------------------
 10 files changed, 83 insertions(+), 110 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 663e9a084c53..e9ac1269c35a 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -1,10 +1,13 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 #include <xen/cache.h>
 #include <xen/kernel.h>
+#include <xen/sched.h>
 
 #include <xen/lib/x86/cpu-policy.h>
 
 #include <asm/cpu-policy.h>
+#include <asm/msr-index.h>
+#include <asm/setup.h>
 
 struct cpu_policy __ro_after_init     raw_cpu_policy;
 struct cpu_policy __ro_after_init    host_cpu_policy;
@@ -16,3 +19,49 @@ struct cpu_policy __ro_after_init  pv_def_cpu_policy;
 struct cpu_policy __ro_after_init hvm_max_cpu_policy;
 struct cpu_policy __ro_after_init hvm_def_cpu_policy;
 #endif
+
+int init_domain_cpu_policy(struct domain *d)
+{
+    struct cpu_policy *p = is_pv_domain(d)
+        ? (IS_ENABLED(CONFIG_PV)  ?  &pv_def_cpu_policy : NULL)
+        : (IS_ENABLED(CONFIG_HVM) ? &hvm_def_cpu_policy : NULL);
+
+    if ( !p )
+    {
+        ASSERT_UNREACHABLE();
+        return -EOPNOTSUPP;
+    }
+
+    p = xmemdup(p);
+    if ( !p )
+        return -ENOMEM;
+
+    /* See comment in ctxt_switch_levelling() */
+    if ( !opt_dom0_cpuid_faulting && is_control_domain(d) && is_pv_domain(d) )
+        p->platform_info.cpuid_faulting = false;
+
+    /*
+     * Expose the "hardware speculation behaviour" bits of ARCH_CAPS to dom0,
+     * so dom0 can turn off workarounds as appropriate.  Temporary, until the
+     * domain policy logic gains a better understanding of MSRs.
+     */
+    if ( is_hardware_domain(d) && cpu_has_arch_caps )
+    {
+        uint64_t val;
+
+        rdmsrl(MSR_ARCH_CAPABILITIES, val);
+
+        p->arch_caps.raw = val &
+            (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
+             ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO | ARCH_CAPS_IF_PSCHANGE_MC_NO |
+             ARCH_CAPS_TAA_NO | ARCH_CAPS_SBDR_SSDP_NO | ARCH_CAPS_FBSDP_NO |
+             ARCH_CAPS_PSDP_NO | ARCH_CAPS_FB_CLEAR | ARCH_CAPS_RRSBA |
+             ARCH_CAPS_BHI_NO | ARCH_CAPS_PBRSB_NO);
+    }
+
+    d->arch.cpu_policy = p;
+
+    recalculate_cpuid_policy(d);
+
+    return 0;
+}
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 0916bfe175c8..df3e503ced9d 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -784,29 +784,6 @@ void recalculate_cpuid_policy(struct domain *d)
         p->extd.raw[0x19] = EMPTY_LEAF;
 }
 
-int init_domain_cpuid_policy(struct domain *d)
-{
-    struct cpuid_policy *p = is_pv_domain(d)
-        ? (IS_ENABLED(CONFIG_PV)  ?  &pv_def_cpu_policy : NULL)
-        : (IS_ENABLED(CONFIG_HVM) ? &hvm_def_cpu_policy : NULL);
-
-    if ( !p )
-    {
-        ASSERT_UNREACHABLE();
-        return -EOPNOTSUPP;
-    }
-
-    p = xmemdup(p);
-    if ( !p )
-        return -ENOMEM;
-
-    d->arch.cpuid = p;
-
-    recalculate_cpuid_policy(d);
-
-    return 0;
-}
-
 void __init init_dom0_cpuid_policy(struct domain *d)
 {
     struct cpuid_policy *p = d->arch.cpuid;
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index d5847f70f890..7cf66aee042c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -66,6 +66,7 @@
 #ifdef CONFIG_COMPAT
 #include <compat/vcpu.h>
 #endif
+#include <asm/cpu-policy.h>
 #include <asm/psr.h>
 #include <asm/pv/domain.h>
 #include <asm/pv/mm.h>
@@ -573,7 +574,6 @@ int arch_vcpu_create(struct vcpu *v)
         /* Idle domain */
         v->arch.cr3 = __pa(idle_pg_table);
         rc = 0;
-        v->arch.msrs = ZERO_BLOCK_PTR; /* Catch stray misuses */
     }
 
     if ( rc )
@@ -743,8 +743,7 @@ int arch_domain_create(struct domain *d,
 
         d->arch.ctxt_switch = &idle_csw;
 
-        d->arch.cpuid = ZERO_BLOCK_PTR; /* Catch stray misuses. */
-        d->arch.msr = ZERO_BLOCK_PTR;
+        d->arch.cpu_policy = ZERO_BLOCK_PTR; /* Catch stray misuses. */
 
         return 0;
     }
@@ -799,10 +798,7 @@ int arch_domain_create(struct domain *d,
         goto fail;
     paging_initialised = true;
 
-    if ( (rc = init_domain_cpuid_policy(d)) )
-        goto fail;
-
-    if ( (rc = init_domain_msr_policy(d)) )
+    if ( (rc = init_domain_cpu_policy(d)) )
         goto fail;
 
     d->arch.ioport_caps =
@@ -873,8 +869,7 @@ int arch_domain_create(struct domain *d,
     iommu_domain_destroy(d);
     cleanup_domain_irq_mapping(d);
     free_xenheap_page(d->shared_info);
-    xfree(d->arch.cpuid);
-    xfree(d->arch.msr);
+    XFREE(d->arch.cpu_policy);
     if ( paging_initialised )
         paging_final_teardown(d);
     free_perdomain_mappings(d);
@@ -888,8 +883,7 @@ void arch_domain_destroy(struct domain *d)
         hvm_domain_destroy(d);
 
     xfree(d->arch.e820);
-    xfree(d->arch.cpuid);
-    xfree(d->arch.msr);
+    XFREE(d->arch.cpu_policy);
 
     free_domain_pirqs(d);
     if ( !is_idle_domain(d) )
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 5800bb10bc4a..81be25c67731 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -40,11 +40,11 @@
 static int update_domain_cpu_policy(struct domain *d,
                                     xen_domctl_cpu_policy_t *xdpc)
 {
-    struct old_cpu_policy new = {};
+    struct cpu_policy *new;
     struct cpu_policy *sys = is_pv_domain(d)
         ? (IS_ENABLED(CONFIG_PV)  ?  &pv_max_cpu_policy : NULL)
         : (IS_ENABLED(CONFIG_HVM) ? &hvm_max_cpu_policy : NULL);
-    struct old_cpu_policy old_sys = { sys, sys };
+    struct old_cpu_policy old_sys = { sys, sys }, old_new;
     struct cpu_policy_errors err = INIT_CPU_POLICY_ERRORS;
     int ret = -ENOMEM;
 
@@ -54,33 +54,33 @@ static int update_domain_cpu_policy(struct domain *d,
         return -EOPNOTSUPP;
     }
 
-    /* Start by copying the domain's existing policies. */
-    if ( !(new.cpuid = xmemdup(d->arch.cpuid)) ||
-         !(new.msr   = xmemdup(d->arch.msr)) )
+    /* Start by copying the domain's existing policy. */
+    if ( !(new = xmemdup(d->arch.cpu_policy)) )
         goto out;
 
+    old_new = (struct old_cpu_policy){ new, new };
+
     /* Merge the toolstack provided data. */
     if ( (ret = x86_cpuid_copy_from_buffer(
-              new.cpuid, xdpc->leaves, xdpc->nr_leaves,
+              new, xdpc->leaves, xdpc->nr_leaves,
               &err.leaf, &err.subleaf)) ||
          (ret = x86_msr_copy_from_buffer(
-              new.msr, xdpc->msrs, xdpc->nr_msrs, &err.msr)) )
+              new, xdpc->msrs, xdpc->nr_msrs, &err.msr)) )
         goto out;
 
     /* Trim any newly-stale out-of-range leaves. */
-    x86_cpuid_policy_clear_out_of_range_leaves(new.cpuid);
+    x86_cpuid_policy_clear_out_of_range_leaves(new);
 
     /* Audit the combined dataset. */
-    ret = x86_cpu_policies_are_compatible(&old_sys, &new, &err);
+    ret = x86_cpu_policies_are_compatible(&old_sys, &old_new, &err);
     if ( ret )
         goto out;
 
     /*
-     * Audit was successful.  Replace existing policies, leaving the old
-     * policies to be freed.
+     * Audit was successful.  Replace the existing policy, leaving the old one
+     * to be freed.
      */
-    SWAP(new.cpuid, d->arch.cpuid);
-    SWAP(new.msr,   d->arch.msr);
+    SWAP(new, d->arch.cpu_policy);
 
     /* TODO: Drop when x86_cpu_policies_are_compatible() is completed. */
     recalculate_cpuid_policy(d);
@@ -89,9 +89,8 @@ static int update_domain_cpu_policy(struct domain *d,
     domain_cpu_policy_changed(d);
 
  out:
-    /* Free whichever cpuid/msr structs are not installed in struct domain. */
-    xfree(new.cpuid);
-    xfree(new.msr);
+    /* Free whichever struct is not installed in struct domain. */
+    xfree(new);
 
     if ( ret )
     {
@@ -1327,7 +1326,7 @@ long arch_do_domctl(
         if ( guest_handle_is_null(domctl->u.cpu_policy.leaves) )
             domctl->u.cpu_policy.nr_leaves = CPUID_MAX_SERIALISED_LEAVES;
         else if ( (ret = x86_cpuid_copy_to_buffer(
-                       d->arch.cpuid,
+                       d->arch.cpu_policy,
                        domctl->u.cpu_policy.leaves,
                        &domctl->u.cpu_policy.nr_leaves)) )
             break;
@@ -1336,7 +1335,7 @@ long arch_do_domctl(
         if ( guest_handle_is_null(domctl->u.cpu_policy.msrs) )
             domctl->u.cpu_policy.nr_msrs = MSR_MAX_SERIALISED_ENTRIES;
         else if ( (ret = x86_msr_copy_to_buffer(
-                       d->arch.msr,
+                       d->arch.cpu_policy,
                        domctl->u.cpu_policy.msrs,
                        &domctl->u.cpu_policy.nr_msrs)) )
             break;
diff --git a/xen/arch/x86/include/asm/cpu-policy.h b/xen/arch/x86/include/asm/cpu-policy.h
index eef14bb4267e..9ba34bbf5ea1 100644
--- a/xen/arch/x86/include/asm/cpu-policy.h
+++ b/xen/arch/x86/include/asm/cpu-policy.h
@@ -3,6 +3,7 @@
 #define X86_CPU_POLICY_H
 
 struct cpu_policy;
+struct domain;
 
 extern struct cpu_policy     raw_cpu_policy;
 extern struct cpu_policy    host_cpu_policy;
@@ -11,4 +12,7 @@ extern struct cpu_policy  pv_def_cpu_policy;
 extern struct cpu_policy hvm_max_cpu_policy;
 extern struct cpu_policy hvm_def_cpu_policy;
 
+/* Allocate and initialise a CPU policy suitable for the domain. */
+int init_domain_cpu_policy(struct domain *d);
+
 #endif /* X86_CPU_POLICY_H */
diff --git a/xen/arch/x86/include/asm/cpuid.h b/xen/arch/x86/include/asm/cpuid.h
index ea0586277331..7f81b998ce01 100644
--- a/xen/arch/x86/include/asm/cpuid.h
+++ b/xen/arch/x86/include/asm/cpuid.h
@@ -49,9 +49,6 @@ extern struct cpuidmasks cpuidmask_defaults;
 /* Check that all previously present features are still available. */
 bool recheck_cpu_features(unsigned int cpu);
 
-/* Allocate and initialise a CPUID policy suitable for the domain. */
-int init_domain_cpuid_policy(struct domain *d);
-
 /* Apply dom0-specific tweaks to the CPUID policy. */
 void init_dom0_cpuid_policy(struct domain *d);
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 17780ad9db2f..a1deab1d0dcc 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -386,9 +386,10 @@ struct arch_domain
      */
     uint8_t x87_fip_width;
 
-    /* CPUID and MSR policy objects. */
-    struct cpuid_policy *cpuid;
-    struct msr_policy *msr;
+    union {
+        struct cpu_policy *cpuid; /* Temporary */
+        struct cpu_policy *cpu_policy;
+    };
 
     struct PITState vpit;
 
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 022230acc0af..b59a51d238a7 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -419,7 +419,6 @@ struct vcpu_msrs
 };
 
 void init_guest_msr_policy(void);
-int init_domain_msr_policy(struct domain *d);
 int init_vcpu_msr_policy(struct vcpu *v);
 
 /*
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 649d93dc5444..5b3449db7a11 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1902,8 +1902,7 @@ static int fork(struct domain *cd, struct domain *d)
 
         domain_pause(d);
         cd->max_pages = d->max_pages;
-        *cd->arch.cpuid = *d->arch.cpuid;
-        *cd->arch.msr = *d->arch.msr;
+        *cd->arch.cpu_policy = *d->arch.cpu_policy;
         cd->vmtrace_size = d->vmtrace_size;
         cd->parent = d;
     }
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index bff26bc4e2b5..672961dd3ac1 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -122,50 +122,6 @@ void __init init_guest_msr_policy(void)
     }
 }
 
-int init_domain_msr_policy(struct domain *d)
-{
-    struct msr_policy *mp = is_pv_domain(d)
-        ? (IS_ENABLED(CONFIG_PV)  ?  &pv_def_cpu_policy : NULL)
-        : (IS_ENABLED(CONFIG_HVM) ? &hvm_def_cpu_policy : NULL);
-
-    if ( !mp )
-    {
-        ASSERT_UNREACHABLE();
-        return -EOPNOTSUPP;
-    }
-
-    mp = xmemdup(mp);
-    if ( !mp )
-        return -ENOMEM;
-
-    /* See comment in ctxt_switch_levelling() */
-    if ( !opt_dom0_cpuid_faulting && is_control_domain(d) && is_pv_domain(d) )
-        mp->platform_info.cpuid_faulting = false;
-
-    /*
-     * Expose the "hardware speculation behaviour" bits of ARCH_CAPS to dom0,
-     * so dom0 can turn off workarounds as appropriate.  Temporary, until the
-     * domain policy logic gains a better understanding of MSRs.
-     */
-    if ( is_hardware_domain(d) && cpu_has_arch_caps )
-    {
-        uint64_t val;
-
-        rdmsrl(MSR_ARCH_CAPABILITIES, val);
-
-        mp->arch_caps.raw = val &
-            (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
-             ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO | ARCH_CAPS_IF_PSCHANGE_MC_NO |
-             ARCH_CAPS_TAA_NO | ARCH_CAPS_SBDR_SSDP_NO | ARCH_CAPS_FBSDP_NO |
-             ARCH_CAPS_PSDP_NO | ARCH_CAPS_FB_CLEAR | ARCH_CAPS_RRSBA |
-             ARCH_CAPS_BHI_NO | ARCH_CAPS_PBRSB_NO);
-    }
-
-    d->arch.msr = mp;
-
-    return 0;
-}
-
 int init_vcpu_msr_policy(struct vcpu *v)
 {
     struct vcpu_msrs *msrs = xzalloc(struct vcpu_msrs);
@@ -183,7 +139,6 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     const struct vcpu *curr = current;
     const struct domain *d = v->domain;
     const struct cpuid_policy *cp = d->arch.cpuid;
-    const struct msr_policy *mp = d->arch.msr;
     const struct vcpu_msrs *msrs = v->arch.msrs;
     int ret = X86EMUL_OKAY;
 
@@ -267,13 +222,13 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         goto get_reg;
 
     case MSR_INTEL_PLATFORM_INFO:
-        *val = mp->platform_info.raw;
+        *val = cp->platform_info.raw;
         break;
 
     case MSR_ARCH_CAPABILITIES:
         if ( !cp->feat.arch_caps )
             goto gp_fault;
-        *val = mp->arch_caps.raw;
+        *val = cp->arch_caps.raw;
         break;
 
     case MSR_INTEL_MISC_FEATURES_ENABLES:
@@ -474,7 +429,6 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
     const struct vcpu *curr = current;
     struct domain *d = v->domain;
     const struct cpuid_policy *cp = d->arch.cpuid;
-    const struct msr_policy *mp = d->arch.msr;
     struct vcpu_msrs *msrs = v->arch.msrs;
     int ret = X86EMUL_OKAY;
 
@@ -574,7 +528,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         bool old_cpuid_faulting = msrs->misc_features_enables.cpuid_faulting;
 
         rsvd = ~0ull;
-        if ( mp->platform_info.cpuid_faulting )
+        if ( cp->platform_info.cpuid_faulting )
             rsvd &= ~MSR_MISC_FEATURES_CPUID_FAULTING;
 
         if ( val & rsvd )
-- 
2.30.2


