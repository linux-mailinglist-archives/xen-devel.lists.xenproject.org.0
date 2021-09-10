Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 336B3405F57
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 00:21:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183667.331947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOSPt-0002Pv-Ce; Thu, 09 Sep 2021 22:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183667.331947; Thu, 09 Sep 2021 22:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOSPt-0002O7-9F; Thu, 09 Sep 2021 22:21:09 +0000
Received: by outflank-mailman (input) for mailman id 183667;
 Thu, 09 Sep 2021 22:21:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mNcr=N7=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mOSJF-00067V-4M
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 22:14:17 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3dd432a6-11bb-11ec-b1fd-12813bfff9fa;
 Thu, 09 Sep 2021 22:14:04 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631225561654476.0107130223921;
 Thu, 9 Sep 2021 15:12:41 -0700 (PDT)
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
X-Inumbo-ID: 3dd432a6-11bb-11ec-b1fd-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1631225565; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eF8L9xNUKxrmrq5u+QlxNi6jTGykDuQmZ/x8eHbUcHkph+1XuhsWcmekx3ZKmh8uksbkq/otrD3fMEgiylkTyKGGefq2wn/c4FertR3boO4VxF9CkhVblbfh2jHiiObVo+750py9EeKtA/v8N4K5uvSf3/GQP8vdCwOPyFImwJ8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631225565; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=gxeXB5svWpcttsgrZvh81hoLL/bHHrd07F+Dm2+Gyo8=; 
	b=BB94jkwXK8mvsfNwt/K5ossWsS7SRLhd7iIcTtP5r7YIxtZsPAMCyW96S+GmEd0jlWI2uqG3ZRitm+mcR8jlGEKx9A1bJjWofHF3Xg1gZTiJmabytjupyZ554bwo0m+2U94efgGABfr5zm91PzYIJpVIXx+3iNMxMZGguARf8b0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631225565;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gxeXB5svWpcttsgrZvh81hoLL/bHHrd07F+Dm2+Gyo8=;
	b=unT1Q80oLMA33TgfThS+s4fmLuI0AEEhLrrUGniTGW4Dkn3VGBQXiV/Km2jMGcNS
	WQqtSHMINp2sIi5wNbmAAZ4d+1qG9oOoW1rsr0PlC9FnSLqTKljeOQFJ35legTJK09W
	Dz3KHh9ZB/E6Urc0SJxdPZLVoS4WZfqJfHPcvP5c=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v5 10/10] xsm: remove alternate xsm hook interface
Date: Thu,  9 Sep 2021 22:12:35 -0400
Message-Id: <20210910021236.15082-11-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210910021236.15082-1-dpsmith@apertussolutions.com>
References: <20210910021236.15082-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hidden behind macro magic is an alternative xsm hook interface dedicated for
use when the dummy/default policy is the only one built. This alternative
interface increases code complexity and code size in the core security
framework of Xen.  This results in code requiring additional maintanence and
additional risk for securit-relevant bugs.

