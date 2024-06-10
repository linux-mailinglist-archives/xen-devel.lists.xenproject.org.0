Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D577B902783
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 19:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737471.1143825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGiXs-0001O1-0p; Mon, 10 Jun 2024 17:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737471.1143825; Mon, 10 Jun 2024 17:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGiXr-0001Iw-Mr; Mon, 10 Jun 2024 17:10:59 +0000
Received: by outflank-mailman (input) for mailman id 737471;
 Mon, 10 Jun 2024 17:10:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7qHj=NM=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sGiXp-0000kp-Mw
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 17:10:57 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66d2807f-274c-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 19:10:56 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57c778b5742so2017809a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 10:10:56 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c76740d6asm3233169a12.7.2024.06.10.10.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 10:10:55 -0700 (PDT)
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
X-Inumbo-ID: 66d2807f-274c-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718039456; x=1718644256; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xYGePkFSrt21Sw0npf4IiaMWXG46KCQA4sFct5gdmA=;
        b=YYxBq7yIPwtQ2UdFShtYnUZ3gFQdCrQ+Cd0g7fA9U3tt40XSi3iXA4qW+qMp8VskUV
         M0XjVveRd4dqY07nsfhYe4V9cIsOgr59XlSNTcmQxdnePQWg43CV46tUq2LR3H30ZXCP
         SZYo6yNB5wth4HZkAxXTenCRV45a+S4RQZi5e3uxPXs9uOqYOd340T4gwsMsM64abGhD
         5cybsSAumzG07CTw7S8AawQWgG71kVb3b1z7kdDBLyTi38tPmZs6LhPHjIMvmQmLY2te
         ugAnJJ+73kJY31e4fVoM5yLB/DcwbQYGq1LAA1d8nnon0tckL6TvYTC41kGtdh66RYbT
         eqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718039456; x=1718644256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xYGePkFSrt21Sw0npf4IiaMWXG46KCQA4sFct5gdmA=;
        b=h4w5MN+EmP3cdKioBYv4zJTlxk0NkD8JvQhflr91h/QTFQ4ESUDHtocuLDBBlvgvTu
         YsAGR6TZnNEhIzBOjYY9ZYgCn9A7qXD+gLgg40T56U2Z7y3vy+8tMoN6C83UuDTJ6gnV
         V7QQiQFmgtqidyQZpVHibSdYv2mRpbW/vXZ99Ae+C3cxmzmPzpR0BGVpx88KFFOYwgzT
         TlJZFOLGFq2OmaRoDpLPO1r4dHqzBRkAfmNBQ0aWCpGZt4nYcUYez1vrp36x8WvSN6QB
         UFdD+M3pK/YIr3KizKZo55ui8WeZIqdPVm1u40JBXmZN3/5lRBWZAkQ+0O8NTZgqyaYG
         WMXw==
X-Gm-Message-State: AOJu0YxiJyQTKGA5JZKd5XU14QiS5DD8hzCAwtatDIVcCURhknh5sNXg
	YRb9S1FGeT4+shT/a/PQVHYPCD/Vb2gecG2yEC/Jk8DDJQoMTlO9urN+Dg==
X-Google-Smtp-Source: AGHT+IEf2l7g+205A9TwswItjn+rA+qNovEvPuFHbnYVuAjlddDejE2Rj6EKRursxEsZ7BLg5k+8oQ==
X-Received: by 2002:a50:c047:0:b0:57c:47c3:dc62 with SMTP id 4fb4d7f45d1cf-57c50829346mr5850619a12.5.1718039455710;
        Mon, 10 Jun 2024 10:10:55 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.19? v6 4/9] tools/xl: Add altp2m_count parameter
Date: Mon, 10 Jun 2024 17:10:42 +0000
Message-Id: <02e0eefe1bed87cb55490f6ea13fa28c94af2a0d.1718038855.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718038855.git.w1benny@gmail.com>
References: <cover.1718038855.git.w1benny@gmail.com>
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
 tools/xl/xl_parse.c                  | 9 +++++++++
 6 files changed, 30 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index fe5110474d..0449c55f31 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1159,6 +1159,7 @@ if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
 x.Altp2M = Altp2MMode(xc.altp2m)
+x.Altp2MCount = uint32(xc.altp2m_count)
 x.VmtraceBufKb = int(xc.vmtrace_buf_kb)
 if err := x.Vpmu.fromC(&xc.vpmu);err != nil {
 return fmt.Errorf("converting field Vpmu: %v", err)
@@ -1676,6 +1677,7 @@ if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
 xc.altp2m = C.libxl_altp2m_mode(x.Altp2M)
+xc.altp2m_count = C.uint32_t(x.Altp2MCount)
 xc.vmtrace_buf_kb = C.int(x.VmtraceBufKb)
 if err := x.Vpmu.toC(&xc.vpmu); err != nil {
 return fmt.Errorf("converting field Vpmu: %v", err)
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index c9e45b306f..54607758d3 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -603,6 +603,7 @@ ArchX86 struct {
 MsrRelaxed Defbool
 }
 Altp2M Altp2MMode
+Altp2MCount uint32
 VmtraceBufKb int
 Vpmu Defbool
 }
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index f5c7167742..bfa06caad2 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1250,6 +1250,14 @@ typedef struct libxl__ctx libxl_ctx;
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
index 569e3d21ed..11d2f282f5 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -482,6 +482,15 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
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
index 4e65e6fda5..2963c5e250 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -729,6 +729,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     # Alternate p2m is not bound to any architecture or guest type, as it is
     # supported by x86 HVM and ARM support is planned.
     ("altp2m", libxl_altp2m_mode),
+    ("altp2m_count", uint32, {'init_val': 'LIBXL_ALTP2M_COUNT_DEFAULT'}),

     # Size of preallocated vmtrace trace buffers (in KBYTES).
     # Use zero value to disable this feature.
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index e3a4800f6e..a82b8fe6e4 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2063,6 +2063,15 @@ void parse_config_data(const char *config_source,
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


