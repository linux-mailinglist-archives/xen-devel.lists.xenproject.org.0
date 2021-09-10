Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88858405F48
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 00:13:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183600.331892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOSIX-0006DG-SZ; Thu, 09 Sep 2021 22:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183600.331892; Thu, 09 Sep 2021 22:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOSIX-0006B8-P4; Thu, 09 Sep 2021 22:13:33 +0000
Received: by outflank-mailman (input) for mailman id 183600;
 Thu, 09 Sep 2021 22:13:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mNcr=N7=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mOSIW-00067V-O1
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 22:13:32 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28d73df8-11bb-11ec-b1fd-12813bfff9fa;
 Thu, 09 Sep 2021 22:13:29 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631225555014620.6087293213108;
 Thu, 9 Sep 2021 15:12:35 -0700 (PDT)
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
X-Inumbo-ID: 28d73df8-11bb-11ec-b1fd-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1631225558; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UMUdlEL/TsGgJxdCS6nvFFZhgE3wAuQfJiKJ5FPjDpFZpkAPS1Eq9mB8Y5eCNo8R55E64Te/8lZTDu7+oyQ4pr+tcstQo/Ep8qkN8JVhqMsWJm3szGwUDMzyZA0yliCTLZv7T33S/TaXTwI60HgJkTcDCayo5vEbW7/ib5epk20=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631225558; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=DHtmQ/KklNUGBW5ChJ6zA6VgOYa8ooPC62GymxumpGA=; 
	b=EgmSYbgtdfs60Vp/XqXSy6Pm1vH/jLb694Wq6salCtJwLaS/l1fGNsLlfzmPBw0fXLhoqFLTuf/h8KqyQkGnHrB0Nay68jWEp9ifWuxGwI/yUG069VJJ4pcK2ZTnvcmenRJIM5LaTsoSywS7+rbsGypx4/Xads+y2VfLQB3n1Rs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631225558;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=DHtmQ/KklNUGBW5ChJ6zA6VgOYa8ooPC62GymxumpGA=;
	b=YLnDk0r8yS8b2FSQktupv+HqNy4j1ZrbboV1s51sNhAuebfW7lEnvOzB287TaFvN
	1OP3VpkXrnu53OjnDzOdavqbbFEzu2z8UTIUfjrstEfT7Lg5wb3VAE0j2lEWn+6xFuJ
	lfcl5/sOBiLIJhIGopEctxdDECZpnSh4Pq1Lydec=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v5 05/10] xsm: apply coding style
Date: Thu,  9 Sep 2021 22:12:30 -0400
Message-Id: <20210910021236.15082-6-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210910021236.15082-1-dpsmith@apertussolutions.com>
References: <20210910021236.15082-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Instead of intermixing coding style changes with code changes as they
are come upon in this patch set, moving all coding style changes
into a single commit. The focus of coding style changes here are,

 - move trailing comments to line above
 - ensuring line length does not exceed 80 chars
 - ensuring proper indentation for 80 char wrapping
 - covert u32 type statements to  uint32_t
 - remove space between closing and opening parens
 - drop extern on function declarations

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xsm/dummy.h | 196 ++++++++++------
 xen/include/xsm/xsm.h   | 499 ++++++++++++++++++++++------------------
 xen/xsm/xsm_core.c      |   8 +-
 xen/xsm/xsm_policy.c    |   7 +-
 4 files changed, 401 insertions(+), 309 deletions(-)

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 214b5408b1..bfcfee1d9e 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -19,7 +19,8 @@
 #include <xsm/xsm.h>
 #include <public/hvm/params.h>
 
-/* Cannot use BUILD_BUG_ON here because the expressions we check are not
+/*
+ * Cannot use BUILD_BUG_ON here because the expressions we check are not
  * considered constant at compile time. Instead, rely on constant propagation to
  * inline out the calls to this invalid function, which will cause linker errors
  * if references remain at link time.
@@ -44,7 +45,8 @@ void __xsm_action_mismatch_detected(void);
 
 #ifdef CONFIG_XSM
 
-/* In CONFIG_XSM builds, this header file is included from xsm/dummy.c, and
+/*
+ * In CONFIG_XSM builds, this header file is included from xsm/dummy.c, and
  * contains static (not inline) functions compiled to the dummy XSM module.
  * There is no xsm_default_t argument available, so the value from the assertion
  * is used to initialize the variable.
@@ -57,7 +59,8 @@ void __xsm_action_mismatch_detected(void);
 
 #else /* CONFIG_XSM */
 
