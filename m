Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E32FB1A101C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 17:23:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLq42-0005f4-HC; Tue, 07 Apr 2020 15:22:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DsZW=5X=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jLq42-0005ex-0H
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 15:22:58 +0000
X-Inumbo-ID: a7b114cc-78e3-11ea-9e09-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7b114cc-78e3-11ea-9e09-bc764e2007e4;
 Tue, 07 Apr 2020 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586272977;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qk1Y4jepw5ZUFH8O7s3prQyFWb+r4UOxrpJ04Jwz6vo=;
 b=GgoZGmKK8TkTo9wAHfUFKoEhYh/MDrfWcpPNJ1Y1JIrfmIqy8rvZHY6u
 tDz9e0Zt3WTw0El01IYb5I6lf/dU8Kg4GAtR8ANDISHSNhpdNtDjL51Be
 1aPnNz1EtCJYRY/0RaJjs3A5Bie29mmW5vJPCeCDNnXTysbMZT7Q//di9 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uJfw3vKfJcYjs2uYVUJY2Vqq4/96T8V+v/wBgcIrMvNqvt5u1WxRVXNo6wLv9KOa+i4hoW+dp1
 nvxF367qo1JJakgKbTVrvv124fXRlU1hiM1DezCI8AD65BnARTYJPyEmjXkdZgyRbUAPLfm430
 /CqeFeUgiyHOPAsksTFtT24nF7GshbMxRELlvxmk1s+L6BEaASJLDYHTQE2n+Y7VatC/LvrAG/
 BpEnnGqdJeavXRQqX6usRCNYpETrfT8sLyjQPmM533ZTEbdhPsXW4syivaAfud+3Jo0h/T81q/
 KP4=
X-SBRS: 2.7
X-MesageID: 15534900
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,355,1580792400"; d="scan'208";a="15534900"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PULL 1/3] hw/usb/xen-usb.c: Pass struct usbback_req* to
 usbback_packet_complete()
Date: Tue, 7 Apr 2020 16:22:35 +0100
Message-ID: <20200407152237.1468704-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200407152237.1468704-1-anthony.perard@citrix.com>
References: <20200407152237.1468704-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: Peter Maydell <peter.maydell@linaro.org>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Peter Maydell <peter.maydell@linaro.org>

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
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Message-Id: <20200323164318.26567-1-peter.maydell@linaro.org>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/usb/xen-usb.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
index 1fc2f32ce93d..961190d0f78c 100644
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
Anthony PERARD


