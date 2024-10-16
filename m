Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2BD9A0453
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 10:32:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819610.1233073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0zSN-0002na-UF; Wed, 16 Oct 2024 08:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819610.1233073; Wed, 16 Oct 2024 08:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0zSN-0002ib-Pa; Wed, 16 Oct 2024 08:32:35 +0000
Received: by outflank-mailman (input) for mailman id 819610;
 Wed, 16 Oct 2024 08:32:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0z3=RM=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1t0zSM-0000Nz-9n
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 08:32:34 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 30a74f6c-8b99-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 10:32:33 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6B5BFEC;
 Wed, 16 Oct 2024 01:33:02 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.21.81])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD68E3F71E;
 Wed, 16 Oct 2024 01:32:31 -0700 (PDT)
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
X-Inumbo-ID: 30a74f6c-8b99-11ef-a0be-8be0dac302b0
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 09/10] xen/arm: ffa: Remove per VM notif_enabled
Date: Wed, 16 Oct 2024 10:31:29 +0200
Message-ID: <b23ad93b876267fb48a5a398e394e60fdf52d33d.1729066788.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729066788.git.bertrand.marquis@arm.com>
References: <cover.1729066788.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the per VM flag to store if notifications are enabled or not as
the only case where they are not, if notifications are enabled globally,
will make the VM creation fail.
Also use the opportunity to always give the notifications interrupts IDs
to VM. If the firmware does not support notifications, there won't be
any generated and setting one will give back a NOT_SUPPORTED.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v2:
- rebase
---
 xen/arch/arm/tee/ffa.c         | 17 +++--------------
 xen/arch/arm/tee/ffa_notif.c   | 10 +---------
 xen/arch/arm/tee/ffa_private.h |  2 --
 3 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 72826b49d2aa..3a9525aa4598 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -169,8 +169,6 @@ static void handle_version(struct cpu_user_regs *regs)
 
 static void handle_features(struct cpu_user_regs *regs)
 {
-    struct domain *d = current->domain;
-    struct ffa_ctx *ctx = d->arch.tee;
     uint32_t a1 = get_user_reg(regs, 1);
     unsigned int n;
 
@@ -218,16 +216,10 @@ static void handle_features(struct cpu_user_regs *regs)
         ffa_set_regs_success(regs, 0, 0);
         break;
     case FFA_FEATURE_NOTIF_PEND_INTR:
-        if ( ctx->notif.enabled )
-            ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0);
-        else
-            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+        ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0);
         break;
     case FFA_FEATURE_SCHEDULE_RECV_INTR:
-        if ( ctx->notif.enabled )
-            ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_ID, 0);
-        else
-            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+        ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_ID, 0);
         break;
 
     case FFA_NOTIFICATION_BIND:
@@ -236,10 +228,7 @@ static void handle_features(struct cpu_user_regs *regs)
     case FFA_NOTIFICATION_SET:
     case FFA_NOTIFICATION_INFO_GET_32:
     case FFA_NOTIFICATION_INFO_GET_64:
-        if ( ctx->notif.enabled )
-            ffa_set_regs_success(regs, 0, 0);
-        else
-            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+        ffa_set_regs_success(regs, 0, 0);
         break;
     default:
         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 4b3e46318f4b..3c6418e62e2b 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -405,7 +405,6 @@ void ffa_notif_init(void)
 
 int ffa_notif_domain_init(struct domain *d)
 {
-    struct ffa_ctx *ctx = d->arch.tee;
     int32_t res;
 
     if ( !notif_enabled )
@@ -415,18 +414,11 @@ int ffa_notif_domain_init(struct domain *d)
     if ( res )
         return -ENOMEM;
 
-    ctx->notif.enabled = true;
-
     return 0;
 }
 
 void ffa_notif_domain_destroy(struct domain *d)
 {
-    struct ffa_ctx *ctx = d->arch.tee;
-
-    if ( ctx->notif.enabled )
-    {
+    if ( notif_enabled )
         ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
-        ctx->notif.enabled = false;
-    }
 }
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 02162e0ee4c7..973ee55be09b 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -281,8 +281,6 @@ struct ffa_mem_region {
 };
 
 struct ffa_ctx_notif {
-    bool enabled;
-
     /*
      * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
      * pending global notifications.
-- 
2.47.0


