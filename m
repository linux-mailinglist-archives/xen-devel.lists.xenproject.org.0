Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FAFA8B267
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 09:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955185.1349008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4xNc-0006Dj-MA; Wed, 16 Apr 2025 07:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955185.1349008; Wed, 16 Apr 2025 07:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4xNc-0006AS-GU; Wed, 16 Apr 2025 07:40:20 +0000
Received: by outflank-mailman (input) for mailman id 955185;
 Wed, 16 Apr 2025 07:40:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8b=XC=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1u4xNb-0004tR-Bh
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 07:40:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 0b323349-1a96-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 09:40:18 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FAA41595;
 Wed, 16 Apr 2025 00:40:16 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.44.175])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D68063F66E;
 Wed, 16 Apr 2025 00:40:16 -0700 (PDT)
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
X-Inumbo-ID: 0b323349-1a96-11f0-9eaf-5ba50f476ded
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v5 2/6] xen/arm: ffa: Rework partinfo_get implementation
Date: Wed, 16 Apr 2025 09:39:43 +0200
Message-ID: <7784969bf79154363ac3479b9489778d03349c77.1744787720.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1744787720.git.bertrand.marquis@arm.com>
References: <cover.1744787720.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is in preparation for VM to VM support in order to do the
changes on the SP handling part of partinfo_get before adding support
for the VM part.

This patches is doing the following changes:
- split partinfo_get into 3 functions to have the locking handling and
  proper exit on error handled more clearly
- add some potential overflow checks to validate the offset and sizes
  passed by the VM on partinfo call.
- Introduce a maximum number of SPs (for now set to 64) to prevent
  holding the CPU for too long in case there would be a lot of
  partitions in the secure world. The limit currently set is thought to
  be realistic for most use cases as 64 secure partitions is a very high
  number compared to current seen usage (more 3 or 4).
- fix include ordering in ffa_private.h to be in alphabetic order

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v5:
- patch added
---
 xen/arch/arm/tee/ffa_partinfo.c | 201 +++++++++++++++++++-------------
 xen/arch/arm/tee/ffa_private.h  |  18 ++-
 2 files changed, 131 insertions(+), 88 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index c0510ceb8338..e524445c6fb8 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -63,9 +63,95 @@ static int32_t ffa_partition_info_get(uint32_t *uuid, uint32_t flags,
     return ret;
 }
 
-void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
+static int32_t ffa_get_sp_count(uint32_t *uuid, uint32_t *sp_count)
+{
+    uint32_t src_size;
+
+    return ffa_partition_info_get(uuid, FFA_PARTITION_INFO_GET_COUNT_FLAG,
+                                  sp_count, &src_size);
+}
+
+static int32_t ffa_get_sp_partinfo(uint32_t *uuid, uint32_t *sp_count,
+                                   void *dst_buf, void *end_buf,
+                                   uint32_t dst_size)
 {
     int32_t ret;
+    uint32_t src_size, real_sp_count;
+    void *src_buf = ffa_rx;
+    uint32_t count = 0;
+
+    /* Do we have a RX buffer with the SPMC */
+    if ( !ffa_rx )
+        return FFA_RET_DENIED;
+
+    /* We need to use the RX buffer to receive the list */
+    spin_lock(&ffa_rx_buffer_lock);
+
+    ret = ffa_partition_info_get(uuid, 0, &real_sp_count, &src_size);
+    if ( ret )
+        goto out;
+
+    /* We now own the RX buffer */
+
+    /* Validate the src_size we got */
+    if ( src_size < sizeof(struct ffa_partition_info_1_0) ||
+         src_size >= FFA_PAGE_SIZE )
+    {
+        ret = FFA_RET_NOT_SUPPORTED;
+        goto out_release;
+    }
+
+    /*
+     * Limit the maximum time we hold the CPU by limiting the number of SPs.
+     * We just ignore the extra ones as this is tested during init in
+     * ffa_partinfo_init so the only possible reason is SP have been added
+     * since boot.
+     */
+    if ( real_sp_count > FFA_MAX_NUM_SP )
+        real_sp_count = FFA_MAX_NUM_SP;
+
+    /* Make sure the data fits in our buffer */
+    if ( real_sp_count > (FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE) / src_size )
+    {
+        ret = FFA_RET_NOT_SUPPORTED;
+        goto out_release;
+    }
+
+    for ( uint32_t sp_num = 0; sp_num < real_sp_count; sp_num++ )
+    {
+        struct ffa_partition_info_1_1 *fpi = src_buf;
+
+        /* filter out SP not following bit 15 convention if any */
+        if ( FFA_ID_IS_SECURE(fpi->id) )
+        {
+            if ( dst_buf > (end_buf - dst_size) )
+            {
+                ret = FFA_RET_NO_MEMORY;
+                goto out_release;
+            }
+
+            memcpy(dst_buf, src_buf, MIN(src_size, dst_size));
+            if ( dst_size > src_size )
+                memset(dst_buf + src_size, 0, dst_size - src_size);
+
+            dst_buf += dst_size;
+            count++;
+        }
+
+        src_buf += src_size;
+    }
+
+    *sp_count = count;
+
+out_release:
+    ffa_hyp_rx_release();
+out:
+    spin_unlock(&ffa_rx_buffer_lock);
+    return ret;
+}
+void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
+{
+    int32_t ret = FFA_RET_OK;
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
     uint32_t flags = get_user_reg(regs, 5);
@@ -75,8 +161,8 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
         get_user_reg(regs, 3),
         get_user_reg(regs, 4),
     };
