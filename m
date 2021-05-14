Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B15F1381204
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 22:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127547.239740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhem1-0002nv-71; Fri, 14 May 2021 20:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127547.239740; Fri, 14 May 2021 20:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhem1-0002l7-2x; Fri, 14 May 2021 20:51:05 +0000
Received: by outflank-mailman (input) for mailman id 127547;
 Fri, 14 May 2021 20:51:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2R2=KJ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lhelz-0002i0-MV
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 20:51:03 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce0d206f-6a8f-4b51-b457-e3240df6f070;
 Fri, 14 May 2021 20:51:02 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1621025171671569.192602179863;
 Fri, 14 May 2021 13:46:11 -0700 (PDT)
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
X-Inumbo-ID: ce0d206f-6a8f-4b51-b457-e3240df6f070
ARC-Seal: i=1; a=rsa-sha256; t=1621025172; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WsV8LKMh3OE0XxwkuHnGxZE/mjjJwhRHXx0sf7r0WpsqPh/5jD4+vIOANX2AZEl2pR3nu8u4alXdBsxxj9sXZaDSWPqicVsMCmEmHyNU5MZXEagZ8YZH2pXTFKEM0rbabsDOg5GBxn+YTE7t4A0+FDGGNUkP9RrdLme2Nip859E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1621025172; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=eKFqf1oaQMvGDC3mpSiXKObyKb9uq3sTtie25mvd3t8=; 
	b=D6hk11zEhoA2nUMWH/zPJ+WjRX4OX1vIwmt0xYZJFjBLVqDDnRfjmd7qnlhQSP1dBfiVMMT/25gO3Lj6sf67YbNZ04JAE00XeKH6EXWHmDamP8kFWKoxVutCW3kFDj6KWgYvZ1dWAayipVt/YOwW+kJKSmMEbhM6gmz9ISya2fU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1621025172;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=eKFqf1oaQMvGDC3mpSiXKObyKb9uq3sTtie25mvd3t8=;
	b=B7SxaKsaMJZJHnDwgNrMMx7MrW2MddhBfor12b1YR1s4iRZZDO3ic96Tt7f1r19+
	H87sVQOt72ERh2atfFZ+Mq66N1CrLiDOkOWot5BCvTVI6u+I8SR5qfK7sWRmGoESEWc
	mAk1YcC5Q9sUnbjSUHnYj1GjWBembqNlTiBwcdpk=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	wl@xen.org,
	roger.pau@citrix.com,
	tamas@tklengyel.com,
	tim@xen.org,
	jgross@suse.com,
	aisaila@bitdefender.com,
	ppircalabu@bitdefender.com,
	dfaggioli@suse.com,
	paul@xen.org,
	kevin.tian@intel.com,
	dgdegra@tycho.nsa.gov,
	adam.schwalm@starlab.io,
	scott.davis@starlab.io
Subject: [RFC PATCH 06/10] xsm-roles: covert the dummy system to roles
Date: Fri, 14 May 2021 16:54:33 -0400
Message-Id: <20210514205437.13661-7-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210514205437.13661-1-dpsmith@apertussolutions.com>
References: <20210514205437.13661-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The difference between XSM and non-XSM was whether the "dummy" policy was
invoked via direct calls or through function pointers. The "dummy" policy
enforced a set of rules that effictively defined a loosely set of roles that a
domain may have. This builds on the work of replacing those rules with well
defined roles by moving away from pseudo is or is not XSM and formalizing the
roles checks as the core security framework.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xen/sched.h |   9 -
 xen/include/xsm/roles.h |  70 ++++
 xen/include/xsm/xsm.h   | 689 +++++++++++++++++++++++++++-------------
 xen/xsm/xsm_core.c      |   4 +-
 4 files changed, 544 insertions(+), 228 deletions(-)
 create mode 100644 xen/include/xsm/roles.h

diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 55b7de93d2..d84b047359 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -473,15 +473,6 @@ struct domain
 #define XSM_HW_CTRL   (1U<<8)  /* Hardware Control: domain with physical hardware access and its allocation for domain usage */
 #define XSM_HW_SUPER  (1U<<9)  /* Hardware Supervisor: domain that control allocated physical hardware */
 #define XSM_XENSTORE  (1U<<31) /* Xenstore: domain that can do privileged operations on xenstore */
-#define CLASSIC_DOM0_PRIVS (XSM_PLAT_CTRL | XSM_DOM_BUILD | XSM_DOM_SUPER | \
-		XSM_DEV_EMUL | XSM_HW_CTRL | XSM_HW_SUPER | XSM_XENSTORE)
-#define CLASSIC_HWDOM_PRIVS (XSM_HW_CTRL | XSM_DEV_EMUL)
-/* Any access for which XSM_DEV_EMUL is the restriction, XSM_DOM_SUPER is an override */
-#define DEV_EMU_PRIVS (XSM_DOM_SUPER | XSM_DEV_EMUL)
-/* Anytime there is an XSM_TARGET check, XSM_SELF also applies, and XSM_DOM_SUPER is an override */
-#define TARGET_PRIVS (XSM_TARGET | XSM_SELF | XSM_DOM_SUPER)
-/* Anytime there is an XSM_XENSTORE check, XSM_DOM_SUPER is an override */
-#define XENSTORE_PRIVS (XSM_XENSTORE | XSM_DOM_SUPER)
     uint32_t         xsm_roles;
 
     /* Which guest this guest has privileges on */
