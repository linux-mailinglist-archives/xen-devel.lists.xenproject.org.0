Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A61037372C0
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:26:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552064.861930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBf7N-0005lo-45; Tue, 20 Jun 2023 17:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552064.861930; Tue, 20 Jun 2023 17:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBf7N-0005ip-0M; Tue, 20 Jun 2023 17:26:13 +0000
Received: by outflank-mailman (input) for mailman id 552064;
 Tue, 20 Jun 2023 17:26:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/wkg=CI=gmail.com=jupham125@srs-se1.protection.inumbo.net>)
 id 1qBf7K-0004q1-OA
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:26:10 +0000
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [2607:f8b0:4864:20::1133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ab5614f-0f8f-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:26:08 +0200 (CEST)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-56fff21c2ebso53777097b3.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 10:26:08 -0700 (PDT)
Received: from joel-Precision-7920-Tower.. ([24.53.71.1])
 by smtp.gmail.com with ESMTPSA id
 e65-20020a0dc244000000b0056cffe97a11sm604604ywd.13.2023.06.20.10.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 10:26:06 -0700 (PDT)
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
X-Inumbo-ID: 8ab5614f-0f8f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687281967; x=1689873967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVhDjOa7FHuFiuCBrjeemQ/YptYJoZezJ1j93NWRipk=;
        b=bPEXGnB2OtY8PYvTjaUk45NIyGfaJM2vd0nUPIwq0dz+1vjogQHKnLJSGWeMF3FZiR
         BJQr02kmNxHweWckj3n4AC4pYWAIm3gXebmre0XVSa+MyCSfP7KmzjksZfpzuEP6yi2c
         HKrdqxIW3oi5jIN+o1+rFb7mcBEbqWQ+WLjCyNu2Le6YTLfO5bsApD3TyYLGfcWzXEpw
         MgywIHHn/Ex9ORIPODfah/nut/515nEu59JmlDBKfJz3jeZl5XAIcDawiSkUvxQm8mCn
         zahZTbbwNHQb4LnWfVlixwaX4ifBQy6qHwzgwKkO2Saqoz8hCtPT/HCRi58uaA1nlKxf
         A7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687281967; x=1689873967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVhDjOa7FHuFiuCBrjeemQ/YptYJoZezJ1j93NWRipk=;
        b=c9fkDGSLh+JJjLeuqNTuZmw0lC0GFrJz53sMRNbxDJ0wGc+bYeowpwK21kZywn7wp7
         3rvbLZhoNyr4kg9fn7cnNnLe9WWmH/lrw3SCiN22VWOkXG9mVw9/SgfF/8RJw57/3bij
         TtsBl3cX25eGKiMmj0WAs5o7M6H3MdaBs4WV+taEqHRHXatmmi+lNIF7jt25YnSc1Qqk
         uX9OrddZL/BDAe0Zl2ejrJe5HuVIf/G3y73rGAl05euzCpjXUJwlngMbtCvXK7EdSWTu
         2KXV/B4knay20tpoWdSL9t8jXhi7Gu/G1b9Ujs7fvMEHhrJhPZhY49dBWzws/vYKKtse
         xo/w==
X-Gm-Message-State: AC+VfDwTRJtds/sRBpHNP1rgAySGY0nt7JoYE9pYjrESFFZ3iKxrVQye
	GJxG1Ho9IrEbm6fDyELv0cA=
X-Google-Smtp-Source: ACHHUZ6SdCuyO2ywOemJ8HmOK80tXYlK5MSf18GBMCkKWxXCffCWY1KnaRNAYZ9J1meknqeU888PzQ==
X-Received: by 2002:a0d:f384:0:b0:56d:1528:c56f with SMTP id c126-20020a0df384000000b0056d1528c56fmr12677100ywf.16.1687281967212;
        Tue, 20 Jun 2023 10:26:07 -0700 (PDT)
From: Joel Upham <jupham125@gmail.com>
To: qemu-devel@nongnu.org
Cc: Joel Upham <jupham125@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH v1 06/23] xen/pt: XenHostPCIDevice: provide functions for PCI Capabilities and PCIe Extended Capabilities enumeration
Date: Tue, 20 Jun 2023 13:24:40 -0400
Message-Id: <8a5ed3bf4f1abca1e7e3a2c6011b7f81620aedca.1687278381.git.jupham125@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687278381.git.jupham125@gmail.com>
References: <cover.1687278381.git.jupham125@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces 2 new functions,
- xen_host_pci_find_next_ext_cap (actually a reworked
  xen_host_pci_find_ext_cap_offset function which is unused)
