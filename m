Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DF05A92FC
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 11:19:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396386.636519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTgLk-0007SK-Vd; Thu, 01 Sep 2022 09:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396386.636519; Thu, 01 Sep 2022 09:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTgLk-0007Pq-RK; Thu, 01 Sep 2022 09:19:00 +0000
Received: by outflank-mailman (input) for mailman id 396386;
 Thu, 01 Sep 2022 09:19:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GjJJ=ZE=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oTgJ1-000527-8K
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 09:16:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id b7533f13-29d6-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 11:16:09 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08D65D6E;
 Thu,  1 Sep 2022 02:16:16 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F099D3F766;
 Thu,  1 Sep 2022 02:16:08 -0700 (PDT)
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
X-Inumbo-ID: b7533f13-29d6-11ed-82f2-63bd783d45fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property value
Date: Thu,  1 Sep 2022 10:13:06 +0100
Message-Id: <d8dae49b05e6c59715016e0995b1275f3cb6e7fc.1662023183.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662023183.git.rahul.singh@arm.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new "xen,enhanced" dom0less property value "no-xenstore" to
disable xenstore interface for dom0less guests.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v3:
 - new patch in this version
---
 docs/misc/arm/device-tree/booting.txt |  4 ++++
 xen/arch/arm/domain_build.c           | 10 +++++++---
 xen/arch/arm/include/asm/kernel.h     |  3 +++
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index edef98e6d1..87f57f8889 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -204,6 +204,10 @@ with the following properties:
     - "disabled"
     Xen PV interfaces are disabled.
 
+    - no-xenstore
+    Xen PV interfaces, including grant-table will be enabled for the VM but
+    xenstore will be disabled for the VM.
+
     If the xen,enhanced property is present with no value, it defaults
     to "enabled". If the xen,enhanced property is not present, PV
     interfaces are disabled.
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 4b24261825..8dd9984225 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3336,10 +3336,14 @@ static int __init construct_domU(struct domain *d,
          (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
     {
         if ( hardware_domain )
-            kinfo.dom0less_enhanced = true;
+            kinfo.dom0less_xenstore = true;
         else
-            panic("Tried to use xen,enhanced without dom0\n");
+            panic("Tried to use xen,enhanced without dom0 without no-xenstore\n");
     }
+    else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
+        kinfo.dom0less_xenstore = false;
+
+    kinfo.dom0less_enhanced = true;
 
     if ( vcpu_create(d, 0) == NULL )
         return -ENOMEM;
@@ -3379,7 +3383,7 @@ static int __init construct_domU(struct domain *d,
     if ( rc < 0 )
         return rc;
 
-    if ( kinfo.dom0less_enhanced )
+    if ( kinfo.dom0less_xenstore )
     {
         ASSERT(hardware_domain);
         rc = alloc_xenstore_evtchn(d);
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index c4dc039b54..3d7fa94910 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -39,6 +39,9 @@ struct kernel_info {
     /* Enable PV drivers */
     bool dom0less_enhanced;
 
+    /* Enable Xenstore */
+    bool dom0less_xenstore;
+
     /* GIC phandle */
     uint32_t phandle_gic;
 
-- 
2.25.1


