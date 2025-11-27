Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C1EC8F5B4
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 16:53:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174080.1499085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeIk-0004r5-Sp; Thu, 27 Nov 2025 15:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174080.1499085; Thu, 27 Nov 2025 15:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeIk-0004pi-P3; Thu, 27 Nov 2025 15:52:58 +0000
Received: by outflank-mailman (input) for mailman id 1174080;
 Thu, 27 Nov 2025 15:52:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gQU=6D=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vOeIk-0004I5-4V
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 15:52:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 23a68b88-cba9-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 16:52:55 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF361176C;
 Thu, 27 Nov 2025 07:52:47 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.89.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA95F3F73B;
 Thu, 27 Nov 2025 07:52:53 -0800 (PST)
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
X-Inumbo-ID: 23a68b88-cba9-11f0-980a-7dc792cee155
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 04/10] xen/arm: ffa: rework SPMC RX/TX buffer management
Date: Thu, 27 Nov 2025 16:51:35 +0100
Message-ID: <72d6592157a9ec15d4b5de19751186e0ca1680ba.1764254975.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1764254975.git.bertrand.marquis@arm.com>
References: <cover.1764254975.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework how Xen accesses the RX/TX buffers shared with the SPMC so that
ownership and locking are handled centrally.

Move the SPMC RX/TX buffer bases into ffa_rxtx.c as ffa_spmc_rx/ffa_spmc_tx,
protect them with dedicated ffa_spmc_{rx,tx}_lock spinlocks and expose
ffa_rxtx_spmc_{rx,tx}_{acquire,release}() helpers instead of the global
ffa_rx/ffa_tx pointers and ffa_{rx,tx}_buffer_lock.

The RX helpers now always issue FFA_RX_RELEASE when we are done
consuming data from the SPMC, so partition-info enumeration and shared
memory paths release the RX buffer on all exit paths. The RX/TX mapping
code is updated to use the descriptor offsets (rx_region_offs and
tx_region_offs) rather than hard-coded structure layout, and to use the
TX acquire/release helpers instead of touching the TX buffer directly.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c          |  22 +-----
 xen/arch/arm/tee/ffa_partinfo.c |  40 +++++-----
 xen/arch/arm/tee/ffa_private.h  |  18 ++---
 xen/arch/arm/tee/ffa_rxtx.c     | 132 +++++++++++++++++++++++++-------
 xen/arch/arm/tee/ffa_shm.c      |  26 ++++---
 5 files changed, 153 insertions(+), 85 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 47f426e85864..4c1b9a4c3b48 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -48,8 +48,8 @@
  *     notification for secure partitions
  *   - doesn't support notifications for Xen itself
  *
- * There are some large locked sections with ffa_tx_buffer_lock and
- * ffa_rx_buffer_lock. Especially the ffa_tx_buffer_lock spinlock used
+ * There are some large locked sections with ffa_spmc_tx_lock and
+ * ffa_spmc_rx_lock. Especially the ffa_spmc_tx_lock spinlock used
  * around share_shm() is a very large locked section which can let one VM
  * affect another VM.
  */
@@ -108,20 +108,6 @@ static const struct ffa_fw_abi ffa_fw_abi_needed[] = {
     FW_ABI(FFA_RUN),
 };
 
-/*
- * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
- * number of pages used in each of these buffers.
- *
- * The RX buffer is protected from concurrent usage with ffa_rx_buffer_lock.
- * Note that the SPMC is also tracking the ownership of our RX buffer so
- * for calls which uses our RX buffer to deliver a result we must call
- * ffa_rx_release() to let the SPMC know that we're done with the buffer.
- */
-void *ffa_rx __read_mostly;
-void *ffa_tx __read_mostly;
-DEFINE_SPINLOCK(ffa_rx_buffer_lock);
-DEFINE_SPINLOCK(ffa_tx_buffer_lock);
-
 LIST_HEAD(ffa_ctx_head);
 /* RW Lock to protect addition/removal and reading in ffa_ctx_head */
 DEFINE_RWLOCK(ffa_ctx_list_rwlock);
@@ -612,7 +598,7 @@ static bool ffa_probe_fw(void)
                    ffa_fw_abi_needed[i].name);
     }
 
