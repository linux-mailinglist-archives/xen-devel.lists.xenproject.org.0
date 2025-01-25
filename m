Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AB7A1C4CD
	for <lists+xen-devel@lfdr.de>; Sat, 25 Jan 2025 19:14:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877008.1287223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbkfR-0005AY-Fx; Sat, 25 Jan 2025 18:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877008.1287223; Sat, 25 Jan 2025 18:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbkfR-00058A-CN; Sat, 25 Jan 2025 18:14:01 +0000
Received: by outflank-mailman (input) for mailman id 877008;
 Sat, 25 Jan 2025 18:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X0T4=UR=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tbkfQ-000565-47
 for xen-devel@lists.xenproject.org; Sat, 25 Jan 2025 18:14:00 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 247d6791-db48-11ef-99a4-01e77a169b0f;
 Sat, 25 Jan 2025 19:13:57 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4361c705434so22039945e9.3
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jan 2025 10:13:57 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4c75c0sm68201815e9.31.2025.01.25.10.13.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 25 Jan 2025 10:13:55 -0800 (PST)
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
X-Inumbo-ID: 247d6791-db48-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737828836; x=1738433636; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+D9ecSNssEoyInsTWPhPYbcbkHeV5ELbKuxuFIHXnAU=;
        b=N7dRkc6p0L9U/te9/9bQ7dDkBTWvo2AePP0WNz86xrDKWDkyunA50kwama/VhS4KkM
         u9WtPAyGqenbpHdjXvnlBnVtApy0uj52w5ADLHweKFC0GEOx73qNLhDOYmnJquFloZZT
         0cEHqAKgG1se7H9cKre4cfNvYhR/gqs7Jve88fUaXmMiNogaYOP2MV0wipdj0/cDQGSP
         1HMeU009HUK+aLfLLk+KM+vhQgsBt9d03JgQ+ENpi8c24gO+fgo0su3Zr8hd54vBW4Pv
         bH3rjtASmfcb6JBfB//sxw5LxW/2OxQVcfYgNh55bW/cka3jKZ2TwGDkJi9D3yQzaFZY
         m0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828836; x=1738433636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+D9ecSNssEoyInsTWPhPYbcbkHeV5ELbKuxuFIHXnAU=;
        b=oPCf0BwFQWGunizws6vrDn9aainlr4T4VSyA4/TT2mgbvtVPwHhNR5HvOkl83FlK5u
         k19vX4rOFB5pcB5VNVGqwZtO2aevkOz81EGCmbvg0XWf6ZxeWqQkM/HcY3r2OIMO6TPn
         eyEGd9/D1hzvZZfr4Rz5w0P2nHvgoRXcxSOX1d/YeW6Xj/C5RI4uJRJPPGkfgedyZ/4g
         sdn99oFoBr1A5nOAUbO5FzKwBAdE3fhEnuku5sPfIdGwBHYhNvaFj9AljYhALXFzUilq
         pqkmbiCQRWwLn8/HfL6kH0LmvKt4orbAwYx9wuwh6hKeRWw0mNzUpButWxHk/gJDmqJj
         8MEA==
X-Forwarded-Encrypted: i=1; AJvYcCXSxE/Mz8yNvwXdbi2ldxhPQu9oOOwFm/SEnhHUTrycrOACRpt1Z/jvuax0sJZmllVFQ+SL4zCOYaA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLjl/b5jn3dcS1y/Xy+u/veYSdOazzIeqAXOV6bI9IHVZ9pN9G
	HRJfV6oScHb5ep8DPopsIHlA6ulZJcLy9uc+Idp11Sgu+PPXLGj+jzJJQ9wpna8=
X-Gm-Gg: ASbGncswr2Mx1QAltd1rhMTqQv0oYuR+XlqUxw0jOcHtK8TPJmRTLIACY7CPciJtuui
	ETbsrWoneKVVzQ4hoiSFGbib+EYOGMK2tzqceIT6sx+Jd+Cc7sfEx9taONS7sysKEA8+exgiwV+
	L0HBMnWZzxLF64Sqfay3UpPaB2NgR4QQ4z73hen587qMCaoJXGlJ0YJxNR9sxHgiMMRTheYHjX3
	hni7oXSmJ5BMpmnsRl67VwdWxAW/ENlG7U/ZhQShDDopZq61/j0RWI7n8XweJFopvzOA+TrGhHR
	bAgfFXjQP8eDvDaepsfRx9Rq/ns8fxSaOdDCPTUTGhMzLfdZjXvDSUGVHp1o
X-Google-Smtp-Source: AGHT+IH3gG9oDbH+Yt++6e9axdywvxazaykwi7sr/Zo0cY2/uHyHOw51lxlnycmePra8xEH0EQ/Sbw==
X-Received: by 2002:a05:600c:3b94:b0:434:9934:575 with SMTP id 5b1f17b1804b1-438913e02f8mr395787785e9.16.1737828836350;
        Sat, 25 Jan 2025 10:13:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Anthony PERARD <anthony@xenproject.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Jason Wang <jasowang@redhat.com>,
	qemu-ppc@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/9] hw/sysbus: Declare QOM types using DEFINE_TYPES() macro
Date: Sat, 25 Jan 2025 19:13:36 +0100
Message-ID: <20250125181343.59151-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250125181343.59151-1-philmd@linaro.org>
References: <20250125181343.59151-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/sysbus.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index f713bbfe04f..306f98406c0 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -80,13 +80,6 @@ static void system_bus_class_init(ObjectClass *klass, void *data)
     k->get_fw_dev_path = sysbus_get_fw_dev_path;
 }
 
-static const TypeInfo system_bus_info = {
-    .name = TYPE_SYSTEM_BUS,
-    .parent = TYPE_BUS,
-    .instance_size = sizeof(BusState),
-    .class_init = system_bus_class_init,
-};
-
 /* Check whether an IRQ source exists */
 bool sysbus_has_irq(SysBusDevice *dev, int n)
 {
@@ -306,15 +299,6 @@ static void sysbus_device_class_init(ObjectClass *klass, void *data)
     k->user_creatable = false;
 }
 
-static const TypeInfo sysbus_device_type_info = {
-    .name = TYPE_SYS_BUS_DEVICE,
-    .parent = TYPE_DEVICE,
-    .instance_size = sizeof(SysBusDevice),
-    .abstract = true,
-    .class_size = sizeof(SysBusDeviceClass),
-    .class_init = sysbus_device_class_init,
-};
-
 static BusState *main_system_bus;
 
 static void main_system_bus_create(void)
@@ -337,10 +321,21 @@ BusState *sysbus_get_default(void)
     return main_system_bus;
 }
 
-static void sysbus_register_types(void)
-{
-    type_register_static(&system_bus_info);
-    type_register_static(&sysbus_device_type_info);
-}
+static const TypeInfo sysbus_types[] = {
+    {
+        .name           = TYPE_SYSTEM_BUS,
+        .parent         = TYPE_BUS,
+        .instance_size  = sizeof(BusState),
+        .class_init     = system_bus_class_init,
+    },
+    {
+        .name           = TYPE_SYS_BUS_DEVICE,
+        .parent         = TYPE_DEVICE,
+        .instance_size  = sizeof(SysBusDevice),
+        .abstract       = true,
+        .class_size     = sizeof(SysBusDeviceClass),
+        .class_init     = sysbus_device_class_init,
+    },
+};
 
-type_init(sysbus_register_types)
+DEFINE_TYPES(sysbus_types)
-- 
2.47.1


