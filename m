Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D33ABF9D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 01:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144264.265589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu1ZC-0000Lq-Pq; Thu, 17 Jun 2021 23:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144264.265589; Thu, 17 Jun 2021 23:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu1ZC-0000Jw-Lp; Thu, 17 Jun 2021 23:36:58 +0000
Received: by outflank-mailman (input) for mailman id 144264;
 Thu, 17 Jun 2021 23:36:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uRdX=LL=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lu1ZA-0000JT-Lg
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 23:36:56 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cda7e63c-4b33-4129-a64b-357815c15e21;
 Thu, 17 Jun 2021 23:36:54 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1623972586949895.2181897487453;
 Thu, 17 Jun 2021 16:29:46 -0700 (PDT)
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
X-Inumbo-ID: cda7e63c-4b33-4129-a64b-357815c15e21
ARC-Seal: i=1; a=rsa-sha256; t=1623972589; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d/t4QKafbLsPUbZW/WSVybnT5njvJhUqeMPsqKp81viwStE+ZFxwDsLzDzxs3scW60uB74oNdQ2Rzgat6RAq/Rkuqp+PoVyF41W3cJMjMKLwiN1Sln3N3kwYjHunGpageBsyf2dfe8NWxb9gOIlOrGmD062ix4ME6gjOEMFNFcE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1623972589; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=YFu+rVtA5VrwxbGKXPK/7zCv7ouqRqBTHwPWaZOrI9E=; 
	b=XYx3F0JTqXMkA5SbqkBGKWUaXyQIbxf78SBhr4stGX6hh/h1DvXX8HHEfVHcgA7D0SJX4jwEsdjsNYOcrioKx86p2KJ61khdEjk+KTbWj/LAwiv/i7SmKCa/5OX02tLc4R27oqEMnyY2kiwpJ9Tcw+lByCYXDCxH42Raj8LLCvg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1623972589;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=YFu+rVtA5VrwxbGKXPK/7zCv7ouqRqBTHwPWaZOrI9E=;
	b=CTE1RiWznXVFL256Of++6nzl4gL58D9d+O5SM0vlwXjeIpslqW0oTnSD3dGmCoAF
	TUw7jtSAfgF6E+FlRHUqp/3U+U9/9ZUD7vaiMrSazo6hPn0RIgnTtOuGyYYh0/4VnGQ
	ZjA4PiaDHk980cK2f9NS5voEV3e9zjR8QzyHgaSA=
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
Subject: [PATCH 6/6] xsm: removing the XSM_ASSERT_ACTION macro
Date: Thu, 17 Jun 2021 19:39:18 -0400
Message-Id: <20210617233918.10095-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617233918.10095-1-dpsmith@apertussolutions.com>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
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
index 0f8ea163af..1a9a6b2935 100644
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
@@ -48,7 +41,6 @@ void __xsm_action_mismatch_detected(void);
  * initialize the variable.
  */
 #define XSM_DEFAULT_VOID void
