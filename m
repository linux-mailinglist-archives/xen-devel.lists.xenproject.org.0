Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0661D6DF0FA
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 11:50:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520096.807399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmX74-0006aG-L5; Wed, 12 Apr 2023 09:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520096.807399; Wed, 12 Apr 2023 09:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmX74-0006TF-D7; Wed, 12 Apr 2023 09:50:02 +0000
Received: by outflank-mailman (input) for mailman id 520096;
 Wed, 12 Apr 2023 09:50:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eFOG=AD=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pmX72-0004lU-CY
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 09:50:00 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 635adcb8-d917-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 11:49:59 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64ED8C14;
 Wed, 12 Apr 2023 02:50:43 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2CE13F587;
 Wed, 12 Apr 2023 02:49:57 -0700 (PDT)
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
X-Inumbo-ID: 635adcb8-d917-11ed-b21e-6b7b168915f2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Date: Wed, 12 Apr 2023 10:49:33 +0100
Message-Id: <20230412094938.2693890-8-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412094938.2693890-1-luca.fancellu@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a command line parameter to allow Dom0 the use of SVE resources,
the command line parameter sve=<integer>, sub argument of dom0=,
controls the feature on this domain and sets the maximum SVE vector
length for Dom0.

Add a new function, parse_signed_integer(), to parse an integer
command line argument.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v4:
 - Negative values as user param means max supported HW VL (Jan)
 - update documentation, make use of no_config_param(), rename
   parse_integer into parse_signed_integer and take long long *,
   also put a comment on the -2 return condition, update
   declaration comment to reflect the modifications (Jan)
Changes from v3:
 - Don't use fixed len types when not needed (Jan)
 - renamed domainconfig_encode_vl to sve_encode_vl
 - Use a sub argument of dom0= to enable the feature (Jan)
 - Add parse_integer() function
Changes from v2:
 - xen_domctl_createdomain field has changed into sve_vl and its
   value now is the VL / 128, create an helper function for that.
Changes from v1:
 - No changes
Changes from RFC:
 - Changed docs to explain that the domain won't be created if the
   requested vector length is above the supported one from the
   platform.
---
 docs/misc/xen-command-line.pandoc    | 18 ++++++++++++++++--
 xen/arch/arm/arm64/sve.c             | 21 +++++++++++++++++++++
 xen/arch/arm/domain_build.c          | 27 +++++++++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/sve.h | 15 +++++++++++++++
 xen/common/kernel.c                  | 25 +++++++++++++++++++++++++
 xen/include/xen/lib.h                | 10 ++++++++++
 6 files changed, 114 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index e0b89b7d3319..9c0790ce6c7c 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -777,9 +777,9 @@ Specify the bit width of the DMA heap.
 
 ### dom0
     = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
-                cpuid-faulting=<bool>, msr-relaxed=<bool> ]
+                cpuid-faulting=<bool>, msr-relaxed=<bool> ] (x86)
 
-    Applicability: x86
+    = List of [ sve=<integer> ] (Arm)
 
 Controls for how dom0 is constructed on x86 systems.
 
@@ -838,6 +838,20 @@ Controls for how dom0 is constructed on x86 systems.
 
     If using this option is necessary to fix an issue, please report a bug.
 
+Enables features on dom0 on Arm systems.
+
+*   The `sve` integer parameter enables Arm SVE usage for Dom0 domain and sets
+    the maximum SVE vector length.
+    A value equal to 0 disables the feature, this is the default value.
+    Values below 0 means the feature uses the maximum SVE vector length
+    supported by hardware, please be aware that if the hardware doesn't supports
+    SVE, the feature remains disabled.
+    Values above 0 explicitly set the maximum SVE vector length for Dom0,
+    allowed values are from 128 to maximum 2048, being multiple of 128.
+    Please note that when the user explicitly specify the value, if that value
+    is above the hardware supported maximum SVE vector length, the domain
+    creation will fail and the system will stop.
+
 ### dom0-cpuid
     = List of comma separated booleans
 
diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
index 5485648850a0..ad5db62e1805 100644
--- a/xen/arch/arm/arm64/sve.c
+++ b/xen/arch/arm/arm64/sve.c
@@ -9,6 +9,9 @@
 #include <xen/sizes.h>
 #include <asm/arm64/sve.h>
 
+/* opt_dom0_sve: allow Dom0 to use SVE and set maximum vector length. */
+int __initdata opt_dom0_sve;
+
 extern unsigned int sve_get_hw_vl(void);
 extern void sve_save_ctx(uint64_t *sve_ctx, uint64_t *pregs, int save_ffr);
 extern void sve_load_ctx(uint64_t const *sve_ctx, uint64_t const *pregs,
@@ -118,3 +121,21 @@ void sve_restore_state(struct vcpu *v)
 
     sve_load_ctx(sve_ctx_zreg_end, v->arch.vfp.fpregs, 1);
 }
+
+int __init sve_sanitize_vl_param(int val, unsigned int *out)
+{
+    /*
+     * Negative SVE parameter value means to use the maximum supported
+     * vector length, otherwise if a positive value is provided, check if the
+     * vector length is a multiple of 128 and not bigger than the maximum value
+     * 2048
+     */
+    if ( val < 0 )
+        *out = get_sys_vl_len();
+    else if ( ((val % SVE_VL_MULTIPLE_VAL) == 0) && (val <= SVE_VL_MAX_BITS) )
+        *out = val;
+    else
+        return -1;
+
+    return 0;
+}
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index eeb4662f0eee..3f30ef5c37b6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -26,6 +26,7 @@
 #include <asm/platform.h>
 #include <asm/psci.h>
 #include <asm/setup.h>
