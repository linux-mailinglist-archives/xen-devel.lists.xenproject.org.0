Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53878A8B26C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 09:40:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955192.1349048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4xNj-0007NS-5N; Wed, 16 Apr 2025 07:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955192.1349048; Wed, 16 Apr 2025 07:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4xNi-0007Du-TE; Wed, 16 Apr 2025 07:40:26 +0000
Received: by outflank-mailman (input) for mailman id 955192;
 Wed, 16 Apr 2025 07:40:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8b=XC=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1u4xNh-0004tR-NT
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 07:40:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 0eecce15-1a96-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 09:40:24 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68E091E32;
 Wed, 16 Apr 2025 00:40:22 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.44.175])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C8F73F66E;
 Wed, 16 Apr 2025 00:40:23 -0700 (PDT)
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
X-Inumbo-ID: 0eecce15-1a96-11f0-9eaf-5ba50f476ded
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v5 6/6] xen/arm: ffa: Enable VM to VM without firmware
Date: Wed, 16 Apr 2025 09:39:47 +0200
Message-ID: <ec7213548581c176a2328d051aee77bbd8a6d45a.1744787720.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1744787720.git.bertrand.marquis@arm.com>
References: <cover.1744787720.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When VM to VM support is activated and there is no suitable FF-A support
in the firmware, enable FF-A support for VMs to allow using it for VM to
VM communications.
If there is OP-TEE running in the secure world and using the non FF-A
communication system, having CONFIG_FFA_VM_TO_VM could be non functional
(if optee is probed first) or OP-TEE could be non functional (if FF-A is
probed first) so it is not recommended to activate the configuration
option for such systems.

To make buffer full notification work between VMs when there is no
firmware, rework the notification handling and modify the global flag to
only be used as check for firmware notification support instead.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v5:
- init ctx list when there is no firmware
- rework init a bit to prevent duplicates
- Remove Jens R-b due to changes done
Changes in v4:
- Fix Optee to OP-TEE in commit message
- Add Jens R-b
Changes in v3:
- fix typos in commit message
- add spaces around <<
- move notification id fix back into buffer full patch
- fix | position in if
Changes in v2:
- replace ifdef with IS_ENABLED when possible
---
 xen/arch/arm/tee/ffa.c       |  24 ++++++--
 xen/arch/arm/tee/ffa_notif.c | 104 ++++++++++++++++-------------------
 2 files changed, 67 insertions(+), 61 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index c1c4c0957091..b86c88cefa8c 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -342,8 +342,9 @@ static int ffa_domain_init(struct domain *d)
     struct ffa_ctx *ctx;
     int ret;
 
-    if ( !ffa_fw_version )
+    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !ffa_fw_version )
         return -ENODEV;
+
     /*
      * We are using the domain_id + 1 as the FF-A ID for VMs as FF-A ID 0 is
      * reserved for the hypervisor and we only support secure endpoints using
@@ -579,11 +580,8 @@ static bool ffa_probe(void)
         goto err_rxtx_destroy;
 
     ffa_notif_init();
-    INIT_LIST_HEAD(&ffa_teardown_head);
-    INIT_LIST_HEAD(&ffa_ctx_head);
-    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0);
 
-    return true;
+    goto exit;
 
 err_rxtx_destroy:
     ffa_rxtx_destroy();
@@ -592,6 +590,22 @@ err_no_fw:
     bitmap_zero(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
     printk(XENLOG_WARNING "ARM FF-A No firmware support\n");
 
+exit:
+    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) || ffa_fw_version )
+    {
+        INIT_LIST_HEAD(&ffa_teardown_head);
+        INIT_LIST_HEAD(&ffa_ctx_head);
+        init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0);
+    }
+
+    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
+    {
+        printk(XENLOG_INFO "ARM FF-A only available between VMs\n");
+        return true;
+    }
+    else if ( ffa_fw_version )
+        return true;
+
     return false;
 }
 
diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index f6df2f15bb00..86bef6b3b2ab 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -16,7 +16,7 @@
 
 #include "ffa_private.h"
 
-static bool __ro_after_init notif_enabled;
+static bool __ro_after_init fw_notif_enabled;
 static unsigned int __ro_after_init notif_sri_irq;
 
 int ffa_handle_notification_bind(struct cpu_user_regs *regs)
@@ -27,21 +27,17 @@ int ffa_handle_notification_bind(struct cpu_user_regs *regs)
     uint32_t bitmap_lo = get_user_reg(regs, 3);
     uint32_t bitmap_hi = get_user_reg(regs, 4);
 
-    if ( !notif_enabled )
-        return FFA_RET_NOT_SUPPORTED;
-
     if ( (src_dst & 0xFFFFU) != ffa_get_vm_id(d) )
         return FFA_RET_INVALID_PARAMETERS;
 
     if ( flags )    /* Only global notifications are supported */
         return FFA_RET_DENIED;
 
-    /*
-     * We only support notifications from SP so no need to check the sender
-     * endpoint ID, the SPMC will take care of that for us.
-     */
-    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bitmap_lo,
-                           bitmap_hi);
+    if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
+        return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags,
+                               bitmap_lo, bitmap_hi);
+
+    return FFA_RET_NOT_SUPPORTED;
 }
 
 int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
