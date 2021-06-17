Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D323ABF97
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 01:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144244.265556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu1XM-0006qF-F5; Thu, 17 Jun 2021 23:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144244.265556; Thu, 17 Jun 2021 23:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu1XM-0006oP-BB; Thu, 17 Jun 2021 23:35:04 +0000
Received: by outflank-mailman (input) for mailman id 144244;
 Thu, 17 Jun 2021 23:35:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uRdX=LL=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lu1XK-0006oF-Ab
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 23:35:02 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5185c99c-f8e0-46e3-bf11-24af8bc8a451;
 Thu, 17 Jun 2021 23:34:59 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1623972579340440.46145847027356;
 Thu, 17 Jun 2021 16:29:39 -0700 (PDT)
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
X-Inumbo-ID: 5185c99c-f8e0-46e3-bf11-24af8bc8a451
ARC-Seal: i=1; a=rsa-sha256; t=1623972581; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JGIPK+loENL3gc2sisv/9P2ZWHcI/9TKvMcOT2By6qbjMqoxlbj4XZDqPqxvrablqk/2jR2N+g2fwrYA5f0Sf6t01vP3pthcZbxEAzLUMa5FlVpzWBY2gsPl0IKmHIA0tzlIPAKd7J85YQWusY07kLkzGgs9FZaIicBqhTXzbmw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1623972581; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Ws54z3pzlC/09NQsHviuPwGiXz3verlYYxDyxYgoCQg=; 
	b=FuDY/Zhrieenj6FWF1vF1ndAKH+8r/9vL9hZcGlU4Kx+BYq3nO41u7wRhjQzxOJASMUm3rVozkVycb/OwQUFrzCPkmerMTvfmmu+gD1grEXLXF/Q8xhwYiU1m6XqrTerdoGaysH3qGW4f7xA6h3oDwi118c3WjTaBeh9Qo2nTq4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1623972581;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Ws54z3pzlC/09NQsHviuPwGiXz3verlYYxDyxYgoCQg=;
	b=bUFSVtr+adxQN7bFBNMNvm2AHEihwqH2q7chdhKwvE9Atm87n8Yi3CzL9WPchI+y
	hQKHFo7JOsNXYyIgbIGc5VnLkeFUuZclmmgpnjIO+1KglsFxz7irz5/E0m/FGbNgB/K
	2g0fSvP9ctzivFhwe18gvyCsh+ut77UGAgFQlxak=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Tim Deegan <tim@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Paul Durrant <paul@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	persaur@gmail.com,
	christopher.w.clark@gmail.com,
	adam.schwalm@starlab.io,
	scott.davis@starlab.io
Subject: [PATCH 3/6] xsm: enabling xsm to always be included
Date: Thu, 17 Jun 2021 19:39:15 -0400
Message-Id: <20210617233918.10095-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617233918.10095-1-dpsmith@apertussolutions.com>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The only difference between !CONFIG_XSM and CONFIG_XSM with !CONFIG_XSM_SILO and !CONFIG_XSM_FLASK
is whether the XSM hooks in dummy.h are called as static inline functions or as function
pointers to static functions. As such this commit,
 * eliminates CONFIG_XSM
 * introduces CONFIG_XSM_EVTCHN_LABELING as replacement for enabling event channel labels
 * makes CONFIG_XSM_SILO AND CONFIG_XSM_FLASK default to no

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/Kconfig            |  55 ++++-----
 xen/include/xen/sched.h       |   2 +-
 xen/include/xsm/xsm-core.h    |  26 ----
 xen/include/xsm/xsm.h         |   8 --
 xen/xsm/Makefile              |   4 +-
 xen/xsm/dummy.c               |   4 +-
 xen/{include => }/xsm/dummy.h | 220 ++++++++++++++++------------------
 xen/xsm/silo.c                |  17 +--
 xen/xsm/xsm_core.c            |   4 -
 9 files changed, 142 insertions(+), 198 deletions(-)
 rename xen/{include => }/xsm/dummy.h (63%)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0ddd18e11a..203ad7ea23 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -197,22 +197,33 @@ config XENOPROF
 
 	  If unsure, say Y.
 
