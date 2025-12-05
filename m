Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFA7CA736C
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 11:41:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178748.1502486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRTFt-00041u-Pt; Fri, 05 Dec 2025 10:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178748.1502486; Fri, 05 Dec 2025 10:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRTFt-0003zg-MY; Fri, 05 Dec 2025 10:41:41 +0000
Received: by outflank-mailman (input) for mailman id 1178748;
 Fri, 05 Dec 2025 10:41:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d4nT=6L=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vRTCD-0005j7-Tn
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 10:37:53 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7417b842-d1c6-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 11:37:53 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 438AD1575;
 Fri,  5 Dec 2025 02:37:45 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.45.211])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 902FC3F86F;
 Fri,  5 Dec 2025 02:37:51 -0800 (PST)
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
X-Inumbo-ID: 7417b842-d1c6-11f0-9d1b-b5c5bf9af7f9
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v1 11/12] xen/arm: ffa: add MSG_SEND_DIRECT_REQ2 support
Date: Fri,  5 Dec 2025 11:36:44 +0100
Message-ID: <55a3df6c73581e7e77a76230cd445ccb16608269.1764930353.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1764930353.git.bertrand.marquis@arm.com>
References: <cover.1764930353.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the direct-request path so FF-A v1.2 guests can issue
FFA_MSG_SEND_DIRECT_REQ2 and receive the matching RESP2.

The handler now marshals registers x8–x17, and
ffa_finish_direct_req_run() copies back the 17-register response used by
FFA_MSG_SEND_DIRECT_RESP2. The new opcode is exposed via FFA_FEATURES
and gated on guests that negotiated v1.2.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v1:
- use ACCESS_ONCE to read guest_vers
---
 xen/arch/arm/tee/ffa.c     | 20 +++++++++++++++++++
 xen/arch/arm/tee/ffa_msg.c | 39 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 0f07efe5a7b3..2c6443a7f6a4 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -237,6 +237,8 @@ out_continue:
 static void handle_features(struct cpu_user_regs *regs)
 {
     uint32_t a1 = get_user_reg(regs, 1);
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
     unsigned int n;
 
     for ( n = 2; n <= 7; n++ )
@@ -268,6 +270,16 @@ static void handle_features(struct cpu_user_regs *regs)
     case FFA_MSG_YIELD:
         ffa_set_regs_success(regs, 0, 0);
         break;
+    case FFA_MSG_SEND_DIRECT_REQ2:
+        if ( ACCESS_ONCE(ctx->guest_vers) >= FFA_VERSION_1_2 )
+        {
+            ffa_set_regs_success(regs, 0, 0);
+        }
+        else
+        {
+            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+        }
+        break;
     case FFA_MEM_SHARE_64:
     case FFA_MEM_SHARE_32:
         /*
@@ -353,6 +365,14 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     case FFA_MSG_SEND_DIRECT_REQ_64:
         ffa_handle_msg_send_direct_req(regs, fid);
         return true;
+    case FFA_MSG_SEND_DIRECT_REQ2:
+        if ( ACCESS_ONCE(ctx->guest_vers) >= FFA_VERSION_1_2 )
+        {
+            ffa_handle_msg_send_direct_req(regs, fid);
+            return true;
+        }
+        e = FFA_RET_NOT_SUPPORTED;
+        break;
     case FFA_RUN:
         ffa_handle_run(regs, fid);
         return true;
diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
index c3552a3ae36d..4e26596461a9 100644
--- a/xen/arch/arm/tee/ffa_msg.c
+++ b/xen/arch/arm/tee/ffa_msg.c
@@ -49,6 +49,30 @@ static void ffa_finish_direct_req_run(struct cpu_user_regs *regs,
     case FFA_MSG_YIELD:
     case FFA_INTERRUPT:
         break;
+    case FFA_MSG_SEND_DIRECT_RESP2:
+        /*
+         * REQ2 / RESP2 use a 17-register payload (x1–x17). Copy all of them
+         * back to the guest context.
+         */
+        set_user_reg(regs, 0, resp.a0);
+        set_user_reg(regs, 1, resp.a1);
+        set_user_reg(regs, 2, resp.a2);
+        set_user_reg(regs, 3, resp.a3);
+        set_user_reg(regs, 4, resp.a4);
+        set_user_reg(regs, 5, resp.a5);
+        set_user_reg(regs, 6, resp.a6);
+        set_user_reg(regs, 7, resp.a7);
+        set_user_reg(regs, 8, resp.a8);
+        set_user_reg(regs, 9, resp.a9);
+        set_user_reg(regs, 10, resp.a10);
+        set_user_reg(regs, 11, resp.a11);
+        set_user_reg(regs, 12, resp.a12);
+        set_user_reg(regs, 13, resp.a13);
+        set_user_reg(regs, 14, resp.a14);
+        set_user_reg(regs, 15, resp.a15);
+        set_user_reg(regs, 16, resp.a16);
+        set_user_reg(regs, 17, resp.a17);
+        return;
     default:
         /* Bad fid, report back to the caller. */
         ffa_set_regs_error(regs, FFA_RET_ABORTED);
@@ -107,6 +131,21 @@ void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
     arg.a6 = get_user_reg(regs, 6) & mask;
     arg.a7 = get_user_reg(regs, 7) & mask;
 
+    if ( fid == FFA_MSG_SEND_DIRECT_REQ2 )
+    {
+        /* 17 registers are used for REQ2 */
+        arg.a8 = get_user_reg(regs, 8);
+        arg.a9 = get_user_reg(regs, 9);
+        arg.a10 = get_user_reg(regs, 10);
+        arg.a11 = get_user_reg(regs, 11);
+        arg.a12 = get_user_reg(regs, 12);
+        arg.a13 = get_user_reg(regs, 13);
+        arg.a14 = get_user_reg(regs, 14);
+        arg.a15 = get_user_reg(regs, 15);
+        arg.a16 = get_user_reg(regs, 16);
+        arg.a17 = get_user_reg(regs, 17);
+    }
+
     ffa_finish_direct_req_run(regs, &arg);
     return;
 
-- 
2.51.2