This patch removes this additional interface, making Xen's security framework
have a single, consistent interface that works in a single and consistent
manner regardless of which XSM policy is in use.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xsm/dummy.h    | 819 -------------------------------------
 xen/include/xsm/xsm-core.h |  51 ++-
 xen/include/xsm/xsm.h      | 275 ++++++++-----
 xen/xsm/Makefile           |   2 +-
 xen/xsm/dummy.c            |   2 +-
 xen/xsm/dummy.h            | 659 +++++++++++++++++++++++++++++
 xen/xsm/silo.c             |   2 +-
 xen/xsm/xsm_core.c         |   4 -
 8 files changed, 868 insertions(+), 946 deletions(-)
 delete mode 100644 xen/include/xsm/dummy.h
 create mode 100644 xen/xsm/dummy.h

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
deleted file mode 100644
index 002e0bcc4f..0000000000
--- a/xen/include/xsm/dummy.h
+++ /dev/null
@@ -1,819 +0,0 @@
-/*
- *  Default XSM hooks - IS_PRIV and IS_PRIV_FOR checks
- *
- *  Author: Daniel De Graaf <dgdegra@tyhco.nsa.gov>
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2,
- *  as published by the Free Software Foundation.
- *
- *
- *  Each XSM hook implementing an access check should have its first parameter
- *  preceded by XSM_DEFAULT_ARG (or use XSM_DEFAULT_VOID if it has no
- *  arguments). The first non-declaration statement shold be XSM_ASSERT_ACTION
- *  with the expected type of the hook, which will either define or check the
- *  value of action.
- */
-
-#include <xen/sched.h>
-#include <xsm/xsm-core.h>
-#include <public/hvm/params.h>
-
-/*
- * Cannot use BUILD_BUG_ON here because the expressions we check are not
- * considered constant at compile time. Instead, rely on constant propagation to
- * inline out the calls to this invalid function, which will cause linker errors
- * if references remain at link time.
- */
-#define LINKER_BUG_ON(x) do { if (x) __xsm_action_mismatch_detected(); } while (0)
-
-#if defined(CONFIG_COVERAGE) && defined(__clang__)
-/*
- * LLVM coverage support seems to disable some of the optimizations needed in
- * order for XSM to compile. Since coverage should not be used in production
- * provide an implementation of __xsm_action_mismatch_detected to satisfy the
- * linker.
- */
-static inline void __xsm_action_mismatch_detected(void)
-{
-    ASSERT_UNREACHABLE();
-}
-#else
-/* DO NOT implement this function; it is supposed to trigger link errors */
-void __xsm_action_mismatch_detected(void);
-#endif
-
-#ifdef CONFIG_XSM_CONFIGURABLE
-
-/*
- * In CONFIG_XSM_CONFIGURABLE builds, this header file is included from
- * xsm/dummy.c, and contains static (not inline) functions compiled to the
- * dummy XSM module.  There is no xsm_default_t argument available, so the
- * value from the assertion is used to initialize the variable.
- */
-#define XSM_INLINE __maybe_unused
-
-#define XSM_DEFAULT_ARG /* */
-#define XSM_DEFAULT_VOID void
-#define XSM_ASSERT_ACTION(def) xsm_default_t action = def; (void)action
-
-#else /* CONFIG_XSM_CONFIGURABLE */
-
-/*
- * In !CONFIG_XSM_CONFIGURABLE builds, this header file is included from
- * xsm/xsm.h, and contains inline functions for each XSM hook. These functions
- * also perform compile-time checks on the xsm_default_t argument to ensure
- * that the behavior of the dummy XSM module is the same as the behavior with
- * XSM disabled.
- */
-#define XSM_INLINE always_inline
-#define XSM_DEFAULT_ARG xsm_default_t action,
-#define XSM_DEFAULT_VOID xsm_default_t action
-#define XSM_ASSERT_ACTION(def) LINKER_BUG_ON(def != action)
-
-#endif /* CONFIG_XSM_CONFIGURABLE */
-
-static always_inline int xsm_default_action(
-	xsm_default_t action, struct domain *src, struct domain *target)
-{
-    switch ( action ) {
-    case XSM_HOOK:
-        return 0;
-    case XSM_TARGET:
-        if ( evaluate_nospec(src == target) )
-        {
-            return 0;
-    case XSM_XS_PRIV:
-            if ( evaluate_nospec(is_xenstore_domain(src)) )
-                return 0;
-        }
-        /* fall through */
-    case XSM_DM_PRIV:
-        if ( target && evaluate_nospec(src->target == target) )
-            return 0;
-        /* fall through */
-    case XSM_PRIV:
-        if ( is_control_domain(src) )
-            return 0;
-        return -EPERM;
-    default:
-        LINKER_BUG_ON(1);
-        return -EPERM;
-    }
-}
-
-static XSM_INLINE void xsm_security_domaininfo(
-	struct domain *d, struct xen_domctl_getdomaininfo *info)
-{
-    return;
-}
-
-static XSM_INLINE int xsm_domain_create(
-	XSM_DEFAULT_ARG struct domain *d, uint32_t ssidref)
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
-static XSM_INLINE int xsm_domctl_scheduler_op(
-	XSM_DEFAULT_ARG struct domain *d, int cmd)
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
-static XSM_INLINE int xsm_set_target(
-	XSM_DEFAULT_ARG struct domain *d, struct domain *e)
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
-static XSM_INLINE int xsm_grant_mapref(
-	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2, uint32_t flags)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_grant_unmapref(
-	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_grant_setup(
-	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_grant_transfer(
-	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_grant_copy(
-	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_grant_query_size(
-	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
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
-static XSM_INLINE int xsm_memory_adjust_reservation(
-	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_memory_stat_reservation(
-	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
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
-static XSM_INLINE int xsm_schedop_shutdown(
-	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_DM_PRIV);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_memory_pin_page(
-	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2,
-    struct page_info *page)
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
-static XSM_INLINE int xsm_evtchn_unbound(
-	XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn, domid_t id2)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_evtchn_interdomain(
-	XSM_DEFAULT_ARG struct domain *d1, struct evtchn *chan1, struct domain *d2,
-    struct evtchn *chan2)
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
-static XSM_INLINE int xsm_evtchn_send(
-	XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, d, NULL);
-}
-
-static XSM_INLINE int xsm_evtchn_status(
-	XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_evtchn_reset(
-	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_alloc_security_evtchns(
-	struct evtchn chn[], unsigned int nr)
-{
-    return 0;
-}
-
-static XSM_INLINE void xsm_free_security_evtchns(
-	struct evtchn chn[], unsigned int nr)
-{
-    return;
-}
-
-static XSM_INLINE char *xsm_show_security_evtchn(
-	struct domain *d, const struct evtchn *chn)
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
-static XSM_INLINE int xsm_assign_device(
-	XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_deassign_device(
-	XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-#endif /* HAS_PASSTHROUGH && HAS_PCI */
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
-static XSM_INLINE int xsm_assign_dtdevice(
-	XSM_DEFAULT_ARG struct domain *d, const char *dtpath)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_deassign_dtdevice(
-	XSM_DEFAULT_ARG struct domain *d, const char *dtpath)
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
-static XSM_INLINE int xsm_resource_plug_pci(
-	XSM_DEFAULT_ARG uint32_t machine_bdf)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE int xsm_resource_unplug_pci(
-	XSM_DEFAULT_ARG uint32_t machine_bdf)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
-}
-
-static XSM_INLINE int xsm_resource_setup_pci(
-	XSM_DEFAULT_ARG uint32_t machine_bdf)
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
-static XSM_INLINE long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
-{
-    return -ENOSYS;
-}
-
-#ifdef CONFIG_COMPAT
-static XSM_INLINE int xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) op)
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
-static XSM_INLINE int xsm_map_domain_irq(
-	XSM_DEFAULT_ARG struct domain *d, int irq, const void *data)
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
-static XSM_INLINE int xsm_bind_pt_irq(
-	XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_unbind_pt_irq(
-	XSM_DEFAULT_ARG struct domain *d, struct xen_domctl_bind_pt_irq *bind)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_unmap_domain_irq(
-	XSM_DEFAULT_ARG struct domain *d, int irq, const void *data)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_irq_permission(
-	XSM_DEFAULT_ARG struct domain *d, int pirq, uint8_t allow)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_iomem_permission(
-	XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_iomem_mapping(
-	XSM_DEFAULT_ARG struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_pci_config_permission(
-	XSM_DEFAULT_ARG struct domain *d, uint32_t machine_bdf, uint16_t start,
-    uint16_t end, uint8_t access)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_add_to_physmap(
-	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_remove_from_physmap(
-	XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d1, d2);
-}
-
-static XSM_INLINE int xsm_map_gmfn_foreign(
-	XSM_DEFAULT_ARG struct domain *d, struct domain *t)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d, t);
-}
-
-static XSM_INLINE int xsm_hvm_param(
-	XSM_DEFAULT_ARG struct domain *d, unsigned long op)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_hvm_control(
-	XSM_DEFAULT_ARG struct domain *d, unsigned long op)
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
-static XSM_INLINE int xsm_hvm_altp2mhvm_op(
-	XSM_DEFAULT_ARG struct domain *d, uint64_t mode, uint32_t op)
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
-static XSM_INLINE int xsm_vm_event_control(
-	XSM_DEFAULT_ARG struct domain *d, int mode, int op)
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
-static XSM_INLINE int xsm_shadow_control(
-	XSM_DEFAULT_ARG struct domain *d, uint32_t op)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_mem_sharing_op(
-	XSM_DEFAULT_ARG struct domain *d, struct domain *cd, int op)
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
-static XSM_INLINE int xsm_mmu_update(
-	XSM_DEFAULT_ARG struct domain *d, struct domain *t, struct domain *f,
-    uint32_t flags)
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
-static XSM_INLINE int xsm_mmuext_op(
-	XSM_DEFAULT_ARG struct domain *d, struct domain *f)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d, f);
-}
-
-static XSM_INLINE int xsm_update_va_mapping(
-	XSM_DEFAULT_ARG struct domain *d, struct domain *f, l1_pgentry_t pte)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d, f);
-}
-
-static XSM_INLINE int xsm_priv_mapping(
-	XSM_DEFAULT_ARG struct domain *d, struct domain *t)
-{
-    XSM_ASSERT_ACTION(XSM_TARGET);
-    return xsm_default_action(action, d, t);
-}
-
-static XSM_INLINE int xsm_ioport_permission(
-	XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_ioport_mapping(
-	XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
-{
-    XSM_ASSERT_ACTION(XSM_HOOK);
-    return xsm_default_action(action, current->domain, d);
-}
-
-static XSM_INLINE int xsm_pmu_op(
-	XSM_DEFAULT_ARG struct domain *d, unsigned int op)
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
-static XSM_INLINE int xsm_argo_register_single_source(
-	const struct domain *d, const struct domain *t)
-{
-    return 0;
-}
-
-static XSM_INLINE int xsm_argo_register_any_source(const struct domain *d)
-{
-    return 0;
-}
-
-static XSM_INLINE int xsm_argo_send(
-	const struct domain *d, const struct domain *t)
-{
-    return 0;
-}
-
-#endif /* CONFIG_ARGO */
-
-#include <public/version.h>
-static XSM_INLINE int xsm_xen_version(XSM_DEFAULT_ARG uint32_t op)
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
index 1bf41bfd0d..45d92314fe 100644
--- a/xen/include/xsm/xsm-core.h
+++ b/xen/include/xsm/xsm-core.h
@@ -18,6 +18,31 @@
 #include <xen/sched.h>
 #include <xen/multiboot.h>
 
+/* Cannot use BUILD_BUG_ON here because the expressions we check are not
+ * considered constant at compile time. Instead, rely on constant propagation to
+ * inline out the calls to this invalid function, which will cause linker errors
+ * if references remain at link time.
+ */
+#define XSM_LINKER_BUG_ON(x) do { if (x) __xsm_action_mismatch_detected(); } while (0)
+
+#if defined(CONFIG_COVERAGE) && defined(__clang__)
+/*
+ * LLVM coverage support seems to disable some of the optimizations needed in
+ * order for XSM to compile. Since coverage should not be used in production
+ * provide an implementation of __xsm_action_mismatch_detected to satisfy the
+ * linker.
+ */
+static inline void __xsm_action_mismatch_detected(void)
+{
+    ASSERT_UNREACHABLE();
+}
+#else
+/* DO NOT implement this function; it is supposed to trigger link errors */
+void __xsm_action_mismatch_detected(void);
+#endif
+
+#define XSM_ASSERT_ACTION(def) XSM_LINKER_BUG_ON(def != action)
+
 /* policy magic number */
 typedef uint32_t xsm_magic_t;
 
@@ -199,8 +224,6 @@ struct xsm_ops {
 
 void xsm_fixup_ops(struct xsm_ops *ops);
 
-#ifdef CONFIG_XSM_CONFIGURABLE
-
 #ifdef CONFIG_MULTIBOOT
 int xsm_multiboot_init(
 	unsigned long *module_map, const multiboot_info_t *mbi);
@@ -240,28 +263,4 @@ static const inline struct xsm_ops *silo_init(void)
 }
 #endif
 
-#else /* CONFIG_XSM_CONFIGURABLE */
-
-#ifdef CONFIG_MULTIBOOT
-static inline int xsm_multiboot_init(
-	unsigned long *module_map, const multiboot_info_t *mbi)
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
-#endif /* CONFIG_XSM_CONFIGURABLE */
-
 #endif /* __XSM_CORE_H */
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 1ae11eeaa1..c74e5866f4 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -20,8 +20,6 @@
 #include <xen/multiboot.h>
 #include <xsm/xsm-core.h>
 
-#ifdef CONFIG_XSM_CONFIGURABLE
-
 extern struct xsm_ops xsm_ops;
 
 static inline void xsm_security_domaininfo(
@@ -31,58 +29,68 @@ static inline void xsm_security_domaininfo(
 }
 
 static inline int xsm_domain_create(
-    xsm_default_t def, struct domain *d, uint32_t ssidref)
+    xsm_default_t action, struct domain *d, uint32_t ssidref)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.domain_create, d, ssidref);
 }
 
-static inline int xsm_getdomaininfo(xsm_default_t def, struct domain *d)
+static inline int xsm_getdomaininfo(xsm_default_t action, struct domain *d)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.getdomaininfo, d);
 }
 
 static inline int xsm_domctl_scheduler_op(
-    xsm_default_t def, struct domain *d, int cmd)
+    xsm_default_t action, struct domain *d, int cmd)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.domctl_scheduler_op, d, cmd);
 }
 
