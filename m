Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 446849CDDD5
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837182.1253221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBut4-0000wt-73; Fri, 15 Nov 2024 11:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837182.1253221; Fri, 15 Nov 2024 11:53:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBut3-0000jo-GO; Fri, 15 Nov 2024 11:53:17 +0000
Received: by outflank-mailman (input) for mailman id 837182;
 Fri, 15 Nov 2024 11:53:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBut0-0005UF-8K
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:14 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30624d4c-a348-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 12:53:11 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9ed7d8d4e0so232688266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:11 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:10 -0800 (PST)
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
X-Inumbo-ID: 30624d4c-a348-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzEiLCJoZWxvIjoibWFpbC1lajEteDYzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMwNjI0ZDRjLWEzNDgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjcxNTkxLjgwNDQ0Miwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671591; x=1732276391; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2zCTEiiXdj6Z3fAz2PaM6R8L2pJvU1ho+YloSy4GWA=;
        b=YjbT0SMrx1qS6W+aM/WTWoJZ37H91fqbfVc3DD7wlrpOQE1xEx+y3DpXOzlAIHrB/0
         /v8F7Vh5B7rIDnWS84cxZ4gHanWR6N5CAMeVfODbu9cvElV3CqVD/lTzfSOOGO4T+GTv
         UYyhXja6Cx50WkGj5cb2j9FcucaF6OIhT+2t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671591; x=1732276391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2zCTEiiXdj6Z3fAz2PaM6R8L2pJvU1ho+YloSy4GWA=;
        b=jOeEaE1KrhhgcKs4pECz/gDrVAwHXv+RFvsJbIio2c9B7IwMvKpNKehidi0pTNEEiz
         a1kVp8bD7bzLKZyhyvkFtK0eg+SUYZDf5jXs2ziCWyY7vTMt504cZ6iDaflzSKuO58P3
         sWdKFzrjxqVL8vC97KWj9uCxO/hMvJbgWXgrMZWqdIeX2klyYawV51ltEN+4qvtV3+cc
         Ids7Mcak8uB8APLIte089n2Ar4wG0BqWo0GWjpNlwF3b0lqKAlJRpp3rv+xLcm43lJCv
         1daN/Tkls3GlAg2s5msuoYo2LbQJC3zWrzdZPvy0nVEL4xb5opGcyo0trPjfbEUrhlbT
         srVw==
X-Gm-Message-State: AOJu0Yx/PdKuTl4aX+t3i+Y0zGhRMBoKu5bS433nBOerc2oLAQxGsNK7
	gU+iECwNzQ5/awtaLc3hwSVBUf3lu1Me+k9sPwzfsQcHwJO1FO85v/hXQAWQvdHzY6EXCPajuAj
	M
X-Google-Smtp-Source: AGHT+IFupWoJxTg3mKC40rRRwGbsyM1HfRvOK5bnNBOwLcjXdsu/PUy6Jjq+KT54hxdALNM3LBR32Q==
X-Received: by 2002:a17:906:daca:b0:a99:88ab:c7cb with SMTP id a640c23a62f3a-aa48347e0fbmr151752766b.33.1731671590923;
        Fri, 15 Nov 2024 03:53:10 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 15/25] xen/arm: Replace hand-crafted xen_arch_domainconfig with autogenerated one
Date: Fri, 15 Nov 2024 11:51:44 +0000
Message-ID: <20241115115200.2824-16-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 .../extra/arch-arm/domainconfig.toml          | 83 +++++++++++++++++++
 xen/arch/arm/domain.c                         |  4 +-
 xen/arch/arm/tee/tee.c                        |  1 +
 xen/include/public/arch-arm.h                 | 36 --------
 xen/include/public/autogen/arch_arm.h         | 59 +++++++++++++
 5 files changed, 145 insertions(+), 38 deletions(-)
 create mode 100644 tools/rust/xenbindgen/extra/arch-arm/domainconfig.toml
 create mode 100644 xen/include/public/autogen/arch_arm.h