+#include <asm/arm64/sve.h>
 #include <asm/cpufeature.h>
 #include <asm/domain_build.h>
 #include <xen/event.h>
@@ -61,6 +62,21 @@ custom_param("dom0_mem", parse_dom0_mem);
 
 int __init parse_arch_dom0_param(const char *s, const char *e)
 {
+    long long val;
+
+    if ( !parse_signed_integer("sve", s, e, &val) )
+    {
+#ifdef CONFIG_ARM64_SVE
+        if ( (val >= INT_MIN) && (val <= INT_MAX) )
+            opt_dom0_sve = val;
+        else
+            printk(XENLOG_INFO "'sve=%lld' value out of range!\n", val);
+#else
+        no_config_param("ARM64_SVE", "sve", s, e);
+#endif
+        return 0;
+    }
+
     return -EINVAL;
 }
 
@@ -4109,6 +4125,17 @@ void __init create_dom0(void)
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
+    if ( opt_dom0_sve )
+    {
+        unsigned int vl;
+
+        if ( !sve_sanitize_vl_param(opt_dom0_sve, &vl) )
+            dom0_cfg.arch.sve_vl = sve_encode_vl(vl);
+        else
+            printk(XENLOG_WARNING
+                   "SVE vector length error, disable feature for Dom0\n");
+    }
+
     dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
     if ( IS_ERR(dom0) )
         panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/asm/arm64/sve.h
index fc162c9d2cf7..f1801876b5de 100644
--- a/xen/arch/arm/include/asm/arm64/sve.h
+++ b/xen/arch/arm/include/asm/arm64/sve.h
@@ -19,8 +19,15 @@ static inline unsigned int sve_decode_vl(unsigned int sve_vl)
     return sve_vl * SVE_VL_MULTIPLE_VAL;
 }
 
+static inline unsigned int sve_encode_vl(unsigned int sve_vl_bits)
+{
+    return sve_vl_bits / SVE_VL_MULTIPLE_VAL;
+}
+
 #ifdef CONFIG_ARM64_SVE
 
+extern int opt_dom0_sve;
+
 register_t compute_max_zcr(void);
 register_t vl_to_zcr(unsigned int vl);
 unsigned int get_sys_vl_len(void);
@@ -28,9 +35,12 @@ int sve_context_init(struct vcpu *v);
 void sve_context_free(struct vcpu *v);
 void sve_save_state(struct vcpu *v);
 void sve_restore_state(struct vcpu *v);
+int sve_sanitize_vl_param(int val, unsigned int *out);
 
 #else /* !CONFIG_ARM64_SVE */
 
+#define opt_dom0_sve (0)
+
 static inline register_t compute_max_zcr(void)
 {
     return 0;
@@ -55,6 +65,11 @@ static inline void sve_context_free(struct vcpu *v) {}
 static inline void sve_save_state(struct vcpu *v) {}
 static inline void sve_restore_state(struct vcpu *v) {}
 
+static inline int sve_sanitize_vl_param(int val, unsigned int *out)
+{
+    return -1;
+}
+
 #endif /* CONFIG_ARM64_SVE */
 
 #endif /* _ARM_ARM64_SVE_H */
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index f7b1f65f373c..29d05282c8bb 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -314,6 +314,31 @@ int parse_boolean(const char *name, const char *s, const char *e)
     return -1;
 }
 
+int __init parse_signed_integer(const char *name, const char *s, const char *e,
+                                long long *val)
+{
+    size_t slen, nlen;
+    const char *str;
+    long long pval;
+
+    slen = e ? ({ ASSERT(e >= s); e - s; }) : strlen(s);
+    nlen = strlen(name);
+
+    /* Does s start with name or contains only the name? */
+    if ( (slen <= nlen) || strncmp(s, name, nlen) || (s[nlen] != '=') )
+        return -1;
+
+    pval = simple_strtoll(&s[nlen + 1], &str, 0);
+
+    /* Number not recognised */
+    if ( str != e )
+        return -2;
+
+    *val = pval;
+
+    return 0;
+}
+
 int cmdline_strcmp(const char *frag, const char *name)
 {
     for ( ; ; frag++, name++ )
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index e914ccade095..5343ee7a944a 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -94,6 +94,16 @@ int parse_bool(const char *s, const char *e);
  */
 int parse_boolean(const char *name, const char *s, const char *e);
 
+/**
+ * Given a specific name, parses a string of the form:
+ *   $NAME=<integer number>
+ * returning 0 and a value in val, for a recognised integer.
+ * Returns -1 for name not found, general errors, or -2 if name is found but
+ * not recognised number.
+ */
+int parse_signed_integer(const char *name, const char *s, const char *e,
+                         long long *val);
+
 /**
  * Very similar to strcmp(), but will declare a match if the NUL in 'name'
  * lines up with comma, colon, semicolon or equals in 'frag'.  Designed for
-- 
2.34.1


