Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7A197C8FB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 14:20:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800673.1210687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srG8Z-0005cs-8r; Thu, 19 Sep 2024 12:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800673.1210687; Thu, 19 Sep 2024 12:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srG8Z-0005WE-0g; Thu, 19 Sep 2024 12:19:55 +0000
Received: by outflank-mailman (input) for mailman id 800673;
 Thu, 19 Sep 2024 12:19:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lyjY=QR=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1srG8W-0003zB-VT
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 12:19:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 78c6d96c-7681-11ef-a0b8-8be0dac302b0;
 Thu, 19 Sep 2024 14:19:52 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68CB613D5;
 Thu, 19 Sep 2024 05:20:21 -0700 (PDT)
Received: from C3HXLD123V.emea.arm.com (usa-sjc-mx-foss1.foss.arm.com
 [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1BA8F3F64C;
 Thu, 19 Sep 2024 05:19:50 -0700 (PDT)
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
X-Inumbo-ID: 78c6d96c-7681-11ef-a0b8-8be0dac302b0
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 07/10] xen/arm: ffa: Transmit RXTX buffers to the SPMC
Date: Thu, 19 Sep 2024 14:19:07 +0200
Message-Id: <0bb3d0faf5a80112a95363ee9fd023d510e3f0c8.1726676338.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1726676338.git.bertrand.marquis@arm.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an RXTX buffer is mapped by a VM transmit it to the SPMC when it
supports RX_ACQUIRE.
As a consequence of that, we must acquire the RX buffer of a VM from the
SPMC when we want to use it:
- create a generic acquire and release function to get the rx buffer of
  a VM which gets it from the SPMC when supported
- rename the rx_acquire to hyp_rx_acquire to remove confusion
- rework the rx_lock to only lock access to rx_is_free and only allow
  usage of the rx buffer to one who managed to acquire it, thus removing
  the trylock and returning busy if rx_is_free is false

As part of this change move some structure definition to ffa_private
from ffa_shm as those are need for the MAP call with the SPMC.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c          |   2 +-
 xen/arch/arm/tee/ffa_partinfo.c |  28 +++----
 xen/arch/arm/tee/ffa_private.h  |  22 +++++-
 xen/arch/arm/tee/ffa_rxtx.c     | 126 ++++++++++++++++++++++++++++----
 xen/arch/arm/tee/ffa_shm.c      |  15 ----
 5 files changed, 142 insertions(+), 51 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 45f9c1db8a6e..4a769e20007b 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -344,7 +344,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
         ffa_handle_partition_info_get(regs);
         return true;
     case FFA_RX_RELEASE:
-        e = ffa_handle_rx_release();
+        e = ffa_rx_release(d);
         break;
     case FFA_MSG_SEND_DIRECT_REQ_32:
     case FFA_MSG_SEND_DIRECT_REQ_64:
diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index b391b1adf9f2..fde187dba4e5 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -121,11 +121,9 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
         goto out;
     }
 
-    if ( !spin_trylock(&ctx->rx_lock) )
-    {
-        ret = FFA_RET_BUSY;
+    ret = ffa_rx_acquire(d);
+    if ( ret != FFA_RET_OK )
         goto out;
-    }
 
     dst_buf = ctx->rx;
 
@@ -135,22 +133,16 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
         goto out_rx_release;
     }
 
-    if ( !ctx->page_count || !ctx->rx_is_free )
-    {
-        ret = FFA_RET_DENIED;
-        goto out_rx_release;
-    }
-
     spin_lock(&ffa_rx_buffer_lock);
 
     ret = ffa_partition_info_get(uuid, 0, &ffa_sp_count, &src_size);
 
     if ( ret )
-        goto out_rx_buf_unlock;
+        goto out_rx_hyp_unlock;
 
     /*
      * ffa_partition_info_get() succeeded so we now own the RX buffer we
-     * share with the SPMC. We must give it back using ffa_rx_release()
+     * share with the SPMC. We must give it back using ffa_hyp_rx_release()
      * once we've copied the content.
      */
 
@@ -193,15 +185,13 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
         }
     }
 
-    ctx->rx_is_free = false;
-
 out_rx_hyp_release:
-    ffa_rx_release();
-out_rx_buf_unlock:
+    ffa_hyp_rx_release();
+out_rx_hyp_unlock:
     spin_unlock(&ffa_rx_buffer_lock);
 out_rx_release:
