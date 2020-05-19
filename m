Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8210A1D8D5B
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 03:56:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jarUQ-0000Gn-TB; Tue, 19 May 2020 01:56:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jarUP-0000GG-MQ
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 01:56:17 +0000
X-Inumbo-ID: e3264774-9973-11ea-ae69-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3264774-9973-11ea-ae69-bc764e2007e4;
 Tue, 19 May 2020 01:56:00 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id i14so12816912qka.10
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 18:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EhWGeBO5fU7aDrFb+y6kocNrTThgXEXh85XiUI3Yqtk=;
 b=Q35bbi2GYRG7GMFM+chG/uml8bUSKpczo3cdkK6Ozevr/n36ollyZpZ9ItTpBOvtyO
 6lcquzv2Axb0fOjT3wDgSrOarDUl0JJTZqk2XaPobUy6AYMxiuuHBqM1SVQaslg/O7Hv
 HZsyLP3BvB6WXfxXYPlb+FCDx5FZA6gn4mAgHMn+X4/zQdHsVPbTn8JfhfSd44XWSWuD
 1HE1BnBjVu5shGWrPbbFOyPpBs7EBwm1FImruCoomq4wNgCQyehNjmec8dOvZlJM4ur/
 6MbLPPTYkxMvR/lNrXdaWkEAd1MbgLMXBIqHeTxRPgYsZaikdf+c7xgsCfB2qBnl3ulm
 id0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EhWGeBO5fU7aDrFb+y6kocNrTThgXEXh85XiUI3Yqtk=;
 b=YaQFlG6HeNF/Kv3JGG4Hx+PnIj7n+8R716PXalSEapQkZCLFRk2ror3ZnOTbkQWIMc
 BgMwoIPaRK+ugpyo2SmeNgI4tno6ficbEitQRrYVcjMGwQhWtkJblOOE637Be1KerpXH
 3hSpMuud2WgbkQKY7cNIrPFCFQ/d/pt/S8QkeyD72JFDZtIf2IJl+SzENScxDLpxoTFz
 jkcvSS7JtmXONudUDcN1MpnxlntJZinQFSpfAuFnKdwSnAOBPkT5IwuOdQS7IRc4JOX5
 pl1biYpizvhF9mveQ+JY4BjW2/b6ONUUr0JjLO3NHC3+mDJcH4VNk6b5sJoibekiuVdj
 N5GA==
X-Gm-Message-State: AOAM531K/YDYKB9Og31qefdgWVPjue3+TOsKdNQ+nFmJw3dQhy0l9QVN
 8CiXXK+fXZBpB4HPSQV8c1J584P8
X-Google-Smtp-Source: ABdhPJwUZdL8WFdvXxXr0MTV4ZtRNTzB4gw/6FXjEUyXqs+QDg7lH5C8GZD7oO58aw6rQCbbxFFMjw==
X-Received: by 2002:a37:8d07:: with SMTP id p7mr19191071qkd.500.1589853359370; 
 Mon, 18 May 2020 18:55:59 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:e463:db9c:c6eb:4544])
 by smtp.gmail.com with ESMTPSA id q2sm9731898qkn.116.2020.05.18.18.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 18:55:58 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 06/19] libxl: Use libxl__xs_* in libxl__write_stub_dmargs
Date: Mon, 18 May 2020 21:54:50 -0400
Message-Id: <20200519015503.115236-7-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519015503.115236-1-jandryuk@gmail.com>
References: <20200519015503.115236-1-jandryuk@gmail.com>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Re-work libxl__write_stub_dmargs to use libxl_xs_* functions in a loop.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

---
New in v7
---
 tools/libxl/libxl_dm.c | 53 ++++++++++++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index dc1717bc12..8e57cd8c1f 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -2070,21 +2070,18 @@ static int libxl__write_stub_dmargs(libxl__gc *gc,
                                     int dm_domid, int guest_domid,
                                     char **args)
 {
-    libxl_ctx *ctx = libxl__gc_owner(gc);
     int i;
-    char *vm_path;
-    char *dmargs, *path;
+    char *dmargs;
     int dmargs_size;
     struct xs_permissions roperm[2];
-    xs_transaction_t t;
+    xs_transaction_t t = XBT_NULL;
+    int rc;
 
     roperm[0].id = 0;
     roperm[0].perms = XS_PERM_NONE;
     roperm[1].id = dm_domid;
     roperm[1].perms = XS_PERM_READ;
 
-    vm_path = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("/local/domain/%d/vm", guest_domid));
-
     i = 0;
     dmargs_size = 0;
     while (args[i] != NULL) {
@@ -2102,17 +2099,43 @@ static int libxl__write_stub_dmargs(libxl__gc *gc,
         }
         i++;
     }
-    path = GCSPRINTF("%s/image/dmargs", vm_path);
 
-retry_transaction:
-    t = xs_transaction_start(ctx->xsh);
-    xs_write(ctx->xsh, t, path, dmargs, strlen(dmargs));
-    xs_set_permissions(ctx->xsh, t, path, roperm, ARRAY_SIZE(roperm));
-    xs_set_permissions(ctx->xsh, t, GCSPRINTF("%s/rtc/timeoffset", vm_path), roperm, ARRAY_SIZE(roperm));
-    if (!xs_transaction_end(ctx->xsh, t, 0))
-        if (errno == EAGAIN)
-            goto retry_transaction;
+    for (;;) {
+        const char *vm_path;
+        char *path;
+
+        rc = libxl__xs_transaction_start(gc, &t);
+        if (rc) goto out;
+
+        rc = libxl__xs_read_mandatory(gc, t,
+                                      GCSPRINTF("/local/domain/%d/vm",
+                                                guest_domid),
+                                      &vm_path);
+        if (rc) goto out;
+
+        path = GCSPRINTF("%s/image/dmargs", vm_path);
+
+        rc = libxl__xs_mknod(gc, t, path, roperm, ARRAY_SIZE(roperm));
+        if (rc) goto out;
+
+        rc = libxl__xs_write_checked(gc, t, path, dmargs);
+        if (rc) goto out;
+
+        rc = libxl__xs_mknod(gc, t, GCSPRINTF("%s/rtc/timeoffset", vm_path),
+                             roperm, ARRAY_SIZE(roperm));
+        if (rc) goto out;
+
+        rc = libxl__xs_transaction_commit(gc, &t);
+        if (!rc) break;
+        if (rc<0) goto out;
+    }
+
     return 0;
+
+ out:
+    libxl__xs_transaction_abort(gc, &t);
+
+    return rc;
 }
 
 static int libxl__store_libxl_entry(libxl__gc *gc, uint32_t domid,
-- 
2.25.1


