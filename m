Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3479A0552
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 11:22:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819776.1233278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10Ej-0004M6-SQ; Wed, 16 Oct 2024 09:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819776.1233278; Wed, 16 Oct 2024 09:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10Ej-0004JB-O4; Wed, 16 Oct 2024 09:22:33 +0000
Received: by outflank-mailman (input) for mailman id 819776;
 Wed, 16 Oct 2024 09:22:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0z3=RM=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1t10Ei-0001Po-HX
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 09:22:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 2b108c2e-8ba0-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 11:22:30 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B60151007;
 Wed, 16 Oct 2024 02:22:59 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.21.81])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E501D3F528;
 Wed, 16 Oct 2024 02:22:28 -0700 (PDT)
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
X-Inumbo-ID: 2b108c2e-8ba0-11ef-99a3-01e77a169b0f
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [RFC PATCH 2/4] xen/arm: ffa: Add buffer full notification support
Date: Wed, 16 Oct 2024 11:21:56 +0200
Message-ID: <70a1fd32542901791fef0d528b0fb0fa94f8e814.1729069025.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729069025.git.bertrand.marquis@arm.com>
References: <cover.1729069025.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to raise a Rx buffer full notification to a VM.
This function will be used for indirect message support between VM and
is only activated if CONFIG_FFA_VM_TO_VM is selected.

Even if there are 32 framework notifications possible, right now only
one is defined so the implementation is simplified to only handle the
buffer full notification using a boolean. If other framework
notifications have to be supported one day, the design will have to be
modified to handle it properly.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa_notif.c   | 26 +++++++++++++++++++++-----
 xen/arch/arm/tee/ffa_private.h | 13 +++++++++++++
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 3c6418e62e2b..052b3e364a70 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -93,6 +93,7 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
 void ffa_handle_notification_get(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
     uint32_t recv = get_user_reg(regs, 1);
     uint32_t flags = get_user_reg(regs, 2);
     uint32_t w2 = 0;
@@ -132,11 +133,7 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
          */
         if ( ( flags  & FFA_NOTIF_FLAG_BITMAP_SP ) &&
              ( flags & FFA_NOTIF_FLAG_BITMAP_SPM ) )
-        {
-                struct ffa_ctx *ctx = d->arch.tee;
-
-                ACCESS_ONCE(ctx->notif.secure_pending) = false;
-        }
+            ACCESS_ONCE(ctx->notif.secure_pending) = false;
 
         arm_smccc_1_2_smc(&arg, &resp);
         e = ffa_get_ret_code(&resp);
@@ -156,6 +153,12 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
             w6 = resp.a6;
     }
 
+#ifdef CONFIG_FFA_VM_TO_VM
+    if ( flags & FFA_NOTIF_FLAG_BITMAP_HYP &&
+            test_and_clear_bool(ctx->notif.buff_full_pending) )
+        w7 = FFA_NOTIF_RX_BUFFER_FULL;
+#endif
+
     ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, w4, w5, w6, w7);
 }
 
@@ -178,6 +181,19 @@ int ffa_handle_notification_set(struct cpu_user_regs *regs)
                            bitmap_hi);
 }
 
+#ifdef CONFIG_FFA_VM_TO_VM
+void ffa_raise_rx_buffer_full(struct domain *d)
+{
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    if ( !ctx )
+        return;
+
+    if ( !test_and_set_bool(ctx->notif.buff_full_pending) )
+        vgic_inject_irq(d, d->vcpu[0], notif_sri_irq, true);
+}
+#endif
+
 /*
  * Extract a 16-bit ID (index n) from the successful return value from
  * FFA_NOTIFICATION_INFO_GET_64 or FFA_NOTIFICATION_INFO_GET_32. IDs are
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 47dd6b5fadea..ad1dd04aeb7c 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -210,6 +210,8 @@
 #define FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT   7
 #define FFA_NOTIF_INFO_GET_ID_COUNT_MASK    0x1F
 
+#define FFA_NOTIF_RX_BUFFER_FULL        BIT(0, U)
+
 /* Feature IDs used with FFA_FEATURES */
 #define FFA_FEATURE_NOTIF_PEND_INTR     0x1U
 #define FFA_FEATURE_SCHEDULE_RECV_INTR  0x2U
@@ -298,6 +300,13 @@ struct ffa_ctx_notif {
      * pending global notifications.
      */
     bool secure_pending;
+
+#ifdef CONFIG_FFA_VM_TO_VM
+    /*
+     * Pending Hypervisor framework notifications
+     */
+    bool buff_full_pending;
+#endif
 };
 
 struct ffa_ctx {
@@ -370,6 +379,10 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs);
 void ffa_handle_notification_get(struct cpu_user_regs *regs);
 int ffa_handle_notification_set(struct cpu_user_regs *regs);
 
+#ifdef CONFIG_FFA_VM_TO_VM
+void ffa_raise_rx_buffer_full(struct domain *d);
+#endif
+
 void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid);
 int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs);
 
-- 
2.47.0


