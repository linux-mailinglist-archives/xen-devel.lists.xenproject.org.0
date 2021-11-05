Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1315E446480
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 14:56:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222348.384520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizhf-0006yf-FY; Fri, 05 Nov 2021 13:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222348.384520; Fri, 05 Nov 2021 13:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizhf-0006ue-7q; Fri, 05 Nov 2021 13:56:23 +0000
Received: by outflank-mailman (input) for mailman id 222348;
 Fri, 05 Nov 2021 13:56:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VR3F=PY=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mizhd-00063k-OQ
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 13:56:21 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25c0639a-3e40-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 14:56:19 +0100 (CET)
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
X-Inumbo-ID: 25c0639a-3e40-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636120579;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=jE3t3ojHgtOHN6Ilg6l9UgKhubTh2BJEn5CMoqQCWrM=;
  b=Ytn6jnIHF6+8WIMVvWiIJ1WgHuSXMV0NMtnkxQwHLY5KcONcA5rzjaYO
   68EFHoH7lG6XOV8b5vXBpvuHzc2REykS4Hrxr4STftdZzfj1/hIjwGvjM
   rK5kL3TWlbNBVYKTjmAPTzVx0yEmpmvAi1Jb/g2XsLWsLbZIz+FT94kr6
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jPPOO8eak+TuVctPl7Fi/nDgDR1SgKPTta6cvNGMdPBNSP1+8z7oWfuk7xDRFYTT8XRg8DY/hF
 ewAnFUBwirH3pOC0WgfZzAv+lauvq7wlFmZrJxdI6k/mMwtwQkPzrY8kJfTbRsnf183nOUFmom
 f3ueUrP29KLyV2eiLH87N2TFP4MYrH6eVoZLeAkItrq3TTthc3zOGSnjsXhsMS/vt0m2hlXX4e
 k2RuppHNB+XbWgkpgqQCdZh9Q1PyZ+w6u/UwY1gpNPVybwkf+tNocYxrKMslbMs1MXH8V2twKV
 hRd8EqITFmBdmCIzzmP4kHca
X-SBRS: 5.1
X-MesageID: 57163417
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Gh0Ye6l0ak6bc4LdoalbVijo5gxZIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaXzuPO6rcZmumKdt1btyw8k0HuMXVzIdlQFRt+ylgFyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29Y12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PtGlreUbyVwB6iStO8iTQUICw9dApQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKmHO
 ZFFMGUHgBLoOCNweQdQObIExbmspl39Iwxkq1+qnP9ii4TU5FMoi+W8WDbPQfSGXd5Qn1qYj
 mve8n7lHwoBM9iC1TuC9GnqjejK9Qv3V44fG6ex3uJ7i12UgGoIAVsZUkXTiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXYht8F4SrNgrlvXk+yNvljfVjNsoiN9hMIOmsQVbhgM9
 Aawmo3FDgNxrO2NZ1Giz+LBxd+tAhQ9IWgHbC4CaAIK5dj/vY0+5i7yosZf/L2d1YOsR2ypq
 9yehG1n3uhI05ZXv0mu1Qmf22rEm3TfcuIiCuw7tEqB5xgxWoOqbpfABbPzvacZd9bxorVsU
 RE5dymiAAImUc7leM+lGrxl8FSVCxCtamC0bblHRchJythV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPEsPdrsUp93k/e4RLwJs8w4iPIUP/CdkyfdrUlTibO4hTixwCDAb4lmY
 f93jvpA/V5FUP86nVJats8W0KMxxzBW+I8gbcuT8vhT6pLHPCT9Ye5caDOmN7llhIvZ8FS92
 4sObKOilkQAONASlwGKqOb/23hRdiNlbX03wuQKHtO+zv1OQzp9VKOImOtJlk4Mt/09q9okN
 0qVAidwoGcTT1WeQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:2rJlBq7J+Juc7Vs5RQPXwMrXdLJyesId70hD6qhwISY6TiX4rb
 HWoB1173/JYVoqNE3I3OrwXZVoIkmsk6Kdg7NhXotKNTOO0ADDQb2Kr7GSpwEIcxeOkdK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.87,211,1631592000"; 
   d="scan'208";a="57163417"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>
