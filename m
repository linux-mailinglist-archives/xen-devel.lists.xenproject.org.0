Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E5197C904
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 14:20:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800667.1210629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srG8S-00042E-3D; Thu, 19 Sep 2024 12:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800667.1210629; Thu, 19 Sep 2024 12:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srG8R-0003zj-UW; Thu, 19 Sep 2024 12:19:47 +0000
Received: by outflank-mailman (input) for mailman id 800667;
 Thu, 19 Sep 2024 12:19:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lyjY=QR=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1srG8Q-0003zB-Ty
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 12:19:46 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 74d1a7b7-7681-11ef-a0b8-8be0dac302b0;
 Thu, 19 Sep 2024 14:19:45 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94D291007;
 Thu, 19 Sep 2024 05:20:14 -0700 (PDT)
Received: from C3HXLD123V.emea.arm.com (usa-sjc-mx-foss1.foss.arm.com
 [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 521863F64C;
 Thu, 19 Sep 2024 05:19:44 -0700 (PDT)
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
X-Inumbo-ID: 74d1a7b7-7681-11ef-a0b8-8be0dac302b0
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 01/10] xen/arm: ffa: Rework firmware discovery
Date: Thu, 19 Sep 2024 14:19:01 +0200
Message-Id: <9931c299450a1e0a2384161eb9b514ead8895ecc.1726676338.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1726676338.git.bertrand.marquis@arm.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
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
 xen/arch/arm/tee/ffa.c | 52 +++++++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 022089278e1c..7c84aa6aa43d 100644
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
@@ -514,25 +514,21 @@ static bool ffa_probe(void)
         printk(XENLOG_ERR
                "ffa: unsupported SMCCC version %#x (need at least %#x)\n",
                smccc_ver, ARM_SMCCC_VERSION_1_2);
-        return false;
+        goto err_no_fw;
     }
 
     if ( !ffa_get_version(&vers) )
-        return false;
+    {
+        gprintk(XENLOG_ERR, "ffa: FFA_VERSION returned not supported\n");
+        goto err_no_fw;
+    }
 
     if ( vers < FFA_MIN_SPMC_VERSION || vers > FFA_MY_VERSION )
     {
         printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers);
-        return false;
+        goto err_no_fw;
     }
 
-    major_vers = (vers >> FFA_VERSION_MAJOR_SHIFT) & FFA_VERSION_MAJOR_MASK;
-    minor_vers = vers & FFA_VERSION_MINOR_MASK;
-    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
-           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
-    printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
-           major_vers, minor_vers);
-
     /*
      * At the moment domains must support the same features used by Xen.
      * TODO: Rework the code to allow domain to use a subset of the
@@ -546,12 +542,24 @@ static bool ffa_probe(void)
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
+    major_vers = (vers >> FFA_VERSION_MAJOR_SHIFT)
+                 & FFA_VERSION_MAJOR_MASK;
+    minor_vers = vers & FFA_VERSION_MINOR_MASK;
+    printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
+           major_vers, minor_vers);
+
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
+    printk(XENLOG_INFO "ARM FF-A No firmware support\n");
 
     return false;
 }
-- 
2.39.5 (Apple Git-154)


