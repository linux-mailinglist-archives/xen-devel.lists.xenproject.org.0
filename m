Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5D31BB4F1
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:06:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHVS-0000Yo-E7; Tue, 28 Apr 2020 04:06:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHVR-0000Y3-1j
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:06:01 +0000
X-Inumbo-ID: 8ce4326e-8905-11ea-9887-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ce4326e-8905-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 04:05:52 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id l78so20535005qke.7
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ScCYPQwHljuvh1NyG9qLCW4etudB53sNPzGGuSEsg5E=;
 b=DD8dKbE2UyuORRV4e6/jwNd1KZZCUDLQzDSt56sCVNhtvNq/JNdETGi9a0zmgy+4v6
 51xv70N0uBsYFjgyxXLnoSwdN0Dm3W6YJwojBumX6l2lcWloZhYl8jDe5U/ym3oiAM/o
 V+aSGC3FrQnDdJPjs4MhwJekCGUqZk7oRQbPZXRpAKoYMQouUAqmGXaPZqv3pmcvdAC9
 gYayFUrcN2KjqpbCSVGS3xtqxjvIj/RI6M5IY/N+WmVvrirRdi1XB+lpF2EDqUTR8ahc
 yaitGp2AqxkbzD80sDStZcO5iWFnzTglhehiY1FbpdhW6Pd1xk+BkAoBtc3Xyy7NQbeI
 1IQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ScCYPQwHljuvh1NyG9qLCW4etudB53sNPzGGuSEsg5E=;
 b=V7DWXszAsAfWJ9jGYmzRvowVMFjFgIMk/djDKAJkzO7aZ6tyT5v8BZJkrHhP0BcZDw
 1fmEHS3fVLDyrMf9RRfMXe8VWlkR02OnPT+3K3/DK91ezyg1xvrE/wKRiXpclvDjkXTj
 OkDRJDh42/EowSW1l7rc5jG3bT3WFZPQP+JO46T/Ro/r4bXNU3IHtI17LZOlFt2PhpV/
 21Rp5oH8rtEeY9JJug1lL6AypCo101O0V6K2GYlgcbddnmy8gc5pUg2a/Uemo/wCMHMb
 Ph70qUJXTy2l8sfHIXnyck655GAE5go++1UCMxA17V4p1RDFzDKZURzNhScVp/DiToyn
 xOLA==
X-Gm-Message-State: AGi0Pua53Sqk1urZyBWdcYC474RkTryTMJZe8kYIqiuP/+ogw/+YOeFo
 u1dYxS5neatVxgGFBkHn91EdufnE
X-Google-Smtp-Source: APiQypLQj+SpdbcefmCI0JV61LJufloBhRsV9i3XEZ3SYaTXit5sr4pE9fwesQz6rYAUnf+MDR7hVw==
X-Received: by 2002:a37:d93:: with SMTP id 141mr26036151qkn.32.1588046751337; 
 Mon, 27 Apr 2020 21:05:51 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:05:50 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 07/21] xl: add stubdomain related options to xl config
 parser
Date: Tue, 28 Apr 2020 00:04:19 -0400
Message-Id: <20200428040433.23504-8-jandryuk@gmail.com>
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

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
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
2.20.1


