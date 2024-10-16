Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C70069A0455
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 10:32:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819607.1233052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0zSL-00029R-5l; Wed, 16 Oct 2024 08:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819607.1233052; Wed, 16 Oct 2024 08:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0zSL-00025e-0V; Wed, 16 Oct 2024 08:32:33 +0000
Received: by outflank-mailman (input) for mailman id 819607;
 Wed, 16 Oct 2024 08:32:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0z3=RM=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1t0zSI-0000Nz-RN
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 08:32:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2e9cdc9f-8b99-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 10:32:30 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57468FEC;
 Wed, 16 Oct 2024 01:32:59 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.21.81])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22BD13F71E;
 Wed, 16 Oct 2024 01:32:27 -0700 (PDT)
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
X-Inumbo-ID: 2e9cdc9f-8b99-11ef-a0be-8be0dac302b0
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 07/10] xen/arm: ffa: Transmit RXTX buffers to the SPMC
Date: Wed, 16 Oct 2024 10:31:27 +0200
Message-ID: <f6037d0d077d793864ec10875dccf9e82a19e100.1729066788.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729066788.git.bertrand.marquis@arm.com>
References: <cover.1729066788.git.bertrand.marquis@arm.com>
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
Changes in v2:
- unmap VM rxtx buffer in SPMC on unmap call or on VM destroy
- rework the unmap call to the SPMC to properly pass the VM ID
---
 xen/arch/arm/tee/ffa.c          |   2 +-
 xen/arch/arm/tee/ffa_partinfo.c |  29 ++----
 xen/arch/arm/tee/ffa_private.h  |  22 ++++-
 xen/arch/arm/tee/ffa_rxtx.c     | 158 ++++++++++++++++++++++++++------
 xen/arch/arm/tee/ffa_shm.c      |  15 ---
 5 files changed, 161 insertions(+), 65 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index a292003ca9fe..40ea5398fa21 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -347,7 +347,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
         ffa_handle_partition_info_get(regs);
         return true;
     case FFA_RX_RELEASE:
-        e = ffa_handle_rx_release();
+        e = ffa_rx_release(d);
         break;
     case FFA_MSG_SEND_DIRECT_REQ_32:
     case FFA_MSG_SEND_DIRECT_REQ_64:
diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index 3cf801523296..fde187dba4e5 100644
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
@@ -368,8 +358,7 @@ bool ffa_partinfo_init(void)
     ret = init_subscribers(count, fpi_size);
 
 out:
-    ffa_rx_release();
-
+    ffa_hyp_rx_release();
     return ret;
 }
 
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index afe69b43dbef..9adfe687c3c9 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -265,6 +265,21 @@
 #define FFA_ABI_BITNUM(id)    ((FFA_ABI_ID(id) - FFA_ABI_MIN) << 1 | \
                                FFA_ABI_CONV(id))
 
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
 
@@ -292,7 +307,7 @@ struct ffa_ctx {
     struct ffa_ctx_notif notif;
     /*
      * tx_lock is used to serialize access to tx
-     * rx_lock is used to serialize access to rx
+     * rx_lock is used to serialize access to rx_is_free
      * lock is used for the rest in this struct
      */
     spinlock_t tx_lock;
@@ -331,7 +346,8 @@ void ffa_rxtx_domain_destroy(struct domain *d);
 uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
 			     register_t rx_addr, uint32_t page_count);
 uint32_t ffa_handle_rxtx_unmap(void);
-int32_t ffa_handle_rx_release(void);
+int32_t ffa_rx_acquire(struct domain *d);
+int32_t ffa_rx_release(struct domain *d);
 
 void ffa_notif_init(void);
 void ffa_notif_init_interrupt(void);
@@ -420,7 +436,7 @@ static inline int32_t ffa_simple_call(uint32_t fid, register_t a1,
     return ffa_get_ret_code(&resp);
 }
 
-static inline int32_t ffa_rx_release(void)
+static inline int32_t ffa_hyp_rx_release(void)
 {
     return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
 }
diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
index b6931c855779..a5d43e51f843 100644
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
+static int32_t ffa_rxtx_unmap(uint16_t id)
+{
+    return ffa_simple_call(FFA_RXTX_UNMAP, ((uint64_t)id)<<16, 0, 0, 0);
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
+            goto err_unmap_rx;
+    }
+
     ctx->rx = rx;
     ctx->tx = tx;
     ctx->rx_pg = rx_pg;
