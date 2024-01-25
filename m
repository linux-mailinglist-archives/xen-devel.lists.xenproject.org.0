Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3D083BD5F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 10:32:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671418.1044761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSw5a-0008Hr-4E; Thu, 25 Jan 2024 09:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671418.1044761; Thu, 25 Jan 2024 09:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSw5a-0008Ct-0Z; Thu, 25 Jan 2024 09:32:02 +0000
Received: by outflank-mailman (input) for mailman id 671418;
 Thu, 25 Jan 2024 09:32:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etx6=JD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSw5Y-0007vY-8X
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 09:32:00 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95de57b1-bb64-11ee-98f5-6d05b1d4d9a1;
 Thu, 25 Jan 2024 10:31:58 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a2f79e79f0cso663219566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 01:31:58 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 k14-20020a1709065fce00b00a28aa4871c7sm810653ejv.205.2024.01.25.01.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 01:31:56 -0800 (PST)
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
X-Inumbo-ID: 95de57b1-bb64-11ee-98f5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706175117; x=1706779917; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpZTccjC01lQ22ZOUMrUv8uxGkg2XLJ2380ya8EGEHU=;
        b=lGfMDu1/EcZx7MBc0RXsWK1HclEXiG9tqLPkSU2SUoRIq3/oOrhfivSdwISiYEHiE2
         clzpkpX76sWBvESfCSXRwohzkMxyg3fcx7Gip7NbYZ6VPsf4+Vsacf5FftD8n9/rLs5r
         cwarAOmPTz4hB6fTXCXqNHmMmX461lhT1cRZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706175117; x=1706779917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpZTccjC01lQ22ZOUMrUv8uxGkg2XLJ2380ya8EGEHU=;
        b=c5Ephy5+DNaVdJrWwlDi0pz+ykqeY3HEIPhivoEG2iiXiax0QgdVrjfNxPzrxuB3qY
         9+ekWJusNRt4VnZO91grP+OTXaqX4d1cM2EgtiRVAQgj7Lpd6H5z0nzHbcRRKEYy69Qv
         s+/LN+tfcvmtZlib9c6EES8RriYN64uDp3yx7FvNL8Czuxpx60cTUlS2gmfAIDMpaeMk
         c/pIDmweFgh5ZogdDS4SycSWv/PrAWW/Z9qeAkgKeKMVsJ/WGMJcltffukPJy80s9srj
         aIvuUCPvwQ+H5a+zRS3i5o8OkZ6ohap4Zji3BwQ6I3GTA4EmCGRsqg3zF4o1daF91fiP
         xHCA==
X-Gm-Message-State: AOJu0Yz8N4cLQhmm4MTi2OKk0sejR+wBLB5FjNXRlrURH9dGXO40BLEb
	DXVxvLIYPtG/Q7nxp9QfYUsihYa0FZM4OxPR9TSRKCOhfn+F/Eo0Nk7qDrcyamsJ/BlgYJl2dUG
	B
X-Google-Smtp-Source: AGHT+IHBsGM9NK49qjju4cShorcblJDM+dhzIM1aoPqU0XJdQoT+zmL2yyPh64GNw+QwNMblNor7hA==
X-Received: by 2002:a17:907:93c3:b0:a31:6dd6:5646 with SMTP id cp3-20020a17090793c300b00a316dd65646mr352105ejc.87.1706175116991;
        Thu, 25 Jan 2024 01:31:56 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 2/2] tools: don't expose XENFEAT_hvm_pirqs by default
Date: Thu, 25 Jan 2024 10:30:41 +0100
Message-ID: <20240125093041.33087-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125093041.33087-1-roger.pau@citrix.com>
References: <20240125093041.33087-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The HVM pirq feature allows routing interrupts from both physical and emulated
devices over event channels, this was done a performance improvement.  However
its usage is fully undocumented, and the only reference implementation is in
Linux.  It defeats the purpose of local APIC hardware virtualization, because
when using it interrupts avoid the usage of the local APIC altogether.

It has also been reported to not work properly with certain devices, at least
when using some AMD GPUs Linux attempts to route interrupts over event
channels, but Xen doesn't correctly detect such routing, which leads to the
hypervisor complaining with:

(XEN) d15v0: Unsupported MSI delivery mode 7 for Dom15

When MSIs are attempted to be routed over event channels the entry delivery
mode is set to ExtINT, but Xen doesn't detect such routing and attempts to
inject the interrupt following the native MSI path, and the ExtINT delivery
mode is not supported.

Disable HVM PIRQs by default and provide a per-domain option in xl.cfg to
enable such feature.  Also for backwards compatibility keep the feature enabled
for any resumed domains that don't have an explicit selection.

Note that the only user of the feature (Linux) is also able to handle native
interrupts fine, as the feature was already not used if Xen reported local APIC
hardware virtualization active.

Link: https://github.com/QubesOS/qubes-issues/issues/7971
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes since v2:
 - Add changelog entry.

Changes since v1:
 - Fix libxl for PV guests.
---
 CHANGELOG.md                      |  2 ++
 docs/man/xl.cfg.5.pod.in          |  7 +++++++
 tools/include/libxl.h             |  7 +++++++
 tools/libs/light/libxl_create.c   |  7 +++++--
 tools/libs/light/libxl_types.idl  |  1 +
 tools/libs/light/libxl_x86.c      | 12 +++++++++---
 tools/python/xen/lowlevel/xc/xc.c |  4 +++-
 tools/xl/xl_parse.c               |  1 +
 8 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 723d06425431..ddb3ab8db4e7 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Changed
  - Changed flexible array definitions in public I/O interface headers to not
    use "1" as the number of array elements.
