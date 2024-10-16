Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 621C49A057B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 11:27:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819817.1233299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10Jb-0006yQ-J3; Wed, 16 Oct 2024 09:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819817.1233299; Wed, 16 Oct 2024 09:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t10Jb-0006wU-Fr; Wed, 16 Oct 2024 09:27:35 +0000
Received: by outflank-mailman (input) for mailman id 819817;
 Wed, 16 Oct 2024 09:27:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0z3=RM=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1t10El-0001Bq-Qm
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 09:22:35 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2bf1599a-8ba0-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 11:22:32 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 507A9FEC;
 Wed, 16 Oct 2024 02:23:01 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.21.81])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 683CF3F528;
 Wed, 16 Oct 2024 02:22:30 -0700 (PDT)
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
X-Inumbo-ID: 2bf1599a-8ba0-11ef-a0be-8be0dac302b0
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [RFC PATCH 3/4] xen/arm: ffa: Add indirect message between VM
Date: Wed, 16 Oct 2024 11:21:57 +0200
Message-ID: <52d9809a114965832ee632756152d9125e93d4ea.1729069025.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729069025.git.bertrand.marquis@arm.com>
References: <cover.1729069025.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for indirect messages between VMs.
This is only enabled if CONFIG_FFA_VM_TO_VM is selected.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa_msg.c | 96 ++++++++++++++++++++++++++++++++++----
 1 file changed, 88 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
index 335f246ba657..25f184a06546 100644
--- a/xen/arch/arm/tee/ffa_msg.c
+++ b/xen/arch/arm/tee/ffa_msg.c
@@ -95,9 +95,12 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
     const struct ffa_part_msg_rxtx *src_msg;
     uint16_t dst_id, src_id;
     int32_t ret;
-
-    if ( !ffa_fw_supports_fid(FFA_MSG_SEND2) )
-        return FFA_RET_NOT_SUPPORTED;
+#ifdef CONFIG_FFA_VM_TO_VM
+    struct domain *dst_d;
+    struct ffa_ctx *dst_ctx;
+    struct ffa_part_msg_rxtx *dst_msg;
+    int err;
+#endif
 
     if ( !spin_trylock(&src_ctx->tx_lock) )
         return FFA_RET_BUSY;
@@ -106,10 +109,10 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
     src_id = src_msg->send_recv_id >> 16;
     dst_id = src_msg->send_recv_id & GENMASK(15,0);
 
-    if ( src_id != ffa_get_vm_id(src_d) || !FFA_ID_IS_SECURE(dst_id) )
+    if ( src_id != ffa_get_vm_id(src_d) )
     {
         ret = FFA_RET_INVALID_PARAMETERS;
-        goto out_unlock_tx;
+        goto out;
     }
 
     /* check source message fits in buffer */
@@ -118,12 +121,89 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
          src_msg->msg_offset < sizeof(struct ffa_part_msg_rxtx) )
     {
         ret = FFA_RET_INVALID_PARAMETERS;
-        goto out_unlock_tx;
+        goto out;
     }
 
-    ret = ffa_simple_call(FFA_MSG_SEND2, ((uint32_t)src_id) << 16, 0, 0, 0);
+    if ( FFA_ID_IS_SECURE(dst_id) )
+    {
+        /* Message for a secure partition */
+        if ( !ffa_fw_supports_fid(FFA_MSG_SEND2) )
+        {
+            ret = FFA_RET_NOT_SUPPORTED;
+            goto out;
+        }
+
+        ret = ffa_simple_call(FFA_MSG_SEND2, ((uint32_t)src_id) << 16, 0, 0,
+                              0);
+        goto out;
+    }
 
-out_unlock_tx:
+#ifndef CONFIG_FFA_VM_TO_VM
+    ret = FFA_RET_INVALID_PARAMETERS;
+#else
+    /* Message for a VM */
+    if ( dst_id == 0 )
+    {
+        /* FF-A ID 0 is the hypervisor, this is not valid */
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out;
+    }
+
+    /* This is also checking that dest is not src */
+    err = rcu_lock_live_remote_domain_by_id(dst_id - 1, &dst_d);
+    if ( err )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out;
+    }
+
+    if ( dst_d->arch.tee == NULL )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out_unlock;
+    }
+
+    dst_ctx = dst_d->arch.tee;
+    if ( !dst_ctx->guest_vers )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out_unlock;
+    }
+
+    /* This also checks that destination has set a Rx buffer */
+    ret = ffa_rx_acquire(dst_d);
+    if ( ret )
+        goto out_unlock;
+
+    /* we need to have enough space in the destination buffer */
+    if ( dst_ctx->page_count * FFA_PAGE_SIZE <
+            (sizeof(struct ffa_part_msg_rxtx) + src_msg->msg_size) )
+    {
+        ret = FFA_RET_NO_MEMORY;
+        ffa_rx_release(dst_d);
+        goto out_unlock;
+    }
+
+    dst_msg = dst_ctx->rx;
+
+    /* prepare destination header */
+    dst_msg->flags = 0;
+    dst_msg->reserved = 0;
+    dst_msg->msg_offset = sizeof(struct ffa_part_msg_rxtx);
+    dst_msg->send_recv_id = src_msg->send_recv_id;
+    dst_msg->msg_size = src_msg->msg_size;
+
+    memcpy(dst_ctx->rx + sizeof(struct ffa_part_msg_rxtx),
+           src_ctx->tx + src_msg->msg_offset, src_msg->msg_size);
+
+    /* receiver rx buffer will be released by the receiver*/
+
+out_unlock:
+    rcu_unlock_domain(dst_d);
+    if ( !ret )
+        ffa_raise_rx_buffer_full(dst_d);
+#endif
+out:
     spin_unlock(&src_ctx->tx_lock);
     return ret;
 }
-- 
2.47.0


