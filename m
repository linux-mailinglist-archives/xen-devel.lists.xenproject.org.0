Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAEB5484E2
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 13:37:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347975.574316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0iNc-0004dD-GJ; Mon, 13 Jun 2022 11:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347975.574316; Mon, 13 Jun 2022 11:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0iNc-0004RS-3V; Mon, 13 Jun 2022 11:37:12 +0000
Received: by outflank-mailman (input) for mailman id 347975;
 Mon, 13 Jun 2022 11:37:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJWo=WU=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1o0iNa-0003eY-66
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 11:37:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27558830-eb0d-11ec-bd2c-47488cf2e6aa;
 Mon, 13 Jun 2022 13:37:07 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-0fjs8QgvNs-urwr1APxO5Q-1; Mon, 13 Jun 2022 07:37:02 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FD5380B90D;
 Mon, 13 Jun 2022 11:37:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEE1B1410F34;
 Mon, 13 Jun 2022 11:37:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 23AC31800925; Mon, 13 Jun 2022 13:36:56 +0200 (CEST)
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
X-Inumbo-ID: 27558830-eb0d-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655120226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XMFb51C69E0Si128czVwJqlqgwkrMEmsc4JCjQtiyLU=;
	b=SZcXq/grJ5Bjkjgyeo1d+NkA8ZH5NUPw9Iy0UmL9f0oIIRJqsq/o/mGvW+nJnjlmCvvI71
	FyRBitZXPk7jHqabIKJmJ8NFAu0C4bu+3ffhL5hy6K02wYnRCsmMz68mCgPdGfa4FR/eBG
	Z9sGMozsUSMcHkeNgeEI7Vh3MgwdTU8=
X-MC-Unique: 0fjs8QgvNs-urwr1APxO5Q-1
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
Subject: [PULL 05/16] hw/usb/canokey: Add trace events
Date: Mon, 13 Jun 2022 13:36:44 +0200
Message-Id: <20220613113655.3693872-6-kraxel@redhat.com>
In-Reply-To: <20220613113655.3693872-1-kraxel@redhat.com>
References: <20220613113655.3693872-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7

From: "Hongren (Zenithal) Zheng" <i@zenithal.me>

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Message-Id: <YoY6RoDKQIxSkFwL@Sun>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/canokey.c    | 13 +++++++++++++
 hw/usb/trace-events | 16 ++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
index 6cb8b7cdb089..4a08b1cbd776 100644
--- a/hw/usb/canokey.c
+++ b/hw/usb/canokey.c
@@ -14,6 +14,7 @@
 #include "qapi/error.h"
 #include "hw/usb.h"
 #include "hw/qdev-properties.h"
+#include "trace.h"
 #include "desc.h"
 #include "canokey.h"
 
