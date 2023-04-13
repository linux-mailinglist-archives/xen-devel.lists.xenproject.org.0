Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A77976E0784
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:16:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520463.808073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBN-0002Sq-RW; Thu, 13 Apr 2023 07:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520463.808073; Thu, 13 Apr 2023 07:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBN-0002Px-OE; Thu, 13 Apr 2023 07:15:49 +0000
Received: by outflank-mailman (input) for mailman id 520463;
 Thu, 13 Apr 2023 07:15:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrBL-0001gr-Fq
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:15:47 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02094e23-d9cb-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 09:15:45 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id u12so153802lfu.5
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:45 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:44 -0700 (PDT)
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
X-Inumbo-ID: 02094e23-d9cb-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370145; x=1683962145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8pIVujHEbhV2cnHgvkx7ic1HrkG7oPR2753cV35Lic=;
        b=j/zN3l9fv0KQLVQaEiGtYmZHRVx12v/6iL5ap9JHNd+d76QxhLEM7GP+H7rIAd+TjL
         DMa4mn0kjlYjBOTlMNIU6WzhszIdGrH9wEBvum0FYuM9tPkC/2IW7fvsK6ehOD9bBYEf
         2pbG8Redd+mN7UYsohGRPBCPUqhc+6fqGkFA8WcXtnYF/HNJ1OT43UmhD11IvM7x17xs
         7w+x4zBBLPtipshfSJya2xR+pE7uT+5vDvfUTn3wnvm4n95QkDutQt6Bl2syeeBGzUk2
         20tatdWDtF8jLhYBzgwtZjuiImQfwc3UpJbjhPcDQ1JjZ71Ioo/5ge1+rA0oPatUzp9g
         B2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370145; x=1683962145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8pIVujHEbhV2cnHgvkx7ic1HrkG7oPR2753cV35Lic=;
        b=XwBma4TmzI0scF73ODBGIHoFOmvlIAPc6finYzaf0PJwbY4FJt+mt6UfqlHqXTeuYH
         mrsZSyTvlfseiyE2bFe+S4TO/7uh/3yECFrDF9rNzUde7kMKcf+9WAxeZZHRwLRMfvdP
         RIBSU/zxBMv3RzjBxFHFKNno0Yo+j7s3hdaBLmk7/AXr9kv61OUlPyYChVasaUi9ZoCL
         URPAGlLN9xXVZnHjtNa1pBscJax+AcJYoGFf60jTw3olEACinHCaPYagSxjUFZNCVcaj
         nQZ5XatlQBRAOrERuQS+ppys9ImBIvUSuvJwyu8YykvkWp4g1E+lesbpTdePgFe0goyO
         BBNg==
X-Gm-Message-State: AAQBX9ezts9t1CYa30ocvo49PYGdqyuC6bdJU4z5CmbkOl1IVZJEvi0C
	+kdmb5NGbE/UVvQLycS0wYq9zR5yB8tfG1wKb/Y=
X-Google-Smtp-Source: AKy350bj4BD08C0CLbkgoYe6CCcHFDtvUrsW3hSspX4zO5IYWVp0t7iWRBIc5cwXOha6KG3DUvErSA==
X-Received: by 2002:ac2:5d4e:0:b0:4eb:c18:efae with SMTP id w14-20020ac25d4e000000b004eb0c18efaemr591180lfd.17.1681370144856;
        Thu, 13 Apr 2023 00:15:44 -0700 (PDT)
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
Subject: [XEN PATCH v8 02/22] xen/arm: tee: add a primitive FF-A mediator
Date: Thu, 13 Apr 2023 09:14:04 +0200
Message-Id: <20230413071424.3273490-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
Partition in secure world.

This commit brings in only the parts needed to negotiate FF-A version
number with guest and SPMC.

[1] https://developer.arm.com/documentation/den0077/e
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/include/asm/psci.h    |   4 +
 xen/arch/arm/include/asm/tee/ffa.h |  35 +++++
 xen/arch/arm/tee/Kconfig           |  11 ++
 xen/arch/arm/tee/Makefile          |   1 +
 xen/arch/arm/tee/ffa.c             | 219 +++++++++++++++++++++++++++++
 xen/arch/arm/vsmc.c                |  17 ++-
 xen/include/public/arch-arm.h      |   1 +
 7 files changed, 285 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/tee/ffa.h
 create mode 100644 xen/arch/arm/tee/ffa.c

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
index 000000000000..44361a4e78e4
--- /dev/null
+++ b/xen/arch/arm/include/asm/tee/ffa.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
+#define FFA_NR_FUNCS    12
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
index 000000000000..aaf74c287aef
--- /dev/null
+++ b/xen/arch/arm/tee/ffa.c
@@ -0,0 +1,219 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xen/arch/arm/tee/ffa.c
+ *
+ * Arm Firmware Framework for ARMv8-A (FF-A) mediator
+ *
+ * Copyright (C) 2023  Linaro Limited
+ */
+
+#include <xen/bitops.h>
+#include <xen/domain_page.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/sched.h>
+#include <xen/sizes.h>
+#include <xen/types.h>
+
+#include <asm/event.h>
+#include <asm/regs.h>
+#include <asm/smccc.h>
+#include <asm/tee/ffa.h>
+#include <asm/tee/tee.h>
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
+#define FFA_VERSION_1_0         MAKE_FFA_VERSION(1, 0)
+#define FFA_VERSION_1_1         MAKE_FFA_VERSION(1, 1)
+/* The minimal FF-A version of the SPMC that can be supported */
+#define FFA_MIN_SPMC_VERSION    FFA_VERSION_1_1
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
+    /* FF-A version used by the guest */
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
+    if ( vers < FFA_MIN_SPMC_VERSION || vers > FFA_MY_VERSION )
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


