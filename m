Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7F5AC5B0B
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 21:56:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998704.1379455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK0PV-0007SH-IX; Tue, 27 May 2025 19:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998704.1379455; Tue, 27 May 2025 19:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK0PV-0007PN-ED; Tue, 27 May 2025 19:56:29 +0000
Received: by outflank-mailman (input) for mailman id 998704;
 Tue, 27 May 2025 19:56:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U5mK=YL=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uK0PT-0007N3-No
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 19:56:27 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abe1bb51-3b34-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 21:56:25 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-32a63ff3bdfso16209101fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 12:56:25 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a7610ce19sm589641fa.14.2025.05.27.12.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 12:56:23 -0700 (PDT)
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
X-Inumbo-ID: abe1bb51-3b34-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748375785; x=1748980585; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uoMcemAbIQbPzslSOx3EYsiOCGjdfZV67/ilufqHkE=;
        b=fhbn8DtQNQqbnqIFfw/CYkBzAXcw557zAWEMDYHQbHO1L2ZDuQfBTuX6xUIOdQr6eg
         jpymoWSNBfl5xMUtf9PFDz8QBvCGe+sML20CIHDhNpBz8YJOJIykQ5XEYDTbPWxW+P79
         FPPTTvjAVjyy8D2JNFhp8EcGfi/u9zrFOBrElSM4dRFn3N3xYqXdVWqfQ4q/qDPRGBFK
         +QStzAh7/ZNMQsEL4oYEBiBg59J/KaS9BCEYQ9/p6+Kivu/dg1X3DPYc9TMwU5MFPAAN
         bT49CcRLFM4jp2l2O2c42E1Gl2jsXMOu3/Y2VDi9fE18lgqKWMpAgNqdthKsDGR7VBWJ
         1QKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748375785; x=1748980585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uoMcemAbIQbPzslSOx3EYsiOCGjdfZV67/ilufqHkE=;
        b=Iw6d7HrjNglTSwINbPYhd3184mMKzAUUS63EGTbp/Ib28NAXl/GIgu6uej4rxr2wDI
         VzM/QSlMAX3HGh6qQsYNam0zlDj6Mizq4R5HYPZIPAItTtzJp/T4JH9oaHP17pqAS1iu
         aTmvmW1BcWY58rB1als2tQYjsdcLcOPPC25DVRrOxocRb1nlk6+x1TLJHSRRiMFtEcuQ
         uQL0487KoDoLYBF34uYXwROo9zhM0roggzuC/Og7klWqVJA/gEYGZtFs/WJljpH0xwVk
         aD4JNLEWQhbDAtR1LlvcWD0WWNbaD48DR1foxRRlPtPy7Fo9X06z94r+XL3XRcB8lagB
         tYVw==
X-Gm-Message-State: AOJu0YwRcE1iIdtGW7t+SNzgWyl37Tg3DCuh/QxrynzUvXUfcXDUTp2w
	1YOK9I1O19pQYpkZX6jBU7ucREZF7bm49p57mTtEvxzLsIBkZOGUzrwN7E8aBxTk+PQ=
X-Gm-Gg: ASbGncuO6ztNGmbpwvh/WSNSf0K2C5b3ufSm7Uxe2o8Aexvvsw7dbgheahTUvarbI6k
	MdD1e2HLTKuckNEVVx+qoXimlqLHBLwrCsWO6VUwXEJgUhj9a74D1+ULmAoRElP2X/k/+m8vY2y
	lW6J9ZgGj/6FhKtwG1zE1pOsZK0Fk1Ql5bPNGkIOegShUVvOpoI7u9ohIlp/OdsYVVt09sckZQF
	7IpUi5kV1ujMbSVcXLNUQBHil118Ts30xuVP4uI4afwFfRzTfE0tFDZykvlNcRwF0cGWGphXtn8
	KBs/z9IG2Y4EdHHY074qV9iXHZFgKwN0dSstPFs5n8eUsEGm0W4Go+j/X57ipj/V0US+AKmpzmo
	1wmVgsHzetKEJR4n1yVIKKvA=
X-Google-Smtp-Source: AGHT+IGGrSO3iFT/tQMaWnySP3c4+esSsUmT69PdcEitGWv/Yax8lntWxvFNYDU5c6s2y14seZ1z0Q==
X-Received: by 2002:a2e:9fc5:0:b0:32a:724e:ab8d with SMTP id 38308e7fff4ca-32a724eaef1mr9103641fa.40.1748375784578;
        Tue, 27 May 2025 12:56:24 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	edgar.iglesias@amd.com,
	Anthony PERARD <anthony.perard@vates.tech>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	George Dunlap <gwd@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v1 3/3] tools/arm: Add the trap_unmapped_mmio xl config option