@@ -51,18 +47,14 @@ int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
     uint32_t bitmap_lo = get_user_reg(regs, 3);
     uint32_t bitmap_hi = get_user_reg(regs, 4);
 
-    if ( !notif_enabled )
-        return FFA_RET_NOT_SUPPORTED;
-
     if ( (src_dst & 0xFFFFU) != ffa_get_vm_id(d) )
         return FFA_RET_INVALID_PARAMETERS;
 
-    /*
-     * We only support notifications from SP so no need to check the
-     * destination endpoint ID, the SPMC will take care of that for us.
-     */
-    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_lo,
-                            bitmap_hi);
+    if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
+        return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_lo,
+                                bitmap_hi);
+
+    return FFA_RET_NOT_SUPPORTED;
 }
 
 void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
@@ -71,7 +63,7 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
     struct ffa_ctx *ctx = d->arch.tee;
     bool notif_pending;
 
-    if ( !notif_enabled )
+    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
     {
         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
         return;
@@ -108,7 +100,7 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
     uint32_t w6 = 0;
     uint32_t w7 = 0;
 
-    if ( !notif_enabled )
+    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
     {
         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
         return;
@@ -120,7 +112,8 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
         return;
     }
 
-    if ( flags & ( FFA_NOTIF_FLAG_BITMAP_SP | FFA_NOTIF_FLAG_BITMAP_SPM ) )
+    if ( fw_notif_enabled && (flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
+                                        FFA_NOTIF_FLAG_BITMAP_SPM )) )
     {
         struct arm_smccc_1_2_regs arg = {
             .a0 = FFA_NOTIFICATION_GET,
@@ -177,15 +170,14 @@ int ffa_handle_notification_set(struct cpu_user_regs *regs)
     uint32_t bitmap_lo = get_user_reg(regs, 3);
     uint32_t bitmap_hi = get_user_reg(regs, 4);
 
-    if ( !notif_enabled )
-        return FFA_RET_NOT_SUPPORTED;
-
     if ( (src_dst >> 16) != ffa_get_vm_id(d) )
         return FFA_RET_INVALID_PARAMETERS;
 
-    /* Let the SPMC check the destination of the notification */
-    return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bitmap_lo,
-                           bitmap_hi);
+    if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
+        return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bitmap_lo,
+                               bitmap_hi);
+
+    return FFA_RET_NOT_SUPPORTED;
 }
 
 #ifdef CONFIG_FFA_VM_TO_VM
@@ -371,7 +363,7 @@ void ffa_notif_init_interrupt(void)
 {
     int ret;
 
-    if ( notif_enabled && notif_sri_irq < NR_GIC_SGI )
+    if ( fw_notif_enabled && notif_sri_irq < NR_GIC_SGI )
     {
         /*
          * An error here is unlikely since the primary CPU has already
@@ -402,41 +394,41 @@ void ffa_notif_init(void)
     int ret;
 
     /* Only enable fw notification if all ABIs we need are supported */
-    if ( !(ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
-           ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_DESTROY) &&
-           ffa_fw_supports_fid(FFA_NOTIFICATION_GET) &&
-           ffa_fw_supports_fid(FFA_NOTIFICATION_INFO_GET_64)) )
-        return;
-
-    arm_smccc_1_2_smc(&arg, &resp);
-    if ( resp.a0 != FFA_SUCCESS_32 )
-        return;
-
-    irq = resp.a2;
-    notif_sri_irq = irq;
-    if ( irq >= NR_GIC_SGI )
-        irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
-    ret = request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
-    if ( ret )
+    if ( ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
+         ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_DESTROY) &&
+         ffa_fw_supports_fid(FFA_NOTIFICATION_GET) &&
+         ffa_fw_supports_fid(FFA_NOTIFICATION_INFO_GET_64) )
     {
-        printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
-               irq, ret);
-        return;
-    }
+        arm_smccc_1_2_smc(&arg, &resp);
+        if ( resp.a0 != FFA_SUCCESS_32 )
+            return;
 
-    notif_enabled = true;
+        irq = resp.a2;
+        notif_sri_irq = irq;
+        if ( irq >= NR_GIC_SGI )
+            irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
+        ret = request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
+        if ( ret )
+        {
+            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
+                   irq, ret);
+            return;
+        }
+        fw_notif_enabled = true;
+    }
 }
 
 int ffa_notif_domain_init(struct domain *d)
 {
     int32_t res;
 
-    if ( !notif_enabled )
-        return 0;
+    if ( fw_notif_enabled )
+    {
 
-    res = ffa_notification_bitmap_create(ffa_get_vm_id(d), d->max_vcpus);
-    if ( res )
-        return -ENOMEM;
+        res = ffa_notification_bitmap_create(ffa_get_vm_id(d), d->max_vcpus);
+        if ( res )
+            return -ENOMEM;
+    }
 
     return 0;
 }
@@ -447,6 +439,6 @@ void ffa_notif_domain_destroy(struct domain *d)
      * Call bitmap_destroy even if bitmap create failed as the SPMC will
      * return a DENIED error that we will ignore.
      */
-    if ( notif_enabled )
+    if ( fw_notif_enabled )
         ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
 }
-- 
2.47.1


