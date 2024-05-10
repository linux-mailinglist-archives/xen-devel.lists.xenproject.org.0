Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 044CE8C2270
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 12:49:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719766.1122639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Now-0000wz-Mu; Fri, 10 May 2024 10:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719766.1122639; Fri, 10 May 2024 10:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Now-0000ta-IN; Fri, 10 May 2024 10:49:46 +0000
Received: by outflank-mailman (input) for mailman id 719766;
 Fri, 10 May 2024 10:49:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Xy6=MN=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s5Nou-0007MJ-UD
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 10:49:44 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0242e75e-0ebb-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 12:49:43 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41b79450f78so11940995e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 03:49:43 -0700 (PDT)
Received: from m1x-phil.lan (sev93-h02-176-184-17-152.dsl.sta.abo.bbox.fr.
 [176.184.17.152]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baacf52sm4278278f8f.87.2024.05.10.03.49.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 May 2024 03:49:42 -0700 (PDT)
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
X-Inumbo-ID: 0242e75e-0ebb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715338183; x=1715942983; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6xsQqOmikZFwXbyDk6ZpqqheWDHvbw4l/2JG+MVzRA=;
        b=ejok603IdcxQfgqps6+fPbxbUnH+knmZrcZUrCtY6LGZMmtqAJa4d/W2sH9QL7+u9H
         60vtIG3HiCPKSHNFRGaOvdRes/FxcvZffoJuIPAHjdIq1aP0PHVEmDvYLFU+njJFHaSG
         NtM/T0rtxiO1ALRpMV1PMjMJ1wxC3SrvbH96Fou6P2g9BDpX4zpxUD07TpgdDQo8py+9
         BULthWTn3dym+ysKlHx+zmAc7nEY3QXojN5GduB3kjFgBXR/xEIeMQKhU+u1YFXz8vA+
         cYsbdHILhkBgeUYVNMYG2dG4JzWc0POSCSj8l1EJ5WGa9mqom4g1Cyy4GclAFOMM2EZD
         SAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715338183; x=1715942983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6xsQqOmikZFwXbyDk6ZpqqheWDHvbw4l/2JG+MVzRA=;
        b=cd+HwZPpZbOLioH0yayylsGj7bcpX3bdbPh71Ye6DY5at+egpwQh5tpU4ZywhP/1N1
         5a6cfPbbLA4ixgl/6rO/ILcVgP9jZpOm/G8qUxVHrrmKuZrVGJVTdc2ldq7Bl9q39Jfg
         /QLAhgfGSCCT9GmYtpeW7m3YU3CICw3W211d5D0zZ8t9LdGmnx+8flaReglkXmnTOEkO
         ZmsgkKMvLGsLyLyOwTBuUspXG3uAtJn5v3CMZMLj/dPvshxjiL2cZFjyWCuDvIlMGgf/
         ECxL/KbB1+aroUZp14spkMoycVr0S/3jir9OeSpQV805qwtxuTNNaNmevrRj9b2D5GwR
         QLDg==
X-Forwarded-Encrypted: i=1; AJvYcCUhyKXxKfOlfvG04RnPd1HKHR8VVOVW8Qvh9evrPWBOZY0ZGZffNxR0UfHlCYwk0Gz1rT+8QMYff5zz8fqKJt5EIhFY5QU/q1/ZHDwxOBk=
X-Gm-Message-State: AOJu0YyfeC0UG/sPPAf8YwsIpaheXXbGyJ1WkB/YbQanLk0wBL5QJywP
	pPdMjK2mi3dFaWQBqqM/+CEbeCu9Ft1eiRO56Q3m7tggRY6V6xQ6SbZzbo+AIHs=
X-Google-Smtp-Source: AGHT+IH3RnmZXXuxt2IBSPxIon61ivul84ejF6Ul9PK/puKcX3RJUgwhud+k6udV+bWCsrG6K2uZGg==
X-Received: by 2002:a05:600c:490a:b0:41f:dcdd:5631 with SMTP id 5b1f17b1804b1-41feaa30cfamr23776095e9.13.1715338182860;
        Fri, 10 May 2024 03:49:42 -0700 (PDT)
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
Subject: [PATCH v2 5/7] hw/xen: initialize legacy backends from xen_bus_init()
Date: Fri, 10 May 2024 12:49:06 +0200
Message-ID: <20240510104908.76908-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240510104908.76908-1-philmd@linaro.org>
References: <20240510104908.76908-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paolo Bonzini <pbonzini@redhat.com>

Prepare for moving the calls to xen_be_register() under the
control of xen_bus_init(), using the normal xen_backend_init()
method that is used by the "modern" backends.

This requires the xenstore global variable to be initialized,
which is done by xen_be_init().  To ensure that everything is
ready at the time the xen_backend_init() functions are called,
remove the xen_be_init() function from all the boards and
place it directly in xen_bus_init().

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240509170044.190795-7-pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc.c              | 1 -
 hw/xen/xen-bus.c          | 4 ++++
 hw/xen/xen-hvm-common.c   | 2 --
 hw/xenpv/xen_machine_pv.c | 5 +----
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 505ea750f4..19f21953b4 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1250,7 +1250,6 @@ void pc_basic_device_init(struct PCMachineState *pcms,
             pci_create_simple(pcms->pcibus, -1, "xen-platform");
         }
         xen_bus_init();
-        xen_be_init();
     }
 #endif
 
diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index fb82cc33e4..95b207ac8b 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -13,6 +13,7 @@
 #include "hw/sysbus.h"
 #include "hw/xen/xen.h"
 #include "hw/xen/xen-backend.h"
+#include "hw/xen/xen-legacy-backend.h" /* xen_be_init() */
 #include "hw/xen/xen-bus.h"
 #include "hw/xen/xen-bus-helper.h"
 #include "monitor/monitor.h"
@@ -329,6 +330,9 @@ static void xen_bus_realize(BusState *bus, Error **errp)
         goto fail;
     }
 
+    /* Initialize legacy backend core & drivers */
+    xen_be_init();
+
     if (xs_node_scanf(xenbus->xsh, XBT_NULL, "", /* domain root node */
                       "domid", NULL, "%u", &domid) == 1) {
         xenbus->backend_id = domid;
diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 1627da7398..2d1b032121 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -872,8 +872,6 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
 
     xen_bus_init();
 
-    xen_be_init();
-
     return;
 
 err:
diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index 1130d1a147..b500ce0989 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -34,8 +34,7 @@ static void xen_init_pv(MachineState *machine)
 {
     setup_xen_backend_ops();
 
-    /* Initialize backend core & drivers */
-    xen_be_init();
+    xen_bus_init();
 
     switch (xen_mode) {
     case XEN_ATTACH:
@@ -60,8 +59,6 @@ static void xen_init_pv(MachineState *machine)
         vga_interface_created = true;
     }
 
-    xen_bus_init();
-
     /* config cleanup hook */
     atexit(xen_config_cleanup);
 }
-- 
2.41.0


