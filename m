Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E059A0459
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 10:32:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819601.1233003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0zSD-0000h6-6x; Wed, 16 Oct 2024 08:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819601.1233003; Wed, 16 Oct 2024 08:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0zSD-0000ec-3N; Wed, 16 Oct 2024 08:32:25 +0000
Received: by outflank-mailman (input) for mailman id 819601;
 Wed, 16 Oct 2024 08:32:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0z3=RM=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1t0zSA-00006U-Uu
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 08:32:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 293d9897-8b99-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 10:32:21 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 375531007;
 Wed, 16 Oct 2024 01:32:50 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.21.81])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40E6E3F71E;
 Wed, 16 Oct 2024 01:32:19 -0700 (PDT)
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
X-Inumbo-ID: 293d9897-8b99-11ef-99a3-01e77a169b0f
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 02/10] xen/arm: ffa: Rework feature discovery
Date: Wed, 16 Oct 2024 10:31:22 +0200
Message-ID: <8cc7abbd82b43aa595ddc2dce3495663dfc413e0.1729066788.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729066788.git.bertrand.marquis@arm.com>
References: <cover.1729066788.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Store the list of ABI we need in a list and go through the list instead
of having a list of conditions inside the code.

No functional change.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v2:
- Store a string version of ABI needed from firmware and print the name
  of the ABI not supported instead of the id
- Restore comment with TODO which should not have been removed at this
  stage
- fix to unsigned int the index in the loop on the array
- use abi instead of feature in the names of the functions and variables
  as we are not checking features but abis
---
 xen/arch/arm/tee/ffa.c | 57 +++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 1cc4023135d5..dde932422ecf 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -74,6 +74,31 @@
 /* Negotiated FF-A version to use with the SPMC, 0 if not there or supported */
 static uint32_t __ro_after_init ffa_fw_version;
 
+struct ffa_fw_abi {
+    const uint32_t id;
+    const char *name;
+};
+
+#define FW_ABI(abi) {abi,#abi}
+
+/* List of ABI we use from the firmware */
+static const struct ffa_fw_abi ffa_fw_abi_needed[] = {
+    FW_ABI(FFA_VERSION),
+    FW_ABI(FFA_FEATURES),
+    FW_ABI(FFA_NOTIFICATION_BITMAP_CREATE),
+    FW_ABI(FFA_NOTIFICATION_BITMAP_DESTROY),
+    FW_ABI(FFA_PARTITION_INFO_GET),
+    FW_ABI(FFA_NOTIFICATION_INFO_GET_64),
+    FW_ABI(FFA_NOTIFICATION_GET),
+    FW_ABI(FFA_RX_RELEASE),
+    FW_ABI(FFA_RXTX_MAP_64),
+    FW_ABI(FFA_RXTX_UNMAP),
+    FW_ABI(FFA_MEM_SHARE_32),
+    FW_ABI(FFA_MEM_SHARE_64),
+    FW_ABI(FFA_MEM_RECLAIM),
+    FW_ABI(FFA_MSG_SEND_DIRECT_REQ_32),
+    FW_ABI(FFA_MSG_SEND_DIRECT_REQ_64),
+};
 
 /*
  * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
@@ -112,20 +137,9 @@ static bool ffa_get_version(uint32_t *vers)
     return true;
 }
 
-static int32_t ffa_features(uint32_t id)
-{
-    return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
-}
-
-static bool check_mandatory_feature(uint32_t id)
+static bool ffa_abi_supported(uint32_t id)
 {
-    int32_t ret = ffa_features(id);
-
-    if ( ret )
-        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing: error %d\n",
-               id, ret);
-
-    return !ret;
+    return !ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
 }
 
 static void handle_version(struct cpu_user_regs *regs)
@@ -540,17 +554,14 @@ static bool ffa_probe(void)
      * TODO: Rework the code to allow domain to use a subset of the
      * features supported.
      */
-    if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
-         !check_mandatory_feature(FFA_RX_RELEASE) ||
-         !check_mandatory_feature(FFA_RXTX_MAP_64) ||
-         !check_mandatory_feature(FFA_MEM_SHARE_64) ||
-         !check_mandatory_feature(FFA_RXTX_UNMAP) ||
-         !check_mandatory_feature(FFA_MEM_SHARE_32) ||
-         !check_mandatory_feature(FFA_MEM_RECLAIM) ||
-         !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
+    for ( unsigned int i = 0; i < ARRAY_SIZE(ffa_fw_abi_needed); i++ )
     {
-        printk(XENLOG_ERR "ffa: Mandatory feature not supported by fw\n");
-        goto err_no_fw;
+        if ( !ffa_abi_supported(ffa_fw_abi_needed[i].id) )
+        {
+            printk(XENLOG_INFO "ARM FF-A Firmware does not support %s\n",
+                   ffa_fw_abi_needed[i].name);
+            goto err_no_fw;
+        }
     }
 
     ffa_fw_version = vers;
-- 
2.47.0


