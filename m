Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJnDNM2a8WkliwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 07:44:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7621A48F751
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 07:44:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296949.1573121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHxia-0000wq-BM; Wed, 29 Apr 2026 05:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296949.1573121; Wed, 29 Apr 2026 05:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHxia-0000tM-7G; Wed, 29 Apr 2026 05:44:16 +0000
Received: by outflank-mailman (input) for mailman id 1296949;
 Wed, 29 Apr 2026 05:44:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bertrand.marquis@arm.com>) id 1wHxiZ-0000ee-3A
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 05:44:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHxiY-002Hh3-FU
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 07:44:14 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 69f19aab-2eae-0a2a0a5409dd-0a2a4501be9e-6
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 07:44:14 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 69f19aad-c1f2-0a2a45010019-d98c6eac870c-1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 07:44:14 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6533328D;
 Tue, 28 Apr 2026 22:44:07 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.90.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFC2A3F62B;
 Tue, 28 Apr 2026 22:44:11 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777441453; bh=bzcppw7eOfYm4UiVzmHypcylvW+Izet9K8ImNObcrec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EcTW028WW95ZvmPZrEP3MQi38GiBXqEkA3YIIlkrpv8KntLoZC1veLBlB0VXu4Kbe
	 YT+yJM9PfMnmtQOemAu3Zhn+PfCP/pyL+qjsE++Dckr70vKM1is21h6w5v4ncqXRKR
	 Q2tLb0cg+i3tayPZilp/KryTowOReQLSLo4exmAk=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 6/6] xen/arm: ffa: Deliver VM-to-VM notifications locally
Date: Wed, 29 Apr 2026 07:43:27 +0200
Message-ID: <1ead2af7182a0501f16e7b4e9ad3e58ccd8f538c.1776955622.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776955622.git.bertrand.marquis@arm.com>
References: <cover.1776955622.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1777441454-BDC64FF4-3CDC08FC/0/0
X-purgate-type: clean
X-purgate-size: 9730
X-Rspamd-Queue-Id: 7621A48F751
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.939];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

VM notification binding and pending tracking exist for non-secure
endpoints, but FFA_NOTIFICATION_SET still only forwards secure
destinations to the SPMC. Non-secure VMs therefore cannot receive
notifications from other VMs. Local NPI delivery also needs explicit
re-arm tracking so repeated raises are not lost while the interrupt is
already pending.

Add a local VM notification delivery path for non-secure destinations.
notification_set_vm() resolves the destination endpoint, verifies that
every requested bit is bound to the sender, sets the receiver's
vm_pending bitmap under notif_lock, and raises an NPI only when local
pending state is not already armed.

Track whether a local NPI is already armed with notif_irq_raised,
clear that state once both VM and hypervisor pending bitmaps are
drained, and keep notif_lock held across the VM notification injection
attempt. If no destination vCPU is online, leave the pending bits set
and keep notif_irq_raised clear so delivery can be retried later.
Also expose firmware notification availability so FFA_FEATURES only
advertises notification support when it is actually provided by the
firmware or by CONFIG_FFA_VM_TO_VM.

Functional impact: when CONFIG_FFA_VM_TO_VM is enabled, non-secure
FFA_NOTIFICATION_SET delivers VM-to-VM notifications locally and keeps
NPI delivery reliable across repeated raises.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
- serialize notification_set_vm() state updates with the NPI attempt
- keep pending VM notifications set when local injection fails
---
 xen/arch/arm/tee/ffa.c         | 24 ++++++++--
 xen/arch/arm/tee/ffa_notif.c   | 82 ++++++++++++++++++++++++++++++++--
 xen/arch/arm/tee/ffa_private.h | 17 ++++---
 3 files changed, 107 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 1fe33f26454a..7fe021049cba 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -39,8 +39,13 @@
  * o FFA_MSG_SEND_DIRECT_REQ:
  *   - only supported from a VM to an SP
  * o FFA_NOTIFICATION_*:
+ *   - only supported when firmware notifications are enabled or VM-to-VM
+ *     support is built in
  *   - only supports global notifications, that is, per vCPU notifications
- *     are not supported
+ *     are not supported and secure per-vCPU notification information is
+ *     not forwarded
+ *   - the source endpoint ID reported for a notification may no longer
+ *     exist by the time the receiver consumes it
  *   - doesn't support signalling the secondary scheduler of pending
  *     notification for secure partitions
  *   - doesn't support notifications for Xen itself
