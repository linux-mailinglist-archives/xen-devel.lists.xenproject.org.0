Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DC53E1683
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 16:09:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164292.300580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBe3R-0005MZ-Gk; Thu, 05 Aug 2021 14:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164292.300580; Thu, 05 Aug 2021 14:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBe3R-0005Iv-Cb; Thu, 05 Aug 2021 14:09:01 +0000
Received: by outflank-mailman (input) for mailman id 164292;
 Thu, 05 Aug 2021 14:09:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DXIG=M4=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mBe3Q-0004pc-Dr
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 14:09:00 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27b45565-39e6-4539-ab91-d932a9758084;
 Thu, 05 Aug 2021 14:08:53 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1628172452553862.2810177690948;
 Thu, 5 Aug 2021 07:07:32 -0700 (PDT)
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
X-Inumbo-ID: 27b45565-39e6-4539-ab91-d932a9758084
ARC-Seal: i=1; a=rsa-sha256; t=1628172467; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KTYiIi4o0HTfPDd6ilBumdaFyDSkqFDTALC9EFQEkMc3rmgJnBLB1CTCSWpZgW9253jQ/pYdhpOV+ZXFNykY+q0yIgDDkImLVw6kLXPbLrcF+DYSczM4c0E5g3xy5/37wKoDYqnp9rl0ePj5ikOTg3iUyhKAT7Mh8XKGhcuyHYc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1628172467; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Q7jgyJ8ZGFGpTWfi3wABfXyMxTdJNqrYNBaoXvoh/R8=; 
	b=ZjQ26eV/PQUQtbLSZwyUNmgyoAQFFOZMCXOnKEVOZu8hAZJr4Wv9nPYK9RM0ovStnz5Hj98XJpnmGqV+JGPrH2mK22sVQRUzR/2n+Tmy8pCePzG2/EbalN4JA5QpPi20rKcUL8Qs02OiXMRcY0IoG95EWPeDkeQw47xc5JjeN6g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1628172467;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Q7jgyJ8ZGFGpTWfi3wABfXyMxTdJNqrYNBaoXvoh/R8=;
	b=VICtg7xzrTaZHipBo07iTy7hD17rXEOxumRGknr3zLr34VFlqhhe5UcEP2r3ho+J
	P1dDHtCaxcwoX4UQUBcSYJtPkG92nRMO2ouq8HBMlKqETBDCBjqbEZMBlQ8kapdZHLb
	3WdQ9YN00wLWr2Bych2j3CKrn0djuLyBtmM//UgY=
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
Subject: [PATCH v3 7/7] xsm: removing facade that XSM can be enabled/disabled
Date: Thu,  5 Aug 2021 10:06:44 -0400
Message-Id: <20210805140644.357-8-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210805140644.357-1-dpsmith@apertussolutions.com>
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The XSM facilities are always in use by Xen with the facade of being able to
turn XSM on and off. This option is in fact about allowing the selection of
which policies are available and which are used at runtime.  To provide this
facade a complicated serious of #ifdef's are used to selective include
different headers or portions of headers. This series of #ifdef gyrations
switches between two different versions of the XSM hook interfaces and their
respective backing implementation.  All of this is done to provide a minimal
size/performance optimization for when alternative policies are disabled.

To unwind the #ifdef gyrations a series of changes were necessary,
    * replace CONFIG_XSM with XSM_CONFIGURABLE to allow visibility of
      selecting alternate XSM policy modules to those that require it
    * adjusted CONFIG_XSM_SILO, CONFIG_XSM_FLASK, and the default module
      selection to sensible defaults
    * collapsed the "dummy/defualt" XSM interface and implementation with the
      "multiple policy" interface to provide a single inlined implementation
      that attempts to use a registered hook and falls back to the check from
      the dummy implementation
    * the collapse to a single interface broke code relying on the alternate
      interface, specifically SILO, this was reworked to remove the
      indirection/abstraction making SILO explicit in its access control
      decisions
    * with the change of the XSM hooks to fall back to enforcing the dummy
      policy, it is no longer necessary to fill NULL entries in the struct
      xsm_ops returned by an XSM module's init

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/Kconfig         |  47 +-
 xen/include/xsm/dummy.h    | 709 +----------------------------
 xen/include/xsm/xsm-core.h |  26 --
 xen/include/xsm/xsm.h      | 904 ++++++++++++++++++++++++++++---------
 xen/xsm/Makefile           |   3 +-
 xen/xsm/dummy.c            | 157 -------
 xen/xsm/silo.c             |  15 +-
 xen/xsm/xsm_core.c         |  18 +-
 8 files changed, 726 insertions(+), 1153 deletions(-)
 delete mode 100644 xen/xsm/dummy.c

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index ac5491b1cc..3c5980a336 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -200,23 +200,15 @@ config XENOPROF
 
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
-
-	  If unsure, say N.
+config XSM_CONFIGURABLE
+    bool "Enable Configuring Xen Security Modules"
 
 config XSM_FLASK
-	def_bool y
-	prompt "FLux Advanced Security Kernel support"
-	depends on XSM
-	---help---
+	bool "FLux Advanced Security Kernel support"
+	default n
+	depends on XSM_CONFIGURABLE
+	select XSM_EVTCHN_LABELING
+	help
 	  Enables FLASK (FLux Advanced Security Kernel) as the access control
 	  mechanism used by the XSM framework.  This provides a mandatory access
 	  control framework by which security enforcement, isolation, and
@@ -226,10 +218,10 @@ config XSM_FLASK
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
@@ -240,7 +232,7 @@ config XSM_FLASK_POLICY
 	bool "Compile Xen with a built-in FLASK security policy"
 	default y if "$(XEN_HAS_CHECKPOLICY)" = "y"
 	depends on XSM_FLASK
-	---help---
+	help
 	  This includes a default XSM policy in the hypervisor so that the
 	  bootloader does not need to load a policy to get sane behavior from an
 	  XSM-enabled hypervisor.  If this is disabled, a policy must be
@@ -253,10 +245,11 @@ config XSM_FLASK_POLICY
 	  If unsure, say Y.
 
 config XSM_SILO
