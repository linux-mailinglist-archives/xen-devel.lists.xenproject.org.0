Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3912AABD59
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 10:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976753.1363952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDlQ-0005dU-8z; Tue, 06 May 2025 08:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976753.1363952; Tue, 06 May 2025 08:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDlP-0005WU-WB; Tue, 06 May 2025 08:34:56 +0000
Received: by outflank-mailman (input) for mailman id 976753;
 Tue, 06 May 2025 08:34:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vx1h=XW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCDlO-00048v-Nn
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 08:34:54 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbf559b1-2a54-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 10:34:54 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso43079385e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 01:34:54 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441b2af306bsm208429945e9.21.2025.05.06.01.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 01:34:52 -0700 (PDT)
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
X-Inumbo-ID: fbf559b1-2a54-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746520493; x=1747125293; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVsCpnQ84evwLMOD0Ne9LGSyDVtOtlci+rB7YWLWgTI=;
        b=lgGi3/G/ubnc6ViHuYdQBzRzbBnJOePxnSXhUQfsr+F/GcHn5cCBXd9In5ejiC6SOw
         Obu35BuPi8+xiVNkGK0/Y8g8G0W3XK9ssMBFn6PRL0OatHuhvz1qZLb6bTfr7GB6DWXy
         9eeJ0V6HsGgyjk/mAHQsay9UPdjMPH2qjXNdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746520493; x=1747125293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVsCpnQ84evwLMOD0Ne9LGSyDVtOtlci+rB7YWLWgTI=;
        b=Ylq1yXOGYCHIkur9iKrH5X92oBf0JYDyrq74CFUE9p4yefxyNZzv54GHjoPI7hnaTi
         L5u3lDXQibbVABnS6z0QbwDjj/eTajVawFVY9Hecdvn0Z6/ZP/dNJcK1pIGI2vW+TXMT
         12dRbskD9Fk6R9GByhs3npsPOeAcSsLXBG5qmkwT5c0EYV2+5iNaoF+lrpOsNDf9xa30
         6bjOZuDtBhZjO8AIhhY2mCGdRK9UKb9j0/H8TmbUM59c2OQIlIL5D/DJIPJNBtJUYxS2
         bU3Vo97EX0tubzQMPaJFWYKBTo29+9R3fO9I4sBaKFAHrm4PfY6cSpA8kDZqxPsJ9Bn4
         Usrg==
X-Gm-Message-State: AOJu0YxkBpD78jDmGiIcPi0TzplSF++wrykFbeXOywggQnh/VR4CukN2
	nY0VRQELv1H6s2M4yjHk555YGMCC9MCrwYSGoB343hpGCugwAuwh4scxx/5EUKHRkeWH+LTM4z8
	6
X-Gm-Gg: ASbGncsyLt8d2XtBflf3x7tFTaJEC6JOY5Ozlt3KMjpIKIxUhzR0ecGPED1cAmSoSco
	JysNVV5bzasgw0Rkjn0U6lfQIcbDKt5yfyncbX+uUboAXe9J5RGHHfm5jVLiJ8DOg8P3XpilAYV
	h7rEWhyIAabaEafsSNfmFswUtxoWTLm5cyJjCOvn8LeZZ+87doNLVXD+6Te8SuMAKn9ZnMFuv5V
	aQ7DA6wONMbFcG857tO73CUThOMKtqbBP3F6SvPdctcnduiwkljqAmKqR3d5g96Q+hOU6QQWywm
	3sEHsB2x1FVqA8/EcRAPPnarCUoIdtYMIaxw3q/hV6vZgA==
X-Google-Smtp-Source: AGHT+IF3dBRn3/Jgs4mw0xEm6RRkSp1VNCEoLHtuUvy28npJedhfACuCeVrkkTxKolBgMX9AMQ39qw==
X-Received: by 2002:a05:600c:4690:b0:43d:762:e0c4 with SMTP id 5b1f17b1804b1-441d054c744mr18730875e9.27.1746520492790;
        Tue, 06 May 2025 01:34:52 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 8/9] xen: introduce flag when a domain requires cache control
