Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDCDCA7375
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 11:41:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178738.1502477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRTFs-0003nT-IX; Fri, 05 Dec 2025 10:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178738.1502477; Fri, 05 Dec 2025 10:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRTFs-0003lV-Fe; Fri, 05 Dec 2025 10:41:40 +0000
Received: by outflank-mailman (input) for mailman id 1178738;
 Fri, 05 Dec 2025 10:41:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d4nT=6L=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vRTCF-0005j7-1U
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 10:37:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 74d3ab7c-d1c6-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 11:37:54 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AEF6339;
 Fri,  5 Dec 2025 02:37:46 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.45.211])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D91F33F86F;
 Fri,  5 Dec 2025 02:37:52 -0800 (PST)
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
X-Inumbo-ID: 74d3ab7c-d1c6-11f0-9d1b-b5c5bf9af7f9
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v1 12/12] xen/arm: ffa: advertise FF-A v1.2
Date: Fri,  5 Dec 2025 11:36:45 +0100
Message-ID: <8412f616340976de6aa5f7da585cdc3dfd919732.1764930353.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1764930353.git.bertrand.marquis@arm.com>
References: <cover.1764930353.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Expose the RX/TX MAP capacity field only once a guest has
negotiated FF-A v1.2.

While there, drop the stale <asm/tee/ffa.h> include.

To comply with the wider v1.2 register ABI, zero registers x8–x17 when
responding to a v1.2 VM. The dispatcher also rejects SMCCC64 calls from
AArch32 guests.

Finally, bump Xen's FF-A version to 1.2.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v1:
- Remove advertising of YIELD/INTERRUPT/RUN which has now moved to patch
  adding FFA_RUN support and adapt commit message
- Use ACCESS_ONCE to read guest_vers
- Use is_64bit_domain instead of ctx->is_64bit
---
 xen/arch/arm/tee/ffa.c         | 19 +++++++++++++++++--
 xen/arch/arm/tee/ffa_private.h | 29 ++++++++++++++++++++---------
 2 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 2c6443a7f6a4..ed18e76080d0 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -65,7 +65,6 @@
 #include <asm/event.h>
 #include <asm/regs.h>
 #include <asm/smccc.h>
-#include <asm/tee/ffa.h>
 #include <asm/tee/tee.h>
 
 #include "ffa_private.h"
@@ -296,7 +295,16 @@ static void handle_features(struct cpu_user_regs *regs)
          * differs from FFA_PAGE_SIZE (SZ_4K).
          */
         BUILD_BUG_ON(PAGE_SIZE != FFA_PAGE_SIZE);
-        ffa_set_regs_success(regs, 0, 0);
+
+        /*
+         * From FFA v1.2, we can give the maximum number of pages we support
+         * for the RX/TX buffers.
+         */
+        if ( ACCESS_ONCE(ctx->guest_vers) < FFA_VERSION_1_2 )
+            ffa_set_regs_success(regs, 0, 0);
+        else
+            ffa_set_regs_success(regs, FFA_MAX_RXTX_PAGE_COUNT << 16, 0);
+
         break;
     case FFA_FEATURE_NOTIF_PEND_INTR:
         ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0);
@@ -329,6 +337,13 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
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
     if ( !ACCESS_ONCE(ctx->guest_vers) )
     {
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 030e6724743c..1b5aebd6ef6b 100644
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
 
@@ -518,14 +518,25 @@ static inline void ffa_set_regs(struct cpu_user_regs *regs, register_t v0,
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
+    if ( ctx && ACCESS_ONCE(ctx->guest_vers) >= FFA_VERSION_1_2 &&
+         is_64bit_domain(d) )
+    {
+        for (i = 8; i <= 17; i++)
+            set_user_reg(regs, i, 0);
+    }
 }
 
 static inline void ffa_set_regs_error(struct cpu_user_regs *regs,
-- 
2.51.2


