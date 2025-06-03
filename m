Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A2AACC993
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 16:50:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004558.1384293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSxg-0006HC-MD; Tue, 03 Jun 2025 14:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004558.1384293; Tue, 03 Jun 2025 14:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSxg-0006F4-FJ; Tue, 03 Jun 2025 14:49:56 +0000
Received: by outflank-mailman (input) for mailman id 1004558;
 Tue, 03 Jun 2025 14:49:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4WdC=YS=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uMSxe-00060n-Ew
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 14:49:54 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 026192d2-408a-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 16:49:54 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5532f9ac219so6451492e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 07:49:53 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55350cab690sm450194e87.53.2025.06.03.07.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 07:49:51 -0700 (PDT)
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
X-Inumbo-ID: 026192d2-408a-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748962192; x=1749566992; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ob3NsRzu/zCymMrGjnHAxZ8pg1NKaHtYVDfNAqbwUHM=;
        b=hTaRQz4yfHvsrf2w+aDot75LJs2aMl93grs+cPErncdF2GeEyF7V87fqtS1Rm2t+BA
         8UhEkdcUzASB5rxzbKxaBUq7bnMpcFtxRRBor3om0cCW/PEu9XaQM9ro5ZRc/sfnMyPC
         /0MgBJjhKf1S4daNNEPTBsCkhzaQFb1sic8R8zZt+B3flDVqtLtUF97ov0R2aa1VQZiN
         zHqkGfgE5lqhOs73vsX68Sr6uEEGFKJECwmJWg/oI+Z/nCP/o2dUwniHKUsAVg96xWtv
         N2eo0scE/LQlvjNVJJoS4mFYLSjvQ2MYMcj+oaG67zYIhSWjZDnXQDeEwD17BcN5vFcc
         mkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748962192; x=1749566992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ob3NsRzu/zCymMrGjnHAxZ8pg1NKaHtYVDfNAqbwUHM=;
        b=PSbrK/rYao85pApEvv8gJ5k5PLqb1btZ0bN4LyJqBvapD8eqCaOvVLfPgmQpatuZiD
         CMrnZ+dL7R3mPFwmpc5IHvDMhjYt8xhwmh2umjJFaDMknNAp2n8qCtIpXNll1SV/jT5S
         8BhYQuKhEf34IfxTcvYnMr7Wsbq04ihS6W/xG2wx6oJL6LhuK8TPv0v45HmO4fgCdox0
         2uNsREYwmCTodYWZTujjYsF5QPBQgMFB52ZuL4qp4ecbyD/8P9tG7kecH0HBOJDWL2xh
         WMXFWeiGhq7zo+X3hAMFX5NP90z27HutmCNRYCA6eLd6/Kdrg4LUQldvzERKlEMP1FaQ
         Tlkw==
X-Gm-Message-State: AOJu0Ywt/3viN6ia6scl3RxnC3bJZXsENHaqUi8qIfmqHXtODYripqj1
	+dJV+QZwBnQV4vclmILDRxs/0mrQl6KydPGNfPVIfWLrovDDpacUcx9lUyJvkssiDb0=
X-Gm-Gg: ASbGncveeiH5xL9l7DRiKa584SUxZpHUaT3DLGydpD6m7UcLL63y5ENeFPKwIMMgOrL
	CN0ai1m/8bKg72qe9bWAP+KHSGyHfrtUz6UGX9q0Ex6QqCZDxxmW66FORi3u2DXBfb+QeIyPWbv
	qdj3lYLMCNA+r+j6fDY6fNod8zPsKmHkj7JfFS/YaYbQeutNIVTJuGzqzf0qXerxHW4ekJzNQRO
	YKJNKu6m6wg0FMJSoo8GbNWT/l9ftyRFWJOCGNSD8i46qAWDaSGpX7BvLVY/kinTbHR/ooFkHm0
	Lnyh7Pji8kzyyYnVfTaUNNJjqhkNsfhrtLQ/MVsfGuJ4NySkSa9T6+y1/otlc6Fyk7+vHjVNYVT
	7XUWpb6TXd/Ij4QXSaAEUr02ZC9ZsS+3WJw==
X-Google-Smtp-Source: AGHT+IHxB3yc+PX4HInj97eKzz3f2laol/ruQa1wNgVYs/4yCuKsO7cr4MEEkK4HJzdxdQQodqiLvw==
X-Received: by 2002:ac2:4c4a:0:b0:553:2418:8c0c with SMTP id 2adb3069b0e04-5533b93b8e2mr5131186e87.57.1748962192301;
        Tue, 03 Jun 2025 07:49:52 -0700 (PDT)
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
Subject: [PATCH v4 1/5] xen/arm: Add way to disable traps on accesses to unmapped addresses
Date: Tue,  3 Jun 2025 16:49:44 +0200
Message-ID: <20250603144948.1685047-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250603144948.1685047-1-edgar.iglesias@gmail.com>
References: <20250603144948.1685047-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add a per-domain way to optionally disable traps for accesses
to unmapped addresses.

The domain flag is general but it's only implemented for Arm for now.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
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


