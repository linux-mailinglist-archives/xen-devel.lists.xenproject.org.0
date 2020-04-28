Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F271BB4EB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:06:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHV7-0000Nr-Vx; Tue, 28 Apr 2020 04:05:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHV7-0000NG-14
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:05:41 +0000
X-Inumbo-ID: 8493327c-8905-11ea-b07b-bc764e2007e4
Received: from mail-qv1-xf44.google.com (unknown [2607:f8b0:4864:20::f44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8493327c-8905-11ea-b07b-bc764e2007e4;
 Tue, 28 Apr 2020 04:05:38 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id t8so9767793qvw.5
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MJ/wYWaIjP7f/7FREcfMpppu/JiqlH2FlZ3lrFsDLA4=;
 b=s/ry4TNhkeyiE/CLvIMK4n0nF/fmFPiReG/8ypM0JBO77Pxfbx9bmOZWUeGka/9g3n
 sVFSrodQSuasNMSayb9oShCWv5NHaqWYhDTc6xUA3C9CfVn4w9bY7tqDRiVNs4bq+I3f
 zkPBiNww8ZL+BQKA/V7uLnuR9u3mZoFXCsiHH8wZTLU9mWsFH5BMXJTQYFE9e8e4K7Fl
 6DwirhucY+FSieVTDC8gAi2KgAYNs0OakeNDHEhLbEd2i9AwPwo0nSpWs4t01YMC2GBC
 FnYsHVwrRziElstqoP90yK7Qi4XNL7Y/gS74+QUL0BT9E3cdzaDthvBy6Se3q9DSvOBs
 jEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MJ/wYWaIjP7f/7FREcfMpppu/JiqlH2FlZ3lrFsDLA4=;
 b=YX3dBevT/cC5e2XayThPn2zTfdBXrsqgGN0MMJIsrUogjgycytuAMmMfp2lQ/+igb0
 VGA9NnW4nbQiprvu/AZyXZrjJK/kP5/3ICKKqLvw40m30fQ/y4HI+f59O9kODdk1qYRu
 xw++tjGHJkTT4lVHwCLfo2uywz7lGWZ0KTX9kTsTvgvs9cOn1568Qc7U50XieNv2XNGy
 NdMOJtvHAPe2YaKEIh64jBwFDtpqSyw1OXkeexsLlLNJzukNalH8NIEqRAKfAY0Nl+bR
 JtYGFM0RoqAqvfCq4y9iArYzJK1DLJbryihJxmwCxPky4RxMcdb0NffedNy8z3xGCp0x
 JprQ==
X-Gm-Message-State: AGi0PuYFv6A53V2flDb64SPREwxFKWsNbeQ5b+nzdMoAgLSS0ez1rHaL
 MKY5uvxqRlOz7qHso8csLi/+MhPn
X-Google-Smtp-Source: APiQypJI07Mxea/Un6qnNGKeAqvst+331zueBYLP+BJJ5zZRFAdjrm2anrdQvvDxr8R7MWoY70R5fQ==
X-Received: by 2002:ad4:4e4d:: with SMTP id
 eb13mr24927138qvb.169.1588046737427; 
 Mon, 27 Apr 2020 21:05:37 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:05:36 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 03/21] libxl: fix qemu-trad cmdline for no sdl/vnc case
Date: Tue, 28 Apr 2020 00:04:15 -0400
Message-Id: <20200428040433.23504-4-jandryuk@gmail.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

When qemu is running in stubdomain, any attempt to initialize vnc/sdl
there will crash it (on failed attempt to load a keymap from a file). If
vfb is present, all those cases are skipped. But since
b053f0c4c9e533f3d97837cf897eb920b8355ed3 "libxl: do not start dom0 qemu
for stubdomain when not needed" it is possible to create a stubdomain
without vfb and contrary to the comment -vnc none do trigger VNC
initialization code (just skips exposing it externally).
Change the implicit SDL avoiding method to -nographics option, used when
none of SDL or VNC is enabled.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Ian Jackson <ian.jackson@citrix.com>
Acked-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Changes in v2:
 - typo in qemu option
Changes in v3:
 - add missing { }
---
 tools/libxl/libxl_dm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index f4007bbe50..b91e63db6f 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -734,14 +734,15 @@ static int libxl__build_device_model_args_old(libxl__gc *gc,
         if (libxl_defbool_val(vnc->findunused)) {
             flexarray_append(dm_args, "-vncunused");
         }
-    } else
+    } else if (!sdl) {
         /*
          * VNC is not enabled by default by qemu-xen-traditional,
-         * however passing -vnc none causes SDL to not be
-         * (unexpectedly) enabled by default. This is overridden by
-         * explicitly passing -sdl below as required.
+         * however skipping -vnc causes SDL to be
+         * (unexpectedly) enabled by default. If undesired, disable graphics at
+         * all.
          */
-        flexarray_append_pair(dm_args, "-vnc", "none");
+        flexarray_append(dm_args, "-nographic");
+    }
 
     if (sdl) {
         flexarray_append(dm_args, "-sdl");
-- 
2.20.1


