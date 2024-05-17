Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 091748C8747
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 15:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724137.1129311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7xjO-0003ti-L6; Fri, 17 May 2024 13:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724137.1129311; Fri, 17 May 2024 13:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7xjO-0003nK-HT; Fri, 17 May 2024 13:34:42 +0000
Received: by outflank-mailman (input) for mailman id 724137;
 Fri, 17 May 2024 13:34:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WJM7=MU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s7xjN-0003lB-Cp
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 13:34:41 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 367aa102-1452-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 15:34:40 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2db17e8767cso8917091fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 06:34:40 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f88110f3esm343070175e9.29.2024.05.17.06.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 06:34:38 -0700 (PDT)
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
X-Inumbo-ID: 367aa102-1452-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715952879; x=1716557679; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InYh5oMvLk+F01NISv6iHX9jFgL9SL6h0cc3g+aH2ug=;
        b=RL/SaNwE+93gf9w0hnt4rJxgaTY51WtC5bIs65iHdfjFYwkJhXRx2DEWsSX9WM0hTI
         nBverXOIEyVzSQwkAbS9Onc1wFGZ/EgEnytxinJ+eNFu7Y8GdPLZVvbpIcDu1WElGpBJ
         IsqUuWSPl49hHyAIL7jwRx7/f6CFNtY3KNPCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715952879; x=1716557679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InYh5oMvLk+F01NISv6iHX9jFgL9SL6h0cc3g+aH2ug=;
        b=afofppW0j65988NM1H7ujvYqXFwb0d3rNFh62ykP0e8ADYrvhH8VvMUB5YfsehDDDC
         wZxDUQJc9eLfzDLQbRySz1zdXSd6224aOa8Slc/1pxlBPPKPjNQAUYbHKSlkfgDTJxAh
         TzIsncBqjRKDqECXQj0Bk5eYZFMBjckdmxaSgRcqvYzle65weZu3PDn3AOuD63RAQAm3
         7R1DOUI9FLWPjpliKIAn9AtWTef3x1uWHtSpF47gkV2LpjzKpwFgVhsbNTNHX+PAw1F6
         jk56/7BGJsBErtUgbgECmELexix5mbrcdE5onfnJbN+4rSaSk3oEmjUlb+9atbqaY00+
         HH0g==
X-Gm-Message-State: AOJu0YwqMfliseBYg4hzv4TKo/itVHkLu1vs9v+tbFkEjUNvOVsg4Vlq
	RjWVy/iW2JU4xjuJm2vW4siMTiG2/IuQAwkL6HEG1OD/LkyweYlv3j3B9ezQfpqCp5bQ8vyqyiU
	w
X-Google-Smtp-Source: AGHT+IGQFISxfnzNfTscn7hw2MgSEuiMarnI41ybpc/VCXw6LtDUEGVSUEHws/R+y9K0LGm392G+jA==
X-Received: by 2002:a05:651c:1542:b0:2de:7046:b8f8 with SMTP id 38308e7fff4ca-2e51fd2e6a8mr223879701fa.5.1715952879322;
        Fri, 17 May 2024 06:34:39 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH for-4.19 v3 2/3] xen: enable altp2m at create domain domctl
Date: Fri, 17 May 2024 15:33:51 +0200
Message-ID: <20240517133352.94347-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240517133352.94347-1-roger.pau@citrix.com>
References: <20240517133352.94347-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enabling it using an HVM param is fragile, and complicates the logic when
deciding whether options that interact with altp2m can also be enabled.

Leave the HVM param value for consumption by the guest, but prevent it from
being set.  Enabling is now done using and additional altp2m specific field in
xen_domctl_createdomain.

Note that albeit only currently implemented in x86, altp2m could be implemented
in other architectures, hence why the field is added to xen_domctl_createdomain
instead of xen_arch_domainconfig.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Introduce a new altp2m field in xen_domctl_createdomain.

Changes since v1:
 - New in this version.
