Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB5397C903
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 14:20:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800675.1210708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srG8c-0006Kw-C1; Thu, 19 Sep 2024 12:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800675.1210708; Thu, 19 Sep 2024 12:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srG8c-0006FL-3L; Thu, 19 Sep 2024 12:19:58 +0000
Received: by outflank-mailman (input) for mailman id 800675;
 Thu, 19 Sep 2024 12:19:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lyjY=QR=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1srG8a-0003iL-HY
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 12:19:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7a3751b0-7681-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 14:19:54 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B8361007;
 Thu, 19 Sep 2024 05:20:23 -0700 (PDT)
Received: from C3HXLD123V.emea.arm.com (usa-sjc-mx-foss1.foss.arm.com
 [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A4CE3F64C;
 Thu, 19 Sep 2024 05:19:53 -0700 (PDT)
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
X-Inumbo-ID: 7a3751b0-7681-11ef-99a2-01e77a169b0f
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 09/10] xen/arm: ffa: Remove per VM notif_enabled
Date: Thu, 19 Sep 2024 14:19:09 +0200
Message-Id: <948e6e15cf855b4c76dab0d4a779f39edf5e7b52.1726676338.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1726676338.git.bertrand.marquis@arm.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
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
 xen/arch/arm/tee/ffa.c         | 17 +++--------------
 xen/arch/arm/tee/ffa_notif.c   | 10 +---------
 xen/arch/arm/tee/ffa_private.h |  2 --
 3 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 89c6a1cf06a1..5d7633dbb3a5 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -166,8 +166,6 @@ static void handle_version(struct cpu_user_regs *regs)
 
 static void handle_features(struct cpu_user_regs *regs)
 {
-    struct domain *d = current->domain;
-    struct ffa_ctx *ctx = d->arch.tee;
     uint32_t a1 = get_user_reg(regs, 1);
     unsigned int n;
 
@@ -215,16 +213,10 @@ static void handle_features(struct cpu_user_regs *regs)
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
@@ -233,10 +225,7 @@ static void handle_features(struct cpu_user_regs *regs)
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
index 0be246ff0ae7..5054254540ef 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -279,8 +279,6 @@ struct ffa_mem_region {
 };
 
 struct ffa_ctx_notif {
-    bool enabled;
-
     /*
      * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
      * pending global notifications.
-- 
2.39.5 (Apple Git-154)


