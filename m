Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5058A6CF4D2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 22:52:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516355.800393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phcm1-0007uv-S7; Wed, 29 Mar 2023 20:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516355.800393; Wed, 29 Mar 2023 20:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phcm1-0007rs-NF; Wed, 29 Mar 2023 20:52:01 +0000
Received: by outflank-mailman (input) for mailman id 516355;
 Wed, 29 Mar 2023 20:51:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PU7e=7V=citrix.com=prvs=445237bd4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phclz-0005Jv-GY
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 20:51:59 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b19d3ed-ce73-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 22:51:57 +0200 (CEST)
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
X-Inumbo-ID: 8b19d3ed-ce73-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680123117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Il0Yw0uTJOQO+YSoWdWwJOOO1fJO0IpRzyBpho+xVZQ=;
  b=cvRW9D/0lAamAEGRBiOHmlhMA7tks0VgrvBYQqIKfTHSRoH+cmx1qTh0
   Nd/xhuwaDnHr2m38+LZPilYT3LPouMhxdR5R8o4YjHzzH392HKiVbEk62
   WGWT9I9QXXPZZHQF9XBWjbMQwNbCGj8cfyTIJVHnH6llyusa7vhBO+h+8
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 102947422
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:xg4npqpdEWLqvtj/MQQKEUu+KlBeBmJiZRIvgKrLsJaIsI4StFCzt
 garIBmOPquJYmL9f4xwbY6090gF75SDyIVhSgZl/io3QXkX8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzShNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACscMSGfrL6k+7GmE85JnNobC+3NE7pK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 juepTWlXU1AbrRzzxK/6E6p37TvuRn9d5AvNJSK2vM7rVmMkzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBONB0mOTLEzTHrO7S9G7sf3FPdgfueBPoUyMe8obSvKpvnCnMU49ENbSrtvrRPx7Jl
 mXiQDcFu1kDsSIa//zlogGW02Lw+sihoh0dvVuOAD/8hu9tTMv8PtHztwCGhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JAVdoKiN2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPawTY28Cq6LMIoQPPCdkTNrGgk0PSZ8OEiz+HXAbIllY
 cvLGSpSJS1y5VtbIMqeGL5GjO5DKtEWzmLPX5HrpymaPU6lTCfNE98taQLeBt3VGYvY+G05B
 f4DbZrVo/ieOcWiChTqHXk7dg5acCdnXcmu8qS6tIere2JbJY3oMNeJqZtJRmCvt/89ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:+cP47q4NcKzEWJgocAPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-IronPort-AV: E=Sophos;i="5.98,301,1673931600"; 
   d="scan'208";a="102947422"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 8/9] x86: Drop struct old_cpu_policy
Date: Wed, 29 Mar 2023 21:51:36 +0100
Message-ID: <20230329205137.323253-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230329205137.323253-1-andrew.cooper3@citrix.com>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
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
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/libs/guest/xg_cpuid_x86.c          |  4 +--
 tools/tests/cpu-policy/test-cpu-policy.c | 40 ++++++------------------
 xen/arch/x86/domctl.c                    |  7 ++---
 xen/include/xen/lib/x86/cpu-policy.h     | 12 ++-----
 xen/lib/x86/policy.c                     | 12 +++----
 5 files changed, 22 insertions(+), 53 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 5061fe357767..14c00304c03c 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -868,9 +868,7 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest)
 {
     struct cpu_policy_errors err = INIT_CPU_POLICY_ERRORS;
-    struct old_cpu_policy h = { &host->policy, &host->policy };
-    struct old_cpu_policy g = { &guest->policy, &guest->policy };
-    int rc = x86_cpu_policies_are_compatible(&h, &g, &err);
+    int rc = x86_cpu_policies_are_compatible(&host->policy, &host->policy, &err);
 
     if ( !rc )
         return true;
diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 909d6272f875..5b38702b1c62 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
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
index 5af756a02da0..51f88f1e217e 100644
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


