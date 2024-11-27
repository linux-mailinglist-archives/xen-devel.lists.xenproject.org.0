Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7F29DAB68
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 17:08:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844902.1260460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGKaZ-0004qV-Kw; Wed, 27 Nov 2024 16:08:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844902.1260460; Wed, 27 Nov 2024 16:08:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGKaZ-0004nZ-Fs; Wed, 27 Nov 2024 16:08:27 +0000
Received: by outflank-mailman (input) for mailman id 844902;
 Wed, 27 Nov 2024 16:08:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8BRf=SW=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1tGKaX-00034d-VR
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 16:08:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d2fbc524-acd9-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 17:08:22 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC1A1150C;
 Wed, 27 Nov 2024 08:08:51 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.58.181])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FC243F5A1;
 Wed, 27 Nov 2024 08:08:19 -0800 (PST)
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
X-Inumbo-ID: d2fbc524-acd9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6ImQyZmJjNTI0LWFjZDktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzIzNzAyLjQ4NTYxMywic2VuZGVyIjoiYmVydHJhbmQubWFycXVpc0Bhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v3 05/10] xen/arm: ffa: Rework partition info get
Date: Wed, 27 Nov 2024 17:07:37 +0100
Message-ID: <05750fccd29cd4527e7a8ee85455a0a1067f6983.1732702210.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732702210.git.bertrand.marquis@arm.com>
References: <cover.1732702210.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the partition info get implementation to use the correct size of
structure depending on the version of the protocol and simplifies the
structure copy to use only memcpy and prevent recreating the structure
each time.
The goal here is to have an implementation that will be easier to
maintain in the long term as the specification is only adding fields to
structure with versions to simplify support of several protocol
versions and as such an SPMC implementation in the future could use this
and return a size higher than the one we expect.
The patch is fixing the part_info_get function for this and the
subscriber discovery on probe.

No functional changes expected.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
---
Changes in v3:
- add Jens R-b
Changes in v2:
- rebase
---
 xen/arch/arm/tee/ffa.c          |  13 +--
 xen/arch/arm/tee/ffa_partinfo.c | 185 ++++++++++++++++++++------------
 xen/arch/arm/tee/ffa_private.h  |   4 +-
 3 files changed, 118 insertions(+), 84 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 1b0919041dc1..4b283a4de5d0 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -311,8 +311,6 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     uint32_t fid = get_user_reg(regs, 0);
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
-    uint32_t fpi_size;
-    uint32_t count;
     int e;
 
     if ( !ctx )
@@ -338,16 +336,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
         e = ffa_handle_rxtx_unmap();
         break;
     case FFA_PARTITION_INFO_GET:
-        e = ffa_handle_partition_info_get(get_user_reg(regs, 1),
-                                          get_user_reg(regs, 2),
-                                          get_user_reg(regs, 3),
-                                          get_user_reg(regs, 4),
-                                          get_user_reg(regs, 5), &count,
-                                          &fpi_size);
-        if ( e )
-            ffa_set_regs_error(regs, e);
-        else
-            ffa_set_regs_success(regs, count, fpi_size);
+        ffa_handle_partition_info_get(regs);
         return true;
     case FFA_RX_RELEASE:
         e = ffa_handle_rx_release();
diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index 99c48f0e5c05..75a073d090e0 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -33,21 +33,24 @@ static uint16_t subscr_vm_created_count __read_mostly;
 static uint16_t *subscr_vm_destroyed __read_mostly;
 static uint16_t subscr_vm_destroyed_count __read_mostly;
 
