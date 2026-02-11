Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDXFA7e5jGlHsgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:17:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D37411268BE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:17:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228068.1534465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDqD-0001qK-ER; Wed, 11 Feb 2026 17:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228068.1534465; Wed, 11 Feb 2026 17:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDqD-0001kd-Au; Wed, 11 Feb 2026 17:17:29 +0000
Received: by outflank-mailman (input) for mailman id 1228068;
 Wed, 11 Feb 2026 17:17:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvfN=AP=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vqDp4-0004tt-MH
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 17:16:18 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 5e4c111b-076d-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 18:16:14 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C73E497;
 Wed, 11 Feb 2026 09:16:07 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.53.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67B8C3F63F;
 Wed, 11 Feb 2026 09:16:12 -0800 (PST)
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
X-Inumbo-ID: 5e4c111b-076d-11f1-b162-2bf370ae4941
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 12/12] xen/arm: ffa: Add message parameter diagnostics
Date: Wed, 11 Feb 2026 18:15:36 +0100
Message-ID: <ee4ae1ba137aca30b9e6e53e6a2a07f84fac9c56.1770826406.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770826406.git.bertrand.marquis@arm.com>
References: <cover.1770826406.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:mid,arm.com:email]
X-Rspamd-Queue-Id: D37411268BE
X-Rspamd-Action: no action

MSG_SEND2 and direct request validation failures are silent, making it
hard to diagnose invalid IDs, oversized messages, or unsupported
destination types.

Add debug logs for parameter validation failures:
- invalid endpoint IDs
- oversized messages
- unsupported destination types
- invalid sender/receiver combinations
- ratelimit MSG_SEND2 busy failures to avoid log flooding

No functional changes.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
- add a comment to explain ratelimit for BUSY in send2
---
 xen/arch/arm/tee/ffa_msg.c | 49 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
index 928f269f6c3a..1eadc62870f2 100644
--- a/xen/arch/arm/tee/ffa_msg.c
+++ b/xen/arch/arm/tee/ffa_msg.c
@@ -4,6 +4,7 @@
  */
 
 #include <xen/const.h>
+#include <xen/lib.h>
 #include <xen/sizes.h>
 #include <xen/types.h>
 
@@ -100,6 +101,7 @@ void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
     if ( !ffa_fw_supports_fid(fid) )
     {
         ret = FFA_RET_NOT_SUPPORTED;
+        gdprintk(XENLOG_DEBUG, "ffa: direct req fid %#x not supported\n", fid);
         goto out;
     }
 
@@ -108,6 +110,9 @@ void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
          (src_dst & GENMASK(15,0)) == ffa_get_vm_id(d) )
     {
         ret = FFA_RET_INVALID_PARAMETERS;
+        gdprintk(XENLOG_DEBUG,
+                 "ffa: direct req invalid src/dst %#x\n",
+                 (uint32_t)src_dst);
         goto out;
     }
 
@@ -115,6 +120,9 @@ void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
     if ( !FFA_ID_IS_SECURE(src_dst & GENMASK(15,0)) )
     {
         ret = FFA_RET_NOT_SUPPORTED;
+        gdprintk(XENLOG_DEBUG,
+                 "ffa: direct req to non-secure dst %#x\n",
+                 (uint32_t)(src_dst & GENMASK(15, 0)));
         goto out;
     }
 
@@ -166,7 +174,12 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
     /* This is also checking that dest is not src */
     ret = ffa_endpoint_domain_lookup(dst_id, &dst_d, &dst_ctx);
     if ( ret )
+    {
+        gdprintk(XENLOG_DEBUG,
+                 "ffa: msg_send2 lookup failed: dst %#x ret %d\n",
+                 dst_id, ret);
         return ret;
+    }
 
     /* This also checks that destination has set a Rx buffer */
     ret = ffa_rx_acquire(dst_ctx , &rx_buf, &rx_size);
@@ -199,6 +212,16 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
     /* receiver rx buffer will be released by the receiver*/
 
 out_unlock:
+    if ( ret )
+    {
+        /**
+         * Always print other errors than BUSY but ratelimit BUSY prints
+         * to prevent large number of prints when sender retries on BUSY.
+         */
+        if ( ret != FFA_RET_BUSY || printk_ratelimit() )
+            gdprintk(XENLOG_DEBUG, "ffa: msg_send2 to %#x failed: %d\n",
+                     dst_id, ret);
+    }
     rcu_unlock_domain(dst_d);
     if ( !ret )
         ffa_raise_rx_buffer_full(dst_d);
