Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 383621DD2FF
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 18:20:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbnvL-0000ys-HS; Thu, 21 May 2020 16:19:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/yRJ=7D=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jbnvK-0000yS-3T
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 16:19:58 +0000
X-Inumbo-ID: e3bbed44-9b7e-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3bbed44-9b7e-11ea-b9cf-bc764e2007e4;
 Thu, 21 May 2020 16:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QfGmoXyhQuN/EVxQAxJlmVEjrcceHfUNWPHkPI0BpEQ=; b=0UcGuSWjabQ6qD4s4WMXkM5UJm
 JhbRjcH0xTpYT6vGQcXaa9L+rYKNtWZl+1l1QbYX6R7eyVmkvkdN7KxdYhlOncJYTSTGO5Dxp3BrJ
 0JttAfT/5a3/Ng6JM8HMSd98J56qjwLtU0GCMlV6CFzimu4OY9Hy3bk8h8aXIGq8IzUw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jbnv8-0006ne-1u; Thu, 21 May 2020 16:19:46 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jbnv7-00088L-OK; Thu, 21 May 2020 16:19:45 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 2/5] xen/common/domctl: introduce
 XEN_DOMCTL_get/setdomaincontext
Date: Thu, 21 May 2020 17:19:36 +0100
Message-Id: <20200521161939.4508-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200521161939.4508-1-paul@xen.org>
References: <20200521161939.4508-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

These domctls provide a mechanism to get and set domain context from
the toolstack.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: Julien Grall <julien@xen.org>
---
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>

v4:
 - Add missing zero pad checks

v3:
 - Addressed comments from Julien and Jan
 - Use vmalloc() rather than xmalloc_bytes()

v2:
 - drop mask parameter
 - const-ify some more buffers
---
 tools/flask/policy/modules/xen.if   |   4 +-
 tools/libxc/include/xenctrl.h       |   5 +
 tools/libxc/xc_domain.c             |  56 +++++++++
 xen/common/domctl.c                 | 173 ++++++++++++++++++++++++++++
 xen/include/public/domctl.h         |  41 +++++++
 xen/xsm/flask/hooks.c               |   6 +
 xen/xsm/flask/policy/access_vectors |   4 +
 7 files changed, 287 insertions(+), 2 deletions(-)

diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
index 8eb2293a52..2bc9db4f64 100644
--- a/tools/flask/policy/modules/xen.if
+++ b/tools/flask/policy/modules/xen.if
@@ -53,7 +53,7 @@ define(`create_domain_common', `
 	allow $1 $2:domain2 { set_cpu_policy settsc setscheduler setclaim
 			set_vnumainfo get_vnumainfo cacheflush
 			psr_cmt_op psr_alloc soft_reset
-			resource_map get_cpu_policy };
+			resource_map get_cpu_policy setcontext };
 	allow $1 $2:security check_context;
 	allow $1 $2:shadow enable;
 	allow $1 $2:mmu { map_read map_write adjust memorymap physmap pinpage mmuext_op updatemp };