-	def_bool y
-	prompt "SILO support"
-	depends on XSM
-	---help---
+	bool "SILO support"
+	default y if ARM
+	default n
+	depends on XSM_CONFIGURABLE
+	help
 	  Enables SILO as the access control mechanism used by the XSM framework.
 	  This is not the default module, add boot parameter xsm=silo to choose
 	  it. This will deny any unmediated communication channels (grant tables
@@ -265,14 +258,14 @@ config XSM_SILO
 	  If unsure, say Y.
 
 choice
-	prompt "Default XSM implementation"
-	depends on XSM
+	prompt "Default XSM module"
 	default XSM_SILO_DEFAULT if XSM_SILO && ARM
 	default XSM_FLASK_DEFAULT if XSM_FLASK
 	default XSM_SILO_DEFAULT if XSM_SILO
 	default XSM_DUMMY_DEFAULT
+	depends on XSM_CONFIGURABLE
 	config XSM_DUMMY_DEFAULT
-		bool "Match non-XSM behavior"
+		bool "Classic Dom0 behavior"
 	config XSM_FLASK_DEFAULT
 		bool "FLux Advanced Security Kernel" if XSM_FLASK
 	config XSM_SILO_DEFAULT
@@ -282,7 +275,7 @@ endchoice
 config LATE_HWDOM
 	bool "Dedicated hardware domain"
 	default n
-	depends on XSM && X86
+	depends on XSM_FLASK && X86
 	---help---
 	  Allows the creation of a dedicated hardware domain distinct from
 	  domain 0 that manages devices without needing access to other
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index c445c5681b..eb8d61216b 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -1,18 +1,11 @@
 /*
- *  Default XSM hooks - IS_PRIV and IS_PRIV_FOR checks
+ *  Default XSM hook check - enforces basic access control decisions
  *
  *  Author: Daniel De Graaf <dgdegra@tyhco.nsa.gov>
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License version 2,
  *  as published by the Free Software Foundation.
- *
- *
- *  Each XSM hook implementing an access check should have its first parameter
- *  preceded by XSM_DEFAULT_ARG (or use XSM_DEFAULT_VOID if it has no
- *  arguments). The first non-declaration statement shold be XSM_ASSERT_ACTION
- *  with the expected type of the hook, which will either define or check the
- *  value of action.
  */
 
 #include <xen/sched.h>
@@ -42,33 +35,8 @@ static inline void __xsm_action_mismatch_detected(void)
 void __xsm_action_mismatch_detected(void);
 #endif
 
-#ifdef CONFIG_XSM
-
-/* In CONFIG_XSM builds, this header file is included from xsm/dummy.c, and
- * contains static (not inline) functions compiled to the dummy XSM module.
- * There is no xsm_default_t argument available, so the value from the assertion
- * is used to initialize the variable.
- */
-#define XSM_INLINE __maybe_unused
-
-#define XSM_DEFAULT_ARG /* */
-#define XSM_DEFAULT_VOID void
-#define XSM_ASSERT_ACTION(def) xsm_default_t action = def; (void)action
-
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
 #define XSM_ASSERT_ACTION(def) LINKER_BUG_ON(def != action)
 
-#endif /* CONFIG_XSM */
-
 static always_inline int xsm_default_action(
     xsm_default_t action, struct domain *src, struct domain *target)
 {
@@ -97,678 +65,3 @@ static always_inline int xsm_default_action(
         return -EPERM;
     }
 }
-
-static XSM_INLINE void xsm_security_domaininfo(struct domain *d,
-                                    struct xen_domctl_getdomaininfo *info)
-{
-    return;
-}
-
-static XSM_INLINE int xsm_domain_create(XSM_DEFAULT_ARG struct domain *d, u32 ssidref)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_getdomaininfo(XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_domctl_scheduler_op(XSM_DEFAULT_ARG struct domain *d, int cmd)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_sysctl_scheduler_op(XSM_DEFAULT_ARG int cmd)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE int xsm_set_target(XSM_DEFAULT_ARG struct domain *d, struct domain *e)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE int xsm_domctl(XSM_DEFAULT_ARG struct domain *d, int cmd)
-{
-    XSM_ASSERT_ACTION(XSM_OTHER);
-    switch ( cmd )
-    {
-    case XEN_DOMCTL_ioport_mapping:
-    case XEN_DOMCTL_memory_mapping:
-    case XEN_DOMCTL_bind_pt_irq:
-    case XEN_DOMCTL_unbind_pt_irq:
-        return xsm_default_action(XSM_DM_PRIV, current->domain, d);
-    case XEN_DOMCTL_getdomaininfo:
-        return xsm_default_action(XSM_XS_PRIV, current->domain, d);
-    default:
-        return xsm_default_action(XSM_PRIV, current->domain, d);
-    }
-}
-
-static XSM_INLINE int xsm_sysctl(XSM_DEFAULT_ARG int cmd)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE int xsm_readconsole(XSM_DEFAULT_ARG uint32_t clear)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE int xsm_alloc_security_domain(struct domain *d)
-{
-    return 0;
-}
-
-static XSM_INLINE void xsm_free_security_domain(struct domain *d)
-{
-    return;
-}
-
-static XSM_INLINE int xsm_grant_mapref(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2,
-                                                                uint32_t flags)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_grant_unmapref(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_grant_setup(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_grant_transfer(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_grant_copy(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_grant_query_size(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_memory_exchange(XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_memory_adjust_reservation(XSM_DEFAULT_ARG struct domain *d1,
-                                                            struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_memory_stat_reservation(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_console_io(XSM_DEFAULT_ARG struct domain *d, int cmd)
-{
-    XSM_ASSERT_ACTION(XSM_OTHER);
-    if ( d->is_console )
-        return xsm_default_action(XSM_HOOK, d, NULL);
-#ifdef CONFIG_VERBOSE_DEBUG
-    if ( cmd == CONSOLEIO_write )
-        return xsm_default_action(XSM_HOOK, d, NULL);
-#endif
-    return xsm_default_action(XSM_PRIV, d, NULL);
-}
-
-static XSM_INLINE int xsm_profile(XSM_DEFAULT_ARG struct domain *d, int op)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d, NULL);
-}
-
-static XSM_INLINE int xsm_kexec(XSM_DEFAULT_VOID)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE int xsm_schedop_shutdown(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_memory_pin_page(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2,
-                                          struct page_info *page)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_claim_pages(XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_evtchn_unbound(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn,
-                                         domid_t id2)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_evtchn_interdomain(XSM_DEFAULT_ARG struct domain *d1, struct evtchn
-                                *chan1, struct domain *d2, struct evtchn *chan2)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE void xsm_evtchn_close_post(struct evtchn *chn)
-{
-    return;
-}
-
-static XSM_INLINE int xsm_evtchn_send(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d, NULL);
-}
-
-static XSM_INLINE int xsm_evtchn_status(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_evtchn_reset(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_alloc_security_evtchns(
-    struct evtchn chn[], unsigned int nr)
-{
-    return 0;
-}
-
-static XSM_INLINE void xsm_free_security_evtchns(
-    struct evtchn chn[], unsigned int nr)
-{
-    return;
-}
-
-static XSM_INLINE char *xsm_show_security_evtchn(struct domain *d, const struct evtchn *chn)
-{
-    return NULL;
-}
-
-static XSM_INLINE int xsm_init_hardware_domain(XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_get_pod_target(XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_set_pod_target(XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_get_vnumainfo(XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
-}
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-static XSM_INLINE int xsm_get_device_group(XSM_DEFAULT_ARG uint32_t machine_bdf)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE int xsm_assign_device(XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_deassign_device(XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-#endif /* HAS_PASSTHROUGH && HAS_PCI */
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
-static XSM_INLINE int xsm_assign_dtdevice(XSM_DEFAULT_ARG struct domain *d,
-                                          const char *dtpath)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_deassign_dtdevice(XSM_DEFAULT_ARG struct domain *d,
-                                            const char *dtpath)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
-
-static XSM_INLINE int xsm_resource_plug_core(XSM_DEFAULT_VOID)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE int xsm_resource_unplug_core(XSM_DEFAULT_VOID)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE int xsm_resource_plug_pci(XSM_DEFAULT_ARG uint32_t machine_bdf)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE int xsm_resource_unplug_pci(XSM_DEFAULT_ARG uint32_t machine_bdf)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE int xsm_resource_setup_pci(XSM_DEFAULT_ARG uint32_t machine_bdf)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE int xsm_resource_setup_gsi(XSM_DEFAULT_ARG int gsi)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE int xsm_resource_setup_misc(XSM_DEFAULT_VOID)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE int xsm_page_offline(XSM_DEFAULT_ARG uint32_t cmd)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE int xsm_hypfs_op(XSM_DEFAULT_VOID)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
-{
-    return -ENOSYS;
-}
-
-#ifdef CONFIG_COMPAT
-static XSM_INLINE int xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
-{
-    return -ENOSYS;
-}
-#endif
-
-static XSM_INLINE char *xsm_show_irq_sid(int irq)
-{
-    return NULL;
-}
-
-static XSM_INLINE int xsm_map_domain_pirq(XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_map_domain_irq(XSM_DEFAULT_ARG struct domain *d,
-                                         int irq, const void *data)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_unmap_domain_pirq(XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_bind_pt_irq(XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_unbind_pt_irq(XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_unmap_domain_irq(XSM_DEFAULT_ARG struct domain *d,
-                                           int irq, const void *data)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_irq_permission(XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_iomem_permission(XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_iomem_mapping(XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_pci_config_permission(XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf,
-                                        uint16_t start, uint16_t end,
-                                        uint8_t access)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_add_to_physmap(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_remove_from_physmap(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_map_gmfn_foreign(XSM_DEFAULT_ARG struct domain *d, struct domain *t)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d, t);
-}
-
-static XSM_INLINE int xsm_hvm_param(XSM_DEFAULT_ARG struct domain *d, unsigned long op)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_hvm_control(XSM_DEFAULT_ARG struct domain *d, unsigned long op)
-{
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_hvm_param_altp2mhvm(XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_hvm_altp2mhvm_op(XSM_DEFAULT_ARG struct domain *d, uint64_t mode, uint32_t op)
-{
-    XSM_ASSERT_ACTION(XSM_OTHER);
-
-    switch ( mode )
-    {
-    case XEN_ALTP2M_mixed:
-        return xsm_default_action(XSM_TARGET, current->domain, d);
-    case XEN_ALTP2M_external:
-        return xsm_default_action(XSM_DM_PRIV, current->domain, d);
-    case XEN_ALTP2M_limited:
-        if ( HVMOP_altp2m_vcpu_enable_notify == op )
-            return xsm_default_action(XSM_TARGET, current->domain, d);
-        return xsm_default_action(XSM_DM_PRIV, current->domain, d);
-    default:
-        return -EPERM;
-    }
-}
-
-static XSM_INLINE int xsm_vm_event_control(XSM_DEFAULT_ARG struct domain *d, int mode, int op)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-
-#ifdef CONFIG_MEM_ACCESS
-static XSM_INLINE int xsm_mem_access(XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-#endif
-
-#ifdef CONFIG_MEM_PAGING
-static XSM_INLINE int xsm_mem_paging(XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-#endif
-
-#ifdef CONFIG_MEM_SHARING
-static XSM_INLINE int xsm_mem_sharing(XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-#endif
-
-static XSM_INLINE int xsm_platform_op(XSM_DEFAULT_ARG uint32_t op)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-#ifdef CONFIG_X86
-static XSM_INLINE int xsm_do_mca(XSM_DEFAULT_VOID)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE int xsm_shadow_control(XSM_DEFAULT_ARG struct domain *d, uint32_t op)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_mem_sharing_op(XSM_DEFAULT_ARG struct domain *d, struct domain *cd, int op)
-{
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, cd);
-}
-
-static XSM_INLINE int xsm_apic(XSM_DEFAULT_ARG struct domain *d, int cmd)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, d, NULL);
-}
-
-static XSM_INLINE int xsm_machine_memory_map(XSM_DEFAULT_VOID)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE int xsm_domain_memory_map(XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_mmu_update(XSM_DEFAULT_ARG struct domain *d, struct domain *t,
-                                     struct domain *f, uint32_t flags)
-{
-    int rc = 0;
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    if ( f != dom_io )
-        rc = xsm_default_action(action, d, f);
-    if ( evaluate_nospec(t) && !rc )
-        rc = xsm_default_action(action, d, t);
-    return rc;
-}
-
-static XSM_INLINE int xsm_mmuext_op(XSM_DEFAULT_ARG struct domain *d, struct domain *f)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d, f);
-}
-
-static XSM_INLINE int xsm_update_va_mapping(XSM_DEFAULT_ARG struct domain *d, struct domain *f, 
-                                                            l1_pgentry_t pte)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d, f);
-}
-
-static XSM_INLINE int xsm_priv_mapping(XSM_DEFAULT_ARG struct domain *d, struct domain *t)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d, t);
-}
-
-static XSM_INLINE int xsm_ioport_permission(XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_ioport_mapping(XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_pmu_op (XSM_DEFAULT_ARG struct domain *d, unsigned int op)
-{
-    XSM_ASSERT_ACTION(XSM_OTHER);
-    switch ( op )
-    {
-    case XENPMU_init:
-    case XENPMU_finish:
-    case XENPMU_lvtpc_set:
-    case XENPMU_flush:
-        return xsm_default_action(XSM_HOOK, d, current->domain);
-    default:
-        return xsm_default_action(XSM_PRIV, d, current->domain);
-    }
-}
-
-#endif /* CONFIG_X86 */
-
-static XSM_INLINE int xsm_dm_op(XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
-
-#ifdef CONFIG_ARGO
-static XSM_INLINE int xsm_argo_enable(const struct domain *d)
-{
-    return 0;
-}
-
-static XSM_INLINE int xsm_argo_register_single_source(const struct domain *d,
-                                                      const struct domain *t)
-{
-    return 0;
-}
-
-static XSM_INLINE int xsm_argo_register_any_source(const struct domain *d)
-{
-    return 0;
-}
-
-static XSM_INLINE int xsm_argo_send(const struct domain *d,
-                                    const struct domain *t)
-{
-    return 0;
-}
-
-#endif /* CONFIG_ARGO */
-
-#include <public/version.h>
-static XSM_INLINE int xsm_xen_version (XSM_DEFAULT_ARG uint32_t op)
-{
-    XSM_ASSERT_ACTION(XSM_OTHER);
-    switch ( op )
-    {
-    case XENVER_version:
-    case XENVER_platform_parameters:
-    case XENVER_get_features:
-        /* These sub-ops ignore the permission checks and return data. */
-        block_speculation();
-        return 0;
-    case XENVER_extraversion:
-    case XENVER_compile_info:
-    case XENVER_capabilities:
-    case XENVER_changeset:
-    case XENVER_pagesize:
-    case XENVER_guest_handle:
-        /* These MUST always be accessible to any guest by default. */
-        return xsm_default_action(XSM_HOOK, current->domain, NULL);
-    default:
-        return xsm_default_action(XSM_PRIV, current->domain, NULL);
-    }
-}
-
-static XSM_INLINE int xsm_domain_resource_map(XSM_DEFAULT_ARG struct domain *d)
-{
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
-}
diff --git a/xen/include/xsm/xsm-core.h b/xen/include/xsm/xsm-core.h
index 49b00d688c..dfe9378cb2 100644
--- a/xen/include/xsm/xsm-core.h
+++ b/xen/include/xsm/xsm-core.h
@@ -199,8 +199,6 @@ struct xsm_ops {
 
 extern void xsm_fixup_ops(struct xsm_ops *ops);
 
-#ifdef CONFIG_XSM
-
 #ifdef CONFIG_MULTIBOOT
 extern int xsm_multiboot_init(unsigned long *module_map,
                               const multiboot_info_t *mbi);
@@ -246,28 +244,4 @@ static const inline struct xsm_ops *silo_init(void)
 }
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
index 673b818ac7..deb3a39062 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -19,545 +19,1023 @@
 #include <xen/sched.h>
 #include <xen/multiboot.h>
 #include <xsm/xsm-core.h>
-
-#ifdef CONFIG_XSM
+#include <xsm/dummy.h>
+#include <public/version.h>
 
 extern struct xsm_ops xsm_ops;
 
-static inline void xsm_security_domaininfo (struct domain *d,
-                                        struct xen_domctl_getdomaininfo *info)
+static inline void xsm_security_domaininfo(
+    struct domain *d,
+    struct xen_domctl_getdomaininfo *info)
 {
-    alternative_vcall(xsm_ops.security_domaininfo, d, info);
+    if ( xsm_ops.security_domaininfo )
+        alternative_vcall(xsm_ops.security_domaininfo, d, info);
 }
 
-static inline int xsm_domain_create (xsm_default_t def, struct domain *d, u32 ssidref)
+static inline int xsm_domain_create(xsm_default_t action, struct domain *d,
+                                    u32 ssidref)
 {
-    return alternative_call(xsm_ops.domain_create, d, ssidref);
+    if ( xsm_ops.domain_create )
+        return alternative_call(xsm_ops.domain_create, d, ssidref);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_getdomaininfo (xsm_default_t def, struct domain *d)
+static inline int xsm_getdomaininfo(xsm_default_t action, struct domain *d)
 {
-    return alternative_call(xsm_ops.getdomaininfo, d);
+    if ( xsm_ops.getdomaininfo )
+        return alternative_call(xsm_ops.getdomaininfo, d);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_domctl_scheduler_op (xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_domctl_scheduler_op(xsm_default_t action, struct domain *d,
+                                          int cmd)
 {
-    return alternative_call(xsm_ops.domctl_scheduler_op, d, cmd);
+    if ( xsm_ops.domctl_scheduler_op )
+        return alternative_call(xsm_ops.domctl_scheduler_op, d, cmd);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_sysctl_scheduler_op (xsm_default_t def, int cmd)
+static inline int xsm_sysctl_scheduler_op(xsm_default_t action, int cmd)
 {
-    return alternative_call(xsm_ops.sysctl_scheduler_op, cmd);
+    if ( xsm_ops.sysctl_scheduler_op )
+        return alternative_call(xsm_ops.sysctl_scheduler_op, cmd);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
-static inline int xsm_set_target (xsm_default_t def, struct domain *d, struct domain *e)
+static inline int xsm_set_target(xsm_default_t action, struct domain *d,
+                                 struct domain *e)
 {
-    return alternative_call(xsm_ops.set_target, d, e);
+    if ( xsm_ops.set_target )
+        return alternative_call(xsm_ops.set_target, d, e);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
-static inline int xsm_domctl (xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_domctl(xsm_default_t action, struct domain *d, int cmd)
 {
-    return alternative_call(xsm_ops.domctl, d, cmd);
+    if ( xsm_ops.domctl )
+        return alternative_call(xsm_ops.domctl, d, cmd);
+
+    XSM_ASSERT_ACTION(XSM_OTHER);
+    switch ( cmd )
+    {
+    case XEN_DOMCTL_ioport_mapping:
+    case XEN_DOMCTL_memory_mapping:
+    case XEN_DOMCTL_bind_pt_irq:
+    case XEN_DOMCTL_unbind_pt_irq:
+        return xsm_default_action(XSM_DM_PRIV, current->domain, d);
+    case XEN_DOMCTL_getdomaininfo:
+        return xsm_default_action(XSM_XS_PRIV, current->domain, d);
+    default:
+        return xsm_default_action(XSM_PRIV, current->domain, d);
+    }
 }
 
-static inline int xsm_sysctl (xsm_default_t def, int cmd)
+static inline int xsm_sysctl(xsm_default_t action, int cmd)
 {
-    return alternative_call(xsm_ops.sysctl, cmd);
+    if ( xsm_ops.sysctl )
+        return alternative_call(xsm_ops.sysctl, cmd);
+
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
-static inline int xsm_readconsole (xsm_default_t def, uint32_t clear)
+static inline int xsm_readconsole(xsm_default_t action, uint32_t clear)
 {
-    return alternative_call(xsm_ops.readconsole, clear);
+    if ( xsm_ops.readconsole )
+        return alternative_call(xsm_ops.readconsole, clear);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
-static inline int xsm_evtchn_unbound (xsm_default_t def, struct domain *d1, struct evtchn *chn,
-                                                                    domid_t id2)
+static inline int xsm_evtchn_unbound(xsm_default_t action, struct domain *d1,
+                                     struct evtchn *chn, domid_t id2)
 {
-    return alternative_call(xsm_ops.evtchn_unbound, d1, chn, id2);
+    if ( xsm_ops.evtchn_unbound )
+        return alternative_call(xsm_ops.evtchn_unbound, d1, chn, id2);
+
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, current->domain, d1);
 }
 
-static inline int xsm_evtchn_interdomain (xsm_default_t def, struct domain *d1,
-                struct evtchn *chan1, struct domain *d2, struct evtchn *chan2)
+static inline int xsm_evtchn_interdomain(xsm_default_t action,
+                                         struct domain *d1,
+                                         struct evtchn *chan1,
+                                         struct domain *d2,
+                                         struct evtchn *chan2)
 {
-    return alternative_call(xsm_ops.evtchn_interdomain, d1, chan1, d2, chan2);
+    if ( xsm_ops.evtchn_interdomain )
+        return alternative_call(xsm_ops.evtchn_interdomain, d1, chan1, d2,
+                                chan2);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, d1, d2);
 }
 
-static inline void xsm_evtchn_close_post (struct evtchn *chn)
+static inline void xsm_evtchn_close_post(struct evtchn *chn)
 {
-    alternative_vcall(xsm_ops.evtchn_close_post, chn);
+    if ( xsm_ops.evtchn_close_post )
+        alternative_vcall(xsm_ops.evtchn_close_post, chn);
 }
 
-static inline int xsm_evtchn_send (xsm_default_t def, struct domain *d, struct evtchn *chn)
+static inline int xsm_evtchn_send(xsm_default_t action, struct domain *d,
+                                  struct evtchn *chn)
 {
-    return alternative_call(xsm_ops.evtchn_send, d, chn);
+    if ( xsm_ops.evtchn_send )
+        return alternative_call(xsm_ops.evtchn_send, d, chn);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, d, NULL);
 }
 
-static inline int xsm_evtchn_status (xsm_default_t def, struct domain *d, struct evtchn *chn)
+static inline int xsm_evtchn_status(xsm_default_t action, struct domain *d,
+                                    struct evtchn *chn)
 {
-    return alternative_call(xsm_ops.evtchn_status, d, chn);
+    if ( xsm_ops.evtchn_status )
+        return alternative_call(xsm_ops.evtchn_status, d, chn);
+
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_evtchn_reset (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_evtchn_reset(xsm_default_t action, struct domain *d1,
+                                   struct domain *d2)
 {
-    return alternative_call(xsm_ops.evtchn_reset, d1, d2);
+    if ( xsm_ops.evtchn_reset )
+        return alternative_call(xsm_ops.evtchn_reset, d1, d2);
+
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, d1, d2);
 }
 
-static inline int xsm_grant_mapref (xsm_default_t def, struct domain *d1, struct domain *d2,
-                                                                uint32_t flags)
+static inline int xsm_grant_mapref(xsm_default_t action, struct domain *d1,
+                                   struct domain *d2, uint32_t flags)
 {
-    return alternative_call(xsm_ops.grant_mapref, d1, d2, flags);
+    if ( xsm_ops.grant_mapref )
+        return alternative_call(xsm_ops.grant_mapref, d1, d2, flags);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, d1, d2);
 }
 
-static inline int xsm_grant_unmapref (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_unmapref(xsm_default_t action, struct domain *d1,
+                                     struct domain *d2)
 {
-    return alternative_call(xsm_ops.grant_unmapref, d1, d2);
+    if ( xsm_ops.grant_unmapref )
+        return alternative_call(xsm_ops.grant_unmapref, d1, d2);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, d1, d2);
 }
 
-static inline int xsm_grant_setup (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_setup(xsm_default_t action, struct domain *d1,
+                                  struct domain *d2)
 {
-    return alternative_call(xsm_ops.grant_setup, d1, d2);
+    if ( xsm_ops.grant_setup )
+        return alternative_call(xsm_ops.grant_setup, d1, d2);
+
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, d1, d2);
 }
 
-static inline int xsm_grant_transfer (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_transfer(xsm_default_t action, struct domain *d1,
+                                     struct domain *d2)
 {
-    return alternative_call(xsm_ops.grant_transfer, d1, d2);
+    if ( xsm_ops.grant_transfer )
+        return alternative_call(xsm_ops.grant_transfer, d1, d2);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, d1, d2);
 }
 
-static inline int xsm_grant_copy (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_copy(xsm_default_t action, struct domain *d1,
+                                 struct domain *d2)
 {
-    return alternative_call(xsm_ops.grant_copy, d1, d2);
+    if ( xsm_ops.grant_copy )
+        return alternative_call(xsm_ops.grant_copy, d1, d2);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, d1, d2);
 }
 
-static inline int xsm_grant_query_size (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_query_size(xsm_default_t action, struct domain *d1,
+                                       struct domain *d2)
 {
-    return alternative_call(xsm_ops.grant_query_size, d1, d2);
+    if ( xsm_ops.grant_query_size )
+        return alternative_call(xsm_ops.grant_query_size, d1, d2);
+
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, d1, d2);
 }
 
-static inline int xsm_alloc_security_domain (struct domain *d)
+static inline int xsm_alloc_security_domain(struct domain *d)
 {
-    return alternative_call(xsm_ops.alloc_security_domain, d);
+    if ( xsm_ops.alloc_security_domain )
+        return alternative_call(xsm_ops.alloc_security_domain, d);
+
+    return 0;
 }
 
-static inline void xsm_free_security_domain (struct domain *d)
+static inline void xsm_free_security_domain(struct domain *d)
 {
-    alternative_vcall(xsm_ops.free_security_domain, d);
+    if ( xsm_ops.free_security_domain )
+        alternative_vcall(xsm_ops.free_security_domain, d);
 }
 
-static inline int xsm_alloc_security_evtchns(
-    struct evtchn chn[], unsigned int nr)
+static inline int xsm_alloc_security_evtchns(struct evtchn chn[],
+                                             unsigned int nr)
 {
-    return alternative_call(xsm_ops.alloc_security_evtchns, chn, nr);
+    if ( xsm_ops.alloc_security_evtchns )
+        return alternative_call(xsm_ops.alloc_security_evtchns, chn, nr);
+
+    return 0;
 }
 
-static inline void xsm_free_security_evtchns(
-    struct evtchn chn[], unsigned int nr)
+static inline void xsm_free_security_evtchns(struct evtchn chn[],
+                                             unsigned int nr)
 {
-    alternative_vcall(xsm_ops.free_security_evtchns, chn, nr);
+    if ( xsm_ops.free_security_evtchns )
+        alternative_vcall(xsm_ops.free_security_evtchns, chn, nr);
 }
 
-static inline char *xsm_show_security_evtchn (struct domain *d, const struct evtchn *chn)
+static inline char *xsm_show_security_evtchn(struct domain *d,
+                                             const struct evtchn *chn)
 {
-    return alternative_call(xsm_ops.show_security_evtchn, d, chn);
+    if ( xsm_ops.show_security_evtchn )
+        return alternative_call(xsm_ops.show_security_evtchn, d, chn);
+
+    return NULL;
 }
 
-static inline int xsm_init_hardware_domain (xsm_default_t def, struct domain *d)
+static inline int xsm_init_hardware_domain(xsm_default_t action, struct domain *d)
 {
-    return alternative_call(xsm_ops.init_hardware_domain, d);
+    if ( xsm_ops.init_hardware_domain )
+        return alternative_call(xsm_ops.init_hardware_domain, d);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_get_pod_target (xsm_default_t def, struct domain *d)
+static inline int xsm_get_pod_target(xsm_default_t action, struct domain *d)
 {
-    return alternative_call(xsm_ops.get_pod_target, d);
+    if ( xsm_ops.get_pod_target )
+        return alternative_call(xsm_ops.get_pod_target, d);
+
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_set_pod_target (xsm_default_t def, struct domain *d)
+static inline int xsm_set_pod_target(xsm_default_t action, struct domain *d)
 {
-    return alternative_call(xsm_ops.set_pod_target, d);
+    if ( xsm_ops.set_pod_target )
+        return alternative_call(xsm_ops.set_pod_target, d);
+
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_memory_exchange (xsm_default_t def, struct domain *d)
+static inline int xsm_memory_exchange(xsm_default_t action, struct domain *d)
 {
-    return alternative_call(xsm_ops.memory_exchange, d);
+    if ( xsm_ops.memory_exchange )
+        return alternative_call(xsm_ops.memory_exchange, d);
+
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_memory_adjust_reservation (xsm_default_t def, struct domain *d1, struct
-                                                                    domain *d2)
+static inline int xsm_memory_adjust_reservation(xsm_default_t action,
+                                                struct domain *d1,
+                                                struct domain *d2)
 {
-    return alternative_call(xsm_ops.memory_adjust_reservation, d1, d2);
+    if ( xsm_ops.memory_adjust_reservation )
+        return alternative_call(xsm_ops.memory_adjust_reservation, d1, d2);
+
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, d1, d2);
 }
 
-static inline int xsm_memory_stat_reservation (xsm_default_t def, struct domain *d1,
-                                                            struct domain *d2)
+static inline int xsm_memory_stat_reservation(xsm_default_t action,
+                                              struct domain *d1,
+                                              struct domain *d2)
 {
-    return alternative_call(xsm_ops.memory_stat_reservation, d1, d2);
+    if ( xsm_ops.memory_stat_reservation )
+        return alternative_call(xsm_ops.memory_stat_reservation, d1, d2);
+
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, d1, d2);
 }
 
-static inline int xsm_memory_pin_page(xsm_default_t def, struct domain *d1, struct domain *d2,
-                                      struct page_info *page)
+static inline int xsm_memory_pin_page(xsm_default_t action, struct domain *d1,
+                                      struct domain *d2, struct page_info *page)
 {
-    return alternative_call(xsm_ops.memory_pin_page, d1, d2, page);
+    if ( xsm_ops.memory_pin_page )
+        return alternative_call(xsm_ops.memory_pin_page, d1, d2, page);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, d1, d2);
 }
 
-static inline int xsm_add_to_physmap(xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_add_to_physmap(xsm_default_t action, struct domain *d1,
+                                     struct domain *d2)
 {
-    return alternative_call(xsm_ops.add_to_physmap, d1, d2);
+    if ( xsm_ops.add_to_physmap )
+        return alternative_call(xsm_ops.add_to_physmap, d1, d2);
+
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, d1, d2);
 }
 
-static inline int xsm_remove_from_physmap(xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_remove_from_physmap(xsm_default_t action, struct domain *d1,
+                                          struct domain *d2)
 {
-    return alternative_call(xsm_ops.remove_from_physmap, d1, d2);
+    if ( xsm_ops.remove_from_physmap )
+        return alternative_call(xsm_ops.remove_from_physmap, d1, d2);
+
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, d1, d2);
 }
 
-static inline int xsm_map_gmfn_foreign (xsm_default_t def, struct domain *d, struct domain *t)
+static inline int xsm_map_gmfn_foreign(xsm_default_t action, struct domain *d,
+                                       struct domain *t)
 {
-    return alternative_call(xsm_ops.map_gmfn_foreign, d, t);
+    if ( xsm_ops.map_gmfn_foreign )
+        return alternative_call(xsm_ops.map_gmfn_foreign, d, t);
+
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, d, t);
 }
 
-static inline int xsm_claim_pages(xsm_default_t def, struct domain *d)
+static inline int xsm_claim_pages(xsm_default_t action, struct domain *d)
 {
-    return alternative_call(xsm_ops.claim_pages, d);
+    if ( xsm_ops.claim_pages )
+        return alternative_call(xsm_ops.claim_pages, d);
+
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_console_io (xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_console_io(xsm_default_t action, struct domain *d, int cmd)
 {
-    return alternative_call(xsm_ops.console_io, d, cmd);
+    if ( xsm_ops.console_io )
+        return alternative_call(xsm_ops.console_io, d, cmd);
+
+    XSM_ASSERT_ACTION(XSM_OTHER);
+    if ( d->is_console )
+        return xsm_default_action(XSM_HOOK, d, NULL);
+#ifdef CONFIG_VERBOSE_DEBUG
+    if ( cmd == CONSOLEIO_write )
+        return xsm_default_action(XSM_HOOK, d, NULL);
+#endif
+    return xsm_default_action(XSM_PRIV, d, NULL);
 }
 
-static inline int xsm_profile (xsm_default_t def, struct domain *d, int op)
+static inline int xsm_profile(xsm_default_t action, struct domain *d, int op)
 {
-    return alternative_call(xsm_ops.profile, d, op);
+    if ( xsm_ops.profile )
+        return alternative_call(xsm_ops.profile, d, op);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, d, NULL);
 }
 
-static inline int xsm_kexec (xsm_default_t def)
+static inline int xsm_kexec (xsm_default_t action)
 {
-    return alternative_call(xsm_ops.kexec);
+    if ( xsm_ops.kexec )
+        return alternative_call(xsm_ops.kexec);
+
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
-static inline int xsm_schedop_shutdown (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_schedop_shutdown(xsm_default_t action, struct domain *d1,
+                                       struct domain *d2)
 {
-    return alternative_call(xsm_ops.schedop_shutdown, d1, d2);
+    if ( xsm_ops.schedop_shutdown )
+        return alternative_call(xsm_ops.schedop_shutdown, d1, d2);
+
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    return xsm_default_action(action, d1, d2);
 }
 
-static inline char *xsm_show_irq_sid (int irq)
+static inline char *xsm_show_irq_sid(int irq)
 {
-    return alternative_call(xsm_ops.show_irq_sid, irq);
+    if ( xsm_ops.show_irq_sid )
+        return alternative_call(xsm_ops.show_irq_sid, irq);
+
+    return NULL;
 }
 
-static inline int xsm_map_domain_pirq (xsm_default_t def, struct domain *d)
+static inline int xsm_map_domain_pirq(xsm_default_t action, struct domain *d)
 {
-    return alternative_call(xsm_ops.map_domain_pirq, d);
+    if ( xsm_ops.map_domain_pirq )
+        return alternative_call(xsm_ops.map_domain_pirq, d);
+
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_map_domain_irq (xsm_default_t def, struct domain *d, int irq, void *data)
+static inline int xsm_map_domain_irq(xsm_default_t action, struct domain *d,
+                                     int irq, void *data)
 {
-    return alternative_call(xsm_ops.map_domain_irq, d, irq, data);
+    if ( xsm_ops.map_domain_irq )
+        return alternative_call(xsm_ops.map_domain_irq, d, irq, data);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_unmap_domain_pirq (xsm_default_t def, struct domain *d)
+static inline int xsm_unmap_domain_pirq(xsm_default_t action, struct domain *d)
 {
-    return alternative_call(xsm_ops.unmap_domain_pirq, d);
+    if ( xsm_ops.unmap_domain_pirq )
+        return alternative_call(xsm_ops.unmap_domain_pirq, d);
+
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_unmap_domain_irq (xsm_default_t def, struct domain *d, int irq, void *data)
+static inline int xsm_unmap_domain_irq(xsm_default_t action, struct domain *d,
+                                       int irq, void *data)
 {
-    return alternative_call(xsm_ops.unmap_domain_irq, d, irq, data);
+    if ( xsm_ops.unmap_domain_irq )
+        return alternative_call(xsm_ops.unmap_domain_irq, d, irq, data);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_bind_pt_irq(xsm_default_t def, struct domain *d,
+static inline int xsm_bind_pt_irq(xsm_default_t action, struct domain *d,
                                   struct xen_domctl_bind_pt_irq *bind)
 {
-    return alternative_call(xsm_ops.bind_pt_irq, d, bind);
+    if ( xsm_ops.bind_pt_irq )
+        return alternative_call(xsm_ops.bind_pt_irq, d, bind);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_unbind_pt_irq(xsm_default_t def, struct domain *d,
+static inline int xsm_unbind_pt_irq(xsm_default_t action, struct domain *d,
                                     struct xen_domctl_bind_pt_irq *bind)
 {
-    return alternative_call(xsm_ops.unbind_pt_irq, d, bind);
+    if ( xsm_ops.unbind_pt_irq )
+        return alternative_call(xsm_ops.unbind_pt_irq, d, bind);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_irq_permission (xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
+static inline int xsm_irq_permission(xsm_default_t action, struct domain *d,
+                                     int pirq, uint8_t allow)
 {
-    return alternative_call(xsm_ops.irq_permission, d, pirq, allow);
+    if ( xsm_ops.irq_permission )
+        return alternative_call(xsm_ops.irq_permission, d, pirq, allow);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_iomem_permission (xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+static inline int xsm_iomem_permission(xsm_default_t action, struct domain *d,
+                                       uint64_t s, uint64_t e, uint8_t allow)
 {
-    return alternative_call(xsm_ops.iomem_permission, d, s, e, allow);
+    if ( xsm_ops.iomem_permission )
+        return alternative_call(xsm_ops.iomem_permission, d, s, e, allow);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_iomem_mapping (xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+static inline int xsm_iomem_mapping(xsm_default_t action, struct domain *d,
+                                    uint64_t s, uint64_t e, uint8_t allow)
 {
-    return alternative_call(xsm_ops.iomem_mapping, d, s, e, allow);
+    if ( xsm_ops.iomem_mapping )
+        return alternative_call(xsm_ops.iomem_mapping, d, s, e, allow);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_pci_config_permission (xsm_default_t def, struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end, uint8_t access)
+static inline int xsm_pci_config_permission(xsm_default_t action,
+                                            struct domain *d,
+                                            uint32_t machine_bdf,
+                                            uint16_t start,
+                                            uint16_t end,
+                                            uint8_t access)
 {
-    return alternative_call(xsm_ops.pci_config_permission, d, machine_bdf, start, end, access);
+    if ( xsm_ops.pci_config_permission )
+        return alternative_call(xsm_ops.pci_config_permission, d, machine_bdf, start, end, access);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-static inline int xsm_get_device_group(xsm_default_t def, uint32_t machine_bdf)
+static inline int xsm_get_device_group(xsm_default_t action, uint32_t machine_bdf)
 {
-    return alternative_call(xsm_ops.get_device_group, machine_bdf);
+    if ( xsm_ops.get_device_group )
+        return alternative_call(xsm_ops.get_device_group, machine_bdf);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
-static inline int xsm_assign_device(xsm_default_t def, struct domain *d, uint32_t machine_bdf)
+static inline int xsm_assign_device(xsm_default_t action, struct domain *d,
+                                    uint32_t machine_bdf)
 {
-    return alternative_call(xsm_ops.assign_device, d, machine_bdf);
+    if ( xsm_ops.assign_device )
+        return alternative_call(xsm_ops.assign_device, d, machine_bdf);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_deassign_device(xsm_default_t def, struct domain *d, uint32_t machine_bdf)
+static inline int xsm_deassign_device(xsm_default_t action, struct domain *d,
+                                      uint32_t machine_bdf)
 {
-    return alternative_call(xsm_ops.deassign_device, d, machine_bdf);
+    if ( xsm_ops.deassign_device )
+        return alternative_call(xsm_ops.deassign_device, d, machine_bdf);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 #endif /* HAS_PASSTHROUGH && HAS_PCI) */
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
-static inline int xsm_assign_dtdevice(xsm_default_t def, struct domain *d,
+static inline int xsm_assign_dtdevice(xsm_default_t action, struct domain *d,
                                       const char *dtpath)
 {
-    return alternative_call(xsm_ops.assign_dtdevice, d, dtpath);
+    if ( xsm_ops.assign_dtdevice )
+        return alternative_call(xsm_ops.assign_dtdevice, d, dtpath);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_deassign_dtdevice(xsm_default_t def, struct domain *d,
+static inline int xsm_deassign_dtdevice(xsm_default_t action, struct domain *d,
                                         const char *dtpath)
 {
-    return alternative_call(xsm_ops.deassign_dtdevice, d, dtpath);
+    if ( xsm_ops.deassign_dtdevice )
+        return alternative_call(xsm_ops.deassign_dtdevice, d, dtpath);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
 #endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
 
-static inline int xsm_resource_plug_pci (xsm_default_t def, uint32_t machine_bdf)
+static inline int xsm_resource_plug_pci(xsm_default_t action, uint32_t machine_bdf)
 {
-    return alternative_call(xsm_ops.resource_plug_pci, machine_bdf);
+    if ( xsm_ops.resource_plug_pci )
+        return alternative_call(xsm_ops.resource_plug_pci, machine_bdf);
+
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
-static inline int xsm_resource_unplug_pci (xsm_default_t def, uint32_t machine_bdf)
+static inline int xsm_resource_unplug_pci(xsm_default_t action,
+                                           uint32_t machine_bdf)
 {
-    return alternative_call(xsm_ops.resource_unplug_pci, machine_bdf);
+    if ( xsm_ops.resource_unplug_pci )
+        return alternative_call(xsm_ops.resource_unplug_pci, machine_bdf);
+
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
-static inline int xsm_resource_plug_core (xsm_default_t def)
+static inline int xsm_resource_plug_core(xsm_default_t action)
 {
-    return alternative_call(xsm_ops.resource_plug_core);
+    if ( xsm_ops.resource_plug_core )
+        return alternative_call(xsm_ops.resource_plug_core);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
-static inline int xsm_resource_unplug_core (xsm_default_t def)
+static inline int xsm_resource_unplug_core(xsm_default_t action)
 {
-    return alternative_call(xsm_ops.resource_unplug_core);
+    if ( xsm_ops.resource_unplug_core )
+        return alternative_call(xsm_ops.resource_unplug_core);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
-static inline int xsm_resource_setup_pci (xsm_default_t def, uint32_t machine_bdf)
+static inline int xsm_resource_setup_pci(xsm_default_t action,
+                                         uint32_t machine_bdf)
 {
-    return alternative_call(xsm_ops.resource_setup_pci, machine_bdf);
+    if ( xsm_ops.resource_setup_pci )
+        return alternative_call(xsm_ops.resource_setup_pci, machine_bdf);
+
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
-static inline int xsm_resource_setup_gsi (xsm_default_t def, int gsi)
+static inline int xsm_resource_setup_gsi(xsm_default_t action, int gsi)
 {
-    return alternative_call(xsm_ops.resource_setup_gsi, gsi);
+    if ( xsm_ops.resource_setup_gsi )
+        return alternative_call(xsm_ops.resource_setup_gsi, gsi);
+
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
-static inline int xsm_resource_setup_misc (xsm_default_t def)
+static inline int xsm_resource_setup_misc (xsm_default_t action)
 {
-    return alternative_call(xsm_ops.resource_setup_misc);
+    if ( xsm_ops.resource_setup_misc )
+        return alternative_call(xsm_ops.resource_setup_misc);
+
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
-static inline int xsm_page_offline(xsm_default_t def, uint32_t cmd)
+static inline int xsm_page_offline(xsm_default_t action, uint32_t cmd)
 {
-    return alternative_call(xsm_ops.page_offline, cmd);
+    if ( xsm_ops.page_offline )
+        return alternative_call(xsm_ops.page_offline, cmd);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
-static inline int xsm_hypfs_op(xsm_default_t def)
+static inline int xsm_hypfs_op(xsm_default_t action)
 {
-    return alternative_call(xsm_ops.hypfs_op);
+    if ( xsm_ops.hypfs_op )
+        return alternative_call(xsm_ops.hypfs_op);
+
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
-static inline long xsm_do_xsm_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
+static inline long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 {
-    return xsm_ops.do_xsm_op(op);
+    if ( xsm_ops.do_xsm_op )
+        return xsm_ops.do_xsm_op(op);
+
+    return -ENOSYS;
 }
 
 #ifdef CONFIG_COMPAT
-static inline int xsm_do_compat_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
+static inline int xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 {
-    return xsm_ops.do_compat_op(op);
+    if ( xsm_ops.do_compat_op )
+        return xsm_ops.do_compat_op(op);
+
+    return -ENOSYS;
 }
 #endif
 
-static inline int xsm_hvm_param (xsm_default_t def, struct domain *d, unsigned long op)
+static inline int xsm_hvm_param(xsm_default_t action, struct domain *d,
+                                unsigned long op)
 {
-    return alternative_call(xsm_ops.hvm_param, d, op);
+    if ( xsm_ops.hvm_param )
+        return alternative_call(xsm_ops.hvm_param, d, op);
+
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_hvm_control(xsm_default_t def, struct domain *d, unsigned long op)
+static inline int xsm_hvm_control(xsm_default_t action, struct domain *d,
+                                  unsigned long op)
 {
-    return alternative_call(xsm_ops.hvm_control, d, op);
+    if ( xsm_ops.hvm_control )
+        return alternative_call(xsm_ops.hvm_control, d, op);
+
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_hvm_param_altp2mhvm (xsm_default_t def, struct domain *d)
+static inline int xsm_hvm_param_altp2mhvm(xsm_default_t action, struct domain *d)
 {
-    return alternative_call(xsm_ops.hvm_param_altp2mhvm, d);
+    if ( xsm_ops.hvm_param_altp2mhvm )
+        return alternative_call(xsm_ops.hvm_param_altp2mhvm, d);
+
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_hvm_altp2mhvm_op (xsm_default_t def, struct domain *d, uint64_t mode, uint32_t op)
+static inline int xsm_hvm_altp2mhvm_op(xsm_default_t action, struct domain *d,
+                                       uint64_t mode, uint32_t op)
 {
-    return alternative_call(xsm_ops.hvm_altp2mhvm_op, d, mode, op);
+    if ( xsm_ops.hvm_altp2mhvm_op )
+        return alternative_call(xsm_ops.hvm_altp2mhvm_op, d, mode, op);
+
+    XSM_ASSERT_ACTION(XSM_OTHER);
+
+    switch ( mode )
+    {
+    case XEN_ALTP2M_mixed:
+        return xsm_default_action(XSM_TARGET, current->domain, d);
+    case XEN_ALTP2M_external:
+        return xsm_default_action(XSM_DM_PRIV, current->domain, d);
+    case XEN_ALTP2M_limited:
+        if ( HVMOP_altp2m_vcpu_enable_notify == op )
+            return xsm_default_action(XSM_TARGET, current->domain, d);
+        return xsm_default_action(XSM_DM_PRIV, current->domain, d);
+    default:
+        return -EPERM;
+    }
 }
 
-static inline int xsm_get_vnumainfo (xsm_default_t def, struct domain *d)
+static inline int xsm_get_vnumainfo(xsm_default_t action, struct domain *d)
 {
-    return alternative_call(xsm_ops.get_vnumainfo, d);
+    if ( xsm_ops.get_vnumainfo )
+        return alternative_call(xsm_ops.get_vnumainfo, d);
+
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_vm_event_control (xsm_default_t def, struct domain *d, int mode, int op)
+static inline int xsm_vm_event_control(xsm_default_t action, struct domain *d,
+                                       int mode, int op)
 {
-    return alternative_call(xsm_ops.vm_event_control, d, mode, op);
+    if ( xsm_ops.vm_event_control )
+        return alternative_call(xsm_ops.vm_event_control, d, mode, op);
+
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, current->domain, d);
 }
 
 #ifdef CONFIG_MEM_ACCESS
-static inline int xsm_mem_access (xsm_default_t def, struct domain *d)
+static inline int xsm_mem_access(xsm_default_t action, struct domain *d)
 {
-    return alternative_call(xsm_ops.mem_access, d);
+    if ( xsm_ops.mem_access )
+        return alternative_call(xsm_ops.mem_access, d);
+
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    return xsm_default_action(action, current->domain, d);
 }
 #endif
 
 #ifdef CONFIG_MEM_PAGING
-static inline int xsm_mem_paging (xsm_default_t def, struct domain *d)
+static inline int xsm_mem_paging(xsm_default_t action, struct domain *d)
 {
-    return alternative_call(xsm_ops.mem_paging, d);
+    if ( xsm_ops.mem_paging )
+        return alternative_call(xsm_ops.mem_paging, d);
+
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    return xsm_default_action(action, current->domain, d);
 }
 #endif
 
 #ifdef CONFIG_MEM_SHARING
-static inline int xsm_mem_sharing (xsm_default_t def, struct domain *d)
+static inline int xsm_mem_sharing(xsm_default_t action, struct domain *d)
 {
-    return alternative_call(xsm_ops.mem_sharing, d);
+    if ( xsm_ops.mem_sharing )
+        return alternative_call(xsm_ops.mem_sharing, d);
+
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    return xsm_default_action(action, current->domain, d);
 }
 #endif
 
-static inline int xsm_platform_op (xsm_default_t def, uint32_t op)
+static inline int xsm_platform_op(xsm_default_t action, uint32_t op)
 {
-    return alternative_call(xsm_ops.platform_op, op);
+    if ( xsm_ops.platform_op )
+        return alternative_call(xsm_ops.platform_op, op);
+
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
 #ifdef CONFIG_X86
-static inline int xsm_do_mca(xsm_default_t def)
+static inline int xsm_do_mca(xsm_default_t action)
 {
-    return alternative_call(xsm_ops.do_mca);
+    if ( xsm_ops.do_mca )
+        return alternative_call(xsm_ops.do_mca);
+
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
-static inline int xsm_shadow_control (xsm_default_t def, struct domain *d, uint32_t op)
+static inline int xsm_shadow_control(xsm_default_t action, struct domain *d,
+                                     uint32_t op)
 {
-    return alternative_call(xsm_ops.shadow_control, d, op);
+    if ( xsm_ops.shadow_control )
+        return alternative_call(xsm_ops.shadow_control, d, op);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_mem_sharing_op (xsm_default_t def, struct domain *d, struct domain *cd, int op)
+static inline int xsm_mem_sharing_op(xsm_default_t action, struct domain *d,
+                                     struct domain *cd, int op)
 {
-    return alternative_call(xsm_ops.mem_sharing_op, d, cd, op);
+    if ( xsm_ops.mem_sharing_op )
+        return alternative_call(xsm_ops.mem_sharing_op, d, cd, op);
+
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    return xsm_default_action(action, current->domain, cd);
 }
 
-static inline int xsm_apic (xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_apic(xsm_default_t action, struct domain *d, int cmd)
 {
-    return alternative_call(xsm_ops.apic, d, cmd);
+    if ( xsm_ops.apic )
+        return alternative_call(xsm_ops.apic, d, cmd);
+
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, d, NULL);
 }
 
-static inline int xsm_memtype (xsm_default_t def, uint32_t access)
+/* No longer called */
+static inline int xsm_memtype(xsm_default_t action, uint32_t access)
 {
-    return alternative_call(xsm_ops.memtype, access);
+    if ( xsm_ops.memtype )
+        return alternative_call(xsm_ops.memtype, access);
 }
 
-static inline int xsm_machine_memory_map(xsm_default_t def)
+static inline int xsm_machine_memory_map(xsm_default_t action)
 {
-    return alternative_call(xsm_ops.machine_memory_map);
+    if ( xsm_ops.machine_memory_map )
+        return alternative_call(xsm_ops.machine_memory_map);
+
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, current->domain, NULL);
 }
 
-static inline int xsm_domain_memory_map(xsm_default_t def, struct domain *d)
+static inline int xsm_domain_memory_map(xsm_default_t action, struct domain *d)
 {
-    return alternative_call(xsm_ops.domain_memory_map, d);
+    if ( xsm_ops.domain_memory_map )
+        return alternative_call(xsm_ops.domain_memory_map, d);
+
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_mmu_update (xsm_default_t def, struct domain *d, struct domain *t,
-                                  struct domain *f, uint32_t flags)
+static inline int xsm_mmu_update(xsm_default_t action, struct domain *d,
+                                 struct domain *t, struct domain *f,
+                                 uint32_t flags)
 {
-    return alternative_call(xsm_ops.mmu_update, d, t, f, flags);
+    int rc = 0;
+
+    if ( xsm_ops.mmu_update )
+        return alternative_call(xsm_ops.mmu_update, d, t, f, flags);
+
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    if ( f != dom_io )
+        rc = xsm_default_action(action, d, f);
+    if ( evaluate_nospec(t) && !rc )
+        rc = xsm_default_action(action, d, t);
+    return rc;
 }
 
-static inline int xsm_mmuext_op (xsm_default_t def, struct domain *d, struct domain *f)
+static inline int xsm_mmuext_op(xsm_default_t action, struct domain *d,
+                                struct domain *f)
 {
-    return alternative_call(xsm_ops.mmuext_op, d, f);
+    if ( xsm_ops.mmuext_op )
+        return alternative_call(xsm_ops.mmuext_op, d, f);
+
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, d, f);
 }
 
-static inline int xsm_update_va_mapping(xsm_default_t def, struct domain *d, struct domain *f,
-                                                            l1_pgentry_t pte)
+static inline int xsm_update_va_mapping(xsm_default_t action, struct domain *d,
+                                        struct domain *f, l1_pgentry_t pte)
 {
-    return xsm_ops.update_va_mapping(d, f, pte);
+    if ( xsm_ops.update_va_mapping )
+        return xsm_ops.update_va_mapping(d, f, pte);
+
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, d, f);
 }
 
-static inline int xsm_priv_mapping(xsm_default_t def, struct domain *d, struct domain *t)
+static inline int xsm_priv_mapping(xsm_default_t action, struct domain *d,
+                                   struct domain *t)
 {
-    return alternative_call(xsm_ops.priv_mapping, d, t);
+    if ( xsm_ops.priv_mapping )
+        return alternative_call(xsm_ops.priv_mapping, d, t);
+
+    XSM_ASSERT_ACTION(XSM_TARGET);
+    return xsm_default_action(action, d, t);
 }
 
-static inline int xsm_ioport_permission (xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+static inline int xsm_ioport_permission(xsm_default_t action, struct domain *d,
+                                        uint32_t s, uint32_t e, uint8_t allow)
 {
-    return alternative_call(xsm_ops.ioport_permission, d, s, e, allow);
+    if ( xsm_ops.ioport_permission )
+        return alternative_call(xsm_ops.ioport_permission, d, s, e, allow);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_ioport_mapping (xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+static inline int xsm_ioport_mapping(xsm_default_t action, struct domain *d,
+                                     uint32_t s, uint32_t e, uint8_t allow)
 {
-    return alternative_call(xsm_ops.ioport_mapping, d, s, e, allow);
+    if ( xsm_ops.ioport_mapping )
+        return alternative_call(xsm_ops.ioport_mapping, d, s, e, allow);
+
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_pmu_op (xsm_default_t def, struct domain *d, unsigned int op)
+static inline int xsm_pmu_op(xsm_default_t action, struct domain *d,
+                             unsigned int op)
 {
-    return alternative_call(xsm_ops.pmu_op, d, op);
+    if ( xsm_ops.pmu_op )
+        return alternative_call(xsm_ops.pmu_op, d, op);
+
+    XSM_ASSERT_ACTION(XSM_OTHER);
+    switch ( op )
+    {
+    case XENPMU_init:
+    case XENPMU_finish:
+    case XENPMU_lvtpc_set:
+    case XENPMU_flush:
+        return xsm_default_action(XSM_HOOK, d, current->domain);
+    default:
+        return xsm_default_action(XSM_PRIV, d, current->domain);
+    }
 }
 
 #endif /* CONFIG_X86 */
 
-static inline int xsm_dm_op(xsm_default_t def, struct domain *d)
+static inline int xsm_dm_op(xsm_default_t action, struct domain *d)
 {
-    return alternative_call(xsm_ops.dm_op, d);
+    if ( xsm_ops.dm_op )
+        return alternative_call(xsm_ops.dm_op, d);
+
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    return xsm_default_action(action, current->domain, d);
 }
 
-static inline int xsm_xen_version (xsm_default_t def, uint32_t op)
+static inline int xsm_xen_version(xsm_default_t action, uint32_t op)
 {
-    return alternative_call(xsm_ops.xen_version, op);
+    if ( xsm_ops.xen_version )
+        return alternative_call(xsm_ops.xen_version, op);
+
+    XSM_ASSERT_ACTION(XSM_OTHER);
+    switch ( op )
+    {
+    case XENVER_version:
+    case XENVER_platform_parameters:
+    case XENVER_get_features:
+        /* These sub-ops ignore the permission checks and return data. */
+        block_speculation();
+        return 0;
+    case XENVER_extraversion:
+    case XENVER_compile_info:
+    case XENVER_capabilities:
+    case XENVER_changeset:
+    case XENVER_pagesize:
+    case XENVER_guest_handle:
+        /* These MUST always be accessible to any guest by default. */
+        return xsm_default_action(XSM_HOOK, current->domain, NULL);
+    default:
+        return xsm_default_action(XSM_PRIV, current->domain, NULL);
+    }
 }
 
-static inline int xsm_domain_resource_map(xsm_default_t def, struct domain *d)
+static inline int xsm_domain_resource_map(xsm_default_t action, struct domain *d)
 {
-    return alternative_call(xsm_ops.domain_resource_map, d);
+    if ( xsm_ops.domain_resource_map )
+        return alternative_call(xsm_ops.domain_resource_map, d);
+
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
+    return xsm_default_action(action, current->domain, d);
 }
 
 #ifdef CONFIG_ARGO
 static inline int xsm_argo_enable(const struct domain *d)
 {
-    return alternative_call(xsm_ops.argo_enable, d);
+    if ( xsm_ops.argo_enable )
+        return alternative_call(xsm_ops.argo_enable, d);
+
+    return 0;
 }
 
 static inline int xsm_argo_register_single_source(const struct domain *d,
                                                   const struct domain *t)
 {
-    return alternative_call(xsm_ops.argo_register_single_source, d, t);
+    if ( xsm_ops.argo_register_single_source )
+        return alternative_call(xsm_ops.argo_register_single_source, d, t);
+
+    return 0;
 }
 
 static inline int xsm_argo_register_any_source(const struct domain *d)
 {
-    return alternative_call(xsm_ops.argo_register_any_source, d);
+    if ( xsm_ops.argo_register_any_source )
+        return alternative_call(xsm_ops.argo_register_any_source, d);
+
+    return 0;
 }
 
 static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 {
-    return alternative_call(xsm_ops.argo_send, d, t);
+    if ( xsm_ops.argo_send )
+        return alternative_call(xsm_ops.argo_send, d, t);
+
+    return 0;
 }
 
 #endif /* CONFIG_ARGO */
 
-#else /* CONFIG_XSM */
-
-#include <xsm/dummy.h>
-
-#endif /* CONFIG_XSM */
-
 #endif /* __XSM_H */
diff --git a/xen/xsm/Makefile b/xen/xsm/Makefile
index cf0a728f1c..ab1fb74edc 100644
--- a/xen/xsm/Makefile
+++ b/xen/xsm/Makefile
@@ -1,6 +1,5 @@
 obj-y += xsm_core.o
-obj-$(CONFIG_XSM) += xsm_policy.o
-obj-$(CONFIG_XSM) += dummy.o
+obj-y += xsm_policy.o
 obj-$(CONFIG_XSM_SILO) += silo.o
 
 obj-$(CONFIG_XSM_FLASK) += flask/
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
deleted file mode 100644
index b848580eaa..0000000000
--- a/xen/xsm/dummy.c
+++ /dev/null
@@ -1,157 +0,0 @@
-/*
- *  This work is based on the LSM implementation in Linux 2.6.13.4.
- *
- *  Author:  George Coker, <gscoker@alpha.ncsc.mil>
- *
- *  Contributors: Michael LeMay, <mdlemay@epoch.ncsc.mil>
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2,
- *  as published by the Free Software Foundation.
- */
-
-#include <xsm/dummy.h>
-
-#define set_to_dummy_if_null(ops, function)                            \
-    do {                                                               \
-        if ( !ops->function )                                          \
-            ops->function = xsm_##function;                            \
-    } while (0)
-
-void __init xsm_fixup_ops (struct xsm_ops *ops)
-{
-    set_to_dummy_if_null(ops, security_domaininfo);
-    set_to_dummy_if_null(ops, domain_create);
-    set_to_dummy_if_null(ops, getdomaininfo);
-    set_to_dummy_if_null(ops, domctl_scheduler_op);
-    set_to_dummy_if_null(ops, sysctl_scheduler_op);
-    set_to_dummy_if_null(ops, set_target);
-    set_to_dummy_if_null(ops, domctl);
-    set_to_dummy_if_null(ops, sysctl);
-    set_to_dummy_if_null(ops, readconsole);
-
-    set_to_dummy_if_null(ops, evtchn_unbound);
-    set_to_dummy_if_null(ops, evtchn_interdomain);
-    set_to_dummy_if_null(ops, evtchn_close_post);
-    set_to_dummy_if_null(ops, evtchn_send);
-    set_to_dummy_if_null(ops, evtchn_status);
-    set_to_dummy_if_null(ops, evtchn_reset);
-
-    set_to_dummy_if_null(ops, grant_mapref);
-    set_to_dummy_if_null(ops, grant_unmapref);
-    set_to_dummy_if_null(ops, grant_setup);
-    set_to_dummy_if_null(ops, grant_transfer);
-    set_to_dummy_if_null(ops, grant_copy);
-    set_to_dummy_if_null(ops, grant_query_size);
-
-    set_to_dummy_if_null(ops, alloc_security_domain);
-    set_to_dummy_if_null(ops, free_security_domain);
-    set_to_dummy_if_null(ops, alloc_security_evtchns);
-    set_to_dummy_if_null(ops, free_security_evtchns);
-    set_to_dummy_if_null(ops, show_security_evtchn);
-    set_to_dummy_if_null(ops, init_hardware_domain);
-
-    set_to_dummy_if_null(ops, get_pod_target);
-    set_to_dummy_if_null(ops, set_pod_target);
-
-    set_to_dummy_if_null(ops, memory_exchange);
-    set_to_dummy_if_null(ops, memory_adjust_reservation);
-    set_to_dummy_if_null(ops, memory_stat_reservation);
-    set_to_dummy_if_null(ops, memory_pin_page);
-    set_to_dummy_if_null(ops, claim_pages);
-
-    set_to_dummy_if_null(ops, console_io);
-
-    set_to_dummy_if_null(ops, profile);
-
-    set_to_dummy_if_null(ops, kexec);
-    set_to_dummy_if_null(ops, schedop_shutdown);
-
-    set_to_dummy_if_null(ops, show_irq_sid);
-    set_to_dummy_if_null(ops, map_domain_pirq);
-    set_to_dummy_if_null(ops, map_domain_irq);
-    set_to_dummy_if_null(ops, unmap_domain_pirq);
-    set_to_dummy_if_null(ops, unmap_domain_irq);
-    set_to_dummy_if_null(ops, bind_pt_irq);
-    set_to_dummy_if_null(ops, unbind_pt_irq);
-    set_to_dummy_if_null(ops, irq_permission);
-    set_to_dummy_if_null(ops, iomem_permission);
-    set_to_dummy_if_null(ops, iomem_mapping);
-    set_to_dummy_if_null(ops, pci_config_permission);
-    set_to_dummy_if_null(ops, get_vnumainfo);
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-    set_to_dummy_if_null(ops, get_device_group);
-    set_to_dummy_if_null(ops, assign_device);
-    set_to_dummy_if_null(ops, deassign_device);
-#endif
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
-    set_to_dummy_if_null(ops, assign_dtdevice);
-    set_to_dummy_if_null(ops, deassign_dtdevice);
-#endif
-
-    set_to_dummy_if_null(ops, resource_plug_core);
-    set_to_dummy_if_null(ops, resource_unplug_core);
-    set_to_dummy_if_null(ops, resource_plug_pci);
-    set_to_dummy_if_null(ops, resource_unplug_pci);
-    set_to_dummy_if_null(ops, resource_setup_pci);
-    set_to_dummy_if_null(ops, resource_setup_gsi);
-    set_to_dummy_if_null(ops, resource_setup_misc);
-
-    set_to_dummy_if_null(ops, page_offline);
-    set_to_dummy_if_null(ops, hypfs_op);
-    set_to_dummy_if_null(ops, hvm_param);
-    set_to_dummy_if_null(ops, hvm_control);
-    set_to_dummy_if_null(ops, hvm_param_altp2mhvm);
-    set_to_dummy_if_null(ops, hvm_altp2mhvm_op);
-
-    set_to_dummy_if_null(ops, do_xsm_op);
-#ifdef CONFIG_COMPAT
-    set_to_dummy_if_null(ops, do_compat_op);
-#endif
-
-    set_to_dummy_if_null(ops, add_to_physmap);
-    set_to_dummy_if_null(ops, remove_from_physmap);
-    set_to_dummy_if_null(ops, map_gmfn_foreign);
-
-    set_to_dummy_if_null(ops, vm_event_control);
-
-#ifdef CONFIG_MEM_ACCESS
-    set_to_dummy_if_null(ops, mem_access);
-#endif
-
-#ifdef CONFIG_MEM_PAGING
-    set_to_dummy_if_null(ops, mem_paging);
-#endif
-
-#ifdef CONFIG_MEM_SHARING
-    set_to_dummy_if_null(ops, mem_sharing);
-#endif
-
-    set_to_dummy_if_null(ops, platform_op);
-#ifdef CONFIG_X86
-    set_to_dummy_if_null(ops, do_mca);
-    set_to_dummy_if_null(ops, shadow_control);
-    set_to_dummy_if_null(ops, mem_sharing_op);
-    set_to_dummy_if_null(ops, apic);
-    set_to_dummy_if_null(ops, machine_memory_map);
-    set_to_dummy_if_null(ops, domain_memory_map);
-    set_to_dummy_if_null(ops, mmu_update);
-    set_to_dummy_if_null(ops, mmuext_op);
-    set_to_dummy_if_null(ops, update_va_mapping);
-    set_to_dummy_if_null(ops, priv_mapping);
-    set_to_dummy_if_null(ops, ioport_permission);
-    set_to_dummy_if_null(ops, ioport_mapping);
-    set_to_dummy_if_null(ops, pmu_op);
-#endif
-    set_to_dummy_if_null(ops, dm_op);
-    set_to_dummy_if_null(ops, xen_version);
-    set_to_dummy_if_null(ops, domain_resource_map);
-#ifdef CONFIG_ARGO
-    set_to_dummy_if_null(ops, argo_enable);
-    set_to_dummy_if_null(ops, argo_register_single_source);
-    set_to_dummy_if_null(ops, argo_register_any_source);
-    set_to_dummy_if_null(ops, argo_send);
-#endif
-}
diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
index 4ef40bd712..0455e1eb4b 100644
--- a/xen/xsm/silo.c
+++ b/xen/xsm/silo.c
@@ -17,6 +17,7 @@
  * You should have received a copy of the GNU General Public License along with
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
+#include <xsm/xsm-core.h>
 #include <xsm/dummy.h>
 
 /*
@@ -43,7 +44,7 @@ static int silo_evtchn_unbound(struct domain *d1, struct evtchn *chn,
     else
     {
         if ( silo_mode_dom_check(d1, d2) )
-            rc = xsm_evtchn_unbound(d1, chn, id2);
+            rc = xsm_default_action(XSM_TARGET, current->domain, d1);
         rcu_unlock_domain(d2);
     }
 
@@ -54,7 +55,7 @@ static int silo_evtchn_interdomain(struct domain *d1, struct evtchn *chan1,
                                    struct domain *d2, struct evtchn *chan2)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_evtchn_interdomain(d1, chan1, d2, chan2);
+        return xsm_default_action(XSM_HOOK, d1, d2);
     return -EPERM;
 }
 
@@ -62,21 +63,21 @@ static int silo_grant_mapref(struct domain *d1, struct domain *d2,
                              uint32_t flags)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_grant_mapref(d1, d2, flags);
+        return xsm_default_action(XSM_HOOK, d1, d2);
     return -EPERM;
 }
 
 static int silo_grant_transfer(struct domain *d1, struct domain *d2)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_grant_transfer(d1, d2);
+        return xsm_default_action(XSM_HOOK, d1, d2);
     return -EPERM;
 }
 
 static int silo_grant_copy(struct domain *d1, struct domain *d2)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_grant_copy(d1, d2);
+        return xsm_default_action(XSM_HOOK, d1, d2);
     return -EPERM;
 }
 
@@ -86,14 +87,14 @@ static int silo_argo_register_single_source(const struct domain *d1,
                                             const struct domain *d2)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_argo_register_single_source(d1, d2);
+        return 0;
     return -EPERM;
 }
 
 static int silo_argo_send(const struct domain *d1, const struct domain *d2)
 {
     if ( silo_mode_dom_check(d1, d2) )
-        return xsm_argo_send(d1, d2);
+        return 0;
     return -EPERM;
 }
 
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index b5219dff78..75bd2678ef 100644
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
@@ -124,16 +122,12 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
         break;
     }
 
-    /*
-     * This handles three cases,
-     *   - dummy policy module was selected
-     *   - a policy module does not provide all handlers
-     *   - a policy module failed to init
-     */
-    xsm_fixup_ops(&xsm_ops);
-
-    if ( xsm_ops_registered != XSM_OPS_REGISTERED )
+    if ( xsm_ops_registered != XSM_OPS_REGISTERED ) {
         xsm_ops_registered = XSM_OPS_REG_FAILED;
+        printk(XENLOG_ERR
+               "Could not init XSM, xsm_ops register failed\n");
+        return -EFAULT;
+    }
 
     return 0;
 }
@@ -217,8 +211,6 @@ bool __init has_xsm_magic(paddr_t start)
 }
 #endif
 
-#endif
-
 long do_xsm_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 {
     return xsm_do_xsm_op(op);
-- 
2.20.1