-static inline int xsm_sysctl_scheduler_op(xsm_default_t def, int cmd)
+static inline int xsm_sysctl_scheduler_op(xsm_default_t action, int cmd)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.sysctl_scheduler_op, cmd);
 }
 
 static inline int xsm_set_target(
-    xsm_default_t def, struct domain *d, struct domain *e)
+    xsm_default_t action, struct domain *d, struct domain *e)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.set_target, d, e);
 }
 
-static inline int xsm_domctl(xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_domctl(xsm_default_t action, struct domain *d, int cmd)
 {
+    XSM_ASSERT_ACTION(XSM_OTHER);
     return alternative_call(xsm_ops.domctl, d, cmd);
 }
 
-static inline int xsm_sysctl(xsm_default_t def, int cmd)
+static inline int xsm_sysctl(xsm_default_t action, int cmd)
 {
+    XSM_ASSERT_ACTION(XSM_PRIV);
     return alternative_call(xsm_ops.sysctl, cmd);
 }
 
-static inline int xsm_readconsole(xsm_default_t def, uint32_t clear)
+static inline int xsm_readconsole(xsm_default_t action, uint32_t clear)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.readconsole, clear);
 }
 
 static inline int xsm_evtchn_unbound(
-    xsm_default_t def, struct domain *d1, struct evtchn *chn, domid_t id2)
+    xsm_default_t action, struct domain *d1, struct evtchn *chn, domid_t id2)
 {
+    XSM_ASSERT_ACTION(XSM_TARGET);
     return alternative_call(xsm_ops.evtchn_unbound, d1, chn, id2);
 }
 
 static inline int xsm_evtchn_interdomain(
-    xsm_default_t def, struct domain *d1, struct evtchn *chan1,
+    xsm_default_t action, struct domain *d1, struct evtchn *chan1,
     struct domain *d2, struct evtchn *chan2)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.evtchn_interdomain, d1, chan1, d2, chan2);
 }
 
@@ -92,56 +100,65 @@ static inline void xsm_evtchn_close_post(struct evtchn *chn)
 }
 
 static inline int xsm_evtchn_send(
-    xsm_default_t def, struct domain *d, struct evtchn *chn)
+    xsm_default_t action, struct domain *d, struct evtchn *chn)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.evtchn_send, d, chn);
 }
 
 static inline int xsm_evtchn_status(
-    xsm_default_t def, struct domain *d, struct evtchn *chn)
+    xsm_default_t action, struct domain *d, struct evtchn *chn)
 {
+    XSM_ASSERT_ACTION(XSM_TARGET);
     return alternative_call(xsm_ops.evtchn_status, d, chn);
 }
 
 static inline int xsm_evtchn_reset(
-    xsm_default_t def, struct domain *d1, struct domain *d2)
+    xsm_default_t action, struct domain *d1, struct domain *d2)
 {
+    XSM_ASSERT_ACTION(XSM_TARGET);
     return alternative_call(xsm_ops.evtchn_reset, d1, d2);
 }
 
 static inline int xsm_grant_mapref(
-    xsm_default_t def, struct domain *d1, struct domain *d2, uint32_t flags)
+    xsm_default_t action, struct domain *d1, struct domain *d2, uint32_t flags)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.grant_mapref, d1, d2, flags);
 }
 
 static inline int xsm_grant_unmapref(
-    xsm_default_t def, struct domain *d1, struct domain *d2)
+    xsm_default_t action, struct domain *d1, struct domain *d2)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.grant_unmapref, d1, d2);
 }
 
 static inline int xsm_grant_setup(
-    xsm_default_t def, struct domain *d1, struct domain *d2)
+    xsm_default_t action, struct domain *d1, struct domain *d2)
 {
+    XSM_ASSERT_ACTION(XSM_TARGET);
     return alternative_call(xsm_ops.grant_setup, d1, d2);
 }
 
 static inline int xsm_grant_transfer(
-	xsm_default_t def, struct domain *d1, struct domain *d2)
+	xsm_default_t action, struct domain *d1, struct domain *d2)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.grant_transfer, d1, d2);
 }
 
 static inline int xsm_grant_copy(
-	xsm_default_t def, struct domain *d1, struct domain *d2)
+	xsm_default_t action, struct domain *d1, struct domain *d2)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.grant_copy, d1, d2);
 }
 
 static inline int xsm_grant_query_size(
-	xsm_default_t def, struct domain *d1, struct domain *d2)
+	xsm_default_t action, struct domain *d1, struct domain *d2)
 {
+    XSM_ASSERT_ACTION(XSM_TARGET);
     return alternative_call(xsm_ops.grant_query_size, d1, d2);
 }
 
