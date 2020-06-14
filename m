Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECBE1F8B14
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 00:12:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkarR-0000B4-VX; Sun, 14 Jun 2020 22:12:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UtKD=73=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jkarQ-00009r-Md
 for xen-devel@lists.xenproject.org; Sun, 14 Jun 2020 22:12:16 +0000
X-Inumbo-ID: 1941eeb2-ae8c-11ea-b7bb-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1941eeb2-ae8c-11ea-b7bb-bc764e2007e4;
 Sun, 14 Jun 2020 22:12:13 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id c35so10124983edf.5
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2020 15:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F2zlyMIKfLVDpbJSsJPj/zZztFJH8ixIurr3m9NMur4=;
 b=S0YApsTeJu5e/fblFRbEgUob92Yv1YnnRSUio+NYsQH6n5INj0+wUhrecL/1N/xJjf
 SSm0J7Kt9nMSfPUQPMCO0YsqxBMKDvR3xOpoiKWruwFbI/UrW53imvkfhsFN0Ge5IIRP
 PNxQqM9y46Ad6iyPnQqGiKTD3jK5jy2iWA/0gVs6HVfhErOtqyqeAbpBtspfGDJyde3I
 HV7wHZx4iGUyIsh3lwayBAf7j5SGrRwnASy8rL2ADi7ag79KWMHpcjYu9ZWhK9p8fRAn
 QMtJoHlNkL0xALXdy4uol9Sv1CPZcEYbx48gSip8qH91Wj6R6szOGvpB7vnwYwKVjYY6
 GYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F2zlyMIKfLVDpbJSsJPj/zZztFJH8ixIurr3m9NMur4=;
 b=W34IDcnyKTiYVFJGL6qWlnZ5ZAzYWf9leoDdycY0CcZgIDWo4GghImv2ch64zjEbYX
 GFXi6HeSDiwB7cAQmiXCsGp+wrj5AOPmDBITH7yuE2JqC2VSBAaNKXRfTly/qN1+Zp1F
 6F0LuPf1CjDim2gFoOc12nRnzXi/y+w04ahp6qs2SS+kw87TsVhukKo5Y237YcE8lrPJ
 GT3UG4M/z4jRabERiaPTMMl9J009dCtj+0gZFu2ygHgA21yI1J7vnMR7daLwT1sh+aYm
 XQO8EQfuuXzL9i8RQCRqFxGiR4j539cztphgmgaBgJijPEMcOvtvGMPpLwKMu+0CCFaT
 DRSA==
X-Gm-Message-State: AOAM530Ttbue4j5LP4URCPkzQuBoHF2kYa/WqEJJ7s+Z++NccU+qiYd2
 6WSmC4FZBBQ21+oQ5W7CIErT0s8A7eU7wg==
X-Google-Smtp-Source: ABdhPJwjNFrm+gUduG2OvP3Fe30QR7Gt+WVgIEU4/reWGAeKtzYMyjGDi9XOsk8lHZ2Sy0Fa0n/icQ==
X-Received: by 2002:a50:fb92:: with SMTP id e18mr20499391edq.135.1592172732450; 
 Sun, 14 Jun 2020 15:12:12 -0700 (PDT)
Received: from localhost.localdomain (public-gprs354212.centertel.pl.
 [37.47.14.229])
 by smtp.gmail.com with ESMTPSA id o13sm7772828ejb.46.2020.06.14.15.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 15:12:12 -0700 (PDT)
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 1/3] tools/libxl: Grant VGA IO port permission for
 stubdom/target domain
Date: Sun, 14 Jun 2020 22:12:01 +0000
Message-Id: <87d74a21bde95cfc7c53fad56bf8f0e47724953e.1592171394.git.gorbak25@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1592171394.git.gorbak25@gmail.com>
References: <cover.1592171394.git.gorbak25@gmail.com>
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
Cc: Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Ian Jackson <ian.jackson@eu.citrix.com>, marmarek@invisiblethingslab.com,
 Grzegorz Uriasz <gorbak25@gmail.com>, j.nowak26@student.uw.edu.pl,
 Anthony PERARD <anthony.perard@citrix.com>, contact@puzio.waw.pl
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When qemu is running inside a linux based stubdomain, qemu does not
have the necessary permissions to map the ioports to the target domain.
Currently, libxl is granting permissions only for the VGA RAM memory region
and not passing the required ioports. This patch grants the required
permission for the necessary vga io ports.

Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
---
 tools/libxl/libxl_pci.c | 99 ++++++++++++++++++++++++++++++-----------
 1 file changed, 73 insertions(+), 26 deletions(-)

diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
index 957ff5c8e9..436190f790 100644
--- a/tools/libxl/libxl_pci.c
+++ b/tools/libxl/libxl_pci.c
@@ -2441,17 +2441,75 @@ void libxl__device_pci_destroy_all(libxl__egc *egc, uint32_t domid,
     }
 }
 
