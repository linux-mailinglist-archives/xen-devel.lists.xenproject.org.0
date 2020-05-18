Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB93C1D6E77
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 03:15:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaUMx-0008UK-Fy; Mon, 18 May 2020 01:15:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaUMv-0008U5-SI
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 01:15:01 +0000
X-Inumbo-ID: f92d3b24-98a4-11ea-b9cf-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f92d3b24-98a4-11ea-b9cf-bc764e2007e4;
 Mon, 18 May 2020 01:14:51 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id a23so1134322qto.1
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 18:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BWSyY9N8FyMXoF1yPMPDtUrpbXjsGUwF5REIL/gyKE4=;
 b=dmYzjqhn8djThiD2veq57JdGz25GPorcVaEokl2lHY+o69SGbl/uoxQ1RZCUEe4XZ+
 CdP6adOaOBbmJcRmbZbYX3YgVEz55ewTwrPuHXvm95IyZbWqH3scoAjIhi6QDHl+sb6e
 tL30WijZOeD8Y+jmufz+6CCWH7l0aGfp748EWFOWb9AQW4T0yRvnRlKf6KJvUy9gCFFh
 dGrmCC9DsDnFF5YqMUDumDQxT0v1nzx9Ci4MbTaMGb/bui5n0x6X0zpJH/4h4OXIQpaw
 XH6C6bVbmFxkvsQqofYtzg7xf3YsTjycd9iyVCsLTpeXclxxFijq9DRE5YYUzB06mIfY
 i1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BWSyY9N8FyMXoF1yPMPDtUrpbXjsGUwF5REIL/gyKE4=;
 b=N0poky+kT4/hjGdYMsCjpQiAHAA9+qernI8bNm7l2Tp6IEB8b9wrsbis2pZHkmAMU6
 C6JJAovHP488nOyY4j+q8H0UvmiDf/aZE7TRsES7HBV9oi+6MnOspAL5RTC6UvG2RvuH
 +1E83rszwtnCaSaC+hXc4RV/GN54XdqTHSayB+cAKi+zLRjdzoJBm1bDHt3plxHhTDUh
 OtNCc7l1wtKe1wtJWyL3eufMc91CBujlaY4B7tvOUehkpuse3Xju6GnE0eXteB2qCqpZ
 k9MTVftTcA/OaQm4Q0lh/ftiilnvEMEMI3QC0ZnG2n8BnGNw7o2nuqor5ZSi2gtwBpel
 +C/w==
X-Gm-Message-State: AOAM532fdggrclJN7raGn1+VSaB8ec3VFC8P3fUrqPb7YnusBO0k7h2G
 kZCIdLBycSp9PZUEnVREwsYfOxAk
X-Google-Smtp-Source: ABdhPJyQ8nGpESmVdZae8TILsY1KpZ+Wbr4ArZ7xFlRRhBuWFQQSSMn+p/7NqkeImxBSOkezy/nJ/Q==
X-Received: by 2002:aed:3b75:: with SMTP id q50mr14557795qte.23.1589764490424; 
 Sun, 17 May 2020 18:14:50 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:ec68:c92e:af5a:2d3a])
 by smtp.gmail.com with ESMTPSA id l2sm7072864qkd.57.2020.05.17.18.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 18:14:49 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 04/18] libxl: Allow running qemu-xen in stubdomain
Date: Sun, 17 May 2020 21:13:39 -0400
Message-Id: <20200518011353.326287-5-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200518011353.326287-1-jandryuk@gmail.com>
References: <20200518011353.326287-1-jandryuk@gmail.com>
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


