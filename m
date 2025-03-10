Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478EBA59828
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 15:51:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906551.1313972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1treTH-0003ID-QX; Mon, 10 Mar 2025 14:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906551.1313972; Mon, 10 Mar 2025 14:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1treTH-0003Dm-MR; Mon, 10 Mar 2025 14:51:11 +0000
Received: by outflank-mailman (input) for mailman id 906551;
 Mon, 10 Mar 2025 14:51:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t+uq=V5=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1treTF-0002rH-W4
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 14:51:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 1a284b19-fdbf-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 15:51:09 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A78226BC;
 Mon, 10 Mar 2025 07:51:20 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.38.103])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4256F3F5A1;
 Mon, 10 Mar 2025 07:51:07 -0700 (PDT)
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
X-Inumbo-ID: 1a284b19-fdbf-11ef-9ab8-95dc52dad729
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 2/5] xen/arm: ffa: Introduce VM to VM support
Date: Mon, 10 Mar 2025 15:50:34 +0100
Message-ID: <75ffd7378e75fb1a07584c1b178600bbfb348425.1741617888.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1741617888.git.bertrand.marquis@arm.com>
References: <cover.1741617888.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a CONFIG_FFA_VM_TO_VM parameter to activate FFA communication
between VMs.
When activated list VMs in the system with FF-A support in part_info_get.

WARNING: There is no filtering for now and all VMs are listed !!

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v2:
- Switch ifdef to IS_ENABLED
- dom was not switched to d as requested by Jan because there is already
  a variable d pointing to the current domain and it must not be
  shadowed.
---
 xen/arch/arm/tee/Kconfig        |  11 +++
 xen/arch/arm/tee/ffa_partinfo.c | 144 +++++++++++++++++++++++++-------
 xen/arch/arm/tee/ffa_private.h  |  12 +++
 3 files changed, 137 insertions(+), 30 deletions(-)

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
 
diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index c0510ceb8338..7af1eca2d0c4 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -77,7 +77,23 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
     };
     uint32_t src_size, dst_size;
     void *dst_buf;
-    uint32_t ffa_sp_count = 0;
+    uint32_t ffa_vm_count = 0, ffa_sp_count = 0;
+
+    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
+    {
+        struct domain *dom;
+
+        /* Count the number of VM with FF-A support */
+        rcu_read_lock(&domlist_read_lock);
+        for_each_domain( dom )
+        {
+            struct ffa_ctx *vm = dom->arch.tee;
+
+            if (dom != d && vm != NULL && vm->guest_vers != 0)
+                ffa_vm_count++;
+        }
+        rcu_read_unlock(&domlist_read_lock);
+    }
 
     /*
      * If the guest is v1.0, he does not get back the entry size so we must
@@ -127,33 +143,38 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
 
     dst_buf = ctx->rx;
 
-    if ( !ffa_rx )
+    /* If not supported, we have ffa_sp_count=0 */
+    if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
     {
-        ret = FFA_RET_DENIED;
-        goto out_rx_release;
-    }
+        if ( !ffa_rx )
+        {
+            ret = FFA_RET_DENIED;
+            goto out_rx_release;
+        }
 
-    spin_lock(&ffa_rx_buffer_lock);
+        spin_lock(&ffa_rx_buffer_lock);
 
-    ret = ffa_partition_info_get(uuid, 0, &ffa_sp_count, &src_size);
+        ret = ffa_partition_info_get(uuid, 0, &ffa_sp_count, &src_size);
 
-    if ( ret )
-        goto out_rx_hyp_unlock;
+        if ( ret )
+            goto out_rx_hyp_unlock;
 
-    /*
-     * ffa_partition_info_get() succeeded so we now own the RX buffer we
-     * share with the SPMC. We must give it back using ffa_hyp_rx_release()
-     * once we've copied the content.
-     */
+        /*
+         * ffa_partition_info_get() succeeded so we now own the RX buffer we
+         * share with the SPMC. We must give it back using ffa_hyp_rx_release()
+         * once we've copied the content.
+         */
 
