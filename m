Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5938B14CF
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 22:42:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711653.1111805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzjRc-00052m-Pg; Wed, 24 Apr 2024 20:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711653.1111805; Wed, 24 Apr 2024 20:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzjRc-00050p-M3; Wed, 24 Apr 2024 20:42:20 +0000
Received: by outflank-mailman (input) for mailman id 711653;
 Wed, 24 Apr 2024 20:42:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q5fc=L5=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rzjRb-0004VD-3q
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 20:42:19 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 243981a5-027b-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 22:42:18 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-56e1baf0380so263663a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 13:42:18 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 cd9-20020a170906b34900b00a5264576138sm8740067ejb.35.2024.04.24.13.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 13:42:17 -0700 (PDT)
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
X-Inumbo-ID: 243981a5-027b-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713991338; x=1714596138; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAfYjJvPkpeUwPoknaRyn26fL3ELoKrAImMs8sUBNG8=;
        b=SOsPle97auYOjpzF2f51OdRJHUdYEudkOWf40mLxrmeBPlbqoTwO9wMocM9skXR4+s
         vgy3Xikp0LecJQmdssHUeyEaMjqWUe9VghU6OGoWB99cAF23xDxlF9f5qXE8ubEC8mvn
         i9Si9gesouI8rVBhO+4fTxgTfB30t/5hA0BsEZQmNhK8WgOR9yEJp9MBRdnqxD/EmXxz
         3d6/5lvAYbUxT/86pcc4RCF0POHpKiw1IpzYYIUFbNulZFiZIJmtEZl7Il5LggunTFbe
         pPDSvk1IJE5j8zsEPvn3O9Y76Cq+cxdKLEBQu0hVUkFcwF5odokLD2PnMRdjzGP9C7s8
         6ZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713991338; x=1714596138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAfYjJvPkpeUwPoknaRyn26fL3ELoKrAImMs8sUBNG8=;
        b=al8qx01C6QSWCJXjykHkY3ScD/WPmROcAIpd2cmcYSD2imsIlGfrbpqYGBq10kvPqI
         0Jd50+AK1TqhRLuKf30iJbpxIutybSUIqYMEk4ICBC1aGrwCPTZ76l+yHc9eMMoGINYZ
         RRiDO8Ucq9GLIfkYVFcAy1Nv1ZmAngee0qSFjZL1yaPSgWt5avEVSCk16IOAGtkThysC
         bEwTaIzhOtcePVxRufe9EeKIkT1iXFLBQxDoxReN0AlOLNnNd4wu/wkuQopJm2ZBeWU4
         AtU1ZGkoHmuv65KCCwQydMFPpq9sgWcKWrKA1dqgK+RHyo4z0GBiBl+AEWaW1bqA6b7t
         6ZNw==
X-Gm-Message-State: AOJu0YzwQ3b/hdqXoIUjuxcEB9OQDA348DVOnn6LPd4SFsH8Su0krGON
	IctiRuLkz1GwizDiCLns4edvBl23eYZTKcR9UYUgB/6LU0uP2fiXUk4MymZ3
X-Google-Smtp-Source: AGHT+IHFIqilA6ppmChvKbdGy65AZ1DtFc0sTUjMQj2t5Za1Zus3DuheSe6yl/lh8MmS4Ib8mN4lBw==
X-Received: by 2002:a17:906:7d2:b0:a55:adec:7139 with SMTP id m18-20020a17090607d200b00a55adec7139mr2282736ejc.60.1713991337459;
        Wed, 24 Apr 2024 13:42:17 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 3/7] tools/xl: Add max_altp2m parameter
Date: Wed, 24 Apr 2024 20:42:01 +0000
Message-Id: <67b5dd52435132d0fb65e7b301970e17e092fa87.1713990376.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713990376.git.w1benny@gmail.com>
References: <cover.1713990376.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Introduce a new max_altp2m parameter to control the maximum number of altp2m
views a domain can use. By default, if max_altp2m is unspecified and altp2m is
enabled, the value is set to 10, reflecting the legacy behavior.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 tools/golang/xenlight/helpers.gen.go | 2 ++
 tools/golang/xenlight/types.gen.go   | 1 +
 tools/include/libxl.h                | 8 ++++++++
 tools/libs/light/libxl_create.c      | 9 +++++++++
 tools/libs/light/libxl_types.idl     | 1 +
 tools/xl/xl_parse.c                  | 4 ++++
 xen/include/public/domctl.h          | 1 +
 7 files changed, 26 insertions(+)

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
index 41252ec553..6ccc1fa158 100644
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
@@ -645,6 +653,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .ssidref = info->ssidref,
             .max_vcpus = b_info->max_vcpus,
             .max_evtchn_port = b_info->event_channels,
+            .max_altp2m = b_info->max_altp2m,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
             .grant_opts = XEN_DOMCTL_GRANT_version(b_info->max_grant_version),
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
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a33f9ec32b..7a34465c21 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -77,6 +77,7 @@ struct xen_domctl_createdomain {
      */
     uint32_t max_vcpus;
     uint32_t max_evtchn_port;
+    uint32_t max_altp2m;
     int32_t max_grant_frames;
     int32_t max_maptrack_frames;
 
-- 
2.34.1


