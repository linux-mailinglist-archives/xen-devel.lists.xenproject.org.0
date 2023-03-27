Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40036CA1EB
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 13:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515175.797875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgkaE-0002aI-F5; Mon, 27 Mar 2023 11:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515175.797875; Mon, 27 Mar 2023 11:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgkaD-0002Vv-UB; Mon, 27 Mar 2023 11:00:13 +0000
Received: by outflank-mailman (input) for mailman id 515175;
 Mon, 27 Mar 2023 11:00:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K09h=7T=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pgkaB-0007YG-8g
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 11:00:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 8abcaa65-cc8e-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 13:00:10 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50FB71424;
 Mon, 27 Mar 2023 04:00:54 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.195.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 409183F663;
 Mon, 27 Mar 2023 04:00:09 -0700 (PDT)
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
X-Inumbo-ID: 8abcaa65-cc8e-11ed-85db-49a42c6b2330
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 11/12] xen/arm: add sve property for dom0less domUs
Date: Mon, 27 Mar 2023 11:59:43 +0100
Message-Id: <20230327105944.1360856-12-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327105944.1360856-1-luca.fancellu@arm.com>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree property in the dom0less domU configuration
to enable the guest to use SVE.

Update documentation.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
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
 docs/misc/arm/device-tree/booting.txt | 9 +++++++++
 xen/arch/arm/domain_build.c           | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 3879340b5e0a..d74bf9ab1c8b 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -193,6 +193,15 @@ with the following properties:
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
+
 - xen,enhanced
 
     A string property. Possible property values are:
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f6019ce30149..45263aea7e95 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3974,6 +3974,13 @@ void __init create_domUs(void)
             d_cfg.max_maptrack_frames = val;
         }
 
+        if ( dt_property_read_u32(node, "sve", &val) )
+        {
+            if ( val > UINT16_MAX )
+                panic("sve property value (%"PRIu32") overflow\n", val);
+            d_cfg.arch.sve_vl = sve_encode_vl(val);
+        }
+
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
-- 
2.34.1