-config XSM
-	bool "Xen Security Modules support"
-	default ARM
-	---help---
-	  Enables the security framework known as Xen Security Modules which
-	  allows administrators fine-grained control over a Xen domain and
-	  its capabilities by defining permissible interactions between domains,
-	  the hypervisor itself, and related resources such as memory and
-	  devices.
+menu "Xen Security Modules"
 
-	  If unsure, say N.
+choice
+	prompt "Default XSM module"
+	default XSM_SILO_DEFAULT if XSM_SILO && ARM
+	default XSM_FLASK_DEFAULT if XSM_FLASK
+	default XSM_SILO_DEFAULT if XSM_SILO
+	default XSM_DUMMY_DEFAULT
+	config XSM_DUMMY_DEFAULT
+		bool "Match non-XSM behavior"
+	config XSM_FLASK_DEFAULT
+		bool "FLux Advanced Security Kernel" if XSM_FLASK
+	config XSM_SILO_DEFAULT
+		bool "SILO" if XSM_SILO
+endchoice
+
+config XSM_EVTCHN_LABELING
+	bool "Enables security labeling of event channels"
+	default n
+	---help---
+      This enables an XSM module to label and enforce access control over
+      event channels.
 
 config XSM_FLASK
-	def_bool y
+	def_bool n
 	prompt "FLux Advanced Security Kernel support"
-	depends on XSM
+	select XSM_EVTCHN_LABELING
 	---help---
 	  Enables FLASK (FLux Advanced Security Kernel) as the access control
 	  mechanism used by the XSM framework.  This provides a mandatory access
@@ -250,9 +261,8 @@ config XSM_FLASK_POLICY
 	  If unsure, say Y.
 
 config XSM_SILO
-	def_bool y
+	def_bool n
 	prompt "SILO support"
-	depends on XSM
 	---help---
 	  Enables SILO as the access control mechanism used by the XSM framework.
 	  This is not the default module, add boot parameter xsm=silo to choose
@@ -261,25 +271,12 @@ config XSM_SILO
 
 	  If unsure, say Y.
 
-choice
-	prompt "Default XSM implementation"
-	depends on XSM
-	default XSM_SILO_DEFAULT if XSM_SILO && ARM
-	default XSM_FLASK_DEFAULT if XSM_FLASK
-	default XSM_SILO_DEFAULT if XSM_SILO
-	default XSM_DUMMY_DEFAULT
-	config XSM_DUMMY_DEFAULT
-		bool "Match non-XSM behavior"
-	config XSM_FLASK_DEFAULT
-		bool "FLux Advanced Security Kernel" if XSM_FLASK
-	config XSM_SILO_DEFAULT
-		bool "SILO" if XSM_SILO
-endchoice
+endmenu
 
 config LATE_HWDOM
 	bool "Dedicated hardware domain"
 	default n
-	depends on XSM && X86
+	depends on XSM_FLASK && X86
 	---help---
 	  Allows the creation of a dedicated hardware domain distinct from
 	  domain 0 that manages devices without needing access to other
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 3982167144..e92d2cdeab 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -120,7 +120,7 @@ struct evtchn
     unsigned short notify_vcpu_id; /* VCPU for local delivery notification */
     uint32_t fifo_lastq;           /* Data for identifying last queue. */
 