@@ -226,7 +249,11 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
 
     ret = ffa_tx_acquire(src_ctx, &tx_buf, &tx_size);
     if ( ret != FFA_RET_OK )
+    {
+        gdprintk(XENLOG_DEBUG,
+                 "ffa: msg_send2 TX acquire failed: %d\n", ret);
         return ret;
+    }
 
     /* create a copy of the message header */
     memcpy(&src_msg, tx_buf, sizeof(src_msg));
@@ -238,6 +265,9 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
          dst_id == ffa_get_vm_id(src_d) )
     {
         ret = FFA_RET_INVALID_PARAMETERS;
+        gdprintk(XENLOG_DEBUG,
+                 "ffa: msg_send2 invalid src/dst src %#x dst %#x\n",
+                 src_id, dst_id);
         goto out;
     }
 
@@ -246,6 +276,9 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
         if (src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx_1_1))
         {
             ret = FFA_RET_INVALID_PARAMETERS;
+            gdprintk(XENLOG_DEBUG,
+                     "ffa: msg_send2 invalid msg_offset %u (v1.1)\n",
+                     src_msg.msg_offset);
             goto out;
         }
         /* Set uuid to Nil UUID for v1.1 guests */
@@ -255,6 +288,9 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
     else if ( src_msg.msg_offset < sizeof(struct ffa_part_msg_rxtx_1_2) )
     {
         ret = FFA_RET_INVALID_PARAMETERS;
+        gdprintk(XENLOG_DEBUG,
+                 "ffa: msg_send2 invalid msg_offset %u (v1.2)\n",
+                 src_msg.msg_offset);
         goto out;
     }
 
@@ -263,6 +299,9 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
             src_msg.msg_size > (tx_size - src_msg.msg_offset) )
     {
         ret = FFA_RET_INVALID_PARAMETERS;
+        gdprintk(XENLOG_DEBUG,
+                 "ffa: msg_send2 invalid msg_size %u offset %u tx %zu\n",
+                 src_msg.msg_size, src_msg.msg_offset, tx_size);
         goto out;
     }
 
@@ -272,6 +311,8 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
         if ( !ffa_fw_supports_fid(FFA_MSG_SEND2) )
         {
             ret = FFA_RET_NOT_SUPPORTED;
+            gdprintk(XENLOG_DEBUG,
+                     "ffa: msg_send2 to SP not supported\n");
             goto out;
         }
         /*
@@ -288,6 +329,8 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
 
         ret = ffa_simple_call(FFA_MSG_SEND2,
                               ((uint32_t)ffa_get_vm_id(src_d)) << 16, 0, 0, 0);
+        if ( ret )
+            gdprintk(XENLOG_DEBUG, "ffa: msg_send2 to SP failed: %d\n", ret);
     }
     else if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
     {
@@ -295,7 +338,11 @@ int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
         ret = ffa_msg_send2_vm(dst_id, tx_buf, &src_msg);
     }
     else
+    {
         ret = FFA_RET_INVALID_PARAMETERS;
+        gdprintk(XENLOG_DEBUG,
+                 "ffa: msg_send2 to VM disabled (dst %#x)\n", dst_id);
+    }
 
 out:
     ffa_tx_release(src_ctx);
@@ -311,6 +358,7 @@ void ffa_handle_run(struct cpu_user_regs *regs, uint32_t fid)
     if ( !ffa_fw_supports_fid(fid) )
     {
         ret = FFA_RET_NOT_SUPPORTED;
+        gdprintk(XENLOG_DEBUG, "ffa: run fid %#x not supported\n", fid);
         goto out;
     }
 
@@ -322,6 +370,7 @@ void ffa_handle_run(struct cpu_user_regs *regs, uint32_t fid)
     if ( !FFA_ID_IS_SECURE(dst >> 16) )
     {
         ret = FFA_RET_NOT_SUPPORTED;
+        gdprintk(XENLOG_DEBUG, "ffa: run to non-secure dst %#x\n", dst);
         goto out;
     }
 
-- 
2.52.0


