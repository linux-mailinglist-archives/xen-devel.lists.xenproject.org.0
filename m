Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E5818FA48
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 17:47:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGQAe-0001Yn-1p; Mon, 23 Mar 2020 16:43:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7BPm=5I=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1jGQAc-0001Yi-OA
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 16:43:22 +0000
X-Inumbo-ID: 67f04e94-6d25-11ea-92cf-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67f04e94-6d25-11ea-92cf-bc764e2007e4;
 Mon, 23 Mar 2020 16:43:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m17so8969771wrw.11
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2020 09:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/n6IqjRnzQwn9OgJiIphU3qnPEgngPDRG3PtfiwJ4qk=;
 b=NRxjntSKnhh9cuYpICqvqbe+5VDzXuLAOjYJ5Vb/FaXOe+Vntbb+vKct0kXsLg6Tv0
 QWkBpP3UmWolQDRckN3ukCTsNnKo08mHxum4mzpw6tG/JjH7/LDftIBFpx9gM2ZorH5x
 Mhe1Rv4a53jXiRby8HHP5xNaiXInzhaCpfJyRDe/zH2bhfYRPp0O+7Do7+RNINvhajV5
 dljhVMYNAYdqpn2s5o4oWBMNnyXftom+ctI5zzNztzh2yuuO2fC6axL35HhzsAMMar7c
 1bu6pvUhIFN5uPeItM6P1li2m7hzTC6m9bXE1vX5VZiray6gPwTUrU5N4X4H9ora+9He
 l/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/n6IqjRnzQwn9OgJiIphU3qnPEgngPDRG3PtfiwJ4qk=;
 b=LuxBAZ3nsan7xoW3m8bQ2As2gKPP5/BpG0BTUIiHB98nt/a+nhikB7DUbe81qgQJ4l
 J8vjAriq4jgUnOxyo0Kd4oemZzjPJ78+FeajQyIVqlJHZPYm+9IidNEhkoUhXSGUpbDa
 RDp5lVyJGWBezTSMd1zhMUl2ePtmy03SoKuzqya8z2Yz6bPnGVkfszEWmp3QXOV3SuIr
 me9zQ0oGrORy5YzE/G/oUTo8z18bFDT32ikkEe/QC6apJKdXTIvMa9MkcOYWII4Vjuim
 sqGDIT+JtuKzNO3TnK3qH5mO9WLuTk+JvdKyc46IwYrGRL2vI4Ca8FWBcGfIN4wFNCN0
 Fyeg==
X-Gm-Message-State: ANhLgQ307Ci6mQsxRNe3hMHRMEy3ELK6t5hyMRslxQLHHnlR2Xedbxi9
 B6iKxHKW8CxnBDYkkShv+cEzIw==
X-Google-Smtp-Source: ADFU+vuKOy8jajjJhmhzqHPvB3MT8/sixoy6pVIJWxEIeLGqaKFXu7CbBFTVuUuDcyuYaC4GIyK2Qg==
X-Received: by 2002:adf:e98b:: with SMTP id h11mr11516307wrm.409.1584981800964; 
 Mon, 23 Mar 2020 09:43:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k3sm167767wmf.16.2020.03.23.09.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 09:43:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 23 Mar 2020 16:43:18 +0000
Message-Id: <20200323164318.26567-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [RFC] hw/usb/xen-usb.c: Pass struct usbback_req* to
 usbback_packet_complete()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The function usbback_packet_complete() currently takes a USBPacket*,
which must be a pointer to the packet field within a struct
usbback_req; the function uses container_of() to get the struct
usbback_req* given the USBPacket*.

This is unnecessarily confusing (and in particular it confuses the
Coverity Scan analysis, resulting in the false positive CID 1421919
where it thinks that we write off the end of the structure). Since
both callsites already have the pointer to the struct usbback_req,
just pass that in directly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is an RFC because:
 * I'm not very familiar with the Xen bits of QEMU
 * the main rationale here is to change something that's
   confusing Coverity -- the code as it stands isn't wrong
 * the only testing I've done is "make check"
Still, the change seems like a good thing to me as a human reader...

PS: QEMU's MAINTAINERS file stanza for Xen doesn't pick up
that this file is Xen related, so it could use an extra F: line.

 hw/usb/xen-usb.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
index 1fc2f32ce93..961190d0f78 100644
--- a/hw/usb/xen-usb.c
+++ b/hw/usb/xen-usb.c
@@ -347,13 +347,11 @@ static int32_t usbback_xlat_status(int status)
     return -ESHUTDOWN;
 }
 
-static void usbback_packet_complete(USBPacket *packet)
+static void usbback_packet_complete(struct usbback_req *usbback_req)
 {
-    struct usbback_req *usbback_req;
+    USBPacket *packet = &usbback_req->packet;
     int32_t status;
 
-    usbback_req = container_of(packet, struct usbback_req, packet);
-
     QTAILQ_REMOVE(&usbback_req->stub->submit_q, usbback_req, q);
 
     status = usbback_xlat_status(packet->status);
@@ -566,7 +564,7 @@ static void usbback_dispatch(struct usbback_req *usbback_req)
 
     usb_handle_packet(usbback_req->stub->dev, &usbback_req->packet);
     if (usbback_req->packet.status != USB_RET_ASYNC) {
-        usbback_packet_complete(&usbback_req->packet);
+        usbback_packet_complete(usbback_req);
     }
     return;
 
@@ -993,7 +991,7 @@ static void xen_bus_complete(USBPort *port, USBPacket *packet)
 
     usbif = usbback_req->usbif;
     TR_REQ(&usbif->xendev, "\n");
-    usbback_packet_complete(packet);
+    usbback_packet_complete(usbback_req);
 }
 
 static USBPortOps xen_usb_port_ops = {
-- 
2.20.1


