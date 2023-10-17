Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8267CC41C
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 15:13:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618247.961654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsjsa-0008CG-I0; Tue, 17 Oct 2023 13:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618247.961654; Tue, 17 Oct 2023 13:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsjsa-00089U-Ek; Tue, 17 Oct 2023 13:13:00 +0000
Received: by outflank-mailman (input) for mailman id 618247;
 Tue, 17 Oct 2023 13:12:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oOJq=F7=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qsjsZ-00089O-8u
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 13:12:59 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e315195b-6cee-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 15:12:56 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40776b1ff73so33028705e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Oct 2023 06:12:56 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.33])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a1c7707000000b0040586360a36sm9759389wmi.17.2023.10.17.06.12.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Oct 2023 06:12:54 -0700 (PDT)
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
X-Inumbo-ID: e315195b-6cee-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697548376; x=1698153176; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MJO7DWWRMp74wYPOl7vPeEwkKht+ldFkzgAjlIPhGCE=;
        b=II0qDzjawmtzmFPi9cT2nVhB0TsQvNZzfex+oufcu2r308RL+xAgMG7+txJDJJzTqK
         BsWScCmIxBO7vg9o64u5G7PxwtJgNyIH60evQ3fQ198SLDkEjrPYQxibr6cgVRodtRu6
         QtVuKZLqUOayyLrzP5VpX/RJ3E/fozP9iYat+diSld9FNVQBjjRNt0czvjV3zgl0Wkn9
         EMTC00BG7M7f849Dt9hAJ0Rk2P1kOUy4HwIIIrRABrifHTWA4Snla2Fh7SNiKDcSvl3Y
         2YuQBJmm1bFZJimXQxNNtoghusdV3w+eeKRb/+61e1iT9y9kag9GHZz+yqFEfX11fHsa
         HTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548376; x=1698153176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJO7DWWRMp74wYPOl7vPeEwkKht+ldFkzgAjlIPhGCE=;
        b=Qvfx1yfeT2d7bMFWivM64NMrnB9QXYnNEje10ETHV8TvQq5OauSPXzrLDC7VgdeU+m
         WluXt5e27fEOBxiGwEV3ira57lx4jHBmWew9+wl9vNED9LxWu8WEeOreJGiiyHD1AgTJ
         sQ2zQrK41PL1PPJOHpGnxhKGN+iPgkxHtXEuMl8bXGZTcn+zoikalNiFQEZ4s3jFzpQ7
         vC6Fjcwu1w+9NVs4ivwdDUbh/ZL4sxMzM99hgz0yMkD6kTiw+FuLBumYGqfx/BM94roH
         f+Dn/V25ZwYrdJJe0fJdtL2BfVS9lMJe0fY/N2WKrr4T9lLKWJffo9NQ6F3SCBpgYEPJ
         TzDw==
X-Gm-Message-State: AOJu0Yx1sqL05Jb6jNAlBQs62fO2llpYHHK9kWYcES2yrQutHWLei7Vh
	vZOKaU4qYt1GioJEyLk6pX6TBg==
X-Google-Smtp-Source: AGHT+IGxy9d5wwgEu6D2b+uBg62HQt7DkljhO8VGs4e6HBhThmjfwChLZNZkDn086W1jhpisP8ep9A==
X-Received: by 2002:a05:600c:1c29:b0:406:5227:86f0 with SMTP id j41-20020a05600c1c2900b00406522786f0mr1787564wms.5.1697548374787;
        Tue, 17 Oct 2023 06:12:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-ppc@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] ui/input: Constify QemuInputHandler structure
Date: Tue, 17 Oct 2023 15:12:51 +0200
Message-ID: <20231017131251.43708-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Access to QemuInputHandlerState::handler are read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/virtio/virtio-input.h | 2 +-
 include/ui/input.h               | 2 +-
 chardev/msmouse.c                | 2 +-
 chardev/wctablet.c               | 2 +-
 hw/char/escc.c                   | 2 +-
 hw/display/xenfb.c               | 6 +++---
 hw/input/adb-kbd.c               | 2 +-
 hw/input/hid.c                   | 6 +++---
 hw/input/ps2.c                   | 4 ++--
 hw/input/virtio-input-hid.c      | 8 ++++----
 ui/input-legacy.c                | 2 +-
 ui/input.c                       | 4 ++--
 ui/vdagent.c                     | 2 +-
 13 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/hw/virtio/virtio-input.h b/include/hw/virtio/virtio-input.h