-    uint32_t src_size, dst_size;
-    void *dst_buf;
+    uint32_t dst_size = 0;
+    void *dst_buf, *end_buf;
     uint32_t ffa_sp_count = 0;
 
     /*
@@ -89,31 +175,26 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
     else
         dst_size = sizeof(struct ffa_partition_info_1_1);
 
-    /*
-     * FF-A v1.0 has w5 MBZ while v1.1 allows
-     * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
-     *
-     * FFA_PARTITION_INFO_GET_COUNT is only using registers and not the
-     * rxtx buffer so do the partition_info_get directly.
-     */
-    if ( flags == FFA_PARTITION_INFO_GET_COUNT_FLAG &&
-         ctx->guest_vers == FFA_VERSION_1_1 )
+    /* Only count requested */
+    if ( flags )
     {
+        /*
+         * FF-A v1.0 has w5 MBZ while v1.1 allows
+         * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
+         */
+        if ( ctx->guest_vers == FFA_VERSION_1_0 ||
+                flags != FFA_PARTITION_INFO_GET_COUNT_FLAG )
+        {
+            ret = FFA_RET_INVALID_PARAMETERS;
+            goto out;
+        }
+
         if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
-            ret = ffa_partition_info_get(uuid, flags, &ffa_sp_count,
-                                        &src_size);
-        else
-            ret = FFA_RET_OK;
+            ret = ffa_get_sp_count(uuid, &ffa_sp_count);
 
         goto out;
     }
 
-    if ( flags )
-    {
-        ret = FFA_RET_INVALID_PARAMETERS;
-        goto out;
-    }
-
     if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
     {
         /* Just give an empty partition list to the caller */
@@ -121,80 +202,33 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
         goto out;
     }
 
+    /* Get the RX buffer to write the list of partitions */
     ret = ffa_rx_acquire(d);
     if ( ret != FFA_RET_OK )
         goto out;
 
     dst_buf = ctx->rx;
+    end_buf = ctx->rx + ctx->page_count * FFA_PAGE_SIZE;
 
-    if ( !ffa_rx )
-    {
-        ret = FFA_RET_DENIED;
-        goto out_rx_release;
-    }
-
-    spin_lock(&ffa_rx_buffer_lock);
-
-    ret = ffa_partition_info_get(uuid, 0, &ffa_sp_count, &src_size);
-
-    if ( ret )
-        goto out_rx_hyp_unlock;
+    /* An entry should be smaller than a page */
+    BUILD_BUG_ON(sizeof(struct ffa_partition_info_1_1) > FFA_PAGE_SIZE);
 
     /*
-     * ffa_partition_info_get() succeeded so we now own the RX buffer we
-     * share with the SPMC. We must give it back using ffa_hyp_rx_release()
-     * once we've copied the content.
+     * Check for overflow and that we can at least store one entry.
+     * page_count cannot be 0 so we have at least one page.
      */
