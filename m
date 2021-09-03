Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAFB4001C3
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 17:08:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178186.324107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMAo2-00039b-JW; Fri, 03 Sep 2021 15:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178186.324107; Fri, 03 Sep 2021 15:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMAo2-00036V-Fk; Fri, 03 Sep 2021 15:08:38 +0000
Received: by outflank-mailman (input) for mailman id 178186;
 Fri, 03 Sep 2021 15:08:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yFRs=NZ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mMAo1-00020o-7E
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 15:08:37 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c88d6a5e-0cc8-11ec-af2e-12813bfff9fa;
 Fri, 03 Sep 2021 15:08:24 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1630681609048555.1692564591247;
 Fri, 3 Sep 2021 08:06:49 -0700 (PDT)
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
X-Inumbo-ID: c88d6a5e-0cc8-11ec-af2e-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1630681615; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gW6P5jBpju7RaplNSLoo/QOOJyGDhIhA3hMpxMZwgliJhH2vQT34hWZXiikGXZIL5myeJE1aywU04Yp67H9v2WXSdHRe0cWzK6H+MYvJ3AvcggaoZW8BULAypKN8lUPSvl+soM5OUANE4FhbXTFcIeTpxM4WQYzUR6qf1ymtwso=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1630681615; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=EWTwq6nNcnfro7pqzmCHy9mDrCWwYOniEdIAUXfrX50=; 
	b=e/fzjYuPWVBzdWlMzbTgVXAMhEFLd+n6Kv38RzMPakdtPYiwd7E9FGXmZgVqe9SC7oRtcFR0N9gO0rrSQ3vm9s1vc6hduEDZ8xCu9t6l8LV+Yktfy6r9z4iqRIfrBSiwsa35kkuV0o30u/5caWiftxxEeN3DvZndmnFgOj7YH5Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1630681615;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=EWTwq6nNcnfro7pqzmCHy9mDrCWwYOniEdIAUXfrX50=;
	b=t2tWHwtGCWiWfkWZAHE1fPkFWJXbbeiD1drHgc8RnY3cvt5Ntwldy2WRmiDvco48
	xM74PJM63Exn/TiIqx4iwiNKetM/ZS5wkQ5ZyD1mPamhulPF3C+3lDl0dOiznQNPSmC
	vWX13+lZv96YbP69XJpBW/Rk9K0lxqor5aUiTmfM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v4 10/11] kconfig: update xsm config to reflect reality
Date: Fri,  3 Sep 2021 15:06:28 -0400
Message-Id: <20210903190629.11917-11-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210903190629.11917-1-dpsmith@apertussolutions.com>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

It has been a very long time since XSM Flask was the only XSM module, yet the
concenpt of turning XSM on/off continues to be synonymous with enabling and
disabling XSM Flask. Even when XSM Flask was the only module, turning XSM
on/off did not disable or remove the XSM hooks but simply controlled whether
they were implemented as direct inline functions or dispatch calls.

This commit updates XSM kconfig to ensure that it is clear in the code as well
to the user, via the help messages, that the option is about configuring which
XSM policy module(s) are available and which is the default.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/Kconfig         | 49 ++++++++++++++++++--------------------
 xen/include/xen/sched.h    |  2 +-
 xen/include/xsm/dummy.h    | 23 +++++++++---------
 xen/include/xsm/xsm-core.h |  6 ++---
 xen/include/xsm/xsm.h      |  6 ++---
 xen/xsm/Makefile           |  4 ++--
 xen/xsm/xsm_core.c         |  4 ++--
 7 files changed, 46 insertions(+), 48 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index ac5491b1cc..2f85538920 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -200,23 +200,20 @@ config XENOPROF
 
 	  If unsure, say Y.
 
-config XSM
-	bool "Xen Security Modules support"
+config XSM_CONFIGURABLE
+	bool "Configure Xen Security Modules"
 	default ARM
-	---help---
-	  Enables the security framework known as Xen Security Modules which
-	  allows administrators fine-grained control over a Xen domain and
-	  its capabilities by defining permissible interactions between domains,
-	  the hypervisor itself, and related resources such as memory and
-	  devices.
+	help
+	  Allows for configuring the Xen Security Modules (XSM) policy or policies
+	  modules that will be availble and which will be the default.
 
 	  If unsure, say N.
 
 config XSM_FLASK
-	def_bool y
-	prompt "FLux Advanced Security Kernel support"
-	depends on XSM
-	---help---
+	bool "FLux Advanced Security Kernel support"
+	depends on XSM_CONFIGURABLE
+	select XSM_EVTCHN_LABELING
+	help
 	  Enables FLASK (FLux Advanced Security Kernel) as the access control
 	  mechanism used by the XSM framework.  This provides a mandatory access
 	  control framework by which security enforcement, isolation, and
