Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF86F70D577
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 09:43:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538274.838181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1MgP-0005GS-Ii; Tue, 23 May 2023 07:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538274.838181; Tue, 23 May 2023 07:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1MgP-0005CB-Cg; Tue, 23 May 2023 07:43:49 +0000
Received: by outflank-mailman (input) for mailman id 538274;
 Tue, 23 May 2023 07:43:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqVG=BM=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1q1MgN-0003Zx-Bu
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 07:43:47 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 8bce095a-f93d-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 09:43:45 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1261F153B;
 Tue, 23 May 2023 00:44:30 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B58313F762;
 Tue, 23 May 2023 00:43:43 -0700 (PDT)
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
X-Inumbo-ID: 8bce095a-f93d-11ed-8611-37d641c3527e
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
Subject: [PATCH v7 07/12] xen: enable Dom0 to use SVE feature
Date: Tue, 23 May 2023 08:43:21 +0100
Message-Id: <20230523074326.3035745-8-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230523074326.3035745-1-luca.fancellu@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
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
Changes from v6:
 - Fixed case for e==NULL in parse_signed_integer, drop parenthesis
   from if conditions, delete inline sve_domctl_vl_param and rely on
   DCE from the compiler (Jan)
 - Drop parenthesis from opt_dom0_sve (Julien)
 - Do not continue if 'sve' is in command line args but
   CONFIG_ARM64_SVE is not selected:
   https://lore.kernel.org/all/7614AE25-F59D-430A-9C3E-30B1CE0E1580@arm.com/
Changes from v5:
 - stop the domain if VL error occurs (Julien, Bertrand)
 - update the documentation
 - Rename sve_sanitize_vl_param to sve_domctl_vl_param to
   mark the fact that we are sanitizing a parameter coming from
   the user before encoding it into sve_vl in domctl structure.
   (suggestion from Bertrand in a separate discussion)
 - update comment in parse_signed_integer, return boolean in
   sve_domctl_vl_param (Jan).
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
 docs/misc/xen-command-line.pandoc    | 20 ++++++++++++++++++--
 xen/arch/arm/arm64/sve.c             | 20 ++++++++++++++++++++
 xen/arch/arm/domain_build.c          | 26 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/sve.h | 10 ++++++++++
 xen/common/kernel.c                  | 28 ++++++++++++++++++++++++++++
 xen/include/xen/lib.h                | 10 ++++++++++
 6 files changed, 112 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index e0b89b7d3319..47e5b4eb6199 100644
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
 
@@ -838,6 +838,22 @@ Controls for how dom0 is constructed on x86 systems.
 
     If using this option is necessary to fix an issue, please report a bug.
 
+Enables features on dom0 on Arm systems.
+
+*   The `sve` integer parameter enables Arm SVE usage for Dom0 domain and sets
+    the maximum SVE vector length, the option is applicable only to AArch64
+    guests.
+    A value equal to 0 disables the feature, this is the default value.
+    Values below 0 means the feature uses the maximum SVE vector length
+    supported by hardware, if SVE is supported.
+    Values above 0 explicitly set the maximum SVE vector length for Dom0,
+    allowed values are from 128 to maximum 2048, being multiple of 128.
+    Please note that when the user explicitly specifies the value, if that value
+    is above the hardware supported maximum SVE vector length, the domain
+    creation will fail and the system will stop, the same will occur if the
+    option is provided with a non zero value, but the platform doesn't support
+    SVE.
+
 ### dom0-cpuid
     = List of comma separated booleans
 
diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
index 84a6dedc1fd7..feaca2cf647d 100644
--- a/xen/arch/arm/arm64/sve.c
+++ b/xen/arch/arm/arm64/sve.c
@@ -13,6 +13,9 @@
 #include <asm/processor.h>
 #include <asm/system.h>
 
+/* opt_dom0_sve: allow Dom0 to use SVE and set maximum vector length. */
+int __initdata opt_dom0_sve;
+
 extern unsigned int sve_get_hw_vl(void);
 
 /*
@@ -152,6 +155,23 @@ void sve_restore_state(struct vcpu *v)
     sve_load_ctx(v->arch.vfp.sve_zreg_ctx_end, v->arch.vfp.fpregs, 1);
 }
 
+bool __init sve_domctl_vl_param(int val, unsigned int *out)
+{
+    /*
+     * Negative SVE parameter value means to use the maximum supported
+     * vector length, otherwise if a positive value is provided, check if the
+     * vector length is a multiple of 128
+     */
+    if ( val < 0 )
+        *out = get_sys_vl_len();
+    else if ( (val % SVE_VL_MULTIPLE_VAL) == 0 )
+        *out = val;
+    else
+        return false;
+
+    return true;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f373a5024783..9202a96d9c28 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -62,6 +62,22 @@ custom_param("dom0_mem", parse_dom0_mem);
 
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
+
+        return 0;
+#else
+        panic("'sve' property found, but CONFIG_ARM64_SVE not selected");
+#endif
+    }
+
     return -EINVAL;
 }
 
@@ -4113,6 +4129,16 @@ void __init create_dom0(void)
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
+    if ( opt_dom0_sve )
+    {
+        unsigned int vl;
+
+        if ( sve_domctl_vl_param(opt_dom0_sve, &vl) )
+            dom0_cfg.arch.sve_vl = sve_encode_vl(vl);
+        else
+            panic("SVE vector length error\n");
+    }
+
     dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
     if ( IS_ERR(dom0) )
         panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
diff --git a/xen/arch/arm/include/asm/arm64/sve.h b/xen/arch/arm/include/asm/arm64/sve.h
index 65b46685d263..a71d6a295dcc 100644
--- a/xen/arch/arm/include/asm/arm64/sve.h
+++ b/xen/arch/arm/include/asm/arm64/sve.h
@@ -21,14 +21,22 @@ static inline unsigned int sve_decode_vl(unsigned int sve_vl)
     return sve_vl * SVE_VL_MULTIPLE_VAL;
 }
 
+static inline unsigned int sve_encode_vl(unsigned int sve_vl_bits)
+{
+    return sve_vl_bits / SVE_VL_MULTIPLE_VAL;
+}
+
 register_t compute_max_zcr(void);
 int sve_context_init(struct vcpu *v);
 void sve_context_free(struct vcpu *v);
 void sve_save_state(struct vcpu *v);
 void sve_restore_state(struct vcpu *v);
+bool sve_domctl_vl_param(int val, unsigned int *out);
 
 #ifdef CONFIG_ARM64_SVE
 
+extern int opt_dom0_sve;
+
 static inline bool is_sve_domain(const struct domain *d)
 {
     return d->arch.sve_vl > 0;
@@ -38,6 +46,8 @@ unsigned int get_sys_vl_len(void);
 
 #else /* !CONFIG_ARM64_SVE */
 
+#define opt_dom0_sve     0
+
 static inline bool is_sve_domain(const struct domain *d)
 {
     return false;
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index f7b1f65f373c..7cd00a4c999a 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -314,6 +314,34 @@ int parse_boolean(const char *name, const char *s, const char *e)
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
+    if ( !e )
+        e = s + slen;
+
+    /* Check that this is the name we're looking for and a value was provided */
+    if ( slen <= nlen || strncmp(s, name, nlen) || s[nlen] != '=' )
+        return -1;
+
+    pval = simple_strtoll(&s[nlen + 1], &str, 10);
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


