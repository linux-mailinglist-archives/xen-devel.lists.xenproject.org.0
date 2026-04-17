Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMIDDKE44mm13QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 15:41:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25FF41BC21
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2026 15:41:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284302.1566133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjRs-0005nY-Sf; Fri, 17 Apr 2026 13:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284302.1566133; Fri, 17 Apr 2026 13:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDjRs-0005ld-PP; Fri, 17 Apr 2026 13:41:32 +0000
Received: by outflank-mailman (input) for mailman id 1284302;
 Fri, 17 Apr 2026 13:41:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bertrand.marquis@arm.com>) id 1wDjRr-0005cp-T0
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 13:41:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDjRr-000Ejb-9z
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2026 15:41:31 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 69e23878-5cb7-0a2a0a5109dd-0a2a450a8746-26
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 15:41:31 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 69e2388a-56b3-0a2a450a0019-d98c6eacc2a8-1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Apr 2026 15:41:31 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 845031516;
 Fri, 17 Apr 2026 06:41:24 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.89.170])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5E8A3F7D8;
 Fri, 17 Apr 2026 06:41:28 -0700 (PDT)
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
	t=1776433290; bh=caqGVxvnjz0bVK6Ez9rNrj5k4WIzyoABx5lWZ62MqVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F/9rK41YnPUbCvUBHCt5U0B3AIRzfayyu4D5MvWYWuc5xGXma+MxvpDDLffQHSAt1
	 B7Bg4iM3FAywj4XwhUbq14JxtRUZZPfPf8yYJSbdp5KP+U5YjXRuj29S8szj7wmgER
	 JoceslpxERiNOPD+UNgMD4dmFI7ngoNnufOaX6AY=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 2/6] xen/arm: ffa: Track hypervisor notifications in a bitmap
Date: Fri, 17 Apr 2026 15:40:50 +0200
Message-ID: <7053b8c14bbe50cc855dad0a82cde2bb10153d2b.1776266307.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776266307.git.bertrand.marquis@arm.com>
References: <cover.1776266307.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1776433291-CEB778B7-F8329588/0/0
X-purgate-type: clean
X-purgate-size: 4902
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
X-Rspamd-Queue-Id: B25FF41BC21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hypervisor notifications are currently tracked with a dedicated
buff_full_pending boolean. That state only represents a single HYP
notification bit and keeps HYP bitmap handling tied to single-purpose
bookkeeping.

Replace the boolean with a hypervisor notification bitmap protected by
notif_lock. INFO_GET reports pending when the bitmap is non-zero, GET
returns and clears the HYP bitmap under the lock, and RX-buffer-full
sets FFA_NOTIF_RX_BUFFER_FULL in the bitmap instead of updating
separate state.

Initialize and clear the bitmap during domain lifecycle handling, and
use ctx->ffa_id for bitmap create and destroy so the notification state
stays tied to the cached FF-A endpoint ID.

No functional changes.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa_notif.c   | 46 ++++++++++++++++++++++++++--------
 xen/arch/arm/tee/ffa_private.h |  9 +++++--
 2 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 07bc5cb3a430..d15119409a25 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -94,8 +94,15 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
 
     notif_pending = test_and_clear_bool(ctx->notif.secure_pending);
     if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
+    {
         notif_pending |= test_and_clear_bool(ctx->notif.vm_pending);
 
+        spin_lock(&ctx->notif.notif_lock);
+        if ( ctx->notif.hyp_pending )
+            notif_pending = true;
+        spin_unlock(&ctx->notif.notif_lock);
+    }
+
     if ( notif_pending )
     {
         /* A pending global notification for the guest */
@@ -174,12 +181,17 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
             w6 = resp.a6;
     }
 
-    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) &&
-          flags & FFA_NOTIF_FLAG_BITMAP_HYP &&
-          test_and_clear_bool(ctx->notif.buff_full_pending) )
+    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
     {
-        ACCESS_ONCE(ctx->notif.vm_pending) = false;
-        w7 = FFA_NOTIF_RX_BUFFER_FULL;
+        spin_lock(&ctx->notif.notif_lock);
+
+        if ( (flags & FFA_NOTIF_FLAG_BITMAP_HYP) && ctx->notif.hyp_pending )
+        {
+            w7 = ctx->notif.hyp_pending;
+            ctx->notif.hyp_pending = 0;
+        }
+
+        spin_unlock(&ctx->notif.notif_lock);
     }
 
     ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, w4, w5, w6, w7);
@@ -207,12 +219,17 @@ int32_t ffa_handle_notification_set(struct cpu_user_regs *regs)
 void ffa_raise_rx_buffer_full(struct domain *d)
 {
     struct ffa_ctx *ctx = d->arch.tee;
+    uint32_t prev_bitmap;
 
     if ( !ctx )
         return;
 
-    ACCESS_ONCE(ctx->notif.buff_full_pending) = true;
-    if ( !test_and_set_bool(ctx->notif.vm_pending) )
+    spin_lock(&ctx->notif.notif_lock);
+    prev_bitmap = ctx->notif.hyp_pending;
+    ctx->notif.hyp_pending |= FFA_NOTIF_RX_BUFFER_FULL;
+    spin_unlock(&ctx->notif.notif_lock);
+
+    if ( !(prev_bitmap & FFA_NOTIF_RX_BUFFER_FULL) )
         inject_notif_pending(d);
 }
 #endif
@@ -426,12 +443,15 @@ void ffa_notif_init(void)
 
 int ffa_notif_domain_init(struct domain *d)
 {
+    struct ffa_ctx *ctx = d->arch.tee;
     int32_t res;
 
+    spin_lock_init(&ctx->notif.notif_lock);
+    ctx->notif.hyp_pending = 0;
+
     if ( fw_notif_enabled )
     {
-
-        res = ffa_notification_bitmap_create(ffa_get_vm_id(d), d->max_vcpus);
+        res = ffa_notification_bitmap_create(ctx->ffa_id, d->max_vcpus);
         if ( res )
             return -ENOMEM;
     }
@@ -441,10 +461,16 @@ int ffa_notif_domain_init(struct domain *d)
 
 void ffa_notif_domain_destroy(struct domain *d)
 {
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    spin_lock(&ctx->notif.notif_lock);
+    ctx->notif.hyp_pending = 0;
+    spin_unlock(&ctx->notif.notif_lock);
+
     /*
      * Call bitmap_destroy even if bitmap create failed as the SPMC will
      * return a DENIED error that we will ignore.
      */
     if ( fw_notif_enabled )
-        ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
+        ffa_notification_bitmap_destroy(ctx->ffa_id);
 }
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index c291f32b56ff..5693772481ed 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -340,9 +340,14 @@ struct ffa_ctx_notif {
     bool vm_pending;
 
     /*
-     * True if domain has buffer full notification pending
+     * Lock protecting the hypervisor-managed notification state.
      */
-    bool buff_full_pending;
+    spinlock_t notif_lock;
+
+    /*
+     * Bitmap of pending hypervisor notifications (for HYP bitmap queries).
+     */
+    uint32_t hyp_pending;
 };
 
 struct ffa_ctx {
-- 
2.53.0


