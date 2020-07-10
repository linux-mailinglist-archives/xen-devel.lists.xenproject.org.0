Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310DD21B602
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2020 15:13:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtsot-0007h6-21; Fri, 10 Jul 2020 13:12:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q6aM=AV=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jtsor-0007gn-Ot
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2020 13:12:01 +0000
X-Inumbo-ID: efbb6e74-c2ae-11ea-bca7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efbb6e74-c2ae-11ea-bca7-bc764e2007e4;
 Fri, 10 Jul 2020 13:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594386719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gKGoav32jy6D1wTYeXqZwznlDdJCPEmNvpiim4Sia2E=;
 b=S7x0ZNn4fmK0WxabjoSoAV+bAApqyJ/G+4/aTV4yqj9s+lHbYu46X36K
 1moR36Qc/arO6RUGUpkTSoyt1fHEEA0VzHTv/LH14M7fRGmAicgxpONhO
 q3rMGJJbhTG8czLqGpy0zH3nzxSFziPCUAp53eBZZtam9LrtJd1E++/sk 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: PAEOZAOKqwv1y16lNBHg3giB8y3OZJyWJXsMaUXbOJ9Hc7VtEC77P29THrOmz6qG2SZYDoxRFW
 h6F7PAcRbfX+CjoSrh/Dcrcg0W52hgNAOgRHBIyDsyAquBlvYLHbTovsY5g9Xyu0HfoY1KGqjt
 S/xoGRgnuesTHCeVHRu+qqLTObwKfNW5ojPbJ6FHA3VhlnEVL6IKsber/OW8VEX7HoFG7RfXxX
 cewNIK1QNbRl04dnyt/sDRmSFMBRNMK+9Rh9jieeXMwgvTXnpUP0iXxBCDlng4Tyvew5BFxzJA
 eYE=
X-SBRS: 2.7
X-MesageID: 22397957
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,335,1589256000"; d="scan'208";a="22397957"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Subject: [PULL 1/2] xen: Fix xen-legacy-backend qdev types
Date: Fri, 10 Jul 2020 14:11:44 +0100
Message-ID: <20200710131145.589476-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710131145.589476-1-anthony.perard@citrix.com>
References: <20200710131145.589476-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Andryuk <jandryuk@gmail.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Jason Andryuk <jandryuk@gmail.com>

xen-sysdev is a TYPE_SYS_BUS_DEVICE.  bus_type should not be changed so
that it can plug into the System bus.  Otherwise this assert triggers:
qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
`dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
failed.

TYPE_XENBACKEND attaches to TYPE_XENSYSBUS, so its class_init needs to
be set accordingly to attach the qdev.  Otherwise the following assert
triggers:
qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
`dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
failed.

TYPE_XENBACKEND is not a subclass of XEN_XENSYSDEV, so it's parent
is just TYPE_DEVICE.  Change that.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Paul Durrant <pdurrant@amazon.com>
Fixes: 81cb05732efb ("qdev: Assert devices are plugged into a bus that can take them")
Message-Id: <20200624121939.10282-1-jandryuk@gmail.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/xen/xen-legacy-backend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 7d4b13351e06..083d8dc1b28b 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -789,11 +789,12 @@ static void xendev_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     /* xen-backend devices can be plugged/unplugged dynamically */
     dc->user_creatable = true;
+    dc->bus_type = TYPE_XENSYSBUS;
 }
 
 static const TypeInfo xendev_type_info = {
     .name          = TYPE_XENBACKEND,
-    .parent        = TYPE_XENSYSDEV,
+    .parent        = TYPE_DEVICE,
     .class_init    = xendev_class_init,
     .instance_size = sizeof(struct XenLegacyDevice),
 };
@@ -824,7 +825,6 @@ static void xen_sysdev_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     device_class_set_props(dc, xen_sysdev_properties);
-    dc->bus_type = TYPE_XENSYSBUS;
 }
 
 static const TypeInfo xensysdev_info = {
-- 
Anthony PERARD


