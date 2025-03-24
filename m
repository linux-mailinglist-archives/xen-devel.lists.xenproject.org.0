Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9B5A6DC29
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 14:53:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925582.1328469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twiF4-0000GI-O7; Mon, 24 Mar 2025 13:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925582.1328469; Mon, 24 Mar 2025 13:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twiF4-00007l-JY; Mon, 24 Mar 2025 13:53:26 +0000
Received: by outflank-mailman (input) for mailman id 925582;
 Mon, 24 Mar 2025 13:53:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xDgH=WL=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1twiF3-0008HJ-0q
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 13:53:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 5aacbaec-08b7-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 14:53:24 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FBB21C14;
 Mon, 24 Mar 2025 06:53:30 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.86.79])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70BE33F58B;
 Mon, 24 Mar 2025 06:53:22 -0700 (PDT)
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
X-Inumbo-ID: 5aacbaec-08b7-11f0-9ea2-5ba50f476ded
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v4 2/5] xen/arm: ffa: Introduce VM to VM support
Date: Mon, 24 Mar 2025 14:53:00 +0100
Message-ID: <8f0928b4e94b47d6fed201dcd8cfb1068573b297.1742824138.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1742824138.git.bertrand.marquis@arm.com>
References: <cover.1742824138.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a CONFIG_FFA_VM_TO_VM parameter to activate FFA communication
between VMs.
When activated list VMs in the system with FF-A support in part_info_get.

When VM to VM is activated, Xen will be tainted as Insecure and a
message is displayed to the user during the boot as there is no
filtering of VMs in FF-A so any VM can communicate or see any other VM
in the system.

WARNING: There is no filtering for now and all VMs are listed !!

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v4:
- properly handle SPMC version 1.0 header size case in partinfo_get
- switch to local counting variables instead of *pointer += 1 form
- coding style issue with missing spaces in if ()
Changes in v3:
- break partinfo_get in several sub functions to make the implementation
  easier to understand and lock handling easier
- rework implementation to check size along the way and prevent previous
  implementation limits which had to check that the number of VMs or SPs
  did not change
- taint Xen as INSECURE when VM to VM is enabled
Changes in v2:
- Switch ifdef to IS_ENABLED
- dom was not switched to d as requested by Jan because there is already
  a variable d pointing to the current domain and it must not be
  shadowed.
---
 xen/arch/arm/tee/Kconfig        |  11 ++
 xen/arch/arm/tee/ffa.c          |  12 ++
 xen/arch/arm/tee/ffa_partinfo.c | 274 +++++++++++++++++++++-----------
 xen/arch/arm/tee/ffa_private.h  |  12 ++
 4 files changed, 218 insertions(+), 91 deletions(-)

diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
index c5b0f88d7522..88a4c4c99154 100644
--- a/xen/arch/arm/tee/Kconfig
+++ b/xen/arch/arm/tee/Kconfig
@@ -28,5 +28,16 @@ config FFA
 
 	  [1] https://developer.arm.com/documentation/den0077/latest
 
+config FFA_VM_TO_VM
+    bool "Enable FF-A between VMs (UNSUPPORTED)" if UNSUPPORTED
+    default n
+    depends on FFA
+    help
+      This option enables to use FF-A between VMs.
+      This is experimental and there is no access control so any
+      guest can communicate with any other guest.
+
+      If unsure, say N.
+
 endmenu
 
diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 3bbdd7168a6b..e41ab5f8ada6 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -464,6 +464,18 @@ static bool ffa_probe(void)
     printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
            FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
 
+    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
+    {
+        /*
+         * When FFA VM to VM is enabled, the current implementation does not
+         * offer any way to limit which VM can communicate with which VM using
+         * FF-A.
+         * Signal this in the xen console and taint the system as insecure.
+         * TODO: Introduce a solution to limit what a VM can do through FFA.
+         */
+        printk(XENLOG_ERR "ffa: VM to VM is enabled, system is insecure !!\n");
+        add_taint(TAINT_MACHINE_INSECURE);
+    }
     /*
      * psci_init_smccc() updates this value with what's reported by EL-3
      * or secure world.
diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index c0510ceb8338..406c57b95f77 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -63,9 +63,156 @@ static int32_t ffa_partition_info_get(uint32_t *uuid, uint32_t flags,
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
+    /* We only support a 1.1 firmware version */
+    if ( src_size < sizeof(struct ffa_partition_info_1_0) )
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
+            if ( dst_buf + dst_size > end_buf )
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
+
+static uint32_t ffa_get_vm_count(void)
+{
+    struct domain *d = current->domain;
+    struct domain *dom;
+    uint32_t vm_count = 0;
+
+    /* Count the number of VM with FF-A support */
+    rcu_read_lock(&domlist_read_lock);
+    for_each_domain( dom )
+    {
+        struct ffa_ctx *vm = dom->arch.tee;
+
+        if ( dom != d && vm != NULL && vm->guest_vers != 0 )
+            vm_count++;
+    }
+    rcu_read_unlock(&domlist_read_lock);
+
+    return vm_count;
+}
+
+static int32_t ffa_get_vm_partinfo(uint32_t *vm_count, void *dst_buf,
+                                   void *end_buf, uint32_t dst_size)
+{
+    struct domain *d = current->domain;
+    struct domain *dom;
+    int32_t ret = FFA_RET_OK;
+    uint32_t count = 0;
+
+    rcu_read_lock(&domlist_read_lock);
+    for_each_domain( dom )
+    {
+        struct ffa_ctx *vm = dom->arch.tee;
+
+        /*
+         * we do not add the VM calling to the list and only VMs with
+         * FF-A support
+         */
+        if ( dom != d && vm != NULL && vm->guest_vers != 0 )
+        {
+            /*
+             * We do not have UUID info for VMs so use
+             * the 1.0 structure so that we set UUIDs to
+             * zero using memset
+             */
+            struct ffa_partition_info_1_0 srcvm;
+
+            if  ( dst_buf + dst_size > end_buf )
+            {
+                ret = FFA_RET_NO_MEMORY;
+                goto out;
+            }
+
+            srcvm.id = ffa_get_vm_id(dom);
+            srcvm.execution_context = dom->max_vcpus;
+            srcvm.partition_properties = FFA_PART_VM_PROP;
+            if ( is_64bit_domain(dom) )
+                srcvm.partition_properties |= FFA_PART_PROP_AARCH64_STATE;
+
+            memcpy(dst_buf, &srcvm, MIN(sizeof(srcvm), dst_size));
+
+            if ( dst_size > sizeof(srcvm) )
+                memset(dst_buf + sizeof(srcvm), 0,
+                       dst_size - sizeof(srcvm));
+
+            dst_buf += dst_size;
+            count++;
+        }
+    }
+    *vm_count = count;
+
+out:
+    rcu_read_unlock(&domlist_read_lock);
+
+    return ret;
+}
+
+
+void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
+{
+    int32_t ret = FFA_RET_OK;
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
     uint32_t flags = get_user_reg(regs, 5);
@@ -75,9 +222,9 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
         get_user_reg(regs, 3),
         get_user_reg(regs, 4),
     };
