Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151138C226F
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 12:49:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719764.1122630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Nop-0000Nn-Dk; Fri, 10 May 2024 10:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719764.1122630; Fri, 10 May 2024 10:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Nop-0000LW-7O; Fri, 10 May 2024 10:49:39 +0000
Received: by outflank-mailman (input) for mailman id 719764;
 Fri, 10 May 2024 10:49:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Xy6=MN=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s5Non-0007sQ-Pf
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 10:49:37 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id feb9777f-0eba-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 12:49:37 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2e271acb015so23950491fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 03:49:37 -0700 (PDT)
Received: from m1x-phil.lan (sev93-h02-176-184-17-152.dsl.sta.abo.bbox.fr.
 [176.184.17.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fe004eae9sm42086695e9.1.2024.05.10.03.49.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 May 2024 03:49:36 -0700 (PDT)
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
X-Inumbo-ID: feb9777f-0eba-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715338177; x=1715942977; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TpUZ8CKDgQBKN9dqD4YnU9Z+7ud1E8NXp6jYp8jowk=;
        b=e7LX8ldC7IbLCg3cad21oVjET7xzBXL/XwYHj5BzLtk6xvTaqAVvBkCUqwCyc5g8CC
         54s9Lhi24PifFYcFAYkyjqvtLWMwhln4Pm+CUrzhaD2TtC9IXkBkgyLnJemN4I9UZBUz
         cPk0A6PNR0C4XawrVtPmoJHs+6LMtpjofob5pEO+HuVw2qYd758w62VI4srl0xlK+TUB
         2LB6BfptbrTCF85lDEiRDUBPEltcjLTVumaBdPCxq2e2tTsmsO1YYxaN92QqhFjyjTYN
         QoB8mNYrzPslogtzzOZAxoGVssrVzgV/XdD8xKg4/t2oJNTf1jhRtIFRUFhIRDXkz5LN
         5q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715338177; x=1715942977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TpUZ8CKDgQBKN9dqD4YnU9Z+7ud1E8NXp6jYp8jowk=;
        b=Qdhs6LcdfYlkpxjmz3qNNjSWCnYjfdZoi5UHFKeJKUOQpJ02jFFoBPWoX5kzHx3KnZ
         PCzyJwZtlweHWFM0SwI0+aqMbudBSMrP7610K83ubUbOHS0prqswAST6I5i5/8fKu4ch
         byO8GfKxhUFPW2rLomuNg5s34AMHEi0rMfbazJIq2L0zhPRB5DjmUBye43h0upOkb/d/
         0IP7o23CnpYPqdJ4UZQK2sJwZspyMbbTBWTBpeu7JJtTtHUKO/Y/YerducwdKp9KPbTu
         AHU56Rvs9rCCT0wugLmmkQegEzm043OnqQYBznhMkWRUCnOiuZjnCP3JNbfOxBQCoxgG
         4m4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvXjuvf9NLUrNDH9XvqOf7zN34lCRIPK6quNDa9ZlnsVv7GuVxFJE2rRXKwPGmB6vEkGLs/JxAhusaJ+ykQjYOcxT4+a/GgoNxT5O80VA=
X-Gm-Message-State: AOJu0YwprW/sBpaPMrKjUE8wIvqaaNxaB1hkean4sHEy5GsPo75Plw0m
	SedqL/gg5bmgxsWEU+WUDIP4wj6M4zlzAaDf88c0OX+sBWEdvrlLVY1KxodKiLY=
X-Google-Smtp-Source: AGHT+IF8RYJPL89SDGvqPQidQK0KvxqcH+BiwQtlAacHw890jlHQhQtuBmxCLpPl4I/7qfyZFdFshA==
X-Received: by 2002:a2e:93cf:0:b0:2e4:9606:6b86 with SMTP id 38308e7fff4ca-2e51fd42c6dmr14616001fa.8.1715338176994;
        Fri, 10 May 2024 03:49:36 -0700 (PDT)
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
Subject: [PATCH v2 4/7] hw/xen: Make XenDevOps structures const
Date: Fri, 10 May 2024 12:49:05 +0200
Message-ID: <20240510104908.76908-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240510104908.76908-1-philmd@linaro.org>
References: <20240510104908.76908-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Keep XenDevOps structures in .rodata.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-legacy-backend.h | 8 ++++----
 hw/9pfs/xen-9p-backend.c            | 2 +-
 hw/display/xenfb.c                  | 4 ++--
 hw/usb/xen-usb.c                    | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index 2b2e43c7e7..cfa43a984a 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -67,13 +67,13 @@ static inline void xen_be_unmap_grant_ref(struct XenLegacyDevice *xendev,
 }
 
 /* actual backend drivers */
-extern struct XenDevOps xen_kbdmouse_ops;     /* xen_framebuffer.c */
-extern struct XenDevOps xen_framebuffer_ops;  /* xen_framebuffer.c */
+extern const struct XenDevOps xen_kbdmouse_ops;     /* xen_framebuffer.c */
+extern const struct XenDevOps xen_framebuffer_ops;  /* xen_framebuffer.c */
 #ifdef CONFIG_VIRTFS
-extern struct XenDevOps xen_9pfs_ops;       /* xen-9p-backend.c        */
+extern const struct XenDevOps xen_9pfs_ops;         /* xen-9p-backend.c  */
 #endif
 #ifdef CONFIG_USB_LIBUSB
-extern struct XenDevOps xen_usb_ops;          /* xen-usb.c         */
+extern const struct XenDevOps xen_usb_ops;          /* xen-usb.c         */
 #endif
 
 /* configuration (aka xenbus setup) */
diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
index 4aa9c8c736..b1780eb819 100644
--- a/hw/9pfs/xen-9p-backend.c
+++ b/hw/9pfs/xen-9p-backend.c
@@ -513,7 +513,7 @@ static void xen_9pfs_alloc(struct XenLegacyDevice *xendev)
     xenstore_write_be_int(xendev, "max-ring-page-order", MAX_RING_ORDER);
 }
 
-struct XenDevOps xen_9pfs_ops = {
+const struct XenDevOps xen_9pfs_ops = {
     .size       = sizeof(Xen9pfsDev),
     .flags      = DEVOPS_FLAG_NEED_GNTDEV,
     .alloc      = xen_9pfs_alloc,
diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index b2130a0d70..dd83d0f5a5 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -972,7 +972,7 @@ static void fb_event(struct XenLegacyDevice *xendev)
 
 /* -------------------------------------------------------------------- */
 
-struct XenDevOps xen_kbdmouse_ops = {
+const struct XenDevOps xen_kbdmouse_ops = {
     .size       = sizeof(struct XenInput),
     .init       = input_init,
     .initialise = input_initialise,
@@ -981,7 +981,7 @@ struct XenDevOps xen_kbdmouse_ops = {
     .event      = input_event,
 };
 
-struct XenDevOps xen_framebuffer_ops = {
+const struct XenDevOps xen_framebuffer_ops = {
     .size       = sizeof(struct XenFB),
     .init       = fb_init,
     .initialise = fb_initialise,
diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
index 09ec326aea..95a901e81f 100644
--- a/hw/usb/xen-usb.c
+++ b/hw/usb/xen-usb.c
@@ -1083,7 +1083,7 @@ static void usbback_event(struct XenLegacyDevice *xendev)
     qemu_bh_schedule(usbif->bh);
 }
 
-struct XenDevOps xen_usb_ops = {
+const struct XenDevOps xen_usb_ops = {
     .size            = sizeof(struct usbback_info),
     .flags           = DEVOPS_FLAG_NEED_GNTDEV,
     .init            = usbback_init,
@@ -1102,7 +1102,7 @@ static int usbback_not_supported(void)
     return -EINVAL;
 }
 
-struct XenDevOps xen_usb_ops = {
+const struct XenDevOps xen_usb_ops = {
     .backend_register = usbback_not_supported,
 };
 
-- 
2.41.0


