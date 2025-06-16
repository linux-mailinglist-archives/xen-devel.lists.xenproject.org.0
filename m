Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 720FEADB5F2
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 17:53:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017432.1394415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRC92-00062W-2m; Mon, 16 Jun 2025 15:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017432.1394415; Mon, 16 Jun 2025 15:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRC92-000614-08; Mon, 16 Jun 2025 15:53:12 +0000
Received: by outflank-mailman (input) for mailman id 1017432;
 Mon, 16 Jun 2025 15:53:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m/Gb=Y7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uRC91-00060y-B4
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 15:53:11 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00adffa5-4aca-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 17:53:10 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-450cfb79177so28777845e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 08:53:10 -0700 (PDT)
Received: from gmail.com (140.red-213-97-47.staticip.rima-tde.net.
 [213.97.47.140]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b18f96sm11559372f8f.66.2025.06.16.08.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 08:53:08 -0700 (PDT)
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
X-Inumbo-ID: 00adffa5-4aca-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750089189; x=1750693989; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTTDVxBacMVhgiefAvTCo3jBlukvO39wp+PQztq5l5c=;
        b=Tgzi1FZPj7n+eBOobXJtL/ZQ88HAJ2A9cC3OYY6UB+/dOj6YpOBaqW1BRQdNN4vHyg
         1KSfdVSPYjW8Jpn6s022nC9wy5h+wXXwY6jo2vbA+4XRvOd2ARTWPTdupH8z0l1UloT5
         XPiPuxVZJsBZ38MVDYzIzNPOXiVP4xKt+MjDr53r5yHeFcerXXGMpdTjXhiBjb2pvDQZ
         CFXc6O9xvEbrFbeRo0cqFnuaNHymgfC9bCq3ldmupuL6tCNiICgtXNmpEiP24ZKElQww
         eikSTfSTyUPWrXKplMQEawno9H8JzR/laiayQi0oAKQHZRNFbAvfZY9hQr4ZIcVaHtuc
         eqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750089189; x=1750693989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTTDVxBacMVhgiefAvTCo3jBlukvO39wp+PQztq5l5c=;
        b=EhmvEL1h64uDIO4D53d4ZqSczYws8BzEc9SwXrW1IYrvagl/kN7bV32QMhXZ3kSqU6
         c36sQe/0RwWdXVzBVjEXYcnFXbta8bUCrZKika6Bn+VieNI0Qkt33yAVutgl/DLUjquf
         IKy6mjRgo8+jja2u9IzRIK8RUShxohR7W/RsBpSpUcIINubfFFQf50kG7i2qBLVlVzd1
         1Pjds9Dj/P+fWln8gYAUaAokelMFxI4vgGqLzSw0NZ7oNzRR00pHB677FLLhSZrnvRRr
         r9IQx2tYOWMa1lLyWYBvVg2SP+gCU2eIoXYqhbhooiQB2bWIVNBEn0ZyZPNZd467qFBS
         T7xA==
X-Gm-Message-State: AOJu0Yzqh3e7piwTiq3mHv1j2feIGv7Gu/WYdfH4lA+NzeoisES7Sofd
	eYQKlQ2xlLsJYTssuzNJfOiZfrR1iDA1zG9drE9Bx08/FloFEo2UXoUE3fbFig0APfI=
X-Gm-Gg: ASbGncte7C0W3S2DaJvryIMwPFDpqrz6klGMkT5Y3rcL1uL+KBL6C5bxb/xqZAOnOK3
	LCtPc1wD5zSXRFOGSGj5qveZeN8nZepYzlhHtEjs8D3SShualvlHrKN/ycpbRX28b8Mhp5n2Gtj
	o+ALYLCwqF3jx3bkRI6KmgCpkRqNam3Yvgsji4Xr2YjTMeunEuCKtTUhukvCyBuQxNiQq3nOza6
	ikmsbG5XXnab3tQAqOE1CBwldk8zUqbp8hawSc5omUy1C1+v647EBNM9sFhRt7iQGSt8Ly2WmO4
	AQ8i8y0+qdTvcyW8TyLPppi7gsrfnuXPjQYDrcBxvl5UN61r+emgirSuKDEpEx1Dmoz+y7alOUU
	FjzSidajjPiaqdO/b8bdRszyEar3e2QW5RsLDfXMqO9mEuuxK475EAQ==
X-Google-Smtp-Source: AGHT+IEz5F5xMW1sXDv3e6m8Wn+szYODBtW2rBwJBVBpWLBpMHya3TnaGhxYVqvOEcrfNj1OAknM2w==
X-Received: by 2002:a05:600c:3e8c:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-4533ca9cc5cmr108156355e9.15.1750089188813;
        Mon, 16 Jun 2025 08:53:08 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	rosbrookn@gmail.com,
	gwd@xenproject.org,
	edgar.iglesias@amd.com,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 3/5] tools/arm: Add the trap_unmapped_accesses xl config option
