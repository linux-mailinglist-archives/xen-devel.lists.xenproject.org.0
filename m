Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF6F97C8FD
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 14:20:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800674.1210698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srG8a-00062L-TJ; Thu, 19 Sep 2024 12:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800674.1210698; Thu, 19 Sep 2024 12:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srG8a-0005w8-Nn; Thu, 19 Sep 2024 12:19:56 +0000
Received: by outflank-mailman (input) for mailman id 800674;
 Thu, 19 Sep 2024 12:19:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lyjY=QR=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1srG8Z-0003iL-FD
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 12:19:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 798bbb3a-7681-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 14:19:53 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84BD71595;
 Thu, 19 Sep 2024 05:20:22 -0700 (PDT)
Received: from C3HXLD123V.emea.arm.com (usa-sjc-mx-foss1.foss.arm.com
 [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 416783F64C;
 Thu, 19 Sep 2024 05:19:52 -0700 (PDT)
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
X-Inumbo-ID: 798bbb3a-7681-11ef-99a2-01e77a169b0f
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 08/10] xen/arm: ffa: move message function into ffa_msg.c
Date: Thu, 19 Sep 2024 14:19:08 +0200
Message-Id: <8b4f75f82d25081968b789aaba81eb897c00c176.1726676338.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1726676338.git.bertrand.marquis@arm.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the direct message handling function in its own source file and
rename it to have a ffa_ prefix.
This is a preparation to add support for indirect messages which will
go into this newly created source file.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/Makefile      |  1 +
 xen/arch/arm/tee/ffa.c         | 69 +----------------------------
 xen/arch/arm/tee/ffa_msg.c     | 80 ++++++++++++++++++++++++++++++++++
 xen/arch/arm/tee/ffa_private.h |  2 +
 4 files changed, 84 insertions(+), 68 deletions(-)
 create mode 100644 xen/arch/arm/tee/ffa_msg.c

diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
index 7c0f46f7f446..0848c833fec3 100644
--- a/xen/arch/arm/tee/Makefile
+++ b/xen/arch/arm/tee/Makefile
@@ -3,5 +3,6 @@ obj-$(CONFIG_FFA) += ffa_shm.o
 obj-$(CONFIG_FFA) += ffa_partinfo.o
 obj-$(CONFIG_FFA) += ffa_rxtx.o
 obj-$(CONFIG_FFA) += ffa_notif.o
+obj-$(CONFIG_FFA) += ffa_msg.o
 obj-y += tee.o
 obj-$(CONFIG_OPTEE) += optee.o
diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 4a769e20007b..89c6a1cf06a1 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -164,73 +164,6 @@ static void handle_version(struct cpu_user_regs *regs)
         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
 }
 
