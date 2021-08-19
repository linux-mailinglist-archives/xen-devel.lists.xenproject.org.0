Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF373F18C7
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 14:08:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168667.307940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgqE-0008Gf-1F; Thu, 19 Aug 2021 12:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168667.307940; Thu, 19 Aug 2021 12:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgqD-0008DJ-UG; Thu, 19 Aug 2021 12:08:13 +0000
Received: by outflank-mailman (input) for mailman id 168667;
 Thu, 19 Aug 2021 12:08:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HKsV=NK=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1mGgqC-00080Z-Vu
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:08:13 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6f1d4a33-0e66-43fc-8496-4977d88b3586;
 Thu, 19 Aug 2021 12:08:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C101031B;
 Thu, 19 Aug 2021 05:08:09 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9FA93F70D;
 Thu, 19 Aug 2021 05:08:08 -0700 (PDT)
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
X-Inumbo-ID: 6f1d4a33-0e66-43fc-8496-4977d88b3586
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 10/14] xen/arm: Discovering PCI devices and add the PCI devices in XEN.
Date: Thu, 19 Aug 2021 13:02:50 +0100
Message-Id: <a7fa6f626b0852c7859fe8d64b01293d1aa8fc0e.1629366665.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1629366665.git.rahul.singh@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
In-Reply-To: <cover.1629366665.git.rahul.singh@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>

Hardware domain is in charge of doing the PCI enumeration and will
discover the PCI devices and then will communicate to XEN via hyper
call PHYSDEVOP_pci_device_add to add the PCI devices in XEN.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/physdev.c | 39 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/physdev.c b/xen/arch/arm/physdev.c
index e91355fe22..ccce8f0eba 100644
--- a/xen/arch/arm/physdev.c
+++ b/xen/arch/arm/physdev.c
@@ -9,12 +9,45 @@
 #include <xen/errno.h>
 #include <xen/sched.h>
 #include <asm/hypercall.h>
-
+#include <xen/guest_access.h>
+#include <xsm/xsm.h>
 
 int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
-    gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=%d: not implemented\n", cmd);
-    return -ENOSYS;
+    int ret = 0;
+
+    switch ( cmd )
+    {
+#ifdef CONFIG_HAS_PCI
+    case PHYSDEVOP_pci_device_add: {
+        struct physdev_pci_device_add add;
+        struct pci_dev_info pdev_info;
+        nodeid_t node = NUMA_NO_NODE;
+
+        ret = -EFAULT;
+        if ( copy_from_guest(&add, arg, 1) != 0 )
+            break;
+
+        pdev_info.is_extfn = !!(add.flags & XEN_PCI_DEV_EXTFN);
+        if ( add.flags & XEN_PCI_DEV_VIRTFN )
+        {
+            pdev_info.is_virtfn = 1;
+            pdev_info.physfn.bus = add.physfn.bus;
+            pdev_info.physfn.devfn = add.physfn.devfn;
+        }
+        else
+            pdev_info.is_virtfn = 0;
+
+        ret = pci_add_device(add.seg, add.bus, add.devfn, &pdev_info, node);
+        break;
+    }
+#endif
+    default:
+        gdprintk(XENLOG_DEBUG, "PHYSDEVOP cmd=%d: not implemented\n", cmd);
+        ret = -ENOSYS;
+    }
+
+    return ret;
 }
 
 /*
-- 
2.17.1


