Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D1D6D5C63
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:53:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517712.803478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdLK-0005ih-Gz; Tue, 04 Apr 2023 09:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517712.803478; Tue, 04 Apr 2023 09:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdLK-0005fO-Cg; Tue, 04 Apr 2023 09:52:46 +0000
Received: by outflank-mailman (input) for mailman id 517712;
 Tue, 04 Apr 2023 09:52:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjdLI-00056d-Rv
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:52:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71331b36-d2ce-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 11:52:42 +0200 (CEST)
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
X-Inumbo-ID: 71331b36-d2ce-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680601962;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IL5jduQ9wz95TuOVb8Hg3lcqfJg4oc1M0v7wklWBR7U=;
  b=fqdWjunhNnUkRvKB57Auje5ZtBaKjup87SJp1Mp+1mFJ7h8VO2z2ZQ9m
   VSRHs5OEyNgf8++03Tl0yYWjo+nUcYK/IwZu7hGG+24Y7xmkEYlIIL3ZG
   yrHPjG7Vx2ag6RJh5dBMGaavU1qzBkVOqnZhq4mPQriuJLmedpHVF8ijY
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104161363
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:TTtdRaPFHGHio0PvrR3al8FynXyQoLVcMsEvi/4bfWQNrUohhj0Cy
 WtLWWHXPf+CY2LxfYtxaorn/BgB757Tm9QwTgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tE5gBmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sBWOkdp2
 u4JE2EicT7Yos+RzeyhRMA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXSGZwLxx3G/
 Qoq+UzAJwoHCNiulQHC2WCPnPXQ3g/bZYYrQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBeeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwAzDFQkQgAWXDBUzMbN+6QeqR+RVNhKRfvdYsLOJd3g/
 9ybhHFg1+1O0pBRiPzTEUPv2Gz1+MWQJuIhzkCOBz/+sFskDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKMN8N7n9hV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEnO9/tVZVwlvK+RbwJs8w4ifIXOvBMmPKvpnkyNSZ8IUi2+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48g7FPf/QhnnTm7bcmin3yaPU+2OCb9pUEtbAHfMYjULcqs/G3oz
 jqoH5DVlEkFCbGhO3m/HEx6BQliEEXXzKve86R/HtNv6CI/cI39I5c9GY8cRrE=
IronPort-HdrOrdr: A9a23:igteTK1T07G5OI8/NpHhKwqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="104161363"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 08/15] x86: Drop struct old_cpu_policy
Date: Tue, 4 Apr 2023 10:52:15 +0100
Message-ID: <20230404095222.1373721-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With all the complicated callers of x86_cpu_policies_are_compatible() updated
to use a single cpu_policy object, we can drop the final user of struct
old_cpu_policy.