Date: Tue,  6 May 2025 10:31:47 +0200
Message-ID: <20250506083148.34963-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250506083148.34963-1-roger.pau@citrix.com>
References: <20250506083148.34963-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Such flag is added to the domain create hypercall, and a matching option is
added to xl and libxl to set the flag: `cache_control`.  When the flag is
set, the domain is allowed the usage of cache control operations.  If the
flag is not explicitly set, libxl will set it if the domain has any `iomem`
or `ioports` ranges assigned.

Modify cache_flush_permitted() helper so that it's return value is no
longer based on the IO resources assigned to the domain, but rather whether
the domain has been explicitly allowed control over the cache, or if it has
IOMMU support and there's a single IOMMU in the system that doesn't allow
forcing snooping behind the guest back.  As a result of this, the return of
cache_flush_permitted() is constant for the lifetime of a domain, based on
the domain creation flags and the capabilities of the IOMMU if enabled
for the domain.

Since cache control is now known at domain creation, and doesn't change for
the lifetime of a domain, the cache related checks can be simplified,
specially in iomem_{permit,deny}_access() and
ioports_{permit,deny}_access(), as the EPT EMT values won't depend on
whether the domain has IO resources assigned, but rather chosen at creation
time.

As cache_flush_permitted() now also takes into account if a domain has an
IOMMU assigned, and whether the IOMMU supports forcing snooping, some of
the checks can be simplified to drop the iommu_snoop or is_iommu_enabled()
checks previously used in conjunction with cache_flush_permitted().

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 docs/man/xl.cfg.5.pod.in         | 10 ++++++++++
 tools/include/libxl.h            |  7 +++++++
 tools/libs/light/libxl_create.c  |  6 ++++++
 tools/libs/light/libxl_types.idl |  3 +++
 tools/ocaml/libs/xc/xenctrl.ml   |  1 +
 tools/ocaml/libs/xc/xenctrl.mli  |  1 +
 tools/xl/xl_parse.c              |  2 ++
 xen/arch/arm/dom0less-build.c    | 12 ++++++++++--
 xen/arch/arm/domain.c            |  3 ++-
 xen/arch/arm/domain_build.c      |  6 ++++++
 xen/arch/x86/hvm/mtrr.c          |  2 +-
 xen/arch/x86/hvm/vmx/vmcs.c      |  3 +--
 xen/arch/x86/hvm/vmx/vmx.c       |  2 +-
 xen/arch/x86/include/asm/iocap.h | 19 ++-----------------
 xen/arch/x86/mm/p2m-ept.c        |  7 +------
 xen/arch/x86/setup.c             |  7 +++++++
 xen/common/domain.c              |  3 ++-
 xen/include/asm-generic/iocap.h  |  2 --
 xen/include/public/domctl.h      |  4 +++-
 xen/include/xen/iocap.h          | 25 ++-----------------------
 xen/include/xen/sched.h          |  6 ++++++
 21 files changed, 74 insertions(+), 57 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 7339c44efd54..d61685de4db3 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1705,6 +1705,16 @@ This feature is a B<technology preview>.
 
 =back
 
+=item B<cache_control=BOOLEAN>
+
+If this option is B<true>, Xen allows the guest to perform cache control
+operations.
+
+If this option is missing the default will be set based on whether there are
+any <B>iomem or <B>ioports (if applicable) assigned to the guest.  Note that
+enabling <B>passthrough support can also allow guest cache control operations
+depending on the <B>IOMMU features.
+
 =back
 
 =head2 Paravirtualised (PV) Guest Specific Options
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index b7ad7735ca4c..9a55e98f28bb 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -647,6 +647,13 @@
  */
 #define LIBXL_HAVE_DT_OVERLAY_DOMAIN 1
 
