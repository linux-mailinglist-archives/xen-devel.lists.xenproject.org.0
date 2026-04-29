Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UP+sNc2a8WleiwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 07:44:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6243E48F74D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 07:44:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296944.1573099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHxiW-0000GR-MV; Wed, 29 Apr 2026 05:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296944.1573099; Wed, 29 Apr 2026 05:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHxiW-0000DJ-Iq; Wed, 29 Apr 2026 05:44:12 +0000
Received: by outflank-mailman (input) for mailman id 1296944;
 Wed, 29 Apr 2026 05:44:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bertrand.marquis@arm.com>) id 1wHxiV-00005z-L6
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 05:44:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHxiV-002Hh3-0w
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 07:44:11 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 69f19a93-2eae-0a2a0a5409dd-0a2a45099eba-44
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 07:44:11 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 69f19aaa-2497-0a2a45090019-d98c6eaccf84-1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 07:44:10 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 493EA2BCE;
 Tue, 28 Apr 2026 22:44:04 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.90.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 690FD3F62B;
 Tue, 28 Apr 2026 22:44:08 -0700 (PDT)
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
	t=1777441449; bh=BJ9kpVORXjEmJR3F6tp4iMiyL0HijTQJTCH2Qdp2K1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dj6lhwGKazFYUmEf7LGtDyFsmG0A361JkJGAE9N5HVdzJvD+KQzg3+ZBzE7DmoUYq
	 JO1RFx81+xWGobW+Dc3V3X5dJIhufRaAijA9bbV2xns+fylDh+2sFygNibL5acWcqr
	 8CSNKBYnGab6q8daj0JizFr7UeppPqRxPohsDMh0=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 4/6] xen/arm: ffa: Preserve secure notification state when polling SPMC
Date: Wed, 29 Apr 2026 07:43:25 +0200
Message-ID: <b22ff7b7bf12fc21e6fbff47d77b092f5c487aec.1776955622.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776955622.git.bertrand.marquis@arm.com>
References: <cover.1776955622.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1777441450-4377AA53-000CACC7/0/0
X-purgate-type: clean
X-purgate-size: 7201
X-Rspamd-Queue-Id: 6243E48F74D
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
	NEURAL_HAM(-0.00)[-0.940];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

Secure pending state is latched when the SPMC raises the schedule
receiver interrupt, but Xen currently clears that latch too aggressively.
Guest FFA_NOTIFICATION_INFO_GET consumes secure_pending even though it
only reports pending state, and secure FFA_NOTIFICATION_GET only clears
the latch when both SP and SPM bitmaps are requested together. This can
drop a pending indication before the receiver retrieves secure
notifications, or keep INFO_GET reporting stale secure pending state
after a successful GET.

Keep secure_pending as a latched indication until secure notifications
are actually retrieved. Guest FFA_NOTIFICATION_INFO_GET now reports the
latched state without clearing it, while a successful secure
FFA_NOTIFICATION_GET clears the latch regardless of which secure bitmap
flags were requested. Also protect secure_pending with notif_lock,
serialize SPMC INFO_GET polling behind notif_info_lock, and preserve the
caller-visible INFO_GET success width.

Functional impact: guest INFO_GET preserves the secure pending
indication until secure notifications are retrieved, and successful
secure GET clears the guest-visible pending latch.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
- drop the defensive fw_notif_enabled guard in notif_sri_action()
---
 xen/arch/arm/tee/ffa_notif.c | 51 ++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 1260f98a77e9..e1cd852d1c53 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -18,6 +18,7 @@
 
 static bool __ro_after_init fw_notif_enabled;
 static unsigned int __ro_after_init notif_sri_irq;
+static DEFINE_SPINLOCK(notif_info_lock);
 
 static bool inject_notif_pending(struct domain *d)
 {
@@ -111,6 +112,7 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
+    uint32_t fid = get_user_reg(regs, 0);
     bool notif_pending;
 
     if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
@@ -119,7 +121,10 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
         return;
     }
 
