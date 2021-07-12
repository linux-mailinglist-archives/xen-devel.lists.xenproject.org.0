Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A043C6500
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 22:31:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154812.285959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m32Zu-0005Wj-5t; Mon, 12 Jul 2021 20:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154812.285959; Mon, 12 Jul 2021 20:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m32Zu-0005Uo-2j; Mon, 12 Jul 2021 20:30:58 +0000
Received: by outflank-mailman (input) for mailman id 154812;
 Mon, 12 Jul 2021 20:30:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Agf=ME=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1m32Zt-0005Ue-Hy
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 20:30:57 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e9cbae2-e350-11eb-8707-12813bfff9fa;
 Mon, 12 Jul 2021 20:30:55 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1626121635730192.9107776027231;
 Mon, 12 Jul 2021 13:27:15 -0700 (PDT)
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
X-Inumbo-ID: 0e9cbae2-e350-11eb-8707-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1626121638; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YrYVzIKMcTMGlbgqJB+S9HNtfVtX4ekH5BqpjjFSEN6xVIcA/GT/m+HaQPKXGbSAAFc2G3UdddmJLm+pE1Oh0iejlyeqln8cOcOV4S8DM7ZOTdEEXuCQec35byTqvLya0zDs2xxqd4hrda2DKgDqzrX1bci81t+Qxa4V69iDlyY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1626121638; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=kh0KMg27tKSsDe22tQu9Z3PZUDHTMTDEO+ctwo3vIpI=; 
	b=UgdMcdkezq33hhMsXjiiPyJ4fUTg3Yi4txRK+8Ox6cvLuhsWBV8ramAlQa8BVjt6WRX6AlC9mP+7v7njxqJR5Ozv+qPoIaNQshN15j/BAn/jGV5doGqwcOM6SQtBHGmVbE9b3a4O6jr/HGl5B26DKwXgjKnWDIHhwQhWCe+eXxI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626121638;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kh0KMg27tKSsDe22tQu9Z3PZUDHTMTDEO+ctwo3vIpI=;
	b=FmHXmhgqmTa9DXPsIKDmVAWB34r97SN4kLMvEhKkKEj4lPDUY+toUL3yTpKs1zJr
	n2ob+Hh8QJ1/iJF1oQ7e89rHobmPZbZuVjLlDm7HX7YPKEeNRtikx/49bNHWVDSos5m
	BjKUDnRHA/KZapIDhQm6CW6g9nRqvcWNaOPs0pdY=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v2 09/10] xsm: expand the function related macros in dummy.h
Date: Mon, 12 Jul 2021 16:32:32 -0400
Message-Id: <20210712203233.20289-10-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712203233.20289-1-dpsmith@apertussolutions.com>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

With the elimination of switching how dummy.h gets included, the function
declaration macros are no longer necessary. This commit expands them out to the
only value for which they will ever be set. This results in function
declaration lengths changing and since some definitions did not even follow the
80 column wrapping style, all function definitions were aligned with the
predominate style found in core hypervisor code.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/xsm/dummy.h | 275 +++++++++++++++++++++++++++---------------------
 1 file changed, 153 insertions(+), 122 deletions(-)

diff --git a/xen/xsm/dummy.h b/xen/xsm/dummy.h
index a3e698c3b5..1cb26e4146 100644
--- a/xen/xsm/dummy.h
+++ b/xen/xsm/dummy.h
@@ -9,7 +9,7 @@
  *
  *
  *  Each XSM hook implementing an access check should have its first parameter
