Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDFB1A60CC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2020 00:03:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jNkh1-0003IG-6z; Sun, 12 Apr 2020 22:03:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Dwh=54=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jNkh0-0003I2-KT
 for xen-devel@lists.xenproject.org; Sun, 12 Apr 2020 22:03:06 +0000
X-Inumbo-ID: 5a4a57c8-7d09-11ea-b4f4-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a4a57c8-7d09-11ea-b4f4-bc764e2007e4;
 Sun, 12 Apr 2020 22:02:51 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id o10so5871336qtr.6
 for <xen-devel@lists.xenproject.org>; Sun, 12 Apr 2020 15:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=NmfxgsNf5K3mmZ2//UrmLn1WOxxwaw+HLr7AjrHfqbU=;
 b=mTZ++ghtU3U7tbwnc840P55CJPNfQ0mqSErJPkR0X0pz/kLBYCkRiAqgqIZp6SpFMZ
 4K6o1jBamZWs9TZJWsZcteuRYhhWDYMFi6XPDVJ349EcHyvgRphuC5Bf8L3+wGBBl+ys
 ZFBRHGodTmxTiBM8BsWFv3ZdQHHiOGOzMMamo2M/eeFW9L9dPsyeFegM3K1frkkLaGgM
 f1lHnLuiu6DXEx2wxhg+jB2/4Zet6gYXkWRVAEMbF6UJk74hIBHfnf4pndG0xsYxGnlr
 /0SjvsMVPdQyWUufGVWD0dntbxMr8BkPaypY/5VvZ/F39LeNkkvfQdnuC0AJJPDYzLdJ
 ePjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=NmfxgsNf5K3mmZ2//UrmLn1WOxxwaw+HLr7AjrHfqbU=;
 b=fczmwOQMl54BD2932+XPCEfC8IoImwSidKUZ5LaMn+kXG0vuAh9riDHMo5FCLMA/MB
 gqvtu7kSNPC3PAO73UuadD8zSmFIuhSg7ELSPdiRh2oL/eDcbZns1I1SkiZiObcZGwgS
 Kt869qDZZNVRV3tsiG0L56GWg/ldxQLGmAHKlziCHllCYZJgq+Dy0jbPmV0hYAUfjUQH
 +2uQWCVNrLv8hUp84F5p+X3yp0ZAdAM8/uEKkGj54sFcdto3x+hcFNnk7bt8S0veWcyH
 dxk3MEcBTvmxiAaOf80i5k4ZQGBLLJmR4IreoDrc66QKV9chMJUgc4Ze79zSolXlGfgV
 KijA==
X-Gm-Message-State: AGi0PuZc4HzUuo1z65Sh9p/oqbfSSnOdGwPr+HjeaujN9X97x9siVr10
 u0etOeHkJs27mIf2e6oNqZtuILJ/
X-Google-Smtp-Source: APiQypJEOq8uosf+DmUlGSZcUywLdkAauXybwVTg5BSsXmX6ad/GcygkPdbJtukykyKqpaopmaqZ0w==
X-Received: by 2002:ac8:43c3:: with SMTP id w3mr9103038qtn.350.1586728970375; 
 Sun, 12 Apr 2020 15:02:50 -0700 (PDT)
Received: from four.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 s14sm3691128qts.70.2020.04.12.15.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:02:49 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 4/4] golang/xenlight: add DeviceUsbdevAdd/Remove wrappers
Date: Sun, 12 Apr 2020 18:02:42 -0400
Message-Id: <1fcd31482f5183f29e9d949c6e17183b6b101c8b.1586727061.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1586727061.git.rosbrookn@ainfosec.com>
References: <cover.1586727061.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1586727061.git.rosbrookn@ainfosec.com>
References: <cover.1586727061.git.rosbrookn@ainfosec.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add DeviceUsbdevAdd and DeviceUsbdevRemove as wrappers for
libxl_device_usbdev_add and libxl_device_usbdev_remove.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/xenlight.go | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/xenlight.go
index c94b046667..2d45d2bd48 100644
--- a/tools/golang/xenlight/xenlight.go
+++ b/tools/golang/xenlight/xenlight.go
@@ -1136,3 +1136,37 @@ func (Ctx *Context) DevicePciRemove(domid Domid, pci *DevicePci) error {
 
 	return nil
 }
+
+// DeviceUsbdevAdd adds a USB device to a domain.
+func (Ctx *Context) DeviceUsbdevAdd(domid Domid, usbdev *DeviceUsbdev) error {
+	var cusbdev C.libxl_device_usbdev
+
+	if err := usbdev.toC(&cusbdev); err != nil {
+		return err
+	}
+	defer C.libxl_device_usbdev_dispose(&cusbdev)
+
+	ret := C.libxl_device_usbdev_add(Ctx.ctx, C.uint32_t(domid), &cusbdev, nil)
+	if ret != 0 {
+		return Error(ret)
+	}
+
+	return nil
+}
+
+// DeviceUsbdevRemove removes a USB device from a domain.
+func (Ctx *Context) DeviceUsbdevRemove(domid Domid, usbdev *DeviceUsbdev) error {
+	var cusbdev C.libxl_device_usbdev
+
+	if err := usbdev.toC(&cusbdev); err != nil {
+		return err
+	}
+	defer C.libxl_device_usbdev_dispose(&cusbdev)
+
+	ret := C.libxl_device_usbdev_remove(Ctx.ctx, C.uint32_t(domid), &cusbdev, nil)
+	if ret != 0 {
+		return Error(ret)
+	}
+
+	return nil
+}
-- 
2.17.1