@@ -97,7 +97,7 @@ define(`migrate_domain_out', `
 	allow $1 $2:hvm { gethvmc getparam };
 	allow $1 $2:mmu { stat pageinfo map_read };
 	allow $1 $2:domain { getaddrsize getvcpucontext pause destroy };
-	allow $1 $2:domain2 gettsc;
+	allow $1 $2:domain2 { gettsc getcontext };
 	allow $1 $2:shadow { enable disable logdirty };
 ')
 
diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
index 45ff7db1e8..0ce2372e2f 100644
--- a/tools/libxc/include/xenctrl.h
+++ b/tools/libxc/include/xenctrl.h
@@ -867,6 +867,11 @@ int xc_domain_hvm_setcontext(xc_interface *xch,
                              uint8_t *hvm_ctxt,
                              uint32_t size);
 
+int xc_domain_getcontext(xc_interface *xch, uint32_t domid,
+                         void *ctxt_buf, size_t *size);
+int xc_domain_setcontext(xc_interface *xch, uint32_t domid,
+                         const void *ctxt_buf, size_t size);
+
 /**
  * This function will return guest IO ABI protocol
  *
diff --git a/tools/libxc/xc_domain.c b/tools/libxc/xc_domain.c
index 71829c2bce..e462a6f728 100644
--- a/tools/libxc/xc_domain.c
+++ b/tools/libxc/xc_domain.c
@@ -537,6 +537,62 @@ int xc_domain_hvm_setcontext(xc_interface *xch,
     return ret;
 }
 
+int xc_domain_getcontext(xc_interface *xch, uint32_t domid,
+                         void *ctxt_buf, size_t *size)
+{
+    int ret;
+    DECLARE_DOMCTL = {
+        .cmd = XEN_DOMCTL_getdomaincontext,
+        .domain = domid,
+        .u.getdomaincontext.size = *size,
+    };
+    DECLARE_HYPERCALL_BOUNCE(ctxt_buf, *size, XC_HYPERCALL_BUFFER_BOUNCE_OUT);
+
+    if ( xc_hypercall_bounce_pre(xch, ctxt_buf) )
+        return -1;
+
+    set_xen_guest_handle(domctl.u.setdomaincontext.buffer, ctxt_buf);
+
+    ret = do_domctl(xch, &domctl);
+
+    xc_hypercall_bounce_post(xch, ctxt_buf);
+
+    if ( ret )
+        return ret;
+
+    *size = domctl.u.getdomaincontext.size;
+    if ( *size != domctl.u.getdomaincontext.size )
+    {
+        errno = EOVERFLOW;
+        return -1;
+    }
+
+    return 0;
+}
+
+int xc_domain_setcontext(xc_interface *xch, uint32_t domid,
+                         const void *ctxt_buf, size_t size)
+{
+    int ret;
+    DECLARE_DOMCTL = {
+        .cmd = XEN_DOMCTL_setdomaincontext,
+        .domain = domid,
+        .u.setdomaincontext.size = size,
+    };
+    DECLARE_HYPERCALL_BOUNCE_IN(ctxt_buf, size);
+
+    if ( xc_hypercall_bounce_pre(xch, ctxt_buf) )
+        return -1;
+
+    set_xen_guest_handle(domctl.u.setdomaincontext.buffer, ctxt_buf);
+
+    ret = do_domctl(xch, &domctl);
+
+    xc_hypercall_bounce_post(xch, ctxt_buf);
+
+    return ret;
+}
+
 int xc_vcpu_getcontext(xc_interface *xch,
                        uint32_t domid,
                        uint32_t vcpu,
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index a69b3b59a8..44758034a6 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -25,6 +25,8 @@
 #include <xen/hypercall.h>
 #include <xen/vm_event.h>
 #include <xen/monitor.h>
+#include <xen/save.h>
+#include <xen/vmap.h>
 #include <asm/current.h>
 #include <asm/irq.h>
 #include <asm/page.h>
@@ -358,6 +360,168 @@ static struct vnuma_info *vnuma_init(const struct xen_domctl_vnuma *uinfo,
     return ERR_PTR(ret);
 }
 
+struct domctl_context
+{
+    void *buffer;
+    struct domain_save_descriptor *desc;
+    size_t len;
+    size_t cur;
+};
+
+static int dry_run_append(void *priv, const void *data, size_t len)
+{
+    struct domctl_context *c = priv;
+
+    if ( c->len + len < c->len )
+        return -EOVERFLOW;
+
+    c->len += len;
+
+    return 0;
+}
+
+static int dry_run_begin(void *priv, const struct domain_save_descriptor *desc)
+{
+    return dry_run_append(priv, NULL, sizeof(*desc));
+}
+
+static int dry_run_end(void *priv, size_t len)
+{
+    return 0;
+}
+
+static struct domain_save_ops dry_run_ops = {
+    .begin = dry_run_begin,
+    .append = dry_run_append,
+    .end = dry_run_end,
+};
+
+static int save_begin(void *priv, const struct domain_save_descriptor *desc)
+{
+    struct domctl_context *c = priv;
+
+    if ( c->len - c->cur < sizeof(*desc) )
+        return -ENOSPC;
+
+    c->desc = c->buffer + c->cur; /* stash pointer to descriptor */
+    *c->desc = *desc;
+
+    c->cur += sizeof(*desc);
+
+    return 0;
+}
+
+static int save_append(void *priv, const void *data, size_t len)
+{
+    struct domctl_context *c = priv;
+
+    if ( c->len - c->cur < len )
+        return -ENOSPC;
+
+    memcpy(c->buffer + c->cur, data, len);
+    c->cur += len;
+
+    return 0;
+}
+
+static int save_end(void *priv, size_t len)
+{
+    struct domctl_context *c = priv;
+
+    c->desc->length = len;
+
+    return 0;
+}
+
+static struct domain_save_ops save_ops = {
+    .begin = save_begin,
+    .append = save_append,
+    .end = save_end,
+};
+
+static int getdomaincontext(struct domain *d,
+                            struct xen_domctl_getdomaincontext *gdc)
+{
+    struct domctl_context c = { .buffer = ZERO_BLOCK_PTR };
+    int rc;
+
+    if ( d == current->domain )
+        return -EPERM;
+
+    if ( gdc->pad )
+        return -EINVAL;
+
+    if ( guest_handle_is_null(gdc->buffer) ) /* query for buffer size */
+    {
+        if ( gdc->size )
+            return -EINVAL;
+
+        /* dry run to acquire buffer size */
+        rc = domain_save(d, &dry_run_ops, &c, true);
+        if ( rc )
+            return rc;
+
+        gdc->size = c.len;
+        return 0;
+    }
+
+    c.len = gdc->size;
+    c.buffer = vmalloc(c.len);
+    if ( !c.buffer )
+        return -ENOMEM;
+
+    rc = domain_save(d, &save_ops, &c, false);
+
+    gdc->size = c.cur;
+    if ( !rc && copy_to_guest(gdc->buffer, c.buffer, gdc->size) )
+        rc = -EFAULT;
+
+    vfree(c.buffer);
+
+    return rc;
+}
+
+static int load_read(void *priv, void *data, size_t len)
+{
+    struct domctl_context *c = priv;
+
+    if ( c->len - c->cur < len )
+        return -ENODATA;
+
+    memcpy(data, c->buffer + c->cur, len);
+    c->cur += len;
+
+    return 0;
+}
+
+static struct domain_load_ops load_ops = {
+    .read = load_read,
+};
+
+static int setdomaincontext(struct domain *d,
+                            const struct xen_domctl_setdomaincontext *sdc)
+{
+    struct domctl_context c = { .buffer = ZERO_BLOCK_PTR, .len = sdc->size };
+    int rc;
+
+    if ( d == current->domain )
+        return -EPERM;
+
+    if ( sdc->pad )
+        return -EINVAL;
+
+    c.buffer = vmalloc(c.len);
+    if ( !c.buffer )
+        return -ENOMEM;
+
+    rc = !copy_from_guest(c.buffer, sdc->buffer, c.len) ?
+        domain_load(d, &load_ops, &c) : -EFAULT;
+
+    vfree(c.buffer);
+
+    return rc;
+}
+
 long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
     long ret = 0;