-#define XSM_ASSERT_ACTION(def) xsm_default_t action = def; (void)action
 
 static always_inline int xsm_default_action(xsm_default_t action,
                                             struct domain *src,
@@ -88,37 +80,31 @@ static __maybe_unused void dummy_security_domaininfo(struct domain *d,
 
 static __maybe_unused int dummy_domain_create(struct domain *d, u32 ssidref)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static __maybe_unused int dummy_getdomaininfo(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static __maybe_unused int dummy_domctl_scheduler_op(struct domain *d, int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static __maybe_unused int dummy_sysctl_scheduler_op(int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
 }
 
 static __maybe_unused int dummy_set_target(struct domain *d, struct domain *e)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
 }
 
 static __maybe_unused int dummy_domctl(struct domain *d, int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( cmd )
     {
     case XEN_DOMCTL_ioport_mapping:
@@ -135,14 +121,12 @@ static __maybe_unused int dummy_domctl(struct domain *d, int cmd)
 
 static __maybe_unused int dummy_sysctl(int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static __maybe_unused int dummy_readconsole(uint32_t clear)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
 }
 
 static __maybe_unused int dummy_alloc_security_domain(struct domain *d)
@@ -159,67 +143,57 @@ static __maybe_unused int dummy_grant_mapref(struct domain *d1,
                                              struct domain *d2,
                                              uint32_t flags)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_HOOK, d1, d2);
 }
 
 static __maybe_unused int dummy_grant_unmapref(struct domain *d1,
                                                struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_HOOK, d1, d2);
 }
 
 static __maybe_unused int dummy_grant_setup(struct domain *d1,
                                             struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_TARGET, d1, d2);
 }
 
 static __maybe_unused int dummy_grant_transfer(struct domain *d1,
                                                struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_HOOK, d1, d2);
 }
 
 static __maybe_unused int dummy_grant_copy(struct domain *d1, struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_HOOK, d1, d2);
 }
 
 static __maybe_unused int dummy_grant_query_size(struct domain *d1,
                                                  struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_TARGET, d1, d2);
 }
 
 static __maybe_unused int dummy_memory_exchange(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_TARGET, current->domain, d);
 }
 
 static __maybe_unused int dummy_memory_adjust_reservation(struct domain *d1,
                                                           struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_TARGET, d1, d2);
 }
 
 static __maybe_unused int dummy_memory_stat_reservation(struct domain *d1,
                                                         struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_TARGET, d1, d2);
 }
 
 static __maybe_unused int dummy_console_io(struct domain *d, int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_OTHER);
     if ( d->is_console )
         return xsm_default_action(XSM_HOOK, d, NULL);
 #ifdef CONFIG_VERBOSE_DEBUG
@@ -231,43 +205,37 @@ static __maybe_unused int dummy_console_io(struct domain *d, int cmd)
 
 static __maybe_unused int dummy_profile(struct domain *d, int op)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d, NULL);
+    return xsm_default_action(XSM_HOOK, d, NULL);
 }
 
 static __maybe_unused int dummy_kexec(XSM_DEFAULT_VOID)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static __maybe_unused int dummy_schedop_shutdown(struct domain *d1,
                                                  struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_PRIV, d1, d2);
 }
 
 static __maybe_unused int dummy_memory_pin_page(struct domain *d1,
                                                 struct domain *d2,
                                                 struct page_info *page)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_HOOK, d1, d2);
 }
 
 static __maybe_unused int dummy_claim_pages(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_PRIV, current->domain, d);
 }
 
 static __maybe_unused int dummy_evtchn_unbound(struct domain *d,
                                                struct evtchn *chn,
                                                domid_t id2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_TARGET, current->domain, d);
 }
 
 static __maybe_unused int dummy_evtchn_interdomain(struct domain *d1,
@@ -275,8 +243,7 @@ static __maybe_unused int dummy_evtchn_interdomain(struct domain *d1,
                                                    struct domain *d2,
                                                    struct evtchn *chan2)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_HOOK, d1, d2);
 }
 
 static __maybe_unused void dummy_evtchn_close_post(struct evtchn *chn)
@@ -287,22 +254,19 @@ static __maybe_unused void dummy_evtchn_close_post(struct evtchn *chn)
 static __maybe_unused int dummy_evtchn_send(struct domain *d,
                                             struct evtchn *chn)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d, NULL);
