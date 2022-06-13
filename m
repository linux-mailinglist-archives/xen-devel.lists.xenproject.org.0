Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F38B5484E8
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 13:37:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347972.574289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0iNa-00045C-Lp; Mon, 13 Jun 2022 11:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347972.574289; Mon, 13 Jun 2022 11:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0iNa-0003z8-D7; Mon, 13 Jun 2022 11:37:10 +0000
Received: by outflank-mailman (input) for mailman id 347972;
 Mon, 13 Jun 2022 11:37:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJWo=WU=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1o0iNY-0003eX-6p
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 11:37:08 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26cf7725-eb0d-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 13:37:06 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-38gwYqZlPOWMLeH1dIGXsA-1; Mon, 13 Jun 2022 07:37:02 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DE043C10226;
 Mon, 13 Jun 2022 11:37:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE3471410DDB;
 Mon, 13 Jun 2022 11:37:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1412E180091D; Mon, 13 Jun 2022 13:36:56 +0200 (CEST)
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
X-Inumbo-ID: 26cf7725-eb0d-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655120225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=70clork2yZyYjdUXKnsu9VZIWlpSX2dH9Nrdwr2C7Z4=;
	b=ht4pV8TG1aq9WsPR6cHCuvKjxaIAZea4KAc27RNujDs1wkTGlfb4WqGGD6F7/7UPkYAoh4
	SN3KF+2yvwuD0lcP731wOfQFiMRl4mtvUtruYAKfGHOiIhy1nb6iSZCKLJQ+2a/J0M7FyJ
	I2QWbXxfdZpEjwddEMM6fM9KGmx8Bxg=
X-MC-Unique: 38gwYqZlPOWMLeH1dIGXsA-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	xen-devel@lists.xenproject.org,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Canokeys.org" <contact@canokeys.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 04/16] hw/usb: Add CanoKey Implementation
Date: Mon, 13 Jun 2022 13:36:43 +0200
Message-Id: <20220613113655.3693872-5-kraxel@redhat.com>
In-Reply-To: <20220613113655.3693872-1-kraxel@redhat.com>
References: <20220613113655.3693872-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7

From: "Hongren (Zenithal) Zheng" <i@zenithal.me>

This commit added a new emulated device called CanoKey to QEMU.

CanoKey implements platform independent features in canokey-core
https://github.com/canokeys/canokey-core, and leaves the USB implementation
to the platform.

In this commit the USB part was implemented in QEMU using QEMU's USB APIs,
therefore the emulated CanoKey can communicate with the guest OS using USB.

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Message-Id: <YoY6Mgph6f6Hc/zI@Sun>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/canokey.h |  69 +++++++++++
 hw/usb/canokey.c | 300 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 369 insertions(+)
 create mode 100644 hw/usb/canokey.h
 create mode 100644 hw/usb/canokey.c

