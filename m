Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C16C8C74EB
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:57:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723124.1127689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Yn4-0007xb-Fl; Thu, 16 May 2024 10:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723124.1127689; Thu, 16 May 2024 10:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Yn4-0007vn-Bp; Thu, 16 May 2024 10:56:50 +0000
Received: by outflank-mailman (input) for mailman id 723124;
 Thu, 16 May 2024 10:56:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujgU=MT=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s7Yn2-0007M7-8e
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:56:48 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcf3a761-1372-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 12:56:46 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 2997080079;
 Thu, 16 May 2024 11:56:46 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id 03ED920189; Thu, 16 May 2024 11:56:46 +0100 (BST)
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
X-Inumbo-ID: fcf3a761-1372-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715857006;
	bh=IqQbHL4zd6sroMW8oqRG7fEFGbUFht56fidjDQZye10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AhpBQQ3x4Lb7jWtkqMmnz4tg6Gmc8b+edVc4M0iWm8UQ11z8en4i2Mj7HQdjuYoD7
	 oGVrLAf1XEiTy5TMWzh7IEMqAJBsgjXrsVySQPmeHw9G9VFB6OT2WKF85/unQxZLuv
	 rUeolKYwZtQsKcQM3xneLSPrmP+dv1nrx3jANIrY=
From: Leigh Brown <leigh@solinno.co.uk>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH v3 1/4] tools/libs/light: Add vlan field to libxl_device_nic
Date: Thu, 16 May 2024 11:56:09 +0100
Message-Id: <20240516105612.15306-2-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516105612.15306-1-leigh@solinno.co.uk>
References: <20240516105612.15306-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add `vlan' string field to libxl_device_nic, to allow a VLAN
configuration to be specified for the VIF when adding it to the
bridge device.

Update libxl_nic.c to read and write the vlan field from the
xenstore.

This provides the capability for supported operating systems (e.g.
Linux) to perform VLAN filtering on bridge ports.  The Xen
hotplug scripts need to be updated to read this information from
the xenstore and perform the required configuration.

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

---
 tools/libs/light/libxl_nic.c     | 10 ++++++++++
 tools/libs/light/libxl_types.idl |  1 +
 2 files changed, 11 insertions(+)

diff --git a/tools/libs/light/libxl_nic.c b/tools/libs/light/libxl_nic.c
index d6bf06fc34..d861e3726d 100644
--- a/tools/libs/light/libxl_nic.c
+++ b/tools/libs/light/libxl_nic.c
@@ -233,6 +233,11 @@ static int libxl__set_xenstore_nic(libxl__gc *gc, uint32_t domid,
         flexarray_append(back, GCSPRINTF("%u", nic->mtu));
     }
     
+    if (nic->vlan) {
+        flexarray_append(back, "vlan");
+        flexarray_append(back, libxl__strdup(gc, nic->vlan));
+    }
+
     flexarray_append(back, "bridge");
     flexarray_append(back, libxl__strdup(gc, nic->bridge));
     flexarray_append(back, "handle");
@@ -313,6 +318,11 @@ static int libxl__nic_from_xenstore(libxl__gc *gc, const char *libxl_path,
         nic->mtu = LIBXL_DEVICE_NIC_MTU_DEFAULT;
     }
 
+    rc = libxl__xs_read_checked(gc, XBT_NULL,
+                                GCSPRINTF("%s/vlan", libxl_path),
+				(const char **)(&nic->vlan));
+    if (rc) goto out;
+
     rc = libxl__xs_read_checked(gc, XBT_NULL,
                                 GCSPRINTF("%s/mac", libxl_path), &tmp);
     if (rc) goto out;
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 7d8bd5d216..5c510dc272 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -809,6 +809,7 @@ libxl_device_nic = Struct("device_nic", [
     ("backend_domname", string),
     ("devid", libxl_devid),
     ("mtu", integer),
+    ("vlan", string),
     ("model", string),
     ("mac", libxl_mac),
     ("ip", string),
-- 
2.39.2


