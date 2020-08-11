Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1722417D1
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 10:02:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5PEh-0003wd-RO; Tue, 11 Aug 2020 08:02:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L6lB=BV=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k5PEh-0003tc-5u
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 08:02:19 +0000
X-Inumbo-ID: 279b2850-dbf8-4292-a5a9-cbb1fd60efac
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 279b2850-dbf8-4292-a5a9-cbb1fd60efac;
 Tue, 11 Aug 2020 08:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nc+eSdOT6VBsLMIDsh/OIxsUOynady1C/hs/XmoSJsg=; b=2cn19lo+wmOmZDpc4P0MKJGxov
 bONXxTcc9LuTfH49j8h0a5q+86wboVKstcJWhcboTMY8M+v27UMiogjDlgmMs04eczkO9ACY0a+fd
 zDknOW29XkrHlrGikVLMIdXB8q2Slt7n9R0B80AtDnH4Wo9VliR9glieboA5wuGCILsI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k5PEZ-0003vT-3O; Tue, 11 Aug 2020 08:02:11 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k5PEY-0000k5-RX; Tue, 11 Aug 2020 08:02:11 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 5/8] libxl: wire the libxl_device_nic 'mtu' value into
 xenstore
Date: Tue, 11 Aug 2020 09:01:59 +0100
Message-Id: <20200811080202.31163-6-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200811080202.31163-1-paul@xen.org>
References: <20200811080202.31163-1-paul@xen.org>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

Currently the 'mtu' field of libxl_device_nic objects is effectively ignored:
It is set by libxl__device_nic_setdefault() to a slightly odd default value of
1492 but otherwise ignored.

This patch changes the default value to a more conventional 1500 and modifies
libxl__set_xenstore_nic() to write the value into an 'mtu' node in the
xenstore backend area (if it is a non-default value), as well as a read-only
node of the same name in the frontend area.

The backend node is used to set the value of 'mtu' in
libxl__nic_from_xenstore(), when retrieving the configuration.

NOTE: There is currently no way to set a non-default value of 'mtu', hence
      the backend node is never written. This, however, will be addressed
      by a subsequent patch.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>

v3:
 - New in v3
---
 tools/libxl/libxl_nic.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/tools/libxl/libxl_nic.c b/tools/libxl/libxl_nic.c
index 07880b39e1..0e5d120ae9 100644
--- a/tools/libxl/libxl_nic.c
+++ b/tools/libxl/libxl_nic.c
@@ -53,13 +53,15 @@ int libxl_mac_to_device_nic(libxl_ctx *ctx, uint32_t domid,
     return rc;
 }
 
+#define LIBXL_DEVICE_NIC_MTU_DEFAULT 1500
+
 static int libxl__device_nic_setdefault(libxl__gc *gc, uint32_t domid,
                                         libxl_device_nic *nic, bool hotplug)
 {
     int rc;
 
     if (!nic->mtu)
-        nic->mtu = 1492;
+        nic->mtu = LIBXL_DEVICE_NIC_MTU_DEFAULT;
     if (!nic->model) {
         nic->model = strdup("rtl8139");
         if (!nic->model) return ERROR_NOMEM;
@@ -223,6 +225,11 @@ static int libxl__set_xenstore_nic(libxl__gc *gc, uint32_t domid,
                             nic->rate_interval_usecs));
     }
 
+    if (nic->mtu != LIBXL_DEVICE_NIC_MTU_DEFAULT) {
+        flexarray_append(back, "mtu");
+        flexarray_append(back, GCSPRINTF("%u", nic->mtu));
+    }
+    
     flexarray_append(back, "bridge");
     flexarray_append(back, libxl__strdup(gc, nic->bridge));
     flexarray_append(back, "handle");
@@ -237,6 +244,9 @@ static int libxl__set_xenstore_nic(libxl__gc *gc, uint32_t domid,
     flexarray_append(front, GCSPRINTF(
                                     LIBXL_MAC_FMT, LIBXL_MAC_BYTES(nic->mac)));
 
+    flexarray_append(ro_front, "mtu");
+    flexarray_append(ro_front, GCSPRINTF("%u", nic->mtu));
+
     return 0;
 }
 
@@ -275,7 +285,20 @@ static int libxl__nic_from_xenstore(libxl__gc *gc, const char *libxl_path,
     rc = libxl__backendpath_parse_domid(gc, tmp, &nic->backend_domid);
     if (rc) goto out;
 
-    /* nic->mtu = */
+    rc = libxl__xs_read_checked(gc, XBT_NULL,
+                                GCSPRINTF("%s/mtu", libxl_path), &tmp);
+    if (rc) goto out;
+    if (tmp) {
+        char *endptr;
+
+        nic->mtu = strtol(tmp, &endptr, 10);
+        if (*endptr != '\0') {
+            rc = ERROR_INVAL;
+            goto out;
+        }
+    } else {
+        nic->mtu = LIBXL_DEVICE_NIC_MTU_DEFAULT;
+    }
 
     rc = libxl__xs_read_checked(gc, XBT_NULL,
                                 GCSPRINTF("%s/mac", libxl_path), &tmp);
-- 
2.20.1