-    uint32_t src_size, dst_size;
-    void *dst_buf;
-    uint32_t ffa_sp_count = 0;
+    uint32_t dst_size = 0;
+    void *dst_buf, *end_buf;
+    uint32_t ffa_vm_count = 0, ffa_sp_count = 0;
 
     /*
      * If the guest is v1.0, he does not get back the entry size so we must
@@ -89,118 +236,63 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
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
-        if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
-            ret = ffa_partition_info_get(uuid, flags, &ffa_sp_count,
-                                        &src_size);
-        else
-            ret = FFA_RET_OK;
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
 
-        goto out;
-    }
+        if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
+        {
+            ret = ffa_get_sp_count(uuid, &ffa_sp_count);
+            if ( ret )
+                goto out;
+        }
 
-    if ( flags )
-    {
-        ret = FFA_RET_INVALID_PARAMETERS;
-        goto out;
-    }
+        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
+            ffa_vm_count = ffa_get_vm_count();
 
-    if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
-    {
-        /* Just give an empty partition list to the caller */
-        ret = FFA_RET_OK;
         goto out;
     }
 
+    /* Get the RX buffer to write the list of partitions */
     ret = ffa_rx_acquire(d);
     if ( ret != FFA_RET_OK )
         goto out;
 
     dst_buf = ctx->rx;
+    end_buf = ctx->rx + ctx->page_count * FFA_PAGE_SIZE;
 
-    if ( !ffa_rx )
+    if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
     {
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
+        ret = ffa_get_sp_partinfo(uuid, &ffa_sp_count, dst_buf, end_buf,
+                                  dst_size);
 
-    /*
-     * ffa_partition_info_get() succeeded so we now own the RX buffer we
-     * share with the SPMC. We must give it back using ffa_hyp_rx_release()
-     * once we've copied the content.
-     */
+        if ( ret )
+            goto out_rx_release;
 
-    /* we cannot have a size smaller than 1.0 structure */
-    if ( src_size < sizeof(struct ffa_partition_info_1_0) )
-    {
-        ret = FFA_RET_NOT_SUPPORTED;
-        goto out_rx_hyp_release;
+        dst_buf += ffa_sp_count * dst_size;
     }
 
-    if ( ctx->page_count * FFA_PAGE_SIZE < ffa_sp_count * dst_size )
-    {
-        ret = FFA_RET_NO_MEMORY;
-        goto out_rx_hyp_release;
-    }
+    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
+        ret = ffa_get_vm_partinfo(&ffa_vm_count, dst_buf, end_buf, dst_size);
 
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
-
-            src_buf += src_size;
-        }
-    }
-
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
         ffa_set_regs_error(regs, ret);
     else
-        ffa_set_regs_success(regs, ffa_sp_count, dst_size);
+        ffa_set_regs_success(regs, ffa_sp_count + ffa_vm_count, dst_size);
 }
 
 static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index c4cd65538908..bd6877d8c632 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -187,6 +187,18 @@
  */
 #define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
 
+/*
+ * Partition properties we give for a normal world VM:
+ * - can send direct message but not receive them
+ * - can handle indirect messages
+ * - can receive notifications
+ * 32/64 bit flag is set depending on the VM
+ */
+#define FFA_PART_VM_PROP    (FFA_PART_PROP_DIRECT_REQ_SEND | \
+                             FFA_PART_PROP_INDIRECT_MSGS | \
+                             FFA_PART_PROP_RECV_NOTIF | \
+                             FFA_PART_PROP_IS_PE_ID)
+
 /* Flags used in calls to FFA_NOTIFICATION_GET interface  */
 #define FFA_NOTIF_FLAG_BITMAP_SP        BIT(0, U)
 #define FFA_NOTIF_FLAG_BITMAP_VM        BIT(1, U)
-- 
2.47.1