@@ -95,6 +168,8 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
     ctx->rx_is_free = true;
     return FFA_RET_OK;
 
+err_unmap_rx:
+    unmap_domain_page_global(rx);
 err_unmap_tx:
     unmap_domain_page_global(tx);
 err_put_rx_pg:
@@ -105,8 +180,22 @@ err_put_tx_pg:
     return ret;
 }
 
-static void rxtx_unmap(struct ffa_ctx *ctx)
+static uint32_t  rxtx_unmap(struct domain *d)
 {
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    if ( !ctx->page_count )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
+    {
+        uint32_t ret;
+
+        ret = ffa_rxtx_unmap(ffa_get_vm_id(d));
+        if ( ret != FFA_RET_OK )
+            return ret;
+    }
+
     unmap_domain_page_global(ctx->rx);
     unmap_domain_page_global(ctx->tx);
     put_page(ctx->rx_pg);
@@ -117,32 +206,63 @@ static void rxtx_unmap(struct ffa_ctx *ctx)
     ctx->tx_pg = NULL;
     ctx->page_count = 0;
     ctx->rx_is_free = false;
+
+    return FFA_RET_OK;
 }
 
 uint32_t ffa_handle_rxtx_unmap(void)
 {
-    struct domain *d = current->domain;
+    return rxtx_unmap(current->domain);
+}
+
+int32_t ffa_rx_acquire(struct domain *d)
+{
+    int32_t ret = FFA_RET_OK;
     struct ffa_ctx *ctx = d->arch.tee;
 
-    if ( !ctx->rx )
-        return FFA_RET_INVALID_PARAMETERS;
+    spin_lock(&ctx->rx_lock);
 
-    rxtx_unmap(ctx);
+    if ( !ctx->page_count )
+    {
+        ret = FFA_RET_DENIED;
+        goto out;
+    }
 
-    return FFA_RET_OK;
+    if ( !ctx->rx_is_free )
+    {
+        ret = FFA_RET_BUSY;
+        goto out;
+    }
+
+    if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
+    {
+        ret = ffa_simple_call(FFA_RX_ACQUIRE, ffa_get_vm_id(d), 0, 0, 0);
+        if ( ret != FFA_RET_OK )
+            goto out;
+    }
+    ctx->rx_is_free = false;
+out:
+    spin_unlock(&ctx->rx_lock);
+
+    return ret;
 }
 
-int32_t ffa_handle_rx_release(void)
+int32_t ffa_rx_release(struct domain *d)
 {
     int32_t ret = FFA_RET_DENIED;
-    struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
 
-    if ( !spin_trylock(&ctx->rx_lock) )
-        return FFA_RET_BUSY;
+    spin_lock(&ctx->rx_lock);
 
     if ( !ctx->page_count || ctx->rx_is_free )
         goto out;
+
+    if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
+    {
+        ret = ffa_simple_call(FFA_RX_RELEASE, ffa_get_vm_id(d), 0, 0, 0);
+        if ( ret != FFA_RET_OK )
+            goto out;
+    }
     ret = FFA_RET_OK;
     ctx->rx_is_free = true;
 out:
@@ -151,23 +271,9 @@ out:
     return ret;
 }
 
-static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
-                            uint32_t page_count)
-{
-    return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_count, 0);
-}
-
-static int32_t ffa_rxtx_unmap(void)
-{
-    return ffa_simple_call(FFA_RXTX_UNMAP, 0, 0, 0, 0);
-}
-
 void ffa_rxtx_domain_destroy(struct domain *d)
 {
-    struct ffa_ctx *ctx = d->arch.tee;
-
-    if ( ctx->rx )
-        rxtx_unmap(ctx);
+    rxtx_unmap(d);
 }
 
 void ffa_rxtx_destroy(void)
@@ -186,7 +292,7 @@ void ffa_rxtx_destroy(void)
     }
 
     if ( need_unmap )
-        ffa_rxtx_unmap();
+        ffa_rxtx_unmap(0);
 }
 
 bool ffa_rxtx_init(void)
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
2.47.0


