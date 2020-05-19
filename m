Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 769031D8D56
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 03:56:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jarUW-0000Jr-6k; Tue, 19 May 2020 01:56:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jarUU-0000J6-M4
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 01:56:22 +0000
X-Inumbo-ID: e5779618-9973-11ea-b9cf-bc764e2007e4
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5779618-9973-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 01:56:03 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id p4so5758081qvr.10
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 18:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e8TO7h61vMYwatja+1Xk6Uhtwz9m20nO7NIF4kE+skE=;
 b=BbRKeWSCviRUxAOA+eUdGqw6Y1cC5Wj/I2lE3fY6GiPOHoRcmI9EK6t1z21Rrn1nJu
 LHmg+mAbJ4GIVD/vBzQeXvHxi5lt6lUEcyj/deZ+h9nL2VeUZrXC+15t18IoPSjmgtcG
 NSVmzIR/ONrICz7UVWB7iodUK/M4XToSxwUX8GTiLtjOKRGvy5PUke3nNB4Lx2zWco6h
 +8KithsI9L4Kof0lW5iOrE0Hlu1vtnKyyn94fHZ9GMRcJHdqsMhXcliHgj0CUVT1IpHc
 ++bop7pplnhGfZ01OKW1nqHbhj8UKYIABX6ZHagwTPTHkSB7BdwT+OqEbIr4TGYd7Ooz
 pq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e8TO7h61vMYwatja+1Xk6Uhtwz9m20nO7NIF4kE+skE=;
 b=K6M2YjjVeeZfqVVrwbXmnyk7nZL1PvedCbLr3mZ/437/JnbqH0yV11cV+FOc6QhwX7
 oHMwgCNtwl6Xl5T4/13h1tOZErcQJqxuulTkuT7s+5SfIF1daqY3eYDlZuSzkKsEGyR4
 iGLbUg93m2HsV8eWte/jgnJzKNmSbhz6vQpZ1TCNH7NWnUjxXyc9mNjp/2TB7Nm6rjkB
 QTlmxmc2HiHy4tX79iK0H/4ALoApQdkoOHKfaY1psCUz8numG3PyuxYMDSIW2y/3A7bL
 pdFX1iNuWiuodp9TrXtfl8Zn2vpB5OZkZa8t1DBItkC4HrdhnpfRSBEFM18WAcTbIQHr
 XJnA==
X-Gm-Message-State: AOAM530qgC4LVt0c1nE6wI9mbHzdiGqOp2VyAusuS1OI1NlwBOaafVhW
 hSFr7OfPYNtaGvpXDfl1CfPY9Aj3
X-Google-Smtp-Source: ABdhPJzbpjWOrcqmflQcR6E22gVQ4L4bxyt56htHAEFEX8VD8vIJ5q+gINX5KbokM7bGs0s+AcO3yA==
X-Received: by 2002:ad4:4b61:: with SMTP id m1mr19597825qvx.235.1589853363185; 
 Mon, 18 May 2020 18:56:03 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:e463:db9c:c6eb:4544])
 by smtp.gmail.com with ESMTPSA id q2sm9731898qkn.116.2020.05.18.18.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 18:56:02 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 07/19] libxl: write qemu arguments into separate xenstore
 keys
Date: Mon, 18 May 2020 21:54:51 -0400
Message-Id: <20200519015503.115236-8-jandryuk@gmail.com>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

This allows using arguments with spaces, like -append, without
nominating any special "separator" character.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Write arguments in dm-argv directory instead of overloading mini-os's
dmargs string.

Make libxl__write_stub_dmargs vary behaviour based on the
is_linux_stubdom flag.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Changes in v3:
 - previous version of this patch "libxl: use \x1b to separate qemu
   arguments for linux stubdomain" used specific non-printable
   separator, but it was rejected as xenstore doesn't cope well with
   non-printable chars
Changes in v6:
 - Re-work to use libxl__xs_ functions in a loop.
 - Drop rtc/timeoffset