-    if ( !ffa_rxtx_init() )
+    if ( !ffa_rxtx_spmc_init() )
     {
         printk(XENLOG_ERR "ffa: Error during RXTX buffer init\n");
         goto err_no_fw;
@@ -626,7 +612,7 @@ static bool ffa_probe_fw(void)
     return true;
 
 err_rxtx_destroy:
-    ffa_rxtx_destroy();
+    ffa_rxtx_spmc_destroy();
 err_no_fw:
     ffa_fw_version = 0;
     bitmap_zero(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index fa56b1587e3b..766b75dffb8c 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -77,28 +77,24 @@ static int32_t ffa_get_sp_partinfo(uint32_t *uuid, uint32_t *sp_count,
 {
     int32_t ret;
     uint32_t src_size, real_sp_count;
-    void *src_buf = ffa_rx;
+    void *src_buf;
     uint32_t count = 0;
 
-    /* Do we have a RX buffer with the SPMC */
-    if ( !ffa_rx )
-        return FFA_RET_DENIED;
-
     /* We need to use the RX buffer to receive the list */
-    spin_lock(&ffa_rx_buffer_lock);
+    src_buf = ffa_rxtx_spmc_rx_acquire();
+    if ( !src_buf )
+        return FFA_RET_DENIED;
 
     ret = ffa_partition_info_get(uuid, 0, &real_sp_count, &src_size);
     if ( ret )
         goto out;
 
-    /* We now own the RX buffer */
-
     /* Validate the src_size we got */
     if ( src_size < sizeof(struct ffa_partition_info_1_0) ||
          src_size >= FFA_PAGE_SIZE )
     {
         ret = FFA_RET_NOT_SUPPORTED;
-        goto out_release;
+        goto out;
     }
 
     /*
@@ -114,7 +110,7 @@ static int32_t ffa_get_sp_partinfo(uint32_t *uuid, uint32_t *sp_count,
     if ( real_sp_count > (FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE) / src_size )
     {
         ret = FFA_RET_NOT_SUPPORTED;
-        goto out_release;
+        goto out;
     }
 
     for ( uint32_t sp_num = 0; sp_num < real_sp_count; sp_num++ )
@@ -127,7 +123,7 @@ static int32_t ffa_get_sp_partinfo(uint32_t *uuid, uint32_t *sp_count,
             if ( dst_buf > (end_buf - dst_size) )
             {
                 ret = FFA_RET_NO_MEMORY;
-                goto out_release;
+                goto out;
             }
 
             memcpy(dst_buf, src_buf, MIN(src_size, dst_size));
@@ -143,10 +139,8 @@ static int32_t ffa_get_sp_partinfo(uint32_t *uuid, uint32_t *sp_count,
 
     *sp_count = count;
 
-out_release:
-    ffa_hyp_rx_release();
 out:
-    spin_unlock(&ffa_rx_buffer_lock);
+    ffa_rxtx_spmc_rx_release();
     return ret;
 }
 
@@ -378,7 +372,7 @@ static void uninit_subscribers(void)
         XFREE(subscr_vm_destroyed);
 }
 
-static bool init_subscribers(uint16_t count, uint32_t fpi_size)
+static bool init_subscribers(void *buf, uint16_t count, uint32_t fpi_size)
 {
     uint16_t n;
     uint16_t c_pos;
@@ -395,7 +389,7 @@ static bool init_subscribers(uint16_t count, uint32_t fpi_size)
     subscr_vm_destroyed_count = 0;
     for ( n = 0; n < count; n++ )
     {
-        fpi = ffa_rx + n * fpi_size;
+        fpi = buf + n * fpi_size;
 
         /*
          * We need to have secure partitions using bit 15 set convention for
@@ -433,7 +427,7 @@ static bool init_subscribers(uint16_t count, uint32_t fpi_size)
 
     for ( c_pos = 0, d_pos = 0, n = 0; n < count; n++ )
     {
-        fpi = ffa_rx + n * fpi_size;
+        fpi = buf + n * fpi_size;
 
         if ( FFA_ID_IS_SECURE(fpi->id) )
         {
@@ -455,10 +449,14 @@ bool ffa_partinfo_init(void)
     uint32_t fpi_size;
     uint32_t count;
     int e;
+    void *spmc_rx;
 
     if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) ||
-         !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32) ||
-         !ffa_rx || !ffa_tx )
+         !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32))
+        return false;
+
+    spmc_rx = ffa_rxtx_spmc_rx_acquire();
+    if (!spmc_rx)
         return false;
 
     e = ffa_partition_info_get(NULL, 0, &count, &fpi_size);
@@ -475,10 +473,10 @@ bool ffa_partinfo_init(void)
         goto out;
     }
 
-    ret = init_subscribers(count, fpi_size);
+    ret = init_subscribers(spmc_rx, count, fpi_size);
 
 out:
-    ffa_hyp_rx_release();
+    ffa_rxtx_spmc_rx_release();
     return ret;
 }
 
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 4272afd37343..cd35c44b8986 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -404,10 +404,6 @@ struct ffa_ctx {
     unsigned long *vm_destroy_bitmap;
 };
 
-extern void *ffa_rx;
-extern void *ffa_tx;
-extern spinlock_t ffa_rx_buffer_lock;
-extern spinlock_t ffa_tx_buffer_lock;
 extern DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
 
 extern struct list_head ffa_ctx_head;
@@ -425,8 +421,13 @@ int ffa_partinfo_domain_init(struct domain *d);
 bool ffa_partinfo_domain_destroy(struct domain *d);
 void ffa_handle_partition_info_get(struct cpu_user_regs *regs);
 
-bool ffa_rxtx_init(void);
-void ffa_rxtx_destroy(void);
+bool ffa_rxtx_spmc_init(void);
+void ffa_rxtx_spmc_destroy(void);
+void *ffa_rxtx_spmc_rx_acquire(void);
+void ffa_rxtx_spmc_rx_release(void);
+void *ffa_rxtx_spmc_tx_acquire(void);
+void ffa_rxtx_spmc_tx_release(void);
+
 int32_t ffa_rxtx_domain_init(struct domain *d);
 void ffa_rxtx_domain_destroy(struct domain *d);
 int32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
@@ -556,11 +557,6 @@ static inline int32_t ffa_simple_call(uint32_t fid, register_t a1,
     return ffa_get_ret_code(&resp);
 }
 
-static inline int32_t ffa_hyp_rx_release(void)
-{
-    return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
-}
-
 static inline bool ffa_fw_supports_fid(uint32_t fid)
 {
     BUILD_BUG_ON(FFA_FNUM_MIN_VALUE > FFA_FNUM_MAX_VALUE);
diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
index cd467d1dba68..07b01430d139 100644
--- a/xen/arch/arm/tee/ffa_rxtx.c
+++ b/xen/arch/arm/tee/ffa_rxtx.c
@@ -30,6 +30,20 @@ struct ffa_endpoint_rxtx_descriptor_1_1 {
     uint32_t tx_region_offs;
 };
 
+/*
+ * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
+ * number of pages used in each of these buffers.
+ * Each buffer has its own lock to protect from concurrent usage.
+ *
+ * Note that the SPMC is also tracking the ownership of our RX buffer so
+ * for calls which uses our RX buffer to deliver a result we must do an
+ * FFA_RX_RELEASE to let the SPMC know that we're done with the buffer.
+ */
+static void *ffa_spmc_rx __read_mostly;
+static void *ffa_spmc_tx __read_mostly;
+static DEFINE_SPINLOCK(ffa_spmc_rx_lock);
+static DEFINE_SPINLOCK(ffa_spmc_tx_lock);
+
 static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t rx_addr,
                             uint32_t page_count)
 {
@@ -120,8 +134,9 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
                      sizeof(struct ffa_address_range) * 2 >
                      FFA_MAX_RXTX_PAGE_COUNT * FFA_PAGE_SIZE);
 
-        spin_lock(&ffa_tx_buffer_lock);
-        rxtx_desc = ffa_tx;
+        rxtx_desc = ffa_rxtx_spmc_tx_acquire();
+        if ( !rxtx_desc )
+            goto err_unmap_rx;
 
         /*
          * We have only one page for each so we pack everything:
@@ -138,7 +153,7 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
                                              address_range_array[1]);
 
         /* rx buffer */
-        mem_reg = ffa_tx + sizeof(*rxtx_desc);
+        mem_reg = (void *)rxtx_desc + rxtx_desc->rx_region_offs;
         mem_reg->total_page_count = 1;
         mem_reg->address_range_count = 1;
         mem_reg->reserved = 0;
@@ -148,7 +163,7 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
         mem_reg->address_range_array[0].reserved = 0;
 
         /* tx buffer */
-        mem_reg = ffa_tx + rxtx_desc->tx_region_offs;
+        mem_reg = (void *)rxtx_desc + rxtx_desc->tx_region_offs;
         mem_reg->total_page_count = 1;
         mem_reg->address_range_count = 1;
         mem_reg->reserved = 0;
@@ -159,7 +174,7 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
 
         ret = ffa_rxtx_map(0, 0, 0);
 
-        spin_unlock(&ffa_tx_buffer_lock);
+        ffa_rxtx_spmc_tx_release();
 
         if ( ret != FFA_RET_OK )
             goto err_unmap_rx;
@@ -291,49 +306,114 @@ void ffa_rxtx_domain_destroy(struct domain *d)
     rxtx_unmap(d);
 }
 
-void ffa_rxtx_destroy(void)
+void *ffa_rxtx_spmc_rx_acquire(void)
+{
+    ASSERT(!spin_is_locked(&ffa_spmc_rx_lock));
+
+    spin_lock(&ffa_spmc_rx_lock);
+
+    if ( ffa_spmc_rx )
+        return ffa_spmc_rx;
+
+    spin_unlock(&ffa_spmc_rx_lock);
+    return NULL;
+}
+
+void ffa_rxtx_spmc_rx_release(void)
+{
+    int32_t ret;
+
+    ASSERT(spin_is_locked(&ffa_spmc_rx_lock));
+
+    /* Inform the SPMC that we are done with our RX buffer */
+    ret = ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
+    if ( ret != FFA_RET_OK )
+        printk(XENLOG_DEBUG "Error releasing SPMC RX buffer: %d\n", ret);
+
+    spin_unlock(&ffa_spmc_rx_lock);
+}
+
+void *ffa_rxtx_spmc_tx_acquire(void)
 {
-    bool need_unmap = ffa_tx && ffa_rx;
+    ASSERT(!spin_is_locked(&ffa_spmc_tx_lock));
 
-    if ( ffa_tx )
+    spin_lock(&ffa_spmc_tx_lock);
+
+    if ( ffa_spmc_tx )
+        return ffa_spmc_tx;
+
+    spin_unlock(&ffa_spmc_tx_lock);
+    return NULL;
+}
+
+void ffa_rxtx_spmc_tx_release(void)
+{
+    ASSERT(spin_is_locked(&ffa_spmc_tx_lock));
+
+    spin_unlock(&ffa_spmc_tx_lock);
+}
+
+void ffa_rxtx_spmc_destroy(void)
+{
+    bool need_unmap;
+
+    spin_lock(&ffa_spmc_rx_lock);
+    spin_lock(&ffa_spmc_tx_lock);
+    need_unmap = ffa_spmc_tx && ffa_spmc_rx;
+
+    if ( ffa_spmc_tx )
     {
-        free_xenheap_pages(ffa_tx, 0);
-        ffa_tx = NULL;
+        free_xenheap_pages(ffa_spmc_tx, 0);
+        ffa_spmc_tx = NULL;
     }
-    if ( ffa_rx )
+    if ( ffa_spmc_rx )
     {
-        free_xenheap_pages(ffa_rx, 0);
-        ffa_rx = NULL;
+        free_xenheap_pages(ffa_spmc_rx, 0);
+        ffa_spmc_rx = NULL;
     }
 
     if ( need_unmap )
         ffa_rxtx_unmap(0);
+
+    spin_unlock(&ffa_spmc_tx_lock);
+    spin_unlock(&ffa_spmc_rx_lock);
 }
 
-bool ffa_rxtx_init(void)
+bool ffa_rxtx_spmc_init(void)
 {
     int32_t e;
+    bool ret = false;
 
     /* Firmware not there or not supporting */
     if ( !ffa_fw_supports_fid(FFA_RXTX_MAP_64) )
         return false;
 
-    ffa_rx = alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_COUNT), 0);
-    if ( !ffa_rx )
-        return false;
+    spin_lock(&ffa_spmc_rx_lock);
+    spin_lock(&ffa_spmc_tx_lock);
+
+    ffa_spmc_rx = alloc_xenheap_pages(
+                            get_order_from_pages(FFA_RXTX_PAGE_COUNT), 0);
+    if ( !ffa_spmc_rx )
+        goto exit;
 
-    ffa_tx = alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_COUNT), 0);
-    if ( !ffa_tx )
-        goto err;
+    ffa_spmc_tx = alloc_xenheap_pages(
+                            get_order_from_pages(FFA_RXTX_PAGE_COUNT), 0);
+    if ( !ffa_spmc_tx )
+        goto exit;
 