+    return xsm_default_action(XSM_HOOK, d, NULL);
 }
 
 static __maybe_unused int dummy_evtchn_status(struct domain *d,
                                               struct evtchn *chn)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_TARGET, current->domain, d);
 }
 
 static __maybe_unused int dummy_evtchn_reset(struct domain *d1,
                                              struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_TARGET, d1, d2);
 }
 
 static __maybe_unused int dummy_alloc_security_evtchns(struct evtchn chn[],
@@ -325,47 +289,40 @@ static __maybe_unused char *dummy_show_security_evtchn(struct domain *d,
 
 static __maybe_unused int dummy_init_hardware_domain(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static __maybe_unused int dummy_get_pod_target(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_PRIV, current->domain, d);
 }
 
 static __maybe_unused int dummy_set_pod_target(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_PRIV, current->domain, d);
 }
 
 static __maybe_unused int dummy_get_vnumainfo(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_TARGET, current->domain, d);
 }
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
 static __maybe_unused int dummy_get_device_group(uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
 }
 
 static __maybe_unused int dummy_assign_device(struct domain *d,
                                               uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static __maybe_unused int dummy_deassign_device(struct domain *d,
                                                 uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 #endif /* HAS_PASSTHROUGH && HAS_PCI */
@@ -374,71 +331,60 @@ static __maybe_unused int dummy_deassign_device(struct domain *d,
 static __maybe_unused int dummy_assign_dtdevice(struct domain *d,
                                                 const char *dtpath)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static __maybe_unused int dummy_deassign_dtdevice(struct domain *d,
                                                   const char *dtpath)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 #endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
 
 static __maybe_unused int dummy_resource_plug_core(XSM_DEFAULT_VOID)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
 }
 
 static __maybe_unused int dummy_resource_unplug_core(XSM_DEFAULT_VOID)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
 }
 
 static __maybe_unused int dummy_resource_plug_pci(uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static __maybe_unused int dummy_resource_unplug_pci(uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static __maybe_unused int dummy_resource_setup_pci(uint32_t machine_bdf)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static __maybe_unused int dummy_resource_setup_gsi(int gsi)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static __maybe_unused int dummy_resource_setup_misc(XSM_DEFAULT_VOID)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static __maybe_unused int dummy_page_offline(uint32_t cmd)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
 }
 
 static __maybe_unused int dummy_hypfs_op(XSM_DEFAULT_VOID)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static __maybe_unused long dummy_do_xsm_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
@@ -461,63 +407,54 @@ static __maybe_unused char *dummy_show_irq_sid(int irq)
 
 static __maybe_unused int dummy_map_domain_pirq(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
 }
 
 static __maybe_unused int dummy_map_domain_irq(struct domain *d, int irq,
                                                const void *data)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static __maybe_unused int dummy_unmap_domain_pirq(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
 }
 
 static __maybe_unused int dummy_bind_pt_irq(struct domain *d,
                                             struct xen_domctl_bind_pt_irq *bind)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static __maybe_unused int dummy_unbind_pt_irq(struct domain *d,
                                         struct xen_domctl_bind_pt_irq *bind)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static __maybe_unused int dummy_unmap_domain_irq(struct domain *d, int irq,
                                                  const void *data)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static __maybe_unused int dummy_irq_permission(struct domain *d, int pirq,
                                                uint8_t allow)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static __maybe_unused int dummy_iomem_permission(struct domain *d, uint64_t s,
                                                  uint64_t e, uint8_t allow)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static __maybe_unused int dummy_iomem_mapping(struct domain *d, uint64_t s,
                                               uint64_t e, uint8_t allow)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static __maybe_unused int dummy_pci_config_permission(struct domain *d,
@@ -526,54 +463,45 @@ static __maybe_unused int dummy_pci_config_permission(struct domain *d,
                                                       uint16_t end,
                                                       uint8_t access)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static __maybe_unused int dummy_add_to_physmap(struct domain *d1,
                                                struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_TARGET, d1, d2);
 }
 
 static __maybe_unused int dummy_remove_from_physmap(struct domain *d1,
                                                     struct domain *d2)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
+    return xsm_default_action(XSM_TARGET, d1, d2);
 }
 
 static __maybe_unused int dummy_map_gmfn_foreign(struct domain *d,
                                                  struct domain *t)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d, t);
