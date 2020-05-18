Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 249731D6E71
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 03:15:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaUNC-0000AK-Iw; Mon, 18 May 2020 01:15:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaUNA-00009C-UA
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 01:15:16 +0000
X-Inumbo-ID: fdb22538-98a4-11ea-9887-bc764e2007e4
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdb22538-98a4-11ea-9887-bc764e2007e4;
 Mon, 18 May 2020 01:14:58 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id g20so3966786qvb.9
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 18:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZT6l/MiPRcZkFyWjFyjLysM4bTyEFRemlpKKfgP53K8=;
 b=ZWs4G3cvljs854So2eVVa51MJT2R9HZcmfGA0jSnGPe07lXItHSgOW1qZQSuYbNzGV
 R4bZ4lyqcab2++5vnVaMlyJ8zhkFwgcbHHuPwue2Qb15ltHeoSEiaVrxx2xR9hm93kZ4
 4x2k53D0z5xPoboQ6DQL+pWcf0DLJtHHv9/7cNOJTbs/q9FzBlWwR0fy+V9diAWAuEAA
 seKIINGSVWe0Ai3YYbayONgS4MNo8zt9pIKYiLBYyfb/R8Q66McEPB6mxYQfHbLEiFsS
 OS/snIZXrsCpV0JwM/XyDYpswMyXecljlE+Eng6fV6Ofxd49PRJ120E24WdVDN2swUnH
 dUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZT6l/MiPRcZkFyWjFyjLysM4bTyEFRemlpKKfgP53K8=;
 b=nDdh96OgKK0ADj3oJWRvFu6OvskDqsIKyUnRYcmxHgZmFcQM2tkE5+TBRUXwJ6ESfP
 dK6LwvtjGNt7OuzUtOhuPaqdFGpLad63VQrqeeqUcdNRiYx5q+ZeXAzLzbNXsurY/Xze
 gjpy2e97sn8Up7lpS+cuWs8sgEtrfHQKiK2vYDJ+jqcfjUcN0Q/70UtBeN6tFrKpLmdU
 tSIV9F71in0Uh/n+gs1T6rvDNnFjUHFcmqsjk+opzCkMZslR361DtT2le5TkxqHP84Is
 S86lIFaO5hcGf3lzKiFBwtVJ6Eu4+n/GD7P3PXj/CGwzFc8QAVxjUGh+W9SivbV6MwG9
 FZIw==
X-Gm-Message-State: AOAM530Eo1wcx/8ksmNBLB422dM9DdRbEc8hJJsgtCWVdHGE7gNv1QPS
 ygCMB6ZIDMjIYuoYOv59e8GbMHDR
X-Google-Smtp-Source: ABdhPJxyBw/nM/Fgze8bx5QDsvLGwWtMqUCcThi3xkJ73BfrJmBnOwb54O24QFL5KfLmoZ65kRz+gg==
X-Received: by 2002:ad4:4b72:: with SMTP id m18mr13842435qvx.62.1589764498064; 
 Sun, 17 May 2020 18:14:58 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:ec68:c92e:af5a:2d3a])
 by smtp.gmail.com with ESMTPSA id l2sm7072864qkd.57.2020.05.17.18.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 18:14:57 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 07/18] xl: add stubdomain related options to xl config
 parser
Date: Sun, 17 May 2020 21:13:42 -0400
Message-Id: <20200518011353.326287-8-jandryuk@gmail.com>
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

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

---
Changes in v6:
 - Add Acked-by: Ian Jackson
---
 docs/man/xl.cfg.5.pod.in | 27 +++++++++++++++++++++++----
 tools/xl/xl_parse.c      |  7 +++++++
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 0e9e58a41a..c9bc181a95 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2733,10 +2733,29 @@ model which they were installed with.
 
 =item B<device_model_override="PATH">
 
-Override the path to the binary to be used as the device-model. The
-binary provided here MUST be consistent with the
-B<device_model_version> which you have specified. You should not
-normally need to specify this option.
+Override the path to the binary to be used as the device-model running in
+toolstack domain. The binary provided here MUST be consistent with the
+B<device_model_version> which you have specified. You should not normally need
+to specify this option.
+
+=item B<stubdomain_kernel="PATH">
+
+Override the path to the kernel image used as device-model stubdomain.
+The binary provided here MUST be consistent with the
+B<device_model_version> which you have specified.
+In case of B<qemu-xen-traditional> it is expected to be MiniOS-based stubdomain
+image, in case of B<qemu-xen> it is expected to be Linux-based stubdomain
+kernel.
+
+=item B<stubdomain_ramdisk="PATH">
+
+Override the path to the ramdisk image used as device-model stubdomain.
+The binary provided here is to be used by a kernel pointed by B<stubdomain_kernel>.
+It is known to be used only by Linux-based stubdomain kernel.
+
+=item B<stubdomain_memory=MBYTES>
+
+Start the stubdomain with MBYTES megabytes of RAM. Default is 128.
 
 =item B<device_model_stubdomain_override=BOOLEAN>
 
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 4450d59f16..61b4ef7b7e 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2525,6 +2525,13 @@ skip_usbdev:
     xlu_cfg_replace_string(config, "device_model_user",
                            &b_info->device_model_user, 0);
 
+    xlu_cfg_replace_string (config, "stubdomain_kernel",
+                            &b_info->stubdomain_kernel, 0);
+    xlu_cfg_replace_string (config, "stubdomain_ramdisk",
+                            &b_info->stubdomain_ramdisk, 0);
+    if (!xlu_cfg_get_long (config, "stubdomain_memory", &l, 0))
+        b_info->stubdomain_memkb = l * 1024;
+
 #define parse_extra_args(type)                                            \
     e = xlu_cfg_get_list_as_string_list(config, "device_model_args"#type, \
                                     &b_info->extra##type, 0);            \
-- 
2.25.1


