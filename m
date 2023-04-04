Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FF96D5C5E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517715.803511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdLN-0006fp-Uu; Tue, 04 Apr 2023 09:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517715.803511; Tue, 04 Apr 2023 09:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdLN-0006bS-Mp; Tue, 04 Apr 2023 09:52:49 +0000
Received: by outflank-mailman (input) for mailman id 517715;
 Tue, 04 Apr 2023 09:52:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjdLL-0005bo-RA
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:52:48 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72bcdab1-d2ce-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 11:52:46 +0200 (CEST)
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
X-Inumbo-ID: 72bcdab1-d2ce-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680601966;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LIoXi1ZnCa4bmwRZ1DkqTbadm8IWoD0szu1Mk05QyrI=;
  b=EB8sJLmqiDRgiMc11ykK76kB3fOu2av1Q7msVMhaFmno2RVkTNY8UDJH
   DTnuYUUkpt7PyodeHLk8xriIjUJhSw7B4j4XaTn42qD8TwdSzUtYdEGUa
   xi1aiDMpeyYPmu3o4uIdPo5OTfPMq/UwBQd+vhR539IwHFooEjScot1yh
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104275103
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:cy1kG65e3HpQFt0c1t7M3gxRtEfHchMFZxGqfqrLsTDasY5as4F+v
 jAcD2yCOKrbYzOhKdwiPdy/p0oOsJTRnYBrGVZrpStmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPawT4AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mz
 PoRJxw3Sz+/mfuG+O+CbNsr3v8FFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx7E/
 D2bpjyiav0cHOaa1Ced/UqourTGnw6nXIM7Hbj/z+E/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JSGeAn7ACGyoLP/h2UQGMDS1Zpd9gOpMIwAzsw2
 Te0c8jBXGI19ufPEDTEq+nS9GnpUcQIEYMcTRYCRAQp2fzMnJ8qviqSd/BRV/aOqOSgTFkc3
 Au2QDgCa6Q71JBbj/jkowqY2lpAtbCSEFdru1y/snaNq1ogOdX7P9HABU3zt64oEWqPcrWWU
 JHoceC65ftGM5yCnTflrA4lTODwvKbt3NExbDdS83gdG9eFoSTLkXh4um0WGauQGp9slcXVS
 EHSoxhNw5RYIWGna6R6C6roVZRykPS+RI6+DK6EBjarXnSWXFbflByCmGbKhzy9+KTSufpX1
 WinnTaEUi9BVPUPIMueTOYBy747rh0DKZfobcmjlXyPiOPODEN5vJ9ZaDNimMhltvLbyOgUm
 v4DX/a3J+J3C7KhPnOOrdFKfTjn7xETXPjLliCeTcbbSiIOJY3rI6a5LW8JE2C9o5loqw==
IronPort-HdrOrdr: A9a23:zRzflaEGZxpovFrjpLqEMceALOsnbusQ8zAXPo5KOHlom7+j5r
 +TdZUgpGXJYVMqMk3I9urwQZVoLUmslqKdpLNhWotKPzOWw1dATrsSlbcKqgeIc0afygce79
 YFT0EXMrzN5DNB/KDHCXyDYqodKbe8gcKVbCTlo0uFjzsGV0it1WhE436gYzBLrcB9a6YEKA
 ==
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="104275103"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 06/15] x86: Merge a domain's {cpuid,msr} policy objects
Date: Tue, 4 Apr 2023 10:52:13 +0100
Message-ID: <20230404095222.1373721-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Right now, they're the same underlying type, containing disjoint information.

Drop the d->arch.msr pointer, and union d->arch.cpuid to give it a second name
of cpu_policy in the interim.

Merge init_domain_{cpuid,msr}_policy() into a single init_domain_cpu_policy(),
moving the implementation into cpu-policy.c

No practical change.  This undoes the transient doubling of storage space from
earlier patches.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Reword commit message.
 * Undo accidental deletion of v->arch.msrs.
---
 xen/arch/x86/cpu-policy.c             | 49 +++++++++++++++++++++++++++
 xen/arch/x86/cpuid.c                  | 23 -------------
 xen/arch/x86/domain.c                 | 15 +++-----
 xen/arch/x86/domctl.c                 | 35 ++++++++++---------
 xen/arch/x86/include/asm/cpu-policy.h |  4 +++
 xen/arch/x86/include/asm/cpuid.h      |  3 --
 xen/arch/x86/include/asm/domain.h     | 13 +++++--
 xen/arch/x86/include/asm/msr.h        |  1 -
 xen/arch/x86/mm/mem_sharing.c         |  3 +-
 xen/arch/x86/msr.c                    | 44 ------------------------
 10 files changed, 86 insertions(+), 104 deletions(-)

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
index d5847f70f890..b23e5014d1d3 100644
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
@@ -743,8 +744,7 @@ int arch_domain_create(struct domain *d,
 
         d->arch.ctxt_switch = &idle_csw;
 
-        d->arch.cpuid = ZERO_BLOCK_PTR; /* Catch stray misuses. */
-        d->arch.msr = ZERO_BLOCK_PTR;
+        d->arch.cpu_policy = ZERO_BLOCK_PTR; /* Catch stray misuses. */
 
         return 0;
     }
@@ -799,10 +799,7 @@ int arch_domain_create(struct domain *d,
         goto fail;
     paging_initialised = true;
 
-    if ( (rc = init_domain_cpuid_policy(d)) )
-        goto fail;
-
-    if ( (rc = init_domain_msr_policy(d)) )
+    if ( (rc = init_domain_cpu_policy(d)) )
         goto fail;
 
     d->arch.ioport_caps =
@@ -873,8 +870,7 @@ int arch_domain_create(struct domain *d,
     iommu_domain_destroy(d);
     cleanup_domain_irq_mapping(d);
     free_xenheap_page(d->shared_info);
-    xfree(d->arch.cpuid);
-    xfree(d->arch.msr);
+    XFREE(d->arch.cpu_policy);
     if ( paging_initialised )
         paging_final_teardown(d);
     free_perdomain_mappings(d);
@@ -888,8 +884,7 @@ void arch_domain_destroy(struct domain *d)
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
index 17780ad9db2f..466388a98e12 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -386,9 +386,16 @@ struct arch_domain
      */
     uint8_t x87_fip_width;
 
-    /* CPUID and MSR policy objects. */
-    struct cpuid_policy *cpuid;
-    struct msr_policy *msr;
+    /*
+     * The domain's CPU Policy.  "cpu_policy" is considered the canonical
+     * pointer, but the "cpuid" and "msr" aliases exist so the most
+     * appropriate one can be used for local code clarity.
+     */
+    union {
+        struct cpu_policy *cpu_policy;
+        struct cpu_policy *cpuid;
+        struct cpu_policy *msr;
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
index bff26bc4e2b5..93bd93feb644 100644
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
-- 
2.30.2


