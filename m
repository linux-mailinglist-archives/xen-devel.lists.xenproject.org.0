Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15BD1D8D57
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 03:56:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jarUa-0000MB-H2; Tue, 19 May 2020 01:56:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jarUZ-0000Lm-LB
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 01:56:27 +0000
X-Inumbo-ID: e6b5a40c-9973-11ea-b07b-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6b5a40c-9973-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 01:56:05 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id i68so9932464qtb.5
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 18:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZT6l/MiPRcZkFyWjFyjLysM4bTyEFRemlpKKfgP53K8=;
 b=elFKmU6j1ZIgLTmzjkhpJNbOoioOo6j4hHBYLYVKWNLIKoUfKkWwNOyzBwTNZzMsE3
 0uQ2ZTwcBrb/5S6D6DriuLMgGxkw1Lg16ggD5ixEVJbM8EST+KqV1t5SKs/kn6ZW+6yk
 HK0OjfDxefp9oQjhqEq96e7SfklGRsuk2fGHjiQW4+gphweYkIWtXYuQYyUb7hR/sDZf
 EfRWr/gRoAe7ivWx00ulFrs011sgQcPNRPmESUeMp39/avS65UUGKLXCt5RfXQhY7FSv
 EcMW68Q0PeDvXsXqKBRkLO/8QOkqSliQo8RKLIyAt04Bmjg1VJotdjzbX4R8pQyCHpHN
 gQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZT6l/MiPRcZkFyWjFyjLysM4bTyEFRemlpKKfgP53K8=;
 b=K436gOrqTF2qbHgFB7igmSrM2arDYpSkcwbMNotVPP9Sq5N8gRD3uX2/2/V+03DXEn
 oPeZjsIOYGoWfvkyq7/DWwvPP7qQPbI4AWQXqQoc+YI3Lf2QwGuC+Slr93Mv69mPQwnc
 GBvL2F6p6o/eDBXyicoJDUgEfNeC/zS/SjUn0NRIx664aGGE0P2LEtTHBRTvYm4ESZeU
 9fWVEynSRdE770MnAqa14+f5W3IQb4bAee14nu5EvCHO47hybA+7Lu1COXdjUysBtmCA
 w+lf9tkm8lJWV90oxWQ9mF4enWq6QWWVpHlUxXGsvrl8l7cH7wbq9LiLM6jM3XVMM0y/
 4mjQ==
X-Gm-Message-State: AOAM532/q/TUiUJPT9GGUDEFBy6Tqw0GUcXbJCMgkvEfhi50V9EIiCvH
 TsqpYwNZ0imWZTtwyU8pDq3MvP0j
X-Google-Smtp-Source: ABdhPJw7/9pM01IxlvHjRpZwT4cZjgA1vimz24Bp/lBjrL4XAKBw5ShvSMBRufnCcwYHiw1phAQqsw==
X-Received: by 2002:ac8:1aab:: with SMTP id x40mr19875411qtj.358.1589853365283; 
 Mon, 18 May 2020 18:56:05 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:e463:db9c:c6eb:4544])
 by smtp.gmail.com with ESMTPSA id q2sm9731898qkn.116.2020.05.18.18.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 18:56:04 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 08/19] xl: add stubdomain related options to xl config
 parser
Date: Mon, 18 May 2020 21:54:52 -0400
Message-Id: <20200519015503.115236-9-jandryuk@gmail.com>
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


