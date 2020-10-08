Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150D2287BF5
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 20:58:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4561.11970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQb6x-0005ax-43; Thu, 08 Oct 2020 18:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4561.11970; Thu, 08 Oct 2020 18:57:55 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQb6w-0005aF-Vn; Thu, 08 Oct 2020 18:57:54 +0000
Received: by outflank-mailman (input) for mailman id 4561;
 Thu, 08 Oct 2020 18:57:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kQb6v-0005RO-Oh
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:57:53 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2735b4bf-4c1d-4fe6-833a-c586c308dc65;
 Thu, 08 Oct 2020 18:57:46 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6l-00041O-9a; Thu, 08 Oct 2020 18:57:43 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6k-0002P9-QB; Thu, 08 Oct 2020 18:57:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kQb6v-0005RO-Oh
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:57:53 +0000
X-Inumbo-ID: 2735b4bf-4c1d-4fe6-833a-c586c308dc65
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2735b4bf-4c1d-4fe6-833a-c586c308dc65;
	Thu, 08 Oct 2020 18:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=PIEMrLkEW9cqepMH9vM88oB66k912G0TL+PNGKBij/g=; b=1qd0VIdCHtQLR5HdSVJ3PjcAuE
	Dpa0nudmTP4twX2Csaq/21cUrdp7dpotIMAHIwChbsP6E7yBd5OhIW6O5E+cNWD4TQot8ljNYnUF3
	ifa6gdZqXE6NgL56QFjkx798ZLZfbq/Ai5MEKxMPrZVbkmp9oZbwcVxKPcsOvMsysBoY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6l-00041O-9a; Thu, 08 Oct 2020 18:57:43 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6k-0002P9-QB; Thu, 08 Oct 2020 18:57:43 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Ian Jackson <iwj@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v10 03/11] xen/common/domctl: introduce XEN_DOMCTL_get/set_domain_context
Date: Thu,  8 Oct 2020 19:57:27 +0100
Message-Id: <20201008185735.29875-4-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008185735.29875-1-paul@xen.org>
References: <20201008185735.29875-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These domctls provide a mechanism to get and set 'domain context' from
the toolstack. The implementation calls the domain_save_ctxt() and
domain_load_ctxt() functions introduced in a previous patch.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Julien Grall <julien@xen.org>
Cc: Wei Liu <wl@xen.org>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>

v10:
 - Re-base
 - Add underscores and move to 64-bit image size as requested by Andrew
 - Add a couple of record alignment ASSERTions
 - Dropped R-b and A-b since changes are not entirely cosmetic

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
 tools/libs/ctrl/include/xenctrl.h   |   5 +
 tools/libs/ctrl/xc_domain.c         |  56 +++++++++
 xen/common/domctl.c                 | 173 ++++++++++++++++++++++++++++
 xen/include/public/domctl.h         |  39 +++++++
 xen/xsm/flask/hooks.c               |   6 +
 xen/xsm/flask/policy/access_vectors |   4 +
 7 files changed, 285 insertions(+), 2 deletions(-)

diff --git a/tools/flask/policy/modules/xen.if b/tools/flask/policy/modules/xen.if
index 5e2aa472b6..2e2303d684 100644
--- a/tools/flask/policy/modules/xen.if
+++ b/tools/flask/policy/modules/xen.if
@@ -53,7 +53,7 @@ define(`create_domain_common', `
 	allow $1 $2:domain2 { set_cpu_policy settsc setscheduler setclaim
 			set_vnumainfo get_vnumainfo cacheflush
 			psr_cmt_op psr_alloc soft_reset
-			resource_map get_cpu_policy };
+			resource_map get_cpu_policy set_context };
 	allow $1 $2:security check_context;
 	allow $1 $2:shadow enable;
 	allow $1 $2:mmu { map_read map_write adjust memorymap physmap pinpage mmuext_op updatemp };
