Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0723C8F5BD
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 16:53:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174084.1499115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeIp-0005gK-Rv; Thu, 27 Nov 2025 15:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174084.1499115; Thu, 27 Nov 2025 15:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeIp-0005ct-Mu; Thu, 27 Nov 2025 15:53:03 +0000
Received: by outflank-mailman (input) for mailman id 1174084;
 Thu, 27 Nov 2025 15:53:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gQU=6D=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vOeIn-0003dB-L0
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 15:53:01 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 26a60dab-cba9-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 16:53:01 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF745176C;
 Thu, 27 Nov 2025 07:52:52 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.89.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28A2C3F73B;
 Thu, 27 Nov 2025 07:52:58 -0800 (PST)
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
X-Inumbo-ID: 26a60dab-cba9-11f0-9d18-b5c5bf9af7f9
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 07/10] xen/arm: ffa: refactor direct requests via RUN helper
Date: Thu, 27 Nov 2025 16:51:38 +0100
Message-ID: <b13dfa489f41d5b72a25f40d6e45d38ad1b93051.1764254975.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1764254975.git.bertrand.marquis@arm.com>
References: <cover.1764254975.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Share the SMCCC plumbing used by SEND_DIRECT and RUN via a common
ffa_finish_direct_req_run() helper so canonical success and error cases
are handled in one place.

The dispatcher now routes FFA_RUN through ffa_handle_run(), and direct
requests bail out early if a guest targets itself or a non-secure
endpoint. This simplifies the direct path and prepares the mediator for
the wider v1.2 register ABI.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c         |   3 +
 xen/arch/arm/tee/ffa_msg.c     | 111 ++++++++++++++++++++++++---------
 xen/arch/arm/tee/ffa_private.h |   1 +
 3 files changed, 84 insertions(+), 31 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 7392bb6c3db9..92cb6ad7ec97 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -347,6 +347,9 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     case FFA_MSG_SEND_DIRECT_REQ_64:
         ffa_handle_msg_send_direct_req(regs, fid);
         return true;
+    case FFA_RUN:
+        ffa_handle_run(regs, fid);
+        return true;
     case FFA_MSG_SEND2:
         e = ffa_handle_msg_send2(regs);
         break;
diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
index dec429cbf160..8bb4bd93f724 100644
--- a/xen/arch/arm/tee/ffa_msg.c
+++ b/xen/arch/arm/tee/ffa_msg.c
@@ -21,42 +21,74 @@ struct ffa_part_msg_rxtx {
     uint32_t msg_size;
 };
 
-void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
+static void ffa_finish_direct_req_run(struct cpu_user_regs *regs,
+                                      struct arm_smccc_1_2_regs *req)
 {
-    struct arm_smccc_1_2_regs arg = { .a0 = fid, };
     struct arm_smccc_1_2_regs resp = { };
-    struct domain *d = current->domain;
-    uint32_t src_dst;
     uint64_t mask;
 
-    if ( smccc_is_conv_64(fid) )
+    arm_smccc_1_2_smc(req, &resp);
+
+    switch ( resp.a0 )
+    {
+    case FFA_ERROR:
+    case FFA_SUCCESS_32:
+    case FFA_SUCCESS_64:
+    case FFA_MSG_SEND_DIRECT_RESP_32:
+    case FFA_MSG_SEND_DIRECT_RESP_64:
+    case FFA_MSG_YIELD:
+    case FFA_INTERRUPT:
+        break;
+    default:
+        /* Bad fid, report back to the caller. */
+        ffa_set_regs_error(regs, FFA_RET_ABORTED);
+        return;
+    }
+
+    if ( smccc_is_conv_64(resp.a0) )
         mask = GENMASK_ULL(63, 0);
     else
         mask = GENMASK_ULL(31, 0);
 
+    ffa_set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 & mask,
+                 resp.a4 & mask, resp.a5 & mask, resp.a6 & mask,
+                 resp.a7 & mask);
+}
+
+void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
+{
+    struct arm_smccc_1_2_regs arg = { .a0 = fid, };
+    struct domain *d = current->domain;
+    uint32_t src_dst;
+    uint64_t mask;
+    int32_t ret;
+
     if ( !ffa_fw_supports_fid(fid) )
     {
-        resp.a0 = FFA_ERROR;
-        resp.a2 = FFA_RET_NOT_SUPPORTED;
+        ret = FFA_RET_NOT_SUPPORTED;
         goto out;
     }
 
     src_dst = get_user_reg(regs, 1);
-    if ( (src_dst >> 16) != ffa_get_vm_id(d) )
+    if ( (src_dst >> 16) != ffa_get_vm_id(d) ||
+         (src_dst & GENMASK(15,0)) == ffa_get_vm_id(d) )
     {
-        resp.a0 = FFA_ERROR;
-        resp.a2 = FFA_RET_INVALID_PARAMETERS;
+        ret = FFA_RET_INVALID_PARAMETERS;
         goto out;
     }
 
     /* we do not support direct messages to VMs */
     if ( !FFA_ID_IS_SECURE(src_dst & GENMASK(15,0)) )
     {
-        resp.a0 = FFA_ERROR;
-        resp.a2 = FFA_RET_NOT_SUPPORTED;
+        ret = FFA_RET_NOT_SUPPORTED;
         goto out;
     }
 
+    if ( smccc_is_conv_64(fid) )
+        mask = GENMASK_ULL(63, 0);
+    else
+        mask = GENMASK_ULL(31, 0);
+
     arg.a1 = src_dst;
     arg.a2 = get_user_reg(regs, 2) & mask;
     arg.a3 = get_user_reg(regs, 3) & mask;
@@ -65,27 +97,11 @@ void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
     arg.a6 = get_user_reg(regs, 6) & mask;
     arg.a7 = get_user_reg(regs, 7) & mask;
 
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
+    ffa_finish_direct_req_run(regs, &arg);
+    return;
 
 out:
-    ffa_set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 & mask,
-                 resp.a4 & mask, resp.a5 & mask, resp.a6 & mask,
-                 resp.a7 & mask);
+    ffa_set_regs_error(regs, ret);
 }
 
 static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
@@ -215,3 +231,36 @@ out:
     spin_unlock(&src_ctx->tx_lock);
     return ret;
 }
+
+void ffa_handle_run(struct cpu_user_regs *regs, uint32_t fid)
+{
+    struct arm_smccc_1_2_regs arg = { .a0 = fid, };
+    uint32_t dst = get_user_reg(regs, 1);
+    int32_t ret;
+
+    if ( !ffa_fw_supports_fid(fid) )
+    {
+        ret = FFA_RET_NOT_SUPPORTED;
+        goto out;
+    }
+
+    /*
+     * We do not support FFA_RUN to VMs.
+     * Destination endpoint ID is in bits [31:16], bits[15:0] contain the
+     * vCPU ID.
+     */
+    if ( !FFA_ID_IS_SECURE(dst >> 16) )
+    {
+        ret = FFA_RET_NOT_SUPPORTED;
+        goto out;
+    }
+
+    arg.a1 = dst;
+
+    ffa_finish_direct_req_run(regs, &arg);
+
+    return;
+
+out:
+    ffa_set_regs_error(regs, ret);
+}
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index c1dac09c75ca..a9a03c7c5d71 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -461,6 +461,7 @@ static inline void ffa_raise_rx_buffer_full(struct domain *d)
 
 void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid);
 int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs);
+void ffa_handle_run(struct cpu_user_regs *regs, uint32_t fid);
 
 #ifdef CONFIG_FFA_VM_TO_VM
 static inline uint16_t get_ffa_vm_count(void)
-- 
2.51.2


