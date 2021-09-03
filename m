Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9D94001B7
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 17:07:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178134.324030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMAmn-0007KN-0z; Fri, 03 Sep 2021 15:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178134.324030; Fri, 03 Sep 2021 15:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMAmm-0007IO-SV; Fri, 03 Sep 2021 15:07:20 +0000
Received: by outflank-mailman (input) for mailman id 178134;
 Fri, 03 Sep 2021 15:07:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yFRs=NZ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mMAml-0006va-Rx
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 15:07:19 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9fa6f2f5-0cc8-11ec-af2e-12813bfff9fa;
 Fri, 03 Sep 2021 15:07:16 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1630681600351351.4561344219063;
 Fri, 3 Sep 2021 08:06:40 -0700 (PDT)
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
X-Inumbo-ID: 9fa6f2f5-0cc8-11ec-af2e-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1630681602; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jLx1FP5XMnBmH5Si8hAulIa6JYl7fcmWYjOQ46NGOvzlpYLnRpCNnHR54O68cprM79eWlwviqKpch+ek4arkyUjp0FlMbanY+i8CZCTaX5NjJSP3gbMS4/0Ocov1rY2EWcTzJdOhGHyC8RXr5T+fxH9P6FEYu/pO9GJDqhLLTKA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1630681602; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=6kGTTbjxT8L+j+0w8ftNK7DzfHzYGwCxPp/WOutTjVk=; 
	b=O6Ge//VArCi2Jmd0u/I1nj1a0Q3s8PsCN6GQhl4GE482Vr/4DH1rEqJTjJ/KQgA+hf+MP8+zfC4qVqnoKWx+6vgjHkhimeEdo0z2/WBTnJbdXdzY7Q++wwkUXbQvcIoi/+/FQx7U504KXazryx1F5pLCNQAjmvA5fZGaw6D73QU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1630681602;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6kGTTbjxT8L+j+0w8ftNK7DzfHzYGwCxPp/WOutTjVk=;
	b=dyN+y7sLq+jzU7UE4JdsQTqZvDGIg+bRTTTykR+cDqumvfRvu+M7gZgKxN0fGxns
	hgOcqVhMn8BpZvEAQNprwiopsv4PcZUwyZL7d/+xsvff3ChSbaIaE+cO2wPrCuZ6B4u
	AFIbtN6DHIDT5QmucsfDJUrswDdU8mUmJ09TyIhM=
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
Subject: [PATCH v4 03/11] xsm: drop dubious xsm_op_t type
Date: Fri,  3 Sep 2021 15:06:21 -0400
Message-Id: <20210903190629.11917-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210903190629.11917-1-dpsmith@apertussolutions.com>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The type xsm_op_t masks the use of void pointers. This commit drops the xsm_op_t type and
replaces it and all its uses with an explicit void.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xen/hypercall.h |  4 ++--
 xen/include/xsm/dummy.h     |  4 ++--
 xen/include/xsm/xsm.h       | 11 ++++-------
 xen/xsm/flask/flask_op.c    |  2 +-
 xen/xsm/flask/hooks.c       |  4 ++--
 xen/xsm/xsm_core.c          |  4 ++--
 6 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index 34b7f1fed6..3771487a30 100644
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -127,7 +127,7 @@ do_kexec_op(
 
 extern long
 do_xsm_op(
-    XEN_GUEST_HANDLE_PARAM(xsm_op_t) u_xsm_op);
+    XEN_GUEST_HANDLE_PARAM(void) u_xsm_op);
 
 #ifdef CONFIG_ARGO
 extern long do_argo_op(
@@ -198,7 +198,7 @@ compat_set_timer_op(
     s32 hi);
 
 extern int compat_xsm_op(
-    XEN_GUEST_HANDLE_PARAM(xsm_op_t) op);
+    XEN_GUEST_HANDLE_PARAM(void) op);
 
 extern int compat_kexec_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) uarg);
 
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 363c6d7798..214b5408b1 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -442,13 +442,13 @@ static XSM_INLINE int xsm_hypfs_op(XSM_DEFAULT_VOID)
     return xsm_default_action(action, current->domain, NULL);
 }
 
-static XSM_INLINE long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
+static XSM_INLINE long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return -ENOSYS;
 }
 
 #ifdef CONFIG_COMPAT
-static XSM_INLINE int xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
+static XSM_INLINE int xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return -ENOSYS;
 }
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index ad3cddbf7d..9872bae502 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -18,9 +18,6 @@
 #include <xen/sched.h>
 #include <xen/multiboot.h>
 
-typedef void xsm_op_t;
-DEFINE_XEN_GUEST_HANDLE(xsm_op_t);
-
 /* policy magic number (defined by XSM_MAGIC) */
 typedef u32 xsm_magic_t;
 
@@ -129,9 +126,9 @@ struct xsm_operations {
     int (*page_offline)(uint32_t cmd);
     int (*hypfs_op)(void);
 
-    long (*do_xsm_op) (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op);
+    long (*do_xsm_op) (XEN_GUEST_HANDLE_PARAM(void) op);
 #ifdef CONFIG_COMPAT
-    int (*do_compat_op) (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op);
+    int (*do_compat_op) (XEN_GUEST_HANDLE_PARAM(void) op);
 #endif
 
     int (*hvm_param) (struct domain *d, unsigned long op);
@@ -543,13 +540,13 @@ static inline int xsm_hypfs_op(xsm_default_t def)
     return xsm_ops->hypfs_op();
 }
 
-static inline long xsm_do_xsm_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
+static inline long xsm_do_xsm_op (XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return xsm_ops->do_xsm_op(op);
 }
 
 #ifdef CONFIG_COMPAT
-static inline int xsm_do_compat_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
+static inline int xsm_do_compat_op (XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return xsm_ops->do_compat_op(op);
 }
diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
index f41c025391..221ff00fd3 100644
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -607,7 +607,7 @@ static int flask_relabel_domain(struct xen_flask_relabel *arg)
 
 #endif /* !COMPAT */
 
-ret_t do_flask_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) u_flask_op)
+ret_t do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op)
 {
     xen_flask_op_t op;
     int rv;
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index f1a1217c98..1465db125a 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1742,8 +1742,8 @@ static int flask_argo_send(const struct domain *d, const struct domain *t)
 
 #endif
 
-long do_flask_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) u_flask_op);
-int compat_flask_op(XEN_GUEST_HANDLE_PARAM(xsm_op_t) u_flask_op);
+long do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
+int compat_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
 
 static struct xsm_operations flask_ops = {
     .security_domaininfo = flask_security_domaininfo,
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 5eab21e1b1..ac553f9c0d 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -213,13 +213,13 @@ int __init register_xsm(struct xsm_operations *ops)
 
 #endif
 
-long do_xsm_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
+long do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return xsm_do_xsm_op(op);
 }
 
 #ifdef CONFIG_COMPAT
-int compat_xsm_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
+int compat_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return xsm_do_compat_op(op);
 }
-- 
2.20.1


