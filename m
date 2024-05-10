Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE388C2272
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 12:50:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719771.1122650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Np1-0001OK-TV; Fri, 10 May 2024 10:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719771.1122650; Fri, 10 May 2024 10:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Np1-0001MZ-Q2; Fri, 10 May 2024 10:49:51 +0000
Received: by outflank-mailman (input) for mailman id 719771;
 Fri, 10 May 2024 10:49:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Xy6=MN=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s5Np1-0007MJ-3Y
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 10:49:51 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05c4b305-0ebb-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 12:49:49 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2e538a264f7so7492571fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 03:49:49 -0700 (PDT)
Received: from m1x-phil.lan (sev93-h02-176-184-17-152.dsl.sta.abo.bbox.fr.
 [176.184.17.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce2449sm60037515e9.16.2024.05.10.03.49.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 May 2024 03:49:48 -0700 (PDT)
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
X-Inumbo-ID: 05c4b305-0ebb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715338188; x=1715942988; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59LwZUfkdqE1X1uqHmA8fJxVEaLTRUaAXUjy1rLp7lY=;
        b=Sta0JE2ikyWuGJHzkCb628DYKvp0Hcdfrg5T9n6zjT579Subv1/7vE9N54eiw8h6PJ
         SMW7sjJtq7yJUl4Egptv95DlR2b/AV53StOH9In8rf4KVZBbJnQbsW8iXUGOIxsCaLsq
         YWU28a0PikPuueXwzhw1HAqzk8+aL7xvLB8BHXs9wRSgZz1cq0iFbqhlnVH7VRP/WN15
         2sxauccTT+fGUtgCoGXU9L8aIuKW/vnLucfq/JO1+CbvID0OQlZNnfeh+M0LhzolLO0l
         TKrodb0R3Xbjt9B6c9Nv4JWSfEn0xHPzNlih9scZOp1iu+cky1Wl1T5amot0kX1/bSKw
         o1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715338188; x=1715942988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59LwZUfkdqE1X1uqHmA8fJxVEaLTRUaAXUjy1rLp7lY=;
        b=lhvTLEaUya6QhYtFFnGOFraOc36qBeFg7TkavMWz8KhaC74kZuEp64mSz/Vfnk2bWo
         LGpC4P/saFpyWmLrELOKCfHKWXdFRBi/YVqgh6z021idPd9KwAWQfnzPyzpxe6Orzjw0
         aaHMD/6txJSG0WDt7g7JuOOq4rm8zL6OyjoVv0HVxM6u5rsI7SFEwI7aIs/dlid+DToM
         8OIVyxNtQ5n0Owzvvry/KdgEZcA1WwHPILQv7Y+gWtQERz9cWms82wnFRGZr9xsZ0R66
         kf+eGTXDirTAy4/iEJJpCkrdEjJTN8ZPNth2jepzxu9SHIeAJ8gS+07fJs4ik15AUaSC
         iGww==
X-Forwarded-Encrypted: i=1; AJvYcCWSH0d1X77BWvtgRG/VWXEWQRHOckbI7qJHcnQ3rW/q14EYNkcxT9DabnIDsHiy4NHJZkcKs6wQLEAARNnhyI0O0Ut4eVAFwhVmDlYqu3k=
X-Gm-Message-State: AOJu0YwblU9j3oBhSkACnZGNsjuArUtEpACfPpBFcVkGjBXMSH8DpCAP
	jpP69SLwWpxwXL0cLKxxw6JP3631Po7llnHNzD/r24XXP99XwUM0UXOjl5QGNNg=
X-Google-Smtp-Source: AGHT+IHXwM/S059R6UkOB6MRtl349Xb619zHzrqPuRu/IZXAzDzUInG0zBbE08W5hL9UPuwtPHGoJA==
X-Received: by 2002:a2e:9e14:0:b0:2e1:c97b:6f1f with SMTP id 38308e7fff4ca-2e5203a795emr13764691fa.51.1715338188613;
        Fri, 10 May 2024 03:49:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 6/7] hw/xen: register legacy backends via xen_backend_init
Date: Fri, 10 May 2024 12:49:07 +0200
Message-ID: <20240510104908.76908-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240510104908.76908-1-philmd@linaro.org>
References: <20240510104908.76908-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paolo Bonzini <pbonzini@redhat.com>

It is okay to register legacy backends in the middle of xen_bus_init().
All that the registration does is record the existence of the backend
in xenstore.

This makes it possible to remove them from the build without introducing
undefined symbols in xen_be_init().  It also removes the need for the
backend_register callback, whose only purpose is to avoid registering
nonfunctional backends.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20240509170044.190795-8-pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-legacy-backend.h | 11 ++---------
 include/hw/xen/xen_pvdev.h          |  1 -
 hw/9pfs/xen-9p-backend.c            |  8 +++++++-
 hw/display/xenfb.c                  |  8 +++++++-
 hw/usb/xen-usb.c                    | 14 ++++----------
 hw/xen/xen-legacy-backend.c         | 16 ----------------
 6 files changed, 20 insertions(+), 38 deletions(-)

diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index cfa43a984a..e55a14057f 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -66,15 +66,8 @@ static inline void xen_be_unmap_grant_ref(struct XenLegacyDevice *xendev,
     return xen_be_unmap_grant_refs(xendev, ptr, &ref, 1);
 }
 
-/* actual backend drivers */
-extern const struct XenDevOps xen_kbdmouse_ops;     /* xen_framebuffer.c */
-extern const struct XenDevOps xen_framebuffer_ops;  /* xen_framebuffer.c */
-#ifdef CONFIG_VIRTFS
-extern const struct XenDevOps xen_9pfs_ops;         /* xen-9p-backend.c  */
-#endif
-#ifdef CONFIG_USB_LIBUSB
-extern const struct XenDevOps xen_usb_ops;          /* xen-usb.c         */
-#endif
+/* backend drivers not included in all machines */
+extern const struct XenDevOps xen_framebuffer_ops;  /* xenfb.c */
 
 /* configuration (aka xenbus setup) */
 void xen_config_cleanup(void);
diff --git a/include/hw/xen/xen_pvdev.h b/include/hw/xen/xen_pvdev.h
index fd9a33e6ab..0c98444047 100644
--- a/include/hw/xen/xen_pvdev.h
+++ b/include/hw/xen/xen_pvdev.h
@@ -29,7 +29,6 @@ struct XenDevOps {
                                  const char *node);
     void      (*frontend_changed)(struct XenLegacyDevice *xendev,
                                   const char *node);
-    int       (*backend_register)(void);
 };
 
 struct XenLegacyDevice {
diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
index b1780eb819..79359d911a 100644
--- a/hw/9pfs/xen-9p-backend.c
+++ b/hw/9pfs/xen-9p-backend.c
@@ -513,7 +513,7 @@ static void xen_9pfs_alloc(struct XenLegacyDevice *xendev)
     xenstore_write_be_int(xendev, "max-ring-page-order", MAX_RING_ORDER);
 }
 
