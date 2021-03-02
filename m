Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6F232A8B3
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 19:03:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92540.174504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH9MG-0001Hw-Jv; Tue, 02 Mar 2021 18:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92540.174504; Tue, 02 Mar 2021 18:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH9MG-0001HU-Em; Tue, 02 Mar 2021 18:02:56 +0000
Received: by outflank-mailman (input) for mailman id 92540;
 Tue, 02 Mar 2021 18:02:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fwSr=IA=yandex-team.ru=lekiravi@srs-us1.protection.inumbo.net>)
 id 1lH9ME-0001A7-Ts
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 18:02:54 +0000
Received: from forwardcorp1j.mail.yandex.net (unknown [5.45.199.163])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8c24938-d4af-468a-956c-64fdb25aed80;
 Tue, 02 Mar 2021 18:02:52 +0000 (UTC)
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id D2EC22E147C;
 Tue,  2 Mar 2021 21:02:50 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 TDVQdUt8yK-2nxSlevm; Tue, 02 Mar 2021 21:02:50 +0300
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8002::1:1a])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 onVeXhLyoo-2mo0IAZV; Tue, 02 Mar 2021 21:02:49 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d8c24938-d4af-468a-956c-64fdb25aed80
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru; s=default;
	t=1614708170; bh=zwxRihApiUbG7mGl+navjv9Er7L50EpwkWcV1QK+m9Q=;
	h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
	b=yJWCVTOdWu9BmJReGKKTJT/SAdTSV9fCDWxKx9ZqMUW9OLADANxuNIGnEf1Zl/i6/
	 nDneQCFqz4pdhkyxzEgLBvrOeRJWTDqy1syBkJRXuupELD+A3h3+yhaND3oUz/EN48
	 8zd2KJg0by/dz99bVtHW91783zWoHlm1Xy2Kgod4=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net; dkim=pass header.i=@yandex-team.ru
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Blake <eblake@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Luigi Rizzo <rizzo@iet.unipi.it>,
	Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
	Vincenzo Maffione <v.maffione@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	qemu-devel@nongnu.org,
	yc-core@yandex-team.ru
Subject: [PATCH v6 4/5] hmp: Use QAPI NetdevInfo in hmp_info_network
Date: Tue,  2 Mar 2021 21:02:04 +0300
Message-Id: <20210302180205.5009-5-lekiravi@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302180205.5009-1-lekiravi@yandex-team.ru>
References: <20210302180205.5009-1-lekiravi@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace usage of legacy field info_str of NetClientState for backend
network devices with QAPI NetdevInfo stored_config that already used
in QMP query-netdev.

This change increases the detail of the "info network" output and takes
a more general approach to composing the output.

NIC and hubports still use legacy info_str field.

Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
---
 include/qapi/hmp-output-visitor.h |  30 +++++
 net/net.c                         |  31 ++++-
 qapi/hmp-output-visitor.c         | 193 ++++++++++++++++++++++++++++++
 qapi/meson.build                  |   1 +
 4 files changed, 254 insertions(+), 1 deletion(-)
 create mode 100644 include/qapi/hmp-output-visitor.h
 create mode 100644 qapi/hmp-output-visitor.c

diff --git a/include/qapi/hmp-output-visitor.h b/include/qapi/hmp-output-visitor.h
new file mode 100644
index 0000000000..541e4002e3
--- /dev/null
+++ b/include/qapi/hmp-output-visitor.h
@@ -0,0 +1,30 @@
+/*
+ * HMP string output Visitor
+ *
+ * Copyright Yandex N.V., 2021
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef HMP_OUTPUT_VISITOR_H
+#define HMP_OUTPUT_VISITOR_H
+
+#include "qapi/visitor.h"
+
+typedef struct HMPOutputVisitor HMPOutputVisitor;
+
+/**
+ * Create a HMP string output visitor for @obj
+ *
+ * Flattens dicts/structures, only shows arrays borders.
+ *
+ * Errors are not expected to happen.
+ *
+ * The caller is responsible for freeing the visitor with
+ * visit_free().
+ */
+Visitor *hmp_output_visitor_new(char **result);
+
+#endif
diff --git a/net/net.c b/net/net.c
index cc83918d80..65b92bbdab 100644
--- a/net/net.c
+++ b/net/net.c
@@ -54,6 +54,7 @@
 #include "sysemu/sysemu.h"
 #include "net/filter.h"
 #include "qapi/string-output-visitor.h"
