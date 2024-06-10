Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD583901B72
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 08:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736906.1143020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGYuo-0003gI-56; Mon, 10 Jun 2024 06:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736906.1143020; Mon, 10 Jun 2024 06:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGYuo-0003cO-07; Mon, 10 Jun 2024 06:54:02 +0000
Received: by outflank-mailman (input) for mailman id 736906;
 Mon, 10 Jun 2024 06:54:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FMhB=NM=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sGYum-0002SJ-RT
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 06:54:01 +0000
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [2a00:1450:4864:20::644])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 365e6658-26f6-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 08:53:58 +0200 (CEST)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-a6f09eaf420so154697066b.3
 for <xen-devel@lists.xenproject.org>; Sun, 09 Jun 2024 23:53:59 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1e6795b9sm107981966b.174.2024.06.09.23.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 23:53:57 -0700 (PDT)
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
X-Inumbo-ID: 365e6658-26f6-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718002438; x=1718607238; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=305iG9fx40qqEJp0HWKt7JOcd7D+k2FTNaXogI/WLSM=;
        b=E5bUyMO9elYHOfM5gKFwuUHKzW/Cge+s0otluzvzLbSo6hJRsptueTmhYzCwApPpW5
         dYYh/hCqgICI13xZInQ4fH2gBd0Y2YYpiNc+nXfg/oWaxcG8sEmVWMfSONn2QCScOmJ/
         /k9egZN2Lc6UezHrArn4yYXforSByu4/j6nFTs8LOBCfpAtNRdINg2V+kngH/lGuoGtw
         jOIGhhkU0nqo+lAWwaKdPzjRSw/+7USKu+ViRn+bLe13R8BCl1a/1kHdzfw9AP26hDSe
         AZnlGHqXcRkgUCb/EWH/k8OVMxgsnOKh53KOveO/VQIo/3UcdowmHYi0w0f21Pp57T5D
         NYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718002438; x=1718607238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=305iG9fx40qqEJp0HWKt7JOcd7D+k2FTNaXogI/WLSM=;
        b=avi1nC2Sv+sDQG3R9k1sPYRtnHYS4+oCq/a7Pt8NPApv+7u/tF5V/xq35oHP7Prvwn
         5k86ILDcvCMLM8UDOijoX7tNZ7at2iPJBMNqdweYGEcbgT0zhTBtGfPULpb9Q8bnTxm3
         lJiOeJtZ6KHffzL5GBa0t8WrL+5U1w8v7TVQf41V2l3evle1xOv7VdBkthevowEvOnqL
         J+W7g7LLBg6VMZ1HeVa7h7yxT2DRAtXjIIJh3bHH90FkPjZ89rUZJdNsOZH/iwGbmFJ4
         38dZZ3C4ApQmguGtJc+Q8y+4RR7IVFLI4WdOjcD+HLgPf4oD/O/3+bdGbca44VRMk8zZ
         ICXw==
X-Gm-Message-State: AOJu0Yyv7j+nSE+L4KNwG3Ukf1ZcBCwggs1GMnNDr8mTJ1DCf6sGNpV+
	uHjYjNNDLiR17wqhbtUQ8dJpmAJuwfoVT1uxgbVibfHNL3SwSzwJz4INXqQyRcnL35NlHDw8Xh7
	1kQabcg==
X-Google-Smtp-Source: AGHT+IFovAOFQGDgK4ZMx0Nd6uSETjAmoBfhQRI6+9c4qvCcBcggDMQKP095+P3hPn/jy29eXTOuJw==
X-Received: by 2002:a17:906:3f92:b0:a59:9dbf:677b with SMTP id a640c23a62f3a-a6cdb0f53b4mr562970566b.48.1718002437935;
        Sun, 09 Jun 2024 23:53:57 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [XEN PATCH v6 7/7] xen/arm: ffa: support notification
Date: Mon, 10 Jun 2024 08:53:43 +0200
Message-Id: <20240610065343.2594943-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610065343.2594943-1-jens.wiklander@linaro.org>
References: <20240610065343.2594943-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for FF-A notifications, currently limited to an SP (Secure
Partition) sending an asynchronous notification to a guest.

Guests and Xen itself are made aware of pending notifications with an
interrupt. The interrupt handler triggers a tasklet to retrieve the
notifications using the FF-A ABI and deliver them to their destinations.

Update ffa_partinfo_domain_init() to return error code like
ffa_notif_domain_init().

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
v5->v6:
- Add a local ffa_init_secondary() that calls ffa_notif_init_interrupt() as
  requested