Subject: [PATCH 5/5] xen/xsm: Address hypercall ABI problems
Date: Fri, 5 Nov 2021 13:55:55 +0000
Message-ID: <20211105135555.24261-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211105135555.24261-1-andrew.cooper3@citrix.com>
References: <20211105135555.24261-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Currently, __HYPERVISOR_xsm_op enters xsm_ops.do_{xsm,compat}_op() which means
that if any other XSM module registers a handler, we'll break the hypercall
ABI totally by having the behaviour depend on the selected XSM module.

There are 2 options:
 1) Rename __HYPERVISOR_xsm_op to __HYPERVISOR_flask_op.  If another XSM
    module wants hypercalls, they'll have to introduce a new top-level
    hypercall.
 2) Make the current flask_op() be common, and require new hypercalls to fit
    compatibly with xen_flask_op_t.  This can be done fairly easily by
    subdividing the .cmd space.

In this patch, we implement option 2.

Move the stub {do,compat}_xsm_op() implementation into a new xsm_op.c so we
can more easily do multi-inclusion compat magic.  Also add a new private.h,
because flask/hook.c's local declaration of {do,compat}_flask_op() wasn't
remotely safe.

The top level now dispatches into {do,compat}_flask_op() based on op.cmd, and
handles the primary copy in/out.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
CC: Daniel Smith <dpsmith@apertussolutions.com>

Only lightly tested.  Slightly RFC.  There are several things which aren't
great, but probably want addressing in due course.

 1) The public headers probably want to lose the flask name (in a compatible
    way), now that the hypercall is common.  This probably wants to be
    combined with no longer taking a void handle.
 2) {do,compat}_xsm_op() are currently identical other than the dispatched-to
    functions because the size of xsm_flask_op_t is invariant with
    COMPAT-ness.  We could simplfy things by only having one, and dispatching
    to {do,compat}_*_op() directly, but I'm not sure whether the complexity is
    worth it.
 3) Bloat-o-meter says these changes add 16 extra bytes to dm_op() and I can't
    figure out what could possibly be causing this.
---
 xen/include/Makefile     |  2 +-
 xen/include/xsm/dummy.h  | 12 ----------
 xen/include/xsm/xsm.h    | 17 --------------
 xen/xsm/Makefile         |  1 +
 xen/xsm/dummy.c          |  5 ----
 xen/xsm/flask/flask_op.c | 60 ++++++++++++++++++++++--------------------------
 xen/xsm/flask/hooks.c    |  8 -------
 xen/xsm/private.h        | 16 +++++++++++++
 xen/xsm/xsm_core.c       | 12 ----------
 xen/xsm/xsm_op.c         | 51 ++++++++++++++++++++++++++++++++++++++++
 10 files changed, 96 insertions(+), 88 deletions(-)
 create mode 100644 xen/xsm/private.h
 create mode 100644 xen/xsm/xsm_op.c

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 95daa8a28975..9547f848635c 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -32,7 +32,7 @@ headers-$(CONFIG_HYPFS)   += compat/hypfs.h
 headers-$(CONFIG_KEXEC)   += compat/kexec.h
 headers-$(CONFIG_TRACEBUFFER) += compat/trace.h
 headers-$(CONFIG_XENOPROF) += compat/xenoprof.h
