Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC76F1D8D68
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 03:57:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jarVK-00011a-PP; Tue, 19 May 2020 01:57:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jarVI-0000zO-Ng
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 01:57:12 +0000
X-Inumbo-ID: f23c3746-9973-11ea-b9cf-bc764e2007e4
Received: from mail-qv1-xf44.google.com (unknown [2607:f8b0:4864:20::f44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f23c3746-9973-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 01:56:25 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id g20so5764037qvb.9
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 18:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IYMgysvcDxJ2qC+BMVljgkXJOptYz7V/ebvMGJu6l2I=;
 b=iSZ+2fPcl6pHnJEzYSwp6UecgywSI0Do0bUYZEoGlESIz/C2NFxfo+kao2piWSIJ1R
 2ss3oW3uGXdFjEgWoqiyeFRCxfe0TCV3jEtnTR4MnW5ZNw6REOc/hUprd3UmDu7svhov
 xcpESH85t4mv/RN9Db8AhFZMUmQzZbw6gNPAL6lakkYV8iiSN18ykFuCGo35tg0zjgM9
 mScKM/4KLC7jS3mJugI7VN3k5+fNGiV6NpM6Mq6uUuZEPwYxsqY1N79n2Kt852amqMFY
 bUSaaJobFK0VObOJg+EL3mSMBxsYYCLS6bOJzTXqWkY4BLnRWJEa9cjAPT5v++HSAGkA
 ufAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IYMgysvcDxJ2qC+BMVljgkXJOptYz7V/ebvMGJu6l2I=;
 b=AoN7yDf64PgWvuwONrfeRosCDcKdlo8/8nYCB54Auo1bTJKBo3ieJKmGKAEnMzSM6R
 ViBMR2yvkCu9L65P5vFXHDwttGtT7BXr1bk7/oPdV54w14IyMzp1WqSTNUuYCzMQ0or8
 9sf8WEU9eKzkMFDZd6nuT3OulqDTTsQrY6O7tuu8IEdbieLyhiFHt5iNm3qRR45RZP85
 lVB73jLCD6y1AqiCiz32RLu40TkGDvkViq0J3tXgnvYnNwz3Prkz9C4H8ufFXV8YUys0
 DeEVp6A9acH1eU8rDDc2wt3S4w71TwOTMgbcHQ/Gap3v3QUtL4tAK6alAV8D4a/v1iys
 rBfg==
X-Gm-Message-State: AOAM532WcEF7AxVTSNIRGhqP8rHhwezFqcBOy4ze5XgOor1rwZCfAFRo
 GNjSTzWrV9qnybCHeR1YwG++u8rD
X-Google-Smtp-Source: ABdhPJx+JJQZcXHO93LyrGJBq5x/P47XOfWXMJ7IPmronv27b21xMNl7q4ygzJNCos1CMGew2EZ6pg==
X-Received: by 2002:ad4:40ca:: with SMTP id x10mr19055315qvp.220.1589853384762; 
 Mon, 18 May 2020 18:56:24 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:e463:db9c:c6eb:4544])
 by smtp.gmail.com with ESMTPSA id q2sm9731898qkn.116.2020.05.18.18.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 18:56:24 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 17/19] libxl: consider also qemu in stubdomain in
 libxl__dm_active check
Date: Mon, 18 May 2020 21:55:01 -0400
Message-Id: <20200519015503.115236-18-jandryuk@gmail.com>
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

Since qemu-xen can now run in stubdomain too, handle this case when
checking it's state too.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

---
Changes in v6:
 - Add Acked-by: Ian Jackson
---
 tools/libxl/libxl_dm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index 86694f669d..454a2815ed 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -3734,12 +3734,18 @@ out:
 
 int libxl__dm_active(libxl__gc *gc, uint32_t domid)
 {
-    char *pid, *path;
+    char *pid, *dm_domid, *path;
 
     path = GCSPRINTF("/local/domain/%d/image/device-model-pid", domid);
     pid = libxl__xs_read(gc, XBT_NULL, path);
 
-    return pid != NULL;
+    if (pid)
+        return true;
+
+    path = GCSPRINTF("/local/domain/%d/image/device-model-domid", domid);
+    dm_domid = libxl__xs_read(gc, XBT_NULL, path);
+
+    return dm_domid != NULL;
 }
 
 int libxl__dm_check_start(libxl__gc *gc, libxl_domain_config *d_config,
-- 
2.25.1


