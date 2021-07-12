Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1853C6501
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 22:31:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154816.285970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m32a2-0005rd-JX; Mon, 12 Jul 2021 20:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154816.285970; Mon, 12 Jul 2021 20:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m32a2-0005pb-EV; Mon, 12 Jul 2021 20:31:06 +0000
Received: by outflank-mailman (input) for mailman id 154816;
 Mon, 12 Jul 2021 20:31:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Agf=ME=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1m32a0-0005oi-Kk
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 20:31:04 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12d70888-e350-11eb-8707-12813bfff9fa;
 Mon, 12 Jul 2021 20:31:02 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1626121636585297.66257063713635;
 Mon, 12 Jul 2021 13:27:16 -0700 (PDT)
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
X-Inumbo-ID: 12d70888-e350-11eb-8707-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1626121639; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Alb+MINzXH+bQwKwNkaPrm1Y3kEhpIOnIzAgo3/YrC8a1ZbWIe7BKWBaMTT0t0O2chgy8DjkbmPUPYvb0khfBlacBVK5w6x5k+PuvEGbVpx/HlWQBfYdk16fPqHTMGQZdiFURIsoUcwGx7/fw6KbN7+3JWX9zVIiywOk2/NZmDQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1626121639; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=LV+3c7OanjF9V/QSRwZgTnYolGtu8qd9oivP6z0k1EE=; 
	b=OhicGuXe/BWiSJwWf39s4lJIHqF3Ba29tBPrSXXzmpOEuh/FQzRXUGQ41JmAdbbaA3xCbPtIXVCmsGYVTSjqewF3/9xOgNQzfGwslJ38m4oJTPhoiYrhhzeTuOh22i+PN54a4pxtf98gidfvPT1lzpw/inNO5AD6l9Cp+M2jbJY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626121639;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=LV+3c7OanjF9V/QSRwZgTnYolGtu8qd9oivP6z0k1EE=;
	b=mvk07+6QLusJqFycMyiJAwbxkogNP6tWALXFamy9d8+q6yrZKBPhfd6Yl/D2BODu
	tZKzZOMHSMFeqDV5kCMc6Oj0FK8LEOFeNJGPNWKcUQSWRHxjc8YiSZ0c+f5ux7aNHxS
	VoGTGlSOS9vtj1EZheZKxr4joTugtTQJvSp57Mbc=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v2 10/10] xsm: removing the XSM_ASSERT_ACTION macro
Date: Mon, 12 Jul 2021 16:32:33 -0400
Message-Id: <20210712203233.20289-11-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712203233.20289-1-dpsmith@apertussolutions.com>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

With the eliminations of default priv from all the XSM hook call sites, this
renders the XSM_ASSERT_ACTION macro unneeded. This commit cleans up all the
dummy hooks, removing the macro.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/xsm/dummy.h | 253 +++++++++++++++---------------------------------
 1 file changed, 80 insertions(+), 173 deletions(-)

diff --git a/xen/xsm/dummy.h b/xen/xsm/dummy.h
index 1cb26e4146..1aaec86b05 100644
--- a/xen/xsm/dummy.h
+++ b/xen/xsm/dummy.h
@@ -6,13 +6,6 @@
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License version 2,
  *  as published by the Free Software Foundation.
- *
- *
- *  Each XSM hook implementing an access check should have its first parameter
- *  preceded by (or use XSM_DEFAULT_VOID if it has no
- *  arguments). The first non-declaration statement shold be XSM_ASSERT_ACTION
- *  with the expected type of the hook, which will either define or check the
- *  value of action.
  */
 
 #include <xen/sched.h>
@@ -47,7 +40,6 @@ void __xsm_action_mismatch_detected(void);
  * xsm_default_t argument available, so the value from the assertion is used to
  * initialize the variable.
  */
-#define XSM_ASSERT_ACTION(def) xsm_default_t action = def; (void)action
 
 static always_inline int xsm_default_action(xsm_default_t action,
                                             struct domain *src,
@@ -87,37 +79,31 @@ static inline void dummy_security_domaininfo(struct domain *d,
 
 static inline int dummy_domain_create(struct domain *d, u32 ssidref)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static inline int dummy_getdomaininfo(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static inline int dummy_domctl_scheduler_op(struct domain *d, int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static inline int dummy_sysctl_scheduler_op(int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
 }
 
 static inline int dummy_set_target(struct domain *d, struct domain *e)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
 }
 
 static inline int dummy_domctl(struct domain *d, int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( cmd )
     {
     case XEN_DOMCTL_ioport_mapping:
@@ -134,14 +120,12 @@ static inline int dummy_domctl(struct domain *d, int cmd)
 
 static inline int dummy_sysctl(int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static inline int dummy_readconsole(uint32_t clear)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
 }
 
 static inline int dummy_alloc_security_domain(struct domain *d)
@@ -158,67 +142,57 @@ static inline int dummy_grant_mapref(struct domain *d1,
                                              struct domain *d2,
                                              uint32_t flags)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_HOOK, d1, d2);
 }
 
 static inline int dummy_grant_unmapref(struct domain *d1,
                                                struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_HOOK, d1, d2);
 }
 
 static inline int dummy_grant_setup(struct domain *d1,
                                             struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_TARGET, d1, d2);
 }
 
 static inline int dummy_grant_transfer(struct domain *d1,
                                                struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_HOOK, d1, d2);
 }
 
 static inline int dummy_grant_copy(struct domain *d1, struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_HOOK, d1, d2);
 }
 
 static inline int dummy_grant_query_size(struct domain *d1,
                                                  struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_TARGET, d1, d2);
 }
 
 static inline int dummy_memory_exchange(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_TARGET, current->domain, d);
 }
 
 static inline int dummy_memory_adjust_reservation(struct domain *d1,
                                                           struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_TARGET, d1, d2);
 }
 
 static inline int dummy_memory_stat_reservation(struct domain *d1,
                                                         struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_TARGET, d1, d2);
 }
 
 static inline int dummy_console_io(struct domain *d, int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_OTHER);
     if ( d->is_console )
         return xsm_default_action(XSM_HOOK, d, NULL);
 #ifdef CONFIG_VERBOSE_DEBUG