@@ -66,6 +67,7 @@ static const USBDesc desc_canokey = {
  */
 int canokey_emu_stall_ep(void *base, uint8_t ep)
 {
+    trace_canokey_emu_stall_ep(ep);
     CanoKeyState *key = base;
     uint8_t ep_in = CANOKEY_EP_IN(ep); /* INTR IN has ep 129 */
     key->ep_in_size[ep_in] = 0;
@@ -75,6 +77,7 @@ int canokey_emu_stall_ep(void *base, uint8_t ep)
 
 int canokey_emu_set_address(void *base, uint8_t addr)
 {
+    trace_canokey_emu_set_address(addr);
     CanoKeyState *key = base;
     key->dev.addr = addr;
     return 0;
@@ -83,6 +86,7 @@ int canokey_emu_set_address(void *base, uint8_t addr)
 int canokey_emu_prepare_receive(
         void *base, uint8_t ep, uint8_t *pbuf, uint16_t size)
 {
+    trace_canokey_emu_prepare_receive(ep, size);
     CanoKeyState *key = base;
     key->ep_out[ep] = pbuf;
     key->ep_out_size[ep] = size;
@@ -92,6 +96,7 @@ int canokey_emu_prepare_receive(
 int canokey_emu_transmit(
         void *base, uint8_t ep, const uint8_t *pbuf, uint16_t size)
 {
+    trace_canokey_emu_transmit(ep, size);
     CanoKeyState *key = base;
     uint8_t ep_in = CANOKEY_EP_IN(ep); /* INTR IN has ep 129 */
     memcpy(key->ep_in[ep_in] + key->ep_in_size[ep_in],
@@ -125,6 +130,7 @@ uint32_t canokey_emu_get_rx_data_size(void *base, uint8_t ep)
  */
 static void canokey_handle_reset(USBDevice *dev)
 {
+    trace_canokey_handle_reset();
     CanoKeyState *key = CANOKEY(dev);
     for (int i = 0; i != CANOKEY_EP_NUM; ++i) {
         key->ep_in_state[i] = CANOKEY_EP_IN_WAIT;
@@ -137,6 +143,7 @@ static void canokey_handle_reset(USBDevice *dev)
 static void canokey_handle_control(USBDevice *dev, USBPacket *p,
                int request, int value, int index, int length, uint8_t *data)
 {
+    trace_canokey_handle_control_setup(request, value, index, length);
     CanoKeyState *key = CANOKEY(dev);
 
     canokey_emu_setup(request, value, index, length);
@@ -144,6 +151,7 @@ static void canokey_handle_control(USBDevice *dev, USBPacket *p,
     uint32_t dir_in = request & DeviceRequest;
     if (!dir_in) {
         /* OUT */
+        trace_canokey_handle_control_out();
         if (key->ep_out[0] != NULL) {
             memcpy(key->ep_out[0], data, length);
         }
@@ -163,6 +171,7 @@ static void canokey_handle_control(USBDevice *dev, USBPacket *p,
     case CANOKEY_EP_IN_READY:
         memcpy(data, key->ep_in[0], key->ep_in_size[0]);
         p->actual_length = key->ep_in_size[0];
+        trace_canokey_handle_control_in(p->actual_length);
         /* reset state */
         key->ep_in_state[0] = CANOKEY_EP_IN_WAIT;
         key->ep_in_size[0] = 0;
@@ -182,6 +191,7 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
     uint32_t out_len;
     switch (p->pid) {
     case USB_TOKEN_OUT:
+        trace_canokey_handle_data_out(ep_out, p->iov.size);
         usb_packet_copy(p, key->ep_out_buffer[ep_out], p->iov.size);
         out_pos = 0;
         while (out_pos != p->iov.size) {
@@ -226,6 +236,7 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
                 key->ep_in_size[ep_in] = 0;
                 key->ep_in_pos[ep_in] = 0;
             }
+            trace_canokey_handle_data_in(ep_in, in_len);
             break;
         }
         break;
@@ -237,6 +248,7 @@ static void canokey_handle_data(USBDevice *dev, USBPacket *p)
 
 static void canokey_realize(USBDevice *base, Error **errp)
 {
+    trace_canokey_realize();
     CanoKeyState *key = CANOKEY(base);
 
     if (key->file == NULL) {
@@ -260,6 +272,7 @@ static void canokey_realize(USBDevice *base, Error **errp)
 
 static void canokey_unrealize(USBDevice *base)
 {
+    trace_canokey_unrealize();
 }
 
 static Property canokey_properties[] = {
diff --git a/hw/usb/trace-events b/hw/usb/trace-events
index 9773cb53300d..914ca7166829 100644
--- a/hw/usb/trace-events
+++ b/hw/usb/trace-events
@@ -345,3 +345,19 @@ usb_serial_set_baud(int bus, int addr, int baud) "dev %d:%u baud rate %d"
 usb_serial_set_data(int bus, int addr, int parity, int data, int stop) "dev %d:%u parity %c, data bits %d, stop bits %d"
 usb_serial_set_flow_control(int bus, int addr, int index) "dev %d:%u flow control %d"
 usb_serial_set_xonxoff(int bus, int addr, uint8_t xon, uint8_t xoff) "dev %d:%u xon 0x%x xoff 0x%x"
+
+# canokey.c
+canokey_emu_stall_ep(uint8_t ep) "ep %d"
+canokey_emu_set_address(uint8_t addr) "addr %d"
+canokey_emu_prepare_receive(uint8_t ep, uint16_t size) "ep %d size %d"
+canokey_emu_transmit(uint8_t ep, uint16_t size) "ep %d size %d"
+canokey_thread_start(void)
+canokey_thread_stop(void)
+canokey_handle_reset(void)
+canokey_handle_control_setup(int request, int value, int index, int length) "request 0x%04X value 0x%04X index 0x%04X length 0x%04X"
+canokey_handle_control_out(void)
+canokey_handle_control_in(int actual_len) "len %d"
+canokey_handle_data_out(uint8_t ep_out, uint32_t out_len) "ep %d len %d"
+canokey_handle_data_in(uint8_t ep_in, uint32_t in_len) "ep %d len %d"
+canokey_realize(void)
+canokey_unrealize(void)
-- 
2.36.1