+    return xsm_default_action(XSM_TARGET, d, t);
 }
 
 static __maybe_unused int dummy_hvm_param(struct domain *d, unsigned long op)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_TARGET, current->domain, d);
 }
 
 static __maybe_unused int dummy_hvm_control(struct domain *d, unsigned long op)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
 }
 
 static __maybe_unused int dummy_hvm_param_altp2mhvm(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_PRIV, current->domain, d);
 }
 
 static __maybe_unused int dummy_hvm_altp2mhvm_op(struct domain *d,
                                                  uint64_t mode, uint32_t op)
 {
-    XSM_ASSERT_ACTION(XSM_OTHER);
-
     switch ( mode )
     {
     case XEN_ALTP2M_mixed:
@@ -592,127 +520,109 @@ static __maybe_unused int dummy_hvm_altp2mhvm_op(struct domain *d,
 static __maybe_unused int dummy_vm_event_control(struct domain *d, int mode,
                                                  int op)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_PRIV, current->domain, d);
 }
 
 #ifdef CONFIG_MEM_ACCESS
 static __maybe_unused int dummy_mem_access(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
 }
 #endif
 
 #ifdef CONFIG_MEM_PAGING
 static __maybe_unused int dummy_mem_paging(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
 }
 #endif
 
 #ifdef CONFIG_MEM_SHARING
 static __maybe_unused int dummy_mem_sharing(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
 }
 #endif
 
 static __maybe_unused int dummy_platform_op(uint32_t op)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 #ifdef CONFIG_X86
 static __maybe_unused int dummy_do_mca(XSM_DEFAULT_VOID)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static __maybe_unused int dummy_shadow_control(struct domain *d, uint32_t op)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static __maybe_unused int dummy_mem_sharing_op(struct domain *d,
                                                struct domain *cd, int op)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, cd);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, cd);
 }
 
 static __maybe_unused int dummy_apic(struct domain *d, int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, d, NULL);
+    return xsm_default_action(XSM_PRIV, d, NULL);
 }
 
 static __maybe_unused int dummy_machine_memory_map(XSM_DEFAULT_VOID)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
 }
 
 static __maybe_unused int dummy_domain_memory_map(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_TARGET, current->domain, d);
 }
 
 static __maybe_unused int dummy_mmu_update(struct domain *d, struct domain *t,
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
 
 static __maybe_unused int dummy_mmuext_op(struct domain *d, struct domain *f)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d, f);
+    return xsm_default_action(XSM_TARGET, d, f);
 }
 
 static __maybe_unused int dummy_update_va_mapping(struct domain *d,
                                                   struct domain *f,
                                                   l1_pgentry_t pte)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d, f);
+    return xsm_default_action(XSM_TARGET, d, f);
 }
 
 static __maybe_unused int dummy_priv_mapping(struct domain *d, struct domain *t)
 {
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d, t);
+    return xsm_default_action(XSM_TARGET, d, t);
 }
 
 static __maybe_unused int dummy_ioport_permission(struct domain *d, uint32_t s,
                                                   uint32_t e, uint8_t allow)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static __maybe_unused int dummy_ioport_mapping(struct domain *d, uint32_t s,
                                                uint32_t e, uint8_t allow)
 {
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
 }
 
 static __maybe_unused int dummy_pmu_op (struct domain *d, unsigned int op)
 {
-    XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( op )
     {
     case XENPMU_init:
@@ -729,8 +639,7 @@ static __maybe_unused int dummy_pmu_op (struct domain *d, unsigned int op)
 
 static __maybe_unused int dummy_dm_op(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
 }
 
 #ifdef CONFIG_ARGO
@@ -761,7 +670,6 @@ static __maybe_unused int dummy_argo_send(const struct domain *d,
 #include <public/version.h>
 static __maybe_unused int dummy_xen_version(uint32_t op)
 {
-    XSM_ASSERT_ACTION(XSM_OTHER);
     switch ( op )
     {
     case XENVER_version:
@@ -785,6 +693,5 @@ static __maybe_unused int dummy_xen_version(uint32_t op)
 
 static __maybe_unused int dummy_domain_resource_map(struct domain *d)
 {
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, current->domain, d);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
 }
-- 
2.20.1