@@ -173,86 +190,103 @@ static inline char *xsm_show_security_evtchn(
     return alternative_call(xsm_ops.show_security_evtchn, d, chn);
 }
 
-static inline int xsm_init_hardware_domain(xsm_default_t def, struct domain *d)
+static inline int xsm_init_hardware_domain(xsm_default_t action,
+                                           struct domain *d)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.init_hardware_domain, d);
 }
 
-static inline int xsm_get_pod_target(xsm_default_t def, struct domain *d)
+static inline int xsm_get_pod_target(xsm_default_t action, struct domain *d)
 {
+    XSM_ASSERT_ACTION(XSM_PRIV);
     return alternative_call(xsm_ops.get_pod_target, d);
 }
 
-static inline int xsm_set_pod_target(xsm_default_t def, struct domain *d)
+static inline int xsm_set_pod_target(xsm_default_t action, struct domain *d)
 {
+    XSM_ASSERT_ACTION(XSM_PRIV);
     return alternative_call(xsm_ops.set_pod_target, d);
 }
 
-static inline int xsm_memory_exchange(xsm_default_t def, struct domain *d)
+static inline int xsm_memory_exchange(xsm_default_t action, struct domain *d)
 {
+    XSM_ASSERT_ACTION(XSM_TARGET);
     return alternative_call(xsm_ops.memory_exchange, d);
 }
 
 static inline int xsm_memory_adjust_reservation(
-	xsm_default_t def, struct domain *d1, struct domain *d2)
+	xsm_default_t action, struct domain *d1, struct domain *d2)
 {
+    XSM_ASSERT_ACTION(XSM_TARGET);
     return alternative_call(xsm_ops.memory_adjust_reservation, d1, d2);
 }
 
 static inline int xsm_memory_stat_reservation(
-	xsm_default_t def, struct domain *d1, struct domain *d2)
+	xsm_default_t action, struct domain *d1, struct domain *d2)
 {
+    XSM_ASSERT_ACTION(XSM_TARGET);
     return alternative_call(xsm_ops.memory_stat_reservation, d1, d2);
 }
 
 static inline int xsm_memory_pin_page(
-	xsm_default_t def, struct domain *d1, struct domain *d2,
+	xsm_default_t action, struct domain *d1, struct domain *d2,
     struct page_info *page)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.memory_pin_page, d1, d2, page);
 }
 
 static inline int xsm_add_to_physmap(
-	xsm_default_t def, struct domain *d1, struct domain *d2)
+	xsm_default_t action, struct domain *d1, struct domain *d2)
 {
+    XSM_ASSERT_ACTION(XSM_TARGET);
     return alternative_call(xsm_ops.add_to_physmap, d1, d2);
 }
 
 static inline int xsm_remove_from_physmap(
-	xsm_default_t def, struct domain *d1, struct domain *d2)
+	xsm_default_t action, struct domain *d1, struct domain *d2)
 {
+    XSM_ASSERT_ACTION(XSM_TARGET);
     return alternative_call(xsm_ops.remove_from_physmap, d1, d2);
 }
 
 static inline int xsm_map_gmfn_foreign(
-	xsm_default_t def, struct domain *d, struct domain *t)
+	xsm_default_t action, struct domain *d, struct domain *t)
 {
+    XSM_ASSERT_ACTION(XSM_TARGET);
     return alternative_call(xsm_ops.map_gmfn_foreign, d, t);
 }
 
-static inline int xsm_claim_pages(xsm_default_t def, struct domain *d)
+static inline int xsm_claim_pages(xsm_default_t action, struct domain *d)
 {
+    XSM_ASSERT_ACTION(XSM_PRIV);
     return alternative_call(xsm_ops.claim_pages, d);
 }
 
-static inline int xsm_console_io(xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_console_io(xsm_default_t action, struct domain *d,
+                                 int cmd)
 {
+    XSM_ASSERT_ACTION(XSM_OTHER);
     return alternative_call(xsm_ops.console_io, d, cmd);
 }
 
-static inline int xsm_profile(xsm_default_t def, struct domain *d, int op)
+static inline int xsm_profile(xsm_default_t action, struct domain *d, int op)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.profile, d, op);
 }
 
-static inline int xsm_kexec(xsm_default_t def)
+static inline int xsm_kexec(xsm_default_t action)
 {
+    XSM_ASSERT_ACTION(XSM_PRIV);
     return alternative_call(xsm_ops.kexec);
 }
 
 static inline int xsm_schedop_shutdown(
-	xsm_default_t def, struct domain *d1, struct domain *d2)
+	xsm_default_t action, struct domain *d1, struct domain *d2)
 {
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return alternative_call(xsm_ops.schedop_shutdown, d1, d2);
 }
 
@@ -261,143 +295,172 @@ static inline char *xsm_show_irq_sid(int irq)
     return alternative_call(xsm_ops.show_irq_sid, irq);
 }
 
-static inline int xsm_map_domain_pirq(xsm_default_t def, struct domain *d)
+static inline int xsm_map_domain_pirq(xsm_default_t action, struct domain *d)
 {
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return alternative_call(xsm_ops.map_domain_pirq, d);
 }
 
 static inline int xsm_map_domain_irq(
-	xsm_default_t def, struct domain *d, int irq, void *data)
+	xsm_default_t action, struct domain *d, int irq, void *data)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.map_domain_irq, d, irq, data);
 }
 
-static inline int xsm_unmap_domain_pirq(xsm_default_t def, struct domain *d)
+static inline int xsm_unmap_domain_pirq(xsm_default_t action, struct domain *d)
 {
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return alternative_call(xsm_ops.unmap_domain_pirq, d);
 }
 
 static inline int xsm_unmap_domain_irq(
-	xsm_default_t def, struct domain *d, int irq, void *data)
+	xsm_default_t action, struct domain *d, int irq, void *data)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.unmap_domain_irq, d, irq, data);
 }
 
 static inline int xsm_bind_pt_irq(
-	xsm_default_t def, struct domain *d, struct xen_domctl_bind_pt_irq *bind)
+	xsm_default_t action, struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.bind_pt_irq, d, bind);
 }
 
 static inline int xsm_unbind_pt_irq(
-	xsm_default_t def, struct domain *d, struct xen_domctl_bind_pt_irq *bind)
+	xsm_default_t action, struct domain *d, struct xen_domctl_bind_pt_irq *bind)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.unbind_pt_irq, d, bind);
 }
 
 static inline int xsm_irq_permission(
-	xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
+	xsm_default_t action, struct domain *d, int pirq, uint8_t allow)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.irq_permission, d, pirq, allow);
 }
 
 static inline int xsm_iomem_permission(
-	xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+	xsm_default_t action, struct domain *d, uint64_t s, uint64_t e,
+    uint8_t allow)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.iomem_permission, d, s, e, allow);
 }
 
 static inline int xsm_iomem_mapping(
-	xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+	xsm_default_t action, struct domain *d, uint64_t s, uint64_t e,
+    uint8_t allow)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.iomem_mapping, d, s, e, allow);
 }
 
 static inline int xsm_pci_config_permission(
-	xsm_default_t def, struct domain *d, uint32_t machine_bdf, uint16_t start,
-    uint16_t end, uint8_t access)
+	xsm_default_t action, struct domain *d, uint32_t machine_bdf,
+    uint16_t start, uint16_t end, uint8_t access)
 {
-    return alternative_call(xsm_ops.pci_config_permission, d, machine_bdf, start, end, access);
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return alternative_call(xsm_ops.pci_config_permission, d, machine_bdf,
+                            start, end, access);
 }
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-static inline int xsm_get_device_group(xsm_default_t def, uint32_t machine_bdf)
+static inline int xsm_get_device_group(xsm_default_t action,
+                                       uint32_t machine_bdf)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.get_device_group, machine_bdf);
 }
 
 static inline int xsm_assign_device(
-	xsm_default_t def, struct domain *d, uint32_t machine_bdf)
+	xsm_default_t action, struct domain *d, uint32_t machine_bdf)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.assign_device, d, machine_bdf);
 }
 
 static inline int xsm_deassign_device(
-	xsm_default_t def, struct domain *d, uint32_t machine_bdf)
+	xsm_default_t action, struct domain *d, uint32_t machine_bdf)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.deassign_device, d, machine_bdf);
 }
 #endif /* HAS_PASSTHROUGH && HAS_PCI) */
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
 static inline int xsm_assign_dtdevice(
-	xsm_default_t def, struct domain *d, const char *dtpath)
+	xsm_default_t action, struct domain *d, const char *dtpath)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.assign_dtdevice, d, dtpath);
 }
 
 static inline int xsm_deassign_dtdevice(
-	xsm_default_t def, struct domain *d, const char *dtpath)
+	xsm_default_t action, struct domain *d, const char *dtpath)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.deassign_dtdevice, d, dtpath);
 }
 
 #endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
 