-    /* we cannot have a size smaller than 1.0 structure */
-    if ( src_size < sizeof(struct ffa_partition_info_1_0) )
-    {
-        ret = FFA_RET_NOT_SUPPORTED;
-        goto out_rx_hyp_release;
+        /* we cannot have a size smaller than 1.0 structure */
+        if ( src_size < sizeof(struct ffa_partition_info_1_0) )
+        {
+            ret = FFA_RET_NOT_SUPPORTED;
+            goto out_rx_hyp_release;
+        }
     }
 
-    if ( ctx->page_count * FFA_PAGE_SIZE < ffa_sp_count * dst_size )
+    if ( ctx->page_count * FFA_PAGE_SIZE <
+         (ffa_sp_count + ffa_vm_count) * dst_size )
     {
         ret = FFA_RET_NO_MEMORY;
         goto out_rx_hyp_release;
@@ -182,25 +203,88 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
         }
     }
 
+    if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
+    {
+        ffa_hyp_rx_release();
+        spin_unlock(&ffa_rx_buffer_lock);
+    }
+
+    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && ffa_vm_count )
+    {
+        struct domain *dom;
+        uint32_t curr = 0;
+
+        /* add the VM informations if any */
+        rcu_read_lock(&domlist_read_lock);
+        for_each_domain( dom )
+        {
+            struct ffa_ctx *vm = dom->arch.tee;
+
+            /*
+             * we do not add the VM calling to the list and only VMs with
+             * FF-A support
+             */
+            if (dom != d && vm != NULL && vm->guest_vers != 0)
+            {
+                /*
+                 * We do not have UUID info for VMs so use
+                 * the 1.0 structure so that we set UUIDs to
+                 * zero using memset
+                 */
+                struct ffa_partition_info_1_0 srcvm;
+
+                if ( curr == ffa_vm_count )
+                {
+                    /*
+                     * The number of domains changed since we counted them, we
+                     * can add new ones if there is enough space in the
+                     * destination buffer so check it or go out with an error.
+                     */
+                    ffa_vm_count++;
+                    if ( ctx->page_count * FFA_PAGE_SIZE <
+                         (ffa_sp_count + ffa_vm_count) * dst_size )
+                    {
+                        ret = FFA_RET_NO_MEMORY;
+                        rcu_read_unlock(&domlist_read_lock);
+                        goto out_rx_release;
+                    }
+                }
+
+                srcvm.id = ffa_get_vm_id(dom);
+                srcvm.execution_context = dom->max_vcpus;
+                srcvm.partition_properties = FFA_PART_VM_PROP;
+                if ( is_64bit_domain(dom) )
+                    srcvm.partition_properties |= FFA_PART_PROP_AARCH64_STATE;
+
+                memcpy(dst_buf, &srcvm, MIN(sizeof(srcvm), dst_size));
+
+                if ( dst_size > sizeof(srcvm) )
+                    memset(dst_buf + sizeof(srcvm), 0,
+                           dst_size - sizeof(srcvm));
+
+                dst_buf += dst_size;
+                curr++;
+            }
+        }
+        rcu_read_unlock(&domlist_read_lock);
+
+        /* the number of domains could have reduce since the initial count */
+        ffa_vm_count = curr;
+    }
+
+    goto out;
+
 out_rx_hyp_release:
     ffa_hyp_rx_release();
 out_rx_hyp_unlock:
     spin_unlock(&ffa_rx_buffer_lock);
 out_rx_release:
-    /*
-     * The calling VM RX buffer only contains data to be used by the VM if the
-     * call was successful, in which case the VM has to release the buffer
-     * once it has used the data.
-     * If something went wrong during the call, we have to release the RX
-     * buffer back to the SPMC as the VM will not do it.
-     */
-    if ( ret != FFA_RET_OK )
-        ffa_rx_release(d);
+    ffa_rx_release(d);
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


