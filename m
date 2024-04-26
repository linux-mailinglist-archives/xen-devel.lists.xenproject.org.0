Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAEB8B333A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 10:47:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712551.1113334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0HF6-0000RC-3k; Fri, 26 Apr 2024 08:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712551.1113334; Fri, 26 Apr 2024 08:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0HF5-0000Of-Vu; Fri, 26 Apr 2024 08:47:39 +0000
Received: by outflank-mailman (input) for mailman id 712551;
 Fri, 26 Apr 2024 08:47:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vyS=L7=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s0HF3-0007TR-G3
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 08:47:37 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a05f6670-03a9-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 10:47:35 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2def8e58471so23887871fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 01:47:35 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 qu20-20020a170907111400b00a5242ec4573sm10339211ejb.29.2024.04.26.01.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 01:47:32 -0700 (PDT)
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
X-Inumbo-ID: a05f6670-03a9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714121254; x=1714726054; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHSWtdZOQjsFoB8sDEa4JwrK3cDpEUyTn/mEojnjoVI=;
        b=CGHmhVy1KGtYK7dsZgum8AyKG+BIO20x8YXLOmg2nzlNxbdKi3kgagUkkU5wevCcxv
         fKjL9EfqU8YOy+p23RCasguCg4cDM0ll934iIVH32tRMKO8GGJSwXsjXzwQKiy8S3gkE
         FCtII6TYnUA+rqCHCnrDDa2Qjl5saQpICWF/0GYOudvC4p7zqvxCxXfl6U68By85NpjB
         LfPdLlCPMqDON3tcEYquIaWhSL6cx/yczaY4rbh4HlT4cbhNJerQ2IVwsa/U57Dvbikt
         zMp4iEwhTOlmSvrOw8F5O88N067DTLoCbE8UiXULc+yeEt+C1FHiaekwdbdRZWSIKvKG
         edbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714121254; x=1714726054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHSWtdZOQjsFoB8sDEa4JwrK3cDpEUyTn/mEojnjoVI=;
        b=cMIOwgAZIECx0pIpkSGyMA9LlKHxKvCSGL2dUm9DV0LEuRzGNCvXyoPxHopKLuyF/3
         pG8mdgZ9/E+6Y+rRRWkcvJrLrbs6jV776affcduBUP+ALL1O4u4uwj6IYmQ57E8YlG5m
         pXanFFwph8x5gi583x3m7Ke7G5DYH3KMlQ1kR1NLyxMxifBkOdjLOyjjicxRte+jFdb1
         7YHSn7q50sHhR/uOp3Mpwo/BIk38gaIM4pAOlNldmZX4vzhokUuEhuIxj7g1rHaNcZhm
         v70fXrpXtzRDDt0192F7KWQjMn7hQnKltms75FEltTjVw7yAQu75aHkZxPfU2lTnRM3d
         TS1Q==
X-Gm-Message-State: AOJu0Yx0c+JDPcrCNOlR9Q52b43uP0xkIghpFk3YKDnybNcUdH5Un+KW
	TUFxosR7uDb11+J96Z0ANwO4xfRlf4zcaxfOjXpZL9lfQUpHzdBkCJDS0DxKkNTBRZ2Crrob8vR
	k
X-Google-Smtp-Source: AGHT+IFvXMIDMJGUFtzyhWHNyezkT9SoTbHU/xTai6NVG/UFirbvJYwt8xwH3V54pUo4P+KuD/oLXA==
X-Received: by 2002:a19:6907:0:b0:51c:1657:b04a with SMTP id e7-20020a196907000000b0051c1657b04amr1400347lfc.63.1714121253478;
        Fri, 26 Apr 2024 01:47:33 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v3 5/5] xen/arm: ffa: support notification
Date: Fri, 26 Apr 2024 10:47:23 +0200
Message-Id: <20240426084723.4149648-6-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426084723.4149648-1-jens.wiklander@linaro.org>
References: <20240426084723.4149648-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for FF-A notifications, currently limited to an SP (Secure
Partition) sending an asynchronous notification to a guest.

Guests and Xen itself are made aware of pending notifications with an
interrupt. The interrupt handler retrieves the notifications using the
FF-A ABI and deliver them to their destinations.

