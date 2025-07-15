Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E50B054EE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:31:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043767.1413807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubb4N-0005oT-6I; Tue, 15 Jul 2025 08:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043767.1413807; Tue, 15 Jul 2025 08:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubb4N-0005mv-2y; Tue, 15 Jul 2025 08:31:23 +0000
Received: by outflank-mailman (input) for mailman id 1043767;
 Tue, 15 Jul 2025 08:31:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V4bE=Z4=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1ubb4L-0005YW-Ph
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:31:21 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 151da2a5-6156-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 10:31:19 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-456107181f8so887845e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 01:31:19 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560f22cd14sm84787075e9.30.2025.07.15.01.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 01:31:18 -0700 (PDT)
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
X-Inumbo-ID: 151da2a5-6156-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752568279; x=1753173079; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDovwYR+MAaNPWm/pgK0ijg6p2MZFtuj4DNgoEH65mE=;
        b=B+Y6R5RR1nWo4ax20arH00kmjoo5ca7rERMbsFM3rh2xgSKLd/6mVLMkfKckjxL5w0
         qUA/uwLqHaT7Qjt+pDczKu1O3GCMlb+4eeSP3OaNip2QxROqTXe2lHKhkAp8UzHN4XvC
         Vc/Abv7Db/hkWNO1umW7eRQ1wkt+M8CbeHzdb9+J+SfjgG+ifT84yndkwr6FE3xqsiQ5
         9zNnvznc1yHKf5dfOUsHrUJqVbkoCK0sjnrZleMWlAIw9bjc1XBya97Qu1xl0N86bf0G
         ++gHqjDsvUjqDKYCQirPB7lnPlNjkzZ1zzxQRnEsrVSeeUSKTG9T5cyCX0ayzpiS5LhA
         U0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752568279; x=1753173079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDovwYR+MAaNPWm/pgK0ijg6p2MZFtuj4DNgoEH65mE=;
        b=Ts5rMR+/xDzTPd0jZP6bzN9L0icR1xnzOQGbwr4tAvtE7oGGcIp6q1lL8Q1atgONPk
         wixc0Ca1yazvxarUh/M3yROnZg21XlGF+GDIXyeO5KTw2/Ott2uKclrpXomD1TV5Fj64
         z2Z+2OOhPRncfO+hKS8ANfLtZVogjFbxLkKp7BrW+HH0XVGRWErcIKnqTBjc+6L+TkrJ
         VvofO85I774DeE4SBLxxN+z0Sjht/zC2BareMwJ96mS5rGpUca80l+mAhP89I0vYKWjv
         bOVFmNeb/o2dioVo1nSSSKkexY0TXqVMxTo+WSyQkxh7Zjqr+FLjdcb4hhmwzk658AmB
         rZdA==
X-Gm-Message-State: AOJu0Yy6VCf3KC2kx9scA/8SUMIStlfKEcQXNQdoaIazTOBhCTRJjnYY
	NDfHXOULRnhfN+Oq8dvDKsrvpArMx9iLbOQLZD2YTrHsctf0h2aev/mGfVnLfQ==
X-Gm-Gg: ASbGncutEUXBIW5sPUgybOOnk+IhLVVYMgU78f9l2YR0yaLn1LgNP/ArQyKPa+tJClQ
	r1Z9WxTqEVlSeF4LXav4ohAqO/+lokc7tXbLzNLTc7F15DC0ZGzzmayjB/q6s3gr7xfFrPgmQDR
	fwZN8344odg1t7WhFcCiB250+HA6yhnVB60zdQJTFUw41txtqDTi25Uav3D4oMnm/H+/epz5msU
	trehhpxeXCfX8oT921rjTpwqe4RqfFqZUzThHO7dq4eEUxxO0rGZZheucVP5r6wKBHeuOeDVCEE
	eYeBlw1pWh8fY52p7HqJE8WQMjqpgbYGYxjwyjEGrcQjCwBrYPyN6smTot+HbDAmV8TL7abA33A
	CPIfKIKy1BPXLy/aqTQZvP7Z0SmtSlqR9qejTyAdQoj4c1gQSJ8h0NeoOWaP/wHIRTowZ+nkxGz
	7aULKCW0nKg1IFznP7GGC3Lw==
X-Google-Smtp-Source: AGHT+IH1cnclvUhwt+7YZWJYDVBaoczHDQRW8RHveecjHHf0ABBRw5EMJaNlrtnva/9pwpAIRJMBbw==
X-Received: by 2002:a05:600c:1c03:b0:456:c48:4907 with SMTP id 5b1f17b1804b1-4562908e12bmr3155785e9.0.1752568278676;
        Tue, 15 Jul 2025 01:31:18 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v9 1/6] tools/xl: Add altp2m_count parameter