-    notif_pending = test_and_clear_bool(ctx->notif.secure_pending);
+    spin_lock(&ctx->notif.notif_lock);
+    notif_pending = ctx->notif.secure_pending;
+    spin_unlock(&ctx->notif.notif_lock);
+
     if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
     {
         notif_pending |= test_and_clear_bool(ctx->notif.vm_pending);
@@ -133,7 +138,9 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
     if ( notif_pending )
     {
         /* A pending global notification for the guest */
-        ffa_set_regs(regs, FFA_SUCCESS_64, 0,
+        ffa_set_regs(regs,
+                     smccc_is_conv_64(fid) ? FFA_SUCCESS_64 : FFA_SUCCESS_32,
+                     0,
                      1U << FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT, ffa_get_vm_id(d),
                      0, 0, 0, 0);
     }
@@ -156,6 +163,8 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
     uint32_t w5 = 0;
     uint32_t w6 = 0;
     uint32_t w7 = 0;
+    uint32_t secure_flags = flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
+                                      FFA_NOTIF_FLAG_BITMAP_SPM );
 
     if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
     {
@@ -175,27 +184,16 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
         return;
     }
 
-    if ( fw_notif_enabled && (flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
-                                        FFA_NOTIF_FLAG_BITMAP_SPM )) )
+    if ( fw_notif_enabled && secure_flags )
     {
         struct arm_smccc_1_2_regs arg = {
             .a0 = FFA_NOTIFICATION_GET,
             .a1 = recv,
-            .a2 = flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
-                            FFA_NOTIF_FLAG_BITMAP_SPM ),
+            .a2 = secure_flags,
         };
         struct arm_smccc_1_2_regs resp;
         int32_t e;
 
-        /*
-         * Clear secure pending if both FFA_NOTIF_FLAG_BITMAP_SP and
-         * FFA_NOTIF_FLAG_BITMAP_SPM are set since secure world can't have
-         * any more pending notifications.
-         */
-        if ( ( flags  & FFA_NOTIF_FLAG_BITMAP_SP ) &&
-             ( flags & FFA_NOTIF_FLAG_BITMAP_SPM ) )
-            ACCESS_ONCE(ctx->notif.secure_pending) = false;
-
         arm_smccc_1_2_smc(&arg, &resp);
         e = ffa_get_ret_code(&resp);
         if ( e )
@@ -212,6 +210,10 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
 
         if ( flags & FFA_NOTIF_FLAG_BITMAP_SPM )
             w6 = resp.a6;
+
+        spin_lock(&ctx->notif.notif_lock);
+        ctx->notif.secure_pending = false;
+        spin_unlock(&ctx->notif.notif_lock);
     }
 
     if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
@@ -356,7 +358,10 @@ static void notif_vm_pend_intr(uint16_t vm_id)
      * guarantees that the data structure isn't freed while we're accessing
      * it.
      */
-    ACCESS_ONCE(ctx->notif.secure_pending) = true;
+    spin_lock(&ctx->notif.notif_lock);
+    ctx->notif.secure_pending = true;
+    spin_unlock(&ctx->notif.notif_lock);
+
     inject_notif_pending(d);
 
 out_unlock:
@@ -375,11 +380,15 @@ static void notif_sri_action(void *unused)
     unsigned int n;
     int32_t res;
 
-    do {
+    spin_lock(&notif_info_lock);
+
+    do
+    {
         arm_smccc_1_2_smc(&arg, &resp);
         res = ffa_get_ret_code(&resp);
         if ( res )
         {
+            spin_unlock(&notif_info_lock);
             if ( res != FFA_RET_NO_DATA && printk_ratelimit() )
                 printk(XENLOG_WARNING
                        "ffa: notification info get failed: error %d\n", res);
@@ -393,7 +402,7 @@ static void notif_sri_action(void *unused)
         id_pos = 0;
         for ( n = 0; n < list_count; n++ )
         {
-            unsigned int count = ((ids_count >> 2 * n) & 0x3) + 1;
+            unsigned int count = ((ids_count >> (2 * n)) & 0x3) + 1;
             uint16_t vm_id = get_id_from_resp(&resp, id_pos);
 
             notif_vm_pend_intr(vm_id);
@@ -401,7 +410,9 @@ static void notif_sri_action(void *unused)
             id_pos += count;
         }
 
-    } while (resp.a2 & FFA_NOTIF_INFO_GET_MORE_FLAG);
+    } while ( resp.a2 & FFA_NOTIF_INFO_GET_MORE_FLAG );
+
+    spin_unlock(&notif_info_lock);
 }
 
 static DECLARE_TASKLET(notif_sri_tasklet, notif_sri_action, NULL);
@@ -489,6 +500,7 @@ int ffa_notif_domain_init(struct domain *d)
 
     spin_lock_init(&ctx->notif.notif_lock);
     ctx->notif.notif_irq_raised = false;
+    ctx->notif.secure_pending = false;
     ctx->notif.hyp_pending = 0;
 
     if ( fw_notif_enabled )
@@ -507,6 +519,7 @@ void ffa_notif_domain_destroy(struct domain *d)
 
     spin_lock(&ctx->notif.notif_lock);
     ctx->notif.notif_irq_raised = false;
+    ctx->notif.secure_pending = false;
     ctx->notif.hyp_pending = 0;
     spin_unlock(&ctx->notif.notif_lock);
 
-- 
2.53.0


