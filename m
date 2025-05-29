Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B083AC8083
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 17:50:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000010.1380451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKfWa-00075b-Fa; Thu, 29 May 2025 15:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000010.1380451; Thu, 29 May 2025 15:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKfWa-00072M-CM; Thu, 29 May 2025 15:50:32 +0000
Received: by outflank-mailman (input) for mailman id 1000010;
 Thu, 29 May 2025 15:50:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vnej=YN=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uKfWY-0006oV-7v
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 15:50:30 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a55c7f23-3ca4-11f0-a2ff-13f23c93f187;
 Thu, 29 May 2025 17:50:29 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-553280c345cso1424160e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 May 2025 08:50:29 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a85bd29a2sm2999991fa.105.2025.05.29.08.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 08:50:27 -0700 (PDT)
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
X-Inumbo-ID: a55c7f23-3ca4-11f0-a2ff-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748533828; x=1749138628; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbUTwQzmmaewl5uonTpiY2JHveYiify6lhAK/r8MJhY=;
        b=NIyUr3hApuoG9OW/Ee9j8PxmzIQZmPpJIc8sFX6zKW7WdYtMn85jpX5udTJiZQfUy9
         gP/7lkRMdZoOJGWOBz9tAnc+B7In4Uq6jXUyv+OT/UWgVN4QJ7mcZNLBGvWx7ZaHwXdz
         89QB2JQqYPNvNCvvVmSEAD3xnKJoA42XHOXK5AtX3uOsYyYtRqHvXLefdaBjayXMBnxU
         wEXY9R/zyNYLMCwKYz5jkWWAD+yTL3krALxLzatbiR+5VqxaKEFCvZxSb24HvGpExp6w
         B/0ITfuydYKESfjSHr1WM+GFZncsaVDb94bSYb7L+MsqzaYHm+IAkN1B4qfhEbVy5yOH
         Xnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748533828; x=1749138628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbUTwQzmmaewl5uonTpiY2JHveYiify6lhAK/r8MJhY=;
        b=f+Rz1B7f1QwX1eBaTzaGepFRgc+yWiH+y+BieZlmnvutXZtYDsfWy+JUUGSRbq4tbh
         6Ys2Dqi7UiO+STaQQmB/v9OGvGybphH7y2JJP/X7ZOey5L8xN7VsVjzys76LU7YksZAK
         DD+HQZ94SRSSRxEG3M5rzxCWAAvk0aDnplve75bwlMYkjunOr3dkNGGS6w6lIAUJMAVU
         FcD869fcYrEv5JRcawEHjgD2Xo95YwdFzCaBYjtbRVM3/+IMMLyeoslDmUlm3xHfeRCw
         TTkX38HQEIq9iTWOgMe/cG70e+Q5yGsKjzBVr8nedRgxh1ZucWRsHcjRyJLQwEKCcLyw
         VrUw==
X-Gm-Message-State: AOJu0YzY6eZyxETsBK42fNVedSS4+G+6WDowy57wh3rDnMpCWzUHRWFa
	IAhKrZupsDk14uB+npTPK56HgWOYKDFY6fJYLLumnGKN6WOIfl8ZDmfFJLZwDxX+Prc=
X-Gm-Gg: ASbGncvut19UwwSCYl9vD9uZ7zsvh+OC7wCNSBCz9ioOIFF8t8gJoDiCGKeQDbzx7rA
	aCOhimfqZ5sFiP9H5rdNjM12PFTIm6Et52nMp9pxVEg9oh2tnfQylPWbMqGtzr2HAZ6xplXA9i9
	CffCnL40rAU4gue9fl0wuOXap86nMVs3zYY+HR3luw54ATceZcd7dDp0yL580HjoVzxNz5COxR7
	bjjFaXKwvwSiKfphwVS22tt70ov2r/Mkl9bo4p3P3v6ZKDMc7XHiTZhbXcX3b+8NqBAInz+Y6tU
	PiaZAMDWSZWKx2F7KV3fjm/Y5rKsWj34ZF8jY1ndHumEeOGkz7eI8/BgmDDIVEu9GncecHXM1tD
	/aUsAl9WbMT9VyGFIkAdIuFvlBJgvt0dEKQ==