-static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
-{
-    struct arm_smccc_1_2_regs arg = { .a0 = fid, };
-    struct arm_smccc_1_2_regs resp = { };
-    struct domain *d = current->domain;
-    uint32_t src_dst;
-    uint64_t mask;
-
-    if ( smccc_is_conv_64(fid) )
-        mask = GENMASK_ULL(63, 0);
-    else
-        mask = GENMASK_ULL(31, 0);
-
-    if ( !ffa_fw_supports_fid(fid) )
-    {
-        resp.a0 = FFA_ERROR;
-        resp.a2 = FFA_RET_NOT_SUPPORTED;
-        goto out;
-    }
-
-    src_dst = get_user_reg(regs, 1);
-    if ( (src_dst >> 16) != ffa_get_vm_id(d) )
-    {
-        resp.a0 = FFA_ERROR;
-        resp.a2 = FFA_RET_INVALID_PARAMETERS;
-        goto out;
-    }
-
-    /* we do not support direct messages to VMs */
-    if ( !FFA_ID_IS_SECURE(src_dst & GENMASK(15,0)) )
-    {
-        resp.a0 = FFA_ERROR;
-        resp.a2 = FFA_RET_NOT_SUPPORTED;
-        goto out;
-    }
-
-    arg.a1 = src_dst;
-    arg.a2 = get_user_reg(regs, 2) & mask;
-    arg.a3 = get_user_reg(regs, 3) & mask;
-    arg.a4 = get_user_reg(regs, 4) & mask;
-    arg.a5 = get_user_reg(regs, 5) & mask;
-    arg.a6 = get_user_reg(regs, 6) & mask;
-    arg.a7 = get_user_reg(regs, 7) & mask;
-
-    arm_smccc_1_2_smc(&arg, &resp);
-    switch ( resp.a0 )
-    {
-    case FFA_ERROR:
-    case FFA_SUCCESS_32:
-    case FFA_SUCCESS_64:
-    case FFA_MSG_SEND_DIRECT_RESP_32:
-    case FFA_MSG_SEND_DIRECT_RESP_64:
-        break;
-    default:
-        /* Bad fid, report back to the caller. */
-        memset(&resp, 0, sizeof(resp));
-        resp.a0 = FFA_ERROR;
-        resp.a1 = src_dst;
-        resp.a2 = FFA_RET_ABORTED;
-    }
-
-out:
-    ffa_set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 & mask,
-                 resp.a4 & mask, resp.a5 & mask, resp.a6 & mask,
-                 resp.a7 & mask);
-}
-
 static void handle_features(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
@@ -348,7 +281,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
         break;
     case FFA_MSG_SEND_DIRECT_REQ_32:
     case FFA_MSG_SEND_DIRECT_REQ_64:
-        handle_msg_send_direct_req(regs, fid);
+        ffa_handle_msg_send_direct_req(regs, fid);
         return true;
     case FFA_MEM_SHARE_32:
     case FFA_MEM_SHARE_64:
diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
new file mode 100644
index 000000000000..ae263e54890e
--- /dev/null
+++ b/xen/arch/arm/tee/ffa_msg.c
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024  Linaro Limited
+ */
+
+#include <xen/const.h>
+#include <xen/sizes.h>
+#include <xen/types.h>
+
+#include <asm/smccc.h>
+#include <asm/regs.h>
+
+#include "ffa_private.h"
+
+void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
+{
+    struct arm_smccc_1_2_regs arg = { .a0 = fid, };
+    struct arm_smccc_1_2_regs resp = { };
+    struct domain *d = current->domain;
+    uint32_t src_dst;
+    uint64_t mask;
+
+    if ( smccc_is_conv_64(fid) )
+        mask = GENMASK_ULL(63, 0);
+    else
+        mask = GENMASK_ULL(31, 0);
+
+    if ( !ffa_fw_supports_fid(fid) )
+    {
+        resp.a0 = FFA_ERROR;
+        resp.a2 = FFA_RET_NOT_SUPPORTED;
+        goto out;
+    }
+
+    src_dst = get_user_reg(regs, 1);
+    if ( (src_dst >> 16) != ffa_get_vm_id(d) )
+    {
+        resp.a0 = FFA_ERROR;
+        resp.a2 = FFA_RET_INVALID_PARAMETERS;
+        goto out;
+    }
+
+    /* we do not support direct messages to VMs */
+    if ( !FFA_ID_IS_SECURE(src_dst & GENMASK(15,0)) )
+    {
+        resp.a0 = FFA_ERROR;
+        resp.a2 = FFA_RET_NOT_SUPPORTED;
+        goto out;
+    }
+
+    arg.a1 = src_dst;
+    arg.a2 = get_user_reg(regs, 2) & mask;
+    arg.a3 = get_user_reg(regs, 3) & mask;
+    arg.a4 = get_user_reg(regs, 4) & mask;
+    arg.a5 = get_user_reg(regs, 5) & mask;
+    arg.a6 = get_user_reg(regs, 6) & mask;
+    arg.a7 = get_user_reg(regs, 7) & mask;
+
+    arm_smccc_1_2_smc(&arg, &resp);
+    switch ( resp.a0 )
+    {
+    case FFA_ERROR:
+    case FFA_SUCCESS_32:
+    case FFA_SUCCESS_64:
+    case FFA_MSG_SEND_DIRECT_RESP_32:
+    case FFA_MSG_SEND_DIRECT_RESP_64:
+        break;
+    default:
+        /* Bad fid, report back to the caller. */
+        memset(&resp, 0, sizeof(resp));
+        resp.a0 = FFA_ERROR;
+        resp.a1 = src_dst;
+        resp.a2 = FFA_RET_ABORTED;
+    }
+
+out:
+    ffa_set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 & mask,
+                 resp.a4 & mask, resp.a5 & mask, resp.a6 & mask,
+                 resp.a7 & mask);
+}
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 84b0f866a71e..0be246ff0ae7 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -358,6 +358,8 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs);
 void ffa_handle_notification_get(struct cpu_user_regs *regs);
 int ffa_handle_notification_set(struct cpu_user_regs *regs);
 
+void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid);
+
 static inline uint16_t ffa_get_vm_id(const struct domain *d)
 {
     /* +1 since 0 is reserved for the hypervisor in FF-A */
-- 
2.39.5 (Apple Git-154)


