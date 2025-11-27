Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98667C8F5B7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 16:53:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174081.1499095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeIn-00059Q-6E; Thu, 27 Nov 2025 15:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174081.1499095; Thu, 27 Nov 2025 15:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeIn-000577-1f; Thu, 27 Nov 2025 15:53:01 +0000
Received: by outflank-mailman (input) for mailman id 1174081;
 Thu, 27 Nov 2025 15:52:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gQU=6D=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vOeIl-0004I5-Lf
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 15:52:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 24ac3a9f-cba9-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 16:52:57 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C12719F6;
 Thu, 27 Nov 2025 07:52:49 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.89.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1BA73F73B;
 Thu, 27 Nov 2025 07:52:55 -0800 (PST)
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
X-Inumbo-ID: 24ac3a9f-cba9-11f0-980a-7dc792cee155
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 05/10] xen/arm: ffa: use signed 32-bit status codes
Date: Thu, 27 Nov 2025 16:51:36 +0100
Message-ID: <6e31745ff6473189d79a53cec2c29fdd41a22251.1764254975.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1764254975.git.bertrand.marquis@arm.com>
References: <cover.1764254975.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FF-A spec defines return status values as signed 32-bit integers.
Align the Xen mediator with this requirement by:

- switching the FF-A helpers (ffa_handle_mem_reclaim(), partition info
  init, notification ops, dispatcher glue, etc.) to int32_t return types
  so callers cannot silently truncate negative values
- masking SMCCC responses/exits in ffa_get_version(),
  ffa_get_ret_code() and ffa_set_regs_error() to 32 bits before storing
  them in guest registers
- updating notifier, shared-memory reclaim, partition-info and
  dispatcher call sites to use the new prototypes so the entire FF-A
  path propagates spec-compliant 32-bit signed error codes

While there, tidy up the FF-A notification helpers by using GENMASK(15, 0)
for endpoint extraction and fix the secure-endpoint check in
ffa_handle_notification_set() to apply the mask to the endpoint ID before
calling FFA_ID_IS_SECURE(), instead of testing the wrong halfword of
src_dst.

Fixes: 911b305e7bdab ("xen/arm: ffa: Enable VM to VM without firmware")
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c          | 12 +++++++-----
 xen/arch/arm/tee/ffa_notif.c    | 14 +++++++-------
 xen/arch/arm/tee/ffa_partinfo.c |  4 ++--
 xen/arch/arm/tee/ffa_private.h  | 21 +++++++++++----------
 xen/arch/arm/tee/ffa_shm.c      |  4 ++--
 5 files changed, 29 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 4c1b9a4c3b48..7392bb6c3db9 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -129,12 +129,14 @@ static bool ffa_get_version(uint32_t *vers)
         .a1 = FFA_MY_VERSION,
     };
     struct arm_smccc_1_2_regs resp;
+    int32_t ret;
 
     arm_smccc_1_2_smc(&arg, &resp);
-    if ( resp.a0 == FFA_RET_NOT_SUPPORTED )
+    ret = resp.a0 & GENMASK_ULL(31, 0);
+    if ( ret == FFA_RET_NOT_SUPPORTED )
         return false;
 
-    *vers = resp.a0;
+    *vers = resp.a0 & GENMASK_ULL(31, 0);
 
     return true;
 }
@@ -304,7 +306,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     uint32_t fid = get_user_reg(regs, 0);
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
-    int e;
+    int32_t e;
 
     if ( !ctx )
         return false;
@@ -376,8 +378,8 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
 
     default:
         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
-        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
-        return true;
+        e = FFA_RET_NOT_SUPPORTED;
+        break;
     }
 
     if ( e )
diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 86bef6b3b2ab..37b05747cd21 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -19,7 +19,7 @@
 static bool __ro_after_init fw_notif_enabled;
 static unsigned int __ro_after_init notif_sri_irq;
 
-int ffa_handle_notification_bind(struct cpu_user_regs *regs)
+int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
     uint32_t src_dst = get_user_reg(regs, 1);
@@ -27,7 +27,7 @@ int ffa_handle_notification_bind(struct cpu_user_regs *regs)
     uint32_t bitmap_lo = get_user_reg(regs, 3);
     uint32_t bitmap_hi = get_user_reg(regs, 4);
 
-    if ( (src_dst & 0xFFFFU) != ffa_get_vm_id(d) )
+    if ( (src_dst & GENMASK(15, 0)) != ffa_get_vm_id(d) )
         return FFA_RET_INVALID_PARAMETERS;
 
     if ( flags )    /* Only global notifications are supported */
@@ -40,14 +40,14 @@ int ffa_handle_notification_bind(struct cpu_user_regs *regs)
     return FFA_RET_NOT_SUPPORTED;
 }
 
-int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
+int32_t ffa_handle_notification_unbind(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
     uint32_t src_dst = get_user_reg(regs, 1);
     uint32_t bitmap_lo = get_user_reg(regs, 3);
     uint32_t bitmap_hi = get_user_reg(regs, 4);
 
-    if ( (src_dst & 0xFFFFU) != ffa_get_vm_id(d) )
+    if ( (src_dst & GENMASK(15, 0)) != ffa_get_vm_id(d) )
         return FFA_RET_INVALID_PARAMETERS;
 
     if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
@@ -106,7 +106,7 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
         return;
     }
 
-    if ( (recv & 0xFFFFU) != ffa_get_vm_id(d) )
+    if ( (recv & GENMASK(15, 0)) != ffa_get_vm_id(d) )
     {
         ffa_set_regs_error(regs, FFA_RET_INVALID_PARAMETERS);
         return;
@@ -162,7 +162,7 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
     ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, w4, w5, w6, w7);
 }
 