- xen_host_pci_find_next_cap

These functions allow to search for PCI/PCIe capabilities in a uniform
way. Both functions allow to search either a specific capability or any
encountered next (by specifying CAP_ID_ANY as a capability ID) -- this may
be useful when we merely need to traverse the capability list one-by-one.
In both functions the 'pos' argument allows to continue searching from
last position (0 means to start from beginning).

In order not to probe PCIe Extended Capabilities existence every time,
xen_host_pci_find_next_ext_cap makes use of the new 'has_pcie_ext_caps'
field in XenHostPCIDevice structure which is filled only once (in
xen_host_pci_device_get).

Signed-off-by: Alexey Gerasimenko <x1917x@xxxxxxxxx>
Signed-off-by: Joel Upham <jupham125@gmail.com>
---
 hw/xen/xen-host-pci-device.c | 91 ++++++++++++++++++++++++++++++++----
 hw/xen/xen-host-pci-device.h |  5 +-
 2 files changed, 85 insertions(+), 11 deletions(-)

diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.c
index 8c6e9a1716..a7021a5d56 100644
--- a/hw/xen/xen-host-pci-device.c
+++ b/hw/xen/xen-host-pci-device.c
@@ -32,6 +32,7 @@
 
 #define IORESOURCE_PREFETCH     0x00001000      /* No side effects */
 #define IORESOURCE_MEM_64       0x00100000
+#define XEN_HOST_PCI_CAP_MAX    48
 
 static void xen_host_pci_sysfs_path(const XenHostPCIDevice *d,
                                     const char *name, char *buf, ssize_t size)
@@ -198,6 +199,19 @@ static bool xen_host_pci_dev_is_virtfn(XenHostPCIDevice *d)
     return !stat(path, &buf);
 }
 
+static bool xen_host_pci_dev_has_pcie_ext_caps(XenHostPCIDevice *d)
+{
+    uint32_t header;
+
+    if (xen_host_pci_get_long(d, PCI_CONFIG_SPACE_SIZE, &header))
+        return false;
+
+    if (header == 0 || header == ~0U)
+        return false;
+
+    return true;
+}
+
 static void xen_host_pci_config_open(XenHostPCIDevice *d, Error **errp)
 {
     char path[PATH_MAX];
@@ -296,37 +310,93 @@ int xen_host_pci_set_block(XenHostPCIDevice *d, int pos, uint8_t *buf, int len)
     return xen_host_pci_config_write(d, pos, buf, len);
 }
 
