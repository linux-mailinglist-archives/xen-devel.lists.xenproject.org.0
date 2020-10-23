Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A08929739C
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 18:26:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11200.29706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVztY-0000wL-OZ; Fri, 23 Oct 2020 16:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11200.29706; Fri, 23 Oct 2020 16:26:24 +0000
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
	id 1kVztY-0000vi-Ez; Fri, 23 Oct 2020 16:26:24 +0000
Received: by outflank-mailman (input) for mailman id 11200;
 Fri, 23 Oct 2020 16:26:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kVztW-0000v3-JG
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:22 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27f1b87b-7c40-4f94-ba01-9684c636cdd7;
 Fri, 23 Oct 2020 16:26:21 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVztU-0008NS-LH; Fri, 23 Oct 2020 16:26:20 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com
 ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqm-000376-LC; Fri, 23 Oct 2020 16:23:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kVztW-0000v3-JG
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:26:22 +0000
X-Inumbo-ID: 27f1b87b-7c40-4f94-ba01-9684c636cdd7
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 27f1b87b-7c40-4f94-ba01-9684c636cdd7;
	Fri, 23 Oct 2020 16:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=+xRHgG/V1V6jdrFunRi9DByLVqbO+8Hy1Wezh0jszpM=; b=NkS5oRBEuIIoyTRowqey4tbzc
	k7H9ApuLG8+2rlTdwtjzRw9hxVTW+OnH4/Pg22zcQk2rwzYu6fsYNHCztfy2E6OtGo+OKH/KBtXKS
	MKaIjOp5uCu8CKbLbUfSaaiUYgrFO1ijieApbV9Tch6gld8WZWZBkRvQwg40HFvYzyRO4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVztU-0008NS-LH; Fri, 23 Oct 2020 16:26:20 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqm-000376-LC; Fri, 23 Oct 2020 16:23:32 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 15/25] libxl: Make sure devices added by pci-attach are reflected in the config
Date: Fri, 23 Oct 2020 16:23:04 +0000
Message-Id: <20201023162314.2235-16-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201023162314.2235-1-paul@xen.org>
References: <20201023162314.2235-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

Currently libxl__device_pci_add_xenstore() is broken in that does not
update the domain's configuration for the first device added (which causes
creation of the overall backend area in xenstore). This can be easily observed
by running 'xl list -l' after adding a single device: the device will be
missing.

This patch fixes the problem and adds a DEBUG log line to allow easy
verification that the domain configuration is being modified.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_pci.c | 68 +++++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 33 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index c5d73133eb..45685ebec2 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -79,39 +79,18 @@ static void libxl__device_from_pci(libxl__gc *gc, uint32_t domid,
     device->kind = LIBXL__DEVICE_KIND_PCI;
 }
 
-static int libxl__create_pci_backend(libxl__gc *gc, uint32_t domid,
-                                     const libxl_device_pci *pci,
-                                     int num)
+static void libxl__create_pci_backend(libxl__gc *gc, uint32_t domid,
+                                      flexarray_t *front, flexarray_t *back)
 {
-    flexarray_t *front = NULL;
-    flexarray_t *back = NULL;
-    libxl__device device;
-    int i;
-
-    front = flexarray_make(gc, 16, 1);
-    back = flexarray_make(gc, 16, 1);
-
     LOGD(DEBUG, domid, "Creating pci backend");
 
-    /* add pci device */
-    libxl__device_from_pci(gc, domid, pci, &device);
-
     flexarray_append_pair(back, "frontend-id", GCSPRINTF("%d", domid));
-    flexarray_append_pair(back, "online", "1");
+    flexarray_append_pair(back, "online", GCSPRINTF("%d", 1));
     flexarray_append_pair(back, "state", GCSPRINTF("%d", XenbusStateInitialising));
     flexarray_append_pair(back, "domain", libxl__domid_to_name(gc, domid));
 
-    for (i = 0; i < num; i++, pci++)
-        libxl_create_pci_backend_device(gc, back, i, pci);
-
-    flexarray_append_pair(back, "num_devs", GCSPRINTF("%d", num));
     flexarray_append_pair(front, "backend-id", GCSPRINTF("%d", 0));
     flexarray_append_pair(front, "state", GCSPRINTF("%d", XenbusStateInitialising));
-
-    return libxl__device_generic_add(gc, XBT_NULL, &device,
-                                     libxl__xs_kvs_of_flexarray(gc, back),
-                                     libxl__xs_kvs_of_flexarray(gc, front),
-                                     NULL);
 }
 
 static int libxl__device_pci_add_xenstore(libxl__gc *gc,
@@ -119,7 +98,7 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
                                           const libxl_device_pci *pci,
                                           bool starting)
 {
-    flexarray_t *back;
+    flexarray_t *front, *back;
     char *num_devs, *be_path;
     int num = 0;
     xs_transaction_t t = XBT_NULL;
@@ -127,16 +106,22 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
     libxl_domain_config d_config;
     libxl__flock *lock = NULL;
     bool is_stubdomain = libxl_is_stubdom(CTX, domid, NULL);
+    libxl__device device;
+
+    libxl__device_from_pci(gc, domid, pci, &device);
 
     /* Stubdomain doesn't have own config. */
     if (!is_stubdomain)
         libxl_domain_config_init(&d_config);
 
+    front = flexarray_make(gc, 16, 1);
+    back = flexarray_make(gc, 16, 1);
+
     be_path = libxl__domain_device_backend_path(gc, 0, domid, 0,
                                                 LIBXL__DEVICE_KIND_PCI);
     num_devs = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("%s/num_devs", be_path));
     if (!num_devs)