-static inline int xsm_resource_plug_pci(xsm_default_t def, uint32_t machine_bdf)
+static inline int xsm_resource_plug_pci(xsm_default_t action,
+                                        uint32_t machine_bdf)
 {
+    XSM_ASSERT_ACTION(XSM_PRIV);
     return alternative_call(xsm_ops.resource_plug_pci, machine_bdf);
 }
 
 static inline int xsm_resource_unplug_pci(
-	xsm_default_t def, uint32_t machine_bdf)
+	xsm_default_t action, uint32_t machine_bdf)
 {
+    XSM_ASSERT_ACTION(XSM_PRIV);
     return alternative_call(xsm_ops.resource_unplug_pci, machine_bdf);
 }
 
-static inline int xsm_resource_plug_core(xsm_default_t def)
+static inline int xsm_resource_plug_core(xsm_default_t action)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.resource_plug_core);
 }
 
-static inline int xsm_resource_unplug_core(xsm_default_t def)
+static inline int xsm_resource_unplug_core(xsm_default_t action)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.resource_unplug_core);
 }
 
 static inline int xsm_resource_setup_pci(
-	xsm_default_t def, uint32_t machine_bdf)
+	xsm_default_t action, uint32_t machine_bdf)
 {
+    XSM_ASSERT_ACTION(XSM_PRIV);
     return alternative_call(xsm_ops.resource_setup_pci, machine_bdf);
 }
 
-static inline int xsm_resource_setup_gsi(xsm_default_t def, int gsi)
+static inline int xsm_resource_setup_gsi(xsm_default_t action, int gsi)
 {
+    XSM_ASSERT_ACTION(XSM_PRIV);
     return alternative_call(xsm_ops.resource_setup_gsi, gsi);
 }
 
-static inline int xsm_resource_setup_misc(xsm_default_t def)
+static inline int xsm_resource_setup_misc(xsm_default_t action)
 {
+    XSM_ASSERT_ACTION(XSM_PRIV);
     return alternative_call(xsm_ops.resource_setup_misc);
 }
 
-static inline int xsm_page_offline(xsm_default_t def, uint32_t cmd)
+static inline int xsm_page_offline(xsm_default_t action, uint32_t cmd)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.page_offline, cmd);
 }
 
-static inline int xsm_hypfs_op(xsm_default_t def)
+static inline int xsm_hypfs_op(xsm_default_t action)
 {
+    XSM_ASSERT_ACTION(XSM_PRIV);
     return alternative_call(xsm_ops.hypfs_op);
 }
 
@@ -414,155 +477,185 @@ static inline int xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) op)
 #endif
 
 static inline int xsm_hvm_param(
-	xsm_default_t def, struct domain *d, unsigned long op)
+	xsm_default_t action, struct domain *d, unsigned long op)
 {
+    XSM_ASSERT_ACTION(XSM_TARGET);
     return alternative_call(xsm_ops.hvm_param, d, op);
 }
 
 static inline int xsm_hvm_control(
-	xsm_default_t def, struct domain *d, unsigned long op)
+	xsm_default_t action, struct domain *d, unsigned long op)
 {
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return alternative_call(xsm_ops.hvm_control, d, op);
 }
 
-static inline int xsm_hvm_param_altp2mhvm(xsm_default_t def, struct domain *d)
+static inline int xsm_hvm_param_altp2mhvm(xsm_default_t action,
+                                          struct domain *d)
 {
+    XSM_ASSERT_ACTION(XSM_PRIV);
     return alternative_call(xsm_ops.hvm_param_altp2mhvm, d);
 }
 
 static inline int xsm_hvm_altp2mhvm_op(
-	xsm_default_t def, struct domain *d, uint64_t mode, uint32_t op)
+	xsm_default_t action, struct domain *d, uint64_t mode, uint32_t op)
 {
+    XSM_ASSERT_ACTION(XSM_OTHER);
     return alternative_call(xsm_ops.hvm_altp2mhvm_op, d, mode, op);
 }
 
-static inline int xsm_get_vnumainfo(xsm_default_t def, struct domain *d)
+static inline int xsm_get_vnumainfo(xsm_default_t action, struct domain *d)
 {
+    XSM_ASSERT_ACTION(XSM_TARGET);
     return alternative_call(xsm_ops.get_vnumainfo, d);
 }
 
 static inline int xsm_vm_event_control(
-	xsm_default_t def, struct domain *d, int mode, int op)
+	xsm_default_t action, struct domain *d, int mode, int op)
 {
+    XSM_ASSERT_ACTION(XSM_PRIV);
     return alternative_call(xsm_ops.vm_event_control, d, mode, op);
 }
 
 #ifdef CONFIG_MEM_ACCESS
-static inline int xsm_mem_access(xsm_default_t def, struct domain *d)
+static inline int xsm_mem_access(xsm_default_t action, struct domain *d)
 {
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return alternative_call(xsm_ops.mem_access, d);
 }
 #endif
 
 #ifdef CONFIG_MEM_PAGING
-static inline int xsm_mem_paging(xsm_default_t def, struct domain *d)
+static inline int xsm_mem_paging(xsm_default_t action, struct domain *d)
 {
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return alternative_call(xsm_ops.mem_paging, d);
 }
 #endif
 
 #ifdef CONFIG_MEM_SHARING
-static inline int xsm_mem_sharing(xsm_default_t def, struct domain *d)
+static inline int xsm_mem_sharing(xsm_default_t action, struct domain *d)
 {
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return alternative_call(xsm_ops.mem_sharing, d);
 }
 #endif
 
-static inline int xsm_platform_op(xsm_default_t def, uint32_t op)
+static inline int xsm_platform_op(xsm_default_t action, uint32_t op)
 {
+    XSM_ASSERT_ACTION(XSM_PRIV);
     return alternative_call(xsm_ops.platform_op, op);
 }
 
 #ifdef CONFIG_X86