- *  preceded by XSM_DEFAULT_ARG (or use XSM_DEFAULT_VOID if it has no
+ *  preceded by (or use XSM_DEFAULT_VOID if it has no
  *  arguments). The first non-declaration statement shold be XSM_ASSERT_ACTION
  *  with the expected type of the hook, which will either define or check the
  *  value of action.
@@ -47,14 +47,11 @@ void __xsm_action_mismatch_detected(void);
  * xsm_default_t argument available, so the value from the assertion is used to
  * initialize the variable.
  */
-#define XSM_INLINE __maybe_unused
-
-#define XSM_DEFAULT_ARG /* */
-#define XSM_DEFAULT_VOID void
 #define XSM_ASSERT_ACTION(def) xsm_default_t action = def; (void)action
 
-static always_inline int xsm_default_action(
-    xsm_default_t action, struct domain *src, struct domain *target)
+static always_inline int xsm_default_action(xsm_default_t action,
+                                            struct domain *src,
+                                            struct domain *target)
 {
     switch ( action ) {
     case XSM_HOOK:
@@ -82,43 +79,43 @@ static always_inline int xsm_default_action(
     }
 }
 
-static XSM_INLINE void dummy_security_domaininfo(struct domain *d,
+static inline void dummy_security_domaininfo(struct domain *d,
                                     struct xen_domctl_getdomaininfo *info)
 {
     return;
 }
 
-static XSM_INLINE int dummy_domain_create(XSM_DEFAULT_ARG struct domain *d, u32 ssidref)
+static inline int dummy_domain_create(struct domain *d, u32 ssidref)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_getdomaininfo(XSM_DEFAULT_ARG struct domain *d)
+static inline int dummy_getdomaininfo(struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_domctl_scheduler_op(XSM_DEFAULT_ARG struct domain *d, int cmd)
+static inline int dummy_domctl_scheduler_op(struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_sysctl_scheduler_op(XSM_DEFAULT_ARG int cmd)
+static inline int dummy_sysctl_scheduler_op(int cmd)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int dummy_set_target(XSM_DEFAULT_ARG struct domain *d, struct domain *e)
+static inline int dummy_set_target(struct domain *d, struct domain *e)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int dummy_domctl(XSM_DEFAULT_ARG struct domain *d, int cmd)
+static inline int dummy_domctl(struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( cmd )
@@ -135,85 +132,91 @@ static XSM_INLINE int dummy_domctl(XSM_DEFAULT_ARG struct domain *d, int cmd)
     }
 }
 
-static XSM_INLINE int dummy_sysctl(XSM_DEFAULT_ARG int cmd)
+static inline int dummy_sysctl(int cmd)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int dummy_readconsole(XSM_DEFAULT_ARG uint32_t clear)
+static inline int dummy_readconsole(uint32_t clear)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int dummy_alloc_security_domain(struct domain *d)
+static inline int dummy_alloc_security_domain(struct domain *d)
 {
     return 0;
 }
 
-static XSM_INLINE void dummy_free_security_domain(struct domain *d)
+static inline void dummy_free_security_domain(struct domain *d)
 {
     return;
 }
 
-static XSM_INLINE int dummy_grant_mapref(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2,
-                                                                uint32_t flags)
+static inline int dummy_grant_mapref(struct domain *d1,
+                                             struct domain *d2,
+                                             uint32_t flags)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int dummy_grant_unmapref(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static inline int dummy_grant_unmapref(struct domain *d1,
+                                               struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int dummy_grant_setup(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static inline int dummy_grant_setup(struct domain *d1,
+                                            struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int dummy_grant_transfer(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static inline int dummy_grant_transfer(struct domain *d1,
+                                               struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int dummy_grant_copy(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static inline int dummy_grant_copy(struct domain *d1, struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int dummy_grant_query_size(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static inline int dummy_grant_query_size(struct domain *d1,
+                                                 struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int dummy_memory_exchange(XSM_DEFAULT_ARG struct domain *d)
+static inline int dummy_memory_exchange(struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_memory_adjust_reservation(XSM_DEFAULT_ARG struct domain *d1,
-                                                            struct domain *d2)
+static inline int dummy_memory_adjust_reservation(struct domain *d1,
+                                                          struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int dummy_memory_stat_reservation(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static inline int dummy_memory_stat_reservation(struct domain *d1,
+                                                        struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int dummy_console_io(XSM_DEFAULT_ARG struct domain *d, int cmd)
+static inline int dummy_console_io(struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
     if ( d->is_console )
@@ -225,129 +228,140 @@ static XSM_INLINE int dummy_console_io(XSM_DEFAULT_ARG struct domain *d, int cmd
     return xsm_default_action(XSM_PRIV, d, NULL);
 }
 
-static XSM_INLINE int dummy_profile(XSM_DEFAULT_ARG struct domain *d, int op)
+static inline int dummy_profile(struct domain *d, int op)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d, NULL);
 }
 
-static XSM_INLINE int dummy_kexec(XSM_DEFAULT_VOID)
+static inline int dummy_kexec(void)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int dummy_schedop_shutdown(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static inline int dummy_schedop_shutdown(struct domain *d1,
+                                                 struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int dummy_memory_pin_page(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2,
-                                          struct page_info *page)
+static inline int dummy_memory_pin_page(struct domain *d1,
+                                                struct domain *d2,
+                                                struct page_info *page)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int dummy_claim_pages(XSM_DEFAULT_ARG struct domain *d)
+static inline int dummy_claim_pages(struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_evtchn_unbound(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn,
-                                         domid_t id2)
+static inline int dummy_evtchn_unbound(struct domain *d,
+                                               struct evtchn *chn,
+                                               domid_t id2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_evtchn_interdomain(XSM_DEFAULT_ARG struct domain *d1, struct evtchn
-                                *chan1, struct domain *d2, struct evtchn *chan2)
+static inline int dummy_evtchn_interdomain(struct domain *d1,
+                                                   struct evtchn *chan1,
+                                                   struct domain *d2,
+                                                   struct evtchn *chan2)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE void dummy_evtchn_close_post(struct evtchn *chn)
+static inline void dummy_evtchn_close_post(struct evtchn *chn)
 {
     return;
 }
 
-static XSM_INLINE int dummy_evtchn_send(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
+static inline int dummy_evtchn_send(struct domain *d,
+                                            struct evtchn *chn)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, d, NULL);
 }
 
-static XSM_INLINE int dummy_evtchn_status(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
+static inline int dummy_evtchn_status(struct domain *d,
+                                              struct evtchn *chn)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_evtchn_reset(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static inline int dummy_evtchn_reset(struct domain *d1,
+                                             struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int dummy_alloc_security_evtchns(
-    struct evtchn chn[], unsigned int nr)
+static inline int dummy_alloc_security_evtchns(struct evtchn chn[],
+                                                       unsigned int nr)
 {
     return 0;
 }
 
-static XSM_INLINE void dummy_free_security_evtchns(
-    struct evtchn chn[], unsigned int nr)
+static inline void dummy_free_security_evtchns(struct evtchn chn[],
+                                                       unsigned int nr)
 {
     return;
 }
 
-static XSM_INLINE char *dummy_show_security_evtchn(struct domain *d, const struct evtchn *chn)
+static inline char *dummy_show_security_evtchn(struct domain *d,
+                                                       const struct evtchn *chn)
 {
     return NULL;
 }
 
-static XSM_INLINE int dummy_init_hardware_domain(XSM_DEFAULT_ARG struct domain *d)
+static inline int dummy_init_hardware_domain(struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_get_pod_target(XSM_DEFAULT_ARG struct domain *d)
+static inline int dummy_get_pod_target(struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_set_pod_target(XSM_DEFAULT_ARG struct domain *d)
+static inline int dummy_set_pod_target(struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_get_vnumainfo(XSM_DEFAULT_ARG struct domain *d)
+static inline int dummy_get_vnumainfo(struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-static XSM_INLINE int dummy_get_device_group(XSM_DEFAULT_ARG uint32_t machine_bdf)
+static inline int dummy_get_device_group(uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int dummy_assign_device(XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf)
+static inline int dummy_assign_device(struct domain *d,
+                                              uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_deassign_device(XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf)
+static inline int dummy_deassign_device(struct domain *d,
+                                                uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
@@ -356,15 +370,15 @@ static XSM_INLINE int dummy_deassign_device(XSM_DEFAULT_ARG struct domain *d, ui
 #endif /* HAS_PASSTHROUGH && HAS_PCI */
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
-static XSM_INLINE int dummy_assign_dtdevice(XSM_DEFAULT_ARG struct domain *d,
-                                          const char *dtpath)
+static inline int dummy_assign_dtdevice(struct domain *d,
+                                                const char *dtpath)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_deassign_dtdevice(XSM_DEFAULT_ARG struct domain *d,
-                                            const char *dtpath)
+static inline int dummy_deassign_dtdevice(struct domain *d,
+                                                  const char *dtpath)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
@@ -372,178 +386,190 @@ static XSM_INLINE int dummy_deassign_dtdevice(XSM_DEFAULT_ARG struct domain *d,
 
 #endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
 
-static XSM_INLINE int dummy_resource_plug_core(XSM_DEFAULT_VOID)
+static inline int dummy_resource_plug_core(void)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int dummy_resource_unplug_core(XSM_DEFAULT_VOID)
+static inline int dummy_resource_unplug_core(void)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int dummy_resource_plug_pci(XSM_DEFAULT_ARG uint32_t machine_bdf)
+static inline int dummy_resource_plug_pci(uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int dummy_resource_unplug_pci(XSM_DEFAULT_ARG uint32_t machine_bdf)
+static inline int dummy_resource_unplug_pci(uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int dummy_resource_setup_pci(XSM_DEFAULT_ARG uint32_t machine_bdf)
+static inline int dummy_resource_setup_pci(uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int dummy_resource_setup_gsi(XSM_DEFAULT_ARG int gsi)
+static inline int dummy_resource_setup_gsi(int gsi)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int dummy_resource_setup_misc(XSM_DEFAULT_VOID)
+static inline int dummy_resource_setup_misc(void)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int dummy_page_offline(XSM_DEFAULT_ARG uint32_t cmd)
+static inline int dummy_page_offline(uint32_t cmd)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int dummy_hypfs_op(XSM_DEFAULT_VOID)
+static inline int dummy_hypfs_op(void)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE long dummy_do_xsm_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
+static inline long dummy_do_xsm_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 {
     return -ENOSYS;
 }
 
 #ifdef CONFIG_COMPAT
-static XSM_INLINE int dummy_do_compat_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
+static inline int dummy_do_compat_op(
+                                XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 {
     return -ENOSYS;
 }
 #endif
 
-static XSM_INLINE char *dummy_show_irq_sid(int irq)
+static inline char *dummy_show_irq_sid(int irq)
 {
     return NULL;
 }
 
-static XSM_INLINE int dummy_map_domain_pirq(XSM_DEFAULT_ARG struct domain *d)
+static inline int dummy_map_domain_pirq(struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_map_domain_irq(XSM_DEFAULT_ARG struct domain *d,
-                                         int irq, const void *data)
+static inline int dummy_map_domain_irq(struct domain *d, int irq,
+                                               const void *data)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_unmap_domain_pirq(XSM_DEFAULT_ARG struct domain *d)
+static inline int dummy_unmap_domain_pirq(struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_bind_pt_irq(XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
+static inline int dummy_bind_pt_irq(struct domain *d,
+                                            struct xen_domctl_bind_pt_irq *bind)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_unbind_pt_irq(XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
+static inline int dummy_unbind_pt_irq(struct domain *d,
+                                        struct xen_domctl_bind_pt_irq *bind)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_unmap_domain_irq(XSM_DEFAULT_ARG struct domain *d,
-                                           int irq, const void *data)
+static inline int dummy_unmap_domain_irq(struct domain *d, int irq,
+                                                 const void *data)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_irq_permission(XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
+static inline int dummy_irq_permission(struct domain *d, int pirq,
+                                               uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_iomem_permission(XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+static inline int dummy_iomem_permission(struct domain *d, uint64_t s,
+                                                 uint64_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_iomem_mapping(XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+static inline int dummy_iomem_mapping(struct domain *d, uint64_t s,
+                                              uint64_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_pci_config_permission(XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf,
-                                        uint16_t start, uint16_t end,
-                                        uint8_t access)
+static inline int dummy_pci_config_permission(struct domain *d,
+                                                      uint32_t machine_bdf,
+                                                      uint16_t start,
+                                                      uint16_t end,
+                                                      uint8_t access)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_add_to_physmap(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static inline int dummy_add_to_physmap(struct domain *d1,
+                                               struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int dummy_remove_from_physmap(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
+static inline int dummy_remove_from_physmap(struct domain *d1,
+                                                    struct domain *d2)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d1, d2);
 }
 
-static XSM_INLINE int dummy_map_gmfn_foreign(XSM_DEFAULT_ARG struct domain *d, struct domain *t)
+static inline int dummy_map_gmfn_foreign(struct domain *d,
+                                                 struct domain *t)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, t);
 }
 
-static XSM_INLINE int dummy_hvm_param(XSM_DEFAULT_ARG struct domain *d, unsigned long op)
+static inline int dummy_hvm_param(struct domain *d, unsigned long op)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_hvm_control(XSM_DEFAULT_ARG struct domain *d, unsigned long op)
+static inline int dummy_hvm_control(struct domain *d, unsigned long op)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_hvm_param_altp2mhvm(XSM_DEFAULT_ARG struct domain *d)
+static inline int dummy_hvm_param_altp2mhvm(struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_hvm_altp2mhvm_op(XSM_DEFAULT_ARG struct domain *d, uint64_t mode, uint32_t op)
+static inline int dummy_hvm_altp2mhvm_op(struct domain *d,
+                                                 uint64_t mode, uint32_t op)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
 
@@ -562,14 +588,15 @@ static XSM_INLINE int dummy_hvm_altp2mhvm_op(XSM_DEFAULT_ARG struct domain *d, u
     }
 }
 
-static XSM_INLINE int dummy_vm_event_control(XSM_DEFAULT_ARG struct domain *d, int mode, int op)
+static inline int dummy_vm_event_control(struct domain *d, int mode,
+                                                 int op)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
 #ifdef CONFIG_MEM_ACCESS
-static XSM_INLINE int dummy_mem_access(XSM_DEFAULT_ARG struct domain *d)
+static inline int dummy_mem_access(struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
@@ -577,7 +604,7 @@ static XSM_INLINE int dummy_mem_access(XSM_DEFAULT_ARG struct domain *d)
 #endif
 
 #ifdef CONFIG_MEM_PAGING
-static XSM_INLINE int dummy_mem_paging(XSM_DEFAULT_ARG struct domain *d)
+static inline int dummy_mem_paging(struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
@@ -585,58 +612,59 @@ static XSM_INLINE int dummy_mem_paging(XSM_DEFAULT_ARG struct domain *d)
 #endif
 
 #ifdef CONFIG_MEM_SHARING
-static XSM_INLINE int dummy_mem_sharing(XSM_DEFAULT_ARG struct domain *d)
+static inline int dummy_mem_sharing(struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 #endif
 
-static XSM_INLINE int dummy_platform_op(XSM_DEFAULT_ARG uint32_t op)
+static inline int dummy_platform_op(uint32_t op)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
 #ifdef CONFIG_X86
-static XSM_INLINE int dummy_do_mca(XSM_DEFAULT_VOID)
+static inline int dummy_do_mca(void)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int dummy_shadow_control(XSM_DEFAULT_ARG struct domain *d, uint32_t op)
+static inline int dummy_shadow_control(struct domain *d, uint32_t op)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_mem_sharing_op(XSM_DEFAULT_ARG struct domain *d, struct domain *cd, int op)
+static inline int dummy_mem_sharing_op(struct domain *d,
+                                               struct domain *cd, int op)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, cd);
 }
 
-static XSM_INLINE int dummy_apic(XSM_DEFAULT_ARG struct domain *d, int cmd)
+static inline int dummy_apic(struct domain *d, int cmd)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, d, NULL);
 }
 
-static XSM_INLINE int dummy_machine_memory_map(XSM_DEFAULT_VOID)
+static inline int dummy_machine_memory_map(void)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE int dummy_domain_memory_map(XSM_DEFAULT_ARG struct domain *d)
+static inline int dummy_domain_memory_map(struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_mmu_update(XSM_DEFAULT_ARG struct domain *d, struct domain *t,
-                                     struct domain *f, uint32_t flags)
+static inline int dummy_mmu_update(struct domain *d, struct domain *t,
+                                           struct domain *f, uint32_t flags)
 {
     int rc = 0;
     XSM_ASSERT_ACTION(XSM_TARGET);
@@ -647,38 +675,41 @@ static XSM_INLINE int dummy_mmu_update(XSM_DEFAULT_ARG struct domain *d, struct
     return rc;
 }
 
-static XSM_INLINE int dummy_mmuext_op(XSM_DEFAULT_ARG struct domain *d, struct domain *f)
+static inline int dummy_mmuext_op(struct domain *d, struct domain *f)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, f);
 }
 
-static XSM_INLINE int dummy_update_va_mapping(XSM_DEFAULT_ARG struct domain *d, struct domain *f,
-                                                            l1_pgentry_t pte)
+static inline int dummy_update_va_mapping(struct domain *d,
+                                                  struct domain *f,
+                                                  l1_pgentry_t pte)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, f);
 }
 
-static XSM_INLINE int dummy_priv_mapping(XSM_DEFAULT_ARG struct domain *d, struct domain *t)
+static inline int dummy_priv_mapping(struct domain *d, struct domain *t)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, t);
 }
 
-static XSM_INLINE int dummy_ioport_permission(XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+static inline int dummy_ioport_permission(struct domain *d, uint32_t s,
+                                                  uint32_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_ioport_mapping(XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+static inline int dummy_ioport_mapping(struct domain *d, uint32_t s,
+                                               uint32_t e, uint8_t allow)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
 }
 
-static XSM_INLINE int dummy_pmu_op (XSM_DEFAULT_ARG struct domain *d, unsigned int op)
+static inline int dummy_pmu_op (struct domain *d, unsigned int op)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( op )
@@ -695,31 +726,31 @@ static XSM_INLINE int dummy_pmu_op (XSM_DEFAULT_ARG struct domain *d, unsigned i
 
 #endif /* CONFIG_X86 */
 
-static XSM_INLINE int dummy_dm_op(XSM_DEFAULT_ARG struct domain *d)
+static inline int dummy_dm_op(struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
 
 #ifdef CONFIG_ARGO
-static XSM_INLINE int dummy_argo_enable(const struct domain *d)
+static inline int dummy_argo_enable(const struct domain *d)
 {
     return 0;
 }
 
-static XSM_INLINE int dummy_argo_register_single_source(const struct domain *d,
-                                                      const struct domain *t)
+static inline int dummy_argo_register_single_source(const struct domain *d,
+                                                            const struct domain *t)
 {
     return 0;
 }
 
-static XSM_INLINE int dummy_argo_register_any_source(const struct domain *d)
+static inline int dummy_argo_register_any_source(const struct domain *d)
 {
     return 0;
 }
 
-static XSM_INLINE int dummy_argo_send(const struct domain *d,
-                                    const struct domain *t)
+static inline int dummy_argo_send(const struct domain *d,
+                                          const struct domain *t)
 {
     return 0;
 }
@@ -727,7 +758,7 @@ static XSM_INLINE int dummy_argo_send(const struct domain *d,
 #endif /* CONFIG_ARGO */
 
 #include <public/version.h>
-static XSM_INLINE int dummy_xen_version (XSM_DEFAULT_ARG uint32_t op)
+static inline int dummy_xen_version(uint32_t op)
 {
     XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( op )
@@ -751,7 +782,7 @@ static XSM_INLINE int dummy_xen_version (XSM_DEFAULT_ARG uint32_t op)
     }
 }
 
-static XSM_INLINE int dummy_domain_resource_map(XSM_DEFAULT_ARG struct domain *d)
+static inline int dummy_domain_resource_map(struct domain *d)
 {
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
-- 
2.20.1