diff --git a/tools/rust/xenbindgen/extra/arch-arm/domainconfig.toml b/tools/rust/xenbindgen/extra/arch-arm/domainconfig.toml
new file mode 100644
index 000000000000..d32963445765
--- /dev/null
+++ b/tools/rust/xenbindgen/extra/arch-arm/domainconfig.toml
@@ -0,0 +1,83 @@
+[[enums]]
+name = "xen_domctl_config_gic"
+description = "Content of the `gic_version` field of the domainconfig struct."
+typ = { tag = "u8" }
+
+[[enums.variants]]
+name = "native"
+description = "Emulate the underlying GIC present in the current host."
+value = 0
+
+[[enums.variants]]
+name = "v2"
+description = "Emulate a GICv2."
+value = 1
+
+[[enums.variants]]
+name = "v3"
+description = "Emulate a GICv3."
+value = 2
+
+################################################################################
+
+[[enums]]
+name = "xen_domctl_config_tee"
+description = "TEE mediator exposed to the guest"
+typ = { tag = "u16" }
+
+[[enums.variants]]
+name = "none"
+description = "No mediator. Guest can't communicate with the TEE."
+value = 0
+
+[[enums.variants]]
+name = "optee"
+description = "Expose an OP-TEE mediator."
+value = 1
+
+[[enums.variants]]
+name = "ffa"
+description = "Expose an FF-A mediator."
+value = 2
+
+################################################################################
+
+[[structs]]
+name = "xen_arch_domainconfig"
+description = "arm-specific domain settings."
+
+[[structs.fields]]
+name = "gic_version"
+description = """IN/OUT: GIC version exposed to the guest.
+
+When `native` on input the output value holds the automatically chosen version."""
+typ = { tag = "enum", args = "xen_domctl_config_gic" }
+
+[[structs.fields]]
+name = "sve_vl"
+description = "IN: SVE vector length (divided by 128) exposed to the guest."
+typ = { tag = "u8" }
+
+[[structs.fields]]
+name = "tee_type"
+description = "IN: TEE mediator exposed to the guest."
+typ = { tag = "enum", args = "xen_domctl_config_tee" }
+
+[[structs.fields]]
+name = "nr_spis"
+description = "IN: Number of SPIs exposed to the guest."
+typ = { tag = "u32" }
+
+[[structs.fields]]
+name = "clock_frequency"
+description = """OUT
+Based on the property clock-frequency in the DT timer node.
+The property may be present when the bootloader/firmware doesn't
+set correctly CNTFRQ which hold the timer frequency.
+
+As it's not possible to trap this register, we have to replicate
+the value in the guest DT.
+
+= 0 => property not present
+> 0 => Value of the property"""
+typ = { tag = "u32" }
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 54e849b02f9e..57ed11598754 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -639,10 +639,10 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
     }
 
     /* The P2M table must always be shared between the CPU and the IOMMU */
-    if ( config->iommu_opts & XEN_DOMCTL_IOMMU_no_sharept )
+    if ( config->iommu_opts & XEN_DOMCTL_IOMMU_OPTS_NO_SHAREPT )
     {
         dprintk(XENLOG_INFO,
-                "Unsupported iommu option: XEN_DOMCTL_IOMMU_no_sharept\n");
+                "Unsupported iommu option: XEN_DOMCTL_IOMMU_OPTS_NO_SHAREPT\n");
         return -EINVAL;
     }
 
diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
index 3f65e45a7892..c5f7629a227a 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -21,6 +21,7 @@
 #include <xen/types.h>
 
 #include <asm/tee/tee.h>
