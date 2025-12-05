Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDCECA7333
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 11:38:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178640.1502422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRTC9-0006vf-Ci; Fri, 05 Dec 2025 10:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178640.1502422; Fri, 05 Dec 2025 10:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRTC9-0006qu-4q; Fri, 05 Dec 2025 10:37:49 +0000
Received: by outflank-mailman (input) for mailman id 1178640;
 Fri, 05 Dec 2025 10:37:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d4nT=6L=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vRTC7-0005j7-Qa
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 10:37:47 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7027a3d5-d1c6-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 11:37:46 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A65B5339;
 Fri,  5 Dec 2025 02:37:38 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.45.211])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F09853F86F;
 Fri,  5 Dec 2025 02:37:44 -0800 (PST)
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
X-Inumbo-ID: 7027a3d5-d1c6-11f0-9d1b-b5c5bf9af7f9
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v1 06/12] xen/arm: ffa: rework VM RX/TX buffer management
Date: Fri,  5 Dec 2025 11:36:39 +0100
Message-ID: <17755cde0354ba0a70996b3a0e9eae23c2342b72.1764930353.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1764930353.git.bertrand.marquis@arm.com>
References: <cover.1764930353.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework access to VM RX/TX buffer to use acquire/release functions
equivalent to the ones used for the SPMC RX/TX buffers and remove all
direct access to ctx->tx or ctx->rx by giving back the buffer pointer
and size back in acquire.

This design ensures that rx or page_count is not accessed without the
lock held and limit direct usage of the context rx/tx buffer info to
ffa_rxtx.c

Modify msg, partinfo and shm code to use the new RX/TX buffer
acquire/release functions and remove all direct accesses to rx/tx and
page_count so that any access is done only with the lock taken.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v1:
- patch introduced
---
 xen/arch/arm/tee/ffa.c          |  2 +-
 xen/arch/arm/tee/ffa_msg.c      | 32 ++++++++++++------------
 xen/arch/arm/tee/ffa_partinfo.c |  8 +++---
 xen/arch/arm/tee/ffa_private.h  |  6 +++--
 xen/arch/arm/tee/ffa_rxtx.c     | 43 ++++++++++++++++++++++++++++-----
 xen/arch/arm/tee/ffa_shm.c      | 18 +++++++-------
 6 files changed, 72 insertions(+), 37 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 43af49d1c011..69a5e1e876ce 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -345,7 +345,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
         ffa_handle_partition_info_get(regs);
         return true;
     case FFA_RX_RELEASE:
-        e = ffa_rx_release(d);
+        e = ffa_rx_release(ctx);
         break;
     case FFA_MSG_SEND_DIRECT_REQ_32:
     case FFA_MSG_SEND_DIRECT_REQ_64:
diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
index 2c2ebc9c5cd6..d60eed6d8811 100644
--- a/xen/arch/arm/tee/ffa_msg.c
+++ b/xen/arch/arm/tee/ffa_msg.c
@@ -94,6 +94,8 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
     struct domain *dst_d;
     struct ffa_ctx *dst_ctx;
     struct ffa_part_msg_rxtx *dst_msg;
+    void *rx_buf;
+    size_t rx_size;
     int err;
     int32_t ret;
 
@@ -120,20 +122,19 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
     }
 
     /* This also checks that destination has set a Rx buffer */
-    ret = ffa_rx_acquire(dst_d);
+    ret = ffa_rx_acquire(dst_ctx , &rx_buf, &rx_size);
     if ( ret )
         goto out_unlock;
 
     /* we need to have enough space in the destination buffer */
-    if ( (dst_ctx->page_count * FFA_PAGE_SIZE -
-          sizeof(struct ffa_part_msg_rxtx)) < src_msg->msg_size )
+    if ( (rx_size - sizeof(struct ffa_part_msg_rxtx)) < src_msg->msg_size )
     {
         ret = FFA_RET_NO_MEMORY;
-        ffa_rx_release(dst_d);
+        ffa_rx_release(dst_ctx);
         goto out_unlock;
     }
 
-    dst_msg = dst_ctx->rx;
+    dst_msg = rx_buf;
 
     /* prepare destination header */
     dst_msg->flags = 0;
@@ -142,7 +143,7 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
     dst_msg->send_recv_id = src_msg->send_recv_id;
     dst_msg->msg_size = src_msg->msg_size;
 