@@ -942,6 +1106,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             copyback = 1;
         break;
 
+    case XEN_DOMCTL_getdomaincontext:
+        ret = getdomaincontext(d, &op->u.getdomaincontext);
+        copyback = !ret;
+        break;
+
+    case XEN_DOMCTL_setdomaincontext:
+        ret = setdomaincontext(d, &op->u.setdomaincontext);
+        break;
+
     default:
         ret = arch_do_domctl(op, d, u_domctl);
         break;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 1ad34c35eb..1b133bda59 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1129,6 +1129,43 @@ struct xen_domctl_vuart_op {
                                  */
 };
 
+/*
+ * XEN_DOMCTL_getdomaincontext
+ * ---------------------------
+ *
+ * buffer (IN):   The buffer into which the context data should be
+ *                copied, or NULL to query the buffer size that should
+ *                be allocated.
+ * size (IN/OUT): If 'buffer' is NULL then the value passed in must be
+ *                zero, and the value passed out will be the size of the
+ *                buffer to allocate.
+ *                If 'buffer' is non-NULL then the value passed in must
+ *                be the size of the buffer into which data may be copied.
+ *                The value passed out will be the size of data written.
+ */
+struct xen_domctl_getdomaincontext {
+    uint32_t size;
+    uint32_t pad;
+    XEN_GUEST_HANDLE_64(void) buffer;
+};
+
+/* XEN_DOMCTL_setdomaincontext
+ * ---------------------------
+ *
+ * buffer (IN):   The buffer from which the context data should be
+ *                copied.
+ * size (IN):     The size of the buffer from which data may be copied.
+ *                This data must include DOMAIN_SAVE_CODE_HEADER at the
+ *                start and terminate with a DOMAIN_SAVE_CODE_END record.
+ *                Any data beyond the DOMAIN_SAVE_CODE_END record will be
+ *                ignored.
+ */
+struct xen_domctl_setdomaincontext {
+    uint32_t size;
+    uint32_t pad;
+    XEN_GUEST_HANDLE_64(const_void) buffer;
+};
+
 struct xen_domctl {
     uint32_t cmd;
 #define XEN_DOMCTL_createdomain                   1
@@ -1210,6 +1247,8 @@ struct xen_domctl {
 #define XEN_DOMCTL_vuart_op                      81
 #define XEN_DOMCTL_get_cpu_policy                82
 #define XEN_DOMCTL_set_cpu_policy                83
+#define XEN_DOMCTL_getdomaincontext              84
+#define XEN_DOMCTL_setdomaincontext              85
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1270,6 +1309,8 @@ struct xen_domctl {
         struct xen_domctl_monitor_op        monitor_op;
         struct xen_domctl_psr_alloc         psr_alloc;
         struct xen_domctl_vuart_op          vuart_op;
+        struct xen_domctl_getdomaincontext  getdomaincontext;
+        struct xen_domctl_setdomaincontext  setdomaincontext;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 4649e6fd95..6f3db276ef 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -745,6 +745,12 @@ static int flask_domctl(struct domain *d, int cmd)
     case XEN_DOMCTL_get_cpu_policy:
         return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__GET_CPU_POLICY);
 
+    case XEN_DOMCTL_setdomaincontext:
+        return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__SETCONTEXT);
+
+    case XEN_DOMCTL_getdomaincontext:
+        return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__GETCONTEXT);
+
     default:
         return avc_unknown_permission("domctl", cmd);
     }
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index c055c14c26..fccfb9de82 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -245,6 +245,10 @@ class domain2
     resource_map
 # XEN_DOMCTL_get_cpu_policy
     get_cpu_policy
+# XEN_DOMCTL_setdomaincontext
+    setcontext
+# XEN_DOMCTL_getdomaincontext
+    getcontext
 }
 
 # Similar to class domain, but primarily contains domctls related to HVM domains
-- 
2.20.1