Update x86_cpu_policies_are_compatible() to take (new) cpu_policy pointers,
reducing the amount of internal pointer chasing, and update all callers to
pass their cpu_policy objects directly.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Fix host/guest typo in xc_cpu_policy_is_compatible()
---
 tools/libs/guest/xg_cpuid_x86.c          |  4 +-
 tools/tests/cpu-policy/test-cpu-policy.c | 50 +++++++-----------------
 xen/arch/x86/domctl.c                    |  7 +---
 xen/include/xen/lib/x86/cpu-policy.h     | 12 ++----
 xen/lib/x86/policy.c                     | 12 +++---
 5 files changed, 27 insertions(+), 58 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 5061fe357767..259029be8b36 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -868,9 +868,7 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest)
 {
     struct cpu_policy_errors err = INIT_CPU_POLICY_ERRORS;
-    struct old_cpu_policy h = { &host->policy, &host->policy };
-    struct old_cpu_policy g = { &guest->policy, &guest->policy };
-    int rc = x86_cpu_policies_are_compatible(&h, &g, &err);
+    int rc = x86_cpu_policies_are_compatible(&host->policy, &guest->policy, &err);
 
     if ( !rc )
         return true;
diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 909d6272f875..a4ca07f33973 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -98,7 +98,7 @@ static bool msrs_are_sorted(const xen_msr_entry_t *entries, unsigned int nr)
 
 static void test_cpuid_current(void)
 {
-    struct cpuid_policy p;
+    struct cpu_policy p;
     xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
     unsigned int nr = ARRAY_SIZE(leaves);
     int rc;
@@ -118,7 +118,7 @@ static void test_cpuid_current(void)
 static void test_cpuid_serialise_success(void)
 {
     static const struct test {
-        struct cpuid_policy p;
+        struct cpu_policy p;
         const char *name;
         unsigned int nr_leaves;
     } tests[] = {
@@ -242,7 +242,7 @@ static void test_cpuid_serialise_success(void)
 static void test_msr_serialise_success(void)
 {
     static const struct test {
-        struct msr_policy p;
+        struct cpu_policy p;
         const char *name;
         unsigned int nr_msrs;
     } tests[] = {
@@ -430,7 +430,7 @@ static void test_cpuid_out_of_range_clearing(void)
     static const struct test {
         const char *name;
         unsigned int nr_markers;
-        struct cpuid_policy p;
+        struct cpu_policy p;
     } tests[] = {
         {
             .name = "basic",
@@ -550,7 +550,7 @@ static void test_cpuid_out_of_range_clearing(void)
     for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
     {
         const struct test *t = &tests[i];
-        struct cpuid_policy *p = memdup(&t->p);
+        struct cpu_policy *p = memdup(&t->p);
         void *ptr;
         unsigned int nr_markers;
 
@@ -574,23 +574,20 @@ static void test_is_compatible_success(void)
 {
     static struct test {
         const char *name;
-        struct cpuid_policy host_cpuid;
-        struct cpuid_policy guest_cpuid;
-        struct msr_policy host_msr;
-        struct msr_policy guest_msr;
+        struct cpu_policy host, guest;
     } tests[] = {
         {
             .name = "Host CPUID faulting, Guest not",
-            .host_msr = {
+            .host = {
                 .platform_info.cpuid_faulting = true,
             },
         },
         {
             .name = "Host CPUID faulting, Guest wanted",
-            .host_msr = {
+            .host = {
                 .platform_info.cpuid_faulting = true,
             },
-            .guest_msr = {
+            .guest = {
                 .platform_info.cpuid_faulting = true,
             },
         },
@@ -602,15 +599,8 @@ static void test_is_compatible_success(void)
     for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
     {
         struct test *t = &tests[i];
-        struct old_cpu_policy sys = {
-            &t->host_cpuid,
-            &t->host_msr,
-        }, new = {
-            &t->guest_cpuid,
-            &t->guest_msr,
-        };
         struct cpu_policy_errors e;
-        int res = x86_cpu_policies_are_compatible(&sys, &new, &e);
+        int res = x86_cpu_policies_are_compatible(&t->host, &t->guest, &e);
 
         /* Check the expected error output. */
         if ( res != 0 || memcmp(&no_errors, &e, sizeof(no_errors)) )
@@ -624,25 +614,22 @@ static void test_is_compatible_failure(void)
 {
     static struct test {
         const char *name;
-        struct cpuid_policy host_cpuid;
-        struct cpuid_policy guest_cpuid;
-        struct msr_policy host_msr;
-        struct msr_policy guest_msr;
+        struct cpu_policy host, guest;
         struct cpu_policy_errors e;
     } tests[] = {
         {
             .name = "Host basic.max_leaf out of range",
-            .guest_cpuid.basic.max_leaf = 1,
+            .guest.basic.max_leaf = 1,
             .e = { 0, -1, -1 },
         },
         {
             .name = "Host extd.max_leaf out of range",
-            .guest_cpuid.extd.max_leaf = 1,
+            .guest.extd.max_leaf = 1,
             .e = { 0x80000000, -1, -1 },
         },
         {
             .name = "Host no CPUID faulting, Guest wanted",
-            .guest_msr = {
+            .guest = {
                 .platform_info.cpuid_faulting = true,
             },
             .e = { -1, -1, 0xce },
@@ -654,15 +641,8 @@ static void test_is_compatible_failure(void)
     for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
     {
         struct test *t = &tests[i];
-        struct old_cpu_policy sys = {
-            &t->host_cpuid,
-            &t->host_msr,
-        }, new = {
-            &t->guest_cpuid,
-            &t->guest_msr,
-        };
         struct cpu_policy_errors e;
-        int res = x86_cpu_policies_are_compatible(&sys, &new, &e);
+        int res = x86_cpu_policies_are_compatible(&t->host, &t->guest, &e);
 
         /* Check the expected error output. */
         if ( res == 0 || memcmp(&t->e, &e, sizeof(t->e)) )
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 81be25c67731..c02528594102 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -41,10 +41,9 @@ static int update_domain_cpu_policy(struct domain *d,
                                     xen_domctl_cpu_policy_t *xdpc)
 {
     struct cpu_policy *new;
-    struct cpu_policy *sys = is_pv_domain(d)
+    const struct cpu_policy *sys = is_pv_domain(d)
         ? (IS_ENABLED(CONFIG_PV)  ?  &pv_max_cpu_policy : NULL)
         : (IS_ENABLED(CONFIG_HVM) ? &hvm_max_cpu_policy : NULL);
-    struct old_cpu_policy old_sys = { sys, sys }, old_new;
     struct cpu_policy_errors err = INIT_CPU_POLICY_ERRORS;
     int ret = -ENOMEM;
 
@@ -58,8 +57,6 @@ static int update_domain_cpu_policy(struct domain *d,
     if ( !(new = xmemdup(d->arch.cpu_policy)) )
         goto out;
 
-    old_new = (struct old_cpu_policy){ new, new };
-
     /* Merge the toolstack provided data. */
     if ( (ret = x86_cpuid_copy_from_buffer(
               new, xdpc->leaves, xdpc->nr_leaves,
@@ -72,7 +69,7 @@ static int update_domain_cpu_policy(struct domain *d,
     x86_cpuid_policy_clear_out_of_range_leaves(new);
 
     /* Audit the combined dataset. */
-    ret = x86_cpu_policies_are_compatible(&old_sys, &old_new, &err);
+    ret = x86_cpu_policies_are_compatible(sys, new, &err);
     if ( ret )
         goto out;
 
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 53fffca55211..8b27a0725b8e 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -379,12 +379,6 @@ struct cpu_policy
 #define cpuid_policy cpu_policy
 #define msr_policy cpu_policy
 
-struct old_cpu_policy
-{
-    struct cpuid_policy *cpuid;
-    struct msr_policy *msr;
-};
-
 struct cpu_policy_errors
 {
     uint32_t leaf, subleaf;
@@ -559,7 +553,7 @@ int x86_msr_copy_from_buffer(struct msr_policy *policy,
                              const msr_entry_buffer_t msrs, uint32_t nr_entries,
                              uint32_t *err_msr);
 
-/*
+/**
  * Calculate whether two policies are compatible.
  *
  * i.e. Can a VM configured with @guest run on a CPU supporting @host.
@@ -573,8 +567,8 @@ int x86_msr_copy_from_buffer(struct msr_policy *policy,
  * incompatibility is detected, the optional err pointer may identify the
  * problematic leaf/subleaf and/or MSR.
  */
-int x86_cpu_policies_are_compatible(const struct old_cpu_policy *host,
-                                    const struct old_cpu_policy *guest,
+int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
+                                    const struct cpu_policy *guest,
                                     struct cpu_policy_errors *err);
 
 #endif /* !XEN_LIB_X86_POLICIES_H */
diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index 2975711d7c6c..a9c60000af9d 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -2,8 +2,8 @@
 
 #include <xen/lib/x86/cpu-policy.h>
 
-int x86_cpu_policies_are_compatible(const struct old_cpu_policy *host,
-                                    const struct old_cpu_policy *guest,
+int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
+                                    const struct cpu_policy *guest,
                                     struct cpu_policy_errors *err)
 {
     struct cpu_policy_errors e = INIT_CPU_POLICY_ERRORS;
@@ -15,18 +15,18 @@ int x86_cpu_policies_are_compatible(const struct old_cpu_policy *host,
 #define FAIL_MSR(m) \
     do { e.msr = (m); goto out; } while ( 0 )
 
-    if ( guest->cpuid->basic.max_leaf > host->cpuid->basic.max_leaf )
+    if ( guest->basic.max_leaf > host->basic.max_leaf )
         FAIL_CPUID(0, NA);
 
-    if ( guest->cpuid->feat.max_subleaf > host->cpuid->feat.max_subleaf )
+    if ( guest->feat.max_subleaf > host->feat.max_subleaf )
         FAIL_CPUID(7, 0);
 
-    if ( guest->cpuid->extd.max_leaf > host->cpuid->extd.max_leaf )
+    if ( guest->extd.max_leaf > host->extd.max_leaf )
         FAIL_CPUID(0x80000000, NA);
 
     /* TODO: Audit more CPUID data. */
 
-    if ( ~host->msr->platform_info.raw & guest->msr->platform_info.raw )
+    if ( ~host->platform_info.raw & guest->platform_info.raw )
         FAIL_MSR(MSR_INTEL_PLATFORM_INFO);
 
 #undef FAIL_MSR
-- 
2.30.2