-    memcpy(dst_ctx->rx + sizeof(struct ffa_part_msg_rxtx),
+    memcpy(rx_buf + sizeof(struct ffa_part_msg_rxtx),
            src_buf + src_msg->msg_offset, src_msg->msg_size);
 
     /* receiver rx buffer will be released by the receiver*/
@@ -159,17 +160,20 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
 {
     struct domain *src_d = current->domain;
     struct ffa_ctx *src_ctx = src_d->arch.tee;
+    const void *tx_buf;
+    size_t tx_size;
     struct ffa_part_msg_rxtx src_msg;
     uint16_t dst_id, src_id;
     int32_t ret;
 
     BUILD_BUG_ON(sizeof(struct ffa_part_msg_rxtx) >= FFA_PAGE_SIZE);
 
-    if ( !spin_trylock(&src_ctx->tx_lock) )
-        return FFA_RET_BUSY;
+    ret = ffa_tx_acquire(src_ctx, &tx_buf, &tx_size);
+    if ( ret != FFA_RET_OK )
+        return ret;
 
     /* create a copy of the message header */
-    memcpy(&src_msg, src_ctx->tx, sizeof(src_msg));
+    memcpy(&src_msg, tx_buf, sizeof(src_msg));
 
     src_id = src_msg.send_recv_id >> 16;
     dst_id = src_msg.send_recv_id & GENMASK(15,0);
@@ -182,10 +186,8 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
 
     /* check source message fits in buffer */
     if ( src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx) ||
-            src_msg.msg_size == 0 ||
-            src_msg.msg_offset > src_ctx->page_count * FFA_PAGE_SIZE ||
-            src_msg.msg_size > (src_ctx->page_count * FFA_PAGE_SIZE -
-                                src_msg.msg_offset) )
+            src_msg.msg_size == 0 || src_msg.msg_offset > tx_size ||
+            src_msg.msg_size > (tx_size - src_msg.msg_offset) )
     {
         ret = FFA_RET_INVALID_PARAMETERS;
         goto out;
@@ -206,12 +208,12 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
     else if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
     {
         /* Message for a VM */
-        ret = ffa_msg_send2_vm(dst_id, src_ctx->tx, &src_msg);
+        ret = ffa_msg_send2_vm(dst_id, tx_buf, &src_msg);
     }
     else
         ret = FFA_RET_INVALID_PARAMETERS;
 
 out:
-    spin_unlock(&src_ctx->tx_lock);
+    ffa_tx_release(src_ctx);
     return ret;
 }
diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index 145b869957b0..16c905cb12b8 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -224,6 +224,7 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
         get_user_reg(regs, 4),
     };
     uint32_t dst_size = 0;
+    size_t buf_size;
     void *dst_buf, *end_buf;
     uint32_t ffa_vm_count = 0, ffa_sp_count = 0;
 
@@ -268,12 +269,11 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
     }
 
     /* Get the RX buffer to write the list of partitions */
-    ret = ffa_rx_acquire(d);
+    ret = ffa_rx_acquire(ctx, &dst_buf, &buf_size);
     if ( ret != FFA_RET_OK )
         goto out;
 
-    dst_buf = ctx->rx;
-    end_buf = ctx->rx + ctx->page_count * FFA_PAGE_SIZE;
+    end_buf = dst_buf + buf_size;
 
     /* An entry should be smaller than a page */
     BUILD_BUG_ON(sizeof(struct ffa_partition_info_1_1) > FFA_PAGE_SIZE);
@@ -304,7 +304,7 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
 
 out_rx_release:
     if ( ret )
-        ffa_rx_release(d);
+        ffa_rx_release(ctx);
 out:
     if ( ret )
         ffa_set_regs_error(regs, ret);
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 8797a62abd01..0d1bab6cc700 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -444,8 +444,10 @@ void ffa_rxtx_domain_destroy(struct domain *d);
 int32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
 			     register_t rx_addr, uint32_t page_count);
 int32_t ffa_handle_rxtx_unmap(void);
-int32_t ffa_rx_acquire(struct domain *d);
-int32_t ffa_rx_release(struct domain *d);
+int32_t ffa_rx_acquire(struct ffa_ctx *ctx, void **buf, size_t *buf_size);
+int32_t ffa_rx_release(struct ffa_ctx *ctx);
+int32_t ffa_tx_acquire(struct ffa_ctx *ctx, const void **buf, size_t *buf_size);
+int32_t ffa_tx_release(struct ffa_ctx *ctx);
 
 void ffa_notif_init(void);
 void ffa_notif_init_interrupt(void);
diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
index e325eae07bda..f79f2cf406aa 100644
--- a/xen/arch/arm/tee/ffa_rxtx.c
+++ b/xen/arch/arm/tee/ffa_rxtx.c
@@ -257,10 +257,9 @@ int32_t ffa_handle_rxtx_unmap(void)
     return rxtx_unmap(current->domain);
 }
 