diff --git a/xen/include/xsm/roles.h b/xen/include/xsm/roles.h
new file mode 100644
index 0000000000..e6989fffa6
--- /dev/null
+++ b/xen/include/xsm/roles.h
@@ -0,0 +1,70 @@
+/*
+ *  This file contains the XSM roles.
+ *
+ *  This work is based on the original XSM dummy policy.
+ *
+ *  Author:  Daniel P. Smith, <dpsmith@apertussolutions.com>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2,
+ *  as published by the Free Software Foundation.
+ */
+
+#ifndef __XSM_ROLES_H__
+#define __XSM_ROLES_H__
+
+#include <xen/sched.h>
+
+#define CLASSIC_DOM0_PRIVS (XSM_PLAT_CTRL | XSM_DOM_BUILD | XSM_DOM_SUPER | \
+		XSM_DEV_EMUL | XSM_HW_CTRL | XSM_HW_SUPER | XSM_XENSTORE)
+
+#define CLASSIC_HWDOM_PRIVS (XSM_HW_CTRL | XSM_DEV_EMUL)
+
+/* Any access for which XSM_DEV_EMUL is the restriction, XSM_DOM_SUPER is an override */
+#define DEV_EMU_PRIVS (XSM_DOM_SUPER | XSM_DEV_EMUL)
+
+/* Anytime there is an XSM_TARGET check, XSM_SELF also applies, and XSM_DOM_SUPER is an override */
+#define TARGET_PRIVS (XSM_TARGET | XSM_SELF | XSM_DOM_SUPER)
+
+/* Anytime there is an XSM_XENSTORE check, XSM_DOM_SUPER is an override */
+#define XENSTORE_PRIVS (XSM_XENSTORE | XSM_DOM_SUPER)
+
+typedef uint32_t xsm_role_t;
+
+static always_inline int xsm_validate_role(
+    xsm_role_t allowed, struct domain *src, struct domain *target)
+{
+    if ( allowed & XSM_NONE )
+        return 0;
+
+    if ( (allowed & XSM_SELF) && ((!target) || (src == target)) )
+        return 0;
+
+    if ( (allowed & XSM_TARGET) && ((target) && (src->target == target)) )
+        return 0;
+
+    /* XSM_DEV_EMUL is the only domain role with a condition, i.e. the
+     * role only applies to a domain's target.
+     */
+    if ( (allowed & XSM_DEV_EMUL) && (src->xsm_roles & XSM_DEV_EMUL)
+        && (target) && (src->target == target) )
+        return 0;
+
+    /* Mask out SELF, TARGET, and DEV_EMUL as they have been handled */
+    allowed &= ~(XSM_SELF | XSM_TARGET | XSM_DEV_EMUL);
+
+    /* Checks if the domain has one of the remaining roles set on it:
+     *      XSM_PLAT_CTRL
+     *      XSM_DOM_BUILD
+     *      XSM_DOM_SUPER
+     *      XSM_HW_CTRL
+     *      XSM_HW_SUPER
+     *      XSM_XENSTORE
+     */
+    if (src->xsm_roles & allowed)
+        return 0;
+
+    return -EPERM;
+}
+
+#endif /* __XSM_ROLES_H__ */
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index b50d8a711f..50f2f547dc 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -16,8 +16,12 @@
 #define __XSM_H__
 
 #include <xen/sched.h>
+#include <xsm/roles.h>
 #include <xen/multiboot.h>
 
+#include <public/version.h>
+#include <public/hvm/params.h>
+
 typedef void xsm_op_t;
 DEFINE_XEN_GUEST_HANDLE(xsm_op_t);
 
@@ -30,8 +34,6 @@ typedef u32 xsm_magic_t;
 #define XSM_MAGIC 0x0
 #endif
 