-    e = ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), FFA_RXTX_PAGE_COUNT);
+    e = ffa_rxtx_map(__pa(ffa_spmc_tx), __pa(ffa_spmc_rx),
+                     FFA_RXTX_PAGE_COUNT);
     if ( e )
-        goto err;
+        goto exit;
 
-    return true;
+    ret = true;
 
-err:
-    ffa_rxtx_destroy();
+exit:
+    spin_unlock(&ffa_spmc_tx_lock);
+    spin_unlock(&ffa_spmc_rx_lock);
 
-    return false;
+    if ( !ret )
+        ffa_rxtx_spmc_destroy();
+
+    return ret;
 }
diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
index d628c1b70609..b9022797c3bf 100644
--- a/xen/arch/arm/tee/ffa_shm.c
+++ b/xen/arch/arm/tee/ffa_shm.c
@@ -286,9 +286,8 @@ static void init_range(struct ffa_address_range *addr_range,
 }
 
 /*
- * This function uses the ffa_tx buffer to transmit the memory transaction
- * descriptor. The function depends ffa_tx_buffer_lock to be used to guard
- * the buffer from concurrent use.
+ * This function uses the ffa_spmc tx buffer to transmit the memory transaction
+ * descriptor.
  */
 static int share_shm(struct ffa_shm_mem *shm)
 {
@@ -298,17 +297,22 @@ static int share_shm(struct ffa_shm_mem *shm)
     struct ffa_address_range *addr_range;
     struct ffa_mem_region *region_descr;
     const unsigned int region_count = 1;
-    void *buf = ffa_tx;
     uint32_t frag_len;
     uint32_t tot_len;
     paddr_t last_pa;
     unsigned int n;
     paddr_t pa;
+    int32_t ret;
+    void *buf;
 
-    ASSERT(spin_is_locked(&ffa_tx_buffer_lock));
     ASSERT(shm->page_count);
 
+    buf = ffa_rxtx_spmc_tx_acquire();
+    if ( !buf )
+        return FFA_RET_NOT_SUPPORTED;
+
     descr = buf;
+
     memset(descr, 0, sizeof(*descr));
     descr->sender_id = shm->sender_id;
     descr->handle = shm->handle;
@@ -340,7 +344,10 @@ static int share_shm(struct ffa_shm_mem *shm)
     tot_len = ADDR_RANGE_OFFSET(descr->mem_access_count, region_count,
                                 region_descr->address_range_count);
     if ( tot_len > max_frag_len )
+    {
+        ffa_rxtx_spmc_tx_release();
         return FFA_RET_NOT_SUPPORTED;
+    }
 
     addr_range = region_descr->address_range_array;
     frag_len = ADDR_RANGE_OFFSET(descr->mem_access_count, region_count, 1);
@@ -360,7 +367,11 @@ static int share_shm(struct ffa_shm_mem *shm)
         init_range(addr_range, pa);
     }
 
-    return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
+    ret = ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
+
+    ffa_rxtx_spmc_tx_release();
+
+    return ret;
 }
 
 static int read_mem_transaction(uint32_t ffa_vers, const void *buf, size_t blen,
@@ -578,10 +589,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
     if ( ret )
         goto out;
 
-    /* Note that share_shm() uses our tx buffer */
-    spin_lock(&ffa_tx_buffer_lock);
     ret = share_shm(shm);
-    spin_unlock(&ffa_tx_buffer_lock);
     if ( ret )
         goto out;
 
-- 
2.51.2


