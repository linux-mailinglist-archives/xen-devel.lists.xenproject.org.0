Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7CA5B0A29
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 18:32:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402065.644064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVxyV-0001gb-DE; Wed, 07 Sep 2022 16:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402065.644064; Wed, 07 Sep 2022 16:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVxyV-0001dd-AS; Wed, 07 Sep 2022 16:32:27 +0000
Received: by outflank-mailman (input) for mailman id 402065;
 Wed, 07 Sep 2022 16:32:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/dp=ZK=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVxyT-0001dU-28
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 16:32:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a695c816-2eca-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 18:32:23 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 262AC13D5;
 Wed,  7 Sep 2022 09:32:29 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16CBD3F71A;
 Wed,  7 Sep 2022 09:32:21 -0700 (PDT)
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
X-Inumbo-ID: a695c816-2eca-11ed-a016-b9edf5238543
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 6/7] xen/arm: introduce new xen,enhanced property value
Date: Wed,  7 Sep 2022 17:27:37 +0100
Message-Id: <97b7eb518101b403c6e90052aaeeaa50e5ac2c79.1662563170.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662563170.git.rahul.singh@arm.com>
References: <cover.1662563170.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new "xen,enhanced" dom0less property value "no-xenstore" to
disable xenstore interface for dom0less guests.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v5:
 - fix minor comments
 - change unit64_t to uint16_t for dom0less_feature
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
index 98253414b8..47567b3906 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -204,6 +204,10 @@ with the following properties:
     - "disabled"
     Xen PV interfaces are disabled.
 
+    - "no-xenstore"
+    All default Xen PV interfaces, including grant-table will be enabled but
+    xenstore will be disabled for the VM.
+
     If the xen,enhanced property is present with no value, it defaults
     to "enabled". If the xen,enhanced property is not present, PV
     interfaces are disabled.
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 4664a8f961..580ed70b9c 100644
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
index c4dc039b54..f8bb85767b 100644
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
+    /* Enable/Disable PV drivers interfaces */
+    uint16_t dom0less_feature;
 
     /* GIC phandle */
     uint32_t phandle_gic;
-- 
2.25.1