-const struct XenDevOps xen_9pfs_ops = {
+static const struct XenDevOps xen_9pfs_ops = {
     .size       = sizeof(Xen9pfsDev),
     .flags      = DEVOPS_FLAG_NEED_GNTDEV,
     .alloc      = xen_9pfs_alloc,
@@ -522,3 +522,9 @@ const struct XenDevOps xen_9pfs_ops = {
     .disconnect = xen_9pfs_disconnect,
     .free       = xen_9pfs_free,
 };
+
+static void xen_9pfs_register_backend(void)
+{
+    xen_be_register("9pfs", &xen_9pfs_ops);
+}
+xen_backend_init(xen_9pfs_register_backend);
diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index dd83d0f5a5..b6d370bdf6 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -972,7 +972,7 @@ static void fb_event(struct XenLegacyDevice *xendev)
 
 /* -------------------------------------------------------------------- */
 
-const struct XenDevOps xen_kbdmouse_ops = {
+static const struct XenDevOps xen_kbdmouse_ops = {
     .size       = sizeof(struct XenInput),
     .init       = input_init,
     .initialise = input_initialise,
@@ -995,3 +995,9 @@ static const GraphicHwOps xenfb_ops = {
     .gfx_update  = xenfb_update,
     .ui_info     = xenfb_ui_info,
 };
+
+static void xen_vkbd_register_backend(void)
+{
+    xen_be_register("vkbd", &xen_kbdmouse_ops);
+}
+xen_backend_init(xen_vkbd_register_backend);
diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
index 95a901e81f..13901625c0 100644
--- a/hw/usb/xen-usb.c
+++ b/hw/usb/xen-usb.c
@@ -1083,7 +1083,7 @@ static void usbback_event(struct XenLegacyDevice *xendev)
     qemu_bh_schedule(usbif->bh);
 }
 
-const struct XenDevOps xen_usb_ops = {
+static const struct XenDevOps xen_usb_ops = {
     .size            = sizeof(struct usbback_info),
     .flags           = DEVOPS_FLAG_NEED_GNTDEV,
     .init            = usbback_init,
@@ -1095,15 +1095,9 @@ const struct XenDevOps xen_usb_ops = {
     .event           = usbback_event,
 };
 
-#else /* USBIF_SHORT_NOT_OK */
-
-static int usbback_not_supported(void)
+static void xen_usb_register_backend(void)
 {
-    return -EINVAL;
+    xen_be_register("qusb", &xen_usb_ops);
 }
-
-const struct XenDevOps xen_usb_ops = {
-    .backend_register = usbback_not_supported,
-};
-
+xen_backend_init(xen_usb_register_backend);
 #endif
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 4dc3a561cf..5514184f9c 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -622,27 +622,11 @@ void xen_be_init(void)
     qbus_set_bus_hotplug_handler(xen_sysbus);
 
     xen_set_dynamic_sysbus();
-
-    xen_be_register("vkbd", &xen_kbdmouse_ops);
-#ifdef CONFIG_VIRTFS
-    xen_be_register("9pfs", &xen_9pfs_ops);
-#endif
-#ifdef CONFIG_USB_LIBUSB
-    xen_be_register("qusb", &xen_usb_ops);
-#endif
 }
 
 int xen_be_register(const char *type, const struct XenDevOps *ops)
 {
     char path[50];
-    int rc;
-
-    if (ops->backend_register) {
-        rc = ops->backend_register();
-        if (rc) {
-            return rc;
-        }
-    }
 
     snprintf(path, sizeof(path), "device-model/%u/backends/%s", xen_domid,
              type);
-- 
2.41.0