+#include <public/autogen/arch_arm.h>
 
 extern const struct tee_mediator_desc _steemediator[], _eteemediator[];
 static const struct tee_mediator_desc __read_mostly *cur_mediator;
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index e2412a17474e..42ce9e64ed00 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -315,42 +315,6 @@ struct vcpu_guest_context {
 typedef struct vcpu_guest_context vcpu_guest_context_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 
-/*
- * struct xen_arch_domainconfig's ABI is covered by
- * XEN_DOMCTL_INTERFACE_VERSION.
- */
-#define XEN_DOMCTL_CONFIG_GIC_NATIVE    0
-#define XEN_DOMCTL_CONFIG_GIC_V2        1
-#define XEN_DOMCTL_CONFIG_GIC_V3        2
-
-#define XEN_DOMCTL_CONFIG_TEE_NONE      0
-#define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
-#define XEN_DOMCTL_CONFIG_TEE_FFA       2
-
-struct xen_arch_domainconfig {
-    /* IN/OUT */
-    uint8_t gic_version;
-    /* IN - Contains SVE vector length divided by 128 */
-    uint8_t sve_vl;
-    /* IN */
-    uint16_t tee_type;
-    /* IN */
-    uint32_t nr_spis;
-    /*
-     * OUT
-     * Based on the property clock-frequency in the DT timer node.
-     * The property may be present when the bootloader/firmware doesn't
-     * set correctly CNTFRQ which hold the timer frequency.
-     *
-     * As it's not possible to trap this register, we have to replicate
-     * the value in the guest DT.
-     *
-     * = 0 => property not present
-     * > 0 => Value of the property
-     *
-     */
-    uint32_t clock_frequency;
-};
 #endif /* __XEN__ || __XEN_TOOLS__ */
 
 struct arch_vcpu_info {
diff --git a/xen/include/public/autogen/arch_arm.h b/xen/include/public/autogen/arch_arm.h
new file mode 100644
index 000000000000..d19f639671e0
--- /dev/null
+++ b/xen/include/public/autogen/arch_arm.h
@@ -0,0 +1,59 @@
+/*
+ * arch-arm
+ *
+ * AUTOGENERATED. DO NOT MODIFY
+ */
+#ifndef __XEN_AUTOGEN_ARCH_ARM_H
+#define __XEN_AUTOGEN_ARCH_ARM_H
+
+/* Content of the `gic_version` field of the domainconfig struct. */
+enum xen_domctl_config_gic {
+    /* Emulate the underlying GIC present in the current host. */
+    XEN_DOMCTL_CONFIG_GIC_NATIVE = 0,
+    /* Emulate a GICv2. */
+    XEN_DOMCTL_CONFIG_GIC_V2 = 1,
+    /* Emulate a GICv3. */
+    XEN_DOMCTL_CONFIG_GIC_V3 = 2,
+};
+
+/* TEE mediator exposed to the guest */
+enum xen_domctl_config_tee {
+    /* No mediator. Guest can't communicate with the TEE. */
+    XEN_DOMCTL_CONFIG_TEE_NONE = 0,
+    /* Expose an OP-TEE mediator. */
+    XEN_DOMCTL_CONFIG_TEE_OPTEE = 1,
+    /* Expose an FF-A mediator. */
+    XEN_DOMCTL_CONFIG_TEE_FFA = 2,
+};
+
+/* arm-specific domain settings. */
+struct xen_arch_domainconfig {
+    /*
+     * IN/OUT: GIC version exposed to the guest.
+     *
+     * When `native` on input the output value holds the automatically chosen version.
+     */
+    uint8_t gic_version /* See xen_domctl_config_gic */;
+    /* IN: SVE vector length (divided by 128) exposed to the guest. */
+    uint8_t sve_vl;
+    /* IN: TEE mediator exposed to the guest. */
+    uint16_t tee_type /* See xen_domctl_config_tee */;
+    /* IN: Number of SPIs exposed to the guest. */
+    uint32_t nr_spis;
+    /*
+     * OUT
+     * Based on the property clock-frequency in the DT timer node.
+     * The property may be present when the bootloader/firmware doesn't
+     * set correctly CNTFRQ which hold the timer frequency.
+     *
+     * As it's not possible to trap this register, we have to replicate
+     * the value in the guest DT.
+     *
+     * = 0 => property not present
+     * > 0 => Value of the property
+     */
+    uint32_t clock_frequency;
+};
+
+#endif /* __XEN_AUTOGEN_ARCH_ARM_H */
+
-- 
2.47.0


