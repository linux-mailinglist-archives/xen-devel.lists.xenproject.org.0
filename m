Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3279DAB67
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 17:08:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844909.1260491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGKae-0005qO-2K; Wed, 27 Nov 2024 16:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844909.1260491; Wed, 27 Nov 2024 16:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGKad-0005lv-Te; Wed, 27 Nov 2024 16:08:31 +0000
Received: by outflank-mailman (input) for mailman id 844909;
 Wed, 27 Nov 2024 16:08:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8BRf=SW=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1tGKac-0002q2-1M
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 16:08:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d6619fab-acd9-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 17:08:27 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90B2E1477;
 Wed, 27 Nov 2024 08:08:57 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.58.181])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A39BD3F5A1;
 Wed, 27 Nov 2024 08:08:25 -0800 (PST)
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
X-Inumbo-ID: d6619fab-acd9-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6ImQ2NjE5ZmFiLWFjZDktMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzIzNzA4LjA1NjM4Nywic2VuZGVyIjoiYmVydHJhbmQubWFycXVpc0Bhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v3 08/10] xen/arm: ffa: move message function into ffa_msg.c
Date: Wed, 27 Nov 2024 17:07:40 +0100
Message-ID: <c189c1ba68832567617eafde30da1471df4e7e01.1732702210.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732702210.git.bertrand.marquis@arm.com>
References: <cover.1732702210.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the direct message handling function in its own source file and
rename it to have a ffa_ prefix.
This is a preparation to add support for indirect messages which will
go into this newly created source file.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
---
Changes in v3:
- add Jens R-b
Changes in v2:
- rebase
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
index bc2722d53fd7..8488fe6af9c0 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -167,73 +167,6 @@ static void handle_version(struct cpu_user_regs *regs)
     ffa_set_regs(regs, FFA_MY_VERSION, 0, 0, 0, 0, 0, 0, 0);
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
@@ -351,7 +284,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
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
index 9adfe687c3c9..02162e0ee4c7 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -360,6 +360,8 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs);
 void ffa_handle_notification_get(struct cpu_user_regs *regs);
 int ffa_handle_notification_set(struct cpu_user_regs *regs);
 
+void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid);
+
 static inline uint16_t ffa_get_vm_id(const struct domain *d)
 {
     /* +1 since 0 is reserved for the hypervisor in FF-A */
-- 
2.47.0


