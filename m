Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMYgCveLqWl3/AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:58:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93325212DFB
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:58:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246747.1545867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy9DK-0004s5-H2; Thu, 05 Mar 2026 13:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246747.1545867; Thu, 05 Mar 2026 13:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy9DK-0004ln-Av; Thu, 05 Mar 2026 13:58:06 +0000
Received: by outflank-mailman (input) for mailman id 1246747;
 Thu, 05 Mar 2026 13:58:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y0Pc=BF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vy98K-00008m-OP
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 13:52:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bbd47c8-189a-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 14:52:54 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E26253F8B7;
 Thu,  5 Mar 2026 13:52:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD3CA3EA68;
 Thu,  5 Mar 2026 13:52:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jhIiLbWKqWkWTwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 05 Mar 2026 13:52:53 +0000
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
X-Inumbo-ID: 9bbd47c8-189a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772718774; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OVzJ3vkzk9Kd/2UKnmB2k8cly65avjJkTaC6JZd+bg8=;
	b=iKGXaH4Yp+kB1FiF6PRKGT2+/U1JBirZdLjmovQ8VwqOXgUSAPvePz1hqJ/UmwX53A0wfo
	cc8MYRfeXMocMiiSMH6DQNZnpNKAQr3eH/UXAtKe5Bz+sklgRvztjHfxqVlYcmiHz6MHAf
	xXkvIen6QoIVh2dIVwiGWgKWkoWAjAs=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772718773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OVzJ3vkzk9Kd/2UKnmB2k8cly65avjJkTaC6JZd+bg8=;
	b=U+3yZC/uzXKjWhzK8thLKyTThh9gbe3VUgm/crOtHn49WnU6SlfsqSuXs4zWhbdI4d5Bkg
	5E7mTdTRdJBAMHxM/sESqw/kvWlT5NGPcKq6bfLxKiM82/x+SIiGLawDUL1hXJCtG6mjwG
	RfX7PD9+RxFFkgh7YFXc8RRLry9O1L4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 08/11] tools/libxl: add functions for retrieving and setting xenstore quota
Date: Thu,  5 Mar 2026 14:52:05 +0100
Message-ID: <20260305135208.2208663-9-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305135208.2208663-1-jgross@suse.com>
References: <20260305135208.2208663-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.79
X-Spam-Level: 
X-Rspamd-Queue-Id: 93325212DFB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:enr0n@ubuntu.com,m:gwd@xenproject.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo,xc.name:url];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Add some functions allowing to retrieve and set Xenstore quota (either
global or domain specific).

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/golang/xenlight/helpers.gen.go |  78 ++++++++++++++++++++
 tools/golang/xenlight/types.gen.go   |   9 +++
 tools/include/libxl.h                |  20 ++++++
 tools/libs/light/Makefile            |   1 +
 tools/libs/light/libxl_types.idl     |   9 +++
 tools/libs/light/libxl_xsquota.c     | 102 +++++++++++++++++++++++++++
 6 files changed, 219 insertions(+)
 create mode 100644 tools/libs/light/libxl_xsquota.c

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 8909fe8a1b..6c9af904c5 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -998,6 +998,84 @@ xc.policy = C.libxl_rdm_reserve_policy(x.Policy)
  return nil
  }
 
