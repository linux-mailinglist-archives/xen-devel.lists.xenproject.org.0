Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE41B69F80C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 16:34:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499540.770734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr86-0001ne-IH; Wed, 22 Feb 2023 15:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499540.770734; Wed, 22 Feb 2023 15:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUr86-0001fk-5X; Wed, 22 Feb 2023 15:34:02 +0000
Received: by outflank-mailman (input) for mailman id 499540;
 Wed, 22 Feb 2023 15:34:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvgA=6S=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pUr83-0001MH-V8
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 15:34:00 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 518898e9-b2c6-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 16:33:56 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id w27so10583020lfu.4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 07:33:56 -0800 (PST)
Received: from localhost.localdomain (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q9-20020ac25289000000b004db0d26adb4sm927746lfm.182.2023.02.22.07.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:33:55 -0800 (PST)
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
X-Inumbo-ID: 518898e9-b2c6-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZsjNSv3BszwMRlZ3430f1yrOpOpDXzM9fMCdGNbTzc=;
        b=BIq73+5buxXluU82WKlUW/WkRfEhf2NGWpvWB7eFKDakZ9a0NK1xttUZuQLUbSy53x
         3qMp5eYpS+922Ioc4H6ovetIJtTwjO6Sr90NMjW+JeT1vVA6GatO0bcSfb1iB1y5Wuli
         G9vG2m3RDsnYE5M7xKjyVjXFT2joNgz00pLx8EUxkQnQi3+ecoKqUgje5JlyJq7ynOFY
         6aetXU/Yjzh7wYAyCt+yS78E+kPdySk+5mQOqA4Q/nVoo0cxpo7jU7gHHcjGlVsADlOx
         UAcZNVja1R6KetSU/oneOtbvZaXC0kguKoMoBP7ZufnaG8TDIGqj2eGAF+TO7Rz2wn1T
         AV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZsjNSv3BszwMRlZ3430f1yrOpOpDXzM9fMCdGNbTzc=;
        b=8MaZlQ/+FaKpTo+M+y9jhWlW8BsJfHgHuZmCMCZ4A496wIe9zTwsJXM127PpjOJsuY
         aCu3MyNAQx08OfwG+/I39Ic+ZrWW68tq07qUHJ1BlH5BcuFvXHI5eIapl5v0ADdkzGDk
         pEEduWSHAh6LrOOpv596+uSq+zmIYTHNELH0mGRBoF7ry27wzsZ84hKMRc0F30KWc7kF
         bBhMZnJiGF+mA9bEjZmbteu4TWmTN+Pk6j1CHSWKqO7GshkyYt5ZGsvbSMUQIcrmZOiU
         0kMiClIzaQucogZTs4xa+BNqOyoW6sPiDxpAUSfaG+0t34zNGS+IC/9aVlWauKkQlnOl
         DBww==
X-Gm-Message-State: AO0yUKWr217Gm+tcBEptisg/2OCiRU7sylJ0HcwNMstgck48iiHxpFEu
	9/zSmi/XPTa+1Lvwk4nW4cJj+Nc2xwsWm8gvJMs=
X-Google-Smtp-Source: AK7set9riMwQZMLprPrPH8sv4ujWvOXUCd5+6lnZiau7TuboZfgOu1DHlL74ZRYowGtdO7JjwnwicQ==
X-Received: by 2002:a19:550e:0:b0:4db:456a:9a1 with SMTP id n14-20020a19550e000000b004db456a09a1mr2892389lfe.66.1677080036259;
        Wed, 22 Feb 2023 07:33:56 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v7 02/20] xen/arm: tee: add a primitive FF-A mediator
Date: Wed, 22 Feb 2023 16:32:59 +0100
Message-Id: <5f0a74b3e4f6cda56e780a739859537246d4892f.1677079672.git.jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677079671.git.jens.wiklander@linaro.org>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
Partition in secure world.

This commit brings in only the parts needed to negotiate FF-A version
number with guest and SPMC.