---
 tools/libs/light/libxl_create.c     | 23 ++++++++++++++++++++++-
 tools/libs/light/libxl_x86.c        | 26 ++++++++++++--------------
 tools/ocaml/libs/xc/xenctrl_stubs.c |  2 +-
 xen/arch/arm/domain.c               |  6 ++++++
 xen/arch/x86/domain.c               | 22 ++++++++++++++++++++++
 xen/arch/x86/hvm/hvm.c              | 23 ++++++++++++++++++++++-
 xen/include/public/domctl.h         | 20 +++++++++++++++++++-
 xen/include/public/hvm/params.h     |  9 ++-------
 8 files changed, 106 insertions(+), 25 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 41252ec55370..edeadd57ef5a 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -372,7 +372,6 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         libxl_defbool_setdefault(&b_info->u.hvm.viridian,           false);
         libxl_defbool_setdefault(&b_info->u.hvm.hpet,               true);
         libxl_defbool_setdefault(&b_info->u.hvm.vpt_align,          true);
-        libxl_defbool_setdefault(&b_info->u.hvm.altp2m,             false);
         libxl_defbool_setdefault(&b_info->u.hvm.usb,                false);
         libxl_defbool_setdefault(&b_info->u.hvm.vkb_device,         true);
         libxl_defbool_setdefault(&b_info->u.hvm.xen_platform_pci,   true);
@@ -678,6 +677,28 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
         if (info->passthrough == LIBXL_PASSTHROUGH_SYNC_PT)
             create.iommu_opts |= XEN_DOMCTL_IOMMU_no_sharept;
 
