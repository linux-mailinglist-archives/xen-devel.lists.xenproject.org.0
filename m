Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59814C8F695
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 17:01:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174143.1499134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeQz-0001bW-19; Thu, 27 Nov 2025 16:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174143.1499134; Thu, 27 Nov 2025 16:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeQy-0001ZP-Ui; Thu, 27 Nov 2025 16:01:28 +0000
Received: by outflank-mailman (input) for mailman id 1174143;
 Thu, 27 Nov 2025 16:01:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gQU=6D=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vOeIp-0003dB-LT
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 15:53:03 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2795c4cd-cba9-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 16:53:02 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 761D219F6;
 Thu, 27 Nov 2025 07:52:54 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.89.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0A853F73B;
 Thu, 27 Nov 2025 07:53:00 -0800 (PST)
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
X-Inumbo-ID: 2795c4cd-cba9-11f0-9d18-b5c5bf9af7f9
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 08/10] xen/arm: ffa: add v1.2 SEND2 header layout
Date: Thu, 27 Nov 2025 16:51:39 +0100
Message-ID: <769c7ad291abe47d7991b878b131f9b31d4f0954.1764254975.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1764254975.git.bertrand.marquis@arm.com>
References: <cover.1764254975.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Teach the SEND2 path about the distinct FF-A v1.1 and v1.2 RX/TX header
layouts so we can propagate the 128-bit UUIDs introduced in v1.2.

VM-to-VM SEND2 calls now build the larger v1.2 header, zeroing the UUID
fields for v1.1 senders, and the dispatcher validates messages using
the v1.1 header layout to keep legacy guests working.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa_msg.c | 55 +++++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
index 8bb4bd93f724..472bfad79dd3 100644
--- a/xen/arch/arm/tee/ffa_msg.c
+++ b/xen/arch/arm/tee/ffa_msg.c
@@ -13,7 +13,7 @@
 #include "ffa_private.h"
 
 /* Encoding of partition message in RX/TX buffer */
-struct ffa_part_msg_rxtx {
+struct ffa_part_msg_rxtx_1_1 {
     uint32_t flags;
     uint32_t reserved;
     uint32_t msg_offset;
@@ -21,6 +21,16 @@ struct ffa_part_msg_rxtx {
     uint32_t msg_size;
 };
 
+struct ffa_part_msg_rxtx_1_2 {
+    uint32_t flags;
+    uint32_t reserved;
+    uint32_t msg_offset;
+    uint32_t send_recv_id;
+    uint32_t msg_size;
+    uint32_t reserved2;
+    uint64_t uuid[2];
+};
+
 static void ffa_finish_direct_req_run(struct cpu_user_regs *regs,
                                       struct arm_smccc_1_2_regs *req)
 {
@@ -104,12 +114,12 @@ out:
     ffa_set_regs_error(regs, ret);
 }
 
-static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
-                                struct ffa_part_msg_rxtx *src_msg)
+static int32_t ffa_msg_send2_vm(struct ffa_ctx *src_ctx, uint16_t dst_id,
+                                struct ffa_part_msg_rxtx_1_2 *src_msg)
 {
     struct domain *dst_d;
     struct ffa_ctx *dst_ctx;
-    struct ffa_part_msg_rxtx *dst_msg;
+    struct ffa_part_msg_rxtx_1_2 *dst_msg;
     int err;
     int32_t ret;
 
@@ -142,7 +152,7 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
 
     /* we need to have enough space in the destination buffer */
     if ( (dst_ctx->page_count * FFA_PAGE_SIZE -
-          sizeof(struct ffa_part_msg_rxtx)) < src_msg->msg_size )
+          sizeof(struct ffa_part_msg_rxtx_1_2)) < src_msg->msg_size )
     {
         ret = FFA_RET_NO_MEMORY;
         ffa_rx_release(dst_d);
@@ -154,12 +164,24 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
     /* prepare destination header */
     dst_msg->flags = 0;
     dst_msg->reserved = 0;
-    dst_msg->msg_offset = sizeof(struct ffa_part_msg_rxtx);
+    dst_msg->msg_offset = sizeof(struct ffa_part_msg_rxtx_1_2);
     dst_msg->send_recv_id = src_msg->send_recv_id;
     dst_msg->msg_size = src_msg->msg_size;
+    dst_msg->reserved2 = 0;
 
-    memcpy(dst_ctx->rx + sizeof(struct ffa_part_msg_rxtx),
-           src_buf + src_msg->msg_offset, src_msg->msg_size);
+    if ( src_ctx->guest_vers < FFA_VERSION_1_2 )
+    {
+        dst_msg->uuid[0] = 0;
+        dst_msg->uuid[1] = 0;
+    }
+    else
+    {
+        dst_msg->uuid[0] = src_msg->uuid[0];
+        dst_msg->uuid[1] = src_msg->uuid[1];
+    }
+
+    memcpy(dst_ctx->rx + sizeof(struct ffa_part_msg_rxtx_1_2),
+           src_ctx->tx + src_msg->msg_offset, src_msg->msg_size);
 
     /* receiver rx buffer will be released by the receiver*/
 
@@ -175,11 +197,17 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
 {
     struct domain *src_d = current->domain;
     struct ffa_ctx *src_ctx = src_d->arch.tee;
-    struct ffa_part_msg_rxtx src_msg;
+    /*
+     * src_msg is interpreted as v1.2 header, but:
+     * - for v1.1 guests, uuid[] is ignored and may contain payload bytes
+     * - for v1.2 guests, uuid[] carries the FF-A v1.2 UUID fields
+     */
+    struct ffa_part_msg_rxtx_1_2 src_msg;
     uint16_t dst_id, src_id;
     int32_t ret;
 
-    BUILD_BUG_ON(sizeof(struct ffa_part_msg_rxtx) >= FFA_PAGE_SIZE);
+    BUILD_BUG_ON(sizeof(struct ffa_part_msg_rxtx_1_1) >= FFA_PAGE_SIZE);
+    BUILD_BUG_ON(sizeof(struct ffa_part_msg_rxtx_1_2) >= FFA_PAGE_SIZE);
 
     if ( !spin_trylock(&src_ctx->tx_lock) )
         return FFA_RET_BUSY;
@@ -190,14 +218,15 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
     src_id = src_msg.send_recv_id >> 16;
     dst_id = src_msg.send_recv_id & GENMASK(15,0);
 
-    if ( src_id != ffa_get_vm_id(src_d) )
+    if ( src_id != ffa_get_vm_id(src_d) ||
+         dst_id == ffa_get_vm_id(src_d) )
     {
         ret = FFA_RET_INVALID_PARAMETERS;
         goto out;
     }
 
     /* check source message fits in buffer */
-    if ( src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx) ||
+    if ( src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx_1_1) ||
             src_msg.msg_size == 0 ||
             src_msg.msg_offset > src_ctx->page_count * FFA_PAGE_SIZE ||
             src_msg.msg_size > (src_ctx->page_count * FFA_PAGE_SIZE -
@@ -222,7 +251,7 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
     else if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
     {
         /* Message for a VM */
-        ret = ffa_msg_send2_vm(dst_id, src_ctx->tx, &src_msg);
+        ret = ffa_msg_send2_vm(src_ctx, dst_id, &src_msg);
     }
     else
         ret = FFA_RET_INVALID_PARAMETERS;
-- 
2.51.2