@@ -230,43 +204,37 @@ static inline int dummy_console_io(struct domain *d, int cmd)
 
 static inline int dummy_profile(struct domain *d, int op)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d, NULL);
+    return xsm_default_action(XSM_HOOK, d, NULL);
 }
 
 static inline int dummy_kexec(void)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static inline int dummy_schedop_shutdown(struct domain *d1,
                                                  struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_PRIV, d1, d2);
 }
 
 static inline int dummy_memory_pin_page(struct domain *d1,
                                                 struct domain *d2,
                                                 struct page_info *page)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_HOOK, d1, d2);
 }
 
 static inline int dummy_claim_pages(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_PRIV, current->domain, d);
 }
 
 static inline int dummy_evtchn_unbound(struct domain *d,
                                                struct evtchn *chn,
                                                domid_t id2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_TARGET, current->domain, d);
 }
 
 static inline int dummy_evtchn_interdomain(struct domain *d1,
@@ -274,8 +242,7 @@ static inline int dummy_evtchn_interdomain(struct domain *d1,
                                                    struct domain *d2,
                                                    struct evtchn *chan2)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_HOOK, d1, d2);
 }
 
 static inline void dummy_evtchn_close_post(struct evtchn *chn)
@@ -286,22 +253,19 @@ static inline void dummy_evtchn_close_post(struct evtchn *chn)
 static inline int dummy_evtchn_send(struct domain *d,
                                             struct evtchn *chn)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d, NULL);
