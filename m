Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DA6C8F5C0
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 16:53:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174086.1499126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeIv-0006Ic-6K; Thu, 27 Nov 2025 15:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174086.1499126; Thu, 27 Nov 2025 15:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeIv-0006DI-1s; Thu, 27 Nov 2025 15:53:09 +0000
Received: by outflank-mailman (input) for mailman id 1174086;
 Thu, 27 Nov 2025 15:53:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gQU=6D=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vOeIt-0004I5-U9
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 15:53:07 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 29aa9348-cba9-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 16:53:06 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9435176A;
 Thu, 27 Nov 2025 07:52:57 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.89.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 026353F73B;
 Thu, 27 Nov 2025 07:53:03 -0800 (PST)
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
X-Inumbo-ID: 29aa9348-cba9-11f0-980a-7dc792cee155
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 10/10] xen/arm: ffa: advertise FF-A v1.2
Date: Thu, 27 Nov 2025 16:51:41 +0100
Message-ID: <8ae9b12641301ecfafa7ddee3e60544d3fa45c40.1764254975.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1764254975.git.bertrand.marquis@arm.com>
References: <cover.1764254975.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Advertise RUN/YIELD/INTERRUPT via FFA_FEATURES now that the runtime
helpers are in place, and expose the RX/TX MAP capacity field only once
a guest has negotiated FF-A v1.2.

While there, drop the stale <asm/tee/ffa.h> include.

To comply with the wider v1.2 register ABI, zero registers x8–x17 when
responding to a v1.2 VM. The dispatcher also rejects SMCCC64 calls from
AArch32 guests.

Finally, bump Xen's FF-A version to 1.2.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c         | 25 ++++++++++++++++++++-----
 xen/arch/arm/tee/ffa_private.h | 28 +++++++++++++++++++---------
 2 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 8b2f042287fc..c8fe97856d06 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -24,9 +24,6 @@
  * o FFA_MEM_DONATE_* and FFA_MEM_LEND_* - Used when tranferring ownership
  *   or access of a memory region
  * o FFA_MSG_SEND2 and FFA_MSG_WAIT - Used for indirect messaging
- * o FFA_MSG_YIELD
- * o FFA_INTERRUPT - Used to report preemption
- * o FFA_RUN
  *
  * Limitations in the implemented FF-A interfaces:
  * o FFA_RXTX_MAP_*:
@@ -68,7 +65,6 @@
 #include <asm/event.h>
 #include <asm/regs.h>
 #include <asm/smccc.h>
-#include <asm/tee/ffa.h>
 #include <asm/tee/tee.h>
 
 #include "ffa_private.h"
@@ -262,6 +258,9 @@ static void handle_features(struct cpu_user_regs *regs)
     case FFA_MSG_SEND_DIRECT_REQ_32:
     case FFA_MSG_SEND_DIRECT_REQ_64:
     case FFA_MSG_SEND2:
+    case FFA_RUN:
+    case FFA_INTERRUPT:
+    case FFA_MSG_YIELD:
         ffa_set_regs_success(regs, 0, 0);
         break;
     case FFA_MSG_SEND_DIRECT_REQ2:
@@ -290,7 +289,16 @@ static void handle_features(struct cpu_user_regs *regs)
          * differs from FFA_PAGE_SIZE (SZ_4K).
          */
         BUILD_BUG_ON(PAGE_SIZE != FFA_PAGE_SIZE);
-        ffa_set_regs_success(regs, 0, 0);
+
+        /*
+         * From FFA v1.2, we can give the maximum number of pages we support
+         * for the RX/TX buffers.
+         */
+        if ( ctx->guest_vers < FFA_VERSION_1_2 )
+            ffa_set_regs_success(regs, 0, 0);
+        else
+            ffa_set_regs_success(regs, FFA_MAX_RXTX_PAGE_COUNT << 16, 0);
+
         break;
     case FFA_FEATURE_NOTIF_PEND_INTR:
         ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0);
@@ -323,6 +331,13 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     if ( !ctx )
         return false;
 
+    if ( !is_64bit_domain(d) && smccc_is_conv_64(fid) )
+    {
+        /* 32bit guests should only use 32bit convention calls */
+        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+        return true;
+    }
+
     /* A version must be negotiated first */
     if ( !ctx->guest_vers_negotiated )
     {
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index a9a03c7c5d71..6afca2ea07ef 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -53,7 +53,7 @@
  * that particular guest or SP.
  */
 #define FFA_MY_VERSION_MAJOR    1U
-#define FFA_MY_VERSION_MINOR    1U
+#define FFA_MY_VERSION_MINOR    2U
 #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
                                                  FFA_MY_VERSION_MINOR)
 
@@ -505,14 +505,24 @@ static inline void ffa_set_regs(struct cpu_user_regs *regs, register_t v0,
                                 register_t v4, register_t v5, register_t v6,
                                 register_t v7)
 {
-        set_user_reg(regs, 0, v0);
-        set_user_reg(regs, 1, v1);
-        set_user_reg(regs, 2, v2);
-        set_user_reg(regs, 3, v3);
-        set_user_reg(regs, 4, v4);
-        set_user_reg(regs, 5, v5);
-        set_user_reg(regs, 6, v6);
-        set_user_reg(regs, 7, v7);
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+    int i;
+
+    set_user_reg(regs, 0, v0);
+    set_user_reg(regs, 1, v1);
+    set_user_reg(regs, 2, v2);
+    set_user_reg(regs, 3, v3);
+    set_user_reg(regs, 4, v4);
+    set_user_reg(regs, 5, v5);
+    set_user_reg(regs, 6, v6);
+    set_user_reg(regs, 7, v7);
+
+    if ( ctx && ctx->guest_vers >= FFA_VERSION_1_2 && ctx->is_64bit )
+    {
+        for (i = 8; i <= 17; i++)
+            set_user_reg(regs, i, 0);
+    }
 }
 
 static inline void ffa_set_regs_error(struct cpu_user_regs *regs,
-- 
2.51.2


