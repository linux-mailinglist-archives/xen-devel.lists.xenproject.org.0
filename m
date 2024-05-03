Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E288BAF22
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 16:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716522.1118712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2u6e-0003Hh-DP; Fri, 03 May 2024 14:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716522.1118712; Fri, 03 May 2024 14:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2u6e-0003Cc-8G; Fri, 03 May 2024 14:41:48 +0000
Received: by outflank-mailman (input) for mailman id 716522;
 Fri, 03 May 2024 14:41:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QA1=MG=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s2u6d-0002U8-80
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 14:41:47 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41cc7177-095b-11ef-909c-e314d9c70b13;
 Fri, 03 May 2024 16:41:44 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id D40B88009E;
 Fri,  3 May 2024 15:41:41 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id A86C020171; Fri,  3 May 2024 15:41:41 +0100 (BST)
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
X-Inumbo-ID: 41cc7177-095b-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1714747301;
	bh=QhPCF+Da6a6rJ80ZqmX2rlEn+1VBdptYD+Uv3wW6YvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vf4ivSKnOtFHHamPhhsa9RrmD62thFAMLYjCSsHRbp37Nr7lydHqxJ+RpEYMfFpkp
	 jQPt019Su7UiiRVXWTHIGlmJcNxnYXK7v95BKn3Wa2c6sQsnyZoVg5LTWFeq1i3K7H
	 7eGqRtT/4a2rfc9rBj1h+D619duHqGPviuoy0Oto=
From: Leigh Brown <leigh@solinno.co.uk>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [RFC PATCH 1/5] tools/libs/light: Add vid field to libxl_device_nic
Date: Fri,  3 May 2024 15:41:20 +0100
Message-Id: <20240503144124.12931-2-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503144124.12931-1-leigh@solinno.co.uk>
References: <20240503144124.12931-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add integer member `vid' to libxl_device_nic, to represent the
VLAN ID to assign to the VIF when adding it to the bridge device.

Update libxl_nic.c to read and write the vid field from the
xenstore.

This provides the capability for supported operating systems (e.g.
Linux) to perform VLAN filtering on bridge ports.  The Xen
hotplug scripts need to be updated to read this information from
then xenstore and perform the required configuration.

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
---
 tools/libs/light/libxl_nic.c     | 20 ++++++++++++++++++++
 tools/libs/light/libxl_types.idl |  1 +
 2 files changed, 21 insertions(+)

diff --git a/tools/libs/light/libxl_nic.c b/tools/libs/light/libxl_nic.c
index d6bf06fc34..e28b9101ee 100644
--- a/tools/libs/light/libxl_nic.c
+++ b/tools/libs/light/libxl_nic.c
@@ -233,6 +233,11 @@ static int libxl__set_xenstore_nic(libxl__gc *gc, uint32_t domid,
         flexarray_append(back, GCSPRINTF("%u", nic->mtu));
     }
     
+    if (nic->vid) {
+        flexarray_append(back, "vid");
+        flexarray_append(back, GCSPRINTF("%u", nic->vid));
+    }
+
     flexarray_append(back, "bridge");
     flexarray_append(back, libxl__strdup(gc, nic->bridge));
     flexarray_append(back, "handle");
@@ -313,6 +318,21 @@ static int libxl__nic_from_xenstore(libxl__gc *gc, const char *libxl_path,
         nic->mtu = LIBXL_DEVICE_NIC_MTU_DEFAULT;
     }
 
+    rc = libxl__xs_read_checked(gc, XBT_NULL,
+                                GCSPRINTF("%s/vid", libxl_path), &tmp);
+    if (rc) goto out;
+    if (tmp) {
+        char *endptr;
+
+        nic->vid = strtol(tmp, &endptr, 10);
+        if (*endptr != '\0') {
+            rc = ERROR_INVAL;
+            goto out;
+        }
+    } else {
+        nic->vid = 0;
+    }
+
     rc = libxl__xs_read_checked(gc, XBT_NULL,
                                 GCSPRINTF("%s/mac", libxl_path), &tmp);
     if (rc) goto out;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 7d8bd5d216..df5185128c 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -809,6 +809,7 @@ libxl_device_nic = Struct("device_nic", [
     ("backend_domname", string),
     ("devid", libxl_devid),
     ("mtu", integer),
+    ("vid", integer),
     ("model", string),
     ("mac", libxl_mac),
     ("ip", string),
-- 
2.39.2