+    return xsm_default_action(XSM_HOOK, d, NULL);
 }
 
 static inline int dummy_evtchn_status(struct domain *d,
                                               struct evtchn *chn)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_TARGET, current->domain, d);
 }
 
 static inline int dummy_evtchn_reset(struct domain *d1,
                                              struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_TARGET, d1, d2);
 }
 
 static inline int dummy_alloc_security_evtchns(struct evtchn chn[],
@@ -324,47 +288,40 @@ static inline char *dummy_show_security_evtchn(struct domain *d,
 
 static inline int dummy_init_hardware_domain(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static inline int dummy_get_pod_target(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_PRIV, current->domain, d);
 }
 
 static inline int dummy_set_pod_target(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_PRIV, current->domain, d);
 }
 
 static inline int dummy_get_vnumainfo(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_TARGET, current->domain, d);
 }
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
 static inline int dummy_get_device_group(uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
 }
 
 static inline int dummy_assign_device(struct domain *d,
                                               uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static inline int dummy_deassign_device(struct domain *d,
                                                 uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 #endif /* HAS_PASSTHROUGH && HAS_PCI */
@@ -373,71 +330,60 @@ static inline int dummy_deassign_device(struct domain *d,
 static inline int dummy_assign_dtdevice(struct domain *d,
                                                 const char *dtpath)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static inline int dummy_deassign_dtdevice(struct domain *d,
                                                   const char *dtpath)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 #endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
 
 static inline int dummy_resource_plug_core(void)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
 }
 
 static inline int dummy_resource_unplug_core(void)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
 }
 
 static inline int dummy_resource_plug_pci(uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static inline int dummy_resource_unplug_pci(uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static inline int dummy_resource_setup_pci(uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static inline int dummy_resource_setup_gsi(int gsi)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static inline int dummy_resource_setup_misc(void)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static inline int dummy_page_offline(uint32_t cmd)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
 }
 
 static inline int dummy_hypfs_op(void)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static inline long dummy_do_xsm_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
@@ -460,63 +406,54 @@ static inline char *dummy_show_irq_sid(int irq)
 
 static inline int dummy_map_domain_pirq(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
 }
 
 static inline int dummy_map_domain_irq(struct domain *d, int irq,
                                                const void *data)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static inline int dummy_unmap_domain_pirq(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
 }
 
 static inline int dummy_bind_pt_irq(struct domain *d,
                                             struct xen_domctl_bind_pt_irq *bind)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static inline int dummy_unbind_pt_irq(struct domain *d,
                                         struct xen_domctl_bind_pt_irq *bind)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static inline int dummy_unmap_domain_irq(struct domain *d, int irq,
                                                  const void *data)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static inline int dummy_irq_permission(struct domain *d, int pirq,
                                                uint8_t allow)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static inline int dummy_iomem_permission(struct domain *d, uint64_t s,
                                                  uint64_t e, uint8_t allow)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static inline int dummy_iomem_mapping(struct domain *d, uint64_t s,
                                               uint64_t e, uint8_t allow)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static inline int dummy_pci_config_permission(struct domain *d,
@@ -525,54 +462,45 @@ static inline int dummy_pci_config_permission(struct domain *d,
                                                       uint16_t end,
                                                       uint8_t access)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static inline int dummy_add_to_physmap(struct domain *d1,
                                                struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_TARGET, d1, d2);
 }
 
 static inline int dummy_remove_from_physmap(struct domain *d1,
                                                     struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_TARGET, d1, d2);
 }
 
 static inline int dummy_map_gmfn_foreign(struct domain *d,
                                                  struct domain *t)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d, t);
+    return xsm_default_action(XSM_TARGET, d, t);
 }
 
 static inline int dummy_hvm_param(struct domain *d, unsigned long op)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_TARGET, current->domain, d);
 }
 
 static inline int dummy_hvm_control(struct domain *d, unsigned long op)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
 }
 
 static inline int dummy_hvm_param_altp2mhvm(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_PRIV, current->domain, d);
 }
 
 static inline int dummy_hvm_altp2mhvm_op(struct domain *d,
                                                  uint64_t mode, uint32_t op)
 {
-    XSM_ASSERT_ACTION(XSM_OTHER);
-
     switch ( mode )
     {
     case XEN_ALTP2M_mixed:
@@ -591,127 +519,109 @@ static inline int dummy_hvm_altp2mhvm_op(struct domain *d,
 static inline int dummy_vm_event_control(struct domain *d, int mode,
                                                  int op)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_PRIV, current->domain, d);
 }
 
 #ifdef CONFIG_MEM_ACCESS
 static inline int dummy_mem_access(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
 }
 #endif
 
 #ifdef CONFIG_MEM_PAGING
 static inline int dummy_mem_paging(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
 }
 #endif
 
 #ifdef CONFIG_MEM_SHARING
 static inline int dummy_mem_sharing(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
 }
 #endif
 
 static inline int dummy_platform_op(uint32_t op)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 #ifdef CONFIG_X86
 static inline int dummy_do_mca(void)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static inline int dummy_shadow_control(struct domain *d, uint32_t op)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static inline int dummy_mem_sharing_op(struct domain *d,
                                                struct domain *cd, int op)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, cd);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, cd);
 }
 
 static inline int dummy_apic(struct domain *d, int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, d, NULL);
+    return xsm_default_action(XSM_PRIV, d, NULL);
 }
 
 static inline int dummy_machine_memory_map(void)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static inline int dummy_domain_memory_map(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_TARGET, current->domain, d);
 }
 
 static inline int dummy_mmu_update(struct domain *d, struct domain *t,
                                            struct domain *f, uint32_t flags)
 {
     int rc = 0;
-    XSM_ASSERT_ACTION(XSM_TARGET);
     if ( f != dom_io )
-        rc = xsm_default_action(action, d, f);
+        rc = xsm_default_action(XSM_TARGET, d, f);
     if ( evaluate_nospec(t) && !rc )
-        rc = xsm_default_action(action, d, t);
+        rc = xsm_default_action(XSM_TARGET, d, t);
     return rc;
 }
 
 static inline int dummy_mmuext_op(struct domain *d, struct domain *f)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d, f);
+    return xsm_default_action(XSM_TARGET, d, f);
 }
 
 static inline int dummy_update_va_mapping(struct domain *d,
                                                   struct domain *f,
                                                   l1_pgentry_t pte)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d, f);
+    return xsm_default_action(XSM_TARGET, d, f);
 }
 
 static inline int dummy_priv_mapping(struct domain *d, struct domain *t)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d, t);
+    return xsm_default_action(XSM_TARGET, d, t);
 }
 
 static inline int dummy_ioport_permission(struct domain *d, uint32_t s,
                                                   uint32_t e, uint8_t allow)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static inline int dummy_ioport_mapping(struct domain *d, uint32_t s,
                                                uint32_t e, uint8_t allow)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static inline int dummy_pmu_op (struct domain *d, unsigned int op)
 {
-    XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( op )
     {
     case XENPMU_init:
@@ -728,8 +638,7 @@ static inline int dummy_pmu_op (struct domain *d, unsigned int op)
 
 static inline int dummy_dm_op(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
 }
 
 #ifdef CONFIG_ARGO
@@ -760,7 +669,6 @@ static inline int dummy_argo_send(const struct domain *d,
 #include <public/version.h>
 static inline int dummy_xen_version(uint32_t op)
 {
-    XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( op )
     {
     case XENVER_version:
@@ -784,6 +692,5 @@ static inline int dummy_xen_version(uint32_t op)
 
 static inline int dummy_domain_resource_map(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
 }
-- 
2.20.1


