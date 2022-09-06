Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49C15AEA4F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 15:43:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399886.641274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVYrK-0006Tu-3J; Tue, 06 Sep 2022 13:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399886.641274; Tue, 06 Sep 2022 13:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVYrK-0006R0-0a; Tue, 06 Sep 2022 13:43:22 +0000
Received: by outflank-mailman (input) for mailman id 399886;
 Tue, 06 Sep 2022 13:43:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lcW6=ZJ=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVYrI-0006Qo-3G
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 13:43:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id dd7f1455-2de9-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 15:43:18 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 673D11A32;
 Tue,  6 Sep 2022 06:43:24 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 424C83F7B4;
 Tue,  6 Sep 2022 06:43:17 -0700 (PDT)
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
X-Inumbo-ID: dd7f1455-2de9-11ed-a016-b9edf5238543
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 6/7] xen/arm: introduce new xen,enhanced property value
Date: Tue,  6 Sep 2022 14:40:44 +0100
Message-Id: <667059a3bc6ed9a8b993f64f2b1176a2a131f41e.1662462034.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662462034.git.rahul.singh@arm.com>
References: <cover.1662462034.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new "xen,enhanced" dom0less property value "no-xenstore" to
disable xenstore interface for dom0less guests.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v4:
 - Implement defines for dom0less features
Changes in v3:
 - new patch in this version
---
 docs/misc/arm/device-tree/booting.txt |  4 ++++
 xen/arch/arm/domain_build.c           | 10 ++++++----
 xen/arch/arm/include/asm/kernel.h     | 23 +++++++++++++++++++++--
 3 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 98253414b8..1b0dca1454 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -204,6 +204,10 @@ with the following properties:
     - "disabled"
     Xen PV interfaces are disabled.
 
+    - no-xenstore
+    Xen PV interfaces, including grant-table will be enabled but xenstore
+    will be disabled for the VM.
+
     If the xen,enhanced property is present with no value, it defaults
     to "enabled". If the xen,enhanced property is not present, PV
     interfaces are disabled.
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 707e247f6a..0b164ef595 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2891,7 +2891,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
             goto err;
     }
 
-    if ( kinfo->dom0less_enhanced )
+    if ( kinfo->dom0less_feature & DOM0LESS_ENHANCED_NO_XS )
     {
         ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
         if ( ret )
@@ -3209,10 +3209,12 @@ static int __init construct_domU(struct domain *d,
          (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
     {
         if ( hardware_domain )
-            kinfo.dom0less_enhanced = true;
+            kinfo.dom0less_feature = DOM0LESS_ENHANCED;
         else
-            panic("Tried to use xen,enhanced without dom0\n");
+            panic("At the moment, Xenstore support requires dom0 to be present\n");
     }
+    else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
+        kinfo.dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
 
     if ( vcpu_create(d, 0) == NULL )
         return -ENOMEM;
@@ -3252,7 +3254,7 @@ static int __init construct_domU(struct domain *d,
     if ( rc < 0 )
         return rc;
 
-    if ( kinfo.dom0less_enhanced )
+    if ( kinfo.dom0less_feature & DOM0LESS_XENSTORE )
     {
         ASSERT(hardware_domain);
         rc = alloc_xenstore_evtchn(d);
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index c4dc039b54..ad240494ea 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -9,6 +9,25 @@
 #include <xen/device_tree.h>
 #include <asm/setup.h>
 
+/*
+ * List of possible features for dom0less domUs
+ *
+ * DOM0LESS_ENHANCED_NO_XS: Notify the OS it is running on top of Xen. All the
+ *                          default features (excluding Xenstore) will be
+ *                          available. Note that an OS *must* not rely on the
+ *                          availability of Xen features if this is not set.
+ * DOM0LESS_XENSTORE:       Xenstore will be enabled for the VM. This feature
+ *                          can't be enabled without the
+ *                          DOM0LESS_ENHANCED_NO_XS.
+ * DOM0LESS_ENHANCED:       Notify the OS it is running on top of Xen. All the
+ *                          default features (including Xenstore) will be
+ *                          available. Note that an OS *must* not rely on the
+ *                          availability of Xen features if this is not set.
+ */
+#define DOM0LESS_ENHANCED_NO_XS  BIT(0, U)
+#define DOM0LESS_XENSTORE        BIT(1, U)
+#define DOM0LESS_ENHANCED        (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XENSTORE)
+
 struct kernel_info {
 #ifdef CONFIG_ARM_64
     enum domain_type type;
@@ -36,8 +55,8 @@ struct kernel_info {
     /* Enable pl011 emulation */
     bool vpl011;
 
-    /* Enable PV drivers */
-    bool dom0less_enhanced;
+    /* Enable/Disable PV drivers interface,grant table, evtchn or xenstore */
+    uint32_t dom0less_feature;
 
     /* GIC phandle */
     uint32_t phandle_gic;
-- 
2.25.1