index 08f1591424..a6c9703644 100644
--- a/include/hw/virtio/virtio-input.h
+++ b/include/hw/virtio/virtio-input.h
@@ -84,7 +84,7 @@ struct VirtIOInputHID {
     VirtIOInput                       parent_obj;
     char                              *display;
     uint32_t                          head;
-    QemuInputHandler                  *handler;
+    const QemuInputHandler            *handler;
     QemuInputHandlerState             *hs;
     int                               ledstate;
     bool                              wheel_axis;
diff --git a/include/ui/input.h b/include/ui/input.h
index 24d8e4579e..8f9aac562e 100644
--- a/include/ui/input.h
+++ b/include/ui/input.h
@@ -30,7 +30,7 @@ struct QemuInputHandler {
 };
 
 QemuInputHandlerState *qemu_input_handler_register(DeviceState *dev,
-                                                   QemuInputHandler *handler);
+                                            const QemuInputHandler *handler);
 void qemu_input_handler_activate(QemuInputHandlerState *s);
 void qemu_input_handler_deactivate(QemuInputHandlerState *s);
 void qemu_input_handler_unregister(QemuInputHandlerState *s);
diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index ab8fe981d6..a774c397b4 100644
--- a/chardev/msmouse.c
+++ b/chardev/msmouse.c
@@ -171,7 +171,7 @@ static int msmouse_chr_write(struct Chardev *s, const uint8_t *buf, int len)
     return len;
 }
 
-static QemuInputHandler msmouse_handler = {
+static const QemuInputHandler msmouse_handler = {
     .name  = "QEMU Microsoft Mouse",
     .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
     .event = msmouse_input_event,
diff --git a/chardev/wctablet.c b/chardev/wctablet.c
index 43bdf6b608..f4008bf35b 100644
--- a/chardev/wctablet.c
+++ b/chardev/wctablet.c
@@ -178,7 +178,7 @@ static void wctablet_input_sync(DeviceState *dev)
     }
 }
 
