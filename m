Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F01041D6E81
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 03:16:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaUNv-0000np-LM; Mon, 18 May 2020 01:16:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaUNt-0000me-UV
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 01:16:01 +0000
X-Inumbo-ID: 08cc9dea-98a5-11ea-9887-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08cc9dea-98a5-11ea-9887-bc764e2007e4;
 Mon, 18 May 2020 01:15:17 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id z18so6870288qto.2
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 18:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wEGJ4owD3/xLHnFR9WnbJ1JPiPZww0tJ9aDlYTBZYPs=;
 b=rWL31mC1GXoXLOKl9gwngfk3xr4fV4TgBAq3sZiJBn8jmkY0d6pZBW+xxqoDgMtkwv
 AePmL/5yNvxC2hf1VixmAsKlxvWw65iX1F57KiPbdfRvYosnibEbEzLjBlHjtFVCE9X+
 OswxRUMKnVkneFHf7hAd7JZe1MwSxAyRDOiV9no/iQCncSkornYjNfjrVFuUsmx6HbcG
 XSogiTKH4IxkupLQuEu4UkRbd5l5fcAYQXZKDjXtHvXR6OLaeoYXjC5bPdA8qUmkJWK9
 SWttXWxsXfXisqGitRUeZfu0YBq9xrJwdO5QBXmioc4XDPRXXALxsfZ+7ZoM/7/toeIF
 U49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wEGJ4owD3/xLHnFR9WnbJ1JPiPZww0tJ9aDlYTBZYPs=;
 b=QYA1lv9IFDOtDg0xZFIY4sG9oEBsmYDPQrHzE+fdJT5l+FMEzZKJLc1OCavw5cJMBg
 Q1mKbqYRcH91TuT3nj4maZE1pVTeVyf+xR02hbNl6R7S7WaAdJ/9CcnP6NX9hJLbK804
 TQhHuNsClMIrHUNLFpi7vf0ZxGDbLO5RmYySqS1cb90nI3pnTuXUTeJ1X/l0Hl6Q8Rhx
 qGLd9q+Ht4neRi3k9jDeomDJ3J7nEZ9VMQUVc7TMAst3ymx1ujtJ86vNF3SG/1uKsAlS
 3m5e1Ouas+4KBLc/FMzbV2msQHjvc6wBFnNJxAiGGvBGcyqa89Bk8cGFmZtrMrCGYxDL
 shmQ==
X-Gm-Message-State: AOAM533sJ97K3kNP0/ajGFa5kRtmlfllJUhSablEC1bAtc1Agfw+l1vE
 HYfvXZY14ELksET3Mv/M7Q9ATA/K
X-Google-Smtp-Source: ABdhPJyO3CeZMrMr8cQbmPSNX1RUwkhHMSgA4CYIQ61kZol9uMP2rdF/WZ8bL0pd0FTCfKuHfEw6QQ==
X-Received: by 2002:ac8:7153:: with SMTP id h19mr14150357qtp.5.1589764516615; 
 Sun, 17 May 2020 18:15:16 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:ec68:c92e:af5a:2d3a])
 by smtp.gmail.com with ESMTPSA id l2sm7072864qkd.57.2020.05.17.18.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 18:15:15 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 16/18] libxl: consider also qemu in stubdomain in
 libxl__dm_active check
Date: Sun, 17 May 2020 21:13:51 -0400
Message-Id: <20200518011353.326287-17-jandryuk@gmail.com>
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
index 3356880346..098dc49ecb 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -3744,12 +3744,18 @@ out:
 
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


