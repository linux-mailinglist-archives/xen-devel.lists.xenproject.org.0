Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9BB8C2269
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 12:49:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719762.1122621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Noj-0008K9-4z; Fri, 10 May 2024 10:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719762.1122621; Fri, 10 May 2024 10:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Noj-0008HV-07; Fri, 10 May 2024 10:49:33 +0000
Received: by outflank-mailman (input) for mailman id 719762;
 Fri, 10 May 2024 10:49:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Xy6=MN=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s5Noh-0007MJ-Ou
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 10:49:31 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa5aefe3-0eba-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 12:49:30 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41b2119da94so12276475e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 03:49:30 -0700 (PDT)
Received: from m1x-phil.lan (sev93-h02-176-184-17-152.dsl.sta.abo.bbox.fr.
 [176.184.17.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce2580sm58674215e9.18.2024.05.10.03.49.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 May 2024 03:49:29 -0700 (PDT)
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
X-Inumbo-ID: fa5aefe3-0eba-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715338169; x=1715942969; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLydyXWVq+dvuttt9ieifXl3jWWZU+LQZOiqeB7g+WE=;
        b=YaRAKhpNMVRrQIrZ80PwU3rbfxaLvgjW4SiRcIGQ5kf+8oDfoMO0sE58LCe0UAJh8g
         vOTvD8tgz/lyDNFL35xVPyA8ouWEd/26fAz/qKGTZM19TAJPAsNMt7JKLCSIKns4rr97
         P0RfzXUVyfxRut6PSgeNsbke62evzwW8I0OPKYJZZHmc/95QU/pZgJ0Up/EvXjya5Zu/
         ylHPWAE3nW3d8DfeueGEgrPGLdKlH2tg0wcMI1TbJyfLEangrQbPCohD93Fj19YCZaLW
         GynwdBVylaaCF1Sz008eYMc5ckEJHQOKlMgBZ4VnOmpWatISSIJFMJhmeUuOPCFwYIuH
         4szQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715338169; x=1715942969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLydyXWVq+dvuttt9ieifXl3jWWZU+LQZOiqeB7g+WE=;
        b=Zw7VqXMCkpzpOCnp3EBcdcLBRabCUvZzRIYL2g0jV7a8pkgdFe4/jTdozp4AflDF8t
         EMQJ3gkTnxhE5MEFkfJgNjqU5n5V4D8dGHstL6LdLLSo+6xbnVRrKLAWuquQs4D47seu
         H8yEDJWlLUiJ8xr/8lhPicFgV9RZbQ9xqJ4O8rfFnacUtG/AEePrGo0hgHJ1jQKYnyNu
         jlLB7JFxqP+Bf2p22FWP7joSjmIYb4UbOyzIuDzLuJYgV6YtiT0H1S7lHjsCOFFYqGYx
         YgZxCTl4f2biJ/pAQR0qJFzbf0uFbTVTruq5Tu8u4+Z9U5jIBRO3NK07ObnyPEc7rCeH
         mrIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVfoDiqpTpK5mYY3IA2uX7nOKNz8ErAE5LQJwATfoGtfuOo374PKQziA8qBQNNwPeilzDqlEEf09q4OUV7e/hhRLWDayeWhSkrqpeKw+4=
X-Gm-Message-State: AOJu0YwQx1Tf71UtFrdGG54pWHGNibT+PjF6xjxfr6z6Gykw6gC8NICD
	h5Kei48tIAVkRrVapvQf0t5apQk1HOr4M+prhrmbyWYyDq0lAuQq8eMgRY6Udw8=
X-Google-Smtp-Source: AGHT+IHGIbDdIaTxFsBrR2IWNVmIfQPPJ+675dXTXWbJ7moWgoCOFX7c+yR+LoYYFbbyaZxuWDMrRA==
X-Received: by 2002:a05:600c:3b26:b0:419:f241:633c with SMTP id 5b1f17b1804b1-41feaa2f3b9mr18911745e9.4.1715338169611;
        Fri, 10 May 2024 03:49:29 -0700 (PDT)
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
Subject: [PATCH v2 3/7] hw/xen: Constify xenstore_be::XenDevOps
Date: Fri, 10 May 2024 12:49:04 +0200
Message-ID: <20240510104908.76908-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240510104908.76908-1-philmd@linaro.org>
References: <20240510104908.76908-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

XenDevOps @ops is not updated, mark it const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/xen/xen-legacy-backend.h | 2 +-
 hw/xen/xen-legacy-backend.c         | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index eb22633caa..2b2e43c7e7 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -40,7 +40,7 @@ void xen_be_check_state(struct XenLegacyDevice *xendev);
 
 /* xen backend driver bits */
 void xen_be_init(void);
-int xen_be_register(const char *type, struct XenDevOps *ops);
+int xen_be_register(const char *type, const struct XenDevOps *ops);
 int xen_be_set_state(struct XenLegacyDevice *xendev, enum xenbus_state state);
 int xen_be_bind_evtchn(struct XenLegacyDevice *xendev);
 void xen_be_set_max_grant_refs(struct XenLegacyDevice *xendev,
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 35f2b57560..4dc3a561cf 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -520,7 +520,7 @@ void xen_be_check_state(struct XenLegacyDevice *xendev)
 struct xenstore_be {
     const char *type;
     int dom;
-    struct XenDevOps *ops;
+    const struct XenDevOps *ops;
 };
 
 static void xenstore_update_be(void *opaque, const char *watch)
@@ -557,7 +557,7 @@ static void xenstore_update_be(void *opaque, const char *watch)
     }
 }
 
-static int xenstore_scan(const char *type, int dom, struct XenDevOps *ops)
+static int xenstore_scan(const char *type, int dom, const struct XenDevOps *ops)
 {
     struct XenLegacyDevice *xendev;
     char path[XEN_BUFSIZE];
@@ -632,7 +632,7 @@ void xen_be_init(void)
 #endif
 }
 
-int xen_be_register(const char *type, struct XenDevOps *ops)
+int xen_be_register(const char *type, const struct XenDevOps *ops)
 {
     char path[50];
     int rc;
-- 
2.41.0