Update ffa_partinfo_domain_init() to return error code like
ffa_notif_domain_init().

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
v2->v3:
- Add a GUEST_ prefix and move FFA_NOTIF_PEND_INTR_ID and
  FFA_SCHEDULE_RECV_INTR_ID to public/arch-arm.h
- Register the Xen SRI handler on each CPU using on_selected_cpus() and
  setup_irq()
- Check that the SGI ID retrieved with FFA_FEATURE_SCHEDULE_RECV_INTR
  doesn't conflict with static SGI handlers

v1->v2:
- Addressing review comments
- Change ffa_handle_notification_{bind,unbind,set}() to take struct
  cpu_user_regs *regs as argument.
- Update ffa_partinfo_domain_init() and ffa_notif_domain_init() to return
  an error code.
- Fixing a bug in handle_features() for FFA_FEATURE_SCHEDULE_RECV_INTR.
---
 xen/arch/arm/irq.c              |   2 +-
 xen/arch/arm/tee/Makefile       |   1 +
 xen/arch/arm/tee/ffa.c          |  55 ++++-
 xen/arch/arm/tee/ffa_notif.c    | 378 ++++++++++++++++++++++++++++++++
 xen/arch/arm/tee/ffa_partinfo.c |   9 +-
 xen/arch/arm/tee/ffa_private.h  |  56 ++++-
 xen/include/public/arch-arm.h   |  14 ++
 7 files changed, 507 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/arm/tee/ffa_notif.c

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index d7306aa64d50..5224898265a5 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -155,7 +155,7 @@ void __init init_IRQ(void)
     {
         /* SGIs are always edge-triggered */
         if ( irq < NR_GIC_SGI )
-            local_irqs_type[irq] = DT_IRQ_TYPE_EDGE_RISING;
+            local_irqs_type[irq] = IRQ_TYPE_EDGE_RISING;
         else
             local_irqs_type[irq] = IRQ_TYPE_INVALID;
     }
diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
index f0112a2f922d..7c0f46f7f446 100644
--- a/xen/arch/arm/tee/Makefile
+++ b/xen/arch/arm/tee/Makefile
@@ -2,5 +2,6 @@ obj-$(CONFIG_FFA) += ffa.o
 obj-$(CONFIG_FFA) += ffa_shm.o
 obj-$(CONFIG_FFA) += ffa_partinfo.o
 obj-$(CONFIG_FFA) += ffa_rxtx.o
+obj-$(CONFIG_FFA) += ffa_notif.o
 obj-y += tee.o
 obj-$(CONFIG_OPTEE) += optee.o
diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 5209612963e1..912e905a27bd 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -39,6 +39,9 @@
  *   - at most 32 shared memory regions per guest
  * o FFA_MSG_SEND_DIRECT_REQ:
  *   - only supported from a VM to an SP
+ * o FFA_NOTIFICATION_*:
+ *   - only supports global notifications, that is, per vCPU notifications
+ *     are not supported
  *
  * There are some large locked sections with ffa_tx_buffer_lock and
  * ffa_rx_buffer_lock. Especially the ffa_tx_buffer_lock spinlock used
@@ -194,6 +197,8 @@ out:
 
 static void handle_features(struct cpu_user_regs *regs)
 {
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
     uint32_t a1 = get_user_reg(regs, 1);
     unsigned int n;
 
@@ -240,6 +245,30 @@ static void handle_features(struct cpu_user_regs *regs)
         BUILD_BUG_ON(PAGE_SIZE != FFA_PAGE_SIZE);
         ffa_set_regs_success(regs, 0, 0);
         break;
+    case FFA_FEATURE_NOTIF_PEND_INTR:
+        if ( ctx->notif.enabled )
+            ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0);
+        else
+            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+        break;
+    case FFA_FEATURE_SCHEDULE_RECV_INTR:
+        if ( ctx->notif.enabled )
+            ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_ID, 0);
+        else
+            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+        break;
+
+    case FFA_NOTIFICATION_BIND:
+    case FFA_NOTIFICATION_UNBIND:
+    case FFA_NOTIFICATION_GET:
+    case FFA_NOTIFICATION_SET:
+    case FFA_NOTIFICATION_INFO_GET_32:
+    case FFA_NOTIFICATION_INFO_GET_64:
+        if ( ctx->notif.enabled )
+            ffa_set_regs_success(regs, 0, 0);
+        else
+            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+        break;
     default:
         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
         break;
