Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB2C1D6E7F
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 03:16:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaUNm-0000eX-2x; Mon, 18 May 2020 01:15:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaUNj-0000co-Sr
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 01:15:51 +0000
X-Inumbo-ID: 0678a098-98a5-11ea-b9cf-bc764e2007e4
Received: from mail-qk1-x743.google.com (unknown [2607:f8b0:4864:20::743])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0678a098-98a5-11ea-b9cf-bc764e2007e4;
 Mon, 18 May 2020 01:15:13 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id f189so8626084qkd.5
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 18:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SwjQUhGQXAcvvbP1vAzAMtzC5lAyshhwUcCpJNOCDmM=;
 b=o5aaEYqBg7HMOcTAiPitRuIFI6dTFtg98l+mR6von+MOecayYEw1H3kZSlm605N0y5
 CHJAGgkbwOLaRDdWNtmReADPaS04L1IN9QjHIP3FCQ2Zp/mrm47Wf0vLKfvV9GN2vm/m
 1Va3Jikp+ur0cRtPbfFKXZ1jSN8uQ70WRM0llMOrgSnOc4v9ND2AMqrGYq6z2Lb/jtbq
 kVuyJZNrmqI/0kVBTbxyCxTEDPoJwjofK3sEoBSrKvMs2vnSZegdPSRkOteINxtJpwf/
 TONU4ISCzhNhbmAsC6EgkNFNk6tIJzwBlHGtyzf1y6VWLHTfn1eX7et62AFga6s/KrjJ
 loFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SwjQUhGQXAcvvbP1vAzAMtzC5lAyshhwUcCpJNOCDmM=;
 b=NLFBwevIP2u3bwTTVClA6DgaWgS2O9bvhMX++TaVH3WRsvL/ayDdT5n5CQLSqdF/A0
 bz1Leg3Aalm+x+WcAftSPJRvpXo2kB2410omOejN/R/UH7J5xNGdnA26dgHW1pfWlHHc
 e+dFgGLQXN9xVm4rUHqcpirEQDGXFF+ivlb9nIdFatZ0Fe4JyS6W1zTn/JdNnKHA/X4Y
 oCK8iQdZDsNsRmuHoLuMM/xMdqtfVRndP3KrZxSyfN6TicfTxlRu99stc6/q6LKRDDwA
 rJj9cIkHr7Np/OA2xpGMB21buu83TW1+EQiory6TMz7tRe/5whMzkVfTKbLzV++9TgSE
 SXBw==
X-Gm-Message-State: AOAM532lyXi/MaF1LjW5Zz7HVAlmmzjKOTQZOmpXMcItV5lf3JXu3Xuh
 YMZDKodOTd+dU8zV/9iGpvKTZbtF
X-Google-Smtp-Source: ABdhPJyAD7qRMvp98E2GNAyHX3Lom3vbs++4CVF2A14dVLkhCewPMFqee098J/n0qJxQBWTglzgh7g==
X-Received: by 2002:a37:f517:: with SMTP id l23mr13946427qkk.475.1589764512837; 
 Sun, 17 May 2020 18:15:12 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:ec68:c92e:af5a:2d3a])
 by smtp.gmail.com with ESMTPSA id l2sm7072864qkd.57.2020.05.17.18.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 18:15:12 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 14/18] libxl: require qemu in dom0 for multiple stubdomain
 consoles
Date: Sun, 17 May 2020 21:13:49 -0400
Message-Id: <20200518011353.326287-15-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200518011353.326287-1-jandryuk@gmail.com>
References: <20200518011353.326287-1-jandryuk@gmail.com>
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

Device model stubdomains (both Mini-OS + qemu-trad and linux + qemu-xen)
are always started with at least 3 consoles: log, save, and restore.
Until xenconsoled learns how to handle multiple consoles, this is needed
for save/restore support.

For Mini-OS stubdoms, this is a bug.  In practice, it works in most
cases because there is something else that triggers qemu in dom0 too:
vfb/vkb added if vnc/sdl/spice is enabled.

Additionally, Linux-based stubdomain waits for all the backends to
initialize during boot. Lack of some console backends results in
stubdomain startup timeout.

This is a temporary patch until xenconsoled will be improved.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
[Updated commit message with Marek's explanation from mailing list.]
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Changes in v6
 - Update commit message
---
 tools/libxl/libxl_dm.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index c66e8ebc24..fb87deae91 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -2504,7 +2504,11 @@ static void spawn_stub_launch_dm(libxl__egc *egc,
         }
     }
 
-    need_qemu = libxl__need_xenpv_qemu(gc, dm_config);
+    /*
+     * Until xenconsoled learns how to handle multiple consoles, require qemu
+     * in dom0 to serve consoles for a stubdomain - it require at least 3 of them.
+     */
+    need_qemu = 1 || libxl__need_xenpv_qemu(gc, &sdss->dm_config);
 
     for (i = 0; i < num_console; i++) {
         libxl__device device;
@@ -2636,7 +2640,11 @@ static void qmp_proxy_spawn_outcome(libxl__egc *egc,
                                     int rc)
 {
     STATE_AO_GC(sdss->qmp_proxy_spawn.ao);
-    int need_pvqemu = libxl__need_xenpv_qemu(gc, &sdss->dm_config);
+    /*
+     * Until xenconsoled learns how to handle multiple consoles, require qemu
+     * in dom0 to serve consoles for a stubdomain - it require at least 3 of them.
+     */
+    int need_pvqemu = 1 || libxl__need_xenpv_qemu(gc, &sdss->dm_config);
 
     if (rc) goto out;
 
-- 
2.25.1


