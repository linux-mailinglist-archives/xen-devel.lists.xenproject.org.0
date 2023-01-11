Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E17665E39
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 15:45:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475503.737247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFcLw-0005VI-4U; Wed, 11 Jan 2023 14:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475503.737247; Wed, 11 Jan 2023 14:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFcLv-0005Ra-V5; Wed, 11 Jan 2023 14:45:19 +0000
Received: by outflank-mailman (input) for mailman id 475503;
 Wed, 11 Jan 2023 14:45:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1gQc=5I=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pFcFd-0000FC-FX
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 14:38:49 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a8afd8c2-91bd-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 15:38:48 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 299D6FEC;
 Wed, 11 Jan 2023 06:39:30 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3849D3F71A;
 Wed, 11 Jan 2023 06:38:47 -0800 (PST)
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
X-Inumbo-ID: a8afd8c2-91bd-11ed-91b6-6bf2151ebd3b
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 8/8] xen/arm: add sve property for dom0less domUs
Date: Wed, 11 Jan 2023 14:38:26 +0000
Message-Id: <20230111143826.3224-9-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230111143826.3224-1-luca.fancellu@arm.com>
References: <20230111143826.3224-1-luca.fancellu@arm.com>

Add a device tree property in the dom0less domU configuration
to enable the guest to use SVE.

Update documentation.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/misc/arm/device-tree/booting.txt | 7 +++++++
 xen/arch/arm/domain_build.c           | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 3879340b5e0a..3d1ce652317e 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -193,6 +193,13 @@ with the following properties:
     Optional. Handle to a xen,cpupool device tree node that identifies the
     cpupool where the guest will be started at boot.
 
+- sve
+
+    Optional. A number that, when above 0, enables SVE for this guest and sets
+    its maximum SVE vector length. The default value is 0, that means this
+    guest is not allowed to use SVE, the maximum value allowed is 2048, any
+    other value must be multiple of 128.
+
 - xen,enhanced
 
     A string property. Possible property values are:
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 48c3fdc28063..05b2bfc9195f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3959,6 +3959,13 @@ void __init create_domUs(void)
             d_cfg.max_maptrack_frames = val;
         }
 
+        if ( dt_property_read_u32(node, "sve", &val) )
+        {
+            if ( val > UINT16_MAX )
+                panic("sve property value (%"PRIu32") overflow\n", val);
+            d_cfg.arch.sve_vl_bits = val;
+        }
+
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
-- 
2.17.1