-typedef uint32_t xsm_default_t;
-
 struct xsm_operations {
     void (*security_domaininfo) (struct domain *d,
                                         struct xen_domctl_getdomaininfo *info);
@@ -178,564 +180,797 @@ struct xsm_operations {
 #endif
 };
 
-#ifdef CONFIG_XSM
-
 extern struct xsm_operations *xsm_ops;
 
-#ifndef XSM_NO_WRAPPERS
+#define CALL_XSM_OP(op, ...)                            \
+    do {                                                \
+        if ( xsm_ops && xsm_ops->op )                   \
+            return xsm_ops->op(__VA_ARGS__);            \
+    } while ( 0 )
+
+#define CALL_XSM_OP_NORET(op, ...)                      \
+    do {                                                \
+        if ( xsm_ops && xsm_ops->op ) {                 \
+            xsm_ops->op(__VA_ARGS__);                   \
+            return;                                     \
+        }                                               \
+    } while ( 0 )
+
+#define XSM_ALLOWED_ROLES(def)                          \
+    do {                                                \
+        BUG_ON( !((def) & role) );                      \
+    } while ( 0 )
 
 static inline void xsm_security_domaininfo (struct domain *d,
                                         struct xen_domctl_getdomaininfo *info)
 {
-    xsm_ops->security_domaininfo(d, info);
+    CALL_XSM_OP_NORET(security_domaininfo,d, info);
+
+    return;
 }
 
-static inline int xsm_domain_create (xsm_default_t def, struct domain *d, u32 ssidref)
+static inline int xsm_domain_create (xsm_role_t role, struct domain *d, u32 ssidref)
 {
-    return xsm_ops->domain_create(d, ssidref);
+    CALL_XSM_OP(domain_create, d, ssidref);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_getdomaininfo (xsm_default_t def, struct domain *d)
+static inline int xsm_getdomaininfo (xsm_role_t role, struct domain *d)
 {
-    return xsm_ops->getdomaininfo(d);
+    CALL_XSM_OP(getdomaininfo, d);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_domctl_scheduler_op (xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_domctl_scheduler_op (xsm_role_t role, struct domain *d, int cmd)
 {
-    return xsm_ops->domctl_scheduler_op(d, cmd);
+    CALL_XSM_OP(domctl_scheduler_op, d, cmd);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_sysctl_scheduler_op (xsm_default_t def, int cmd)
+static inline int xsm_sysctl_scheduler_op (xsm_role_t role, int cmd)
 {
-    return xsm_ops->sysctl_scheduler_op(cmd);
+    CALL_XSM_OP(sysctl_scheduler_op, cmd);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, NULL);
 }
 
-static inline int xsm_set_target (xsm_default_t def, struct domain *d, struct domain *e)
+static inline int xsm_set_target (xsm_role_t role, struct domain *d, struct domain *e)
 {
-    return xsm_ops->set_target(d, e);
+    CALL_XSM_OP(set_target, d, e);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, NULL);
 }
 
-static inline int xsm_domctl (xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_domctl (xsm_role_t role, struct domain *d, int cmd)
 {
-    return xsm_ops->domctl(d, cmd);
+    CALL_XSM_OP(domctl, d, cmd);
+    XSM_ALLOWED_ROLES(DEV_EMU_PRIVS | XENSTORE_PRIVS | XSM_DOM_SUPER);
+    switch ( cmd )
+    {
+    case XEN_DOMCTL_ioport_mapping:
+    case XEN_DOMCTL_memory_mapping:
+    case XEN_DOMCTL_bind_pt_irq:
+    case XEN_DOMCTL_unbind_pt_irq:
+        return xsm_validate_role(DEV_EMU_PRIVS, current->domain, d);
+    case XEN_DOMCTL_getdomaininfo:
+        return xsm_validate_role(XENSTORE_PRIVS, current->domain, d);
+    default:
+        return xsm_validate_role(XSM_DOM_SUPER, current->domain, d);
+    }
 }
 
-static inline int xsm_sysctl (xsm_default_t def, int cmd)
+static inline int xsm_sysctl (xsm_role_t role, int cmd)
 {
-    return xsm_ops->sysctl(cmd);
+    CALL_XSM_OP(sysctl, cmd);
+    XSM_ALLOWED_ROLES(XSM_PLAT_CTRL);
+    return xsm_validate_role(role, current->domain, NULL);
 }
 
-static inline int xsm_readconsole (xsm_default_t def, uint32_t clear)
+static inline int xsm_readconsole (xsm_role_t role, uint32_t clear)
 {
-    return xsm_ops->readconsole(clear);
+    CALL_XSM_OP(readconsole, clear);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, NULL);
 }
 
-static inline int xsm_evtchn_unbound (xsm_default_t def, struct domain *d1, struct evtchn *chn,
+static inline int xsm_evtchn_unbound (xsm_role_t role, struct domain *d1, struct evtchn *chn,
                                                                     domid_t id2)
 {
-    return xsm_ops->evtchn_unbound(d1, chn, id2);
+    CALL_XSM_OP(evtchn_unbound, d1, chn, id2);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS);
+    return xsm_validate_role(role, current->domain, d1);
 }
 
-static inline int xsm_evtchn_interdomain (xsm_default_t def, struct domain *d1,
+static inline int xsm_evtchn_interdomain (xsm_role_t role, struct domain *d1,
                 struct evtchn *chan1, struct domain *d2, struct evtchn *chan2)
 {
-    return xsm_ops->evtchn_interdomain(d1, chan1, d2, chan2);
+    CALL_XSM_OP(evtchn_interdomain, d1, chan1, d2, chan2);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, d1, d2);
 }
 
 static inline void xsm_evtchn_close_post (struct evtchn *chn)
 {
-    xsm_ops->evtchn_close_post(chn);
+    CALL_XSM_OP_NORET(evtchn_close_post, chn);
+    return;
 }
 
-static inline int xsm_evtchn_send (xsm_default_t def, struct domain *d, struct evtchn *chn)
+static inline int xsm_evtchn_send (xsm_role_t role, struct domain *d, struct evtchn *chn)
 {
-    return xsm_ops->evtchn_send(d, chn);
+    CALL_XSM_OP(evtchn_send, d, chn);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, d, NULL);
 }
 
-static inline int xsm_evtchn_status (xsm_default_t def, struct domain *d, struct evtchn *chn)
+static inline int xsm_evtchn_status (xsm_role_t role, struct domain *d, struct evtchn *chn)
 {
-    return xsm_ops->evtchn_status(d, chn);
+    CALL_XSM_OP(evtchn_status, d, chn);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_evtchn_reset (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_evtchn_reset (xsm_role_t role, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->evtchn_reset(d1, d2);
+    CALL_XSM_OP(evtchn_reset, d1, d2);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS);
+    return xsm_validate_role(role, d1, d2);
 }
 
-static inline int xsm_grant_mapref (xsm_default_t def, struct domain *d1, struct domain *d2,
+static inline int xsm_grant_mapref (xsm_role_t role, struct domain *d1, struct domain *d2,
                                                                 uint32_t flags)
 {
-    return xsm_ops->grant_mapref(d1, d2, flags);
+    CALL_XSM_OP(grant_mapref, d1, d2, flags);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, d1, d2);
 }
 
-static inline int xsm_grant_unmapref (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_unmapref (xsm_role_t role, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->grant_unmapref(d1, d2);
+    CALL_XSM_OP(grant_unmapref, d1, d2);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, d1, d2);
 }
 
-static inline int xsm_grant_setup (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_setup (xsm_role_t role, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->grant_setup(d1, d2);
+    CALL_XSM_OP(grant_setup, d1, d2);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS);
+    return xsm_validate_role(role, d1, d2);
 }
 
-static inline int xsm_grant_transfer (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_transfer (xsm_role_t role, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->grant_transfer(d1, d2);
+    CALL_XSM_OP(grant_transfer, d1, d2);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, d1, d2);
 }
 
-static inline int xsm_grant_copy (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_copy (xsm_role_t role, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->grant_copy(d1, d2);
+    CALL_XSM_OP(grant_copy, d1, d2);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, d1, d2);
 }
 
-static inline int xsm_grant_query_size (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_grant_query_size (xsm_role_t role, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->grant_query_size(d1, d2);
+    CALL_XSM_OP(grant_query_size, d1, d2);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS);
+    return xsm_validate_role(role, d1, d2);
 }
 
 static inline int xsm_alloc_security_domain (struct domain *d)
 {
-    return xsm_ops->alloc_security_domain(d);
+    CALL_XSM_OP(alloc_security_domain, d);
+    return 0;
 }
 
 static inline void xsm_free_security_domain (struct domain *d)
 {
-    xsm_ops->free_security_domain(d);
+    CALL_XSM_OP_NORET(free_security_domain, d);
+    return;
 }
 
 static inline int xsm_alloc_security_evtchns(
     struct evtchn chn[], unsigned int nr)
 {
-    return xsm_ops->alloc_security_evtchns(chn, nr);
+    CALL_XSM_OP(alloc_security_evtchns, chn, nr);
+    return 0;
 }
 
 static inline void xsm_free_security_evtchns(
     struct evtchn chn[], unsigned int nr)
 {
-    xsm_ops->free_security_evtchns(chn, nr);
+    CALL_XSM_OP_NORET(free_security_evtchns, chn, nr);
+    return;
 }
 
 static inline char *xsm_show_security_evtchn (struct domain *d, const struct evtchn *chn)
 {
-    return xsm_ops->show_security_evtchn(d, chn);
+    CALL_XSM_OP(show_security_evtchn, d, chn);
+    return NULL;
 }
 
-static inline int xsm_init_hardware_domain (xsm_default_t def, struct domain *d)
+static inline int xsm_init_hardware_domain (xsm_role_t role, struct domain *d)
 {
-    return xsm_ops->init_hardware_domain(d);
+    CALL_XSM_OP(init_hardware_domain, d);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_get_pod_target (xsm_default_t def, struct domain *d)
+static inline int xsm_get_pod_target (xsm_role_t role, struct domain *d)
 {
-    return xsm_ops->get_pod_target(d);
+    CALL_XSM_OP(get_pod_target, d);
+    XSM_ALLOWED_ROLES(XSM_DOM_SUPER);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_set_pod_target (xsm_default_t def, struct domain *d)
+static inline int xsm_set_pod_target (xsm_role_t role, struct domain *d)
 {
-    return xsm_ops->set_pod_target(d);
+    CALL_XSM_OP(set_pod_target, d);
+    XSM_ALLOWED_ROLES(XSM_DOM_SUPER);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_memory_exchange (xsm_default_t def, struct domain *d)
+static inline int xsm_memory_exchange (xsm_role_t role, struct domain *d)
 {
-    return xsm_ops->memory_exchange(d);
+    CALL_XSM_OP(memory_exchange, d);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_memory_adjust_reservation (xsm_default_t def, struct domain *d1, struct
+static inline int xsm_memory_adjust_reservation (xsm_role_t role, struct domain *d1, struct
                                                                     domain *d2)
 {
-    return xsm_ops->memory_adjust_reservation(d1, d2);
+    CALL_XSM_OP(memory_adjust_reservation, d1, d2);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS);
+    return xsm_validate_role(role, d1, d2);
 }
 
-static inline int xsm_memory_stat_reservation (xsm_default_t def, struct domain *d1,
+static inline int xsm_memory_stat_reservation (xsm_role_t role, struct domain *d1,
                                                             struct domain *d2)
 {
-    return xsm_ops->memory_stat_reservation(d1, d2);
+    CALL_XSM_OP(memory_stat_reservation, d1, d2);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS);
+    return xsm_validate_role(role, d1, d2);
 }
 
-static inline int xsm_memory_pin_page(xsm_default_t def, struct domain *d1, struct domain *d2,
+static inline int xsm_memory_pin_page(xsm_role_t role, struct domain *d1, struct domain *d2,
                                       struct page_info *page)
 {
-    return xsm_ops->memory_pin_page(d1, d2, page);
+    CALL_XSM_OP(memory_pin_page, d1, d2, page);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, d1, d2);
 }
 
-static inline int xsm_add_to_physmap(xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_add_to_physmap(xsm_role_t role, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->add_to_physmap(d1, d2);
+    CALL_XSM_OP(add_to_physmap, d1, d2);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS);
+    return xsm_validate_role(role, d1, d2);
 }
 
-static inline int xsm_remove_from_physmap(xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_remove_from_physmap(xsm_role_t role, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->remove_from_physmap(d1, d2);
+    CALL_XSM_OP(remove_from_physmap, d1, d2);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS);
+    return xsm_validate_role(role, d1, d2);
 }
 
-static inline int xsm_map_gmfn_foreign (xsm_default_t def, struct domain *d, struct domain *t)
+static inline int xsm_map_gmfn_foreign (xsm_role_t role, struct domain *d, struct domain *t)
 {
-    return xsm_ops->map_gmfn_foreign(d, t);
+    CALL_XSM_OP(map_gmfn_foreign, d, t);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS);
+    return xsm_validate_role(role, d, t);
 }
 
-static inline int xsm_claim_pages(xsm_default_t def, struct domain *d)
+static inline int xsm_claim_pages(xsm_role_t role, struct domain *d)
 {
-    return xsm_ops->claim_pages(d);
+    CALL_XSM_OP(claim_pages, d);
+    XSM_ALLOWED_ROLES(XSM_DOM_SUPER);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_console_io (xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_console_io (xsm_role_t role, struct domain *d, int cmd)
 {
-    return xsm_ops->console_io(d, cmd);
+    CALL_XSM_OP(console_io, d, cmd);
+    XSM_ALLOWED_ROLES(XSM_NONE|XSM_DOM_SUPER);
+    if ( d->is_console )
+        return xsm_validate_role(XSM_NONE, d, NULL);
+#ifdef CONFIG_VERBOSE_DEBUG
+    if ( cmd == CONSOLEIO_write )
+        return xsm_validate_role(XSM_NONE, d, NULL);
+#endif
+    return xsm_validate_role(XSM_DOM_SUPER, d, NULL);
 }
 
-static inline int xsm_profile (xsm_default_t def, struct domain *d, int op)
+static inline int xsm_profile (xsm_role_t role, struct domain *d, int op)
 {
-    return xsm_ops->profile(d, op);
+    CALL_XSM_OP(profile, d, op);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, d, NULL);
 }
 
-static inline int xsm_kexec (xsm_default_t def)
+static inline int xsm_kexec (xsm_role_t role)
 {
-    return xsm_ops->kexec();
+    CALL_XSM_OP(kexec);
+    XSM_ALLOWED_ROLES(XSM_PLAT_CTRL);
+    return xsm_validate_role(role, current->domain, NULL);
 }
 
-static inline int xsm_schedop_shutdown (xsm_default_t def, struct domain *d1, struct domain *d2)
+static inline int xsm_schedop_shutdown (xsm_role_t role, struct domain *d1, struct domain *d2)
 {
-    return xsm_ops->schedop_shutdown(d1, d2);
+    CALL_XSM_OP(schedop_shutdown, d1, d2);
+    XSM_ALLOWED_ROLES(DEV_EMU_PRIVS);
+    return xsm_validate_role(role, d1, d2);
 }
 
 static inline char *xsm_show_irq_sid (int irq)
 {
-    return xsm_ops->show_irq_sid(irq);
+    CALL_XSM_OP(show_irq_sid, irq);
+    return NULL;
 }
 
-static inline int xsm_map_domain_pirq (xsm_default_t def, struct domain *d)
+static inline int xsm_map_domain_pirq (xsm_role_t role, struct domain *d)
 {
-    return xsm_ops->map_domain_pirq(d);
+    CALL_XSM_OP(map_domain_pirq, d);
+    XSM_ALLOWED_ROLES(DEV_EMU_PRIVS);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_map_domain_irq (xsm_default_t def, struct domain *d, int irq, void *data)
+static inline int xsm_map_domain_irq (xsm_role_t role, struct domain *d, int irq, void *data)
 {
-    return xsm_ops->map_domain_irq(d, irq, data);
+    CALL_XSM_OP(map_domain_irq, d, irq, data);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_unmap_domain_pirq (xsm_default_t def, struct domain *d)
+static inline int xsm_unmap_domain_pirq (xsm_role_t role, struct domain *d)
 {
-    return xsm_ops->unmap_domain_pirq(d);
+    CALL_XSM_OP(unmap_domain_pirq, d);
+    XSM_ALLOWED_ROLES(DEV_EMU_PRIVS);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_unmap_domain_irq (xsm_default_t def, struct domain *d, int irq, void *data)
+static inline int xsm_unmap_domain_irq (xsm_role_t role, struct domain *d, int irq, void *data)
 {
-    return xsm_ops->unmap_domain_irq(d, irq, data);
+    CALL_XSM_OP(unmap_domain_irq, d, irq, data);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_bind_pt_irq(xsm_default_t def, struct domain *d,
+static inline int xsm_bind_pt_irq(xsm_role_t role, struct domain *d,
                                   struct xen_domctl_bind_pt_irq *bind)
 {
-    return xsm_ops->bind_pt_irq(d, bind);
+    CALL_XSM_OP(bind_pt_irq, d, bind);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_unbind_pt_irq(xsm_default_t def, struct domain *d,
+static inline int xsm_unbind_pt_irq(xsm_role_t role, struct domain *d,
                                     struct xen_domctl_bind_pt_irq *bind)
 {
-    return xsm_ops->unbind_pt_irq(d, bind);
+    CALL_XSM_OP(unbind_pt_irq, d, bind);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_irq_permission (xsm_default_t def, struct domain *d, int pirq, uint8_t allow)
+static inline int xsm_irq_permission (xsm_role_t role, struct domain *d, int pirq, uint8_t allow)
 {
-    return xsm_ops->irq_permission(d, pirq, allow);
+    CALL_XSM_OP(irq_permission, d, pirq, allow);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_iomem_permission (xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+static inline int xsm_iomem_permission (xsm_role_t role, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
-    return xsm_ops->iomem_permission(d, s, e, allow);
+    CALL_XSM_OP(iomem_permission, d, s, e, allow);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_iomem_mapping (xsm_default_t def, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
+static inline int xsm_iomem_mapping (xsm_role_t role, struct domain *d, uint64_t s, uint64_t e, uint8_t allow)
 {
-    return xsm_ops->iomem_mapping(d, s, e, allow);
+    CALL_XSM_OP(iomem_mapping, d, s, e, allow);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_pci_config_permission (xsm_default_t def, struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end, uint8_t access)
+static inline int xsm_pci_config_permission (xsm_role_t role, struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end, uint8_t access)
 {
-    return xsm_ops->pci_config_permission(d, machine_bdf, start, end, access);
+    CALL_XSM_OP(pci_config_permission, d, machine_bdf, start, end, access);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-static inline int xsm_get_device_group(xsm_default_t def, uint32_t machine_bdf)
+static inline int xsm_get_device_group(xsm_role_t role, uint32_t machine_bdf)
 {
-    return xsm_ops->get_device_group(machine_bdf);
+    CALL_XSM_OP(get_device_group, machine_bdf);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, NULL);
 }
 
-static inline int xsm_assign_device(xsm_default_t def, struct domain *d, uint32_t machine_bdf)
+static inline int xsm_assign_device(xsm_role_t role, struct domain *d, uint32_t machine_bdf)
 {
-    return xsm_ops->assign_device(d, machine_bdf);
+    CALL_XSM_OP(assign_device, d, machine_bdf);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_deassign_device(xsm_default_t def, struct domain *d, uint32_t machine_bdf)
+static inline int xsm_deassign_device(xsm_role_t role, struct domain *d, uint32_t machine_bdf)
 {
-    return xsm_ops->deassign_device(d, machine_bdf);
+    CALL_XSM_OP(deassign_device, d, machine_bdf);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 #endif /* HAS_PASSTHROUGH && HAS_PCI) */
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
-static inline int xsm_assign_dtdevice(xsm_default_t def, struct domain *d,
+static inline int xsm_assign_dtdevice(xsm_role_t role, struct domain *d,
                                       const char *dtpath)
 {
-    return xsm_ops->assign_dtdevice(d, dtpath);
+    CALL_XSM_OP(assign_dtdevice, d, dtpath);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_deassign_dtdevice(xsm_default_t def, struct domain *d,
+static inline int xsm_deassign_dtdevice(xsm_role_t role, struct domain *d,
                                         const char *dtpath)
 {
-    return xsm_ops->deassign_dtdevice(d, dtpath);
+    CALL_XSM_OP(deassign_dtdevice, d, dtpath);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 
 #endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
 
-static inline int xsm_resource_plug_pci (xsm_default_t def, uint32_t machine_bdf)
+static inline int xsm_resource_plug_pci (xsm_role_t role, uint32_t machine_bdf)
 {
-    return xsm_ops->resource_plug_pci(machine_bdf);
+    CALL_XSM_OP(resource_plug_pci, machine_bdf);
+    XSM_ALLOWED_ROLES(XSM_HW_CTRL);
+    return xsm_validate_role(role, current->domain, NULL);
 }
 
-static inline int xsm_resource_unplug_pci (xsm_default_t def, uint32_t machine_bdf)
+static inline int xsm_resource_unplug_pci (xsm_role_t role, uint32_t machine_bdf)
 {
-    return xsm_ops->resource_unplug_pci(machine_bdf);
+    CALL_XSM_OP(resource_unplug_pci, machine_bdf);
+    XSM_ALLOWED_ROLES(XSM_HW_CTRL);
+    return xsm_validate_role(role, current->domain, NULL);
 }
 
-static inline int xsm_resource_plug_core (xsm_default_t def)
+static inline int xsm_resource_plug_core (xsm_role_t role)
 {
-    return xsm_ops->resource_plug_core();
+    CALL_XSM_OP(resource_plug_core);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, NULL);
 }
 
-static inline int xsm_resource_unplug_core (xsm_default_t def)
+static inline int xsm_resource_unplug_core (xsm_role_t role)
 {
-    return xsm_ops->resource_unplug_core();
+    CALL_XSM_OP(resource_unplug_core);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, NULL);
 }
 
-static inline int xsm_resource_setup_pci (xsm_default_t def, uint32_t machine_bdf)
+static inline int xsm_resource_setup_pci (xsm_role_t role, uint32_t machine_bdf)
 {
-    return xsm_ops->resource_setup_pci(machine_bdf);
+    CALL_XSM_OP(resource_setup_pci, machine_bdf);
+    XSM_ALLOWED_ROLES(XSM_HW_CTRL);
+    return xsm_validate_role(role, current->domain, NULL);
 }
 
-static inline int xsm_resource_setup_gsi (xsm_default_t def, int gsi)
+static inline int xsm_resource_setup_gsi (xsm_role_t role, int gsi)
 {
-    return xsm_ops->resource_setup_gsi(gsi);
+    CALL_XSM_OP(resource_setup_gsi, gsi);
+    XSM_ALLOWED_ROLES(XSM_HW_CTRL);
+    return xsm_validate_role(role, current->domain, NULL);
 }
 
-static inline int xsm_resource_setup_misc (xsm_default_t def)
+static inline int xsm_resource_setup_misc (xsm_role_t role)
 {
-    return xsm_ops->resource_setup_misc();
+    CALL_XSM_OP(resource_setup_misc);
+    XSM_ALLOWED_ROLES(XSM_HW_CTRL);
+    return xsm_validate_role(role, current->domain, NULL);
 }
 
-static inline int xsm_page_offline(xsm_default_t def, uint32_t cmd)
+static inline int xsm_page_offline(xsm_role_t role, uint32_t cmd)
 {
-    return xsm_ops->page_offline(cmd);
+    CALL_XSM_OP(page_offline, cmd);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, NULL);
 }
 
-static inline int xsm_hypfs_op(xsm_default_t def)
+static inline int xsm_hypfs_op(xsm_role_t role)
 {
-    return xsm_ops->hypfs_op();
+    CALL_XSM_OP(hypfs_op);
+    XSM_ALLOWED_ROLES(XSM_PLAT_CTRL);
+    return xsm_validate_role(role, current->domain, NULL);
 }
 
 static inline long xsm_do_xsm_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 {
-    return xsm_ops->do_xsm_op(op);
+    CALL_XSM_OP(do_xsm_op, op);
+    return -ENOSYS;
 }
 
 #ifdef CONFIG_COMPAT
 static inline int xsm_do_compat_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 {
-    return xsm_ops->do_compat_op(op);
+    CALL_XSM_OP(do_compat_op, op);
+    return -ENOSYS;
 }
 #endif
 
-static inline int xsm_hvm_param (xsm_default_t def, struct domain *d, unsigned long op)
+static inline int xsm_hvm_param (xsm_role_t role, struct domain *d, unsigned long op)
 {
-    return xsm_ops->hvm_param(d, op);
+    CALL_XSM_OP(hvm_param, d, op);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_hvm_control(xsm_default_t def, struct domain *d, unsigned long op)
+static inline int xsm_hvm_control(xsm_role_t role, struct domain *d, unsigned long op)
 {
-    return xsm_ops->hvm_control(d, op);
+    CALL_XSM_OP(hvm_control, d, op);
+    XSM_ALLOWED_ROLES(DEV_EMU_PRIVS);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_hvm_param_altp2mhvm (xsm_default_t def, struct domain *d)
+static inline int xsm_hvm_param_altp2mhvm (xsm_role_t role, struct domain *d)
 {
-    return xsm_ops->hvm_param_altp2mhvm(d);
+    CALL_XSM_OP(hvm_param_altp2mhvm, d);
+    XSM_ALLOWED_ROLES(XSM_DOM_SUPER);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_hvm_altp2mhvm_op (xsm_default_t def, struct domain *d, uint64_t mode, uint32_t op)
+static inline int xsm_hvm_altp2mhvm_op (xsm_role_t role, struct domain *d, uint64_t mode, uint32_t op)
 {
-    return xsm_ops->hvm_altp2mhvm_op(d, mode, op);
+    CALL_XSM_OP(hvm_altp2mhvm_op, d, mode, op);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS | DEV_EMU_PRIVS);
+
+    switch ( mode )
+    {
+    case XEN_ALTP2M_mixed:
+        return xsm_validate_role(TARGET_PRIVS, current->domain, d);
+    case XEN_ALTP2M_external:
+        return xsm_validate_role(DEV_EMU_PRIVS, current->domain, d);
+    case XEN_ALTP2M_limited:
+        if ( HVMOP_altp2m_vcpu_enable_notify == op )
+            return xsm_validate_role(TARGET_PRIVS, current->domain, d);
+        return xsm_validate_role(DEV_EMU_PRIVS, current->domain, d);
+    default:
+        return -EPERM;
+    }
 }
 
-static inline int xsm_get_vnumainfo (xsm_default_t def, struct domain *d)
+static inline int xsm_get_vnumainfo (xsm_role_t role, struct domain *d)
 {
-    return xsm_ops->get_vnumainfo(d);
+    CALL_XSM_OP(get_vnumainfo, d);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_vm_event_control (xsm_default_t def, struct domain *d, int mode, int op)
+static inline int xsm_vm_event_control (xsm_role_t role, struct domain *d, int mode, int op)
 {
-    return xsm_ops->vm_event_control(d, mode, op);
+    CALL_XSM_OP(vm_event_control, d, mode, op);
+    XSM_ALLOWED_ROLES(XSM_DOM_SUPER);
+    return xsm_validate_role(role, current->domain, d);
 }
 
 #ifdef CONFIG_MEM_ACCESS
-static inline int xsm_mem_access (xsm_default_t def, struct domain *d)
+static inline int xsm_mem_access (xsm_role_t role, struct domain *d)
 {
-    return xsm_ops->mem_access(d);
+    CALL_XSM_OP(mem_access, d);
+    XSM_ALLOWED_ROLES(DEV_EMU_PRIVS);
+    return xsm_validate_role(role, current->domain, d);
 }
 #endif
 
 #ifdef CONFIG_HAS_MEM_PAGING
-static inline int xsm_mem_paging (xsm_default_t def, struct domain *d)
+static inline int xsm_mem_paging (xsm_role_t role, struct domain *d)
 {
-    return xsm_ops->mem_paging(d);
+    CALL_XSM_OP(mem_paging, d);
+    XSM_ALLOWED_ROLES(DEV_EMU_PRIVS);
+    return xsm_validate_role(role, current->domain, d);
 }
 #endif
 
 #ifdef CONFIG_MEM_SHARING
-static inline int xsm_mem_sharing (xsm_default_t def, struct domain *d)
+static inline int xsm_mem_sharing (xsm_role_t role, struct domain *d)
 {
-    return xsm_ops->mem_sharing(d);
+    CALL_XSM_OP(mem_sharing, d);
+    XSM_ALLOWED_ROLES(DEV_EMU_PRIVS);
+    return xsm_validate_role(role, current->domain, d);
 }
 #endif
 
-static inline int xsm_platform_op (xsm_default_t def, uint32_t op)
+static inline int xsm_platform_op (xsm_role_t role, uint32_t op)
 {
-    return xsm_ops->platform_op(op);
+    CALL_XSM_OP(platform_op, op);
+    XSM_ALLOWED_ROLES(XSM_PLAT_CTRL);
+    return xsm_validate_role(role, current->domain, NULL);
 }
 
 #ifdef CONFIG_X86
-static inline int xsm_do_mca(xsm_default_t def)
-{
-    return xsm_ops->do_mca();
-}
-
-static inline int xsm_shadow_control (xsm_default_t def, struct domain *d, uint32_t op)
+static inline int xsm_do_mca(xsm_role_t role)
 {
-    return xsm_ops->shadow_control(d, op);
+    CALL_XSM_OP(do_mca);
+    XSM_ALLOWED_ROLES(XSM_PLAT_CTRL);
+    return xsm_validate_role(role, current->domain, NULL);
 }
 
-static inline int xsm_mem_sharing_op (xsm_default_t def, struct domain *d, struct domain *cd, int op)
+static inline int xsm_shadow_control (xsm_role_t role, struct domain *d, uint32_t op)
 {
-    return xsm_ops->mem_sharing_op(d, cd, op);
+    CALL_XSM_OP(shadow_control, d, op);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_apic (xsm_default_t def, struct domain *d, int cmd)
+static inline int xsm_mem_sharing_op (xsm_role_t role, struct domain *d, struct domain *cd, int op)
 {
-    return xsm_ops->apic(d, cmd);
+    CALL_XSM_OP(mem_sharing_op, d, cd, op);
+    XSM_ALLOWED_ROLES(DEV_EMU_PRIVS);
+    return xsm_validate_role(role, current->domain, cd);
 }
 
-static inline int xsm_memtype (xsm_default_t def, uint32_t access)
+static inline int xsm_apic (xsm_role_t role, struct domain *d, int cmd)
 {
-    return xsm_ops->memtype(access);
+    CALL_XSM_OP(apic, d, cmd);
+    XSM_ALLOWED_ROLES(XSM_HW_CTRL);
+    return xsm_validate_role(role, d, NULL);
 }
 
-static inline int xsm_machine_memory_map(xsm_default_t def)
+static inline int xsm_machine_memory_map(xsm_role_t role)
 {
-    return xsm_ops->machine_memory_map();
+    CALL_XSM_OP(machine_memory_map);
+    XSM_ALLOWED_ROLES(XSM_PLAT_CTRL);
+    return xsm_validate_role(role, current->domain, NULL);
 }
 
-static inline int xsm_domain_memory_map(xsm_default_t def, struct domain *d)
+static inline int xsm_domain_memory_map(xsm_role_t role, struct domain *d)
 {
-    return xsm_ops->domain_memory_map(d);
+    CALL_XSM_OP(domain_memory_map, d);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_mmu_update (xsm_default_t def, struct domain *d, struct domain *t,
+static inline int xsm_mmu_update (xsm_role_t role, struct domain *d, struct domain *t,
                                   struct domain *f, uint32_t flags)
 {
-    return xsm_ops->mmu_update(d, t, f, flags);
+    int rc = 0;
+    CALL_XSM_OP(mmu_update, d, t, f, flags);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS);
+    if ( f != dom_io )
+        rc = xsm_validate_role(role, d, f);
+    if ( evaluate_nospec(t) && !rc )
+        rc = xsm_validate_role(role, d, t);
+    return rc;
 }
 
-static inline int xsm_mmuext_op (xsm_default_t def, struct domain *d, struct domain *f)
+static inline int xsm_mmuext_op (xsm_role_t role, struct domain *d, struct domain *f)
 {
-    return xsm_ops->mmuext_op(d, f);
+    CALL_XSM_OP(mmuext_op, d, f);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS);
+    return xsm_validate_role(role, d, f);
 }
 
-static inline int xsm_update_va_mapping(xsm_default_t def, struct domain *d, struct domain *f,
+static inline int xsm_update_va_mapping(xsm_role_t role, struct domain *d, struct domain *f,
                                                             l1_pgentry_t pte)
 {
-    return xsm_ops->update_va_mapping(d, f, pte);
+    CALL_XSM_OP(update_va_mapping, d, f, pte);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS);
+    return xsm_validate_role(role, d, f);
 }
 
-static inline int xsm_priv_mapping(xsm_default_t def, struct domain *d, struct domain *t)
+static inline int xsm_priv_mapping(xsm_role_t role, struct domain *d, struct domain *t)
 {
-    return xsm_ops->priv_mapping(d, t);
+    CALL_XSM_OP(priv_mapping, d, t);
+    XSM_ALLOWED_ROLES(TARGET_PRIVS);
+    return xsm_validate_role(role, d, t);
 }
 
-static inline int xsm_ioport_permission (xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+static inline int xsm_ioport_permission (xsm_role_t role, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
-    return xsm_ops->ioport_permission(d, s, e, allow);
+    CALL_XSM_OP(ioport_permission, d, s, e, allow);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_ioport_mapping (xsm_default_t def, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
+static inline int xsm_ioport_mapping (xsm_role_t role, struct domain *d, uint32_t s, uint32_t e, uint8_t allow)
 {
-    return xsm_ops->ioport_mapping(d, s, e, allow);
+    CALL_XSM_OP(ioport_mapping, d, s, e, allow);
+    XSM_ALLOWED_ROLES(XSM_NONE);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_pmu_op (xsm_default_t def, struct domain *d, unsigned int op)
+static inline int xsm_pmu_op (xsm_role_t role, struct domain *d, unsigned int op)
 {
-    return xsm_ops->pmu_op(d, op);
+    CALL_XSM_OP(pmu_op, d, op);
+    XSM_ALLOWED_ROLES(XSM_NONE | XSM_DOM_SUPER);
+    switch ( op )
+    {
+    case XENPMU_init:
+    case XENPMU_finish:
+    case XENPMU_lvtpc_set:
+    case XENPMU_flush:
+        return xsm_validate_role(XSM_NONE, d, current->domain);
+    default:
+        return xsm_validate_role(XSM_DOM_SUPER, d, current->domain);
+    }
 }
 
 #endif /* CONFIG_X86 */
 
-static inline int xsm_dm_op(xsm_default_t def, struct domain *d)
+static inline int xsm_dm_op(xsm_role_t role, struct domain *d)
 {
-    return xsm_ops->dm_op(d);
+    CALL_XSM_OP(dm_op, d);
+    XSM_ALLOWED_ROLES(DEV_EMU_PRIVS);
+    return xsm_validate_role(role, current->domain, d);
 }
 
-static inline int xsm_xen_version (xsm_default_t def, uint32_t op)
+static inline int xsm_xen_version (xsm_role_t role, uint32_t op)
 {
-    return xsm_ops->xen_version(op);
+    CALL_XSM_OP(xen_version, op);
+    XSM_ALLOWED_ROLES(XSM_NONE | XSM_PLAT_CTRL);
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
+        return xsm_validate_role(XSM_NONE, current->domain, NULL);
+    default:
+        return xsm_validate_role(XSM_PLAT_CTRL, current->domain, NULL);
+    }
 }
 
-static inline int xsm_domain_resource_map(xsm_default_t def, struct domain *d)
+static inline int xsm_domain_resource_map(xsm_role_t role, struct domain *d)
 {
-    return xsm_ops->domain_resource_map(d);
+    CALL_XSM_OP(domain_resource_map, d);
+    XSM_ALLOWED_ROLES(DEV_EMU_PRIVS);
+    return xsm_validate_role(role, current->domain, d);
 }
 
 #ifdef CONFIG_ARGO
 static inline int xsm_argo_enable(const struct domain *d)
 {
-    return xsm_ops->argo_enable(d);
+    CALL_XSM_OP(argo_enable, d);
+    return 0;
 }
 
 static inline int xsm_argo_register_single_source(const struct domain *d,
                                                   const struct domain *t)
 {
-    return xsm_ops->argo_register_single_source(d, t);
+    CALL_XSM_OP(argo_register_single_source, d, t);
+    return 0;
 }
 
 static inline int xsm_argo_register_any_source(const struct domain *d)
 {
-    return xsm_ops->argo_register_any_source(d);
+    CALL_XSM_OP(argo_register_any_source, d);
+    return 0;
 }
 
 static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 {
-    return xsm_ops->argo_send(d, t);
+    CALL_XSM_OP(argo_send, d, t);
+    return 0;
 }
 
 #endif /* CONFIG_ARGO */
 
-#endif /* XSM_NO_WRAPPERS */
-
-#ifdef CONFIG_MULTIBOOT
-extern int xsm_multiboot_init(unsigned long *module_map,
-                              const multiboot_info_t *mbi);
-extern int xsm_multiboot_policy_init(unsigned long *module_map,
-                                     const multiboot_info_t *mbi,
-                                     void **policy_buffer,
-                                     size_t *policy_size);
-#endif
-
-#ifdef CONFIG_HAS_DEVICE_TREE
-/*
- * Initialize XSM
- *
- * On success, return 1 if using SILO mode else 0.
- */
-extern int xsm_dt_init(void);
-extern int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
-extern bool has_xsm_magic(paddr_t);
-#endif
-
 extern int register_xsm(struct xsm_operations *ops);
 
 extern struct xsm_operations dummy_xsm_ops;
@@ -760,9 +995,29 @@ extern void silo_init(void);
 static inline void silo_init(void) {}
 #endif
 
-#else /* CONFIG_XSM */
+#ifdef CONFIG_XSM_POLICY_MODULES
+
+#ifdef CONFIG_MULTIBOOT
+extern int xsm_multiboot_init(unsigned long *module_map,
+                              const multiboot_info_t *mbi);
+extern int xsm_multiboot_policy_init(unsigned long *module_map,
+                                     const multiboot_info_t *mbi,
+                                     void **policy_buffer,
+                                     size_t *policy_size);
+#endif
+
+#ifdef CONFIG_HAS_DEVICE_TREE
+/*
+ * Initialize XSM
+ *
+ * On success, return 1 if using SILO mode else 0.
+ */
+extern int xsm_dt_init(void);
+extern int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
+extern bool has_xsm_magic(paddr_t);
+#endif
 
-#include <xsm/dummy.h>
+#else /* CONFIG_XSM_POLICY_MODULES */
 
 #ifdef CONFIG_MULTIBOOT
 static inline int xsm_multiboot_init (unsigned long *module_map,
@@ -784,6 +1039,6 @@ static inline bool has_xsm_magic(paddr_t start)
 }
 #endif /* CONFIG_HAS_DEVICE_TREE */
 
-#endif /* CONFIG_XSM */
+#endif /* CONFIG_XSM_POLICY_MODULES */
 
 #endif /* __XSM_H */
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 5eab21e1b1..6bd8ad8751 100644
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
@@ -32,6 +30,8 @@
 
 struct xsm_operations *xsm_ops;
 
+#ifdef CONFIG_XSM
+
 enum xsm_bootparam {
     XSM_BOOTPARAM_DUMMY,
     XSM_BOOTPARAM_FLASK,
-- 
2.20.1


