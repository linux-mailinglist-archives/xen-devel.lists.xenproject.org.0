Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C760E8C9082
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2024 13:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724745.1129905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8Hpf-0006GK-PF; Sat, 18 May 2024 11:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724745.1129905; Sat, 18 May 2024 11:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8Hpf-0006DG-MB; Sat, 18 May 2024 11:02:31 +0000
Received: by outflank-mailman (input) for mailman id 724745;
 Sat, 18 May 2024 11:02:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v3Z6=MV=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s8Hpe-0005yr-GJ
 for xen-devel@lists.xenproject.org; Sat, 18 May 2024 11:02:30 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e8082f4-1506-11ef-909f-e314d9c70b13;
 Sat, 18 May 2024 13:02:29 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4202cea9a2fso8231935e9.3
 for <xen-devel@lists.xenproject.org>; Sat, 18 May 2024 04:02:29 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8969fbsm23777282f8f.37.2024.05.18.04.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 04:02:28 -0700 (PDT)
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
X-Inumbo-ID: 1e8082f4-1506-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716030149; x=1716634949; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWD/Qk3szSfEZBTtbpcC8O4b8u+9LVoa4Hx6fikLkdc=;
        b=X1CNpWfCnOd83w1vZKQTTdRnA5VbHtPh44DRpSWomUqxOkP6m9GaKnoeMjJM6HlvfJ
         mYguuaMxW5YyimRPhjvc/dN/esu7PlRLPyKxKO2Aom3ys2jTpsMYXMBBfJKF8f+hZn05
         +4QtZEpKYOfgnKPhFZch8ZiwSSlE70Ddm98W5HvRvbY76nNyV3qn2e53u+MxYf7nYt85
         3mxyhiwBeoTGywZMSHGnEGczNR7ZOq7CRMem6hVQmyBwbSoi+xYnfNZiSeCs8lFBKEF9
         TkafBtJHWM1sWAwON+ml5oiRG0g4mcNIH66SlD6Vtm6xOWwJ/Ntbju3ZzvFaHjFGTQlL
         LiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716030149; x=1716634949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWD/Qk3szSfEZBTtbpcC8O4b8u+9LVoa4Hx6fikLkdc=;
        b=xUzQNnFpdMLzkOtbrj0LZv3+qhCAo1NhKWv0eLXmCvp2cPBpbGJhmXBiHMNQ3totdO
         EMJJ48pvM+L9GiU0yaZdK3GZ3k/L2d9nnkSVtyzUKZQJbTyjunTTNs7QBYWOSyS7vLGm
         sezK+0FoSVtAtAKiAiOJ4Hm0sk9heS2iqMQVZchnX3su70xpqSs3sg6M6xv36P4HJYfe
         Y0Xb7s5qhTXDtuf5HCYnc1v9p8PzN1+rtWOUxH6J0gmi3mAohXA1QZHKVT68YcA57Rlv
         5MJLGUjAwNtlymwl6AfurJazzFf9usm+SPACsN9sM+faf1vE9c8IQ+GARiFbGoxnWwoP
         CT7w==
X-Gm-Message-State: AOJu0YycUp0AUrVESppsweA41gtTCLdAkj82MAMRj8TrygI0g81azs+X
	tJ2W3gujR+bDLcVWZ+/keSIgG+18H3yPHaNdTOhMj2KyUWWAcxDSHjI3WQ==
X-Google-Smtp-Source: AGHT+IG7398q/5Qx6x7u3mnCKt2quXYSkSeMQG8C4wVwNPsRYjrqo+PixDsdfPG9NxBEx+6TwAKxZw==
X-Received: by 2002:a5d:53c5:0:b0:34d:a29c:b8b6 with SMTP id ffacd0b85a97d-3504a6311f6mr16471163f8f.24.1716030149141;
        Sat, 18 May 2024 04:02:29 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.19? v4 2/6] tools/xl: Add altp2m_count parameter
Date: Sat, 18 May 2024 11:02:13 +0000
Message-Id: <b4b7754bad90f234778b41f8227b50d1fb03f8f3.1716029860.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716029860.git.w1benny@gmail.com>
References: <cover.1716029860.git.w1benny@gmail.com>
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


