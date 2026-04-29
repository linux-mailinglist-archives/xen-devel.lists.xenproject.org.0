Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEryL8qa8WleiwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 07:44:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7571048F75F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 07:44:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296946.1573112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHxiY-0000f3-W1; Wed, 29 Apr 2026 05:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296946.1573112; Wed, 29 Apr 2026 05:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHxiY-0000bc-SW; Wed, 29 Apr 2026 05:44:14 +0000
Received: by outflank-mailman (input) for mailman id 1296946;
 Wed, 29 Apr 2026 05:44:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bertrand.marquis@arm.com>) id 1wHxiX-0000UH-Ev
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 05:44:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHxiW-003p6b-Qr
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 07:44:12 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 69f19a94-e002-0a2a0a5209dd-0a2a450cba4e-24
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 07:44:12 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 69f19aab-62f1-0a2a450c0019-d98c6eacb3d2-1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 07:44:12 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0856D2BCE;
 Tue, 28 Apr 2026 22:44:06 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.90.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29A5B3F62B;
 Tue, 28 Apr 2026 22:44:10 -0700 (PDT)
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
	t=1777441451; bh=HhDBJf0IfXGwpTjfY2ecC/WNtpLQx+0BHlKhp3zkvP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IyJIf0pObIJcvGsVV9rDtmrwWDUL7jn1OseYOkchfyR6ODE67oB/EJgwZ9Ktpy4AA
	 KJsL3tzy0R1TvDrx8ZkjYsKpVD2BNVCDyQYY4zBvHUhbeEBO+CDCDUpKQQj8Rd1TqZ
	 fGK6iiLEeIkfWb7lU9BUUmWksA0S19uJDoKnx5E8=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 5/6] xen/arm: ffa: Track VM notification bindings locally
Date: Wed, 29 Apr 2026 07:43:26 +0200
Message-ID: <13a7b810346a31acb5b1407b51c17141aebb33f8.1776955622.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776955622.git.bertrand.marquis@arm.com>
References: <cover.1776955622.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1777441452-6E169CF5-22CD8A8E/0/0
X-purgate-type: clean
X-purgate-size: 7559
X-Rspamd-Queue-Id: 7571048F75F
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.900];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

VM-to-VM notifications need receiver-side bind state so Xen can validate
which sender owns each notification bit. Non-secure BIND and UNBIND
requests currently have no local state and cannot enforce that contract.

Add per-bit VM notification binding state to struct ffa_ctx_notif and
use it to handle non-secure BIND and UNBIND requests when
CONFIG_FFA_VM_TO_VM is enabled. The update helper validates the whole
request under notif_lock before mutating anything, denies bind or
unbind when a bit is pending, rejects rebinding to a different sender,
and keeps rebinding to the same sender idempotent.

Promote vm_pending to a bitmap so the bind logic can reason per
notification ID, use that bitmap directly when reporting pending state,
and initialize and clear the new VM notification state during domain
init and teardown.

Functional impact: when CONFIG_FFA_VM_TO_VM is enabled, Xen tracks VM
notification bindings locally and validates non-secure bind and unbind
requests against that state.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
- use memset() to clear vm_bind[] in init/destroy
- replace the file-scope #error check with BUILD_BUG_ON()
---
 xen/arch/arm/tee/ffa_notif.c   | 96 ++++++++++++++++++++++++++++++----
 xen/arch/arm/tee/ffa_private.h | 11 ++--
 2 files changed, 94 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index e1cd852d1c53..a841c8f8d747 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -8,6 +8,7 @@
 #include <xen/list.h>
 #include <xen/notifier.h>
 #include <xen/spinlock.h>
+#include <xen/string.h>
 #include <xen/tasklet.h>
 #include <xen/types.h>
 
@@ -58,6 +59,54 @@ static int32_t ffa_notif_validate_params(uint16_t dom_id, uint16_t caller_id,
     return FFA_RET_OK;
 }
 
+static int32_t ffa_notif_update_vm_binding(struct ffa_ctx *ctx,
+                                           uint16_t dest_id, uint64_t bitmap,
+                                           bool bind)
+{
+    unsigned int id;
+    int32_t ret = FFA_RET_OK;
+
+    spin_lock(&ctx->notif.notif_lock);
+
+    for ( id = 0; id < FFA_NUM_VM_NOTIF; id++ )
+    {
+        if ( !(bitmap & BIT(id, ULL)) )
+            continue;
+
+        if ( ctx->notif.vm_pending & BIT(id, ULL) )
+        {
+            ret = FFA_RET_DENIED;
+            goto out_unlock;
+        }
+
+        if ( bind )
+        {
+            if ( ctx->notif.vm_bind[id] != 0 &&
+                 ctx->notif.vm_bind[id] != dest_id )
+            {
+                ret = FFA_RET_DENIED;
+                goto out_unlock;
+            }
+        }
+        else if ( ctx->notif.vm_bind[id] != dest_id )
+        {
+            ret = FFA_RET_DENIED;
+            goto out_unlock;
+        }
+    }
+
+    for ( id = 0; id < FFA_NUM_VM_NOTIF; id++ )
+    {
+        if ( bitmap & BIT(id, ULL) )
+            ctx->notif.vm_bind[id] = bind ? dest_id : 0;
+    }
+
+out_unlock:
+    spin_unlock(&ctx->notif.notif_lock);
+
+    return ret;
+}
+
 int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
