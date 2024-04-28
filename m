Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1AD8B4CE7
	for <lists+xen-devel@lfdr.de>; Sun, 28 Apr 2024 18:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713704.1114604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s17lp-0006b7-1N; Sun, 28 Apr 2024 16:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713704.1114604; Sun, 28 Apr 2024 16:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s17lo-0006V4-Qz; Sun, 28 Apr 2024 16:52:56 +0000
Received: by outflank-mailman (input) for mailman id 713704;
 Sun, 28 Apr 2024 16:52:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a4SJ=MB=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s17ll-0006DB-6O
 for xen-devel@lists.xenproject.org; Sun, 28 Apr 2024 16:52:53 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c004c654-057f-11ef-909a-e314d9c70b13;
 Sun, 28 Apr 2024 18:52:51 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-344047ac7e4so2637578f8f.0
 for <xen-devel@lists.xenproject.org>; Sun, 28 Apr 2024 09:52:51 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a056000188c00b00347eb354b30sm27850921wri.84.2024.04.28.09.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Apr 2024 09:52:50 -0700 (PDT)
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
X-Inumbo-ID: c004c654-057f-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714323171; x=1714927971; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muQF6XIlOcvgBSNEsl6TLFua9rrP8CEbsAqrDkhuigQ=;
        b=X/Y5pkodFpLXnOCb8+QdSGhlBlM6hEIX4IK9IY5yR7jH4jeCCGA+zwP9rbOJubc59X
         hZabz7TmcBI1j1haD0PAftjSZv0f0ZQOLtgrhb88rNHc8V18Szk8ZRVvhZs0WZb8WM0J
         1St8XtezqQ0oq006UMdxGEBktSsr3Q/9XUvkTmnmgIA+r1Z10BqItW6X1SkbIhoRyDZY
         ojoJLAVzvdsob+zl7Nk5oMOO+Y1RByqctJpoWsI+axnoHZ1OxhHTdsdz8m17/dKfcXmC
         2JAfaTmz7ag6CzYjNAQV5+fhM8sQ3FE5gYvwlZuJvjSFKmgdBt3vaNhZc50ewURTAzA/
         drfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714323171; x=1714927971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muQF6XIlOcvgBSNEsl6TLFua9rrP8CEbsAqrDkhuigQ=;
        b=aF1ZdIdcedYZcJPoEDpu/SLEdwjTBGalyU39LK5Nvqg+ULHA7zDrianmgkVan1lsnf
         enRns3w26sqertHiKI7/NeA0CS5Yz9BySjoTyJGpEYOoLQZ+olRgrXzoY+ESp0nQjvtm
         /dJ1fbm3u/zVkHuSA7u/cnRbJN/9F6MKef6spPHgW4fTmasCK1Iz3LyJIPPyFo2t1nQn
         UaFEeQvD4tuAJm8lZtBmGaGeR5BBHHxtloD55oLOnFYEDPcvhqD2eL0UwO6+7vj37S+1
         C32nVDhYGX4kVIFSqjYu/AlpJECuwWmtzREjmJ9qzZYxGjHVW6v1jyeHodNxWIbtNW5h
         9UXQ==
X-Gm-Message-State: AOJu0Yx2MfVtjvFus6UTYYnHfsjfOR9fLxeNXqgmksFtTPmc10tNfoYK
	SAr5yiRxuk/HHuvqgTs2DyzicYwGHOJTo65cHxqTBx1IfwR2ZfR4nYUZgfgo
X-Google-Smtp-Source: AGHT+IEYxuPWlCBgkUyK+vExZMpgUXm6GpD5YJWUhI8AK7vIaSHJ8Qt6J075uCwgQmd2u/tM2QoOmQ==
X-Received: by 2002:adf:f7ca:0:b0:349:bb17:6e60 with SMTP id a10-20020adff7ca000000b00349bb176e60mr4054187wrq.2.1714323170707;
        Sun, 28 Apr 2024 09:52:50 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 2/7] tools/xl: Add max_altp2m parameter
Date: Sun, 28 Apr 2024 16:52:37 +0000
Message-Id: <b0530fdc758bedb62c6cf1b5876d2d45304f0a13.1714322424.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714322424.git.w1benny@gmail.com>
References: <cover.1714322424.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Introduce a new max_altp2m parameter to control the maximum number of altp2m
views a domain can use. By default, if max_altp2m is unspecified and altp2m is
enabled, the value is set to 10, reflecting the legacy behavior.

