Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB78FAF042A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 21:54:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029943.1403655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWh3y-0000FB-56; Tue, 01 Jul 2025 19:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029943.1403655; Tue, 01 Jul 2025 19:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWh3y-0000DV-1q; Tue, 01 Jul 2025 19:54:42 +0000
Received: by outflank-mailman (input) for mailman id 1029943;
 Tue, 01 Jul 2025 19:54:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u5am=ZO=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uWh3x-0000D0-79
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 19:54:41 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38d8a3f5-56b5-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 21:54:39 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45362642f3bso8203555e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 12:54:39 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7e9d1csm14291644f8f.13.2025.07.01.12.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 12:54:37 -0700 (PDT)
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
X-Inumbo-ID: 38d8a3f5-56b5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751399678; x=1752004478; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7PeFG4j0+6wg/8x4w0BGJXrwiGp05DFafVuw1va9HQ=;
        b=ECeRJY62+x9nWP83c41llj4YFl4IM4+WFXr3X2Dd+8EdjSFM1Kqexascw13qJMWrV3
         +I/dZdxUanmuRMvVNJ/K6spMiodOxRGGkildHNfk7FHjA5XKhq6N9GehyS9saz0XNKRD
         zgMRZpo7yY2Gb8+/O6B/nhKaCpiOJcmx8xOSd10j2eKCbvCRCkDC9/L/41GlzFt068FQ
         cV9nl0x5cB9FPRNVeoesO+EoSpD71vY5IqsGyQmCxfSstxUWlgVAj8J/a8zzMNPekk6J
         QtZFyRsY9L2Ct8go0Qbx2zcQrcIECOaJ27F11c6s4qdnw+4UvYkAeORhXP4VsJETKk+0
         Ub4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751399678; x=1752004478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7PeFG4j0+6wg/8x4w0BGJXrwiGp05DFafVuw1va9HQ=;
        b=gwMfQQFjET/GtX2Cf1A1psx7Ie3fJE64KypQVAiF4w04GXHzlrzwhWn1tdJ+A8ahUt
         uZjb5XFj4nV9B6+ZpFkBOkZ+o22KntInmHpaQnfwuWokaLY90z4mUYUkInHaw6wOOoHg
         6W7+LTER9Ua9iHOZo5+hADxRXaTS4wz3iXeXf4/Zpu3vVLUl8hiRh3Brg3fFoT4E1ZIy
         ccKk5b33FJ6d1Y2/7MJkKX513bSbZ8cTohI9pVu+CeJwFaqE2oN40O3WQmVF24U/LNqa
         iNiLHrfkA+/eZrOfgSUZXHSLI9h2VEp+pE2cpfQYO70N7mdxaewMipf0cip+CSQcRV5m
         H69g==
X-Gm-Message-State: AOJu0YwHvkkizHHGLa8wabOKNlLnDMKxbLjQEC2odyPOE8t3fpABEVIP
	+0k50R8P05Bxf98AZG+CcajwMwDpyBPHJ1CnUr18lF7pbay0C4/Pb/SZD6RG0A==
X-Gm-Gg: ASbGnctyQXQhEuKEj39cM1lNWo3+4u4kw3ZrV94c+4O0ra0Oj893qU2dRHsbuEjdh8E
	g60nn8iNEKaCJ1D+Ptx10XRo4a2wpp1MZQLdAIz30txuDGEzyHcvlBYSet7j/jSs40m+Ho+7/KY
	rzEGNq53Tdqt7QfEMcHzd0pjZlwbK3vpmdJyVv+mVbQFrZiZ35folRfzv8Y+/aD7yPA41IK5F4Y
	vm+i6o1WA/i624qqD3633ciiJNEWogjn6XI7uDrlT3PvgIGKmYu3GnI/tD9qT8gnV0y/ABboc/J
	48qEyi0SSvVxj3I83onMyInfIoJqpFHKy8+7cAeOjFOsqxfp/LCttq3dt5N8IHK6n8l3zXsRq26
	styWDYMTympeBrRCso2FWdQoRHQ93iEH8o8/sJTRSeNq3zk3cxhQC0rIjPb8jqQ==
X-Google-Smtp-Source: AGHT+IFmZWVWUaqiRen1DgrZdhU0MlS1yST6+M+EjNqhMxIAw+nMfyfVsHuzAkH1f5VXRnCrd7HKrg==
X-Received: by 2002:a05:6000:18a9:b0:3a5:3399:51b1 with SMTP id ffacd0b85a97d-3af24e18458mr1776818f8f.6.1751399678131;
        Tue, 01 Jul 2025 12:54:38 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Christian Lindig <christian.lindig@cloud.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v7 1/7] xen: Refactor altp2m options into a structured format
