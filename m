Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15696D5C5C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517711.803473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdLK-0005fZ-9R; Tue, 04 Apr 2023 09:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517711.803473; Tue, 04 Apr 2023 09:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdLK-0005cM-46; Tue, 04 Apr 2023 09:52:46 +0000
Received: by outflank-mailman (input) for mailman id 517711;
 Tue, 04 Apr 2023 09:52:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjdLI-00056d-HN
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:52:44 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70eae744-d2ce-11ed-b464-930f4c7d94ae;
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
X-Inumbo-ID: 70eae744-d2ce-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680601962;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aLMfsVFJMPWfdGfDVV87nevqNr05P5LkUPZ6r3/rMcw=;
  b=IAJ1862dGKNvFB/BTlLqBMI1KFmgaP4pS38PwQOZBK4kWd3N7pJEO9DL
   b6d4u0QMrtoCU+shhxXmc6p+gda0cfszpM9pCYDmrgH4asbhbh1t9Cwt2
   EGonPLpEOypR67dLz71cuvY09Kae3+X2JzOc4bxJbMHovM59yBzIIK8hl
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104656513
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:we0psq/4EOmL4Du6egCdDrUD/36TJUtcMsCJ2f8bNWPcYEJGY0x3n
 DQXWj2FbKzcYWD1fN9/bN628UoHv8eEydVqHQtprn08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmOagX5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklrp
 cBIEigHRCrbrP2t5vW/WM0ruPo8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxhrG+
 zybpj+R7hcyEfy/wzCb0k6XmsDTkAHKQ6c5MJeH+as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9haHvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 mJlhPuwW2Yp6ufMDyvAqPHN92ja1TUpwXEqQH84HTEd6fPZ+KoslTSISsRHV5CLkYigcd3v+
 AxmvBTSlp1K055Tivrlpw+e696/jsOXF1Bov207Skrgt1okP9D9OuRE/HCBtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFBz3oRZPhagKvFlDyL5Ba67ogwPBb
 k7Joh9275ROJnasZqIfS9vvW5x3kfaxT4+/CKC8gj9yjn9ZLVfvwc2TTRTIgzCFfLYEysnTx
 qt3ge7zVC1HWMyLPRK9RvsH0K9D+x3SMVj7HMihpzz+iOr2WZJgYetdWLd4RrxjvfzsTcS82
 4o3CvZmPD0ED7KiOHCLrtdDRb3IRFBiba3LRwVsXrbrCmJb9KsJUZc9HZtJl1RZoplo
IronPort-HdrOrdr: A9a23:enJGDKjcmqWppJkVrY3NCTzegnBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="104656513"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 01/15] x86: Rename struct cpu_policy to struct old_cpuid_policy
Date: Tue, 4 Apr 2023 10:52:08 +0100
Message-ID: <20230404095222.1373721-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
References: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We want to merge struct cpuid_policy and struct msr_policy together, and the
result wants to be called struct cpu_policy.

