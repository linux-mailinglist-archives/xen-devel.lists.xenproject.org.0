Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE1497C900
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 14:20:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800668.1210638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srG8T-0004Hc-9d; Thu, 19 Sep 2024 12:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800668.1210638; Thu, 19 Sep 2024 12:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srG8T-0004FN-6h; Thu, 19 Sep 2024 12:19:49 +0000
Received: by outflank-mailman (input) for mailman id 800668;
 Thu, 19 Sep 2024 12:19:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lyjY=QR=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1srG8R-0003zB-K2
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 12:19:47 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 75813cf7-7681-11ef-a0b8-8be0dac302b0;
 Thu, 19 Sep 2024 14:19:46 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5EDD13D5;
 Thu, 19 Sep 2024 05:20:15 -0700 (PDT)
Received: from C3HXLD123V.emea.arm.com (usa-sjc-mx-foss1.foss.arm.com
 [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69A553F64C;
 Thu, 19 Sep 2024 05:19:45 -0700 (PDT)
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
X-Inumbo-ID: 75813cf7-7681-11ef-a0b8-8be0dac302b0
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 02/10] xen/arm: ffa: Rework feature discovery
Date: Thu, 19 Sep 2024 14:19:02 +0200
Message-Id: <6c841c341b7dc9e06eb1c02555e30b29bd400d20.1726676338.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1726676338.git.bertrand.marquis@arm.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Store the list of ABI we need in a list and go through the list instead
of having a list of conditions inside the code.

No functional change.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c | 61 +++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 31 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 7c84aa6aa43d..7ff2529b2055 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -74,6 +74,24 @@
 /* Negotiated FF-A version to use with the SPMC, 0 if not there or supported */
 static uint32_t __ro_after_init ffa_fw_version;
 
+/* List of ABI we use from the firmware */
+static const uint32_t ffa_fw_feat_needed[] = {
+    FFA_VERSION,
+    FFA_FEATURES,
+    FFA_NOTIFICATION_BITMAP_CREATE,
+    FFA_NOTIFICATION_BITMAP_DESTROY,
+    FFA_PARTITION_INFO_GET,
+    FFA_NOTIFICATION_INFO_GET_64,
+    FFA_NOTIFICATION_GET,
+    FFA_RX_RELEASE,
+    FFA_RXTX_MAP_64,
+    FFA_RXTX_UNMAP,
+    FFA_MEM_SHARE_32,
+    FFA_MEM_SHARE_64,
+    FFA_MEM_RECLAIM,
+    FFA_MSG_SEND_DIRECT_REQ_32,
+    FFA_MSG_SEND_DIRECT_REQ_64,
+};
 
 /*
  * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
@@ -112,20 +130,9 @@ static bool ffa_get_version(uint32_t *vers)
     return true;
 }
 
-static int32_t ffa_features(uint32_t id)
+static bool ffa_feature_supported(uint32_t id)
 {
-    return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
-}
-
-static bool check_mandatory_feature(uint32_t id)
-{
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
@@ -529,24 +536,6 @@ static bool ffa_probe(void)
         goto err_no_fw;
     }
 
-    /*
-     * At the moment domains must support the same features used by Xen.
-     * TODO: Rework the code to allow domain to use a subset of the
-     * features supported.
-     */
-    if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
-         !check_mandatory_feature(FFA_RX_RELEASE) ||
-         !check_mandatory_feature(FFA_RXTX_MAP_64) ||
-         !check_mandatory_feature(FFA_MEM_SHARE_64) ||
-         !check_mandatory_feature(FFA_RXTX_UNMAP) ||
-         !check_mandatory_feature(FFA_MEM_SHARE_32) ||
-         !check_mandatory_feature(FFA_MEM_RECLAIM) ||
-         !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
-    {
-        printk(XENLOG_ERR "ffa: Mandatory feature not supported by fw\n");
-        goto err_no_fw;
-    }
-
     major_vers = (vers >> FFA_VERSION_MAJOR_SHIFT)
                  & FFA_VERSION_MAJOR_MASK;
     minor_vers = vers & FFA_VERSION_MINOR_MASK;
@@ -555,6 +544,16 @@ static bool ffa_probe(void)
 
     ffa_fw_version = vers;
 
+    for ( int i = 0; i < ARRAY_SIZE(ffa_fw_feat_needed); i++ )
+    {
+        if ( !ffa_feature_supported(ffa_fw_feat_needed[i]) )
+        {
+            printk(XENLOG_INFO "ARM FF-A Firmware does not support 0x%08x\n",
+                   ffa_fw_feat_needed[i]);
+            goto err_no_fw;
+        }
+    }
+
     if ( !ffa_rxtx_init() )
     {
         printk(XENLOG_ERR "ffa: Error during RXTX buffer init\n");
-- 
2.39.5 (Apple Git-154)


