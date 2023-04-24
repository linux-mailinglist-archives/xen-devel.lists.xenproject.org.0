Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AA36EC5F6
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 08:03:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525073.816086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqpI6-0002FZ-KX; Mon, 24 Apr 2023 06:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525073.816086; Mon, 24 Apr 2023 06:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqpI6-0002C0-Et; Mon, 24 Apr 2023 06:03:10 +0000
Received: by outflank-mailman (input) for mailman id 525073;
 Mon, 24 Apr 2023 06:03:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhGg=AP=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pqpI4-0000mg-U7
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 06:03:08 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id aeab044f-e265-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 08:03:07 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 423E21691;
 Sun, 23 Apr 2023 23:03:50 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3E183F587;
 Sun, 23 Apr 2023 23:03:04 -0700 (PDT)
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
X-Inumbo-ID: aeab044f-e265-11ed-8611-37d641c3527e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 06/12] xen/common: add dom0 xen command line argument for Arm
Date: Mon, 24 Apr 2023 07:02:42 +0100
Message-Id: <20230424060248.1488859-7-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424060248.1488859-1-luca.fancellu@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently x86 defines a Xen command line argument dom0=<list> where
there can be specified dom0 controlling sub-options, to use it also
on Arm, move the code that loops through the list of arguments from
x86 to the common code and from there, call architecture specific
functions to handle the comma separated sub-options.

No functional changes are intended.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes from v5:
 - Add Bertrand R-by
Changes from v4:
 - return EINVAL in Arm implementation of parse_arch_dom0_param,
   shorten variable name in the funtion from str_begin, str_end to
   s, e. Removed variable rc from x86 parse_arch_dom0_param
   implementation. (Jan)
 - Add R-By Jan
Changes from v3:
 - new patch
---
 xen/arch/arm/domain_build.c |  5 ++++
 xen/arch/x86/dom0_build.c   | 48 ++++++++++++++-----------------------
 xen/common/domain.c         | 23 ++++++++++++++++++
 xen/include/xen/domain.h    |  1 +
 4 files changed, 47 insertions(+), 30 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index ffabe567ac3f..d9450416f665 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -60,6 +60,11 @@ static int __init parse_dom0_mem(const char *s)
 }
 custom_param("dom0_mem", parse_dom0_mem);
 
+int __init parse_arch_dom0_param(const char *s, const char *e)
+{
+    return -EINVAL;
+}
+
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 79234f18ff01..9f5300a3efbb 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -266,42 +266,30 @@ bool __initdata opt_dom0_pvh = !IS_ENABLED(CONFIG_PV);
 bool __initdata opt_dom0_verbose = IS_ENABLED(CONFIG_VERBOSE_DEBUG);
 bool __initdata opt_dom0_msr_relaxed;
 
-static int __init cf_check parse_dom0_param(const char *s)
+int __init parse_arch_dom0_param(const char *s, const char *e)
 {
-    const char *ss;
-    int rc = 0;
+    int val;
 
-    do {
-        int val;
-
-        ss = strchr(s, ',');
-        if ( !ss )
-            ss = strchr(s, '\0');
-
-        if ( IS_ENABLED(CONFIG_PV) && !cmdline_strcmp(s, "pv") )
-            opt_dom0_pvh = false;
-        else if ( IS_ENABLED(CONFIG_HVM) && !cmdline_strcmp(s, "pvh") )
-            opt_dom0_pvh = true;
+    if ( IS_ENABLED(CONFIG_PV) && !cmdline_strcmp(s, "pv") )
+        opt_dom0_pvh = false;
+    else if ( IS_ENABLED(CONFIG_HVM) && !cmdline_strcmp(s, "pvh") )
+        opt_dom0_pvh = true;
 #ifdef CONFIG_SHADOW_PAGING
-        else if ( (val = parse_boolean("shadow", s, ss)) >= 0 )
-            opt_dom0_shadow = val;
+    else if ( (val = parse_boolean("shadow", s, e)) >= 0 )
+        opt_dom0_shadow = val;
 #endif
-        else if ( (val = parse_boolean("verbose", s, ss)) >= 0 )
-            opt_dom0_verbose = val;
-        else if ( IS_ENABLED(CONFIG_PV) &&
-                  (val = parse_boolean("cpuid-faulting", s, ss)) >= 0 )
-            opt_dom0_cpuid_faulting = val;
-        else if ( (val = parse_boolean("msr-relaxed", s, ss)) >= 0 )
-            opt_dom0_msr_relaxed = val;
-        else
-            rc = -EINVAL;
-
-        s = ss + 1;
-    } while ( *ss );
+    else if ( (val = parse_boolean("verbose", s, e)) >= 0 )
+        opt_dom0_verbose = val;
+    else if ( IS_ENABLED(CONFIG_PV) &&
+              (val = parse_boolean("cpuid-faulting", s, e)) >= 0 )
+        opt_dom0_cpuid_faulting = val;
+    else if ( (val = parse_boolean("msr-relaxed", s, e)) >= 0 )
+        opt_dom0_msr_relaxed = val;
+    else
+        return -EINVAL;
 
-    return rc;
+    return 0;
 }
-custom_param("dom0", parse_dom0_param);
 
 static char __initdata opt_dom0_ioports_disable[200] = "";
 string_param("dom0_ioports_disable", opt_dom0_ioports_disable);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 626debbae095..7779ba088675 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -364,6 +364,29 @@ static int __init cf_check parse_extra_guest_irqs(const char *s)
 }
 custom_param("extra_guest_irqs", parse_extra_guest_irqs);
 
+static int __init cf_check parse_dom0_param(const char *s)
+{
+    const char *ss;
+    int rc = 0;
+
+    do {
+        int ret;
+
+        ss = strchr(s, ',');
+        if ( !ss )
+            ss = strchr(s, '\0');
+
+        ret = parse_arch_dom0_param(s, ss);
+        if ( ret && !rc )
+            rc = ret;
+
+        s = ss + 1;
+    } while ( *ss );
+
+    return rc;
+}
+custom_param("dom0", parse_dom0_param);
+
 /*
  * Release resources held by a domain.  There may or may not be live
  * references to the domain, and it may or may not be fully constructed.
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 26f9c4f6dd5b..1df8f933d076 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -16,6 +16,7 @@ typedef union {
 struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id);
 
 unsigned int dom0_max_vcpus(void);
+int parse_arch_dom0_param(const char *s, const char *e);
 struct vcpu *alloc_dom0_vcpu0(struct domain *dom0);
 
 int vcpu_reset(struct vcpu *);
-- 
2.34.1


