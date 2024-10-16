Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B240D9A045C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 10:33:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819602.1233009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0zSD-0000nh-KV; Wed, 16 Oct 2024 08:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819602.1233009; Wed, 16 Oct 2024 08:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0zSD-0000h8-E1; Wed, 16 Oct 2024 08:32:25 +0000
Received: by outflank-mailman (input) for mailman id 819602;
 Wed, 16 Oct 2024 08:32:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0z3=RM=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1t0zSB-0000Nz-K3
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 08:32:23 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2a4e3d8a-8b99-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 10:32:23 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F4D8FEC;
 Wed, 16 Oct 2024 01:32:52 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.21.81])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA7F63F71E;
 Wed, 16 Oct 2024 01:32:20 -0700 (PDT)
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
X-Inumbo-ID: 2a4e3d8a-8b99-11ef-a0be-8be0dac302b0
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 03/10] xen/arm: ffa: Fix version negotiation
Date: Wed, 16 Oct 2024 10:31:23 +0200
Message-ID: <86636401aa34f9c64e674a53d49859930a227d10.1729066788.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729066788.git.bertrand.marquis@arm.com>
References: <cover.1729066788.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix FFA version negotiation with the firmware to follow the
specification guidance more closely (see FF-A Specification Version 1.1
in chapter 13.2.1).
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
- use our version if same major but greater minor is requested
- use requested version if same major but lower minor is requested
- do not use if incompatible major is requested
- always return our version without error to the requester

[1] https://developer.arm.com/documentation/den0077/e/

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v2:
- add link in commit message and code to the version and chapter of
  the spec.
- fix comment coding style
- introduce macros to get the major and minor of a version
- add BUILD_BUG_ON to validate that the SPMC version we want is
  compatible with our own version
- rework version testing and selecting to be clearer by discarding
  different major or version lower than what we want and then selecting
  based on the minor version.
- fix get_version handling to be more generic
---
 xen/arch/arm/tee/ffa.c         | 54 +++++++++++++++++++++++++---------
 xen/arch/arm/tee/ffa_private.h |  3 ++
 2 files changed, 43 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index dde932422ecf..1ee6b2895e92 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -148,13 +148,20 @@ static void handle_version(struct cpu_user_regs *regs)
     struct ffa_ctx *ctx = d->arch.tee;
     uint32_t vers = get_user_reg(regs, 1);
 
-    if ( vers < FFA_VERSION_1_1 )
-        vers = FFA_VERSION_1_0;
-    else
-        vers = FFA_VERSION_1_1;
-
-    ctx->guest_vers = vers;
-    ffa_set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
+    /*
+     * Guest will use the version it requested if it is our major and minor
+     * lower or equals to ours. If the minor is greater, our version will be
+     * used.
+     * In any case return our version to the caller.
+     */
+    if ( FFA_VERSION_MAJOR(vers) == FFA_MY_VERSION_MAJOR )
+    {
+        if ( FFA_VERSION_MINOR(vers) > FFA_MY_VERSION_MINOR )
+            ctx->guest_vers = FFA_MY_VERSION;
+        else
+            ctx->guest_vers = vers;
+    }
+    ffa_set_regs(regs, FFA_MY_VERSION, 0, 0, 0, 0, 0, 0, 0);
 }
 
 static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
@@ -537,18 +544,39 @@ static bool ffa_probe(void)
         goto err_no_fw;
     }
 
-    if ( vers < FFA_MIN_SPMC_VERSION || vers > FFA_MY_VERSION )
+    /* Some sanity check in case we update the version we support */
+    BUILD_BUG_ON(FFA_MIN_SPMC_VERSION > FFA_MY_VERSION);
+    BUILD_BUG_ON(FFA_VERSION_MAJOR(FFA_MIN_SPMC_VERSION) !=
+                                   FFA_MY_VERSION_MAJOR);
+
+    major_vers = FFA_VERSION_MAJOR(vers);
+    minor_vers = FFA_VERSION_MINOR(vers);
+
+    if ( major_vers != FFA_MY_VERSION_MAJOR ||
+         minor_vers < FFA_VERSION_MINOR(FFA_MIN_SPMC_VERSION) )
     {
-        printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers);
+        printk(XENLOG_ERR "ffa: Incompatible firmware version %u.%u\n",
+               major_vers, minor_vers);
         goto err_no_fw;
     }
 
-    major_vers = (vers >> FFA_VERSION_MAJOR_SHIFT)
-                 & FFA_VERSION_MAJOR_MASK;
-    minor_vers = vers & FFA_VERSION_MINOR_MASK;
     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
            major_vers, minor_vers);
 
+    /*
+     * If the call succeed and the version returned is higher or equal to
+     * the one Xen requested, the version requested by Xen will be the one
+     * used. If the version returned is lower but compatible with Xen, Xen
+     * will use that version instead.
+     * A version with a different major or lower than the minimum version
+     * we support is rejected before.
+     * See https://developer.arm.com/documentation/den0077/e/ chapter 13.2.1
+     */
+    if ( minor_vers > FFA_MY_VERSION_MINOR )
+        ffa_fw_version = FFA_MY_VERSION;
+    else
+        ffa_fw_version = vers;
+
     /*
      * At the moment domains must support the same features used by Xen.
      * TODO: Rework the code to allow domain to use a subset of the
@@ -564,8 +592,6 @@ static bool ffa_probe(void)
         }
     }
 
-    ffa_fw_version = vers;
-
     if ( !ffa_rxtx_init() )
     {
         printk(XENLOG_ERR "ffa: Error during RXTX buffer init\n");
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 7c6b06f686fc..045d9c4a0b56 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -35,6 +35,9 @@
 #define MAKE_FFA_VERSION(major, minor)  \
         ((((major) & FFA_VERSION_MAJOR_MASK) << FFA_VERSION_MAJOR_SHIFT) | \
          ((minor) & FFA_VERSION_MINOR_MASK))
+#define FFA_VERSION_MAJOR(vers) (((vers) >> FFA_VERSION_MAJOR_SHIFT) & \
+                                 FFA_VERSION_MAJOR_MASK)
+#define FFA_VERSION_MINOR(vers) ((vers) & FFA_VERSION_MINOR_MASK)
 
 #define FFA_VERSION_1_0         MAKE_FFA_VERSION(1, 0)
 #define FFA_VERSION_1_1         MAKE_FFA_VERSION(1, 1)
-- 
2.47.0


