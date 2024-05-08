Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 523228C0656
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 23:39:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718968.1121574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4p0C-0004bC-2l; Wed, 08 May 2024 21:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718968.1121574; Wed, 08 May 2024 21:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4p0B-0004Y3-W4; Wed, 08 May 2024 21:39:03 +0000
Received: by outflank-mailman (input) for mailman id 718968;
 Wed, 08 May 2024 21:39:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nd4S=ML=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s4p0A-00044I-A7
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 21:39:02 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 611416e4-0d83-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 23:38:59 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 2010F8007B;
 Wed,  8 May 2024 22:38:59 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id EC76220166; Wed,  8 May 2024 22:38:58 +0100 (BST)
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
X-Inumbo-ID: 611416e4-0d83-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715204339;
	bh=NwExQyE50t0WzUcJcVbwpgO12YLzpS7FSJX0VovsD2w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0p+fVAK8o9JhCJg0v5dza9u9Fi5JpN2LJfm8aDeFs5HqXP3kQATXlN3LphiN+I8v9
	 I4A0NE276Pj55g6Dwknjzd5zrWUIygNHMKk4m++Tp4vtfaVHaYfuBqgcqAuoUDVUuE
	 RH/FHx9hXn/S7UVSt+9h6UYjOZZ0eD/DlRWWWOjM=
From: Leigh Brown <leigh@solinno.co.uk>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [RFC PATCH v2 1/5] tools/libs/light: Add vlan field to libxl_device_nic
Date: Wed,  8 May 2024 22:38:20 +0100
Message-Id: <20240508213824.55824-2-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240508213824.55824-1-leigh@solinno.co.uk>
References: <20240508213824.55824-1-leigh@solinno.co.uk>
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