This change is preparatory; it establishes the groundwork for the feature but
does not activate it.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
Changed since v1:
  * Removed the change of xen/include/public/domctl.h (moved into future commit)
  * Removed corresponding assignment of xen_domctl_createdomain::max_altp2m
    in libxl_create.c (moved into future commit)
  * Clarify in commit message that this change is preparatory

 tools/golang/xenlight/helpers.gen.go | 2 ++
 tools/golang/xenlight/types.gen.go   | 1 +
 tools/include/libxl.h                | 8 ++++++++
 tools/libs/light/libxl_create.c      | 8 ++++++++
 tools/libs/light/libxl_types.idl     | 1 +
 tools/xl/xl_parse.c                  | 4 ++++
 6 files changed, 24 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 78bdb08b15..4458d5bcbb 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1158,6 +1158,7 @@ if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
 x.Altp2M = Altp2MMode(xc.altp2m)
+x.MaxAltp2M = uint32(xc.max_altp2m)
 x.VmtraceBufKb = int(xc.vmtrace_buf_kb)
 if err := x.Vpmu.fromC(&xc.vpmu);err != nil {
 return fmt.Errorf("converting field Vpmu: %v", err)
@@ -1674,6 +1675,7 @@ if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
 xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
+xc.max_altp2m = C.uint32_t(x.MaxAltp2M)
 xc.vmtrace_buf_kb = C.int(x.VmtraceBufKb)
 if err := x.Vpmu.toC(&xc.vpmu); err != nil {
 return fmt.Errorf("converting field Vpmu: %v", err)
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index ccfe18019e..7139bcf324 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -602,6 +602,7 @@ ArchX86 struct {
 MsrRelaxed Defbool
 }
 Altp2M Altp2MMode
+MaxAltp2M uint32
 VmtraceBufKb int
 Vpmu Defbool
 }
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 62cb07dea6..c73d9f2ff1 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1239,6 +1239,14 @@ typedef struct libxl__ctx libxl_ctx;
  */
 #define LIBXL_HAVE_ALTP2M 1

+/*
+ * LIBXL_HAVE_MAX_ALTP2M
+ * If this is defined, then libxl supports setting the maximum number of
+ * alternate p2m tables.
+ */
+#define LIBXL_HAVE_MAX_ALTP2M 1
+#define LIBXL_MAX_ALTP2M_DEFAULT (~(uint32_t)0)
+
 /*
  * LIBXL_HAVE_REMUS
  * If this is defined, then libxl supports remus.
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 41252ec553..801f704a02 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -483,6 +483,14 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         return -ERROR_INVAL;
     }

+    if (b_info->max_altp2m == LIBXL_MAX_ALTP2M_DEFAULT) {
+        if ((libxl_defbool_val(b_info->u.hvm.altp2m) ||
+            b_info->altp2m != LIBXL_ALTP2M_MODE_DISABLED))
+            b_info->max_altp2m = 10;
+        else
+            b_info->max_altp2m = 0;
+    }
+
     /* Assume that providing a bootloader user implies enabling restrict. */
     libxl_defbool_setdefault(&b_info->bootloader_restrict,
                              !!b_info->bootloader_user);
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 470122e768..c887d8ea8c 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -728,6 +728,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     # Alternate p2m is not bound to any architecture or guest type, as it is
     # supported by x86 HVM and ARM support is planned.
     ("altp2m", libxl_altp2m_mode),
+    ("max_altp2m", uint32, {'init_val': 'LIBXL_MAX_ALTP2M_DEFAULT'}),

     # Size of preallocated vmtrace trace buffers (in KBYTES).
     # Use zero value to disable this feature.
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index ab09d0288b..741668e10a 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2061,6 +2061,10 @@ void parse_config_data(const char *config_source,
         }
     }

+    if (!xlu_cfg_get_long(config, "max_altp2m", &l, 1)) {
+        b_info->max_altp2m = l;
+    }
+
     if (!xlu_cfg_get_long(config, "vmtrace_buf_kb", &l, 1) && l) {
         b_info->vmtrace_buf_kb = l;
     }
--
2.34.1


