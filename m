Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109A1AC9081
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001146.1381378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL05N-0004SW-H3; Fri, 30 May 2025 13:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001146.1381378; Fri, 30 May 2025 13:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL05N-0004QH-Cl; Fri, 30 May 2025 13:47:49 +0000
Received: by outflank-mailman (input) for mailman id 1001146;
 Fri, 30 May 2025 13:47:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+LO9=YO=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uL05L-0003C4-HJ
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:47:47 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aabb3907-3d5c-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 15:47:46 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-54b10594812so2572224e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 06:47:46 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533787d3e9sm711456e87.21.2025.05.30.06.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 06:47:43 -0700 (PDT)
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
X-Inumbo-ID: aabb3907-3d5c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748612865; x=1749217665; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTWMILHL3EAwB0ODltLM9oaziA5R/C4tb16Ifl8XTJg=;
        b=ndJt+wZJfHvN9He7xFzs6ntu9t206LWGn8NdbM8a1TG+avL5slVHNxdWsBEYLcToFW
         V9ugXKKjouWYDIrte4CevkQj+QpDRa4mNQZeV3SL6GzUv59KUDChn7oQY2ECKM8QmEmF
         IFWYLlIahOaj4Mw3aSYmbN/Dke91VR9GGjl37LMpEoZWbrFWJYcp2MV17VW2wva/+UXZ
         3Axy/a8Y3UactNm3Z/i+V15tyl8mYychF7IxXQVNofjF8gpo6Kh8ibXtDntz6Ij11din
         AENhwigQ+/qSEy+9v78V6aGzaBS1ET9yXecffgmzShMJtu9HwXTteITKZzI5eRIhwbPn
         U/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748612865; x=1749217665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTWMILHL3EAwB0ODltLM9oaziA5R/C4tb16Ifl8XTJg=;
        b=DXWz4ao4EglxGGAhZQXhMQdPE3u6J6jQGjpJbiiUQ7DpHvdNkL22Xci2Ibp+TgpH6v
         5PDP1x/wQ2U+F6x64iMa7Tv/thklT6+j4W8YIsNc1+kfZ6dkSX++X5n3t+lPIwWUGlXe
         +9SF/9XzfmQWnyU2eF1zcp3F4bLMBJdmgORrOoWD3diSwFtgo3uQKQr2zWMNAxAwsolJ
         5eGof+RxvhSxPsanaP9r4sbWym6bxysS7muf94sUp5qth2RedY89EAwvW2bDAzJa6qlC
         LmnbY5Kxyj/NFdadMJGgIB070LyYzXaFVbNxDMdxYwnTHLGlQs5sgJQWxPSEphSfl1Ea
         D4Eg==
X-Gm-Message-State: AOJu0YxAU5dQgHfx2+882aNJ5UOY1ZHAHCh1L0x/xcsmwNlxeG7YsgXK
	NTTi2eggSY8hD4nloaDFM7rrCCdRvt//8a991KYjU0x1IExktymx2Vv+Zs/AdhaZlfE=
X-Gm-Gg: ASbGncszTb3eb23dhnl8T4066bheeXk4PU/ag3mmbdZywVH3MbL+u2SGYVmmP0oahFA
	fico06yXY+q+PaeEAabtS3/I551w6QqnvsTbh6mISw6ON3VSNQ/q0F7HB6Sn+nIHX2MWvkzU7Jz
	GjZMuJCytLlrPv4VlcPPskqu34uEzrhNN7t3qdIm/65plG3R82aeBs7a2EBkebpB9CS3Tk0loT6
	brstYfr5cAuucJFva8vHVYPu067vqcj8xSuqB6EF2qvzcu7GiAfUXix3dsXEUMEukRlraAbaT9s
	N+RisbfLkLhkLRcmVFMaoXqa9KLKCh/qxPAfXd4OxhY5QGvJXkmx19NK/xhEua6g/fIaFZAWXUP
	jn9onHqoFaf1ES1qTwsMXtUw=
X-Google-Smtp-Source: AGHT+IEZmxUSOBDe6/urRoNjrpd4T09riYBv/prcyno4acPjUc1Uc1flr/Q4ypXAzcpkfPnwwEjGVg==
X-Received: by 2002:a05:6512:e97:b0:553:2b9a:3c52 with SMTP id 2adb3069b0e04-5533b8f5bfcmr1214602e87.20.1748612864767;
        Fri, 30 May 2025 06:47:44 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 3/5] tools/arm: Add the trap_unmapped_accesses xl config option
Date: Fri, 30 May 2025 15:45:57 +0200
Message-ID: <20250530134559.1434255-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
References: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 docs/man/xl.cfg.5.pod.in         | 9 +++++++++
 tools/libs/light/libxl_arm.c     | 6 +++---
 tools/libs/light/libxl_create.c  | 3 +++
 tools/libs/light/libxl_types.idl | 1 +
 tools/libs/light/libxl_x86.c     | 6 ++++++
 tools/xl/xl_parse.c              | 3 +++
 6 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 7339c44efd..6c303e8efa 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3089,6 +3089,15 @@ will be used for the domain. Otherwise, the value specified by the `nr_spis`
 parameter will be used. The number of SPIs should match the highest interrupt
 ID that will be assigned to the domain.
 
+=item B<trap_unmapped_accesses=BOOLEAN>
+
+An Optional boolean parameter that configures handling of accesses to unmapped
+address ranges. If enabled, guest accesses will trap. If disabled, guest
+accesses will read all bits as ones, e.g 0xFFFFFFFF for a 32bit access and
+writes will be ignored.
+
+This option is only implemented for ARM where the default is enabled.
+
 =back
 
 =head3 x86
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
index e03599ea99..38770eea5b 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -667,6 +667,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
         if (libxl_defbool_val(b_info->vpmu))
             create.flags |= XEN_DOMCTL_CDF_vpmu;
 
+        if (libxl_defbool_val(b_info->trap_unmapped_accesses))
+            create.flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
+
         assert(info->passthrough != LIBXL_PASSTHROUGH_DEFAULT);
         LOG(DETAIL, "passthrough: %s",
             libxl_passthrough_to_string(info->passthrough));
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 9bb2969931..e33785c661 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -736,6 +736,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("vmtrace_buf_kb", integer),
 
     ("vpmu", libxl_defbool),
+    ("trap_unmapped_accesses", libxl_defbool),
 
     ], dir=DIR_IN,
        copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 0b1c2d3a96..a9d470c9f6 100644
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
 
     /*
      * The config parameter "altp2m" replaces the parameter "altp2mhvm".
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 089a88935a..40da75ef74 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2975,6 +2975,9 @@ skip_usbdev:
     if (!xlu_cfg_get_long (config, "nr_spis", &l, 0))
         b_info->arch_arm.nr_spis = l;
 
+    xlu_cfg_get_defbool(config, "trap_unmapped_accesses",
+                        &b_info->trap_unmapped_accesses, 0);
+
     parse_vkb_list(config, d_config);
 
     d_config->virtios = NULL;
-- 
2.43.0