+        LOG(DETAIL, "altp2m: %s", libxl_altp2m_mode_to_string(b_info->altp2m));
+        switch(b_info->altp2m) {
+        case LIBXL_ALTP2M_MODE_MIXED:
+            create.altp2m_opts |=
+                XEN_DOMCTL_ALTP2M_mode(XEN_DOMCTL_ALTP2M_mixed);
+            break;
+
+        case LIBXL_ALTP2M_MODE_EXTERNAL:
+            create.altp2m_opts |=
+                XEN_DOMCTL_ALTP2M_mode(XEN_DOMCTL_ALTP2M_external);
+            break;
+
+        case LIBXL_ALTP2M_MODE_LIMITED:
+            create.altp2m_opts |=
+                XEN_DOMCTL_ALTP2M_mode(XEN_DOMCTL_ALTP2M_limited);
+            break;
+
+        case LIBXL_ALTP2M_MODE_DISABLED:
+            /* Nothing to do - altp2m disabled is signaled as mode == 0. */
+            break;
+        }
+
         /* Ultimately, handle is an array of 16 uint8_t, same as uuid */
         libxl_uuid_copy(ctx, (libxl_uuid *)&create.handle, &info->uuid);
 
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index a50ec37eb3eb..60643d6f5376 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -407,19 +407,9 @@ static int hvm_set_conf_params(libxl__gc *gc, uint32_t domid,
     libxl_ctx *ctx = libxl__gc_owner(gc);
     xc_interface *xch = ctx->xch;
     int ret = ERROR_FAIL;
-    unsigned int altp2m = info->altp2m;
 
     switch(info->type) {
     case LIBXL_DOMAIN_TYPE_HVM:
-        /* The config parameter "altp2m" replaces the parameter "altp2mhvm". For
-         * legacy reasons, both parameters are accepted on x86 HVM guests.
-         *
-         * If the legacy field info->u.hvm.altp2m is set, activate altp2m.
-         * Otherwise set altp2m based on the field info->altp2m. */
-        if (info->altp2m == LIBXL_ALTP2M_MODE_DISABLED &&
-            libxl_defbool_val(info->u.hvm.altp2m))
-            altp2m = libxl_defbool_val(info->u.hvm.altp2m);
-
         if (xc_hvm_param_set(xch, domid, HVM_PARAM_HPET_ENABLED,
                              libxl_defbool_val(info->u.hvm.hpet))) {
             LOG(ERROR, "Couldn't set HVM_PARAM_HPET_ENABLED");
@@ -444,10 +434,6 @@ static int hvm_set_conf_params(libxl__gc *gc, uint32_t domid,
             LOG(ERROR, "Couldn't set HVM_PARAM_TIMER_MODE");
             goto out;
         }
-        if (xc_hvm_param_set(xch, domid, HVM_PARAM_ALTP2M, altp2m)) {
-            LOG(ERROR, "Couldn't set HVM_PARAM_ALTP2M");
-            goto out;
-        }
         break;
 
     default:
@@ -818,6 +804,18 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
     libxl_defbool_setdefault(&b_info->acpi, true);
     libxl_defbool_setdefault(&b_info->arch_x86.msr_relaxed, false);
 
+    /*
+     * The config parameter "altp2m" replaces the parameter "altp2mhvm".
+     * For legacy reasons, both parameters are accepted on x86 HVM guests.
+     *
+     * If the legacy field info->u.hvm.altp2m is set, activate altp2m.
+     * Otherwise set altp2m based on the field info->altp2m.
+     */
+    libxl_defbool_setdefault(&b_info->u.hvm.altp2m, false);
+    if (b_info->altp2m == LIBXL_ALTP2M_MODE_DISABLED &&
+        libxl_defbool_val(b_info->u.hvm.altp2m))
+        b_info->altp2m = libxl_defbool_val(b_info->u.hvm.altp2m);
+
     return 0;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 2b6d3c09dfa0..c6da9bb09137 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -257,7 +257,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 #if defined(__i386__) || defined(__x86_64__)
 
 		/* Quick & dirty check for ABI changes. */
-		BUILD_BUG_ON(sizeof(cfg) != 64);
+		BUILD_BUG_ON(sizeof(cfg) != 68);
 
         /* Mnemonics for the named fields inside xen_x86_arch_domainconfig */
 #define VAL_EMUL_FLAGS          Field(arch_domconfig, 0)
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 34cbfe699a68..8bde2f730dfb 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -688,6 +688,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( config->altp2m_opts )
+    {
+        dprintk(XENLOG_INFO, "Altp2m not supported\n");
+        return -EINVAL;
+    }
+
     return 0;
 }
 
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 20e83cf38bbd..a89ceff9ae93 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -637,6 +637,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     bool hap = config->flags & XEN_DOMCTL_CDF_hap;
     bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
     unsigned int max_vcpus;
+    unsigned int altp2m_mode = MASK_EXTR(config->altp2m_opts,
+                                         XEN_DOMCTL_ALTP2M_mode_mask);
 
     if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
     {
@@ -715,6 +717,26 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( config->altp2m_opts & ~XEN_DOMCTL_ALTP2M_mode_mask )
+    {
+        dprintk(XENLOG_INFO, "Invalid altp2m options selected: %#x\n",
+                config->flags);
+        return -EINVAL;
+    }
+
+    if ( altp2m_mode && nested_virt )
+    {
+        dprintk(XENLOG_INFO,
+                "Nested virt and altp2m are not supported together\n");
+        return -EINVAL;
+    }
+
+    if ( altp2m_mode && !hap )
+    {
+        dprintk(XENLOG_INFO, "altp2m is only supported with HAP\n");
+        return -EINVAL;
+    }
+
     return 0;
 }
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 9594e0a5c530..31f64725b725 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -659,6 +659,22 @@ int hvm_domain_initialise(struct domain *d,
 
     d->arch.hvm.params[HVM_PARAM_TRIPLE_FAULT_REASON] = SHUTDOWN_reboot;
 
+    /* Set altp2m based on domctl flags. */
+    switch ( MASK_EXTR(config->altp2m_opts, XEN_DOMCTL_ALTP2M_mode_mask) )
+    {
+    case XEN_DOMCTL_ALTP2M_mixed:
+        d->arch.hvm.params[HVM_PARAM_ALTP2M] = XEN_ALTP2M_mixed;
+        break;
+
+    case XEN_DOMCTL_ALTP2M_external:
+        d->arch.hvm.params[HVM_PARAM_ALTP2M] = XEN_ALTP2M_external;
+        break;
+
+    case XEN_DOMCTL_ALTP2M_limited:
+        d->arch.hvm.params[HVM_PARAM_ALTP2M] = XEN_ALTP2M_limited;
+        break;
+    }
+
     vpic_init(d);
 
     rc = vioapic_init(d);
@@ -4169,6 +4185,12 @@ static int hvm_allow_set_param(struct domain *d,
     case HVM_PARAM_CONSOLE_EVTCHN:
     case HVM_PARAM_X87_FIP_WIDTH:
         break;
+
+    /* The following parameters are read-only. */
+    case HVM_PARAM_ALTP2M:
+        rc = -EEXIST;
+        break;
+
     /* The following parameters are deprecated. */
     case HVM_PARAM_PAE_ENABLED:
     case HVM_PARAM_DM_DOMAIN:
@@ -4210,7 +4232,6 @@ static int hvm_allow_set_param(struct domain *d,
     case HVM_PARAM_BUFIOREQ_PFN:
     case HVM_PARAM_IOREQ_SERVER_PFN:
     case HVM_PARAM_NR_IOREQ_SERVER_PAGES:
-    case HVM_PARAM_ALTP2M:
     case HVM_PARAM_MCA_CAP:
         if ( value != 0 && new_value != value )
             rc = -EEXIST;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a33f9ec32b08..e72967717e67 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -21,7 +21,7 @@
 #include "hvm/save.h"
 #include "memory.h"
 
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
 
 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
@@ -86,6 +86,24 @@ struct xen_domctl_createdomain {
 
     uint32_t grant_opts;
 
+/*
+ * Enable altp2m mixed mode.
+ *
+ * Note that 'mixed' mode has not been evaluated for safety from a security
+ * perspective.  Before using this mode in a security-critical environment,
+ * each subop should be evaluated for safety, with unsafe subops blacklisted in
+ * XSM.
+ */
+#define XEN_DOMCTL_ALTP2M_mixed      (1U)
+/* Enable altp2m external mode. */
+#define XEN_DOMCTL_ALTP2M_external   (2U)
+/* Enable altp2m limited mode. */
+#define XEN_DOMCTL_ALTP2M_limited    (3U)
+/* Altp2m mode signaling uses bits [0, 1]. */
+#define XEN_DOMCTL_ALTP2M_mode_mask  (0x3U)
+#define XEN_DOMCTL_ALTP2M_mode(m)    ((m) & XEN_DOMCTL_ALTP2M_mode_mask)
+    uint32_t altp2m_opts;
+
     /* Per-vCPU buffer size in bytes.  0 to disable. */
     uint32_t vmtrace_size;
 
diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
index a22b4ed45d2e..99c40b4287f1 100644
--- a/xen/include/public/hvm/params.h
+++ b/xen/include/public/hvm/params.h
@@ -246,16 +246,11 @@
 #define HVM_PARAM_VM_GENERATION_ID_ADDR 34
 
 /*
- * Set mode for altp2m:
- *  disabled: don't activate altp2m (default)
+ * Get mode for altp2m:
+ *  disabled: altp2m not active (default)
  *  mixed: allow access to all altp2m ops for both in-guest and external tools
  *  external: allow access to external privileged tools only
  *  limited: guest only has limited access (ie. control VMFUNC and #VE)
- *
- * Note that 'mixed' mode has not been evaluated for safety from a
- * security perspective.  Before using this mode in a
- * security-critical environment, each subop should be evaluated for
- * safety, with unsafe subops blacklisted in XSM.
  */
 #define HVM_PARAM_ALTP2M       35
 #define XEN_ALTP2M_disabled      0
-- 
2.44.0