Date: Tue,  1 Jul 2025 19:54:23 +0000
Message-Id: <b15a2ae82d79e6cded837733725384b9ecd07a85.1751397919.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1751397919.git.w1benny@gmail.com>
References: <cover.1751397919.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Encapsulate the altp2m options within a struct. This change is preparatory
and sets the groundwork for introducing additional parameter in subsequent
commit.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
Acked-by: Christian Lindig <christian.lindig@cloud.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
Acked-by: Julien Grall <jgrall@amazon.com> # arm
Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor
---
 tools/libs/light/libxl_create.c     | 6 +++---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 4 +++-
 xen/arch/arm/domain.c               | 2 +-
 xen/arch/x86/domain.c               | 4 ++--
 xen/arch/x86/hvm/hvm.c              | 2 +-
 xen/include/public/domctl.h         | 4 +++-
 6 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 9525d22312..8a85fba1cf 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -622,17 +622,17 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
         LOG(DETAIL, "altp2m: %s", libxl_altp2m_mode_to_string(b_info->altp2m));
         switch(b_info->altp2m) {
         case LIBXL_ALTP2M_MODE_MIXED:
-            create.altp2m_opts |=
+            create.altp2m.opts |=
                 XEN_DOMCTL_ALTP2M_mode(XEN_DOMCTL_ALTP2M_mixed);
             break;
 
         case LIBXL_ALTP2M_MODE_EXTERNAL:
-            create.altp2m_opts |=
+            create.altp2m.opts |=
                 XEN_DOMCTL_ALTP2M_mode(XEN_DOMCTL_ALTP2M_external);
             break;
 
         case LIBXL_ALTP2M_MODE_LIMITED:
-            create.altp2m_opts |=
+            create.altp2m.opts |=
                 XEN_DOMCTL_ALTP2M_mode(XEN_DOMCTL_ALTP2M_limited);
             break;
 
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 863ab3c778..b51fd66788 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -225,7 +225,9 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 		.max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
 		.grant_opts =
 		    XEN_DOMCTL_GRANT_version(Int_val(VAL_MAX_GRANT_VERSION)),
-		.altp2m_opts = Int32_val(VAL_ALTP2M_OPTS),
+		.altp2m = {
+			.opts = Int32_val(VAL_ALTP2M_OPTS),
+		},
 		.vmtrace_size = vmtrace_size,
 		.cpupool_id = Int32_val(VAL_CPUPOOL_ID),
 	};
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index be58a23dd7..79a144e61b 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -693,7 +693,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( config->altp2m_opts )
+    if ( config->altp2m.opts )
     {
         dprintk(XENLOG_INFO, "Altp2m not supported\n");
         return -EINVAL;
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index b67342797f..56c3816187 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -622,7 +622,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     bool hap = config->flags & XEN_DOMCTL_CDF_hap;
     bool nested_virt = config->flags & XEN_DOMCTL_CDF_nested_virt;
     unsigned int max_vcpus;
-    unsigned int altp2m_mode = MASK_EXTR(config->altp2m_opts,
+    unsigned int altp2m_mode = MASK_EXTR(config->altp2m.opts,
                                          XEN_DOMCTL_ALTP2M_mode_mask);
 
     if ( hvm ? !hvm_enabled : !IS_ENABLED(CONFIG_PV) )
@@ -709,7 +709,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( config->altp2m_opts & ~XEN_DOMCTL_ALTP2M_mode_mask )
+    if ( config->altp2m.opts & ~XEN_DOMCTL_ALTP2M_mode_mask )
     {
         dprintk(XENLOG_INFO, "Invalid altp2m options selected: %#x\n",
                 config->flags);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 056360d5fe..56c7de3977 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -665,7 +665,7 @@ int hvm_domain_initialise(struct domain *d,
     d->arch.hvm.params[HVM_PARAM_TRIPLE_FAULT_REASON] = SHUTDOWN_reboot;
 
     /* Set altp2m based on domctl flags. */
-    switch ( MASK_EXTR(config->altp2m_opts, XEN_DOMCTL_ALTP2M_mode_mask) )
+    switch ( MASK_EXTR(config->altp2m.opts, XEN_DOMCTL_ALTP2M_mode_mask) )
     {
     case XEN_DOMCTL_ALTP2M_mixed:
         d->arch.hvm.params[HVM_PARAM_ALTP2M] = XEN_ALTP2M_mixed;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index be19ab5e26..a69dd96084 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -99,6 +99,7 @@ struct xen_domctl_createdomain {
 
     uint32_t grant_opts;
 
+    struct {
 /*
  * Enable altp2m mixed mode.
  *
@@ -115,7 +116,8 @@ struct xen_domctl_createdomain {
 /* Altp2m mode signaling uses bits [0, 1]. */
 #define XEN_DOMCTL_ALTP2M_mode_mask  (0x3U)
 #define XEN_DOMCTL_ALTP2M_mode(m)    ((m) & XEN_DOMCTL_ALTP2M_mode_mask)
-    uint32_t altp2m_opts;
+        uint32_t opts;
+    } altp2m;
 
     /* Per-vCPU buffer size in bytes.  0 to disable. */
     uint32_t vmtrace_size;
-- 
2.34.1


