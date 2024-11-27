Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDEC9DAB7D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 17:10:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844949.1260501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGKca-0000ni-Ec; Wed, 27 Nov 2024 16:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844949.1260501; Wed, 27 Nov 2024 16:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGKca-0000mC-92; Wed, 27 Nov 2024 16:10:32 +0000
Received: by outflank-mailman (input) for mailman id 844949;
 Wed, 27 Nov 2024 16:10:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8BRf=SW=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1tGKae-0002q2-M2
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 16:08:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d7f30500-acd9-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 17:08:30 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0212A150C;
 Wed, 27 Nov 2024 08:09:00 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.58.181])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDF273F5A1;
 Wed, 27 Nov 2024 08:08:27 -0800 (PST)
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
X-Inumbo-ID: d7f30500-acd9-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6ImQ3ZjMwNTAwLWFjZDktMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzIzNzEwLjg1OTU1NCwic2VuZGVyIjoiYmVydHJhbmQubWFycXVpc0Bhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v3 09/10] xen/arm: ffa: Remove per VM notif_enabled
Date: Wed, 27 Nov 2024 17:07:41 +0100
Message-ID: <8e7cf913eeba955f8ed6bced1cafdf264dcb4318.1732702210.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732702210.git.bertrand.marquis@arm.com>
References: <cover.1732702210.git.bertrand.marquis@arm.com>
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
Changes in v3:
- Add a comment explaining why it is ok to call bitmap destroy even if
  bitmap create failed.
Changes in v2:
- rebase
---
 xen/arch/arm/tee/ffa.c         | 17 +++--------------
 xen/arch/arm/tee/ffa_notif.c   | 14 +++++---------
 xen/arch/arm/tee/ffa_private.h |  2 --
 3 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 8488fe6af9c0..04d2403415fe 100644
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
index 4b3e46318f4b..21b9e78f6399 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -405,7 +405,6 @@ void ffa_notif_init(void)
 
 int ffa_notif_domain_init(struct domain *d)
 {
-    struct ffa_ctx *ctx = d->arch.tee;
     int32_t res;
 
     if ( !notif_enabled )
@@ -415,18 +414,15 @@ int ffa_notif_domain_init(struct domain *d)
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
+    /*
+     * Call bitmap_destroy even if bitmap create failed as the SPMC will
+     * return a DENIED error that we will ignore.
+     */
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


