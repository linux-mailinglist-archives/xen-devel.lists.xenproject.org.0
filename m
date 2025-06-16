Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC714ADB5A2
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 17:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017388.1394382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRBuy-0001Lz-B8; Mon, 16 Jun 2025 15:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017388.1394382; Mon, 16 Jun 2025 15:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRBuy-0001JS-7O; Mon, 16 Jun 2025 15:38:40 +0000
Received: by outflank-mailman (input) for mailman id 1017388;
 Mon, 16 Jun 2025 15:38:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m/Gb=Y7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uRBuw-00015n-Dv
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 15:38:38 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f89c73eb-4ac7-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 17:38:38 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so527585f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 08:38:37 -0700 (PDT)
Received: from gmail.com (140.red-213-97-47.staticip.rima-tde.net.
 [213.97.47.140]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b09148sm11779613f8f.58.2025.06.16.08.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 08:38:35 -0700 (PDT)
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
X-Inumbo-ID: f89c73eb-4ac7-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750088317; x=1750693117; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpI3a3sfosj6hNi+fZow0piF9JHawLB1mde24/Cy8co=;
        b=X87z35S/RtddYuqQBFO/9HPGLYiabeffbNdbXteeNq6HIXRemxo3S2lGY/9+0rOjdl
         gPijxIOgSZtk4WsOMW7436dkKwEbHTWGgX5xqdSnHdfu81GRkZnZ6Q6zx41TDcT03UDP
         Lsjj3GghCHc2K3TnLQ6paFDC9SACy8Tlofmf9+kQG31Y8enQifCxDKx7CbbMb/Ss2dD/
         yZ9HFbLyrlp5LMEYbys62nuJ9y8+EwsdV/l3ngmIUap0FzZDjcybQH+Az7SOaUOGnBYi
         BMW5pA3h65Hvy3Ug4NAK9Kkp8QrOtqRYloClh33RMvIsI1OS4R5i6HVWJ/bpB+YYPQ1p
         /wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750088317; x=1750693117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpI3a3sfosj6hNi+fZow0piF9JHawLB1mde24/Cy8co=;
        b=xHe89ltgyEMyjA2O2dhT/QoDVOGvFzZ7Zeho+XLAUcRQu3iD52UcKsEkI17Ax78FhF
         TLu2pk4VolORzxPIkOo7NFFDU2M9nGy1g7OZBBNHlwG8mFiQqNECg93lWsLjA+SqS6pP
         L2S4P/63mnopjE1GhzvSYbzvuWQdaLIZCbfqqAlXIRPLSwLrjfwJ5wXLJZW7qU7V6gmi
         5xwqYcxS5aSsuZAX7SNrgAi02COY2w+dIoFfD8EG0RpfdiyuJm+DBdDG0QgqUOaqMU4w
         HYI++wnqOSCSb05DRtD+YFK/Z+sTFIcXf4kg6yQrdnMMu18Dh4WhqVYugoTnNSqEQtc2
         Dlxg==
X-Gm-Message-State: AOJu0Yz94maqxqOI/emN25Q9BV4LtcJkzhOJUt8NoJ0qXmNZ3XXb5KG7
	1Z4gukz+BLolLNE87fRWFIBlIF9Htcw8sDkRC6W0vdWWNb6L+/o9blDADsfaiRvmJWc=
X-Gm-Gg: ASbGncuOXRacPrMjm9nZHaGNsXPEUvtf3wSY2LmhihhZpzY+rAzriwWPzopQJf3PUla
	DH2OFsJDvu7/nq76yo7yZUuIR2tlE+msaT3ZWILEt9uZowFhRt9g7I7hRUFWa/00F+3v94Kv5so
	0hO4FkkoJXTcGBCG1qV9HJEFG26jZOVxctr+NBTGF8xS5gG3974sGX105WOiElZ47ImqfRk6T5s
	kOI9jqc3gOl4AcybpbX4Nfa+Vx0LWLFK2AHo1AsiwWP2uTyI4RrXWk6F3JuZsrpSv1cQyRrhl3B
	1br1SS/3rnwRGOTaMsI2TEkSXgZkqEdh21HU3M0WntbCSDimo3vf4ArC1fgzWfalMVCB8ojpuOn
	mKD6mwl1sBnFHX6d8wijaxq2LXjs26MnPYWOJRO02nOg=
X-Google-Smtp-Source: AGHT+IF7g9I61RmL20l+sNDoyY4icyG3G2rAgFLlGyf5RJWDQO30wiYD+Fw8Uv35X83UdC90RN6j+A==
X-Received: by 2002:a05:6000:288a:b0:3a5:3a3b:6a3a with SMTP id ffacd0b85a97d-3a572e5856amr8231804f8f.54.1750088316645;
        Mon, 16 Jun 2025 08:38:36 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	rosbrookn@gmail.com,
	gwd@xenproject.org,
	edgar.iglesias@amd.com,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 1/5] xen/arm: Add way to disable traps on accesses to unmapped addresses
Date: Mon, 16 Jun 2025 17:38:22 +0200
Message-ID: <20250616153826.404927-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616153826.404927-1-edgar.iglesias@gmail.com>
References: <20250616153826.404927-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add a per-domain way to optionally disable traps for accesses
to unmapped addresses.

The domain flag is general but it's only implemented for Arm for now.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 tools/libs/light/libxl_arm.c  |  3 +++
 xen/arch/arm/dom0less-build.c |  3 +++
 xen/arch/arm/domain.c         |  3 ++-
 xen/arch/arm/domain_build.c   |  3 ++-
 xen/arch/arm/io.c             | 37 +++++++++++++++++++++++++++++++++--
 xen/arch/x86/domain.c         |  7 +++++++
 xen/common/domain.c           |  3 ++-
 xen/include/public/domctl.h   |  4 +++-
 8 files changed, 57 insertions(+), 6 deletions(-)

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
index 20aabf6be5..981af5079f 100644
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
index 590f38e520..845c92614b 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1971,7 +1971,8 @@ void __init create_dom0(void)
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
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 7536b6c871..fb7aea9168 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -713,6 +713,13 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         }
     }
 
+    if ( config->flags & XEN_DOMCTL_CDF_trap_unmapped_accesses )
+    {
+        dprintk(XENLOG_INFO, "Unsupported trap_unmapped_accesses flag %#x\n",
+                config->flags);
+        return -EINVAL;
+    }
+
     if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
     {
         dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
diff --git a/xen/common/domain.c b/xen/common/domain.c
index e566a18747..434d32901b 100644
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