-static inline int xsm_do_mca(xsm_default_t def)
+static inline int xsm_do_mca(xsm_default_t action)
 {
+    XSM_ASSERT_ACTION(XSM_PRIV);
     return alternative_call(xsm_ops.do_mca);
 }
 
 static inline int xsm_shadow_control(
-	xsm_default_t def, struct domain *d, uint32_t op)
+	xsm_default_t action, struct domain *d, uint32_t op)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.shadow_control, d, op);
 }
 
 static inline int xsm_mem_sharing_op(
-	xsm_default_t def, struct domain *d, struct domain *cd, int op)
+	xsm_default_t action, struct domain *d, struct domain *cd, int op)
 {
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return alternative_call(xsm_ops.mem_sharing_op, d, cd, op);
 }
 
-static inline int xsm_apic(xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_apic(xsm_default_t action, struct domain *d, int cmd)
 {
+    XSM_ASSERT_ACTION(XSM_PRIV);
     return alternative_call(xsm_ops.apic, d, cmd);
 }
 
-static inline int xsm_machine_memory_map(xsm_default_t def)
+static inline int xsm_machine_memory_map(xsm_default_t action)
 {
+    XSM_ASSERT_ACTION(XSM_PRIV);
     return alternative_call(xsm_ops.machine_memory_map);
 }
 
-static inline int xsm_domain_memory_map(xsm_default_t def, struct domain *d)
+static inline int xsm_domain_memory_map(xsm_default_t action, struct domain *d)
 {
+    XSM_ASSERT_ACTION(XSM_TARGET);
     return alternative_call(xsm_ops.domain_memory_map, d);
 }
 
 static inline int xsm_mmu_update(
-	xsm_default_t def, struct domain *d, struct domain *t, struct domain *f,
+	xsm_default_t action, struct domain *d, struct domain *t, struct domain *f,
     uint32_t flags)
 {
+    XSM_ASSERT_ACTION(XSM_TARGET);
     return alternative_call(xsm_ops.mmu_update, d, t, f, flags);
 }
 
 static inline int xsm_mmuext_op(
-	xsm_default_t def, struct domain *d, struct domain *f)
+	xsm_default_t action, struct domain *d, struct domain *f)
 {
+    XSM_ASSERT_ACTION(XSM_TARGET);
     return alternative_call(xsm_ops.mmuext_op, d, f);
 }
 
 static inline int xsm_update_va_mapping(
-	xsm_default_t def, struct domain *d, struct domain *f, l1_pgentry_t pte)
+	xsm_default_t action, struct domain *d, struct domain *f, l1_pgentry_t pte)
 {
+    XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_ops.update_va_mapping(d, f, pte);
 }
 
 static inline int xsm_priv_mapping(
-	xsm_default_t def, struct domain *d, struct domain *t)
+	xsm_default_t action, struct domain *d, struct domain *t)
 {
+    XSM_ASSERT_ACTION(XSM_TARGET);
     return alternative_call(xsm_ops.priv_mapping, d, t);
 }
 
 static inline int xsm_ioport_permission(
-	xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+	xsm_default_t action, struct domain *d, uint32_t s, uint32_t e,
+    uint8_t allow)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.ioport_permission, d, s, e, allow);
 }
 
 static inline int xsm_ioport_mapping(
-	xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+	xsm_default_t action, struct domain *d, uint32_t s, uint32_t e,
+    uint8_t allow)
 {
+    XSM_ASSERT_ACTION(XSM_HOOK);
     return alternative_call(xsm_ops.ioport_mapping, d, s, e, allow);
 }
 
 static inline int xsm_pmu_op(
-	xsm_default_t def, struct domain *d, unsigned int op)
+	xsm_default_t action, struct domain *d, unsigned int op)
 {
+    XSM_ASSERT_ACTION(XSM_OTHER);
     return alternative_call(xsm_ops.pmu_op, d, op);
 }
 
 #endif /* CONFIG_X86 */
 
-static inline int xsm_dm_op(xsm_default_t def, struct domain *d)
+static inline int xsm_dm_op(xsm_default_t action, struct domain *d)
 {
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return alternative_call(xsm_ops.dm_op, d);
 }
 
-static inline int xsm_xen_version(xsm_default_t def, uint32_t op)
+static inline int xsm_xen_version(xsm_default_t action, uint32_t op)
 {
+    XSM_ASSERT_ACTION(XSM_OTHER);
     return alternative_call(xsm_ops.xen_version, op);
 }
 
-static inline int xsm_domain_resource_map(xsm_default_t def, struct domain *d)
+static inline int xsm_domain_resource_map(xsm_default_t action,
+                                          struct domain *d)
 {
+    XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return alternative_call(xsm_ops.domain_resource_map, d);
 }
 
@@ -590,10 +683,4 @@ static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 
 #endif /* CONFIG_ARGO */
 
-#else /* CONFIG_XSM_CONFIGURABLE */
-
-#include <xsm/dummy.h>
-
-#endif /* CONFIG_XSM_CONFIGURABLE */
-
 #endif /* __XSM_H */
diff --git a/xen/xsm/Makefile b/xen/xsm/Makefile
index 09b9311b1d..121a0eda7d 100644
--- a/xen/xsm/Makefile
+++ b/xen/xsm/Makefile
@@ -1,6 +1,6 @@
 obj-y += xsm_core.o
+obj-y += dummy.o
 obj-$(CONFIG_XSM_CONFIGURABLE) += xsm_policy.o
-obj-$(CONFIG_XSM_CONFIGURABLE) += dummy.o
 obj-$(CONFIG_XSM_SILO) += silo.o
 
 obj-$(CONFIG_XSM_FLASK) += flask/
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index b848580eaa..e18afe0673 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -10,7 +10,7 @@
  *  as published by the Free Software Foundation.
  */
 
