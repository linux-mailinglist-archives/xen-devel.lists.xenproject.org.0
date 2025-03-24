Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C70A6D71D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 10:15:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925119.1328017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twdu2-0001c2-IJ; Mon, 24 Mar 2025 09:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925119.1328017; Mon, 24 Mar 2025 09:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twdu2-0001YR-BS; Mon, 24 Mar 2025 09:15:26 +0000
Received: by outflank-mailman (input) for mailman id 925119;
 Mon, 24 Mar 2025 09:15:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDgH=WL=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1twdu1-0000tJ-6V
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 09:15:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 820e78aa-0890-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 10:15:20 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4A7A1A2D;
 Mon, 24 Mar 2025 02:15:25 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.81.213])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAB423F63F;
 Mon, 24 Mar 2025 02:15:17 -0700 (PDT)
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
X-Inumbo-ID: 820e78aa-0890-11f0-9ffa-bf95429c2676
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v3 3/5] xen/arm: ffa: Add buffer full notification support
Date: Mon, 24 Mar 2025 10:14:34 +0100
Message-ID: <3aceccbc7d006b87bfe20a9a4f660eb831185dbb.1742570590.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1742570590.git.bertrand.marquis@arm.com>
References: <cover.1742570590.git.bertrand.marquis@arm.com>
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
Changes in v3:
- introduce a vm_pending boolean to track if VM notifications are
  pending and allow to decorelate pending secure notifications from
  pending vm ones
- remove ifdef around boolean entries for notifications and make use of
  IS_ENABLED instead of ifdefs when possible
- Fix notification number signaled to VMs for buffer full to use the
  proper GUEST_FFA_NOTIF_PEND_INTR_ID instead of the identifier received
  from the SPMC.
- Move back into this patch ffa_private.h part which was wrongly in the
  patch for indirect messages between VM
Changes in v2:
- Switch ifdef to IS_ENABLED when possible
---
 xen/arch/arm/tee/ffa_notif.c   | 36 ++++++++++++++++++++++++++++------
 xen/arch/arm/tee/ffa_private.h | 23 +++++++++++++++++++++-
 2 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 00efaf8f7353..f6df2f15bb00 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -69,6 +69,7 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
+    bool notif_pending;
 
     if ( !notif_enabled )
     {
@@ -76,7 +77,11 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
         return;
     }
 
-    if ( test_and_clear_bool(ctx->notif.secure_pending) )
+    notif_pending = test_and_clear_bool(ctx->notif.secure_pending);
+    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
+        notif_pending |= test_and_clear_bool(ctx->notif.vm_pending);
+
+    if ( notif_pending )
     {
         /* A pending global notification for the guest */
         ffa_set_regs(regs, FFA_SUCCESS_64, 0,
@@ -93,6 +98,7 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
 void ffa_handle_notification_get(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
     uint32_t recv = get_user_reg(regs, 1);
     uint32_t flags = get_user_reg(regs, 2);
     uint32_t w2 = 0;
@@ -132,11 +138,7 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
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
@@ -156,6 +158,14 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
             w6 = resp.a6;
     }
 
+    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) &&
+          flags & FFA_NOTIF_FLAG_BITMAP_HYP &&
+          test_and_clear_bool(ctx->notif.buff_full_pending) )
+    {
+        ACCESS_ONCE(ctx->notif.vm_pending) = false;
+        w7 = FFA_NOTIF_RX_BUFFER_FULL;
+    }
+
     ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, w4, w5, w6, w7);
 }
 
@@ -178,6 +188,20 @@ int ffa_handle_notification_set(struct cpu_user_regs *regs)
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
+    ACCESS_ONCE(ctx->notif.buff_full_pending) = true;
+    if ( !test_and_set_bool(ctx->notif.vm_pending) )
+        vgic_inject_irq(d, d->vcpu[0], GUEST_FFA_NOTIF_PEND_INTR_ID, true);
+}
+#endif
+
 /*
  * Extract a 16-bit ID (index n) from the successful return value from
  * FFA_NOTIFICATION_INFO_GET_64 or FFA_NOTIFICATION_INFO_GET_32. IDs are
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index bd6877d8c632..878af2d76e0e 100644
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
@@ -295,9 +297,20 @@ struct ffa_mem_region {
 struct ffa_ctx_notif {
     /*
      * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
-     * pending global notifications.
+     * pending notifications from the secure world.
      */
     bool secure_pending;
+
+    /*
+     * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
+     * pending notifications from VMs (including framework ones).
+     */
+    bool vm_pending;
+
+    /*
+     * True if domain has buffer full notification pending
+     */
+    bool buff_full_pending;
 };
 
 struct ffa_ctx {
@@ -369,6 +382,14 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs);
 void ffa_handle_notification_get(struct cpu_user_regs *regs);
 int ffa_handle_notification_set(struct cpu_user_regs *regs);
 
+#ifdef CONFIG_FFA_VM_TO_VM
+void ffa_raise_rx_buffer_full(struct domain *d);
+#else
+static inline void ffa_raise_rx_buffer_full(struct domain *d)
+{
+}
+#endif
+
 void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid);
 int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs);
 
-- 
2.47.1