@@ -226,10 +223,10 @@ config XSM_FLASK
 	  If unsure, say Y.
 
 config XSM_FLASK_AVC_STATS
-	def_bool y
-	prompt "Maintain statistics on the FLASK access vector cache" if EXPERT
+	bool "Maintain statistics on the FLASK access vector cache" if EXPERT
+	default y
 	depends on XSM_FLASK
-	---help---
+	help
 	  Maintain counters on the access vector cache that can be viewed using
 	  the FLASK_AVC_CACHESTATS sub-op of the xsm_op hypercall.  Disabling
 	  this will save a tiny amount of memory and time to update the stats.
@@ -240,7 +237,7 @@ config XSM_FLASK_POLICY
 	bool "Compile Xen with a built-in FLASK security policy"
 	default y if "$(XEN_HAS_CHECKPOLICY)" = "y"
 	depends on XSM_FLASK
-	---help---
+	help
 	  This includes a default XSM policy in the hypervisor so that the
 	  bootloader does not need to load a policy to get sane behavior from an
 	  XSM-enabled hypervisor.  If this is disabled, a policy must be
@@ -253,10 +250,10 @@ config XSM_FLASK_POLICY
 	  If unsure, say Y.
 
 config XSM_SILO
-	def_bool y
-	prompt "SILO support"
-	depends on XSM
-	---help---
+	bool "SILO support"
+	default y if ARM
+	depends on XSM_CONFIGURABLE
+	help
 	  Enables SILO as the access control mechanism used by the XSM framework.
 	  This is not the default module, add boot parameter xsm=silo to choose
 	  it. This will deny any unmediated communication channels (grant tables
@@ -265,14 +262,14 @@ config XSM_SILO
 	  If unsure, say Y.
 
 choice
-	prompt "Default XSM implementation"
-	depends on XSM
+	prompt "Default XSM module"
+	depends on XSM_CONFIGURABLE
 	default XSM_SILO_DEFAULT if XSM_SILO && ARM
 	default XSM_FLASK_DEFAULT if XSM_FLASK
 	default XSM_SILO_DEFAULT if XSM_SILO
 	default XSM_DUMMY_DEFAULT
 	config XSM_DUMMY_DEFAULT
-		bool "Match non-XSM behavior"
+		bool "Classic Dom0 behavior"
 	config XSM_FLASK_DEFAULT
 		bool "FLux Advanced Security Kernel" if XSM_FLASK
 	config XSM_SILO_DEFAULT
@@ -282,15 +279,15 @@ endchoice
 config LATE_HWDOM
 	bool "Dedicated hardware domain"
 	default n
-	depends on XSM && X86
-	---help---
+	depends on XSM_FLASK && X86
+	help
 	  Allows the creation of a dedicated hardware domain distinct from
 	  domain 0 that manages devices without needing access to other
 	  privileged functionality such as the ability to manage domains.
 	  This requires that the actual domain 0 be a stub domain that
 	  constructs the actual hardware domain instead of initializing the
 	  hardware itself.  Because the hardware domain needs access to
-	  hypercalls not available to unprivileged guests, an XSM policy
+	  hypercalls not available to unprivileged guests, an XSM Flask policy
 	  is required to properly define the privilege of these domains.
 
 	  This feature does nothing if the "hardware_dom" boot parameter is
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index e56690cd2b..a61586d8b6 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -120,7 +120,7 @@ struct evtchn
     unsigned short notify_vcpu_id; /* VCPU for local delivery notification */
     uint32_t fifo_lastq;           /* Data for identifying last queue. */
 
-#ifdef CONFIG_XSM
+#ifdef CONFIG_XSM_CONFIGURABLE
     union {
         /*
          * If an XSM module needs more space for its event channel context,
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 78d0b7d07a..d2a005c521 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -42,12 +42,12 @@ static inline void __xsm_action_mismatch_detected(void)
 void __xsm_action_mismatch_detected(void);
 #endif
 
-#ifdef CONFIG_XSM
+#ifdef CONFIG_XSM_CONFIGURABLE
 
-/* In CONFIG_XSM builds, this header file is included from xsm/dummy.c, and
- * contains static (not inline) functions compiled to the dummy XSM module.
- * There is no xsm_default_t argument available, so the value from the assertion
- * is used to initialize the variable.
+/* In CONFIG_XSM_CONFIGURABLE builds, this header file is included from
+ * xsm/dummy.c, and contains static (not inline) functions compiled to the
+ * dummy XSM module.  There is no xsm_default_t argument available, so the
+ * value from the assertion is used to initialize the variable.
  */
 #define XSM_INLINE __maybe_unused
 
@@ -55,19 +55,20 @@ void __xsm_action_mismatch_detected(void);
 #define XSM_DEFAULT_VOID void
 #define XSM_ASSERT_ACTION(def) xsm_default_t action = def; (void)action
 
-#else /* CONFIG_XSM */
+#else /* CONFIG_XSM_CONFIGURABLE */
 
-/* In !CONFIG_XSM builds, this header file is included from xsm/xsm.h, and
- * contains inline functions for each XSM hook. These functions also perform
- * compile-time checks on the xsm_default_t argument to ensure that the behavior
- * of the dummy XSM module is the same as the behavior with XSM disabled.
+/* In !CONFIG_XSM_CONFIGURABLE builds, this header file is included from
+ * xsm/xsm.h, and contains inline functions for each XSM hook. These functions
+ * also perform compile-time checks on the xsm_default_t argument to ensure
+ * that the behavior of the dummy XSM module is the same as the behavior with
+ * XSM disabled.
  */
 #define XSM_INLINE always_inline
 #define XSM_DEFAULT_ARG xsm_default_t action,
 #define XSM_DEFAULT_VOID xsm_default_t action
 #define XSM_ASSERT_ACTION(def) LINKER_BUG_ON(def != action)
 
-#endif /* CONFIG_XSM */
+#endif /* CONFIG_XSM_CONFIGURABLE */
 
 static always_inline int xsm_default_action(xsm_default_t action,
                                             struct domain *src,
diff --git a/xen/include/xsm/xsm-core.h b/xen/include/xsm/xsm-core.h
index 4555e111dc..a80d6a981f 100644
--- a/xen/include/xsm/xsm-core.h
+++ b/xen/include/xsm/xsm-core.h
@@ -205,7 +205,7 @@ struct xsm_ops {
 
 void xsm_fixup_ops(struct xsm_ops *ops);
 
-#ifdef CONFIG_XSM
+#ifdef CONFIG_XSM_CONFIGURABLE
 
 #ifdef CONFIG_MULTIBOOT
 int xsm_multiboot_init(unsigned long *module_map,
@@ -247,7 +247,7 @@ static const inline struct xsm_ops *silo_init(void)
 }
 #endif
 
-#else /* CONFIG_XSM */
+#else /* CONFIG_XSM_CONFIGURABLE */
 
 #ifdef CONFIG_MULTIBOOT
 static inline int xsm_multiboot_init(unsigned long *module_map,
@@ -269,6 +269,6 @@ static inline bool has_xsm_magic(paddr_t start)
 }
 #endif /* CONFIG_HAS_DEVICE_TREE */
 
-#endif /* CONFIG_XSM */
+#endif /* CONFIG_XSM_CONFIGURABLE */
 
 #endif /* __XSM_CORE_H */
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 1517443173..4d5f441935 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -20,7 +20,7 @@
 #include <xen/multiboot.h>
 #include <xsm/xsm-core.h>
 
-#ifdef CONFIG_XSM
+#ifdef CONFIG_XSM_CONFIGURABLE
 
 extern struct xsm_ops xsm_ops;
 
@@ -598,10 +598,10 @@ static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 
 #endif /* CONFIG_ARGO */
 
-#else /* CONFIG_XSM */
+#else /* CONFIG_XSM_CONFIGURABLE */
 
 #include <xsm/dummy.h>
 
-#endif /* CONFIG_XSM */
+#endif /* CONFIG_XSM_CONFIGURABLE */
 
 #endif /* __XSM_H */
diff --git a/xen/xsm/Makefile b/xen/xsm/Makefile
index cf0a728f1c..09b9311b1d 100644
--- a/xen/xsm/Makefile
+++ b/xen/xsm/Makefile
@@ -1,6 +1,6 @@
 obj-y += xsm_core.o
-obj-$(CONFIG_XSM) += xsm_policy.o
-obj-$(CONFIG_XSM) += dummy.o
+obj-$(CONFIG_XSM_CONFIGURABLE) += xsm_policy.o
+obj-$(CONFIG_XSM_CONFIGURABLE) += dummy.o
 obj-$(CONFIG_XSM_SILO) += silo.o
 
 obj-$(CONFIG_XSM_FLASK) += flask/
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 112d11fa6a..87c2980459 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -18,7 +18,7 @@
 #include <xen/hypercall.h>
 #include <xsm/xsm.h>
 
-#ifdef CONFIG_XSM
+#ifdef CONFIG_XSM_CONFIGURABLE
 
 #ifdef CONFIG_MULTIBOOT
 #include <asm/setup.h>
@@ -227,7 +227,7 @@ bool __init has_xsm_magic(paddr_t start)
 }
 #endif
 
-#endif
+#endif /* CONFIG_XSM_CONFIGURABLE */
 
 long do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
-- 
2.20.1