-        return libxl__create_pci_backend(gc, domid, pci, 1);
+        libxl__create_pci_backend(gc, domid, front, back);
 
     libxl_domain_type domtype = libxl__domain_type(gc, domid);
     if (domtype == LIBXL_DOMAIN_TYPE_INVALID)
@@ -147,13 +132,11 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
             return ERROR_FAIL;
     }
 
-    back = flexarray_make(gc, 16, 1);
-
     LOGD(DEBUG, domid, "Adding new pci device to xenstore");
-    num = atoi(num_devs);
+    num = num_devs ? atoi(num_devs) : 0;
     libxl_create_pci_backend_device(gc, back, num, pci);
     flexarray_append_pair(back, "num_devs", GCSPRINTF("%d", num + 1));
-    if (!starting)
+    if (num && !starting)
         flexarray_append_pair(back, "state", GCSPRINTF("%d", XenbusStateReconfiguring));
 
     /*
@@ -170,6 +153,7 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
         rc = libxl__get_domain_configuration(gc, domid, &d_config);
         if (rc) goto out;
 
+        LOGD(DEBUG, domid, "Adding new pci device to config");
         device_add_domain_config(gc, &d_config, &libxl__pci_devtype,
                                  pci);
 
@@ -186,7 +170,10 @@ static int libxl__device_pci_add_xenstore(libxl__gc *gc,
             if (rc) goto out;
         }
 
-        libxl__xs_writev(gc, t, be_path, libxl__xs_kvs_of_flexarray(gc, back));
+        libxl__device_generic_add(gc, t, &device,
+                                  libxl__xs_kvs_of_flexarray(gc, back),
+                                  libxl__xs_kvs_of_flexarray(gc, front),
+                                  NULL);
 
         rc = libxl__xs_transaction_commit(gc, &t);
         if (!rc) break;
@@ -1711,8 +1698,23 @@ static void add_pcis_done(libxl__egc *egc, libxl__multidev *multidev,
     if (rc) goto out;
 
     if (d_config->num_pcis > 0 && !libxl_get_stubdom_id(CTX, domid)) {
-        rc = libxl__create_pci_backend(gc, domid, d_config->pcis,
-                                       d_config->num_pcis);
+        flexarray_t *front, *back;
+        unsigned int i;
+        libxl__device device;
+
+        libxl__device_from_pci(gc, domid, &d_config->pcis[0], &device);
+
+        front = flexarray_make(gc, 16, 1);
+        back = flexarray_make(gc, 16, 1);
+
+        libxl__create_pci_backend(gc, domid, front, back);
+        for (i = 0; i < d_config->num_pcis; i++)
+            libxl_create_pci_backend_device(gc, back, i, &d_config->pcis[i]);
+
+        rc = libxl__device_generic_add(gc, XBT_NULL, &device,
+                                       libxl__xs_kvs_of_flexarray(gc, back),
+                                       libxl__xs_kvs_of_flexarray(gc, front),
+                                       NULL);
         if (rc < 0) {
             LOGD(ERROR, domid, "libxl_create_pci_backend failed: %d", rc);
             goto out;
-- 
2.11.0


