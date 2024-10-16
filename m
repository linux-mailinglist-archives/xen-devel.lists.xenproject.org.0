Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E489A0457
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 10:32:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819600.1232993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0zSB-0000S3-Ua; Wed, 16 Oct 2024 08:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819600.1232993; Wed, 16 Oct 2024 08:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0zSB-0000PL-RL; Wed, 16 Oct 2024 08:32:23 +0000
Received: by outflank-mailman (input) for mailman id 819600;
 Wed, 16 Oct 2024 08:32:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0z3=RM=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1t0zSA-0000Nz-8m
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 08:32:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 28341bea-8b99-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 10:32:20 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89261FEC;
 Wed, 16 Oct 2024 01:32:48 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.21.81])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F35F3F71E;
 Wed, 16 Oct 2024 01:32:17 -0700 (PDT)
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
X-Inumbo-ID: 28341bea-8b99-11ef-a0be-8be0dac302b0
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 01/10] xen/arm: ffa: Rework firmware discovery
Date: Wed, 16 Oct 2024 10:31:21 +0200
Message-ID: <457020b684e87ee9ad9488a4ec0d17ade90fdea1.1729066788.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729066788.git.bertrand.marquis@arm.com>
References: <cover.1729066788.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework firmware discovery during probe:
- move prints into the probe
- rename ffa_version to ffa_fw_version as the variable identifies the
  version of the firmware and not the one we support
- add error prints when allocation fail during probe

No functional changes.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v2:
- Fix error message when we fail to retrieve ffa_version
- Move back printing the firmware version before checking supported
  features
- Use Warning instead of Info to inform user that FF-A is not supported
  in firmware.
---
 xen/arch/arm/tee/ffa.c | 44 ++++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 022089278e1c..1cc4023135d5 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -71,8 +71,8 @@
 
 #include "ffa_private.h"
 
-/* Negotiated FF-A version to use with the SPMC */
-static uint32_t __ro_after_init ffa_version;
+/* Negotiated FF-A version to use with the SPMC, 0 if not there or supported */
+static uint32_t __ro_after_init ffa_fw_version;
 
 
 /*
@@ -105,10 +105,7 @@ static bool ffa_get_version(uint32_t *vers)
 
     arm_smccc_1_2_smc(&arg, &resp);
     if ( resp.a0 == FFA_RET_NOT_SUPPORTED )
-    {
-        gprintk(XENLOG_ERR, "ffa: FFA_VERSION returned not supported\n");
         return false;
-    }
 
     *vers = resp.a0;
 
@@ -372,7 +369,7 @@ static int ffa_domain_init(struct domain *d)
     struct ffa_ctx *ctx;
     int ret;
 
-    if ( !ffa_version )
+    if ( !ffa_fw_version )
         return -ENODEV;
      /*
       * We can't use that last possible domain ID or ffa_get_vm_id() would
@@ -505,6 +502,9 @@ static bool ffa_probe(void)
      */
     BUILD_BUG_ON(PAGE_SIZE != FFA_PAGE_SIZE);
 
+    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
+           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
+
     /*
      * psci_init_smccc() updates this value with what's reported by EL-3
      * or secure world.
@@ -514,22 +514,24 @@ static bool ffa_probe(void)
         printk(XENLOG_ERR
                "ffa: unsupported SMCCC version %#x (need at least %#x)\n",
                smccc_ver, ARM_SMCCC_VERSION_1_2);
-        return false;
+        goto err_no_fw;
     }
 
     if ( !ffa_get_version(&vers) )
-        return false;
+    {
+        gprintk(XENLOG_ERR, "Cannot retrieve the FFA version\n");
+        goto err_no_fw;
+    }
 
     if ( vers < FFA_MIN_SPMC_VERSION || vers > FFA_MY_VERSION )
     {
         printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers);
-        return false;
+        goto err_no_fw;
     }
 
-    major_vers = (vers >> FFA_VERSION_MAJOR_SHIFT) & FFA_VERSION_MAJOR_MASK;
+    major_vers = (vers >> FFA_VERSION_MAJOR_SHIFT)
+                 & FFA_VERSION_MAJOR_MASK;
     minor_vers = vers & FFA_VERSION_MINOR_MASK;
-    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
-           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
            major_vers, minor_vers);
 
@@ -546,12 +548,18 @@ static bool ffa_probe(void)
          !check_mandatory_feature(FFA_MEM_SHARE_32) ||
          !check_mandatory_feature(FFA_MEM_RECLAIM) ||
          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
-        return false;
+    {
+        printk(XENLOG_ERR "ffa: Mandatory feature not supported by fw\n");
+        goto err_no_fw;
+    }
 
-    if ( !ffa_rxtx_init() )
-        return false;
+    ffa_fw_version = vers;
 
-    ffa_version = vers;
+    if ( !ffa_rxtx_init() )
+    {
+        printk(XENLOG_ERR "ffa: Error during RXTX buffer init\n");
+        goto err_no_fw;
+    }
 
     if ( !ffa_partinfo_init() )
         goto err_rxtx_destroy;
@@ -564,7 +572,9 @@ static bool ffa_probe(void)
 
 err_rxtx_destroy:
     ffa_rxtx_destroy();
-    ffa_version = 0;
+err_no_fw:
+    ffa_fw_version = 0;
+    printk(XENLOG_WARNING "ARM FF-A No firmware support\n");
 
     return false;
 }
-- 
2.47.0


