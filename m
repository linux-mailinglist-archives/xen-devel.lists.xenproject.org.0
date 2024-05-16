Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D158C7539
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 13:28:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723177.1127796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZHe-0006z9-Os; Thu, 16 May 2024 11:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723177.1127796; Thu, 16 May 2024 11:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ZHe-0006sK-I5; Thu, 16 May 2024 11:28:26 +0000
Received: by outflank-mailman (input) for mailman id 723177;
 Thu, 16 May 2024 11:28:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S52g=MT=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s7ZHd-0006b7-4l
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 11:28:25 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67cd5efb-1377-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 13:28:23 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-520f9d559f6so807061e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 04:28:23 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574bcede889sm7083043a12.92.2024.05.16.04.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 04:28:22 -0700 (PDT)
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
X-Inumbo-ID: 67cd5efb-1377-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858903; x=1716463703; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWD/Qk3szSfEZBTtbpcC8O4b8u+9LVoa4Hx6fikLkdc=;
        b=OAKSN4zl9kKwGdQLBWRMJB9b9kfhMWeWGWoJrYXfQM+7bjt7OFLUMfEUABYRlzXOQF
         uDcSzUfzdIftid9NaWRFtI/jIu5fo92rQTSKgAm6zNZZJFElvyHG6K+haJeA2qWYfMNn
         DziNiECtOOiSCg7gTrlAxuM11+0YgzshHr59pfwctJXT+CgRqMU/3XnFWNyr2xh9SLCJ
         msc7tbERB3uEuWibBMOj3btwV2rSj+auk/wnflHUaLB0YPw8QK0LvITfuyuF2QkJk7hZ
         kX68SrgkCJ/AW35T5jP101ll9Cm9j7hGlHTH78zzpcEyiQ9gf9Vnwy4UQjvz2AI/eHWy
         Pbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858903; x=1716463703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWD/Qk3szSfEZBTtbpcC8O4b8u+9LVoa4Hx6fikLkdc=;
        b=br+nRm8I9SQeMESpNj6hx98KYeURRn289JV/DbHENoXBokbSlA/dP+DHslRJx1wFZz
         3pCVNJYv9bwBljyjTQ0GCKwEBGOSkqTES7AtAAg53Xl1876gWTP5xxoskxHQoB3JgoV+
         WGgZFZ1OX7YOEpix5l/Wnu8KQrmXSPeZ/UNV6s0tKprnji8YHFk6RjeOw8M+rWISHcU3
         Azh9a2NYPJmTGQpZoaec03vedKqyXbcv+jdXdolkE5UKGBuajRhn29W1a8pFBgR0NhDF
         SPFtOGjEoGPhr6y50lIgRsyJ1Lhj0PlIvGYy8IsvbGVIbTm3LpsyxaOBY+bEySwBbBty
         1WNw==
X-Gm-Message-State: AOJu0Yy8+R0ZOx5iS+OypjZ9pjEbfZhq46coi/qnTAlrGGUNMcuDJx6G
	PXolxTeALjH4+uNb4RWUITGBKvB9qHD57y991IXvVUs3yL08x6AFAVMNX63g
X-Google-Smtp-Source: AGHT+IGL1s/Lp2LGNzl8vhiI2q4MxCc8OCCAMNjP6bbLOuclhZG+4EypeAZqby+BnX5zKsvL2FiZvg==
X-Received: by 2002:ac2:5b1e:0:b0:519:1047:7eac with SMTP id 2adb3069b0e04-5220fb746edmr12699563e87.23.1715858902834;
        Thu, 16 May 2024 04:28:22 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.19? v3 2/6] tools/xl: Add altp2m_count parameter
Date: Thu, 16 May 2024 11:28:09 +0000
Message-Id: <71133f351e0a5d6b993c608e8d33e62487d6142c.1715858136.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715858136.git.w1benny@gmail.com>
References: <cover.1715858136.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Introduce a new altp2m_count parameter to control the maximum number of altp2m
views a domain can use. By default, if altp2m_count is unspecified and altp2m
is enabled, the value is set to 10, reflecting the legacy behavior.