Date: Tue, 27 May 2025 21:56:16 +0200
Message-ID: <20250527195616.874614-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527195616.874614-1-edgar.iglesias@gmail.com>
References: <20250527195616.874614-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 docs/man/xl.cfg.5.pod.in             | 6 ++++++
 tools/golang/xenlight/helpers.gen.go | 3 ++-
 tools/golang/xenlight/types.gen.go   | 1 +
 tools/libs/light/libxl_arm.c         | 8 ++++++--
 tools/libs/light/libxl_types.idl     | 1 +
 tools/xl/xl_parse.c                  | 3 +++
 6 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 7339c44efd..6dd0a05482 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3089,6 +3089,12 @@ will be used for the domain. Otherwise, the value specified by the `nr_spis`
 parameter will be used. The number of SPIs should match the highest interrupt
 ID that will be assigned to the domain.
 
+=item B<trap_unmapped_mmio=BOOLEAN>
+
+An Optional boolean parameter that configures handling of accesses to unmapped
+MMIO ranges. If enabled, guest accesses will trap. If disabled, guest accesses
+will read 0xFFFFFFFF and writes ignored.
+
 =back
 
 =head3 x86
diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 90846ea8e8..b04561929c 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1163,6 +1163,7 @@ x.ArchArm.GicVersion = GicVersion(xc.arch_arm.gic_version)
 x.ArchArm.Vuart = VuartType(xc.arch_arm.vuart)
 x.ArchArm.SveVl = SveType(xc.arch_arm.sve_vl)
 x.ArchArm.NrSpis = uint32(xc.arch_arm.nr_spis)
+x.ArchArm.TrapUnmappedMmio = uint32(xc.arch_arm.trap_unmapped_mmio)
 if err := x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
@@ -1687,7 +1688,7 @@ return fmt.Errorf("invalid union key '%v'", x.Type)}
 xc.arch_arm.gic_version = C.libxl_gic_version(x.ArchArm.GicVersion)
 xc.arch_arm.vuart = C.libxl_vuart_type(x.ArchArm.Vuart)
 xc.arch_arm.sve_vl = C.libxl_sve_type(x.ArchArm.SveVl)
-xc.arch_arm.nr_spis = C.uint32_t(x.ArchArm.NrSpis)
+xc.arch_arm.trap_unmapped_mmio = C.uint32_t(x.ArchArm.TrapUnmappedMmio)
 if err := x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err != nil {
 return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
 }
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index e7667f1ce3..89cc976bdc 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -599,6 +599,7 @@ GicVersion GicVersion
 Vuart VuartType
 SveVl SveType
 NrSpis uint32
+TrapUnmappedMmio Defbool
 }
 ArchX86 struct {
 MsrRelaxed Defbool
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 40cd005619..cce3fc4684 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -233,8 +233,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
     }
 
-    /* Trap accesses to unmapped MMIO. */
-    config->arch.flags = XEN_ARM_TRAP_UNMAPPED_MMIO;
+    config->arch.flags = 0;
+    if (libxl_defbool_val(d_config->b_info.arch_arm.trap_unmapped_mmio))
+        config->arch.flags |= XEN_ARM_TRAP_UNMAPPED_MMIO;
 
     return 0;
 }
@@ -1714,6 +1715,9 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
     /* ACPI is disabled by default */
     libxl_defbool_setdefault(&b_info->acpi, false);
 
+    /* Trapping of unmapped MMIO access enabled by default.  */
+    libxl_defbool_setdefault(&b_info->arch_arm.trap_unmapped_mmio, true);
+
     /* Sanitise SVE parameter */
     if (b_info->arch_arm.sve_vl) {
         unsigned int max_sve_vl =
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 9bb2969931..bd5425fe50 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -724,6 +724,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
                                ("vuart", libxl_vuart_type),
                                ("sve_vl", libxl_sve_type),
                                ("nr_spis", uint32, {'init_val': 'LIBXL_NR_SPIS_DEFAULT'}),
+                               ("trap_unmapped_mmio", libxl_defbool),
                               ])),
     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
                               ])),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 089a88935a..3099086198 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2975,6 +2975,9 @@ skip_usbdev:
     if (!xlu_cfg_get_long (config, "nr_spis", &l, 0))
         b_info->arch_arm.nr_spis = l;
 
+    xlu_cfg_get_defbool(config, "trap_unmapped_mmio",
+                        &b_info->arch_arm.trap_unmapped_mmio, 0);
+
     parse_vkb_list(config, d_config);
 
     d_config->virtios = NULL;
-- 
2.43.0


