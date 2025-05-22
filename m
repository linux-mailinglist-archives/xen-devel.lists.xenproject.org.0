Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B001FAC0F76
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 17:08:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994207.1377297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7XI-0007uf-8y; Thu, 22 May 2025 15:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994207.1377297; Thu, 22 May 2025 15:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI7XI-0007rp-5x; Thu, 22 May 2025 15:08:44 +0000
Received: by outflank-mailman (input) for mailman id 994207;
 Thu, 22 May 2025 15:08:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isH4=YG=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1uI7XG-0006dU-LQ
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 15:08:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a538790b-371e-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 17:08:41 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6497D293B;
 Thu, 22 May 2025 08:08:26 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.50.224])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 578443F673;
 Thu, 22 May 2025 08:08:39 -0700 (PDT)
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
X-Inumbo-ID: a538790b-371e-11f0-b892-0df219b8e170
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v6 5/6] xen/arm: ffa: Add indirect message between VM
Date: Thu, 22 May 2025 17:08:06 +0200
Message-ID: <594a9d91dc499c219489111e0c896825fae32300.1747925287.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1747925287.git.bertrand.marquis@arm.com>
References: <cover.1747925287.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for indirect messages between VMs.
This is only enabled if CONFIG_FFA_VM_TO_VM is selected.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
---
Changes in v6:
- fix code alignment (Jens)
- add Jens R-b
Changes in v5:
- Prevent potential overflow in send2 handling (Julien)
- Only use page_count with rx lock acquired
- Fix an issue where send2 between VMs was not doing the copy from the
  tx buffer but from a wrong location in the stack. This bug was
  introduced in v4 when switching to a local copy for the header.
Changes in v4:
- Use a local copy of the message header to prevent a TOC/TOU possible
  issue when using the payload size
Changes in v3:
- Move vm to vm indirect message handling in a sub function to simplify
  lock handling and make implementation easier to read
Changes in v2:
- Switch ifdef to IS_ENABLED
---
 xen/arch/arm/tee/ffa_msg.c | 117 ++++++++++++++++++++++++++++++++-----
 1 file changed, 102 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
index ee594e737fc7..c20c5bec0f76 100644
--- a/xen/arch/arm/tee/ffa_msg.c
+++ b/xen/arch/arm/tee/ffa_msg.c
@@ -88,43 +88,130 @@ out:
                  resp.a7 & mask);
 }
 
+static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
+                                struct ffa_part_msg_rxtx *src_msg)
+{
+    struct domain *dst_d;
+    struct ffa_ctx *dst_ctx;
+    struct ffa_part_msg_rxtx *dst_msg;
+    int err;
+    int32_t ret;
+
+    if ( dst_id == 0 )
+        /* FF-A ID 0 is the hypervisor, this is not valid */
+        return FFA_RET_INVALID_PARAMETERS;
+
+    /* This is also checking that dest is not src */
+    err = rcu_lock_live_remote_domain_by_id(dst_id - 1, &dst_d);
+    if ( err )
+        return FFA_RET_INVALID_PARAMETERS;
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
+    if ( (dst_ctx->page_count * FFA_PAGE_SIZE -
+          sizeof(struct ffa_part_msg_rxtx)) < src_msg->msg_size )
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
+           src_buf + src_msg->msg_offset, src_msg->msg_size);
+
+    /* receiver rx buffer will be released by the receiver*/
+
+out_unlock:
+    rcu_unlock_domain(dst_d);
+    if ( !ret )
+        ffa_raise_rx_buffer_full(dst_d);
+
+    return ret;
+}
+
 int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
 {
     struct domain *src_d = current->domain;
     struct ffa_ctx *src_ctx = src_d->arch.tee;
-    const struct ffa_part_msg_rxtx *src_msg;
+    struct ffa_part_msg_rxtx src_msg;
     uint16_t dst_id, src_id;
     int32_t ret;
 
-    if ( !ffa_fw_supports_fid(FFA_MSG_SEND2) )
-        return FFA_RET_NOT_SUPPORTED;
+    BUILD_BUG_ON(sizeof(struct ffa_part_msg_rxtx) >= FFA_PAGE_SIZE);
 
     if ( !spin_trylock(&src_ctx->tx_lock) )
         return FFA_RET_BUSY;
 
-    src_msg = src_ctx->tx;
-    src_id = src_msg->send_recv_id >> 16;
-    dst_id = src_msg->send_recv_id & GENMASK(15,0);
+    /* create a copy of the message header */
+    memcpy(&src_msg, src_ctx->tx, sizeof(src_msg));
 
-    if ( src_id != ffa_get_vm_id(src_d) || !FFA_ID_IS_SECURE(dst_id) )
+    src_id = src_msg.send_recv_id >> 16;
+    dst_id = src_msg.send_recv_id & GENMASK(15,0);
+
+    if ( src_id != ffa_get_vm_id(src_d) )
     {
         ret = FFA_RET_INVALID_PARAMETERS;
-        goto out_unlock_tx;
+        goto out;
     }
 
     /* check source message fits in buffer */
-    if ( src_ctx->page_count * FFA_PAGE_SIZE <
-         src_msg->msg_offset + src_msg->msg_size ||
-         src_msg->msg_offset < sizeof(struct ffa_part_msg_rxtx) )
+    if ( src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx) ||
+            src_msg.msg_size == 0 ||
+            src_msg.msg_offset > src_ctx->page_count * FFA_PAGE_SIZE ||
+            src_msg.msg_size > (src_ctx->page_count * FFA_PAGE_SIZE -
+                                src_msg.msg_offset) )
     {
         ret = FFA_RET_INVALID_PARAMETERS;
-        goto out_unlock_tx;
+        goto out;
     }
 
-    ret = ffa_simple_call(FFA_MSG_SEND2,
-                          ((uint32_t)ffa_get_vm_id(src_d)) << 16, 0, 0, 0);
+    if ( FFA_ID_IS_SECURE(dst_id) )
+    {
+        /* Message for a secure partition */
+        if ( !ffa_fw_supports_fid(FFA_MSG_SEND2) )
+        {
+            ret = FFA_RET_NOT_SUPPORTED;
+            goto out;
+        }
+
+        ret = ffa_simple_call(FFA_MSG_SEND2,
+                              ((uint32_t)ffa_get_vm_id(src_d)) << 16, 0, 0, 0);
+    }
+    else if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
+    {
+        /* Message for a VM */
+        ret = ffa_msg_send2_vm(dst_id, src_ctx->tx, &src_msg);
+    }
+    else
+        ret = FFA_RET_INVALID_PARAMETERS;
 
-out_unlock_tx:
+out:
     spin_unlock(&src_ctx->tx_lock);
     return ret;
 }
-- 
2.47.1


