Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC7C6F733B
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:39:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530042.825309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puenj-0007Sg-UF; Thu, 04 May 2023 19:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530042.825309; Thu, 04 May 2023 19:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puenj-0007O9-PL; Thu, 04 May 2023 19:39:39 +0000
Received: by outflank-mailman (input) for mailman id 530042;
 Thu, 04 May 2023 19:39:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZxo=AZ=citrix.com=prvs=48139b1ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pueni-00069W-8I
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:39:38 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 667cad8e-eab3-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 21:39:36 +0200 (CEST)
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
X-Inumbo-ID: 667cad8e-eab3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683229175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8ce56R8LVcBJfEp4OPYpZgXky/uTBbu+6PODD4ktX/M=;
  b=ZXVEiBV20OPRjcoDnNVtzOJ1n+Lj96JLE/C8t1e13lI6XzGI6GEBXtwT
   e+Bs5Y6qp6Re/UNCNLJep03roQCqjs1dON45tTGjjsbOd+HooNKVzad6x
   dvtFg7Sie1VFlqNPmr70II+Iz2dKDNh1PNTFKcZWokZNYlXU7VZAVscW1
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 107797745
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:xdERWaOw/3iHgwzvrR3Ul8FynXyQoLVcMsEvi/4bfWQNrUoh32NSz
 mZNWWuBPvrYM2agKd5yatng8EoP7JfWzYVkGwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tF5gBmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rxWPm9w8
 942FGAId0yNnuX14pucbMA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXSGpoEwRnE+
 woq+UyjJBhdLvKWlwaMrGuKusSRxnmmQI87QejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBeeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwBPDFAMWykmYzdV5sC/rpg0zTDmafBKRfvdYsLOJd3g/
 9ybhHFg1+5L1JRbiPrTEUPv2Gz1+MWQJuIhzkCOBz/+sFskDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKMN8N7n9hV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEnONjrVZhznPC7SrwJs8zpgidmOMAtJGdrAgk3DaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxa8dZCfM9EieVD7nlnlQvuqWXTk0zPPUy2OCTEFt/o8TKmMogE0U9ziF+Iq
 IgCbZHRk0o3vS+XSnC/zLP/5GsidRATba0aYeQNHgJfCmKKwF0cNsI=
IronPort-HdrOrdr: A9a23:t+PfxKxYwKdSpjb00wbfKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-Talos-CUID: 9a23:P7UCjG75lPudlrpMN9ssrm8rFP4jUFPhnHLJf0GhDiVLYZqzYArF
X-Talos-MUID: =?us-ascii?q?9a23=3AzCLoiww91vxrdQwpVr1UkB6due2aqP6IAQcXv5x?=
 =?us-ascii?q?Yh8DaLApMEGnG1mmvT6Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,250,1677560400"; 
   d="scan'208";a="107797745"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/6] x86/cpuid: Rename FSCAPINTS to X86_NR_FEAT
Date: Thu, 4 May 2023 20:39:21 +0100
Message-ID: <20230504193924.3305496-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The latter is more legible, and consistent with X86_NR_{CAPS,SYNTH,BUG} which
already exist.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu-policy.c              | 22 +++++++++++-----------
 xen/arch/x86/cpu/common.c              |  4 ++--
 xen/arch/x86/include/asm/cpufeatures.h |  8 ++++----
 xen/arch/x86/include/asm/cpuid.h       |  2 +-
 xen/arch/x86/sysctl.c                  |  8 ++++----
 5 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 44c88debf958..774c512a03bd 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -130,8 +130,8 @@ static int __init cf_check parse_xen_cpuid(const char *s)
 custom_param("cpuid", parse_xen_cpuid);
 
 static bool __initdata dom0_cpuid_cmdline;