+static int libxl__grant_legacy_vga_permissions(libxl__gc *gc, const uint32_t domid) {
+    int ret, i;
+    uint64_t vga_iomem_start = 0xa0000 >> XC_PAGE_SHIFT;
+    uint64_t vga_iomem_npages = 0x20;
+    uint32_t stubdom_domid = libxl_get_stubdom_id(CTX, domid);
+    uint64_t vga_ioport_start[] = {0x3B0, 0x3C0};
+    uint64_t vga_ioport_size[] = {0xC, 0x20};
+
+    /* VGA RAM */
+    ret = xc_domain_iomem_permission(CTX->xch, stubdom_domid,
+                                     vga_iomem_start, vga_iomem_npages, 1);
+    if (ret < 0) {
+        LOGED(ERROR, domid,
+              "failed to give stubdom%d access to iomem range "
+              "%"PRIx64"-%"PRIx64" for VGA passthru",
+              stubdom_domid,
+              vga_iomem_start, (vga_iomem_start + (vga_iomem_npages << XC_PAGE_SHIFT) - 1));
+        return ret;
+    }
+    ret = xc_domain_iomem_permission(CTX->xch, domid,
+                                     vga_iomem_start, vga_iomem_npages, 1);
+    if (ret < 0) {
+        LOGED(ERROR, domid,
+              "failed to give dom%d access to iomem range "
+              "%"PRIx64"-%"PRIx64" for VGA passthru",
+              domid, vga_iomem_start, (vga_iomem_start + (vga_iomem_npages << XC_PAGE_SHIFT) - 1));
+        return ret;
+    }
+
+    /* VGA IOPORTS */
+    for (i = 0 ; i < 2 ; i++) {
+        ret = xc_domain_ioport_permission(CTX->xch, stubdom_domid,
+                                          vga_ioport_start[i], vga_ioport_size[i], 1);
+        if (ret < 0) {
+            LOGED(ERROR, domid,
+                  "failed to give stubdom%d access to ioport range "
+                  "%"PRIx64"-%"PRIx64" for VGA passthru",
+                  stubdom_domid,
+                  vga_ioport_start[i], (vga_ioport_start[i] + vga_ioport_size[i] - 1));
+            return ret;
+        }
+        ret = xc_domain_ioport_permission(CTX->xch, domid,
+                                          vga_ioport_start[i], vga_ioport_size[i], 1);
+        if (ret < 0) {
+            LOGED(ERROR, domid,
+                  "failed to give dom%d access to ioport range "
+                  "%"PRIx64"-%"PRIx64" for VGA passthru",
+                  domid, vga_ioport_start[i], (vga_ioport_start[i] + vga_ioport_size[i] - 1));
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
+static int libxl__grant_igd_opregion_permission(libxl__gc *gc, const uint32_t domid) {
+    return 0;
+}
+
 int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
                                       libxl_domain_config *const d_config)
 {
-    int i, ret;
+    int i, ret = 0;
+    bool vga_found = false, igd_found = false;
 
     if (!libxl_defbool_val(d_config->b_info.u.hvm.gfx_passthru))
         return 0;
 
-    for (i = 0 ; i < d_config->num_pcidevs ; i++) {
-        uint64_t vga_iomem_start = 0xa0000 >> XC_PAGE_SHIFT;
-        uint32_t stubdom_domid;
+    for (i = 0 ; i < d_config->num_pcidevs && !igd_found ; i++) {
         libxl_device_pci *pcidev = &d_config->pcidevs[i];
         unsigned long pci_device_class;
 
@@ -2460,30 +2518,19 @@ int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
         if (pci_device_class != 0x030000) /* VGA class */
             continue;
 
-        stubdom_domid = libxl_get_stubdom_id(CTX, domid);
-        ret = xc_domain_iomem_permission(CTX->xch, stubdom_domid,
-                                         vga_iomem_start, 0x20, 1);
-        if (ret < 0) {
-            LOGED(ERROR, domid,
-                  "failed to give stubdom%d access to iomem range "
-                  "%"PRIx64"-%"PRIx64" for VGA passthru",
-                  stubdom_domid,
-                  vga_iomem_start, (vga_iomem_start + 0x20 - 1));
-            return ret;
-        }
-        ret = xc_domain_iomem_permission(CTX->xch, domid,
-                                         vga_iomem_start, 0x20, 1);
-        if (ret < 0) {
-            LOGED(ERROR, domid,
-                  "failed to give dom%d access to iomem range "
-                  "%"PRIx64"-%"PRIx64" for VGA passthru",
-                  domid, vga_iomem_start, (vga_iomem_start + 0x20 - 1));
-            return ret;
-        }
-        break;
+        vga_found = true;
+        if (pcidev->bus == 0 && pcidev->dev == 2 && pcidev->func == 0)
+            igd_found = true;
     }
 
-    return 0;
+    if (vga_found)
+        ret = libxl__grant_legacy_vga_permissions(gc, domid);
+    if (ret < 0)
+        return ret;
+    if (igd_found)
+        ret = libxl__grant_igd_opregion_permission(gc, domid);
+
+    return ret;
 }
 
 static int libxl_device_pci_compare(const libxl_device_pci *d1,
-- 
2.27.0


