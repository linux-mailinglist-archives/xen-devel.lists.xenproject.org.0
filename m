Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7209D7CFE8A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 17:44:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619482.964638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVCT-0004Uv-DQ; Thu, 19 Oct 2023 15:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619482.964638; Thu, 19 Oct 2023 15:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVCT-0004OS-6k; Thu, 19 Oct 2023 15:44:41 +0000
Received: by outflank-mailman (input) for mailman id 619482;
 Thu, 19 Oct 2023 15:44:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m+UH=GB=desiato.srs.infradead.org=BATV+298c059cf2aa39b7dc34+7361+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qtV8y-0006dc-CA
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 15:41:04 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e77ac9a3-6e95-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 17:41:01 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qtV8O-009yCs-0P; Thu, 19 Oct 2023 15:40:28 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qtV8M-000PuW-24; Thu, 19 Oct 2023 16:40:26 +0100
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
X-Inumbo-ID: e77ac9a3-6e95-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=MzyeUS8+Q6DyGG1BYkZOM8Vo8wKa2UEntgjHbKC7sqQ=; b=lZba3Mv1zHO4kaMfOaXiCwtb+O
	wkslMdOA/sxcZ8z+TsvaxomvGGtAfw1gSBhna7Jmba1Z8fUOvcSarzhanIcn0e789VCRxX7PfZbfJ
	FB6Vjrn1KH0rWBXo62DIX99QdNvCwAwRMahWDqtC+8HlZeGFUKNRDMUhDDeQUCArM25zXmW3o98Kz
	93esbTShMa3BYKGQVUXv0Wlw6wxw91TwPUFTxJh3oQECcSs/18SJbwD5uHupEmtFRjTEwiRLJIfe0
	5CwpZMOWYOyJStEA1vn17LINb/uXQXJ1+at1fqvaTGKQ2Irh6EIqN8fbpep94f/Aywl2/mEG+C2sr
	OOmZoFVQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Bernhard Beschow <shentey@gmail.com>,
	Joel Upham <jupham125@gmail.com>
Subject: [PATCH v2 13/24] hw/xen: do not repeatedly try to create a failing backend device
Date: Thu, 19 Oct 2023 16:40:09 +0100
Message-Id: <20231019154020.99080-14-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019154020.99080-1-dwmw2@infradead.org>
References: <20231019154020.99080-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

If xen_backend_device_create() fails to instantiate a device, the XenBus
code will just keep trying over and over again each time the bus is
re-enumerated, as long as the backend appears online and in
XenbusStateInitialising.

The only thing which prevents the XenBus code from recreating duplicates
of devices which already exist, is the fact that xen_device_realize()
sets the backend state to XenbusStateInitWait. If the attempt to create
the device doesn't get *that* far, that's when it will keep getting
retried.

My first thought was to handle errors by setting the backend state to
XenbusStateClosed, but that doesn't work for XenConsole which wants to
*ignore* any device of type != "ioemu" completely.

So, make xen_backend_device_create() *keep* the XenBackendInstance for a
failed device, and provide a new xen_backend_exists() function to allow
xen_bus_type_enumerate() to check whether one already exists before
creating a new one.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/xen/xen-backend.c         | 27 +++++++++++++++++++++------
 hw/xen/xen-bus.c             |  3 ++-
 include/hw/xen/xen-backend.h |  1 +
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/hw/xen/xen-backend.c b/hw/xen/xen-backend.c
index 5b0fb76eae..b9bf70a9f5 100644
--- a/hw/xen/xen-backend.c
+++ b/hw/xen/xen-backend.c
@@ -101,6 +101,24 @@ static XenBackendInstance *xen_backend_list_find(XenDevice *xendev)
     return NULL;
 }
 
+bool xen_backend_exists(const char *type, const char *name)
+{
+    const XenBackendImpl *impl = xen_backend_table_lookup(type);
+    XenBackendInstance *backend;
+
+    if (!impl) {
+        return false;
+    }
+
+    QLIST_FOREACH(backend, &backend_list, entry) {
+        if (backend->impl == impl && !strcmp(backend->name, name)) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
 static void xen_backend_list_remove(XenBackendInstance *backend)
 {
     QLIST_REMOVE(backend, entry);
@@ -122,11 +140,6 @@ void xen_backend_device_create(XenBus *xenbus, const char *type,
     backend->name = g_strdup(name);
 
     impl->create(backend, opts, errp);
-    if (*errp) {
-        g_free(backend->name);
-        g_free(backend);
-        return;
-    }
 
     backend->impl = impl;
     xen_backend_list_add(backend);
@@ -165,7 +178,9 @@ bool xen_backend_try_device_destroy(XenDevice *xendev, Error **errp)
     }
 
     impl = backend->impl;
-    impl->destroy(backend, errp);
+    if (backend->xendev) {
+        impl->destroy(backend, errp);
+    }
 
     xen_backend_list_remove(backend);
     g_free(backend->name);
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index cc524ed92c..0da2aa219a 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -209,7 +209,8 @@ static void xen_bus_type_enumerate(XenBus *xenbus, const char *type)
                           NULL, "%u", &online) != 1)
             online = 0;
 
-        if (online && state == XenbusStateInitialising) {
+        if (online && state == XenbusStateInitialising &&
+            !xen_backend_exists(type, backend[i])) {
             Error *local_err = NULL;
 
             xen_bus_backend_create(xenbus, type, backend[i], backend_path,
diff --git a/include/hw/xen/xen-backend.h b/include/hw/xen/xen-backend.h
index aac2fd454d..0f01631ae7 100644
--- a/include/hw/xen/xen-backend.h
+++ b/include/hw/xen/xen-backend.h
@@ -33,6 +33,7 @@ XenDevice *xen_backend_get_device(XenBackendInstance *backend);
 void xen_backend_register(const XenBackendInfo *info);
 const char **xen_backend_get_types(unsigned int *nr);
 
+bool xen_backend_exists(const char *type, const char *name);
 void xen_backend_device_create(XenBus *xenbus, const char *type,
                                const char *name, QDict *opts, Error **errp);
 bool xen_backend_try_device_destroy(XenDevice *xendev, Error **errp);
-- 
2.40.1