-static QemuInputHandler wctablet_handler = {
+static const QemuInputHandler wctablet_handler = {
     .name  = "QEMU Wacom Pen Tablet",
     .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_ABS,
     .event = wctablet_input_event,
diff --git a/hw/char/escc.c b/hw/char/escc.c
index 4be66053c1..48b30ee760 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -845,7 +845,7 @@ static void sunkbd_handle_event(DeviceState *dev, QemuConsole *src,
     put_queue(s, keycode);
 }
 
-static QemuInputHandler sunkbd_handler = {
+static const QemuInputHandler sunkbd_handler = {
     .name  = "sun keyboard",
     .mask  = INPUT_EVENT_MASK_KEY,
     .event = sunkbd_handle_event,
diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index 0074a9b6f8..b2130a0d70 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -321,20 +321,20 @@ static void xenfb_mouse_sync(DeviceState *dev)
     xenfb->wheel = 0;
 }
 
-static QemuInputHandler xenfb_keyboard = {
+static const QemuInputHandler xenfb_keyboard = {
     .name  = "Xen PV Keyboard",
     .mask  = INPUT_EVENT_MASK_KEY,
     .event = xenfb_key_event,
 };
 
-static QemuInputHandler xenfb_abs_mouse = {
+static const QemuInputHandler xenfb_abs_mouse = {
     .name  = "Xen PV Mouse",
     .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_ABS,
     .event = xenfb_mouse_event,
     .sync  = xenfb_mouse_sync,
 };
 
-static QemuInputHandler xenfb_rel_mouse = {
+static const QemuInputHandler xenfb_rel_mouse = {
     .name  = "Xen PV Mouse",
     .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
     .event = xenfb_mouse_event,
diff --git a/hw/input/adb-kbd.c b/hw/input/adb-kbd.c
index a9088c910c..e21edf9acd 100644
--- a/hw/input/adb-kbd.c
+++ b/hw/input/adb-kbd.c
@@ -355,7 +355,7 @@ static void adb_kbd_reset(DeviceState *dev)
     s->count = 0;
 }
 
-static QemuInputHandler adb_keyboard_handler = {
+static const QemuInputHandler adb_keyboard_handler = {
     .name  = "QEMU ADB Keyboard",
     .mask  = INPUT_EVENT_MASK_KEY,
     .event = adb_keyboard_event,
diff --git a/hw/input/hid.c b/hw/input/hid.c
index a9c7dd1ce1..b8e85374ca 100644
--- a/hw/input/hid.c
+++ b/hw/input/hid.c
@@ -510,20 +510,20 @@ void hid_free(HIDState *hs)
     hid_del_idle_timer(hs);
 }
 
-static QemuInputHandler hid_keyboard_handler = {
+static const QemuInputHandler hid_keyboard_handler = {
     .name  = "QEMU HID Keyboard",
     .mask  = INPUT_EVENT_MASK_KEY,
     .event = hid_keyboard_event,
 };
 
-static QemuInputHandler hid_mouse_handler = {
+static const QemuInputHandler hid_mouse_handler = {
     .name  = "QEMU HID Mouse",
     .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
     .event = hid_pointer_event,
     .sync  = hid_pointer_sync,
 };
 
-static QemuInputHandler hid_tablet_handler = {
+static const QemuInputHandler hid_tablet_handler = {
     .name  = "QEMU HID Tablet",
     .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_ABS,
     .event = hid_pointer_event,
diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 45af76a837..c8fd23cf36 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1231,7 +1231,7 @@ static const VMStateDescription vmstate_ps2_mouse = {
     }
 };
 
-static QemuInputHandler ps2_keyboard_handler = {
+static const QemuInputHandler ps2_keyboard_handler = {
     .name  = "QEMU PS/2 Keyboard",
     .mask  = INPUT_EVENT_MASK_KEY,
     .event = ps2_keyboard_event,
@@ -1242,7 +1242,7 @@ static void ps2_kbd_realize(DeviceState *dev, Error **errp)
     qemu_input_handler_register(dev, &ps2_keyboard_handler);
 }
 
-static QemuInputHandler ps2_mouse_handler = {
+static const QemuInputHandler ps2_mouse_handler = {
     .name  = "QEMU PS/2 Mouse",
     .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
     .event = ps2_mouse_event,
diff --git a/hw/input/virtio-input-hid.c b/hw/input/virtio-input-hid.c
index 7053ad72d4..45e4d4c75d 100644
--- a/hw/input/virtio-input-hid.c
+++ b/hw/input/virtio-input-hid.c
@@ -265,7 +265,7 @@ static const TypeInfo virtio_input_hid_info = {
 
 /* ----------------------------------------------------------------- */
 
-static QemuInputHandler virtio_keyboard_handler = {
+static const QemuInputHandler virtio_keyboard_handler = {
     .name  = VIRTIO_ID_NAME_KEYBOARD,
     .mask  = INPUT_EVENT_MASK_KEY,
     .event = virtio_input_handle_event,
@@ -322,7 +322,7 @@ static const TypeInfo virtio_keyboard_info = {
 
 /* ----------------------------------------------------------------- */
 
-static QemuInputHandler virtio_mouse_handler = {
+static const QemuInputHandler virtio_mouse_handler = {
     .name  = VIRTIO_ID_NAME_MOUSE,
     .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_REL,
     .event = virtio_input_handle_event,
@@ -416,7 +416,7 @@ static const TypeInfo virtio_mouse_info = {
 
 /* ----------------------------------------------------------------- */
 
-static QemuInputHandler virtio_tablet_handler = {
+static const QemuInputHandler virtio_tablet_handler = {
     .name  = VIRTIO_ID_NAME_TABLET,
     .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_ABS,
     .event = virtio_input_handle_event,
@@ -541,7 +541,7 @@ static const TypeInfo virtio_tablet_info = {
 
 /* ----------------------------------------------------------------- */
 
-static QemuInputHandler virtio_multitouch_handler = {
+static const QemuInputHandler virtio_multitouch_handler = {
     .name  = VIRTIO_ID_NAME_MULTITOUCH,
     .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_MTT,
     .event = virtio_input_handle_event,
diff --git a/ui/input-legacy.c b/ui/input-legacy.c
index 46ea74e44d..210ae5eaca 100644
--- a/ui/input-legacy.c
+++ b/ui/input-legacy.c
@@ -127,7 +127,7 @@ static void legacy_kbd_event(DeviceState *dev, QemuConsole *src,
     }
 }
 
-static QemuInputHandler legacy_kbd_handler = {
+static const QemuInputHandler legacy_kbd_handler = {
     .name  = "legacy-kbd",
     .mask  = INPUT_EVENT_MASK_KEY,
     .event = legacy_kbd_event,
diff --git a/ui/input.c b/ui/input.c
index cbe8573c5c..dc745860f4 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -10,7 +10,7 @@
 
 struct QemuInputHandlerState {
     DeviceState       *dev;
-    QemuInputHandler  *handler;
+    const QemuInputHandler *handler;
     int               id;
     int               events;
     QemuConsole       *con;
@@ -46,7 +46,7 @@ static uint32_t queue_count;
 static uint32_t queue_limit = 1024;
 
 QemuInputHandlerState *qemu_input_handler_register(DeviceState *dev,
-                                                   QemuInputHandler *handler)
+                                            const QemuInputHandler *handler)
 {
     QemuInputHandlerState *s = g_new0(QemuInputHandlerState, 1);
     static int id = 1;
diff --git a/ui/vdagent.c b/ui/vdagent.c
index 00d36a8677..706d6d97bd 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -297,7 +297,7 @@ static void vdagent_pointer_sync(DeviceState *dev)
     }
 }
 
-static QemuInputHandler vdagent_mouse_handler = {
+static const QemuInputHandler vdagent_mouse_handler = {
     .name  = "vdagent mouse",
     .mask  = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_ABS,
     .event = vdagent_pointer_event,
-- 
2.41.0


