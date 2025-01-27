Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26841A1D3AE
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 10:42:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877505.1287638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcLcp-0008O0-89; Mon, 27 Jan 2025 09:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877505.1287638; Mon, 27 Jan 2025 09:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcLcp-0008Ln-4l; Mon, 27 Jan 2025 09:41:47 +0000
Received: by outflank-mailman (input) for mailman id 877505;
 Mon, 27 Jan 2025 09:41:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wC6S=UT=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1tcLco-0008Lf-2R
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 09:41:46 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebb1ed3e-dc92-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 10:41:45 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d3d479b1e6so6102930a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 01:41:45 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-093-128-047-181.93.128.pool.telefonica.de. [93.128.47.181])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc18619265sm5140631a12.7.2025.01.27.01.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 01:41:43 -0800 (PST)
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
X-Inumbo-ID: ebb1ed3e-dc92-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737970904; x=1738575704; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjPzdHFXd2uRfONBBPJoicdiCvhjmel6wJx9kp25WTk=;
        b=Kx/WanjdicbfIxpC/1M0/Xp9oqO9cvJKQ89MntymSn3NMS1kQckEdfqJu527765dKL
         V2AhvOrD6WrQA56SntujIUhzohqM7/QdXf4XKPVpNtADfMFYTfTw5Q0Kq3N9i664NsmA
         pg7dqLKzcpdfntCzyV1Y7zZwn/FsSZ+5sVhgeAJJG47GHcIP3AHrBesr7GaYKYMM5jNq
         5S3cjOYQdG+wqEi8ClYxdQivbBS0LpxaIU9EtIg0vkkfxfsGVcTeUB3VKsemd+OcoFhh
         bjptWamBmt9UKfRVKl/LEIXkpTvmxkzDwKdL/H42gYQ6ZFbm0uFuURLwCmZ0v3HYxTh8
         OJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737970904; x=1738575704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjPzdHFXd2uRfONBBPJoicdiCvhjmel6wJx9kp25WTk=;
        b=obHw+5DFURygvtvsc3/5Kws5zKiTYT2tcNSfW7EHUshA19UaQWbcitvsVfmN2iFfDY
         Oypr7zjOeIRf9g0KSGTkSn+E26nc8z8+PsUBhhZH8BUu3U1t441kqSapaHC+7iWKv6T0
         /Bw5p6BBfFCvM4yZhpsOFLop9a4M4MKeIzoK5L4jnx2x0zDs78dlV4DE6a5+Mv9ndZr5
         rR4bYj8EYApbJHs74OjIRk+sVAYd52xabP0O8XG4L3w2IBSc0cbNahfihbjGoe7UWPkv
         9qgKsUS0AuUYQRamessDH3mejmY3Uk3rkReiLS9F0ibJJIxOleWxldL9utYYYLoTi5Zk
         h9Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVJBQPibXpk6P0aE68SUisIloYEeGgsXv2lYHijR599zQDfAyziIs5qVvgNOJti8bO/CKR+m6swjgU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNM1hMB6kcxLTt4KuKHeKNKrRwlpBNL2UTjPMf8LEYalC2wSn7
	LK24FuhPOq3EErniN6TcYk/M59eG8LZLJX8Qc0bxfJFeguUbVAd7
X-Gm-Gg: ASbGnctezdIHcJEUj+8kGvJwPKqdvkLUDJfak2QCvAUJy7z7Pkv26A1jp062s6UGq5l
	KFWcDI9GOCwlonLjr+qlvwmSNLgxnqHXmUUYyOcArLcgFJfm4VviCFzioMX/8slqq8dzq3gng8n
	c9KV00o5RDvSt9zmquooi2IB9c7+BKhwskKc9dArVGj/A5iO1gJH4dT2XUphIekhdeAwk3ALbp6
	BfK9ZdwX17pfkDLMmceKVQU/VwoFD5az/oGZ5Y/LpFvMiBFYq7fQOkP7GgNIhUlKpvmRyM4pPdT
	rxSsnUf332fasckLCt5SXr1zKtFpo091AsOIHQoKqXtTq/ZGnVQIIGdrRUwTZ5DJM2oK3A==