Date: Tue, 15 Jul 2025 08:31:09 +0000
Message-Id: <c291e2e56c598df8c328e76f237699084b2dd593.1752568020.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752568020.git.w1benny@gmail.com>
References: <cover.1752568020.git.w1benny@gmail.com>
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
 tools/golang/xenlight/helpers.gen.go |  2 ++
 tools/golang/xenlight/types.gen.go   |  1 +
 tools/include/libxl.h                |  7 +++++++
 tools/libs/light/libxl_create.c      | 10 ++++++++++
 tools/libs/light/libxl_internal.h    |  1 +
 tools/libs/light/libxl_types.idl     |  1 +
 tools/xl/xl_parse.c                  |  9 +++++++++
 7 files changed, 31 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 191be87297..515a6ef10a 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1167,6 +1167,7 @@ if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
 x.Altp2M = Altp2MMode(xc.altp2m)
+x.Altp2MCount = uint32(xc.altp2m_count)
 x.VmtraceBufKb = int(xc.vmtrace_buf_kb)
 if err := x.Vpmu.fromC(&xc.vpmu);err != nil {
 return fmt.Errorf("converting field Vpmu: %v", err)
@@ -1695,6 +1696,7 @@ if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
 xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
+xc.altp2m_count = C.uint32_t(x.Altp2MCount)
 xc.vmtrace_buf_kb = C.int(x.VmtraceBufKb)
 if err := x.Vpmu.toC(&xc.vpmu); err != nil {
 return fmt.Errorf("converting field Vpmu: %v", err)
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 656933c6c9..1a4f076bd2 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -604,6 +604,7 @@ ArchX86 struct {
 MsrRelaxed Defbool
 }
 Altp2M Altp2MMode
+Altp2MCount uint32
 VmtraceBufKb int
 Vpmu Defbool
 TrapUnmappedAccesses Defbool
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index a8704e0268..d6b6e5d2dd 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1257,6 +1257,13 @@ typedef struct libxl__ctx libxl_ctx;
  */
 #define LIBXL_HAVE_ALTP2M 1
 
+/*
+ * LIBXL_HAVE_ALTP2M_COUNT
+ * If this is defined, then libxl supports setting the maximum number of
+ * alternate p2m tables.
+ */
+#define LIBXL_HAVE_ALTP2M_COUNT 1
+
 /*
  * LIBXL_HAVE_REMUS
  * If this is defined, then libxl supports remus.
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 8a85fba1cf..4301f17f90 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -421,6 +421,16 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         return -ERROR_INVAL;
     }
 
+    if (b_info->altp2m_count == LIBXL_ALTP2M_COUNT_DEFAULT) {
+        if (b_info->type == LIBXL_DOMAIN_TYPE_HVM &&
+            (libxl_defbool_val(b_info->u.hvm.altp2m) ||
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
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 75bb0b94cf..2a5b233caa 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -111,6 +111,7 @@
 #define LIBXL_MIN_DOM0_MEM (128*1024)
 #define LIBXL_INVALID_GFN (~(uint64_t)0)
 #define LIBXL_VGA_HOLE_SIZE 0x20
+#define LIBXL_ALTP2M_COUNT_DEFAULT (~(uint32_t)0)
 /* use 0 as the domid of the toolstack domain for now */
 #define LIBXL_TOOLSTACK_DOMID 0
 #define QEMU_SIGNATURE "DeviceModelRecord0002"
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index a3a79d12b2..fe251649f3 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -731,6 +731,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     # Alternate p2m is not bound to any architecture or guest type, as it is
     # supported by x86 HVM and ARM support is planned.
     ("altp2m", libxl_altp2m_mode),
+    ("altp2m_count", uint32, {'init_val': 'LIBXL_ALTP2M_COUNT_DEFAULT'}),
 
     # Size of preallocated vmtrace trace buffers (in KBYTES).
     # Use zero value to disable this feature.
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 7e11c62ba0..28cdbf07c2 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2099,6 +2099,15 @@ void parse_config_data(const char *config_source,
         }
     }
 
+    if (!xlu_cfg_get_long(config, "altp2m_count", &l, 1)) {
+        if (l != (uint16_t)l) {
+            fprintf(stderr, "ERROR: invalid value %ld for \"altp2m_count\"\n", l);
+            exit (1);
+        }
+
+        b_info->altp2m_count = l;
+    }
+
     if (!xlu_cfg_get_long(config, "vmtrace_buf_kb", &l, 1) && l) {
         b_info->vmtrace_buf_kb = l;
     }
-- 
2.34.1