-static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
-                                      uint32_t w4, uint32_t w5, uint32_t *count,
-                                      uint32_t *fpi_size)
+static int32_t ffa_partition_info_get(uint32_t *uuid, uint32_t flags,
+                                      uint32_t *count, uint32_t *fpi_size)
 {
-    const struct arm_smccc_1_2_regs arg = {
+    struct arm_smccc_1_2_regs arg = {
         .a0 = FFA_PARTITION_INFO_GET,
-        .a1 = w1,
-        .a2 = w2,
-        .a3 = w3,
-        .a4 = w4,
-        .a5 = w5,
+        .a5 = flags,
     };
     struct arm_smccc_1_2_regs resp;
     uint32_t ret;
 
+    if ( uuid )
+    {
+        arg.a1 = uuid[0];
+        arg.a2 = uuid[1];
+        arg.a3 = uuid[2];
+        arg.a4 = uuid[3];
+    }
+
     arm_smccc_1_2_smc(&arg, &resp);
 
     ret = ffa_get_ret_code(&resp);
@@ -60,13 +63,31 @@ static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
     return ret;
 }
 
-int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
-                                      uint32_t w4, uint32_t w5, uint32_t *count,
-                                      uint32_t *fpi_size)
+void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
 {
-    int32_t ret = FFA_RET_DENIED;
+    int32_t ret;
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
+    uint32_t flags = get_user_reg(regs, 5);
+    uint32_t uuid[4] = {
+        get_user_reg(regs, 1),
+        get_user_reg(regs, 2),
+        get_user_reg(regs, 3),
+        get_user_reg(regs, 4),
+    };
+    uint32_t src_size, dst_size;
+    void *dst_buf;
+    uint32_t ffa_sp_count = 0;
+
+    /*
+     * If the guest is v1.0, he does not get back the entry size so we must
+     * use the v1.0 structure size in the destination buffer.
+     * Otherwise use the size of the highest version we support, here 1.1.
+     */
+    if ( ctx->guest_vers == FFA_VERSION_1_0 )
+        dst_size = sizeof(struct ffa_partition_info_1_0);
+    else
+        dst_size = sizeof(struct ffa_partition_info_1_1);
 
     /*
      * FF-A v1.0 has w5 MBZ while v1.1 allows
@@ -75,90 +96,105 @@ int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
      * FFA_PARTITION_INFO_GET_COUNT is only using registers and not the
      * rxtx buffer so do the partition_info_get directly.
      */
-    if ( w5 == FFA_PARTITION_INFO_GET_COUNT_FLAG &&
+    if ( flags == FFA_PARTITION_INFO_GET_COUNT_FLAG &&
          ctx->guest_vers == FFA_VERSION_1_1 )
     {
         if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
-            return ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi_size);
+            ret = ffa_partition_info_get(uuid, flags, &ffa_sp_count,
+                                        &src_size);
         else
-        {
-            *count = 0;
-            return FFA_RET_OK;
-        }
-    }
-    if ( w5 )
-        return FFA_RET_INVALID_PARAMETERS;
+            ret = FFA_RET_OK;
 
-    if ( !ffa_rx )
-        return FFA_RET_DENIED;
+        goto out;
+    }
 
-    if ( !spin_trylock(&ctx->rx_lock) )
-        return FFA_RET_BUSY;
+    if ( flags )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out;
+    }
 
     if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
     {
-        if ( ctx->guest_vers == FFA_VERSION_1_0 )
-            *fpi_size = sizeof(struct ffa_partition_info_1_0);
-        else
-            *fpi_size = sizeof(struct ffa_partition_info_1_1);
-
-        *count = 0;
+        /* Just give an empty partition list to the caller */
         ret = FFA_RET_OK;
         goto out;
     }
 
-    if ( !ctx->page_count || !ctx->rx_is_free )
+    if ( !spin_trylock(&ctx->rx_lock) )
+    {
+        ret = FFA_RET_BUSY;
         goto out;
+    }
+
+    dst_buf = ctx->rx;
+
+    if ( !ffa_rx )
+    {
+        ret = FFA_RET_DENIED;
+        goto out_rx_release;
+    }
+
+    if ( !ctx->page_count || !ctx->rx_is_free )
+    {
+        ret = FFA_RET_DENIED;
+        goto out_rx_release;
+    }
+
     spin_lock(&ffa_rx_buffer_lock);
-    ret = ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi_size);
+
+    ret = ffa_partition_info_get(uuid, 0, &ffa_sp_count, &src_size);
+
     if ( ret )
         goto out_rx_buf_unlock;
+
     /*
      * ffa_partition_info_get() succeeded so we now own the RX buffer we
      * share with the SPMC. We must give it back using ffa_rx_release()
      * once we've copied the content.
      */
 
-    if ( ctx->guest_vers == FFA_VERSION_1_0 )
+    /* we cannot have a size smaller than 1.0 structure */
+    if ( src_size < sizeof(struct ffa_partition_info_1_0) )
     {
-        size_t n;
-        struct ffa_partition_info_1_1 *src = ffa_rx;
-        struct ffa_partition_info_1_0 *dst = ctx->rx;
-
-        if ( ctx->page_count * FFA_PAGE_SIZE < *count * sizeof(*dst) )
-        {
-            ret = FFA_RET_NO_MEMORY;
-            goto out_rx_release;
-        }
+        ret = FFA_RET_NOT_SUPPORTED;
+        goto out_rx_hyp_release;
+    }
 
