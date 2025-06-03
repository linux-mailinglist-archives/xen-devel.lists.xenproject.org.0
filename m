Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4E1ACC997
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 16:50:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004560.1384311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSxj-0006lJ-22; Tue, 03 Jun 2025 14:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004560.1384311; Tue, 03 Jun 2025 14:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSxi-0006iC-Uw; Tue, 03 Jun 2025 14:49:58 +0000
Received: by outflank-mailman (input) for mailman id 1004560;
 Tue, 03 Jun 2025 14:49:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WdC=YS=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uMSxh-00060n-Cb
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 14:49:57 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 040d5322-408a-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 16:49:56 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-32a81344ae9so61753821fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 07:49:56 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a85bd20e2sm19958911fa.88.2025.06.03.07.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 07:49:53 -0700 (PDT)
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
X-Inumbo-ID: 040d5322-408a-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748962196; x=1749566996; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/P4JJfVyXfBWOJOwxQ63tEugbkZDcheuT5ZnHfj61Q=;
        b=GRdlHQp+vD3UkJtI5GxssD1hknwr864YmpWaRw+pVvusbtHctFacK0FyRVt0ipM0ak
         odUfICi2KlbZzNR/2gDxzBY7a3CP60ZcS+zdZBd2j6K8ds11puZ/FrllsAl3c7fe3XQZ
         0gv2zbMO56Jt4ot9wk882PRXLkHX6/ebTqr6QsXUr2o9H18QNok8y3D/7TZuCJfwVBPv
         qCdH+yyjkDK5rWj+z/XbYv5fRyykFSLN3C7Nh6rTuQtsLkZsDIBFctrdUXXw4soXHFii
         O7h7h+iHx1b/3zYwJhE2R7OmUHkEk8Ie5tNi6heydTtOPsdSeJ4AYyXjcfKVZHS7XPFx
         sl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748962196; x=1749566996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/P4JJfVyXfBWOJOwxQ63tEugbkZDcheuT5ZnHfj61Q=;
        b=aw4i0+75jr03zOVuyl6JivOXgG7ZKQR0MNCGkkZNsFgIyRU8lWZGY8S71H9FfHATqb
         x/uvrjix9CXMQFQT+Gzfqqwog4mub6/BnHL9+/SoMd7vZUVIpEG/LhblHq8/XQEaqqHY
         +20nv86I/4yuY9RcrBBywDzE5nFQEL0LUkU6X320znqSRiwoMI6QErwM0C5RNiaTUNqP
         q6QroJtOSJXgOy3WlawNr+3cwCh4snbpi15Md36JtO6bQPiQtoaDd/GruN0Y7DPmpQuz
         /POuFxHMvKa6N2f9tprZVg8sBGtzcU5t+jOhYue7uVpNf3fbW4XWTI9KT1eBXq1i/lKN
         xlOw==
X-Gm-Message-State: AOJu0YxzojiqtcEX4kIgJVr+9LNr3nhnCGnVLziRb25dVdxvez7vHPPM
	vaWZWH5b1L4CbXXfwCCjhfuQO+LV9aqv6xwS19lL6bwzYaDUXwT/6fixasrTrCRTPnI=
X-Gm-Gg: ASbGncvUANldHzSl9njM0J0Rg8MAayRBOZv1aa3j2b8wuK/VL+FrVPW0cAyhaX+T1Uu
	GfTPxoy1TcWtafKGbvuSLRIbVhTpxSdNG2UgF/RGc9OMNOD2FK4hdXhGGta/nLzxcqA/kVpmdfE
	4/8vQn0sfSfh37B3OFEQ0ramI0lmUSZrQMkRG4xd5oQWaCKBrGmnf4M0LwP5w4lV7q6Fb2A86d7
	l1oc6HxICrkXwJj4OfE6RKe2fsH2FnSUZ9KlEh9GoCILlaImczTaysS+FOV2hnScYdxReuT+Z25
	9lLB+25gSfVOzY3PK0wuYhaMi94GHvfbIO/9ZBg15Hsx2B4MQRVr8lJF773tv4QI/Us/sop5KUy
	XgHzhiKXR0+t41vcyc9qJgMA=
X-Google-Smtp-Source: AGHT+IG8r/MCEHNzSQ5BGqRl+m2UokCyQfxstG/mthNpbTEWTCy0p07qQ5CFnX8ov8CFEYVmvgmH/A==
X-Received: by 2002:a05:651c:30c6:b0:32a:681f:696e with SMTP id 38308e7fff4ca-32a8ce5d659mr52521281fa.37.1748962195426;
        Tue, 03 Jun 2025 07:49:55 -0700 (PDT)
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
Subject: [PATCH v4 3/5] tools/arm: Add the trap_unmapped_accesses xl config option
Date: Tue,  3 Jun 2025 16:49:46 +0200
Message-ID: <20250603144948.1685047-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250603144948.1685047-1-edgar.iglesias@gmail.com>
References: <20250603144948.1685047-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
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