@@ -305,6 +334,22 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
                                                      get_user_reg(regs, 1)),
                                    get_user_reg(regs, 3));
         break;
+    case FFA_NOTIFICATION_BIND:
+        e = ffa_handle_notification_bind(regs);
+        break;
+    case FFA_NOTIFICATION_UNBIND:
+        e = ffa_handle_notification_unbind(regs);
+        break;
+    case FFA_NOTIFICATION_INFO_GET_32:
+    case FFA_NOTIFICATION_INFO_GET_64:
+        ffa_handle_notification_info_get(regs);
+        return true;
+    case FFA_NOTIFICATION_GET:
+        ffa_handle_notification_get(regs);
+        return true;
+    case FFA_NOTIFICATION_SET:
+        e = ffa_handle_notification_set(regs);
+        break;
 
     default:
         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
@@ -322,6 +367,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
 static int ffa_domain_init(struct domain *d)
 {
     struct ffa_ctx *ctx;
+    int ret;
 
     if ( !ffa_version )
         return -ENODEV;
@@ -345,10 +391,11 @@ static int ffa_domain_init(struct domain *d)
      * error, so no need for cleanup in this function.
      */
 
-    if ( !ffa_partinfo_domain_init(d) )
-        return -EIO;
+    ret = ffa_partinfo_domain_init(d);
+    if ( ret )
+        return ret;
 
-    return 0;
+    return ffa_notif_domain_init(d);
 }
 
 static void ffa_domain_teardown_continue(struct ffa_ctx *ctx, bool first_time)
@@ -423,6 +470,7 @@ static int ffa_domain_teardown(struct domain *d)
         return 0;
 
     ffa_rxtx_domain_destroy(d);
+    ffa_notif_domain_destroy(d);
 
     ffa_domain_teardown_continue(ctx, true /* first_time */);
 
@@ -502,6 +550,7 @@ static bool ffa_probe(void)
     if ( !ffa_partinfo_init() )
         goto err_rxtx_destroy;
 
+    ffa_notif_init();
     INIT_LIST_HEAD(&ffa_teardown_head);
     init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0);
 
diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
new file mode 100644
index 000000000000..6bb0804ee2f8
--- /dev/null
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -0,0 +1,378 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024  Linaro Limited
+ */
+
+#include <xen/const.h>
+#include <xen/list.h>
+#include <xen/spinlock.h>
+#include <xen/types.h>
+
+#include <asm/smccc.h>
+#include <asm/regs.h>
+
+#include "ffa_private.h"
+
+static bool __ro_after_init notif_enabled;
+
+int ffa_handle_notification_bind(struct cpu_user_regs *regs)
+{
+    struct domain *d = current->domain;
+    uint32_t src_dst = get_user_reg(regs, 1);
+    uint32_t flags = get_user_reg(regs, 2);
+    uint32_t bitmap_lo = get_user_reg(regs, 3);
+    uint32_t bitmap_hi = get_user_reg(regs, 4);
+
+    if ( !notif_enabled )
+        return FFA_RET_NOT_SUPPORTED;
+
+    if ( (src_dst & 0xFFFFU) != ffa_get_vm_id(d) )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    if ( flags )    /* Only global notifications are supported */
+        return FFA_RET_DENIED;
+
+    /*
+     * We only support notifications from SP so no need to check the sender
+     * endpoint ID, the SPMC will take care of that for us.
+     */
+    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bitmap_hi,
+                           bitmap_lo);
+}
+
+int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
+{
+    struct domain *d = current->domain;
+    uint32_t src_dst = get_user_reg(regs, 1);
+    uint32_t bitmap_lo = get_user_reg(regs, 3);
+    uint32_t bitmap_hi = get_user_reg(regs, 4);
+
+    if ( !notif_enabled )
+        return FFA_RET_NOT_SUPPORTED;
+
+    if ( (src_dst & 0xFFFFU) != ffa_get_vm_id(d) )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    /*
+     * We only support notifications from SP so no need to check the
+     * destination endpoint ID, the SPMC will take care of that for us.
+     */
+    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_hi,
+                            bitmap_lo);
+}
+
+void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
+{
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+    bool pending_global;
+
+    if ( !notif_enabled )
+    {
+        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+        return;
+    }
+
+    spin_lock(&ctx->notif.lock);
+    pending_global = ctx->notif.secure_pending;
+    ctx->notif.secure_pending = false;
+    spin_unlock(&ctx->notif.lock);
+
+    if ( pending_global )
+    {
+        /* A pending global notification for the guest */
+        ffa_set_regs(regs, FFA_SUCCESS_64, 0,
+                     1U << FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT, ffa_get_vm_id(d),
+                     0, 0, 0, 0);
+    }
+    else
+    {
+        /* Report an error if there where no pending global notification */
+        ffa_set_regs_error(regs, FFA_RET_NO_DATA);
+    }
+}
+
+void ffa_handle_notification_get(struct cpu_user_regs *regs)
+{
+    struct domain *d = current->domain;
+    uint32_t recv = get_user_reg(regs, 1);
+    uint32_t flags = get_user_reg(regs, 2);
+    uint32_t w2 = 0;
+    uint32_t w3 = 0;
+    uint32_t w4 = 0;
+    uint32_t w5 = 0;
+    uint32_t w6 = 0;
+    uint32_t w7 = 0;
+
+    if ( !notif_enabled )
+    {
+        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+        return;
+    }
+
+    if ( (recv & 0xFFFFU) != ffa_get_vm_id(d) )
+    {
+        ffa_set_regs_error(regs, FFA_RET_INVALID_PARAMETERS);
+        return;
+    }
+
+    if ( flags & ( FFA_NOTIF_FLAG_BITMAP_SP | FFA_NOTIF_FLAG_BITMAP_SPM ) )
+    {
+        struct arm_smccc_1_2_regs arg = {
+            .a0 = FFA_NOTIFICATION_GET,
+            .a1 = recv,
+            .a2 = flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
+                            FFA_NOTIF_FLAG_BITMAP_SPM ),
+        };
+        struct arm_smccc_1_2_regs resp;
+        int32_t e;
+
+        arm_smccc_1_2_smc(&arg, &resp);
+        e = ffa_get_ret_code(&resp);
+        if ( e )
+        {
+            ffa_set_regs_error(regs, e);
+            return;
+        }
+
+        if ( flags & FFA_NOTIF_FLAG_BITMAP_SP )
+        {
+            w2 = resp.a2;
+            w3 = resp.a3;
+        }
+
+        if ( flags & FFA_NOTIF_FLAG_BITMAP_SPM )
+            w6 = resp.a6;
+    }
+
+    ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, w4, w5, w6, w7);
+}
+
+int ffa_handle_notification_set(struct cpu_user_regs *regs)
+{
+    struct domain *d = current->domain;
+    uint32_t src_dst = get_user_reg(regs, 1);
+    uint32_t flags = get_user_reg(regs, 2);
+    uint32_t bitmap_lo = get_user_reg(regs, 3);
+    uint32_t bitmap_hi = get_user_reg(regs, 4);
+
+    if ( !notif_enabled )
+        return FFA_RET_NOT_SUPPORTED;
+
+    if ( (src_dst >> 16) != ffa_get_vm_id(d) )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    /* Let the SPMC check the destination of the notification */
+    return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bitmap_lo,
+                           bitmap_hi);
+}
+
+/*
+ * Extract a 16-bit ID (index n) from the successful return value from
+ * FFA_NOTIFICATION_INFO_GET_64 or FFA_NOTIFICATION_INFO_GET_32. IDs are
+ * returned in registers 3 to 7 with four IDs per register for 64-bit
+ * calling convention and two IDs per register for 32-bit calling
+ * convention.
+ */
+static uint16_t get_id_from_resp(struct arm_smccc_1_2_regs *resp,
+                                 unsigned int n)
+{
+    unsigned int ids_per_reg;
+    unsigned int reg_idx;
+    unsigned int reg_shift;
+
+    if ( smccc_is_conv_64(resp->a0) )
+        ids_per_reg = 4;
+    else
+        ids_per_reg = 2;
+
+    reg_idx = n / ids_per_reg + 3;
+    reg_shift = ( n % ids_per_reg ) * 16;
+
+    switch ( reg_idx )
+    {
+    case 3:
+        return resp->a3 >> reg_shift;
+    case 4:
+        return resp->a4 >> reg_shift;
+    case 5:
+        return resp->a5 >> reg_shift;
+    case 6:
+        return resp->a6 >> reg_shift;
+    case 7:
+        return resp->a7 >> reg_shift;
+    default:
+        ASSERT(0); /* "Can't happen" */
+        return 0;
+    }
+}
+
+static void notif_irq_handler(int irq, void *data)
+{
+    const struct arm_smccc_1_2_regs arg = {
+        .a0 = FFA_NOTIFICATION_INFO_GET_64,
+    };
+    struct arm_smccc_1_2_regs resp;
+    unsigned int id_pos;
+    unsigned int list_count;
+    uint64_t ids_count;
+    unsigned int n;
+    int32_t res;
+
+    do {
+        arm_smccc_1_2_smc(&arg, &resp);
+        res = ffa_get_ret_code(&resp);
+        if ( res )
+        {
+            if ( res != FFA_RET_NO_DATA )
+                printk(XENLOG_ERR "ffa: notification info get failed: error %d\n",
+                       res);
+            return;
+        }
+
+        ids_count = resp.a2 >> FFA_NOTIF_INFO_GET_ID_LIST_SHIFT;
+        list_count = ( resp.a2 >> FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT ) &
+                     FFA_NOTIF_INFO_GET_ID_COUNT_MASK;
+
+        id_pos = 0;
+        for ( n = 0; n < list_count; n++ )
+        {
+            unsigned int count = ((ids_count >> 2 * n) & 0x3) + 1;
+            struct domain *d;
+
+            d = ffa_get_domain_by_vm_id(get_id_from_resp(&resp, id_pos));
+
+            if ( d )
+            {
+                struct ffa_ctx *ctx = d->arch.tee;
+
+                spin_lock(&ctx->notif.lock);
+                ctx->notif.secure_pending = true;
+                spin_unlock(&ctx->notif.lock);
+
+                /*
+                 * Since we're only delivering global notification, always
+                 * deliver to the first vCPU. It doesn't matter which we
+                 * chose, as long as it's available.
+                 */
+                vgic_inject_irq(d, d->vcpu[0], GUEST_FFA_NOTIF_PEND_INTR_ID,
+                                true);
+
+                put_domain(d);
+            }
+
+            id_pos += count;
+        }
+
+    } while (resp.a2 & FFA_NOTIF_INFO_GET_MORE_FLAG);
+}
+
+static int32_t ffa_notification_bitmap_create(uint16_t vm_id,
+                                              uint32_t vcpu_count)
+{
+    return ffa_simple_call(FFA_NOTIFICATION_BITMAP_CREATE, vm_id, vcpu_count,
+                           0, 0);
+}
+
+static int32_t ffa_notification_bitmap_destroy(uint16_t vm_id)
+{
+    return ffa_simple_call(FFA_NOTIFICATION_BITMAP_DESTROY, vm_id, 0, 0, 0);
+}
+
+struct notif_irq_info {
+    unsigned int irq;
+    int ret;
+    struct irqaction *action;
+};
+
+static void notif_irq_enable(void *info)
+{
+    struct notif_irq_info *irq_info = info;
+
+    irq_info->ret = setup_irq(irq_info->irq, 0, irq_info->action);
+    if ( irq_info->ret )
+        printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
+               irq_info->irq, irq_info->ret);
+}
+
+void ffa_notif_init(void)
+{
+    const struct arm_smccc_1_2_regs arg = {
+        .a0 = FFA_FEATURES,
+        .a1 = FFA_FEATURE_SCHEDULE_RECV_INTR,
+    };
+    struct notif_irq_info irq_info = { };
+    struct arm_smccc_1_2_regs resp;
+    unsigned int cpu;
+
+    arm_smccc_1_2_smc(&arg, &resp);
+    if ( resp.a0 != FFA_SUCCESS_32 )
+        return;
+
+    irq_info.irq = resp.a2;
+    if ( irq_info.irq < GIC_SGI_STATIC_MAX || irq_info.irq >= NR_GIC_SGI )
+    {
+        printk(XENLOG_ERR "ffa: notification initialization failed: conflicting SGI %u\n",
+               irq_info.irq);
+        return;
+    }
+
+    /*
+     * SGIs are per-CPU so we must enable the IRQ on each CPU. We use an
+     * IPI to call notif_irq_enable() on each CPU including the current
+     * CPU. The struct irqaction is preallocated since we can't allocate
+     * memory while in interrupt context.
+     */
+    for_each_online_cpu(cpu)
+    {
+        irq_info.action = xmalloc(struct irqaction);
+        if ( !irq_info.action )
+        {
+            irq_info.ret = -ENOMEM;
+            break;
+        }
+
+        *irq_info.action = (struct irqaction){
+            .handler = notif_irq_handler,
+            .name = "FF-A notif",
+            .free_on_release = 1,
+        };
+
+        on_selected_cpus(cpumask_of(cpu), notif_irq_enable, &irq_info, 1);
+        if ( irq_info.ret )
+        {
+            XFREE(irq_info.action);
+            break;
+        }
+    }
+
+    notif_enabled = !irq_info.ret;
+}
+
+int ffa_notif_domain_init(struct domain *d)
+{
+    struct ffa_ctx *ctx = d->arch.tee;
+    int32_t res;
+
+    if ( !notif_enabled )
+        return 0;
+
+    res = ffa_notification_bitmap_create(ffa_get_vm_id(d), d->max_vcpus);
+    if ( res )
+        return -ENOMEM;
+
+    ctx->notif.enabled = true;
+
+    return 0;
+}
+
+void ffa_notif_domain_destroy(struct domain *d)
+{
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    if ( ctx->notif.enabled )
+    {
+        ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
+        ctx->notif.enabled = false;
+    }
+}
diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index dc1059584828..93a03c6bc672 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -306,7 +306,7 @@ static void vm_destroy_bitmap_init(struct ffa_ctx *ctx,
     }
 }
 