-int ffa_handle_notification_set(struct cpu_user_regs *regs)
+int32_t ffa_handle_notification_set(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
     uint32_t src_dst = get_user_reg(regs, 1);
@@ -173,7 +173,7 @@ int ffa_handle_notification_set(struct cpu_user_regs *regs)
     if ( (src_dst >> 16) != ffa_get_vm_id(d) )
         return FFA_RET_INVALID_PARAMETERS;
 
-    if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
+    if ( FFA_ID_IS_SECURE(src_dst & GENMASK(15, 0)) && fw_notif_enabled )
         return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bitmap_lo,
                                bitmap_hi);
 
diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index 766b75dffb8c..3f4a779f4146 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -448,7 +448,7 @@ bool ffa_partinfo_init(void)
     bool ret = false;
     uint32_t fpi_size;
     uint32_t count;
-    int e;
+    int32_t e;
     void *spmc_rx;
 
     if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) ||
@@ -515,7 +515,7 @@ static void vm_destroy_bitmap_init(struct ffa_ctx *ctx,
     }
 }
 
-int ffa_partinfo_domain_init(struct domain *d)
+int32_t ffa_partinfo_domain_init(struct domain *d)
 {
     unsigned int count = BITS_TO_LONGS(subscr_vm_destroyed_count);
     struct ffa_ctx *ctx = d->arch.tee;
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index cd35c44b8986..9cae238f972c 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -31,9 +31,9 @@
 
 /* FFA_VERSION helpers */
 #define FFA_VERSION_MAJOR_SHIFT         16U
-#define FFA_VERSION_MAJOR_MASK          0x7FFFU
+#define FFA_VERSION_MAJOR_MASK          GENMASK(14, 0)
 #define FFA_VERSION_MINOR_SHIFT         0U
-#define FFA_VERSION_MINOR_MASK          0xFFFFU
+#define FFA_VERSION_MINOR_MASK          GENMASK(15, 0)
 #define MAKE_FFA_VERSION(major, minor)  \
         ((((major) & FFA_VERSION_MAJOR_MASK) << FFA_VERSION_MAJOR_SHIFT) | \
          ((minor) & FFA_VERSION_MINOR_MASK))
@@ -414,10 +414,10 @@ extern atomic_t ffa_vm_count;
 
 bool ffa_shm_domain_destroy(struct domain *d);
 void ffa_handle_mem_share(struct cpu_user_regs *regs);
-int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags);
+int32_t ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags);
 
 bool ffa_partinfo_init(void);
-int ffa_partinfo_domain_init(struct domain *d);
+int32_t ffa_partinfo_domain_init(struct domain *d);
 bool ffa_partinfo_domain_destroy(struct domain *d);
 void ffa_handle_partition_info_get(struct cpu_user_regs *regs);
 
@@ -441,11 +441,11 @@ void ffa_notif_init_interrupt(void);
 int ffa_notif_domain_init(struct domain *d);
 void ffa_notif_domain_destroy(struct domain *d);
 
-int ffa_handle_notification_bind(struct cpu_user_regs *regs);
-int ffa_handle_notification_unbind(struct cpu_user_regs *regs);
+int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs);
+int32_t ffa_handle_notification_unbind(struct cpu_user_regs *regs);
 void ffa_handle_notification_info_get(struct cpu_user_regs *regs);
 void ffa_handle_notification_get(struct cpu_user_regs *regs);
-int ffa_handle_notification_set(struct cpu_user_regs *regs);
+int32_t ffa_handle_notification_set(struct cpu_user_regs *regs);
 
 #ifdef CONFIG_FFA_VM_TO_VM
 void ffa_raise_rx_buffer_full(struct domain *d);
@@ -511,9 +511,10 @@ static inline void ffa_set_regs(struct cpu_user_regs *regs, register_t v0,
 }
 
 static inline void ffa_set_regs_error(struct cpu_user_regs *regs,
-                                      uint32_t error_code)
+                                      int32_t error_code)
 {
-    ffa_set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
+    ffa_set_regs(regs, FFA_ERROR, 0, error_code & GENMASK_ULL(31, 0), 0, 0, 0,
+                 0, 0);
 }
 
 static inline void ffa_set_regs_success(struct cpu_user_regs *regs,
@@ -528,7 +529,7 @@ static inline int32_t ffa_get_ret_code(const struct arm_smccc_1_2_regs *resp)
     {
     case FFA_ERROR:
         if ( resp->a2 )
-            return resp->a2;
+            return resp->a2 & GENMASK_ULL(31, 0);
         else
             return FFA_RET_NOT_SUPPORTED;
     case FFA_SUCCESS_32:
diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
index b9022797c3bf..9db72269d1ea 100644
--- a/xen/arch/arm/tee/ffa_shm.c
+++ b/xen/arch/arm/tee/ffa_shm.c
@@ -624,14 +624,14 @@ static struct ffa_shm_mem *find_shm_mem(struct ffa_ctx *ctx, uint64_t handle)
     return NULL;
 }
 
-int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags)
+int32_t ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags)
 {
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
     struct ffa_shm_mem *shm;
     register_t handle_hi;
     register_t handle_lo;
-    int ret;
+    int32_t ret;
 
     if ( !ffa_fw_supports_fid(FFA_MEM_RECLAIM) )
         return FFA_RET_NOT_SUPPORTED;
-- 
2.51.2