-/* In !CONFIG_XSM builds, this header file is included from xsm/xsm.h, and
+/*
+ * In !CONFIG_XSM builds, this header file is included from xsm/xsm.h, and
  * contains inline functions for each XSM hook. These functions also perform
  * compile-time checks on the xsm_default_t argument to ensure that the behavior
  * of the dummy XSM module is the same as the behavior with XSM disabled.
@@ -70,7 +73,7 @@ void __xsm_action_mismatch_detected(void);
 #endif /* CONFIG_XSM */
 
 static always_inline int xsm_default_action(
-    xsm_default_t action, struct domain *src, struct domain *target)
+	xsm_default_t action, struct domain *src, struct domain *target)
 {
     switch ( action ) {
     case XSM_HOOK:
@@ -98,13 +101,14 @@ static always_inline int xsm_default_action(
     }
 }
 
-static XSM_INLINE void xsm_security_domaininfo(struct domain *d,
-                                    struct xen_domctl_getdomaininfo *info)
+static XSM_INLINE void xsm_security_domaininfo(
+	struct domain *d, struct xen_domctl_getdomaininfo *info)
 {
     return;
 }
 
-static XSM_INLINE int xsm_domain_create(XSM_DEFAULT_ARG struct domain *d, u32 ssidref)
+static XSM_INLINE int xsm_domain_create(
+	XSM_DEFAULT_ARG struct domain *d, uint32_t ssidref)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
@@ -116,7 +120,8 @@ static XSM_INLINE int xsm_getdomaininfo(XSM_DEFAULT_ARG struct domain *d)
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_domctl_scheduler_op(XSM_DEFAULT_ARG struct domain *d, int cmd)
+static XSM_INLINE int xsm_domctl_scheduler_op(
+	XSM_DEFAULT_ARG struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
@@ -128,7 +133,8 @@ static XSM_INLINE int xsm_sysctl_scheduler_op(XSM_DEFAULT_ARG int cmd)
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_set_target(XSM_DEFAULT_ARG struct domain *d, struct domain *e)
+static XSM_INLINE int xsm_set_target(
+	XSM_DEFAULT_ARG struct domain *d, struct domain *e)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
@@ -173,38 +179,43 @@ static XSM_INLINE void xsm_free_security_domain(struct domain *d)
     return;
 }
 
-static XSM_INLINE int xsm_grant_mapref(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2,
-                                                                uint32_t flags)
+static XSM_INLINE int xsm_grant_mapref(
+	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2, uint32_t flags)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_grant_unmapref(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int xsm_grant_unmapref(
+	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_grant_setup(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int xsm_grant_setup(
+	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_grant_transfer(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int xsm_grant_transfer(
+	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_grant_copy(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int xsm_grant_copy(
+	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_grant_query_size(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int xsm_grant_query_size(
+	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
@@ -216,14 +227,15 @@ static XSM_INLINE int xsm_memory_exchange(XSM_DEFAULT_ARG struct domain *d)
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_memory_adjust_reservation(XSM_DEFAULT_ARG struct domain *d1,
-                                                            struct domain *d2)
+static XSM_INLINE int xsm_memory_adjust_reservation(
+	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_memory_stat_reservation(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int xsm_memory_stat_reservation(
+	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
@@ -253,14 +265,16 @@ static XSM_INLINE int xsm_kexec(XSM_DEFAULT_VOID)
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_schedop_shutdown(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int xsm_schedop_shutdown(
+	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_memory_pin_page(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2,
-                                          struct page_info *page)
+static XSM_INLINE int xsm_memory_pin_page(
+	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2,
+    struct page_info *page)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
@@ -272,15 +286,16 @@ static XSM_INLINE int xsm_claim_pages(XSM_DEFAULT_ARG struct domain *d)
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_evtchn_unbound(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn,
-                                         domid_t id2)
+static XSM_INLINE int xsm_evtchn_unbound(
+	XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn, domid_t id2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_evtchn_interdomain(XSM_DEFAULT_ARG struct domain *d1, struct evtchn
-                                *chan1, struct domain *d2, struct evtchn *chan2)
+static XSM_INLINE int xsm_evtchn_interdomain(
+	XSM_DEFAULT_ARG struct domain *d1, struct evtchn *chan1, struct domain *d2,
+    struct evtchn *chan2)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
@@ -291,37 +306,41 @@ static XSM_INLINE void xsm_evtchn_close_post(struct evtchn *chn)
     return;
 }
 
-static XSM_INLINE int xsm_evtchn_send(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
+static XSM_INLINE int xsm_evtchn_send(
+	XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d, NULL);
 }
 
-static XSM_INLINE int xsm_evtchn_status(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
+static XSM_INLINE int xsm_evtchn_status(
+	XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_evtchn_reset(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int xsm_evtchn_reset(
+	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
 static XSM_INLINE int xsm_alloc_security_evtchns(
-    struct evtchn chn[], unsigned int nr)
+	struct evtchn chn[], unsigned int nr)
 {
     return 0;
 }
 
 static XSM_INLINE void xsm_free_security_evtchns(
-    struct evtchn chn[], unsigned int nr)
+	struct evtchn chn[], unsigned int nr)
 {
     return;
 }
 
-static XSM_INLINE char *xsm_show_security_evtchn(struct domain *d, const struct evtchn *chn)
+static XSM_INLINE char *xsm_show_security_evtchn(
+	struct domain *d, const struct evtchn *chn)
 {
     return NULL;
 }
@@ -357,13 +376,15 @@ static XSM_INLINE int xsm_get_device_group(XSM_DEFAULT_ARG uint32_t machine_bdf)
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_assign_device(XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf)
+static XSM_INLINE int xsm_assign_device(
+	XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_deassign_device(XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf)
+static XSM_INLINE int xsm_deassign_device(
+	XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
@@ -372,15 +393,15 @@ static XSM_INLINE int xsm_deassign_device(XSM_DEFAULT_ARG struct domain *d, uint
 #endif /* HAS_PASSTHROUGH && HAS_PCI */
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
-static XSM_INLINE int xsm_assign_dtdevice(XSM_DEFAULT_ARG struct domain *d,
-                                          const char *dtpath)
+static XSM_INLINE int xsm_assign_dtdevice(
+	XSM_DEFAULT_ARG struct domain *d, const char *dtpath)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_deassign_dtdevice(XSM_DEFAULT_ARG struct domain *d,
-                                            const char *dtpath)
+static XSM_INLINE int xsm_deassign_dtdevice(
+	XSM_DEFAULT_ARG struct domain *d, const char *dtpath)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
@@ -400,19 +421,22 @@ static XSM_INLINE int xsm_resource_unplug_core(XSM_DEFAULT_VOID)
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_resource_plug_pci(XSM_DEFAULT_ARG uint32_t machine_bdf)
+static XSM_INLINE int xsm_resource_plug_pci(
+	XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_resource_unplug_pci(XSM_DEFAULT_ARG uint32_t machine_bdf)
+static XSM_INLINE int xsm_resource_unplug_pci(
+	XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_resource_setup_pci(XSM_DEFAULT_ARG uint32_t machine_bdf)
+static XSM_INLINE int xsm_resource_setup_pci(
+	XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
@@ -465,8 +489,8 @@ static XSM_INLINE int xsm_map_domain_pirq(XSM_DEFAULT_ARG struct domain *d)
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_map_domain_irq(XSM_DEFAULT_ARG struct domain *d,
-                                         int irq, const void *data)
+static XSM_INLINE int xsm_map_domain_irq(
+	XSM_DEFAULT_ARG struct domain *d, int irq, const void *data)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
@@ -478,76 +502,86 @@ static XSM_INLINE int xsm_unmap_domain_pirq(XSM_DEFAULT_ARG struct domain *d)
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_bind_pt_irq(XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
+static XSM_INLINE int xsm_bind_pt_irq(
+	XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_unbind_pt_irq(XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
+static XSM_INLINE int xsm_unbind_pt_irq(
+	XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_unmap_domain_irq(XSM_DEFAULT_ARG struct domain *d,
-                                           int irq, const void *data)
+static XSM_INLINE int xsm_unmap_domain_irq(
+	XSM_DEFAULT_ARG struct domain *d, int irq, const void *data)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_irq_permission(XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
+static XSM_INLINE int xsm_irq_permission(
+	XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_iomem_permission(XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+static XSM_INLINE int xsm_iomem_permission(
+	XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_iomem_mapping(XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+static XSM_INLINE int xsm_iomem_mapping(
+	XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_pci_config_permission(XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf,
-                                        uint16_t start, uint16_t end,
-                                        uint8_t access)
+static XSM_INLINE int xsm_pci_config_permission(
+	XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf, uint16_t start,
+    uint16_t end, uint8_t access)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_add_to_physmap(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int xsm_add_to_physmap(
+	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_remove_from_physmap(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static XSM_INLINE int xsm_remove_from_physmap(
+	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int xsm_map_gmfn_foreign(XSM_DEFAULT_ARG struct domain *d, struct domain *t)
+static XSM_INLINE int xsm_map_gmfn_foreign(
+	XSM_DEFAULT_ARG struct domain *d, struct domain *t)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, t);
 }
 
-static XSM_INLINE int xsm_hvm_param(XSM_DEFAULT_ARG struct domain *d, unsigned long op)
+static XSM_INLINE int xsm_hvm_param(
+	XSM_DEFAULT_ARG struct domain *d, unsigned long op)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_hvm_control(XSM_DEFAULT_ARG struct domain *d, unsigned long op)
+static XSM_INLINE int xsm_hvm_control(
+	XSM_DEFAULT_ARG struct domain *d, unsigned long op)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
@@ -559,7 +593,8 @@ static XSM_INLINE int xsm_hvm_param_altp2mhvm(XSM_DEFAULT_ARG struct domain *d)
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_hvm_altp2mhvm_op(XSM_DEFAULT_ARG struct domain *d, uint64_t mode, uint32_t op)
+static XSM_INLINE int xsm_hvm_altp2mhvm_op(
+	XSM_DEFAULT_ARG struct domain *d, uint64_t mode, uint32_t op)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
 
@@ -578,7 +613,8 @@ static XSM_INLINE int xsm_hvm_altp2mhvm_op(XSM_DEFAULT_ARG struct domain *d, uin
     }
 }
 
-static XSM_INLINE int xsm_vm_event_control(XSM_DEFAULT_ARG struct domain *d, int mode, int op)
+static XSM_INLINE int xsm_vm_event_control(
+	XSM_DEFAULT_ARG struct domain *d, int mode, int op)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
@@ -621,13 +657,15 @@ static XSM_INLINE int xsm_do_mca(XSM_DEFAULT_VOID)
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int xsm_shadow_control(XSM_DEFAULT_ARG struct domain *d, uint32_t op)
+static XSM_INLINE int xsm_shadow_control(
+	XSM_DEFAULT_ARG struct domain *d, uint32_t op)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_mem_sharing_op(XSM_DEFAULT_ARG struct domain *d, struct domain *cd, int op)
+static XSM_INLINE int xsm_mem_sharing_op(
+	XSM_DEFAULT_ARG struct domain *d, struct domain *cd, int op)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, cd);
@@ -651,8 +689,9 @@ static XSM_INLINE int xsm_domain_memory_map(XSM_DEFAULT_ARG struct domain *d)
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_mmu_update(XSM_DEFAULT_ARG struct domain *d, struct domain *t,
-                                     struct domain *f, uint32_t flags)
+static XSM_INLINE int xsm_mmu_update(
+	XSM_DEFAULT_ARG struct domain *d, struct domain *t, struct domain *f,
+    uint32_t flags)
 {
     int rc = 0;
     XSM_ASSERT_ACTION(XSM_TARGET);
@@ -663,38 +702,43 @@ static XSM_INLINE int xsm_mmu_update(XSM_DEFAULT_ARG struct domain *d, struct do
     return rc;
 }
 
-static XSM_INLINE int xsm_mmuext_op(XSM_DEFAULT_ARG struct domain *d, struct domain *f)
+static XSM_INLINE int xsm_mmuext_op(
+	XSM_DEFAULT_ARG struct domain *d, struct domain *f)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, f);
 }
 
-static XSM_INLINE int xsm_update_va_mapping(XSM_DEFAULT_ARG struct domain *d, struct domain *f, 
-                                                            l1_pgentry_t pte)
+static XSM_INLINE int xsm_update_va_mapping(
+	XSM_DEFAULT_ARG struct domain *d, struct domain *f, l1_pgentry_t pte)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, f);
 }
 
-static XSM_INLINE int xsm_priv_mapping(XSM_DEFAULT_ARG struct domain *d, struct domain *t)
+static XSM_INLINE int xsm_priv_mapping(
+	XSM_DEFAULT_ARG struct domain *d, struct domain *t)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, t);
 }
 
-static XSM_INLINE int xsm_ioport_permission(XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+static XSM_INLINE int xsm_ioport_permission(
+	XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_ioport_mapping(XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+static XSM_INLINE int xsm_ioport_mapping(
+	XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int xsm_pmu_op (XSM_DEFAULT_ARG struct domain *d, unsigned int op)
+static XSM_INLINE int xsm_pmu_op(
+	XSM_DEFAULT_ARG struct domain *d, unsigned int op)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( op )
@@ -723,8 +767,8 @@ static XSM_INLINE int xsm_argo_enable(const struct domain *d)
     return 0;
 }
 
-static XSM_INLINE int xsm_argo_register_single_source(const struct domain *d,
-                                                      const struct domain *t)
+static XSM_INLINE int xsm_argo_register_single_source(
+	const struct domain *d, const struct domain *t)
 {
     return 0;
 }
@@ -734,8 +778,8 @@ static XSM_INLINE int xsm_argo_register_any_source(const struct domain *d)
     return 0;
 }
 
-static XSM_INLINE int xsm_argo_send(const struct domain *d,
-                                    const struct domain *t)
+static XSM_INLINE int xsm_argo_send(
+	const struct domain *d, const struct domain *t)
 {
     return 0;
 }
@@ -743,7 +787,7 @@ static XSM_INLINE int xsm_argo_send(const struct domain *d,
 #endif /* CONFIG_ARGO */
 
 #include <public/version.h>
-static XSM_INLINE int xsm_xen_version (XSM_DEFAULT_ARG uint32_t op)
+static XSM_INLINE int xsm_xen_version(XSM_DEFAULT_ARG uint32_t op)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( op )
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 16b90be2c5..42b0c188a9 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -19,7 +19,7 @@
 #include <xen/multiboot.h>
 
 /* policy magic number (defined by XSM_MAGIC) */
-typedef u32 xsm_magic_t;
+typedef uint32_t xsm_magic_t;
 
 #ifdef CONFIG_XSM_FLASK
 #define XSM_MAGIC 0xf97cff8c
@@ -27,7 +27,8 @@ typedef u32 xsm_magic_t;
 #define XSM_MAGIC 0x0
 #endif
 
-/* These annotations are used by callers and in dummy.h to document the
+/*
+ * These annotations are used by callers and in dummy.h to document the
  * default actions of XSM hooks. They should be compiled out otherwise.
  */
 enum xsm_default {
@@ -41,147 +42,154 @@ enum xsm_default {
 typedef enum xsm_default xsm_default_t;
 
 struct xsm_operations {
-    void (*security_domaininfo) (struct domain *d,
-                                        struct xen_domctl_getdomaininfo *info);
-    int (*domain_create) (struct domain *d, u32 ssidref);
-    int (*getdomaininfo) (struct domain *d);
-    int (*domctl_scheduler_op) (struct domain *d, int op);
-    int (*sysctl_scheduler_op) (int op);
-    int (*set_target) (struct domain *d, struct domain *e);
-    int (*domctl) (struct domain *d, int cmd);
-    int (*sysctl) (int cmd);
-    int (*readconsole) (uint32_t clear);
-
-    int (*evtchn_unbound) (struct domain *d, struct evtchn *chn, domid_t id2);
-    int (*evtchn_interdomain) (struct domain *d1, struct evtchn *chn1,
-                                        struct domain *d2, struct evtchn *chn2);
-    void (*evtchn_close_post) (struct evtchn *chn);
-    int (*evtchn_send) (struct domain *d, struct evtchn *chn);
-    int (*evtchn_status) (struct domain *d, struct evtchn *chn);
-    int (*evtchn_reset) (struct domain *d1, struct domain *d2);
-
-    int (*grant_mapref) (struct domain *d1, struct domain *d2, uint32_t flags);
-    int (*grant_unmapref) (struct domain *d1, struct domain *d2);
-    int (*grant_setup) (struct domain *d1, struct domain *d2);
-    int (*grant_transfer) (struct domain *d1, struct domain *d2);
-    int (*grant_copy) (struct domain *d1, struct domain *d2);
-    int (*grant_query_size) (struct domain *d1, struct domain *d2);
-
-    int (*alloc_security_domain) (struct domain *d);
-    void (*free_security_domain) (struct domain *d);
-    int (*alloc_security_evtchns) (struct evtchn chn[], unsigned int nr);
-    void (*free_security_evtchns) (struct evtchn chn[], unsigned int nr);
-    char *(*show_security_evtchn) (struct domain *d, const struct evtchn *chn);
-    int (*init_hardware_domain) (struct domain *d);
-
-    int (*get_pod_target) (struct domain *d);
-    int (*set_pod_target) (struct domain *d);
-    int (*memory_exchange) (struct domain *d);
-    int (*memory_adjust_reservation) (struct domain *d1, struct domain *d2);
-    int (*memory_stat_reservation) (struct domain *d1, struct domain *d2);
-    int (*memory_pin_page) (struct domain *d1, struct domain *d2, struct page_info *page);
-    int (*add_to_physmap) (struct domain *d1, struct domain *d2);
-    int (*remove_from_physmap) (struct domain *d1, struct domain *d2);
-    int (*map_gmfn_foreign) (struct domain *d, struct domain *t);
-    int (*claim_pages) (struct domain *d);
-
-    int (*console_io) (struct domain *d, int cmd);
-
-    int (*profile) (struct domain *d, int op);
-
-    int (*kexec) (void);
-    int (*schedop_shutdown) (struct domain *d1, struct domain *d2);
-
-    char *(*show_irq_sid) (int irq);
-    int (*map_domain_pirq) (struct domain *d);
-    int (*map_domain_irq) (struct domain *d, int irq, const void *data);
-    int (*unmap_domain_pirq) (struct domain *d);
-    int (*unmap_domain_irq) (struct domain *d, int irq, const void *data);
-    int (*bind_pt_irq) (struct domain *d, struct xen_domctl_bind_pt_irq *bind);
-    int (*unbind_pt_irq) (struct domain *d, struct xen_domctl_bind_pt_irq *bind);
-    int (*irq_permission) (struct domain *d, int pirq, uint8_t allow);
-    int (*iomem_permission) (struct domain *d, uint64_t s, uint64_t e, uint8_t allow);
-    int (*iomem_mapping) (struct domain *d, uint64_t s, uint64_t e, uint8_t allow);
-    int (*pci_config_permission) (struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end, uint8_t access);
+    void (*security_domaininfo)(struct domain *d,
+                                struct xen_domctl_getdomaininfo *info);
+    int (*domain_create)(struct domain *d, uint32_t ssidref);
+    int (*getdomaininfo)(struct domain *d);
+    int (*domctl_scheduler_op)(struct domain *d, int op);
+    int (*sysctl_scheduler_op)(int op);
+    int (*set_target)(struct domain *d, struct domain *e);
+    int (*domctl)(struct domain *d, int cmd);
+    int (*sysctl)(int cmd);
+    int (*readconsole)(uint32_t clear);
+
+    int (*evtchn_unbound)(struct domain *d, struct evtchn *chn, domid_t id2);
+    int (*evtchn_interdomain)(struct domain *d1, struct evtchn *chn1,
+                              struct domain *d2, struct evtchn *chn2);
+    void (*evtchn_close_post)(struct evtchn *chn);
+    int (*evtchn_send)(struct domain *d, struct evtchn *chn);
+    int (*evtchn_status)(struct domain *d, struct evtchn *chn);
+    int (*evtchn_reset)(struct domain *d1, struct domain *d2);
+
+    int (*grant_mapref)(struct domain *d1, struct domain *d2, uint32_t flags);
+    int (*grant_unmapref)(struct domain *d1, struct domain *d2);
+    int (*grant_setup)(struct domain *d1, struct domain *d2);
+    int (*grant_transfer)(struct domain *d1, struct domain *d2);
+    int (*grant_copy)(struct domain *d1, struct domain *d2);
+    int (*grant_query_size)(struct domain *d1, struct domain *d2);
+
+    int (*alloc_security_domain)(struct domain *d);
+    void (*free_security_domain)(struct domain *d);
+    int (*alloc_security_evtchns)(struct evtchn chn[], unsigned int nr);
+    void (*free_security_evtchns)(struct evtchn chn[], unsigned int nr);
+    char *(*show_security_evtchn)(struct domain *d, const struct evtchn *chn);
+    int (*init_hardware_domain)(struct domain *d);
+
+    int (*get_pod_target)(struct domain *d);
+    int (*set_pod_target)(struct domain *d);
+    int (*memory_exchange)(struct domain *d);
+    int (*memory_adjust_reservation)(struct domain *d1, struct domain *d2);
+    int (*memory_stat_reservation)(struct domain *d1, struct domain *d2);
+    int (*memory_pin_page)(struct domain *d1, struct domain *d2,
+                           struct page_info *page);
+    int (*add_to_physmap)(struct domain *d1, struct domain *d2);
+    int (*remove_from_physmap)(struct domain *d1, struct domain *d2);
+    int (*map_gmfn_foreign)(struct domain *d, struct domain *t);
+    int (*claim_pages)(struct domain *d);
+
+    int (*console_io)(struct domain *d, int cmd);
+
+    int (*profile)(struct domain *d, int op);
+
+    int (*kexec)(void);
+    int (*schedop_shutdown)(struct domain *d1, struct domain *d2);
+
+    char *(*show_irq_sid)(int irq);
+    int (*map_domain_pirq)(struct domain *d);
+    int (*map_domain_irq)(struct domain *d, int irq, const void *data);
+    int (*unmap_domain_pirq)(struct domain *d);
+    int (*unmap_domain_irq)(struct domain *d, int irq, const void *data);
+    int (*bind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
+    int (*unbind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
+    int (*irq_permission)(struct domain *d, int pirq, uint8_t allow);
+    int (*iomem_permission)(struct domain *d, uint64_t s, uint64_t e,
+                            uint8_t allow);
+    int (*iomem_mapping)(struct domain *d, uint64_t s, uint64_t e,
+                         uint8_t allow);
+    int (*pci_config_permission)(struct domain *d, uint32_t machine_bdf,
+                                 uint16_t start, uint16_t end, uint8_t access);
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-    int (*get_device_group) (uint32_t machine_bdf);
-    int (*assign_device) (struct domain *d, uint32_t machine_bdf);
-    int (*deassign_device) (struct domain *d, uint32_t machine_bdf);
+    int (*get_device_group)(uint32_t machine_bdf);
+    int (*assign_device)(struct domain *d, uint32_t machine_bdf);
+    int (*deassign_device)(struct domain *d, uint32_t machine_bdf);
 #endif
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
-    int (*assign_dtdevice) (struct domain *d, const char *dtpath);
-    int (*deassign_dtdevice) (struct domain *d, const char *dtpath);
+    int (*assign_dtdevice)(struct domain *d, const char *dtpath);
+    int (*deassign_dtdevice)(struct domain *d, const char *dtpath);
 #endif
 
-    int (*resource_plug_core) (void);
-    int (*resource_unplug_core) (void);
-    int (*resource_plug_pci) (uint32_t machine_bdf);
-    int (*resource_unplug_pci) (uint32_t machine_bdf);
-    int (*resource_setup_pci) (uint32_t machine_bdf);
-    int (*resource_setup_gsi) (int gsi);
-    int (*resource_setup_misc) (void);
+    int (*resource_plug_core)(void);
+    int (*resource_unplug_core)(void);
+    int (*resource_plug_pci)(uint32_t machine_bdf);
+    int (*resource_unplug_pci)(uint32_t machine_bdf);
+    int (*resource_setup_pci)(uint32_t machine_bdf);
+    int (*resource_setup_gsi)(int gsi);
+    int (*resource_setup_misc)(void);
 
     int (*page_offline)(uint32_t cmd);
     int (*hypfs_op)(void);
 
-    long (*do_xsm_op) (XEN_GUEST_HANDLE_PARAM(void) op);
+    long (*do_xsm_op)(XEN_GUEST_HANDLE_PARAM(void) op);
 #ifdef CONFIG_COMPAT
-    int (*do_compat_op) (XEN_GUEST_HANDLE_PARAM(void) op);
+    int (*do_compat_op)(XEN_GUEST_HANDLE_PARAM(void) op);
 #endif
 
-    int (*hvm_param) (struct domain *d, unsigned long op);
-    int (*hvm_control) (struct domain *d, unsigned long op);
-    int (*hvm_param_altp2mhvm) (struct domain *d);
-    int (*hvm_altp2mhvm_op) (struct domain *d, uint64_t mode, uint32_t op);
-    int (*get_vnumainfo) (struct domain *d);
+    int (*hvm_param)(struct domain *d, unsigned long op);
+    int (*hvm_control)(struct domain *d, unsigned long op);
+    int (*hvm_param_altp2mhvm)(struct domain *d);
+    int (*hvm_altp2mhvm_op)(struct domain *d, uint64_t mode, uint32_t op);
+    int (*get_vnumainfo)(struct domain *d);
 
-    int (*vm_event_control) (struct domain *d, int mode, int op);
+    int (*vm_event_control)(struct domain *d, int mode, int op);
 
 #ifdef CONFIG_MEM_ACCESS
-    int (*mem_access) (struct domain *d);
+    int (*mem_access)(struct domain *d);
 #endif
 
 #ifdef CONFIG_MEM_PAGING
-    int (*mem_paging) (struct domain *d);
+    int (*mem_paging)(struct domain *d);
 #endif
 
 #ifdef CONFIG_MEM_SHARING
-    int (*mem_sharing) (struct domain *d);
+    int (*mem_sharing)(struct domain *d);
 #endif
 
-    int (*platform_op) (uint32_t cmd);
+    int (*platform_op)(uint32_t cmd);
 
 #ifdef CONFIG_X86
-    int (*do_mca) (void);
-    int (*shadow_control) (struct domain *d, uint32_t op);
-    int (*mem_sharing_op) (struct domain *d, struct domain *cd, int op);
-    int (*apic) (struct domain *d, int cmd);
-    int (*machine_memory_map) (void);
-    int (*domain_memory_map) (struct domain *d);
+    int (*do_mca)(void);
+    int (*shadow_control)(struct domain *d, uint32_t op);
+    int (*mem_sharing_op)(struct domain *d, struct domain *cd, int op);
+    int (*apic)(struct domain *d, int cmd);
+    int (*machine_memory_map)(void);
+    int (*domain_memory_map)(struct domain *d);
 #define XSM_MMU_UPDATE_READ      1
 #define XSM_MMU_UPDATE_WRITE     2
 #define XSM_MMU_NORMAL_UPDATE    4
 #define XSM_MMU_MACHPHYS_UPDATE  8
-    int (*mmu_update) (struct domain *d, struct domain *t,
-                       struct domain *f, uint32_t flags);
-    int (*mmuext_op) (struct domain *d, struct domain *f);
-    int (*update_va_mapping) (struct domain *d, struct domain *f, l1_pgentry_t pte);
-    int (*priv_mapping) (struct domain *d, struct domain *t);
-    int (*ioport_permission) (struct domain *d, uint32_t s, uint32_t e, uint8_t allow);
-    int (*ioport_mapping) (struct domain *d, uint32_t s, uint32_t e, uint8_t allow);
-    int (*pmu_op) (struct domain *d, unsigned int op);
+    int (*mmu_update)(struct domain *d, struct domain *t,
+                      struct domain *f, uint32_t flags);
+    int (*mmuext_op)(struct domain *d, struct domain *f);
+    int (*update_va_mapping)(struct domain *d, struct domain *f,
+                             l1_pgentry_t pte);
+    int (*priv_mapping)(struct domain *d, struct domain *t);
+    int (*ioport_permission)(struct domain *d, uint32_t s, uint32_t e,
+                             uint8_t allow);
+    int (*ioport_mapping)(struct domain *d, uint32_t s, uint32_t e,
+                          uint8_t allow);
+    int (*pmu_op)(struct domain *d, unsigned int op);
 #endif
-    int (*dm_op) (struct domain *d);
-    int (*xen_version) (uint32_t cmd);
-    int (*domain_resource_map) (struct domain *d);
+    int (*dm_op)(struct domain *d);
+    int (*xen_version)(uint32_t cmd);
+    int (*domain_resource_map)(struct domain *d);
 #ifdef CONFIG_ARGO
-    int (*argo_enable) (const struct domain *d);
-    int (*argo_register_single_source) (const struct domain *d,
-                                        const struct domain *t);
-    int (*argo_register_any_source) (const struct domain *d);
-    int (*argo_send) (const struct domain *d, const struct domain *t);
+    int (*argo_enable)(const struct domain *d);
+    int (*argo_register_single_source)(const struct domain *d,
+                                       const struct domain *t);
+    int (*argo_register_any_source)(const struct domain *d);
+    int (*argo_send)(const struct domain *d, const struct domain *t);
 #endif
 };
 
@@ -191,191 +199,208 @@ extern struct xsm_operations *xsm_ops;
 
 #ifndef XSM_NO_WRAPPERS
 
-static inline void xsm_security_domaininfo (struct domain *d,
-                                        struct xen_domctl_getdomaininfo *info)
+static inline void xsm_security_domaininfo(
+    struct domain *d, struct xen_domctl_getdomaininfo *info)
 {
     xsm_ops->security_domaininfo(d, info);
 }
 
-static inline int xsm_domain_create (xsm_default_t def, struct domain *d, u32 ssidref)
+static inline int xsm_domain_create(
+    xsm_default_t def, struct domain *d, uint32_t ssidref)
 {
     return xsm_ops->domain_create(d, ssidref);
 }
 
-static inline int xsm_getdomaininfo (xsm_default_t def, struct domain *d)
+static inline int xsm_getdomaininfo(xsm_default_t def, struct domain *d)
 {
     return xsm_ops->getdomaininfo(d);
 }
 
-static inline int xsm_domctl_scheduler_op (xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_domctl_scheduler_op(
+    xsm_default_t def, struct domain *d, int cmd)
 {
     return xsm_ops->domctl_scheduler_op(d, cmd);
 }
 
-static inline int xsm_sysctl_scheduler_op (xsm_default_t def, int cmd)
+static inline int xsm_sysctl_scheduler_op(xsm_default_t def, int cmd)
 {
     return xsm_ops->sysctl_scheduler_op(cmd);
 }
 
-static inline int xsm_set_target (xsm_default_t def, struct domain *d, struct domain *e)
+static inline int xsm_set_target(
+    xsm_default_t def, struct domain *d, struct domain *e)
 {
     return xsm_ops->set_target(d, e);
 }
 
-static inline int xsm_domctl (xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_domctl(xsm_default_t def, struct domain *d, int cmd)
 {
     return xsm_ops->domctl(d, cmd);
 }
 
-static inline int xsm_sysctl (xsm_default_t def, int cmd)
+static inline int xsm_sysctl(xsm_default_t def, int cmd)
 {
     return xsm_ops->sysctl(cmd);
 }
 
-static inline int xsm_readconsole (xsm_default_t def, uint32_t clear)
+static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
 {
     return xsm_ops->readconsole(clear);
 }
 
-static inline int xsm_evtchn_unbound (xsm_default_t def, struct domain *d1, struct evtchn *chn,
-                                                                    domid_t id2)
+static inline int xsm_evtchn_unbound(
+    xsm_default_t def, struct domain *d1, struct evtchn *chn, domid_t id2)
 {
     return xsm_ops->evtchn_unbound(d1, chn, id2);
 }
 
-static inline int xsm_evtchn_interdomain (xsm_default_t def, struct domain *d1,
-                struct evtchn *chan1, struct domain *d2, struct evtchn *chan2)
+static inline int xsm_evtchn_interdomain(
+    xsm_default_t def, struct domain *d1, struct evtchn *chan1,
+    struct domain *d2, struct evtchn *chan2)
 {
     return xsm_ops->evtchn_interdomain(d1, chan1, d2, chan2);
 }
 
-static inline void xsm_evtchn_close_post (struct evtchn *chn)
+static inline void xsm_evtchn_close_post(struct evtchn *chn)
 {
     xsm_ops->evtchn_close_post(chn);
 }
 
-static inline int xsm_evtchn_send (xsm_default_t def, struct domain *d, struct evtchn *chn)
+static inline int xsm_evtchn_send(
+    xsm_default_t def, struct domain *d, struct evtchn *chn)
 {
     return xsm_ops->evtchn_send(d, chn);
 }
 
-static inline int xsm_evtchn_status (xsm_default_t def, struct domain *d, struct evtchn *chn)
+static inline int xsm_evtchn_status(
+    xsm_default_t def, struct domain *d, struct evtchn *chn)
 {
     return xsm_ops->evtchn_status(d, chn);
 }
 
-static inline int xsm_evtchn_reset (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_evtchn_reset(
+    xsm_default_t def, struct domain *d1, struct domain *d2)
 {
     return xsm_ops->evtchn_reset(d1, d2);
 }
 
-static inline int xsm_grant_mapref (xsm_default_t def, struct domain *d1, struct domain *d2,
-                                                                uint32_t flags)
+static inline int xsm_grant_mapref(
+    xsm_default_t def, struct domain *d1, struct domain *d2, uint32_t flags)
 {
     return xsm_ops->grant_mapref(d1, d2, flags);
 }
 
-static inline int xsm_grant_unmapref (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_unmapref(
+    xsm_default_t def, struct domain *d1, struct domain *d2)
 {
     return xsm_ops->grant_unmapref(d1, d2);
 }
 
-static inline int xsm_grant_setup (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_setup(
+    xsm_default_t def, struct domain *d1, struct domain *d2)
 {
     return xsm_ops->grant_setup(d1, d2);
 }
 
-static inline int xsm_grant_transfer (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_transfer(
+	xsm_default_t def, struct domain *d1, struct domain *d2)
 {
     return xsm_ops->grant_transfer(d1, d2);
 }
 
-static inline int xsm_grant_copy (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_copy(
+	xsm_default_t def, struct domain *d1, struct domain *d2)
 {
     return xsm_ops->grant_copy(d1, d2);
 }
 
-static inline int xsm_grant_query_size (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_query_size(
+	xsm_default_t def, struct domain *d1, struct domain *d2)
 {
     return xsm_ops->grant_query_size(d1, d2);
 }
 
-static inline int xsm_alloc_security_domain (struct domain *d)
+static inline int xsm_alloc_security_domain(struct domain *d)
 {
     return xsm_ops->alloc_security_domain(d);
 }
 
-static inline void xsm_free_security_domain (struct domain *d)
+static inline void xsm_free_security_domain(struct domain *d)
 {
     xsm_ops->free_security_domain(d);
 }
 
 static inline int xsm_alloc_security_evtchns(
-    struct evtchn chn[], unsigned int nr)
+	struct evtchn chn[], unsigned int nr)
 {
     return xsm_ops->alloc_security_evtchns(chn, nr);
 }
 
 static inline void xsm_free_security_evtchns(
-    struct evtchn chn[], unsigned int nr)
+	struct evtchn chn[], unsigned int nr)
 {
     xsm_ops->free_security_evtchns(chn, nr);
 }
 
-static inline char *xsm_show_security_evtchn (struct domain *d, const struct evtchn *chn)
+static inline char *xsm_show_security_evtchn(
+	struct domain *d, const struct evtchn *chn)
 {
     return xsm_ops->show_security_evtchn(d, chn);
 }
 
-static inline int xsm_init_hardware_domain (xsm_default_t def, struct domain *d)
+static inline int xsm_init_hardware_domain(xsm_default_t def, struct domain *d)
 {
     return xsm_ops->init_hardware_domain(d);
 }
 
-static inline int xsm_get_pod_target (xsm_default_t def, struct domain *d)
+static inline int xsm_get_pod_target(xsm_default_t def, struct domain *d)
 {
     return xsm_ops->get_pod_target(d);
 }
 
-static inline int xsm_set_pod_target (xsm_default_t def, struct domain *d)
+static inline int xsm_set_pod_target(xsm_default_t def, struct domain *d)
 {
     return xsm_ops->set_pod_target(d);
 }
 
-static inline int xsm_memory_exchange (xsm_default_t def, struct domain *d)
+static inline int xsm_memory_exchange(xsm_default_t def, struct domain *d)
 {
     return xsm_ops->memory_exchange(d);
 }
 
-static inline int xsm_memory_adjust_reservation (xsm_default_t def, struct domain *d1, struct
-                                                                    domain *d2)
+static inline int xsm_memory_adjust_reservation(
+	xsm_default_t def, struct domain *d1, struct domain *d2)
 {
     return xsm_ops->memory_adjust_reservation(d1, d2);
 }
 
-static inline int xsm_memory_stat_reservation (xsm_default_t def, struct domain *d1,
-                                                            struct domain *d2)
+static inline int xsm_memory_stat_reservation(
+	xsm_default_t def, struct domain *d1, struct domain *d2)
 {
     return xsm_ops->memory_stat_reservation(d1, d2);
 }
 
-static inline int xsm_memory_pin_page(xsm_default_t def, struct domain *d1, struct domain *d2,
-                                      struct page_info *page)
+static inline int xsm_memory_pin_page(
+	xsm_default_t def, struct domain *d1, struct domain *d2,
+    struct page_info *page)
 {
     return xsm_ops->memory_pin_page(d1, d2, page);
 }
 
-static inline int xsm_add_to_physmap(xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_add_to_physmap(
+	xsm_default_t def, struct domain *d1, struct domain *d2)
 {
     return xsm_ops->add_to_physmap(d1, d2);
 }
 
-static inline int xsm_remove_from_physmap(xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_remove_from_physmap(
+	xsm_default_t def, struct domain *d1, struct domain *d2)
 {
     return xsm_ops->remove_from_physmap(d1, d2);
 }
 
-static inline int xsm_map_gmfn_foreign (xsm_default_t def, struct domain *d, struct domain *t)
+static inline int xsm_map_gmfn_foreign(
+	xsm_default_t def, struct domain *d, struct domain *t)
 {
     return xsm_ops->map_gmfn_foreign(d, t);
 }
@@ -385,79 +410,87 @@ static inline int xsm_claim_pages(xsm_default_t def, struct domain *d)
     return xsm_ops->claim_pages(d);
 }
 
-static inline int xsm_console_io (xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_console_io(xsm_default_t def, struct domain *d, int cmd)
 {
     return xsm_ops->console_io(d, cmd);
 }
 
-static inline int xsm_profile (xsm_default_t def, struct domain *d, int op)
+static inline int xsm_profile(xsm_default_t def, struct domain *d, int op)
 {
     return xsm_ops->profile(d, op);
 }
 
-static inline int xsm_kexec (xsm_default_t def)
+static inline int xsm_kexec(xsm_default_t def)
 {
     return xsm_ops->kexec();
 }
 
-static inline int xsm_schedop_shutdown (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_schedop_shutdown(
+	xsm_default_t def, struct domain *d1, struct domain *d2)
 {
     return xsm_ops->schedop_shutdown(d1, d2);
 }
 
-static inline char *xsm_show_irq_sid (int irq)
+static inline char *xsm_show_irq_sid(int irq)
 {
     return xsm_ops->show_irq_sid(irq);
 }
 
-static inline int xsm_map_domain_pirq (xsm_default_t def, struct domain *d)
+static inline int xsm_map_domain_pirq(xsm_default_t def, struct domain *d)
 {
     return xsm_ops->map_domain_pirq(d);
 }
 
-static inline int xsm_map_domain_irq (xsm_default_t def, struct domain *d, int irq, void *data)
+static inline int xsm_map_domain_irq(
+	xsm_default_t def, struct domain *d, int irq, void *data)
 {
     return xsm_ops->map_domain_irq(d, irq, data);
 }
 
-static inline int xsm_unmap_domain_pirq (xsm_default_t def, struct domain *d)
+static inline int xsm_unmap_domain_pirq(xsm_default_t def, struct domain *d)
 {
     return xsm_ops->unmap_domain_pirq(d);
 }
 
-static inline int xsm_unmap_domain_irq (xsm_default_t def, struct domain *d, int irq, void *data)
+static inline int xsm_unmap_domain_irq(
+	xsm_default_t def, struct domain *d, int irq, void *data)
 {
     return xsm_ops->unmap_domain_irq(d, irq, data);
 }
 
-static inline int xsm_bind_pt_irq(xsm_default_t def, struct domain *d,
-                                  struct xen_domctl_bind_pt_irq *bind)
+static inline int xsm_bind_pt_irq(
+	xsm_default_t def, struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
     return xsm_ops->bind_pt_irq(d, bind);
 }
 
-static inline int xsm_unbind_pt_irq(xsm_default_t def, struct domain *d,
-                                    struct xen_domctl_bind_pt_irq *bind)
+static inline int xsm_unbind_pt_irq(
+	xsm_default_t def, struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
     return xsm_ops->unbind_pt_irq(d, bind);
 }
 
-static inline int xsm_irq_permission (xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
+static inline int xsm_irq_permission(
+	xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
 {
     return xsm_ops->irq_permission(d, pirq, allow);
 }
 
-static inline int xsm_iomem_permission (xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+static inline int xsm_iomem_permission(
+	xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
     return xsm_ops->iomem_permission(d, s, e, allow);
 }
 
-static inline int xsm_iomem_mapping (xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+static inline int xsm_iomem_mapping(
+	xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
     return xsm_ops->iomem_mapping(d, s, e, allow);
 }
 
-static inline int xsm_pci_config_permission (xsm_default_t def, struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end, uint8_t access)
+static inline int xsm_pci_config_permission(
+	xsm_default_t def, struct domain *d, uint32_t machine_bdf, uint16_t start,
+    uint16_t end, uint8_t access)
 {
     return xsm_ops->pci_config_permission(d, machine_bdf, start, end, access);
 }
@@ -468,63 +501,67 @@ static inline int xsm_get_device_group(xsm_default_t def, uint32_t machine_bdf)
     return xsm_ops->get_device_group(machine_bdf);
 }
 
-static inline int xsm_assign_device(xsm_default_t def, struct domain *d, uint32_t machine_bdf)
+static inline int xsm_assign_device(
+	xsm_default_t def, struct domain *d, uint32_t machine_bdf)
 {
     return xsm_ops->assign_device(d, machine_bdf);
 }
 
-static inline int xsm_deassign_device(xsm_default_t def, struct domain *d, uint32_t machine_bdf)
+static inline int xsm_deassign_device(
+	xsm_default_t def, struct domain *d, uint32_t machine_bdf)
 {
     return xsm_ops->deassign_device(d, machine_bdf);
 }
 #endif /* HAS_PASSTHROUGH && HAS_PCI) */
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
-static inline int xsm_assign_dtdevice(xsm_default_t def, struct domain *d,
-                                      const char *dtpath)
+static inline int xsm_assign_dtdevice(
+	xsm_default_t def, struct domain *d, const char *dtpath)
 {
     return xsm_ops->assign_dtdevice(d, dtpath);
 }
 
-static inline int xsm_deassign_dtdevice(xsm_default_t def, struct domain *d,
-                                        const char *dtpath)
+static inline int xsm_deassign_dtdevice(
+	xsm_default_t def, struct domain *d, const char *dtpath)
 {
     return xsm_ops->deassign_dtdevice(d, dtpath);
 }
 
 #endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
 
-static inline int xsm_resource_plug_pci (xsm_default_t def, uint32_t machine_bdf)
+static inline int xsm_resource_plug_pci(xsm_default_t def, uint32_t machine_bdf)
 {
     return xsm_ops->resource_plug_pci(machine_bdf);
 }
 
-static inline int xsm_resource_unplug_pci (xsm_default_t def, uint32_t machine_bdf)
+static inline int xsm_resource_unplug_pci(
+	xsm_default_t def, uint32_t machine_bdf)
 {
     return xsm_ops->resource_unplug_pci(machine_bdf);
 }
 
-static inline int xsm_resource_plug_core (xsm_default_t def)
+static inline int xsm_resource_plug_core(xsm_default_t def)
 {
     return xsm_ops->resource_plug_core();
 }
 
-static inline int xsm_resource_unplug_core (xsm_default_t def)
+static inline int xsm_resource_unplug_core(xsm_default_t def)
 {
     return xsm_ops->resource_unplug_core();
 }
 
-static inline int xsm_resource_setup_pci (xsm_default_t def, uint32_t machine_bdf)
+static inline int xsm_resource_setup_pci(
+	xsm_default_t def, uint32_t machine_bdf)
 {
     return xsm_ops->resource_setup_pci(machine_bdf);
 }
 
-static inline int xsm_resource_setup_gsi (xsm_default_t def, int gsi)
+static inline int xsm_resource_setup_gsi(xsm_default_t def, int gsi)
 {
     return xsm_ops->resource_setup_gsi(gsi);
 }
 
-static inline int xsm_resource_setup_misc (xsm_default_t def)
+static inline int xsm_resource_setup_misc(xsm_default_t def)
 {
     return xsm_ops->resource_setup_misc();
 }
@@ -539,70 +576,74 @@ static inline int xsm_hypfs_op(xsm_default_t def)
     return xsm_ops->hypfs_op();
 }
 
-static inline long xsm_do_xsm_op (XEN_GUEST_HANDLE_PARAM(void) op)
+static inline long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return xsm_ops->do_xsm_op(op);
 }
 
 #ifdef CONFIG_COMPAT
-static inline int xsm_do_compat_op (XEN_GUEST_HANDLE_PARAM(void) op)
+static inline int xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return xsm_ops->do_compat_op(op);
 }
 #endif
 
-static inline int xsm_hvm_param (xsm_default_t def, struct domain *d, unsigned long op)
+static inline int xsm_hvm_param(
+	xsm_default_t def, struct domain *d, unsigned long op)
 {
     return xsm_ops->hvm_param(d, op);
 }
 
-static inline int xsm_hvm_control(xsm_default_t def, struct domain *d, unsigned long op)
+static inline int xsm_hvm_control(
+	xsm_default_t def, struct domain *d, unsigned long op)
 {
     return xsm_ops->hvm_control(d, op);
 }
 
-static inline int xsm_hvm_param_altp2mhvm (xsm_default_t def, struct domain *d)
+static inline int xsm_hvm_param_altp2mhvm(xsm_default_t def, struct domain *d)
 {
     return xsm_ops->hvm_param_altp2mhvm(d);
 }
 
-static inline int xsm_hvm_altp2mhvm_op (xsm_default_t def, struct domain *d, uint64_t mode, uint32_t op)
+static inline int xsm_hvm_altp2mhvm_op(
+	xsm_default_t def, struct domain *d, uint64_t mode, uint32_t op)
 {
     return xsm_ops->hvm_altp2mhvm_op(d, mode, op);
 }
 
-static inline int xsm_get_vnumainfo (xsm_default_t def, struct domain *d)
+static inline int xsm_get_vnumainfo(xsm_default_t def, struct domain *d)
 {
     return xsm_ops->get_vnumainfo(d);
 }
 
-static inline int xsm_vm_event_control (xsm_default_t def, struct domain *d, int mode, int op)
+static inline int xsm_vm_event_control(
+	xsm_default_t def, struct domain *d, int mode, int op)
 {
     return xsm_ops->vm_event_control(d, mode, op);
 }
 
 #ifdef CONFIG_MEM_ACCESS
-static inline int xsm_mem_access (xsm_default_t def, struct domain *d)
+static inline int xsm_mem_access(xsm_default_t def, struct domain *d)
 {
     return xsm_ops->mem_access(d);
 }
 #endif
 
 #ifdef CONFIG_MEM_PAGING
-static inline int xsm_mem_paging (xsm_default_t def, struct domain *d)
+static inline int xsm_mem_paging(xsm_default_t def, struct domain *d)
 {
     return xsm_ops->mem_paging(d);
 }
 #endif
 
 #ifdef CONFIG_MEM_SHARING
-static inline int xsm_mem_sharing (xsm_default_t def, struct domain *d)
+static inline int xsm_mem_sharing(xsm_default_t def, struct domain *d)
 {
     return xsm_ops->mem_sharing(d);
 }
 #endif
 
-static inline int xsm_platform_op (xsm_default_t def, uint32_t op)
+static inline int xsm_platform_op(xsm_default_t def, uint32_t op)
 {
     return xsm_ops->platform_op(op);
 }
@@ -613,17 +654,19 @@ static inline int xsm_do_mca(xsm_default_t def)
     return xsm_ops->do_mca();
 }
 
-static inline int xsm_shadow_control (xsm_default_t def, struct domain *d, uint32_t op)
+static inline int xsm_shadow_control(
+	xsm_default_t def, struct domain *d, uint32_t op)
 {
     return xsm_ops->shadow_control(d, op);
 }
 
-static inline int xsm_mem_sharing_op (xsm_default_t def, struct domain *d, struct domain *cd, int op)
+static inline int xsm_mem_sharing_op(
+	xsm_default_t def, struct domain *d, struct domain *cd, int op)
 {
     return xsm_ops->mem_sharing_op(d, cd, op);
 }
 
-static inline int xsm_apic (xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_apic(xsm_default_t def, struct domain *d, int cmd)
 {
     return xsm_ops->apic(d, cmd);
 }
@@ -638,39 +681,45 @@ static inline int xsm_domain_memory_map(xsm_default_t def, struct domain *d)
     return xsm_ops->domain_memory_map(d);
 }
 
-static inline int xsm_mmu_update (xsm_default_t def, struct domain *d, struct domain *t,
-                                  struct domain *f, uint32_t flags)
+static inline int xsm_mmu_update(
+	xsm_default_t def, struct domain *d, struct domain *t, struct domain *f,
+    uint32_t flags)
 {
     return xsm_ops->mmu_update(d, t, f, flags);
 }
 
-static inline int xsm_mmuext_op (xsm_default_t def, struct domain *d, struct domain *f)
+static inline int xsm_mmuext_op(
+	xsm_default_t def, struct domain *d, struct domain *f)
 {
     return xsm_ops->mmuext_op(d, f);
 }
 
-static inline int xsm_update_va_mapping(xsm_default_t def, struct domain *d, struct domain *f,
-                                                            l1_pgentry_t pte)
+static inline int xsm_update_va_mapping(
+	xsm_default_t def, struct domain *d, struct domain *f, l1_pgentry_t pte)
 {
     return xsm_ops->update_va_mapping(d, f, pte);
 }
 
-static inline int xsm_priv_mapping(xsm_default_t def, struct domain *d, struct domain *t)
+static inline int xsm_priv_mapping(
+	xsm_default_t def, struct domain *d, struct domain *t)
 {
     return xsm_ops->priv_mapping(d, t);
 }
 
-static inline int xsm_ioport_permission (xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+static inline int xsm_ioport_permission(
+	xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
     return xsm_ops->ioport_permission(d, s, e, allow);
 }
 
-static inline int xsm_ioport_mapping (xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+static inline int xsm_ioport_mapping(
+	xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
     return xsm_ops->ioport_mapping(d, s, e, allow);
 }
 
-static inline int xsm_pmu_op (xsm_default_t def, struct domain *d, unsigned int op)
+static inline int xsm_pmu_op(
+	xsm_default_t def, struct domain *d, unsigned int op)
 {
     return xsm_ops->pmu_op(d, op);
 }
@@ -682,7 +731,7 @@ static inline int xsm_dm_op(xsm_default_t def, struct domain *d)
     return xsm_ops->dm_op(d);
 }
 
-static inline int xsm_xen_version (xsm_default_t def, uint32_t op)
+static inline int xsm_xen_version(xsm_default_t def, uint32_t op)
 {
     return xsm_ops->xen_version(op);
 }
@@ -698,8 +747,8 @@ static inline int xsm_argo_enable(const struct domain *d)
     return xsm_ops->argo_enable(d);
 }
 
-static inline int xsm_argo_register_single_source(const struct domain *d,
-                                                  const struct domain *t)
+static inline int xsm_argo_register_single_source(
+	const struct domain *d, const struct domain *t)
 {
     return xsm_ops->argo_register_single_source(d, t);
 }
@@ -719,12 +768,11 @@ static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 #endif /* XSM_NO_WRAPPERS */
 
 #ifdef CONFIG_MULTIBOOT
-extern int xsm_multiboot_init(unsigned long *module_map,
-                              const multiboot_info_t *mbi);
-extern int xsm_multiboot_policy_init(unsigned long *module_map,
-                                     const multiboot_info_t *mbi,
-                                     void **policy_buffer,
-                                     size_t *policy_size);
+int xsm_multiboot_init(
+	unsigned long *module_map, const multiboot_info_t *mbi);
+int xsm_multiboot_policy_init(
+	unsigned long *module_map, const multiboot_info_t *mbi,
+    void **policy_buffer, size_t *policy_size);
 #endif
 
 #ifdef CONFIG_HAS_DEVICE_TREE
@@ -733,18 +781,19 @@ extern int xsm_multiboot_policy_init(unsigned long *module_map,
  *
  * On success, return 1 if using SILO mode else 0.
  */
-extern int xsm_dt_init(void);
-extern int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
-extern bool has_xsm_magic(paddr_t);
+int xsm_dt_init(void);
+int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
+bool has_xsm_magic(paddr_t);
 #endif
 
-extern int register_xsm(struct xsm_operations *ops);
+int register_xsm(struct xsm_operations *ops);
 
 extern struct xsm_operations dummy_xsm_ops;
-extern void xsm_fixup_ops(struct xsm_operations *ops);
+
+void xsm_fixup_ops(struct xsm_operations *ops);
 
 #ifdef CONFIG_XSM_FLASK
-extern void flask_init(const void *policy_buffer, size_t policy_size);
+void flask_init(const void *policy_buffer, size_t policy_size);
 #else
 static inline void flask_init(const void *policy_buffer, size_t policy_size)
 {
@@ -757,7 +806,7 @@ extern const unsigned int xsm_flask_init_policy_size;
 #endif
 
 #ifdef CONFIG_XSM_SILO
-extern void silo_init(void);
+void silo_init(void);
 #else
 static inline void silo_init(void) {}
 #endif
@@ -767,8 +816,8 @@ static inline void silo_init(void) {}
 #include <xsm/dummy.h>
 
 #ifdef CONFIG_MULTIBOOT
-static inline int xsm_multiboot_init (unsigned long *module_map,
-                                      const multiboot_info_t *mbi)
+static inline int xsm_multiboot_init (
+	unsigned long *module_map, const multiboot_info_t *mbi)
 {
     return 0;
 }
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index ac553f9c0d..d313e8a6c6 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -117,8 +117,8 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
 }
 
 #ifdef CONFIG_MULTIBOOT
-int __init xsm_multiboot_init(unsigned long *module_map,
-                              const multiboot_info_t *mbi)
+int __init xsm_multiboot_init(
+	unsigned long *module_map, const multiboot_info_t *mbi)
 {
     int ret = 0;
     void *policy_buffer = NULL;
@@ -128,8 +128,8 @@ int __init xsm_multiboot_init(unsigned long *module_map,
 
     if ( XSM_MAGIC )
     {
-        ret = xsm_multiboot_policy_init(module_map, mbi,
-                                        &policy_buffer, &policy_size);
+        ret = xsm_multiboot_policy_init(module_map, mbi, &policy_buffer,
+                                        &policy_size);
         if ( ret )
         {
             bootstrap_map(NULL);
diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
index 33ab37717f..0ab1b3bb76 100644
--- a/xen/xsm/xsm_policy.c
+++ b/xen/xsm/xsm_policy.c
@@ -30,10 +30,9 @@
 #endif
 
 #ifdef CONFIG_MULTIBOOT
-int __init xsm_multiboot_policy_init(unsigned long *module_map,
-                                     const multiboot_info_t *mbi,
-                                     void **policy_buffer,
-                                     size_t *policy_size)
+int __init xsm_multiboot_policy_init(
+	unsigned long *module_map, const multiboot_info_t *mbi,
+    void **policy_buffer, size_t *policy_size)
 {
     int i;
     module_t *mod = (module_t *)__va(mbi->mods_addr);
-- 
2.20.1