-bool ffa_partinfo_domain_init(struct domain *d)
+int ffa_partinfo_domain_init(struct domain *d)
 {
     unsigned int count = BITS_TO_LONGS(subscr_vm_destroyed_count);
     struct ffa_ctx *ctx = d->arch.tee;
@@ -315,7 +315,7 @@ bool ffa_partinfo_domain_init(struct domain *d)
 
     ctx->vm_destroy_bitmap = xzalloc_array(unsigned long, count);
     if ( !ctx->vm_destroy_bitmap )
-        return false;
+        return -ENOMEM;
 
     for ( n = 0; n < subscr_vm_created_count; n++ )
     {
@@ -330,7 +330,10 @@ bool ffa_partinfo_domain_init(struct domain *d)
     }
     vm_destroy_bitmap_init(ctx, n);
 
-    return n == subscr_vm_created_count;
+    if ( n != subscr_vm_created_count )
+        return -EIO;
+
+    return 0;
 }
 
 bool ffa_partinfo_domain_destroy(struct domain *d)
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 98236cbf14a3..a59c9887774b 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -25,6 +25,7 @@
 #define FFA_RET_DENIED                  -6
 #define FFA_RET_RETRY                   -7
 #define FFA_RET_ABORTED                 -8
+#define FFA_RET_NO_DATA                 -9
 
 /* FFA_VERSION helpers */
 #define FFA_VERSION_MAJOR_SHIFT         16U