-headers-$(CONFIG_XSM_FLASK) += compat/xsm/flask_op.h
+headers-$(CONFIG_XSM)      += compat/xsm/flask_op.h
 
 cppflags-y                := -include public/xen-compat.h -DXEN_GENERATING_COMPAT_HEADERS
 cppflags-$(CONFIG_X86)    += -m32
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index b024119896e6..5448e9970bc1 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -466,18 +466,6 @@ static XSM_INLINE int xsm_hypfs_op(XSM_DEFAULT_VOID)
     return xsm_default_action(action, current->domain, NULL);
 }
 
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
 static XSM_INLINE char *xsm_show_irq_sid(int irq)
 {
     return NULL;
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 5aa4dd588d17..4856b589dd86 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -141,11 +141,6 @@ struct xsm_ops {
     int (*page_offline)(uint32_t cmd);
     int (*hypfs_op)(void);
 
-    long (*do_xsm_op)(XEN_GUEST_HANDLE_PARAM(void) op);
-#ifdef CONFIG_COMPAT
-    int (*do_compat_op)(XEN_GUEST_HANDLE_PARAM(void) op);
-#endif
-
     int (*hvm_param)(struct domain *d, unsigned long op);
     int (*hvm_param_altp2mhvm)(struct domain *d);
     int (*hvm_altp2mhvm_op)(struct domain *d, uint64_t mode, uint32_t op);
@@ -585,18 +580,6 @@ static inline int xsm_hypfs_op(xsm_default_t def)
     return alternative_call(xsm_ops.hypfs_op);
 }
 
-static inline long xsm_do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
-{
-    return alternative_call(xsm_ops.do_xsm_op, op);
-}
-
-#ifdef CONFIG_COMPAT
-static inline int xsm_do_compat_op(XEN_GUEST_HANDLE_PARAM(void) op)
-{
-    return alternative_call(xsm_ops.do_compat_op, op);
-}
-#endif
-
 static inline int xsm_hvm_param(
     xsm_default_t def, struct domain *d, unsigned long op)
 {
diff --git a/xen/xsm/Makefile b/xen/xsm/Makefile
index cf0a728f1c96..93ba20256f6e 100644
--- a/xen/xsm/Makefile
+++ b/xen/xsm/Makefile
@@ -1,4 +1,5 @@
 obj-y += xsm_core.o
+obj-y += xsm_op.o
 obj-$(CONFIG_XSM) += xsm_policy.o
 obj-$(CONFIG_XSM) += dummy.o
 obj-$(CONFIG_XSM_SILO) += silo.o
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index c111fa05968d..4fb7b0d04f7b 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -99,11 +99,6 @@ static const struct xsm_ops __initconstrel dummy_ops = {
     .hvm_param_altp2mhvm           = xsm_hvm_param_altp2mhvm,
     .hvm_altp2mhvm_op              = xsm_hvm_altp2mhvm_op,
 
-    .do_xsm_op                     = xsm_do_xsm_op,
-#ifdef CONFIG_COMPAT
-    .do_compat_op                  = xsm_do_compat_op,
-#endif
-
     .add_to_physmap                = xsm_add_to_physmap,
     .remove_from_physmap           = xsm_remove_from_physmap,
     .map_gmfn_foreign              = xsm_map_gmfn_foreign,
diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
index 221ff00fd3cc..e25664711019 100644
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -22,6 +22,8 @@
 #include <objsec.h>
 #include <conditional.h>
 
+#include "../private.h"
+
 #define ret_t long
 #define _copy_to_guest copy_to_guest
 #define _copy_from_guest copy_from_guest
@@ -607,21 +609,17 @@ static int flask_relabel_domain(struct xen_flask_relabel *arg)
 
 #endif /* !COMPAT */
 
-ret_t do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op)
+ret_t do_flask_op(xen_flask_op_t *op, bool *copyback)
 {
-    xen_flask_op_t op;
     int rv;
 
-    if ( copy_from_guest(&op, u_flask_op, 1) )
-        return -EFAULT;
-
-    if ( op.interface_version != XEN_FLASK_INTERFACE_VERSION )
+    if ( op->interface_version != XEN_FLASK_INTERFACE_VERSION )
         return -ENOSYS;
 
-    switch ( op.cmd )
+    switch ( op->cmd )
     {
     case FLASK_LOAD:
-        rv = flask_security_load(&op.u.load);
+        rv = flask_security_load(&op->u.load);
         break;
 
     case FLASK_GETENFORCE:
@@ -629,27 +627,27 @@ ret_t do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op)
         break;
 
     case FLASK_SETENFORCE:
-        rv = flask_security_setenforce(&op.u.enforce);
+        rv = flask_security_setenforce(&op->u.enforce);
         break;
 
     case FLASK_CONTEXT_TO_SID:
-        rv = flask_security_context(&op.u.sid_context);
+        rv = flask_security_context(&op->u.sid_context);
         break;
 
     case FLASK_SID_TO_CONTEXT:
-        rv = flask_security_sid(&op.u.sid_context);
+        rv = flask_security_sid(&op->u.sid_context);
         break;
 
     case FLASK_ACCESS:
-        rv = flask_security_access(&op.u.access);
+        rv = flask_security_access(&op->u.access);
         break;
 
     case FLASK_CREATE:
-        rv = flask_security_create(&op.u.transition);
+        rv = flask_security_create(&op->u.transition);
         break;
 
     case FLASK_RELABEL:
-        rv = flask_security_relabel(&op.u.transition);
+        rv = flask_security_relabel(&op->u.transition);
         break;
 
     case FLASK_POLICYVERS:
@@ -657,11 +655,11 @@ ret_t do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op)
         break;
 
     case FLASK_GETBOOL:
-        rv = flask_security_get_bool(&op.u.boolean);
+        rv = flask_security_get_bool(&op->u.boolean);
         break;
 
     case FLASK_SETBOOL:
-        rv = flask_security_set_bool(&op.u.boolean);
+        rv = flask_security_set_bool(&op->u.boolean);
         break;
 
     case FLASK_COMMITBOOLS:
@@ -677,41 +675,41 @@ ret_t do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op)
         break;
 
     case FLASK_SETAVC_THRESHOLD:
-        rv = flask_security_setavc_threshold(&op.u.setavc_threshold);
+        rv = flask_security_setavc_threshold(&op->u.setavc_threshold);
         break;
 
     case FLASK_AVC_HASHSTATS:
-        rv = avc_get_hash_stats(&op.u.hash_stats);
+        rv = avc_get_hash_stats(&op->u.hash_stats);
         break;
 
 #ifdef CONFIG_XSM_FLASK_AVC_STATS
     case FLASK_AVC_CACHESTATS:
-        rv = flask_security_avc_cachestats(&op.u.cache_stats);
+        rv = flask_security_avc_cachestats(&op->u.cache_stats);
         break;
 #endif
 
     case FLASK_MEMBER:
-        rv = flask_security_member(&op.u.transition);
+        rv = flask_security_member(&op->u.transition);
         break;
 
     case FLASK_ADD_OCONTEXT:
-        rv = flask_ocontext_add(&op.u.ocontext);
+        rv = flask_ocontext_add(&op->u.ocontext);
         break;
 
     case FLASK_DEL_OCONTEXT:
-        rv = flask_ocontext_del(&op.u.ocontext);
+        rv = flask_ocontext_del(&op->u.ocontext);
         break;
 
     case FLASK_GET_PEER_SID:
-        rv = flask_get_peer_sid(&op.u.peersid);
+        rv = flask_get_peer_sid(&op->u.peersid);
         break;
 
     case FLASK_RELABEL_DOMAIN:
-        rv = flask_relabel_domain(&op.u.relabel);
+        rv = flask_relabel_domain(&op->u.relabel);
         break;
 
     case FLASK_DEVICETREE_LABEL:
-        rv = flask_devicetree_label(&op.u.devicetree_label);
+        rv = flask_devicetree_label(&op->u.devicetree_label);
         break;
 
     default:
@@ -719,16 +717,12 @@ ret_t do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op)
     }
 
     if ( rv < 0 )
