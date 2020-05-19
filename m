Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5BB1D8D67
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 03:57:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jarVF-0000vx-DA; Tue, 19 May 2020 01:57:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jarVD-0000uM-Nv
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 01:57:07 +0000
X-Inumbo-ID: f1360638-9973-11ea-b9cf-bc764e2007e4
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1360638-9973-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 01:56:23 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id dh1so1897811qvb.13
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 18:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h7aIlXvOP1lBOHwN5e2pe14rJQeMR42hM5D+KnY+oRg=;
 b=EMoFpo3VZpwrzTvutQCIzi+e5oMDXAf/1WVqqKsGMdaN+B6PPKLXvSJQ30kPoOncup
 8IVklOgU6XOROC1iMAvMXRX2ajS52STcAAiEzjM1BzVtaIUeH4Erfni7CtAaReIdtraP
 Ri1JABHCyznsDLRuMxJEhWtgWfX1PI2ICSpFxMqJ3y+t15SWRZYt77vM4lXN8ohwgpCE
 zhDaMH2yzTkRCSOCJcsF7chfFhpHDx5mCin4dz6xIoR9P95AJiQNGR2LFu0hstby1V17
 dvuQ7fO8+R9cWhsNHBQ4yDM/MNla0HpVj06PUlCGkDW6VfZ/vksDaZMGAYBcqsZaPJRJ
 amDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h7aIlXvOP1lBOHwN5e2pe14rJQeMR42hM5D+KnY+oRg=;
 b=AneQ7W4QTsIUeRODp00Wu/MsyXVr7MXue82ud9jB73UYAFe/44Wp+qhBPFZ/tI78vn
 tA4udW+xceRbrbxwDDeXv2RGinm5/Rq/+CgUFTzheU2/jNJai+d+GWH0CiJNghPCmOoD
 BPK10hIT0f8lLD49FeJsdxy516fWYUR2jTCoWMIPVd8Q1G0ZdIf9nKOmUYcTA6JPb8Nt
 PQQsF4vrzMGZY8smFIpCCig8RL9kIjLXisEZc5ZgcBWCuEcsUD11PFXmqEoIqTGQP6/6
 kK0SE98WvNkq3qNqns3lNvSx/HOck2wZI9lqvlxg+ol8SZv/ueZTYzx+lHbzFF8wByFV
 Taww==
X-Gm-Message-State: AOAM530/Zmh1P//++w2EP3OXGrQpLa5KLY2dwfkQcawvea+2MBUVyiiH
 GprfDnYOSke6A7R4nJl5EkKYMSVO
X-Google-Smtp-Source: ABdhPJy3v6xUElp1+dZ+UyZkFnEv8EEcgqtN7mGKsvOX6ZOSF0gdR6ZsfCJ4wXY6Uqs9zNd5eeYzQg==
X-Received: by 2002:a05:6214:42f:: with SMTP id
 a15mr18469050qvy.170.1589853383034; 
 Mon, 18 May 2020 18:56:23 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:e463:db9c:c6eb:4544])
 by smtp.gmail.com with ESMTPSA id q2sm9731898qkn.116.2020.05.18.18.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 18:56:22 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 16/19] libxl: ignore emulated IDE disks beyond the first 4
Date: Mon, 18 May 2020 21:55:00 -0400
Message-Id: <20200519015503.115236-17-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519015503.115236-1-jandryuk@gmail.com>
References: <20200519015503.115236-1-jandryuk@gmail.com>
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
Cc: Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
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
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

---
Changes in v6:
 - Add Acked-by: Ian Jackson
---
 tools/libxl/libxl_dm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index 8801e9364e..86694f669d 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -1894,6 +1894,13 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
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
@@ -1971,6 +1978,10 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
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
2.25.1