@@ -175,6 +176,21 @@
  */
 #define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
 
+/* Flags used in calls to FFA_NOTIFICATION_GET interface  */
+#define FFA_NOTIF_FLAG_BITMAP_SP        BIT(0, U)
+#define FFA_NOTIF_FLAG_BITMAP_VM        BIT(1, U)
+#define FFA_NOTIF_FLAG_BITMAP_SPM       BIT(2, U)
+#define FFA_NOTIF_FLAG_BITMAP_HYP       BIT(3, U)
+
+#define FFA_NOTIF_INFO_GET_MORE_FLAG        BIT(0, U)
+#define FFA_NOTIF_INFO_GET_ID_LIST_SHIFT    12
+#define FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT   7
+#define FFA_NOTIF_INFO_GET_ID_COUNT_MASK    0x1F
+
+/* Feature IDs used with FFA_FEATURES */
+#define FFA_FEATURE_NOTIF_PEND_INTR     0x1U
+#define FFA_FEATURE_SCHEDULE_RECV_INTR  0x2U
+
 /* Function IDs */
 #define FFA_ERROR                       0x84000060U
 #define FFA_SUCCESS_32                  0x84000061U
@@ -213,6 +229,27 @@
 #define FFA_MEM_FRAG_TX                 0x8400007BU
 #define FFA_MSG_SEND                    0x8400006EU
 #define FFA_MSG_POLL                    0x8400006AU
