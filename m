Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD21AC5B08
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 21:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998702.1379435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK0PQ-0006wh-Ut; Tue, 27 May 2025 19:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998702.1379435; Tue, 27 May 2025 19:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK0PQ-0006tg-Qr; Tue, 27 May 2025 19:56:24 +0000
Received: by outflank-mailman (input) for mailman id 998702;
 Tue, 27 May 2025 19:56:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U5mK=YL=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1uK0PO-0006fw-S7
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 19:56:22 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9ee8c48-3b34-11f0-a2fe-13f23c93f187;
 Tue, 27 May 2025 21:56:22 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-553280c345cso1315068e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 12:56:22 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5532ee71af1sm4355e87.212.2025.05.27.12.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 12:56:19 -0700 (PDT)
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
X-Inumbo-ID: a9ee8c48-3b34-11f0-a2fe-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748375781; x=1748980581; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PW4Ul/brgurN+ahlG/LjWsE4mRdaFGlUa4ZnyTf/6ck=;
        b=bw/xY25X28E+cPcQavaGvMJAf8FI5XSin7ALy7NZHdn/AUSjuZjd4AATsf/QHh+c7v
         hNdJQV1Svwmvenii3WIOZ/+1bLWwB0p9FBbe6g+9efqpT1mMFSuQKih0dCYLIViwSw1G
         IV94JfpaseMJJdkI1NWZE7PJUNTJrpu8oeCJmWe885E3ppSr5ndmfzn01yiyyCOO53nJ
         +zM0y58S59wI0kupc+0IiF9K/sv89gxjnio6OsBe+5VgGRFcx4TxjR0CDoKt0vmejyHd
         GCvk0rKVexm+2uIos9t/FCdqVpDr5Jlgs2YYRW8RwJm25m3A/Ay2VPWX73WKf8Uc3qpW
         pzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748375781; x=1748980581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PW4Ul/brgurN+ahlG/LjWsE4mRdaFGlUa4ZnyTf/6ck=;
        b=NIp+2Q5dkuRjdl/ugDSn7IJETKfLdPIZMt1dDRhBT//trBbqzWaVJsqtSCLbTl3d26
         1W+9nzdjMrZcYbad5OEw5zdsiGfxtVjziH8MPZOD3p04vtfb0wS0nNVRR2Sq2mIhA+Zm
         P1jzWu5ml+OPEV29VSSs09ZynRMH9+1ZLMTwYwvfRufzvhLq8Gvmv3vYpAsYoRQIQ/4n
         H4eO4NmxW6wXojthmMDn1TapfGC/qU+s0/ZeUCKoOaJMDgh4IbLVa6YGSjInbqx3IkB5
         EYdhMpMd7CbZvOicFNRfBKBsXxvdNcGhdcdY1W31OaLNrFD1mlRi92LgZzqbovjzyY/X
         MEOA==
X-Gm-Message-State: AOJu0YwC3B1Jy/3sVacn574JU/hr9Lgr8A1dK+fwPwu8+NiQxm0P2bHh
	hBK/wMJk2vNkF6hMBrp0aCgjeRe/8V+GvhdQ5k2ODJ0OsJBQtDzBzOHdnDMkDFN0i2k=
X-Gm-Gg: ASbGnctaAUr7RSASOg/0jpGySVIqh67gh++EIhuN1BLglusxCHb94rUyiLGbMJA87R6
	U/VtZa0N8IkZIXCSFsff0fJUQnl7iHv6pko+27j/x0rCUhSFkPGchGWQ0JtrriDykcq1askFUgO
	cKqDIqv3qsA370JTnh5Kdwf4EtzSiKEAaVWJf/7R0IMNILihLWQiY1XxaOGR2ykzNz6IOVTHN+p
	I4k/vp6STwr2t05zxBHkFzJYgKqax6X0MR016a8FMkgN3Xsa0fRFsJKFChK/DUikjk7BFzCWAzi
	i6Kg8cWwtUKRaChvAWKMr6P59Gdilqt4iIBACTVPx8gjyg9wxAna3293CgqQwPzBjV1TU4VXzt5
	osk67u6bB7n8Uuh5uiHQpxK0=
