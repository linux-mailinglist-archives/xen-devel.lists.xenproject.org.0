Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D951D8D66
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 03:57:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jarV9-0000qS-TQ; Tue, 19 May 2020 01:57:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jarV8-0000pU-NJ
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 01:57:02 +0000
X-Inumbo-ID: edfca300-9973-11ea-b9cf-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edfca300-9973-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 01:56:18 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id f189so12871719qkd.5
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 18:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zYxVyaXUbBwkO6YpZAMxyMF5n/sB6urbfp9DtPJAZLw=;
 b=IEQEPkp6jaiAgX30wKH3RXdIuyHNp1qM8Fw1z/Z62607XhkY4lacJtOHt+hqwYcIWf
 aGrHGEik84VfUwSLpYvKSyVxG5+BgRGuXr6v3TxXyLG9ZHNJ1xEEi7INszUrd9l7G1ey
 Cs8p2M+35n0Bz1b1NldY6x3FKEwMy12GghFmAvPC84/Q3kFGhzMXiqb01UG75B5iqUt/
 p0mtcugDY/gGwmtXsz8tjq63gLqfg8hJFiRD5zlLSeBAkL4BwOGnf95oiOcQraz3GdRb
 7AU3g7qmzk6TywvzyhjJesjVIqp380CH/npcDCgj+2uV/xkCyznrpxWr5l9mnEnr1VMn
 igwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zYxVyaXUbBwkO6YpZAMxyMF5n/sB6urbfp9DtPJAZLw=;
 b=LwzaPSGcBjp9PChfNPfYhmRzuv7gSUT+e2uF2LBMupjbFp16pG4Jze29FWgdabRyPw
 T0Yrmg1BqIltqFTHcGBhnUZmF+c7CIGuK6/QgHi3aDQmygZaz1SHeLpZ/sLj2n53R2Yb
 7c2sFapL9qX0Wq6RlOEcpIij/HCLD0H7zCAyrRUuGxF9coTSjIgHZKQL5WEFq29cGOks
 Su/BbpNA/c/opyzuRafqY9pXmS9OXfqS4G1xaTr7fkXNHTrWh5PbT7wB5/eFJkAU/UHI
 tqrHywlKQ8oA5AAhWQtF9fMPv1aRBuViT3i3F/5E3O7tToYvk/hYI9bKiFTVoC7526S4
 pQ4Q==
X-Gm-Message-State: AOAM530AmB2Gjva3aMMkf5b1HoshhIMy0nUdWjU73Lk3bgV3Bsosfh46
 s//cwqOKqJRPYDzoHCxA1JNeXEHA
X-Google-Smtp-Source: ABdhPJwzwY9WPZYTCdyanB+pJDmCSgNFO0oQxnmRTaaX0i7nC3iWT7eVbJSXqPrdH6UsWw3+ZdfUEA==
X-Received: by 2002:a37:59c7:: with SMTP id n190mr8225930qkb.471.1589853377492; 
 Mon, 18 May 2020 18:56:17 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:e463:db9c:c6eb:4544])
 by smtp.gmail.com with ESMTPSA id q2sm9731898qkn.116.2020.05.18.18.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 18:56:16 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 15/19] libxl: require qemu in dom0 for multiple stubdomain
 consoles
Date: Mon, 18 May 2020 21:54:59 -0400
Message-Id: <20200519015503.115236-16-jandryuk@gmail.com>
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
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
Changes in v6
 - Update commit message
Changes in v7
 - Add Acked-by: Ian Jackson
---
 tools/libxl/libxl_dm.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index 6a26634ef9..8801e9364e 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -2494,7 +2494,11 @@ static void spawn_stub_launch_dm(libxl__egc *egc,
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
@@ -2626,7 +2630,11 @@ static void qmp_proxy_spawn_outcome(libxl__egc *egc,
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


