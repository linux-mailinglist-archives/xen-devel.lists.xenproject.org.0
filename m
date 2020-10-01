Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A85127FB32
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 10:15:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101.3613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNtk2-0000jc-0P; Thu, 01 Oct 2020 08:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101.3613; Thu, 01 Oct 2020 08:15:05 +0000
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
	id 1kNtk1-0000jD-T7; Thu, 01 Oct 2020 08:15:05 +0000
Received: by outflank-mailman (input) for mailman id 1101;
 Thu, 01 Oct 2020 08:15:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q5fG=DI=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kNtk0-0000j7-GE
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 08:15:04 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 332a8b70-41db-4a28-b8c9-7bb8836f2e7d;
 Thu, 01 Oct 2020 08:15:03 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kNtjy-0008NO-IX; Thu, 01 Oct 2020 08:15:02 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kNtjy-000244-8G; Thu, 01 Oct 2020 08:15:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=q5fG=DI=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kNtk0-0000j7-GE
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 08:15:04 +0000
X-Inumbo-ID: 332a8b70-41db-4a28-b8c9-7bb8836f2e7d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 332a8b70-41db-4a28-b8c9-7bb8836f2e7d;
	Thu, 01 Oct 2020 08:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=FbjlksMu36p7p6zRsPPG2Wo7gSzgDilHr5PW/goywzg=; b=hilq0i
	uzkQAjHMtDMOkBwWo43MPEvjvYipGJgep2B5L2FmfnfwnZK9wyo3jCx9MuD6NGa9UJZuERGXmP8g0
	piILENWxKcwz26eM2X+AzCU2pc07uAvKWdcBEIdS+hvVRF0qI/NiSS8s8crDlSaXGmG/lmc2naT89
	7Q8NQ2jNLK8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kNtjy-0008NO-IX; Thu, 01 Oct 2020 08:15:02 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kNtjy-000244-8G; Thu, 01 Oct 2020 08:15:02 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org,
	qemu-devel@nongnu.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Jerome Leseinne <jerome.leseinne@gmail.com>,
	Edwin Torok <edvin.torok@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: [PATCH v2] xen-bus: reduce scope of backend watch
Date: Thu,  1 Oct 2020 09:15:00 +0100
Message-Id: <20201001081500.1026-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

v2:
 - Re-work casting
 - Check for a NULL watch before trying to remove it
---
 hw/xen/xen-backend.c         | 11 ++++++++++
 hw/xen/xen-bus.c             | 40 ++++++++++++++++++++++++++++--------
 include/hw/xen/xen-backend.h |  1 +
 include/hw/xen/xen-bus.h     |  3 ++-
 4 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/hw/xen/xen-backend.c b/hw/xen/xen-backend.c
index 10199fb58d..5b0fb76eae 100644
--- a/hw/xen/xen-backend.c
+++ b/hw/xen/xen-backend.c
@@ -41,6 +41,12 @@ static void xen_backend_table_add(XenBackendImpl *impl)
     g_hash_table_insert(xen_backend_table_get(), (void *)impl->type, impl);
 }
 
+static const char **xen_backend_table_keys(unsigned int *count)
+{
+    return (const char **)g_hash_table_get_keys_as_array(
+        xen_backend_table_get(), count);
+}
+
 static const XenBackendImpl *xen_backend_table_lookup(const char *type)
 {
     return g_hash_table_lookup(xen_backend_table_get(), type);
@@ -70,6 +76,11 @@ void xen_backend_register(const XenBackendInfo *info)
     xen_backend_table_add(impl);
 }
 
+const char **xen_backend_get_types(unsigned int *count)
+{
+    return xen_backend_table_keys(count);
+}
+
 static QLIST_HEAD(, XenBackendInstance) backend_list;
 
 static void xen_backend_list_add(XenBackendInstance *backend)
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 9ce1c9540b..8c588920d9 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -430,7 +430,15 @@ static void xen_bus_unrealize(BusState *bus)
     trace_xen_bus_unrealize();
 
     if (xenbus->backend_watch) {
-        xen_bus_remove_watch(xenbus, xenbus->backend_watch, NULL);
+        unsigned int i;
+
+        for (i = 0; i < xenbus->backend_types; i++) {
+            if (xenbus->backend_watch[i]) {
+                xen_bus_remove_watch(xenbus, xenbus->backend_watch[i], NULL);
+            }
+        }
+
+        g_free(xenbus->backend_watch);
         xenbus->backend_watch = NULL;
     }
 
@@ -446,8 +454,11 @@ static void xen_bus_unrealize(BusState *bus)
 
 static void xen_bus_realize(BusState *bus, Error **errp)
 {
+    char *key = g_strdup_printf("%u", xen_domid);
     XenBus *xenbus = XEN_BUS(bus);
     unsigned int domid;
+    const char **type;
+    unsigned int i;
     Error *local_err = NULL;
 
     trace_xen_bus_realize();
@@ -469,19 +480,32 @@ static void xen_bus_realize(BusState *bus, Error **errp)
 
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