-#include <xsm/dummy.h>
+#include "dummy.h"
 
 #define set_to_dummy_if_null(ops, function)                            \
     do {                                                               \
diff --git a/xen/xsm/dummy.h b/xen/xsm/dummy.h
new file mode 100644
index 0000000000..b716bf7371
--- /dev/null
+++ b/xen/xsm/dummy.h
@@ -0,0 +1,659 @@
+/*
+ *  Default XSM hooks - IS_PRIV and IS_PRIV_FOR checks
+ *
+ *  Author: Daniel De Graaf <dgdegra@tyhco.nsa.gov>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2,
+ *  as published by the Free Software Foundation.
+ *
+ *
+ *  Dummy XSM hooks implementing the default access check. Each hook should
+ *  have as its first line XSM_DEFAULT_ACTION declaring the privilege level
+ *  required for this access.
+ */
+
+#ifndef __XSM_DUMMY_H__
+#define __XSM_DUMMY_H__
+
+#include <xen/sched.h>
+#include <xsm/xsm-core.h>
+#include <public/hvm/params.h>
+
+#define XSM_DEFAULT_ACTION(def) xsm_default_t action = def; (void)action
+
+static always_inline int xsm_default_action(
+    xsm_default_t action, struct domain *src, struct domain *target)
+{
+    switch ( action )
+    {
+    case XSM_HOOK:
+        return 0;
+    case XSM_TARGET:
+        if ( evaluate_nospec(src == target) )
+        {
+            return 0;
+    case XSM_XS_PRIV:
+            if ( evaluate_nospec(is_xenstore_domain(src)) )
+                return 0;
+        }
+        /* fall through */
+    case XSM_DM_PRIV:
+        if ( target && evaluate_nospec(src->target == target) )
+            return 0;
+        /* fall through */
+    case XSM_PRIV:
+        if ( is_control_domain(src) )
+            return 0;
+        return -EPERM;
+    default:
+        XSM_LINKER_BUG_ON(1);
+        return -EPERM;
+    }
+}
+
+static inline void xsm_security_domaininfo(
+	struct domain *d, struct xen_domctl_getdomaininfo *info)
+{
+    return;
+}
+
+static inline int xsm_domain_create(struct domain *d, uint32_t ssidref)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+static inline int xsm_getdomaininfo(struct domain *d)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+static inline int xsm_domctl_scheduler_op(struct domain *d, int cmd)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+static inline int xsm_sysctl_scheduler_op(int cmd)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
+}
+
+static inline int xsm_set_target(struct domain *d, struct domain *e)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
+}
+
+static inline int xsm_domctl(struct domain *d, int cmd)
+{
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
+}
+
+static inline int xsm_sysctl(int cmd)
+{
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
+}
+
+static inline int xsm_readconsole(uint32_t clear)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
+}
+
+static inline int xsm_alloc_security_domain(struct domain *d)
+{
+    return 0;
+}
+
+static inline void xsm_free_security_domain(struct domain *d)
+{
+    return;
+}
+
+static inline int xsm_grant_mapref(
+	struct domain *d1, struct domain *d2, uint32_t flags)
+{
+    return xsm_default_action(XSM_HOOK, d1, d2);
+}
+
+static inline int xsm_grant_unmapref(struct domain *d1, struct domain *d2)
+{
+    return xsm_default_action(XSM_HOOK, d1, d2);
+}
+
+static inline int xsm_grant_setup(struct domain *d1, struct domain *d2)
+{
+    return xsm_default_action(XSM_TARGET, d1, d2);
+}
+
+static inline int xsm_grant_transfer(struct domain *d1, struct domain *d2)
+{
+    return xsm_default_action(XSM_HOOK, d1, d2);
+}
+
+static inline int xsm_grant_copy(struct domain *d1, struct domain *d2)
+{
+    return xsm_default_action(XSM_HOOK, d1, d2);
+}
+
+static inline int xsm_grant_query_size(struct domain *d1, struct domain *d2)
+{
+    return xsm_default_action(XSM_TARGET, d1, d2);
+}
+
+static inline int xsm_memory_exchange(struct domain *d)
+{
+    return xsm_default_action(XSM_TARGET, current->domain, d);
+}
+
+static inline int xsm_memory_adjust_reservation(
+	struct domain *d1, struct domain *d2)
+{
+    return xsm_default_action(XSM_TARGET, d1, d2);
+}
+
+static inline int xsm_memory_stat_reservation(
+	struct domain *d1, struct domain *d2)
+{
+    return xsm_default_action(XSM_TARGET, d1, d2);
+}
+
+static inline int xsm_console_io(struct domain *d, int cmd)
+{
+    if ( d->is_console )
+        return xsm_default_action(XSM_HOOK, d, NULL);
+#ifdef CONFIG_VERBOSE_DEBUG
+    if ( cmd == CONSOLEIO_write )
+        return xsm_default_action(XSM_HOOK, d, NULL);
+#endif
+    return xsm_default_action(XSM_PRIV, d, NULL);
+}
+
+static inline int xsm_profile(struct domain *d, int op)
+{
+    return xsm_default_action(XSM_HOOK, d, NULL);
+}
+
+static inline int xsm_kexec(void)
+{
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
+}
+
+static inline int xsm_schedop_shutdown(struct domain *d1, struct domain *d2)
+{
+    return xsm_default_action(XSM_DM_PRIV, d1, d2);
+}
+
+static inline int xsm_memory_pin_page(
+	struct domain *d1, struct domain *d2, struct page_info *page)
+{
+    return xsm_default_action(XSM_HOOK, d1, d2);
+}
+
+static inline int xsm_claim_pages(struct domain *d)
+{
+    return xsm_default_action(XSM_PRIV, current->domain, d);
+}
+
+static inline int xsm_evtchn_unbound(
+	struct domain *d, struct evtchn *chn, domid_t id2)
+{
+    return xsm_default_action(XSM_TARGET, current->domain, d);
+}
+
+static inline int xsm_evtchn_interdomain(
+	struct domain *d1, struct evtchn *chan1, struct domain *d2,
+    struct evtchn *chan2)
+{
+    return xsm_default_action(XSM_HOOK, d1, d2);
+}
+
+static inline void xsm_evtchn_close_post(struct evtchn *chn)
+{
+    return;
+}
+
+static inline int xsm_evtchn_send(struct domain *d, struct evtchn *chn)
+{
+    return xsm_default_action(XSM_HOOK, d, NULL);
+}
+
+static inline int xsm_evtchn_status(struct domain *d, struct evtchn *chn)
+{
+    return xsm_default_action(XSM_TARGET, current->domain, d);
+}
+
+static inline int xsm_evtchn_reset(struct domain *d1, struct domain *d2)
+{
+    return xsm_default_action(XSM_TARGET, d1, d2);
+}
+
+static inline int xsm_alloc_security_evtchns(
+	struct evtchn chn[], unsigned int nr)
+{
+    return 0;
+}
+
+static inline void xsm_free_security_evtchns(
+	struct evtchn chn[], unsigned int nr)
+{
+    return;
+}
+
+static inline char *xsm_show_security_evtchn(
+	struct domain *d, const struct evtchn *chn)
+{
+    return NULL;
+}
+
+static inline int xsm_init_hardware_domain(struct domain *d)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+static inline int xsm_get_pod_target(struct domain *d)
+{
+    return xsm_default_action(XSM_PRIV, current->domain, d);
+}
+
+static inline int xsm_set_pod_target(struct domain *d)
+{
+    return xsm_default_action(XSM_PRIV, current->domain, d);
+}
+
+static inline int xsm_get_vnumainfo(struct domain *d)
+{
+    return xsm_default_action(XSM_TARGET, current->domain, d);
+}
+
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+static inline int xsm_get_device_group(uint32_t machine_bdf)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
+}
+
+static inline int xsm_assign_device(struct domain *d, uint32_t machine_bdf)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+static inline int xsm_deassign_device(struct domain *d, uint32_t machine_bdf)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+#endif /* HAS_PASSTHROUGH && HAS_PCI */
+
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
+static inline int xsm_assign_dtdevice(struct domain *d, const char *dtpath)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+static inline int xsm_deassign_dtdevice(struct domain *d, const char *dtpath)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
+
+static inline int xsm_resource_plug_core(void)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
+}
+
+static inline int xsm_resource_unplug_core(void)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
+}
+
+static inline int xsm_resource_plug_pci(uint32_t machine_bdf)
+{
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
+}
+
+static inline int xsm_resource_unplug_pci(uint32_t machine_bdf)
+{
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
+}
+
+static inline int xsm_resource_setup_pci(uint32_t machine_bdf)
+{
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
+}
+
+static inline int xsm_resource_setup_gsi(int gsi)
+{
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
+}
+
+static inline int xsm_resource_setup_misc(void)
+{
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
+}
+
+static inline int xsm_page_offline(uint32_t cmd)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, NULL);
+}
+
+static inline int xsm_hypfs_op(void)
+{
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
+}
+
+static inline long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
+{
+    return -ENOSYS;
+}
+
+#ifdef CONFIG_COMPAT
+static inline int xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) op)
+{
+    return -ENOSYS;
+}
+#endif
+
+static inline char *xsm_show_irq_sid(int irq)
+{
+    return NULL;
+}
+
+static inline int xsm_map_domain_pirq(struct domain *d)
+{
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
+}
+
+static inline int xsm_map_domain_irq(
+	struct domain *d, int irq, const void *data)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+static inline int xsm_unmap_domain_pirq(struct domain *d)
+{
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
+}
+
+static inline int xsm_bind_pt_irq(
+	struct domain *d, struct xen_domctl_bind_pt_irq *bind)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+static inline int xsm_unbind_pt_irq(
+	struct domain *d, struct xen_domctl_bind_pt_irq *bind)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+static inline int xsm_unmap_domain_irq(
+	struct domain *d, int irq, const void *data)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+static inline int xsm_irq_permission(struct domain *d, int pirq, uint8_t allow)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+static inline int xsm_iomem_permission(
+	struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+static inline int xsm_iomem_mapping(
+	struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+static inline int xsm_pci_config_permission(
+	struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end,
+    uint8_t access)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+static inline int xsm_add_to_physmap(struct domain *d1, struct domain *d2)
+{
+    return xsm_default_action(XSM_TARGET, d1, d2);
+}
+
+static inline int xsm_remove_from_physmap(struct domain *d1, struct domain *d2)
+{
+    return xsm_default_action(XSM_TARGET, d1, d2);
+}
+
+static inline int xsm_map_gmfn_foreign(struct domain *d, struct domain *t)
+{
+    return xsm_default_action(XSM_TARGET, d, t);
+}
+
+static inline int xsm_hvm_param(struct domain *d, unsigned long op)
+{
+    return xsm_default_action(XSM_TARGET, current->domain, d);
+}
+
+static inline int xsm_hvm_control(struct domain *d, unsigned long op)
+{
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
+}
+
+static inline int xsm_hvm_param_altp2mhvm(struct domain *d)
+{
+    return xsm_default_action(XSM_PRIV, current->domain, d);
+}
+
+static inline int xsm_hvm_altp2mhvm_op(
+	struct domain *d, uint64_t mode, uint32_t op)
+{
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
+}
+
+static inline int xsm_vm_event_control(struct domain *d, int mode, int op)
+{
+    return xsm_default_action(XSM_PRIV, current->domain, d);
+}
+
+#ifdef CONFIG_MEM_ACCESS
+static inline int xsm_mem_access(struct domain *d)
+{
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
+}
+#endif
+
+#ifdef CONFIG_MEM_PAGING
+static inline int xsm_mem_paging(struct domain *d)
+{
+    XSM_DEFAULT_ACTION(XSM_DM_PRIV);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
+}
+#endif
+
+#ifdef CONFIG_MEM_SHARING
+static inline int xsm_mem_sharing(struct domain *d)
+{
+    XSM_DEFAULT_ACTION(XSM_DM_PRIV);
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
+}
+#endif
+
+static inline int xsm_platform_op(uint32_t op)
+{
+    XSM_DEFAULT_ACTION(XSM_PRIV);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
+}
+
+#ifdef CONFIG_X86
+static inline int xsm_do_mca(void)
+{
+    XSM_DEFAULT_ACTION(XSM_PRIV);
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
+}
+
+static inline int xsm_shadow_control(struct domain *d, uint32_t op)
+{
+    XSM_DEFAULT_ACTION(XSM_HOOK);
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+static inline int xsm_mem_sharing_op(
+	struct domain *d, struct domain *cd, int op)
+{
+    return xsm_default_action(XSM_DM_PRIV, current->domain, cd);
+}
+
+static inline int xsm_apic(struct domain *d, int cmd)
+{
+    return xsm_default_action(XSM_PRIV, d, NULL);
+}
+
+static inline int xsm_machine_memory_map(void)
+{
+    return xsm_default_action(XSM_PRIV, current->domain, NULL);
+}
+
+static inline int xsm_domain_memory_map(struct domain *d)
+{
+    return xsm_default_action(XSM_TARGET, current->domain, d);
+}
+
+static inline int xsm_mmu_update(
+	struct domain *d, struct domain *t, struct domain *f, uint32_t flags)
+{
+    int rc = 0;
+    if ( f != dom_io )
+        rc = xsm_default_action(XSM_TARGET, d, f);
+    if ( evaluate_nospec(t) && !rc )
+        rc = xsm_default_action(XSM_TARGET, d, t);
+    return rc;
+}
+
+static inline int xsm_mmuext_op(struct domain *d, struct domain *f)
+{
+    return xsm_default_action(XSM_TARGET, d, f);
+}
+
+static inline int xsm_update_va_mapping(
+	struct domain *d, struct domain *f, l1_pgentry_t pte)
+{
+    return xsm_default_action(XSM_TARGET, d, f);
+}
+
+static inline int xsm_priv_mapping(struct domain *d, struct domain *t)
+{
+    return xsm_default_action(XSM_TARGET, d, t);
+}
+
+static inline int xsm_ioport_permission(
+	struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+static inline int xsm_ioport_mapping(
+	struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+{
+    return xsm_default_action(XSM_HOOK, current->domain, d);
+}
+
+static inline int xsm_pmu_op(struct domain *d, unsigned int op)
+{
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
+}
+
+#endif /* CONFIG_X86 */
+
+static inline int xsm_dm_op(struct domain *d)
+{
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
+}
+
+#ifdef CONFIG_ARGO
+static inline int xsm_argo_enable(const struct domain *d)
+{
+    return 0;
+}
+
+static inline int xsm_argo_register_single_source(
+	const struct domain *d, const struct domain *t)
+{
+    return 0;
+}
+
+static inline int xsm_argo_register_any_source(const struct domain *d)
+{
+    return 0;
+}
+
+static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
+{
+    return 0;
+}
+
+#endif /* CONFIG_ARGO */
+
+#include <public/version.h>
+static inline int xsm_xen_version(uint32_t op)
+{
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
+}
+
+static inline int xsm_domain_resource_map(struct domain *d)
+{
+    return xsm_default_action(XSM_DM_PRIV, current->domain, d);
+}
+
+#endif /* __XSM_DUMMY_H__ */
diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
index 66a2cb1505..350612971f 100644
--- a/xen/xsm/silo.c
+++ b/xen/xsm/silo.c
@@ -18,7 +18,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 #include <xsm/xsm-core.h>
-#include <xsm/dummy.h>
+#include "dummy.h"
 
 /*
  * Check if inter-domain communication is allowed.
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 446fff6be3..72b9dd1dac 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -18,8 +18,6 @@
 #include <xen/hypercall.h>
 #include <xsm/xsm.h>
 
-#ifdef CONFIG_XSM_CONFIGURABLE
-
 #ifdef CONFIG_MULTIBOOT
 #include <asm/setup.h>
 #endif
@@ -222,8 +220,6 @@ bool __init has_xsm_magic(paddr_t start)
 }
 #endif
 
-#endif /* CONFIG_XSM_CONFIGURABLE */
-
 long do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return xsm_do_xsm_op(op);
-- 
2.20.1


