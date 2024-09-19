Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA8A97C8FA
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 14:20:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800669.1210647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srG8V-0004YY-II; Thu, 19 Sep 2024 12:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800669.1210647; Thu, 19 Sep 2024 12:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srG8V-0004WB-E8; Thu, 19 Sep 2024 12:19:51 +0000
Received: by outflank-mailman (input) for mailman id 800669;
 Thu, 19 Sep 2024 12:19:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lyjY=QR=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1srG8T-0003iL-Rc
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 12:19:49 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 76312b0a-7681-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 14:19:48 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6D2E1007;
 Thu, 19 Sep 2024 05:20:16 -0700 (PDT)
Received: from C3HXLD123V.emea.arm.com (usa-sjc-mx-foss1.foss.arm.com
 [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B2833F64C;
 Thu, 19 Sep 2024 05:19:46 -0700 (PDT)
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
X-Inumbo-ID: 76312b0a-7681-11ef-99a2-01e77a169b0f
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 03/10] xen/arm: ffa: fix version negotiation
Date: Thu, 19 Sep 2024 14:19:03 +0200
Message-Id: <716e806316f8249611c8268f781efbea19273b4a.1726676338.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1726676338.git.bertrand.marquis@arm.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix FFA version negotiation with the firmware to follow the
specification guidance more closely.
When the firmware returns OK we can have several cases:
- the version requested is accepted but the firmware supports a greater
  one in the same major.
- the firmware supports a greater major version. It could still return
  OK even if the version requested is not accepted. Reject it.
- the firmware supports a lower version. It will return OK and give that
  version. Check if we support it and use it or reject it if we do not.

Adapt the code to:
- reject any version lower than the one we support or not with the same
  major version
- use the version returned if in our supported range (currently 1.1
  only)
- use 1.1 if the version returned is greater.

Also adapt the handling of version requests from VM:
- return an error for a different major
- return 1.1 for a version >= 1.1
- return 1.0 if 1.0 was requested

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 7ff2529b2055..1f602f25d097 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -141,13 +141,24 @@ static void handle_version(struct cpu_user_regs *regs)
     struct ffa_ctx *ctx = d->arch.tee;
     uint32_t vers = get_user_reg(regs, 1);
 
-    if ( vers < FFA_VERSION_1_1 )
-        vers = FFA_VERSION_1_0;
-    else
-        vers = FFA_VERSION_1_1;
+    /**
+     * As of now we only support 1.0 or 1.1.
+     * For any 1.x >= 1.1 return OK with 1.1
+     * For 1.0 return OK with 1.0
+     * For anything else return an error.
+     */
+    if ( (vers >> FFA_VERSION_MAJOR_SHIFT) == FFA_MY_VERSION_MAJOR )
+    {
+        if ( vers < FFA_VERSION_1_1 )
+            vers = FFA_VERSION_1_0;
+        else
+            vers = FFA_VERSION_1_1;
 
-    ctx->guest_vers = vers;
-    ffa_set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
+        ctx->guest_vers = vers;
+        ffa_set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
+    }
+    else
+        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
 }
 
 static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
@@ -530,7 +541,8 @@ static bool ffa_probe(void)
         goto err_no_fw;
     }
 
-    if ( vers < FFA_MIN_SPMC_VERSION || vers > FFA_MY_VERSION )
+    if ( vers < FFA_MIN_SPMC_VERSION ||
+              (vers >> FFA_VERSION_MAJOR_SHIFT) != FFA_MY_VERSION_MAJOR )
     {
         printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers);
         goto err_no_fw;
@@ -542,7 +554,17 @@ static bool ffa_probe(void)
     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
            major_vers, minor_vers);
 
-    ffa_fw_version = vers;
+    /**
+     * If the call succeed and the version returned is higher or equal to
+     * the one Xen requested, the version requested by Xen will be the one
+     * used. If the version returned is lower but compatible with Xen, Xen
+     * will use that version instead.
+     * A version with a different major is rejected before.
+     */
+    if ( vers > FFA_MY_VERSION )
+        ffa_fw_version = FFA_MY_VERSION;
+    else
+        ffa_fw_version = vers;
 
     for ( int i = 0; i < ARRAY_SIZE(ffa_fw_feat_needed); i++ )
     {
-- 
2.39.5 (Apple Git-154)


