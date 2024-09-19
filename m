Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC8397C901
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 14:20:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800671.1210665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srG8X-0004zi-H0; Thu, 19 Sep 2024 12:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800671.1210665; Thu, 19 Sep 2024 12:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srG8X-0004vn-6T; Thu, 19 Sep 2024 12:19:53 +0000
Received: by outflank-mailman (input) for mailman id 800671;
 Thu, 19 Sep 2024 12:19:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lyjY=QR=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1srG8V-0003zB-VO
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 12:19:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7830e956-7681-11ef-a0b8-8be0dac302b0;
 Thu, 19 Sep 2024 14:19:51 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4625D1007;
 Thu, 19 Sep 2024 05:20:20 -0700 (PDT)
Received: from C3HXLD123V.emea.arm.com (usa-sjc-mx-foss1.foss.arm.com
 [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDB603F64C;
 Thu, 19 Sep 2024 05:19:49 -0700 (PDT)
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
X-Inumbo-ID: 7830e956-7681-11ef-a0b8-8be0dac302b0
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 06/10] xen/arm: ffa: Use bit 15 convention for SPs
Date: Thu, 19 Sep 2024 14:19:06 +0200
Message-Id: <4c39c1c95a0bfc9e101f9c962a2e96a948b9774d.1726676338.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1726676338.git.bertrand.marquis@arm.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make use and required to have bit 15 convention respected by secure
world (having bit 15 of IDs set for secure endpoints and non-set for
non-secure ones).
If any secure partition has an ID with bit 15 not set, it will not be
possible to contact or detect them.
Print an error log during probe for each secure endpoint detected with
bit 15 not set.

We are switching to this convention because Xen is currently not using
VMIDs with bit 15 set so we are sure that no VM will have it set (this
is ensured by BUILD_BUG_ON in case this becomes false in the future).
It is allowing to easily distinguish between secure and non-secure
endpoints, preventing the need to store a list of secure endpoint IDs in
Xen.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c          | 22 +++++++++++---
 xen/arch/arm/tee/ffa_partinfo.c | 54 +++++++++++++++++++++++++--------
 xen/arch/arm/tee/ffa_private.h  |  7 +++++
 xen/arch/arm/tee/ffa_shm.c      | 12 +++++++-
 4 files changed, 77 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index beaed63a85ae..45f9c1db8a6e 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -192,6 +192,14 @@ static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
         goto out;
     }
 
+    /* we do not support direct messages to VMs */
+    if ( !FFA_ID_IS_SECURE(src_dst & GENMASK(15,0)) )
+    {
+        resp.a0 = FFA_ERROR;
+        resp.a2 = FFA_RET_NOT_SUPPORTED;
+        goto out;
+    }
+
     arg.a1 = src_dst;
     arg.a2 = get_user_reg(regs, 2) & mask;
     arg.a3 = get_user_reg(regs, 3) & mask;
@@ -386,11 +394,15 @@ static int ffa_domain_init(struct domain *d)
     struct ffa_ctx *ctx;
     int ret;
 
-     /*
-      * We can't use that last possible domain ID or ffa_get_vm_id() would
-      * cause an overflow.
-      */
-    if ( d->domain_id >= UINT16_MAX)
+    /*
+     * We are using the domain_id + 1 as the FF-A ID for VMs as FF-A ID 0 is
+     * reserved for the hypervisor and we only support secure endpoints using
+     * FF-A IDs with BIT 15 set to 1 so make sure those are not used by Xen.
+     */
+    BUILD_BUG_ON(DOMID_FIRST_RESERVED >= UINT16_MAX);
+    BUILD_BUG_ON((DOMID_MASK & BIT(15, U)) != 0);
+
+    if ( d->domain_id >= DOMID_FIRST_RESERVED )
         return -ERANGE;
 
     ctx = xzalloc(struct ffa_ctx);
diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index 7b59fbdd3ffd..b391b1adf9f2 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -169,14 +169,26 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
 
     if ( ffa_sp_count > 0 )
     {
-        uint32_t n;
+        uint32_t n, real_num = ffa_sp_count;
         void *src_buf = ffa_rx;
 
         /* copy the secure partitions info */
-        for ( n = 0; n < ffa_sp_count; n++ )
+        for ( n = 0; n < real_num; n++ )
         {
-            memcpy(dst_buf, src_buf, dst_size);
-            dst_buf += dst_size;
+            struct ffa_partition_info_1_1 *fpi = src_buf;
+
+            /* filter out SP not following bit 15 convention if any */
+            if ( FFA_ID_IS_SECURE(fpi->id) )
+            {
+                memcpy(dst_buf, src_buf, dst_size);
+                dst_buf += dst_size;
+            }
+            else
+            {
+                printk(XENLOG_INFO "ffa: sp id 0x%04x skipped, bit 15 is 0\n",
+                       fpi->id);
+                ffa_sp_count--;
+            }
             src_buf += src_size;
         }
     }
@@ -276,10 +288,25 @@ static bool init_subscribers(uint16_t count, uint32_t fpi_size)
     {
         fpi = ffa_rx + n * fpi_size;
 
-        if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_CREATED )
-            subscr_vm_created_count++;
-        if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
-            subscr_vm_destroyed_count++;
+        /*
+         * We need to have secure partitions using bit 15 set convention for
+         * secure partition IDs.
+         * Inform the user with a log and discard giving created or destroy
+         * event to those IDs.
+         */
+        if ( !FFA_ID_IS_SECURE(fpi->id) )
+        {
+            printk(XENLOG_ERR "ffa: Firmware is not using bit 15 convention for IDs !!\n"
+                              "ffa: Secure partition with id 0x%04x cannot be used\n",
+                              fpi->id);
+        }
+        else
+        {
+            if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_CREATED )
+                subscr_vm_created_count++;
+            if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
+                subscr_vm_destroyed_count++;
+        }
     }
 
     if ( subscr_vm_created_count )
@@ -299,10 +326,13 @@ static bool init_subscribers(uint16_t count, uint32_t fpi_size)
     {
         fpi = ffa_rx + n * fpi_size;
 
-        if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_CREATED )
-            subscr_vm_created[c_pos++] = fpi->id;
-        if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
-            subscr_vm_destroyed[d_pos++] = fpi->id;
+        if ( FFA_ID_IS_SECURE(fpi->id) )
+        {
+            if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_CREATED )
+                subscr_vm_created[c_pos++] = fpi->id;
+            if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
+                subscr_vm_destroyed[d_pos++] = fpi->id;
+        }
     }
 
     return true;
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 089607c1c321..c6903e335489 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -105,6 +105,13 @@
  */
 #define FFA_CTX_TEARDOWN_DELAY          SECONDS(1)
 
+/*
+ * We rely on the convention suggested but not mandated by the FF-A
+ * specification that secure world endpoint identifiers have the bit 15
+ * set and normal world have it set to 0.
+ */
+#define FFA_ID_IS_SECURE(id)    ((id) & BIT(15, U))
+
 /* FF-A-1.1-REL0 section 10.9.2 Memory region handle, page 167 */
 #define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
 #define FFA_HANDLE_INVALID              0xffffffffffffffffULL
diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
index efa5b67db8e1..29675f9ba3f7 100644
--- a/xen/arch/arm/tee/ffa_shm.c
+++ b/xen/arch/arm/tee/ffa_shm.c
@@ -469,6 +469,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
     int ret = FFA_RET_DENIED;
     uint32_t range_count;
     uint32_t region_offs;
+    uint16_t dst_id;
 
     if ( !ffa_fw_supports_fid(FFA_MEM_SHARE_64) )
     {
@@ -537,6 +538,15 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
         goto out_unlock;
 
     mem_access = ctx->tx + trans.mem_access_offs;
+
+    dst_id = ACCESS_ONCE(mem_access->access_perm.endpoint_id);
+    if ( !FFA_ID_IS_SECURE(dst_id) )
+    {
+        /* we do not support sharing with VMs */
+        ret = FFA_RET_NOT_SUPPORTED;
+        goto out_unlock;
+    }
+
     if ( ACCESS_ONCE(mem_access->access_perm.perm) != FFA_MEM_ACC_RW )
     {
         ret = FFA_RET_NOT_SUPPORTED;
@@ -567,7 +577,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
         goto out_unlock;
     }
     shm->sender_id = trans.sender_id;
-    shm->ep_id = ACCESS_ONCE(mem_access->access_perm.endpoint_id);
+    shm->ep_id = dst_id;
 
     /*
      * Check that the Composite memory region descriptor fits.
-- 
2.39.5 (Apple Git-154)


