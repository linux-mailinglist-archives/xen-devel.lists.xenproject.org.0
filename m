Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C414AC8082
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 17:50:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000012.1380471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKfWe-0007ZM-7I; Thu, 29 May 2025 15:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000012.1380471; Thu, 29 May 2025 15:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKfWe-0007Wm-2C; Thu, 29 May 2025 15:50:36 +0000
Received: by outflank-mailman (input) for mailman id 1000012;
 Thu, 29 May 2025 15:50:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vnej=YN=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uKfWc-0007Vh-Vn
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 15:50:34 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a769275d-3ca4-11f0-b894-0df219b8e170;
 Thu, 29 May 2025 17:50:33 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5532e0ad84aso1333445e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 May 2025 08:50:33 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533791ca53sm359962e87.162.2025.05.29.08.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 08:50:30 -0700 (PDT)
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
X-Inumbo-ID: a769275d-3ca4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748533832; x=1749138632; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqOCJb7GRiVBBvisLzyRysHis/O4eLeaHxcKgZ0AZIA=;
        b=ko59lp1pcADCPjyIonyrKJ00bHjveyoXr/Sqr1y1XfXkLq9EBudYMP1StzXa12EYc5
         Of+4BJc2ERzsgtFNZYpEZyAw3xqQP9aivvLMUMVg05u72Za1EAZW5bWkcXYJjLM0h0pp
         gvcRRveo9rrQPsgrzrXUJDHsn0oJKlAcNGpluPY3WbTWVw1b3j+dpuI8A1Nw9yMn2Bto
         0ytiC4rIzzNclMOpuozw7OSChGgTtNpOvGODwfAZcGeu8gCHg9w9MVab8SLH1Cb4LoTz
         rVT6qM3XYeEge1Dvtd5NADx4ZfTd8PcBRG0GlZpYXxRnJaBnp9I/WvTBNvmlHE8bp58E
         AM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748533832; x=1749138632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqOCJb7GRiVBBvisLzyRysHis/O4eLeaHxcKgZ0AZIA=;
        b=ZClrXo3uedd71c1RAkTBj1C8rbB39DjWGMyyVLjn//R/c+mCEHm78YujDBef3GwyIt
         VzXvNBL3swwivVhkspqLeVd+jJl8PRllsG2doB5PJA2vpmHxQkyVFXWKSi5r/LZZ1veI
         GpNPxCwCENHG2wXwOBcbjM4Yl/NlBKwXfBDZJtgirtGhnqqRBAfWFIGuR7bPPnMfrB2y
         6gNCmFSTCZlKbjsgwrshKZUEF+ioBliTpiHeXXms/7FFt+S1U7+6t61aXTF27H7q+hZs
         PYZ0j3JwolYDUMAUM55inrjfVfIU0qfJ2hcb13Muv/MDf9lrFwRYqp9SsLGz2UWic6R3
         jb0A==
X-Gm-Message-State: AOJu0YzTOM+74bpKaJtjS5tSQ/7tJdixrP8fjQt93YW8Yxe61vLsH1Kr
	UfGG9K03sQ4pZfL7xcAdQj3ZMXmABt++5AHF/jC9zcWM2RePQhEUh0+DVkx+NfvERzU=
X-Gm-Gg: ASbGnctlWnOlYD+QK4LQG1d+M/4UcG5Rkz6D9pjev3bgqVhLmbwDjvkN5F3wEX68AWo
	WzhjvUm2RHskmIb3sKGM0qgVx+XC1LWQkuhtt1XgBxxgzIZ1RfW/NdXcjTwrAd0+n1BOGOwl4oh
	xfv9G8LuFH6UwJXDbQwXxyfRasK2Mj/bGIqNE8Zd7y8MBNFYDrCpF0eUooZP1k41CypevzZsKZo
	oi66NjixOnqKgfcSklvsuKmhhL8hT66WsVaS9mLMKp8zzB7T9/QWg2SbwAAyQD+S/WjZGoEX4OH
	X0MZJQOsIOSsyHXvTUTasPQB20o3ljPKMRgWp5C0zY906ghS0MXsj2Ji8xmtBJf8b4TSqnR3xSW
	uKK/4OazD78UeWjIY/6G8mWc=
X-Google-Smtp-Source: AGHT+IGPSue7MKunY2H9Ufyk2OZJ0tuTN/kpP94dQEQDIdlzvOjh5NgxGK1YbNNMufi/pOt/OJ3gWw==
X-Received: by 2002:a05:6512:3193:b0:553:388a:e794 with SMTP id 2adb3069b0e04-553388ae8f6mr1069086e87.17.1748533831821;
        Thu, 29 May 2025 08:50:31 -0700 (PDT)
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
Subject: [PATCH v2 3/3] tools/arm: Add the trap_unmapped_accesses xl config option
Date: Thu, 29 May 2025 17:50:23 +0200
Message-ID: <20250529155024.1284227-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529155024.1284227-1-edgar.iglesias@gmail.com>
References: <20250529155024.1284227-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 docs/man/xl.cfg.5.pod.in         | 8 ++++++++
 tools/libs/light/libxl_arm.c     | 6 +++---
 tools/libs/light/libxl_create.c  | 3 +++
 tools/libs/light/libxl_types.idl | 1 +
 tools/libs/light/libxl_x86.c     | 6 ++++++
 tools/xl/xl_parse.c              | 3 +++
 6 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 7339c44efd..55e9cb5bd9 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3089,6 +3089,14 @@ will be used for the domain. Otherwise, the value specified by the `nr_spis`
 parameter will be used. The number of SPIs should match the highest interrupt
 ID that will be assigned to the domain.
 
+=item B<trap_unmapped_accesses=BOOLEAN>
+
+An Optional boolean parameter that configures handling of accesses to unmapped
+address ranges. If enabled, guest accesses will trap. If disabled, guest
+accesses will read 0xFFFFFFFF and writes will be ignored.
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