+/*
+ * LIBXL_HAVE_CACHE_CONTROL indicates the presence of cache_control boolean
+ * field in libxl_domain_build_info.  The field signals whether a domain is
+ * allowed access to cache control operations.
+ */
+#define LIBXL_HAVE_CACHE_CONTROL 1
+
 /*
  * libxl memory management
  *
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index e03599ea99d1..469fa306e2f0 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -493,6 +493,9 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         b_info->bootloader_user =
             libxl__strdup(gc, getenv("LIBXL_BOOTLOADER_USER"));
 
+    libxl_defbool_setdefault(&b_info->cache_control,
+                             b_info->num_iomem || b_info->num_ioports);
+
     return 0;
 }
 
@@ -667,6 +670,9 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
         if (libxl_defbool_val(b_info->vpmu))
             create.flags |= XEN_DOMCTL_CDF_vpmu;
 
+        if (libxl_defbool_val(b_info->cache_control))
+            create.flags |= XEN_DOMCTL_CDF_cache_control;
+
         assert(info->passthrough != LIBXL_PASSTHROUGH_DEFAULT);
         LOG(DETAIL, "passthrough: %s",
             libxl_passthrough_to_string(info->passthrough));
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 9bb296993199..59303e8df74a 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -737,6 +737,9 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
     ("vpmu", libxl_defbool),
 
+    # Allow guest access to cache control instructions.
+    ("cache_control", libxl_defbool),
+
     ], dir=DIR_IN,
        copy_deprecated_fn="libxl__domain_build_info_copy_deprecated",
 )
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 2690f9a92316..15ea2cbb0490 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -70,6 +70,7 @@ type domain_create_flag =
   | CDF_IOMMU
   | CDF_NESTED_VIRT
   | CDF_VPMU
+  | CDF_cache_control
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index febbe1f6ae3f..c9ce99a62c16 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -63,6 +63,7 @@ type domain_create_flag =
   | CDF_IOMMU
   | CDF_NESTED_VIRT
   | CDF_VPMU
+  | CDF_cache_control
 
 type domain_create_iommu_opts =
   | IOMMU_NO_SHAREPT
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 089a88935aff..b5f3133581cb 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -2993,6 +2993,8 @@ skip_usbdev:
 
     xlu_cfg_get_defbool(config, "vpmu", &b_info->vpmu, 0);
 
+    xlu_cfg_get_defbool(config, "cache_control", &b_info->cache_control, 0);
+
     xlu_cfg_destroy(config);
 }
 
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index a356fc94fc4d..e0f0b828d0b6 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -1106,6 +1106,8 @@ void __init create_domUs(void)
 
             if ( !strcmp(dom0less_iommu, "enabled") )
                 iommu = true;
+            else
+                d_cfg.flags |= XEN_DOMCTL_CDF_cache_control;
         }
 
         if ( (flags & CDF_hardware) && !(flags & CDF_directmap) &&
@@ -1120,8 +1122,14 @@ void __init create_domUs(void)
             has_dtb = true;
         }
 
-        if ( iommu_enabled && (iommu || has_dtb) )
-            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+        if ( iommu || has_dtb )
+            /*
+             * Domain has devices assigned, either enable IOMMU support (if
+             * present), or explicitly allow cache control operations for DMA
+             * coherency.
+             */
+            d_cfg.flags |= iommu_enabled ? XEN_DOMCTL_CDF_iommu
+                                         : XEN_DOMCTL_CDF_cache_control;
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
         {
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 45aeb8bddcb0..1a8503f8d471 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -612,7 +612,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     unsigned int max_vcpus;
     unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
     unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
-                                   XEN_DOMCTL_CDF_xs_domain );
+                                   XEN_DOMCTL_CDF_xs_domain |
+                                   XEN_DOMCTL_CDF_cache_control);
     unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
 
     if ( (config->flags & ~flags_optional) != flags_required )
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 270a6b97e42c..0e7e6a6ac044 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2381,6 +2381,12 @@ void __init create_dom0(void)
 
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+    else
+        /*
+         * A hardware domain without IOMMU will need cache control to
+         * ensure DMA coherency.
+         */
+        dom0_cfg.flags |= XEN_DOMCTL_CDF_cache_control;
 
     if ( opt_dom0_sve )
     {
diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index e7acfb6e8dc4..887994d2b984 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -766,7 +766,7 @@ HVM_REGISTER_SAVE_RESTORE(MTRR, hvm_save_mtrr_msr, NULL, hvm_load_mtrr_msr, 1,
 
 void memory_type_changed(struct domain *d)
 {
-    if ( (is_iommu_enabled(d) || cache_flush_permitted(d)) &&
+    if ( cache_flush_permitted(d) &&
          d->vcpu && d->vcpu[0] && p2m_memory_type_changed(d) )
     {
         flush_all(FLUSH_CACHE);
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index a44475ae15bd..fba62b5d47d8 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1921,8 +1921,7 @@ void cf_check vmx_do_resume(void)
          *  2: execute wbinvd on all dirty pCPUs when guest wbinvd exits.
          * If VT-d engine can force snooping, we don't need to do these.
          */
-        if ( has_arch_pdevs(v->domain) && !iommu_snoop
-                && !cpu_has_wbinvd_exiting )
+        if ( cache_flush_permitted(v->domain) && !cpu_has_wbinvd_exiting )
         {
             int cpu = v->arch.hvm.vmx.active_cpu;
             if ( cpu != -1 )
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 827db6bdd807..639882ceb216 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3840,7 +3840,7 @@ static void vmx_do_extint(struct cpu_user_regs *regs)
 
 static void cf_check vmx_wbinvd_intercept(void)
 {
-    if ( !cache_flush_permitted(current->domain) || iommu_snoop )
+    if ( !cache_flush_permitted(current->domain) )
         return;
 
     if ( cpu_has_wbinvd_exiting )
diff --git a/xen/arch/x86/include/asm/iocap.h b/xen/arch/x86/include/asm/iocap.h
index 61d026dbf5f6..d3bb66f0e97a 100644
--- a/xen/arch/x86/include/asm/iocap.h
+++ b/xen/arch/x86/include/asm/iocap.h
@@ -19,31 +19,16 @@
     (!rangeset_is_empty((d)->iomem_caps) ||             \
      !rangeset_is_empty((d)->arch.ioport_caps))
 
-#define cache_flush_permitted has_arch_io_resources
-
 static inline int ioports_permit_access(struct domain *d, unsigned long s,
                                         unsigned long e)
 {
-    bool flush = cache_flush_permitted(d);
-    int ret = rangeset_add_range(d->arch.ioport_caps, s, e);
-
-    if ( !ret && !is_iommu_enabled(d) && !flush )
-        /* See comment in iomem_permit_access(). */
-        memory_type_changed(d);
-
-    return ret;
+    return rangeset_add_range(d->arch.ioport_caps, s, e);
 }
 
 static inline int ioports_deny_access(struct domain *d, unsigned long s,
                                       unsigned long e)
 {
-    int ret = rangeset_remove_range(d->arch.ioport_caps, s, e);
-
-    if ( !ret && !is_iommu_enabled(d) && !cache_flush_permitted(d) )
-        /* See comment in iomem_deny_access(). */
-        memory_type_changed(d);
-
-    return ret;
+    return rangeset_remove_range(d->arch.ioport_caps, s, e);
 }
 
 #endif /* __X86_IOCAP_H__ */
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 0cf6818c13f0..d3ce422d76d7 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -505,12 +505,7 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
         return -1;
     }
 
-    /*
-     * Conditional must be kept in sync with the code in
-     * {iomem,ioports}_{permit,deny}_access().
-     */
-    if ( type != p2m_mmio_direct && !is_iommu_enabled(d) &&
-         !cache_flush_permitted(d) )
+    if ( type != p2m_mmio_direct && !cache_flush_permitted(d) )
     {
         *ipat = true;
         return X86_MT_WB;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 25189541244d..ec1b9772bec0 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1029,6 +1029,13 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+    else if ( !pv_shim )
+        /*
+         * pvshim doesn't support passthrough, so never allow it cache control.
+         * Otherwise a hardware domain without IOMMU will need cache control to
+         * ensure DMA coherency.
+         */
+        dom0_cfg.flags |= XEN_DOMCTL_CDF_cache_control;
 
     /* Create initial domain.  Not d0 for pvshim. */
     bd->domid = get_initial_domain_id();
diff --git a/xen/common/domain.c b/xen/common/domain.c
index abf1969e60e3..07b81a70c7a6 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -721,7 +721,8 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
-           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
+           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
+           XEN_DOMCTL_CDF_cache_control) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
diff --git a/xen/include/asm-generic/iocap.h b/xen/include/asm-generic/iocap.h
index 664bbc8971fe..011c1a475072 100644
--- a/xen/include/asm-generic/iocap.h
+++ b/xen/include/asm-generic/iocap.h
@@ -5,8 +5,6 @@
 #define has_arch_io_resources(d)                        \
     (!rangeset_is_empty((d)->iomem_caps))
 
-#define cache_flush_permitted has_arch_io_resources
-
 #endif /* __ASM_GENERIC_IOCAP_H__ */
 
 /*
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 5b2063eed984..9134dde7e105 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -66,9 +66,11 @@ struct xen_domctl_createdomain {
 #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
 /* Should we expose the vPMU to the guest? */
 #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
+/* Guest has control over the cache? */
+#define XEN_DOMCTL_CDF_cache_control  (1U << 8)
 
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
+#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_cache_control
 
     uint32_t flags;
 
diff --git a/xen/include/xen/iocap.h b/xen/include/xen/iocap.h
index ffbc48b60fd5..a753fea2ec50 100644
--- a/xen/include/xen/iocap.h
+++ b/xen/include/xen/iocap.h
@@ -15,34 +15,13 @@
 static inline int iomem_permit_access(struct domain *d, unsigned long s,
                                       unsigned long e)
 {
-    bool flush = cache_flush_permitted(d);
-    int ret = rangeset_add_range(d->iomem_caps, s, e);
-
-    if ( !ret && !is_iommu_enabled(d) && !flush )
-        /*
-         * Only flush if the range(s) are empty before this addition and
-         * IOMMU is not enabled for the domain, otherwise it makes no
-         * difference for effective cache attribute calculation purposes.
-         */
-        memory_type_changed(d);
-
-    return ret;
+    return rangeset_add_range(d->iomem_caps, s, e);
 }
 
 static inline int iomem_deny_access(struct domain *d, unsigned long s,
                                     unsigned long e)
 {
-    int ret = rangeset_remove_range(d->iomem_caps, s, e);
-
-    if ( !ret && !is_iommu_enabled(d) && !cache_flush_permitted(d) )
-        /*
-         * Only flush if the range(s) are empty after this removal and
-         * IOMMU is not enabled for the domain, otherwise it makes no
-         * difference for effective cache attribute calculation purposes.
-         */
-        memory_type_changed(d);
-
-    return ret;
+    return rangeset_remove_range(d->iomem_caps, s, e);
 }
 
 #define iomem_access_permitted(d, s, e)                 \
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 559d201e0c7e..908a3b7292ff 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1222,6 +1222,12 @@ static always_inline bool is_iommu_enabled(const struct domain *d)
     return evaluate_nospec(d->options & XEN_DOMCTL_CDF_iommu);
 }
 
+static inline bool cache_flush_permitted(const struct domain *d)
+{
+    return (d->options & XEN_DOMCTL_CDF_cache_control) ||
+           (is_iommu_enabled(d) && !iommu_snoop);
+}
+
 #ifdef CONFIG_MEM_PAGING
 # define mem_paging_enabled(d) vm_event_check_ring((d)->vm_event_paging)
 #else
-- 
2.48.1


