Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB63275C9F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 17:58:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL79F-0006m0-ET; Wed, 23 Sep 2020 15:57:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HYc3=DA=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kL79E-0006lv-1F
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 15:57:36 +0000
X-Inumbo-ID: 6dba7af9-47b2-40a8-9324-867fde384eb0
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6dba7af9-47b2-40a8-9324-867fde384eb0;
 Wed, 23 Sep 2020 15:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From; bh=IoG8+u5DO3QTJ8mTEeCRhU9y1whcnebb+jEmucWmQMM=; b=loko2s
 DO/2tVDvNW6Zm+rjDG09IjiEI2ZvTLljwR8NnUILuFC3rJhcsmKdqbQ6q/GBoZPZ/FWJ7VmeBlpKi
 PMzsStxiE1y6YQAiq+1n2SYXexHE4/LD24AtmcQfChLTajUl21ZRqSbTYIHOh1hs5ZMl0O+QtuA8a
 oFR6CmAvYzs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kL79B-0005sh-T6; Wed, 23 Sep 2020 15:57:33 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kL79B-0003sW-G2; Wed, 23 Sep 2020 15:57:33 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org,
	qemu-devel@nongnu.org
Cc: Paul Durrant <pdurrant@amazon.com>,
 Jerome Leseinne <jerome.leseinne@gmail.com>,
 Edwin Torok <edvin.torok@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
Subject: [PATCH] xen-bus: reduce scope of backend watch
Date: Wed, 23 Sep 2020 16:57:31 +0100
Message-Id: <20200923155731.29528-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

Currently a single watch on /local/domain/X/backend is registered by each
QEMU process running in service domain X (where X is usually 0). The purpose
of this watch is to ensure that QEMU is notified when the Xen toolstack
creates a new device backend area.
Such a backend area is specific to a single frontend area created for a
specific guest domain and, since each QEMU process is also created to service
a specfic guest domain, it is unnecessary and inefficient to notify all QEMU
processes.
Only the QEMU process associated with the same guest domain need
receive the notification. This patch re-factors the watch registration code
such that notifications are targetted appropriately.

Reported-by: Jerome Leseinne <jerome.leseinne@gmail.com>
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Edwin Torok <edvin.torok@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
---
 hw/xen/xen-backend.c         | 10 ++++++++++
 hw/xen/xen-bus.c             | 38 ++++++++++++++++++++++++++++--------
 include/hw/xen/xen-backend.h |  1 +
 include/hw/xen/xen-bus.h     |  3 ++-
 4 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/hw/xen/xen-backend.c b/hw/xen/xen-backend.c
index 10199fb58d..f2711fe4a7 100644
--- a/hw/xen/xen-backend.c
+++ b/hw/xen/xen-backend.c
@@ -41,6 +41,11 @@ static void xen_backend_table_add(XenBackendImpl *impl)
     g_hash_table_insert(xen_backend_table_get(), (void *)impl->type, impl);
 }
 
+static void **xen_backend_table_keys(unsigned int *count)
+{
+    return g_hash_table_get_keys_as_array(xen_backend_table_get(), count);
+}
+
 static const XenBackendImpl *xen_backend_table_lookup(const char *type)
 {
     return g_hash_table_lookup(xen_backend_table_get(), type);
@@ -70,6 +75,11 @@ void xen_backend_register(const XenBackendInfo *info)
     xen_backend_table_add(impl);
 }
 
+const char **xen_backend_get_types(unsigned int *count)
+{
+    return (const char **)xen_backend_table_keys(count);
+}
+
 static QLIST_HEAD(, XenBackendInstance) backend_list;
 
 static void xen_backend_list_add(XenBackendInstance *backend)
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 9ce1c9540b..c83da93bf3 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -430,7 +430,13 @@ static void xen_bus_unrealize(BusState *bus)
     trace_xen_bus_unrealize();
 
     if (xenbus->backend_watch) {
-        xen_bus_remove_watch(xenbus, xenbus->backend_watch, NULL);
+        unsigned int i;
+
+        for (i = 0; i < xenbus->backend_types; i++) {
+            xen_bus_remove_watch(xenbus, xenbus->backend_watch[i], NULL);
+        }
+
+        g_free(xenbus->backend_watch);
         xenbus->backend_watch = NULL;
     }
 
@@ -446,8 +452,11 @@ static void xen_bus_unrealize(BusState *bus)
 
 static void xen_bus_realize(BusState *bus, Error **errp)
 {
+    char *key = g_strdup_printf("%u", xen_domid);
     XenBus *xenbus = XEN_BUS(bus);
     unsigned int domid;
+    const char **type;
+    unsigned int i;
     Error *local_err = NULL;
 
     trace_xen_bus_realize();
@@ -469,19 +478,32 @@ static void xen_bus_realize(BusState *bus, Error **errp)
 
     module_call_init(MODULE_INIT_XEN_BACKEND);
 
-    xenbus->backend_watch =
-        xen_bus_add_watch(xenbus, "", /* domain root node */
-                          "backend", xen_bus_backend_changed, &local_err);
-    if (local_err) {
-        /* This need not be treated as a hard error so don't propagate */
-        error_reportf_err(local_err,
-                          "failed to set up enumeration watch: ");
+    type = xen_backend_get_types(&xenbus->backend_types);
+    xenbus->backend_watch = g_new(XenWatch *, xenbus->backend_types);
+
+    for (i = 0; i < xenbus->backend_types; i++) {
+        char *node = g_strdup_printf("backend/%s", type[i]);
+
+        xenbus->backend_watch[i] =
+            xen_bus_add_watch(xenbus, node, key, xen_bus_backend_changed,
+                              &local_err);
+        if (local_err) {
+            /* This need not be treated as a hard error so don't propagate */
+            error_reportf_err(local_err,
+                              "failed to set up '%s' enumeration watch: ",
+                              type[i]);
+        }
+
+        g_free(node);
     }
 
+    g_free(type);
+    g_free(key);
     return;
 
 fail:
     xen_bus_unrealize(bus);
+    g_free(key);
 }
 
 static void xen_bus_unplug_request(HotplugHandler *hotplug,
diff --git a/include/hw/xen/xen-backend.h b/include/hw/xen/xen-backend.h
index 010d712638..aac2fd454d 100644
--- a/include/hw/xen/xen-backend.h
+++ b/include/hw/xen/xen-backend.h
@@ -31,6 +31,7 @@ void xen_backend_set_device(XenBackendInstance *backend,
 XenDevice *xen_backend_get_device(XenBackendInstance *backend);
 
 void xen_backend_register(const XenBackendInfo *info);
+const char **xen_backend_get_types(unsigned int *nr);
 
 void xen_backend_device_create(XenBus *xenbus, const char *type,
                                const char *name, QDict *opts, Error **errp);
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 3df696136f..6bdbf3ff82 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -66,7 +66,8 @@ struct XenBus {
     domid_t backend_id;
     struct xs_handle *xsh;
     XenWatchList *watch_list;
-    XenWatch *backend_watch;
+    unsigned int backend_types;
+    XenWatch **backend_watch;
     QLIST_HEAD(, XenDevice) inactive_devices;
 };
 
-- 
2.20.1


