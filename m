Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 583FD8296A7
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 10:54:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665355.1035544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNVH1-0005rq-Fw; Wed, 10 Jan 2024 09:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665355.1035544; Wed, 10 Jan 2024 09:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNVH1-0005q3-BX; Wed, 10 Jan 2024 09:53:23 +0000
Received: by outflank-mailman (input) for mailman id 665355;
 Wed, 10 Jan 2024 09:53:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sd/G=IU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rNVGz-0005pv-JS
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 09:53:21 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15f4f44f-af9e-11ee-98f0-6d05b1d4d9a1;
 Wed, 10 Jan 2024 10:53:20 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50ea8fbf261so4354215e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 01:53:20 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 27-20020a170906329b00b00a1f738318a5sm1901045ejw.155.2024.01.10.01.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 01:53:18 -0800 (PST)
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
X-Inumbo-ID: 15f4f44f-af9e-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704880399; x=1705485199; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p+kGDEShAPonD+n+34963/25SPoZWCCdyFb4vVFLXDs=;
        b=F8uvFMZoy3VU2l+QgZQRQ/p3TpX8T1FepRdstQ3MuJePp0NIBxIVHqsxaS3OB0tNIr
         eC83FhgkUmU5MOp7ohmLdCyGXIlllKQk4FRCaY8Wu6DFy86mhBHHUdZEb1QkzaOTWAYi
         E/o93iuRwWHfA11HzLJ8ujaI5wjLimbjgBEqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704880399; x=1705485199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+kGDEShAPonD+n+34963/25SPoZWCCdyFb4vVFLXDs=;
        b=Pl4miAC8fV2ofv/fIuD7hOWruV1MXdul/da+i3xndw3snYeOwlscY10Hn8cM8I+Hz9
         mh8Lb365ZM/6DHfsm7CwWurraCnznVRwkEuGjsiYNvST/81kM36G+qiwFRhRA8/gY3b0
         OzK8vztdOxOD5lJA0sFY2DyQHtJ9rlRYiwIqdxaEdOcsUEZ3NE0zybflQ4JFne2YFCZt
         6r9nKgX3MrmCKZhpZWMSlKE4+yB7orkOhF6xikAj9lWw96Xol4QeyY28c4vdUic4JR2W
         n1LPfcnM19NhDx4WCc2gczlNQPukALHDqyaAwEqjVGnByTlY2OMjTqy8EZHZdzP43TtR
         badw==
X-Gm-Message-State: AOJu0YyA/22ZUstx9b4Sgp6updIrs/XiUhIS1d5H8zm/lK3YiC8pIbAm
	L5uxXJ6sDchLvtqXDmCiOoCuAyq8HCuoxTyxDhbLv2uQFiI=
X-Google-Smtp-Source: AGHT+IEeQ9ocrsopLi6w/XBsgMFVPTLEh6EvakQssCnOAoUnQBYTFPdiPaZZsNcZjBxi0M+Nzmx+yA==
X-Received: by 2002:a05:6512:2215:b0:50e:709e:dee1 with SMTP id h21-20020a056512221500b0050e709edee1mr341062lfu.96.1704880399125;
        Wed, 10 Jan 2024 01:53:19 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/hvm: don't expose XENFEAT_hvm_pirqs by default
Date: Wed, 10 Jan 2024 10:53:11 +0100
Message-ID: <20240110095311.61809-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
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
---
 docs/man/xl.cfg.5.pod.in          |  7 +++++++
 tools/include/libxl.h             |  7 +++++++
 tools/libs/light/libxl_create.c   |  7 +++++--
 tools/libs/light/libxl_types.idl  |  1 +
 tools/libs/light/libxl_x86.c      | 11 ++++++++---
 tools/python/xen/lowlevel/xc/xc.c |  4 +++-
 tools/xl/xl_parse.c               |  1 +
 xen/arch/x86/domain.c             |  4 +++-
 8 files changed, 35 insertions(+), 7 deletions(-)

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
index d16573e72cd4..79c7c11e30b0 100644
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
@@ -864,15 +866,18 @@ void libxl__arch_update_domain_config(libxl__gc *gc,
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
+    libxl_defbool_setdefault(&dst->b_info.u.hvm.pirq,
+                             libxl_defbool_val(src->b_info.u.hvm.pirq));
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
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 8a31d18f6967..bda853e3c92b 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -725,7 +725,9 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
              emflags != (X86_EMU_VPCI | X86_EMU_LAPIC | X86_EMU_IOAPIC) )
             return false;
         if ( !is_hardware_domain(d) &&
-             emflags != (X86_EMU_ALL & ~X86_EMU_VPCI) &&
+             /* HVM PIRQ feature is user-selectable. */
+             (emflags & ~X86_EMU_USE_PIRQ) !=
+             (X86_EMU_ALL & ~(X86_EMU_VPCI | X86_EMU_USE_PIRQ)) &&
              emflags != X86_EMU_LAPIC )
             return false;
     }
-- 
2.43.0