X-Google-Smtp-Source: AGHT+IFscQ5zcDBfHcEEPM38Enf5fSV1b5NR14i4xCcjg/PtOY1YU11OlIFSUtrqUXzo2hAB0uU6BQ==
X-Received: by 2002:a2e:a545:0:b0:32a:749a:14d4 with SMTP id 38308e7fff4ca-32a8cd46753mr1204501fa.12.1748533828080;
        Thu, 29 May 2025 08:50:28 -0700 (PDT)
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
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/3] xen/arm: Add way to disable traps on accesses to unmapped addresses
Date: Thu, 29 May 2025 17:50:21 +0200
Message-ID: <20250529155024.1284227-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529155024.1284227-1-edgar.iglesias@gmail.com>
References: <20250529155024.1284227-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add a per-domain way to optionally disable traps for accesses
to unmapped addresses.

The domain flag is general but it's only implemented for ARM for now.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 tools/libs/light/libxl_arm.c  |  3 +++
 xen/arch/arm/dom0less-build.c |  3 +++
 xen/arch/arm/domain.c         |  3 ++-
 xen/arch/arm/domain_build.c   |  3 ++-
 xen/arch/arm/io.c             | 36 +++++++++++++++++++++++++++++++++--
 xen/common/domain.c           |  3 ++-
 xen/include/public/domctl.h   |  4 +++-
 7 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 75c811053c..9530996e72 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -233,6 +233,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
     }
 
+    /* Trap accesses to unmapped areas. */
+    config->flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
+
     return 0;
 }
 
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index a49764f0ad..a4e0a33632 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -343,6 +343,9 @@ void __init arch_create_domUs(struct dt_device_node *node,
         panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n");
 #endif
     }
+
+    /* Trap accesses to unmapped areas. */
+    d_cfg->flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
 }
 
 int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 45aeb8bddc..be58a23dd7 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -612,7 +612,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     unsigned int max_vcpus;
     unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
     unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
-                                   XEN_DOMCTL_CDF_xs_domain );
+                                   XEN_DOMCTL_CDF_xs_domain |
+                                   XEN_DOMCTL_CDF_trap_unmapped_accesses );
     unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
 
     if ( (config->flags & ~flags_optional) != flags_required )
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b189a7cfae..7ff9c1b584 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2003,7 +2003,8 @@ void __init create_dom0(void)
 {
     struct domain *dom0;
     struct xen_domctl_createdomain dom0_cfg = {
-        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
+                 XEN_DOMCTL_CDF_trap_unmapped_accesses,
         .max_evtchn_port = -1,
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 5a4b0e8f25..adfc822e7e 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -21,6 +21,32 @@
 
 #include "decode.h"
 
+/* Handler for unmapped ranges. Writes ignored, reads return all ones.  */
+static int unmapped_read(struct vcpu *v, mmio_info_t *info, register_t *r,
+                         void *priv)
+{
+    uint64_t mask = GENMASK_ULL((1U << info->dabt.size) * 8 - 1, 0);
+
+    /* Mask off upper bits.  */
+    *r = UINT64_MAX & mask;
+    return 1;
+}
+
+static int unmapped_write(struct vcpu *v, mmio_info_t *info, register_t r,
+                          void *priv)
+{
+    return 1;
+}
+
+static const struct mmio_handler_ops unmapped_ops = {
+    .read = unmapped_read,
+    .write = unmapped_write
+};
+
+static const struct mmio_handler unmapped_handler = {
+    .ops = &unmapped_ops
+};
+
 static enum io_state handle_read(const struct mmio_handler *handler,
                                  struct vcpu *v,
                                  mmio_info_t *info)
@@ -175,11 +201,17 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
     handler = find_mmio_handler(v->domain, info->gpa);
     if ( !handler )
     {
+        bool trap_unmapped = v->domain->options &
+                                         XEN_DOMCTL_CDF_trap_unmapped_accesses;
         rc = try_fwd_ioserv(regs, v, info);
         if ( rc == IO_HANDLED )
             return handle_ioserv(regs, v);
-
-        return rc;
+        else if ( rc == IO_UNHANDLED && !trap_unmapped )
+        {
+            /* Fallback to the unmapped handler. */
+            handler = &unmapped_handler;
+        } else
+            return rc;
     }
 
     /*
diff --git a/xen/common/domain.c b/xen/common/domain.c
index abf1969e60..ac4f58f638 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -721,7 +721,8 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
-           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
+           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
+           XEN_DOMCTL_CDF_trap_unmapped_accesses) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 5b2063eed9..be19ab5e26 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -66,9 +66,11 @@ struct xen_domctl_createdomain {
 #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
 /* Should we expose the vPMU to the guest? */
 #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
+/* Should we trap guest accesses to unmapped addresses? */
+#define XEN_DOMCTL_CDF_trap_unmapped_accesses  (1U << 8)
 
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
+#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_trap_unmapped_accesses
 
     uint32_t flags;
 
-- 
2.43.0


