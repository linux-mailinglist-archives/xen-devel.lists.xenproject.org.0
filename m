Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4B5B07EAE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 22:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045625.1415784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8Xl-00049W-Eb; Wed, 16 Jul 2025 20:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045625.1415784; Wed, 16 Jul 2025 20:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8Xl-00040H-5i; Wed, 16 Jul 2025 20:15:57 +0000
Received: by outflank-mailman (input) for mailman id 1045625;
 Wed, 16 Jul 2025 20:15:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2WS3=Z5=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uc8Xj-0003uY-Fp
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 20:15:55 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac6229d8-6281-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 22:15:53 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a4e62619afso29594f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 13:15:53 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f2e8csm30504145e9.5.2025.07.16.13.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 13:15:51 -0700 (PDT)
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
X-Inumbo-ID: ac6229d8-6281-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752696952; x=1753301752; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDovwYR+MAaNPWm/pgK0ijg6p2MZFtuj4DNgoEH65mE=;
        b=hmQd1gv/Rew8Tb+gemsLSE6Fv3kF59W0ImdhZi4WeaXA35dY2rfLPsIOasRykbwE3w
         uxrOLMdBp8JMsYQuAJhGTqWA5vDxSuoi/CegJY357mww071tfmNOkHnkKcznK6ECnK55
         AtQCFPseqyQiBp+dNL1c60IrVH/ZaQMD1Z4tLwvF/God6UOv5t+W5C1X8uOVhW4xb2mK
         8+j3lC/cdgLMP+2j5GdNkEN6ScJRp/JswfxMAqdRrPDiyoirGruqooMaHGV4PMdrxBBc
         yq5C6RVpDXGv0r9F9FmCN29S6kmQtw+omoTpouYKJMINJKSe7Pqsg/UKx29zEBLrhrRH
         vU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752696952; x=1753301752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDovwYR+MAaNPWm/pgK0ijg6p2MZFtuj4DNgoEH65mE=;
        b=qLiOcm7deb5E1PtG0ZSvwIzxTocqny0htobN+FH6Y8kmhdu8vERQEoYOnr84n83ylg
         IGfmy/AJdq/7med9xa+R5G5vAGeDq5x5p8n6rjohwyrpYE3/3++AxyXy+6NOE2oqgJEm
         zx8AOucGSzZjfasqBHXzDNnwcNfsy7zl76tMN0KKxroev5bUZKJ9jRkHr0xbsuztflnD
         tNGP16FeNk3JuGHMVfM1FvEqKFw0IDxHHUTavwYVt3VArky1Dd0DZfgnaVjHVUPQ39eo
         bx6rRXCSBd1RcAP1J8tJ66iajJOISqrTpCszBYAcDI6MRcojCsIfF5QzEL1XMzFQYJbF
         In6Q==
X-Gm-Message-State: AOJu0YyIzPvKC9ltQiQRZEo6l6hYIha6kINzdpyqURXGhjdGOYbCRLJf
	QXiqYN+FizOHtsnKGtsZ8CWZmNPFi0suty9DWNHa4druE37MDt0OGQR89/PYIg==
X-Gm-Gg: ASbGncvs47FPVU+3w5THdaOH1si+roTAJ0QrDsY9+WYzJYVpmaChc2EdlShq5applRX
	O15HnoRX5JHwKCX1APPWupQ1jYg6d0P8bI0vdrK27UUoclwKe64r+sk1pzc/0TZvY3pPPjNSE/G
	JG/BQ0RpD9nERMSgfirU1twOPyn1EX7gHuBGUEVKwcpTLjhaGNyFSpvrjKDAbEco9r+cOEAikc6
	v9ahvcghYDAv8nigXANLMJNsgBfWMNr3+YMh0Ezl5h95aD+E4VgCm0BOOda4WBMZUABaU/NlIuK
	ajA3A4aU9RPxoaEe0tvwXU7qF/GvGBDNw/567U/4p5VdASvLZ0vkX9yBrZcKe0xkCZ2fjNxfbFr
	FDDx2bWFuByfzm9dAgyPE72MSE5vDVN8Oy3AvBldB92ZhE6mjY2GmKbVkGLRwOtlTFEbAfZVjUt
	37SGtg5GOrB3VK7Ui9MZ8Lug==
X-Google-Smtp-Source: AGHT+IGxpG3wdoyGRzUda50lVJ9dEs81xzmx2MSPTheUsnsO2z97NTnLnK0KywGe78tuaGCx6lqFEg==
X-Received: by 2002:a05:600c:8584:b0:455:f59e:fdab with SMTP id 5b1f17b1804b1-4562e03aa01mr13448785e9.5.1752696952034;
        Wed, 16 Jul 2025 13:15:52 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v10 1/9] tools/xl: Add altp2m_count parameter
Date: Wed, 16 Jul 2025 20:15:31 +0000
Message-Id: <c291e2e56c598df8c328e76f237699084b2dd593.1752691429.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752691429.git.w1benny@gmail.com>
References: <cover.1752691429.git.w1benny@gmail.com>
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