X-Google-Smtp-Source: AGHT+IFkv/KhCLVJUxMspAgUNe0GHT45E89xP1HqZLFbEuM2gS84XOsj/ALx/tTzcGTUQZwwVlsNIQ==
X-Received: by 2002:a05:6402:50d4:b0:5d0:cfad:f71 with SMTP id 4fb4d7f45d1cf-5db7db2bea3mr93510860a12.32.1737970904204;
        Mon, 27 Jan 2025 01:41:44 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH] hw/*/xen*: Prefer QOM cast for XenLegacyDevice
Date: Mon, 27 Jan 2025 10:41:29 +0100
Message-ID: <20250127094129.15941-1-shentey@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125181343.59151-10-philmd@linaro.org>
References: <20250125181343.59151-10-philmd@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Makes the code less sensitive regarding changes in the class hierarchy which
will be performed in the next patch.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/usb/xen-usb.c            | 6 +++---
 hw/xen/xen-legacy-backend.c | 2 +-
 hw/xen/xen_pvdev.c          | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
index 13901625c0..3da30efc44 100644
--- a/hw/usb/xen-usb.c
+++ b/hw/usb/xen-usb.c
@@ -755,10 +755,10 @@ static void usbback_portid_add(struct usbback_info *usbif, unsigned port,
 
     qdict = qdict_new();
     qdict_put_str(qdict, "driver", "usb-host");
-    tmp = g_strdup_printf("%s.0", usbif->xendev.qdev.id);
+    tmp = g_strdup_printf("%s.0", DEVICE(&usbif->xendev)->id);
     qdict_put_str(qdict, "bus", tmp);
     g_free(tmp);
-    tmp = g_strdup_printf("%s-%u", usbif->xendev.qdev.id, port);
+    tmp = g_strdup_printf("%s-%u", DEVICE(&usbif->xendev)->id, port);
     qdict_put_str(qdict, "id", tmp);
     g_free(tmp);
     qdict_put_int(qdict, "port", port);
@@ -1022,7 +1022,7 @@ static void usbback_alloc(struct XenLegacyDevice *xendev)
     usbif = container_of(xendev, struct usbback_info, xendev);
 
     usb_bus_new(&usbif->bus, sizeof(usbif->bus), &xen_usb_bus_ops,
-                DEVICE(&xendev->qdev));
+                DEVICE(xendev));
     for (i = 0; i < USBBACK_MAXPORTS; i++) {
         p = &(usbif->ports[i].port);
         usb_register_port(&usbif->bus, p, usbif, i, &xen_usb_port_ops,
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 118c571b3a..ca2fe0e6b3 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -163,7 +163,7 @@ static struct XenLegacyDevice *xen_be_get_xendev(const char *type, int dom,
 
     /* init new xendev */
     xendev = g_malloc0(ops->size);
-    object_initialize(&xendev->qdev, ops->size, TYPE_XENBACKEND);
+    object_initialize(xendev, ops->size, TYPE_XENBACKEND);
     OBJECT(xendev)->free = g_free;
     qdev_set_id(DEVICE(xendev), g_strdup_printf("xen-%s-%d", type, dev),
                 &error_fatal);
diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index c9143ba259..fe95b62d13 100644
--- a/hw/xen/xen_pvdev.c
+++ b/hw/xen/xen_pvdev.c
@@ -273,7 +273,7 @@ void xen_pv_del_xendev(struct XenLegacyDevice *xendev)
 
     QTAILQ_REMOVE(&xendevs, xendev, next);
 
-    qdev_unplug(&xendev->qdev, NULL);
+    qdev_unplug(DEVICE(xendev), NULL);
 }
 
 void xen_pv_insert_xendev(struct XenLegacyDevice *xendev)
-- 
2.48.1


