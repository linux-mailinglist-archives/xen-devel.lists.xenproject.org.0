Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4054870D580
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 09:44:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538278.838220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1MgV-0006Z1-Au; Tue, 23 May 2023 07:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538278.838220; Tue, 23 May 2023 07:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1MgV-0006SV-5P; Tue, 23 May 2023 07:43:55 +0000
Received: by outflank-mailman (input) for mailman id 538278;
 Tue, 23 May 2023 07:43:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqVG=BM=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1q1MgS-0003Zx-W2
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 07:43:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 8f3e398e-f93d-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 09:43:51 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0552153B;
 Tue, 23 May 2023 00:44:35 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9ADB3F762;
 Tue, 23 May 2023 00:43:49 -0700 (PDT)
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
X-Inumbo-ID: 8f3e398e-f93d-11ed-8611-37d641c3527e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 11/12] xen/arm: add sve property for dom0less domUs
Date: Tue, 23 May 2023 08:43:25 +0100
Message-Id: <20230523074326.3035745-12-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230523074326.3035745-1-luca.fancellu@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree property in the dom0less domU configuration
to enable the guest to use SVE.

Update documentation.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v6:
 - Use ifdef in create_domUs and fail if 'sve' is used on systems
   with CONFIG_ARM64_SVE not selected (Bertrand, Julien, Jan)
Changes from v5:
 - Stop the domain creation if SVE not supported or SVE VL
   errors (Julien, Bertrand)
 - now sve_sanitize_vl_param is renamed to sve_domctl_vl_param
   and returns a boolean, change the affected code.
 - Reworded documentation.
Changes from v4:
 - Now it is possible to specify the property "sve" for dom0less
   device tree node without any value, that means the platform
   supported VL will be used.
Changes from v3:
 - Now domainconfig_encode_vl is named sve_encode_vl
Changes from v2:
 - xen_domctl_createdomain field name has changed into sve_vl
   and its value is the VL/128, use domainconfig_encode_vl
   to encode a plain VL in bits.
Changes from v1:
 - No changes
Changes from RFC:
 - Changed documentation
---
 docs/misc/arm/device-tree/booting.txt | 16 +++++++++++++++
 xen/arch/arm/domain_build.c           | 28 +++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 3879340b5e0a..32a0e508c471 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -193,6 +193,22 @@ with the following properties:
     Optional. Handle to a xen,cpupool device tree node that identifies the
     cpupool where the guest will be started at boot.
 
+- sve
+
+    Optional. The `sve` property enables Arm SVE usage for the domain and sets
+    the maximum SVE vector length, the option is applicable only to AArch64
+    guests.
+    A value equal to 0 disables the feature, this is the default value.
+    Specifying this property with no value, means that the SVE vector length
+    will be set equal to the maximum vector length supported by the platform.
+    Values above 0 explicitly set the maximum SVE vector length for the domain,
+    allowed values are from 128 to maximum 2048, being multiple of 128.
+    Please note that when the user explicitly specifies the value, if that value
+    is above the hardware supported maximum SVE vector length, the domain
+    creation will fail and the system will stop, the same will occur if the
+    option is provided with a non zero value, but the platform doesn't support
+    SVE.
+
 - xen,enhanced
 
     A string property. Possible property values are:
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9202a96d9c28..ba4fe9e165ee 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -4008,6 +4008,34 @@ void __init create_domUs(void)
             d_cfg.max_maptrack_frames = val;
         }
 
+        if ( dt_get_property(node, "sve", &val) )
+        {
+#ifdef CONFIG_ARM64_SVE
+            unsigned int sve_vl_bits;
+            bool ret = false;
+
+            if ( !val )
+            {
+                /* Property found with no value, means max HW VL supported */
+                ret = sve_domctl_vl_param(-1, &sve_vl_bits);
+            }
+            else
+            {
+                if ( dt_property_read_u32(node, "sve", &val) )
+                    ret = sve_domctl_vl_param(val, &sve_vl_bits);
+                else
+                    panic("Error reading 'sve' property");
+            }
+
+            if ( ret )
+                d_cfg.arch.sve_vl = sve_encode_vl(sve_vl_bits);
+            else
+                panic("SVE vector length error\n");
+#else
+            panic("'sve' property found, but CONFIG_ARM64_SVE not selected");
+#endif
+        }
+
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
-- 
2.34.1


