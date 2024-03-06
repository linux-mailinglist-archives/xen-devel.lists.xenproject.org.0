Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9663873C91
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 17:48:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689395.1074304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhuRe-00007T-CD; Wed, 06 Mar 2024 16:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689395.1074304; Wed, 06 Mar 2024 16:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhuRe-00005H-9Z; Wed, 06 Mar 2024 16:48:42 +0000
Received: by outflank-mailman (input) for mailman id 689395;
 Wed, 06 Mar 2024 16:48:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+FG1=KM=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1rhuRc-00005B-Bw
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 16:48:40 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 612d88fb-dbd9-11ee-afda-a90da7624cb6;
 Wed, 06 Mar 2024 17:48:39 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-512f3e75391so2134279e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 08:48:38 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 fk15-20020a05600c0ccf00b00412ff1acf05sm1021130wmb.7.2024.03.06.08.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 08:48:37 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id DE7A85F796;
 Wed,  6 Mar 2024 16:48:36 +0000 (GMT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 612d88fb-dbd9-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709743718; x=1710348518; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PgcX19QUQvO9a0rJ1WYbUKrpxkk0cHhIiPkrtv4Xua8=;
        b=APw3PZnzvflZzfU3ZXeCYAUUaczwMoppIGtlisEMSvUHsUZteBsVapMHp205Qaseod
         gmqhzk/Tu+dwkln3ioW8gCz783YsxYGaV9c71KBJSsU8JUghlHHIDHwg7bG8yNojLTvq
         AcDv2LyxGbBE2I31RT3bpjbQ6AAxECPDm3KGjqgnQmcGpdwVKfnxJef8mEZhRLJUtDdv
         zq6hoUk8SsxOdXCw+3NT4JAnb3cDaH9nWtlVjukmnZo+mhgrJaC/hq8DJhDvBOcz876D
         k8iVlnWAhcn/mRJ2pelEHm6lQkezYV6UFseSTPW9qpgmBy+RXTwpjPiggFc6S/Yr/sY+
         ItKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709743718; x=1710348518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgcX19QUQvO9a0rJ1WYbUKrpxkk0cHhIiPkrtv4Xua8=;
        b=oqikbLiGSYyMSX4ruuYIT/BofWx46v0vDg8fo/bQskVOdjimDlu3XdvU7MuavXvB/q
         C47uvyZika91rgZJK86LqKmvUYRnTfZee1sEVRFvjv0GwlLfjm+8BibR2blNSI41tAFT
         mL0XlcZMGf6Q6mzzNb5qbI3QBzyVyP1CTzxUIpTYe8bdhNDjr7GrYI6oAqWdh03sx8/K
         huvtePU/Q4GcXXDxROaytm5n6OEh/NEd/JEPYjaoGWKrkygjrOcRgqDQUW5d7SMlAXPs
         ZfAgBJ1JpUaau+8ZjZKeTmP1V3DDj+bXENoxqrYXanvWg2QBTeXD23YCRXZt9bNXGWlP
         kpRw==
X-Gm-Message-State: AOJu0YyCBZEBEUnvd8rvSbYsBaRunvhIY2PSRcv5nOIRVJJiNyM48dmW
	pgtzanS60fqNOYxzgNd3JWei74j5AhzrspaWGacZFS3CNhx2R8L5VDxWnVIP39mM70uHpfjoGdp
	2
X-Google-Smtp-Source: AGHT+IEys42Mf/xBgBycnQ/heyOKiVoOZovfkQDvdq4KY0U7LwmYAV1vfWAjpNlbh3i5L8X0r+12sw==
X-Received: by 2002:a05:6512:2e4:b0:513:64d7:afb5 with SMTP id m4-20020a05651202e400b0051364d7afb5mr933469lfq.57.1709743717603;
        Wed, 06 Mar 2024 08:48:37 -0800 (PST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH] tools/libxl: force running dm when device_model_args set
Date: Wed,  6 Mar 2024 16:48:29 +0000
Message-Id: <20240306164829.3815555-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When device_model_args is set we almost certainly want to spawn the
device model. This is most useful when debugging with QEMU and you
want to specify a new device type for testing without teaching libxl
about the device itself.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
This is very much an RFC, it's useful to me as a developer but I can
see an argument for being more cautious for production.
---
 tools/libs/light/libxl_dm.c      | 6 ++++++
 tools/libs/light/libxl_types.idl | 2 ++
 tools/xl/xl_parse.c              | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 620f381560..5774510aa0 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -3969,7 +3969,13 @@ int libxl__need_xenpv_qemu(libxl__gc *gc, libxl_domain_config *d_config)
         }
     }
 
+    /* finally if we've slurped extra args we almost certainly do */
+    if (d_config->need_ext_dm) {
+        ret = 1;
+    }
+
 out:
+    LOGD(INFO, domid, "need_qemu: %s", ret == 1 ? "yes":"no");
     return ret;
 }
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 2be194eb19..e7705bebe9 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -1113,6 +1113,8 @@ libxl_domain_config = Struct("domain_config", [
     ("on_watchdog", libxl_action_on_shutdown),
     ("on_crash", libxl_action_on_shutdown),
     ("on_soft_reset", libxl_action_on_shutdown),
+    # true when we need to launch dm to serve the guest
+    ("need_ext_dm", bool),
     ], dir=DIR_IN)
 
 libxl_diskinfo = Struct("diskinfo", [
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 52e20134a9..be0ea3e3dc 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -3083,6 +3083,8 @@ skip_usbdev:
     if (e && e != ESRCH) {                                                \
         fprintf(stderr,"xl: Unable to parse device_model_args"#type".\n");\
         exit(-ERROR_FAIL);                                                \
+    } else if (e) {                                                     \
+        d_config->need_ext_dm = true;                                   \
     }
 
     /* parse extra args for qemu, common to both pv, hvm */
-- 
2.39.2


