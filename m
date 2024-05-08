Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA548BFBF0
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 13:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718736.1121246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4fRv-00058G-Kf; Wed, 08 May 2024 11:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718736.1121246; Wed, 08 May 2024 11:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4fRv-00054h-Ft; Wed, 08 May 2024 11:27:03 +0000
Received: by outflank-mailman (input) for mailman id 718736;
 Wed, 08 May 2024 11:27:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0je0=ML=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s4fRt-0004oy-EX
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 11:27:01 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e238001f-0d2d-11ef-b4bb-af5377834399;
 Wed, 08 May 2024 13:26:59 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a59c04839caso957236066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 04:26:59 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 g13-20020a1709063b0d00b00a59a17eb5d2sm5787521ejf.222.2024.05.08.04.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 04:26:57 -0700 (PDT)
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
X-Inumbo-ID: e238001f-0d2d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715167618; x=1715772418; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9za8P4EPzVB+2QpoWeyBB/3pcjYoli4eAelV6qAoOM=;
        b=qhnKDssikiMPAbClzmJF0xaAbBBhToVoBGTVaTz87+0kg8G/0CRpwP7h6jLXoVQwaP
         nDzjZwWZETgqTEbONM18j6IHb7ncGwqHsfYDHuMlwPWYX8lEAPeo7PaypxdF2hxpoIkI
         YpMKIGMdTlh3gKr0tMYc0Kird6poGUoB8jmC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715167618; x=1715772418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9za8P4EPzVB+2QpoWeyBB/3pcjYoli4eAelV6qAoOM=;
        b=l862eFv6rKCTcJNkclWffhWCuH16A7crw/uM7zJY/0jdb6x0aUoK+WHIgF6Ovwoow+
         MxowC5fA0OnxQ5X+5Z8bgMuDg+aS16uoldiCKdfugJ2lbG1Ixtzn2N0XPkVc7pa87kjZ
         F+rIvMqHA053pj50N0jZ1teCqxJtQEY6138fP72AuGw76CLyG7Mn7H12/pPJo4AxoRb1
         qZQ48EUUoF6wvbnEvgrcA9LEFHzOMkJngmGtnrEyobBPyiAMCriFHMewr/DAQOS8n7ro
         M7B3G//GD4cOA6LYrIRytnfRuTLF2PsXABmFhTB2GfMIa5bEV1BbAtjyDe7vxoddyFmC
         VEsQ==
X-Gm-Message-State: AOJu0YwVFrsOaJ4ZGr/ZoQQcVE9M3yILTDb2wf1ackaGXH3IAaz0acqt
	pSbfngWAqqX02J1K24cu+NXxkkcLbpP2rE9wgwohBvVbPIwZu/kXzseWzzb+d0FoJytgMTrmFMZ
	l
X-Google-Smtp-Source: AGHT+IECJsbn5pM4hjExb+nFNlRr5lvugFFZyFGIDU8Jd4fM7lAesXbatc8NcLMBMlYb2Pr8VUOoCw==
X-Received: by 2002:a17:906:f28c:b0:a59:a0eb:aeb0 with SMTP id a640c23a62f3a-a59fb952bb0mr153520466b.36.1715167617901;
        Wed, 08 May 2024 04:26:57 -0700 (PDT)
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
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH for-4.19 v2 2/3] xen/x86: enable altp2m at create domain domctl
Date: Wed,  8 May 2024 13:23:22 +0200
Message-ID: <20240508112323.38946-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240508112323.38946-1-roger.pau@citrix.com>
References: <20240508112323.38946-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enabling it using an HVM param is fragile, and complicates the logic when
deciding whether options that interact with altp2m can also be enabled.

Leave the HVM param value for consumption by the guest, but prevent it from
being set.  Enabling is now done using the misc_flags field in
xen_arch_domainconfig.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 tools/libs/light/libxl_x86.c      | 43 +++++++++++++++++++++----------
 xen/arch/x86/domain.c             | 25 +++++++++++++++++-
 xen/arch/x86/hvm/hvm.c            | 15 ++++++++++-
 xen/include/public/arch-x86/xen.h | 18 +++++++++++++
 xen/include/public/hvm/params.h   |  9 ++-----
 5 files changed, 87 insertions(+), 23 deletions(-)

diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index a50ec37eb3eb..86ee8132536c 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -6,8 +6,21 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
                                       libxl_domain_config *d_config,
                                       struct xen_domctl_createdomain *config)
 {
+    unsigned int altp2m = d_config->b_info.altp2m;
+
     switch(d_config->c_info.type) {
     case LIBXL_DOMAIN_TYPE_HVM:
+        /*
+         * The config parameter "altp2m" replaces the parameter "altp2mhvm".
+         * For legacy reasons, both parameters are accepted on x86 HVM guests.
+         *
+         * If the legacy field info->u.hvm.altp2m is set, activate altp2m.
+         * Otherwise set altp2m based on the field info->altp2m.
+         */
+        if (altp2m == LIBXL_ALTP2M_MODE_DISABLED &&
+            libxl_defbool_val(d_config->b_info.u.hvm.altp2m))
+            altp2m = libxl_defbool_val(d_config->b_info.u.hvm.altp2m);
+
         config->arch.emulation_flags = (XEN_X86_EMU_ALL & ~XEN_X86_EMU_VPCI);
         if (!libxl_defbool_val(d_config->b_info.u.hvm.pirq))
             config->arch.emulation_flags &= ~XEN_X86_EMU_USE_PIRQ;
@@ -26,6 +39,22 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     if (libxl_defbool_val(d_config->b_info.arch_x86.msr_relaxed))
         config->arch.misc_flags |= XEN_X86_MSR_RELAXED;
 
+    if (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV) {
+        switch (altp2m) {
+        case LIBXL_ALTP2M_MODE_MIXED:
+            config->arch.misc_flags |= XEN_X86_ALTP2M_MIXED;
+            break;
+
+        case LIBXL_ALTP2M_MODE_EXTERNAL:
+            config->arch.misc_flags |= XEN_X86_ALTP2M_EXT;
+            break;
+
+        case LIBXL_ALTP2M_MODE_LIMITED:
+            config->arch.misc_flags |= XEN_X86_ALTP2M_LIMITED;
+            break;
+        }
+    }
+
     return 0;
 }
 
@@ -407,19 +436,9 @@ static int hvm_set_conf_params(libxl__gc *gc, uint32_t domid,
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
@@ -444,10 +463,6 @@ static int hvm_set_conf_params(libxl__gc *gc, uint32_t domid,
             LOG(ERROR, "Couldn't set HVM_PARAM_TIMER_MODE");
             goto out;
         }
-        if (xc_hvm_param_set(xch, domid, HVM_PARAM_ALTP2M, altp2m)) {
-            LOG(ERROR, "Couldn't set HVM_PARAM_ALTP2M");
-            goto out;
-        }
         break;
 
     default:
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 20e83cf38bbd..dff790060605 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -637,6 +637,9 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     bool hap = config->flags & XEN_DOMCTL_CDF_hap;
     bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
     unsigned int max_vcpus;
+    unsigned int altp2m = config->arch.misc_flags & (XEN_X86_ALTP2M_MIXED |
+                                                     XEN_X86_ALTP2M_EXT |
+                                                     XEN_X86_ALTP2M_LIMITED);
 
     if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
     {
@@ -708,13 +711,33 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         }
     }
 
-    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
+    if ( config->arch.misc_flags & ~XEN_X86_MISC_FLAGS_ALL )
     {
         dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
                 config->arch.misc_flags);
         return -EINVAL;
     }
 
+    if ( altp2m && (altp2m & (altp2m - 1)) )
+    {
+        dprintk(XENLOG_INFO, "Multiple altp2m options selected in flags: %#x\n",
+                config->flags);
+        return -EINVAL;
+    }
+
+    if ( altp2m && nested_virt )
+    {
+        dprintk(XENLOG_INFO,
+                "Nested virt and altp2m are mutually incompatible\n");
+        return -EINVAL;
+    }
+
+    if ( altp2m && !hap )
+    {
+        dprintk(XENLOG_INFO, "altp2m requires HAP\n");
+        return -EINVAL;
+    }
+
     return 0;
 }
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 0ce45b177cf4..f3e1b9364588 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -659,6 +659,14 @@ int hvm_domain_initialise(struct domain *d,
 
     d->arch.hvm.params[HVM_PARAM_TRIPLE_FAULT_REASON] = SHUTDOWN_reboot;
 
+    /* Set altp2m based on domctl flags. */
+    if ( config->arch.misc_flags & XEN_X86_ALTP2M_MIXED )
+        d->arch.hvm.params[HVM_PARAM_ALTP2M] = XEN_ALTP2M_mixed;
+    else if ( config->arch.misc_flags & XEN_X86_ALTP2M_EXT )
+        d->arch.hvm.params[HVM_PARAM_ALTP2M] = XEN_ALTP2M_external;
+    else if ( config->arch.misc_flags & XEN_X86_ALTP2M_LIMITED )
+        d->arch.hvm.params[HVM_PARAM_ALTP2M] = XEN_ALTP2M_limited;
+
     vpic_init(d);
 
     rc = vioapic_init(d);
@@ -4163,6 +4171,12 @@ static int hvm_allow_set_param(struct domain *d,
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
@@ -4204,7 +4218,6 @@ static int hvm_allow_set_param(struct domain *d,
     case HVM_PARAM_BUFIOREQ_PFN:
     case HVM_PARAM_IOREQ_SERVER_PFN:
     case HVM_PARAM_NR_IOREQ_SERVER_PAGES:
-    case HVM_PARAM_ALTP2M:
     case HVM_PARAM_MCA_CAP:
         if ( value != 0 && new_value != value )
             rc = -EEXIST;
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index a9a87d9b50de..bc444e7744a5 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -300,6 +300,24 @@ struct xen_arch_domainconfig {
  * doesn't allow the guest to read or write to the underlying MSR.
  */
 #define XEN_X86_MSR_RELAXED (1u << 0)
+
+/* altp2m options.  Only one can be set.
+ *
+ * Note that 'mixed' mode has not been evaluated for safety from a
+ * security perspective.  Before using this mode in a
+ * security-critical environment, each subop should be evaluated for
+ * safety, with unsafe subops blacklisted in XSM.
+ *
+ * Enable altp2m mixed mode.
+ */
+#define XEN_X86_ALTP2M_MIXED   (1U << 1)
+/* Enable altp2m external mode. */
+#define XEN_X86_ALTP2M_EXT     (1U << 2)
+/* Enable altp2m limited mode. */
+#define XEN_X86_ALTP2M_LIMITED (1U << 3)
+
+#define XEN_X86_MISC_FLAGS_ALL (XEN_X86_MSR_RELAXED | XEN_X86_ALTP2M_MIXED | \
+                                XEN_X86_ALTP2M_EXT | XEN_X86_ALTP2M_LIMITED)
     uint32_t misc_flags;
 };
 
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