This change is preparatory; it establishes the groundwork for the feature but
does not activate it.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/golang/xenlight/helpers.gen.go | 2 ++
 tools/golang/xenlight/types.gen.go   | 1 +
 tools/include/libxl.h                | 8 ++++++++
 tools/libs/light/libxl_create.c      | 9 +++++++++
 tools/libs/light/libxl_types.idl     | 1 +
 tools/xl/xl_parse.c                  | 4 ++++
 6 files changed, 25 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 78bdb08b15..40c247a0d0 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1158,6 +1158,7 @@ if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
 x.Altp2M = Altp2MMode(xc.altp2m)
+x.Altp2MCount = uint32(xc.altp2m_count)
 x.VmtraceBufKb = int(xc.vmtrace_buf_kb)
 if err := x.Vpmu.fromC(&xc.vpmu);err != nil {
 return fmt.Errorf("converting field Vpmu: %v", err)
@@ -1674,6 +1675,7 @@ if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
 xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
+xc.altp2m_count = C.uint32_t(x.Altp2MCount)
 xc.vmtrace_buf_kb = C.int(x.VmtraceBufKb)
 if err := x.Vpmu.toC(&xc.vpmu); err != nil {
 return fmt.Errorf("converting field Vpmu: %v", err)
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index ccfe18019e..a3ae8ef35a 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -602,6 +602,7 @@ ArchX86 struct {
 MsrRelaxed Defbool
 }
 Altp2M Altp2MMode
+Altp2MCount uint32
 VmtraceBufKb int
 Vpmu Defbool
 }
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 62cb07dea6..1f149a8015 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1239,6 +1239,14 @@ typedef struct libxl__ctx libxl_ctx;
  */
 #define LIBXL_HAVE_ALTP2M 1

+/*
+ * LIBXL_HAVE_ALTP2M_COUNT
+ * If this is defined, then libxl supports setting the maximum number of
+ * alternate p2m tables.
+ */
+#define LIBXL_HAVE_ALTP2M_COUNT 1
+#define LIBXL_ALTP2M_COUNT_DEFAULT (~(uint32_t)0)
+
 /*
  * LIBXL_HAVE_REMUS
  * If this is defined, then libxl supports remus.
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 41252ec553..236b8c1965 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -483,6 +483,15 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         return -ERROR_INVAL;
     }

+    if (b_info->altp2m_count == LIBXL_ALTP2M_COUNT_DEFAULT) {
+        if ((libxl_defbool_val(b_info->u.hvm.altp2m) ||
+            b_info->altp2m != LIBXL_ALTP2M_MODE_DISABLED))
+            /* Reflect the default legacy count */
+            b_info->altp2m_count = 10;
+        else
+            b_info->altp2m_count = 0;
+    }
+
     /* Assume that providing a bootloader user implies enabling restrict. */
     libxl_defbool_setdefault(&b_info->bootloader_restrict,
                              !!b_info->bootloader_user);
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 79e9c656cc..eb306fedf5 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -728,6 +728,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     # Alternate p2m is not bound to any architecture or guest type, as it is
     # supported by x86 HVM and ARM support is planned.
     ("altp2m", libxl_altp2m_mode),
+    ("altp2m_count", uint32, {'init_val': 'LIBXL_ALTP2M_COUNT_DEFAULT'}),

     # Size of preallocated vmtrace trace buffers (in KBYTES).
     # Use zero value to disable this feature.
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index c504ab3711..048ab6be0d 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2063,6 +2063,10 @@ void parse_config_data(const char *config_source,
         }
     }

+    if (!xlu_cfg_get_long(config, "altp2m_count", &l, 1)) {
+        b_info->altp2m_count = l;
+    }
+
     if (!xlu_cfg_get_long(config, "vmtrace_buf_kb", &l, 1) && l) {
         b_info->vmtrace_buf_kb = l;
     }
--
2.34.1


