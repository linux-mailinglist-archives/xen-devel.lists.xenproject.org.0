Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110D0CBE632
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 15:50:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187144.1508647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9tv-0006wR-Ig; Mon, 15 Dec 2025 14:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187144.1508647; Mon, 15 Dec 2025 14:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9tv-0006r1-CG; Mon, 15 Dec 2025 14:50:15 +0000
Received: by outflank-mailman (input) for mailman id 1187144;
 Mon, 15 Dec 2025 14:50:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pAKg=6V=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vV9tt-00038W-EG
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 14:50:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5a6ca86e-d9c5-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 15:50:10 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B5EFFEC;
 Mon, 15 Dec 2025 06:50:02 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.46.206])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F4BD3F694;
 Mon, 15 Dec 2025 06:50:08 -0800 (PST)
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
X-Inumbo-ID: 5a6ca86e-d9c5-11f0-9cce-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 09/12] xen/arm: ffa: Add FFA_RUN support
Date: Mon, 15 Dec 2025 15:49:26 +0100
Message-ID: <74e819101a77d27da29eed023cd71505e55bd9a4.1765807707.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1765807707.git.bertrand.marquis@arm.com>
References: <cover.1765807707.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add FFA_RUN support and remove mention that YIELD and INTERRUPT are not
supported in the comment as we will now return them.

Make FFA_FEATURE answer supported for RUN, YIELD and INTERRUPT.

Share the SMCCC plumbing used by SEND_DIRECT and RUN via a common
ffa_finish_direct_req_run() helper so canonical success and error cases
are handled in one place.

The dispatcher now routes FFA_RUN through ffa_handle_run(), and direct
requests bail out early if a guest targets itself or a non-secure
endpoint. This simplifies the direct path while adding support for
INTERRUPT or YIELD answers from secure world.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
---
Changes in v2:
- add Jens R-b
Changes in v1:
- Rework commit message to clearly mention that we add FFA_RUN support
- Remove mentions of FFA_MSG_YIELD/INTERRUPT/RUN not being supported
- Report YIELD, INTERRUPT an RUN as supported in ffa_features handling
---
 xen/arch/arm/tee/ffa.c         |   9 ++-
 xen/arch/arm/tee/ffa_msg.c     | 111 ++++++++++++++++++++++++---------
 xen/arch/arm/tee/ffa_private.h |   1 +
 3 files changed, 87 insertions(+), 34 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 2c09d10ae6a1..0f07efe5a7b3 100644
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
@@ -266,6 +263,9 @@ static void handle_features(struct cpu_user_regs *regs)
     case FFA_MSG_SEND_DIRECT_REQ_32:
     case FFA_MSG_SEND_DIRECT_REQ_64:
     case FFA_MSG_SEND2:
+    case FFA_RUN:
+    case FFA_INTERRUPT:
+    case FFA_MSG_YIELD:
         ffa_set_regs_success(regs, 0, 0);
         break;
     case FFA_MEM_SHARE_64:
@@ -353,6 +353,9 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
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
index d60eed6d8811..5a4cb1bb8295 100644
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
@@ -217,3 +233,36 @@ out:
     ffa_tx_release(src_ctx);
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
index fb5212bd2820..1fbd3fc3a696 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -475,6 +475,7 @@ static inline void ffa_raise_rx_buffer_full(struct domain *d)
 
 void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid);
 int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs);
+void ffa_handle_run(struct cpu_user_regs *regs, uint32_t fid);
 
 #ifdef CONFIG_FFA_VM_TO_VM
 static inline uint16_t get_ffa_vm_count(void)
-- 
2.51.2