-
-    /* we cannot have a size smaller than 1.0 structure */
-    if ( src_size < sizeof(struct ffa_partition_info_1_0) )
-    {
-        ret = FFA_RET_NOT_SUPPORTED;
-        goto out_rx_hyp_release;
-    }
-
-    if ( ctx->page_count * FFA_PAGE_SIZE < ffa_sp_count * dst_size )
+    if ( dst_buf >= end_buf || dst_buf > (end_buf - dst_size) )
     {
-        ret = FFA_RET_NO_MEMORY;
-        goto out_rx_hyp_release;
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out_rx_release;
     }
 
-    if ( ffa_sp_count > 0 )
-    {
-        uint32_t n, n_limit = ffa_sp_count;
-        void *src_buf = ffa_rx;
-
-        /* copy the secure partitions info */
-        for ( n = 0; n < n_limit; n++ )
-        {
-            struct ffa_partition_info_1_1 *fpi = src_buf;
-
-            /* filter out SP not following bit 15 convention if any */
-            if ( FFA_ID_IS_SECURE(fpi->id) )
-            {
-                memcpy(dst_buf, src_buf, dst_size);
-                dst_buf += dst_size;
-            }
-            else
-                ffa_sp_count--;
+    ret = ffa_get_sp_partinfo(uuid, &ffa_sp_count, dst_buf, end_buf,
+                              dst_size);
 
-            src_buf += src_size;
-        }
-    }
 
-out_rx_hyp_release:
-    ffa_hyp_rx_release();
-out_rx_hyp_unlock:
-    spin_unlock(&ffa_rx_buffer_lock);
 out_rx_release:
-    /*
-     * The calling VM RX buffer only contains data to be used by the VM if the
-     * call was successful, in which case the VM has to release the buffer
-     * once it has used the data.
-     * If something went wrong during the call, we have to release the RX
-     * buffer back to the SPMC as the VM will not do it.
-     */
-    if ( ret != FFA_RET_OK )
+    if ( ret )
         ffa_rx_release(d);
 out:
     if ( ret )
@@ -353,9 +387,10 @@ bool ffa_partinfo_init(void)
         goto out;
     }
 
-    if ( count >= UINT16_MAX )
+    if ( count >= FFA_MAX_NUM_SP )
     {
-        printk(XENLOG_ERR "ffa: Impossible number of SPs: %u\n", count);
+        printk(XENLOG_ERR "ffa: More SPs than the maximum supported: %u - %u\n",
+               count, FFA_MAX_NUM_SP);
         goto out;
     }
 
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index c4cd65538908..0a9c1082db28 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -6,15 +6,15 @@
 #ifndef __FFA_PRIVATE_H__
 #define __FFA_PRIVATE_H__
 
+#include <xen/bitmap.h>
 #include <xen/const.h>
-#include <xen/sizes.h>
-#include <xen/types.h>
-#include <xen/mm.h>
 #include <xen/list.h>
-#include <xen/spinlock.h>
+#include <xen/mm.h>
 #include <xen/sched.h>
+#include <xen/sizes.h>
+#include <xen/spinlock.h>
 #include <xen/time.h>
-#include <xen/bitmap.h>
+#include <xen/types.h>
 
 /* Error codes */
 #define FFA_RET_OK                      0
@@ -108,6 +108,14 @@
  */
 #define FFA_CTX_TEARDOWN_DELAY          SECONDS(1)
 
+/*
+ * The maximum number of Secure partitions we support for partinfo_get.
+ * This prevents holding the CPU during potentially to long time during
+ * a partinfo_get call. Value choosen seems realistic for any configuration
+ * but can be incremented here if needed.
+ */
+#define FFA_MAX_NUM_SP                  64
+
 /*
  * We rely on the convention suggested but not mandated by the FF-A
  * specification that secure world endpoint identifiers have the bit 15
-- 
2.47.1