[1] https://developer.arm.com/documentation/den0077/e
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/include/asm/domain.h  |   2 +-
 xen/arch/arm/include/asm/psci.h    |   4 +
 xen/arch/arm/include/asm/tee/ffa.h |  35 +++++
 xen/arch/arm/tee/Kconfig           |  11 ++
 xen/arch/arm/tee/Makefile          |   1 +
 xen/arch/arm/tee/ffa.c             | 217 +++++++++++++++++++++++++++++
 xen/arch/arm/vsmc.c                |  17 ++-
 xen/include/public/arch-arm.h      |   1 +
 8 files changed, 284 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/tee/ffa.h
 create mode 100644 xen/arch/arm/tee/ffa.c

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 0e310601e846..754daa8efa04 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -110,7 +110,7 @@ struct arch_domain
     struct vpl011 vpl011;
 #endif
 
-#ifdef CONFIG_TEE
+#if defined(CONFIG_TEE) || defined(CONFIG_FFA)
     void *tee;
 #endif
 
diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
index 832f77afff3a..4780972621bb 100644
--- a/xen/arch/arm/include/asm/psci.h
+++ b/xen/arch/arm/include/asm/psci.h
@@ -24,6 +24,10 @@ void call_psci_cpu_off(void);
 void call_psci_system_off(void);
 void call_psci_system_reset(void);
 
+/* Range of allocated PSCI function numbers */
+#define	PSCI_FNUM_MIN_VALUE                 _AC(0,U)
+#define	PSCI_FNUM_MAX_VALUE                 _AC(0x1f,U)
+
 /* PSCI v0.2 interface */
 #define PSCI_0_2_FN32(nr) ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,             \
                                              ARM_SMCCC_CONV_32,               \
diff --git a/xen/arch/arm/include/asm/tee/ffa.h b/xen/arch/arm/include/asm/tee/ffa.h
new file mode 100644
index 000000000000..94960100718e
--- /dev/null
+++ b/xen/arch/arm/include/asm/tee/ffa.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * xen/arch/arm/include/asm/tee/ffa.h
+ *
+ * Arm Firmware Framework for ARMv8-A(FFA) mediator
+ *
+ * Copyright (C) 2023  Linaro Limited
+ */
+
+#ifndef __ASM_ARM_TEE_FFA_H__
+#define __ASM_ARM_TEE_FFA_H__
+
+#include <xen/const.h>
+#include <xen/kconfig.h>
+
+#include <asm/smccc.h>
+#include <asm/types.h>
+
+#define FFA_FNUM_MIN_VALUE              _AC(0x60,U)
+#define FFA_FNUM_MAX_VALUE              _AC(0x86,U)
+
+static inline bool is_ffa_fid(uint32_t fid)
+{
+    uint32_t fn = fid & ARM_SMCCC_FUNC_MASK;
+
+    return fn >= FFA_FNUM_MIN_VALUE && fn <= FFA_FNUM_MAX_VALUE;
+}
+
+#ifdef CONFIG_FFA
+#define FFA_NR_FUNCS    (9 + (IS_ENABLED(CONFIG_ARM_64) ? 3 : 0) )
+#else
+#define FFA_NR_FUNCS    0
+#endif
+
+#endif /*__ASM_ARM_TEE_FFA_H__*/
diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
index 392169b2559d..923f08ba8cb7 100644
--- a/xen/arch/arm/tee/Kconfig
+++ b/xen/arch/arm/tee/Kconfig
@@ -8,3 +8,14 @@ config OPTEE
 	  virtualization-enabled OP-TEE present. You can learn more
 	  about virtualization for OP-TEE at
 	  https://optee.readthedocs.io/architecture/virtualization.html
+
+config FFA
+	bool "Enable FF-A mediator support (UNSUPPORTED)" if UNSUPPORTED
+	default n
+	depends on ARM_64
+	help
+	  This option enables a minimal FF-A mediator. The mediator is
+	  generic as it follows the FF-A specification [1], but it only
+	  implements a small subset of the specification.
+
+	  [1] https://developer.arm.com/documentation/den0077/latest
diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
index 982c87968447..58a1015e40e0 100644
--- a/xen/arch/arm/tee/Makefile
+++ b/xen/arch/arm/tee/Makefile
@@ -1,2 +1,3 @@
+obj-$(CONFIG_FFA) += ffa.o
 obj-y += tee.o
 obj-$(CONFIG_OPTEE) += optee.o
diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
new file mode 100644
index 000000000000..824153c9303a
--- /dev/null
+++ b/xen/arch/arm/tee/ffa.c
@@ -0,0 +1,217 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * xen/arch/arm/tee/ffa.c
+ *
+ * Arm Firmware Framework for ARMv8-A (FF-A) mediator
+ *
+ * Copyright (C) 2023  Linaro Limited
+ */
+
+#include <xen/domain_page.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+#include <xen/sizes.h>
+#include <xen/bitops.h>
+
+#include <asm/smccc.h>
+#include <asm/event.h>
+#include <asm/tee/tee.h>
+#include <asm/tee/ffa.h>
+#include <asm/regs.h>
+
+/* Error codes */
+#define FFA_RET_OK                      0
+#define FFA_RET_NOT_SUPPORTED           -1
+#define FFA_RET_INVALID_PARAMETERS      -2
+#define FFA_RET_NO_MEMORY               -3
+#define FFA_RET_BUSY                    -4
+#define FFA_RET_INTERRUPTED             -5
+#define FFA_RET_DENIED                  -6
+#define FFA_RET_RETRY                   -7
+#define FFA_RET_ABORTED                 -8
+
+/* FFA_VERSION helpers */
+#define FFA_VERSION_MAJOR_SHIFT         16U
+#define FFA_VERSION_MAJOR_MASK          0x7FFFU
+#define FFA_VERSION_MINOR_SHIFT         0U
+#define FFA_VERSION_MINOR_MASK          0xFFFFU
+#define MAKE_FFA_VERSION(major, minor)  \
+        ((((major) & FFA_VERSION_MAJOR_MASK) << FFA_VERSION_MAJOR_SHIFT) | \
+         ((minor) & FFA_VERSION_MINOR_MASK))
+
+#define FFA_MIN_VERSION         MAKE_FFA_VERSION(1, 0)
+#define FFA_VERSION_1_0         MAKE_FFA_VERSION(1, 0)
+#define FFA_VERSION_1_1         MAKE_FFA_VERSION(1, 1)
+
+/*
+ * This is the version we want to use in communication with guests and SPs.
+ * During negotiation with a guest or a SP we may need to lower it for
+ * that particular guest or SP.
+ */
+#define FFA_MY_VERSION_MAJOR    1U
+#define FFA_MY_VERSION_MINOR    1U
+#define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
+                                                 FFA_MY_VERSION_MINOR)
+
+/* Function IDs */
+#define FFA_ERROR                       0x84000060U
+#define FFA_SUCCESS_32                  0x84000061U
+#define FFA_VERSION                     0x84000063U
+
+struct ffa_ctx {
+    uint32_t guest_vers;
+};
+
+/* Negotiated FF-A version to use with the SPMC */
+static uint32_t ffa_version __ro_after_init;
+
+static bool ffa_get_version(uint32_t *vers)
+{
+    const struct arm_smccc_1_2_regs arg = {
+        .a0 = FFA_VERSION,
+        .a1 = FFA_MY_VERSION,
+    };
+    struct arm_smccc_1_2_regs resp;
+
+    arm_smccc_1_2_smc(&arg, &resp);
+    if ( resp.a0 == FFA_RET_NOT_SUPPORTED )
+    {
+        gprintk(XENLOG_ERR, "ffa: FFA_VERSION returned not supported\n");
+        return false;
+    }
+
+    *vers = resp.a0;
+
+    return true;
+}
+
+static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
+                     register_t v2, register_t v3, register_t v4, register_t v5,
+                     register_t v6, register_t v7)
+{
+        set_user_reg(regs, 0, v0);
+        set_user_reg(regs, 1, v1);
+        set_user_reg(regs, 2, v2);
+        set_user_reg(regs, 3, v3);
+        set_user_reg(regs, 4, v4);
+        set_user_reg(regs, 5, v5);
+        set_user_reg(regs, 6, v6);
+        set_user_reg(regs, 7, v7);
+}
+
+static void handle_version(struct cpu_user_regs *regs)
+{
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+    uint32_t vers = get_user_reg(regs, 1);
+
+    if ( vers < FFA_VERSION_1_1 )
+        vers = FFA_VERSION_1_0;
+    else
+        vers = FFA_VERSION_1_1;
+
+    ctx->guest_vers = vers;
+    set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
+}
+
+static bool ffa_handle_call(struct cpu_user_regs *regs)
+{
+    uint32_t fid = get_user_reg(regs, 0);
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    if ( !ctx )
+        return false;
+
+    switch ( fid )
+    {
+    case FFA_VERSION:
+        handle_version(regs);
+        return true;
+
+    default:
+        gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
+        return false;
+    }
+}
+
+static int ffa_domain_init(struct domain *d)
+{
+    struct ffa_ctx *ctx;
+
+    if ( !ffa_version )
+        return -ENODEV;
+
+    ctx = xzalloc(struct ffa_ctx);
+    if ( !ctx )
+        return -ENOMEM;
+
+    d->arch.tee = ctx;
+
+    return 0;
+}
+
+/* This function is supposed to undo what ffa_domain_init() has done */
+static int ffa_relinquish_resources(struct domain *d)
+{
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    if ( !ctx )
+        return 0;
+
+    XFREE(d->arch.tee);
+
+    return 0;
+}
+
+static bool ffa_probe(void)
+{
+    uint32_t vers;
+    unsigned int major_vers;
+    unsigned int minor_vers;
+
+    /*
+     * psci_init_smccc() updates this value with what's reported by EL-3
+     * or secure world.
+     */
+    if ( smccc_ver < ARM_SMCCC_VERSION_1_2 )
+    {
+        printk(XENLOG_ERR
+               "ffa: unsupported SMCCC version %#x (need at least %#x)\n",
+               smccc_ver, ARM_SMCCC_VERSION_1_2);
+        return false;
+    }
+
+    if ( !ffa_get_version(&vers) )
+        return false;
+
+    if ( vers < FFA_MIN_VERSION || vers > FFA_MY_VERSION )
+    {
+        printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers);
+        return false;
+    }
+
+    major_vers = (vers >> FFA_VERSION_MAJOR_SHIFT) & FFA_VERSION_MAJOR_MASK;
+    minor_vers = vers & FFA_VERSION_MINOR_MASK;
+    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
+           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
+    printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
+           major_vers, minor_vers);
+
+    ffa_version = vers;
+
+    return true;
+}
+
+static const struct tee_mediator_ops ffa_ops =
+{
+    .probe = ffa_probe,
+    .domain_init = ffa_domain_init,
+    .relinquish_resources = ffa_relinquish_resources,
+    .handle_call = ffa_handle_call,
+};
+
+REGISTER_TEE_MEDIATOR(ffa, "FF-A", XEN_DOMCTL_CONFIG_TEE_FFA, &ffa_ops);
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index cd68fa80e98a..7f2f5eb9ce3d 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -15,6 +15,7 @@
 #include <asm/monitor.h>
 #include <asm/regs.h>
 #include <asm/smccc.h>
