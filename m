Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B51516CF4C6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 22:52:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516346.800303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phclp-0005N7-Bs; Wed, 29 Mar 2023 20:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516346.800303; Wed, 29 Mar 2023 20:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phclp-0005K8-74; Wed, 29 Mar 2023 20:51:49 +0000
Received: by outflank-mailman (input) for mailman id 516346;
 Wed, 29 Mar 2023 20:51:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PU7e=7V=citrix.com=prvs=445237bd4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phcln-0005Jv-Op
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 20:51:47 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8225ea21-ce73-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 22:51:44 +0200 (CEST)
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
X-Inumbo-ID: 8225ea21-ce73-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680123103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4jHKbo6xgSHAMA7ALHtrpQqN19VeWD23wmDu4cdtUVQ=;
  b=TnCv5FbhPpQeP6nAoBekNEvPo5yHjSI5pIJ+ncmLAH0WVHeQh1i8Bipx
   p7ARm+UDDe/WIuZM3g9+gqDM4SuqY8zISaWTwCKN+guYydzYHA5nbd6QB
   L//4dk5UuHwRE+Nu3nwGfCs3nX4g6ZAxMpsc7PLe3kvABQWCARoMerD4X
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 103989103
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:bH+HRahTLdSy6IRtFQ0Exck6X161GhAKZh0ujC45NGQN5FlHY01je
 htvD2mOOvzeNmamedEnaNzipk8O7J+GndEyHgNq+C42EX4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5wWPzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ1OTkuViiOttuGnp28a+tMn/t5dNjSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 jmXrzWgWkpy2Nq32Aih8nmS2PL1vDrfe909K7rp7bljjwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XrY3N9wXI+iTEsYBoMwOHbrbAKvkzgSfdhMLeK1IXkIGSlq
 9yVlxTSl4n/nOZSifrqrACX3278znTaZlVrv1uKBwpJ+is8Pdf4PNLwtDA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGFb5J+i8GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510nfC5TIi7Ca6EMIQmjn1NmOmvpnkGiam4gQjQfLUEy/lja
 f93j+73ZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjG8vhT6pLHPCT9Ye5cYDOzghURsPvsTPP9r
 4wOaKNnCnx3DIXDX8Ug2dVNfQ1VcSBiXcmeRg4+XrfrHzeK0VoJU5f5qY7NsaQ890iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:RHNwGKig4LUc/D1tCgwXrCBKpHBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.98,301,1673931600"; 
   d="scan'208";a="103989103"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/9] x86: Rename struct cpu_policy to struct old_cpuid_policy
Date: Wed, 29 Mar 2023 21:51:29 +0100
Message-ID: <20230329205137.323253-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230329205137.323253-1-andrew.cooper3@citrix.com>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
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