-    spin_unlock(&ctx->rx_lock);
-
+    if ( ret != FFA_RET_OK )
+        ffa_rx_release(d);
 out:
     if ( ret )
         ffa_set_regs_error(regs, ret);
@@ -368,7 +358,7 @@ bool ffa_partinfo_init(void)
     ret = init_subscribers(count, fpi_size);
 
 out:
-    ffa_rx_release();
+    ffa_hyp_rx_release();
     return ret;
 }
 
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index c6903e335489..84b0f866a71e 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -263,6 +263,21 @@
                                     FFA_FUNC_ID(FFA_FUNC_MIN)) << 1 | \
                                     FFA_FUNC_CONV(id))
 
+/* Constituent memory region descriptor */
+struct ffa_address_range {
+    uint64_t address;
+    uint32_t page_count;
+    uint32_t reserved;
+};
+
+/* Composite memory region descriptor */
+struct ffa_mem_region {
+    uint32_t total_page_count;
+    uint32_t address_range_count;
+    uint64_t reserved;
+    struct ffa_address_range address_range_array[];
+};
+
 struct ffa_ctx_notif {
     bool enabled;
 
@@ -290,7 +305,7 @@ struct ffa_ctx {
     struct ffa_ctx_notif notif;
     /*
      * tx_lock is used to serialize access to tx
-     * rx_lock is used to serialize access to rx
+     * rx_lock is used to serialize access to rx_is_free
      * lock is used for the rest in this struct
      */
     spinlock_t tx_lock;
@@ -329,7 +344,8 @@ void ffa_rxtx_domain_destroy(struct domain *d);
 uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
 			     register_t rx_addr, uint32_t page_count);
 uint32_t ffa_handle_rxtx_unmap(void);
-int32_t ffa_handle_rx_release(void);
+int32_t ffa_rx_acquire(struct domain *d);
+int32_t ffa_rx_release(struct domain *d);
 
 void ffa_notif_init(void);
 void ffa_notif_init_interrupt(void);
@@ -418,7 +434,7 @@ static inline int32_t ffa_simple_call(uint32_t fid, register_t a1,
     return ffa_get_ret_code(&resp);
 }
 
-static inline int32_t ffa_rx_release(void)
+static inline int32_t ffa_hyp_rx_release(void)
 {
     return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
 }
diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
index cb54c76911fd..dacf33cc9efc 100644
--- a/xen/arch/arm/tee/ffa_rxtx.c
+++ b/xen/arch/arm/tee/ffa_rxtx.c
@@ -30,6 +30,17 @@ struct ffa_endpoint_rxtx_descriptor_1_1 {
     uint32_t tx_region_offs;
 };
 
+static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
+                            uint32_t page_count)
+{
+    return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_count, 0);
+}
+
+static int32_t ffa_rxtx_unmap(void)
+{
+    return ffa_simple_call(FFA_RXTX_UNMAP, 0, 0, 0, 0);
+}
+
 uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
 			     register_t rx_addr, uint32_t page_count)
 {
@@ -42,6 +53,9 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
     void *rx;
     void *tx;
 
+    /* The code is considering that we only get one page for now */
+    BUILD_BUG_ON(FFA_MAX_RXTX_PAGE_COUNT != 1);
+
     if ( !smccc_is_conv_64(fid) )
     {
         /*
@@ -87,6 +101,65 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
     if ( !rx )
         goto err_unmap_tx;
 
+    /*
+     * Transmit the RX/TX buffer information to the SPM if acquire is supported
+     * as the spec says that if not there is not need to acquire/release/map
+     * rxtx buffers from the SPMC
+     */
+    if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
+    {
+        struct ffa_endpoint_rxtx_descriptor_1_1 *rxtx_desc;
+        struct ffa_mem_region *mem_reg;
+
+        /* All must fit in our TX buffer */
+        BUILD_BUG_ON((sizeof(*rxtx_desc) + sizeof(*mem_reg)*2 +
+                      sizeof(struct ffa_address_range)*2) > FFA_PAGE_SIZE);
+
+        spin_lock(&ffa_tx_buffer_lock);
+        rxtx_desc = ffa_tx;
+
+        /*
+         * We have only one page for each so we pack everything:
+         * - rx region descriptor
+         * - rx region range
+         * - tx region descriptor
+         * - tx region range
+         */
+        rxtx_desc->sender_id = ffa_get_vm_id(d);
+        rxtx_desc->reserved = 0;
+        rxtx_desc->rx_region_offs = sizeof(*rxtx_desc);
+        rxtx_desc->tx_region_offs = sizeof(*rxtx_desc) +
+                                    offsetof(struct ffa_mem_region,
+                                             address_range_array[1]);
+
+        /* rx buffer */
+        mem_reg = ffa_tx + sizeof(*rxtx_desc);
+        mem_reg->total_page_count = 1;
+        mem_reg->address_range_count = 1;
+        mem_reg->reserved = 0;
+
+        mem_reg->address_range_array[0].address = page_to_maddr(rx_pg);
+        mem_reg->address_range_array[0].page_count = 1;
+        mem_reg->address_range_array[0].reserved = 0;
+
+        /* tx buffer */
+        mem_reg = ffa_tx + rxtx_desc->tx_region_offs;
+        mem_reg->total_page_count = 1;
+        mem_reg->address_range_count = 1;
+        mem_reg->reserved = 0;
+
+        mem_reg->address_range_array[0].address = page_to_maddr(tx_pg);
+        mem_reg->address_range_array[0].page_count = 1;
+        mem_reg->address_range_array[0].reserved = 0;
+
+        ret = ffa_rxtx_map(0, 0, 1);
+
+        spin_unlock(&ffa_tx_buffer_lock);
+
+        if ( ret != FFA_RET_OK )
+            goto err_unmap_tx;
+    }
+
     ctx->rx = rx;
     ctx->tx = tx;
     ctx->rx_pg = rx_pg;
@@ -132,34 +205,61 @@ uint32_t ffa_handle_rxtx_unmap(void)
     return FFA_RET_OK;
 }
 
-int32_t ffa_handle_rx_release(void)
+int32_t ffa_rx_acquire(struct domain *d)
 {
     int32_t ret = FFA_RET_DENIED;
-    struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
 
-    if ( !spin_trylock(&ctx->rx_lock) )
-        return FFA_RET_BUSY;
+    spin_lock(&ctx->rx_lock);
 
-    if ( !ctx->page_count || ctx->rx_is_free )
+    if ( !ctx->page_count )
+    {
+        ret = FFA_RET_DENIED;
+        goto out;
+    }
+
+    if ( !ctx->rx_is_free )
+    {
+        ret = FFA_RET_BUSY;
         goto out;
+    }
+
+    if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
+    {
+        ret = ffa_simple_call(FFA_RX_ACQUIRE, ffa_get_vm_id(d), 0, 0, 0);
+        if ( ret != FFA_RET_OK )
+            goto out;
+    }
     ret = FFA_RET_OK;
-    ctx->rx_is_free = true;
+    ctx->rx_is_free = false;
 out:
     spin_unlock(&ctx->rx_lock);
 
     return ret;
 }
 
-static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
-                            uint32_t page_count)
+int32_t ffa_rx_release(struct domain *d)
 {
-    return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_count, 0);
-}
+    int32_t ret = FFA_RET_DENIED;
+    struct ffa_ctx *ctx = d->arch.tee;
 