- Add comments in notif_vm_pend_intr() to explain the cause and consequences of
  not finding the domain of a vm_id or if the found domain doesn't have a
  FF-A context.

v4->v5:
- Move the freeing of d->arch.tee to the new TEE mediator free_domain_ctx
  callback to make the context accessible during rcu_lock_domain_by_id()
  from a tasklet
- Initialize interrupt handlers for secondary CPUs from the new TEE mediator
  init_interrupt() callback
- Restore the ffa_probe() from v3, that is, remove the
  presmp_initcall(ffa_init) approach and use ffa_probe() as usual now that we
  have the init_interrupt callback.
- A tasklet is added to handle the Schedule Receiver interrupt. The tasklet
  finds each relevant domain with rcu_lock_domain_by_id() which now is enough
  to guarantee that the FF-A context can be accessed.
- The notification interrupt handler only schedules the notification
  tasklet mentioned above

v3->v4:
- Add another note on FF-A limitations
- Clear secure_pending in ffa_handle_notification_get() if both SP and SPM
  bitmaps are retrieved
- ASSERT that ffa_rcu_lock_domain_by_vm_id() isn't passed the vm_id FF-A
  uses for Xen itself
- Replace the get_domain_by_id() call done via ffa_get_domain_by_vm_id() in
  notif_irq_handler() with a call to rcu_lock_live_remote_domain_by_id() via
  ffa_rcu_lock_domain_by_vm_id()
- Remove spinlock in struct ffa_ctx_notif and use atomic functions as needed
  to access and update the secure_pending field
- In notif_irq_handler(), look for the first online CPU instead of assuming
  that the first CPU is online
- Initialize FF-A via presmp_initcall() before the other CPUs are online,
  use register_cpu_notifier() to install the interrupt handler
  notif_irq_handler()
- Update commit message to reflect recent updates

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

[review] xen/arm: ffa: support notification

[review] xen/arm: ffa: support notification
---
 xen/arch/arm/tee/Makefile       |   1 +
 xen/arch/arm/tee/ffa.c          |  77 +++++-
 xen/arch/arm/tee/ffa_notif.c    | 425 ++++++++++++++++++++++++++++++++
 xen/arch/arm/tee/ffa_partinfo.c |   9 +-
 xen/arch/arm/tee/ffa_private.h  |  56 ++++-
 xen/arch/arm/tee/tee.c          |   2 +-
 xen/include/public/arch-arm.h   |  14 ++
 7 files changed, 569 insertions(+), 15 deletions(-)
 create mode 100644 xen/arch/arm/tee/ffa_notif.c

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
index 5209612963e1..022089278e1c 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -39,6 +39,12 @@
  *   - at most 32 shared memory regions per guest
  * o FFA_MSG_SEND_DIRECT_REQ:
  *   - only supported from a VM to an SP
+ * o FFA_NOTIFICATION_*:
+ *   - only supports global notifications, that is, per vCPU notifications
+ *     are not supported
+ *   - doesn't support signalling the secondary scheduler of pending
+ *     notification for secure partitions
+ *   - doesn't support notifications for Xen itself
  *
  * There are some large locked sections with ffa_tx_buffer_lock and
  * ffa_rx_buffer_lock. Especially the ffa_tx_buffer_lock spinlock used
