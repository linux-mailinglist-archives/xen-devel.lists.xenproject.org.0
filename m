Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44C397C8FF
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 14:20:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800676.1210718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srG8d-0006dT-Kd; Thu, 19 Sep 2024 12:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800676.1210718; Thu, 19 Sep 2024 12:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srG8d-0006Ze-Cv; Thu, 19 Sep 2024 12:19:59 +0000
Received: by outflank-mailman (input) for mailman id 800676;
 Thu, 19 Sep 2024 12:19:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lyjY=QR=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1srG8b-0003iL-Mn
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 12:19:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7adeea31-7681-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 14:19:55 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2FE213D5;
 Thu, 19 Sep 2024 05:20:24 -0700 (PDT)
Received: from C3HXLD123V.emea.arm.com (usa-sjc-mx-foss1.foss.arm.com
 [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 712F83F64C;
 Thu, 19 Sep 2024 05:19:54 -0700 (PDT)
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
X-Inumbo-ID: 7adeea31-7681-11ef-99a2-01e77a169b0f
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 10/10] xen/arm: ffa: Add indirect message support
Date: Thu, 19 Sep 2024 14:19:10 +0200
Message-Id: <7b6fabf888047c7a2def42b929fb2c60c83ac452.1726676338.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1726676338.git.bertrand.marquis@arm.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for FFA_MSG_SEND2 to send indirect messages from a VM to a
secure partition.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c         |  5 ++++
 xen/arch/arm/tee/ffa_msg.c     | 49 ++++++++++++++++++++++++++++++++++
 xen/arch/arm/tee/ffa_private.h |  1 +
 3 files changed, 55 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 5d7633dbb3a5..abb05e09f6f4 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -94,6 +94,7 @@ static const uint32_t ffa_fw_feat_needed[] = {
     FFA_MEM_RECLAIM,
     FFA_MSG_SEND_DIRECT_REQ_32,
     FFA_MSG_SEND_DIRECT_REQ_64,
+    FFA_MSG_SEND2,
 };
 
 /*
@@ -192,6 +193,7 @@ static void handle_features(struct cpu_user_regs *regs)
     case FFA_PARTITION_INFO_GET:
     case FFA_MSG_SEND_DIRECT_REQ_32:
     case FFA_MSG_SEND_DIRECT_REQ_64:
+    case FFA_MSG_SEND2:
         ffa_set_regs_success(regs, 0, 0);
         break;
     case FFA_MEM_SHARE_64:
@@ -272,6 +274,9 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
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
index ae263e54890e..335f246ba657 100644
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
@@ -78,3 +87,43 @@ out:
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
+    ret = ffa_simple_call(FFA_MSG_SEND2, ((uint32_t)src_id) << 16, 0, 0, 0);
+
+out_unlock_tx:
+    spin_unlock(&src_ctx->tx_lock);
+    return ret;
+}
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 5054254540ef..1bc7b33ec2c7 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -357,6 +357,7 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs);
 int ffa_handle_notification_set(struct cpu_user_regs *regs);
 
 void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid);
+int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs);
 
 static inline uint16_t ffa_get_vm_id(const struct domain *d)
 {
-- 
2.39.5 (Apple Git-154)


