Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51549A59826
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 15:51:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906552.1313988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1treTJ-0003iv-6M; Mon, 10 Mar 2025 14:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906552.1313988; Mon, 10 Mar 2025 14:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1treTJ-0003h0-2z; Mon, 10 Mar 2025 14:51:13 +0000
Received: by outflank-mailman (input) for mailman id 906552;
 Mon, 10 Mar 2025 14:51:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t+uq=V5=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1treTH-0002rH-IF
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 14:51:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1b170fb0-fdbf-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 15:51:10 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE38216F2;
 Mon, 10 Mar 2025 07:51:21 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.38.103])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BFDD3F5A1;
 Mon, 10 Mar 2025 07:51:08 -0700 (PDT)
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
X-Inumbo-ID: 1b170fb0-fdbf-11ef-9ab8-95dc52dad729
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 3/5] xen/arm: ffa: Add buffer full notification support
Date: Mon, 10 Mar 2025 15:50:35 +0100
Message-ID: <5bbdc8bc0377014a0c683f8f9e154267e4b27c1f.1741617888.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1741617888.git.bertrand.marquis@arm.com>
References: <cover.1741617888.git.bertrand.marquis@arm.com>
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
Changes in v2:
- Code style fix
---
 xen/arch/arm/tee/ffa_notif.c   | 26 +++++++++++++++++++++-----
 xen/arch/arm/tee/ffa_private.h | 13 +++++++++++++
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 00efaf8f7353..d19aa5c5bef6 100644
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
+          test_and_clear_bool(ctx->notif.buff_full_pending) )
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
index bd6877d8c632..1f5067d5d0c9 100644
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
@@ -369,6 +378,10 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs);
 void ffa_handle_notification_get(struct cpu_user_regs *regs);
 int ffa_handle_notification_set(struct cpu_user_regs *regs);
 
+#ifdef CONFIG_FFA_VM_TO_VM
+void ffa_raise_rx_buffer_full(struct domain *d);
+#endif
+
 void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid);
 int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs);
 
-- 
2.47.1