-        for ( n = 0; n < *count; n++ )
-        {
-            dst[n].id = src[n].id;
-            dst[n].execution_context = src[n].execution_context;
-            dst[n].partition_properties = src[n].partition_properties;
-        }
+    if ( ctx->page_count * FFA_PAGE_SIZE < ffa_sp_count * dst_size )
+    {
+        ret = FFA_RET_NO_MEMORY;
+        goto out_rx_hyp_release;
     }
-    else
+
+    if ( ffa_sp_count > 0 )
     {
-        size_t sz = *count * *fpi_size;
+        uint32_t n;
+        void *src_buf = ffa_rx;
 
-        if ( ctx->page_count * FFA_PAGE_SIZE < sz )
+        /* copy the secure partitions info */
+        for ( n = 0; n < ffa_sp_count; n++ )
         {
-            ret = FFA_RET_NO_MEMORY;
-            goto out_rx_release;
+            memcpy(dst_buf, src_buf, dst_size);
+            dst_buf += dst_size;
+            src_buf += src_size;
         }
-
-        memcpy(ctx->rx, ffa_rx, sz);
     }
+
     ctx->rx_is_free = false;
-out_rx_release:
+
+out_rx_hyp_release:
     ffa_rx_release();
 out_rx_buf_unlock:
     spin_unlock(&ffa_rx_buffer_lock);
-out:
+out_rx_release:
     spin_unlock(&ctx->rx_lock);
 
-    return ret;
+out:
+    if ( ret )
+        ffa_set_regs_error(regs, ret);
+    else
+        ffa_set_regs_success(regs, ffa_sp_count, dst_size);
 }
 
 static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
@@ -221,19 +257,28 @@ static void uninit_subscribers(void)
         XFREE(subscr_vm_destroyed);
 }
 
-static bool init_subscribers(struct ffa_partition_info_1_1 *fpi, uint16_t count)
+static bool init_subscribers(uint16_t count, uint32_t fpi_size)
 {
     uint16_t n;
     uint16_t c_pos;
     uint16_t d_pos;
+    struct ffa_partition_info_1_1 *fpi;
+
+    if ( fpi_size < sizeof(struct ffa_partition_info_1_1) )
+    {
+        printk(XENLOG_ERR "ffa: partition info size invalid: %u\n", fpi_size);
+        return false;
+    }
 
     subscr_vm_created_count = 0;
     subscr_vm_destroyed_count = 0;
     for ( n = 0; n < count; n++ )
     {
-        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED )
+        fpi = ffa_rx + n * fpi_size;
+
+        if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_CREATED )
             subscr_vm_created_count++;
-        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
+        if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
             subscr_vm_destroyed_count++;
     }
 
@@ -252,10 +297,12 @@ static bool init_subscribers(struct ffa_partition_info_1_1 *fpi, uint16_t count)
 
     for ( c_pos = 0, d_pos = 0, n = 0; n < count; n++ )
     {
-        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED )
-            subscr_vm_created[c_pos++] = fpi[n].id;
-        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
-            subscr_vm_destroyed[d_pos++] = fpi[n].id;
+        fpi = ffa_rx + n * fpi_size;
+
+        if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_CREATED )
+            subscr_vm_created[c_pos++] = fpi->id;
+        if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
+            subscr_vm_destroyed[d_pos++] = fpi->id;
     }
 
     return true;
@@ -275,7 +322,7 @@ bool ffa_partinfo_init(void)
          !ffa_rx || !ffa_tx )
         return false;
 
-    e = ffa_partition_info_get(0, 0, 0, 0, 0, &count, &fpi_size);
+    e = ffa_partition_info_get(NULL, 0, &count, &fpi_size);
     if ( e )
     {
         printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
@@ -288,7 +335,7 @@ bool ffa_partinfo_init(void)
         goto out;
     }
 
-    ret = init_subscribers(ffa_rx, count);
+    ret = init_subscribers(count, fpi_size);
 
 out:
     ffa_rx_release();
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 85eb61c13464..e5bc73f9039e 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -316,9 +316,7 @@ int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags);
 bool ffa_partinfo_init(void);
 int ffa_partinfo_domain_init(struct domain *d);
 bool ffa_partinfo_domain_destroy(struct domain *d);
-int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
-                                      uint32_t w4, uint32_t w5, uint32_t *count,
-                                      uint32_t *fpi_size);
+void ffa_handle_partition_info_get(struct cpu_user_regs *regs);
 
 bool ffa_rxtx_init(void);
 void ffa_rxtx_destroy(void);
-- 
2.47.0


