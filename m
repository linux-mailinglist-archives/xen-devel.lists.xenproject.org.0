Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3461F8B12
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 00:12:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkarX-0000BP-7k; Sun, 14 Jun 2020 22:12:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UtKD=73=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jkarV-00009r-Mu
 for xen-devel@lists.xenproject.org; Sun, 14 Jun 2020 22:12:21 +0000
X-Inumbo-ID: 1a644538-ae8c-11ea-bb8b-bc764e2007e4
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a644538-ae8c-11ea-bb8b-bc764e2007e4;
 Sun, 14 Jun 2020 22:12:15 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id mb16so15382762ejb.4
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2020 15:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K9vVjeVfBAmD5toSQvhwolJYZoUXP1UxEwduLBU73+A=;
 b=adGPkbzd1pDFW3MMUjjil8woWTnpy+IswqfHTBgRpgUbyY0AVHlMEKG1ayjzQFjxGz
 5G3gUp4An2Nvf5+xtlvUBunXcYc2WLQX42O7pVQmwJH/zJWgWgTIEr54qGeS/VuALz1Q
 9wUpKwpddrfCgGMAKXevlA9ZRN+cEoWSsfsAwIBmt5lrAV/7cEXZ7u4de4sv1XjYr3HV
 FbEAYtti7lgeykcE0PlstCDtmD++QZDXkd+CQYw1hpNja4QvDqV5OIyA3PjeVLUtNQPE
 1DNv4GtjP2YW3QlKlZDr/H5zzlG4vL6HpcWB4eHWUmFvZsSHBKFGFLXqAbmu10LaxikN
 gzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K9vVjeVfBAmD5toSQvhwolJYZoUXP1UxEwduLBU73+A=;
 b=ZGrwSYmnc1eJpEuYifzTk2Zr+TCDrYgbQ8Ksw8Ovw/xtywTrV5E/Wca15mbX7fUhpw
 WKR6UIpVlF0wPeL4JgC8gnVhH0xu96LbGApKVmK6neZ4IKpa725gSEoSqiyoOU9wKAoU
 MmVOcQSpK+O9k1WKK0mgK4wHJUJFfON+1wsp1GlhRrLADbRusoV1pedZSVq6S5CeLrcu
 bad4mf/MKCj/YfRHbSB4Q6Kr+s3lPqQorETM4CMWRhZlUnXl/qXJi3E7gU7oNS4Ujywi
 CxLaOlDniuBwFWIIhUkz6Jz/lmLCYR6c19URmPVgIIXu/oQ6XkTERChxLfM/bQ5RS2/p
 vjQA==
X-Gm-Message-State: AOAM530pQpzJp4BTzGOw2Agh8W/T5+s2tT5OCbArFRK7PWJrOnLu//QI
 DsVA8qfluWAVVKV4UzIQgplNQtlLC4QrdQ==
X-Google-Smtp-Source: ABdhPJxxMqGxxS/Bt2pPFAmezto6oZ1Tkhi9T994RozWfo95KLi4xIcCkyj/iEhidE91AhWez433ig==
X-Received: by 2002:a17:906:b1c3:: with SMTP id
 bv3mr23526685ejb.292.1592172734456; 
 Sun, 14 Jun 2020 15:12:14 -0700 (PDT)
Received: from localhost.localdomain (public-gprs354212.centertel.pl.
 [37.47.14.229])
 by smtp.gmail.com with ESMTPSA id o13sm7772828ejb.46.2020.06.14.15.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 15:12:13 -0700 (PDT)
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 2/3] tools/libxl: Grant permission for mapping opregions to
 the target domain
Date: Sun, 14 Jun 2020 22:12:02 +0000
Message-Id: <18bebc4af48b83d71b3247082434b958be84b841.1592171394.git.gorbak25@gmail.com>
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

IGD VGA devices require a special opregion MMIO region which functions as
an extra BAR in the PCI configuration space. Right now qemu is assigning those
permissions - this is failing inside a linux based stubdomain as the
stubdomain is not privileged. This patch grants the permissions for
opregions in libxl instead of qemu. Granting permissions in qemu may be removed
when this patch get's merged - for now linux based stubdomains which use IGD's
need to patch qemu and include this patch in xen for IGD passthrough to work.

Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
---
 tools/libxl/libxl_pci.c | 46 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
index 436190f790..48b1d8073b 100644
--- a/tools/libxl/libxl_pci.c
+++ b/tools/libxl/libxl_pci.c
@@ -2497,7 +2497,51 @@ static int libxl__grant_legacy_vga_permissions(libxl__gc *gc, const uint32_t dom
 }
 
 static int libxl__grant_igd_opregion_permission(libxl__gc *gc, const uint32_t domid) {
-    return 0;
+    char* sysfs_path;
+    FILE* f;
+    uint32_t igd_host_opregion;
+    int ret = 0;
+    uint32_t stubdom_domid = libxl_get_stubdom_id(CTX, domid);
+
+    sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/config", 0, 0, 2, 0);
+    f = fopen(sysfs_path, "r");
+    if (!f) {
+        LOGED(ERROR, domid, "Unable to access IGD config space");
+        return ERROR_FAIL;
+    }
+
+    ret = fseek(f, 0xfc, SEEK_SET);
+    if (ret < 0) {
+        LOGED(ERROR, domid, "Unable to lseek in PCI config space");
+        goto out;
+    }
+
+    ret = fread((void*)&igd_host_opregion, 4, 1, f);
+    if (ret < 0) {
+        LOGED(ERROR, domid, "Unable to read opregion register");
+        goto out;
+    }
+
+    ret = xc_domain_iomem_permission(CTX->xch, stubdom_domid,
+                                     (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT), 0x3, 1);
+    if (ret < 0) {
+        LOGED(ERROR, domid,
+              "failed to give stubdom%d access to %"PRIx32" opregions for igd passthrough", stubdom_domid, igd_host_opregion);
+        goto out;
+    }
+
+    ret = xc_domain_iomem_permission(CTX->xch, domid,
+                                     (unsigned long)(igd_host_opregion >> XC_PAGE_SHIFT), 0x3, 1);
+    if (ret < 0) {
+        LOGED(ERROR, domid,
+              "failed to give dom%d access to %"PRIx32" opregions for igd passthrough", domid, igd_host_opregion);
+        goto out;
+    }
+
+    out:
+    if(f)
+        fclose(f);
+    return ret;
 }
 
 int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
-- 
2.27.0


