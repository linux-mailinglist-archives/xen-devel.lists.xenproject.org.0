Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 990911BB4E8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:06:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHVD-0000Qf-CA; Tue, 28 Apr 2020 04:05:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHVC-0000QF-1R
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:05:46 +0000
X-Inumbo-ID: 86acac3c-8905-11ea-ae69-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86acac3c-8905-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 04:05:41 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id 71so16251205qtc.12
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ddex++nzv2WYh9FC7KtYSgOC1YbK2YwKv0Rii0LLw7o=;
 b=ov+oNqKtDHx8DQ6zzoPSKXyhC8TM3EG+VH40bPsL9hNcHFe9tfYq4VzQbVz4Os602K
 4I2dA1/0OJH0Z9RUNYpIz8EVGWZfhVWLiNCEhV7ja7rfnWNCxGyb8HoXRebyYxv4GN+h
 HILcBRI9M2qpn04fhGk+Z0qbf5gMq2FbmlsytmE6XicGBsO1cIX30q9PMW/obElBHCnQ
 im5n36eDkzV031uhYZo/oaaaM5APjF40WbWHTTwpwaZhuppvq0BQRZCaw7SblfYjoh+o
 ju+oI28j6Z5Y3TkG6GclxGHu74lFY/1bRsKCHxaFKTyj4fRrLjEZdkRgNQEl3WlSH3v2
 DyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ddex++nzv2WYh9FC7KtYSgOC1YbK2YwKv0Rii0LLw7o=;
 b=c4Vsrm9EulKiGKHEvmDjsRzAQmZSORP3s4jI8cNI0PNoJG539non9wutFA3Stkqo2P
 Y8t7IGq+iFR4wLLQmwT2pWqqTLqZfjuMu5c7xYnFPO/r9wFNROWpAPzyuhBprkrPafJH
 N105JwTrfGsUtKB9HbY8Xz1lhwZPeLSCS8r4WGI2jVQ1o63Ax5TeGgpd45dpLnW71g1B
 DbqOZJicgpmNglueLNCFZ2lxHHabAuG7fwNHBWJaFOZ6pZjmezl0OfzRyRLztLuUlzZB
 g16U5P1LC6KXFRkf3aAh49Fdf/8192qMarz3Y8utG6zYFAJxKmHmchqSC0/1NvaDzEUS
 /wQA==
X-Gm-Message-State: AGi0PuaRuQXKeFKRUuQauXTI1w08rFFIdHbyHYyvRWLGexi1aQ+z2yt8
 85Jdq+XrJmOjpnr0GnmffdALcPfa
X-Google-Smtp-Source: APiQypK2jyLGMQGUp4b+E6gCVFV9GE91aXQSlv5XtU2jGUZO+IfaXAVglrJHHI50rqkvZlcfV547Fg==
X-Received: by 2002:ac8:33fd:: with SMTP id d58mr24272862qtb.213.1588046740924; 
 Mon, 27 Apr 2020 21:05:40 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:05:39 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 04/21] libxl: Allow running qemu-xen in stubdomain
Date: Tue, 28 Apr 2020 00:04:16 -0400
Message-Id: <20200428040433.23504-5-jandryuk@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200428040433.23504-1-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
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

---
Changes in v3:
 - new patch, instead of "libxl: Add "stubdomain_version" to
 domain_build_info"
 - helper functions as suggested by Ian Jackson
---
 tools/libxl/libxl_create.c   |  9 ---------
 tools/libxl/libxl_internal.h | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
index e7cb2dbc2b..7423ee8e57 100644
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
index 5f39e44cb9..ebbf926897 100644
--- a/tools/libxl/libxl_internal.h
+++ b/tools/libxl/libxl_internal.h
@@ -2320,6 +2320,23 @@ _hidden int libxl__device_model_version_running(libxl__gc *gc, uint32_t domid);
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
2.20.1