@@ -194,6 +200,8 @@ out:
 
 static void handle_features(struct cpu_user_regs *regs)
 {
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
     uint32_t a1 = get_user_reg(regs, 1);
     unsigned int n;
 
@@ -240,6 +248,30 @@ static void handle_features(struct cpu_user_regs *regs)
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
@@ -305,6 +337,22 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
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
@@ -322,6 +370,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
 static int ffa_domain_init(struct domain *d)
 {
     struct ffa_ctx *ctx;
+    int ret;
 
     if ( !ffa_version )
         return -ENODEV;
@@ -345,10 +394,11 @@ static int ffa_domain_init(struct domain *d)
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
@@ -376,13 +426,6 @@ static void ffa_domain_teardown_continue(struct ffa_ctx *ctx, bool first_time)
     }
     else
     {
-        /*
-         * domain_destroy() might have been called (via put_domain() in
-         * ffa_reclaim_shms()), so we can't touch the domain structure
-         * anymore.
-         */
-        xfree(ctx);
-
         /* Only check if there has been a change to the teardown queue */
         if ( !first_time )
         {
@@ -423,17 +466,28 @@ static int ffa_domain_teardown(struct domain *d)
         return 0;
 
     ffa_rxtx_domain_destroy(d);
+    ffa_notif_domain_destroy(d);
 
     ffa_domain_teardown_continue(ctx, true /* first_time */);
 
     return 0;
 }
 
+static void ffa_free_domain_ctx(struct domain *d)
+{
+    XFREE(d->arch.tee);
+}
+
 static int ffa_relinquish_resources(struct domain *d)
 {
     return 0;
 }
 
+static void ffa_init_secondary(void)
+{
+    ffa_notif_init_interrupt();
+}
+
 static bool ffa_probe(void)
 {
     uint32_t vers;
@@ -502,6 +556,7 @@ static bool ffa_probe(void)
     if ( !ffa_partinfo_init() )
         goto err_rxtx_destroy;
 
+    ffa_notif_init();
     INIT_LIST_HEAD(&ffa_teardown_head);
     init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0);
 
@@ -517,8 +572,10 @@ err_rxtx_destroy:
 static const struct tee_mediator_ops ffa_ops =
 {
     .probe = ffa_probe,
+    .init_secondary = ffa_init_secondary,
     .domain_init = ffa_domain_init,
     .domain_teardown = ffa_domain_teardown,
+    .free_domain_ctx = ffa_free_domain_ctx,
     .relinquish_resources = ffa_relinquish_resources,
     .handle_call = ffa_handle_call,
 };
diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
new file mode 100644
index 000000000000..541e61d2f606
--- /dev/null
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -0,0 +1,425 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024  Linaro Limited
+ */
+
+#include <xen/const.h>
+#include <xen/cpu.h>
+#include <xen/list.h>
+#include <xen/notifier.h>
+#include <xen/spinlock.h>
+#include <xen/tasklet.h>
+#include <xen/types.h>
+
+#include <asm/smccc.h>
+#include <asm/regs.h>
+
+#include "ffa_private.h"
+
+static bool __ro_after_init notif_enabled;
+static unsigned int __ro_after_init notif_sri_irq;
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
+
+    if ( !notif_enabled )
+    {
+        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+        return;
+    }
+
+    if ( test_and_clear_bool(ctx->notif.secure_pending) )
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
+        /*
+         * Clear secure pending if both FFA_NOTIF_FLAG_BITMAP_SP and
+         * FFA_NOTIF_FLAG_BITMAP_SPM are set since secure world can't have
+         * any more pending notifications.
+         */
+        if ( ( flags  & FFA_NOTIF_FLAG_BITMAP_SP ) &&
+             ( flags & FFA_NOTIF_FLAG_BITMAP_SPM ) )
+        {
+                struct ffa_ctx *ctx = d->arch.tee;
+
+                ACCESS_ONCE(ctx->notif.secure_pending) = false;
+        }
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
+static void notif_vm_pend_intr(uint16_t vm_id)
+{
+    struct ffa_ctx *ctx;
+    struct domain *d;
+    struct vcpu *v;
+
+    /*
+     * vm_id == 0 means a notifications pending for Xen itself, but
+     * we don't support that yet.
+     */
+    if ( !vm_id )
+        return;
+
+    /*
+     * This can fail if the domain has been destroyed after
+     * FFA_NOTIFICATION_INFO_GET_64. Ignoring this is harmless since the
+     * guest doesn't exist any more.
+     */
+    d = ffa_rcu_lock_domain_by_vm_id(vm_id);
+    if ( !d )
+        return;
+
+    /*
+     * Failing here is unlikely since the domain ID must have been reused
+     * for a new domain between the FFA_NOTIFICATION_INFO_GET_64 and
+     * ffa_rcu_lock_domain_by_vm_id() calls.
+     *
+     * Continuing on the scenario above if the domain has FF-A enabled. We
+     * can't tell here if the domain ID has been reused for a new domain so
+     * we inject an NPI. When the NPI handler in the domain calls
+     * FFA_NOTIFICATION_GET it will have accurate information, the worst
+     * case is a spurious NPI.
+     */
+    ctx = d->arch.tee;
+    if ( !ctx )
+        goto out_unlock;
+
+    /*
+     * arch.tee is freed from complete_domain_destroy() so the RCU lock
+     * guarantees that the data structure isn't freed while we're accessing
+     * it.
+     */
+    ACCESS_ONCE(ctx->notif.secure_pending) = true;
+
+    /*
+     * Since we're only delivering global notification, always
+     * deliver to the first online vCPU. It doesn't matter
+     * which we chose, as long as it's available.
+     */
+    for_each_vcpu(d, v)
+    {
+        if ( is_vcpu_online(v) )
+        {
+            vgic_inject_irq(d, v, GUEST_FFA_NOTIF_PEND_INTR_ID,
+                            true);
+            break;
+        }
+    }
+    if ( !v )
+        printk(XENLOG_ERR "ffa: can't inject NPI, all vCPUs offline\n");
+
+out_unlock:
+    rcu_unlock_domain(d);
+}
+
+static void notif_sri_action(void *unused)
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
+            uint16_t vm_id = get_id_from_resp(&resp, id_pos);
+
+            notif_vm_pend_intr(vm_id);
+
+            id_pos += count;
+        }
+
+    } while (resp.a2 & FFA_NOTIF_INFO_GET_MORE_FLAG);
+}
+
+static DECLARE_TASKLET(notif_sri_tasklet, notif_sri_action, NULL);
+
+static void notif_irq_handler(int irq, void *data)
+{
+    tasklet_schedule(&notif_sri_tasklet);
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
+void ffa_notif_init_interrupt(void)
+{
+    int ret;
+
+    if ( notif_enabled && notif_sri_irq < NR_GIC_SGI )
+    {
+        /*
+         * An error here is unlikely since the primary CPU has already
+         * succeeded in installing the interrupt handler. If this fails it
+         * may lead to a problem with notifictaions.
+         *
+         * The CPUs without an notification handler installed will fail to
+         * trigger on the SGI indicating that there are notifications
+         * pending, while the SPMC in the secure world will not notice that
+         * the interrupt was lost.
+         */
+        ret = request_irq(notif_sri_irq, 0, notif_irq_handler, "FF-A notif",
+                          NULL);
+        if ( ret )
+            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
+                   notif_sri_irq, ret);
+    }
+}
+
+void ffa_notif_init(void)
+{
+    const struct arm_smccc_1_2_regs arg = {
+        .a0 = FFA_FEATURES,
+        .a1 = FFA_FEATURE_SCHEDULE_RECV_INTR,
+    };
+    struct arm_smccc_1_2_regs resp;
+    unsigned int irq;
+    int ret;
+
+    arm_smccc_1_2_smc(&arg, &resp);
+    if ( resp.a0 != FFA_SUCCESS_32 )
+        return;
+
+    irq = resp.a2;
+    notif_sri_irq = irq;
+    if ( irq >= NR_GIC_SGI )
+        irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
+    ret = request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
+    if ( ret )
+    {
+        printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
+               irq, ret);
+        return;
+    }
+
+    notif_enabled = true;
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
index 98236cbf14a3..7c6b06f686fc 100644
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
@@ -213,6 +229,24 @@
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
+    /*
+     * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
+     * pending global notifications.
+     */
+    bool secure_pending;
+};
 
 struct ffa_ctx {
     void *rx;
@@ -228,6 +262,7 @@ struct ffa_ctx {
     struct list_head shm_list;
     /* Number of allocated shared memory object */
     unsigned int shm_count;
+    struct ffa_ctx_notif notif;
     /*
      * tx_lock is used to serialize access to tx
      * rx_lock is used to serialize access to rx
@@ -257,7 +292,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs);
 int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags);
 
 bool ffa_partinfo_init(void);
-bool ffa_partinfo_domain_init(struct domain *d);
+int ffa_partinfo_domain_init(struct domain *d);
 bool ffa_partinfo_domain_destroy(struct domain *d);
 int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
                                       uint32_t w4, uint32_t w5, uint32_t *count,
@@ -271,12 +306,31 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
 uint32_t ffa_handle_rxtx_unmap(void);
 int32_t ffa_handle_rx_release(void);
 
+void ffa_notif_init(void);
+void ffa_notif_init_interrupt(void);
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
 
+static inline struct domain *ffa_rcu_lock_domain_by_vm_id(uint16_t vm_id)
+{
+    ASSERT(vm_id);
+
+    /* -1 to match ffa_get_vm_id() */
+    return rcu_lock_domain_by_id(vm_id - 1);
+}
+
 static inline void ffa_set_regs(struct cpu_user_regs *regs, register_t v0,
                                 register_t v1, register_t v2, register_t v3,
                                 register_t v4, register_t v5, register_t v6,
diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
index b1cae16c17a1..3f65e45a7892 100644
--- a/xen/arch/arm/tee/tee.c
+++ b/xen/arch/arm/tee/tee.c
@@ -94,7 +94,7 @@ static int __init tee_init(void)
     return 0;
 }
 
-__initcall(tee_init);
+presmp_initcall(tee_init);
 
 void __init init_tee_secondary(void)
 {
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 289af81bd69d..e2412a17474e 100644
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