-int xen_host_pci_find_ext_cap_offset(XenHostPCIDevice *d, uint32_t cap)
+int xen_host_pci_find_next_ext_cap(XenHostPCIDevice *d, int pos, uint32_t cap)
 {
     uint32_t header = 0;
     int max_cap = XEN_HOST_PCI_MAX_EXT_CAP;
-    int pos = PCI_CONFIG_SPACE_SIZE;
+
+    if (!d->has_pcie_ext_caps)
+        return 0;
+
+    if (!pos) {
+        pos = PCI_CONFIG_SPACE_SIZE;
+    } else {
+        if (xen_host_pci_get_long(d, pos, &header))
+            return 0;
+
+        pos = PCI_EXT_CAP_NEXT(header);
+    }
 
     do {
+        if (!pos || pos < PCI_CONFIG_SPACE_SIZE) {
+            break;
+        }
+
         if (xen_host_pci_get_long(d, pos, &header)) {
             break;
         }
         /*
          * If we have no capabilities, this is indicated by cap ID,
          * cap version and next pointer all being 0.
+	 * Also check for all F's returned (which means PCIe ext conf space
+	 * is unreadable for some reason)
          */
-        if (header == 0) {
+	if (header == 0 || header == ~0U) {
             break;
         }
 
-        if (PCI_EXT_CAP_ID(header) == cap) {
+        if (cap == CAP_ID_ANY) {
+            return pos;
+        } else if (PCI_EXT_CAP_ID(header) == cap) {
             return pos;
         }
 
         pos = PCI_EXT_CAP_NEXT(header);
-        if (pos < PCI_CONFIG_SPACE_SIZE) {
+    } while (--max_cap);
+
+    return 0;
+}
+
+int xen_host_pci_find_next_cap(XenHostPCIDevice *d, int pos, uint32_t cap)
+{
+    uint8_t id;
+    unsigned max_cap = XEN_HOST_PCI_CAP_MAX;
+    uint8_t status = 0;
+    uint8_t curpos;
+
+    if (xen_host_pci_get_byte(d, PCI_STATUS, &status))
+        return 0;
+
+    if ((status & PCI_STATUS_CAP_LIST) == 0)
+        return 0;
+
+    if (pos < PCI_CAPABILITY_LIST) {
+        curpos = PCI_CAPABILITY_LIST;
+    } else {
+        curpos = (uint8_t) pos;
+    }
+
+    while (max_cap--) {
+        if (xen_host_pci_get_byte(d, curpos, &curpos))
+             break;
+        if (!curpos)
+             break;
+
+        if (cap == CAP_ID_ANY)
+            return curpos;
+
+        if (xen_host_pci_get_byte(d, curpos + PCI_CAP_LIST_ID, &id))
             break;
-        }
 
-        max_cap--;
-    } while (max_cap > 0);
+        if (id == 0xff)
+            break;
+        else if (id == cap)
+            return curpos;
+
+        curpos += PCI_CAP_LIST_NEXT;
+    }
 
-    return -1;
+    return 0;
 }
 
 void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
@@ -376,7 +446,8 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
     }
     d->class_code = v;
 
-    d->is_virtfn = xen_host_pci_dev_is_virtfn(d);
+    d->is_virtfn         = xen_host_pci_dev_is_virtfn(d);
+    d->has_pcie_ext_caps = xen_host_pci_dev_has_pcie_ext_caps(d);
 
     return;
 
diff --git a/hw/xen/xen-host-pci-device.h b/hw/xen/xen-host-pci-device.h
index 4d8d34ecb0..37c5614a24 100644
--- a/hw/xen/xen-host-pci-device.h
+++ b/hw/xen/xen-host-pci-device.h
@@ -32,6 +32,7 @@ typedef struct XenHostPCIDevice {
     XenHostPCIIORegion rom;
 
     bool is_virtfn;
+    bool has_pcie_ext_caps;
 
     int config_fd;
 } XenHostPCIDevice;
@@ -53,6 +54,8 @@ int xen_host_pci_set_long(XenHostPCIDevice *d, int pos, uint32_t data);
 int xen_host_pci_set_block(XenHostPCIDevice *d, int pos, uint8_t *buf,
                            int len);
 
-int xen_host_pci_find_ext_cap_offset(XenHostPCIDevice *s, uint32_t cap);
+#define CAP_ID_ANY  (~0U)
+int xen_host_pci_find_next_cap(XenHostPCIDevice *s, int pos, uint32_t cap);
+int xen_host_pci_find_next_ext_cap(XenHostPCIDevice *d, int pos, uint32_t cap);
 
 #endif /* XEN_HOST_PCI_DEVICE_H */
-- 
2.34.1


