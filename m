Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D201BB4F6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:06:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHW7-000155-5h; Tue, 28 Apr 2020 04:06:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHW5-000133-39
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:06:41 +0000
X-Inumbo-ID: 9a67bcd0-8905-11ea-b9cf-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a67bcd0-8905-11ea-b9cf-bc764e2007e4;
 Tue, 28 Apr 2020 04:06:14 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id o10so16293260qtr.6
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YHrTNz7tUN0rhzka1j5HZ0Hi5er6+RNP2GXkixa7DZ0=;
 b=KAI4oMLxyg3xRmENF7haPFheBvn4T3kZi+YuTHh2Mmc9InbCorIxcghMes5jhjE+yC
 vvkrY9I3RYVxSE2+9IJjegn8obmRQV9Re4LYWORn441i04NPgeSjJ9A9scacv1f4Kfje
 AGUHF12l2Jx4JhoO6dVYFXwnqqEvorUxfWva2M+OUw+ZwCXmWma36dhFX/FmL1UIX3I7
 7DWLe1u7M3dwgxD3pIMZK0V0jrdfDBK0Kl2UIOTeUZ2JTK6LP8jRIBkA9XM2pfRexJ1q
 ashqcgQQn2LL0aHO3Jz2I3CVhUDc3dzeFGf4hoHadAppY6FFVKRGqNrqEybESITJeRrj
 lFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YHrTNz7tUN0rhzka1j5HZ0Hi5er6+RNP2GXkixa7DZ0=;
 b=oMZ1OVkctMa9LLkx1Tc/OFu9qboDTPSJvFEOLihSdU+M+j4Khv0XlvTTL+Zb9ICSqZ
 mi6Di5/L+ma7KtIjlyNfixoNll/IJox083JYzkHC1qZCgulq7eFbFKNcWgBRt30ffRaW
 MG9TJBM2cXUJo3fMX9n0iySxBw+eG+iayoq8A3uKKU55efocXst71QkrPT5dnZ3ZEdnD
 Vrhbxh8mZ1PW5v8xbhE+33S2P8Fn/AitQUfmF/L6TDagBHQd9juzWGTJLvCiCniUq8T/
 nn3NXeAJOtddN5Wu1gaFXCKJ4eABRhlqDDjPw6hGSiC6vkW4lbWqkCcushsOALC8Xw9t
 IhGA==
X-Gm-Message-State: AGi0PuZeeMeyFVG6yj/7UTkM/E+r25VIj4a0eGbkuXfX1PBMzI8Y7rfW
 mb+H2tldVMLrC6lx9VtY+cGYd9LN
X-Google-Smtp-Source: APiQypKF61HS+kx09HNopaG/vRRFYcaVVZv+78ro8jhSj9i+JGmvZMcS7GD1DlUW/ybvMVPjplME2g==
X-Received: by 2002:ac8:7ca2:: with SMTP id z2mr26929152qtv.122.1588046774039; 
 Mon, 27 Apr 2020 21:06:14 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:06:13 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 15/21] libxl: ignore emulated IDE disks beyond the first 4
Date: Tue, 28 Apr 2020 00:04:27 -0400
Message-Id: <20200428040433.23504-16-jandryuk@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200428040433.23504-1-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Qemu supports only 4 emulated IDE disks, when given more (or with higher
indexes), it will fail to start. Since the disks can still be accessible
using PV interface, just ignore emulated path and log a warning, instead
of rejecting the configuration altogether.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libxl/libxl_dm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index 5e5e7a27b3..03d7a38f1f 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -1891,6 +1891,13 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
             }
 
             if (disks[i].is_cdrom) {
+                if (disk > 4) {
+                    LOGD(WARN, guest_domid, "Emulated CDROM can be only one of the first 4 disks.\n"
+                         "Disk %s will be available via PV drivers but not as an "
+                         "emulated disk.",
+                         disks[i].vdev);
+                    continue;
+                }
                 drive = libxl__sprintf(gc,
                          "if=ide,index=%d,readonly=on,media=cdrom,id=ide-%i",
                          disk, dev_number);
@@ -1968,6 +1975,10 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
                                                        &disks[i],
                                                        colo_mode);
                 } else {
+                    LOGD(WARN, guest_domid, "Only 4 emulated IDE disks are supported.\n"
+                         "Disk %s will be available via PV drivers but not as an "
+                         "emulated disk.",
+                         disks[i].vdev);
                     continue; /* Do not emulate this disk */
                 }
 
-- 
2.20.1


