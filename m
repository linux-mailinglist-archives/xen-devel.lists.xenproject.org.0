Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B90699DAB7E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 17:10:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844973.1260511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGKcd-00018p-OP; Wed, 27 Nov 2024 16:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844973.1260511; Wed, 27 Nov 2024 16:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGKcd-00015U-LL; Wed, 27 Nov 2024 16:10:35 +0000
Received: by outflank-mailman (input) for mailman id 844973;
 Wed, 27 Nov 2024 16:10:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8BRf=SW=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1tGKag-0002q2-Hi
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 16:08:34 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d904da3d-acd9-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 17:08:32 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C15561477;
 Wed, 27 Nov 2024 08:09:01 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.58.181])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C8BD3F5A1;
 Wed, 27 Nov 2024 08:08:30 -0800 (PST)
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
X-Inumbo-ID: d904da3d-acd9-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6ImQ5MDRkYTNkLWFjZDktMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzIzNzEyLjY3Mjg4NSwic2VuZGVyIjoiYmVydHJhbmQubWFycXVpc0Bhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v3 10/10] xen/arm: ffa: Add indirect message support
Date: Wed, 27 Nov 2024 17:07:42 +0100
Message-ID: <7b3dc2c98d01478d5ab03780932844ea980b7ae0.1732702210.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732702210.git.bertrand.marquis@arm.com>
References: <cover.1732702210.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for FFA_MSG_SEND2 to send indirect messages from a VM to a
secure partition.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v3:
- in ffa_handle_msg_send2 use ffa_get_vm_id instead of a local variable
  to make sure that we use the right VM ID as source without having a
  potential solution for the VM to give a wrong identity.
Changes in v2:
- rebase
---
 xen/arch/arm/tee/ffa.c         |  5 ++++
 xen/arch/arm/tee/ffa_msg.c     | 50 ++++++++++++++++++++++++++++++++++
 xen/arch/arm/tee/ffa_private.h |  1 +
 3 files changed, 56 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 04d2403415fe..87775ed88ffd 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -101,6 +101,7 @@ static const struct ffa_fw_abi ffa_fw_abi_needed[] = {
     FW_ABI(FFA_MEM_RECLAIM),
     FW_ABI(FFA_MSG_SEND_DIRECT_REQ_32),
     FW_ABI(FFA_MSG_SEND_DIRECT_REQ_64),
+    FW_ABI(FFA_MSG_SEND2),
 };
 
 /*
@@ -195,6 +196,7 @@ static void handle_features(struct cpu_user_regs *regs)
     case FFA_PARTITION_INFO_GET:
     case FFA_MSG_SEND_DIRECT_REQ_32:
     case FFA_MSG_SEND_DIRECT_REQ_64:
+    case FFA_MSG_SEND2:
         ffa_set_regs_success(regs, 0, 0);
         break;
     case FFA_MEM_SHARE_64:
@@ -275,6 +277,9 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     case FFA_MSG_SEND_DIRECT_REQ_64:
         ffa_handle_msg_send_direct_req(regs, fid);
         return true;
+    case FFA_MSG_SEND2:
+        e = ffa_handle_msg_send2(regs);
+        break;
     case FFA_MEM_SHARE_32:
     case FFA_MEM_SHARE_64:
         ffa_handle_mem_share(regs);
diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
index ae263e54890e..ee594e737fc7 100644
--- a/xen/arch/arm/tee/ffa_msg.c
+++ b/xen/arch/arm/tee/ffa_msg.c
@@ -12,6 +12,15 @@
 
 #include "ffa_private.h"
 
+/* Encoding of partition message in RX/TX buffer */
+struct ffa_part_msg_rxtx {
+    uint32_t flags;
+    uint32_t reserved;
+    uint32_t msg_offset;
+    uint32_t send_recv_id;
+    uint32_t msg_size;
+};
+
 void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
 {
     struct arm_smccc_1_2_regs arg = { .a0 = fid, };
@@ -78,3 +87,44 @@ out:
                  resp.a4 & mask, resp.a5 & mask, resp.a6 & mask,
                  resp.a7 & mask);
 }
+
+int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
+{
+    struct domain *src_d = current->domain;
+    struct ffa_ctx *src_ctx = src_d->arch.tee;
+    const struct ffa_part_msg_rxtx *src_msg;
+    uint16_t dst_id, src_id;
+    int32_t ret;
+
+    if ( !ffa_fw_supports_fid(FFA_MSG_SEND2) )
+        return FFA_RET_NOT_SUPPORTED;
+
+    if ( !spin_trylock(&src_ctx->tx_lock) )
+        return FFA_RET_BUSY;
+
+    src_msg = src_ctx->tx;
+    src_id = src_msg->send_recv_id >> 16;
+    dst_id = src_msg->send_recv_id & GENMASK(15,0);
+
+    if ( src_id != ffa_get_vm_id(src_d) || !FFA_ID_IS_SECURE(dst_id) )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out_unlock_tx;
+    }
+
+    /* check source message fits in buffer */
+    if ( src_ctx->page_count * FFA_PAGE_SIZE <
+         src_msg->msg_offset + src_msg->msg_size ||
+         src_msg->msg_offset < sizeof(struct ffa_part_msg_rxtx) )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out_unlock_tx;
+    }
+
+    ret = ffa_simple_call(FFA_MSG_SEND2,
+                          ((uint32_t)ffa_get_vm_id(src_d)) << 16, 0, 0, 0);
+
+out_unlock_tx:
+    spin_unlock(&src_ctx->tx_lock);
+    return ret;
+}
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 973ee55be09b..d441c0ca5598 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -359,6 +359,7 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs);
 int ffa_handle_notification_set(struct cpu_user_regs *regs);
 
 void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid);
+int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs);
 
 static inline uint16_t ffa_get_vm_id(const struct domain *d)
 {
-- 
2.47.0