-int32_t ffa_rx_acquire(struct domain *d)
+int32_t ffa_rx_acquire(struct ffa_ctx *ctx, void **buf, size_t *buf_size)
 {
     int32_t ret = FFA_RET_OK;
-    struct ffa_ctx *ctx = d->arch.tee;
 
     spin_lock(&ctx->rx_lock);
 
@@ -278,21 +277,22 @@ int32_t ffa_rx_acquire(struct domain *d)
 
     if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
     {
-        ret = ffa_simple_call(FFA_RX_ACQUIRE, ffa_get_vm_id(d), 0, 0, 0);
+        ret = ffa_simple_call(FFA_RX_ACQUIRE, ctx->ffa_id, 0, 0, 0);
         if ( ret != FFA_RET_OK )
             goto out;
     }
     ctx->rx_is_free = false;
+    *buf = ctx->rx;
+    *buf_size = ctx->page_count * FFA_PAGE_SIZE;
 out:
     spin_unlock(&ctx->rx_lock);
 
     return ret;
 }
 
-int32_t ffa_rx_release(struct domain *d)
+int32_t ffa_rx_release(struct ffa_ctx *ctx)
 {
     int32_t ret = FFA_RET_DENIED;
-    struct ffa_ctx *ctx = d->arch.tee;
 
     spin_lock(&ctx->rx_lock);
 
@@ -301,7 +301,7 @@ int32_t ffa_rx_release(struct domain *d)
 
     if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
     {
-        ret = ffa_simple_call(FFA_RX_RELEASE, ffa_get_vm_id(d), 0, 0, 0);
+        ret = ffa_simple_call(FFA_RX_RELEASE, ctx->ffa_id, 0, 0, 0);
         if ( ret != FFA_RET_OK )
             goto out;
     }
@@ -313,6 +313,37 @@ out:
     return ret;
 }
 
+int32_t ffa_tx_acquire(struct ffa_ctx *ctx, const void **buf, size_t *buf_size)
+{
+    int32_t ret = FFA_RET_DENIED;
+
+    if ( !spin_trylock(&ctx->tx_lock) )
+        return FFA_RET_BUSY;
+
+    if ( !ctx->page_count )
+        goto err_unlock;
+
+    if ( !ctx->tx )
+        goto err_unlock;
+
+    *buf = ctx->tx;
+    *buf_size = ctx->page_count * FFA_PAGE_SIZE;
+    return FFA_RET_OK;
+
+err_unlock:
+    spin_unlock(&ctx->tx_lock);
+
+    return ret;
+}
+
+int32_t ffa_tx_release(struct ffa_ctx *ctx)
+{
+    ASSERT(spin_is_locked(&ctx->tx_lock));
+
+    spin_unlock(&ctx->tx_lock);
+    return FFA_RET_OK;
+}
+
 int32_t ffa_rxtx_domain_init(struct domain *d)
 {
     struct ffa_ctx *ctx = d->arch.tee;
diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
index e275d3769d9b..b862578c553c 100644
--- a/xen/arch/arm/tee/ffa_shm.c
+++ b/xen/arch/arm/tee/ffa_shm.c
@@ -460,6 +460,8 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
     struct ffa_mem_transaction_int trans;
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
+    const void *tx_buf;
+    size_t tx_size;
     struct ffa_shm_mem *shm = NULL;
     register_t handle_hi = 0;
     register_t handle_lo = 0;
@@ -498,16 +500,14 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
         goto out_set_ret;
     }
 
-    if ( !spin_trylock(&ctx->tx_lock) )
-    {
-        ret = FFA_RET_BUSY;
+    ret = ffa_tx_acquire(ctx, &tx_buf, &tx_size);
+    if ( ret != FFA_RET_OK )
         goto out_set_ret;
-    }
 
-    if ( frag_len > ctx->page_count * FFA_PAGE_SIZE )
+    if ( frag_len > tx_size )
         goto out_unlock;
 
-    ret = read_mem_transaction(ACCESS_ONCE(ctx->guest_vers), ctx->tx,
+    ret = read_mem_transaction(ACCESS_ONCE(ctx->guest_vers), tx_buf,
                                frag_len, &trans);
     if ( ret )
         goto out_unlock;
@@ -535,7 +535,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
     if ( trans.mem_access_offs + trans.mem_access_size > frag_len )
         goto out_unlock;
 
-    mem_access = ctx->tx + trans.mem_access_offs;
+    mem_access = tx_buf + trans.mem_access_offs;
 
     dst_id = ACCESS_ONCE(mem_access->access_perm.endpoint_id);
     if ( !FFA_ID_IS_SECURE(dst_id) )
@@ -558,7 +558,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
         goto out_unlock;
     }
 
-    region_descr = ctx->tx + region_offs;
+    region_descr = tx_buf + region_offs;
     range_count = ACCESS_ONCE(region_descr->address_range_count);
     page_count = ACCESS_ONCE(region_descr->total_page_count);
 
@@ -605,7 +605,7 @@ out:
     if ( ret )
         free_ffa_shm_mem(d, shm);
 out_unlock:
-    spin_unlock(&ctx->tx_lock);
+    ffa_tx_release(ctx);
 
 out_set_ret:
     if ( ret == 0)
-- 
2.51.2