diff --git a/hw/usb/canokey.h b/hw/usb/canokey.h
new file mode 100644
index 000000000000..24cf30420346
--- /dev/null
+++ b/hw/usb/canokey.h
@@ -0,0 +1,69 @@
+/*
+ * CanoKey QEMU device header.
+ *
+ * Copyright (c) 2021-2022 Canokeys.org <contact@canokeys.org>
+ * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
+ *
+ * This code is licensed under the Apache-2.0.
+ */
+
+#ifndef CANOKEY_H
+#define CANOKEY_H
+
+#include "hw/qdev-core.h"
+
+#define TYPE_CANOKEY "canokey"
+#define CANOKEY(obj) \
+    OBJECT_CHECK(CanoKeyState, (obj), TYPE_CANOKEY)
+
+/*
+ * State of Canokey (i.e. hw/canokey.c)
+ */
+
+/* CTRL INTR BULK */
+#define CANOKEY_EP_NUM 3
+/* BULK/INTR IN can be up to 1352 bytes, e.g. get key info */
+#define CANOKEY_EP_IN_BUFFER_SIZE 2048
+/* BULK OUT can be up to 270 bytes, e.g. PIV import cert */
+#define CANOKEY_EP_OUT_BUFFER_SIZE 512
+
+typedef enum {
+    CANOKEY_EP_IN_WAIT,
+    CANOKEY_EP_IN_READY,
+    CANOKEY_EP_IN_STALL
+} CanoKeyEPState;
+
+typedef struct CanoKeyState {
+    USBDevice dev;
+
+    /* IN packets from canokey device loop */
+    uint8_t ep_in[CANOKEY_EP_NUM][CANOKEY_EP_IN_BUFFER_SIZE];
+    /*
+     * See canokey_emu_transmit
+     *
+     * For large INTR IN, receive multiple data from canokey device loop
+     * in this case ep_in_size would increase with every call
+     */
+    uint32_t ep_in_size[CANOKEY_EP_NUM];
+    /*
+     * Used in canokey_handle_data
+     * for IN larger than p->iov.size, we would do multiple handle_data()
+     *
+     * The difference between ep_in_pos and ep_in_size:
+     * We first increase ep_in_size to fill ep_in buffer in device_loop,
+     * then use ep_in_pos to submit data from ep_in buffer in handle_data
+     */
+    uint32_t ep_in_pos[CANOKEY_EP_NUM];
+    CanoKeyEPState ep_in_state[CANOKEY_EP_NUM];
+
+    /* OUT pointer to canokey recv buffer */
+    uint8_t *ep_out[CANOKEY_EP_NUM];
+    uint32_t ep_out_size[CANOKEY_EP_NUM];
+    /* For large BULK OUT, multiple write to ep_out is needed */
+    uint8_t ep_out_buffer[CANOKEY_EP_NUM][CANOKEY_EP_OUT_BUFFER_SIZE];
+
+    /* Properties */
+    char *file; /* canokey-file */
+} CanoKeyState;
+
+#endif /* CANOKEY_H */
diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
new file mode 100644
index 000000000000..6cb8b7cdb089
--- /dev/null
+++ b/hw/usb/canokey.c
@@ -0,0 +1,300 @@
+/*
+ * CanoKey QEMU device implementation.
+ *
+ * Copyright (c) 2021-2022 Canokeys.org <contact@canokeys.org>
+ * Written by Hongren (Zenithal) Zheng <i@zenithal.me>
+ *
+ * This code is licensed under the Apache-2.0.
+ */
+
+#include "qemu/osdep.h"
+#include <canokey-qemu.h>
+
+#include "qemu/module.h"
+#include "qapi/error.h"
+#include "hw/usb.h"
+#include "hw/qdev-properties.h"
+#include "desc.h"
+#include "canokey.h"
+
+#define CANOKEY_EP_IN(ep) ((ep) & 0x7F)
+
+#define CANOKEY_VENDOR_NUM     0x20a0
+#define CANOKEY_PRODUCT_NUM    0x42d2
+
+/*
+ * placeholder, canokey-qemu implements its own usb desc
+ * Namely we do not use usb_desc_handle_contorl
+ */
+enum {
+    STR_MANUFACTURER = 1,
+    STR_PRODUCT,
+    STR_SERIALNUMBER
+};
+
+static const USBDescStrings desc_strings = {
+    [STR_MANUFACTURER]     = "canokeys.org",
+    [STR_PRODUCT]          = "CanoKey QEMU",
+    [STR_SERIALNUMBER]     = "0"
+};
+
+static const USBDescDevice desc_device_canokey = {
+    .bcdUSB                        = 0x0,
+    .bMaxPacketSize0               = 16,
+    .bNumConfigurations            = 0,
+    .confs = NULL,
+};
+
+static const USBDesc desc_canokey = {
+    .id = {
+        .idVendor          = CANOKEY_VENDOR_NUM,
+        .idProduct         = CANOKEY_PRODUCT_NUM,
+        .bcdDevice         = 0x0100,
+        .iManufacturer     = STR_MANUFACTURER,
+        .iProduct          = STR_PRODUCT,
+        .iSerialNumber     = STR_SERIALNUMBER,
+    },
+    .full = &desc_device_canokey,
+    .high = &desc_device_canokey,
+    .str  = desc_strings,
+};
+
+
+/*
+ * libcanokey-qemu.so side functions
+ * All functions are called from canokey_emu_device_loop
+ */
+int canokey_emu_stall_ep(void *base, uint8_t ep)
+{
+    CanoKeyState *key = base;
+    uint8_t ep_in = CANOKEY_EP_IN(ep); /* INTR IN has ep 129 */
+    key->ep_in_size[ep_in] = 0;
+    key->ep_in_state[ep_in] = CANOKEY_EP_IN_STALL;
+    return 0;
+}
+
+int canokey_emu_set_address(void *base, uint8_t addr)
+{
+    CanoKeyState *key = base;
+    key->dev.addr = addr;
+    return 0;
+}
+
+int canokey_emu_prepare_receive(
+        void *base, uint8_t ep, uint8_t *pbuf, uint16_t size)
+{
+    CanoKeyState *key = base;
+    key->ep_out[ep] = pbuf;
+    key->ep_out_size[ep] = size;
+    return 0;
+}
+
+int canokey_emu_transmit(
+        void *base, uint8_t ep, const uint8_t *pbuf, uint16_t size)
+{
+    CanoKeyState *key = base;
+    uint8_t ep_in = CANOKEY_EP_IN(ep); /* INTR IN has ep 129 */
+    memcpy(key->ep_in[ep_in] + key->ep_in_size[ep_in],
+            pbuf, size);
+    key->ep_in_size[ep_in] += size;
+    key->ep_in_state[ep_in] = CANOKEY_EP_IN_READY;
+    /*
+     * ready for more data in device loop
+     *
+     * Note: this is a quirk for CanoKey CTAPHID
+     * because it calls multiple emu_transmit in one device_loop
+     * but w/o data_in it would stuck in device_loop
+     * This has no side effect for CCID as it is strictly
+     * OUT then IN transfer
+     * However it has side effect for Control transfer
+     */
+    if (ep_in != 0) {
+        canokey_emu_data_in(ep_in);
+    }
+    return 0;
+}
+
+uint32_t canokey_emu_get_rx_data_size(void *base, uint8_t ep)
+{
+    CanoKeyState *key = base;
+    return key->ep_out_size[ep];
+}
+
+/*
+ * QEMU side functions
+ */
+static void canokey_handle_reset(USBDevice *dev)
+{
+    CanoKeyState *key = CANOKEY(dev);
+    for (int i = 0; i != CANOKEY_EP_NUM; ++i) {
+        key->ep_in_state[i] = CANOKEY_EP_IN_WAIT;
+        key->ep_in_pos[i] = 0;
+        key->ep_in_size[i] = 0;
+    }
+    canokey_emu_reset();
+}
+
+static void canokey_handle_control(USBDevice *dev, USBPacket *p,
+               int request, int value, int index, int length, uint8_t *data)
+{
+    CanoKeyState *key = CANOKEY(dev);
+
+    canokey_emu_setup(request, value, index, length);
+
+    uint32_t dir_in = request & DeviceRequest;
+    if (!dir_in) {
+        /* OUT */
+        if (key->ep_out[0] != NULL) {
+            memcpy(key->ep_out[0], data, length);
+        }
+        canokey_emu_data_out(p->ep->nr, data);
+    }
+
+    canokey_emu_device_loop();
+
+    /* IN */
+    switch (key->ep_in_state[0]) {
+    case CANOKEY_EP_IN_WAIT:
+        p->status = USB_RET_NAK;
+        break;
+    case CANOKEY_EP_IN_STALL:
+        p->status = USB_RET_STALL;
+        break;
+    case CANOKEY_EP_IN_READY:
+        memcpy(data, key->ep_in[0], key->ep_in_size[0]);
+        p->actual_length = key->ep_in_size[0];
+        /* reset state */
+        key->ep_in_state[0] = CANOKEY_EP_IN_WAIT;
+        key->ep_in_size[0] = 0;
+        key->ep_in_pos[0] = 0;
+        break;
+    }
+}
+
+static void canokey_handle_data(USBDevice *dev, USBPacket *p)
+{
+    CanoKeyState *key = CANOKEY(dev);
+
+    uint8_t ep_in = CANOKEY_EP_IN(p->ep->nr);
+    uint8_t ep_out = p->ep->nr;
+    uint32_t in_len;
+    uint32_t out_pos;
+    uint32_t out_len;
+    switch (p->pid) {
+    case USB_TOKEN_OUT:
+        usb_packet_copy(p, key->ep_out_buffer[ep_out], p->iov.size);
+        out_pos = 0;
+        while (out_pos != p->iov.size) {
+            /*
+             * key->ep_out[ep_out] set by prepare_receive
+             * to be a buffer inside libcanokey-qemu.so
+             * key->ep_out_size[ep_out] set by prepare_receive
+             * to be the buffer length
+             */
+            out_len = MIN(p->iov.size - out_pos, key->ep_out_size[ep_out]);
+            memcpy(key->ep_out[ep_out],
+                    key->ep_out_buffer[ep_out] + out_pos, out_len);
+            out_pos += out_len;
+            /* update ep_out_size to actual len */
+            key->ep_out_size[ep_out] = out_len;
+            canokey_emu_data_out(ep_out, NULL);
+        }
+        break;
+    case USB_TOKEN_IN:
+        if (key->ep_in_pos[ep_in] == 0) { /* first time IN */
+            canokey_emu_data_in(ep_in);
+            canokey_emu_device_loop(); /* may call transmit multiple times */
+        }
+        switch (key->ep_in_state[ep_in]) {
+        case CANOKEY_EP_IN_WAIT:
+            /* NAK for early INTR IN */
+            p->status = USB_RET_NAK;
+            break;
+        case CANOKEY_EP_IN_STALL:
+            p->status = USB_RET_STALL;
+            break;
+        case CANOKEY_EP_IN_READY:
+            /* submit part of ep_in buffer to USBPacket */
+            in_len = MIN(key->ep_in_size[ep_in] - key->ep_in_pos[ep_in],
+                    p->iov.size);
+            usb_packet_copy(p,
+                    key->ep_in[ep_in] + key->ep_in_pos[ep_in], in_len);
+            key->ep_in_pos[ep_in] += in_len;
+            /* reset state if all data submitted */
+            if (key->ep_in_pos[ep_in] == key->ep_in_size[ep_in]) {
+                key->ep_in_state[ep_in] = CANOKEY_EP_IN_WAIT;
+                key->ep_in_size[ep_in] = 0;
+                key->ep_in_pos[ep_in] = 0;
+            }
+            break;
+        }
+        break;
+    default:
+        p->status = USB_RET_STALL;
+        break;
+    }
+}
+
+static void canokey_realize(USBDevice *base, Error **errp)
+{
+    CanoKeyState *key = CANOKEY(base);
+
+    if (key->file == NULL) {
+        error_setg(errp, "You must provide file=/path/to/canokey-file");
+        return;
+    }
+
+    usb_desc_init(base);
+
+    for (int i = 0; i != CANOKEY_EP_NUM; ++i) {
+        key->ep_in_state[i] = CANOKEY_EP_IN_WAIT;
+        key->ep_in_size[i] = 0;
+        key->ep_in_pos[i] = 0;
+    }
+
+    if (canokey_emu_init(key, key->file)) {
+        error_setg(errp, "canokey can not create or read %s", key->file);
+        return;
+    }
+}
+
+static void canokey_unrealize(USBDevice *base)
+{
+}
+
+static Property canokey_properties[] = {
+    DEFINE_PROP_STRING("file", CanoKeyState, file),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void canokey_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    USBDeviceClass *uc = USB_DEVICE_CLASS(klass);
+
+    uc->product_desc   = "CanoKey QEMU";
+    uc->usb_desc       = &desc_canokey;
+    uc->handle_reset   = canokey_handle_reset;
+    uc->handle_control = canokey_handle_control;
+    uc->handle_data    = canokey_handle_data;
+    uc->handle_attach  = usb_desc_attach;
+    uc->realize        = canokey_realize;
+    uc->unrealize      = canokey_unrealize;
+    dc->desc           = "CanoKey QEMU";
+    device_class_set_props(dc, canokey_properties);
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static const TypeInfo canokey_info = {
+    .name = TYPE_CANOKEY,
+    .parent = TYPE_USB_DEVICE,
+    .instance_size = sizeof(CanoKeyState),
+    .class_init = canokey_class_init
+};
+
+static void canokey_register_types(void)
+{
+    type_register_static(&canokey_info);
+}
+
+type_init(canokey_register_types)
-- 
2.36.1