-        goto out;
+        return rv;
 
-    if ( (FLASK_COPY_OUT&(1UL<<op.cmd)) )
-    {
-        if ( copy_to_guest(u_flask_op, &op, 1) )
-            rv = -EFAULT;
-    }
+    if ( (1ul << op->cmd) & FLASK_COPY_OUT )
+        *copyback = true;
 
- out:
-    return rv;
+    return 0;
 }
 
 #if defined(CONFIG_COMPAT) && !defined(COMPAT)
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 3b29f7fde372..8f4fc7458b8f 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1742,9 +1742,6 @@ static int flask_argo_send(const struct domain *d, const struct domain *t)
 
 #endif
 
-long do_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
-int compat_flask_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op);
-
 static const struct xsm_ops __initconstrel flask_ops = {
     .security_domaininfo = flask_security_domaininfo,
     .domain_create = flask_domain_create,
@@ -1819,7 +1816,6 @@ static const struct xsm_ops __initconstrel flask_ops = {
     .hvm_param_altp2mhvm = flask_hvm_param_altp2mhvm,
     .hvm_altp2mhvm_op = flask_hvm_altp2mhvm_op,
 
-    .do_xsm_op = do_flask_op,
     .get_vnumainfo = flask_get_vnumainfo,
 
     .vm_event_control = flask_vm_event_control,
@@ -1836,10 +1832,6 @@ static const struct xsm_ops __initconstrel flask_ops = {
     .mem_sharing = flask_mem_sharing,
 #endif
 
-#ifdef CONFIG_COMPAT
-    .do_compat_op = compat_flask_op,
-#endif
-
     .add_to_physmap = flask_add_to_physmap,
     .remove_from_physmap = flask_remove_from_physmap,
     .map_gmfn_foreign = flask_map_gmfn_foreign,
diff --git a/xen/xsm/private.h b/xen/xsm/private.h
new file mode 100644
index 000000000000..19ade2eed6b7
--- /dev/null
+++ b/xen/xsm/private.h
@@ -0,0 +1,16 @@
+#ifndef XSM_PRIVATE_H
+#define XSM_PRIVATE_H
+
+#include <public/xsm/flask_op.h>
+
+long do_flask_op(xen_flask_op_t *op, bool *copyback);
+
+#ifdef CONFIG_COMPAT
+
+#include <compat/xsm/flask_op.h>
+
+int compat_flask_op(compat_flask_op_t *op, bool *copyback);
+
+#endif /* CONFIG_COMPAT */
+
+#endif /* XSM_PRIVATE_H */
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 21fffbcb41d3..819a6ccd54cc 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -218,15 +218,3 @@ bool __init has_xsm_magic(paddr_t start)
 #endif
 
 #endif
-
-long do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
-{
-    return xsm_do_xsm_op(op);
-}
-
-#ifdef CONFIG_COMPAT
-int compat_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
-{
-    return xsm_do_compat_op(op);
-}
-#endif
diff --git a/xen/xsm/xsm_op.c b/xen/xsm/xsm_op.c
new file mode 100644
index 000000000000..5922299fc4dc
--- /dev/null
+++ b/xen/xsm/xsm_op.c
@@ -0,0 +1,51 @@
+#ifndef COMPAT
+
+#include <xen/guest_access.h>
+
+#include "private.h"
+
+#define ret_t long
+#define _copy_to_guest copy_to_guest
+#define _copy_from_guest copy_from_guest
+
+#endif /* COMPAT */
+
+ret_t do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) u_flask_op)
+{
+    xen_flask_op_t op;
+    bool copyback = false;
+    ret_t rc = -ENOSYS;
+
+    if ( copy_from_guest(&op, u_flask_op, 1) )
+        return -EFAULT;
+
+    switch ( op.cmd )
+    {
+    case FLASK_LOAD ... FLASK_DEVICETREE_LABEL:
+        if ( IS_ENABLED(CONFIG_XSM_FLASK) )
+            rc = do_flask_op(&op, &copyback);
+        break;
+    }
+
+    if ( copyback && copy_to_guest(u_flask_op, &op, 1) )
+        rc = -EFAULT;
+
+    return rc;
+}
+
+#if defined(CONFIG_COMPAT) && !defined(COMPAT)
+#define COMPAT
+
+#undef _copy_to_guest
+#define _copy_to_guest copy_to_compat
+#undef _copy_from_guest
+#define _copy_from_guest copy_from_compat
+
+#define xen_flask_op_t compat_flask_op_t
+#undef ret_t
+#define ret_t int
+#define do_flask_op compat_flask_op
+#define do_xsm_op compat_xsm_op
+
+#include "xsm_op.c"
+#endif
-- 
2.11.0