+#define FFA_NOTIFICATION_BITMAP_CREATE  0x8400007DU
+#define FFA_NOTIFICATION_BITMAP_DESTROY 0x8400007EU
+#define FFA_NOTIFICATION_BIND           0x8400007FU
+#define FFA_NOTIFICATION_UNBIND         0x84000080U
+#define FFA_NOTIFICATION_SET            0x84000081U
+#define FFA_NOTIFICATION_GET            0x84000082U
+#define FFA_NOTIFICATION_INFO_GET_32    0x84000083U
+#define FFA_NOTIFICATION_INFO_GET_64    0xC4000083U
+
+struct ffa_ctx_notif {
+    bool enabled;
+
+    /* Used to serialize access to the rest of this struct */
+    spinlock_t lock;
+
+    /*
+     * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
+     * pending global notifications.
+     */
+    bool secure_pending;
+};
 
 struct ffa_ctx {
     void *rx;
@@ -228,6 +265,7 @@ struct ffa_ctx {
     struct list_head shm_list;
     /* Number of allocated shared memory object */
     unsigned int shm_count;
+    struct ffa_ctx_notif notif;
     /*
      * tx_lock is used to serialize access to tx
      * rx_lock is used to serialize access to rx
@@ -257,7 +295,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs);
 int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags);
 
 bool ffa_partinfo_init(void);
-bool ffa_partinfo_domain_init(struct domain *d);
+int ffa_partinfo_domain_init(struct domain *d);
 bool ffa_partinfo_domain_destroy(struct domain *d);
 int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
                                       uint32_t w4, uint32_t w5, uint32_t *count,
@@ -271,12 +309,28 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
 uint32_t ffa_handle_rxtx_unmap(void);
 int32_t ffa_handle_rx_release(void);
 
+void ffa_notif_init(void);
+int ffa_notif_domain_init(struct domain *d);
+void ffa_notif_domain_destroy(struct domain *d);
+
+int ffa_handle_notification_bind(struct cpu_user_regs *regs);
+int ffa_handle_notification_unbind(struct cpu_user_regs *regs);
+void ffa_handle_notification_info_get(struct cpu_user_regs *regs);
+void ffa_handle_notification_get(struct cpu_user_regs *regs);
+int ffa_handle_notification_set(struct cpu_user_regs *regs);
+
 static inline uint16_t ffa_get_vm_id(const struct domain *d)
 {
     /* +1 since 0 is reserved for the hypervisor in FF-A */
     return d->domain_id + 1;
 }
 
+static inline struct domain *ffa_get_domain_by_vm_id(uint16_t vm_id)
+{
+    /* -1 to match ffa_get_vm_id() */
+    return get_domain_by_id(vm_id - 1);
+}
+
 static inline void ffa_set_regs(struct cpu_user_regs *regs, register_t v0,
                                 register_t v1, register_t v2, register_t v3,
                                 register_t v4, register_t v5, register_t v6,
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index e167e14f8df9..1eac9802aa53 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -505,6 +505,7 @@ typedef uint64_t xen_callback_t;
 #define GUEST_MAX_VCPUS 128
 
 /* Interrupts */
+
 #define GUEST_TIMER_VIRT_PPI    27
 #define GUEST_TIMER_PHYS_S_PPI  29
 #define GUEST_TIMER_PHYS_NS_PPI 30
@@ -515,6 +516,19 @@ typedef uint64_t xen_callback_t;
 #define GUEST_VIRTIO_MMIO_SPI_FIRST   33
 #define GUEST_VIRTIO_MMIO_SPI_LAST    43
 
+/*
+ * SGI is the preferred delivery mechanism of FF-A pending notifications or
+ * schedule recveive interrupt. SGIs 8-15 are normally not used by a guest
+ * as they in a non-virtualized system typically are assigned to the secure
+ * world. Here we're free to use SGI 8-15 since they are virtual and have
+ * nothing to do with the secure world.
+ *
+ * For partitioning of SGIs see also Arm Base System Architecture v1.0C,
+ * https://developer.arm.com/documentation/den0094/
+ */
+#define GUEST_FFA_NOTIF_PEND_INTR_ID      8
+#define GUEST_FFA_SCHEDULE_RECV_INTR_ID   9
+
 /* PSCI functions */
 #define PSCI_cpu_suspend 0
 #define PSCI_cpu_off     1
-- 
2.34.1