Date: Mon, 16 Jun 2025 17:53:04 +0200
Message-ID: <20250616155306.405257-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616153826.404927-1-edgar.iglesias@gmail.com>
References: <20250616153826.404927-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 docs/man/xl.cfg.5.pod.in         | 9 +++++++++
 tools/include/libxl.h            | 7 +++++++
 tools/libs/light/libxl_arm.c     | 6 +++---
 tools/libs/light/libxl_create.c  | 3 +++
 tools/libs/light/libxl_types.idl | 1 +
 tools/libs/light/libxl_x86.c     | 6 ++++++
 tools/xl/xl_parse.c              | 3 +++
 7 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index c388899306..075e89e6d2 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3056,6 +3056,15 @@ will be used for the domain. Otherwise, the value specified by the `nr_spis`
 parameter will be used. The number of SPIs should match the highest interrupt
 ID that will be assigned to the domain.
 
+=item B<trap_unmapped_accesses=BOOLEAN>
+
+An Optional boolean parameter that configures handling of accesses to unmapped
+address ranges. If enabled, guest accesses will trap. If disabled, guest
+accesses will read all bits as ones, e.g 0xFFFFFFFF for a 32bit access and
+writes will be ignored.
+
+This option is only implemented for Arm where the default is enabled.
+
 =back
 
 =head3 x86
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index b7ad7735ca..24c81cf145 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -549,6 +549,13 @@
  */
 #define LIBXL_HAVE_VPMU 1
 
+/*
+ * LIBXL_HAVE_TRAP_UNMAPPED_ACCESSES indicates that libxl_domain_build_info
+ * has a trap_unmapped_accesses parameter, which allows the control of how
+ * accesses to unmapped adresses behave.
+ */
+#define LIBXL_HAVE_TRAP_UNMAPPED_ACCESSES 1
+
 /*
  * LIBXL_HAVE_PHYSINFO_CAP_GNTTAB indicates that libxl_physinfo has a
  * cap_gnttab_v1/2 fields, which indicates the available grant table ABIs.
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 9530996e72..afc62a5299 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -233,9 +233,6 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
     }
 
-    /* Trap accesses to unmapped areas. */
-    config->flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
-
     return 0;
 }
 
@@ -1714,6 +1711,9 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
     /* ACPI is disabled by default */
     libxl_defbool_setdefault(&b_info->acpi, false);
 
+    /* Trapping of unmapped accesses enabled by default.  */
+    libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, true);
+
     /* Sanitise SVE parameter */
     if (b_info->arch_arm.sve_vl) {
         unsigned int max_sve_vl =
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 8bc768b515..625ce5b040 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -605,6 +605,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
         if (libxl_defbool_val(b_info->vpmu))
             create.flags |= XEN_DOMCTL_CDF_vpmu;
 
+        if (libxl_defbool_val(b_info->trap_unmapped_accesses))
+            create.flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
+
         assert(info->passthrough != LIBXL_PASSTHROUGH_DEFAULT);
         LOG(DETAIL, "passthrough: %s",
             libxl_passthrough_to_string(info->passthrough));
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 1985153830..57ae16ae78 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -736,6 +736,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("vmtrace_buf_kb", integer),
 
     ("vpmu", libxl_defbool),
+    ("trap_unmapped_accesses", libxl_defbool),
 
     ], dir=DIR_IN,
        copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 867addfcab..60d4e8661c 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -26,6 +26,11 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
         config->arch.misc_flags |= XEN_X86_MSR_RELAXED;
 
+    if (libxl_defbool_val(d_config->b_info.trap_unmapped_accesses)) {
+            LOG(ERROR, "trap_unmapped_accesses is not supported on x86\n");
+            return ERROR_FAIL;
+    }
+
     return 0;
 }
 
@@ -813,6 +818,7 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
 {
     libxl_defbool_setdefault(&b_info->acpi, true);
     libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
+    libxl_defbool_setdefault(&b_info->trap_unmapped_accesses, false);
 
     if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
         /*
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 219e924779..98b3612d0f 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2972,6 +2972,9 @@ skip_usbdev:
     if (!xlu_cfg_get_long (config, "nr_spis", &l, 0))
         b_info->arch_arm.nr_spis = l;
 
+    xlu_cfg_get_defbool(config, "trap_unmapped_accesses",
+                        &b_info->trap_unmapped_accesses, 0);
+
     parse_vkb_list(config, d_config);
 
     d_config->virtios = NULL;
-- 
2.43.0