-static int32_t ffa_rxtx_unmap(void)
-{
-    return ffa_simple_call(FFA_RXTX_UNMAP, 0, 0, 0, 0);
+    spin_lock(&ctx->rx_lock);
+
+    if ( !ctx->page_count || ctx->rx_is_free )
+        goto out;
+
+    if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
+    {
+        ret = ffa_simple_call(FFA_RX_RELEASE, ffa_get_vm_id(d), 0, 0, 0);
+        if ( ret != FFA_RET_OK )
+            goto out;
+    }
+    ret = FFA_RET_OK;
+    ctx->rx_is_free = true;
+out:
+    spin_unlock(&ctx->rx_lock);
+
+    return ret;
 }
 
 void ffa_rxtx_domain_destroy(struct domain *d)
diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
index 29675f9ba3f7..d628c1b70609 100644
--- a/xen/arch/arm/tee/ffa_shm.c
+++ b/xen/arch/arm/tee/ffa_shm.c
@@ -16,21 +16,6 @@
 
 #include "ffa_private.h"
 
-/* Constituent memory region descriptor */
-struct ffa_address_range {
-    uint64_t address;
-    uint32_t page_count;
-    uint32_t reserved;
-};
-
-/* Composite memory region descriptor */
-struct ffa_mem_region {
-    uint32_t total_page_count;
-    uint32_t address_range_count;
-    uint64_t reserved;
-    struct ffa_address_range address_range_array[];
-};
-
 /* Memory access permissions descriptor */
 struct ffa_mem_access_perm {
     uint16_t endpoint_id;
-- 
2.39.5 (Apple Git-154)


