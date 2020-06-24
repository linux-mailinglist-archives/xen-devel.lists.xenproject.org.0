Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E46920732D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 14:20:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo4Nf-0006L9-MA; Wed, 24 Jun 2020 12:19:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbuU=AF=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jo4Ne-0006Kw-66
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 12:19:54 +0000
X-Inumbo-ID: 0241d7f0-b615-11ea-bb8b-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0241d7f0-b615-11ea-bb8b-bc764e2007e4;
 Wed, 24 Jun 2020 12:19:53 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id e13so1553270qkg.5
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 05:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JeHrzBkl0W7YnFDNGzpK6Omqdh1SbNjh/JeqkFtYTYM=;
 b=bHiigOlfRJSOsDQUtI5OujwKxFy5ZwqLJpXGvaYBK5AXFjeFbyHjglZbPkR19/LD7K
 h8CxXew/iIM3amWTrmT8GzthWz80A4LojXAoLSAoYRfa/o4CTcMsaQ2MqCrcMmFyhmh3
 d65C6+bnnMFHZZUPCaKXHD8xuou/AYrpxpUHIZa4MUJAlOttRnvcUjqEMH2Azqysu6bY
 TrHvRBr4AOZ6qj8jPD4cTiibdikz02cW95d1+1iV6+6F0gl4CxgTZ/isKtni95qDKvs8
 hvmgb3+i7qzDkgRzLqAXFCJLilOQw7Y8u8kX0+9KDGdInvcMVCtQ7P0FjE9jy1kZkcpR
 aIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JeHrzBkl0W7YnFDNGzpK6Omqdh1SbNjh/JeqkFtYTYM=;
 b=fgpICnP8xTOr1XZCaKdV/QS+oFyGY1SWC0DOiTO3xtgA7I28WvY1I8AVf0BZJV10lT
 76XyrYNAcHejClKF+NPaW4ha/STYPuq9G61MfrM4cpH/7V0V7+XHHMKSiV8AeUTiVDCv
 YmNNgsnWrJHTJRGrEb+ZgrLcO2EgQwdwC2539Kx4jAD3V86ABYjDATZh3IxpwRXUcBiT
 /6M4Qtp/x/jOfk+abGjqxHbOrR8LsXMeY75K3r+kCACCu4kN88k33GyvrIKU+MOCNQad
 YHsyU93fJDFzJymMksAODq+CaVNFK6of00Su6PSfLMbh3g0AZ/6n3yfm0yn5G+LAe8ok
 BnYQ==
X-Gm-Message-State: AOAM530U5V+xI/nmM5lwSWCHRKjyNAsM//MUp3+AGFwQjoGOdPIwBPs3
 Dj5rvx444QNaxZXWEzSoa0o=
X-Google-Smtp-Source: ABdhPJx3ZT4gYwkDD4T3fNbH4/7YMHFKibhaBWBHBCSo0bX+lInlvhxyUp1HwIUySWDeId8zj6gV/Q==
X-Received: by 2002:a37:451:: with SMTP id 78mr16239725qke.117.1593001193342; 
 Wed, 24 Jun 2020 05:19:53 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:ad7b:336a:2d40:4130])
 by smtp.gmail.com with ESMTPSA id x4sm3685635qtj.50.2020.06.24.05.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 05:19:52 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
Subject: [PATCH] xen: Fix xen-legacy-backend qdev types
Date: Wed, 24 Jun 2020 08:19:39 -0400
Message-Id: <20200624121939.10282-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: qemu-devel@nongnu.org, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

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
---
 hw/xen/xen-legacy-backend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 2335ee2e65..c5c75c0064 100644
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
2.25.1