X-Google-Smtp-Source: AGHT+IHrDm2Qy6vp9VEqaHnRTakLi2LeAuU7KzcB3N2VPuRneBPy+2xU8AZM4IMeoq4oAeVXe0vaGA==
X-Received: by 2002:a05:6512:68f:b0:54f:cc4e:a9ef with SMTP id 2adb3069b0e04-5521cba987cmr4748985e87.43.1748375781216;
        Tue, 27 May 2025 12:56:21 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	edgar.iglesias@amd.com,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v1 1/3] xen/arm: Add a way to disable traps on unmapped MMIO
Date: Tue, 27 May 2025 21:56:14 +0200
Message-ID: <20250527195616.874614-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527195616.874614-1-edgar.iglesias@gmail.com>
References: <20250527195616.874614-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add a per-domain way to optionally disable traps on unmapped MMIO.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 tools/libs/light/libxl_arm.c      |  3 +++
 xen/arch/arm/dom0less-build.c     |  3 +++
 xen/arch/arm/domain.c             |  2 ++
 xen/arch/arm/domain_build.c       |  3 +++
 xen/arch/arm/include/asm/domain.h |  2 ++
 xen/arch/arm/io.c                 | 33 +++++++++++++++++++++++++++++--
 xen/include/public/arch-arm.h     |  9 +++++++++
 7 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 75c811053c..40cd005619 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -233,6 +233,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
     }
 
+    /* Trap accesses to unmapped MMIO. */
+    config->arch.flags = XEN_ARM_TRAP_UNMAPPED_MMIO;
+
     return 0;
 }
 
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index a49764f0ad..e5e13e07d0 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -343,6 +343,9 @@ void __init arch_create_domUs(struct dt_device_node *node,
         panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n");
 #endif
     }
+
+    /* Trap accesses to unmapped MMIO. */
+    d_cfg->arch.flags = XEN_ARM_TRAP_UNMAPPED_MMIO;
 }
 
 int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 45aeb8bddc..54c6ae7678 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -714,6 +714,8 @@ int arch_domain_create(struct domain *d,
     ioreq_domain_init(d);
 #endif
 
+    d->arch.trap_unmapped_mmio = config->arch.flags & XEN_ARM_TRAP_UNMAPPED_MMIO;
+
     /* p2m_init relies on some value initialized by the IOMMU subsystem */
     if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
         goto fail;
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b189a7cfae..c3c8212260 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2018,6 +2018,9 @@ void __init create_dom0(void)
     dom0_cfg.arch.tee_type = tee_get_type();
     dom0_cfg.max_vcpus = dom0_max_vcpus();
 
+    /* Dom0 always traps on unmapped MMIO.  */
+    dom0_cfg.arch.flags |= XEN_ARM_TRAP_UNMAPPED_MMIO;
+
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index a3487ca713..4d1a180ce2 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -121,6 +121,8 @@ struct arch_domain
     void *tee;
 #endif
 
+    bool trap_unmapped_mmio;
+
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 5a4b0e8f25..11ffa48969 100644
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
@@ -178,8 +204,11 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
         rc = try_fwd_ioserv(regs, v, info);
         if ( rc == IO_HANDLED )
             return handle_ioserv(regs, v);
-
-        return rc;
+        else if ( rc == IO_UNHANDLED && !v->domain->arch.trap_unmapped_mmio ) {
+            /* Fallback to the unmapped handler. */
+            handler = &unmapped_handler;
+        } else
+            return rc;
     }
 
     /*
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index e2412a1747..32b023504d 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -350,6 +350,15 @@ struct xen_arch_domainconfig {
      *
      */
     uint32_t clock_frequency;
+    /*
+     * IN
+     *
+     * XEN_ARM_TRAP_UNMAPPED_MMIO enables trapping of memory accesses
+     * into unmapped ranges. When disabled, Xen will handle the access
+     * by reading 0xFFFFFFFF and ignoring writes.
+     */
+#define XEN_ARM_TRAP_UNMAPPED_MMIO (1U << 0)
+    uint32_t flags;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
 
-- 
2.43.0


