Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D18D1BB4EE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:06:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHVN-0000Vl-3t; Tue, 28 Apr 2020 04:05:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHVM-0000VL-1W
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:05:56 +0000
X-Inumbo-ID: 8b13d8fe-8905-11ea-ae69-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b13d8fe-8905-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 04:05:49 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id o135so8118574qke.6
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yoxvi6Fn0hUGtZXkSZVhDlRzjiYf6QAuf1u1v/s9kVg=;
 b=nyhTvCVteicwBRfml1F/1X9SEKlXDcf0mV1eQmWK1EqABYdVryIuvIWhhsMnu5K8of
 64/qp10xpdfNjGbCJcC6a/ZI0NNTRp/HpMHeDJSA5yWtbxof6Sf4Kj4XIQVpwLp9Xjli
 cM1Gi+DnVw7F46KsqUWwf85COaMdI8069FpwngO4fqJeU+qCSFJcL+Pmn6r62xRAjQqs
 YFDZ11NJviyEcUU5DT/tjhWei5q5aecQViZxokdThfy9tWrMOWwZ7Kspgf51XIyKpMWX
 tnp2PAMeJygPKGOo394xbhwcy4PNrRH06cN9toIFuKguFiPYAwP3Fk5726zETIIH92nM
 OAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yoxvi6Fn0hUGtZXkSZVhDlRzjiYf6QAuf1u1v/s9kVg=;
 b=YClyXe6Zo0d5pmPf5CdWeciYWELbBrw+DyEc0lk/dJyS6FAYdetAtkSQUk9KcSX1U1
 8G9jyi5f51vIoPAJYEf+y+9z8Suz6Rfu7XqGhagKsScEYWSkkhVq1WhNN2EGvJ4T3rKa
 mGkjtat0igr98ZfnNg5/xFtldWvFl92T/WI5dNLCAuik08jps2rSRf1Ywwu5JnrDHSIL
 cbQq5d7JA0eivxOBF0SonCIb1Pw11SvFWAfba2xCYK6CrzKP6CprTUtFV7NenboYps4l
 8UpMDYkjmxOFmKvPqC1tOOE/jz46ZjkK4zRPut4mb+swknJ7rPHYdvqR09+9aSF1aqGW
 VkbA==
X-Gm-Message-State: AGi0PuZrHIehQLGkfA2K1s+/QzwDPEMHoAZ5KSWBYV/vFR3CVM92M/iU
 SQvpQgVe4GGu6dOae3RBncVi4NcN
X-Google-Smtp-Source: APiQypLZoo0Q1RhuT991ZsJO2xnFOfB8H+6LeffSoO1ivN3ZzIMZHQ8XBInLAOiRw0Wm6TYx5CCiFw==
X-Received: by 2002:a37:6594:: with SMTP id z142mr25445572qkb.55.1588046748320; 
 Mon, 27 Apr 2020 21:05:48 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:05:47 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 06/21] libxl: write qemu arguments into separate xenstore
 keys
Date: Tue, 28 Apr 2020 00:04:18 -0400
Message-Id: <20200428040433.23504-7-jandryuk@gmail.com>
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

This allows using arguments with spaces, like -append, without
nominating any special "separator" character.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
Changes in v3:
 - previous version of this patch "libxl: use \x1b to separate qemu
   arguments for linux stubdomain" used specific non-printable
   separator, but it was rejected as xenstore doesn't cope well with
   non-printable chars
---
 tools/libxl/libxl_dm.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
index 5a7d55686f..bdc23554eb 100644
--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -2065,6 +2065,40 @@ static int libxl__vfb_and_vkb_from_hvm_guest_config(libxl__gc *gc,
     return 0;
 }
 
+static int libxl__write_stub_linux_dmargs(libxl__gc *gc,
+                                    int dm_domid, int guest_domid,
+                                    char **args)
+{
+    libxl_ctx *ctx = libxl__gc_owner(gc);
+    int i;
+    char *vm_path;
+    char *path;
+    struct xs_permissions roperm[2];
+    xs_transaction_t t;
+
+    roperm[0].id = 0;
+    roperm[0].perms = XS_PERM_NONE;
+    roperm[1].id = dm_domid;
+    roperm[1].perms = XS_PERM_READ;
+
+    vm_path = libxl__xs_read(gc, XBT_NULL, GCSPRINTF("/local/domain/%d/vm", guest_domid));
+    path = GCSPRINTF("%s/image/dmargs", vm_path);
+
+retry_transaction:
+    t = xs_transaction_start(ctx->xsh);
+    xs_write(ctx->xsh, t, path, "", 0);
+    xs_set_permissions(ctx->xsh, t, path, roperm, ARRAY_SIZE(roperm));
+    i = 1;
+    for (i=1; args[i] != NULL; i++)
+        xs_write(ctx->xsh, t, GCSPRINTF("%s/%03d", path, i), args[i], strlen(args[i]));
+
+    xs_set_permissions(ctx->xsh, t, GCSPRINTF("%s/rtc/timeoffset", vm_path), roperm, ARRAY_SIZE(roperm));
+    if (!xs_transaction_end(ctx->xsh, t, 0))
+        if (errno == EAGAIN)
+            goto retry_transaction;
+    return 0;
+}
+
 static int libxl__write_stub_dmargs(libxl__gc *gc,
                                     int dm_domid, int guest_domid,
                                     char **args)
@@ -2274,7 +2308,10 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
 
     libxl__store_libxl_entry(gc, guest_domid, "dm-version",
         libxl_device_model_version_to_string(dm_config->b_info.device_model_version));
-    libxl__write_stub_dmargs(gc, dm_domid, guest_domid, args);
+    if (libxl__stubdomain_is_linux(&guest_config->b_info))
+        libxl__write_stub_linux_dmargs(gc, dm_domid, guest_domid, args);
+    else
+        libxl__write_stub_dmargs(gc, dm_domid, guest_domid, args);
     libxl__xs_printf(gc, XBT_NULL,
                      GCSPRINTF("%s/image/device-model-domid",
                                libxl__xs_get_dompath(gc, guest_domid)),
-- 
2.20.1