@@ -245,6 +250,8 @@ static void handle_features(struct cpu_user_regs *regs)
     uint32_t a1 = get_user_reg(regs, 1);
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
+    bool notif_supported = IS_ENABLED(CONFIG_FFA_VM_TO_VM) ||
+                           ffa_notif_fw_enabled();
 
     /*
      * FFA_FEATURES defines w2 as input properties only for specific
@@ -343,10 +350,16 @@ static void handle_features(struct cpu_user_regs *regs)
 
         break;
     case FFA_FEATURE_NOTIF_PEND_INTR:
-        ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0);
+        if ( notif_supported )
+            ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0);
+        else
+            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
         break;
     case FFA_FEATURE_SCHEDULE_RECV_INTR:
-        ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_ID, 0);
+        if ( notif_supported )
+            ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_ID, 0);
+        else
+            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
         break;
     case FFA_PARTITION_INFO_GET_REGS:
         if ( ACCESS_ONCE(ctx->guest_vers) >= FFA_VERSION_1_2 )
@@ -361,7 +374,10 @@ static void handle_features(struct cpu_user_regs *regs)
     case FFA_NOTIFICATION_SET:
     case FFA_NOTIFICATION_INFO_GET_32:
     case FFA_NOTIFICATION_INFO_GET_64:
-        ffa_set_regs_success(regs, 0, 0);
+        if ( notif_supported )
+            ffa_set_regs_success(regs, 0, 0);
+        else
+            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
         break;
     default:
         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index a841c8f8d747..b29d948a7110 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -21,6 +21,11 @@ static bool __ro_after_init fw_notif_enabled;
 static unsigned int __ro_after_init notif_sri_irq;
 static DEFINE_SPINLOCK(notif_info_lock);
 
+bool ffa_notif_fw_enabled(void)
+{
+    return fw_notif_enabled;
+}
+
 static bool inject_notif_pending(struct domain *d)
 {
     struct vcpu *v;
@@ -107,6 +112,55 @@ out_unlock:
     return ret;
 }
 
+/*
+ * Deliver a VM-to-VM notification. ctx->notif.notif_lock protects
+ * vm_bind/vm_pending so callers must not hold it already.
+ */
+static int32_t notification_set_vm(uint16_t dst_id, uint16_t src_id,
+                                   uint32_t flags, uint64_t bitmap)
+{
+    struct domain *dst_d;
+    struct ffa_ctx *dst_ctx;
+    unsigned int id;
+    int32_t ret;
+
+    if ( flags )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    ret = ffa_endpoint_domain_lookup(dst_id, &dst_d, &dst_ctx);
+    if ( ret )
+        return ret;
+
+    ret = FFA_RET_OK;
+
+    spin_lock(&dst_ctx->notif.notif_lock);
+
+    for ( id = 0; id < FFA_NUM_VM_NOTIF; id++ )
+    {
+        if ( !(bitmap & BIT(id, ULL)) )
+            continue;
+
+        if ( dst_ctx->notif.vm_bind[id] != src_id )
+        {
+            ret = FFA_RET_DENIED;
+            goto out_unlock;
+        }
+    }
+
+    dst_ctx->notif.vm_pending |= bitmap;
+    if ( !dst_ctx->notif.notif_irq_raised &&
+         (dst_ctx->notif.vm_pending || dst_ctx->notif.hyp_pending) &&
+         inject_notif_pending(dst_d) )
+        dst_ctx->notif.notif_irq_raised = true;
+
+out_unlock:
+    spin_unlock(&dst_ctx->notif.notif_lock);
+
+    rcu_unlock_domain(dst_d);
+
+    return ret;
+}
+
 int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
@@ -288,6 +342,8 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
 
     if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
     {
+        bool pending;
+
         spin_lock(&ctx->notif.notif_lock);
 
         if ( (flags & FFA_NOTIF_FLAG_BITMAP_HYP) && ctx->notif.hyp_pending )
@@ -298,6 +354,18 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
                 ctx->notif.notif_irq_raised = false;
         }
 
+        if ( (flags & FFA_NOTIF_FLAG_BITMAP_VM) && ctx->notif.vm_pending )
+        {
+            w4 = (uint32_t)(ctx->notif.vm_pending & GENMASK(31, 0));
+            w5 = (uint32_t)((ctx->notif.vm_pending >> 32) & GENMASK(31, 0));
+            ctx->notif.vm_pending = 0;
+        }
+
+        pending = (ctx->notif.hyp_pending != 0) ||
+                  (ctx->notif.vm_pending != 0);
+        if ( !pending )
+            ctx->notif.notif_irq_raised = false;
+
         spin_unlock(&ctx->notif.notif_lock);
     }
 
@@ -323,9 +391,17 @@ int32_t ffa_handle_notification_set(struct cpu_user_regs *regs)
     if ( flags )
         return FFA_RET_INVALID_PARAMETERS;
 
-    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
-        return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bitmap_lo,
-                               bitmap_hi);
+    if ( FFA_ID_IS_SECURE(dest_id) )
+    {
+        if ( fw_notif_enabled )
+            return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags,
+                                   bitmap_lo, bitmap_hi);
+    }
+    else if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
+    {
+        return notification_set_vm(dest_id, caller_id, flags,
+                                   ((uint64_t)bitmap_hi << 32) | bitmap_lo);
+    }
 
     return FFA_RET_NOT_SUPPORTED;
 }
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 78a0a9815d56..923a071a9d7c 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -340,20 +340,18 @@ struct ffa_ctx_notif {
     uint64_t vm_pending;
 
     /*
-     * Source endpoint bound to each VM notification ID (0 means unbound).
+     * Tracks whether an NPI has been raised for local pending notifications.
+     * Protected by notif_lock.
      */
-    uint16_t vm_bind[FFA_NUM_VM_NOTIF];
+    bool notif_irq_raised;
 
     /*
-     * Lock protecting the hypervisor-managed notification state.
+     * Source endpoint bound to each VM notification ID (0 means unbound).
      */
-    spinlock_t notif_lock;
+    uint16_t vm_bind[FFA_NUM_VM_NOTIF];
 
-    /*
-     * Tracks whether a local notification pending interrupt was raised.
-     * Protected by notif_lock.
-     */
-    bool notif_irq_raised;
+    /* Lock protecting local notification state. */
+    spinlock_t notif_lock;
 
     /*
      * Bitmap of pending hypervisor notifications (for HYP bitmap queries).
@@ -495,6 +493,7 @@ void ffa_notif_init(void);
 void ffa_notif_init_interrupt(void);
 int ffa_notif_domain_init(struct domain *d);
 void ffa_notif_domain_destroy(struct domain *d);
+bool ffa_notif_fw_enabled(void);
 
 int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs);
 int32_t ffa_handle_notification_unbind(struct cpu_user_regs *regs);
-- 
2.53.0