+#include <asm/tee/ffa.h>
 #include <asm/tee/tee.h>
 #include <asm/traps.h>
 #include <asm/vpsci.h>
@@ -24,7 +25,7 @@
 #define XEN_SMCCC_FUNCTION_COUNT 3
 
 /* Number of functions currently supported by Standard Service Service Calls. */
-#define SSSC_SMCCC_FUNCTION_COUNT (3 + VPSCI_NR_FUNCS)
+#define SSSC_SMCCC_FUNCTION_COUNT (3 + VPSCI_NR_FUNCS + FFA_NR_FUNCS)
 
 static bool fill_uid(struct cpu_user_regs *regs, xen_uuid_t uuid)
 {
@@ -188,13 +189,23 @@ static bool handle_existing_apis(struct cpu_user_regs *regs)
     return do_vpsci_0_1_call(regs, fid);
 }
 
+static bool is_psci_fid(uint32_t fid)
+{
+    uint32_t fn = fid & ARM_SMCCC_FUNC_MASK;
+
+    return fn >= PSCI_FNUM_MIN_VALUE && fn <= PSCI_FNUM_MAX_VALUE;
+}
+
 /* PSCI 0.2 interface and other Standard Secure Calls */
 static bool handle_sssc(struct cpu_user_regs *regs)
 {
     uint32_t fid = (uint32_t)get_user_reg(regs, 0);
 
-    if ( do_vpsci_0_2_call(regs, fid) )
-        return true;
+    if ( is_psci_fid(fid) )
+        return do_vpsci_0_2_call(regs, fid);
+
+    if ( is_ffa_fid(fid) )
+        return tee_handle_call(regs);
 
     switch ( fid )
     {
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 1528ced5097a..92aff923056a 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -296,6 +296,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 
 #define XEN_DOMCTL_CONFIG_TEE_NONE      0
 #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
+#define XEN_DOMCTL_CONFIG_TEE_FFA       2
 
 struct xen_arch_domainconfig {
     /* IN/OUT */
-- 
2.34.1


