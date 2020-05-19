Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 851061D8D5C
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 03:56:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jarUG-0000BZ-54; Tue, 19 May 2020 01:56:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jarUF-0000BR-Le
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 01:56:07 +0000
X-Inumbo-ID: e0e34fc0-9973-11ea-b9cf-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0e34fc0-9973-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 01:55:56 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id a23so4202362qto.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 18:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BWSyY9N8FyMXoF1yPMPDtUrpbXjsGUwF5REIL/gyKE4=;
 b=Q0G9EomtPMD43HAyYImzQGewd2pJhclm7ewCrDYgUizNdkAWPHdd/QDAqRrtwxE1Ud
 5C75344oe2RDuNnL/Rz8h3RzCAR3I7u3RGuVSrI8wgHSfnDiccr9Ygjig8Ckk/uMT2bM
 mayjHbihTwnBIeuVgu0XGn+9PakxiyYJRKKlA4oMrQ8Eyfe6RNyfHgP74dha0tlwkR9W
 N/21firtYqCM0w/UvCi+MLl5T55+shmdMlnc/qx21hQkOAE0ku1UjhHKgfYaENQ0UaY3
 8pwu0hIwdnQx9JTzNVxgi6zy63DrbIkL1IeW2MuPCzqeHmX2AJooCWIlMego33/mktcd
 aZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BWSyY9N8FyMXoF1yPMPDtUrpbXjsGUwF5REIL/gyKE4=;
 b=QpjqAIL8BXrDKVm3boz7DF/oLZS/VCLQN1AbntS7IK7TFBePZFYPdSEFo3JZO0mJkh
 cj+F/IAAiCNbXxl5Un1p9VXiH86l45vmqILR+P4Pz+wAGn6hqTBU8fdip5kZFyywDNKU
 uodiVLfunFiikC1fgpkNKAqO97D824a4j7V9fzIBBLhQYWpKVsuTH1u57VKKFOAXIU+u
 snTHTqnpwQkZQWlLvAfxo/5k3nHlIHeoMUyS3kvlCXH8KtBUE3/zlNqYzhNTs9m+A3AG
 bdJ0sMj0MgAk9K9lOCcMfK1MtUCTh/51y+ieom/ygSWxR45nmeCh+43jVuaz626SP3dT
 b08A==
X-Gm-Message-State: AOAM531aMxG3KIDjjpeScgUIHv+41h+DFh/F3uemrSi2Nk8DabxHK8aI
 36kpkqRBDZPML73t7xdVhiaH+3JR
X-Google-Smtp-Source: ABdhPJzIp16aUQq7pmPkVxIO1Nsj4UJOrCx67rkQXO1uauxrQu18+nrF0NgGcZXQSrV72ttKJ2sGHg==
X-Received: by 2002:aed:2b67:: with SMTP id p94mr19592117qtd.255.1589853355425; 
 Mon, 18 May 2020 18:55:55 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:e463:db9c:c6eb:4544])
 by smtp.gmail.com with ESMTPSA id q2sm9731898qkn.116.2020.05.18.18.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 18:55:54 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 04/19] libxl: Allow running qemu-xen in stubdomain
Date: Mon, 18 May 2020 21:54:48 -0400
Message-Id: <20200519015503.115236-5-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519015503.115236-1-jandryuk@gmail.com>
References: <20200519015503.115236-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Do not prohibit anymore using stubdomain with qemu-xen.
To help distingushing MiniOS and Linux stubdomain, add helper inline
functions libxl__stubdomain_is_linux() and
libxl__stubdomain_is_linux_running(). Those should be used where really
the difference is about MiniOS/Linux, not qemu-xen/qemu-xen-traditional.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

---
Changes in v3:
 - new patch, instead of "libxl: Add "stubdomain_version" to
 domain_build_info"
 - helper functions as suggested by Ian Jackson
Changes in v6:
 - Add Acked-by: Ian Jackson
---
 tools/libxl/libxl_create.c   |  9 ---------
 tools/libxl/libxl_internal.h | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index 5a043df15f..433947abab 100644
--- a/tools/libxl/libxl_create.c
+++ b/tools/libxl/libxl_create.c
@@ -171,15 +171,6 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         }
     }
 
-    if (b_info->type == LIBXL_DOMAIN_TYPE_HVM &&
-        b_info->device_model_version !=
-            LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL &&
-        libxl_defbool_val(b_info->device_model_stubdomain)) {
-        LOG(ERROR,
-            "device model stubdomains require \"qemu-xen-traditional\"");
-        return ERROR_INVAL;
-    }
-
     if (!b_info->max_vcpus)
         b_info->max_vcpus = 1;
     if (!b_info->avail_vcpus.size) {
diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
index e5effd2ad1..d1ebdec8d2 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -2324,6 +2324,23 @@ _hidden int libxl__device_model_version_running(libxl__gc *gc, uint32_t domid);
   /* Return the system-wide default device model */
 _hidden libxl_device_model_version libxl__default_device_model(libxl__gc *gc);
 
+static inline
+bool libxl__stubdomain_is_linux_running(libxl__gc *gc, uint32_t domid)
+{
+    /* same logic as in libxl__stubdomain_is_linux */
+    return libxl__device_model_version_running(gc, domid)
+        == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN;
+}
+
+static inline
+bool libxl__stubdomain_is_linux(libxl_domain_build_info *b_info)
+{
+    /* right now qemu-tranditional implies MiniOS stubdomain and qemu-xen
+     * implies Linux stubdomain */
+    return libxl_defbool_val(b_info->device_model_stubdomain) &&
+        b_info->device_model_version == LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN;
+}
+
 #define DEVICE_MODEL_XS_PATH(gc, dm_domid, domid, fmt, _a...)              \
     libxl__sprintf(gc, "/local/domain/%u/device-model/%u" fmt, dm_domid,   \
                    domid, ##_a)
-- 
2.25.1


