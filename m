Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24101BB4F7
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:06:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHWB-00019C-Gt; Tue, 28 Apr 2020 04:06:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHWA-00017y-3R
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:06:46 +0000
X-Inumbo-ID: 9ba326e8-8905-11ea-b9cf-bc764e2007e4
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ba326e8-8905-11ea-b9cf-bc764e2007e4;
 Tue, 28 Apr 2020 04:06:16 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id g74so20494237qke.13
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0j8wm36LGsZqMjdI5/1E69Neum61HZiB3dp5bB5iUEk=;
 b=Mdu81/O2RzmWfDxrvXDw5rcc1CZ6Xsh4Q18owuxthBbFAIgut43vsvxCJ4saCVC95N
 2woUMyQQ5Kgz8JAqz+/A3kTNKHC25OIUtIqEu59BUqArpKQ6pi5UOvASRlIKYWF0+bSz
 wiK08CdkoRJeROnUx8cXmKSLHdD39dszJpukRMdZ9LFxSFg03vRm52vm9GIUqDePXcqf
 lBHIVyuNNnBB3TmRsIPKan15vbyljHbNdUmP0MaF/cmIYlsgZPvK3cFiDJMhip6YLKvP
 8HL+RfdXNCAsxgxUzbLMWY2BKQior59rBQnore4RImww8eXrxAQSFQQA56KLSLyAfG8j
 BWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0j8wm36LGsZqMjdI5/1E69Neum61HZiB3dp5bB5iUEk=;
 b=lMS1NfveQLpEo2Wltx2Ob8kQvt4LxF3UY2rbDjTTv9WOH03aKbje05ay1Fv9t8d6zJ
 RjKTL4SvHxDAtRdo6P6xjoTcKKfvtqou2sN10aBvWL9zObB8qp8IzvYsViDPh1OFBJkk
 dinc+UZCrE/m6tJJYoXiDxuzANjzTWVG0DqFG9M/mKwQ5gLylPH2ytt9+x0Viobh1q/5
 MrMrFmARt3rQ6lkz3m77vjxA5xiGUO2o25ni77ZLFKY93o/8KDUErPHyO/AwrNFy/QUI
 MSalfCzBBLyJbdkGScjXrSzxu2K+usZTRgP7Mcjiq2378aBflseEKghxO6YbR42lYyQr
 5kdA==
X-Gm-Message-State: AGi0PuZyzaKHWJFbSBkUIurqE54J+LlM+qIIsYYxL/BP3wYKVImhDc8I
 1A5ttNz4Y+ELaxREistDuskAEs9G
X-Google-Smtp-Source: APiQypIAfqI9RLEm3UJaxI6J7R1wp5n5o3ctkhdgmYwxhOYUKYvV+Y/lYiibhmQO8rNP5tVYJRf73w==
X-Received: by 2002:a05:620a:2091:: with SMTP id
 e17mr9825551qka.70.1588046776119; 
 Mon, 27 Apr 2020 21:06:16 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:06:15 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 16/21] libxl: consider also qemu in stubdomain in
 libxl__dm_active check
Date: Tue, 28 Apr 2020 00:04:28 -0400
Message-Id: <20200428040433.23504-17-jandryuk@gmail.com>
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

Since qemu-xen can now run in stubdomain too, handle this case when
checking it's state too.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libxl/libxl_dm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index 03d7a38f1f..5d61da1de8 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -3749,12 +3749,18 @@ out:
 
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
2.20.1