The current struct cpu_policy, being a pair of pointers, isn't terribly
useful.  Rename the type to struct old_cpu_policy, but it will disappear
entirely once the merge is complete.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/libs/guest/xg_cpuid_x86.c          | 4 ++--
 tools/tests/cpu-policy/test-cpu-policy.c | 4 ++--
 xen/arch/x86/domctl.c                    | 4 ++--
 xen/arch/x86/include/asm/cpuid.h         | 2 +-
 xen/arch/x86/sysctl.c                    | 4 ++--
 xen/include/xen/lib/x86/cpu-policy.h     | 6 +++---
 xen/lib/x86/policy.c                     | 4 ++--
 7 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 4542878bbe88..1b02bc987af7 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -868,8 +868,8 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
                                  xc_cpu_policy_t *guest)
 {
     struct cpu_policy_errors err = INIT_CPU_POLICY_ERRORS;
-    struct cpu_policy h = { &host->cpuid, &host->msr };
-    struct cpu_policy g = { &guest->cpuid, &guest->msr };
+    struct old_cpu_policy h = { &host->cpuid, &host->msr };
+    struct old_cpu_policy g = { &guest->cpuid, &guest->msr };
     int rc = x86_cpu_policies_are_compatible(&h, &g, &err);
 
     if ( !rc )
diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index d3f24fd6d274..909d6272f875 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -602,7 +602,7 @@ static void test_is_compatible_success(void)
     for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
     {
         struct test *t = &tests[i];
-        struct cpu_policy sys = {
+        struct old_cpu_policy sys = {
             &t->host_cpuid,
             &t->host_msr,
         }, new = {
@@ -654,7 +654,7 @@ static void test_is_compatible_failure(void)
     for ( size_t i = 0; i < ARRAY_SIZE(tests); ++i )
     {
         struct test *t = &tests[i];
-        struct cpu_policy sys = {
+        struct old_cpu_policy sys = {
             &t->host_cpuid,
             &t->host_msr,
         }, new = {
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 2118fcad5dfe..0b41b279507e 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -40,8 +40,8 @@
 static int update_domain_cpu_policy(struct domain *d,
                                     xen_domctl_cpu_policy_t *xdpc)
 {
-    struct cpu_policy new = {};
-    const struct cpu_policy *sys = is_pv_domain(d)
+    struct old_cpu_policy new = {};
+    const struct old_cpu_policy *sys = is_pv_domain(d)
         ? &system_policies[XEN_SYSCTL_cpu_policy_pv_max]
         : &system_policies[XEN_SYSCTL_cpu_policy_hvm_max];
     struct cpu_policy_errors err = INIT_CPU_POLICY_ERRORS;
diff --git a/xen/arch/x86/include/asm/cpuid.h b/xen/arch/x86/include/asm/cpuid.h
index 9c3637549a10..49b3128f06f9 100644
--- a/xen/arch/x86/include/asm/cpuid.h
+++ b/xen/arch/x86/include/asm/cpuid.h
@@ -51,7 +51,7 @@ extern struct cpuid_policy raw_cpuid_policy, host_cpuid_policy,
     pv_max_cpuid_policy, pv_def_cpuid_policy,
     hvm_max_cpuid_policy, hvm_def_cpuid_policy;
 
-extern const struct cpu_policy system_policies[];
+extern const struct old_cpu_policy system_policies[];
 
 /* Check that all previously present features are still available. */
 bool recheck_cpu_features(unsigned int cpu);
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 16625b57f01f..3f5b092df16a 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -32,7 +32,7 @@
 #include <asm/psr.h>
 #include <asm/cpuid.h>
 
-const struct cpu_policy system_policies[6] = {
+const struct old_cpu_policy system_policies[6] = {
     [ XEN_SYSCTL_cpu_policy_raw ] = {
         &raw_cpuid_policy,
         &raw_msr_policy,
@@ -391,7 +391,7 @@ long arch_do_sysctl(
 
     case XEN_SYSCTL_get_cpu_policy:
     {
-        const struct cpu_policy *policy;
+        const struct old_cpu_policy *policy;
 
         /* Reserved field set, or bad policy index? */
         if ( sysctl->u.cpu_policy._rsvd ||
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index 5a2c4c7b2d90..3a5300d1078c 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -5,7 +5,7 @@
 #include <xen/lib/x86/cpuid.h>
 #include <xen/lib/x86/msr.h>
 
-struct cpu_policy
+struct old_cpu_policy
 {
     struct cpuid_policy *cpuid;
     struct msr_policy *msr;
@@ -33,8 +33,8 @@ struct cpu_policy_errors
  * incompatibility is detected, the optional err pointer may identify the
  * problematic leaf/subleaf and/or MSR.
  */
-int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
-                                    const struct cpu_policy *guest,
+int x86_cpu_policies_are_compatible(const struct old_cpu_policy *host,
+                                    const struct old_cpu_policy *guest,
                                     struct cpu_policy_errors *err);
 
 #endif /* !XEN_LIB_X86_POLICIES_H */
diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index f6cea4e2f9bd..2975711d7c6c 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -2,8 +2,8 @@
 
 #include <xen/lib/x86/cpu-policy.h>
 
-int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
-                                    const struct cpu_policy *guest,
+int x86_cpu_policies_are_compatible(const struct old_cpu_policy *host,
+                                    const struct old_cpu_policy *guest,
                                     struct cpu_policy_errors *err)
 {
     struct cpu_policy_errors e = INIT_CPU_POLICY_ERRORS;
-- 
2.30.2