+#include "qapi/hmp-output-visitor.h"
 
 /* Net bridge is currently not supported for W32. */
 #if !defined(_WIN32)
@@ -1192,14 +1193,42 @@ static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
     monitor_printf(mon, "\n");
 }
 
+static char *generate_info_str(NetClientState *nc)
+{
+    NetdevInfo *ni = nc->stored_config;
+    char *ret_out = NULL;
+    Visitor *v;
+
+    /* Use legacy field info_str for NIC and hubports */
+    if ((nc->info->type == NET_CLIENT_DRIVER_NIC) ||
+        (nc->info->type == NET_CLIENT_DRIVER_HUBPORT)) {
+        return g_strdup(nc->info_str ? nc->info_str : "");
+    }
+
+    if (!ni) {
+        return g_malloc0(1);
+    }
+
+    v = hmp_output_visitor_new(&ret_out);
+    if (visit_type_NetdevInfo(v, "", &ni, NULL)) {
+        visit_complete(v, &ret_out);
+    }
+    visit_free(v);
+
+    return ret_out;
+}
+
 void print_net_client(Monitor *mon, NetClientState *nc)
 {
     NetFilterState *nf;
+    char *info_str = generate_info_str(nc);
 
     monitor_printf(mon, "%s: index=%d,type=%s,%s\n", nc->name,
                    nc->queue_index,
                    NetClientDriver_str(nc->info->type),
-                   nc->info_str ? nc->info_str : "");
+                   info_str);
+    g_free(info_str);
+
     if (!QTAILQ_EMPTY(&nc->filters)) {
         monitor_printf(mon, "filters:\n");
     }