@@ -78,11 +127,21 @@ int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
     if ( ret )
         return ret;
 
-    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
-        return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags,
-                               bitmap_lo, bitmap_hi);
+    if ( FFA_ID_IS_SECURE(dest_id) )
+    {
+        if ( fw_notif_enabled )
+            return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags,
+                                   bitmap_lo, bitmap_hi);
 
-    return FFA_RET_NOT_SUPPORTED;
+        return FFA_RET_NOT_SUPPORTED;
+    }
+
+    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
+        return FFA_RET_NOT_SUPPORTED;
+
+    return ffa_notif_update_vm_binding(ctx, dest_id,
+                                       ((uint64_t)bitmap_hi << 32) | bitmap_lo,
+                                       true);
 }
 
 int32_t ffa_handle_notification_unbind(struct cpu_user_regs *regs)
@@ -101,11 +160,21 @@ int32_t ffa_handle_notification_unbind(struct cpu_user_regs *regs)
     if ( ret )
         return ret;
 
-    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
-        return ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_lo,
-                               bitmap_hi);
+    if ( FFA_ID_IS_SECURE(dest_id) )
+    {
+        if ( fw_notif_enabled )
+            return ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0,
+                                   bitmap_lo, bitmap_hi);
 
-    return FFA_RET_NOT_SUPPORTED;
+        return FFA_RET_NOT_SUPPORTED;
+    }
+
+    if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
+        return FFA_RET_NOT_SUPPORTED;
+
+    return ffa_notif_update_vm_binding(ctx, dest_id,
+                                       ((uint64_t)bitmap_hi << 32) | bitmap_lo,
+                                       false);
 }
 
 void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
@@ -127,9 +196,10 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
 
     if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
     {
-        notif_pending |= test_and_clear_bool(ctx->notif.vm_pending);
-
         spin_lock(&ctx->notif.notif_lock);
+        if ( ctx->notif.vm_pending )
+            notif_pending = true;
+
         if ( ctx->notif.hyp_pending )
             notif_pending = true;
         spin_unlock(&ctx->notif.notif_lock);
@@ -498,9 +568,13 @@ int ffa_notif_domain_init(struct domain *d)
     struct ffa_ctx *ctx = d->arch.tee;
     int32_t res;
 
+    BUILD_BUG_ON(FFA_NUM_VM_NOTIF > 64);
+
     spin_lock_init(&ctx->notif.notif_lock);
     ctx->notif.notif_irq_raised = false;
     ctx->notif.secure_pending = false;
+    ctx->notif.vm_pending = 0;
+    memset(ctx->notif.vm_bind, 0, sizeof(ctx->notif.vm_bind));
     ctx->notif.hyp_pending = 0;
 
     if ( fw_notif_enabled )
@@ -520,6 +594,8 @@ void ffa_notif_domain_destroy(struct domain *d)
     spin_lock(&ctx->notif.notif_lock);
     ctx->notif.notif_irq_raised = false;
     ctx->notif.secure_pending = false;
+    ctx->notif.vm_pending = 0;
+    memset(ctx->notif.vm_bind, 0, sizeof(ctx->notif.vm_bind));
     ctx->notif.hyp_pending = 0;
     spin_unlock(&ctx->notif.notif_lock);
 
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 9ddda3f88986..78a0a9815d56 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -236,6 +236,7 @@
 #define FFA_NOTIF_INFO_GET_ID_COUNT_MASK    0x1F
 
 #define FFA_NOTIF_RX_BUFFER_FULL        BIT(0, U)
+#define FFA_NUM_VM_NOTIF                64U
 
 /* Feature IDs used with FFA_FEATURES */
 #define FFA_FEATURE_NOTIF_PEND_INTR     0x1U
@@ -334,10 +335,14 @@ struct ffa_ctx_notif {
     bool secure_pending;
 
     /*
-     * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
-     * pending notifications from VMs (including framework ones).
+     * Bitmap of pending notifications from VMs (including framework ones).
+     */
+    uint64_t vm_pending;
+
+    /*
+     * Source endpoint bound to each VM notification ID (0 means unbound).
      */
-    bool vm_pending;
+    uint16_t vm_bind[FFA_NUM_VM_NOTIF];
 
     /*
      * Lock protecting the hypervisor-managed notification state.
-- 
2.53.0


