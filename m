Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C53BB6DF100
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 11:50:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520100.807438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmX7A-0007ye-9L; Wed, 12 Apr 2023 09:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520100.807438; Wed, 12 Apr 2023 09:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmX7A-0007sX-07; Wed, 12 Apr 2023 09:50:08 +0000
Received: by outflank-mailman (input) for mailman id 520100;
 Wed, 12 Apr 2023 09:50:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eFOG=AD=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pmX77-0004lU-OR
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 09:50:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 66aff3eb-d917-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 11:50:05 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 202D6168F;
 Wed, 12 Apr 2023 02:50:49 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7E793F587;
 Wed, 12 Apr 2023 02:50:03 -0700 (PDT)
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
X-Inumbo-ID: 66aff3eb-d917-11ed-b21e-6b7b168915f2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 11/12] xen/arm: add sve property for dom0less domUs
Date: Wed, 12 Apr 2023 10:49:37 +0100
Message-Id: <20230412094938.2693890-12-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412094938.2693890-1-luca.fancellu@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree property in the dom0less domU configuration
to enable the guest to use SVE.

Update documentation.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
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
 docs/misc/arm/device-tree/booting.txt | 11 +++++++++++
 xen/arch/arm/domain_build.c           | 24 ++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 3879340b5e0a..f9d2ecdda48a 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -193,6 +193,17 @@ with the following properties:
     Optional. Handle to a xen,cpupool device tree node that identifies the
     cpupool where the guest will be started at boot.
 
+- sve
+
+    Optional. A number that, when above 0, enables SVE for this guest and sets
+    its maximum SVE vector length. The default value is 0, that means this
+    guest is not allowed to use SVE, the maximum value allowed is 2048, any
+    other value must be multiple of 128.
+    Please note that if the platform supports a lower value of bits, then the
+    domain creation will fail.
+    Specifying this property with no value, means that the SVE vector length
+    will be set equal to the maximum vector length supported by the platform.
+
 - xen,enhanced
 
     A string property. Possible property values are:
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3f30ef5c37b6..c1f0d1d78431 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -4004,6 +4004,30 @@ void __init create_domUs(void)
             d_cfg.max_maptrack_frames = val;
         }
 
+        if ( dt_get_property(node, "sve", &val) )
+        {
+            unsigned int sve_vl_bits;
+
+            if ( !val )
+            {
+                /* Property found with no value, means max HW VL supported */
+                rc = sve_sanitize_vl_param(-1, &sve_vl_bits);
+            }
+            else
+            {
+                if ( dt_property_read_u32(node, "sve", &val) )
+                    rc = sve_sanitize_vl_param(val, &sve_vl_bits);
+                else
+                    panic("Error reading 'sve' property");
+            }
+
+            if ( !rc )
+                d_cfg.arch.sve_vl = sve_encode_vl(sve_vl_bits);
+            else
+                printk(XENLOG_WARNING
+                       "SVE vector length error, disable feature for Dom0less DomU\n");
+        }
+
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
-- 
2.34.1