@@ -97,7 +97,7 @@ define(`migrate_domain_out', `
 	allow $1 $2:hvm { gethvmc getparam };
 	allow $1 $2:mmu { stat pageinfo map_read };
 	allow $1 $2:domain { getaddrsize getvcpucontext pause destroy };
-	allow $1 $2:domain2 gettsc;
+	allow $1 $2:domain2 { gettsc get_context };
 	allow $1 $2:shadow { enable disable logdirty };
 ')
 
diff --git a/tools/libs/ctrl/include/xenctrl.h b/tools/libs/ctrl/include/xenctrl.h
index 3796425e1e..754a00c67b 100644
--- a/tools/libs/ctrl/include/xenctrl.h
+++ b/tools/libs/ctrl/include/xenctrl.h
@@ -867,6 +867,11 @@ int xc_domain_hvm_setcontext(xc_interface *xch,
                              uint8_t *hvm_ctxt,
                              uint32_t size);
 
+int xc_domain_get_context(xc_interface *xch, uint32_t domid,
+                          void *ctxt_buf, size_t *size);
+int xc_domain_set_context(xc_interface *xch, uint32_t domid,
+                          const void *ctxt_buf, size_t size);
+
 /**
  * This function will return guest IO ABI protocol
  *
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index e7cea4a17d..f35c1d2a28 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -536,6 +536,62 @@ int xc_domain_hvm_setcontext(xc_interface *xch,
     return ret;
 }
 
+int xc_domain_get_context(xc_interface *xch, uint32_t domid,
+                          void *ctxt_buf, size_t *size)
+{
+    int ret;
+    DECLARE_DOMCTL = {
+        .cmd = XEN_DOMCTL_get_domain_context,
+        .domain = domid,
+        .u.get_domain_context.size = *size,
+    };
+    DECLARE_HYPERCALL_BOUNCE(ctxt_buf, *size, XC_HYPERCALL_BUFFER_BOUNCE_OUT);
+
+    if ( xc_hypercall_bounce_pre(xch, ctxt_buf) )
+        return -1;
+
+    set_xen_guest_handle(domctl.u.set_domain_context.buffer, ctxt_buf);
+
+    ret = do_domctl(xch, &domctl);
+
+    xc_hypercall_bounce_post(xch, ctxt_buf);
+
+    if ( ret )
+        return ret;
+
+    *size = domctl.u.get_domain_context.size;
+    if ( *size != domctl.u.get_domain_context.size )
+    {
+        errno = EOVERFLOW;
+        return -1;
+    }
+
+    return 0;
+}
+
+int xc_domain_set_context(xc_interface *xch, uint32_t domid,
+                          const void *ctxt_buf, size_t size)
+{
+    int ret;
+    DECLARE_DOMCTL = {
+        .cmd = XEN_DOMCTL_set_domain_context,
+        .domain = domid,
+        .u.set_domain_context.size = size,
+    };
+    DECLARE_HYPERCALL_BOUNCE_IN(ctxt_buf, size);
+
+    if ( xc_hypercall_bounce_pre(xch, ctxt_buf) )
+        return -1;
+
+    set_xen_guest_handle(domctl.u.set_domain_context.buffer, ctxt_buf);
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
index af044e2eda..6dbbe7f08a 100644
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
@@ -273,6 +275,168 @@ static struct vnuma_info *vnuma_init(const struct xen_domctl_vnuma *uinfo,
     return ERR_PTR(ret);
 }
 
+struct domctl_context
+{
+    void *buffer;
+    struct domain_context_record *rec;
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
+static int dry_run_begin(void *priv, const struct domain_context_record *rec)
+{
+    return dry_run_append(priv, NULL, sizeof(*rec));
+}
+
+static int dry_run_end(void *priv, size_t len)
+{
+    struct domctl_context *c = priv;
+
+    ASSERT(IS_ALIGNED(c->len, DOMAIN_CONTEXT_RECORD_ALIGN));
+
+    return 0;
+}
+
+static struct domain_save_ctxt_ops dry_run_ops = {
+    .begin = dry_run_begin,
+    .append = dry_run_append,
+    .end = dry_run_end,
+};
+
+static int save_begin(void *priv, const struct domain_context_record *rec)
+{
+    struct domctl_context *c = priv;
+
+    ASSERT(IS_ALIGNED(c->cur, DOMAIN_CONTEXT_RECORD_ALIGN));
+
+    if ( c->len - c->cur < sizeof(*rec) )
+        return -ENOSPC;
+
+    c->rec = c->buffer + c->cur; /* stash pointer to record */
+    *c->rec = *rec;
+
+    c->cur += sizeof(*rec);
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
+    c->rec->length = len;
+
+    return 0;
+}
+
+static struct domain_save_ctxt_ops save_ops = {
+    .begin = save_begin,
+    .append = save_append,
+    .end = save_end,
+};
+
+static int get_domain_context(struct domain *d,
+                              struct xen_domctl_get_domain_context *gdc)
+{
+    struct domctl_context c = { .buffer = ZERO_BLOCK_PTR };
+    int rc;
+
+    if ( d == current->domain )
+        return -EPERM;
+
+    if ( guest_handle_is_null(gdc->buffer) ) /* query for buffer size */
+    {
+        if ( gdc->size )
+            return -EINVAL;
+
+        /* dry run to acquire buffer size */
+        rc = domain_save_ctxt(d, &dry_run_ops, &c, true);
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
+    rc = domain_save_ctxt(d, &save_ops, &c, false);
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
+static struct domain_load_ctxt_ops load_ops = {
+    .read = load_read,
+};
+
+static int set_domain_context(struct domain *d,
+                              const struct xen_domctl_set_domain_context *sdc)
+{
+    struct domctl_context c = { .buffer = ZERO_BLOCK_PTR, .len = sdc->size };
+    int rc;
+
+    if ( d == current->domain )
+        return -EPERM;
+
+    c.buffer = vmalloc(c.len);
+    if ( !c.buffer )
+        return -ENOMEM;
+
+    rc = !copy_from_guest(c.buffer, sdc->buffer, c.len) ?
+        domain_load_ctxt(d, &load_ops, &c) : -EFAULT;
+
+    vfree(c.buffer);
+
+    return rc;
+}
+
 long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
     long ret = 0;
@@ -867,6 +1031,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             copyback = 1;
         break;
 
+    case XEN_DOMCTL_get_domain_context:
+        ret = get_domain_context(d, &op->u.get_domain_context);
+        copyback = !ret;
+        break;
+
+    case XEN_DOMCTL_set_domain_context:
+        ret = set_domain_context(d, &op->u.set_domain_context);
+        break;
+
     default:
         ret = arch_do_domctl(op, d, u_domctl);
         break;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 666aeb71bf..a3e10c03f1 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1132,6 +1132,41 @@ struct xen_domctl_vuart_op {
                                  */
 };
 
+/*
+ * XEN_DOMCTL_get_domain_context
+ * -----------------------------
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
+struct xen_domctl_get_domain_context {
+    uint64_t size;
+    XEN_GUEST_HANDLE_64(void) buffer;
+};
+
+/* XEN_DOMCTL_set_domain_context
+ * -----------------------------
+ *
+ * buffer (IN):   The buffer from which the context data should be
+ *                copied.
+ * size (IN):     The size of the buffer from which data may be copied.
+ *                This data must include DOMAIN_SAVE_CODE_HEADER at the
+ *                start and terminate with a DOMAIN_SAVE_CODE_END record.
+ *                Any data beyond the DOMAIN_SAVE_CODE_END record will be
+ *                ignored.
+ */
+struct xen_domctl_set_domain_context {
+    uint64_t size;
+    XEN_GUEST_HANDLE_64(const_void) buffer;
+};
+
 struct xen_domctl {
     uint32_t cmd;
 #define XEN_DOMCTL_createdomain                   1
@@ -1216,6 +1251,8 @@ struct xen_domctl {
 #define XEN_DOMCTL_vuart_op                      81
 #define XEN_DOMCTL_get_cpu_policy                82
 #define XEN_DOMCTL_set_cpu_policy                83
+#define XEN_DOMCTL_get_domain_context            84
+#define XEN_DOMCTL_set_domain_context            85
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1276,6 +1313,8 @@ struct xen_domctl {
         struct xen_domctl_monitor_op        monitor_op;
         struct xen_domctl_psr_alloc         psr_alloc;
         struct xen_domctl_vuart_op          vuart_op;
+        struct xen_domctl_get_domain_context get_domain_context;
+        struct xen_domctl_set_domain_context set_domain_context;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index de050cc9fe..3c6217e4ac 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -754,6 +754,12 @@ static int flask_domctl(struct domain *d, int cmd)
     case XEN_DOMCTL_get_cpu_policy:
         return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__GET_CPU_POLICY);
 
+    case XEN_DOMCTL_set_domain_context:
+        return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__SET_CONTEXT);
+
+    case XEN_DOMCTL_get_domain_context:
+        return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__GET_CONTEXT);
+
     default:
         return avc_unknown_permission("domctl", cmd);
     }
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index 1aa0bb501c..fea0c9f143 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -245,6 +245,10 @@ class domain2
     resource_map
 # XEN_DOMCTL_get_cpu_policy
     get_cpu_policy
+# XEN_DOMCTL_set_domain_context
+    set_context
+# XEN_DOMCTL_get_domain_context
+    get_context
 }
 
 # Similar to class domain, but primarily contains domctls related to HVM domains
-- 
2.20.1


