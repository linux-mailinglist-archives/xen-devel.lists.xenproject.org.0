Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F3BAC9080
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:47:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001143.1381349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL05J-0003hl-QJ; Fri, 30 May 2025 13:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001143.1381349; Fri, 30 May 2025 13:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL05J-0003fF-N4; Fri, 30 May 2025 13:47:45 +0000
Received: by outflank-mailman (input) for mailman id 1001143;
 Fri, 30 May 2025 13:47:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+LO9=YO=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uL05I-0003C4-N2
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:47:44 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8c9e97f-3d5c-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 15:47:42 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-55220699ba8so2574905e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 06:47:42 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55337937969sm705640e87.250.2025.05.30.06.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 06:47:40 -0700 (PDT)
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
X-Inumbo-ID: a8c9e97f-3d5c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748612862; x=1749217662; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVgh0SoUJST6Z4C5PYzlBQVTsTLNYMSpbmKjhpZjOQk=;
        b=EuiocdVm46LDh8aV5fAzLUZ1sBdZwNbewSyheBJad/F0q5j64uUX8ML+p94N1wUJ7c
         SpJpMIQqRRhVFtGRvkygZ4Gdc5gVNhH2RABJ/KfkTabgAIxM97C3x1eu4fbP8GmvDDIg
         X+HwoQVdQmtgMoibIdZ08UETXaZ8J6ry8HJEGS0yj5MTS8/tW2jbf/h0vrsjFkq+pqGH
         8zzMVzVpzNLsd+tKcEIiMrrrVKtuy+E9JYgxLm3JhJ5FxzSOC3ABmIN38mPVHm313XP4
         OcVkmrVn+CkRosks9+qFhGFePRUuI7/2UaZpZyfJvXjZVGkuDLdFTsiXhtH82JC3U/+c
         zSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748612862; x=1749217662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVgh0SoUJST6Z4C5PYzlBQVTsTLNYMSpbmKjhpZjOQk=;
        b=ffxPmN+oQ9Y9mO/9CTONpzZgN89YtdQrxj3PhPT0WM27x7vSUOhyRPLSw17vuF0EIw
         tOKTIOEHgxk58c/cFQw40CXZ3paS+aI95sirz1kO7dSxi5vzDsJ648/LIyyBnCtwvpEH
         sd0C2NYu5Gnx1sIF9/kq7qnnN0Ngcr9pXx3dR/d3GnpNIMB6k0po9/nGFI8JgGLKvq79
         Kxfe9i1GvceQwoIOg3oZW3MLvrkIOXS55LOVVOUVBGXzBN65P3sY7EwAZ0//I3HLiVfP
         Okn/r+rIyWxJ6tglr/P7+4REgpqaxREZhLA983SafOvrqd0223wszgmQ/yeS0eohwa5b
         cZfA==
X-Gm-Message-State: AOJu0YxMwsWSjQaQossP0YOoTESJA0bIPSnf0AJBmR5P1AnafjiCKFP/
	hcvT8fDcOhkoR+slDBk1sCp3I/Jdkd2i4lNEpZkjI6D7QFVJN31kH7mkh2EeLhQSfa0=
X-Gm-Gg: ASbGncvfjxfIJilgEXT6LWq3mOxyhlZvIovOozMxhMY8dS5e7ddxrEGzqVlALFDG86g
	ljqeQZtH7yfgGxG6nwdLsMhZifErQG7mDmn/7ED0zbh0W4YrlCsvxhE/QP1l+WuT9QJTGQyJbkB
	S5R6LgbQVRaGQX77zFjK5y8hVEHtEJSDxiIe7apqGeG5/C+YXYfY68Z5j8TsCSFewRtYZLGQtFE
	+sMZQ6vuRc8UQK+cEhRKyqYQ7lVraHVOEXHfUsjDGMsZ7HXXpwtwNtTqeUdyvX3fcI9WLNyoHj9
	47YZd26mVhijEZFwn3OdC6aQDJRHCEQ9ihC8iX30xMYcvSqHUuelRwiG7xpXtDsnK5LPP20IlvJ
	tJQNc3SS2gwdZaVTIl1+M+4VcBOpTdUmC2A==
X-Google-Smtp-Source: AGHT+IFUW6B/AUa55ZywDEqLJ2dAxoQUeFzy75qIGV0ozfBH88f6kccQ7rcy/j/8EsPHaab6CP2w2Q==
X-Received: by 2002:a05:6512:31cd:b0:553:297b:3d4e with SMTP id 2adb3069b0e04-5533d1b80f9mr792609e87.52.1748612861562;
        Fri, 30 May 2025 06:47:41 -0700 (PDT)
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
Subject: [PATCH v3 1/5] xen/arm: Add way to disable traps on accesses to unmapped addresses
Date: Fri, 30 May 2025 15:45:55 +0200
Message-ID: <20250530134559.1434255-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
References: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
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
 xen/arch/arm/io.c             | 37 +++++++++++++++++++++++++++++++++--
 xen/common/domain.c           |  3 ++-
 xen/include/public/domctl.h   |  4 +++-
 7 files changed, 50 insertions(+), 6 deletions(-)

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
index 5a4b0e8f25..e599bbe043 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -21,6 +21,32 @@
 
 #include "decode.h"
 
+/* Handler for unmapped ranges. Writes ignored, reads return all ones.  */
+static int unmapped_read(struct vcpu *v, mmio_info_t *info, register_t *r,
+                         void *priv)
+{
+    uint64_t mask = GENMASK((1U << info->dabt.size) * 8 - 1, 0);
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
@@ -175,11 +201,18 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
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
+        } else {
+            return rc;
+        }
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


