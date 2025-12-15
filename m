Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE84CCBE647
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 15:50:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187141.1508637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9tu-0006dQ-5u; Mon, 15 Dec 2025 14:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187141.1508637; Mon, 15 Dec 2025 14:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9tu-0006Zd-0h; Mon, 15 Dec 2025 14:50:14 +0000
Received: by outflank-mailman (input) for mailman id 1187141;
 Mon, 15 Dec 2025 14:50:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pAKg=6V=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vV9tr-0003Ov-VB
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 14:50:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 5b33f6d5-d9c5-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 15:50:11 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72A61165C;
 Mon, 15 Dec 2025 06:50:03 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.46.206])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A8883F694;
 Mon, 15 Dec 2025 06:50:09 -0800 (PST)
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
X-Inumbo-ID: 5b33f6d5-d9c5-11f0-b15b-2bf370ae4941
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 10/12] xen/arm: ffa: add v1.2 SEND2 header layout
Date: Mon, 15 Dec 2025 15:49:27 +0100
Message-ID: <db3fb6650fd701b81f416da34bab40792da52693.1765807707.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1765807707.git.bertrand.marquis@arm.com>
References: <cover.1765807707.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Teach the SEND2 path about the distinct FF-A v1.1 and v1.2 RX/TX header
layouts so we can propagate the 128-bit UUIDs introduced in v1.2.

VM-to-VM SEND2 calls now build the larger v1.2 header, zeroing the UUID
fields for v1.1 senders, and the dispatcher validates messages using
the v1.1 header layout to keep legacy guests working.

While there, make the code more robust by checking that the send is not
trying to send a message to himself.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
---
Changes in v2:
- add Jens R-b
Changes in v1:
- Mention self send check in commit message
- check header size depending on sender FF-A version and make sure 1.2
  has enough space for 1.2 header
- Simplify the code by setting uuid field of the header to Nil-UUID when
  testing the caller version and remove the need to pass the context to
  the send2_vm function
- Use ACCESS_ONCE when reading sender ffa version
---
 xen/arch/arm/tee/ffa_msg.c | 58 ++++++++++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
index 5a4cb1bb8295..c3552a3ae36d 100644
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
@@ -105,11 +115,11 @@ out:
 }
 
 static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
-                                struct ffa_part_msg_rxtx *src_msg)
+                                struct ffa_part_msg_rxtx_1_2 *src_msg)
 {
     struct domain *dst_d;
     struct ffa_ctx *dst_ctx;
-    struct ffa_part_msg_rxtx *dst_msg;
+    struct ffa_part_msg_rxtx_1_2 *dst_msg;
     void *rx_buf;
     size_t rx_size;
     int err;
@@ -143,7 +153,7 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
         goto out_unlock;
 
     /* we need to have enough space in the destination buffer */
-    if ( (rx_size - sizeof(struct ffa_part_msg_rxtx)) < src_msg->msg_size )
+    if ( (rx_size - sizeof(struct ffa_part_msg_rxtx_1_2)) < src_msg->msg_size )
     {
         ret = FFA_RET_NO_MEMORY;
         ffa_rx_release(dst_ctx);
@@ -155,11 +165,14 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
     /* prepare destination header */
     dst_msg->flags = 0;
     dst_msg->reserved = 0;
-    dst_msg->msg_offset = sizeof(struct ffa_part_msg_rxtx);
+    dst_msg->msg_offset = sizeof(struct ffa_part_msg_rxtx_1_2);
     dst_msg->send_recv_id = src_msg->send_recv_id;
     dst_msg->msg_size = src_msg->msg_size;
+    dst_msg->reserved2 = 0;
+    dst_msg->uuid[0] = src_msg->uuid[0];
+    dst_msg->uuid[1] = src_msg->uuid[1];
 
-    memcpy(rx_buf + sizeof(struct ffa_part_msg_rxtx),
+    memcpy(rx_buf + sizeof(struct ffa_part_msg_rxtx_1_2),
            src_buf + src_msg->msg_offset, src_msg->msg_size);
 
     /* receiver rx buffer will be released by the receiver*/
@@ -178,11 +191,17 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
     struct ffa_ctx *src_ctx = src_d->arch.tee;
     const void *tx_buf;
     size_t tx_size;
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
 
     ret = ffa_tx_acquire(src_ctx, &tx_buf, &tx_size);
     if ( ret != FFA_RET_OK )
@@ -194,15 +213,32 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
     src_id = src_msg.send_recv_id >> 16;
     dst_id = src_msg.send_recv_id & GENMASK(15,0);
 
-    if ( src_id != ffa_get_vm_id(src_d) )
+    if ( src_id != ffa_get_vm_id(src_d) ||
+         dst_id == ffa_get_vm_id(src_d) )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out;
+    }
+
+    if ( ACCESS_ONCE(src_ctx->guest_vers) < FFA_VERSION_1_2 )
+    {
+        if (src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx_1_1))
+        {
+            ret = FFA_RET_INVALID_PARAMETERS;
+            goto out;
+        }
+        /* Set uuid to Nil UUID for v1.1 guests */
+        src_msg.uuid[0] = 0;
+        src_msg.uuid[1] = 0;
+    }
+    else if ( src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx_1_2) )
     {
         ret = FFA_RET_INVALID_PARAMETERS;
         goto out;
     }
 
     /* check source message fits in buffer */
-    if ( src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx) ||
-            src_msg.msg_size == 0 || src_msg.msg_offset > tx_size ||
+    if ( src_msg.msg_size == 0 || src_msg.msg_offset > tx_size ||
             src_msg.msg_size > (tx_size - src_msg.msg_offset) )
     {
         ret = FFA_RET_INVALID_PARAMETERS;
-- 
2.51.2


