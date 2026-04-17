Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJUzMJ044mm13QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 15:41:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD6D41BC17
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 15:41:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284306.1566151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjRx-0006Jv-FO; Fri, 17 Apr 2026 13:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284306.1566151; Fri, 17 Apr 2026 13:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjRx-0006Hw-BV; Fri, 17 Apr 2026 13:41:37 +0000
Received: by outflank-mailman (input) for mailman id 1284306;
 Fri, 17 Apr 2026 13:41:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bertrand.marquis@arm.com>) id 1wDjRv-000617-Dt
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 13:41:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDjRu-009kb3-Qj
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 15:41:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 69e2387d-e002-0a2a0a5209dd-0a2a4501dbf6-44
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 15:41:34 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 69e2388e-c1f2-0a2a45010019-d98c6eacc4ba-1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 15:41:34 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B3C01516;
 Fri, 17 Apr 2026 06:41:28 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.89.170])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D90F3F7D8;
 Fri, 17 Apr 2026 06:41:32 -0700 (PDT)
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
	t=1776433293; bh=muz5M8Iqgy9eYpjCmc9pZ8VEHmiBcMu4FfUho63d0M0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iZTB9GDnC8dlk4AuK5JEPg+WSaTmt+qDuvHT6F6NOx2Z/7Af49FmybLRpf2vLCeJ+
	 ZfyhuzZXZe5xRicWkcQ64iNe5zjxp0Y/XgX38wJJYkQm1RyTIJpE5/nSVgBcMVQzfH
	 99YaNfJX4D5swFgq217QsO69bfIdG3TBCLtW+vmU=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 4/6] xen/arm: ffa: Preserve secure notification state when polling SPMC
Date: Fri, 17 Apr 2026 15:40:52 +0200
Message-ID: <5b9ce4a4a3927ce2287ec4db7f864174f53b8f17.1776266307.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776266307.git.bertrand.marquis@arm.com>
References: <cover.1776266307.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1776433294-B5468FF4-67EDDF68/0/0
X-purgate-type: clean
X-purgate-size: 7136
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4FD6D41BC17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 xen/arch/arm/tee/ffa_notif.c | 54 +++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 491db3b04df5..fff00ca2baec 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -18,6 +18,7 @@
 
 static bool __ro_after_init fw_notif_enabled;
 static unsigned int __ro_after_init notif_sri_irq;
+static DEFINE_SPINLOCK(notif_info_lock);
 
 static void inject_notif_pending(struct domain *d)
 {
@@ -109,6 +110,7 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
+    uint32_t fid = get_user_reg(regs, 0);
     bool notif_pending;
 
     if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
@@ -117,7 +119,10 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
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
@@ -131,7 +136,9 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
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
@@ -154,6 +161,8 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
     uint32_t w5 = 0;
     uint32_t w6 = 0;
     uint32_t w7 = 0;
+    uint32_t secure_flags = flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
+                                      FFA_NOTIF_FLAG_BITMAP_SPM );
 
     if ( !IS_ENABLED(CONFIG_FFA_VM_TO_VM) && !fw_notif_enabled )
     {
@@ -173,27 +182,16 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
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
@@ -210,6 +208,10 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
 
         if ( flags & FFA_NOTIF_FLAG_BITMAP_SPM )
             w6 = resp.a6;
+
+        spin_lock(&ctx->notif.notif_lock);
+        ctx->notif.secure_pending = false;
+        spin_unlock(&ctx->notif.notif_lock);
     }
 
     if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
@@ -354,7 +356,10 @@ static void notif_vm_pend_intr(uint16_t vm_id)
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
@@ -373,11 +378,18 @@ static void notif_sri_action(void *unused)
     unsigned int n;
     int32_t res;
 
-    do {
+    if ( !fw_notif_enabled )
+        return;
+
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
@@ -391,7 +403,7 @@ static void notif_sri_action(void *unused)
         id_pos = 0;
         for ( n = 0; n < list_count; n++ )
         {
-            unsigned int count = ((ids_count >> 2 * n) & 0x3) + 1;
+            unsigned int count = ((ids_count >> (2 * n)) & 0x3) + 1;
             uint16_t vm_id = get_id_from_resp(&resp, id_pos);
 
             notif_vm_pend_intr(vm_id);
@@ -399,7 +411,9 @@ static void notif_sri_action(void *unused)
             id_pos += count;
         }
 
-    } while (resp.a2 & FFA_NOTIF_INFO_GET_MORE_FLAG);
+    } while ( resp.a2 & FFA_NOTIF_INFO_GET_MORE_FLAG );
+
+    spin_unlock(&notif_info_lock);
 }
 
 static DECLARE_TASKLET(notif_sri_tasklet, notif_sri_action, NULL);
@@ -486,6 +500,7 @@ int ffa_notif_domain_init(struct domain *d)
     int32_t res;
 
     spin_lock_init(&ctx->notif.notif_lock);
+    ctx->notif.secure_pending = false;
     ctx->notif.hyp_pending = 0;
 
     if ( fw_notif_enabled )
@@ -503,6 +518,7 @@ void ffa_notif_domain_destroy(struct domain *d)
     struct ffa_ctx *ctx = d->arch.tee;
 
     spin_lock(&ctx->notif.notif_lock);
+    ctx->notif.secure_pending = false;
     ctx->notif.hyp_pending = 0;
     spin_unlock(&ctx->notif.notif_lock);
 
-- 
2.53.0