-static uint32_t __initdata dom0_enable_feat[FSCAPINTS];
-static uint32_t __initdata dom0_disable_feat[FSCAPINTS];
+static uint32_t __initdata dom0_enable_feat[X86_NR_FEAT];
+static uint32_t __initdata dom0_disable_feat[X86_NR_FEAT];
 
 static void __init cf_check _parse_dom0_cpuid(unsigned int feat, bool val)
 {
@@ -158,10 +158,10 @@ static void sanitise_featureset(uint32_t *fs)
 {
     /* for_each_set_bit() uses unsigned longs.  Extend with zeroes. */
     uint32_t disabled_features[
-        ROUNDUP(FSCAPINTS, sizeof(unsigned long)/sizeof(uint32_t))] = {};
+        ROUNDUP(X86_NR_FEAT, sizeof(unsigned long)/sizeof(uint32_t))] = {};
     unsigned int i;
 
-    for ( i = 0; i < FSCAPINTS; ++i )
+    for ( i = 0; i < X86_NR_FEAT; ++i )
     {
         /* Clamp to known mask. */
         fs[i] &= known_features[i];
@@ -181,7 +181,7 @@ static void sanitise_featureset(uint32_t *fs)
 
         ASSERT(dfs); /* deep_features[] should guarentee this. */
 
-        for ( j = 0; j < FSCAPINTS; ++j )
+        for ( j = 0; j < X86_NR_FEAT; ++j )
         {
             fs[j] &= ~dfs[j];
             disabled_features[j] &= ~dfs[j];
@@ -476,7 +476,7 @@ static void __init guest_common_feature_adjustments(uint32_t *fs)
 static void __init calculate_pv_max_policy(void)
 {
     struct cpu_policy *p = &pv_max_cpu_policy;
-    uint32_t fs[FSCAPINTS];
+    uint32_t fs[X86_NR_FEAT];
     unsigned int i;
 
     *p = host_cpu_policy;
@@ -509,7 +509,7 @@ static void __init calculate_pv_max_policy(void)
 static void __init calculate_pv_def_policy(void)
 {
     struct cpu_policy *p = &pv_def_cpu_policy;
-    uint32_t fs[FSCAPINTS];
+    uint32_t fs[X86_NR_FEAT];
     unsigned int i;
 
     *p = pv_max_cpu_policy;
@@ -529,7 +529,7 @@ static void __init calculate_pv_def_policy(void)
 static void __init calculate_hvm_max_policy(void)
 {
     struct cpu_policy *p = &hvm_max_cpu_policy;
-    uint32_t fs[FSCAPINTS];
+    uint32_t fs[X86_NR_FEAT];
     unsigned int i;
     const uint32_t *mask;
 
@@ -625,7 +625,7 @@ static void __init calculate_hvm_max_policy(void)
 static void __init calculate_hvm_def_policy(void)
 {
     struct cpu_policy *p = &hvm_def_cpu_policy;
-    uint32_t fs[FSCAPINTS];
+    uint32_t fs[X86_NR_FEAT];
     unsigned int i;
     const uint32_t *mask;
 
@@ -723,7 +723,7 @@ void recalculate_cpuid_policy(struct domain *d)
     const struct cpu_policy *max = is_pv_domain(d)
         ? (IS_ENABLED(CONFIG_PV)  ?  &pv_max_cpu_policy : NULL)
         : (IS_ENABLED(CONFIG_HVM) ? &hvm_max_cpu_policy : NULL);
-    uint32_t fs[FSCAPINTS], max_fs[FSCAPINTS];
+    uint32_t fs[X86_NR_FEAT], max_fs[X86_NR_FEAT];
     unsigned int i;
 
     if ( !max )
@@ -864,7 +864,7 @@ void __init init_dom0_cpuid_policy(struct domain *d)
     /* Apply dom0-cpuid= command line settings, if provided. */
     if ( dom0_cpuid_cmdline )
     {
-        uint32_t fs[FSCAPINTS];
+        uint32_t fs[X86_NR_FEAT];
         unsigned int i;
 
         x86_cpu_policy_to_featureset(p, fs);
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 1be049e332ce..d12ccea20350 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -80,7 +80,7 @@ void __init setup_clear_cpu_cap(unsigned int cap)
 	if (!dfs)
 		return;
 
-	for (i = 0; i < FSCAPINTS; ++i) {
+	for (i = 0; i < X86_NR_FEAT; ++i) {
 		cleared_caps[i] |= dfs[i];
 		boot_cpu_data.x86_capability[i] &= ~dfs[i];
 		if (!(forced_caps[i] & dfs[i]))
@@ -527,7 +527,7 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	 * The vendor-specific functions might have changed features.  Now
 	 * we do "generic changes."
 	 */
-	for (i = 0; i < FSCAPINTS; ++i)
+	for (i = 0; i < X86_NR_FEAT; ++i)
 		c->x86_capability[i] &= known_features[i];
 
 	for (i = 0 ; i < X86_NR_CAPS ; ++i) {
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index e982ee920ce1..408ab4ba16a5 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -5,11 +5,11 @@
 #include <xen/lib/x86/cpuid-autogen.h>
 
 /* Number of capability words covered by the featureset words. */
-#define FSCAPINTS FEATURESET_NR_ENTRIES
+#define X86_NR_FEAT FEATURESET_NR_ENTRIES
 
 /* Synthetic words follow the featureset words. */
 #define X86_NR_SYNTH 1
-#define X86_SYNTH(x) (FSCAPINTS * 32 + (x))
+#define X86_SYNTH(x) (X86_NR_FEAT * 32 + (x))
 
 /* Synthetic features */
 XEN_CPUFEATURE(CONSTANT_TSC,      X86_SYNTH( 0)) /* TSC ticks at a constant rate */
@@ -45,7 +45,7 @@ XEN_CPUFEATURE(IBPB_ENTRY_HVM,    X86_SYNTH(29)) /* MSR_PRED_CMD used by Xen for
 
 /* Bug words follow the synthetic words. */
 #define X86_NR_BUG 1
-#define X86_BUG(x) ((FSCAPINTS + X86_NR_SYNTH) * 32 + (x))
+#define X86_BUG(x) ((X86_NR_FEAT + X86_NR_SYNTH) * 32 + (x))
 
 #define X86_BUG_FPU_PTRS          X86_BUG( 0) /* (F)X{SAVE,RSTOR} doesn't save/restore FOP/FIP/FDP. */
 #define X86_BUG_NULL_SEG          X86_BUG( 1) /* NULL-ing a selector preserves the base and limit. */
@@ -53,4 +53,4 @@ XEN_CPUFEATURE(IBPB_ENTRY_HVM,    X86_SYNTH(29)) /* MSR_PRED_CMD used by Xen for
 #define X86_BUG_IBPB_NO_RET       X86_BUG( 3) /* IBPB doesn't flush the RSB/RAS */
 
 /* Total number of capability words, inc synth and bug words. */
-#define X86_NR_CAPS (FSCAPINTS + X86_NR_SYNTH + X86_NR_BUG) /* N 32-bit words worth of info */
+#define X86_NR_CAPS (X86_NR_FEAT + X86_NR_SYNTH + X86_NR_BUG) /* N 32-bit words worth of info */
diff --git a/xen/arch/x86/include/asm/cpuid.h b/xen/arch/x86/include/asm/cpuid.h
index b32ba0bbfe5c..85b6ca0edb91 100644
--- a/xen/arch/x86/include/asm/cpuid.h
+++ b/xen/arch/x86/include/asm/cpuid.h
@@ -10,7 +10,7 @@
 
 #include <public/sysctl.h>
 
-extern const uint32_t known_features[FSCAPINTS];
+extern const uint32_t known_features[X86_NR_FEAT];
 
 /*
  * Expected levelling capabilities (given cpuid vendor/family information),
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index c107f40c6283..9be0e796628c 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -308,13 +308,13 @@ long arch_do_sysctl(
 #endif
         };
         const struct cpu_policy *p = NULL;
-        uint32_t featureset[FSCAPINTS];
+        uint32_t featureset[X86_NR_FEAT];
         unsigned int nr;
 
         /* Request for maximum number of features? */
         if ( guest_handle_is_null(sysctl->u.cpu_featureset.features) )
         {
-            sysctl->u.cpu_featureset.nr_features = FSCAPINTS;
+            sysctl->u.cpu_featureset.nr_features = X86_NR_FEAT;
             if ( __copy_field_to_guest(u_sysctl, sysctl,
                                        u.cpu_featureset.nr_features) )
                 ret = -EFAULT;
@@ -323,7 +323,7 @@ long arch_do_sysctl(
 
         /* Clip the number of entries. */
         nr = min_t(unsigned int, sysctl->u.cpu_featureset.nr_features,
-                   FSCAPINTS);
+                   X86_NR_FEAT);
 
         /* Look up requested featureset. */
         if ( sysctl->u.cpu_featureset.index < ARRAY_SIZE(policy_table) )
@@ -352,7 +352,7 @@ long arch_do_sysctl(
             ret = -EFAULT;
 
         /* Inform the caller if there was more data to provide. */
-        if ( !ret && nr < FSCAPINTS )
+        if ( !ret && nr < X86_NR_FEAT )
             ret = -ENOBUFS;
 
         break;
-- 
2.30.2