diff --git a/qapi/hmp-output-visitor.c b/qapi/hmp-output-visitor.c
new file mode 100644
index 0000000000..8036605f97
--- /dev/null
+++ b/qapi/hmp-output-visitor.c
@@ -0,0 +1,193 @@
+/*
+ * HMP string output Visitor
+ *
+ * Copyright Yandex N.V., 2021
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "qapi/hmp-output-visitor.h"
+#include "qapi/visitor-impl.h"
+
+struct HMPOutputVisitor {
+    Visitor visitor;
+    char **result;
+    GString *buffer;
+    bool is_continue;
+};
+
+static HMPOutputVisitor *to_hov(Visitor *v)
+{
+    return container_of(v, HMPOutputVisitor, visitor);
+}
+
+static void hmp_output_append_formatted(Visitor *v, const char *fmt, ...)
+{
+    HMPOutputVisitor *ov = to_hov(v);
+    va_list args;
+
+    if (ov->is_continue) {
+        g_string_append(ov->buffer, ",");
+    } else {
+        ov->is_continue = true;
+    }
+
+    va_start(args, fmt);
+    g_string_append_vprintf(ov->buffer, fmt, args);
+    va_end(args);
+}
+
+static void hmp_output_skip_comma(Visitor *v)
+{
+    HMPOutputVisitor *ov = to_hov(v);
+
+    ov->is_continue = false;
+}
+
+static bool hmp_output_start_struct(Visitor *v, const char *name,
+                                    void **obj, size_t unused, Error **errp)
+{
+    return true;
+}
+
+static void hmp_output_end_struct(Visitor *v, void **obj) {}
+
+static bool hmp_output_start_list(Visitor *v, const char *name,
+                                  GenericList **listp, size_t size,
+                                  Error **errp)
+{
+    hmp_output_append_formatted(v, "%s=[", name);
+    /* First element in array without comma before it */
+    hmp_output_skip_comma(v);
+
+    return true;
+}
+
+static GenericList *hmp_output_next_list(Visitor *v, GenericList *tail,
+                                         size_t size)
+{
+    return tail->next;
+}
+
+static void hmp_output_end_list(Visitor *v, void **obj)
+{
+    /* Don't need comma after last array element */
+    hmp_output_skip_comma(v);
+    hmp_output_append_formatted(v, "]");
+}
+
+static bool hmp_output_type_int64(Visitor *v, const char *name,
+                                  int64_t *obj, Error **errp)
+{
+    hmp_output_append_formatted(v, "%s=%" PRId64, name, *obj);
+
+    return true;
+}
+
+static bool hmp_output_type_uint64(Visitor *v, const char *name,
+                                   uint64_t *obj, Error **errp)
+{
+    hmp_output_append_formatted(v, "%s=%" PRIu64, name, *obj);
+
+    return true;
+}
+
+static bool hmp_output_type_bool(Visitor *v, const char *name, bool *obj,
+                                 Error **errp)
+{
+    hmp_output_append_formatted(v, "%s=%s", name, *obj ? "true" : "false");
+
+    return true;
+}
+
+static bool hmp_output_type_str(Visitor *v, const char *name, char **obj,
+                                Error **errp)
+{
+    /* Skip already printed or unused fields */
+    if (!*obj || g_str_equal(name, "id") || g_str_equal(name, "type")) {
+        return true;
+    }
+
+    /* Do not print stub name for StringList elements */
+    if (g_str_equal(name, "str")) {
+        hmp_output_append_formatted(v, "%s", *obj);
+    } else {
+        hmp_output_append_formatted(v, "%s=%s", name, *obj);
+    }
+
+    return true;
+}
+
+static bool hmp_output_type_number(Visitor *v, const char *name,
+                                   double *obj, Error **errp)
+{
+    hmp_output_append_formatted(v, "%s=%.17g", name, *obj);
+
+    return true;
+}
+
+/* TODO: remove this function? */
+static bool hmp_output_type_any(Visitor *v, const char *name,
+                                QObject **obj, Error **errp)
+{
+    return true;
+}
+
+static bool hmp_output_type_null(Visitor *v, const char *name,
+                                 QNull **obj, Error **errp)
+{
+    hmp_output_append_formatted(v, "%s=NULL", name);
+
+    return true;
+}
+
+static void hmp_output_complete(Visitor *v, void *opaque)
+{
+    HMPOutputVisitor *ov = to_hov(v);
+
+    *ov->result = g_string_free(ov->buffer, false);
+    ov->buffer = NULL;
+}
+
+static void hmp_output_free(Visitor *v)
+{
+    HMPOutputVisitor *ov = to_hov(v);
+
+    if (ov->buffer) {
+        g_string_free(ov->buffer, true);
+    }
+    g_free(v);
+}
+
+Visitor *hmp_output_visitor_new(char **result)
+{
+    HMPOutputVisitor *v;
+
+    v = g_malloc0(sizeof(*v));
+
+    v->visitor.type = VISITOR_OUTPUT;
+    v->visitor.start_struct = hmp_output_start_struct;
+    v->visitor.end_struct = hmp_output_end_struct;
+    v->visitor.start_list = hmp_output_start_list;
+    v->visitor.next_list = hmp_output_next_list;
+    v->visitor.end_list = hmp_output_end_list;
+    v->visitor.type_int64 = hmp_output_type_int64;
+    v->visitor.type_uint64 = hmp_output_type_uint64;
+    v->visitor.type_bool = hmp_output_type_bool;
+    v->visitor.type_str = hmp_output_type_str;
+    v->visitor.type_number = hmp_output_type_number;
+    v->visitor.type_any = hmp_output_type_any;
+    v->visitor.type_null = hmp_output_type_null;
+    v->visitor.complete = hmp_output_complete;
+    v->visitor.free = hmp_output_free;
+
+    v->result = result;
+    v->buffer = g_string_new("");
+    v->is_continue = false;
+
+    return &v->visitor;
+}
diff --git a/qapi/meson.build b/qapi/meson.build
index 0652569bc4..94effbc052 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -8,6 +8,7 @@ util_ss.add(files(
   'qobject-output-visitor.c',
   'string-input-visitor.c',
   'string-output-visitor.c',
+  'hmp-output-visitor.c',
 ))
 if have_system or have_tools
   util_ss.add(files(
-- 
2.25.1