Changes in v7:
 - Use a single function with an is_linux_stubdom flag.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libxl/libxl_dm.c | 77 +++++++++++++++++++++++++++---------------
 1 file changed, 49 insertions(+), 28 deletions(-)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index 8e57cd8c1f..23b13f84d2 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -2068,13 +2068,11 @@ static int libxl__vfb_and_vkb_from_hvm_guest_config(libxl__gc *gc,
 
 static int libxl__write_stub_dmargs(libxl__gc *gc,
                                     int dm_domid, int guest_domid,
-                                    char **args)
+                                    char **args, bool is_linux_stubdom)
 {
-    int i;
-    char *dmargs;
-    int dmargs_size;
     struct xs_permissions roperm[2];
     xs_transaction_t t = XBT_NULL;
+    char *dmargs;
     int rc;
 
     roperm[0].id = 0;
@@ -2082,22 +2080,27 @@ static int libxl__write_stub_dmargs(libxl__gc *gc,
     roperm[1].id = dm_domid;
     roperm[1].perms = XS_PERM_READ;
 
-    i = 0;
-    dmargs_size = 0;
-    while (args[i] != NULL) {
-        dmargs_size = dmargs_size + strlen(args[i]) + 1;
-        i++;
-    }
-    dmargs_size++;
-    dmargs = (char *) libxl__malloc(gc, dmargs_size);
-    i = 1;
-    dmargs[0] = '\0';
-    while (args[i] != NULL) {
-        if (strcmp(args[i], "-sdl") && strcmp(args[i], "-M") && strcmp(args[i], "xenfv")) {
-            strcat(dmargs, " ");
-            strcat(dmargs, args[i]);
+    if (!is_linux_stubdom) {
+        int dmargs_size = 0;
+        int i = 0;
+
+        while (args[i] != NULL) {
+            dmargs_size = dmargs_size + strlen(args[i]) + 1;
+            i++;
+        }
+
+        dmargs_size++;
+        dmargs = (char *) libxl__malloc(gc, dmargs_size);
+
+        i = 1;
+        dmargs[0] = '\0';
+        while (args[i] != NULL) {
+            if (strcmp(args[i], "-sdl") && strcmp(args[i], "-M") && strcmp(args[i], "xenfv")) {
+                strcat(dmargs, " ");
+                strcat(dmargs, args[i]);
+            }
+            i++;
         }
-        i++;
     }
 
     for (;;) {
@@ -2113,17 +2116,33 @@ static int libxl__write_stub_dmargs(libxl__gc *gc,
                                       &vm_path);
         if (rc) goto out;
 
-        path = GCSPRINTF("%s/image/dmargs", vm_path);
+        if (is_linux_stubdom) {
+            int i;
 
-        rc = libxl__xs_mknod(gc, t, path, roperm, ARRAY_SIZE(roperm));
-        if (rc) goto out;
+            path = GCSPRINTF("%s/image/dm-argv", vm_path);
 
-        rc = libxl__xs_write_checked(gc, t, path, dmargs);
-        if (rc) goto out;
+            rc = libxl__xs_mknod(gc, t, path, roperm, ARRAY_SIZE(roperm));
+            if (rc) goto out;
 
-        rc = libxl__xs_mknod(gc, t, GCSPRINTF("%s/rtc/timeoffset", vm_path),
-                             roperm, ARRAY_SIZE(roperm));
-        if (rc) goto out;
+            for (i=1; args[i] != NULL; i++) {
+                rc = libxl__xs_write_checked(gc, t,
+                                             GCSPRINTF("%s/%03d", path, i),
+                                             args[i]);
+                if (rc) goto out;
+            }
+        } else {
+            path = GCSPRINTF("%s/image/dmargs", vm_path);
+
+            rc = libxl__xs_mknod(gc, t, path, roperm, ARRAY_SIZE(roperm));
+            if (rc) goto out;
+
+            rc = libxl__xs_write_checked(gc, t, path, dmargs);
+            if (rc) goto out;
+
+            rc = libxl__xs_mknod(gc, t, GCSPRINTF("%s/rtc/timeoffset", vm_path),
+                                 roperm, ARRAY_SIZE(roperm));
+            if (rc) goto out;
+        }
 
         rc = libxl__xs_transaction_commit(gc, &t);
         if (!rc) break;
@@ -2298,7 +2317,9 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
 
     libxl__store_libxl_entry(gc, guest_domid, "dm-version",
         libxl_device_model_version_to_string(dm_config->b_info.device_model_version));
-    libxl__write_stub_dmargs(gc, dm_domid, guest_domid, args);
+
+    libxl__write_stub_dmargs(gc, dm_domid, guest_domid, args,
+                             libxl__stubdomain_is_linux(&guest_config->b_info));
     libxl__xs_printf(gc, XBT_NULL,
                      GCSPRINTF("%s/image/device-model-domid",
                                libxl__xs_get_dompath(gc, guest_domid)),
-- 
2.25.1