+// NewXsQuotaItem returns an instance of XsQuotaItem initialized with defaults.
+func NewXsQuotaItem() (*XsQuotaItem, error) {
+var (
+x XsQuotaItem
+xc C.libxl_xs_quota_item)
+
+C.libxl_xs_quota_item_init(&xc)
+defer C.libxl_xs_quota_item_dispose(&xc)
+
+if err := x.fromC(&xc); err != nil {
+return nil, err }
+
+return &x, nil}
+
+func (x *XsQuotaItem) fromC(xc *C.libxl_xs_quota_item) error {
+ x.Name = C.GoString(xc.name)
+x.Val = uint32(xc.val)
+
+ return nil}
+
+func (x *XsQuotaItem) toC(xc *C.libxl_xs_quota_item) (err error){defer func(){
+if err != nil{
+C.libxl_xs_quota_item_dispose(xc)}
+}()
+
+if x.Name != "" {
+xc.name = C.CString(x.Name)}
+xc.val = C.uint32_t(x.Val)
+
+ return nil
+ }
+
+// NewXsQuotaSet returns an instance of XsQuotaSet initialized with defaults.
+func NewXsQuotaSet() (*XsQuotaSet, error) {
+var (
+x XsQuotaSet
+xc C.libxl_xs_quota_set)
+
+C.libxl_xs_quota_set_init(&xc)
+defer C.libxl_xs_quota_set_dispose(&xc)
+
+if err := x.fromC(&xc); err != nil {
+return nil, err }
+
+return &x, nil}
+
+func (x *XsQuotaSet) fromC(xc *C.libxl_xs_quota_set) error {
+ x.Quota = nil
+if n := int(xc.num_quota); n > 0 {
+cQuota := (*[1<<28]C.libxl_xs_quota_item)(unsafe.Pointer(xc.quota))[:n:n]
+x.Quota = make([]XsQuotaItem, n)
+for i, v := range cQuota {
+if err := x.Quota[i].fromC(&v); err != nil {
+return fmt.Errorf("converting field Quota: %v", err) }
+}
+}
+
+ return nil}
+
+func (x *XsQuotaSet) toC(xc *C.libxl_xs_quota_set) (err error){defer func(){
+if err != nil{
+C.libxl_xs_quota_set_dispose(xc)}
+}()
+
+if numQuota := len(x.Quota); numQuota > 0 {
+xc.quota = (*C.libxl_xs_quota_item)(C.malloc(C.ulong(numQuota)*C.sizeof_libxl_xs_quota_item))
+xc.num_quota = C.int(numQuota)
+cQuota := (*[1<<28]C.libxl_xs_quota_item)(unsafe.Pointer(xc.quota))[:numQuota:numQuota]
+for i,v := range x.Quota {
+if err := v.toC(&cQuota[i]); err != nil {
+return fmt.Errorf("converting field Quota: %v", err)
+}
+}
+}
+
+ return nil
+ }
+
 // NewDomainBuildInfo returns an instance of DomainBuildInfo initialized with defaults.
 func NewDomainBuildInfo(dtype DomainType) (*DomainBuildInfo, error) {
 var (
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index ab9d4ca7b4..5393277190 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -543,6 +543,15 @@ Altp2MModeExternal Altp2MMode = 2
 Altp2MModeLimited Altp2MMode = 3
 )
 
+type XsQuotaItem struct {
+Name string
+Val uint32
+}
+
+type XsQuotaSet struct {
+Quota []XsQuotaItem
+}
+
 type DomainBuildInfo struct {
 MaxVcpus int
 AvailVcpus Bitmap
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index bc35e412da..a70d9d347f 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1537,6 +1537,18 @@ void libxl_mac_copy(libxl_ctx *ctx, libxl_mac *dst, const libxl_mac *src);
  */
 #define LIBXL_HAVE_XEN_PLATFORM_PCI_BAR_UC
 
+/*
+ * LIBXL_HAVE_XENSTORE_QUOTA
+ *
+ * If this is defined the Xenstore quota related functions
+ * libxl_xsquota_global_get()
+ * libxl_xsquota_global_set()
+ * libxl_xsquota_domain_get()
+ * libxl_xsquota_domain_set()
+ * are available.
+ */
+#define LIBXL_HAVE_XENSTORE_QUOTA
+
 typedef char **libxl_string_list;
 void libxl_string_list_dispose(libxl_string_list *sl);
 int libxl_string_list_length(const libxl_string_list *sl);
@@ -3011,6 +3023,14 @@ static inline int libxl_qemu_monitor_command_0x041200(libxl_ctx *ctx,
 #define libxl_qemu_monitor_command libxl_qemu_monitor_command_0x041200
 #endif
 
+/* Get/set global and per-domain Xenstore quota. */
+int libxl_xsquota_global_get(libxl_ctx *ctx, libxl_xs_quota_set *q);
+int libxl_xsquota_global_set(libxl_ctx *ctx, libxl_xs_quota_set *q);
+int libxl_xsquota_domain_get(libxl_ctx *ctx, uint32_t domid,
+                             libxl_xs_quota_set *q);
+int libxl_xsquota_domain_set(libxl_ctx *ctx, uint32_t domid,
+                             libxl_xs_quota_set *q);
+
 #include <libxl_event.h>
 
 /*
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index bc60c46558..ca22a40c6c 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -106,6 +106,7 @@ OBJS-y += libxl_pvcalls.o
 OBJS-y += libxl_vsnd.o
 OBJS-y += libxl_vkb.o
 OBJS-y += libxl_virtio.o
+OBJS-y += libxl_xsquota.o
 OBJS-y += libxl_genid.o
 OBJS-y += _libxl_types.o
 OBJS-y += libxl_flask.o
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index d64a573ff3..c5ddc40f35 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -574,6 +574,15 @@ libxl_altp2m_mode = Enumeration("altp2m_mode", [
     (3, "limited"),
     ], init_val = "LIBXL_ALTP2M_MODE_DISABLED")
 
+libxl_xs_quota_item = Struct("xs_quota_item", [
+    ("name", string),
+    ("val",  uint32),
+    ])
+
+libxl_xs_quota_set = Struct("xs_quota_set", [
+    ("quota", Array(libxl_xs_quota_item, "num_quota"))
+    ])
+
 libxl_domain_build_info = Struct("domain_build_info",[
     ("max_vcpus",       integer),
     ("avail_vcpus",     libxl_bitmap),
diff --git a/tools/libs/light/libxl_xsquota.c b/tools/libs/light/libxl_xsquota.c
new file mode 100644
index 0000000000..b9afa1c914
--- /dev/null
+++ b/tools/libs/light/libxl_xsquota.c
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: LGPL-2.1-only */
+
+/* Xenstore quota handling functions. */
+
+#include "libxl_internal.h"
+
+static int get_quota(libxl_ctx *ctx, unsigned int domid, libxl_xs_quota_set *q,
+                     bool (func)(struct xs_handle *h, unsigned int domid,
+                                 char *quota, unsigned int *value))
+{
+    char **names;
+    unsigned int num, i;
+    int rc = 0;
+    GC_INIT(ctx);
+
+    names = xs_get_quota_names(ctx->xsh, &num);
+    if (!names) {
+        /* Xenstore quota support is optional! */
+        if (errno != ENOSYS)
+            rc = ERROR_FAIL;
+        q->num_quota = 0;
+        goto out;
+    }
+
+    q->num_quota = num;
+    q->quota = libxl__calloc(NOGC, num, sizeof(*q->quota));
+    for (i = 0; i < num; i++) {
+        q->quota[i].name = libxl__strdup(NOGC, names[i]);
+        if (!func(ctx->xsh, domid, q->quota[i].name, &q->quota[i].val)) {
+            libxl_xs_quota_set_dispose(q);
+            rc = ERROR_FAIL;
+            break;
+        }
+    }
+
+    free(names);
+
+ out:
+    GC_FREE;
+    return rc;
+}
+
+static int set_quota(libxl_ctx *ctx, unsigned int domid, libxl_xs_quota_set *q,
+                     bool (func)(struct xs_handle *h, unsigned int domid,
+                                 char *quota, unsigned int value))
+{
+    unsigned int i;
+    int rc = 0;
+    GC_INIT(ctx);
+
+    for (i = 0; i < q->num_quota; i++) {
+        if (!func(ctx->xsh, domid, q->quota[i].name, q->quota[i].val)) {
+            rc = ERROR_FAIL;
+            break;
+        }
+    }
+
+    GC_FREE;
+    return rc;
+}
+
+static bool get_global_quota(struct xs_handle *h, unsigned int domid,
+                             char *quota, unsigned int *value)
+{
+    return xs_get_global_quota(h, quota, value);
+}
+
+int libxl_xsquota_global_get(libxl_ctx *ctx, libxl_xs_quota_set *q)
+{
+    return get_quota(ctx, 0, q, get_global_quota);
+}
+
+static bool set_global_quota(struct xs_handle *h, unsigned int domid,
+                             char *quota, unsigned int value)
+{
+    return xs_set_global_quota(h, quota, value);
+}
+
+int libxl_xsquota_global_set(libxl_ctx *ctx, libxl_xs_quota_set *q)
+{
+    return set_quota(ctx, 0, q, set_global_quota);;
+}
+
+int libxl_xsquota_domain_get(libxl_ctx *ctx, uint32_t domid,
+                             libxl_xs_quota_set *q)
+{
+    return get_quota(ctx, domid, q, xs_get_domain_quota);
+}
+
+int libxl_xsquota_domain_set(libxl_ctx *ctx, uint32_t domid,
+                             libxl_xs_quota_set *q)
+{
+    return set_quota(ctx, domid, q, xs_set_domain_quota);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.53.0