+ - On x86:
+   - HVM PIRQs are disabled by default.
 
 ### Added
  - On x86:
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 2e234b450efb..ea8d41727d8e 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2460,6 +2460,13 @@ The viridian option can be specified as a boolean. A value of true (1)
 is equivalent to the list [ "defaults" ], and a value of false (0) is
 equivalent to an empty list.
 
+=item B<hvm_pirq=BOOLEAN>
+
+Select whether the guest is allowed to route interrupts from devices (either
+emulated or passed through) over event channels.
+
+This option is disabled by default.
+
 =back
 
 =head3 Emulated VGA Graphics Device
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 907aa0a3303a..f1652b1664f0 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -608,6 +608,13 @@
  * executable in order to not run it as the same user as libxl.
  */
 
+/*
+ * LIBXL_HAVE_HVM_PIRQ indicates the presence of the u.hvm.pirq filed in
+ * libxl_domain_build_info that signals whether an HVM guest has accesses to
+ * the XENFEAT_hvm_pirqs feature.
+ */
+#define LIBXL_HAVE_HVM_PIRQ 1
+
 /*
  * libxl memory management
  *
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index ce1d43110336..0008fac607e3 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -376,6 +376,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         libxl_defbool_setdefault(&b_info->u.hvm.usb,                false);
         libxl_defbool_setdefault(&b_info->u.hvm.vkb_device,         true);
         libxl_defbool_setdefault(&b_info->u.hvm.xen_platform_pci,   true);
+        libxl_defbool_setdefault(&b_info->u.hvm.pirq,               false);
 
         libxl_defbool_setdefault(&b_info->u.hvm.spice.enable, false);
         if (!libxl_defbool_val(b_info->u.hvm.spice.enable) &&
@@ -2375,10 +2376,12 @@ int libxl_domain_create_restore(libxl_ctx *ctx, libxl_domain_config *d_config,
 
     /*
      * When restoring (either from a save file or for a migration domain) set
-     * the MSR relaxed mode for compatibility with older Xen versions if the
-     * option is not set as part of the original configuration.
+     * the MSR relaxed mode and HVM PIRQs for compatibility with older Xen
+     * versions if the options are not set as part of the original
+     * configuration.
      */
     libxl_defbool_setdefault(&d_config->b_info.arch_x86.msr_relaxed, true);
+    libxl_defbool_setdefault(&d_config->b_info.u.hvm.pirq, true);
 
     return do_domain_create(ctx, d_config, domid, restore_fd, send_back_fd,
                             params, ao_how, aop_console_how);
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 7d8bd5d21667..899ad3096926 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -692,6 +692,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
                                        ("rdm", libxl_rdm_reserve),
                                        ("rdm_mem_boundary_memkb", MemKB),
                                        ("mca_caps",         uint64),
+                                       ("pirq",             libxl_defbool),
                                        ])),
                  ("pv", Struct(None, [("kernel", string, {'deprecated_by': 'kernel'}),
                                       ("slack_memkb", MemKB),
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index d16573e72cd4..a50ec37eb3eb 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -9,6 +9,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     switch(d_config->c_info.type) {
     case LIBXL_DOMAIN_TYPE_HVM:
         config->arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
+        if (!libxl_defbool_val(d_config->b_info.u.hvm.pirq))
+            config->arch.emulation_flags &= ~XEN_X86_EMU_USE_PIRQ;
         break;
     case LIBXL_DOMAIN_TYPE_PVH:
         config->arch.emulation_flags = XEN_X86_EMU_LAPIC;
@@ -864,15 +866,19 @@ void libxl__arch_update_domain_config(libxl__gc *gc,
                                       const libxl_domain_config *src)
 {
     /*
-     * Force MSR relaxed to be set (either to true or false) so it's part of
-     * the domain configuration when saving or performing a live-migration.
+     * Force MSR relaxed and HVM pirq to be set (either to true or false) so
+     * it's part of the domain configuration when saving or performing a
+     * live-migration.
      *
-     * Doing so allows the recovery side to figure out whether the flag should
+     * Doing so allows the recovery side to figure out whether the flags should
      * be set to true in order to keep backwards compatibility with already
      * started domains.
      */
     libxl_defbool_setdefault(&dst->b_info.arch_x86.msr_relaxed,
                     libxl_defbool_val(src->b_info.arch_x86.msr_relaxed));
+    if (src->c_info.type == LIBXL_DOMAIN_TYPE_HVM )
+        libxl_defbool_setdefault(&dst->b_info.u.hvm.pirq,
+                                 libxl_defbool_val(src->b_info.u.hvm.pirq));
 }
 
 /*
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index d3ea350e07b9..9feb12ae2b16 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -159,7 +159,9 @@ static PyObject *pyxc_domain_create(XcObject *self,
 
 #if defined (__i386) || defined(__x86_64__)
     if ( config.flags & XEN_DOMCTL_CDF_hvm )
-        config.arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
+        config.arch.emulation_flags = XEN_X86_EMU_ALL &
+                                      ~(XEN_X86_EMU_VPCI |
+                                        XEN_X86_EMU_USE_PIRQ);
 #elif defined (__arm__) || defined(__aarch64__)
     config.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
 #else
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index ed983200c3f8..9b358f11b88e 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1801,6 +1801,7 @@ void parse_config_data(const char *config_source,
         xlu_cfg_get_defbool(config, "hpet", &b_info->u.hvm.hpet, 0);
         xlu_cfg_get_defbool(config, "vpt_align", &b_info->u.hvm.vpt_align, 0);
         xlu_cfg_get_defbool(config, "apic", &b_info->apic, 0);
+        xlu_cfg_get_defbool(config, "hvm_pirq", &b_info->u.hvm.pirq, 0);
 
         switch (xlu_cfg_get_list(config, "viridian",
                                  &viridian, &num_viridian, 1))
-- 
2.43.0