-#ifdef CONFIG_XSM
+#ifdef CONFIG_XSM_EVTCHN_LABELING
     union {
 #ifdef XSM_NEED_GENERIC_EVTCHN_SSID
         /*
diff --git a/xen/include/xsm/xsm-core.h b/xen/include/xsm/xsm-core.h
index 5297c73fe6..e3718bc62d 100644
--- a/xen/include/xsm/xsm-core.h
+++ b/xen/include/xsm/xsm-core.h
@@ -189,8 +189,6 @@ struct xsm_operations {
 #endif
 };
 
-#ifdef CONFIG_XSM
-
 #ifdef CONFIG_MULTIBOOT
 extern int xsm_multiboot_init(unsigned long *module_map,
                               const multiboot_info_t *mbi);
@@ -235,28 +233,4 @@ extern void silo_init(void);
 static inline void silo_init(void) {}
 #endif
 
-#else /* CONFIG_XSM */
-
-#ifdef CONFIG_MULTIBOOT
-static inline int xsm_multiboot_init (unsigned long *module_map,
-                                      const multiboot_info_t *mbi)
-{
-    return 0;
-}
-#endif
-
-#ifdef CONFIG_HAS_DEVICE_TREE
-static inline int xsm_dt_init(void)
-{
-    return 0;
-}
-
-static inline bool has_xsm_magic(paddr_t start)
-{
-    return false;
-}
-#endif /* CONFIG_HAS_DEVICE_TREE */
-
-#endif /* CONFIG_XSM */
-
 #endif /* __XSM_CORE_H */
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index ecbdee2c7d..69f68300e2 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -22,8 +22,6 @@
 #include <xen/multiboot.h>
 #include <xsm/xsm-core.h>
 
-#ifdef CONFIG_XSM
-
 extern struct xsm_operations xsm_ops;
 
 static inline void xsm_security_domaininfo (struct domain *d,
@@ -559,10 +557,4 @@ static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 
 #endif /* CONFIG_ARGO */
 
-#else /* CONFIG_XSM */
-
-#include <xsm/dummy.h>
-
-#endif /* CONFIG_XSM */
-
 #endif /* __XSM_H */
diff --git a/xen/xsm/Makefile b/xen/xsm/Makefile
index cf0a728f1c..0059794dd5 100644
--- a/xen/xsm/Makefile
+++ b/xen/xsm/Makefile
@@ -1,6 +1,6 @@
 obj-y += xsm_core.o
-obj-$(CONFIG_XSM) += xsm_policy.o
-obj-$(CONFIG_XSM) += dummy.o
+obj-y += xsm_policy.o
+obj-y += dummy.o
 obj-$(CONFIG_XSM_SILO) += silo.o
 
 obj-$(CONFIG_XSM_FLASK) += flask/
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index de4d6cf2cf..bfd8b96f08 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -10,12 +10,12 @@
  *  as published by the Free Software Foundation.
  */
 
-#include <xsm/dummy.h>
+#include "dummy.h"
 
 #define set_to_dummy_if_null(ops, function)                            \
     do {                                                               \
         if ( !ops->function )                                          \
-            ops->function = xsm_##function;                            \
+            ops->function = dummy_##function;                          \
     } while (0)
 
 void __init xsm_fixup_ops (struct xsm_operations *ops)
diff --git a/xen/include/xsm/dummy.h b/xen/xsm/dummy.h
similarity index 63%
rename from xen/include/xsm/dummy.h
rename to xen/xsm/dummy.h
index c445c5681b..7e2bb09dac 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/xsm/dummy.h
@@ -42,12 +42,10 @@ static inline void __xsm_action_mismatch_detected(void)
 void __xsm_action_mismatch_detected(void);
 #endif
 
-#ifdef CONFIG_XSM
-
-/* In CONFIG_XSM builds, this header file is included from xsm/dummy.c, and
- * contains static (not inline) functions compiled to the dummy XSM module.
- * There is no xsm_default_t argument available, so the value from the assertion
- * is used to initialize the variable.
+/* This header file is included from xsm/dummy.c, and contains static (not
+ * inline) functions compiled to the dummy XSM module.  There is no
+ * xsm_default_t argument available, so the value from the assertion is used to
+ * initialize the variable.
  */
 #define XSM_INLINE __maybe_unused
 
@@ -55,20 +53,6 @@ void __xsm_action_mismatch_detected(void);
 #define XSM_DEFAULT_VOID void
 #define XSM_ASSERT_ACTION(def) xsm_default_t action = def; (void)action
 
-#else /* CONFIG_XSM */
-
-/* In !CONFIG_XSM builds, this header file is included from xsm/xsm.h, and
- * contains inline functions for each XSM hook. These functions also perform
- * compile-time checks on the xsm_default_t argument to ensure that the behavior
- * of the dummy XSM module is the same as the behavior with XSM disabled.
- */
-#define XSM_INLINE always_inline
-#define XSM_DEFAULT_ARG xsm_default_t action,
-#define XSM_DEFAULT_VOID xsm_default_t action
-#define XSM_ASSERT_ACTION(def) LINKER_BUG_ON(def != action)
-
-#endif /* CONFIG_XSM */
-
 static always_inline int xsm_default_action(
     xsm_default_t action, struct domain *src, struct domain *target)
 {
@@ -98,43 +82,43 @@ static always_inline int xsm_default_action(
     }
 }
 
-static XSM_INLINE void xsm_security_domaininfo(struct domain *d,
+static XSM_INLINE void dummy_security_domaininfo(struct domain *d,
                                     struct xen_domctl_getdomaininfo *info)
 {
     return;
 }
 
-static XSM_INLINE int xsm_domain_create(XSM_DEFAULT_ARG struct domain *d, u32 ssidref)
+static XSM_INLINE int dummy_domain_create(XSM_DEFAULT_ARG struct domain *d, u32 ssidref)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_getdomaininfo(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int dummy_getdomaininfo(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_domctl_scheduler_op(XSM_DEFAULT_ARG struct domain *d, int cmd)
+static XSM_INLINE int dummy_domctl_scheduler_op(XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_sysctl_scheduler_op(XSM_DEFAULT_ARG int cmd)
+static XSM_INLINE int dummy_sysctl_scheduler_op(XSM_DEFAULT_ARG int cmd)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_set_target(XSM_DEFAULT_ARG struct domain *d, struct domain *e)
+static XSM_INLINE int dummy_set_target(XSM_DEFAULT_ARG struct domain *d, struct domain *e)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_domctl(XSM_DEFAULT_ARG struct domain *d, int cmd)
+static XSM_INLINE int dummy_domctl(XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( cmd )
@@ -151,85 +135,85 @@ static XSM_INLINE int xsm_domctl(XSM_DEFAULT_ARG struct domain *d, int cmd)
     }
 }
 
-static XSM_INLINE int xsm_sysctl(XSM_DEFAULT_ARG int cmd)
+static XSM_INLINE int dummy_sysctl(XSM_DEFAULT_ARG int cmd)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_readconsole(XSM_DEFAULT_ARG uint32_t clear)
+static XSM_INLINE int dummy_readconsole(XSM_DEFAULT_ARG uint32_t clear)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_alloc_security_domain(struct domain *d)
+static XSM_INLINE int dummy_alloc_security_domain(struct domain *d)
 {
     return 0;
 }
 
-static XSM_INLINE void xsm_free_security_domain(struct domain *d)
+static XSM_INLINE void dummy_free_security_domain(struct domain *d)
 {
     return;
 }
 
-static XSM_INLINE int xsm_grant_mapref(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2,
+static XSM_INLINE int dummy_grant_mapref(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2,
                                                                 uint32_t flags)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_grant_unmapref(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int dummy_grant_unmapref(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_grant_setup(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int dummy_grant_setup(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_grant_transfer(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int dummy_grant_transfer(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_grant_copy(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int dummy_grant_copy(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_grant_query_size(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int dummy_grant_query_size(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_memory_exchange(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int dummy_memory_exchange(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_memory_adjust_reservation(XSM_DEFAULT_ARG struct domain *d1,
+static XSM_INLINE int dummy_memory_adjust_reservation(XSM_DEFAULT_ARG struct domain *d1,
                                                             struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_memory_stat_reservation(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int dummy_memory_stat_reservation(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_console_io(XSM_DEFAULT_ARG struct domain *d, int cmd)
+static XSM_INLINE int dummy_console_io(XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
     if ( d->is_console )
@@ -241,129 +225,129 @@ static XSM_INLINE int xsm_console_io(XSM_DEFAULT_ARG struct domain *d, int cmd)
     return xsm_default_action(XSM_PRIV, d, NULL);
 }
 
-static XSM_INLINE int xsm_profile(XSM_DEFAULT_ARG struct domain *d, int op)
+static XSM_INLINE int dummy_profile(XSM_DEFAULT_ARG struct domain *d, int op)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d, NULL);
 }
 
-static XSM_INLINE int xsm_kexec(XSM_DEFAULT_VOID)
+static XSM_INLINE int dummy_kexec(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_schedop_shutdown(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int dummy_schedop_shutdown(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_memory_pin_page(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2,
+static XSM_INLINE int dummy_memory_pin_page(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2,
                                           struct page_info *page)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_claim_pages(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int dummy_claim_pages(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_evtchn_unbound(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn,
+static XSM_INLINE int dummy_evtchn_unbound(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn,
                                          domid_t id2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_evtchn_interdomain(XSM_DEFAULT_ARG struct domain *d1, struct evtchn
+static XSM_INLINE int dummy_evtchn_interdomain(XSM_DEFAULT_ARG struct domain *d1, struct evtchn
                                 *chan1, struct domain *d2, struct evtchn *chan2)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE void xsm_evtchn_close_post(struct evtchn *chn)
+static XSM_INLINE void dummy_evtchn_close_post(struct evtchn *chn)
 {
     return;
 }
 
-static XSM_INLINE int xsm_evtchn_send(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
+static XSM_INLINE int dummy_evtchn_send(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d, NULL);
 }
 
-static XSM_INLINE int xsm_evtchn_status(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
+static XSM_INLINE int dummy_evtchn_status(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_evtchn_reset(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int dummy_evtchn_reset(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_alloc_security_evtchns(
+static XSM_INLINE int dummy_alloc_security_evtchns(
     struct evtchn chn[], unsigned int nr)
 {
     return 0;
 }
 
-static XSM_INLINE void xsm_free_security_evtchns(
+static XSM_INLINE void dummy_free_security_evtchns(
     struct evtchn chn[], unsigned int nr)
 {
     return;
 }
 
-static XSM_INLINE char *xsm_show_security_evtchn(struct domain *d, const struct evtchn *chn)
+static XSM_INLINE char *dummy_show_security_evtchn(struct domain *d, const struct evtchn *chn)
 {
     return NULL;
 }
 
-static XSM_INLINE int xsm_init_hardware_domain(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int dummy_init_hardware_domain(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_get_pod_target(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int dummy_get_pod_target(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_set_pod_target(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int dummy_set_pod_target(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_get_vnumainfo(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int dummy_get_vnumainfo(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-static XSM_INLINE int xsm_get_device_group(XSM_DEFAULT_ARG uint32_t machine_bdf)
+static XSM_INLINE int dummy_get_device_group(XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_assign_device(XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf)
+static XSM_INLINE int dummy_assign_device(XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_deassign_device(XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf)
+static XSM_INLINE int dummy_deassign_device(XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
@@ -372,14 +356,14 @@ static XSM_INLINE int xsm_deassign_device(XSM_DEFAULT_ARG struct domain *d, uint
 #endif /* HAS_PASSTHROUGH && HAS_PCI */
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
-static XSM_INLINE int xsm_assign_dtdevice(XSM_DEFAULT_ARG struct domain *d,
+static XSM_INLINE int dummy_assign_dtdevice(XSM_DEFAULT_ARG struct domain *d,
                                           const char *dtpath)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_deassign_dtdevice(XSM_DEFAULT_ARG struct domain *d,
+static XSM_INLINE int dummy_deassign_dtdevice(XSM_DEFAULT_ARG struct domain *d,
                                             const char *dtpath)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
@@ -388,134 +372,134 @@ static XSM_INLINE int xsm_deassign_dtdevice(XSM_DEFAULT_ARG struct domain *d,
 
 #endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
 
-static XSM_INLINE int xsm_resource_plug_core(XSM_DEFAULT_VOID)
+static XSM_INLINE int dummy_resource_plug_core(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_resource_unplug_core(XSM_DEFAULT_VOID)
+static XSM_INLINE int dummy_resource_unplug_core(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_resource_plug_pci(XSM_DEFAULT_ARG uint32_t machine_bdf)
+static XSM_INLINE int dummy_resource_plug_pci(XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_resource_unplug_pci(XSM_DEFAULT_ARG uint32_t machine_bdf)
+static XSM_INLINE int dummy_resource_unplug_pci(XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_resource_setup_pci(XSM_DEFAULT_ARG uint32_t machine_bdf)
+static XSM_INLINE int dummy_resource_setup_pci(XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_resource_setup_gsi(XSM_DEFAULT_ARG int gsi)
+static XSM_INLINE int dummy_resource_setup_gsi(XSM_DEFAULT_ARG int gsi)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_resource_setup_misc(XSM_DEFAULT_VOID)
+static XSM_INLINE int dummy_resource_setup_misc(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_page_offline(XSM_DEFAULT_ARG uint32_t cmd)
+static XSM_INLINE int dummy_page_offline(XSM_DEFAULT_ARG uint32_t cmd)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_hypfs_op(XSM_DEFAULT_VOID)
+static XSM_INLINE int dummy_hypfs_op(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
+static XSM_INLINE long dummy_do_xsm_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 {
     return -ENOSYS;
 }
 
 #ifdef CONFIG_COMPAT
-static XSM_INLINE int xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
+static XSM_INLINE int dummy_do_compat_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 {
     return -ENOSYS;
 }
 #endif
 
-static XSM_INLINE char *xsm_show_irq_sid(int irq)
+static XSM_INLINE char *dummy_show_irq_sid(int irq)
 {
     return NULL;
 }
 
-static XSM_INLINE int xsm_map_domain_pirq(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int dummy_map_domain_pirq(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_map_domain_irq(XSM_DEFAULT_ARG struct domain *d,
+static XSM_INLINE int dummy_map_domain_irq(XSM_DEFAULT_ARG struct domain *d,
                                          int irq, const void *data)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_unmap_domain_pirq(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int dummy_unmap_domain_pirq(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_bind_pt_irq(XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
+static XSM_INLINE int dummy_bind_pt_irq(XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_unbind_pt_irq(XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
+static XSM_INLINE int dummy_unbind_pt_irq(XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_unmap_domain_irq(XSM_DEFAULT_ARG struct domain *d,
+static XSM_INLINE int dummy_unmap_domain_irq(XSM_DEFAULT_ARG struct domain *d,
                                            int irq, const void *data)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_irq_permission(XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
+static XSM_INLINE int dummy_irq_permission(XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_iomem_permission(XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+static XSM_INLINE int dummy_iomem_permission(XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_iomem_mapping(XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+static XSM_INLINE int dummy_iomem_mapping(XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_pci_config_permission(XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf,
+static XSM_INLINE int dummy_pci_config_permission(XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf,
                                         uint16_t start, uint16_t end,
                                         uint8_t access)
 {
@@ -523,43 +507,43 @@ static XSM_INLINE int xsm_pci_config_permission(XSM_DEFAULT_ARG struct domain *d
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_add_to_physmap(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int dummy_add_to_physmap(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_remove_from_physmap(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int dummy_remove_from_physmap(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_map_gmfn_foreign(XSM_DEFAULT_ARG struct domain *d, struct domain *t)
+static XSM_INLINE int dummy_map_gmfn_foreign(XSM_DEFAULT_ARG struct domain *d, struct domain *t)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, t);
 }
 
-static XSM_INLINE int xsm_hvm_param(XSM_DEFAULT_ARG struct domain *d, unsigned long op)
+static XSM_INLINE int dummy_hvm_param(XSM_DEFAULT_ARG struct domain *d, unsigned long op)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_hvm_control(XSM_DEFAULT_ARG struct domain *d, unsigned long op)
+static XSM_INLINE int dummy_hvm_control(XSM_DEFAULT_ARG struct domain *d, unsigned long op)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_hvm_param_altp2mhvm(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int dummy_hvm_param_altp2mhvm(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_hvm_altp2mhvm_op(XSM_DEFAULT_ARG struct domain *d, uint64_t mode, uint32_t op)
+static XSM_INLINE int dummy_hvm_altp2mhvm_op(XSM_DEFAULT_ARG struct domain *d, uint64_t mode, uint32_t op)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
 
@@ -578,14 +562,14 @@ static XSM_INLINE int xsm_hvm_altp2mhvm_op(XSM_DEFAULT_ARG struct domain *d, uin
     }
 }
 
-static XSM_INLINE int xsm_vm_event_control(XSM_DEFAULT_ARG struct domain *d, int mode, int op)
+static XSM_INLINE int dummy_vm_event_control(XSM_DEFAULT_ARG struct domain *d, int mode, int op)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
 #ifdef CONFIG_MEM_ACCESS
-static XSM_INLINE int xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int dummy_mem_access(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
@@ -593,7 +577,7 @@ static XSM_INLINE int xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
 #endif
 
 #ifdef CONFIG_MEM_PAGING
-static XSM_INLINE int xsm_mem_paging(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int dummy_mem_paging(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
@@ -601,57 +585,57 @@ static XSM_INLINE int xsm_mem_paging(XSM_DEFAULT_ARG struct domain *d)
 #endif
 
 #ifdef CONFIG_MEM_SHARING
-static XSM_INLINE int xsm_mem_sharing(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int dummy_mem_sharing(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 #endif
 
-static XSM_INLINE int xsm_platform_op(XSM_DEFAULT_ARG uint32_t op)
+static XSM_INLINE int dummy_platform_op(XSM_DEFAULT_ARG uint32_t op)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 #ifdef CONFIG_X86
-static XSM_INLINE int xsm_do_mca(XSM_DEFAULT_VOID)
+static XSM_INLINE int dummy_do_mca(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_shadow_control(XSM_DEFAULT_ARG struct domain *d, uint32_t op)
+static XSM_INLINE int dummy_shadow_control(XSM_DEFAULT_ARG struct domain *d, uint32_t op)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_mem_sharing_op(XSM_DEFAULT_ARG struct domain *d, struct domain *cd, int op)
+static XSM_INLINE int dummy_mem_sharing_op(XSM_DEFAULT_ARG struct domain *d, struct domain *cd, int op)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, cd);
 }
 
-static XSM_INLINE int xsm_apic(XSM_DEFAULT_ARG struct domain *d, int cmd)
+static XSM_INLINE int dummy_apic(XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, d, NULL);
 }
 
-static XSM_INLINE int xsm_machine_memory_map(XSM_DEFAULT_VOID)
+static XSM_INLINE int dummy_machine_memory_map(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_domain_memory_map(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int dummy_domain_memory_map(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_mmu_update(XSM_DEFAULT_ARG struct domain *d, struct domain *t,
+static XSM_INLINE int dummy_mmu_update(XSM_DEFAULT_ARG struct domain *d, struct domain *t,
                                      struct domain *f, uint32_t flags)
 {
     int rc = 0;
@@ -663,38 +647,38 @@ static XSM_INLINE int xsm_mmu_update(XSM_DEFAULT_ARG struct domain *d, struct do
     return rc;
 }
 
-static XSM_INLINE int xsm_mmuext_op(XSM_DEFAULT_ARG struct domain *d, struct domain *f)
+static XSM_INLINE int dummy_mmuext_op(XSM_DEFAULT_ARG struct domain *d, struct domain *f)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, f);
 }
 
-static XSM_INLINE int xsm_update_va_mapping(XSM_DEFAULT_ARG struct domain *d, struct domain *f, 
+static XSM_INLINE int dummy_update_va_mapping(XSM_DEFAULT_ARG struct domain *d, struct domain *f, 
                                                             l1_pgentry_t pte)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, f);
 }
 
-static XSM_INLINE int xsm_priv_mapping(XSM_DEFAULT_ARG struct domain *d, struct domain *t)
+static XSM_INLINE int dummy_priv_mapping(XSM_DEFAULT_ARG struct domain *d, struct domain *t)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, t);
 }
 
-static XSM_INLINE int xsm_ioport_permission(XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+static XSM_INLINE int dummy_ioport_permission(XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_ioport_mapping(XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+static XSM_INLINE int dummy_ioport_mapping(XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_pmu_op (XSM_DEFAULT_ARG struct domain *d, unsigned int op)
+static XSM_INLINE int dummy_pmu_op (XSM_DEFAULT_ARG struct domain *d, unsigned int op)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( op )
@@ -711,30 +695,30 @@ static XSM_INLINE int xsm_pmu_op (XSM_DEFAULT_ARG struct domain *d, unsigned int
 
 #endif /* CONFIG_X86 */
 
-static XSM_INLINE int xsm_dm_op(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int dummy_dm_op(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
 #ifdef CONFIG_ARGO
-static XSM_INLINE int xsm_argo_enable(const struct domain *d)
+static XSM_INLINE int dummy_argo_enable(const struct domain *d)
 {
     return 0;
 }
 
-static XSM_INLINE int xsm_argo_register_single_source(const struct domain *d,
+static XSM_INLINE int dummy_argo_register_single_source(const struct domain *d,
                                                       const struct domain *t)
 {
     return 0;
 }
 
-static XSM_INLINE int xsm_argo_register_any_source(const struct domain *d)
+static XSM_INLINE int dummy_argo_register_any_source(const struct domain *d)
 {
     return 0;
 }
 
-static XSM_INLINE int xsm_argo_send(const struct domain *d,
+static XSM_INLINE int dummy_argo_send(const struct domain *d,
                                     const struct domain *t)
 {
     return 0;
@@ -743,7 +727,7 @@ static XSM_INLINE int xsm_argo_send(const struct domain *d,
 #endif /* CONFIG_ARGO */
 
 #include <public/version.h>
-static XSM_INLINE int xsm_xen_version (XSM_DEFAULT_ARG uint32_t op)
+static XSM_INLINE int dummy_xen_version (XSM_DEFAULT_ARG uint32_t op)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( op )
@@ -767,7 +751,7 @@ static XSM_INLINE int xsm_xen_version (XSM_DEFAULT_ARG uint32_t op)
     }
 }
 
-static XSM_INLINE int xsm_domain_resource_map(XSM_DEFAULT_ARG struct domain *d)
+static XSM_INLINE int dummy_domain_resource_map(XSM_DEFAULT_ARG struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
index b96dacd181..ebe5814efc 100644
--- a/xen/xsm/silo.c
+++ b/xen/xsm/silo.c
@@ -17,7 +17,8 @@
  * You should have received a copy of the GNU General Public License along with
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
-#include <xsm/dummy.h>
+#include <xsm/xsm-core.h>
+#include "dummy.h"
 
 /*
  * Check if inter-domain communication is allowed.
@@ -43,7 +44,7 @@ static int silo_evtchn_unbound(struct domain *d1, struct evtchn *chn,
     else
     {
         if ( silo_mode_dom_check(d1, d2) )
-            rc = xsm_evtchn_unbound(d1, chn, id2);
+            rc = dummy_evtchn_unbound(d1, chn, id2);
         rcu_unlock_domain(d2);
     }
 
@@ -54,7 +55,7 @@ static int silo_evtchn_interdomain(struct domain *d1, struct evtchn *chan1,
                                    struct domain *d2, struct evtchn *chan2)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_evtchn_interdomain(d1, chan1, d2, chan2);
+        return dummy_evtchn_interdomain(d1, chan1, d2, chan2);
     return -EPERM;
 }
 
@@ -62,21 +63,21 @@ static int silo_grant_mapref(struct domain *d1, struct domain *d2,
                              uint32_t flags)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_grant_mapref(d1, d2, flags);
+        return dummy_grant_mapref(d1, d2, flags);
     return -EPERM;
 }
 
 static int silo_grant_transfer(struct domain *d1, struct domain *d2)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_grant_transfer(d1, d2);
+        return dummy_grant_transfer(d1, d2);
     return -EPERM;
 }
 
 static int silo_grant_copy(struct domain *d1, struct domain *d2)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_grant_copy(d1, d2);
+        return dummy_grant_copy(d1, d2);
     return -EPERM;
 }
 
@@ -86,14 +87,14 @@ static int silo_argo_register_single_source(const struct domain *d1,
                                             const struct domain *d2)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_argo_register_single_source(d1, d2);
+        return dummy_argo_register_single_source(d1, d2);
     return -EPERM;
 }
 
 static int silo_argo_send(const struct domain *d1, const struct domain *d2)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_argo_send(d1, d2);
+        return dummy_argo_send(d1, d2);
     return -EPERM;
 }
 
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index acc1af7166..a51dc6f7dd 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -18,8 +18,6 @@
 #include <xen/hypercall.h>
 #include <xsm/xsm.h>
 
-#ifdef CONFIG_XSM
-
 #ifdef CONFIG_MULTIBOOT
 #include <asm/setup.h>
 #endif
@@ -223,8 +221,6 @@ int __init register_xsm(struct xsm_operations *ops)
     return 0;
 }
 
-#endif
-
 long do_xsm_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 {
     return xsm_do_xsm_op(op);
-- 
2.20.1


