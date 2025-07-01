Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AB9AF042C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 21:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029944.1403666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWh3z-0000Ve-Fx; Tue, 01 Jul 2025 19:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029944.1403666; Tue, 01 Jul 2025 19:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWh3z-0000SI-9t; Tue, 01 Jul 2025 19:54:43 +0000
Received: by outflank-mailman (input) for mailman id 1029944;
 Tue, 01 Jul 2025 19:54:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u5am=ZO=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uWh3x-0000D0-TE
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 19:54:41 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3958c4d4-56b5-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 21:54:40 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a4eed70f24so821012f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 12:54:40 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e9d1csm14291644f8f.13.2025.07.01.12.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 12:54:38 -0700 (PDT)
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
X-Inumbo-ID: 3958c4d4-56b5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751399679; x=1752004479; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCdCFUU01yaVxgQDnPyQnDx1XPvODNjjRXJBKjo5xuA=;
        b=Txw33WL1Il2ssqtj0mX/lGxwnnThK6h2dCal0vg0B7C7gFjocxTH9JhdsBsqb4hB0O
         P+Ib7fGAVAy/AddmYmZesPQu4dgKl7Ejo+AMwwlfPMLKkcHnTDZJiF8W+ZRrgM010awC
         XtSuFC79ZGcbGYHK8cTty1/jjCGkAZVcsIkdyp43LGAlsgPAmpN+PQHfpvSBwxpi+FPM
         jO4qRHrDo+amVEWp4reO1OzlPq8f+mVHTZ6gwlz28GpZqrv7uvngkv456T+W2JvyydQg
         fXhceC5S8/r9+x0uZnnsENip36IgxRTYyJw1aCj0wavjD/XGcD9idzcHpPosQuk/egLe
         GHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751399679; x=1752004479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCdCFUU01yaVxgQDnPyQnDx1XPvODNjjRXJBKjo5xuA=;
        b=BQZiANnWSp6y1Psfd9Ih7QlNqbscJPmEBuCFU0C7tNwZDc4MoSdtmFJfY3cphHcHyv
         MMn1QXyxLa2LuAhzTUWoMTv13SN42+rFYOwHlnuhKZS4+2g2uvZH05LUq7xcwwHXFBAZ
         EdEM1Rsx0tLmOrTeRJ2B3KToHWNS7Btj8OFcERAcbYstEJ7TbZarggvzhmgdSJ2K2Fnb
         h8/v4L5+gvI4854JisCTZ5jDzdc8JmWsvFwKlBtQnQbuqU5SdoImt4OhIud17Iqq+/kj
         Dj7SCdLnmA3QW2iUXpJqsWpKFvspCfr+5rssh5grSc/U6AUlaFRoxn7n0a3HZLGe5MW7
         jc3g==
X-Gm-Message-State: AOJu0YxBS6tqu0dxftnRnxeSBBvmJlIruuZJQQK5drn5GNyHmh06XlBx
	SLFuyAa5N2YpR8OH91uHghvPezXyAAtQnHiT7orBzkgyxsdQfcsaNcqz2wmXCg==
X-Gm-Gg: ASbGnctmch2h4Scv0yhevUMteEh5X60PhfbIJuXPnTky1XBeRIFmqJflVG4iN4+onSf
	Qk/aHsVHYF1Nm48TRG4pNYAKPpFnFFF5TmQQ6pM8xiclcD1RdeUXtgmlsd202r/bNiqX0QrM2DY
	BJbc0EQldXCEmSFn92mGWaRLU0yKOezl8ldNLz92xx+USguMUthTJ1MhDlYU+J8GC62c46UiPuz
	sUwv/N5HjFACWJ+4qY+CFHtLeeArOe9MJvYtPYxJMraJTrWay4rUjNUoTAcjIv3aTlOEY6fa8PC
	Hxj2Nu69v5XyvJAoODIpk3LSfvX1xxbp5EL8WcmmN0khsu4TyDVaJZM6XO/v6YJoTCiqJVmKsLU
	siruhxLl14yE+WL0CRXcZ/ciuFDFX7xm9sYoZGjgu3WomAUglHPbNRozTZ67+wwlFHfvLGgBI
X-Google-Smtp-Source: AGHT+IGqy9WvmFoV4PCqeXPzzqJMJQX/mH9EUd2EwPVh3v1Bx49gZZ64DKvi6qWmziv3UlU1jzFqTw==
X-Received: by 2002:a05:6000:2082:b0:3a5:3369:391c with SMTP id ffacd0b85a97d-3af23ad0719mr1593821f8f.1.1751399678973;
        Tue, 01 Jul 2025 12:54:38 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 2/7] tools/xl: Add altp2m_count parameter
Date: Tue,  1 Jul 2025 19:54:24 +0000
Message-Id: <090b27895506d78055d1bab9c2b3617e85f389c6.1751397919.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1751397919.git.w1benny@gmail.com>
References: <cover.1751397919.git.w1benny@gmail.com>
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
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
 tools/golang/xenlight/helpers.gen.go | 2 ++
 tools/golang/xenlight/types.gen.go   | 1 +
 tools/include/libxl.h                | 7 +++++++
 tools/libs/light/libxl_create.c      | 9 +++++++++
 tools/libs/light/libxl_internal.h    | 1 +
 tools/libs/light/libxl_types.idl     | 1 +
 tools/xl/xl_parse.c                  | 9 +++++++++
 7 files changed, 30 insertions(+)

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
index 8a85fba1cf..acf7fd9837 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -421,6 +421,15 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
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


